
enum Relation {
  EQUAL, EQ,
  LESS, LS,
  GREATER, GR,
  LESS_EQUAL, LEQ,
  GREATER_EQUAL, GEQ,
  NOT_EQUAL, NEQ
}

class Equation {
  Expr expr1, expr2;
  Relation rel;
  
  Equation(Expr _expr1) {
    expr1 = _expr1;
    rel = Relation.EQ;
    expr2 = new YVarExpr();
  }
  
  Equation(Expr _expr1, Expr _expr2) {
    expr1 = _expr1;
    rel = Relation.EQ;
    expr2 = _expr2;
  }
  
  Equation(Expr _expr1, Relation _rel) {
    expr1 = _expr1;
    rel = _rel;
    expr2 = new YVarExpr();
  }
  
  Equation(Expr _expr1, Relation _rel, Expr _expr2) {
    expr1 = _expr1;
    rel = _rel;
    expr2 = _expr2;
  }
}
