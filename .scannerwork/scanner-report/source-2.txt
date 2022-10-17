#include <stdio.h>
#include <stdlib.h>



struct listNode {
	int data;
	struct listNode* nextNode;
};



//prototypes
void printLinkedList(struct listNode** aPtr);
int insertNode(struct listNode** aPtr, int value);
void deleteNode(struct listNode** aPtr, int value);


int main(int argc, char* argv[])
{
	struct listNode* startNode = NULL;

	for (int i = 1000; i < 1005; i++)
	{
		insertNode(&startNode, i);
	}

	printLinkedList(&startNode);

	deleteNode(&startNode, 1);

	printLinkedList(&startNode);

	deleteNode(&startNode, 1000);

	printLinkedList(&startNode);

}

int insertNode(struct listNode** aPtr, int value)
{
	struct listNode* newNode = (struct listNode*) malloc(sizeof(struct listNode));

	if (newNode != NULL)
	{
		newNode->data = value;
		newNode->nextNode = NULL;

		struct listNode *prevNode = NULL;
		struct listNode *currNode = *aPtr;

		//walk the nodes to find the right place to insert a new node. 

		while (currNode != NULL && value > currNode->data)
		{
			prevNode = currNode;
			currNode = currNode->nextNode;
		}


		if (prevNode == NULL) //add the new node to the beginning of the list
		{
			*aPtr = newNode;
			newNode->nextNode = currNode;
		}
		else {
			prevNode->nextNode = newNode;
			newNode->nextNode = currNode;
		}

		return value;

	}
	else {
		printf("Out of memory, could not add linked list node with value %d", value);
		return 0;
	}
}

void printLinkedList(struct listNode** aPtr)
{
	struct listNode* currNode = *aPtr;

	while (currNode != NULL)
	{
		printf("The value of the linked node is %d for pointer %p.\n", currNode->data, currNode);

		currNode = currNode->nextNode;
	}

	return;
}

void deleteNode(struct listNode** aPtr, int value)
{

	// case 1) the list is empty, *aPtr is NULL
	// case 2) the list is not empty and we have to walk the list to see if we can find the value and remove the node.
	// case 3) the list is not empty and the value does not match a linked list node. 


	if (*aPtr != NULL && (*aPtr)->data == value)
	{
		struct listNode *tempNode = *aPtr;
		*aPtr = (*aPtr)->nextNode; 
		free(tempNode);
		return;
	}
	else {

		struct listNode *currNode = *aPtr;
		struct listNode* prevNode = NULL;

		while (currNode != NULL && currNode->data != value)
		{
			prevNode = currNode;
			currNode = currNode->nextNode;
		}

		if (currNode == NULL )  //we went to the end of the list?
		{
			printf("No linked list Node with value %d could be found to delete.\n", value);
			return;
			

		}
		else if (currNode->data == value)
		{
			//delete the node
			struct listNode* tempNode = currNode;
			prevNode->nextNode = currNode->nextNode;
			free(tempNode);
			return;
		}
		

	}

}