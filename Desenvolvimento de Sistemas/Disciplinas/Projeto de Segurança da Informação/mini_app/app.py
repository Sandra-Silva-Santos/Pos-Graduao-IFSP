from flask import Flask, render_template, request, redirect, session, flash, url_for
import sqlite3
from security import *
from flask_wtf import CSRFProtect
from datetime import timedelta

app = Flask(__name__)
app.secret_key = "segredo_super_seguro"

# -------------------------------
# CONFIGURAÇÕES DE SEGURANÇA
# -------------------------------
app.config.update(
    SESSION_COOKIE_HTTPONLY=True,
    SESSION_COOKIE_SAMESITE="Lax",
    SESSION_COOKIE_SECURE=True
)

# -------------------------------
# SESSAO EXPIRA EM 10 MINUTOS
# -------------------------------
app.permanent_session_lifetime = timedelta(minutes=10)

# CSRF
csrf = CSRFProtect(app)

# -------------------------------
# BANCO DE DADOS
# -------------------------------
def get_db():
    return sqlite3.connect("database.db")


def init_db():
    db = get_db()
    cursor = db.cursor()

    cursor.execute("""
    CREATE TABLE IF NOT EXISTS users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT UNIQUE,
        password TEXT,
        role TEXT
    )
    """)

# -------------------------------
# CRIAR USUÁRIO ADMIN PADRÃO
# -------------------------------

    cursor.execute("SELECT * FROM users WHERE username=?", ("admin",))
    if not cursor.fetchone():
        cursor.execute(
            "INSERT INTO users(username,password,role) VALUES (?,?,?)",
            ("admin", hash_password("admin123"), "admin")
        )

    db.commit()
    db.close()


# -------------------------------
# HOME
# -------------------------------
@app.route("/")
def home():
    return redirect(url_for("login"))


# -------------------------------
# LOGIN
# -------------------------------
@app.route("/login", methods=["GET", "POST"])
def login():
    try:
        if request.method == "POST":
            username = request.form["username"]
            password = request.form["password"]

            db = get_db()
            cursor = db.cursor()

            cursor.execute(
                "SELECT username,password,role FROM users WHERE username=?",
                (username,)
            )

            user = cursor.fetchone()
            db.close()

            if user and verify_password(user[1], password):
                session.clear()
                session["user"] = user[0]
                session["role"] = user[2]
                session.permanent = True

                flash("Login realizado com sucesso!", "success")

                if user[2] == "admin":
                    return redirect(url_for("admin"))
                else:
                    return redirect(url_for("usuarios"))

            else:
                flash("Usuário ou senha inválidos", "danger")

        return render_template("login.html")

    except Exception as e:
        print("Erro login:", e)
        flash("Erro interno no login", "danger")
        return redirect(url_for("login"))


# -------------------------------
# CADASTRO (ADMIN)
# -------------------------------
@app.route("/cadastro", methods=["GET", "POST"])
@login_required
@admin_required
def cadastro():
    try:
        if request.method == "POST":
            username = request.form["username"]
            password = request.form["password"]
            role = request.form["role"]

            hashed = hash_password(password)

            db = get_db()
            cursor = db.cursor()

            cursor.execute(
                "INSERT INTO users(username,password,role) VALUES (?,?,?)",
                (username, hashed, role)
            )

            db.commit()
            db.close()

            flash("Usuário cadastrado com sucesso!", "success")

            return redirect(url_for("admin"))

        return render_template("cadastro.html")

    except sqlite3.IntegrityError:
        flash("Usuário já existe!", "warning")
        return redirect(url_for("cadastro"))

    except Exception as e:
        print("Erro cadastro:", e)
        flash("Erro ao cadastrar usuário", "danger")
        return redirect(url_for("admin"))


# -------------------------------
# ADMIN
# -------------------------------
@app.route("/administradores")
@login_required
@admin_required
def admin():
    return render_template("admin.html")

# -------------------------------
# USUÁRIO
# -------------------------------
@app.route("/usuarios")
@login_required
@user_required
def usuarios():
    return render_template("usuario.html")

# -------------------------------
# LOGOUT
# -------------------------------
@app.route("/logout")
def logout():
    session.clear()
    flash("Logout realizado com sucesso", "info")
    return redirect(url_for("login"))


# -------------------------------
# ERROS
# -------------------------------
@app.errorhandler(403)
def acesso_negado(e):
    flash("Acesso negado!", "danger")
    return redirect(url_for("login"))


@app.errorhandler(404)
def pagina_nao_encontrada(e):
    return "Página não encontrada", 404


@app.errorhandler(500)
def erro_interno(e):
    return "Erro interno do servidor", 500


# -------------------------------
# START
# -------------------------------
if __name__ == "__main__":
    init_db()
    app.run(debug=True, ssl_context='adhoc')