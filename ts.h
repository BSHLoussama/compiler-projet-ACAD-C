#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LENGTH 1000

struct SymbolInfo {
    char symbol[20];
    char code[20];
    char type[20];
    float val;
    int TabLen;
    struct SymbolInfo* next;
};

struct SymbolInfo* block[MAX_LENGTH];

int hashFunction(char* symbol) {
    int sum = 0;
    for (int i = 0; i < strlen(symbol); i++) {
        sum = sum + symbol[i];
    }
    return (sum % MAX_LENGTH);
}

void insert(char* symbol, char* code, char* type, float val, int TabLen) {
    int position = hashFunction(symbol);
    struct SymbolInfo* currentSymbol = (struct SymbolInfo*)malloc(sizeof(struct SymbolInfo));
    strcpy(currentSymbol->symbol, symbol);
    strcpy(currentSymbol->code, code);
    strcpy(currentSymbol->type, type);
    currentSymbol->val = val;
    currentSymbol->TabLen = TabLen;

    // Set the next pointer to NULL, as it is the last node in the list
    currentSymbol->next = NULL;

    // Verify if it is the first node in this position
    if (block[position] == NULL) {
        // If true, we put our first node pointer to the block list
        block[position] = currentSymbol;
    } else {
        // Visiting each node till the last node in the list
        struct SymbolInfo* start = block[position];
        while (start->next != NULL)
            start = start->next;
        start->next = currentSymbol;
    }
    printf("\n[INFO] %s Inserted successfully\n", symbol);
}

void dump() {
    printf("+=================================================================================================+\n");
           
    printf("| %-5s | %-20s | %-20s | %-15s | %-10s | %-10s |\n", "Index", "Symbol", "Code", "Type", "Value", "Size");
    printf("+=================================================================================================+\n");
            

    for (int i = 0; i < MAX_LENGTH; i++) {
        struct SymbolInfo* start = block[i];
        while (start != NULL) {
            printf("| %-5d | %-20s | %-20s | %-15s | %-10.2f | %-10d |\n", i, start->symbol, start->code, start->type, start->val, start->TabLen);
            start = start->next;
        }
    }

    printf("+=================================================================================================+\n");
            
}



int lookup(char* symbol, char* type) {
	int position;
	if(type == 0 )
   		position = hashFunction(symbol);
   	else
   		position = hashFunction(symbol+type);
    int found = 0;
    struct SymbolInfo* temp = block[position];

    while (temp != NULL && found == 0) {           
        if (strcmp(temp->symbol, symbol) == 0) {
            printf("\nSymbol: %s Type: %s\n", temp->symbol, temp->type);              //to delet late
            found = 1;
        }
        temp = temp->next;
    }

    if (found == 1) {
            
		return 1;                                                      //ecraser la ligne plutard sans afficher le message
    } else {
	   				
		return 0;					  
    }
}

int erase(char* symbol) {
    int position = hashFunction(symbol);
    struct SymbolInfo* temp = block[position];
    struct SymbolInfo* temp2 = block[position];


	//there is not node in this position
    if (temp == NULL) {
        return 0;
        
    //there is one node in this position and our symbole is on it
    } else if (temp->next == NULL && strcmp(temp->symbol, symbol) == 0) {
        block[position] = NULL;
        free(temp);
        return 1;
    }
	
	//else we visit all the list in the position
    while (strcmp(temp->symbol, symbol) != 0 && temp->next != NULL)
	{
        temp2 = temp;
        temp = temp->next;   //in the last ittereation temp is NULL so we need to preserve the address of the node in temp2
    }

    if (strcmp(temp->symbol, symbol) == 0 && temp->next != NULL)
		{
       		if (strcmp(temp2->symbol, temp->symbol) == 0) 
            	block[position] = temp->next;
        else {
            temp2->next = temp->next;
            temp->next = NULL;
        }
        free(temp);
        return 1;
    } else {
        temp2->next = NULL;
        temp->next = NULL;
        free(temp);
        return 1;
    }

    return 0;
}

void menu() {
    printf("\n Press 1 to INSERT a new symbol along with its type into the symbol-table\n");
    printf("\n Press 2 to LOOKUP a in the symbol-table\n");
    printf("\n Press 3 to DUMP the contents of the symbol-table\n");
    printf("\n Press 4 to DELETE a symbol in the symbol-table\n");
    printf("\n Press 0 to EXIT\n");
    printf("\n Enter your choice: ");
}

int main() {
    int choice;
    char symbol[20], code[20], type[20];
    float val;
    int TabLen;

    menu();
    scanf("%d", &choice);

    while (choice != 0) {
        switch (choice) {
            case 0:
                printf("\n[INFO] Exiting the program\n");
                exit(1);
                break;

            case 1:
                printf("\nEnter SYMBOL, CODE, TYPE, VALUE, and TABLEN to insert: ");
                scanf("%s %s %s %f %d", symbol, code, type, &val, &TabLen);
                insert(symbol, code, type, val, TabLen);
                printf("\n[INFO] Value inserted at: %d\n", hashFunction(symbol));
                break;

            case 2:
                printf("\nInput symbol lookup: ");
                scanf("%s", symbol);
                lookup(symbol);
                break;

            case 3:
                dump();
                break;

            case 4:
                printf("\nInput symbol to delete: ");
                scanf("%s", symbol);
                if (erase(symbol)) {
                    printf("\n[INFO] Element deleted\n");
                } else {
                    printf("\n[INFO] Element not found\n");
                }
                break;

            default:
                printf("\n[WARNING] Invalid choice\n");
        }
        menu();
        scanf("%d", &choice);
    }
    return 0;
}

