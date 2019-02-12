import automaton

###############################################################################
# Exemple 1
###############################################################################
aut1 = automaton.automaton(
    epsilons = ['0'],
    states = [5], initials = [0,1], finals = [3,4],
    transitions=[
        (0,'a',1), (1,'b',2), (2,'b',2), (2,'0',3), (3,'a',4)
    ]
)
aut1.display()

###############################################################################
# Exemple 2
###############################################################################
def automate():
    alphabet = [ 'a', 'b', 'c', 'd' ]
    epsilons = []
    initiaux = [ (0,0) ]
    etats = []
    finaux = []
    transitions = []
    for a_moins_b in [0,1,-1]:
        for c_moins_d in [0, 1, -1]:
            etats.append( (a_moins_b, c_moins_d) )
            finaux.append( (a_moins_b, c_moins_d) )
    for origine in etats:
        for lettre in alphabet:
            if lettre == 'a' :
                fin = ( origine[0]+1, origine[1] )
            elif lettre == 'b' :
                fin = ( origine[0]-1, origine[1] )
            elif lettre == 'c' :
                fin = ( origine[0], origine[1]+1 )
            else:
                fin = ( origine[0], origine[1]-1 )
            if abs(fin[0]) <= 1 and abs(fin[1]) <= 1 :
                transitions.append( (origine,lettre,fin) )
    return automaton.automaton(
        alphabet, epsilons, etats, initiaux, finaux, transitions
    )
B = automate( )
B.display()


###############################################################################
# Exemple 3
###############################################################################
def automate_des_mots_contenant_l_alphabet( alphabet ):
    initiaux = [ automaton.pretty_set() ]
    epsilons = []
    finaux =  [ automaton.pretty_set(alphabet) ]
    etats = set( automaton.pretty_set() )
    pile = [ automaton.pretty_set() ]
    transitions = []
    while len( pile ) > 0:
        origine = pile.pop()
        for lettre in alphabet:
            fin = origine.union( [lettre] )
            if not( fin in etats ):
                etats.add( fin )
                pile.append( fin )
            transitions.append( (origine, lettre, fin) )
    return automaton.automaton(
        alphabet, epsilons, etats, initiaux, finaux, transitions
    )
A = automate_des_mots_contenant_l_alphabet( ['a','b','c'] )
A.display()

