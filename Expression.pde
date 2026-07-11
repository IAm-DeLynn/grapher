
interface Expr {
  float apply(float x, float y);
}

class AddExpr implements Expr {
  Expr expr1, expr2;
  
  AddExpr(Expr _expr1, Expr _expr2) {
    expr1 = _expr1;
    expr2 = _expr2;
  }
  
  float apply(float x, float y) {
    return expr1.apply(x, y) + expr2.apply(x, y);
  }
}

class SubExpr implements Expr {
  Expr expr1, expr2;
  
  SubExpr(Expr _expr1, Expr _expr2) {
    expr1 = _expr1;
    expr2 = _expr2;
  }
  
  float apply(float x, float y) {
    return expr1.apply(x, y) - expr2.apply(x, y);
  }
}

class MultExpr implements Expr {
  Expr expr1, expr2;
  
  MultExpr(Expr _expr1, Expr _expr2) {
    expr1 = _expr1;
    expr2 = _expr2;
  }
  
  float apply(float x, float y) {
    return expr1.apply(x, y) * expr2.apply(x, y);
  }
}

class DivExpr implements Expr {
  Expr expr1, expr2;
  
  DivExpr(Expr _expr1, Expr _expr2) {
    expr1 = _expr1;
    expr2 = _expr2;
  }
  
  float apply(float x, float y) {
    return expr1.apply(x, y) / expr2.apply(x, y);
  }
}

class SqrtExpr implements Expr {
  Expr expr;
  
  SqrtExpr(Expr _expr) {
    expr = _expr;
  }
  
  float apply(float x, float y) {
    return sqrt(expr.apply(x, y));
  }
}

class PowExpr implements Expr {
  Expr expr1, expr2;
  
  PowExpr(Expr _expr1, Expr _expr2) {
    expr1 = _expr1;
    expr2 = _expr2;
  }
  
  float apply(float x, float y) {
    return pow(expr1.apply(x, y), expr2.apply(x, y));
  }
}

class LnExpr implements Expr {
  Expr expr;
  
  LnExpr(Expr _expr) {
    expr = _expr;
  }
  
  float apply(float x, float y) {
    return log(expr.apply(x, y));
  }
}

class ConstExpr implements Expr {
  float value;
  
  ConstExpr(float _value) {
    value = _value;
  }
  
  float apply(float x, float y) {
    return value;
  }
}

class XVarExpr implements Expr {
  XVarExpr() {}
  
  float apply(float x, float y) {
    return x;
  }
}

class YVarExpr implements Expr {
  YVarExpr() {}
  
  float apply(float x, float y) {
    return y;
  }
}
