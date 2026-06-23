text:005AF200                 push    ebp
.text:005AF201                 mov     ebp, esp
.text:005AF203                 push    edi
.text:005AF204                 push    esi
.text:005AF205                 push    ebx
.text:005AF206                 and     esp, 0FFFFFFF0h
.text:005AF209                 sub     esp, 0B0h
.text:005AF20F                 mov     ebx, [ebp+argc]
.text:005AF212                 mov     edi, [ebp+argv]
.text:005AF215                 mov     esi, [ebp+envp]
.text:005AF218                 call    sub_401780
.text:005AF21D                 mov     edx, 0FFFFCE8Ch
.text:005AF222                 mov     ecx, 4
.text:005AF227                 mov     dword_80A0A0, 2F5Eh
.text:005AF231                 mov     eax, ds:pbBuffer
.text:005AF236                 mov     [esp+0BCh+var_10], eax
.text:005AF23D                 xor     eax, eax
.text:005AF23F                 mov     eax, 29B9h
.text:005AF244                 mov     dword_807120, 17AEh
.text:005AF24E                 mov     dword_807140, 0AB0E1B75h
.text:005AF258                 mov     dword_807144, 3686Ch
.text:005AF262                 mov     dword_807148, 65CC42F2h
.text:005AF26C                 mov     dword_80714C, 8C014825h
.text:005AF276                 mov     dword_807150, 0BF4C4495h
.text:005AF280                 mov     dword_807154, 8AFBAE0Eh
.text:005AF28A                 mov     dword_807158, 0C97E436Eh
.text:005AF294                 mov     dword_80715C, 1E64401Ah
.text:005AF29E                 mov     dword_807160, 0CEBE992Dh
.text:005AF2A8                 mov     dword_807164, 9289F207h
.text:005AF2B2                 mov     dword_807168, 0E79964D6h
.text:005AF2BC                 mov     dword_80716C, 91D43309h
.text:005AF2C6                 mov     dword_807170, 7670A9C1h
.text:005AF2D0                 mov     dword_807174, 6ED804Dh
.text:005AF2DA                 mov     dword_807178, 299A7B86h
.text:005AF2E4                 mov     dword_80717C, 57DDDD62h
.text:005AF2EE                 mov     dword_807180, 0D8D70F48h
.text:005AF2F8                 mov     dword_807184, 0A1105B5Ah
.text:005AF302                 mov     dword_807188, 2F458880h
.text:005AF30C                 mov     dword_80718C, 3F031802h
