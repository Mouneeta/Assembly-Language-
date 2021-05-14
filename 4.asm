;problem - winner team 
.model small
.stack 100h
.data
 bd db "Score of bangladesh: $"
 nz db "Score of New Zealand: $"  
 b1 db "Bangladesh$"
 n1 db "New Zealand$"
 t db "Tie$"
   

.code 
 main proc  
    
    mov ax,@data
    mov ds,ax 
    
    input:
    
    mov ah,9
    lea dx,bd
    int 21h
    
    mov ah,1
    int 21h
    mov bh,al ;bx for Bangladesh
    
    mov ah,1
    int 21h
    mov bl,al
    
    
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h 
    
    mov ah,9
    lea dx,nz
    int 21h
    
    mov ah,1
    int 21h
    mov ch,al ;cx for New Zealand
    
    mov ah,1
    int 21h
    mov cl,al 
    
    ;newline
   
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    
    cmp bh,ch
    ja bangladesh
    jb newzealand
    je comp
    
    
    comp:
    cmp bl,cl
    ja bangladesh
    jb newzealand
    je tie
    
    
    
    newzealand:
    mov ah,9
    lea dx,n1
    int 21h 
    jmp exit
    
    bangladesh:
    
    mov ah,9
    lea dx,b1
    int 21h
    jmp exit
    
    tie:
    mov ah,9
    lea dx,t
    int 21h
    jmp exit
    
    exit: 
    ;newline
    
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
    jmp input
     
    
     
    
    
    
    
    
    
    
    
    main endp
 end main 
 
 
 ;newline 
 ;mov ah,2
 ;mov dl,0dh
 ;int 21h 
 ;mov dl,0dh
 ;int 21h