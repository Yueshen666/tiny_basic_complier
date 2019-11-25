/*
 The AST data structures used in basic language processing
*/

#ifndef TINY_BASIC_H
#define TINY_BASIC_H


typedef enum { 
    typeInt, typeDec, typeVar, typeOpr
} nodeEnum;


typedef enum {
    intVal, floatVal
} valType; 


typedef struct {
    int init;
    valType valT;
} symTable;


typedef struct {
    int value;
} intNodeType;


typedef struct {
    float value;
} decNodeType;


typedef struct {
    char c;
} varNodeType;


typedef struct {
    int oper;
    int nops;
    struct nodeTypeTag *op[1];
} oprNodeType;

/* wrapper. */
typedef struct nodeTypeTag {
    nodeEnum type;             /* Node type. */
    valType valT;              /* Value type. */

    union {
        intNodeType integer;   /* Integer constant node. */
        decNodeType decimal;   /* Decimal constant node. */
        varNodeType variable;  /* Varaible node. */
        oprNodeType opr;       /* Operator node. */
    };
} nodeType;


extern symTable symb[26];

#endif
