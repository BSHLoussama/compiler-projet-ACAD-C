%%
int yyerror(char *msg)
{
	printf ("Erreur Syntaxique a ligne %d a colonne %d \n", Line,Col);
	return 1;
}
/*
int main()
{
	//initialisation();
	yyparse();
	//afficher();
	return 0;
}
*/
int yywrap(void)
{
	return 0;
}