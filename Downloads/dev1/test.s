#
# PURPOSE: find the max number of a set
#
# VARIABLES:
#
# %edi - index of the data being examined
# %ebx - largest data item found
# %eax - current data item
#

.section .data

data_items:
	.long 3,67,34,222,45,75,54,34,44,33,22,11,66,0

.section .text

.globl _start
_start: 
	movl $0, %edi				#move 0 into the index
	movl data_items(,%edi,4), %eax		#load the first number
	movl %eax, %ebx				#al principio el 1ero es el mas grande

start_loop:
	cmpl $0, %eax				#start loop
	je loop_exit
	incl %edi				#load next value
	movl data_items(,%edi,4), %eax
	cmpl %ebx, %eax				#compare values
	jle start_loop				#jump to the beginning

	movl %eax, %ebx				#move the value as the largest
	jmp start_loop				#jump to the beginning

loop_exit:
	movl $1, %eax				#1 is the exit syscall
	#int $0x80	
