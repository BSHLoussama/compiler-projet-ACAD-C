%{
#include<stdio.h>
#include<string.h>
#include"Color.h"
#include"syntaxique.tab.h"
//#include"ts.h"
extern Line;
extern Col;
extern YYSTYPE yylval;

%}

NBR [+-]?[0-9]+(\.[0-9]+)?
IDF [A-Za-z][A-Za-z0-9]*  
INT [+-]?[0-9]+
COMMENT ^%.* 
STRING_LITERAL \"(\\.|[^\"])*\"
%%  

".EQ." {
    /* lookup(yytext, "mot cle", 1); */
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    return mc_EQ;
}

".NE." {
    /* lookup(yytext, "mot cle", 1); */
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    return mc_NE;
}

".LE." {
    /* lookup(yytext, "mot cle", 1); */
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    return mc_LE;
}

".LT." {
    /* lookup(yytext, "mot cle", 1); */
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    return mc_LT;
}

".GE." {
    /* lookup(yytext, "mot cle", 1); */
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    return mc_GE;
}

".GT." {
    /* lookup(yytext, "mot cle", 1); */
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    return mc_GT;
}

".AND." {
    /* lookup(yytext, "mot cle", 1); */
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    return mc_AND;
}

".OR." {
    /* lookup(yytext, "mot cle", 1); */
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    return mc_OR;
}

"FALSE" {
    /* lookup(yytext, "mot cle", 1); */
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    return mc_FALSE;
}

"TRUE" {
    /* lookup(yytext, "mot cle", 1); */
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    return mc_TRUE;
}

"CHARACTER" {
    /* lookup(yytext, "mot cle", 1); */
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    return mc_CHARACTER;
}

"INTEGER" {
    /* lookup(yytext, "mot cle", 1); */
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    return mc_INTEGER;
}

"LOGICAL" {
    /* lookup(yytext, "mot cle", 1); */
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    return mc_LOGICAL;
}

"REAL" {
    /* lookup(yytext, "mot cle", 1); */
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    return mc_REAL;
}

"DIMENSION" {
    /* lookup(yytext, "mot cle", 1); */
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    return mc_DIMENSION;
}

"DOWHILE" {
    /* lookup(yytext, "mot cle", 1); */
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    return mc_DOWHILE;
}

"ENDDO" {
    /* lookup(yytext, "mot cle", 1); */
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    return mc_ENDDO;
}

"IF" {
    /* lookup(yytext, "mot cle", 1); */
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    return mc_IF;
}

"THEN" {
    /* lookup(yytext, "mot cle", 1); */
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    return mc_THEN;
}

"ELSE" {
    /* lookup(yytext, "mot cle", 1); */
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    return mc_ELSE;
}

"ENDIF" {
    /* lookup(yytext, "mot cle", 1); */
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    return mc_ENDIF;
}

"ROUTINE" {
    /* lookup(yytext, "mot cle", 1); */
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    return mc_ROUTINE;
}

"CALL" {
    /* lookup(yytext, "mot cle", 1); */
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    return mc_CALL;
}

"ENDR" {
    /* lookup(yytext, "mot cle", 1); */
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    return mc_ENDR;
}

"PROGRAM" {
    /* lookup(yytext, "mot cle", 1); */
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    return mc_PROGRAM;
}

"END" {
    /* lookup(yytext, "mot cle", 1); */
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    return mc_END;
}

"READ" {
    /* lookup(yytext, "mot cle", 1); */
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    return mc_READ;
}

"WRITE" {
    /* lookup(yytext, "mot cle", 1); */
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    return mc_WRITE;
}

"EQUIVALENCE" {
    /* lookup(yytext, "mot cle", 1); */
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    return mc_EQUIVALENCE;
}

";" {
    /* lookup(yytext, "separateur", 1); */
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    return yytext;
}

"=" {
    /* lookup(yytext, "separateur", 1); */
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    return yytext;
}

"(" {
    /* lookup(yytext, "separateur", 1); */
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    return yytext;
}

")" {
    /* lookup(yytext, "separateur", 1); */
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    return yytext;
}

"*" {
    /* lookup(yytext, "separateur", 1); */
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    return yytext;
}

"+" {
    /* lookup(yytext, "separateur", 1); */
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    return yytext;
}

"-" {
    /* lookup(yytext, "separateur", 1); */
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    return yytext;
}

"/" {
    /* lookup(yytext, "separateur", 1); */
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    return yytext;
}

"," {
    /* lookup(yytext, "separateur", 1); */
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    return yytext;
}

{IDF} {
    yylval.str = strdup(yytext);  
    /* if(!lookup(yytext, 0)) insert(yytext, "", 0, 0); */
    /* lookup(yytext, 0); */
    Col += strlen(yytext);
    if (yyleng > 10)
	{
		setColor(255, 165, 0);
		printf("File \"%s\", Lexical Warning - Line %d, Column %d: Identifier is too long \n Length(\"%s\") > 10 chars\n", "Exemple.txt", Line, Col, yytext);
		setColor(255, 255, 255);
	}
    printf("Matched lexeme : %s \n", yytext);
    return IDF;
}

{INT} {
    // Matched an integer
    long long intValue = atoll(yytext);
	
	//integer is too small
    if (intValue < -32768)
	{
		setColor(255, 0, 0);
		printf("File \"%s\", Lexical Error - Line %d, Column %d: Integer too small\n <!> %s < -32768\n", "Exemple.txt", Line, Col, yytext);   
		setColor(255, 255, 255);
		YY_BREAK;  /* Terminate the lexer */
	}
    else 
	{
        // Integer is too big
        if (intValue > 32767)
		{
			setColor(255, 0, 0);
			printf("File \"%s\", Lexical Error - Line %d, Column %d: Integer too big\n <!> %s > 32767\n", "Exemple.txt", Line, Col, yytext);
			setColor(255, 255, 255);
			YY_BREAK;  /* Terminate the lexer */
		}
		else 
		{	
			
			//Valid integer
			yylval.entier = intValue;
			/* lookup(yytext, 0); */
			Col += strlen(yytext);
			printf("Matched a valid integer value: %s\n", yytext);
			return INT;
		}
	}
}

{NBR} {
    // Matched an float
     double floatValue = atof(yytext);
	
	//float is too small
    if (floatValue < -32768.32767)
	{
		setColor(255, 0, 0);
		printf("File \"%s\", Lexical Error - Line %d, Column %d: Float too small\n <!>%s < -32768.32767\n", "Exemple.txt", Line, Col, yytext);
		setColor(255, 255, 255);
		YY_BREAK;  /* Terminate the lexer */
	}
    else 
	{
        // Float is too big
        if (floatValue > 32767.32767)
		{
			setColor(255, 0, 0);
			printf("File \"%s\", Lexical Error - Line %d, Column %d: Float too big\n <!> %s > 32767.32767\n", "Exemple.txt", Line, Col, yytext);
			setColor(255, 255, 255);
			YY_BREAK;  /* Terminate the lexer */
		}
		else 
		{
			//Valid integer
			yylval.reel = floatValue;
			/* lookup(yytext, 0); */
			Col = Col + strlen(yytext);
			printf("Matched a valid float value: %s\n", yytext);
			return NBR;
		}
	}
}



[ \t]   Col += strlen(yytext);

\n  {
    Col = 1;
    Line ++;
} 

.   {
	
	setColor(255, 0, 0);
	printf("File \"%s\", Lexical Error - Line %d, Column %d: Unrecognized character '%c'\n", "Exemple.txt", Line, Col, yytext[0]);	
	setColor(255, 255, 255);
	YY_BREAK;  /* Terminate the lexer */
    //return err;
}   
%%

int yywrap()
{
	return 0;
}


int main()
{

    // Invoke the lexer
    yylex();

    return 0;
}
