from flask import session, redirect, url_for, flash
from functools import wraps
from argon2 import PasswordHasher
from argon2.exceptions import VerifyMismatchError



# -------------------------------
# HASH DE SENHA
# -------------------------------

ph = PasswordHasher()

def hash_password(password):
    return ph.hash(password)

def verify_password(hash, password):
    try:
        return ph.verify(hash, password)
    except VerifyMismatchError:
        return False
    except Exception:
        return False
    
# ----------------------------------------
# CONTROLE DE ACESSO LOGIN OBRIGATÓRIO
# ----------------------------------------
def login_required(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        if "user" not in session:
            flash("Faça login para continuar", "warning")
            return redirect(url_for("login"))
        return f(*args, **kwargs)
    return decorated


# -------------------------------
# SOMENTE ADMIN
# -------------------------------
def admin_required(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        if session.get("role") != "admin":
            flash("Acesso restrito a administradores", "danger")
            return redirect(url_for("usuarios"))
        return f(*args, **kwargs)
    return decorated

# -------------------------------
# SOMENTE USUÁRIO
# -------------------------------

def user_required(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        if session.get("role") != "user":
            flash("Acesso restrito a usuários", "danger")
            return redirect(url_for("admin")) 
        return f(*args, **kwargs)
    return decorated