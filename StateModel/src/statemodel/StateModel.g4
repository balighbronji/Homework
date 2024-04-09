grammar StateModel;

model
    :   states transitions
    ;

states
    :  STATES LCURLY state* RCURLY
    ;
state
    :   (initialState | normalState) LCURLY (label (COMMA label)*)? RCURLY ERROR?
    ;
initialState: INITIAL normalState;
normalState: UPPERCASE;
label: LOWERCASE;

transitions
    :   TRANSITIONS LCURLY pattern (pattern | transition)* RCURLY
    ;
pattern
    : TRANS transitionType transitionName
    ;
transition
    :   transitionName ASSIGN (initialState | normalState) NEXT normalState
    ;
transitionType: NORMAL | ERROR;
transitionName: LOWERCASE;

STATES: 'states';
INITIAL: 'initial';

TRANSITIONS: 'transitions';
TRANS: 'trans';
ERROR: 'error';
NORMAL: 'normal';

LCURLY: '{';
RCURLY: '}';
ASSIGN: ':';
NEXT: '->';
COMMA: ',';
UPPERCASE: [A-Z][A-Z0-9]*;
LOWERCASE: [a-z][a-z0-9]*;
WS: (' ' | '\t' | '\r' | '\n') -> skip;
COMMENT: '//' ~[\r\n]* -> skip;
