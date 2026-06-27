
class Plot {
  Equation eq;
  Relation rel;
  color plotColor;
  
  Plot(Equation _eq) {
    eq = _eq;
    rel = Relation.EQ;
    plotColor = color(255, 0, 0, 191);
  }
  
  Plot(Equation _eq, Relation _rel) {
    eq = _eq;
    rel = _rel;
    plotColor = color(255, 0, 0, 191);
  }
  
  Plot(Equation _eq, color _plotColor) {
    eq = _eq;
    rel = Relation.EQ;
    plotColor = _plotColor;
  }
  
  Plot(Equation _eq, Relation _rel, color _plotColor) {
    eq = _eq;
    rel = _rel;
    plotColor = _plotColor;
  }
  
  boolean plot(float x, float y, float threshold) {
    float value = eq.apply(x, y);
    
    switch(rel) {
      case EQ:
      case EQUAL: return abs(value) < threshold;
      case LS:
      case LESS: return value < threshold;
      case GR:
      case GREATER: return value > threshold;
      case LEQ:
      case LESS_EQUAL: return value <= threshold;
      case GEQ:
      case GREATER_EQUAL: return value >= threshold;
      case NEQ:
      case NOT_EQUAL: return abs(value) >= threshold;
      default: return false;
    }
  }
}
