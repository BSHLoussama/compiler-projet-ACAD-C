%{
#include<stdio.h>
#include<string.h>
#include"Color.h"
char* fileName;
int Line;
int Col;

%}

NBR [+-]?[0-9]+(\.[0-9]+)?
IDF [A-Za-z][A-Za-z0-9]*  
INT [+-]?[0-9]+
COMMENT ^%.*  
STRING_LITERAL \"(\\.|[^\"])*\" 
%%  

".EQ." {
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    
}

".NE." {
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    
}

".LE." {
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    
}

".LT." {
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    
}

".GE." {
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    
}

".GT." {
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    
}

".AND." {
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    
}

".OR." {
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    
}

"FALSE" {
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    
}

"TRUE" {
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    
}

"CHARACTER" {
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    
}

"INTEGER" {
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    
}

"LOGICAL" {
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    
}

"REAL" {
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    
}

"DIMENSION" {
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    
}

"DOWHILE" {
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    
}

"ENDDO" {
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    
}

"IF" {
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    
}

"THEN" {
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    
}

"ELSE" {
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    
}

"ENDIF" {
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    
}

"ROUTINE" {
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    
}

"CALL" {
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    
}

"ENDR" {
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    
}

"PROGRAM" {
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    
}

"END" {
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    
}

"READ" {
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    
}

"WRITE" {
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    
}

"EQUIVALENCE" {
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    
}

";" {
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    
}

"=" {
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    
}

"(" {
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    
}

")" {
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    
}

"*" {
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    
}

"+" {
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    
}

"-" {
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    
}

"/" {
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    
}

"," {
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    
}

{IDF} {  
    Col += strlen(yytext);
    if (yyleng > 10)
	{
		setColor(255, 165, 0);
		printf("File \"%s\", Lexical Warning - Line %d, Column %d: Identifier is too long \n", fileName, Line, Col);
		setColor(255, 255, 0);
		printf("<!> Length(\"%s\") > 10 characters\n\n", yytext);
		setColor(255, 255, 255);
	}
    printf("Matched lexeme : %s \n", yytext);
    
}

{INT} {
    // Matched an integer
    long long intValue = atoll(yytext);
	
	//integer is too small
    if (intValue < -32768)
	{
		setColor(255, 0, 0);
		printf("File \"%s\", Lexical Error - Line %d, Column %d: Integer too small\n", fileName, Line, Col);   
		setColor(255, 255, 0);
		printf("<!> %s < -32768\n\n", yytext);
		setColor(255, 255, 255);
	}
    else 
	{
        // Integer is too big
        if (intValue > 32767)
		{
			setColor(255, 0, 0);
			printf("File \"%s\", Lexical Error - Line %d, Column %d: Integer too big\n", fileName, Line, Col);
			setColor(255, 255, 0);
			printf("<!> %s > 32767\n\n", yytext);
			setColor(255, 255, 255);
		}
		else 
		{	
			
			//Valid integer
			Col += strlen(yytext);
			printf("Matched a valid integer value: %s\n", yytext);
			
		}
	}
}

{NBR} {
	
	setColor(255, 0, 0);
	if(checkFloatRange(yytext, fileName, Line, Col))
	{
		//return err
	}
	else
	{
		    //Valid float
			Col = Col + strlen(yytext);
			printf("Matched a valid float value: %s\n", yytext);
	}
}

{COMMENT} {
    Col = 1;   
    Line++;
    printf("Matched lexeme : %s \n", yytext);
}

{STRING_LITERAL} {
    Col += strlen(yytext);
    printf("Matched lexeme : %s \n", yytext);
    
}

[ \t]   Col += strlen(yytext);

\n  {
    Col = 1;
    Line ++;
} 

.   {
	
	setColor(255, 0, 0);
	printf("File \"%s\", Lexical Error - Line %d, Column %d: Unrecognized character '%c'\n\n", fileName, Line, Col, yytext[0]);	
	setColor(255, 255, 255);
}   
%%

int yywrap()
{
	
}


int main(int argc, char** argv)
{	
	if(argc > 1)
	{
		fileName = (char*)argv[1];
		FILE* file =  fopen(fileName, "r");
		
		//error handling
		if(!file)
			return 1;
		yyin = file;
	}
	
    // Invoke the lexer
	setColor(255, 255, 255);
    yylex();
	
	if(yyin != stdin)
		fclose(yyin);
	
	return 0;
}
