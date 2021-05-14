
;Problem- uppercase to lowercase and vice versa

.model small 
.stack 100h

.data  


str1 db "Enter the value for X: $"
str2 db "Given input is uppercase$"
str3 db "Given input is lowercase$"
str4 db "Invalid input$"

.code 

main proc 
    mov ax , @data 
    mov ds,ax 
    
    
    input:
    mov ah,9
    lea dx,str1
    int 21h 
            
    mov ah,1
    int 21h
    mov bl,al  
    
     ;printing newline 
    mov ah,2 
    mov dl, 0dh
    int 21h 
    mov dl, 0ah
    int 21h 
    
    
    uppercase:
    cmp bl,'A'
    jb invalid 
    cmp bl,'Z'
    ja lowercase
    mov ah,9
    lea dx,str2
    int 21h
    add bl,32
    jmp exit
    
    lowercase:
    cmp bl,'a'
    jb invalid
    cmp bl,'z'
    ja invalid
    mov ah,9
    lea dx,str3
    int 21h 
    sub bl,32
    jmp exit
    
     
    
    

    invalid:
    mov ah,9
    lea dx,str4
    int 21h 
    jmp exit 
    
    
    
    
    exit:
     ;printing newline 
    mov ah,2 
    mov dl, 0dh
    int 21h 
    mov dl, 0ah
    int 21h
    
    mov ah,2
    mov dl,bl
    int 21h
    
    ;printing newline 
    mov ah,2 
    mov dl, 0dh
    int 21h 
    mov dl, 0ah
    int 21h 
    jmp input
   
    
    
    main endp
end main 