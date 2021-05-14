;problem - print A-Z and then a-z using loop
.model small
.stack 100h
.data 

.code 
 main proc  
    
    mov ax,@data
    mov ds,ax
    
    mov cx,26
    mov bl,26
    print:
    mov dh,'Z'
    dec bl
    sub dh,bl
     
    mov ah,2
    mov dl,dh
    int 21h 
    
    loop print:
    
    
    
    
    
    main endp
 end main