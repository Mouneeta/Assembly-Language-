
;Problem- Check the input is vowel, number or consonant

.model small 
.stack 100h

.data  


str1 db "Enter the value for X: $"
str2 db "Given input is vowel$"
str3 db "Given input is consonant$"
str4 db "Given input is a number$"
str5 db "Invalid input$"

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
    
    cmp bl,'0'
    jb invalid 
     
    
    jmp valid
    
    
    valid:
    
    cmp bl,'A'
    je vowel 
    cmp bl,'E'
    je vowel
    cmp bl,'I'
    je vowel
    cmp bl,'O'
    je vowel
    cmp bl,'U'
    je vowel
    cmp bl,'a'
    je vowel 
    cmp bl,'e'
    je vowel
    cmp bl,'i'
    je vowel
    cmp bl,'o'
    je vowel
    cmp bl,'u'
    je vowel
    cmp bl,'0'
    je number 
    cmp bl,'1'
    je number
    cmp bl,'2'
    je number
    cmp bl,'3'
    je number
    cmp bl,'4'
    je number
    cmp bl,'5'
    je number 
    cmp bl,'6'
    je number
    cmp bl,'7'
    je number
    cmp bl,'8'
    je number
    cmp bl,'9'
    je number 
    
    
    jmp consonant
    
    
    vowel:
    mov ah,9
    lea dx,str2
    int 21h
    jmp exit
      
    
    consonant: 
    cmp bl,'A'
    jb invalid
    cmp bl,'Z'
    ja lowercase
    
    mov ah,9
    lea dx,str3
    int 21h
    jmp exit 
    
    lowercase:
    cmp bl,'a'
    jb invalid
    cmp bl,'z'
    ja invalid
    mov ah,9
    lea dx,str3
    int 21h
    jmp exit

    invalid:
    mov ah,9
    lea dx,str5
    int 21h 
    jmp exit 
    
    number:
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
    jmp input
   
    
    
    main endp
end main 