open ops

-- Reflexivity

pred reflexive(V: set univ, R: V->V) {
  all x:V | x->x in R
}

pred irreflexive(V: set univ, R: V->V) {
  all x:V | x->x not in R
}


-- Connexity

pred semi_connex(V: set univ, R: V->V) {
  all x,y:V {
    { x != y
    } implies {
      x->y in R or y->x in R
    }
  }
}

pred connex(V: set univ, R: V->V) {
  all x,y: V {
    x->y not in R
    implies
    y->x in R
  }
}


-- Symmetry Properties

pred symmetric(V: set univ, R: V->V) {
  all x,y:V {
    x->y in R
    implies
    y->x in R
  }
}

pred asymmetric(V: set univ, R: V->V) {
  all x,y:V {
    x->y in R
		implies
    y->x not in R
  }
}

pred antisymmetric(V: set univ, R: V->V) {
  all x,y:V {
    x != y
    implies {
      x->y not in R or y->x not in R
    }
  }
}

fun AsymPt(V: set univ, R: V->V) : V->V {
  R & dual[V,V,R]
}

fun SymPt(V: set univ, R: V->V) : V->V {
  R & ~R
}

pred tournament(V: set univ, R: V->V) {
  asymmetric[V,R]
  semi_connex[V,R]
}


-- Transitivity

pred transitive(V: set univ, R: V->V) {
  all x,y,z:V {
    { x->y in R
      y->z in R
    } implies {
      x->z in R
    }
  }
}


-- Preorder

pred preorder(V: set univ, R: V->V) {
  reflexive[V,R]
  transitive[V,R]
}


-- Order and Strict Order

pred order(V: set univ, E: V->V) {
  transitive[V,E]
  antisymmetric[V,E]
  reflexive[V,E]
}

pred strict_order(V: set univ, C: V->V) {
  transitive[V,C]
  asymmetric[V,C]
}

fun StrictOrder(V: set univ, E: V->V) : V->V {
  di[V] & E
}

fun Order(V: set univ, C: V->V) : V->V {
  id[V] + C
}

fun Hasse(V: set univ, E: V->V) : V->V {
  let C = StrictOrder[V,E] {
    C & co[V,V,C.C]
  }
}
