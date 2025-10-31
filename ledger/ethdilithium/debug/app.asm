
build/flex/bin/app.elf:     file format elf32-littlearm


Disassembly of section .text:

c0de0000 <main>:
c0de0000:	b510      	push	{r4, lr}
c0de0002:	4604      	mov	r4, r0
c0de0004:	b662      	cpsie	i
c0de0006:	f00b faa3 	bl	c0deb550 <os_boot>
c0de000a:	b90c      	cbnz	r4, c0de0010 <main+0x10>
c0de000c:	f00b f86a 	bl	c0deb0e4 <standalone_app_main>
c0de0010:	2000      	movs	r0, #0
c0de0012:	bd10      	pop	{r4, pc}

c0de0014 <address_from_pubkey>:
c0de0014:	b570      	push	{r4, r5, r6, lr}
c0de0016:	b08a      	sub	sp, #40	@ 0x28
c0de0018:	460c      	mov	r4, r1
c0de001a:	4605      	mov	r5, r0
c0de001c:	4668      	mov	r0, sp
c0de001e:	2120      	movs	r1, #32
c0de0020:	4616      	mov	r6, r2
c0de0022:	f00b ff39 	bl	c0debe98 <__aeabi_memclr>
c0de0026:	b914      	cbnz	r4, c0de002e <address_from_pubkey+0x1a>
c0de0028:	2001      	movs	r0, #1
c0de002a:	f00b fa0d 	bl	c0deb448 <assert_exit>
c0de002e:	2e14      	cmp	r6, #20
c0de0030:	d30a      	bcc.n	c0de0048 <address_from_pubkey+0x34>
c0de0032:	2040      	movs	r0, #64	@ 0x40
c0de0034:	2101      	movs	r1, #1
c0de0036:	9009      	str	r0, [sp, #36]	@ 0x24
c0de0038:	1c68      	adds	r0, r5, #1
c0de003a:	466d      	mov	r5, sp
c0de003c:	9008      	str	r0, [sp, #32]
c0de003e:	a808      	add	r0, sp, #32
c0de0040:	462a      	mov	r2, r5
c0de0042:	f00b f9c9 	bl	c0deb3d8 <cx_keccak_256_hash_iovec>
c0de0046:	b108      	cbz	r0, c0de004c <address_from_pubkey+0x38>
c0de0048:	2000      	movs	r0, #0
c0de004a:	e006      	b.n	c0de005a <address_from_pubkey+0x46>
c0de004c:	f105 010c 	add.w	r1, r5, #12
c0de0050:	4620      	mov	r0, r4
c0de0052:	2214      	movs	r2, #20
c0de0054:	f00b ff16 	bl	c0debe84 <__aeabi_memcpy>
c0de0058:	2001      	movs	r0, #1
c0de005a:	b00a      	add	sp, #40	@ 0x28
c0de005c:	bd70      	pop	{r4, r5, r6, pc}

c0de005e <apdu_dispatcher>:
c0de005e:	b51f      	push	{r0, r1, r2, r3, r4, lr}
c0de0060:	4604      	mov	r4, r0
c0de0062:	b910      	cbnz	r0, c0de006a <apdu_dispatcher+0xc>
c0de0064:	2001      	movs	r0, #1
c0de0066:	f00b f9ef 	bl	c0deb448 <assert_exit>
c0de006a:	7820      	ldrb	r0, [r4, #0]
c0de006c:	28e0      	cmp	r0, #224	@ 0xe0
c0de006e:	d139      	bne.n	c0de00e4 <apdu_dispatcher+0x86>
c0de0070:	2000      	movs	r0, #0
c0de0072:	9003      	str	r0, [sp, #12]
c0de0074:	e9cd 0001 	strd	r0, r0, [sp, #4]
c0de0078:	7860      	ldrb	r0, [r4, #1]
c0de007a:	2813      	cmp	r0, #19
c0de007c:	d035      	beq.n	c0de00ea <apdu_dispatcher+0x8c>
c0de007e:	2804      	cmp	r0, #4
c0de0080:	d03c      	beq.n	c0de00fc <apdu_dispatcher+0x9e>
c0de0082:	2805      	cmp	r0, #5
c0de0084:	d046      	beq.n	c0de0114 <apdu_dispatcher+0xb6>
c0de0086:	2806      	cmp	r0, #6
c0de0088:	d05a      	beq.n	c0de0140 <apdu_dispatcher+0xe2>
c0de008a:	2807      	cmp	r0, #7
c0de008c:	d066      	beq.n	c0de015c <apdu_dispatcher+0xfe>
c0de008e:	2809      	cmp	r0, #9
c0de0090:	d06e      	beq.n	c0de0170 <apdu_dispatcher+0x112>
c0de0092:	280a      	cmp	r0, #10
c0de0094:	d07c      	beq.n	c0de0190 <apdu_dispatcher+0x132>
c0de0096:	280b      	cmp	r0, #11
c0de0098:	f000 8083 	beq.w	c0de01a2 <apdu_dispatcher+0x144>
c0de009c:	280c      	cmp	r0, #12
c0de009e:	f000 8089 	beq.w	c0de01b4 <apdu_dispatcher+0x156>
c0de00a2:	280d      	cmp	r0, #13
c0de00a4:	f000 8093 	beq.w	c0de01ce <apdu_dispatcher+0x170>
c0de00a8:	280e      	cmp	r0, #14
c0de00aa:	f000 8099 	beq.w	c0de01e0 <apdu_dispatcher+0x182>
c0de00ae:	280f      	cmp	r0, #15
c0de00b0:	f000 809f 	beq.w	c0de01f2 <apdu_dispatcher+0x194>
c0de00b4:	2810      	cmp	r0, #16
c0de00b6:	f000 80a9 	beq.w	c0de020c <apdu_dispatcher+0x1ae>
c0de00ba:	2811      	cmp	r0, #17
c0de00bc:	f000 80b1 	beq.w	c0de0222 <apdu_dispatcher+0x1c4>
c0de00c0:	2812      	cmp	r0, #18
c0de00c2:	f000 80b9 	beq.w	c0de0238 <apdu_dispatcher+0x1da>
c0de00c6:	2803      	cmp	r0, #3
c0de00c8:	f040 80c0 	bne.w	c0de024c <apdu_dispatcher+0x1ee>
c0de00cc:	78a0      	ldrb	r0, [r4, #2]
c0de00ce:	2800      	cmp	r0, #0
c0de00d0:	f040 80d5 	bne.w	c0de027e <apdu_dispatcher+0x220>
c0de00d4:	78e0      	ldrb	r0, [r4, #3]
c0de00d6:	2800      	cmp	r0, #0
c0de00d8:	f040 80d1 	bne.w	c0de027e <apdu_dispatcher+0x220>
c0de00dc:	e8bd 401f 	ldmia.w	sp!, {r0, r1, r2, r3, r4, lr}
c0de00e0:	f000 b98b 	b.w	c0de03fa <handler_get_version>
c0de00e4:	f44f 40dc 	mov.w	r0, #28160	@ 0x6e00
c0de00e8:	e0cb      	b.n	c0de0282 <apdu_dispatcher+0x224>
c0de00ea:	68a0      	ldr	r0, [r4, #8]
c0de00ec:	78a1      	ldrb	r1, [r4, #2]
c0de00ee:	78e2      	ldrb	r2, [r4, #3]
c0de00f0:	f000 f8d3 	bl	c0de029a <OUTLINED_FUNCTION_0>
c0de00f4:	a801      	add	r0, sp, #4
c0de00f6:	f000 fb6d 	bl	c0de07d4 <handler_cmd_get_pk_chunk>
c0de00fa:	e0a5      	b.n	c0de0248 <apdu_dispatcher+0x1ea>
c0de00fc:	78a0      	ldrb	r0, [r4, #2]
c0de00fe:	2800      	cmp	r0, #0
c0de0100:	f040 80bd 	bne.w	c0de027e <apdu_dispatcher+0x220>
c0de0104:	78e0      	ldrb	r0, [r4, #3]
c0de0106:	2800      	cmp	r0, #0
c0de0108:	f040 80b9 	bne.w	c0de027e <apdu_dispatcher+0x220>
c0de010c:	e8bd 401f 	ldmia.w	sp!, {r0, r1, r2, r3, r4, lr}
c0de0110:	f000 b90c 	b.w	c0de032c <handler_get_app_name>
c0de0114:	78a1      	ldrb	r1, [r4, #2]
c0de0116:	2901      	cmp	r1, #1
c0de0118:	f200 80b1 	bhi.w	c0de027e <apdu_dispatcher+0x220>
c0de011c:	78e0      	ldrb	r0, [r4, #3]
c0de011e:	2800      	cmp	r0, #0
c0de0120:	f040 80ad 	bne.w	c0de027e <apdu_dispatcher+0x220>
c0de0124:	68a0      	ldr	r0, [r4, #8]
c0de0126:	2800      	cmp	r0, #0
c0de0128:	f000 80a1 	beq.w	c0de026e <apdu_dispatcher+0x210>
c0de012c:	9001      	str	r0, [sp, #4]
c0de012e:	7920      	ldrb	r0, [r4, #4]
c0de0130:	2900      	cmp	r1, #0
c0de0132:	9002      	str	r0, [sp, #8]
c0de0134:	bf18      	it	ne
c0de0136:	2101      	movne	r1, #1
c0de0138:	a801      	add	r0, sp, #4
c0de013a:	f000 f90b 	bl	c0de0354 <handler_get_public_key>
c0de013e:	e083      	b.n	c0de0248 <apdu_dispatcher+0x1ea>
c0de0140:	78a1      	ldrb	r1, [r4, #2]
c0de0142:	2900      	cmp	r1, #0
c0de0144:	f000 8085 	beq.w	c0de0252 <apdu_dispatcher+0x1f4>
c0de0148:	2903      	cmp	r1, #3
c0de014a:	f200 8098 	bhi.w	c0de027e <apdu_dispatcher+0x220>
c0de014e:	78e0      	ldrb	r0, [r4, #3]
c0de0150:	f040 0280 	orr.w	r2, r0, #128	@ 0x80
c0de0154:	2a80      	cmp	r2, #128	@ 0x80
c0de0156:	f000 8080 	beq.w	c0de025a <apdu_dispatcher+0x1fc>
c0de015a:	e090      	b.n	c0de027e <apdu_dispatcher+0x220>
c0de015c:	68a0      	ldr	r0, [r4, #8]
c0de015e:	2800      	cmp	r0, #0
c0de0160:	f000 8085 	beq.w	c0de026e <apdu_dispatcher+0x210>
c0de0164:	f000 f899 	bl	c0de029a <OUTLINED_FUNCTION_0>
c0de0168:	a801      	add	r0, sp, #4
c0de016a:	f000 fa12 	bl	c0de0592 <handler_cmd_keccakH>
c0de016e:	e06b      	b.n	c0de0248 <apdu_dispatcher+0x1ea>
c0de0170:	78e0      	ldrb	r0, [r4, #3]
c0de0172:	2800      	cmp	r0, #0
c0de0174:	f040 8083 	bne.w	c0de027e <apdu_dispatcher+0x220>
c0de0178:	78a1      	ldrb	r1, [r4, #2]
c0de017a:	2902      	cmp	r1, #2
c0de017c:	d301      	bcc.n	c0de0182 <apdu_dispatcher+0x124>
c0de017e:	2980      	cmp	r1, #128	@ 0x80
c0de0180:	d17d      	bne.n	c0de027e <apdu_dispatcher+0x220>
c0de0182:	68a0      	ldr	r0, [r4, #8]
c0de0184:	f000 f889 	bl	c0de029a <OUTLINED_FUNCTION_0>
c0de0188:	a801      	add	r0, sp, #4
c0de018a:	f000 fa1b 	bl	c0de05c4 <handler_cmd_keccak_prng>
c0de018e:	e05b      	b.n	c0de0248 <apdu_dispatcher+0x1ea>
c0de0190:	68a0      	ldr	r0, [r4, #8]
c0de0192:	2800      	cmp	r0, #0
c0de0194:	d06b      	beq.n	c0de026e <apdu_dispatcher+0x210>
c0de0196:	f000 f880 	bl	c0de029a <OUTLINED_FUNCTION_0>
c0de019a:	a801      	add	r0, sp, #4
c0de019c:	f000 f9df 	bl	c0de055e <handler_cmd_dummy>
c0de01a0:	e052      	b.n	c0de0248 <apdu_dispatcher+0x1ea>
c0de01a2:	68a0      	ldr	r0, [r4, #8]
c0de01a4:	2800      	cmp	r0, #0
c0de01a6:	d062      	beq.n	c0de026e <apdu_dispatcher+0x210>
c0de01a8:	f000 f877 	bl	c0de029a <OUTLINED_FUNCTION_0>
c0de01ac:	a801      	add	r0, sp, #4
c0de01ae:	f000 fa41 	bl	c0de0634 <handler_cmd_sample_in_ball>
c0de01b2:	e049      	b.n	c0de0248 <apdu_dispatcher+0x1ea>
c0de01b4:	78a0      	ldrb	r0, [r4, #2]
c0de01b6:	2800      	cmp	r0, #0
c0de01b8:	d161      	bne.n	c0de027e <apdu_dispatcher+0x220>
c0de01ba:	78e0      	ldrb	r0, [r4, #3]
c0de01bc:	2800      	cmp	r0, #0
c0de01be:	d15e      	bne.n	c0de027e <apdu_dispatcher+0x220>
c0de01c0:	68a0      	ldr	r0, [r4, #8]
c0de01c2:	f000 f86a 	bl	c0de029a <OUTLINED_FUNCTION_0>
c0de01c6:	a801      	add	r0, sp, #4
c0de01c8:	f000 fa43 	bl	c0de0652 <handler_cmd_keygen_core_dilithium>
c0de01cc:	e03c      	b.n	c0de0248 <apdu_dispatcher+0x1ea>
c0de01ce:	68a0      	ldr	r0, [r4, #8]
c0de01d0:	2800      	cmp	r0, #0
c0de01d2:	d04c      	beq.n	c0de026e <apdu_dispatcher+0x210>
c0de01d4:	f000 f861 	bl	c0de029a <OUTLINED_FUNCTION_0>
c0de01d8:	a801      	add	r0, sp, #4
c0de01da:	f000 fb0b 	bl	c0de07f4 <handler_cmd_Poseidon_ithRC>
c0de01de:	e033      	b.n	c0de0248 <apdu_dispatcher+0x1ea>
c0de01e0:	68a0      	ldr	r0, [r4, #8]
c0de01e2:	2800      	cmp	r0, #0
c0de01e4:	d043      	beq.n	c0de026e <apdu_dispatcher+0x210>
c0de01e6:	f000 f858 	bl	c0de029a <OUTLINED_FUNCTION_0>
c0de01ea:	a801      	add	r0, sp, #4
c0de01ec:	f000 fb30 	bl	c0de0850 <handler_cmd_tEdwards>
c0de01f0:	e02a      	b.n	c0de0248 <apdu_dispatcher+0x1ea>
c0de01f2:	78e0      	ldrb	r0, [r4, #3]
c0de01f4:	2800      	cmp	r0, #0
c0de01f6:	d142      	bne.n	c0de027e <apdu_dispatcher+0x220>
c0de01f8:	78a1      	ldrb	r1, [r4, #2]
c0de01fa:	2902      	cmp	r1, #2
c0de01fc:	d23a      	bcs.n	c0de0274 <apdu_dispatcher+0x216>
c0de01fe:	68a0      	ldr	r0, [r4, #8]
c0de0200:	f000 f84b 	bl	c0de029a <OUTLINED_FUNCTION_0>
c0de0204:	a801      	add	r0, sp, #4
c0de0206:	f000 fa4b 	bl	c0de06a0 <handler_cmd_sign_dilithium>
c0de020a:	e01d      	b.n	c0de0248 <apdu_dispatcher+0x1ea>
c0de020c:	78a0      	ldrb	r0, [r4, #2]
c0de020e:	bbb0      	cbnz	r0, c0de027e <apdu_dispatcher+0x220>
c0de0210:	78e0      	ldrb	r0, [r4, #3]
c0de0212:	bba0      	cbnz	r0, c0de027e <apdu_dispatcher+0x220>
c0de0214:	68a0      	ldr	r0, [r4, #8]
c0de0216:	f000 f840 	bl	c0de029a <OUTLINED_FUNCTION_0>
c0de021a:	a801      	add	r0, sp, #4
c0de021c:	f000 faa8 	bl	c0de0770 <handler_cmd_verify_dilithium>
c0de0220:	e012      	b.n	c0de0248 <apdu_dispatcher+0x1ea>
c0de0222:	78a0      	ldrb	r0, [r4, #2]
c0de0224:	bb58      	cbnz	r0, c0de027e <apdu_dispatcher+0x220>
c0de0226:	78e0      	ldrb	r0, [r4, #3]
c0de0228:	bb48      	cbnz	r0, c0de027e <apdu_dispatcher+0x220>
c0de022a:	68a0      	ldr	r0, [r4, #8]
c0de022c:	f000 f835 	bl	c0de029a <OUTLINED_FUNCTION_0>
c0de0230:	a801      	add	r0, sp, #4
c0de0232:	f000 fa22 	bl	c0de067a <handler_cmd_keygen_dilithium>
c0de0236:	e007      	b.n	c0de0248 <apdu_dispatcher+0x1ea>
c0de0238:	68a0      	ldr	r0, [r4, #8]
c0de023a:	78a1      	ldrb	r1, [r4, #2]
c0de023c:	78e2      	ldrb	r2, [r4, #3]
c0de023e:	f000 f82c 	bl	c0de029a <OUTLINED_FUNCTION_0>
c0de0242:	a801      	add	r0, sp, #4
c0de0244:	f000 fab6 	bl	c0de07b4 <handler_cmd_get_sig_chunk>
c0de0248:	b004      	add	sp, #16
c0de024a:	bd10      	pop	{r4, pc}
c0de024c:	f44f 40da 	mov.w	r0, #27904	@ 0x6d00
c0de0250:	e017      	b.n	c0de0282 <apdu_dispatcher+0x224>
c0de0252:	78e0      	ldrb	r0, [r4, #3]
c0de0254:	2880      	cmp	r0, #128	@ 0x80
c0de0256:	d112      	bne.n	c0de027e <apdu_dispatcher+0x220>
c0de0258:	2080      	movs	r0, #128	@ 0x80
c0de025a:	68a2      	ldr	r2, [r4, #8]
c0de025c:	b13a      	cbz	r2, c0de026e <apdu_dispatcher+0x210>
c0de025e:	9201      	str	r2, [sp, #4]
c0de0260:	7922      	ldrb	r2, [r4, #4]
c0de0262:	9202      	str	r2, [sp, #8]
c0de0264:	09c2      	lsrs	r2, r0, #7
c0de0266:	a801      	add	r0, sp, #4
c0de0268:	f000 f8de 	bl	c0de0428 <handler_sign_tx>
c0de026c:	e7ec      	b.n	c0de0248 <apdu_dispatcher+0x1ea>
c0de026e:	f646 2087 	movw	r0, #27271	@ 0x6a87
c0de0272:	e006      	b.n	c0de0282 <apdu_dispatcher+0x224>
c0de0274:	2980      	cmp	r1, #128	@ 0x80
c0de0276:	d102      	bne.n	c0de027e <apdu_dispatcher+0x220>
c0de0278:	7920      	ldrb	r0, [r4, #4]
c0de027a:	2802      	cmp	r0, #2
c0de027c:	d0bf      	beq.n	c0de01fe <apdu_dispatcher+0x1a0>
c0de027e:	f646 2086 	movw	r0, #27270	@ 0x6a86
c0de0282:	b004      	add	sp, #16
c0de0284:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de0288:	f000 b800 	b.w	c0de028c <io_send_sw>

c0de028c <io_send_sw>:
c0de028c:	b580      	push	{r7, lr}
c0de028e:	4602      	mov	r2, r0
c0de0290:	2000      	movs	r0, #0
c0de0292:	2100      	movs	r1, #0
c0de0294:	f00a fee6 	bl	c0deb064 <io_send_response_buffers>
c0de0298:	bd80      	pop	{r7, pc}

c0de029a <OUTLINED_FUNCTION_0>:
c0de029a:	9001      	str	r0, [sp, #4]
c0de029c:	7920      	ldrb	r0, [r4, #4]
c0de029e:	9002      	str	r0, [sp, #8]
c0de02a0:	4770      	bx	lr
	...

c0de02a4 <app_main>:
c0de02a4:	b5bf      	push	{r0, r1, r2, r3, r4, r5, r7, lr}
c0de02a6:	f00a febf 	bl	c0deb028 <io_init>
c0de02aa:	f000 fcc7 	bl	c0de0c3c <ui_menu_main>
c0de02ae:	481b      	ldr	r0, [pc, #108]	@ (c0de031c <app_main+0x78>)
c0de02b0:	f44f 7136 	mov.w	r1, #728	@ 0x2d8
c0de02b4:	4448      	add	r0, r9
c0de02b6:	f00b fdfd 	bl	c0debeb4 <explicit_bzero>
c0de02ba:	481a      	ldr	r0, [pc, #104]	@ (c0de0324 <app_main+0x80>)
c0de02bc:	4478      	add	r0, pc
c0de02be:	f00b fae3 	bl	c0deb888 <pic>
c0de02c2:	7880      	ldrb	r0, [r0, #2]
c0de02c4:	2801      	cmp	r0, #1
c0de02c6:	d00d      	beq.n	c0de02e4 <app_main+0x40>
c0de02c8:	2001      	movs	r0, #1
c0de02ca:	f88d 0002 	strb.w	r0, [sp, #2]
c0de02ce:	2000      	movs	r0, #0
c0de02d0:	f8ad 0000 	strh.w	r0, [sp]
c0de02d4:	4814      	ldr	r0, [pc, #80]	@ (c0de0328 <app_main+0x84>)
c0de02d6:	4478      	add	r0, pc
c0de02d8:	f00b fad6 	bl	c0deb888 <pic>
c0de02dc:	4669      	mov	r1, sp
c0de02de:	2203      	movs	r2, #3
c0de02e0:	f00b fb0c 	bl	c0deb8fc <nvm_write>
c0de02e4:	4d0e      	ldr	r5, [pc, #56]	@ (c0de0320 <app_main+0x7c>)
c0de02e6:	ac01      	add	r4, sp, #4
c0de02e8:	f00a fea6 	bl	c0deb038 <io_recv_command>
c0de02ec:	2800      	cmp	r0, #0
c0de02ee:	d414      	bmi.n	c0de031a <app_main+0x76>
c0de02f0:	4602      	mov	r2, r0
c0de02f2:	eb09 0105 	add.w	r1, r9, r5
c0de02f6:	4620      	mov	r0, r4
c0de02f8:	f00a ff1b 	bl	c0deb132 <apdu_parser>
c0de02fc:	b130      	cbz	r0, c0de030c <app_main+0x68>
c0de02fe:	4620      	mov	r0, r4
c0de0300:	f7ff fead 	bl	c0de005e <apdu_dispatcher>
c0de0304:	f1b0 3fff 	cmp.w	r0, #4294967295	@ 0xffffffff
c0de0308:	dcee      	bgt.n	c0de02e8 <app_main+0x44>
c0de030a:	e006      	b.n	c0de031a <app_main+0x76>
c0de030c:	2000      	movs	r0, #0
c0de030e:	2100      	movs	r1, #0
c0de0310:	f646 2287 	movw	r2, #27271	@ 0x6a87
c0de0314:	f00a fea6 	bl	c0deb064 <io_send_response_buffers>
c0de0318:	e7e6      	b.n	c0de02e8 <app_main+0x44>
c0de031a:	bdbf      	pop	{r0, r1, r2, r3, r4, r5, r7, pc}
c0de031c:	00000000 	.word	0x00000000
c0de0320:	000014f7 	.word	0x000014f7
c0de0324:	0000f140 	.word	0x0000f140
c0de0328:	0000f126 	.word	0x0000f126

c0de032c <handler_get_app_name>:
c0de032c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de032e:	4808      	ldr	r0, [pc, #32]	@ (c0de0350 <handler_get_app_name+0x24>)
c0de0330:	4478      	add	r0, pc
c0de0332:	f00b faa9 	bl	c0deb888 <pic>
c0de0336:	2100      	movs	r1, #0
c0de0338:	f44f 4210 	mov.w	r2, #36864	@ 0x9000
c0de033c:	9103      	str	r1, [sp, #12]
c0de033e:	2108      	movs	r1, #8
c0de0340:	e9cd 0101 	strd	r0, r1, [sp, #4]
c0de0344:	a801      	add	r0, sp, #4
c0de0346:	2101      	movs	r1, #1
c0de0348:	f00a fe8c 	bl	c0deb064 <io_send_response_buffers>
c0de034c:	b004      	add	sp, #16
c0de034e:	bd80      	pop	{r7, pc}
c0de0350:	0000d6a9 	.word	0x0000d6a9

c0de0354 <handler_get_public_key>:
c0de0354:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de0356:	b085      	sub	sp, #20
c0de0358:	4f23      	ldr	r7, [pc, #140]	@ (c0de03e8 <handler_get_public_key+0x94>)
c0de035a:	460c      	mov	r4, r1
c0de035c:	4605      	mov	r5, r0
c0de035e:	f44f 7136 	mov.w	r1, #728	@ 0x2d8
c0de0362:	eb09 0607 	add.w	r6, r9, r7
c0de0366:	4630      	mov	r0, r6
c0de0368:	f00b fda4 	bl	c0debeb4 <explicit_bzero>
c0de036c:	2000      	movs	r0, #0
c0de036e:	f506 7135 	add.w	r1, r6, #724	@ 0x2d4
c0de0372:	f809 0007 	strb.w	r0, [r9, r7]
c0de0376:	f886 02a8 	strb.w	r0, [r6, #680]	@ 0x2a8
c0de037a:	4628      	mov	r0, r5
c0de037c:	f00a fc1e 	bl	c0deabbc <buffer_read_u8>
c0de0380:	b308      	cbz	r0, c0de03c6 <handler_get_public_key+0x72>
c0de0382:	eb09 0007 	add.w	r0, r9, r7
c0de0386:	f890 22d4 	ldrb.w	r2, [r0, #724]	@ 0x2d4
c0de038a:	f500 712b 	add.w	r1, r0, #684	@ 0x2ac
c0de038e:	4628      	mov	r0, r5
c0de0390:	f00a fc67 	bl	c0deac62 <buffer_read_bip32_path>
c0de0394:	b1b8      	cbz	r0, c0de03c6 <handler_get_public_key+0x72>
c0de0396:	eb09 0007 	add.w	r0, r9, r7
c0de039a:	2100      	movs	r1, #0
c0de039c:	2205      	movs	r2, #5
c0de039e:	f890 32d4 	ldrb.w	r3, [r0, #724]	@ 0x2d4
c0de03a2:	e9cd 2102 	strd	r2, r1, [sp, #8]
c0de03a6:	9104      	str	r1, [sp, #16]
c0de03a8:	f100 0549 	add.w	r5, r0, #73	@ 0x49
c0de03ac:	f100 0608 	add.w	r6, r0, #8
c0de03b0:	f500 722b 	add.w	r2, r0, #684	@ 0x2ac
c0de03b4:	2000      	movs	r0, #0
c0de03b6:	2121      	movs	r1, #33	@ 0x21
c0de03b8:	e9cd 6500 	strd	r6, r5, [sp]
c0de03bc:	f00a fd12 	bl	c0deade4 <bip32_derive_with_seed_get_pubkey_256>
c0de03c0:	b140      	cbz	r0, c0de03d4 <handler_get_public_key+0x80>
c0de03c2:	b280      	uxth	r0, r0
c0de03c4:	e001      	b.n	c0de03ca <handler_get_public_key+0x76>
c0de03c6:	f646 2087 	movw	r0, #27271	@ 0x6a87
c0de03ca:	b005      	add	sp, #20
c0de03cc:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de03d0:	f000 b80c 	b.w	c0de03ec <io_send_sw>
c0de03d4:	2c00      	cmp	r4, #0
c0de03d6:	b005      	add	sp, #20
c0de03d8:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de03dc:	bf08      	it	eq
c0de03de:	f000 bafd 	beq.w	c0de09dc <helper_send_response_pubkey>
c0de03e2:	f000 bd13 	b.w	c0de0e0c <ui_display_address>
c0de03e6:	bf00      	nop
c0de03e8:	00000000 	.word	0x00000000

c0de03ec <io_send_sw>:
c0de03ec:	b580      	push	{r7, lr}
c0de03ee:	4602      	mov	r2, r0
c0de03f0:	2000      	movs	r0, #0
c0de03f2:	2100      	movs	r1, #0
c0de03f4:	f00a fe36 	bl	c0deb064 <io_send_response_buffers>
c0de03f8:	bd80      	pop	{r7, pc}

c0de03fa <handler_get_version>:
c0de03fa:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de03fc:	2000      	movs	r0, #0
c0de03fe:	2101      	movs	r1, #1
c0de0400:	f44f 4210 	mov.w	r2, #36864	@ 0x9000
c0de0404:	f88d 0002 	strb.w	r0, [sp, #2]
c0de0408:	f88d 0001 	strb.w	r0, [sp, #1]
c0de040c:	9003      	str	r0, [sp, #12]
c0de040e:	2003      	movs	r0, #3
c0de0410:	f88d 1003 	strb.w	r1, [sp, #3]
c0de0414:	2101      	movs	r1, #1
c0de0416:	9002      	str	r0, [sp, #8]
c0de0418:	f10d 0001 	add.w	r0, sp, #1
c0de041c:	9001      	str	r0, [sp, #4]
c0de041e:	a801      	add	r0, sp, #4
c0de0420:	f00a fe20 	bl	c0deb064 <io_send_response_buffers>
c0de0424:	b004      	add	sp, #16
c0de0426:	bd80      	pop	{r7, pc}

c0de0428 <handler_sign_tx>:
c0de0428:	b570      	push	{r4, r5, r6, lr}
c0de042a:	b086      	sub	sp, #24
c0de042c:	4e46      	ldr	r6, [pc, #280]	@ (c0de0548 <handler_sign_tx+0x120>)
c0de042e:	4604      	mov	r4, r0
c0de0430:	b191      	cbz	r1, c0de0458 <handler_sign_tx+0x30>
c0de0432:	eb09 0006 	add.w	r0, r9, r6
c0de0436:	f890 02a8 	ldrb.w	r0, [r0, #680]	@ 0x2a8
c0de043a:	2801      	cmp	r0, #1
c0de043c:	d12c      	bne.n	c0de0498 <handler_sign_tx+0x70>
c0de043e:	eb09 0006 	add.w	r0, r9, r6
c0de0442:	4615      	mov	r5, r2
c0de0444:	6862      	ldr	r2, [r4, #4]
c0de0446:	f8d0 0208 	ldr.w	r0, [r0, #520]	@ 0x208
c0de044a:	1811      	adds	r1, r2, r0
c0de044c:	f5b1 7fff 	cmp.w	r1, #510	@ 0x1fe
c0de0450:	d925      	bls.n	c0de049e <handler_sign_tx+0x76>
c0de0452:	f24b 0004 	movw	r0, #45060	@ 0xb004
c0de0456:	e039      	b.n	c0de04cc <handler_sign_tx+0xa4>
c0de0458:	eb09 0506 	add.w	r5, r9, r6
c0de045c:	f44f 7136 	mov.w	r1, #728	@ 0x2d8
c0de0460:	4628      	mov	r0, r5
c0de0462:	f00b fd27 	bl	c0debeb4 <explicit_bzero>
c0de0466:	2000      	movs	r0, #0
c0de0468:	f505 7135 	add.w	r1, r5, #724	@ 0x2d4
c0de046c:	f809 0006 	strb.w	r0, [r9, r6]
c0de0470:	2001      	movs	r0, #1
c0de0472:	f885 02a8 	strb.w	r0, [r5, #680]	@ 0x2a8
c0de0476:	4620      	mov	r0, r4
c0de0478:	f00a fba0 	bl	c0deabbc <buffer_read_u8>
c0de047c:	b148      	cbz	r0, c0de0492 <handler_sign_tx+0x6a>
c0de047e:	eb09 0006 	add.w	r0, r9, r6
c0de0482:	f890 22d4 	ldrb.w	r2, [r0, #724]	@ 0x2d4
c0de0486:	f500 712b 	add.w	r1, r0, #684	@ 0x2ac
c0de048a:	4620      	mov	r0, r4
c0de048c:	f00a fbe9 	bl	c0deac62 <buffer_read_bip32_path>
c0de0490:	b9b8      	cbnz	r0, c0de04c2 <handler_sign_tx+0x9a>
c0de0492:	f646 2087 	movw	r0, #27271	@ 0x6a87
c0de0496:	e019      	b.n	c0de04cc <handler_sign_tx+0xa4>
c0de0498:	f24b 0007 	movw	r0, #45063	@ 0xb007
c0de049c:	e016      	b.n	c0de04cc <handler_sign_tx+0xa4>
c0de049e:	eb09 0106 	add.w	r1, r9, r6
c0de04a2:	4408      	add	r0, r1
c0de04a4:	f100 0108 	add.w	r1, r0, #8
c0de04a8:	4620      	mov	r0, r4
c0de04aa:	f00a fc04 	bl	c0deacb6 <buffer_move>
c0de04ae:	b158      	cbz	r0, c0de04c8 <handler_sign_tx+0xa0>
c0de04b0:	eb09 0106 	add.w	r1, r9, r6
c0de04b4:	6862      	ldr	r2, [r4, #4]
c0de04b6:	f8d1 0208 	ldr.w	r0, [r1, #520]	@ 0x208
c0de04ba:	4410      	add	r0, r2
c0de04bc:	f8c1 0208 	str.w	r0, [r1, #520]	@ 0x208
c0de04c0:	b14d      	cbz	r5, c0de04d6 <handler_sign_tx+0xae>
c0de04c2:	f44f 4010 	mov.w	r0, #36864	@ 0x9000
c0de04c6:	e001      	b.n	c0de04cc <handler_sign_tx+0xa4>
c0de04c8:	f24b 0005 	movw	r0, #45061	@ 0xb005
c0de04cc:	b006      	add	sp, #24
c0de04ce:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de04d2:	f000 b83d 	b.w	c0de0550 <io_send_sw>
c0de04d6:	2100      	movs	r1, #0
c0de04d8:	e9cd 0102 	strd	r0, r1, [sp, #8]
c0de04dc:	eb09 0006 	add.w	r0, r9, r6
c0de04e0:	f100 0108 	add.w	r1, r0, #8
c0de04e4:	9101      	str	r1, [sp, #4]
c0de04e6:	f500 7104 	add.w	r1, r0, #528	@ 0x210
c0de04ea:	a801      	add	r0, sp, #4
c0de04ec:	f000 fac6 	bl	c0de0a7c <transaction_deserialize>
c0de04f0:	2801      	cmp	r0, #1
c0de04f2:	d114      	bne.n	c0de051e <handler_sign_tx+0xf6>
c0de04f4:	2001      	movs	r0, #1
c0de04f6:	f809 0006 	strb.w	r0, [r9, r6]
c0de04fa:	eb09 0006 	add.w	r0, r9, r6
c0de04fe:	f8d0 1208 	ldr.w	r1, [r0, #520]	@ 0x208
c0de0502:	f500 720e 	add.w	r2, r0, #568	@ 0x238
c0de0506:	9105      	str	r1, [sp, #20]
c0de0508:	f100 0108 	add.w	r1, r0, #8
c0de050c:	9104      	str	r1, [sp, #16]
c0de050e:	a804      	add	r0, sp, #16
c0de0510:	2101      	movs	r1, #1
c0de0512:	f00a ff61 	bl	c0deb3d8 <cx_keccak_256_hash_iovec>
c0de0516:	b140      	cbz	r0, c0de052a <handler_sign_tx+0x102>
c0de0518:	f24b 0006 	movw	r0, #45062	@ 0xb006
c0de051c:	e001      	b.n	c0de0522 <handler_sign_tx+0xfa>
c0de051e:	f24b 0005 	movw	r0, #45061	@ 0xb005
c0de0522:	f000 f815 	bl	c0de0550 <io_send_sw>
c0de0526:	b006      	add	sp, #24
c0de0528:	bd70      	pop	{r4, r5, r6, pc}
c0de052a:	eb09 0006 	add.w	r0, r9, r6
c0de052e:	f8d0 022c 	ldr.w	r0, [r0, #556]	@ 0x22c
c0de0532:	4906      	ldr	r1, [pc, #24]	@ (c0de054c <handler_sign_tx+0x124>)
c0de0534:	4479      	add	r1, pc
c0de0536:	f00b fd11 	bl	c0debf5c <strcmp>
c0de053a:	b110      	cbz	r0, c0de0542 <handler_sign_tx+0x11a>
c0de053c:	f000 fd8b 	bl	c0de1056 <ui_display_transaction>
c0de0540:	e7f1      	b.n	c0de0526 <handler_sign_tx+0xfe>
c0de0542:	f000 fd85 	bl	c0de1050 <ui_display_blind_signed_transaction>
c0de0546:	e7ee      	b.n	c0de0526 <handler_sign_tx+0xfe>
c0de0548:	00000000 	.word	0x00000000
c0de054c:	0000ccfd 	.word	0x0000ccfd

c0de0550 <io_send_sw>:
c0de0550:	b580      	push	{r7, lr}
c0de0552:	4602      	mov	r2, r0
c0de0554:	2000      	movs	r0, #0
c0de0556:	2100      	movs	r1, #0
c0de0558:	f00a fd84 	bl	c0deb064 <io_send_response_buffers>
c0de055c:	bd80      	pop	{r7, pc}

c0de055e <handler_cmd_dummy>:
c0de055e:	b580      	push	{r7, lr}
c0de0560:	e9d0 2100 	ldrd	r2, r1, [r0]
c0de0564:	4610      	mov	r0, r2
c0de0566:	f000 f802 	bl	c0de056e <io_send_response_pointer>
c0de056a:	2000      	movs	r0, #0
c0de056c:	bd80      	pop	{r7, pc}

c0de056e <io_send_response_pointer>:
c0de056e:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de0570:	2200      	movs	r2, #0
c0de0572:	ab01      	add	r3, sp, #4
c0de0574:	c307      	stmia	r3!, {r0, r1, r2}
c0de0576:	a801      	add	r0, sp, #4
c0de0578:	2101      	movs	r1, #1
c0de057a:	f44f 4210 	mov.w	r2, #36864	@ 0x9000
c0de057e:	f00a fd71 	bl	c0deb064 <io_send_response_buffers>
c0de0582:	bd8f      	pop	{r0, r1, r2, r3, r7, pc}

c0de0584 <io_send_sw>:
c0de0584:	b580      	push	{r7, lr}
c0de0586:	4602      	mov	r2, r0
c0de0588:	2000      	movs	r0, #0
c0de058a:	2100      	movs	r1, #0
c0de058c:	f00a fd6a 	bl	c0deb064 <io_send_response_buffers>
c0de0590:	bd80      	pop	{r7, pc}

c0de0592 <handler_cmd_keccakH>:
c0de0592:	b5b0      	push	{r4, r5, r7, lr}
c0de0594:	b0f2      	sub	sp, #456	@ 0x1c8
c0de0596:	466d      	mov	r5, sp
c0de0598:	4604      	mov	r4, r0
c0de059a:	4628      	mov	r0, r5
c0de059c:	f000 fd5e 	bl	c0de105c <keccak_init>
c0de05a0:	88a2      	ldrh	r2, [r4, #4]
c0de05a2:	6821      	ldr	r1, [r4, #0]
c0de05a4:	4628      	mov	r0, r5
c0de05a6:	f000 fd5d 	bl	c0de1064 <keccak_update>
c0de05aa:	ac6a      	add	r4, sp, #424	@ 0x1a8
c0de05ac:	4628      	mov	r0, r5
c0de05ae:	4621      	mov	r1, r4
c0de05b0:	f000 fd5a 	bl	c0de1068 <keccak_final>
c0de05b4:	4620      	mov	r0, r4
c0de05b6:	2120      	movs	r1, #32
c0de05b8:	f7ff ffd9 	bl	c0de056e <io_send_response_pointer>
c0de05bc:	2000      	movs	r0, #0
c0de05be:	b072      	add	sp, #456	@ 0x1c8
c0de05c0:	bdb0      	pop	{r4, r5, r7, pc}
	...

c0de05c4 <handler_cmd_keccak_prng>:
c0de05c4:	b510      	push	{r4, lr}
c0de05c6:	b090      	sub	sp, #64	@ 0x40
c0de05c8:	2980      	cmp	r1, #128	@ 0x80
c0de05ca:	d007      	beq.n	c0de05dc <handler_cmd_keccak_prng+0x18>
c0de05cc:	2901      	cmp	r1, #1
c0de05ce:	d017      	beq.n	c0de0600 <handler_cmd_keccak_prng+0x3c>
c0de05d0:	bb11      	cbnz	r1, c0de0618 <handler_cmd_keccak_prng+0x54>
c0de05d2:	4817      	ldr	r0, [pc, #92]	@ (c0de0630 <handler_cmd_keccak_prng+0x6c>)
c0de05d4:	4448      	add	r0, r9
c0de05d6:	f000 fd49 	bl	c0de106c <inner_keccak256_init>
c0de05da:	e019      	b.n	c0de0610 <handler_cmd_keccak_prng+0x4c>
c0de05dc:	4c14      	ldr	r4, [pc, #80]	@ (c0de0630 <handler_cmd_keccak_prng+0x6c>)
c0de05de:	eb09 0004 	add.w	r0, r9, r4
c0de05e2:	f000 fd66 	bl	c0de10b2 <inner_keccak256_flip>
c0de05e6:	b9a0      	cbnz	r0, c0de0612 <handler_cmd_keccak_prng+0x4e>
c0de05e8:	eb09 0004 	add.w	r0, r9, r4
c0de05ec:	4669      	mov	r1, sp
c0de05ee:	2240      	movs	r2, #64	@ 0x40
c0de05f0:	f000 fd75 	bl	c0de10de <inner_keccak256_extract>
c0de05f4:	b968      	cbnz	r0, c0de0612 <handler_cmd_keccak_prng+0x4e>
c0de05f6:	4668      	mov	r0, sp
c0de05f8:	2140      	movs	r1, #64	@ 0x40
c0de05fa:	f7ff ffb8 	bl	c0de056e <io_send_response_pointer>
c0de05fe:	e014      	b.n	c0de062a <handler_cmd_keccak_prng+0x66>
c0de0600:	490b      	ldr	r1, [pc, #44]	@ (c0de0630 <handler_cmd_keccak_prng+0x6c>)
c0de0602:	eb09 0301 	add.w	r3, r9, r1
c0de0606:	e9d0 1200 	ldrd	r1, r2, [r0]
c0de060a:	4618      	mov	r0, r3
c0de060c:	f000 fd3f 	bl	c0de108e <inner_keccak256_inject>
c0de0610:	b148      	cbz	r0, c0de0626 <handler_cmd_keccak_prng+0x62>
c0de0612:	f000 f9d7 	bl	c0de09c4 <OUTLINED_FUNCTION_0>
c0de0616:	e009      	b.n	c0de062c <handler_cmd_keccak_prng+0x68>
c0de0618:	f646 2086 	movw	r0, #27270	@ 0x6a86
c0de061c:	b010      	add	sp, #64	@ 0x40
c0de061e:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de0622:	f7ff bfaf 	b.w	c0de0584 <io_send_sw>
c0de0626:	f000 f9d5 	bl	c0de09d4 <OUTLINED_FUNCTION_2>
c0de062a:	2000      	movs	r0, #0
c0de062c:	b010      	add	sp, #64	@ 0x40
c0de062e:	bd10      	pop	{r4, pc}
c0de0630:	000002d8 	.word	0x000002d8

c0de0634 <handler_cmd_sample_in_ball>:
c0de0634:	b510      	push	{r4, lr}
c0de0636:	f5ad 6d80 	sub.w	sp, sp, #1024	@ 0x400
c0de063a:	6801      	ldr	r1, [r0, #0]
c0de063c:	466c      	mov	r4, sp
c0de063e:	4620      	mov	r0, r4
c0de0640:	f001 fcb1 	bl	c0de1fa6 <pqcrystals_dilithium2_lowram_poly_challenge_eth>
c0de0644:	4620      	mov	r0, r4
c0de0646:	f000 f9c1 	bl	c0de09cc <OUTLINED_FUNCTION_1>
c0de064a:	2000      	movs	r0, #0
c0de064c:	f50d 6d80 	add.w	sp, sp, #1024	@ 0x400
c0de0650:	bd10      	pop	{r4, pc}

c0de0652 <handler_cmd_keygen_core_dilithium>:
c0de0652:	b580      	push	{r7, lr}
c0de0654:	f5ad 6d72 	sub.w	sp, sp, #3872	@ 0xf20
c0de0658:	6802      	ldr	r2, [r0, #0]
c0de065a:	f50d 6020 	add.w	r0, sp, #2560	@ 0xa00
c0de065e:	4669      	mov	r1, sp
c0de0660:	f001 fe54 	bl	c0de230c <crypto_sign_keypair_core>
c0de0664:	b110      	cbz	r0, c0de066c <handler_cmd_keygen_core_dilithium+0x1a>
c0de0666:	f000 f9ad 	bl	c0de09c4 <OUTLINED_FUNCTION_0>
c0de066a:	e003      	b.n	c0de0674 <handler_cmd_keygen_core_dilithium+0x22>
c0de066c:	4668      	mov	r0, sp
c0de066e:	f000 f9ad 	bl	c0de09cc <OUTLINED_FUNCTION_1>
c0de0672:	2000      	movs	r0, #0
c0de0674:	f50d 6d72 	add.w	sp, sp, #3872	@ 0xf20
c0de0678:	bd80      	pop	{r7, pc}

c0de067a <handler_cmd_keygen_dilithium>:
c0de067a:	b580      	push	{r7, lr}
c0de067c:	f5ad 6d72 	sub.w	sp, sp, #3872	@ 0xf20
c0de0680:	f50d 6020 	add.w	r0, sp, #2560	@ 0xa00
c0de0684:	4669      	mov	r1, sp
c0de0686:	f001 fe30 	bl	c0de22ea <pqcrystals_dilithium2_lowram_keypair>
c0de068a:	b110      	cbz	r0, c0de0692 <handler_cmd_keygen_dilithium+0x18>
c0de068c:	f000 f99a 	bl	c0de09c4 <OUTLINED_FUNCTION_0>
c0de0690:	e003      	b.n	c0de069a <handler_cmd_keygen_dilithium+0x20>
c0de0692:	4668      	mov	r0, sp
c0de0694:	f000 f99a 	bl	c0de09cc <OUTLINED_FUNCTION_1>
c0de0698:	2000      	movs	r0, #0
c0de069a:	f50d 6d72 	add.w	sp, sp, #3872	@ 0xf20
c0de069e:	bd80      	pop	{r7, pc}

c0de06a0 <handler_cmd_sign_dilithium>:
c0de06a0:	b5b0      	push	{r4, r5, r7, lr}
c0de06a2:	f6ad 7d48 	subw	sp, sp, #3912	@ 0xf48
c0de06a6:	460d      	mov	r5, r1
c0de06a8:	4930      	ldr	r1, [pc, #192]	@ (c0de076c <handler_cmd_sign_dilithium+0xcc>)
c0de06aa:	4604      	mov	r4, r0
c0de06ac:	f60d 7028 	addw	r0, sp, #3880	@ 0xf28
c0de06b0:	2220      	movs	r2, #32
c0de06b2:	4479      	add	r1, pc
c0de06b4:	f00b fbe6 	bl	c0debe84 <__aeabi_memcpy>
c0de06b8:	2d80      	cmp	r5, #128	@ 0x80
c0de06ba:	d013      	beq.n	c0de06e4 <handler_cmd_sign_dilithium+0x44>
c0de06bc:	2d01      	cmp	r5, #1
c0de06be:	d01f      	beq.n	c0de0700 <handler_cmd_sign_dilithium+0x60>
c0de06c0:	bb35      	cbnz	r5, c0de0710 <handler_cmd_sign_dilithium+0x70>
c0de06c2:	f60d 2008 	addw	r0, sp, #2568	@ 0xa08
c0de06c6:	a902      	add	r1, sp, #8
c0de06c8:	f60d 7228 	addw	r2, sp, #3880	@ 0xf28
c0de06cc:	f001 fe1e 	bl	c0de230c <crypto_sign_keypair_core>
c0de06d0:	4604      	mov	r4, r0
c0de06d2:	2800      	cmp	r0, #0
c0de06d4:	d13e      	bne.n	c0de0754 <handler_cmd_sign_dilithium+0xb4>
c0de06d6:	2000      	movs	r0, #0
c0de06d8:	2100      	movs	r1, #0
c0de06da:	f001 fef5 	bl	c0de24c8 <crypto_sign_signature_init>
c0de06de:	f000 f979 	bl	c0de09d4 <OUTLINED_FUNCTION_2>
c0de06e2:	e037      	b.n	c0de0754 <handler_cmd_sign_dilithium+0xb4>
c0de06e4:	f60d 2008 	addw	r0, sp, #2568	@ 0xa08
c0de06e8:	a902      	add	r1, sp, #8
c0de06ea:	f60d 7228 	addw	r2, sp, #3880	@ 0xf28
c0de06ee:	f001 fe0d 	bl	c0de230c <crypto_sign_keypair_core>
c0de06f2:	bb80      	cbnz	r0, c0de0756 <handler_cmd_sign_dilithium+0xb6>
c0de06f4:	6860      	ldr	r0, [r4, #4]
c0de06f6:	2801      	cmp	r0, #1
c0de06f8:	d812      	bhi.n	c0de0720 <handler_cmd_sign_dilithium+0x80>
c0de06fa:	f646 2087 	movw	r0, #27271	@ 0x6a87
c0de06fe:	e02c      	b.n	c0de075a <handler_cmd_sign_dilithium+0xba>
c0de0700:	e9d4 0100 	ldrd	r0, r1, [r4]
c0de0704:	f001 ff0c 	bl	c0de2520 <crypto_sign_signature_absorb>
c0de0708:	bb28      	cbnz	r0, c0de0756 <handler_cmd_sign_dilithium+0xb6>
c0de070a:	f000 f963 	bl	c0de09d4 <OUTLINED_FUNCTION_2>
c0de070e:	e027      	b.n	c0de0760 <handler_cmd_sign_dilithium+0xc0>
c0de0710:	f646 2086 	movw	r0, #27270	@ 0x6a86
c0de0714:	f60d 7d48 	addw	sp, sp, #3912	@ 0xf48
c0de0718:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
c0de071c:	f7ff bf32 	b.w	c0de0584 <io_send_sw>
c0de0720:	3802      	subs	r0, #2
c0de0722:	4d11      	ldr	r5, [pc, #68]	@ (c0de0768 <handler_cmd_sign_dilithium+0xc8>)
c0de0724:	6060      	str	r0, [r4, #4]
c0de0726:	6820      	ldr	r0, [r4, #0]
c0de0728:	3002      	adds	r0, #2
c0de072a:	6020      	str	r0, [r4, #0]
c0de072c:	2000      	movs	r0, #0
c0de072e:	9001      	str	r0, [sp, #4]
c0de0730:	eb09 0005 	add.w	r0, r9, r5
c0de0734:	a901      	add	r1, sp, #4
c0de0736:	aa02      	add	r2, sp, #8
c0de0738:	f500 60fc 	add.w	r0, r0, #2016	@ 0x7e0
c0de073c:	f001 fef8 	bl	c0de2530 <crypto_sign_signature_core>
c0de0740:	4604      	mov	r4, r0
c0de0742:	b938      	cbnz	r0, c0de0754 <handler_cmd_sign_dilithium+0xb4>
c0de0744:	eb09 0005 	add.w	r0, r9, r5
c0de0748:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de074c:	f500 60fc 	add.w	r0, r0, #2016	@ 0x7e0
c0de0750:	f7ff ff0d 	bl	c0de056e <io_send_response_pointer>
c0de0754:	b124      	cbz	r4, c0de0760 <handler_cmd_sign_dilithium+0xc0>
c0de0756:	f24b 0005 	movw	r0, #45061	@ 0xb005
c0de075a:	f7ff ff13 	bl	c0de0584 <io_send_sw>
c0de075e:	e000      	b.n	c0de0762 <handler_cmd_sign_dilithium+0xc2>
c0de0760:	2000      	movs	r0, #0
c0de0762:	f60d 7d48 	addw	sp, sp, #3912	@ 0xf48
c0de0766:	bdb0      	pop	{r4, r5, r7, pc}
c0de0768:	000002d8 	.word	0x000002d8
c0de076c:	0000d56e 	.word	0x0000d56e

c0de0770 <handler_cmd_verify_dilithium>:
c0de0770:	b580      	push	{r7, lr}
c0de0772:	b08e      	sub	sp, #56	@ 0x38
c0de0774:	480d      	ldr	r0, [pc, #52]	@ (c0de07ac <handler_cmd_verify_dilithium+0x3c>)
c0de0776:	2100      	movs	r1, #0
c0de0778:	f640 1395 	movw	r3, #2453	@ 0x995
c0de077c:	e9cd 1100 	strd	r1, r1, [sp]
c0de0780:	4478      	add	r0, pc
c0de0782:	9002      	str	r0, [sp, #8]
c0de0784:	a904      	add	r1, sp, #16
c0de0786:	4a0a      	ldr	r2, [pc, #40]	@ (c0de07b0 <handler_cmd_verify_dilithium+0x40>)
c0de0788:	f10d 0017 	add.w	r0, sp, #23
c0de078c:	447a      	add	r2, pc
c0de078e:	f002 f975 	bl	c0de2a7c <pqcrystals_dilithium2_lowram_open>
c0de0792:	b110      	cbz	r0, c0de079a <handler_cmd_verify_dilithium+0x2a>
c0de0794:	f000 f916 	bl	c0de09c4 <OUTLINED_FUNCTION_0>
c0de0798:	e005      	b.n	c0de07a6 <handler_cmd_verify_dilithium+0x36>
c0de079a:	9904      	ldr	r1, [sp, #16]
c0de079c:	f10d 0017 	add.w	r0, sp, #23
c0de07a0:	f7ff fee5 	bl	c0de056e <io_send_response_pointer>
c0de07a4:	2000      	movs	r0, #0
c0de07a6:	b00e      	add	sp, #56	@ 0x38
c0de07a8:	bd80      	pop	{r7, pc}
c0de07aa:	bf00      	nop
c0de07ac:	0000def5 	.word	0x0000def5
c0de07b0:	0000d554 	.word	0x0000d554

c0de07b4 <handler_cmd_get_sig_chunk>:
c0de07b4:	b580      	push	{r7, lr}
c0de07b6:	4806      	ldr	r0, [pc, #24]	@ (c0de07d0 <handler_cmd_get_sig_chunk+0x1c>)
c0de07b8:	ebc1 2101 	rsb	r1, r1, r1, lsl #8
c0de07bc:	4448      	add	r0, r9
c0de07be:	4408      	add	r0, r1
c0de07c0:	4611      	mov	r1, r2
c0de07c2:	f500 60fc 	add.w	r0, r0, #2016	@ 0x7e0
c0de07c6:	f7ff fed2 	bl	c0de056e <io_send_response_pointer>
c0de07ca:	2000      	movs	r0, #0
c0de07cc:	bd80      	pop	{r7, pc}
c0de07ce:	bf00      	nop
c0de07d0:	000002d8 	.word	0x000002d8

c0de07d4 <handler_cmd_get_pk_chunk>:
c0de07d4:	b580      	push	{r7, lr}
c0de07d6:	4806      	ldr	r0, [pc, #24]	@ (c0de07f0 <handler_cmd_get_pk_chunk+0x1c>)
c0de07d8:	ebc1 2101 	rsb	r1, r1, r1, lsl #8
c0de07dc:	4448      	add	r0, r9
c0de07de:	4408      	add	r0, r1
c0de07e0:	4611      	mov	r1, r2
c0de07e2:	f500 7030 	add.w	r0, r0, #704	@ 0x2c0
c0de07e6:	f7ff fec2 	bl	c0de056e <io_send_response_pointer>
c0de07ea:	2000      	movs	r0, #0
c0de07ec:	bd80      	pop	{r7, pc}
c0de07ee:	bf00      	nop
c0de07f0:	000002d8 	.word	0x000002d8

c0de07f4 <handler_cmd_Poseidon_ithRC>:
c0de07f4:	b570      	push	{r4, r5, r6, lr}
c0de07f6:	b0be      	sub	sp, #248	@ 0xf8
c0de07f8:	ad09      	add	r5, sp, #36	@ 0x24
c0de07fa:	4914      	ldr	r1, [pc, #80]	@ (c0de084c <handler_cmd_Poseidon_ithRC+0x58>)
c0de07fc:	4604      	mov	r4, r0
c0de07fe:	2220      	movs	r2, #32
c0de0800:	4628      	mov	r0, r5
c0de0802:	4479      	add	r1, pc
c0de0804:	f00b fb3e 	bl	c0debe84 <__aeabi_memcpy>
c0de0808:	a811      	add	r0, sp, #68	@ 0x44
c0de080a:	2120      	movs	r1, #32
c0de080c:	462a      	mov	r2, r5
c0de080e:	2320      	movs	r3, #32
c0de0810:	f00b f89a 	bl	c0deb948 <cx_bn_alloc_init>
c0de0814:	9911      	ldr	r1, [sp, #68]	@ 0x44
c0de0816:	ae12      	add	r6, sp, #72	@ 0x48
c0de0818:	4630      	mov	r0, r6
c0de081a:	f00b f925 	bl	c0deba68 <cx_mont_init>
c0de081e:	ad14      	add	r5, sp, #80	@ 0x50
c0de0820:	2105      	movs	r1, #5
c0de0822:	2205      	movs	r2, #5
c0de0824:	4633      	mov	r3, r6
c0de0826:	4628      	mov	r0, r5
c0de0828:	f002 ff7d 	bl	c0de3726 <Poseidon_alloc_init>
c0de082c:	6820      	ldr	r0, [r4, #0]
c0de082e:	466c      	mov	r4, sp
c0de0830:	7806      	ldrb	r6, [r0, #0]
c0de0832:	b12e      	cbz	r6, c0de0840 <handler_cmd_Poseidon_ithRC+0x4c>
c0de0834:	4628      	mov	r0, r5
c0de0836:	4621      	mov	r1, r4
c0de0838:	f002 ff72 	bl	c0de3720 <Poseidon_getNext_RC>
c0de083c:	3e01      	subs	r6, #1
c0de083e:	e7f8      	b.n	c0de0832 <handler_cmd_Poseidon_ithRC+0x3e>
c0de0840:	4668      	mov	r0, sp
c0de0842:	2120      	movs	r1, #32
c0de0844:	f7ff fe93 	bl	c0de056e <io_send_response_pointer>
c0de0848:	b03e      	add	sp, #248	@ 0xf8
c0de084a:	bd70      	pop	{r4, r5, r6, pc}
c0de084c:	0000d4be 	.word	0x0000d4be

c0de0850 <handler_cmd_tEdwards>:
c0de0850:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de0852:	b0ef      	sub	sp, #444	@ 0x1bc
c0de0854:	4605      	mov	r5, r0
c0de0856:	6840      	ldr	r0, [r0, #4]
c0de0858:	2841      	cmp	r0, #65	@ 0x41
c0de085a:	d801      	bhi.n	c0de0860 <handler_cmd_tEdwards+0x10>
c0de085c:	2802      	cmp	r0, #2
c0de085e:	d202      	bcs.n	c0de0866 <handler_cmd_tEdwards+0x16>
c0de0860:	f646 2087 	movw	r0, #27271	@ 0x6a87
c0de0864:	e018      	b.n	c0de0898 <handler_cmd_tEdwards+0x48>
c0de0866:	6828      	ldr	r0, [r5, #0]
c0de0868:	21ff      	movs	r1, #255	@ 0xff
c0de086a:	7806      	ldrb	r6, [r0, #0]
c0de086c:	2000      	movs	r0, #0
c0de086e:	ac2f      	add	r4, sp, #188	@ 0xbc
c0de0870:	f5b0 7f80 	cmp.w	r0, #256	@ 0x100
c0de0874:	d002      	beq.n	c0de087c <handler_cmd_tEdwards+0x2c>
c0de0876:	5421      	strb	r1, [r4, r0]
c0de0878:	3001      	adds	r0, #1
c0de087a:	e7f9      	b.n	c0de0870 <handler_cmd_tEdwards+0x20>
c0de087c:	2020      	movs	r0, #32
c0de087e:	2100      	movs	r1, #0
c0de0880:	f00b f846 	bl	c0deb910 <cx_bn_lock>
c0de0884:	b920      	cbnz	r0, c0de0890 <handler_cmd_tEdwards+0x40>
c0de0886:	a819      	add	r0, sp, #100	@ 0x64
c0de0888:	4631      	mov	r1, r6
c0de088a:	f002 fc1b 	bl	c0de30c4 <tEdwards_Curve_alloc_init>
c0de088e:	b128      	cbz	r0, c0de089c <handler_cmd_tEdwards+0x4c>
c0de0890:	f24b 0005 	movw	r0, #45061	@ 0xb005
c0de0894:	f7ff fe76 	bl	c0de0584 <io_send_sw>
c0de0898:	b06f      	add	sp, #444	@ 0x1bc
c0de089a:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de089c:	2e02      	cmp	r6, #2
c0de089e:	d00c      	beq.n	c0de08ba <handler_cmd_tEdwards+0x6a>
c0de08a0:	2e01      	cmp	r6, #1
c0de08a2:	d128      	bne.n	c0de08f6 <handler_cmd_tEdwards+0xa6>
c0de08a4:	ae0b      	add	r6, sp, #44	@ 0x2c
c0de08a6:	4943      	ldr	r1, [pc, #268]	@ (c0de09b4 <handler_cmd_tEdwards+0x164>)
c0de08a8:	2220      	movs	r2, #32
c0de08aa:	4630      	mov	r0, r6
c0de08ac:	4479      	add	r1, pc
c0de08ae:	f00b fae9 	bl	c0debe84 <__aeabi_memcpy>
c0de08b2:	af03      	add	r7, sp, #12
c0de08b4:	4940      	ldr	r1, [pc, #256]	@ (c0de09b8 <handler_cmd_tEdwards+0x168>)
c0de08b6:	4479      	add	r1, pc
c0de08b8:	e009      	b.n	c0de08ce <handler_cmd_tEdwards+0x7e>
c0de08ba:	ae0b      	add	r6, sp, #44	@ 0x2c
c0de08bc:	493f      	ldr	r1, [pc, #252]	@ (c0de09bc <handler_cmd_tEdwards+0x16c>)
c0de08be:	2220      	movs	r2, #32
c0de08c0:	4630      	mov	r0, r6
c0de08c2:	4479      	add	r1, pc
c0de08c4:	f00b fade 	bl	c0debe84 <__aeabi_memcpy>
c0de08c8:	af03      	add	r7, sp, #12
c0de08ca:	493d      	ldr	r1, [pc, #244]	@ (c0de09c0 <handler_cmd_tEdwards+0x170>)
c0de08cc:	4479      	add	r1, pc
c0de08ce:	4638      	mov	r0, r7
c0de08d0:	2220      	movs	r2, #32
c0de08d2:	f00b fad7 	bl	c0debe84 <__aeabi_memcpy>
c0de08d6:	a819      	add	r0, sp, #100	@ 0x64
c0de08d8:	ab16      	add	r3, sp, #88	@ 0x58
c0de08da:	4631      	mov	r1, r6
c0de08dc:	463a      	mov	r2, r7
c0de08de:	f002 fd97 	bl	c0de3410 <tEdwards_alloc_init>
c0de08e2:	2800      	cmp	r0, #0
c0de08e4:	d1d4      	bne.n	c0de0890 <handler_cmd_tEdwards+0x40>
c0de08e6:	a819      	add	r0, sp, #100	@ 0x64
c0de08e8:	a90b      	add	r1, sp, #44	@ 0x2c
c0de08ea:	aa03      	add	r2, sp, #12
c0de08ec:	ab13      	add	r3, sp, #76	@ 0x4c
c0de08ee:	f002 fd8f 	bl	c0de3410 <tEdwards_alloc_init>
c0de08f2:	2800      	cmp	r0, #0
c0de08f4:	d1cc      	bne.n	c0de0890 <handler_cmd_tEdwards+0x40>
c0de08f6:	2000      	movs	r0, #0
c0de08f8:	f10d 020b 	add.w	r2, sp, #11
c0de08fc:	f88d 000b 	strb.w	r0, [sp, #11]
c0de0900:	a819      	add	r0, sp, #100	@ 0x64
c0de0902:	a916      	add	r1, sp, #88	@ 0x58
c0de0904:	f002 fb87 	bl	c0de3016 <tEdwards_IsOnCurve>
c0de0908:	2800      	cmp	r0, #0
c0de090a:	d1c1      	bne.n	c0de0890 <handler_cmd_tEdwards+0x40>
c0de090c:	f89d 000b 	ldrb.w	r0, [sp, #11]
c0de0910:	2801      	cmp	r0, #1
c0de0912:	d143      	bne.n	c0de099c <handler_cmd_tEdwards+0x14c>
c0de0914:	a819      	add	r0, sp, #100	@ 0x64
c0de0916:	ae13      	add	r6, sp, #76	@ 0x4c
c0de0918:	f10d 020b 	add.w	r2, sp, #11
c0de091c:	4631      	mov	r1, r6
c0de091e:	f002 fb7a 	bl	c0de3016 <tEdwards_IsOnCurve>
c0de0922:	2800      	cmp	r0, #0
c0de0924:	d1b4      	bne.n	c0de0890 <handler_cmd_tEdwards+0x40>
c0de0926:	f89d 000b 	ldrb.w	r0, [sp, #11]
c0de092a:	2801      	cmp	r0, #1
c0de092c:	d139      	bne.n	c0de09a2 <handler_cmd_tEdwards+0x152>
c0de092e:	981a      	ldr	r0, [sp, #104]	@ 0x68
c0de0930:	f10d 010b 	add.w	r1, sp, #11
c0de0934:	f00b f884 	bl	c0deba40 <cx_bn_is_prime>
c0de0938:	2800      	cmp	r0, #0
c0de093a:	d1a9      	bne.n	c0de0890 <handler_cmd_tEdwards+0x40>
c0de093c:	f89d 000b 	ldrb.w	r0, [sp, #11]
c0de0940:	2801      	cmp	r0, #1
c0de0942:	d131      	bne.n	c0de09a8 <handler_cmd_tEdwards+0x158>
c0de0944:	981b      	ldr	r0, [sp, #108]	@ 0x6c
c0de0946:	f10d 010b 	add.w	r1, sp, #11
c0de094a:	f00b f879 	bl	c0deba40 <cx_bn_is_prime>
c0de094e:	2800      	cmp	r0, #0
c0de0950:	d19e      	bne.n	c0de0890 <handler_cmd_tEdwards+0x40>
c0de0952:	f89d 000b 	ldrb.w	r0, [sp, #11]
c0de0956:	2801      	cmp	r0, #1
c0de0958:	d129      	bne.n	c0de09ae <handler_cmd_tEdwards+0x15e>
c0de095a:	e9d5 0100 	ldrd	r0, r1, [r5]
c0de095e:	9600      	str	r6, [sp, #0]
c0de0960:	1c42      	adds	r2, r0, #1
c0de0962:	1e4b      	subs	r3, r1, #1
c0de0964:	a819      	add	r0, sp, #100	@ 0x64
c0de0966:	a916      	add	r1, sp, #88	@ 0x58
c0de0968:	f002 fdd6 	bl	c0de3518 <tEdwards_scalarMul>
c0de096c:	2800      	cmp	r0, #0
c0de096e:	d18f      	bne.n	c0de0890 <handler_cmd_tEdwards+0x40>
c0de0970:	a819      	add	r0, sp, #100	@ 0x64
c0de0972:	f104 0320 	add.w	r3, r4, #32
c0de0976:	a913      	add	r1, sp, #76	@ 0x4c
c0de0978:	4622      	mov	r2, r4
c0de097a:	f002 fce3 	bl	c0de3344 <tEdwards_export>
c0de097e:	2800      	cmp	r0, #0
c0de0980:	f47f af86 	bne.w	c0de0890 <handler_cmd_tEdwards+0x40>
c0de0984:	f00a ffce 	bl	c0deb924 <cx_bn_unlock>
c0de0988:	2800      	cmp	r0, #0
c0de098a:	f47f af81 	bne.w	c0de0890 <handler_cmd_tEdwards+0x40>
c0de098e:	9819      	ldr	r0, [sp, #100]	@ 0x64
c0de0990:	0041      	lsls	r1, r0, #1
c0de0992:	a82f      	add	r0, sp, #188	@ 0xbc
c0de0994:	f7ff fdeb 	bl	c0de056e <io_send_response_pointer>
c0de0998:	2000      	movs	r0, #0
c0de099a:	e77d      	b.n	c0de0898 <handler_cmd_tEdwards+0x48>
c0de099c:	f64c 2001 	movw	r0, #51713	@ 0xca01
c0de09a0:	e778      	b.n	c0de0894 <handler_cmd_tEdwards+0x44>
c0de09a2:	f64c 2002 	movw	r0, #51714	@ 0xca02
c0de09a6:	e775      	b.n	c0de0894 <handler_cmd_tEdwards+0x44>
c0de09a8:	f64c 2003 	movw	r0, #51715	@ 0xca03
c0de09ac:	e772      	b.n	c0de0894 <handler_cmd_tEdwards+0x44>
c0de09ae:	f64c 2004 	movw	r0, #51716	@ 0xca04
c0de09b2:	e76f      	b.n	c0de0894 <handler_cmd_tEdwards+0x44>
c0de09b4:	0000d2d4 	.word	0x0000d2d4
c0de09b8:	0000d34a 	.word	0x0000d34a
c0de09bc:	0000d2de 	.word	0x0000d2de
c0de09c0:	0000d294 	.word	0x0000d294

c0de09c4 <OUTLINED_FUNCTION_0>:
c0de09c4:	f24b 0005 	movw	r0, #45061	@ 0xb005
c0de09c8:	f7ff bddc 	b.w	c0de0584 <io_send_sw>

c0de09cc <OUTLINED_FUNCTION_1>:
c0de09cc:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de09d0:	f7ff bdcd 	b.w	c0de056e <io_send_response_pointer>

c0de09d4 <OUTLINED_FUNCTION_2>:
c0de09d4:	f44f 4010 	mov.w	r0, #36864	@ 0x9000
c0de09d8:	f7ff bdd4 	b.w	c0de0584 <io_send_sw>

c0de09dc <helper_send_response_pubkey>:
c0de09dc:	b5b0      	push	{r4, r5, r7, lr}
c0de09de:	b09a      	sub	sp, #104	@ 0x68
c0de09e0:	2041      	movs	r0, #65	@ 0x41
c0de09e2:	f10d 0405 	add.w	r4, sp, #5
c0de09e6:	2241      	movs	r2, #65	@ 0x41
c0de09e8:	f88d 0005 	strb.w	r0, [sp, #5]
c0de09ec:	480b      	ldr	r0, [pc, #44]	@ (c0de0a1c <helper_send_response_pubkey+0x40>)
c0de09ee:	eb09 0500 	add.w	r5, r9, r0
c0de09f2:	1c60      	adds	r0, r4, #1
c0de09f4:	f105 0108 	add.w	r1, r5, #8
c0de09f8:	f00b fa44 	bl	c0debe84 <__aeabi_memcpy>
c0de09fc:	2020      	movs	r0, #32
c0de09fe:	f105 0149 	add.w	r1, r5, #73	@ 0x49
c0de0a02:	2220      	movs	r2, #32
c0de0a04:	f88d 0047 	strb.w	r0, [sp, #71]	@ 0x47
c0de0a08:	f104 0043 	add.w	r0, r4, #67	@ 0x43
c0de0a0c:	f00b fa3a 	bl	c0debe84 <__aeabi_memcpy>
c0de0a10:	4620      	mov	r0, r4
c0de0a12:	2163      	movs	r1, #99	@ 0x63
c0de0a14:	f000 f804 	bl	c0de0a20 <io_send_response_pointer>
c0de0a18:	b01a      	add	sp, #104	@ 0x68
c0de0a1a:	bdb0      	pop	{r4, r5, r7, pc}
c0de0a1c:	00000000 	.word	0x00000000

c0de0a20 <io_send_response_pointer>:
c0de0a20:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de0a22:	2200      	movs	r2, #0
c0de0a24:	ab01      	add	r3, sp, #4
c0de0a26:	c307      	stmia	r3!, {r0, r1, r2}
c0de0a28:	a801      	add	r0, sp, #4
c0de0a2a:	2101      	movs	r1, #1
c0de0a2c:	f44f 4210 	mov.w	r2, #36864	@ 0x9000
c0de0a30:	f00a fb18 	bl	c0deb064 <io_send_response_buffers>
c0de0a34:	b004      	add	sp, #16
c0de0a36:	bd80      	pop	{r7, pc}

c0de0a38 <helper_send_response_sig>:
c0de0a38:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de0a3a:	b093      	sub	sp, #76	@ 0x4c
c0de0a3c:	f10d 0402 	add.w	r4, sp, #2
c0de0a40:	2149      	movs	r1, #73	@ 0x49
c0de0a42:	1c65      	adds	r5, r4, #1
c0de0a44:	4628      	mov	r0, r5
c0de0a46:	f00b fa27 	bl	c0debe98 <__aeabi_memclr>
c0de0a4a:	480b      	ldr	r0, [pc, #44]	@ (c0de0a78 <helper_send_response_sig+0x40>)
c0de0a4c:	eb09 0700 	add.w	r7, r9, r0
c0de0a50:	4628      	mov	r0, r5
c0de0a52:	f897 62a0 	ldrb.w	r6, [r7, #672]	@ 0x2a0
c0de0a56:	f507 7116 	add.w	r1, r7, #600	@ 0x258
c0de0a5a:	4632      	mov	r2, r6
c0de0a5c:	f88d 6002 	strb.w	r6, [sp, #2]
c0de0a60:	f00b fa10 	bl	c0debe84 <__aeabi_memcpy>
c0de0a64:	f897 12a1 	ldrb.w	r1, [r7, #673]	@ 0x2a1
c0de0a68:	1930      	adds	r0, r6, r4
c0de0a6a:	7041      	strb	r1, [r0, #1]
c0de0a6c:	1cb1      	adds	r1, r6, #2
c0de0a6e:	4620      	mov	r0, r4
c0de0a70:	f7ff ffd6 	bl	c0de0a20 <io_send_response_pointer>
c0de0a74:	b013      	add	sp, #76	@ 0x4c
c0de0a76:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de0a78:	00000000 	.word	0x00000000

c0de0a7c <transaction_deserialize>:
c0de0a7c:	b570      	push	{r4, r5, r6, lr}
c0de0a7e:	460d      	mov	r5, r1
c0de0a80:	4604      	mov	r4, r0
c0de0a82:	b910      	cbnz	r0, c0de0a8a <transaction_deserialize+0xe>
c0de0a84:	2001      	movs	r0, #1
c0de0a86:	f00a fcdf 	bl	c0deb448 <assert_exit>
c0de0a8a:	b915      	cbnz	r5, c0de0a92 <transaction_deserialize+0x16>
c0de0a8c:	2001      	movs	r0, #1
c0de0a8e:	f00a fcdb 	bl	c0deb448 <assert_exit>
c0de0a92:	6860      	ldr	r0, [r4, #4]
c0de0a94:	f5b0 7fff 	cmp.w	r0, #510	@ 0x1fe
c0de0a98:	d901      	bls.n	c0de0a9e <transaction_deserialize+0x22>
c0de0a9a:	20f9      	movs	r0, #249	@ 0xf9
c0de0a9c:	e04b      	b.n	c0de0b36 <transaction_deserialize+0xba>
c0de0a9e:	4620      	mov	r0, r4
c0de0aa0:	4629      	mov	r1, r5
c0de0aa2:	2200      	movs	r2, #0
c0de0aa4:	f00a f8a0 	bl	c0deabe8 <buffer_read_u64>
c0de0aa8:	b330      	cbz	r0, c0de0af8 <transaction_deserialize+0x7c>
c0de0aaa:	6820      	ldr	r0, [r4, #0]
c0de0aac:	68a1      	ldr	r1, [r4, #8]
c0de0aae:	4408      	add	r0, r1
c0de0ab0:	2114      	movs	r1, #20
c0de0ab2:	61a8      	str	r0, [r5, #24]
c0de0ab4:	4620      	mov	r0, r4
c0de0ab6:	f00a f876 	bl	c0deaba6 <buffer_seek_cur>
c0de0aba:	b1f8      	cbz	r0, c0de0afc <transaction_deserialize+0x80>
c0de0abc:	f105 0108 	add.w	r1, r5, #8
c0de0ac0:	4620      	mov	r0, r4
c0de0ac2:	2200      	movs	r2, #0
c0de0ac4:	2600      	movs	r6, #0
c0de0ac6:	f00a f88f 	bl	c0deabe8 <buffer_read_u64>
c0de0aca:	b1c8      	cbz	r0, c0de0b00 <transaction_deserialize+0x84>
c0de0acc:	f105 0120 	add.w	r1, r5, #32
c0de0ad0:	4620      	mov	r0, r4
c0de0ad2:	e9c5 6604 	strd	r6, r6, [r5, #16]
c0de0ad6:	f00a f8a7 	bl	c0deac28 <buffer_read_varint>
c0de0ada:	6a29      	ldr	r1, [r5, #32]
c0de0adc:	b990      	cbnz	r0, c0de0b04 <transaction_deserialize+0x88>
c0de0ade:	6a68      	ldr	r0, [r5, #36]	@ 0x24
c0de0ae0:	ea5f 0050 	movs.w	r0, r0, lsr #1
c0de0ae4:	ea4f 0231 	mov.w	r2, r1, rrx
c0de0ae8:	2300      	movs	r3, #0
c0de0aea:	f1d2 02e8 	rsbs	r2, r2, #232	@ 0xe8
c0de0aee:	eb73 0000 	sbcs.w	r0, r3, r0
c0de0af2:	d207      	bcs.n	c0de0b04 <transaction_deserialize+0x88>
c0de0af4:	20fc      	movs	r0, #252	@ 0xfc
c0de0af6:	e01e      	b.n	c0de0b36 <transaction_deserialize+0xba>
c0de0af8:	20ff      	movs	r0, #255	@ 0xff
c0de0afa:	e01c      	b.n	c0de0b36 <transaction_deserialize+0xba>
c0de0afc:	20fe      	movs	r0, #254	@ 0xfe
c0de0afe:	e01a      	b.n	c0de0b36 <transaction_deserialize+0xba>
c0de0b00:	20fd      	movs	r0, #253	@ 0xfd
c0de0b02:	e018      	b.n	c0de0b36 <transaction_deserialize+0xba>
c0de0b04:	6820      	ldr	r0, [r4, #0]
c0de0b06:	68a2      	ldr	r2, [r4, #8]
c0de0b08:	4410      	add	r0, r2
c0de0b0a:	61e8      	str	r0, [r5, #28]
c0de0b0c:	4620      	mov	r0, r4
c0de0b0e:	f00a f84a 	bl	c0deaba6 <buffer_seek_cur>
c0de0b12:	b168      	cbz	r0, c0de0b30 <transaction_deserialize+0xb4>
c0de0b14:	f105 031c 	add.w	r3, r5, #28
c0de0b18:	cb0d      	ldmia	r3, {r0, r2, r3}
c0de0b1a:	f000 f80e 	bl	c0de0b3a <transaction_utils_check_encoding>
c0de0b1e:	b148      	cbz	r0, c0de0b34 <transaction_deserialize+0xb8>
c0de0b20:	e9d4 1201 	ldrd	r1, r2, [r4, #4]
c0de0b24:	f06f 0006 	mvn.w	r0, #6
c0de0b28:	428a      	cmp	r2, r1
c0de0b2a:	bf08      	it	eq
c0de0b2c:	2001      	moveq	r0, #1
c0de0b2e:	e002      	b.n	c0de0b36 <transaction_deserialize+0xba>
c0de0b30:	20fb      	movs	r0, #251	@ 0xfb
c0de0b32:	e000      	b.n	c0de0b36 <transaction_deserialize+0xba>
c0de0b34:	20fa      	movs	r0, #250	@ 0xfa
c0de0b36:	b240      	sxtb	r0, r0
c0de0b38:	bd70      	pop	{r4, r5, r6, pc}

c0de0b3a <transaction_utils_check_encoding>:
c0de0b3a:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de0b3c:	461c      	mov	r4, r3
c0de0b3e:	4615      	mov	r5, r2
c0de0b40:	4606      	mov	r6, r0
c0de0b42:	b910      	cbnz	r0, c0de0b4a <transaction_utils_check_encoding+0x10>
c0de0b44:	2001      	movs	r0, #1
c0de0b46:	f00a fc7f 	bl	c0deb448 <assert_exit>
c0de0b4a:	2000      	movs	r0, #0
c0de0b4c:	2300      	movs	r3, #0
c0de0b4e:	4602      	mov	r2, r0
c0de0b50:	1b40      	subs	r0, r0, r5
c0de0b52:	4619      	mov	r1, r3
c0de0b54:	eb73 0004 	sbcs.w	r0, r3, r4
c0de0b58:	d206      	bcs.n	c0de0b68 <transaction_utils_check_encoding+0x2e>
c0de0b5a:	56b7      	ldrsb	r7, [r6, r2]
c0de0b5c:	1c50      	adds	r0, r2, #1
c0de0b5e:	f141 0300 	adc.w	r3, r1, #0
c0de0b62:	f1b7 3fff 	cmp.w	r7, #4294967295	@ 0xffffffff
c0de0b66:	dcf2      	bgt.n	c0de0b4e <transaction_utils_check_encoding+0x14>
c0de0b68:	2000      	movs	r0, #0
c0de0b6a:	1b52      	subs	r2, r2, r5
c0de0b6c:	41a1      	sbcs	r1, r4
c0de0b6e:	bf28      	it	cs
c0de0b70:	2001      	movcs	r0, #1
c0de0b72:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}

c0de0b74 <validate_pubkey>:
c0de0b74:	b108      	cbz	r0, c0de0b7a <validate_pubkey+0x6>
c0de0b76:	f7ff bf31 	b.w	c0de09dc <helper_send_response_pubkey>
c0de0b7a:	f646 1085 	movw	r0, #27013	@ 0x6985
c0de0b7e:	f000 b800 	b.w	c0de0b82 <io_send_sw>

c0de0b82 <io_send_sw>:
c0de0b82:	b580      	push	{r7, lr}
c0de0b84:	4602      	mov	r2, r0
c0de0b86:	2000      	movs	r0, #0
c0de0b88:	2100      	movs	r1, #0
c0de0b8a:	f00a fa6b 	bl	c0deb064 <io_send_response_buffers>
c0de0b8e:	bd80      	pop	{r7, pc}

c0de0b90 <validate_transaction>:
c0de0b90:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de0b94:	b08c      	sub	sp, #48	@ 0x30
c0de0b96:	b378      	cbz	r0, c0de0bf8 <validate_transaction+0x68>
c0de0b98:	f8df 8094 	ldr.w	r8, [pc, #148]	@ c0de0c30 <validate_transaction+0xa0>
c0de0b9c:	2002      	movs	r0, #2
c0de0b9e:	2500      	movs	r5, #0
c0de0ba0:	2720      	movs	r7, #32
c0de0ba2:	2203      	movs	r2, #3
c0de0ba4:	f240 6401 	movw	r4, #1537	@ 0x601
c0de0ba8:	f10d 0c2c 	add.w	ip, sp, #44	@ 0x2c
c0de0bac:	f10d 0e28 	add.w	lr, sp, #40	@ 0x28
c0de0bb0:	950b      	str	r5, [sp, #44]	@ 0x2c
c0de0bb2:	f809 0008 	strb.w	r0, [r9, r8]
c0de0bb6:	2048      	movs	r0, #72	@ 0x48
c0de0bb8:	900a      	str	r0, [sp, #40]	@ 0x28
c0de0bba:	eb09 0008 	add.w	r0, r9, r8
c0de0bbe:	f890 32d4 	ldrb.w	r3, [r0, #724]	@ 0x2d4
c0de0bc2:	f500 710e 	add.w	r1, r0, #568	@ 0x238
c0de0bc6:	f500 7616 	add.w	r6, r0, #600	@ 0x258
c0de0bca:	e9cd 4200 	strd	r4, r2, [sp]
c0de0bce:	f500 722b 	add.w	r2, r0, #684	@ 0x2ac
c0de0bd2:	2000      	movs	r0, #0
c0de0bd4:	9508      	str	r5, [sp, #32]
c0de0bd6:	e9cd c506 	strd	ip, r5, [sp, #24]
c0de0bda:	e9cd 1702 	strd	r1, r7, [sp, #8]
c0de0bde:	2121      	movs	r1, #33	@ 0x21
c0de0be0:	e9cd 6e04 	strd	r6, lr, [sp, #16]
c0de0be4:	f00a f932 	bl	c0deae4c <bip32_derive_with_seed_ecdsa_sign_hash_256>
c0de0be8:	b188      	cbz	r0, c0de0c0e <validate_transaction+0x7e>
c0de0bea:	f24b 0008 	movw	r0, #45064	@ 0xb008
c0de0bee:	f809 5008 	strb.w	r5, [r9, r8]
c0de0bf2:	f7ff ffc6 	bl	c0de0b82 <io_send_sw>
c0de0bf6:	e017      	b.n	c0de0c28 <validate_transaction+0x98>
c0de0bf8:	480d      	ldr	r0, [pc, #52]	@ (c0de0c30 <validate_transaction+0xa0>)
c0de0bfa:	2100      	movs	r1, #0
c0de0bfc:	f809 1000 	strb.w	r1, [r9, r0]
c0de0c00:	f646 1085 	movw	r0, #27013	@ 0x6985
c0de0c04:	b00c      	add	sp, #48	@ 0x30
c0de0c06:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de0c0a:	f7ff bfba 	b.w	c0de0b82 <io_send_sw>
c0de0c0e:	990a      	ldr	r1, [sp, #40]	@ 0x28
c0de0c10:	eb09 0008 	add.w	r0, r9, r8
c0de0c14:	f880 12a0 	strb.w	r1, [r0, #672]	@ 0x2a0
c0de0c18:	f89d 102c 	ldrb.w	r1, [sp, #44]	@ 0x2c
c0de0c1c:	f001 0101 	and.w	r1, r1, #1
c0de0c20:	f880 12a1 	strb.w	r1, [r0, #673]	@ 0x2a1
c0de0c24:	f7ff ff08 	bl	c0de0a38 <helper_send_response_sig>
c0de0c28:	b00c      	add	sp, #48	@ 0x30
c0de0c2a:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de0c2e:	bf00      	nop
c0de0c30:	00000000 	.word	0x00000000

c0de0c34 <app_quit>:
c0de0c34:	20ff      	movs	r0, #255	@ 0xff
c0de0c36:	f00a ffbb 	bl	c0debbb0 <os_sched_exit>
	...

c0de0c3c <ui_menu_main>:
c0de0c3c:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
c0de0c3e:	4c1b      	ldr	r4, [pc, #108]	@ (c0de0cac <ui_menu_main+0x70>)
c0de0c40:	4819      	ldr	r0, [pc, #100]	@ (c0de0ca8 <ui_menu_main+0x6c>)
c0de0c42:	447c      	add	r4, pc
c0de0c44:	eb09 0500 	add.w	r5, r9, r0
c0de0c48:	f000 f8dc 	bl	c0de0e04 <OUTLINED_FUNCTION_0>
c0de0c4c:	2609      	movs	r6, #9
c0de0c4e:	2114      	movs	r1, #20
c0de0c50:	73ae      	strb	r6, [r5, #14]
c0de0c52:	7369      	strb	r1, [r5, #13]
c0de0c54:	4916      	ldr	r1, [pc, #88]	@ (c0de0cb0 <ui_menu_main+0x74>)
c0de0c56:	4a17      	ldr	r2, [pc, #92]	@ (c0de0cb4 <ui_menu_main+0x78>)
c0de0c58:	4479      	add	r1, pc
c0de0c5a:	447a      	add	r2, pc
c0de0c5c:	e9c5 2101 	strd	r2, r1, [r5, #4]
c0de0c60:	7800      	ldrb	r0, [r0, #0]
c0de0c62:	7328      	strb	r0, [r5, #12]
c0de0c64:	f000 f8ce 	bl	c0de0e04 <OUTLINED_FUNCTION_0>
c0de0c68:	2115      	movs	r1, #21
c0de0c6a:	76ae      	strb	r6, [r5, #26]
c0de0c6c:	7669      	strb	r1, [r5, #25]
c0de0c6e:	4912      	ldr	r1, [pc, #72]	@ (c0de0cb8 <ui_menu_main+0x7c>)
c0de0c70:	4a12      	ldr	r2, [pc, #72]	@ (c0de0cbc <ui_menu_main+0x80>)
c0de0c72:	4479      	add	r1, pc
c0de0c74:	447a      	add	r2, pc
c0de0c76:	e9c5 2104 	strd	r2, r1, [r5, #16]
c0de0c7a:	2100      	movs	r1, #0
c0de0c7c:	7840      	ldrb	r0, [r0, #1]
c0de0c7e:	7628      	strb	r0, [r5, #24]
c0de0c80:	480f      	ldr	r0, [pc, #60]	@ (c0de0cc0 <ui_menu_main+0x84>)
c0de0c82:	4a10      	ldr	r2, [pc, #64]	@ (c0de0cc4 <ui_menu_main+0x88>)
c0de0c84:	4b10      	ldr	r3, [pc, #64]	@ (c0de0cc8 <ui_menu_main+0x8c>)
c0de0c86:	4478      	add	r0, pc
c0de0c88:	447a      	add	r2, pc
c0de0c8a:	447b      	add	r3, pc
c0de0c8c:	e9cd 3200 	strd	r3, r2, [sp]
c0de0c90:	e9cd 1002 	strd	r1, r0, [sp, #8]
c0de0c94:	2200      	movs	r2, #0
c0de0c96:	23ff      	movs	r3, #255	@ 0xff
c0de0c98:	480c      	ldr	r0, [pc, #48]	@ (c0de0ccc <ui_menu_main+0x90>)
c0de0c9a:	490d      	ldr	r1, [pc, #52]	@ (c0de0cd0 <ui_menu_main+0x94>)
c0de0c9c:	4478      	add	r0, pc
c0de0c9e:	4479      	add	r1, pc
c0de0ca0:	f008 f8cc 	bl	c0de8e3c <nbgl_useCaseHomeAndSettings>
c0de0ca4:	bd7f      	pop	{r0, r1, r2, r3, r4, r5, r6, pc}
c0de0ca6:	bf00      	nop
c0de0ca8:	00001430 	.word	0x00001430
c0de0cac:	0000e7ba 	.word	0x0000e7ba
c0de0cb0:	0000c78d 	.word	0x0000c78d
c0de0cb4:	0000ccfe 	.word	0x0000ccfe
c0de0cb8:	0000c904 	.word	0x0000c904
c0de0cbc:	0000c535 	.word	0x0000c535
c0de0cc0:	ffffffab 	.word	0xffffffab
c0de0cc4:	0000df1c 	.word	0x0000df1c
c0de0cc8:	0000df0e 	.word	0x0000df0e
c0de0ccc:	0000cd3d 	.word	0x0000cd3d
c0de0cd0:	0000b3bf 	.word	0x0000b3bf

c0de0cd4 <controls_callback>:
c0de0cd4:	b5bf      	push	{r0, r1, r2, r3, r4, r5, r7, lr}
c0de0cd6:	4c22      	ldr	r4, [pc, #136]	@ (c0de0d60 <controls_callback+0x8c>)
c0de0cd8:	2815      	cmp	r0, #21
c0de0cda:	f809 2004 	strb.w	r2, [r9, r4]
c0de0cde:	d011      	beq.n	c0de0d04 <controls_callback+0x30>
c0de0ce0:	2814      	cmp	r0, #20
c0de0ce2:	d12a      	bne.n	c0de0d3a <controls_callback+0x66>
c0de0ce4:	eb09 0504 	add.w	r5, r9, r4
c0de0ce8:	4c1e      	ldr	r4, [pc, #120]	@ (c0de0d64 <controls_callback+0x90>)
c0de0cea:	447c      	add	r4, pc
c0de0cec:	f000 f88a 	bl	c0de0e04 <OUTLINED_FUNCTION_0>
c0de0cf0:	7800      	ldrb	r0, [r0, #0]
c0de0cf2:	fab0 f080 	clz	r0, r0
c0de0cf6:	0940      	lsrs	r0, r0, #5
c0de0cf8:	7328      	strb	r0, [r5, #12]
c0de0cfa:	f88d 000f 	strb.w	r0, [sp, #15]
c0de0cfe:	f000 f881 	bl	c0de0e04 <OUTLINED_FUNCTION_0>
c0de0d02:	e015      	b.n	c0de0d30 <controls_callback+0x5c>
c0de0d04:	4818      	ldr	r0, [pc, #96]	@ (c0de0d68 <controls_callback+0x94>)
c0de0d06:	4478      	add	r0, pc
c0de0d08:	f00a fdbe 	bl	c0deb888 <pic>
c0de0d0c:	7840      	ldrb	r0, [r0, #1]
c0de0d0e:	b1a8      	cbz	r0, c0de0d3c <controls_callback+0x68>
c0de0d10:	eb09 0504 	add.w	r5, r9, r4
c0de0d14:	4c15      	ldr	r4, [pc, #84]	@ (c0de0d6c <controls_callback+0x98>)
c0de0d16:	447c      	add	r4, pc
c0de0d18:	f000 f874 	bl	c0de0e04 <OUTLINED_FUNCTION_0>
c0de0d1c:	7840      	ldrb	r0, [r0, #1]
c0de0d1e:	fab0 f080 	clz	r0, r0
c0de0d22:	0940      	lsrs	r0, r0, #5
c0de0d24:	7628      	strb	r0, [r5, #24]
c0de0d26:	f88d 000f 	strb.w	r0, [sp, #15]
c0de0d2a:	f000 f86b 	bl	c0de0e04 <OUTLINED_FUNCTION_0>
c0de0d2e:	3001      	adds	r0, #1
c0de0d30:	f10d 010f 	add.w	r1, sp, #15
c0de0d34:	2201      	movs	r2, #1
c0de0d36:	f00a fde1 	bl	c0deb8fc <nvm_write>
c0de0d3a:	bdbf      	pop	{r0, r1, r2, r3, r4, r5, r7, pc}
c0de0d3c:	480c      	ldr	r0, [pc, #48]	@ (c0de0d70 <controls_callback+0x9c>)
c0de0d3e:	490d      	ldr	r1, [pc, #52]	@ (c0de0d74 <controls_callback+0xa0>)
c0de0d40:	4478      	add	r0, pc
c0de0d42:	4479      	add	r1, pc
c0de0d44:	e9cd 1000 	strd	r1, r0, [sp]
c0de0d48:	480b      	ldr	r0, [pc, #44]	@ (c0de0d78 <controls_callback+0xa4>)
c0de0d4a:	490c      	ldr	r1, [pc, #48]	@ (c0de0d7c <controls_callback+0xa8>)
c0de0d4c:	4a0c      	ldr	r2, [pc, #48]	@ (c0de0d80 <controls_callback+0xac>)
c0de0d4e:	4b0d      	ldr	r3, [pc, #52]	@ (c0de0d84 <controls_callback+0xb0>)
c0de0d50:	4478      	add	r0, pc
c0de0d52:	4479      	add	r1, pc
c0de0d54:	447a      	add	r2, pc
c0de0d56:	447b      	add	r3, pc
c0de0d58:	f008 fb52 	bl	c0de9400 <nbgl_useCaseChoice>
c0de0d5c:	bdbf      	pop	{r0, r1, r2, r3, r4, r5, r7, pc}
c0de0d5e:	bf00      	nop
c0de0d60:	00001430 	.word	0x00001430
c0de0d64:	0000e712 	.word	0x0000e712
c0de0d68:	0000e6f6 	.word	0x0000e6f6
c0de0d6c:	0000e6e6 	.word	0x0000e6e6
c0de0d70:	00000045 	.word	0x00000045
c0de0d74:	0000c893 	.word	0x0000c893
c0de0d78:	0000bb11 	.word	0x0000bb11
c0de0d7c:	0000c457 	.word	0x0000c457
c0de0d80:	0000c602 	.word	0x0000c602
c0de0d84:	0000cc0a 	.word	0x0000cc0a

c0de0d88 <review_warning_choice>:
c0de0d88:	b5b0      	push	{r4, r5, r7, lr}
c0de0d8a:	b086      	sub	sp, #24
c0de0d8c:	b1a8      	cbz	r0, c0de0dba <review_warning_choice+0x32>
c0de0d8e:	4c17      	ldr	r4, [pc, #92]	@ (c0de0dec <review_warning_choice+0x64>)
c0de0d90:	4815      	ldr	r0, [pc, #84]	@ (c0de0de8 <review_warning_choice+0x60>)
c0de0d92:	447c      	add	r4, pc
c0de0d94:	eb09 0500 	add.w	r5, r9, r0
c0de0d98:	f000 f834 	bl	c0de0e04 <OUTLINED_FUNCTION_0>
c0de0d9c:	7840      	ldrb	r0, [r0, #1]
c0de0d9e:	fab0 f080 	clz	r0, r0
c0de0da2:	0940      	lsrs	r0, r0, #5
c0de0da4:	7628      	strb	r0, [r5, #24]
c0de0da6:	f88d 0017 	strb.w	r0, [sp, #23]
c0de0daa:	f000 f82b 	bl	c0de0e04 <OUTLINED_FUNCTION_0>
c0de0dae:	3001      	adds	r0, #1
c0de0db0:	f10d 0117 	add.w	r1, sp, #23
c0de0db4:	2201      	movs	r2, #1
c0de0db6:	f00a fda1 	bl	c0deb8fc <nvm_write>
c0de0dba:	480b      	ldr	r0, [pc, #44]	@ (c0de0de8 <review_warning_choice+0x60>)
c0de0dbc:	2100      	movs	r1, #0
c0de0dbe:	f819 3000 	ldrb.w	r3, [r9, r0]
c0de0dc2:	480b      	ldr	r0, [pc, #44]	@ (c0de0df0 <review_warning_choice+0x68>)
c0de0dc4:	4a0b      	ldr	r2, [pc, #44]	@ (c0de0df4 <review_warning_choice+0x6c>)
c0de0dc6:	4c0c      	ldr	r4, [pc, #48]	@ (c0de0df8 <review_warning_choice+0x70>)
c0de0dc8:	4478      	add	r0, pc
c0de0dca:	447a      	add	r2, pc
c0de0dcc:	447c      	add	r4, pc
c0de0dce:	e9cd 4200 	strd	r4, r2, [sp]
c0de0dd2:	e9cd 1002 	strd	r1, r0, [sp, #8]
c0de0dd6:	2200      	movs	r2, #0
c0de0dd8:	4808      	ldr	r0, [pc, #32]	@ (c0de0dfc <review_warning_choice+0x74>)
c0de0dda:	4909      	ldr	r1, [pc, #36]	@ (c0de0e00 <review_warning_choice+0x78>)
c0de0ddc:	4478      	add	r0, pc
c0de0dde:	4479      	add	r1, pc
c0de0de0:	f008 f82c 	bl	c0de8e3c <nbgl_useCaseHomeAndSettings>
c0de0de4:	b006      	add	sp, #24
c0de0de6:	bdb0      	pop	{r4, r5, r7, pc}
c0de0de8:	00001430 	.word	0x00001430
c0de0dec:	0000e66a 	.word	0x0000e66a
c0de0df0:	fffffe69 	.word	0xfffffe69
c0de0df4:	0000ddda 	.word	0x0000ddda
c0de0df8:	0000ddcc 	.word	0x0000ddcc
c0de0dfc:	0000cbfd 	.word	0x0000cbfd
c0de0e00:	0000b27f 	.word	0x0000b27f

c0de0e04 <OUTLINED_FUNCTION_0>:
c0de0e04:	4620      	mov	r0, r4
c0de0e06:	f00a bd3f 	b.w	c0deb888 <pic>
	...

c0de0e0c <ui_display_address>:
c0de0e0c:	b570      	push	{r4, r5, r6, lr}
c0de0e0e:	b088      	sub	sp, #32
c0de0e10:	4e22      	ldr	r6, [pc, #136]	@ (c0de0e9c <ui_display_address+0x90>)
c0de0e12:	eb09 0106 	add.w	r1, r9, r6
c0de0e16:	f819 0006 	ldrb.w	r0, [r9, r6]
c0de0e1a:	f891 12a8 	ldrb.w	r1, [r1, #680]	@ 0x2a8
c0de0e1e:	4308      	orrs	r0, r1
c0de0e20:	d12a      	bne.n	c0de0e78 <ui_display_address+0x6c>
c0de0e22:	4d1f      	ldr	r5, [pc, #124]	@ (c0de0ea0 <ui_display_address+0x94>)
c0de0e24:	212b      	movs	r1, #43	@ 0x2b
c0de0e26:	eb09 0005 	add.w	r0, r9, r5
c0de0e2a:	f00b f835 	bl	c0debe98 <__aeabi_memclr>
c0de0e2e:	ac03      	add	r4, sp, #12
c0de0e30:	2114      	movs	r1, #20
c0de0e32:	4620      	mov	r0, r4
c0de0e34:	f00b f830 	bl	c0debe98 <__aeabi_memclr>
c0de0e38:	eb09 0006 	add.w	r0, r9, r6
c0de0e3c:	4621      	mov	r1, r4
c0de0e3e:	2214      	movs	r2, #20
c0de0e40:	3008      	adds	r0, #8
c0de0e42:	f7ff f8e7 	bl	c0de0014 <address_from_pubkey>
c0de0e46:	b308      	cbz	r0, c0de0e8c <ui_display_address+0x80>
c0de0e48:	eb09 0205 	add.w	r2, r9, r5
c0de0e4c:	a803      	add	r0, sp, #12
c0de0e4e:	2114      	movs	r1, #20
c0de0e50:	232b      	movs	r3, #43	@ 0x2b
c0de0e52:	f00a f8a5 	bl	c0deafa0 <format_hex>
c0de0e56:	3001      	adds	r0, #1
c0de0e58:	d018      	beq.n	c0de0e8c <ui_display_address+0x80>
c0de0e5a:	4812      	ldr	r0, [pc, #72]	@ (c0de0ea4 <ui_display_address+0x98>)
c0de0e5c:	2400      	movs	r4, #0
c0de0e5e:	2100      	movs	r1, #0
c0de0e60:	4478      	add	r0, pc
c0de0e62:	e9cd 4000 	strd	r4, r0, [sp]
c0de0e66:	eb09 0005 	add.w	r0, r9, r5
c0de0e6a:	4a0f      	ldr	r2, [pc, #60]	@ (c0de0ea8 <ui_display_address+0x9c>)
c0de0e6c:	4b0f      	ldr	r3, [pc, #60]	@ (c0de0eac <ui_display_address+0xa0>)
c0de0e6e:	447a      	add	r2, pc
c0de0e70:	447b      	add	r3, pc
c0de0e72:	f008 ff3f 	bl	c0de9cf4 <nbgl_useCaseAddressReview>
c0de0e76:	e00e      	b.n	c0de0e96 <ui_display_address+0x8a>
c0de0e78:	2000      	movs	r0, #0
c0de0e7a:	f809 0006 	strb.w	r0, [r9, r6]
c0de0e7e:	f24b 0007 	movw	r0, #45063	@ 0xb007
c0de0e82:	b008      	add	sp, #32
c0de0e84:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de0e88:	f000 b812 	b.w	c0de0eb0 <io_send_sw>
c0de0e8c:	f24b 0002 	movw	r0, #45058	@ 0xb002
c0de0e90:	f000 f80e 	bl	c0de0eb0 <io_send_sw>
c0de0e94:	4604      	mov	r4, r0
c0de0e96:	4620      	mov	r0, r4
c0de0e98:	b008      	add	sp, #32
c0de0e9a:	bd70      	pop	{r4, r5, r6, pc}
c0de0e9c:	00000000 	.word	0x00000000
c0de0ea0:	0000144c 	.word	0x0000144c
c0de0ea4:	0000005d 	.word	0x0000005d
c0de0ea8:	0000b1ef 	.word	0x0000b1ef
c0de0eac:	0000cbf3 	.word	0x0000cbf3

c0de0eb0 <io_send_sw>:
c0de0eb0:	b580      	push	{r7, lr}
c0de0eb2:	4602      	mov	r2, r0
c0de0eb4:	2000      	movs	r0, #0
c0de0eb6:	2100      	movs	r1, #0
c0de0eb8:	f00a f8d4 	bl	c0deb064 <io_send_response_buffers>
c0de0ebc:	bd80      	pop	{r7, pc}
	...

c0de0ec0 <review_choice>:
c0de0ec0:	b510      	push	{r4, lr}
c0de0ec2:	4604      	mov	r4, r0
c0de0ec4:	f7ff fe56 	bl	c0de0b74 <validate_pubkey>
c0de0ec8:	2007      	movs	r0, #7
c0de0eca:	2c00      	cmp	r4, #0
c0de0ecc:	bf18      	it	ne
c0de0ece:	2006      	movne	r0, #6
c0de0ed0:	4902      	ldr	r1, [pc, #8]	@ (c0de0edc <review_choice+0x1c>)
c0de0ed2:	4479      	add	r1, pc
c0de0ed4:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de0ed8:	f008 ba48 	b.w	c0de936c <nbgl_useCaseReviewStatus>
c0de0edc:	fffffd67 	.word	0xfffffd67

c0de0ee0 <ui_display_transaction_bs_choice>:
c0de0ee0:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de0ee2:	b08d      	sub	sp, #52	@ 0x34
c0de0ee4:	4f44      	ldr	r7, [pc, #272]	@ (c0de0ff8 <ui_display_transaction_bs_choice+0x118>)
c0de0ee6:	4604      	mov	r4, r0
c0de0ee8:	eb09 0007 	add.w	r0, r9, r7
c0de0eec:	f890 02a8 	ldrb.w	r0, [r0, #680]	@ 0x2a8
c0de0ef0:	2801      	cmp	r0, #1
c0de0ef2:	d15f      	bne.n	c0de0fb4 <ui_display_transaction_bs_choice+0xd4>
c0de0ef4:	f819 0007 	ldrb.w	r0, [r9, r7]
c0de0ef8:	2801      	cmp	r0, #1
c0de0efa:	d15b      	bne.n	c0de0fb4 <ui_display_transaction_bs_choice+0xd4>
c0de0efc:	4e3f      	ldr	r6, [pc, #252]	@ (c0de0ffc <ui_display_transaction_bs_choice+0x11c>)
c0de0efe:	211e      	movs	r1, #30
c0de0f00:	eb09 0006 	add.w	r0, r9, r6
c0de0f04:	3014      	adds	r0, #20
c0de0f06:	f00a ffc7 	bl	c0debe98 <__aeabi_memclr>
c0de0f0a:	ad05      	add	r5, sp, #20
c0de0f0c:	211e      	movs	r1, #30
c0de0f0e:	4628      	mov	r0, r5
c0de0f10:	f00a ffc2 	bl	c0debe98 <__aeabi_memclr>
c0de0f14:	eb09 0007 	add.w	r0, r9, r7
c0de0f18:	211e      	movs	r1, #30
c0de0f1a:	e9d0 2386 	ldrd	r2, r3, [r0, #536]	@ 0x218
c0de0f1e:	2003      	movs	r0, #3
c0de0f20:	9000      	str	r0, [sp, #0]
c0de0f22:	4628      	mov	r0, r5
c0de0f24:	f009 fff5 	bl	c0deaf12 <format_fpu64>
c0de0f28:	2800      	cmp	r0, #0
c0de0f2a:	d04d      	beq.n	c0de0fc8 <ui_display_transaction_bs_choice+0xe8>
c0de0f2c:	9500      	str	r5, [sp, #0]
c0de0f2e:	eb09 0506 	add.w	r5, r9, r6
c0de0f32:	211e      	movs	r1, #30
c0de0f34:	231e      	movs	r3, #30
c0de0f36:	4a32      	ldr	r2, [pc, #200]	@ (c0de1000 <ui_display_transaction_bs_choice+0x120>)
c0de0f38:	f105 0014 	add.w	r0, r5, #20
c0de0f3c:	447a      	add	r2, pc
c0de0f3e:	f00a fb11 	bl	c0deb564 <snprintf>
c0de0f42:	3554      	adds	r5, #84	@ 0x54
c0de0f44:	212b      	movs	r1, #43	@ 0x2b
c0de0f46:	4628      	mov	r0, r5
c0de0f48:	f00a ffa6 	bl	c0debe98 <__aeabi_memclr>
c0de0f4c:	eb09 0007 	add.w	r0, r9, r7
c0de0f50:	2114      	movs	r1, #20
c0de0f52:	462a      	mov	r2, r5
c0de0f54:	232b      	movs	r3, #43	@ 0x2b
c0de0f56:	f8d0 0228 	ldr.w	r0, [r0, #552]	@ 0x228
c0de0f5a:	f00a f821 	bl	c0deafa0 <format_hex>
c0de0f5e:	3001      	adds	r0, #1
c0de0f60:	d035      	beq.n	c0de0fce <ui_display_transaction_bs_choice+0xee>
c0de0f62:	4928      	ldr	r1, [pc, #160]	@ (c0de1004 <ui_display_transaction_bs_choice+0x124>)
c0de0f64:	eb09 0006 	add.w	r0, r9, r6
c0de0f68:	2500      	movs	r5, #0
c0de0f6a:	4602      	mov	r2, r0
c0de0f6c:	4479      	add	r1, pc
c0de0f6e:	f842 1f34 	str.w	r1, [r2, #52]!
c0de0f72:	f849 2006 	str.w	r2, [r9, r6]
c0de0f76:	2202      	movs	r2, #2
c0de0f78:	4923      	ldr	r1, [pc, #140]	@ (c0de1008 <ui_display_transaction_bs_choice+0x128>)
c0de0f7a:	7202      	strb	r2, [r0, #8]
c0de0f7c:	f100 0254 	add.w	r2, r0, #84	@ 0x54
c0de0f80:	7285      	strb	r5, [r0, #10]
c0de0f82:	4479      	add	r1, pc
c0de0f84:	e9c0 1211 	strd	r1, r2, [r0, #68]	@ 0x44
c0de0f88:	f100 0114 	add.w	r1, r0, #20
c0de0f8c:	6381      	str	r1, [r0, #56]	@ 0x38
c0de0f8e:	481f      	ldr	r0, [pc, #124]	@ (c0de100c <ui_display_transaction_bs_choice+0x12c>)
c0de0f90:	491f      	ldr	r1, [pc, #124]	@ (c0de1010 <ui_display_transaction_bs_choice+0x130>)
c0de0f92:	4478      	add	r0, pc
c0de0f94:	4479      	add	r1, pc
c0de0f96:	b314      	cbz	r4, c0de0fde <ui_display_transaction_bs_choice+0xfe>
c0de0f98:	e9cd 5100 	strd	r5, r1, [sp]
c0de0f9c:	e9cd 5002 	strd	r5, r0, [sp, #8]
c0de0fa0:	eb09 0106 	add.w	r1, r9, r6
c0de0fa4:	2000      	movs	r0, #0
c0de0fa6:	4a1b      	ldr	r2, [pc, #108]	@ (c0de1014 <ui_display_transaction_bs_choice+0x134>)
c0de0fa8:	4b1b      	ldr	r3, [pc, #108]	@ (c0de1018 <ui_display_transaction_bs_choice+0x138>)
c0de0faa:	447a      	add	r2, pc
c0de0fac:	447b      	add	r3, pc
c0de0fae:	f008 fc01 	bl	c0de97b4 <nbgl_useCaseReviewBlindSigning>
c0de0fb2:	e011      	b.n	c0de0fd8 <ui_display_transaction_bs_choice+0xf8>
c0de0fb4:	2000      	movs	r0, #0
c0de0fb6:	f809 0007 	strb.w	r0, [r9, r7]
c0de0fba:	f24b 0007 	movw	r0, #45063	@ 0xb007
c0de0fbe:	b00d      	add	sp, #52	@ 0x34
c0de0fc0:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de0fc4:	f000 b82e 	b.w	c0de1024 <io_send_sw>
c0de0fc8:	f24b 0003 	movw	r0, #45059	@ 0xb003
c0de0fcc:	e001      	b.n	c0de0fd2 <ui_display_transaction_bs_choice+0xf2>
c0de0fce:	f24b 0002 	movw	r0, #45058	@ 0xb002
c0de0fd2:	f000 f827 	bl	c0de1024 <io_send_sw>
c0de0fd6:	4605      	mov	r5, r0
c0de0fd8:	4628      	mov	r0, r5
c0de0fda:	b00d      	add	sp, #52	@ 0x34
c0de0fdc:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de0fde:	e9cd 5100 	strd	r5, r1, [sp]
c0de0fe2:	9002      	str	r0, [sp, #8]
c0de0fe4:	eb09 0106 	add.w	r1, r9, r6
c0de0fe8:	2000      	movs	r0, #0
c0de0fea:	4a0c      	ldr	r2, [pc, #48]	@ (c0de101c <ui_display_transaction_bs_choice+0x13c>)
c0de0fec:	4b0c      	ldr	r3, [pc, #48]	@ (c0de1020 <ui_display_transaction_bs_choice+0x140>)
c0de0fee:	447a      	add	r2, pc
c0de0ff0:	447b      	add	r3, pc
c0de0ff2:	f008 fb31 	bl	c0de9658 <nbgl_useCaseReview>
c0de0ff6:	e7ef      	b.n	c0de0fd8 <ui_display_transaction_bs_choice+0xf8>
c0de0ff8:	00000000 	.word	0x00000000
c0de0ffc:	00001478 	.word	0x00001478
c0de1000:	0000c8d4 	.word	0x0000c8d4
c0de1004:	0000c360 	.word	0x0000c360
c0de1008:	0000c897 	.word	0x0000c897
c0de100c:	0000009f 	.word	0x0000009f
c0de1010:	0000c46f 	.word	0x0000c46f
c0de1014:	0000b0b3 	.word	0x0000b0b3
c0de1018:	0000c205 	.word	0x0000c205
c0de101c:	0000b06f 	.word	0x0000b06f
c0de1020:	0000c1c1 	.word	0x0000c1c1

c0de1024 <io_send_sw>:
c0de1024:	b580      	push	{r7, lr}
c0de1026:	4602      	mov	r2, r0
c0de1028:	2000      	movs	r0, #0
c0de102a:	2100      	movs	r1, #0
c0de102c:	f00a f81a 	bl	c0deb064 <io_send_response_buffers>
c0de1030:	bd80      	pop	{r7, pc}
	...

c0de1034 <review_choice>:
c0de1034:	b510      	push	{r4, lr}
c0de1036:	4604      	mov	r4, r0
c0de1038:	f7ff fdaa 	bl	c0de0b90 <validate_transaction>
c0de103c:	4903      	ldr	r1, [pc, #12]	@ (c0de104c <review_choice+0x18>)
c0de103e:	f084 0001 	eor.w	r0, r4, #1
c0de1042:	4479      	add	r1, pc
c0de1044:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de1048:	f008 b990 	b.w	c0de936c <nbgl_useCaseReviewStatus>
c0de104c:	fffffbf7 	.word	0xfffffbf7

c0de1050 <ui_display_blind_signed_transaction>:
c0de1050:	2001      	movs	r0, #1
c0de1052:	f7ff bf45 	b.w	c0de0ee0 <ui_display_transaction_bs_choice>

c0de1056 <ui_display_transaction>:
c0de1056:	2000      	movs	r0, #0
c0de1058:	f7ff bf42 	b.w	c0de0ee0 <ui_display_transaction_bs_choice>

c0de105c <keccak_init>:
c0de105c:	2106      	movs	r1, #6
c0de105e:	2220      	movs	r2, #32
c0de1060:	f00a b9db 	b.w	c0deb41a <cx_hash_init_ex>

c0de1064 <keccak_update>:
c0de1064:	f00a b9de 	b.w	c0deb424 <cx_hash_update>

c0de1068 <keccak_final>:
c0de1068:	f00a b9d2 	b.w	c0deb410 <cx_hash_final>

c0de106c <inner_keccak256_init>:
c0de106c:	b160      	cbz	r0, c0de1088 <inner_keccak256_init+0x1c>
c0de106e:	b510      	push	{r4, lr}
c0de1070:	212c      	movs	r1, #44	@ 0x2c
c0de1072:	4604      	mov	r4, r0
c0de1074:	f00a ff10 	bl	c0debe98 <__aeabi_memclr>
c0de1078:	f104 0030 	add.w	r0, r4, #48	@ 0x30
c0de107c:	f7ff ffee 	bl	c0de105c <keccak_init>
c0de1080:	2000      	movs	r0, #0
c0de1082:	e9c4 007e 	strd	r0, r0, [r4, #504]	@ 0x1f8
c0de1086:	bd10      	pop	{r4, pc}
c0de1088:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de108c:	4770      	bx	lr

c0de108e <inner_keccak256_inject>:
c0de108e:	b580      	push	{r7, lr}
c0de1090:	4603      	mov	r3, r0
c0de1092:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de1096:	b15b      	cbz	r3, c0de10b0 <inner_keccak256_inject+0x22>
c0de1098:	b151      	cbz	r1, c0de10b0 <inner_keccak256_inject+0x22>
c0de109a:	6a98      	ldr	r0, [r3, #40]	@ 0x28
c0de109c:	b110      	cbz	r0, c0de10a4 <inner_keccak256_inject+0x16>
c0de109e:	f06f 0001 	mvn.w	r0, #1
c0de10a2:	bd80      	pop	{r7, pc}
c0de10a4:	f103 0030 	add.w	r0, r3, #48	@ 0x30
c0de10a8:	b292      	uxth	r2, r2
c0de10aa:	f7ff ffdb 	bl	c0de1064 <keccak_update>
c0de10ae:	2000      	movs	r0, #0
c0de10b0:	bd80      	pop	{r7, pc}

c0de10b2 <inner_keccak256_flip>:
c0de10b2:	b510      	push	{r4, lr}
c0de10b4:	b128      	cbz	r0, c0de10c2 <inner_keccak256_flip+0x10>
c0de10b6:	4604      	mov	r4, r0
c0de10b8:	6a80      	ldr	r0, [r0, #40]	@ 0x28
c0de10ba:	b128      	cbz	r0, c0de10c8 <inner_keccak256_flip+0x16>
c0de10bc:	f06f 0001 	mvn.w	r0, #1
c0de10c0:	bd10      	pop	{r4, pc}
c0de10c2:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de10c6:	bd10      	pop	{r4, pc}
c0de10c8:	f104 0030 	add.w	r0, r4, #48	@ 0x30
c0de10cc:	4621      	mov	r1, r4
c0de10ce:	f7ff ffcb 	bl	c0de1068 <keccak_final>
c0de10d2:	2000      	movs	r0, #0
c0de10d4:	2101      	movs	r1, #1
c0de10d6:	e9c4 007e 	strd	r0, r0, [r4, #504]	@ 0x1f8
c0de10da:	62a1      	str	r1, [r4, #40]	@ 0x28
c0de10dc:	bd10      	pop	{r4, pc}

c0de10de <inner_keccak256_extract>:
c0de10de:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de10e2:	b0f8      	sub	sp, #480	@ 0x1e0
c0de10e4:	4682      	mov	sl, r0
c0de10e6:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de10ea:	f1ba 0f00 	cmp.w	sl, #0
c0de10ee:	d020      	beq.n	c0de1132 <inner_keccak256_extract+0x54>
c0de10f0:	460e      	mov	r6, r1
c0de10f2:	b1f1      	cbz	r1, c0de1132 <inner_keccak256_extract+0x54>
c0de10f4:	f8da 0028 	ldr.w	r0, [sl, #40]	@ 0x28
c0de10f8:	b1c8      	cbz	r0, c0de112e <inner_keccak256_extract+0x50>
c0de10fa:	e9da 017e 	ldrd	r0, r1, [sl, #504]	@ 0x1f8
c0de10fe:	4615      	mov	r5, r2
c0de1100:	4281      	cmp	r1, r0
c0de1102:	d919      	bls.n	c0de1138 <inner_keccak256_extract+0x5a>
c0de1104:	1a0c      	subs	r4, r1, r0
c0de1106:	4450      	add	r0, sl
c0de1108:	46a3      	mov	fp, r4
c0de110a:	42ac      	cmp	r4, r5
c0de110c:	f500 71ec 	add.w	r1, r0, #472	@ 0x1d8
c0de1110:	4630      	mov	r0, r6
c0de1112:	bf88      	it	hi
c0de1114:	46ab      	movhi	fp, r5
c0de1116:	465a      	mov	r2, fp
c0de1118:	f00a feb4 	bl	c0debe84 <__aeabi_memcpy>
c0de111c:	f8da 01f8 	ldr.w	r0, [sl, #504]	@ 0x1f8
c0de1120:	42ac      	cmp	r4, r5
c0de1122:	4458      	add	r0, fp
c0de1124:	f8ca 01f8 	str.w	r0, [sl, #504]	@ 0x1f8
c0de1128:	d308      	bcc.n	c0de113c <inner_keccak256_extract+0x5e>
c0de112a:	2000      	movs	r0, #0
c0de112c:	e001      	b.n	c0de1132 <inner_keccak256_extract+0x54>
c0de112e:	f06f 0001 	mvn.w	r0, #1
c0de1132:	b078      	add	sp, #480	@ 0x1e0
c0de1134:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de1138:	f04f 0b00 	mov.w	fp, #0
c0de113c:	ac6e      	add	r4, sp, #440	@ 0x1b8
c0de113e:	9503      	str	r5, [sp, #12]
c0de1140:	f104 0020 	add.w	r0, r4, #32
c0de1144:	9002      	str	r0, [sp, #8]
c0de1146:	f50a 70ec 	add.w	r0, sl, #472	@ 0x1d8
c0de114a:	e9cd 0600 	strd	r0, r6, [sp]
c0de114e:	45ab      	cmp	fp, r5
c0de1150:	d2eb      	bcs.n	c0de112a <inner_keccak256_extract+0x4c>
c0de1152:	4620      	mov	r0, r4
c0de1154:	4651      	mov	r1, sl
c0de1156:	2220      	movs	r2, #32
c0de1158:	46a0      	mov	r8, r4
c0de115a:	f00a fe93 	bl	c0debe84 <__aeabi_memcpy>
c0de115e:	e9da 5408 	ldrd	r5, r4, [sl, #32]
c0de1162:	9f02      	ldr	r7, [sp, #8]
c0de1164:	2638      	movs	r6, #56	@ 0x38
c0de1166:	f116 0008 	adds.w	r0, r6, #8
c0de116a:	d008      	beq.n	c0de117e <inner_keccak256_extract+0xa0>
c0de116c:	4628      	mov	r0, r5
c0de116e:	4621      	mov	r1, r4
c0de1170:	4632      	mov	r2, r6
c0de1172:	f00a fd91 	bl	c0debc98 <__aeabi_llsr>
c0de1176:	f807 0b01 	strb.w	r0, [r7], #1
c0de117a:	3e08      	subs	r6, #8
c0de117c:	e7f3      	b.n	c0de1166 <inner_keccak256_extract+0x88>
c0de117e:	af04      	add	r7, sp, #16
c0de1180:	4638      	mov	r0, r7
c0de1182:	f7ff ff6b 	bl	c0de105c <keccak_init>
c0de1186:	4638      	mov	r0, r7
c0de1188:	4641      	mov	r1, r8
c0de118a:	2228      	movs	r2, #40	@ 0x28
c0de118c:	4644      	mov	r4, r8
c0de118e:	f7ff ff69 	bl	c0de1064 <keccak_update>
c0de1192:	9d03      	ldr	r5, [sp, #12]
c0de1194:	eba5 080b 	sub.w	r8, r5, fp
c0de1198:	f1b8 0f1f 	cmp.w	r8, #31
c0de119c:	d90b      	bls.n	c0de11b6 <inner_keccak256_extract+0xd8>
c0de119e:	9e01      	ldr	r6, [sp, #4]
c0de11a0:	4638      	mov	r0, r7
c0de11a2:	eb06 010b 	add.w	r1, r6, fp
c0de11a6:	f7ff ff5f 	bl	c0de1068 <keccak_final>
c0de11aa:	f10b 0b20 	add.w	fp, fp, #32
c0de11ae:	f04f 0800 	mov.w	r8, #0
c0de11b2:	2000      	movs	r0, #0
c0de11b4:	e00d      	b.n	c0de11d2 <inner_keccak256_extract+0xf4>
c0de11b6:	4638      	mov	r0, r7
c0de11b8:	9f00      	ldr	r7, [sp, #0]
c0de11ba:	4639      	mov	r1, r7
c0de11bc:	f7ff ff54 	bl	c0de1068 <keccak_final>
c0de11c0:	9e01      	ldr	r6, [sp, #4]
c0de11c2:	4639      	mov	r1, r7
c0de11c4:	4642      	mov	r2, r8
c0de11c6:	eb06 000b 	add.w	r0, r6, fp
c0de11ca:	f00a fe5b 	bl	c0debe84 <__aeabi_memcpy>
c0de11ce:	2020      	movs	r0, #32
c0de11d0:	46ab      	mov	fp, r5
c0de11d2:	e9ca 807e 	strd	r8, r0, [sl, #504]	@ 0x1f8
c0de11d6:	e9da 0108 	ldrd	r0, r1, [sl, #32]
c0de11da:	3001      	adds	r0, #1
c0de11dc:	f141 0100 	adc.w	r1, r1, #0
c0de11e0:	e9ca 0108 	strd	r0, r1, [sl, #32]
c0de11e4:	e7b3      	b.n	c0de114e <inner_keccak256_extract+0x70>

c0de11e6 <pqcrystals_dilithium2_lowram_pack_sig_h>:
c0de11e6:	b5b0      	push	{r4, r5, r7, lr}
c0de11e8:	f500 6012 	add.w	r0, r0, #2336	@ 0x920
c0de11ec:	2400      	movs	r4, #0
c0de11ee:	f5b4 7f80 	cmp.w	r4, #256	@ 0x100
c0de11f2:	d009      	beq.n	c0de1208 <pqcrystals_dilithium2_lowram_pack_sig_h+0x22>
c0de11f4:	f851 5024 	ldr.w	r5, [r1, r4, lsl #2]
c0de11f8:	b125      	cbz	r5, c0de1204 <pqcrystals_dilithium2_lowram_pack_sig_h+0x1e>
c0de11fa:	681d      	ldr	r5, [r3, #0]
c0de11fc:	5544      	strb	r4, [r0, r5]
c0de11fe:	681d      	ldr	r5, [r3, #0]
c0de1200:	3501      	adds	r5, #1
c0de1202:	601d      	str	r5, [r3, #0]
c0de1204:	3401      	adds	r4, #1
c0de1206:	e7f2      	b.n	c0de11ee <pqcrystals_dilithium2_lowram_pack_sig_h+0x8>
c0de1208:	6819      	ldr	r1, [r3, #0]
c0de120a:	4410      	add	r0, r2
c0de120c:	f880 1050 	strb.w	r1, [r0, #80]	@ 0x50
c0de1210:	bdb0      	pop	{r4, r5, r7, pc}

c0de1212 <pqcrystals_dilithium2_lowram_pack_sig_h_zero>:
c0de1212:	680a      	ldr	r2, [r1, #0]
c0de1214:	f500 6012 	add.w	r0, r0, #2336	@ 0x920
c0de1218:	2300      	movs	r3, #0
c0de121a:	2a4f      	cmp	r2, #79	@ 0x4f
c0de121c:	bf88      	it	hi
c0de121e:	4770      	bxhi	lr
c0de1220:	5483      	strb	r3, [r0, r2]
c0de1222:	680a      	ldr	r2, [r1, #0]
c0de1224:	3201      	adds	r2, #1
c0de1226:	600a      	str	r2, [r1, #0]
c0de1228:	e7f7      	b.n	c0de121a <pqcrystals_dilithium2_lowram_pack_sig_h_zero+0x8>

c0de122a <poly_challenge_compress>:
c0de122a:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de122e:	2200      	movs	r2, #0
c0de1230:	2300      	movs	r3, #0
c0de1232:	2b44      	cmp	r3, #68	@ 0x44
c0de1234:	d002      	beq.n	c0de123c <poly_challenge_compress+0x12>
c0de1236:	54c2      	strb	r2, [r0, r3]
c0de1238:	3301      	adds	r3, #1
c0de123a:	e7fa      	b.n	c0de1232 <poly_challenge_compress+0x8>
c0de123c:	2200      	movs	r2, #0
c0de123e:	2301      	movs	r3, #1
c0de1240:	2600      	movs	r6, #0
c0de1242:	f04f 0800 	mov.w	r8, #0
c0de1246:	2500      	movs	r5, #0
c0de1248:	2700      	movs	r7, #0
c0de124a:	f5b2 7f80 	cmp.w	r2, #256	@ 0x100
c0de124e:	d011      	beq.n	c0de1274 <poly_challenge_compress+0x4a>
c0de1250:	f851 4022 	ldr.w	r4, [r1, r2, lsl #2]
c0de1254:	b164      	cbz	r4, c0de1270 <poly_challenge_compress+0x46>
c0de1256:	5582      	strb	r2, [r0, r6]
c0de1258:	f851 4022 	ldr.w	r4, [r1, r2, lsl #2]
c0de125c:	3401      	adds	r4, #1
c0de125e:	bf04      	itt	eq
c0de1260:	433d      	orreq	r5, r7
c0de1262:	ea48 0803 	orreq.w	r8, r8, r3
c0de1266:	007c      	lsls	r4, r7, #1
c0de1268:	3601      	adds	r6, #1
c0de126a:	ea44 77d3 	orr.w	r7, r4, r3, lsr #31
c0de126e:	005b      	lsls	r3, r3, #1
c0de1270:	3201      	adds	r2, #1
c0de1272:	e7ea      	b.n	c0de124a <poly_challenge_compress+0x20>
c0de1274:	f100 073c 	add.w	r7, r0, #60	@ 0x3c
c0de1278:	2600      	movs	r6, #0
c0de127a:	2e40      	cmp	r6, #64	@ 0x40
c0de127c:	bf08      	it	eq
c0de127e:	e8bd 81f0 	ldmiaeq.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de1282:	4640      	mov	r0, r8
c0de1284:	4629      	mov	r1, r5
c0de1286:	4632      	mov	r2, r6
c0de1288:	f00a fd06 	bl	c0debc98 <__aeabi_llsr>
c0de128c:	f807 0b01 	strb.w	r0, [r7], #1
c0de1290:	3608      	adds	r6, #8
c0de1292:	e7f2      	b.n	c0de127a <poly_challenge_compress+0x50>

c0de1294 <poly_challenge_decompress>:
c0de1294:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de1298:	4688      	mov	r8, r1
c0de129a:	4682      	mov	sl, r0
c0de129c:	2000      	movs	r0, #0
c0de129e:	2100      	movs	r1, #0
c0de12a0:	f5b1 7f80 	cmp.w	r1, #256	@ 0x100
c0de12a4:	d003      	beq.n	c0de12ae <poly_challenge_decompress+0x1a>
c0de12a6:	f84a 0021 	str.w	r0, [sl, r1, lsl #2]
c0de12aa:	3101      	adds	r1, #1
c0de12ac:	e7f8      	b.n	c0de12a0 <poly_challenge_decompress+0xc>
c0de12ae:	f108 053c 	add.w	r5, r8, #60	@ 0x3c
c0de12b2:	2600      	movs	r6, #0
c0de12b4:	2700      	movs	r7, #0
c0de12b6:	2400      	movs	r4, #0
c0de12b8:	2e40      	cmp	r6, #64	@ 0x40
c0de12ba:	d009      	beq.n	c0de12d0 <poly_challenge_decompress+0x3c>
c0de12bc:	f815 0b01 	ldrb.w	r0, [r5], #1
c0de12c0:	2100      	movs	r1, #0
c0de12c2:	4632      	mov	r2, r6
c0de12c4:	f00a fcd6 	bl	c0debc74 <__aeabi_llsl>
c0de12c8:	430c      	orrs	r4, r1
c0de12ca:	4307      	orrs	r7, r0
c0de12cc:	3608      	adds	r6, #8
c0de12ce:	e7f3      	b.n	c0de12b8 <poly_challenge_decompress+0x24>
c0de12d0:	2000      	movs	r0, #0
c0de12d2:	2827      	cmp	r0, #39	@ 0x27
c0de12d4:	bf08      	it	eq
c0de12d6:	e8bd 85f8 	ldmiaeq.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}
c0de12da:	07fa      	lsls	r2, r7, #31
c0de12dc:	f818 1000 	ldrb.w	r1, [r8, r0]
c0de12e0:	f04f 32ff 	mov.w	r2, #4294967295	@ 0xffffffff
c0de12e4:	bf08      	it	eq
c0de12e6:	2201      	moveq	r2, #1
c0de12e8:	ea5f 0454 	movs.w	r4, r4, lsr #1
c0de12ec:	f84a 2021 	str.w	r2, [sl, r1, lsl #2]
c0de12f0:	ea4f 0737 	mov.w	r7, r7, rrx
c0de12f4:	3001      	adds	r0, #1
c0de12f6:	e7ec      	b.n	c0de12d2 <poly_challenge_decompress+0x3e>

c0de12f8 <poly_schoolbook>:
c0de12f8:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de12fc:	4614      	mov	r4, r2
c0de12fe:	468a      	mov	sl, r1
c0de1300:	2200      	movs	r2, #0
c0de1302:	2100      	movs	r1, #0
c0de1304:	f5b1 7f80 	cmp.w	r1, #256	@ 0x100
c0de1308:	d003      	beq.n	c0de1312 <poly_schoolbook+0x1a>
c0de130a:	f840 2021 	str.w	r2, [r0, r1, lsl #2]
c0de130e:	3101      	adds	r1, #1
c0de1310:	e7f8      	b.n	c0de1304 <poly_schoolbook+0xc>
c0de1312:	f10a 053c 	add.w	r5, sl, #60	@ 0x3c
c0de1316:	2700      	movs	r7, #0
c0de1318:	f04f 0b00 	mov.w	fp, #0
c0de131c:	2600      	movs	r6, #0
c0de131e:	9003      	str	r0, [sp, #12]
c0de1320:	2f40      	cmp	r7, #64	@ 0x40
c0de1322:	d006      	beq.n	c0de1332 <poly_schoolbook+0x3a>
c0de1324:	f000 fbf0 	bl	c0de1b08 <OUTLINED_FUNCTION_2>
c0de1328:	430e      	orrs	r6, r1
c0de132a:	ea4b 0b00 	orr.w	fp, fp, r0
c0de132e:	3708      	adds	r7, #8
c0de1330:	e7f6      	b.n	c0de1320 <poly_schoolbook+0x28>
c0de1332:	f04f 0800 	mov.w	r8, #0
c0de1336:	f8cd a004 	str.w	sl, [sp, #4]
c0de133a:	f1b8 0f27 	cmp.w	r8, #39	@ 0x27
c0de133e:	bf08      	it	eq
c0de1340:	e8bd 8dff 	ldmiaeq.w	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de1344:	f81a 0008 	ldrb.w	r0, [sl, r8]
c0de1348:	ea5f 71cb 	movs.w	r1, fp, lsl #31
c0de134c:	f5c0 7780 	rsb	r7, r0, #256	@ 0x100
c0de1350:	d111      	bne.n	c0de1376 <poly_schoolbook+0x7e>
c0de1352:	9903      	ldr	r1, [sp, #12]
c0de1354:	9602      	str	r6, [sp, #8]
c0de1356:	2500      	movs	r5, #0
c0de1358:	eb01 0680 	add.w	r6, r1, r0, lsl #2
c0de135c:	42af      	cmp	r7, r5
c0de135e:	d01b      	beq.n	c0de1398 <poly_schoolbook+0xa0>
c0de1360:	4620      	mov	r0, r4
c0de1362:	4629      	mov	r1, r5
c0de1364:	f000 f842 	bl	c0de13ec <polyt0_unpack_idx>
c0de1368:	f856 1025 	ldr.w	r1, [r6, r5, lsl #2]
c0de136c:	4408      	add	r0, r1
c0de136e:	f846 0025 	str.w	r0, [r6, r5, lsl #2]
c0de1372:	3501      	adds	r5, #1
c0de1374:	e7f2      	b.n	c0de135c <poly_schoolbook+0x64>
c0de1376:	9903      	ldr	r1, [sp, #12]
c0de1378:	2500      	movs	r5, #0
c0de137a:	eb01 0a80 	add.w	sl, r1, r0, lsl #2
c0de137e:	42af      	cmp	r7, r5
c0de1380:	d01b      	beq.n	c0de13ba <poly_schoolbook+0xc2>
c0de1382:	4620      	mov	r0, r4
c0de1384:	4629      	mov	r1, r5
c0de1386:	f000 f831 	bl	c0de13ec <polyt0_unpack_idx>
c0de138a:	f85a 1025 	ldr.w	r1, [sl, r5, lsl #2]
c0de138e:	1a08      	subs	r0, r1, r0
c0de1390:	f84a 0025 	str.w	r0, [sl, r5, lsl #2]
c0de1394:	3501      	adds	r5, #1
c0de1396:	e7f2      	b.n	c0de137e <poly_schoolbook+0x86>
c0de1398:	f5a6 6580 	sub.w	r5, r6, #1024	@ 0x400
c0de139c:	9e02      	ldr	r6, [sp, #8]
c0de139e:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de13a2:	d01c      	beq.n	c0de13de <poly_schoolbook+0xe6>
c0de13a4:	4620      	mov	r0, r4
c0de13a6:	4639      	mov	r1, r7
c0de13a8:	f000 f820 	bl	c0de13ec <polyt0_unpack_idx>
c0de13ac:	f855 1027 	ldr.w	r1, [r5, r7, lsl #2]
c0de13b0:	1a08      	subs	r0, r1, r0
c0de13b2:	f845 0027 	str.w	r0, [r5, r7, lsl #2]
c0de13b6:	3701      	adds	r7, #1
c0de13b8:	e7f1      	b.n	c0de139e <poly_schoolbook+0xa6>
c0de13ba:	f5aa 6580 	sub.w	r5, sl, #1024	@ 0x400
c0de13be:	f8dd a004 	ldr.w	sl, [sp, #4]
c0de13c2:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de13c6:	d00a      	beq.n	c0de13de <poly_schoolbook+0xe6>
c0de13c8:	4620      	mov	r0, r4
c0de13ca:	4639      	mov	r1, r7
c0de13cc:	f000 f80e 	bl	c0de13ec <polyt0_unpack_idx>
c0de13d0:	f855 1027 	ldr.w	r1, [r5, r7, lsl #2]
c0de13d4:	4408      	add	r0, r1
c0de13d6:	f845 0027 	str.w	r0, [r5, r7, lsl #2]
c0de13da:	3701      	adds	r7, #1
c0de13dc:	e7f1      	b.n	c0de13c2 <poly_schoolbook+0xca>
c0de13de:	ea5f 0656 	movs.w	r6, r6, lsr #1
c0de13e2:	f108 0801 	add.w	r8, r8, #1
c0de13e6:	ea4f 0b3b 	mov.w	fp, fp, rrx
c0de13ea:	e7a6      	b.n	c0de133a <poly_schoolbook+0x42>

c0de13ec <polyt0_unpack_idx>:
c0de13ec:	08ca      	lsrs	r2, r1, #3
c0de13ee:	230d      	movs	r3, #13
c0de13f0:	f001 0107 	and.w	r1, r1, #7
c0de13f4:	fb02 0003 	mla	r0, r2, r3, r0
c0de13f8:	2906      	cmp	r1, #6
c0de13fa:	d00e      	beq.n	c0de141a <polyt0_unpack_idx+0x2e>
c0de13fc:	2901      	cmp	r1, #1
c0de13fe:	d014      	beq.n	c0de142a <polyt0_unpack_idx+0x3e>
c0de1400:	2902      	cmp	r1, #2
c0de1402:	d01a      	beq.n	c0de143a <polyt0_unpack_idx+0x4e>
c0de1404:	2903      	cmp	r1, #3
c0de1406:	d01d      	beq.n	c0de1444 <polyt0_unpack_idx+0x58>
c0de1408:	2904      	cmp	r1, #4
c0de140a:	d023      	beq.n	c0de1454 <polyt0_unpack_idx+0x68>
c0de140c:	2905      	cmp	r1, #5
c0de140e:	d029      	beq.n	c0de1464 <polyt0_unpack_idx+0x78>
c0de1410:	bb69      	cbnz	r1, c0de146e <polyt0_unpack_idx+0x82>
c0de1412:	7801      	ldrb	r1, [r0, #0]
c0de1414:	7840      	ldrb	r0, [r0, #1]
c0de1416:	0200      	lsls	r0, r0, #8
c0de1418:	e02d      	b.n	c0de1476 <polyt0_unpack_idx+0x8a>
c0de141a:	7a82      	ldrb	r2, [r0, #10]
c0de141c:	7a41      	ldrb	r1, [r0, #9]
c0de141e:	7ac3      	ldrb	r3, [r0, #11]
c0de1420:	0090      	lsls	r0, r2, #2
c0de1422:	ea40 1091 	orr.w	r0, r0, r1, lsr #6
c0de1426:	0299      	lsls	r1, r3, #10
c0de1428:	e025      	b.n	c0de1476 <polyt0_unpack_idx+0x8a>
c0de142a:	7882      	ldrb	r2, [r0, #2]
c0de142c:	7841      	ldrb	r1, [r0, #1]
c0de142e:	78c3      	ldrb	r3, [r0, #3]
c0de1430:	00d0      	lsls	r0, r2, #3
c0de1432:	ea40 1051 	orr.w	r0, r0, r1, lsr #5
c0de1436:	02d9      	lsls	r1, r3, #11
c0de1438:	e01d      	b.n	c0de1476 <polyt0_unpack_idx+0x8a>
c0de143a:	78c1      	ldrb	r1, [r0, #3]
c0de143c:	7900      	ldrb	r0, [r0, #4]
c0de143e:	0180      	lsls	r0, r0, #6
c0de1440:	0889      	lsrs	r1, r1, #2
c0de1442:	e018      	b.n	c0de1476 <polyt0_unpack_idx+0x8a>
c0de1444:	7942      	ldrb	r2, [r0, #5]
c0de1446:	7901      	ldrb	r1, [r0, #4]
c0de1448:	7983      	ldrb	r3, [r0, #6]
c0de144a:	0050      	lsls	r0, r2, #1
c0de144c:	ea40 10d1 	orr.w	r0, r0, r1, lsr #7
c0de1450:	0259      	lsls	r1, r3, #9
c0de1452:	e010      	b.n	c0de1476 <polyt0_unpack_idx+0x8a>
c0de1454:	79c2      	ldrb	r2, [r0, #7]
c0de1456:	7981      	ldrb	r1, [r0, #6]
c0de1458:	7a03      	ldrb	r3, [r0, #8]
c0de145a:	0110      	lsls	r0, r2, #4
c0de145c:	ea40 1011 	orr.w	r0, r0, r1, lsr #4
c0de1460:	0319      	lsls	r1, r3, #12
c0de1462:	e008      	b.n	c0de1476 <polyt0_unpack_idx+0x8a>
c0de1464:	7a01      	ldrb	r1, [r0, #8]
c0de1466:	7a40      	ldrb	r0, [r0, #9]
c0de1468:	01c0      	lsls	r0, r0, #7
c0de146a:	0849      	lsrs	r1, r1, #1
c0de146c:	e003      	b.n	c0de1476 <polyt0_unpack_idx+0x8a>
c0de146e:	7ac1      	ldrb	r1, [r0, #11]
c0de1470:	7b00      	ldrb	r0, [r0, #12]
c0de1472:	0140      	lsls	r0, r0, #5
c0de1474:	08c9      	lsrs	r1, r1, #3
c0de1476:	4308      	orrs	r0, r1
c0de1478:	f36f 305f 	bfc	r0, #13, #19
c0de147c:	f5c0 5080 	rsb	r0, r0, #4096	@ 0x1000
c0de1480:	4770      	bx	lr
	...

c0de1484 <poly_schoolbook_t1>:
c0de1484:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de1488:	4614      	mov	r4, r2
c0de148a:	468b      	mov	fp, r1
c0de148c:	2200      	movs	r2, #0
c0de148e:	2100      	movs	r1, #0
c0de1490:	f5b1 7f80 	cmp.w	r1, #256	@ 0x100
c0de1494:	d003      	beq.n	c0de149e <poly_schoolbook_t1+0x1a>
c0de1496:	f840 2021 	str.w	r2, [r0, r1, lsl #2]
c0de149a:	3101      	adds	r1, #1
c0de149c:	e7f8      	b.n	c0de1490 <poly_schoolbook_t1+0xc>
c0de149e:	f10b 053c 	add.w	r5, fp, #60	@ 0x3c
c0de14a2:	2700      	movs	r7, #0
c0de14a4:	f04f 0a00 	mov.w	sl, #0
c0de14a8:	2600      	movs	r6, #0
c0de14aa:	9002      	str	r0, [sp, #8]
c0de14ac:	2f40      	cmp	r7, #64	@ 0x40
c0de14ae:	d006      	beq.n	c0de14be <poly_schoolbook_t1+0x3a>
c0de14b0:	f000 fb2a 	bl	c0de1b08 <OUTLINED_FUNCTION_2>
c0de14b4:	430e      	orrs	r6, r1
c0de14b6:	ea4a 0a00 	orr.w	sl, sl, r0
c0de14ba:	3708      	adds	r7, #8
c0de14bc:	e7f6      	b.n	c0de14ac <poly_schoolbook_t1+0x28>
c0de14be:	4832      	ldr	r0, [pc, #200]	@ (c0de1588 <poly_schoolbook_t1+0x104>)
c0de14c0:	2200      	movs	r2, #0
c0de14c2:	f8cd b000 	str.w	fp, [sp]
c0de14c6:	4680      	mov	r8, r0
c0de14c8:	2a27      	cmp	r2, #39	@ 0x27
c0de14ca:	bf08      	it	eq
c0de14cc:	e8bd 8dff 	ldmiaeq.w	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de14d0:	f81b 0002 	ldrb.w	r0, [fp, r2]
c0de14d4:	ea5f 71ca 	movs.w	r1, sl, lsl #31
c0de14d8:	9203      	str	r2, [sp, #12]
c0de14da:	f5c0 7780 	rsb	r7, r0, #256	@ 0x100
c0de14de:	d112      	bne.n	c0de1506 <poly_schoolbook_t1+0x82>
c0de14e0:	9902      	ldr	r1, [sp, #8]
c0de14e2:	9601      	str	r6, [sp, #4]
c0de14e4:	2500      	movs	r5, #0
c0de14e6:	eb01 0680 	add.w	r6, r1, r0, lsl #2
c0de14ea:	42af      	cmp	r7, r5
c0de14ec:	d01e      	beq.n	c0de152c <poly_schoolbook_t1+0xa8>
c0de14ee:	4620      	mov	r0, r4
c0de14f0:	4629      	mov	r1, r5
c0de14f2:	f000 f84b 	bl	c0de158c <polyt1_unpack_idx>
c0de14f6:	f856 1025 	ldr.w	r1, [r6, r5, lsl #2]
c0de14fa:	eb01 3040 	add.w	r0, r1, r0, lsl #13
c0de14fe:	f846 0025 	str.w	r0, [r6, r5, lsl #2]
c0de1502:	3501      	adds	r5, #1
c0de1504:	e7f1      	b.n	c0de14ea <poly_schoolbook_t1+0x66>
c0de1506:	9902      	ldr	r1, [sp, #8]
c0de1508:	2500      	movs	r5, #0
c0de150a:	eb01 0b80 	add.w	fp, r1, r0, lsl #2
c0de150e:	42af      	cmp	r7, r5
c0de1510:	d01f      	beq.n	c0de1552 <poly_schoolbook_t1+0xce>
c0de1512:	4620      	mov	r0, r4
c0de1514:	4629      	mov	r1, r5
c0de1516:	f000 f839 	bl	c0de158c <polyt1_unpack_idx>
c0de151a:	f85b 1025 	ldr.w	r1, [fp, r5, lsl #2]
c0de151e:	4642      	mov	r2, r8
c0de1520:	fb00 1008 	mla	r0, r0, r8, r1
c0de1524:	f84b 0025 	str.w	r0, [fp, r5, lsl #2]
c0de1528:	3501      	adds	r5, #1
c0de152a:	e7f0      	b.n	c0de150e <poly_schoolbook_t1+0x8a>
c0de152c:	f5a6 6580 	sub.w	r5, r6, #1024	@ 0x400
c0de1530:	9e01      	ldr	r6, [sp, #4]
c0de1532:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de1536:	d01f      	beq.n	c0de1578 <poly_schoolbook_t1+0xf4>
c0de1538:	4620      	mov	r0, r4
c0de153a:	4639      	mov	r1, r7
c0de153c:	f000 f826 	bl	c0de158c <polyt1_unpack_idx>
c0de1540:	f855 1027 	ldr.w	r1, [r5, r7, lsl #2]
c0de1544:	4642      	mov	r2, r8
c0de1546:	fb00 1008 	mla	r0, r0, r8, r1
c0de154a:	f845 0027 	str.w	r0, [r5, r7, lsl #2]
c0de154e:	3701      	adds	r7, #1
c0de1550:	e7ef      	b.n	c0de1532 <poly_schoolbook_t1+0xae>
c0de1552:	f5ab 6580 	sub.w	r5, fp, #1024	@ 0x400
c0de1556:	f8dd b000 	ldr.w	fp, [sp]
c0de155a:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de155e:	d00b      	beq.n	c0de1578 <poly_schoolbook_t1+0xf4>
c0de1560:	4620      	mov	r0, r4
c0de1562:	4639      	mov	r1, r7
c0de1564:	f000 f812 	bl	c0de158c <polyt1_unpack_idx>
c0de1568:	f855 1027 	ldr.w	r1, [r5, r7, lsl #2]
c0de156c:	eb01 3040 	add.w	r0, r1, r0, lsl #13
c0de1570:	f845 0027 	str.w	r0, [r5, r7, lsl #2]
c0de1574:	3701      	adds	r7, #1
c0de1576:	e7f0      	b.n	c0de155a <poly_schoolbook_t1+0xd6>
c0de1578:	9a03      	ldr	r2, [sp, #12]
c0de157a:	ea5f 0656 	movs.w	r6, r6, lsr #1
c0de157e:	ea4f 0a3a 	mov.w	sl, sl, rrx
c0de1582:	3201      	adds	r2, #1
c0de1584:	e7a0      	b.n	c0de14c8 <poly_schoolbook_t1+0x44>
c0de1586:	bf00      	nop
c0de1588:	ffffe000 	.word	0xffffe000

c0de158c <polyt1_unpack_idx>:
c0de158c:	088a      	lsrs	r2, r1, #2
c0de158e:	f001 0103 	and.w	r1, r1, #3
c0de1592:	eb02 0282 	add.w	r2, r2, r2, lsl #2
c0de1596:	2902      	cmp	r1, #2
c0de1598:	4410      	add	r0, r2
c0de159a:	d006      	beq.n	c0de15aa <polyt1_unpack_idx+0x1e>
c0de159c:	2901      	cmp	r1, #1
c0de159e:	d009      	beq.n	c0de15b4 <polyt1_unpack_idx+0x28>
c0de15a0:	b969      	cbnz	r1, c0de15be <polyt1_unpack_idx+0x32>
c0de15a2:	7801      	ldrb	r1, [r0, #0]
c0de15a4:	2208      	movs	r2, #8
c0de15a6:	2301      	movs	r3, #1
c0de15a8:	e00d      	b.n	c0de15c6 <polyt1_unpack_idx+0x3a>
c0de15aa:	7881      	ldrb	r1, [r0, #2]
c0de15ac:	2204      	movs	r2, #4
c0de15ae:	2303      	movs	r3, #3
c0de15b0:	0909      	lsrs	r1, r1, #4
c0de15b2:	e008      	b.n	c0de15c6 <polyt1_unpack_idx+0x3a>
c0de15b4:	7841      	ldrb	r1, [r0, #1]
c0de15b6:	2206      	movs	r2, #6
c0de15b8:	2302      	movs	r3, #2
c0de15ba:	0889      	lsrs	r1, r1, #2
c0de15bc:	e003      	b.n	c0de15c6 <polyt1_unpack_idx+0x3a>
c0de15be:	78c1      	ldrb	r1, [r0, #3]
c0de15c0:	2202      	movs	r2, #2
c0de15c2:	2304      	movs	r3, #4
c0de15c4:	0989      	lsrs	r1, r1, #6
c0de15c6:	5cc0      	ldrb	r0, [r0, r3]
c0de15c8:	4090      	lsls	r0, r2
c0de15ca:	f400 707f 	and.w	r0, r0, #1020	@ 0x3fc
c0de15ce:	4308      	orrs	r0, r1
c0de15d0:	4770      	bx	lr

c0de15d2 <polyw_pack>:
c0de15d2:	b5b0      	push	{r4, r5, r7, lr}
c0de15d4:	4605      	mov	r5, r0
c0de15d6:	4608      	mov	r0, r1
c0de15d8:	460c      	mov	r4, r1
c0de15da:	f000 fb23 	bl	c0de1c24 <pqcrystals_dilithium2_lowram_poly_reduce>
c0de15de:	4620      	mov	r0, r4
c0de15e0:	f000 fb2f 	bl	c0de1c42 <pqcrystals_dilithium2_lowram_poly_caddq>
c0de15e4:	2000      	movs	r0, #0
c0de15e6:	f5b0 7f80 	cmp.w	r0, #256	@ 0x100
c0de15ea:	bf08      	it	eq
c0de15ec:	bdb0      	popeq	{r4, r5, r7, pc}
c0de15ee:	f854 1020 	ldr.w	r1, [r4, r0, lsl #2]
c0de15f2:	eb00 0240 	add.w	r2, r0, r0, lsl #1
c0de15f6:	54a9      	strb	r1, [r5, r2]
c0de15f8:	18a9      	adds	r1, r5, r2
c0de15fa:	f854 2020 	ldr.w	r2, [r4, r0, lsl #2]
c0de15fe:	0a12      	lsrs	r2, r2, #8
c0de1600:	704a      	strb	r2, [r1, #1]
c0de1602:	eb04 0280 	add.w	r2, r4, r0, lsl #2
c0de1606:	3001      	adds	r0, #1
c0de1608:	8852      	ldrh	r2, [r2, #2]
c0de160a:	708a      	strb	r2, [r1, #2]
c0de160c:	e7eb      	b.n	c0de15e6 <polyw_pack+0x14>

c0de160e <polyw_unpack>:
c0de160e:	b5b0      	push	{r4, r5, r7, lr}
c0de1610:	2200      	movs	r2, #0
c0de1612:	f5b2 7f80 	cmp.w	r2, #256	@ 0x100
c0de1616:	bf08      	it	eq
c0de1618:	bdb0      	popeq	{r4, r5, r7, pc}
c0de161a:	eb02 0342 	add.w	r3, r2, r2, lsl #1
c0de161e:	5ccc      	ldrb	r4, [r1, r3]
c0de1620:	440b      	add	r3, r1
c0de1622:	f840 4022 	str.w	r4, [r0, r2, lsl #2]
c0de1626:	785d      	ldrb	r5, [r3, #1]
c0de1628:	ea44 2405 	orr.w	r4, r4, r5, lsl #8
c0de162c:	f840 4022 	str.w	r4, [r0, r2, lsl #2]
c0de1630:	789b      	ldrb	r3, [r3, #2]
c0de1632:	ea44 4303 	orr.w	r3, r4, r3, lsl #16
c0de1636:	f840 3022 	str.w	r3, [r0, r2, lsl #2]
c0de163a:	3201      	adds	r2, #1
c0de163c:	e7e9      	b.n	c0de1612 <polyw_unpack+0x4>

c0de163e <polyw_sub>:
c0de163e:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de1640:	3102      	adds	r1, #2
c0de1642:	2300      	movs	r3, #0
c0de1644:	f5b3 7f80 	cmp.w	r3, #256	@ 0x100
c0de1648:	bf08      	it	eq
c0de164a:	bdf0      	popeq	{r4, r5, r6, r7, pc}
c0de164c:	f811 5c02 	ldrb.w	r5, [r1, #-2]
c0de1650:	f811 6c01 	ldrb.w	r6, [r1, #-1]
c0de1654:	f811 7b03 	ldrb.w	r7, [r1], #3
c0de1658:	f852 4023 	ldr.w	r4, [r2, r3, lsl #2]
c0de165c:	ea45 2506 	orr.w	r5, r5, r6, lsl #8
c0de1660:	ea45 4507 	orr.w	r5, r5, r7, lsl #16
c0de1664:	1b2c      	subs	r4, r5, r4
c0de1666:	f840 4023 	str.w	r4, [r0, r3, lsl #2]
c0de166a:	3301      	adds	r3, #1
c0de166c:	e7ea      	b.n	c0de1644 <polyw_sub+0x6>

c0de166e <poly_highbits>:
c0de166e:	b5b0      	push	{r4, r5, r7, lr}
c0de1670:	2200      	movs	r2, #0
c0de1672:	f642 430b 	movw	r3, #11275	@ 0x2c0b
c0de1676:	f5b2 7f80 	cmp.w	r2, #256	@ 0x100
c0de167a:	bf08      	it	eq
c0de167c:	bdb0      	popeq	{r4, r5, r7, pc}
c0de167e:	f851 4022 	ldr.w	r4, [r1, r2, lsl #2]
c0de1682:	347f      	adds	r4, #127	@ 0x7f
c0de1684:	11e4      	asrs	r4, r4, #7
c0de1686:	435c      	muls	r4, r3
c0de1688:	f504 0500 	add.w	r5, r4, #8388608	@ 0x800000
c0de168c:	162d      	asrs	r5, r5, #24
c0de168e:	f1b4 5f2e 	cmp.w	r4, #729808896	@ 0x2b800000
c0de1692:	bfa8      	it	ge
c0de1694:	2500      	movge	r5, #0
c0de1696:	f840 5022 	str.w	r5, [r0, r2, lsl #2]
c0de169a:	3201      	adds	r2, #1
c0de169c:	e7eb      	b.n	c0de1676 <poly_highbits+0x8>
	...

c0de16a0 <poly_lowbits>:
c0de16a0:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de16a4:	4e13      	ldr	r6, [pc, #76]	@ (c0de16f4 <poly_lowbits+0x54>)
c0de16a6:	4f15      	ldr	r7, [pc, #84]	@ (c0de16fc <poly_lowbits+0x5c>)
c0de16a8:	2200      	movs	r2, #0
c0de16aa:	f642 4c0b 	movw	ip, #11275	@ 0x2c0b
c0de16ae:	f06f 0e01 	mvn.w	lr, #1
c0de16b2:	46b0      	mov	r8, r6
c0de16b4:	4e10      	ldr	r6, [pc, #64]	@ (c0de16f8 <poly_lowbits+0x58>)
c0de16b6:	f5b2 7f80 	cmp.w	r2, #256	@ 0x100
c0de16ba:	bf08      	it	eq
c0de16bc:	e8bd 81f0 	ldmiaeq.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de16c0:	f851 3022 	ldr.w	r3, [r1, r2, lsl #2]
c0de16c4:	f103 047f 	add.w	r4, r3, #127	@ 0x7f
c0de16c8:	11e4      	asrs	r4, r4, #7
c0de16ca:	fb04 f40c 	mul.w	r4, r4, ip
c0de16ce:	f504 0500 	add.w	r5, r4, #8388608	@ 0x800000
c0de16d2:	f1b4 5f2e 	cmp.w	r4, #729808896	@ 0x2b800000
c0de16d6:	4644      	mov	r4, r8
c0de16d8:	ea0e 55e5 	and.w	r5, lr, r5, asr #23
c0de16dc:	bfb8      	it	lt
c0de16de:	fb05 3308 	mlalt	r3, r5, r8, r3
c0de16e2:	42bb      	cmp	r3, r7
c0de16e4:	4634      	mov	r4, r6
c0de16e6:	bfc8      	it	gt
c0de16e8:	4433      	addgt	r3, r6
c0de16ea:	f840 3022 	str.w	r3, [r0, r2, lsl #2]
c0de16ee:	3201      	adds	r2, #1
c0de16f0:	e7e1      	b.n	c0de16b6 <poly_lowbits+0x16>
c0de16f2:	bf00      	nop
c0de16f4:	fffe8c00 	.word	0xfffe8c00
c0de16f8:	ff801fff 	.word	0xff801fff
c0de16fc:	003ff000 	.word	0x003ff000

c0de1700 <unpack_sk_s1>:
c0de1700:	eb02 0242 	add.w	r2, r2, r2, lsl #1
c0de1704:	eb01 1142 	add.w	r1, r1, r2, lsl #5
c0de1708:	3180      	adds	r1, #128	@ 0x80
c0de170a:	f001 bb1e 	b.w	c0de2d4a <small_polyeta_unpack>

c0de170e <unpack_sk_s2>:
c0de170e:	eb02 0242 	add.w	r2, r2, r2, lsl #1
c0de1712:	eb01 1142 	add.w	r1, r1, r2, lsl #5
c0de1716:	f501 7100 	add.w	r1, r1, #512	@ 0x200
c0de171a:	f001 bb16 	b.w	c0de2d4a <small_polyeta_unpack>

c0de171e <polyw_add_idx>:
c0de171e:	b570      	push	{r4, r5, r6, lr}
c0de1720:	4604      	mov	r4, r0
c0de1722:	eb02 0542 	add.w	r5, r2, r2, lsl #1
c0de1726:	1966      	adds	r6, r4, r5
c0de1728:	5d40      	ldrb	r0, [r0, r5]
c0de172a:	7872      	ldrb	r2, [r6, #1]
c0de172c:	78b3      	ldrb	r3, [r6, #2]
c0de172e:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de1732:	ea40 4003 	orr.w	r0, r0, r3, lsl #16
c0de1736:	4408      	add	r0, r1
c0de1738:	f000 fd88 	bl	c0de224c <pqcrystals_dilithium2_lowram_freeze>
c0de173c:	0c01      	lsrs	r1, r0, #16
c0de173e:	5560      	strb	r0, [r4, r5]
c0de1740:	0a00      	lsrs	r0, r0, #8
c0de1742:	70b1      	strb	r1, [r6, #2]
c0de1744:	7070      	strb	r0, [r6, #1]
c0de1746:	bd70      	pop	{r4, r5, r6, pc}

c0de1748 <poly_uniform_pointwise_montgomery_polywadd_lowram_eth>:
c0de1748:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de174c:	f5ad 7d06 	sub.w	sp, sp, #536	@ 0x218
c0de1750:	f10d 0808 	add.w	r8, sp, #8
c0de1754:	4683      	mov	fp, r0
c0de1756:	461e      	mov	r6, r3
c0de1758:	4617      	mov	r7, r2
c0de175a:	468a      	mov	sl, r1
c0de175c:	4640      	mov	r0, r8
c0de175e:	f7ff fc85 	bl	c0de106c <inner_keccak256_init>
c0de1762:	4640      	mov	r0, r8
c0de1764:	4639      	mov	r1, r7
c0de1766:	2220      	movs	r2, #32
c0de1768:	f7ff fc91 	bl	c0de108e <inner_keccak256_inject>
c0de176c:	0a30      	lsrs	r0, r6, #8
c0de176e:	f10d 0106 	add.w	r1, sp, #6
c0de1772:	2202      	movs	r2, #2
c0de1774:	f88d 6006 	strb.w	r6, [sp, #6]
c0de1778:	f88d 0007 	strb.w	r0, [sp, #7]
c0de177c:	4640      	mov	r0, r8
c0de177e:	f7ff fc86 	bl	c0de108e <inner_keccak256_inject>
c0de1782:	4640      	mov	r0, r8
c0de1784:	f7ff fc95 	bl	c0de10b2 <inner_keccak256_flip>
c0de1788:	4c10      	ldr	r4, [pc, #64]	@ (c0de17cc <poly_uniform_pointwise_montgomery_polywadd_lowram_eth+0x84>)
c0de178a:	2700      	movs	r7, #0
c0de178c:	f20d 260f 	addw	r6, sp, #527	@ 0x20f
c0de1790:	4640      	mov	r0, r8
c0de1792:	4631      	mov	r1, r6
c0de1794:	2209      	movs	r2, #9
c0de1796:	f7ff fca2 	bl	c0de10de <inner_keccak256_extract>
c0de179a:	2500      	movs	r5, #0
c0de179c:	2d06      	cmp	r5, #6
c0de179e:	bf98      	it	ls
c0de17a0:	f5b7 7f80 	cmpls.w	r7, #256	@ 0x100
c0de17a4:	d20b      	bcs.n	c0de17be <poly_uniform_pointwise_montgomery_polywadd_lowram_eth+0x76>
c0de17a6:	f000 f99a 	bl	c0de1ade <OUTLINED_FUNCTION_0>
c0de17aa:	d806      	bhi.n	c0de17ba <poly_uniform_pointwise_montgomery_polywadd_lowram_eth+0x72>
c0de17ac:	f85a 1027 	ldr.w	r1, [sl, r7, lsl #2]
c0de17b0:	f000 f9b0 	bl	c0de1b14 <OUTLINED_FUNCTION_3>
c0de17b4:	f000 f9b2 	bl	c0de1b1c <OUTLINED_FUNCTION_4>
c0de17b8:	3701      	adds	r7, #1
c0de17ba:	3503      	adds	r5, #3
c0de17bc:	e7ee      	b.n	c0de179c <poly_uniform_pointwise_montgomery_polywadd_lowram_eth+0x54>
c0de17be:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de17c2:	d3e5      	bcc.n	c0de1790 <poly_uniform_pointwise_montgomery_polywadd_lowram_eth+0x48>
c0de17c4:	f50d 7d06 	add.w	sp, sp, #536	@ 0x218
c0de17c8:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de17cc:	007fe000 	.word	0x007fe000

c0de17d0 <polyz_unpack_inplace>:
c0de17d0:	b5b0      	push	{r4, r5, r7, lr}
c0de17d2:	7801      	ldrb	r1, [r0, #0]
c0de17d4:	7883      	ldrb	r3, [r0, #2]
c0de17d6:	7842      	ldrb	r2, [r0, #1]
c0de17d8:	78c4      	ldrb	r4, [r0, #3]
c0de17da:	7a05      	ldrb	r5, [r0, #8]
c0de17dc:	f363 4111 	bfi	r1, r3, #16, #2
c0de17e0:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de17e4:	79c2      	ldrb	r2, [r0, #7]
c0de17e6:	f5c1 3100 	rsb	r1, r1, #131072	@ 0x20000
c0de17ea:	6001      	str	r1, [r0, #0]
c0de17ec:	7981      	ldrb	r1, [r0, #6]
c0de17ee:	0092      	lsls	r2, r2, #2
c0de17f0:	ea42 1291 	orr.w	r2, r2, r1, lsr #6
c0de17f4:	f001 013f 	and.w	r1, r1, #63	@ 0x3f
c0de17f8:	ea42 2285 	orr.w	r2, r2, r5, lsl #10
c0de17fc:	7945      	ldrb	r5, [r0, #5]
c0de17fe:	f5c2 3200 	rsb	r2, r2, #131072	@ 0x20000
c0de1802:	60c2      	str	r2, [r0, #12]
c0de1804:	7902      	ldrb	r2, [r0, #4]
c0de1806:	012d      	lsls	r5, r5, #4
c0de1808:	ea45 1512 	orr.w	r5, r5, r2, lsr #4
c0de180c:	ea45 3101 	orr.w	r1, r5, r1, lsl #12
c0de1810:	f5c1 3100 	rsb	r1, r1, #131072	@ 0x20000
c0de1814:	6081      	str	r1, [r0, #8]
c0de1816:	0899      	lsrs	r1, r3, #2
c0de1818:	f362 3191 	bfi	r1, r2, #14, #4
c0de181c:	ea41 1184 	orr.w	r1, r1, r4, lsl #6
c0de1820:	f5c1 3100 	rsb	r1, r1, #131072	@ 0x20000
c0de1824:	6041      	str	r1, [r0, #4]
c0de1826:	bdb0      	pop	{r4, r5, r7, pc}

c0de1828 <poly_uniform_gamma1_lowram_eth>:
c0de1828:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de182a:	b085      	sub	sp, #20
c0de182c:	4605      	mov	r5, r0
c0de182e:	4618      	mov	r0, r3
c0de1830:	461c      	mov	r4, r3
c0de1832:	4616      	mov	r6, r2
c0de1834:	460f      	mov	r7, r1
c0de1836:	f7ff fc19 	bl	c0de106c <inner_keccak256_init>
c0de183a:	4620      	mov	r0, r4
c0de183c:	4639      	mov	r1, r7
c0de183e:	2240      	movs	r2, #64	@ 0x40
c0de1840:	f7ff fc25 	bl	c0de108e <inner_keccak256_inject>
c0de1844:	0a30      	lsrs	r0, r6, #8
c0de1846:	f10d 0102 	add.w	r1, sp, #2
c0de184a:	2202      	movs	r2, #2
c0de184c:	f88d 6002 	strb.w	r6, [sp, #2]
c0de1850:	f88d 0003 	strb.w	r0, [sp, #3]
c0de1854:	4620      	mov	r0, r4
c0de1856:	f7ff fc1a 	bl	c0de108e <inner_keccak256_inject>
c0de185a:	4620      	mov	r0, r4
c0de185c:	f7ff fc29 	bl	c0de10b2 <inner_keccak256_flip>
c0de1860:	2700      	movs	r7, #0
c0de1862:	ae01      	add	r6, sp, #4
c0de1864:	2f40      	cmp	r7, #64	@ 0x40
c0de1866:	bf04      	itt	eq
c0de1868:	b005      	addeq	sp, #20
c0de186a:	bdf0      	popeq	{r4, r5, r6, r7, pc}
c0de186c:	4620      	mov	r0, r4
c0de186e:	4631      	mov	r1, r6
c0de1870:	2209      	movs	r2, #9
c0de1872:	f7ff fc34 	bl	c0de10de <inner_keccak256_extract>
c0de1876:	4630      	mov	r0, r6
c0de1878:	f7ff ffaa 	bl	c0de17d0 <polyz_unpack_inplace>
c0de187c:	2000      	movs	r0, #0
c0de187e:	2804      	cmp	r0, #4
c0de1880:	d005      	beq.n	c0de188e <poly_uniform_gamma1_lowram_eth+0x66>
c0de1882:	f856 1020 	ldr.w	r1, [r6, r0, lsl #2]
c0de1886:	f845 1020 	str.w	r1, [r5, r0, lsl #2]
c0de188a:	3001      	adds	r0, #1
c0de188c:	e7f7      	b.n	c0de187e <poly_uniform_gamma1_lowram_eth+0x56>
c0de188e:	3510      	adds	r5, #16
c0de1890:	3701      	adds	r7, #1
c0de1892:	e7e7      	b.n	c0de1864 <poly_uniform_gamma1_lowram_eth+0x3c>

c0de1894 <poly_uniform_gamma1_add_lowram_eth>:
c0de1894:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de1898:	b085      	sub	sp, #20
c0de189a:	f8dd a030 	ldr.w	sl, [sp, #48]	@ 0x30
c0de189e:	4605      	mov	r5, r0
c0de18a0:	461f      	mov	r7, r3
c0de18a2:	4690      	mov	r8, r2
c0de18a4:	460c      	mov	r4, r1
c0de18a6:	4650      	mov	r0, sl
c0de18a8:	f7ff fbe0 	bl	c0de106c <inner_keccak256_init>
c0de18ac:	4650      	mov	r0, sl
c0de18ae:	4641      	mov	r1, r8
c0de18b0:	2240      	movs	r2, #64	@ 0x40
c0de18b2:	f7ff fbec 	bl	c0de108e <inner_keccak256_inject>
c0de18b6:	0a38      	lsrs	r0, r7, #8
c0de18b8:	f10d 0102 	add.w	r1, sp, #2
c0de18bc:	2202      	movs	r2, #2
c0de18be:	f88d 7002 	strb.w	r7, [sp, #2]
c0de18c2:	f88d 0003 	strb.w	r0, [sp, #3]
c0de18c6:	4650      	mov	r0, sl
c0de18c8:	f7ff fbe1 	bl	c0de108e <inner_keccak256_inject>
c0de18cc:	4650      	mov	r0, sl
c0de18ce:	f7ff fbf0 	bl	c0de10b2 <inner_keccak256_flip>
c0de18d2:	2600      	movs	r6, #0
c0de18d4:	af01      	add	r7, sp, #4
c0de18d6:	2e40      	cmp	r6, #64	@ 0x40
c0de18d8:	d011      	beq.n	c0de18fe <poly_uniform_gamma1_add_lowram_eth+0x6a>
c0de18da:	4650      	mov	r0, sl
c0de18dc:	4639      	mov	r1, r7
c0de18de:	2209      	movs	r2, #9
c0de18e0:	f7ff fbfd 	bl	c0de10de <inner_keccak256_extract>
c0de18e4:	4638      	mov	r0, r7
c0de18e6:	f7ff ff73 	bl	c0de17d0 <polyz_unpack_inplace>
c0de18ea:	2000      	movs	r0, #0
c0de18ec:	2804      	cmp	r0, #4
c0de18ee:	d002      	beq.n	c0de18f6 <poly_uniform_gamma1_add_lowram_eth+0x62>
c0de18f0:	f000 f901 	bl	c0de1af6 <OUTLINED_FUNCTION_1>
c0de18f4:	e7fa      	b.n	c0de18ec <poly_uniform_gamma1_add_lowram_eth+0x58>
c0de18f6:	3410      	adds	r4, #16
c0de18f8:	3510      	adds	r5, #16
c0de18fa:	3601      	adds	r6, #1
c0de18fc:	e7eb      	b.n	c0de18d6 <poly_uniform_gamma1_add_lowram_eth+0x42>
c0de18fe:	b005      	add	sp, #20
c0de1900:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}

c0de1904 <poly_make_hint_lowram>:
c0de1904:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de1908:	4686      	mov	lr, r0
c0de190a:	481a      	ldr	r0, [pc, #104]	@ (c0de1974 <poly_make_hint_lowram+0x70>)
c0de190c:	1c93      	adds	r3, r2, #2
c0de190e:	468c      	mov	ip, r1
c0de1910:	2200      	movs	r2, #0
c0de1912:	f642 450b 	movw	r5, #11275	@ 0x2c0b
c0de1916:	2600      	movs	r6, #0
c0de1918:	4680      	mov	r8, r0
c0de191a:	f5b6 7f80 	cmp.w	r6, #256	@ 0x100
c0de191e:	d026      	beq.n	c0de196e <poly_make_hint_lowram+0x6a>
c0de1920:	f813 4c02 	ldrb.w	r4, [r3, #-2]
c0de1924:	f813 1c01 	ldrb.w	r1, [r3, #-1]
c0de1928:	f813 0b03 	ldrb.w	r0, [r3], #3
c0de192c:	f85c 7026 	ldr.w	r7, [ip, r6, lsl #2]
c0de1930:	ea44 2101 	orr.w	r1, r4, r1, lsl #8
c0de1934:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de1938:	307f      	adds	r0, #127	@ 0x7f
c0de193a:	19c1      	adds	r1, r0, r7
c0de193c:	4647      	mov	r7, r8
c0de193e:	11c9      	asrs	r1, r1, #7
c0de1940:	4369      	muls	r1, r5
c0de1942:	f501 0400 	add.w	r4, r1, #8388608	@ 0x800000
c0de1946:	1624      	asrs	r4, r4, #24
c0de1948:	4541      	cmp	r1, r8
c0de194a:	bfc8      	it	gt
c0de194c:	2400      	movgt	r4, #0
c0de194e:	09c0      	lsrs	r0, r0, #7
c0de1950:	4368      	muls	r0, r5
c0de1952:	f500 0100 	add.w	r1, r0, #8388608	@ 0x800000
c0de1956:	0e09      	lsrs	r1, r1, #24
c0de1958:	4540      	cmp	r0, r8
c0de195a:	bf88      	it	hi
c0de195c:	2100      	movhi	r1, #0
c0de195e:	1a60      	subs	r0, r4, r1
c0de1960:	bf18      	it	ne
c0de1962:	2001      	movne	r0, #1
c0de1964:	f84e 0026 	str.w	r0, [lr, r6, lsl #2]
c0de1968:	4402      	add	r2, r0
c0de196a:	3601      	adds	r6, #1
c0de196c:	e7d5      	b.n	c0de191a <poly_make_hint_lowram+0x16>
c0de196e:	4610      	mov	r0, r2
c0de1970:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de1974:	2b7fffff 	.word	0x2b7fffff

c0de1978 <unpack_sig_h_indices>:
c0de1978:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de197c:	f503 6c12 	add.w	ip, r3, #2336	@ 0x920
c0de1980:	b142      	cbz	r2, c0de1994 <unpack_sig_h_indices+0x1c>
c0de1982:	eb02 0e0c 	add.w	lr, r2, ip
c0de1986:	f81e 6f50 	ldrb.w	r6, [lr, #80]!
c0de198a:	f81e 5c01 	ldrb.w	r5, [lr, #-1]
c0de198e:	42b5      	cmp	r5, r6
c0de1990:	d905      	bls.n	c0de199e <unpack_sig_h_indices+0x26>
c0de1992:	e006      	b.n	c0de19a2 <unpack_sig_h_indices+0x2a>
c0de1994:	f893 6970 	ldrb.w	r6, [r3, #2416]	@ 0x970
c0de1998:	f503 6e17 	add.w	lr, r3, #2416	@ 0x970
c0de199c:	2500      	movs	r5, #0
c0de199e:	2e50      	cmp	r6, #80	@ 0x50
c0de19a0:	d902      	bls.n	c0de19a8 <unpack_sig_h_indices+0x30>
c0de19a2:	2001      	movs	r0, #1
c0de19a4:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de19a8:	eb03 0805 	add.w	r8, r3, r5
c0de19ac:	2700      	movs	r7, #0
c0de19ae:	19ea      	adds	r2, r5, r7
c0de19b0:	42b2      	cmp	r2, r6
c0de19b2:	d20e      	bcs.n	c0de19d2 <unpack_sig_h_indices+0x5a>
c0de19b4:	eb08 0407 	add.w	r4, r8, r7
c0de19b8:	42aa      	cmp	r2, r5
c0de19ba:	f894 6920 	ldrb.w	r6, [r4, #2336]	@ 0x920
c0de19be:	d903      	bls.n	c0de19c8 <unpack_sig_h_indices+0x50>
c0de19c0:	f894 291f 	ldrb.w	r2, [r4, #2335]	@ 0x91f
c0de19c4:	4296      	cmp	r6, r2
c0de19c6:	d9ec      	bls.n	c0de19a2 <unpack_sig_h_indices+0x2a>
c0de19c8:	55c6      	strb	r6, [r0, r7]
c0de19ca:	3701      	adds	r7, #1
c0de19cc:	f89e 6000 	ldrb.w	r6, [lr]
c0de19d0:	e7ed      	b.n	c0de19ae <unpack_sig_h_indices+0x36>
c0de19d2:	600f      	str	r7, [r1, #0]
c0de19d4:	f893 0973 	ldrb.w	r0, [r3, #2419]	@ 0x973
c0de19d8:	4601      	mov	r1, r0
c0de19da:	284f      	cmp	r0, #79	@ 0x4f
c0de19dc:	d804      	bhi.n	c0de19e8 <unpack_sig_h_indices+0x70>
c0de19de:	f81c 2001 	ldrb.w	r2, [ip, r1]
c0de19e2:	1c48      	adds	r0, r1, #1
c0de19e4:	2a00      	cmp	r2, #0
c0de19e6:	d0f7      	beq.n	c0de19d8 <unpack_sig_h_indices+0x60>
c0de19e8:	2000      	movs	r0, #0
c0de19ea:	2950      	cmp	r1, #80	@ 0x50
c0de19ec:	bf38      	it	cc
c0de19ee:	2001      	movcc	r0, #1
c0de19f0:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

c0de19f4 <poly_use_hint_lowram>:
c0de19f4:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de19f8:	4698      	mov	r8, r3
c0de19fa:	4615      	mov	r5, r2
c0de19fc:	460e      	mov	r6, r1
c0de19fe:	4607      	mov	r7, r0
c0de1a00:	2400      	movs	r4, #0
c0de1a02:	f5b4 7f80 	cmp.w	r4, #256	@ 0x100
c0de1a06:	bf08      	it	eq
c0de1a08:	e8bd 81f0 	ldmiaeq.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de1a0c:	4628      	mov	r0, r5
c0de1a0e:	4641      	mov	r1, r8
c0de1a10:	b131      	cbz	r1, c0de1a20 <poly_use_hint_lowram+0x2c>
c0de1a12:	f810 2b01 	ldrb.w	r2, [r0], #1
c0de1a16:	3901      	subs	r1, #1
c0de1a18:	4294      	cmp	r4, r2
c0de1a1a:	d1f9      	bne.n	c0de1a10 <poly_use_hint_lowram+0x1c>
c0de1a1c:	2101      	movs	r1, #1
c0de1a1e:	e000      	b.n	c0de1a22 <poly_use_hint_lowram+0x2e>
c0de1a20:	2100      	movs	r1, #0
c0de1a22:	f856 0024 	ldr.w	r0, [r6, r4, lsl #2]
c0de1a26:	f000 fc4b 	bl	c0de22c0 <pqcrystals_dilithium2_lowram_use_hint>
c0de1a2a:	f847 0024 	str.w	r0, [r7, r4, lsl #2]
c0de1a2e:	3401      	adds	r4, #1
c0de1a30:	e7e7      	b.n	c0de1a02 <poly_use_hint_lowram+0xe>

c0de1a32 <pack_pk_rho>:
c0de1a32:	2200      	movs	r2, #0
c0de1a34:	2a20      	cmp	r2, #32
c0de1a36:	bf08      	it	eq
c0de1a38:	4770      	bxeq	lr
c0de1a3a:	5c8b      	ldrb	r3, [r1, r2]
c0de1a3c:	5483      	strb	r3, [r0, r2]
c0de1a3e:	3201      	adds	r2, #1
c0de1a40:	e7f8      	b.n	c0de1a34 <pack_pk_rho+0x2>

c0de1a42 <pack_pk_t1>:
c0de1a42:	eb02 0282 	add.w	r2, r2, r2, lsl #2
c0de1a46:	eb00 1082 	add.w	r0, r0, r2, lsl #6
c0de1a4a:	3020      	adds	r0, #32
c0de1a4c:	f000 bb06 	b.w	c0de205c <pqcrystals_dilithium2_lowram_polyt1_pack>

c0de1a50 <pack_sk_s1>:
c0de1a50:	eb02 0242 	add.w	r2, r2, r2, lsl #1
c0de1a54:	eb00 1042 	add.w	r0, r0, r2, lsl #5
c0de1a58:	3080      	adds	r0, #128	@ 0x80
c0de1a5a:	f000 ba66 	b.w	c0de1f2a <pqcrystals_dilithium2_lowram_polyeta_pack>

c0de1a5e <pack_sk_s2>:
c0de1a5e:	eb02 0242 	add.w	r2, r2, r2, lsl #1
c0de1a62:	eb00 1042 	add.w	r0, r0, r2, lsl #5
c0de1a66:	f500 7000 	add.w	r0, r0, #512	@ 0x200
c0de1a6a:	f000 ba5e 	b.w	c0de1f2a <pqcrystals_dilithium2_lowram_polyeta_pack>

c0de1a6e <pack_sk_t0>:
c0de1a6e:	f44f 73d0 	mov.w	r3, #416	@ 0x1a0
c0de1a72:	fb02 0003 	mla	r0, r2, r3, r0
c0de1a76:	f500 7060 	add.w	r0, r0, #896	@ 0x380
c0de1a7a:	f000 bb13 	b.w	c0de20a4 <pqcrystals_dilithium2_lowram_polyt0_pack>

c0de1a7e <pack_sk_rho>:
c0de1a7e:	2200      	movs	r2, #0
c0de1a80:	2a20      	cmp	r2, #32
c0de1a82:	bf08      	it	eq
c0de1a84:	4770      	bxeq	lr
c0de1a86:	5c8b      	ldrb	r3, [r1, r2]
c0de1a88:	5483      	strb	r3, [r0, r2]
c0de1a8a:	3201      	adds	r2, #1
c0de1a8c:	e7f8      	b.n	c0de1a80 <pack_sk_rho+0x2>

c0de1a8e <pack_sk_key>:
c0de1a8e:	3020      	adds	r0, #32
c0de1a90:	2200      	movs	r2, #0
c0de1a92:	2a20      	cmp	r2, #32
c0de1a94:	bf08      	it	eq
c0de1a96:	4770      	bxeq	lr
c0de1a98:	5c8b      	ldrb	r3, [r1, r2]
c0de1a9a:	5483      	strb	r3, [r0, r2]
c0de1a9c:	3201      	adds	r2, #1
c0de1a9e:	e7f8      	b.n	c0de1a92 <pack_sk_key+0x4>

c0de1aa0 <pack_sk_tr>:
c0de1aa0:	3040      	adds	r0, #64	@ 0x40
c0de1aa2:	2200      	movs	r2, #0
c0de1aa4:	2a40      	cmp	r2, #64	@ 0x40
c0de1aa6:	bf08      	it	eq
c0de1aa8:	4770      	bxeq	lr
c0de1aaa:	5c8b      	ldrb	r3, [r1, r2]
c0de1aac:	5483      	strb	r3, [r0, r2]
c0de1aae:	3201      	adds	r2, #1
c0de1ab0:	e7f8      	b.n	c0de1aa4 <pack_sk_tr+0x4>

c0de1ab2 <pqcrystals_dilithium2_lowram_poly_pointwise_acc_montgomery>:
c0de1ab2:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de1ab4:	4614      	mov	r4, r2
c0de1ab6:	460d      	mov	r5, r1
c0de1ab8:	4606      	mov	r6, r0
c0de1aba:	2700      	movs	r7, #0
c0de1abc:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de1ac0:	bf08      	it	eq
c0de1ac2:	bdf8      	popeq	{r3, r4, r5, r6, r7, pc}
c0de1ac4:	f855 0027 	ldr.w	r0, [r5, r7, lsl #2]
c0de1ac8:	f854 1027 	ldr.w	r1, [r4, r7, lsl #2]
c0de1acc:	f000 f822 	bl	c0de1b14 <OUTLINED_FUNCTION_3>
c0de1ad0:	f856 1027 	ldr.w	r1, [r6, r7, lsl #2]
c0de1ad4:	4408      	add	r0, r1
c0de1ad6:	f846 0027 	str.w	r0, [r6, r7, lsl #2]
c0de1ada:	3701      	adds	r7, #1
c0de1adc:	e7ee      	b.n	c0de1abc <pqcrystals_dilithium2_lowram_poly_pointwise_acc_montgomery+0xa>

c0de1ade <OUTLINED_FUNCTION_0>:
c0de1ade:	1971      	adds	r1, r6, r5
c0de1ae0:	5d70      	ldrb	r0, [r6, r5]
c0de1ae2:	784a      	ldrb	r2, [r1, #1]
c0de1ae4:	7889      	ldrb	r1, [r1, #2]
c0de1ae6:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de1aea:	f001 017f 	and.w	r1, r1, #127	@ 0x7f
c0de1aee:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de1af2:	42a0      	cmp	r0, r4
c0de1af4:	4770      	bx	lr

c0de1af6 <OUTLINED_FUNCTION_1>:
c0de1af6:	f857 1020 	ldr.w	r1, [r7, r0, lsl #2]
c0de1afa:	f854 2020 	ldr.w	r2, [r4, r0, lsl #2]
c0de1afe:	4411      	add	r1, r2
c0de1b00:	f845 1020 	str.w	r1, [r5, r0, lsl #2]
c0de1b04:	3001      	adds	r0, #1
c0de1b06:	4770      	bx	lr

c0de1b08 <OUTLINED_FUNCTION_2>:
c0de1b08:	f815 0b01 	ldrb.w	r0, [r5], #1
c0de1b0c:	2100      	movs	r1, #0
c0de1b0e:	463a      	mov	r2, r7
c0de1b10:	f00a b8b0 	b.w	c0debc74 <__aeabi_llsl>

c0de1b14 <OUTLINED_FUNCTION_3>:
c0de1b14:	fb81 0100 	smull	r0, r1, r1, r0
c0de1b18:	f000 bb7a 	b.w	c0de2210 <pqcrystals_dilithium2_lowram_montgomery_reduce>

c0de1b1c <OUTLINED_FUNCTION_4>:
c0de1b1c:	4601      	mov	r1, r0
c0de1b1e:	4658      	mov	r0, fp
c0de1b20:	463a      	mov	r2, r7
c0de1b22:	f7ff bdfc 	b.w	c0de171e <polyw_add_idx>
	...

c0de1b28 <pqcrystals_dilithium2_lowram_ntt>:
c0de1b28:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de1b2c:	4604      	mov	r4, r0
c0de1b2e:	4817      	ldr	r0, [pc, #92]	@ (c0de1b8c <pqcrystals_dilithium2_lowram_ntt+0x64>)
c0de1b30:	f04f 0880 	mov.w	r8, #128	@ 0x80
c0de1b34:	f04f 0a00 	mov.w	sl, #0
c0de1b38:	4478      	add	r0, pc
c0de1b3a:	9001      	str	r0, [sp, #4]
c0de1b3c:	f1b8 0f00 	cmp.w	r8, #0
c0de1b40:	bf08      	it	eq
c0de1b42:	e8bd 8dfc 	ldmiaeq.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de1b46:	2700      	movs	r7, #0
c0de1b48:	2fff      	cmp	r7, #255	@ 0xff
c0de1b4a:	d81c      	bhi.n	c0de1b86 <pqcrystals_dilithium2_lowram_ntt+0x5e>
c0de1b4c:	9801      	ldr	r0, [sp, #4]
c0de1b4e:	f10a 0a01 	add.w	sl, sl, #1
c0de1b52:	eb07 0608 	add.w	r6, r7, r8
c0de1b56:	4635      	mov	r5, r6
c0de1b58:	f850 b02a 	ldr.w	fp, [r0, sl, lsl #2]
c0de1b5c:	42b7      	cmp	r7, r6
c0de1b5e:	d210      	bcs.n	c0de1b82 <pqcrystals_dilithium2_lowram_ntt+0x5a>
c0de1b60:	f854 0025 	ldr.w	r0, [r4, r5, lsl #2]
c0de1b64:	fb80 010b 	smull	r0, r1, r0, fp
c0de1b68:	f000 fb52 	bl	c0de2210 <pqcrystals_dilithium2_lowram_montgomery_reduce>
c0de1b6c:	f854 1027 	ldr.w	r1, [r4, r7, lsl #2]
c0de1b70:	180a      	adds	r2, r1, r0
c0de1b72:	1a08      	subs	r0, r1, r0
c0de1b74:	f844 2027 	str.w	r2, [r4, r7, lsl #2]
c0de1b78:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de1b7c:	3501      	adds	r5, #1
c0de1b7e:	3701      	adds	r7, #1
c0de1b80:	e7ec      	b.n	c0de1b5c <pqcrystals_dilithium2_lowram_ntt+0x34>
c0de1b82:	462f      	mov	r7, r5
c0de1b84:	e7e0      	b.n	c0de1b48 <pqcrystals_dilithium2_lowram_ntt+0x20>
c0de1b86:	ea4f 0858 	mov.w	r8, r8, lsr #1
c0de1b8a:	e7d7      	b.n	c0de1b3c <pqcrystals_dilithium2_lowram_ntt+0x14>
c0de1b8c:	0000d0c4 	.word	0x0000d0c4

c0de1b90 <pqcrystals_dilithium2_lowram_invntt_tomont>:
c0de1b90:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de1b94:	4604      	mov	r4, r0
c0de1b96:	4822      	ldr	r0, [pc, #136]	@ (c0de1c20 <pqcrystals_dilithium2_lowram_invntt_tomont+0x90>)
c0de1b98:	f04f 0801 	mov.w	r8, #1
c0de1b9c:	f44f 7a80 	mov.w	sl, #256	@ 0x100
c0de1ba0:	4478      	add	r0, pc
c0de1ba2:	9001      	str	r0, [sp, #4]
c0de1ba4:	f1b8 0fff 	cmp.w	r8, #255	@ 0xff
c0de1ba8:	d828      	bhi.n	c0de1bfc <pqcrystals_dilithium2_lowram_invntt_tomont+0x6c>
c0de1baa:	2700      	movs	r7, #0
c0de1bac:	2fff      	cmp	r7, #255	@ 0xff
c0de1bae:	d822      	bhi.n	c0de1bf6 <pqcrystals_dilithium2_lowram_invntt_tomont+0x66>
c0de1bb0:	9801      	ldr	r0, [sp, #4]
c0de1bb2:	f1aa 0a01 	sub.w	sl, sl, #1
c0de1bb6:	eb07 0608 	add.w	r6, r7, r8
c0de1bba:	4635      	mov	r5, r6
c0de1bbc:	f850 002a 	ldr.w	r0, [r0, sl, lsl #2]
c0de1bc0:	f1c0 0b00 	rsb	fp, r0, #0
c0de1bc4:	42b7      	cmp	r7, r6
c0de1bc6:	d214      	bcs.n	c0de1bf2 <pqcrystals_dilithium2_lowram_invntt_tomont+0x62>
c0de1bc8:	f854 0027 	ldr.w	r0, [r4, r7, lsl #2]
c0de1bcc:	f854 1025 	ldr.w	r1, [r4, r5, lsl #2]
c0de1bd0:	4401      	add	r1, r0
c0de1bd2:	f844 1027 	str.w	r1, [r4, r7, lsl #2]
c0de1bd6:	f854 1025 	ldr.w	r1, [r4, r5, lsl #2]
c0de1bda:	1a40      	subs	r0, r0, r1
c0de1bdc:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de1be0:	fb80 010b 	smull	r0, r1, r0, fp
c0de1be4:	f000 fb14 	bl	c0de2210 <pqcrystals_dilithium2_lowram_montgomery_reduce>
c0de1be8:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de1bec:	3501      	adds	r5, #1
c0de1bee:	3701      	adds	r7, #1
c0de1bf0:	e7e8      	b.n	c0de1bc4 <pqcrystals_dilithium2_lowram_invntt_tomont+0x34>
c0de1bf2:	462f      	mov	r7, r5
c0de1bf4:	e7da      	b.n	c0de1bac <pqcrystals_dilithium2_lowram_invntt_tomont+0x1c>
c0de1bf6:	ea4f 0848 	mov.w	r8, r8, lsl #1
c0de1bfa:	e7d3      	b.n	c0de1ba4 <pqcrystals_dilithium2_lowram_invntt_tomont+0x14>
c0de1bfc:	2500      	movs	r5, #0
c0de1bfe:	f24a 36fa 	movw	r6, #41978	@ 0xa3fa
c0de1c02:	f5b5 7f80 	cmp.w	r5, #256	@ 0x100
c0de1c06:	bf08      	it	eq
c0de1c08:	e8bd 8dfc 	ldmiaeq.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de1c0c:	f854 0025 	ldr.w	r0, [r4, r5, lsl #2]
c0de1c10:	fb80 0106 	smull	r0, r1, r0, r6
c0de1c14:	f000 fafc 	bl	c0de2210 <pqcrystals_dilithium2_lowram_montgomery_reduce>
c0de1c18:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de1c1c:	3501      	adds	r5, #1
c0de1c1e:	e7f0      	b.n	c0de1c02 <pqcrystals_dilithium2_lowram_invntt_tomont+0x72>
c0de1c20:	0000d05c 	.word	0x0000d05c

c0de1c24 <pqcrystals_dilithium2_lowram_poly_reduce>:
c0de1c24:	b5b0      	push	{r4, r5, r7, lr}
c0de1c26:	4604      	mov	r4, r0
c0de1c28:	2500      	movs	r5, #0
c0de1c2a:	f5b5 7f80 	cmp.w	r5, #256	@ 0x100
c0de1c2e:	bf08      	it	eq
c0de1c30:	bdb0      	popeq	{r4, r5, r7, pc}
c0de1c32:	f854 0025 	ldr.w	r0, [r4, r5, lsl #2]
c0de1c36:	f000 faf7 	bl	c0de2228 <pqcrystals_dilithium2_lowram_reduce32>
c0de1c3a:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de1c3e:	3501      	adds	r5, #1
c0de1c40:	e7f3      	b.n	c0de1c2a <pqcrystals_dilithium2_lowram_poly_reduce+0x6>

c0de1c42 <pqcrystals_dilithium2_lowram_poly_caddq>:
c0de1c42:	b5b0      	push	{r4, r5, r7, lr}
c0de1c44:	4604      	mov	r4, r0
c0de1c46:	2500      	movs	r5, #0
c0de1c48:	f5b5 7f80 	cmp.w	r5, #256	@ 0x100
c0de1c4c:	bf08      	it	eq
c0de1c4e:	bdb0      	popeq	{r4, r5, r7, pc}
c0de1c50:	f854 0025 	ldr.w	r0, [r4, r5, lsl #2]
c0de1c54:	f000 faf2 	bl	c0de223c <pqcrystals_dilithium2_lowram_caddq>
c0de1c58:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de1c5c:	3501      	adds	r5, #1
c0de1c5e:	e7f3      	b.n	c0de1c48 <pqcrystals_dilithium2_lowram_poly_caddq+0x6>

c0de1c60 <pqcrystals_dilithium2_lowram_poly_add>:
c0de1c60:	b5b0      	push	{r4, r5, r7, lr}
c0de1c62:	2300      	movs	r3, #0
c0de1c64:	f5b3 7f80 	cmp.w	r3, #256	@ 0x100
c0de1c68:	bf08      	it	eq
c0de1c6a:	bdb0      	popeq	{r4, r5, r7, pc}
c0de1c6c:	f851 4023 	ldr.w	r4, [r1, r3, lsl #2]
c0de1c70:	f852 5023 	ldr.w	r5, [r2, r3, lsl #2]
c0de1c74:	442c      	add	r4, r5
c0de1c76:	f840 4023 	str.w	r4, [r0, r3, lsl #2]
c0de1c7a:	3301      	adds	r3, #1
c0de1c7c:	e7f2      	b.n	c0de1c64 <pqcrystals_dilithium2_lowram_poly_add+0x4>

c0de1c7e <pqcrystals_dilithium2_lowram_poly_ntt>:
c0de1c7e:	f7ff bf53 	b.w	c0de1b28 <pqcrystals_dilithium2_lowram_ntt>

c0de1c82 <pqcrystals_dilithium2_lowram_poly_invntt_tomont>:
c0de1c82:	f7ff bf85 	b.w	c0de1b90 <pqcrystals_dilithium2_lowram_invntt_tomont>

c0de1c86 <pqcrystals_dilithium2_lowram_poly_pointwise_montgomery>:
c0de1c86:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de1c88:	f000 fab5 	bl	c0de21f6 <OUTLINED_FUNCTION_0>
c0de1c8c:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de1c90:	bf08      	it	eq
c0de1c92:	bdf8      	popeq	{r3, r4, r5, r6, r7, pc}
c0de1c94:	f855 0027 	ldr.w	r0, [r5, r7, lsl #2]
c0de1c98:	f854 1027 	ldr.w	r1, [r4, r7, lsl #2]
c0de1c9c:	fb81 0100 	smull	r0, r1, r1, r0
c0de1ca0:	f000 fab6 	bl	c0de2210 <pqcrystals_dilithium2_lowram_montgomery_reduce>
c0de1ca4:	f846 0027 	str.w	r0, [r6, r7, lsl #2]
c0de1ca8:	3701      	adds	r7, #1
c0de1caa:	e7ef      	b.n	c0de1c8c <pqcrystals_dilithium2_lowram_poly_pointwise_montgomery+0x6>

c0de1cac <pqcrystals_dilithium2_lowram_poly_power2round>:
c0de1cac:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de1cae:	f000 faa2 	bl	c0de21f6 <OUTLINED_FUNCTION_0>
c0de1cb2:	f5b7 6f80 	cmp.w	r7, #1024	@ 0x400
c0de1cb6:	bf08      	it	eq
c0de1cb8:	bdf8      	popeq	{r3, r4, r5, r6, r7, pc}
c0de1cba:	59e1      	ldr	r1, [r4, r7]
c0de1cbc:	19e8      	adds	r0, r5, r7
c0de1cbe:	f000 fad5 	bl	c0de226c <pqcrystals_dilithium2_lowram_power2round>
c0de1cc2:	51f0      	str	r0, [r6, r7]
c0de1cc4:	3704      	adds	r7, #4
c0de1cc6:	e7f4      	b.n	c0de1cb2 <pqcrystals_dilithium2_lowram_poly_power2round+0x6>

c0de1cc8 <pqcrystals_dilithium2_lowram_poly_chknorm>:
c0de1cc8:	4a09      	ldr	r2, [pc, #36]	@ (c0de1cf0 <pqcrystals_dilithium2_lowram_poly_chknorm+0x28>)
c0de1cca:	4291      	cmp	r1, r2
c0de1ccc:	dc0e      	bgt.n	c0de1cec <pqcrystals_dilithium2_lowram_poly_chknorm+0x24>
c0de1cce:	2200      	movs	r2, #0
c0de1cd0:	f5b2 7f80 	cmp.w	r2, #256	@ 0x100
c0de1cd4:	bf04      	itt	eq
c0de1cd6:	2000      	moveq	r0, #0
c0de1cd8:	4770      	bxeq	lr
c0de1cda:	f850 3022 	ldr.w	r3, [r0, r2, lsl #2]
c0de1cde:	2b00      	cmp	r3, #0
c0de1ce0:	bf48      	it	mi
c0de1ce2:	eba3 0343 	submi.w	r3, r3, r3, lsl #1
c0de1ce6:	3201      	adds	r2, #1
c0de1ce8:	428b      	cmp	r3, r1
c0de1cea:	dbf1      	blt.n	c0de1cd0 <pqcrystals_dilithium2_lowram_poly_chknorm+0x8>
c0de1cec:	2001      	movs	r0, #1
c0de1cee:	4770      	bx	lr
c0de1cf0:	000ffc00 	.word	0x000ffc00

c0de1cf4 <pqcrystals_dilithium2_lowram_poly_uniform>:
c0de1cf4:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de1cf8:	f5ad 6daa 	sub.w	sp, sp, #1360	@ 0x550
c0de1cfc:	46e8      	mov	r8, sp
c0de1cfe:	4683      	mov	fp, r0
c0de1d00:	460d      	mov	r5, r1
c0de1d02:	f8ad 254e 	strh.w	r2, [sp, #1358]	@ 0x54e
c0de1d06:	4640      	mov	r0, r8
c0de1d08:	f7ff f9b0 	bl	c0de106c <inner_keccak256_init>
c0de1d0c:	4640      	mov	r0, r8
c0de1d0e:	4629      	mov	r1, r5
c0de1d10:	2220      	movs	r2, #32
c0de1d12:	f7ff f9bc 	bl	c0de108e <inner_keccak256_inject>
c0de1d16:	f20d 514e 	addw	r1, sp, #1358	@ 0x54e
c0de1d1a:	4640      	mov	r0, r8
c0de1d1c:	2202      	movs	r2, #2
c0de1d1e:	f7ff f9b6 	bl	c0de108e <inner_keccak256_inject>
c0de1d22:	4640      	mov	r0, r8
c0de1d24:	f7ff f9c5 	bl	c0de10b2 <inner_keccak256_flip>
c0de1d28:	ae81      	add	r6, sp, #516	@ 0x204
c0de1d2a:	4640      	mov	r0, r8
c0de1d2c:	f44f 7252 	mov.w	r2, #840	@ 0x348
c0de1d30:	f44f 7752 	mov.w	r7, #840	@ 0x348
c0de1d34:	4631      	mov	r1, r6
c0de1d36:	f7ff f9d2 	bl	c0de10de <inner_keccak256_extract>
c0de1d3a:	4658      	mov	r0, fp
c0de1d3c:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de1d40:	4632      	mov	r2, r6
c0de1d42:	f44f 7352 	mov.w	r3, #840	@ 0x348
c0de1d46:	f000 f827 	bl	c0de1d98 <rej_uniform>
c0de1d4a:	4605      	mov	r5, r0
c0de1d4c:	f04f 0a03 	mov.w	sl, #3
c0de1d50:	2dff      	cmp	r5, #255	@ 0xff
c0de1d52:	d81d      	bhi.n	c0de1d90 <pqcrystals_dilithium2_lowram_poly_uniform+0x9c>
c0de1d54:	fbb7 f0fa 	udiv	r0, r7, sl
c0de1d58:	4631      	mov	r1, r6
c0de1d5a:	eb00 0040 	add.w	r0, r0, r0, lsl #1
c0de1d5e:	1a3c      	subs	r4, r7, r0
c0de1d60:	42b8      	cmp	r0, r7
c0de1d62:	d004      	beq.n	c0de1d6e <pqcrystals_dilithium2_lowram_poly_uniform+0x7a>
c0de1d64:	5c0a      	ldrb	r2, [r1, r0]
c0de1d66:	3f01      	subs	r7, #1
c0de1d68:	700a      	strb	r2, [r1, #0]
c0de1d6a:	3101      	adds	r1, #1
c0de1d6c:	e7f8      	b.n	c0de1d60 <pqcrystals_dilithium2_lowram_poly_uniform+0x6c>
c0de1d6e:	1931      	adds	r1, r6, r4
c0de1d70:	4640      	mov	r0, r8
c0de1d72:	22a8      	movs	r2, #168	@ 0xa8
c0de1d74:	f7ff f9b3 	bl	c0de10de <inner_keccak256_extract>
c0de1d78:	f044 07a8 	orr.w	r7, r4, #168	@ 0xa8
c0de1d7c:	eb0b 0085 	add.w	r0, fp, r5, lsl #2
c0de1d80:	f5c5 7180 	rsb	r1, r5, #256	@ 0x100
c0de1d84:	4632      	mov	r2, r6
c0de1d86:	463b      	mov	r3, r7
c0de1d88:	f000 f806 	bl	c0de1d98 <rej_uniform>
c0de1d8c:	4405      	add	r5, r0
c0de1d8e:	e7df      	b.n	c0de1d50 <pqcrystals_dilithium2_lowram_poly_uniform+0x5c>
c0de1d90:	f50d 6daa 	add.w	sp, sp, #1360	@ 0x550
c0de1d94:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de1d98 <rej_uniform>:
c0de1d98:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de1d9a:	4c0f      	ldr	r4, [pc, #60]	@ (c0de1dd8 <rej_uniform+0x40>)
c0de1d9c:	4684      	mov	ip, r0
c0de1d9e:	2000      	movs	r0, #0
c0de1da0:	2700      	movs	r7, #0
c0de1da2:	46a6      	mov	lr, r4
c0de1da4:	4288      	cmp	r0, r1
c0de1da6:	d215      	bcs.n	c0de1dd4 <rej_uniform+0x3c>
c0de1da8:	1cfe      	adds	r6, r7, #3
c0de1daa:	429e      	cmp	r6, r3
c0de1dac:	d812      	bhi.n	c0de1dd4 <rej_uniform+0x3c>
c0de1dae:	5dd4      	ldrb	r4, [r2, r7]
c0de1db0:	4417      	add	r7, r2
c0de1db2:	787d      	ldrb	r5, [r7, #1]
c0de1db4:	78bf      	ldrb	r7, [r7, #2]
c0de1db6:	ea44 2405 	orr.w	r4, r4, r5, lsl #8
c0de1dba:	f007 057f 	and.w	r5, r7, #127	@ 0x7f
c0de1dbe:	4637      	mov	r7, r6
c0de1dc0:	ea44 4405 	orr.w	r4, r4, r5, lsl #16
c0de1dc4:	4675      	mov	r5, lr
c0de1dc6:	4574      	cmp	r4, lr
c0de1dc8:	d8ec      	bhi.n	c0de1da4 <rej_uniform+0xc>
c0de1dca:	f84c 4020 	str.w	r4, [ip, r0, lsl #2]
c0de1dce:	3001      	adds	r0, #1
c0de1dd0:	4637      	mov	r7, r6
c0de1dd2:	e7e7      	b.n	c0de1da4 <rej_uniform+0xc>
c0de1dd4:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de1dd6:	bf00      	nop
c0de1dd8:	007fe000 	.word	0x007fe000

c0de1ddc <pqcrystals_dilithium2_lowram_poly_uniform_eta>:
c0de1ddc:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de1de0:	f5ad 7d0a 	sub.w	sp, sp, #552	@ 0x228
c0de1de4:	f8ad 2226 	strh.w	r2, [sp, #550]	@ 0x226
c0de1de8:	ac08      	add	r4, sp, #32
c0de1dea:	4682      	mov	sl, r0
c0de1dec:	460e      	mov	r6, r1
c0de1dee:	4620      	mov	r0, r4
c0de1df0:	f7ff f93c 	bl	c0de106c <inner_keccak256_init>
c0de1df4:	4620      	mov	r0, r4
c0de1df6:	4631      	mov	r1, r6
c0de1df8:	2240      	movs	r2, #64	@ 0x40
c0de1dfa:	f7ff f948 	bl	c0de108e <inner_keccak256_inject>
c0de1dfe:	f20d 2126 	addw	r1, sp, #550	@ 0x226
c0de1e02:	4620      	mov	r0, r4
c0de1e04:	2202      	movs	r2, #2
c0de1e06:	f7ff f942 	bl	c0de108e <inner_keccak256_inject>
c0de1e0a:	4620      	mov	r0, r4
c0de1e0c:	f7ff f951 	bl	c0de10b2 <inner_keccak256_flip>
c0de1e10:	f04f 0b00 	mov.w	fp, #0
c0de1e14:	466e      	mov	r6, sp
c0de1e16:	f04f 08cd 	mov.w	r8, #205	@ 0xcd
c0de1e1a:	f1bb 0fff 	cmp.w	fp, #255	@ 0xff
c0de1e1e:	d830      	bhi.n	c0de1e82 <pqcrystals_dilithium2_lowram_poly_uniform_eta+0xa6>
c0de1e20:	a808      	add	r0, sp, #32
c0de1e22:	4631      	mov	r1, r6
c0de1e24:	2220      	movs	r2, #32
c0de1e26:	f7ff f95a 	bl	c0de10de <inner_keccak256_extract>
c0de1e2a:	eb0a 008b 	add.w	r0, sl, fp, lsl #2
c0de1e2e:	f5cb 7280 	rsb	r2, fp, #256	@ 0x100
c0de1e32:	2100      	movs	r1, #0
c0de1e34:	2300      	movs	r3, #0
c0de1e36:	4291      	cmp	r1, r2
c0de1e38:	d221      	bcs.n	c0de1e7e <pqcrystals_dilithium2_lowram_poly_uniform_eta+0xa2>
c0de1e3a:	2b1f      	cmp	r3, #31
c0de1e3c:	d81f      	bhi.n	c0de1e7e <pqcrystals_dilithium2_lowram_poly_uniform_eta+0xa2>
c0de1e3e:	5cf4      	ldrb	r4, [r6, r3]
c0de1e40:	f004 070f 	and.w	r7, r4, #15
c0de1e44:	2f0f      	cmp	r7, #15
c0de1e46:	d009      	beq.n	c0de1e5c <pqcrystals_dilithium2_lowram_poly_uniform_eta+0x80>
c0de1e48:	fb07 f508 	mul.w	r5, r7, r8
c0de1e4c:	0aad      	lsrs	r5, r5, #10
c0de1e4e:	eb05 0585 	add.w	r5, r5, r5, lsl #2
c0de1e52:	1bed      	subs	r5, r5, r7
c0de1e54:	3502      	adds	r5, #2
c0de1e56:	f840 5021 	str.w	r5, [r0, r1, lsl #2]
c0de1e5a:	3101      	adds	r1, #1
c0de1e5c:	0924      	lsrs	r4, r4, #4
c0de1e5e:	2c0f      	cmp	r4, #15
c0de1e60:	d00b      	beq.n	c0de1e7a <pqcrystals_dilithium2_lowram_poly_uniform_eta+0x9e>
c0de1e62:	4291      	cmp	r1, r2
c0de1e64:	d209      	bcs.n	c0de1e7a <pqcrystals_dilithium2_lowram_poly_uniform_eta+0x9e>
c0de1e66:	fb04 f508 	mul.w	r5, r4, r8
c0de1e6a:	0aad      	lsrs	r5, r5, #10
c0de1e6c:	eb05 0585 	add.w	r5, r5, r5, lsl #2
c0de1e70:	1b2c      	subs	r4, r5, r4
c0de1e72:	3402      	adds	r4, #2
c0de1e74:	f840 4021 	str.w	r4, [r0, r1, lsl #2]
c0de1e78:	3101      	adds	r1, #1
c0de1e7a:	3301      	adds	r3, #1
c0de1e7c:	e7db      	b.n	c0de1e36 <pqcrystals_dilithium2_lowram_poly_uniform_eta+0x5a>
c0de1e7e:	448b      	add	fp, r1
c0de1e80:	e7cb      	b.n	c0de1e1a <pqcrystals_dilithium2_lowram_poly_uniform_eta+0x3e>
c0de1e82:	f50d 7d0a 	add.w	sp, sp, #552	@ 0x228
c0de1e86:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de1e8a <pqcrystals_dilithium2_lowram_polyz_unpack>:
c0de1e8a:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de1e8c:	3008      	adds	r0, #8
c0de1e8e:	f04f 0c00 	mov.w	ip, #0
c0de1e92:	f5bc 7f10 	cmp.w	ip, #576	@ 0x240
c0de1e96:	bf08      	it	eq
c0de1e98:	bdf0      	popeq	{r4, r5, r6, r7, pc}
c0de1e9a:	f811 300c 	ldrb.w	r3, [r1, ip]
c0de1e9e:	eb01 040c 	add.w	r4, r1, ip
c0de1ea2:	f10c 0c09 	add.w	ip, ip, #9
c0de1ea6:	f840 3c08 	str.w	r3, [r0, #-8]
c0de1eaa:	7865      	ldrb	r5, [r4, #1]
c0de1eac:	ea43 2305 	orr.w	r3, r3, r5, lsl #8
c0de1eb0:	f840 3c08 	str.w	r3, [r0, #-8]
c0de1eb4:	78a5      	ldrb	r5, [r4, #2]
c0de1eb6:	f365 4311 	bfi	r3, r5, #16, #2
c0de1eba:	f840 3c08 	str.w	r3, [r0, #-8]
c0de1ebe:	f5c3 3300 	rsb	r3, r3, #131072	@ 0x20000
c0de1ec2:	78a5      	ldrb	r5, [r4, #2]
c0de1ec4:	08ae      	lsrs	r6, r5, #2
c0de1ec6:	f840 6c04 	str.w	r6, [r0, #-4]
c0de1eca:	78e6      	ldrb	r6, [r4, #3]
c0de1ecc:	01b6      	lsls	r6, r6, #6
c0de1ece:	ea46 0595 	orr.w	r5, r6, r5, lsr #2
c0de1ed2:	f840 5c04 	str.w	r5, [r0, #-4]
c0de1ed6:	7926      	ldrb	r6, [r4, #4]
c0de1ed8:	f366 3591 	bfi	r5, r6, #14, #4
c0de1edc:	f840 5c04 	str.w	r5, [r0, #-4]
c0de1ee0:	f5c5 3500 	rsb	r5, r5, #131072	@ 0x20000
c0de1ee4:	7926      	ldrb	r6, [r4, #4]
c0de1ee6:	0937      	lsrs	r7, r6, #4
c0de1ee8:	6007      	str	r7, [r0, #0]
c0de1eea:	7967      	ldrb	r7, [r4, #5]
c0de1eec:	013f      	lsls	r7, r7, #4
c0de1eee:	ea47 1616 	orr.w	r6, r7, r6, lsr #4
c0de1ef2:	6006      	str	r6, [r0, #0]
c0de1ef4:	79a7      	ldrb	r7, [r4, #6]
c0de1ef6:	f367 3611 	bfi	r6, r7, #12, #6
c0de1efa:	6006      	str	r6, [r0, #0]
c0de1efc:	f5c6 3600 	rsb	r6, r6, #131072	@ 0x20000
c0de1f00:	79a7      	ldrb	r7, [r4, #6]
c0de1f02:	09ba      	lsrs	r2, r7, #6
c0de1f04:	6042      	str	r2, [r0, #4]
c0de1f06:	79e2      	ldrb	r2, [r4, #7]
c0de1f08:	0092      	lsls	r2, r2, #2
c0de1f0a:	ea42 1297 	orr.w	r2, r2, r7, lsr #6
c0de1f0e:	6042      	str	r2, [r0, #4]
c0de1f10:	7a24      	ldrb	r4, [r4, #8]
c0de1f12:	6006      	str	r6, [r0, #0]
c0de1f14:	f840 5c04 	str.w	r5, [r0, #-4]
c0de1f18:	f840 3c08 	str.w	r3, [r0, #-8]
c0de1f1c:	ea42 2284 	orr.w	r2, r2, r4, lsl #10
c0de1f20:	f5c2 3200 	rsb	r2, r2, #131072	@ 0x20000
c0de1f24:	6042      	str	r2, [r0, #4]
c0de1f26:	3010      	adds	r0, #16
c0de1f28:	e7b3      	b.n	c0de1e92 <pqcrystals_dilithium2_lowram_polyz_unpack+0x8>

c0de1f2a <pqcrystals_dilithium2_lowram_polyeta_pack>:
c0de1f2a:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de1f2e:	3001      	adds	r0, #1
c0de1f30:	2200      	movs	r2, #0
c0de1f32:	2640      	movs	r6, #64	@ 0x40
c0de1f34:	f5b2 6f80 	cmp.w	r2, #1024	@ 0x400
c0de1f38:	bf08      	it	eq
c0de1f3a:	e8bd 8df0 	ldmiaeq.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de1f3e:	188b      	adds	r3, r1, r2
c0de1f40:	f851 8002 	ldr.w	r8, [r1, r2]
c0de1f44:	2710      	movs	r7, #16
c0de1f46:	3220      	adds	r2, #32
c0de1f48:	f103 0b04 	add.w	fp, r3, #4
c0de1f4c:	f103 0e10 	add.w	lr, r3, #16
c0de1f50:	69db      	ldr	r3, [r3, #28]
c0de1f52:	e89b 0830 	ldmia.w	fp, {r4, r5, fp}
c0de1f56:	e89e 5400 	ldmia.w	lr, {sl, ip, lr}
c0de1f5a:	f1c5 0502 	rsb	r5, r5, #2
c0de1f5e:	eba6 1343 	sub.w	r3, r6, r3, lsl #5
c0de1f62:	eba7 04c4 	sub.w	r4, r7, r4, lsl #3
c0de1f66:	f1c8 0702 	rsb	r7, r8, #2
c0de1f6a:	b2ed      	uxtb	r5, r5
c0de1f6c:	433c      	orrs	r4, r7
c0de1f6e:	f1cc 0702 	rsb	r7, ip, #2
c0de1f72:	ea44 1485 	orr.w	r4, r4, r5, lsl #6
c0de1f76:	b2ff      	uxtb	r7, r7
c0de1f78:	f800 4c01 	strb.w	r4, [r0, #-1]
c0de1f7c:	2408      	movs	r4, #8
c0de1f7e:	eba4 048e 	sub.w	r4, r4, lr, lsl #2
c0de1f82:	ea44 0457 	orr.w	r4, r4, r7, lsr #1
c0de1f86:	4323      	orrs	r3, r4
c0de1f88:	2420      	movs	r4, #32
c0de1f8a:	7043      	strb	r3, [r0, #1]
c0de1f8c:	2304      	movs	r3, #4
c0de1f8e:	eba4 140a 	sub.w	r4, r4, sl, lsl #4
c0de1f92:	eba3 034b 	sub.w	r3, r3, fp, lsl #1
c0de1f96:	ea43 0395 	orr.w	r3, r3, r5, lsr #2
c0de1f9a:	4323      	orrs	r3, r4
c0de1f9c:	ea43 13c7 	orr.w	r3, r3, r7, lsl #7
c0de1fa0:	f800 3b03 	strb.w	r3, [r0], #3
c0de1fa4:	e7c6      	b.n	c0de1f34 <pqcrystals_dilithium2_lowram_polyeta_pack+0xa>

c0de1fa6 <pqcrystals_dilithium2_lowram_poly_challenge_eth>:
c0de1fa6:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de1faa:	f5ad 7d10 	sub.w	sp, sp, #576	@ 0x240
c0de1fae:	466e      	mov	r6, sp
c0de1fb0:	4680      	mov	r8, r0
c0de1fb2:	460d      	mov	r5, r1
c0de1fb4:	4630      	mov	r0, r6
c0de1fb6:	f7ff f859 	bl	c0de106c <inner_keccak256_init>
c0de1fba:	4630      	mov	r0, r6
c0de1fbc:	4629      	mov	r1, r5
c0de1fbe:	2220      	movs	r2, #32
c0de1fc0:	f7ff f865 	bl	c0de108e <inner_keccak256_inject>
c0de1fc4:	4630      	mov	r0, r6
c0de1fc6:	f7ff f874 	bl	c0de10b2 <inner_keccak256_flip>
c0de1fca:	ad80      	add	r5, sp, #512	@ 0x200
c0de1fcc:	4630      	mov	r0, r6
c0de1fce:	2208      	movs	r2, #8
c0de1fd0:	4629      	mov	r1, r5
c0de1fd2:	f7ff f884 	bl	c0de10de <inner_keccak256_extract>
c0de1fd6:	2600      	movs	r6, #0
c0de1fd8:	462c      	mov	r4, r5
c0de1fda:	f04f 0b00 	mov.w	fp, #0
c0de1fde:	f04f 0a00 	mov.w	sl, #0
c0de1fe2:	2e40      	cmp	r6, #64	@ 0x40
c0de1fe4:	d007      	beq.n	c0de1ff6 <pqcrystals_dilithium2_lowram_poly_challenge_eth+0x50>
c0de1fe6:	f000 f90b 	bl	c0de2200 <OUTLINED_FUNCTION_1>
c0de1fea:	ea4a 0a01 	orr.w	sl, sl, r1
c0de1fee:	ea4b 0b00 	orr.w	fp, fp, r0
c0de1ff2:	3608      	adds	r6, #8
c0de1ff4:	e7f5      	b.n	c0de1fe2 <pqcrystals_dilithium2_lowram_poly_challenge_eth+0x3c>
c0de1ff6:	2000      	movs	r0, #0
c0de1ff8:	2100      	movs	r1, #0
c0de1ffa:	f5b1 7f80 	cmp.w	r1, #256	@ 0x100
c0de1ffe:	d003      	beq.n	c0de2008 <pqcrystals_dilithium2_lowram_poly_challenge_eth+0x62>
c0de2000:	f848 0021 	str.w	r0, [r8, r1, lsl #2]
c0de2004:	3101      	adds	r1, #1
c0de2006:	e7f8      	b.n	c0de1ffa <pqcrystals_dilithium2_lowram_poly_challenge_eth+0x54>
c0de2008:	2000      	movs	r0, #0
c0de200a:	24d9      	movs	r4, #217	@ 0xd9
c0de200c:	466e      	mov	r6, sp
c0de200e:	2700      	movs	r7, #0
c0de2010:	f5b4 7f80 	cmp.w	r4, #256	@ 0x100
c0de2014:	d01e      	beq.n	c0de2054 <pqcrystals_dilithium2_lowram_poly_challenge_eth+0xae>
c0de2016:	42b8      	cmp	r0, r7
c0de2018:	d306      	bcc.n	c0de2028 <pqcrystals_dilithium2_lowram_poly_challenge_eth+0x82>
c0de201a:	4630      	mov	r0, r6
c0de201c:	4629      	mov	r1, r5
c0de201e:	2240      	movs	r2, #64	@ 0x40
c0de2020:	2740      	movs	r7, #64	@ 0x40
c0de2022:	f7ff f85c 	bl	c0de10de <inner_keccak256_extract>
c0de2026:	2000      	movs	r0, #0
c0de2028:	5c29      	ldrb	r1, [r5, r0]
c0de202a:	3001      	adds	r0, #1
c0de202c:	428c      	cmp	r4, r1
c0de202e:	d3f2      	bcc.n	c0de2016 <pqcrystals_dilithium2_lowram_poly_challenge_eth+0x70>
c0de2030:	f858 2021 	ldr.w	r2, [r8, r1, lsl #2]
c0de2034:	f848 2024 	str.w	r2, [r8, r4, lsl #2]
c0de2038:	ea5f 72cb 	movs.w	r2, fp, lsl #31
c0de203c:	f04f 32ff 	mov.w	r2, #4294967295	@ 0xffffffff
c0de2040:	bf08      	it	eq
c0de2042:	2201      	moveq	r2, #1
c0de2044:	ea5f 0a5a 	movs.w	sl, sl, lsr #1
c0de2048:	f848 2021 	str.w	r2, [r8, r1, lsl #2]
c0de204c:	ea4f 0b3b 	mov.w	fp, fp, rrx
c0de2050:	3401      	adds	r4, #1
c0de2052:	e7dd      	b.n	c0de2010 <pqcrystals_dilithium2_lowram_poly_challenge_eth+0x6a>
c0de2054:	f50d 7d10 	add.w	sp, sp, #576	@ 0x240
c0de2058:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de205c <pqcrystals_dilithium2_lowram_polyt1_pack>:
c0de205c:	b5b0      	push	{r4, r5, r7, lr}
c0de205e:	3108      	adds	r1, #8
c0de2060:	2200      	movs	r2, #0
c0de2062:	f5b2 7fa0 	cmp.w	r2, #320	@ 0x140
c0de2066:	bf08      	it	eq
c0de2068:	bdb0      	popeq	{r4, r5, r7, pc}
c0de206a:	f851 3c08 	ldr.w	r3, [r1, #-8]
c0de206e:	5483      	strb	r3, [r0, r2]
c0de2070:	1883      	adds	r3, r0, r2
c0de2072:	3205      	adds	r2, #5
c0de2074:	e951 4502 	ldrd	r4, r5, [r1, #-8]
c0de2078:	00ad      	lsls	r5, r5, #2
c0de207a:	ea45 2414 	orr.w	r4, r5, r4, lsr #8
c0de207e:	705c      	strb	r4, [r3, #1]
c0de2080:	680d      	ldr	r5, [r1, #0]
c0de2082:	f851 4c04 	ldr.w	r4, [r1, #-4]
c0de2086:	012d      	lsls	r5, r5, #4
c0de2088:	ea45 1494 	orr.w	r4, r5, r4, lsr #6
c0de208c:	709c      	strb	r4, [r3, #2]
c0de208e:	e9d1 4500 	ldrd	r4, r5, [r1]
c0de2092:	01ad      	lsls	r5, r5, #6
c0de2094:	ea45 1414 	orr.w	r4, r5, r4, lsr #4
c0de2098:	70dc      	strb	r4, [r3, #3]
c0de209a:	684c      	ldr	r4, [r1, #4]
c0de209c:	3110      	adds	r1, #16
c0de209e:	08a4      	lsrs	r4, r4, #2
c0de20a0:	711c      	strb	r4, [r3, #4]
c0de20a2:	e7de      	b.n	c0de2062 <pqcrystals_dilithium2_lowram_polyt1_pack+0x6>

c0de20a4 <pqcrystals_dilithium2_lowram_polyt0_pack>:
c0de20a4:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de20a8:	311c      	adds	r1, #28
c0de20aa:	f04f 0c00 	mov.w	ip, #0
c0de20ae:	9000      	str	r0, [sp, #0]
c0de20b0:	f5bc 7fd0 	cmp.w	ip, #416	@ 0x1a0
c0de20b4:	bf08      	it	eq
c0de20b6:	e8bd 8dfc 	ldmiaeq.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de20ba:	f851 0c14 	ldr.w	r0, [r1, #-20]
c0de20be:	e951 a504 	ldrd	sl, r5, [r1, #-16]
c0de20c2:	e951 3807 	ldrd	r3, r8, [r1, #-28]
c0de20c6:	e951 e602 	ldrd	lr, r6, [r1, #-8]
c0de20ca:	f851 7b20 	ldr.w	r7, [r1], #32
c0de20ce:	9001      	str	r0, [sp, #4]
c0de20d0:	9800      	ldr	r0, [sp, #0]
c0de20d2:	f5c7 5780 	rsb	r7, r7, #4096	@ 0x1000
c0de20d6:	f5c3 5b80 	rsb	fp, r3, #4096	@ 0x1000
c0de20da:	f5c5 5580 	rsb	r5, r5, #4096	@ 0x1000
c0de20de:	097b      	lsrs	r3, r7, #5
c0de20e0:	eb00 040c 	add.w	r4, r0, ip
c0de20e4:	f800 b00c 	strb.w	fp, [r0, ip]
c0de20e8:	f10c 0c0d 	add.w	ip, ip, #13
c0de20ec:	7323      	strb	r3, [r4, #12]
c0de20ee:	f5c6 5380 	rsb	r3, r6, #4096	@ 0x1000
c0de20f2:	089e      	lsrs	r6, r3, #2
c0de20f4:	72a6      	strb	r6, [r4, #10]
c0de20f6:	092e      	lsrs	r6, r5, #4
c0de20f8:	71e6      	strb	r6, [r4, #7]
c0de20fa:	f5ca 5680 	rsb	r6, sl, #4096	@ 0x1000
c0de20fe:	0872      	lsrs	r2, r6, #1
c0de2100:	7162      	strb	r2, [r4, #5]
c0de2102:	f5c8 5280 	rsb	r2, r8, #4096	@ 0x1000
c0de2106:	08d0      	lsrs	r0, r2, #3
c0de2108:	70a0      	strb	r0, [r4, #2]
c0de210a:	00f8      	lsls	r0, r7, #3
c0de210c:	ea40 2093 	orr.w	r0, r0, r3, lsr #10
c0de2110:	019b      	lsls	r3, r3, #6
c0de2112:	72e0      	strb	r0, [r4, #11]
c0de2114:	f5ce 5080 	rsb	r0, lr, #4096	@ 0x1000
c0de2118:	ea43 13d0 	orr.w	r3, r3, r0, lsr #7
c0de211c:	0040      	lsls	r0, r0, #1
c0de211e:	ea40 3015 	orr.w	r0, r0, r5, lsr #12
c0de2122:	7263      	strb	r3, [r4, #9]
c0de2124:	01f3      	lsls	r3, r6, #7
c0de2126:	7220      	strb	r0, [r4, #8]
c0de2128:	0128      	lsls	r0, r5, #4
c0de212a:	ea40 2056 	orr.w	r0, r0, r6, lsr #9
c0de212e:	71a0      	strb	r0, [r4, #6]
c0de2130:	9801      	ldr	r0, [sp, #4]
c0de2132:	f5c0 5080 	rsb	r0, r0, #4096	@ 0x1000
c0de2136:	ea43 1390 	orr.w	r3, r3, r0, lsr #6
c0de213a:	0080      	lsls	r0, r0, #2
c0de213c:	ea40 20d2 	orr.w	r0, r0, r2, lsr #11
c0de2140:	7123      	strb	r3, [r4, #4]
c0de2142:	70e0      	strb	r0, [r4, #3]
c0de2144:	0150      	lsls	r0, r2, #5
c0de2146:	ea40 201b 	orr.w	r0, r0, fp, lsr #8
c0de214a:	7060      	strb	r0, [r4, #1]
c0de214c:	e7b0      	b.n	c0de20b0 <pqcrystals_dilithium2_lowram_polyt0_pack+0xc>

c0de214e <pqcrystals_dilithium2_lowram_polyz_pack>:
c0de214e:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de2150:	3108      	adds	r1, #8
c0de2152:	f04f 0e00 	mov.w	lr, #0
c0de2156:	f5be 7f10 	cmp.w	lr, #576	@ 0x240
c0de215a:	bf08      	it	eq
c0de215c:	bdf0      	popeq	{r4, r5, r6, r7, pc}
c0de215e:	e951 3c02 	ldrd	r3, ip, [r1, #-8]
c0de2162:	e8f1 5604 	ldrd	r5, r6, [r1], #16
c0de2166:	eb00 070e 	add.w	r7, r0, lr
c0de216a:	f5c6 3600 	rsb	r6, r6, #131072	@ 0x20000
c0de216e:	f5c3 3300 	rsb	r3, r3, #131072	@ 0x20000
c0de2172:	0ab4      	lsrs	r4, r6, #10
c0de2174:	f800 300e 	strb.w	r3, [r0, lr]
c0de2178:	f10e 0e09 	add.w	lr, lr, #9
c0de217c:	723c      	strb	r4, [r7, #8]
c0de217e:	08b4      	lsrs	r4, r6, #2
c0de2180:	71fc      	strb	r4, [r7, #7]
c0de2182:	f5c5 3400 	rsb	r4, r5, #131072	@ 0x20000
c0de2186:	0925      	lsrs	r5, r4, #4
c0de2188:	717d      	strb	r5, [r7, #5]
c0de218a:	f5cc 3500 	rsb	r5, ip, #131072	@ 0x20000
c0de218e:	09aa      	lsrs	r2, r5, #6
c0de2190:	70fa      	strb	r2, [r7, #3]
c0de2192:	0a1a      	lsrs	r2, r3, #8
c0de2194:	707a      	strb	r2, [r7, #1]
c0de2196:	01b2      	lsls	r2, r6, #6
c0de2198:	ea42 3214 	orr.w	r2, r2, r4, lsr #12
c0de219c:	71ba      	strb	r2, [r7, #6]
c0de219e:	0122      	lsls	r2, r4, #4
c0de21a0:	ea42 3295 	orr.w	r2, r2, r5, lsr #14
c0de21a4:	713a      	strb	r2, [r7, #4]
c0de21a6:	00aa      	lsls	r2, r5, #2
c0de21a8:	ea42 4213 	orr.w	r2, r2, r3, lsr #16
c0de21ac:	70ba      	strb	r2, [r7, #2]
c0de21ae:	e7d2      	b.n	c0de2156 <pqcrystals_dilithium2_lowram_polyz_pack+0x8>

c0de21b0 <pqcrystals_dilithium2_lowram_polyw1_pack>:
c0de21b0:	b5b0      	push	{r4, r5, r7, lr}
c0de21b2:	3001      	adds	r0, #1
c0de21b4:	2200      	movs	r2, #0
c0de21b6:	f5b2 6f80 	cmp.w	r2, #1024	@ 0x400
c0de21ba:	bf08      	it	eq
c0de21bc:	bdb0      	popeq	{r4, r5, r7, pc}
c0de21be:	588b      	ldr	r3, [r1, r2]
c0de21c0:	188c      	adds	r4, r1, r2
c0de21c2:	3210      	adds	r2, #16
c0de21c4:	f800 3c01 	strb.w	r3, [r0, #-1]
c0de21c8:	6865      	ldr	r5, [r4, #4]
c0de21ca:	ea43 1385 	orr.w	r3, r3, r5, lsl #6
c0de21ce:	f800 3c01 	strb.w	r3, [r0, #-1]
c0de21d2:	6863      	ldr	r3, [r4, #4]
c0de21d4:	089d      	lsrs	r5, r3, #2
c0de21d6:	7005      	strb	r5, [r0, #0]
c0de21d8:	68a5      	ldr	r5, [r4, #8]
c0de21da:	012d      	lsls	r5, r5, #4
c0de21dc:	ea45 0393 	orr.w	r3, r5, r3, lsr #2
c0de21e0:	7003      	strb	r3, [r0, #0]
c0de21e2:	68a3      	ldr	r3, [r4, #8]
c0de21e4:	091d      	lsrs	r5, r3, #4
c0de21e6:	7045      	strb	r5, [r0, #1]
c0de21e8:	68e4      	ldr	r4, [r4, #12]
c0de21ea:	00a4      	lsls	r4, r4, #2
c0de21ec:	ea44 1313 	orr.w	r3, r4, r3, lsr #4
c0de21f0:	7043      	strb	r3, [r0, #1]
c0de21f2:	3003      	adds	r0, #3
c0de21f4:	e7df      	b.n	c0de21b6 <pqcrystals_dilithium2_lowram_polyw1_pack+0x6>

c0de21f6 <OUTLINED_FUNCTION_0>:
c0de21f6:	4614      	mov	r4, r2
c0de21f8:	460d      	mov	r5, r1
c0de21fa:	4606      	mov	r6, r0
c0de21fc:	2700      	movs	r7, #0
c0de21fe:	4770      	bx	lr

c0de2200 <OUTLINED_FUNCTION_1>:
c0de2200:	f814 0b01 	ldrb.w	r0, [r4], #1
c0de2204:	2100      	movs	r1, #0
c0de2206:	4632      	mov	r2, r6
c0de2208:	f009 bd34 	b.w	c0debc74 <__aeabi_llsl>

c0de220c <randombytes>:
c0de220c:	f009 b90f 	b.w	c0deb42e <cx_rng_no_throw>

c0de2210 <pqcrystals_dilithium2_lowram_montgomery_reduce>:
c0de2210:	4a03      	ldr	r2, [pc, #12]	@ (c0de2220 <pqcrystals_dilithium2_lowram_montgomery_reduce+0x10>)
c0de2212:	4b04      	ldr	r3, [pc, #16]	@ (c0de2224 <pqcrystals_dilithium2_lowram_montgomery_reduce+0x14>)
c0de2214:	4342      	muls	r2, r0
c0de2216:	fbc2 0103 	smlal	r0, r1, r2, r3
c0de221a:	4608      	mov	r0, r1
c0de221c:	4770      	bx	lr
c0de221e:	bf00      	nop
c0de2220:	03802001 	.word	0x03802001
c0de2224:	ff801fff 	.word	0xff801fff

c0de2228 <pqcrystals_dilithium2_lowram_reduce32>:
c0de2228:	f500 0180 	add.w	r1, r0, #4194304	@ 0x400000
c0de222c:	4a02      	ldr	r2, [pc, #8]	@ (c0de2238 <pqcrystals_dilithium2_lowram_reduce32+0x10>)
c0de222e:	15c9      	asrs	r1, r1, #23
c0de2230:	fb01 0002 	mla	r0, r1, r2, r0
c0de2234:	4770      	bx	lr
c0de2236:	bf00      	nop
c0de2238:	ff801fff 	.word	0xff801fff

c0de223c <pqcrystals_dilithium2_lowram_caddq>:
c0de223c:	4902      	ldr	r1, [pc, #8]	@ (c0de2248 <pqcrystals_dilithium2_lowram_caddq+0xc>)
c0de223e:	2800      	cmp	r0, #0
c0de2240:	bf48      	it	mi
c0de2242:	4408      	addmi	r0, r1
c0de2244:	4770      	bx	lr
c0de2246:	bf00      	nop
c0de2248:	007fe001 	.word	0x007fe001

c0de224c <pqcrystals_dilithium2_lowram_freeze>:
c0de224c:	f500 0180 	add.w	r1, r0, #4194304	@ 0x400000
c0de2250:	4a04      	ldr	r2, [pc, #16]	@ (c0de2264 <pqcrystals_dilithium2_lowram_freeze+0x18>)
c0de2252:	15c9      	asrs	r1, r1, #23
c0de2254:	fb01 0002 	mla	r0, r1, r2, r0
c0de2258:	4903      	ldr	r1, [pc, #12]	@ (c0de2268 <pqcrystals_dilithium2_lowram_freeze+0x1c>)
c0de225a:	2800      	cmp	r0, #0
c0de225c:	bf48      	it	mi
c0de225e:	4408      	addmi	r0, r1
c0de2260:	4770      	bx	lr
c0de2262:	bf00      	nop
c0de2264:	ff801fff 	.word	0xff801fff
c0de2268:	007fe001 	.word	0x007fe001

c0de226c <pqcrystals_dilithium2_lowram_power2round>:
c0de226c:	f601 72ff 	addw	r2, r1, #4095	@ 0xfff
c0de2270:	f641 73ff 	movw	r3, #8191	@ 0x1fff
c0de2274:	ea22 0303 	bic.w	r3, r2, r3
c0de2278:	1ac9      	subs	r1, r1, r3
c0de227a:	6001      	str	r1, [r0, #0]
c0de227c:	1350      	asrs	r0, r2, #13
c0de227e:	4770      	bx	lr

c0de2280 <pqcrystals_dilithium2_lowram_decompose>:
c0de2280:	b510      	push	{r4, lr}
c0de2282:	f101 027f 	add.w	r2, r1, #127	@ 0x7f
c0de2286:	f642 430b 	movw	r3, #11275	@ 0x2c0b
c0de228a:	4c0c      	ldr	r4, [pc, #48]	@ (c0de22bc <pqcrystals_dilithium2_lowram_decompose+0x3c>)
c0de228c:	11d2      	asrs	r2, r2, #7
c0de228e:	4353      	muls	r3, r2
c0de2290:	f503 0200 	add.w	r2, r3, #8388608	@ 0x800000
c0de2294:	1612      	asrs	r2, r2, #24
c0de2296:	f1b3 5f2e 	cmp.w	r3, #729808896	@ 0x2b800000
c0de229a:	4b06      	ldr	r3, [pc, #24]	@ (c0de22b4 <pqcrystals_dilithium2_lowram_decompose+0x34>)
c0de229c:	bfa8      	it	ge
c0de229e:	2200      	movge	r2, #0
c0de22a0:	fb02 1103 	mla	r1, r2, r3, r1
c0de22a4:	4b04      	ldr	r3, [pc, #16]	@ (c0de22b8 <pqcrystals_dilithium2_lowram_decompose+0x38>)
c0de22a6:	42a1      	cmp	r1, r4
c0de22a8:	bfc8      	it	gt
c0de22aa:	4419      	addgt	r1, r3
c0de22ac:	6001      	str	r1, [r0, #0]
c0de22ae:	4610      	mov	r0, r2
c0de22b0:	bd10      	pop	{r4, pc}
c0de22b2:	bf00      	nop
c0de22b4:	fffd1800 	.word	0xfffd1800
c0de22b8:	ff801fff 	.word	0xff801fff
c0de22bc:	003ff000 	.word	0x003ff000

c0de22c0 <pqcrystals_dilithium2_lowram_use_hint>:
c0de22c0:	b51c      	push	{r2, r3, r4, lr}
c0de22c2:	460c      	mov	r4, r1
c0de22c4:	4601      	mov	r1, r0
c0de22c6:	a801      	add	r0, sp, #4
c0de22c8:	f7ff ffda 	bl	c0de2280 <pqcrystals_dilithium2_lowram_decompose>
c0de22cc:	b164      	cbz	r4, c0de22e8 <pqcrystals_dilithium2_lowram_use_hint+0x28>
c0de22ce:	9901      	ldr	r1, [sp, #4]
c0de22d0:	2901      	cmp	r1, #1
c0de22d2:	db04      	blt.n	c0de22de <pqcrystals_dilithium2_lowram_use_hint+0x1e>
c0de22d4:	f1b0 012b 	subs.w	r1, r0, #43	@ 0x2b
c0de22d8:	bf18      	it	ne
c0de22da:	1c41      	addne	r1, r0, #1
c0de22dc:	e003      	b.n	c0de22e6 <pqcrystals_dilithium2_lowram_use_hint+0x26>
c0de22de:	1e41      	subs	r1, r0, #1
c0de22e0:	2800      	cmp	r0, #0
c0de22e2:	bf08      	it	eq
c0de22e4:	212b      	moveq	r1, #43	@ 0x2b
c0de22e6:	4608      	mov	r0, r1
c0de22e8:	bd1c      	pop	{r2, r3, r4, pc}

c0de22ea <pqcrystals_dilithium2_lowram_keypair>:
c0de22ea:	b570      	push	{r4, r5, r6, lr}
c0de22ec:	b088      	sub	sp, #32
c0de22ee:	466e      	mov	r6, sp
c0de22f0:	460c      	mov	r4, r1
c0de22f2:	4605      	mov	r5, r0
c0de22f4:	2120      	movs	r1, #32
c0de22f6:	4630      	mov	r0, r6
c0de22f8:	f7ff ff88 	bl	c0de220c <randombytes>
c0de22fc:	4628      	mov	r0, r5
c0de22fe:	4621      	mov	r1, r4
c0de2300:	4632      	mov	r2, r6
c0de2302:	f000 f803 	bl	c0de230c <crypto_sign_keypair_core>
c0de2306:	2000      	movs	r0, #0
c0de2308:	b008      	add	sp, #32
c0de230a:	bd70      	pop	{r4, r5, r6, pc}

c0de230c <crypto_sign_keypair_core>:
c0de230c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de2310:	f6ad 6d88 	subw	sp, sp, #3720	@ 0xe88
c0de2314:	f60d 6708 	addw	r7, sp, #3592	@ 0xe08
c0de2318:	460d      	mov	r5, r1
c0de231a:	4606      	mov	r6, r0
c0de231c:	4611      	mov	r1, r2
c0de231e:	2220      	movs	r2, #32
c0de2320:	4638      	mov	r0, r7
c0de2322:	f009 fdaf 	bl	c0debe84 <__aeabi_memcpy>
c0de2326:	f240 4004 	movw	r0, #1028	@ 0x404
c0de232a:	f8ad 0e28 	strh.w	r0, [sp, #3624]	@ 0xe28
c0de232e:	ac02      	add	r4, sp, #8
c0de2330:	4620      	mov	r0, r4
c0de2332:	f7fe fe9b 	bl	c0de106c <inner_keccak256_init>
c0de2336:	4620      	mov	r0, r4
c0de2338:	4639      	mov	r1, r7
c0de233a:	2222      	movs	r2, #34	@ 0x22
c0de233c:	f7fe fea7 	bl	c0de108e <inner_keccak256_inject>
c0de2340:	f000 fbca 	bl	c0de2ad8 <OUTLINED_FUNCTION_0>
c0de2344:	4620      	mov	r0, r4
c0de2346:	4639      	mov	r1, r7
c0de2348:	2280      	movs	r2, #128	@ 0x80
c0de234a:	f7fe fec8 	bl	c0de10de <inner_keccak256_extract>
c0de234e:	4628      	mov	r0, r5
c0de2350:	4639      	mov	r1, r7
c0de2352:	f7ff fb94 	bl	c0de1a7e <pack_sk_rho>
c0de2356:	f107 0160 	add.w	r1, r7, #96	@ 0x60
c0de235a:	4628      	mov	r0, r5
c0de235c:	9501      	str	r5, [sp, #4]
c0de235e:	f7ff fb96 	bl	c0de1a8e <pack_sk_key>
c0de2362:	4630      	mov	r0, r6
c0de2364:	4639      	mov	r1, r7
c0de2366:	9600      	str	r6, [sp, #0]
c0de2368:	f7ff fb63 	bl	c0de1a32 <pack_pk_rho>
c0de236c:	3720      	adds	r7, #32
c0de236e:	f04f 0b00 	mov.w	fp, #0
c0de2372:	ad82      	add	r5, sp, #520	@ 0x208
c0de2374:	f50d 64c1 	add.w	r4, sp, #1544	@ 0x608
c0de2378:	f60d 2608 	addw	r6, sp, #2568	@ 0xa08
c0de237c:	f04f 0800 	mov.w	r8, #0
c0de2380:	f1b8 0f04 	cmp.w	r8, #4
c0de2384:	d072      	beq.n	c0de246c <crypto_sign_keypair_core+0x160>
c0de2386:	4628      	mov	r0, r5
c0de2388:	4639      	mov	r1, r7
c0de238a:	2200      	movs	r2, #0
c0de238c:	f7ff fd26 	bl	c0de1ddc <pqcrystals_dilithium2_lowram_poly_uniform_eta>
c0de2390:	f1b8 0f00 	cmp.w	r8, #0
c0de2394:	d104      	bne.n	c0de23a0 <crypto_sign_keypair_core+0x94>
c0de2396:	9801      	ldr	r0, [sp, #4]
c0de2398:	4629      	mov	r1, r5
c0de239a:	2200      	movs	r2, #0
c0de239c:	f7ff fb58 	bl	c0de1a50 <pack_sk_s1>
c0de23a0:	4628      	mov	r0, r5
c0de23a2:	f7ff fc6c 	bl	c0de1c7e <pqcrystals_dilithium2_lowram_poly_ntt>
c0de23a6:	ea4f 2008 	mov.w	r0, r8, lsl #8
c0de23aa:	f60d 6108 	addw	r1, sp, #3592	@ 0xe08
c0de23ae:	b282      	uxth	r2, r0
c0de23b0:	4620      	mov	r0, r4
c0de23b2:	f7ff fc9f 	bl	c0de1cf4 <pqcrystals_dilithium2_lowram_poly_uniform>
c0de23b6:	4630      	mov	r0, r6
c0de23b8:	4621      	mov	r1, r4
c0de23ba:	462a      	mov	r2, r5
c0de23bc:	f7ff fc63 	bl	c0de1c86 <pqcrystals_dilithium2_lowram_poly_pointwise_montgomery>
c0de23c0:	f04f 0a01 	mov.w	sl, #1
c0de23c4:	f1ba 0f04 	cmp.w	sl, #4
c0de23c8:	d020      	beq.n	c0de240c <crypto_sign_keypair_core+0x100>
c0de23ca:	fa1f f28a 	uxth.w	r2, sl
c0de23ce:	4628      	mov	r0, r5
c0de23d0:	4639      	mov	r1, r7
c0de23d2:	f7ff fd03 	bl	c0de1ddc <pqcrystals_dilithium2_lowram_poly_uniform_eta>
c0de23d6:	f1b8 0f00 	cmp.w	r8, #0
c0de23da:	d104      	bne.n	c0de23e6 <crypto_sign_keypair_core+0xda>
c0de23dc:	9801      	ldr	r0, [sp, #4]
c0de23de:	4629      	mov	r1, r5
c0de23e0:	4652      	mov	r2, sl
c0de23e2:	f7ff fb35 	bl	c0de1a50 <pack_sk_s1>
c0de23e6:	4628      	mov	r0, r5
c0de23e8:	f7ff fc49 	bl	c0de1c7e <pqcrystals_dilithium2_lowram_poly_ntt>
c0de23ec:	eb0b 000a 	add.w	r0, fp, sl
c0de23f0:	f60d 6108 	addw	r1, sp, #3592	@ 0xe08
c0de23f4:	b282      	uxth	r2, r0
c0de23f6:	4620      	mov	r0, r4
c0de23f8:	f7ff fc7c 	bl	c0de1cf4 <pqcrystals_dilithium2_lowram_poly_uniform>
c0de23fc:	4630      	mov	r0, r6
c0de23fe:	4621      	mov	r1, r4
c0de2400:	462a      	mov	r2, r5
c0de2402:	f7ff fb56 	bl	c0de1ab2 <pqcrystals_dilithium2_lowram_poly_pointwise_acc_montgomery>
c0de2406:	f10a 0a01 	add.w	sl, sl, #1
c0de240a:	e7db      	b.n	c0de23c4 <crypto_sign_keypair_core+0xb8>
c0de240c:	4630      	mov	r0, r6
c0de240e:	f7ff fc09 	bl	c0de1c24 <pqcrystals_dilithium2_lowram_poly_reduce>
c0de2412:	4630      	mov	r0, r6
c0de2414:	f7ff fc35 	bl	c0de1c82 <pqcrystals_dilithium2_lowram_poly_invntt_tomont>
c0de2418:	f108 0004 	add.w	r0, r8, #4
c0de241c:	4639      	mov	r1, r7
c0de241e:	b282      	uxth	r2, r0
c0de2420:	4620      	mov	r0, r4
c0de2422:	f7ff fcdb 	bl	c0de1ddc <pqcrystals_dilithium2_lowram_poly_uniform_eta>
c0de2426:	f8dd a004 	ldr.w	sl, [sp, #4]
c0de242a:	4621      	mov	r1, r4
c0de242c:	4642      	mov	r2, r8
c0de242e:	4650      	mov	r0, sl
c0de2430:	f7ff fb15 	bl	c0de1a5e <pack_sk_s2>
c0de2434:	4630      	mov	r0, r6
c0de2436:	4631      	mov	r1, r6
c0de2438:	4622      	mov	r2, r4
c0de243a:	f7ff fc11 	bl	c0de1c60 <pqcrystals_dilithium2_lowram_poly_add>
c0de243e:	4630      	mov	r0, r6
c0de2440:	f7ff fbff 	bl	c0de1c42 <pqcrystals_dilithium2_lowram_poly_caddq>
c0de2444:	4628      	mov	r0, r5
c0de2446:	4621      	mov	r1, r4
c0de2448:	4632      	mov	r2, r6
c0de244a:	f7ff fc2f 	bl	c0de1cac <pqcrystals_dilithium2_lowram_poly_power2round>
c0de244e:	4650      	mov	r0, sl
c0de2450:	4621      	mov	r1, r4
c0de2452:	4642      	mov	r2, r8
c0de2454:	f7ff fb0b 	bl	c0de1a6e <pack_sk_t0>
c0de2458:	9800      	ldr	r0, [sp, #0]
c0de245a:	4629      	mov	r1, r5
c0de245c:	4642      	mov	r2, r8
c0de245e:	f7ff faf0 	bl	c0de1a42 <pack_pk_t1>
c0de2462:	f50b 7b80 	add.w	fp, fp, #256	@ 0x100
c0de2466:	f108 0801 	add.w	r8, r8, #1
c0de246a:	e789      	b.n	c0de2380 <crypto_sign_keypair_core+0x74>
c0de246c:	ac02      	add	r4, sp, #8
c0de246e:	4620      	mov	r0, r4
c0de2470:	f7fe fdfc 	bl	c0de106c <inner_keccak256_init>
c0de2474:	9e00      	ldr	r6, [sp, #0]
c0de2476:	4620      	mov	r0, r4
c0de2478:	f44f 62a4 	mov.w	r2, #1312	@ 0x520
c0de247c:	4631      	mov	r1, r6
c0de247e:	f7fe fe06 	bl	c0de108e <inner_keccak256_inject>
c0de2482:	f000 fb29 	bl	c0de2ad8 <OUTLINED_FUNCTION_0>
c0de2486:	ad82      	add	r5, sp, #520	@ 0x208
c0de2488:	4620      	mov	r0, r4
c0de248a:	2240      	movs	r2, #64	@ 0x40
c0de248c:	4629      	mov	r1, r5
c0de248e:	f7fe fe26 	bl	c0de10de <inner_keccak256_extract>
c0de2492:	480c      	ldr	r0, [pc, #48]	@ (c0de24c4 <crypto_sign_keypair_core+0x1b8>)
c0de2494:	4629      	mov	r1, r5
c0de2496:	2240      	movs	r2, #64	@ 0x40
c0de2498:	eb09 0400 	add.w	r4, r9, r0
c0de249c:	f504 7020 	add.w	r0, r4, #640	@ 0x280
c0de24a0:	f009 fcf0 	bl	c0debe84 <__aeabi_memcpy>
c0de24a4:	f504 7030 	add.w	r0, r4, #704	@ 0x2c0
c0de24a8:	4631      	mov	r1, r6
c0de24aa:	f44f 62a4 	mov.w	r2, #1312	@ 0x520
c0de24ae:	f009 fce9 	bl	c0debe84 <__aeabi_memcpy>
c0de24b2:	9801      	ldr	r0, [sp, #4]
c0de24b4:	4629      	mov	r1, r5
c0de24b6:	f7ff faf3 	bl	c0de1aa0 <pack_sk_tr>
c0de24ba:	2000      	movs	r0, #0
c0de24bc:	f60d 6d88 	addw	sp, sp, #3720	@ 0xe88
c0de24c0:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de24c4:	000002d8 	.word	0x000002d8

c0de24c8 <crypto_sign_signature_init>:
c0de24c8:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de24cc:	29ff      	cmp	r1, #255	@ 0xff
c0de24ce:	d902      	bls.n	c0de24d6 <crypto_sign_signature_init+0xe>
c0de24d0:	f04f 34ff 	mov.w	r4, #4294967295	@ 0xffffffff
c0de24d4:	e01c      	b.n	c0de2510 <crypto_sign_signature_init+0x48>
c0de24d6:	4680      	mov	r8, r0
c0de24d8:	480f      	ldr	r0, [pc, #60]	@ (c0de2518 <crypto_sign_signature_init+0x50>)
c0de24da:	2400      	movs	r4, #0
c0de24dc:	460d      	mov	r5, r1
c0de24de:	eb09 0700 	add.w	r7, r9, r0
c0de24e2:	4638      	mov	r0, r7
c0de24e4:	f887 1201 	strb.w	r1, [r7, #513]	@ 0x201
c0de24e8:	f887 4200 	strb.w	r4, [r7, #512]	@ 0x200
c0de24ec:	f7fe fdbe 	bl	c0de106c <inner_keccak256_init>
c0de24f0:	4e0a      	ldr	r6, [pc, #40]	@ (c0de251c <crypto_sign_signature_init+0x54>)
c0de24f2:	f507 7120 	add.w	r1, r7, #640	@ 0x280
c0de24f6:	4638      	mov	r0, r7
c0de24f8:	2240      	movs	r2, #64	@ 0x40
c0de24fa:	447e      	add	r6, pc
c0de24fc:	47b0      	blx	r6
c0de24fe:	f507 7100 	add.w	r1, r7, #512	@ 0x200
c0de2502:	4638      	mov	r0, r7
c0de2504:	2202      	movs	r2, #2
c0de2506:	47b0      	blx	r6
c0de2508:	4638      	mov	r0, r7
c0de250a:	4641      	mov	r1, r8
c0de250c:	462a      	mov	r2, r5
c0de250e:	47b0      	blx	r6
c0de2510:	4620      	mov	r0, r4
c0de2512:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de2516:	bf00      	nop
c0de2518:	000002d8 	.word	0x000002d8
c0de251c:	ffffeb91 	.word	0xffffeb91

c0de2520 <crypto_sign_signature_absorb>:
c0de2520:	460a      	mov	r2, r1
c0de2522:	4601      	mov	r1, r0
c0de2524:	4801      	ldr	r0, [pc, #4]	@ (c0de252c <crypto_sign_signature_absorb+0xc>)
c0de2526:	4448      	add	r0, r9
c0de2528:	f7fe bdb1 	b.w	c0de108e <inner_keccak256_inject>
c0de252c:	000002d8 	.word	0x000002d8

c0de2530 <crypto_sign_signature_core>:
c0de2530:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de2534:	f5ad 5d83 	sub.w	sp, sp, #4192	@ 0x1060
c0de2538:	b086      	sub	sp, #24
c0de253a:	900b      	str	r0, [sp, #44]	@ 0x2c
c0de253c:	48bf      	ldr	r0, [pc, #764]	@ (c0de283c <crypto_sign_signature_core+0x30c>)
c0de253e:	4616      	mov	r6, r2
c0de2540:	9103      	str	r1, [sp, #12]
c0de2542:	eb09 0400 	add.w	r4, r9, r0
c0de2546:	f000 fac7 	bl	c0de2ad8 <OUTLINED_FUNCTION_0>
c0de254a:	f504 7100 	add.w	r1, r4, #512	@ 0x200
c0de254e:	4620      	mov	r0, r4
c0de2550:	2240      	movs	r2, #64	@ 0x40
c0de2552:	f7fe fdc4 	bl	c0de10de <inner_keccak256_extract>
c0de2556:	a80d      	add	r0, sp, #52	@ 0x34
c0de2558:	2100      	movs	r1, #0
c0de255a:	f500 7000 	add.w	r0, r0, #512	@ 0x200
c0de255e:	900a      	str	r0, [sp, #40]	@ 0x28
c0de2560:	2000      	movs	r0, #0
c0de2562:	2920      	cmp	r1, #32
c0de2564:	d006      	beq.n	c0de2574 <crypto_sign_signature_core+0x44>
c0de2566:	4ab5      	ldr	r2, [pc, #724]	@ (c0de283c <crypto_sign_signature_core+0x30c>)
c0de2568:	444a      	add	r2, r9
c0de256a:	440a      	add	r2, r1
c0de256c:	3101      	adds	r1, #1
c0de256e:	f882 0240 	strb.w	r0, [r2, #576]	@ 0x240
c0de2572:	e7f6      	b.n	c0de2562 <crypto_sign_signature_core+0x32>
c0de2574:	48b1      	ldr	r0, [pc, #708]	@ (c0de283c <crypto_sign_signature_core+0x30c>)
c0de2576:	eb09 0400 	add.w	r4, r9, r0
c0de257a:	4620      	mov	r0, r4
c0de257c:	f7fe fd76 	bl	c0de106c <inner_keccak256_init>
c0de2580:	4fb0      	ldr	r7, [pc, #704]	@ (c0de2844 <crypto_sign_signature_core+0x314>)
c0de2582:	f106 0120 	add.w	r1, r6, #32
c0de2586:	4620      	mov	r0, r4
c0de2588:	2220      	movs	r2, #32
c0de258a:	447f      	add	r7, pc
c0de258c:	47b8      	blx	r7
c0de258e:	f504 7510 	add.w	r5, r4, #576	@ 0x240
c0de2592:	4620      	mov	r0, r4
c0de2594:	2220      	movs	r2, #32
c0de2596:	4629      	mov	r1, r5
c0de2598:	47b8      	blx	r7
c0de259a:	f504 7100 	add.w	r1, r4, #512	@ 0x200
c0de259e:	4620      	mov	r0, r4
c0de25a0:	2240      	movs	r2, #64	@ 0x40
c0de25a2:	47b8      	blx	r7
c0de25a4:	f000 fa98 	bl	c0de2ad8 <OUTLINED_FUNCTION_0>
c0de25a8:	4620      	mov	r0, r4
c0de25aa:	4629      	mov	r1, r5
c0de25ac:	2240      	movs	r2, #64	@ 0x40
c0de25ae:	f7fe fd96 	bl	c0de10de <inner_keccak256_extract>
c0de25b2:	f506 7060 	add.w	r0, r6, #896	@ 0x380
c0de25b6:	2100      	movs	r1, #0
c0de25b8:	f04f 0800 	mov.w	r8, #0
c0de25bc:	9004      	str	r0, [sp, #16]
c0de25be:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de25c0:	3020      	adds	r0, #32
c0de25c2:	9005      	str	r0, [sp, #20]
c0de25c4:	ac0d      	add	r4, sp, #52	@ 0x34
c0de25c6:	2001      	movs	r0, #1
c0de25c8:	9107      	str	r1, [sp, #28]
c0de25ca:	9006      	str	r0, [sp, #24]
c0de25cc:	b280      	uxth	r0, r0
c0de25ce:	f64f 71fc 	movw	r1, #65532	@ 0xfffc
c0de25d2:	eb01 0380 	add.w	r3, r1, r0, lsl #2
c0de25d6:	2000      	movs	r0, #0
c0de25d8:	f50d 618f 	add.w	r1, sp, #1144	@ 0x478
c0de25dc:	2804      	cmp	r0, #4
c0de25de:	d00b      	beq.n	c0de25f8 <crypto_sign_signature_core+0xc8>
c0de25e0:	2200      	movs	r2, #0
c0de25e2:	f5b2 7f40 	cmp.w	r2, #768	@ 0x300
c0de25e6:	d003      	beq.n	c0de25f0 <crypto_sign_signature_core+0xc0>
c0de25e8:	f801 8002 	strb.w	r8, [r1, r2]
c0de25ec:	3201      	adds	r2, #1
c0de25ee:	e7f8      	b.n	c0de25e2 <crypto_sign_signature_core+0xb2>
c0de25f0:	f501 7140 	add.w	r1, r1, #768	@ 0x300
c0de25f4:	3001      	adds	r0, #1
c0de25f6:	e7f1      	b.n	c0de25dc <crypto_sign_signature_core+0xac>
c0de25f8:	9807      	ldr	r0, [sp, #28]
c0de25fa:	2700      	movs	r7, #0
c0de25fc:	9309      	str	r3, [sp, #36]	@ 0x24
c0de25fe:	b280      	uxth	r0, r0
c0de2600:	ea4f 0b80 	mov.w	fp, r0, lsl #2
c0de2604:	2f04      	cmp	r7, #4
c0de2606:	d023      	beq.n	c0de2650 <crypto_sign_signature_core+0x120>
c0de2608:	488c      	ldr	r0, [pc, #560]	@ (c0de283c <crypto_sign_signature_core+0x30c>)
c0de260a:	eb09 0300 	add.w	r3, r9, r0
c0de260e:	eb07 000b 	add.w	r0, r7, fp
c0de2612:	b282      	uxth	r2, r0
c0de2614:	f503 7110 	add.w	r1, r3, #576	@ 0x240
c0de2618:	4620      	mov	r0, r4
c0de261a:	f7ff f905 	bl	c0de1828 <poly_uniform_gamma1_lowram_eth>
c0de261e:	4620      	mov	r0, r4
c0de2620:	f7ff fb2d 	bl	c0de1c7e <pqcrystals_dilithium2_lowram_poly_ntt>
c0de2624:	f04f 0a00 	mov.w	sl, #0
c0de2628:	f50d 658f 	add.w	r5, sp, #1144	@ 0x478
c0de262c:	f5ba 6f80 	cmp.w	sl, #1024	@ 0x400
c0de2630:	d00c      	beq.n	c0de264c <crypto_sign_signature_core+0x11c>
c0de2632:	eb07 000a 	add.w	r0, r7, sl
c0de2636:	4621      	mov	r1, r4
c0de2638:	4632      	mov	r2, r6
c0de263a:	b283      	uxth	r3, r0
c0de263c:	4628      	mov	r0, r5
c0de263e:	f7ff f883 	bl	c0de1748 <poly_uniform_pointwise_montgomery_polywadd_lowram_eth>
c0de2642:	f505 7540 	add.w	r5, r5, #768	@ 0x300
c0de2646:	f50a 7a80 	add.w	sl, sl, #256	@ 0x100
c0de264a:	e7ef      	b.n	c0de262c <crypto_sign_signature_core+0xfc>
c0de264c:	3701      	adds	r7, #1
c0de264e:	e7d9      	b.n	c0de2604 <crypto_sign_signature_core+0xd4>
c0de2650:	f8dd b024 	ldr.w	fp, [sp, #36]	@ 0x24
c0de2654:	2700      	movs	r7, #0
c0de2656:	f50d 658f 	add.w	r5, sp, #1144	@ 0x478
c0de265a:	f5b7 7f40 	cmp.w	r7, #768	@ 0x300
c0de265e:	d01a      	beq.n	c0de2696 <crypto_sign_signature_core+0x166>
c0de2660:	4620      	mov	r0, r4
c0de2662:	4629      	mov	r1, r5
c0de2664:	f7fe ffd3 	bl	c0de160e <polyw_unpack>
c0de2668:	4620      	mov	r0, r4
c0de266a:	f7ff fb0a 	bl	c0de1c82 <pqcrystals_dilithium2_lowram_poly_invntt_tomont>
c0de266e:	4620      	mov	r0, r4
c0de2670:	f7ff fae7 	bl	c0de1c42 <pqcrystals_dilithium2_lowram_poly_caddq>
c0de2674:	4628      	mov	r0, r5
c0de2676:	4621      	mov	r1, r4
c0de2678:	f7fe ffab 	bl	c0de15d2 <polyw_pack>
c0de267c:	4620      	mov	r0, r4
c0de267e:	4621      	mov	r1, r4
c0de2680:	f7fe fff5 	bl	c0de166e <poly_highbits>
c0de2684:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de2686:	4621      	mov	r1, r4
c0de2688:	4438      	add	r0, r7
c0de268a:	f7ff fd91 	bl	c0de21b0 <pqcrystals_dilithium2_lowram_polyw1_pack>
c0de268e:	f505 7540 	add.w	r5, r5, #768	@ 0x300
c0de2692:	37c0      	adds	r7, #192	@ 0xc0
c0de2694:	e7e1      	b.n	c0de265a <crypto_sign_signature_core+0x12a>
c0de2696:	4869      	ldr	r0, [pc, #420]	@ (c0de283c <crypto_sign_signature_core+0x30c>)
c0de2698:	eb09 0500 	add.w	r5, r9, r0
c0de269c:	4628      	mov	r0, r5
c0de269e:	f7fe fce5 	bl	c0de106c <inner_keccak256_init>
c0de26a2:	f505 7100 	add.w	r1, r5, #512	@ 0x200
c0de26a6:	4628      	mov	r0, r5
c0de26a8:	2240      	movs	r2, #64	@ 0x40
c0de26aa:	f7fe fcf0 	bl	c0de108e <inner_keccak256_inject>
c0de26ae:	9f0b      	ldr	r7, [sp, #44]	@ 0x2c
c0de26b0:	4628      	mov	r0, r5
c0de26b2:	f44f 7240 	mov.w	r2, #768	@ 0x300
c0de26b6:	4639      	mov	r1, r7
c0de26b8:	f7fe fce9 	bl	c0de108e <inner_keccak256_inject>
c0de26bc:	4628      	mov	r0, r5
c0de26be:	f7fe fcf8 	bl	c0de10b2 <inner_keccak256_flip>
c0de26c2:	4628      	mov	r0, r5
c0de26c4:	4639      	mov	r1, r7
c0de26c6:	2220      	movs	r2, #32
c0de26c8:	f7fe fd09 	bl	c0de10de <inner_keccak256_extract>
c0de26cc:	4620      	mov	r0, r4
c0de26ce:	4639      	mov	r1, r7
c0de26d0:	f7ff fc69 	bl	c0de1fa6 <pqcrystals_dilithium2_lowram_poly_challenge_eth>
c0de26d4:	f20d 4034 	addw	r0, sp, #1076	@ 0x434
c0de26d8:	4621      	mov	r1, r4
c0de26da:	f7fe fda6 	bl	c0de122a <poly_challenge_compress>
c0de26de:	9807      	ldr	r0, [sp, #28]
c0de26e0:	f8dd a014 	ldr.w	sl, [sp, #20]
c0de26e4:	2500      	movs	r5, #0
c0de26e6:	3001      	adds	r0, #1
c0de26e8:	9007      	str	r0, [sp, #28]
c0de26ea:	b135      	cbz	r5, c0de26fa <crypto_sign_signature_core+0x1ca>
c0de26ec:	2d04      	cmp	r5, #4
c0de26ee:	d035      	beq.n	c0de275c <crypto_sign_signature_core+0x22c>
c0de26f0:	4620      	mov	r0, r4
c0de26f2:	f20d 4134 	addw	r1, sp, #1076	@ 0x434
c0de26f6:	f7fe fdcd 	bl	c0de1294 <poly_challenge_decompress>
c0de26fa:	9f0a      	ldr	r7, [sp, #40]	@ 0x28
c0de26fc:	4621      	mov	r1, r4
c0de26fe:	4638      	mov	r0, r7
c0de2700:	f000 fada 	bl	c0de2cb8 <poly_small_ntt_copy>
c0de2704:	4620      	mov	r0, r4
c0de2706:	4631      	mov	r1, r6
c0de2708:	462a      	mov	r2, r5
c0de270a:	f7fe fff9 	bl	c0de1700 <unpack_sk_s1>
c0de270e:	4620      	mov	r0, r4
c0de2710:	f000 f9e6 	bl	c0de2ae0 <small_ntt>
c0de2714:	4620      	mov	r0, r4
c0de2716:	4639      	mov	r1, r7
c0de2718:	4622      	mov	r2, r4
c0de271a:	f000 fb05 	bl	c0de2d28 <poly_small_basemul_invntt>
c0de271e:	4847      	ldr	r0, [pc, #284]	@ (c0de283c <crypto_sign_signature_core+0x30c>)
c0de2720:	4621      	mov	r1, r4
c0de2722:	4448      	add	r0, r9
c0de2724:	9000      	str	r0, [sp, #0]
c0de2726:	f500 7210 	add.w	r2, r0, #576	@ 0x240
c0de272a:	eb0b 0005 	add.w	r0, fp, r5
c0de272e:	b283      	uxth	r3, r0
c0de2730:	4620      	mov	r0, r4
c0de2732:	f7ff f8af 	bl	c0de1894 <poly_uniform_gamma1_add_lowram_eth>
c0de2736:	4620      	mov	r0, r4
c0de2738:	f7ff fa74 	bl	c0de1c24 <pqcrystals_dilithium2_lowram_poly_reduce>
c0de273c:	4840      	ldr	r0, [pc, #256]	@ (c0de2840 <crypto_sign_signature_core+0x310>)
c0de273e:	f500 410c 	add.w	r1, r0, #35840	@ 0x8c00
c0de2742:	4620      	mov	r0, r4
c0de2744:	f7ff fac0 	bl	c0de1cc8 <pqcrystals_dilithium2_lowram_poly_chknorm>
c0de2748:	2800      	cmp	r0, #0
c0de274a:	d166      	bne.n	c0de281a <crypto_sign_signature_core+0x2ea>
c0de274c:	4650      	mov	r0, sl
c0de274e:	4621      	mov	r1, r4
c0de2750:	f7ff fcfd 	bl	c0de214e <pqcrystals_dilithium2_lowram_polyz_pack>
c0de2754:	f50a 7a10 	add.w	sl, sl, #576	@ 0x240
c0de2758:	3501      	adds	r5, #1
c0de275a:	e7c6      	b.n	c0de26ea <crypto_sign_signature_core+0x1ba>
c0de275c:	9d04      	ldr	r5, [sp, #16]
c0de275e:	2100      	movs	r1, #0
c0de2760:	2000      	movs	r0, #0
c0de2762:	f50d 6a8f 	add.w	sl, sp, #1144	@ 0x478
c0de2766:	2700      	movs	r7, #0
c0de2768:	9009      	str	r0, [sp, #36]	@ 0x24
c0de276a:	910c      	str	r1, [sp, #48]	@ 0x30
c0de276c:	2f04      	cmp	r7, #4
c0de276e:	d057      	beq.n	c0de2820 <crypto_sign_signature_core+0x2f0>
c0de2770:	4620      	mov	r0, r4
c0de2772:	f20d 4134 	addw	r1, sp, #1076	@ 0x434
c0de2776:	f7fe fd8d 	bl	c0de1294 <poly_challenge_decompress>
c0de277a:	46ab      	mov	fp, r5
c0de277c:	9d0a      	ldr	r5, [sp, #40]	@ 0x28
c0de277e:	4621      	mov	r1, r4
c0de2780:	4628      	mov	r0, r5
c0de2782:	f000 fa99 	bl	c0de2cb8 <poly_small_ntt_copy>
c0de2786:	4620      	mov	r0, r4
c0de2788:	4631      	mov	r1, r6
c0de278a:	463a      	mov	r2, r7
c0de278c:	9708      	str	r7, [sp, #32]
c0de278e:	f7fe ffbe 	bl	c0de170e <unpack_sk_s2>
c0de2792:	4620      	mov	r0, r4
c0de2794:	f000 f9a4 	bl	c0de2ae0 <small_ntt>
c0de2798:	4629      	mov	r1, r5
c0de279a:	4620      	mov	r0, r4
c0de279c:	4622      	mov	r2, r4
c0de279e:	465d      	mov	r5, fp
c0de27a0:	f000 fac2 	bl	c0de2d28 <poly_small_basemul_invntt>
c0de27a4:	4620      	mov	r0, r4
c0de27a6:	4651      	mov	r1, sl
c0de27a8:	4622      	mov	r2, r4
c0de27aa:	f7fe ff48 	bl	c0de163e <polyw_sub>
c0de27ae:	4620      	mov	r0, r4
c0de27b0:	f7ff fa38 	bl	c0de1c24 <pqcrystals_dilithium2_lowram_poly_reduce>
c0de27b4:	4650      	mov	r0, sl
c0de27b6:	4621      	mov	r1, r4
c0de27b8:	f7fe ff0b 	bl	c0de15d2 <polyw_pack>
c0de27bc:	4620      	mov	r0, r4
c0de27be:	4621      	mov	r1, r4
c0de27c0:	f7fe ff6e 	bl	c0de16a0 <poly_lowbits>
c0de27c4:	4620      	mov	r0, r4
c0de27c6:	f7ff fa2d 	bl	c0de1c24 <pqcrystals_dilithium2_lowram_poly_reduce>
c0de27ca:	491d      	ldr	r1, [pc, #116]	@ (c0de2840 <crypto_sign_signature_core+0x310>)
c0de27cc:	4620      	mov	r0, r4
c0de27ce:	f7ff fa7b 	bl	c0de1cc8 <pqcrystals_dilithium2_lowram_poly_chknorm>
c0de27d2:	bb10      	cbnz	r0, c0de281a <crypto_sign_signature_core+0x2ea>
c0de27d4:	4620      	mov	r0, r4
c0de27d6:	f20d 4134 	addw	r1, sp, #1076	@ 0x434
c0de27da:	462a      	mov	r2, r5
c0de27dc:	f7fe fd8c 	bl	c0de12f8 <poly_schoolbook>
c0de27e0:	4620      	mov	r0, r4
c0de27e2:	f44f 31ba 	mov.w	r1, #95232	@ 0x17400
c0de27e6:	f7ff fa6f 	bl	c0de1cc8 <pqcrystals_dilithium2_lowram_poly_chknorm>
c0de27ea:	b9b0      	cbnz	r0, c0de281a <crypto_sign_signature_core+0x2ea>
c0de27ec:	4620      	mov	r0, r4
c0de27ee:	4621      	mov	r1, r4
c0de27f0:	4652      	mov	r2, sl
c0de27f2:	f7ff f887 	bl	c0de1904 <poly_make_hint_lowram>
c0de27f6:	9909      	ldr	r1, [sp, #36]	@ 0x24
c0de27f8:	4401      	add	r1, r0
c0de27fa:	2950      	cmp	r1, #80	@ 0x50
c0de27fc:	9109      	str	r1, [sp, #36]	@ 0x24
c0de27fe:	d80c      	bhi.n	c0de281a <crypto_sign_signature_core+0x2ea>
c0de2800:	9f08      	ldr	r7, [sp, #32]
c0de2802:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de2804:	4621      	mov	r1, r4
c0de2806:	ab0c      	add	r3, sp, #48	@ 0x30
c0de2808:	463a      	mov	r2, r7
c0de280a:	f7fe fcec 	bl	c0de11e6 <pqcrystals_dilithium2_lowram_pack_sig_h>
c0de280e:	f505 75d0 	add.w	r5, r5, #416	@ 0x1a0
c0de2812:	f50a 7a40 	add.w	sl, sl, #768	@ 0x300
c0de2816:	3701      	adds	r7, #1
c0de2818:	e7a8      	b.n	c0de276c <crypto_sign_signature_core+0x23c>
c0de281a:	9806      	ldr	r0, [sp, #24]
c0de281c:	3001      	adds	r0, #1
c0de281e:	e6d4      	b.n	c0de25ca <crypto_sign_signature_core+0x9a>
c0de2820:	a90c      	add	r1, sp, #48	@ 0x30
c0de2822:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de2824:	f7fe fcf5 	bl	c0de1212 <pqcrystals_dilithium2_lowram_pack_sig_h_zero>
c0de2828:	9903      	ldr	r1, [sp, #12]
c0de282a:	f640 1074 	movw	r0, #2420	@ 0x974
c0de282e:	6008      	str	r0, [r1, #0]
c0de2830:	2000      	movs	r0, #0
c0de2832:	f50d 5d83 	add.w	sp, sp, #4192	@ 0x1060
c0de2836:	b006      	add	sp, #24
c0de2838:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de283c:	000002d8 	.word	0x000002d8
c0de2840:	000173b2 	.word	0x000173b2
c0de2844:	ffffeb01 	.word	0xffffeb01

c0de2848 <pqcrystals_dilithium2_lowram_verify>:
c0de2848:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de284c:	f6ad 3d58 	subw	sp, sp, #2904	@ 0xb58
c0de2850:	4692      	mov	sl, r2
c0de2852:	f640 1274 	movw	r2, #2420	@ 0x974
c0de2856:	4604      	mov	r4, r0
c0de2858:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de285c:	4291      	cmp	r1, r2
c0de285e:	f040 80eb 	bne.w	c0de2a38 <pqcrystals_dilithium2_lowram_verify+0x1f0>
c0de2862:	f8dd 1b7c 	ldr.w	r1, [sp, #2940]	@ 0xb7c
c0de2866:	29ff      	cmp	r1, #255	@ 0xff
c0de2868:	f200 80e6 	bhi.w	c0de2a38 <pqcrystals_dilithium2_lowram_verify+0x1f0>
c0de286c:	ad84      	add	r5, sp, #528	@ 0x210
c0de286e:	4e81      	ldr	r6, [pc, #516]	@ (c0de2a74 <pqcrystals_dilithium2_lowram_verify+0x22c>)
c0de2870:	f8dd 8b80 	ldr.w	r8, [sp, #2944]	@ 0xb80
c0de2874:	9303      	str	r3, [sp, #12]
c0de2876:	4628      	mov	r0, r5
c0de2878:	447e      	add	r6, pc
c0de287a:	47b0      	blx	r6
c0de287c:	4f7e      	ldr	r7, [pc, #504]	@ (c0de2a78 <pqcrystals_dilithium2_lowram_verify+0x230>)
c0de287e:	4628      	mov	r0, r5
c0de2880:	4641      	mov	r1, r8
c0de2882:	f44f 62a4 	mov.w	r2, #1312	@ 0x520
c0de2886:	447f      	add	r7, pc
c0de2888:	47b8      	blx	r7
c0de288a:	4628      	mov	r0, r5
c0de288c:	f7fe fc11 	bl	c0de10b2 <inner_keccak256_flip>
c0de2890:	f50d 6b82 	add.w	fp, sp, #1040	@ 0x410
c0de2894:	4628      	mov	r0, r5
c0de2896:	2240      	movs	r2, #64	@ 0x40
c0de2898:	4659      	mov	r1, fp
c0de289a:	f7fe fc20 	bl	c0de10de <inner_keccak256_extract>
c0de289e:	4628      	mov	r0, r5
c0de28a0:	47b0      	blx	r6
c0de28a2:	4628      	mov	r0, r5
c0de28a4:	4659      	mov	r1, fp
c0de28a6:	2240      	movs	r2, #64	@ 0x40
c0de28a8:	47b8      	blx	r7
c0de28aa:	f8dd 0b7c 	ldr.w	r0, [sp, #2940]	@ 0xb7c
c0de28ae:	f04f 0800 	mov.w	r8, #0
c0de28b2:	4659      	mov	r1, fp
c0de28b4:	2202      	movs	r2, #2
c0de28b6:	f88d 8410 	strb.w	r8, [sp, #1040]	@ 0x410
c0de28ba:	f88d 0411 	strb.w	r0, [sp, #1041]	@ 0x411
c0de28be:	4628      	mov	r0, r5
c0de28c0:	47b8      	blx	r7
c0de28c2:	f8dd 1b78 	ldr.w	r1, [sp, #2936]	@ 0xb78
c0de28c6:	f8dd 2b7c 	ldr.w	r2, [sp, #2940]	@ 0xb7c
c0de28ca:	4628      	mov	r0, r5
c0de28cc:	47b8      	blx	r7
c0de28ce:	9a03      	ldr	r2, [sp, #12]
c0de28d0:	4628      	mov	r0, r5
c0de28d2:	4651      	mov	r1, sl
c0de28d4:	47b8      	blx	r7
c0de28d6:	4628      	mov	r0, r5
c0de28d8:	f7fe fbeb 	bl	c0de10b2 <inner_keccak256_flip>
c0de28dc:	4628      	mov	r0, r5
c0de28de:	4659      	mov	r1, fp
c0de28e0:	2240      	movs	r2, #64	@ 0x40
c0de28e2:	f7fe fbfc 	bl	c0de10de <inner_keccak256_extract>
c0de28e6:	4628      	mov	r0, r5
c0de28e8:	47b0      	blx	r6
c0de28ea:	4628      	mov	r0, r5
c0de28ec:	4659      	mov	r1, fp
c0de28ee:	2240      	movs	r2, #64	@ 0x40
c0de28f0:	47b8      	blx	r7
c0de28f2:	f20d 7754 	addw	r7, sp, #1876	@ 0x754
c0de28f6:	4621      	mov	r1, r4
c0de28f8:	4638      	mov	r0, r7
c0de28fa:	f7ff fb54 	bl	c0de1fa6 <pqcrystals_dilithium2_lowram_poly_challenge_eth>
c0de28fe:	4658      	mov	r0, fp
c0de2900:	4639      	mov	r1, r7
c0de2902:	f7fe fc92 	bl	c0de122a <poly_challenge_compress>
c0de2906:	f8dd 0b80 	ldr.w	r0, [sp, #2944]	@ 0xb80
c0de290a:	4e59      	ldr	r6, [pc, #356]	@ (c0de2a70 <pqcrystals_dilithium2_lowram_verify+0x228>)
c0de290c:	f104 0520 	add.w	r5, r4, #32
c0de2910:	f20d 4b54 	addw	fp, sp, #1108	@ 0x454
c0de2914:	f04f 0a00 	mov.w	sl, #0
c0de2918:	9500      	str	r5, [sp, #0]
c0de291a:	3020      	adds	r0, #32
c0de291c:	9001      	str	r0, [sp, #4]
c0de291e:	2001      	movs	r0, #1
c0de2920:	9003      	str	r0, [sp, #12]
c0de2922:	f1ba 0f04 	cmp.w	sl, #4
c0de2926:	f000 808b 	beq.w	c0de2a40 <pqcrystals_dilithium2_lowram_verify+0x1f8>
c0de292a:	2000      	movs	r0, #0
c0de292c:	f5b0 7f40 	cmp.w	r0, #768	@ 0x300
c0de2930:	d003      	beq.n	c0de293a <pqcrystals_dilithium2_lowram_verify+0xf2>
c0de2932:	f80b 8000 	strb.w	r8, [fp, r0]
c0de2936:	3001      	adds	r0, #1
c0de2938:	e7f8      	b.n	c0de292c <pqcrystals_dilithium2_lowram_verify+0xe4>
c0de293a:	4638      	mov	r0, r7
c0de293c:	4629      	mov	r1, r5
c0de293e:	f8cd a008 	str.w	sl, [sp, #8]
c0de2942:	f7ff faa2 	bl	c0de1e8a <pqcrystals_dilithium2_lowram_polyz_unpack>
c0de2946:	4638      	mov	r0, r7
c0de2948:	4631      	mov	r1, r6
c0de294a:	f7ff f9bd 	bl	c0de1cc8 <pqcrystals_dilithium2_lowram_poly_chknorm>
c0de294e:	2800      	cmp	r0, #0
c0de2950:	d170      	bne.n	c0de2a34 <pqcrystals_dilithium2_lowram_verify+0x1ec>
c0de2952:	4638      	mov	r0, r7
c0de2954:	f7ff f993 	bl	c0de1c7e <pqcrystals_dilithium2_lowram_poly_ntt>
c0de2958:	9802      	ldr	r0, [sp, #8]
c0de295a:	f8dd 2b80 	ldr.w	r2, [sp, #2944]	@ 0xb80
c0de295e:	4639      	mov	r1, r7
c0de2960:	0200      	lsls	r0, r0, #8
c0de2962:	b283      	uxth	r3, r0
c0de2964:	4658      	mov	r0, fp
c0de2966:	f7fe feef 	bl	c0de1748 <poly_uniform_pointwise_montgomery_polywadd_lowram_eth>
c0de296a:	9d03      	ldr	r5, [sp, #12]
c0de296c:	f44f 7a18 	mov.w	sl, #608	@ 0x260
c0de2970:	f5ba 6f12 	cmp.w	sl, #2336	@ 0x920
c0de2974:	d018      	beq.n	c0de29a8 <pqcrystals_dilithium2_lowram_verify+0x160>
c0de2976:	eb04 010a 	add.w	r1, r4, sl
c0de297a:	4638      	mov	r0, r7
c0de297c:	f7ff fa85 	bl	c0de1e8a <pqcrystals_dilithium2_lowram_polyz_unpack>
c0de2980:	4638      	mov	r0, r7
c0de2982:	4631      	mov	r1, r6
c0de2984:	f7ff f9a0 	bl	c0de1cc8 <pqcrystals_dilithium2_lowram_poly_chknorm>
c0de2988:	2800      	cmp	r0, #0
c0de298a:	d153      	bne.n	c0de2a34 <pqcrystals_dilithium2_lowram_verify+0x1ec>
c0de298c:	4638      	mov	r0, r7
c0de298e:	f7ff f976 	bl	c0de1c7e <pqcrystals_dilithium2_lowram_poly_ntt>
c0de2992:	f8dd 2b80 	ldr.w	r2, [sp, #2944]	@ 0xb80
c0de2996:	b2ab      	uxth	r3, r5
c0de2998:	4658      	mov	r0, fp
c0de299a:	4639      	mov	r1, r7
c0de299c:	f7fe fed4 	bl	c0de1748 <poly_uniform_pointwise_montgomery_polywadd_lowram_eth>
c0de29a0:	3501      	adds	r5, #1
c0de29a2:	f50a 7a10 	add.w	sl, sl, #576	@ 0x240
c0de29a6:	e7e3      	b.n	c0de2970 <pqcrystals_dilithium2_lowram_verify+0x128>
c0de29a8:	4638      	mov	r0, r7
c0de29aa:	4659      	mov	r1, fp
c0de29ac:	f7fe fe2f 	bl	c0de160e <polyw_unpack>
c0de29b0:	4638      	mov	r0, r7
c0de29b2:	f7ff f937 	bl	c0de1c24 <pqcrystals_dilithium2_lowram_poly_reduce>
c0de29b6:	4638      	mov	r0, r7
c0de29b8:	f7ff f963 	bl	c0de1c82 <pqcrystals_dilithium2_lowram_poly_invntt_tomont>
c0de29bc:	4658      	mov	r0, fp
c0de29be:	4639      	mov	r1, r7
c0de29c0:	f7fe fe07 	bl	c0de15d2 <polyw_pack>
c0de29c4:	f8dd a008 	ldr.w	sl, [sp, #8]
c0de29c8:	9901      	ldr	r1, [sp, #4]
c0de29ca:	eb0a 008a 	add.w	r0, sl, sl, lsl #2
c0de29ce:	eb01 1280 	add.w	r2, r1, r0, lsl #6
c0de29d2:	4638      	mov	r0, r7
c0de29d4:	f50d 6182 	add.w	r1, sp, #1040	@ 0x410
c0de29d8:	f7fe fd54 	bl	c0de1484 <poly_schoolbook_t1>
c0de29dc:	4638      	mov	r0, r7
c0de29de:	4659      	mov	r1, fp
c0de29e0:	463a      	mov	r2, r7
c0de29e2:	f7fe fe2c 	bl	c0de163e <polyw_sub>
c0de29e6:	4638      	mov	r0, r7
c0de29e8:	f7ff f91c 	bl	c0de1c24 <pqcrystals_dilithium2_lowram_poly_reduce>
c0de29ec:	4638      	mov	r0, r7
c0de29ee:	f7ff f928 	bl	c0de1c42 <pqcrystals_dilithium2_lowram_poly_caddq>
c0de29f2:	ad04      	add	r5, sp, #16
c0de29f4:	f60d 3154 	addw	r1, sp, #2900	@ 0xb54
c0de29f8:	4652      	mov	r2, sl
c0de29fa:	4623      	mov	r3, r4
c0de29fc:	4628      	mov	r0, r5
c0de29fe:	f7fe ffbb 	bl	c0de1978 <unpack_sig_h_indices>
c0de2a02:	b9b8      	cbnz	r0, c0de2a34 <pqcrystals_dilithium2_lowram_verify+0x1ec>
c0de2a04:	f8dd 3b54 	ldr.w	r3, [sp, #2900]	@ 0xb54
c0de2a08:	4638      	mov	r0, r7
c0de2a0a:	4639      	mov	r1, r7
c0de2a0c:	462a      	mov	r2, r5
c0de2a0e:	f7fe fff1 	bl	c0de19f4 <poly_use_hint_lowram>
c0de2a12:	4658      	mov	r0, fp
c0de2a14:	4639      	mov	r1, r7
c0de2a16:	f7ff fbcb 	bl	c0de21b0 <pqcrystals_dilithium2_lowram_polyw1_pack>
c0de2a1a:	a884      	add	r0, sp, #528	@ 0x210
c0de2a1c:	4659      	mov	r1, fp
c0de2a1e:	22c0      	movs	r2, #192	@ 0xc0
c0de2a20:	f7fe fb35 	bl	c0de108e <inner_keccak256_inject>
c0de2a24:	9803      	ldr	r0, [sp, #12]
c0de2a26:	9d00      	ldr	r5, [sp, #0]
c0de2a28:	f10a 0a01 	add.w	sl, sl, #1
c0de2a2c:	f500 7080 	add.w	r0, r0, #256	@ 0x100
c0de2a30:	9003      	str	r0, [sp, #12]
c0de2a32:	e776      	b.n	c0de2922 <pqcrystals_dilithium2_lowram_verify+0xda>
c0de2a34:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de2a38:	f60d 3d58 	addw	sp, sp, #2904	@ 0xb58
c0de2a3c:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de2a40:	ae84      	add	r6, sp, #528	@ 0x210
c0de2a42:	4630      	mov	r0, r6
c0de2a44:	f7fe fb35 	bl	c0de10b2 <inner_keccak256_flip>
c0de2a48:	ad04      	add	r5, sp, #16
c0de2a4a:	4630      	mov	r0, r6
c0de2a4c:	2220      	movs	r2, #32
c0de2a4e:	4629      	mov	r1, r5
c0de2a50:	f7fe fb45 	bl	c0de10de <inner_keccak256_extract>
c0de2a54:	2100      	movs	r1, #0
c0de2a56:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de2a5a:	2920      	cmp	r1, #32
c0de2a5c:	d005      	beq.n	c0de2a6a <pqcrystals_dilithium2_lowram_verify+0x222>
c0de2a5e:	5c6a      	ldrb	r2, [r5, r1]
c0de2a60:	5c63      	ldrb	r3, [r4, r1]
c0de2a62:	3101      	adds	r1, #1
c0de2a64:	4293      	cmp	r3, r2
c0de2a66:	d0f8      	beq.n	c0de2a5a <pqcrystals_dilithium2_lowram_verify+0x212>
c0de2a68:	e7e6      	b.n	c0de2a38 <pqcrystals_dilithium2_lowram_verify+0x1f0>
c0de2a6a:	2000      	movs	r0, #0
c0de2a6c:	e7e4      	b.n	c0de2a38 <pqcrystals_dilithium2_lowram_verify+0x1f0>
c0de2a6e:	bf00      	nop
c0de2a70:	0001ffb2 	.word	0x0001ffb2
c0de2a74:	ffffe7f1 	.word	0xffffe7f1
c0de2a78:	ffffe805 	.word	0xffffe805

c0de2a7c <pqcrystals_dilithium2_lowram_open>:
c0de2a7c:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de2a7e:	4604      	mov	r4, r0
c0de2a80:	f640 1074 	movw	r0, #2420	@ 0x974
c0de2a84:	461d      	mov	r5, r3
c0de2a86:	460e      	mov	r6, r1
c0de2a88:	4283      	cmp	r3, r0
c0de2a8a:	d311      	bcc.n	c0de2ab0 <pqcrystals_dilithium2_lowram_open+0x34>
c0de2a8c:	e9dd 7108 	ldrd	r7, r1, [sp, #32]
c0de2a90:	f6a5 1374 	subw	r3, r5, #2420	@ 0x974
c0de2a94:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de2a96:	6033      	str	r3, [r6, #0]
c0de2a98:	e9cd 7100 	strd	r7, r1, [sp]
c0de2a9c:	f602 1774 	addw	r7, r2, #2420	@ 0x974
c0de2aa0:	9002      	str	r0, [sp, #8]
c0de2aa2:	4610      	mov	r0, r2
c0de2aa4:	f640 1174 	movw	r1, #2420	@ 0x974
c0de2aa8:	463a      	mov	r2, r7
c0de2aaa:	f7ff fecd 	bl	c0de2848 <pqcrystals_dilithium2_lowram_verify>
c0de2aae:	b148      	cbz	r0, c0de2ac4 <pqcrystals_dilithium2_lowram_open+0x48>
c0de2ab0:	2000      	movs	r0, #0
c0de2ab2:	6030      	str	r0, [r6, #0]
c0de2ab4:	b11d      	cbz	r5, c0de2abe <pqcrystals_dilithium2_lowram_open+0x42>
c0de2ab6:	f804 0b01 	strb.w	r0, [r4], #1
c0de2aba:	3d01      	subs	r5, #1
c0de2abc:	e7fa      	b.n	c0de2ab4 <pqcrystals_dilithium2_lowram_open+0x38>
c0de2abe:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de2ac2:	bdfe      	pop	{r1, r2, r3, r4, r5, r6, r7, pc}
c0de2ac4:	2000      	movs	r0, #0
c0de2ac6:	6831      	ldr	r1, [r6, #0]
c0de2ac8:	4288      	cmp	r0, r1
c0de2aca:	bf24      	itt	cs
c0de2acc:	2000      	movcs	r0, #0
c0de2ace:	bdfe      	popcs	{r1, r2, r3, r4, r5, r6, r7, pc}
c0de2ad0:	5c39      	ldrb	r1, [r7, r0]
c0de2ad2:	5421      	strb	r1, [r4, r0]
c0de2ad4:	3001      	adds	r0, #1
c0de2ad6:	e7f6      	b.n	c0de2ac6 <pqcrystals_dilithium2_lowram_open+0x4a>

c0de2ad8 <OUTLINED_FUNCTION_0>:
c0de2ad8:	4620      	mov	r0, r4
c0de2ada:	f7fe baea 	b.w	c0de10b2 <inner_keccak256_flip>
	...

c0de2ae0 <small_ntt>:
c0de2ae0:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de2ae4:	491c      	ldr	r1, [pc, #112]	@ (c0de2b58 <small_ntt+0x78>)
c0de2ae6:	f04f 0c80 	mov.w	ip, #128	@ 0x80
c0de2aea:	f04f 0e01 	mov.w	lr, #1
c0de2aee:	f46f 6850 	mvn.w	r8, #3328	@ 0xd00
c0de2af2:	4479      	add	r1, pc
c0de2af4:	468a      	mov	sl, r1
c0de2af6:	4917      	ldr	r1, [pc, #92]	@ (c0de2b54 <small_ntt+0x74>)
c0de2af8:	468b      	mov	fp, r1
c0de2afa:	f1bc 0f02 	cmp.w	ip, #2
c0de2afe:	bf38      	it	cc
c0de2b00:	e8bd 8df0 	ldmiacc.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de2b04:	2600      	movs	r6, #0
c0de2b06:	2eff      	cmp	r6, #255	@ 0xff
c0de2b08:	d821      	bhi.n	c0de2b4e <small_ntt+0x6e>
c0de2b0a:	4651      	mov	r1, sl
c0de2b0c:	f93a 301e 	ldrsh.w	r3, [sl, lr, lsl #1]
c0de2b10:	eb06 010c 	add.w	r1, r6, ip
c0de2b14:	460f      	mov	r7, r1
c0de2b16:	428e      	cmp	r6, r1
c0de2b18:	d215      	bcs.n	c0de2b46 <small_ntt+0x66>
c0de2b1a:	f930 2017 	ldrsh.w	r2, [r0, r7, lsl #1]
c0de2b1e:	465c      	mov	r4, fp
c0de2b20:	435a      	muls	r2, r3
c0de2b22:	fb02 f40b 	mul.w	r4, r2, fp
c0de2b26:	1424      	asrs	r4, r4, #16
c0de2b28:	fb04 2208 	mla	r2, r4, r8, r2
c0de2b2c:	f830 4016 	ldrh.w	r4, [r0, r6, lsl #1]
c0de2b30:	eba4 4512 	sub.w	r5, r4, r2, lsr #16
c0de2b34:	eb04 4212 	add.w	r2, r4, r2, lsr #16
c0de2b38:	f820 5017 	strh.w	r5, [r0, r7, lsl #1]
c0de2b3c:	f820 2016 	strh.w	r2, [r0, r6, lsl #1]
c0de2b40:	3701      	adds	r7, #1
c0de2b42:	3601      	adds	r6, #1
c0de2b44:	e7e7      	b.n	c0de2b16 <small_ntt+0x36>
c0de2b46:	f10e 0e01 	add.w	lr, lr, #1
c0de2b4a:	463e      	mov	r6, r7
c0de2b4c:	e7db      	b.n	c0de2b06 <small_ntt+0x26>
c0de2b4e:	ea4f 0c5c 	mov.w	ip, ip, lsr #1
c0de2b52:	e7d2      	b.n	c0de2afa <small_ntt+0x1a>
c0de2b54:	f3010000 	.word	0xf3010000
c0de2b58:	0000c50a 	.word	0x0000c50a

c0de2b5c <small_invntt_tomont>:
c0de2b5c:	e92d 4dfe 	stmdb	sp!, {r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de2b60:	4934      	ldr	r1, [pc, #208]	@ (c0de2c34 <small_invntt_tomont+0xd8>)
c0de2b62:	4b36      	ldr	r3, [pc, #216]	@ (c0de2c3c <small_invntt_tomont+0xe0>)
c0de2b64:	2202      	movs	r2, #2
c0de2b66:	247f      	movs	r4, #127	@ 0x7f
c0de2b68:	f644 68bf 	movw	r8, #20159	@ 0x4ebf
c0de2b6c:	f46f 6a50 	mvn.w	sl, #3328	@ 0xd00
c0de2b70:	468e      	mov	lr, r1
c0de2b72:	4931      	ldr	r1, [pc, #196]	@ (c0de2c38 <small_invntt_tomont+0xdc>)
c0de2b74:	447b      	add	r3, pc
c0de2b76:	9300      	str	r3, [sp, #0]
c0de2b78:	f101 5bd3 	add.w	fp, r1, #442499072	@ 0x1a600000
c0de2b7c:	2a80      	cmp	r2, #128	@ 0x80
c0de2b7e:	d834      	bhi.n	c0de2bea <small_invntt_tomont+0x8e>
c0de2b80:	2300      	movs	r3, #0
c0de2b82:	9201      	str	r2, [sp, #4]
c0de2b84:	2bff      	cmp	r3, #255	@ 0xff
c0de2b86:	d82e      	bhi.n	c0de2be6 <small_invntt_tomont+0x8a>
c0de2b88:	9900      	ldr	r1, [sp, #0]
c0de2b8a:	9402      	str	r4, [sp, #8]
c0de2b8c:	f931 4014 	ldrsh.w	r4, [r1, r4, lsl #1]
c0de2b90:	1899      	adds	r1, r3, r2
c0de2b92:	460d      	mov	r5, r1
c0de2b94:	428b      	cmp	r3, r1
c0de2b96:	d221      	bcs.n	c0de2bdc <small_invntt_tomont+0x80>
c0de2b98:	f830 6013 	ldrh.w	r6, [r0, r3, lsl #1]
c0de2b9c:	f830 2015 	ldrh.w	r2, [r0, r5, lsl #1]
c0de2ba0:	46f4      	mov	ip, lr
c0de2ba2:	4432      	add	r2, r6
c0de2ba4:	b217      	sxth	r7, r2
c0de2ba6:	fb07 f708 	mul.w	r7, r7, r8
c0de2baa:	f107 7700 	add.w	r7, r7, #33554432	@ 0x2000000
c0de2bae:	16bf      	asrs	r7, r7, #26
c0de2bb0:	fb07 f70e 	mul.w	r7, r7, lr
c0de2bb4:	eba2 4217 	sub.w	r2, r2, r7, lsr #16
c0de2bb8:	f820 2013 	strh.w	r2, [r0, r3, lsl #1]
c0de2bbc:	3301      	adds	r3, #1
c0de2bbe:	f830 2015 	ldrh.w	r2, [r0, r5, lsl #1]
c0de2bc2:	1b92      	subs	r2, r2, r6
c0de2bc4:	b212      	sxth	r2, r2
c0de2bc6:	4362      	muls	r2, r4
c0de2bc8:	fb02 f60b 	mul.w	r6, r2, fp
c0de2bcc:	1436      	asrs	r6, r6, #16
c0de2bce:	fb06 220a 	mla	r2, r6, sl, r2
c0de2bd2:	0c12      	lsrs	r2, r2, #16
c0de2bd4:	f820 2015 	strh.w	r2, [r0, r5, lsl #1]
c0de2bd8:	3501      	adds	r5, #1
c0de2bda:	e7db      	b.n	c0de2b94 <small_invntt_tomont+0x38>
c0de2bdc:	9c02      	ldr	r4, [sp, #8]
c0de2bde:	9a01      	ldr	r2, [sp, #4]
c0de2be0:	462b      	mov	r3, r5
c0de2be2:	3c01      	subs	r4, #1
c0de2be4:	e7ce      	b.n	c0de2b84 <small_invntt_tomont+0x28>
c0de2be6:	0052      	lsls	r2, r2, #1
c0de2be8:	e7c8      	b.n	c0de2b7c <small_invntt_tomont+0x20>
c0de2bea:	2100      	movs	r1, #0
c0de2bec:	f240 52a1 	movw	r2, #1441	@ 0x5a1
c0de2bf0:	f46f 6350 	mvn.w	r3, #3328	@ 0xd00
c0de2bf4:	f644 64bf 	movw	r4, #20159	@ 0x4ebf
c0de2bf8:	f5b1 7f80 	cmp.w	r1, #256	@ 0x100
c0de2bfc:	bf08      	it	eq
c0de2bfe:	e8bd 8dfe 	ldmiaeq.w	sp!, {r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de2c02:	f930 5011 	ldrsh.w	r5, [r0, r1, lsl #1]
c0de2c06:	4f0c      	ldr	r7, [pc, #48]	@ (c0de2c38 <small_invntt_tomont+0xdc>)
c0de2c08:	fb05 f602 	mul.w	r6, r5, r2
c0de2c0c:	437d      	muls	r5, r7
c0de2c0e:	4677      	mov	r7, lr
c0de2c10:	142d      	asrs	r5, r5, #16
c0de2c12:	fb05 6503 	mla	r5, r5, r3, r6
c0de2c16:	142e      	asrs	r6, r5, #16
c0de2c18:	0c2d      	lsrs	r5, r5, #16
c0de2c1a:	4366      	muls	r6, r4
c0de2c1c:	f106 7600 	add.w	r6, r6, #33554432	@ 0x2000000
c0de2c20:	16b6      	asrs	r6, r6, #26
c0de2c22:	fb06 f60e 	mul.w	r6, r6, lr
c0de2c26:	eba5 4516 	sub.w	r5, r5, r6, lsr #16
c0de2c2a:	f820 5011 	strh.w	r5, [r0, r1, lsl #1]
c0de2c2e:	3101      	adds	r1, #1
c0de2c30:	e7e2      	b.n	c0de2bf8 <small_invntt_tomont+0x9c>
c0de2c32:	bf00      	nop
c0de2c34:	0d010000 	.word	0x0d010000
c0de2c38:	d8a10000 	.word	0xd8a10000
c0de2c3c:	0000c488 	.word	0x0000c488

c0de2c40 <small_basemul>:
c0de2c40:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de2c42:	f9b1 c000 	ldrsh.w	ip, [r1]
c0de2c46:	f9b1 5002 	ldrsh.w	r5, [r1, #2]
c0de2c4a:	f9b2 1002 	ldrsh.w	r1, [r2, #2]
c0de2c4e:	f46f 6e50 	mvn.w	lr, #3328	@ 0xd00
c0de2c52:	f9b2 6000 	ldrsh.w	r6, [r2]
c0de2c56:	fb01 f705 	mul.w	r7, r1, r5
c0de2c5a:	4916      	ldr	r1, [pc, #88]	@ (c0de2cb4 <small_basemul+0x74>)
c0de2c5c:	fb07 f401 	mul.w	r4, r7, r1
c0de2c60:	1424      	asrs	r4, r4, #16
c0de2c62:	fb04 740e 	mla	r4, r4, lr, r7
c0de2c66:	1424      	asrs	r4, r4, #16
c0de2c68:	4363      	muls	r3, r4
c0de2c6a:	fb03 f401 	mul.w	r4, r3, r1
c0de2c6e:	1424      	asrs	r4, r4, #16
c0de2c70:	fb04 330e 	mla	r3, r4, lr, r3
c0de2c74:	fb06 f40c 	mul.w	r4, r6, ip
c0de2c78:	fb04 f701 	mul.w	r7, r4, r1
c0de2c7c:	143f      	asrs	r7, r7, #16
c0de2c7e:	0c1b      	lsrs	r3, r3, #16
c0de2c80:	fb07 440e 	mla	r4, r7, lr, r4
c0de2c84:	eb03 4314 	add.w	r3, r3, r4, lsr #16
c0de2c88:	8003      	strh	r3, [r0, #0]
c0de2c8a:	fb06 f305 	mul.w	r3, r6, r5
c0de2c8e:	f9b2 2002 	ldrsh.w	r2, [r2, #2]
c0de2c92:	fb03 f401 	mul.w	r4, r3, r1
c0de2c96:	1424      	asrs	r4, r4, #16
c0de2c98:	fb02 f20c 	mul.w	r2, r2, ip
c0de2c9c:	fb04 330e 	mla	r3, r4, lr, r3
c0de2ca0:	4351      	muls	r1, r2
c0de2ca2:	1409      	asrs	r1, r1, #16
c0de2ca4:	fb01 210e 	mla	r1, r1, lr, r2
c0de2ca8:	0c09      	lsrs	r1, r1, #16
c0de2caa:	eb01 4113 	add.w	r1, r1, r3, lsr #16
c0de2cae:	8041      	strh	r1, [r0, #2]
c0de2cb0:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de2cb2:	bf00      	nop
c0de2cb4:	f3010000 	.word	0xf3010000

c0de2cb8 <poly_small_ntt_copy>:
c0de2cb8:	22ff      	movs	r2, #255	@ 0xff
c0de2cba:	f1b2 3fff 	cmp.w	r2, #4294967295	@ 0xffffffff
c0de2cbe:	bfd8      	it	le
c0de2cc0:	f7ff bf0e 	ble.w	c0de2ae0 <small_ntt>
c0de2cc4:	f851 3022 	ldr.w	r3, [r1, r2, lsl #2]
c0de2cc8:	f820 3012 	strh.w	r3, [r0, r2, lsl #1]
c0de2ccc:	3a01      	subs	r2, #1
c0de2cce:	e7f4      	b.n	c0de2cba <poly_small_ntt_copy+0x2>

c0de2cd0 <poly_small_basemul>:
c0de2cd0:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de2cd4:	e9cd 1200 	strd	r1, r2, [sp]
c0de2cd8:	4683      	mov	fp, r0
c0de2cda:	f04f 0a00 	mov.w	sl, #0
c0de2cde:	4811      	ldr	r0, [pc, #68]	@ (c0de2d24 <poly_small_basemul+0x54>)
c0de2ce0:	4478      	add	r0, pc
c0de2ce2:	f100 0880 	add.w	r8, r0, #128	@ 0x80
c0de2ce6:	f5ba 7f00 	cmp.w	sl, #512	@ 0x200
c0de2cea:	bf08      	it	eq
c0de2cec:	e8bd 8dfc 	ldmiaeq.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de2cf0:	9800      	ldr	r0, [sp, #0]
c0de2cf2:	f938 6b02 	ldrsh.w	r6, [r8], #2
c0de2cf6:	eb0b 070a 	add.w	r7, fp, sl
c0de2cfa:	eb00 040a 	add.w	r4, r0, sl
c0de2cfe:	9801      	ldr	r0, [sp, #4]
c0de2d00:	4633      	mov	r3, r6
c0de2d02:	4621      	mov	r1, r4
c0de2d04:	eb00 050a 	add.w	r5, r0, sl
c0de2d08:	4638      	mov	r0, r7
c0de2d0a:	462a      	mov	r2, r5
c0de2d0c:	f7ff ff98 	bl	c0de2c40 <small_basemul>
c0de2d10:	4273      	negs	r3, r6
c0de2d12:	1d38      	adds	r0, r7, #4
c0de2d14:	1d21      	adds	r1, r4, #4
c0de2d16:	1d2a      	adds	r2, r5, #4
c0de2d18:	b21b      	sxth	r3, r3
c0de2d1a:	f7ff ff91 	bl	c0de2c40 <small_basemul>
c0de2d1e:	f10a 0a08 	add.w	sl, sl, #8
c0de2d22:	e7e0      	b.n	c0de2ce6 <poly_small_basemul+0x16>
c0de2d24:	0000c31c 	.word	0x0000c31c

c0de2d28 <poly_small_basemul_invntt>:
c0de2d28:	b510      	push	{r4, lr}
c0de2d2a:	4604      	mov	r4, r0
c0de2d2c:	f7ff ffd0 	bl	c0de2cd0 <poly_small_basemul>
c0de2d30:	4620      	mov	r0, r4
c0de2d32:	f7ff ff13 	bl	c0de2b5c <small_invntt_tomont>
c0de2d36:	20ff      	movs	r0, #255	@ 0xff
c0de2d38:	2800      	cmp	r0, #0
c0de2d3a:	d405      	bmi.n	c0de2d48 <poly_small_basemul_invntt+0x20>
c0de2d3c:	f934 1010 	ldrsh.w	r1, [r4, r0, lsl #1]
c0de2d40:	f844 1020 	str.w	r1, [r4, r0, lsl #2]
c0de2d44:	3801      	subs	r0, #1
c0de2d46:	e7f7      	b.n	c0de2d38 <poly_small_basemul_invntt+0x10>
c0de2d48:	bd10      	pop	{r4, pc}

c0de2d4a <small_polyeta_unpack>:
c0de2d4a:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de2d4e:	3101      	adds	r1, #1
c0de2d50:	f04f 0c00 	mov.w	ip, #0
c0de2d54:	f5bc 7f00 	cmp.w	ip, #512	@ 0x200
c0de2d58:	bf08      	it	eq
c0de2d5a:	e8bd 8df0 	ldmiaeq.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de2d5e:	f811 4c01 	ldrb.w	r4, [r1, #-1]
c0de2d62:	f004 0807 	and.w	r8, r4, #7
c0de2d66:	eb00 040c 	add.w	r4, r0, ip
c0de2d6a:	f820 800c 	strh.w	r8, [r0, ip]
c0de2d6e:	f1c8 0202 	rsb	r2, r8, #2
c0de2d72:	f811 5c01 	ldrb.w	r5, [r1, #-1]
c0de2d76:	f3c5 0ec2 	ubfx	lr, r5, #3, #3
c0de2d7a:	f8a4 e002 	strh.w	lr, [r4, #2]
c0de2d7e:	f811 6c01 	ldrb.w	r6, [r1, #-1]
c0de2d82:	780b      	ldrb	r3, [r1, #0]
c0de2d84:	09b6      	lsrs	r6, r6, #6
c0de2d86:	f363 0682 	bfi	r6, r3, #2, #1
c0de2d8a:	80a6      	strh	r6, [r4, #4]
c0de2d8c:	780b      	ldrb	r3, [r1, #0]
c0de2d8e:	f3c3 0a42 	ubfx	sl, r3, #1, #3
c0de2d92:	f8a4 a006 	strh.w	sl, [r4, #6]
c0de2d96:	780d      	ldrb	r5, [r1, #0]
c0de2d98:	f3c5 1502 	ubfx	r5, r5, #4, #3
c0de2d9c:	8125      	strh	r5, [r4, #8]
c0de2d9e:	780f      	ldrb	r7, [r1, #0]
c0de2da0:	784b      	ldrb	r3, [r1, #1]
c0de2da2:	09ff      	lsrs	r7, r7, #7
c0de2da4:	f363 0742 	bfi	r7, r3, #1, #2
c0de2da8:	8167      	strh	r7, [r4, #10]
c0de2daa:	784b      	ldrb	r3, [r1, #1]
c0de2dac:	f3c3 0382 	ubfx	r3, r3, #2, #3
c0de2db0:	81a3      	strh	r3, [r4, #12]
c0de2db2:	f891 b001 	ldrb.w	fp, [r1, #1]
c0de2db6:	f820 200c 	strh.w	r2, [r0, ip]
c0de2dba:	f1c3 0202 	rsb	r2, r3, #2
c0de2dbe:	3103      	adds	r1, #3
c0de2dc0:	f10c 0c10 	add.w	ip, ip, #16
c0de2dc4:	81a2      	strh	r2, [r4, #12]
c0de2dc6:	f1c7 0202 	rsb	r2, r7, #2
c0de2dca:	8162      	strh	r2, [r4, #10]
c0de2dcc:	f1c5 0202 	rsb	r2, r5, #2
c0de2dd0:	8122      	strh	r2, [r4, #8]
c0de2dd2:	f1ca 0202 	rsb	r2, sl, #2
c0de2dd6:	80e2      	strh	r2, [r4, #6]
c0de2dd8:	f1c6 0202 	rsb	r2, r6, #2
c0de2ddc:	80a2      	strh	r2, [r4, #4]
c0de2dde:	f1ce 0202 	rsb	r2, lr, #2
c0de2de2:	8062      	strh	r2, [r4, #2]
c0de2de4:	2202      	movs	r2, #2
c0de2de6:	eba2 125b 	sub.w	r2, r2, fp, lsr #5
c0de2dea:	81e2      	strh	r2, [r4, #14]
c0de2dec:	e7b2      	b.n	c0de2d54 <small_polyeta_unpack+0xa>

c0de2dee <tEdwards_alloc>:
c0de2dee:	b5b0      	push	{r4, r5, r7, lr}
c0de2df0:	f000 fbbf 	bl	c0de3572 <OUTLINED_FUNCTION_4>
c0de2df4:	b920      	cbnz	r0, c0de2e00 <tEdwards_alloc+0x12>
c0de2df6:	6821      	ldr	r1, [r4, #0]
c0de2df8:	1d28      	adds	r0, r5, #4
c0de2dfa:	f008 fd9b 	bl	c0deb934 <cx_bn_alloc>
c0de2dfe:	b100      	cbz	r0, c0de2e02 <tEdwards_alloc+0x14>
c0de2e00:	bdb0      	pop	{r4, r5, r7, pc}
c0de2e02:	6821      	ldr	r1, [r4, #0]
c0de2e04:	f105 0008 	add.w	r0, r5, #8
c0de2e08:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
c0de2e0c:	f008 bd92 	b.w	c0deb934 <cx_bn_alloc>

c0de2e10 <tEdwards_double>:
c0de2e10:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de2e12:	460f      	mov	r7, r1
c0de2e14:	4614      	mov	r4, r2
c0de2e16:	4605      	mov	r5, r0
c0de2e18:	6843      	ldr	r3, [r0, #4]
c0de2e1a:	6809      	ldr	r1, [r1, #0]
c0de2e1c:	6b40      	ldr	r0, [r0, #52]	@ 0x34
c0de2e1e:	687a      	ldr	r2, [r7, #4]
c0de2e20:	f008 fdf6 	bl	c0deba10 <cx_bn_mod_add>
c0de2e24:	2800      	cmp	r0, #0
c0de2e26:	d154      	bne.n	c0de2ed2 <tEdwards_double+0xc2>
c0de2e28:	e9d5 010c 	ldrd	r0, r1, [r5, #48]	@ 0x30
c0de2e2c:	f105 0620 	add.w	r6, r5, #32
c0de2e30:	f000 fb96 	bl	c0de3560 <OUTLINED_FUNCTION_2>
c0de2e34:	2800      	cmp	r0, #0
c0de2e36:	d14c      	bne.n	c0de2ed2 <tEdwards_double+0xc2>
c0de2e38:	6839      	ldr	r1, [r7, #0]
c0de2e3a:	6b68      	ldr	r0, [r5, #52]	@ 0x34
c0de2e3c:	f000 fb90 	bl	c0de3560 <OUTLINED_FUNCTION_2>
c0de2e40:	2800      	cmp	r0, #0
c0de2e42:	d146      	bne.n	c0de2ed2 <tEdwards_double+0xc2>
c0de2e44:	6879      	ldr	r1, [r7, #4]
c0de2e46:	6ba8      	ldr	r0, [r5, #56]	@ 0x38
c0de2e48:	f000 fb8a 	bl	c0de3560 <OUTLINED_FUNCTION_2>
c0de2e4c:	2800      	cmp	r0, #0
c0de2e4e:	d140      	bne.n	c0de2ed2 <tEdwards_double+0xc2>
c0de2e50:	69a9      	ldr	r1, [r5, #24]
c0de2e52:	6b6a      	ldr	r2, [r5, #52]	@ 0x34
c0de2e54:	6be8      	ldr	r0, [r5, #60]	@ 0x3c
c0de2e56:	f000 fb7d 	bl	c0de3554 <OUTLINED_FUNCTION_0>
c0de2e5a:	bbd0      	cbnz	r0, c0de2ed2 <tEdwards_double+0xc2>
c0de2e5c:	686b      	ldr	r3, [r5, #4]
c0de2e5e:	e9d5 210e 	ldrd	r2, r1, [r5, #56]	@ 0x38
c0de2e62:	6c28      	ldr	r0, [r5, #64]	@ 0x40
c0de2e64:	f008 fdd4 	bl	c0deba10 <cx_bn_mod_add>
c0de2e68:	bb98      	cbnz	r0, c0de2ed2 <tEdwards_double+0xc2>
c0de2e6a:	68b9      	ldr	r1, [r7, #8]
c0de2e6c:	6ca8      	ldr	r0, [r5, #72]	@ 0x48
c0de2e6e:	f000 fb77 	bl	c0de3560 <OUTLINED_FUNCTION_2>
c0de2e72:	bb70      	cbnz	r0, c0de2ed2 <tEdwards_double+0xc2>
c0de2e74:	686b      	ldr	r3, [r5, #4]
c0de2e76:	6ae8      	ldr	r0, [r5, #44]	@ 0x2c
c0de2e78:	6c29      	ldr	r1, [r5, #64]	@ 0x40
c0de2e7a:	6caa      	ldr	r2, [r5, #72]	@ 0x48
c0de2e7c:	f008 fdd4 	bl	c0deba28 <cx_bn_mod_sub>
c0de2e80:	bb38      	cbnz	r0, c0de2ed2 <tEdwards_double+0xc2>
c0de2e82:	686b      	ldr	r3, [r5, #4]
c0de2e84:	6ae9      	ldr	r1, [r5, #44]	@ 0x2c
c0de2e86:	e9d5 2012 	ldrd	r2, r0, [r5, #72]	@ 0x48
c0de2e8a:	f008 fdcd 	bl	c0deba28 <cx_bn_mod_sub>
c0de2e8e:	bb00      	cbnz	r0, c0de2ed2 <tEdwards_double+0xc2>
c0de2e90:	f105 022c 	add.w	r2, r5, #44	@ 0x2c
c0de2e94:	686b      	ldr	r3, [r5, #4]
c0de2e96:	ca07      	ldmia	r2, {r0, r1, r2}
c0de2e98:	f008 fdc6 	bl	c0deba28 <cx_bn_mod_sub>
c0de2e9c:	b9c8      	cbnz	r0, c0de2ed2 <tEdwards_double+0xc2>
c0de2e9e:	686b      	ldr	r3, [r5, #4]
c0de2ea0:	e9d5 100b 	ldrd	r1, r0, [r5, #44]	@ 0x2c
c0de2ea4:	6baa      	ldr	r2, [r5, #56]	@ 0x38
c0de2ea6:	f008 fdbf 	bl	c0deba28 <cx_bn_mod_sub>
c0de2eaa:	b990      	cbnz	r0, c0de2ed2 <tEdwards_double+0xc2>
c0de2eac:	6b2a      	ldr	r2, [r5, #48]	@ 0x30
c0de2eae:	6ce9      	ldr	r1, [r5, #76]	@ 0x4c
c0de2eb0:	6820      	ldr	r0, [r4, #0]
c0de2eb2:	f000 fb4f 	bl	c0de3554 <OUTLINED_FUNCTION_0>
c0de2eb6:	b960      	cbnz	r0, c0de2ed2 <tEdwards_double+0xc2>
c0de2eb8:	686b      	ldr	r3, [r5, #4]
c0de2eba:	e9d5 020d 	ldrd	r0, r2, [r5, #52]	@ 0x34
c0de2ebe:	6be9      	ldr	r1, [r5, #60]	@ 0x3c
c0de2ec0:	f008 fdb2 	bl	c0deba28 <cx_bn_mod_sub>
c0de2ec4:	b928      	cbnz	r0, c0de2ed2 <tEdwards_double+0xc2>
c0de2ec6:	6b6a      	ldr	r2, [r5, #52]	@ 0x34
c0de2ec8:	6c29      	ldr	r1, [r5, #64]	@ 0x40
c0de2eca:	6860      	ldr	r0, [r4, #4]
c0de2ecc:	f000 fb42 	bl	c0de3554 <OUTLINED_FUNCTION_0>
c0de2ed0:	b100      	cbz	r0, c0de2ed4 <tEdwards_double+0xc4>
c0de2ed2:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0de2ed4:	6c29      	ldr	r1, [r5, #64]	@ 0x40
c0de2ed6:	6cea      	ldr	r2, [r5, #76]	@ 0x4c
c0de2ed8:	68a0      	ldr	r0, [r4, #8]
c0de2eda:	4633      	mov	r3, r6
c0de2edc:	b001      	add	sp, #4
c0de2ede:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de2ee2:	f008 bde3 	b.w	c0debaac <cx_mont_mul>

c0de2ee6 <tEdwards_add>:
c0de2ee6:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de2eea:	4606      	mov	r6, r0
c0de2eec:	4617      	mov	r7, r2
c0de2eee:	460c      	mov	r4, r1
c0de2ef0:	6892      	ldr	r2, [r2, #8]
c0de2ef2:	6889      	ldr	r1, [r1, #8]
c0de2ef4:	6ac0      	ldr	r0, [r0, #44]	@ 0x2c
c0de2ef6:	4698      	mov	r8, r3
c0de2ef8:	f106 0520 	add.w	r5, r6, #32
c0de2efc:	f000 fb2d 	bl	c0de355a <OUTLINED_FUNCTION_1>
c0de2f00:	2800      	cmp	r0, #0
c0de2f02:	d17d      	bne.n	c0de3000 <tEdwards_add+0x11a>
c0de2f04:	e9d6 100b 	ldrd	r1, r0, [r6, #44]	@ 0x2c
c0de2f08:	462b      	mov	r3, r5
c0de2f0a:	460a      	mov	r2, r1
c0de2f0c:	f008 fdce 	bl	c0debaac <cx_mont_mul>
c0de2f10:	2800      	cmp	r0, #0
c0de2f12:	d175      	bne.n	c0de3000 <tEdwards_add+0x11a>
c0de2f14:	683a      	ldr	r2, [r7, #0]
c0de2f16:	6821      	ldr	r1, [r4, #0]
c0de2f18:	6b70      	ldr	r0, [r6, #52]	@ 0x34
c0de2f1a:	f000 fb1e 	bl	c0de355a <OUTLINED_FUNCTION_1>
c0de2f1e:	2800      	cmp	r0, #0
c0de2f20:	d16e      	bne.n	c0de3000 <tEdwards_add+0x11a>
c0de2f22:	687a      	ldr	r2, [r7, #4]
c0de2f24:	6861      	ldr	r1, [r4, #4]
c0de2f26:	6bb0      	ldr	r0, [r6, #56]	@ 0x38
c0de2f28:	f000 fb17 	bl	c0de355a <OUTLINED_FUNCTION_1>
c0de2f2c:	2800      	cmp	r0, #0
c0de2f2e:	d167      	bne.n	c0de3000 <tEdwards_add+0x11a>
c0de2f30:	e9d6 120d 	ldrd	r1, r2, [r6, #52]	@ 0x34
c0de2f34:	6cf0      	ldr	r0, [r6, #76]	@ 0x4c
c0de2f36:	f000 fb10 	bl	c0de355a <OUTLINED_FUNCTION_1>
c0de2f3a:	2800      	cmp	r0, #0
c0de2f3c:	d160      	bne.n	c0de3000 <tEdwards_add+0x11a>
c0de2f3e:	69f2      	ldr	r2, [r6, #28]
c0de2f40:	6bf0      	ldr	r0, [r6, #60]	@ 0x3c
c0de2f42:	6cf1      	ldr	r1, [r6, #76]	@ 0x4c
c0de2f44:	f000 fb09 	bl	c0de355a <OUTLINED_FUNCTION_1>
c0de2f48:	2800      	cmp	r0, #0
c0de2f4a:	d159      	bne.n	c0de3000 <tEdwards_add+0x11a>
c0de2f4c:	6873      	ldr	r3, [r6, #4]
c0de2f4e:	6b31      	ldr	r1, [r6, #48]	@ 0x30
c0de2f50:	e9d6 200f 	ldrd	r2, r0, [r6, #60]	@ 0x3c
c0de2f54:	f008 fd68 	bl	c0deba28 <cx_bn_mod_sub>
c0de2f58:	2800      	cmp	r0, #0
c0de2f5a:	d151      	bne.n	c0de3000 <tEdwards_add+0x11a>
c0de2f5c:	6873      	ldr	r3, [r6, #4]
c0de2f5e:	6b31      	ldr	r1, [r6, #48]	@ 0x30
c0de2f60:	6bf2      	ldr	r2, [r6, #60]	@ 0x3c
c0de2f62:	6c70      	ldr	r0, [r6, #68]	@ 0x44
c0de2f64:	f008 fd54 	bl	c0deba10 <cx_bn_mod_add>
c0de2f68:	2800      	cmp	r0, #0
c0de2f6a:	d149      	bne.n	c0de3000 <tEdwards_add+0x11a>
c0de2f6c:	e9d4 1200 	ldrd	r1, r2, [r4]
c0de2f70:	6873      	ldr	r3, [r6, #4]
c0de2f72:	6cb0      	ldr	r0, [r6, #72]	@ 0x48
c0de2f74:	f008 fd4c 	bl	c0deba10 <cx_bn_mod_add>
c0de2f78:	2800      	cmp	r0, #0
c0de2f7a:	d141      	bne.n	c0de3000 <tEdwards_add+0x11a>
c0de2f7c:	e9d7 1200 	ldrd	r1, r2, [r7]
c0de2f80:	6873      	ldr	r3, [r6, #4]
c0de2f82:	6cf0      	ldr	r0, [r6, #76]	@ 0x4c
c0de2f84:	f008 fd44 	bl	c0deba10 <cx_bn_mod_add>
c0de2f88:	bbd0      	cbnz	r0, c0de3000 <tEdwards_add+0x11a>
c0de2f8a:	6b30      	ldr	r0, [r6, #48]	@ 0x30
c0de2f8c:	e9d6 1212 	ldrd	r1, r2, [r6, #72]	@ 0x48
c0de2f90:	f000 fae3 	bl	c0de355a <OUTLINED_FUNCTION_1>
c0de2f94:	bba0      	cbnz	r0, c0de3000 <tEdwards_add+0x11a>
c0de2f96:	6873      	ldr	r3, [r6, #4]
c0de2f98:	e9d6 120c 	ldrd	r1, r2, [r6, #48]	@ 0x30
c0de2f9c:	6cb0      	ldr	r0, [r6, #72]	@ 0x48
c0de2f9e:	f008 fd43 	bl	c0deba28 <cx_bn_mod_sub>
c0de2fa2:	bb68      	cbnz	r0, c0de3000 <tEdwards_add+0x11a>
c0de2fa4:	6873      	ldr	r3, [r6, #4]
c0de2fa6:	6bb2      	ldr	r2, [r6, #56]	@ 0x38
c0de2fa8:	e9d6 1012 	ldrd	r1, r0, [r6, #72]	@ 0x48
c0de2fac:	f008 fd3c 	bl	c0deba28 <cx_bn_mod_sub>
c0de2fb0:	bb30      	cbnz	r0, c0de3000 <tEdwards_add+0x11a>
c0de2fb2:	e9d6 100b 	ldrd	r1, r0, [r6, #44]	@ 0x2c
c0de2fb6:	6cf2      	ldr	r2, [r6, #76]	@ 0x4c
c0de2fb8:	f000 facf 	bl	c0de355a <OUTLINED_FUNCTION_1>
c0de2fbc:	bb00      	cbnz	r0, c0de3000 <tEdwards_add+0x11a>
c0de2fbe:	6b32      	ldr	r2, [r6, #48]	@ 0x30
c0de2fc0:	6c31      	ldr	r1, [r6, #64]	@ 0x40
c0de2fc2:	f8d8 0000 	ldr.w	r0, [r8]
c0de2fc6:	f000 fac8 	bl	c0de355a <OUTLINED_FUNCTION_1>
c0de2fca:	b9c8      	cbnz	r0, c0de3000 <tEdwards_add+0x11a>
c0de2fcc:	69b1      	ldr	r1, [r6, #24]
c0de2fce:	e9d6 020c 	ldrd	r0, r2, [r6, #48]	@ 0x30
c0de2fd2:	f000 fac2 	bl	c0de355a <OUTLINED_FUNCTION_1>
c0de2fd6:	b998      	cbnz	r0, c0de3000 <tEdwards_add+0x11a>
c0de2fd8:	6873      	ldr	r3, [r6, #4]
c0de2fda:	6b32      	ldr	r2, [r6, #48]	@ 0x30
c0de2fdc:	6bb1      	ldr	r1, [r6, #56]	@ 0x38
c0de2fde:	6cf0      	ldr	r0, [r6, #76]	@ 0x4c
c0de2fe0:	f008 fd22 	bl	c0deba28 <cx_bn_mod_sub>
c0de2fe4:	b960      	cbnz	r0, c0de3000 <tEdwards_add+0x11a>
c0de2fe6:	6b30      	ldr	r0, [r6, #48]	@ 0x30
c0de2fe8:	6c71      	ldr	r1, [r6, #68]	@ 0x44
c0de2fea:	6cf2      	ldr	r2, [r6, #76]	@ 0x4c
c0de2fec:	f000 fab5 	bl	c0de355a <OUTLINED_FUNCTION_1>
c0de2ff0:	b930      	cbnz	r0, c0de3000 <tEdwards_add+0x11a>
c0de2ff2:	e9d6 120b 	ldrd	r1, r2, [r6, #44]	@ 0x2c
c0de2ff6:	f8d8 0004 	ldr.w	r0, [r8, #4]
c0de2ffa:	f000 faae 	bl	c0de355a <OUTLINED_FUNCTION_1>
c0de2ffe:	b108      	cbz	r0, c0de3004 <tEdwards_add+0x11e>
c0de3000:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de3004:	e9d6 1210 	ldrd	r1, r2, [r6, #64]	@ 0x40
c0de3008:	f8d8 0008 	ldr.w	r0, [r8, #8]
c0de300c:	462b      	mov	r3, r5
c0de300e:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de3012:	f008 bd4b 	b.w	c0debaac <cx_mont_mul>

c0de3016 <tEdwards_IsOnCurve>:
c0de3016:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de3018:	4605      	mov	r5, r0
c0de301a:	460f      	mov	r7, r1
c0de301c:	2005      	movs	r0, #5
c0de301e:	6809      	ldr	r1, [r1, #0]
c0de3020:	4614      	mov	r4, r2
c0de3022:	9000      	str	r0, [sp, #0]
c0de3024:	f105 0620 	add.w	r6, r5, #32
c0de3028:	6ae8      	ldr	r0, [r5, #44]	@ 0x2c
c0de302a:	460a      	mov	r2, r1
c0de302c:	f000 fa92 	bl	c0de3554 <OUTLINED_FUNCTION_0>
c0de3030:	b100      	cbz	r0, c0de3034 <tEdwards_IsOnCurve+0x1e>
c0de3032:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0de3034:	6879      	ldr	r1, [r7, #4]
c0de3036:	6b28      	ldr	r0, [r5, #48]	@ 0x30
c0de3038:	f000 fa92 	bl	c0de3560 <OUTLINED_FUNCTION_2>
c0de303c:	2800      	cmp	r0, #0
c0de303e:	d1f8      	bne.n	c0de3032 <tEdwards_IsOnCurve+0x1c>
c0de3040:	e9d5 120b 	ldrd	r1, r2, [r5, #44]	@ 0x2c
c0de3044:	6b68      	ldr	r0, [r5, #52]	@ 0x34
c0de3046:	f000 fa85 	bl	c0de3554 <OUTLINED_FUNCTION_0>
c0de304a:	2800      	cmp	r0, #0
c0de304c:	d1f1      	bne.n	c0de3032 <tEdwards_IsOnCurve+0x1c>
c0de304e:	69a9      	ldr	r1, [r5, #24]
c0de3050:	6aea      	ldr	r2, [r5, #44]	@ 0x2c
c0de3052:	6be8      	ldr	r0, [r5, #60]	@ 0x3c
c0de3054:	f000 fa7e 	bl	c0de3554 <OUTLINED_FUNCTION_0>
c0de3058:	2800      	cmp	r0, #0
c0de305a:	d1ea      	bne.n	c0de3032 <tEdwards_IsOnCurve+0x1c>
c0de305c:	6be8      	ldr	r0, [r5, #60]	@ 0x3c
c0de305e:	686b      	ldr	r3, [r5, #4]
c0de3060:	6b2a      	ldr	r2, [r5, #48]	@ 0x30
c0de3062:	4601      	mov	r1, r0
c0de3064:	f008 fcd4 	bl	c0deba10 <cx_bn_mod_add>
c0de3068:	2800      	cmp	r0, #0
c0de306a:	d1e2      	bne.n	c0de3032 <tEdwards_IsOnCurve+0x1c>
c0de306c:	69e9      	ldr	r1, [r5, #28]
c0de306e:	6b6a      	ldr	r2, [r5, #52]	@ 0x34
c0de3070:	6c28      	ldr	r0, [r5, #64]	@ 0x40
c0de3072:	f000 fa6f 	bl	c0de3554 <OUTLINED_FUNCTION_0>
c0de3076:	2800      	cmp	r0, #0
c0de3078:	d1db      	bne.n	c0de3032 <tEdwards_IsOnCurve+0x1c>
c0de307a:	686b      	ldr	r3, [r5, #4]
c0de307c:	6aaa      	ldr	r2, [r5, #40]	@ 0x28
c0de307e:	6ba8      	ldr	r0, [r5, #56]	@ 0x38
c0de3080:	6c29      	ldr	r1, [r5, #64]	@ 0x40
c0de3082:	f008 fcc5 	bl	c0deba10 <cx_bn_mod_add>
c0de3086:	2800      	cmp	r0, #0
c0de3088:	d1d3      	bne.n	c0de3032 <tEdwards_IsOnCurve+0x1c>
c0de308a:	6ba8      	ldr	r0, [r5, #56]	@ 0x38
c0de308c:	4632      	mov	r2, r6
c0de308e:	4601      	mov	r1, r0
c0de3090:	f008 fd00 	bl	c0deba94 <cx_mont_from_montgomery>
c0de3094:	2800      	cmp	r0, #0
c0de3096:	d1cc      	bne.n	c0de3032 <tEdwards_IsOnCurve+0x1c>
c0de3098:	6be8      	ldr	r0, [r5, #60]	@ 0x3c
c0de309a:	4632      	mov	r2, r6
c0de309c:	4601      	mov	r1, r0
c0de309e:	f008 fcf9 	bl	c0deba94 <cx_mont_from_montgomery>
c0de30a2:	2800      	cmp	r0, #0
c0de30a4:	d1c5      	bne.n	c0de3032 <tEdwards_IsOnCurve+0x1c>
c0de30a6:	e9d5 010e 	ldrd	r0, r1, [r5, #56]	@ 0x38
c0de30aa:	466a      	mov	r2, sp
c0de30ac:	f008 fc8c 	bl	c0deb9c8 <cx_bn_cmp>
c0de30b0:	2800      	cmp	r0, #0
c0de30b2:	d1be      	bne.n	c0de3032 <tEdwards_IsOnCurve+0x1c>
c0de30b4:	9800      	ldr	r0, [sp, #0]
c0de30b6:	fab0 f080 	clz	r0, r0
c0de30ba:	0940      	lsrs	r0, r0, #5
c0de30bc:	7020      	strb	r0, [r4, #0]
c0de30be:	2000      	movs	r0, #0
c0de30c0:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
	...

c0de30c4 <tEdwards_Curve_alloc_init>:
c0de30c4:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de30c8:	b0c1      	sub	sp, #260	@ 0x104
c0de30ca:	4604      	mov	r4, r0
c0de30cc:	2902      	cmp	r1, #2
c0de30ce:	d01f      	beq.n	c0de3110 <tEdwards_Curve_alloc_init+0x4c>
c0de30d0:	2901      	cmp	r1, #1
c0de30d2:	f040 80cf 	bne.w	c0de3274 <tEdwards_Curve_alloc_init+0x1b0>
c0de30d6:	2020      	movs	r0, #32
c0de30d8:	2220      	movs	r2, #32
c0de30da:	6020      	str	r0, [r4, #0]
c0de30dc:	af39      	add	r7, sp, #228	@ 0xe4
c0de30de:	4968      	ldr	r1, [pc, #416]	@ (c0de3280 <tEdwards_Curve_alloc_init+0x1bc>)
c0de30e0:	4638      	mov	r0, r7
c0de30e2:	4479      	add	r1, pc
c0de30e4:	f008 fece 	bl	c0debe84 <__aeabi_memcpy>
c0de30e8:	4966      	ldr	r1, [pc, #408]	@ (c0de3284 <tEdwards_Curve_alloc_init+0x1c0>)
c0de30ea:	f10d 0ac4 	add.w	sl, sp, #196	@ 0xc4
c0de30ee:	2220      	movs	r2, #32
c0de30f0:	4650      	mov	r0, sl
c0de30f2:	4479      	add	r1, pc
c0de30f4:	f008 fec6 	bl	c0debe84 <__aeabi_memcpy>
c0de30f8:	4963      	ldr	r1, [pc, #396]	@ (c0de3288 <tEdwards_Curve_alloc_init+0x1c4>)
c0de30fa:	f10d 08a4 	add.w	r8, sp, #164	@ 0xa4
c0de30fe:	2220      	movs	r2, #32
c0de3100:	4640      	mov	r0, r8
c0de3102:	4479      	add	r1, pc
c0de3104:	f008 febe 	bl	c0debe84 <__aeabi_memcpy>
c0de3108:	ad21      	add	r5, sp, #132	@ 0x84
c0de310a:	4960      	ldr	r1, [pc, #384]	@ (c0de328c <tEdwards_Curve_alloc_init+0x1c8>)
c0de310c:	4479      	add	r1, pc
c0de310e:	e01b      	b.n	c0de3148 <tEdwards_Curve_alloc_init+0x84>
c0de3110:	2020      	movs	r0, #32
c0de3112:	2220      	movs	r2, #32
c0de3114:	6020      	str	r0, [r4, #0]
c0de3116:	af19      	add	r7, sp, #100	@ 0x64
c0de3118:	495d      	ldr	r1, [pc, #372]	@ (c0de3290 <tEdwards_Curve_alloc_init+0x1cc>)
c0de311a:	4638      	mov	r0, r7
c0de311c:	4479      	add	r1, pc
c0de311e:	f008 feb1 	bl	c0debe84 <__aeabi_memcpy>
c0de3122:	495c      	ldr	r1, [pc, #368]	@ (c0de3294 <tEdwards_Curve_alloc_init+0x1d0>)
c0de3124:	f10d 0a44 	add.w	sl, sp, #68	@ 0x44
c0de3128:	2220      	movs	r2, #32
c0de312a:	4650      	mov	r0, sl
c0de312c:	4479      	add	r1, pc
c0de312e:	f008 fea9 	bl	c0debe84 <__aeabi_memcpy>
c0de3132:	4959      	ldr	r1, [pc, #356]	@ (c0de3298 <tEdwards_Curve_alloc_init+0x1d4>)
c0de3134:	f10d 0824 	add.w	r8, sp, #36	@ 0x24
c0de3138:	2220      	movs	r2, #32
c0de313a:	4640      	mov	r0, r8
c0de313c:	4479      	add	r1, pc
c0de313e:	f008 fea1 	bl	c0debe84 <__aeabi_memcpy>
c0de3142:	ad01      	add	r5, sp, #4
c0de3144:	4955      	ldr	r1, [pc, #340]	@ (c0de329c <tEdwards_Curve_alloc_init+0x1d8>)
c0de3146:	4479      	add	r1, pc
c0de3148:	4628      	mov	r0, r5
c0de314a:	2220      	movs	r2, #32
c0de314c:	f008 fe9a 	bl	c0debe84 <__aeabi_memcpy>
c0de3150:	1d26      	adds	r6, r4, #4
c0de3152:	2120      	movs	r1, #32
c0de3154:	463a      	mov	r2, r7
c0de3156:	2320      	movs	r3, #32
c0de3158:	4630      	mov	r0, r6
c0de315a:	f008 fbf5 	bl	c0deb948 <cx_bn_alloc_init>
c0de315e:	2800      	cmp	r0, #0
c0de3160:	f040 808a 	bne.w	c0de3278 <tEdwards_Curve_alloc_init+0x1b4>
c0de3164:	4620      	mov	r0, r4
c0de3166:	462a      	mov	r2, r5
c0de3168:	f850 1b08 	ldr.w	r1, [r0], #8
c0de316c:	460b      	mov	r3, r1
c0de316e:	f008 fbeb 	bl	c0deb948 <cx_bn_alloc_init>
c0de3172:	2800      	cmp	r0, #0
c0de3174:	f040 8080 	bne.w	c0de3278 <tEdwards_Curve_alloc_init+0x1b4>
c0de3178:	f104 0720 	add.w	r7, r4, #32
c0de317c:	2120      	movs	r1, #32
c0de317e:	4638      	mov	r0, r7
c0de3180:	f008 fc68 	bl	c0deba54 <cx_mont_alloc>
c0de3184:	2800      	cmp	r0, #0
c0de3186:	d177      	bne.n	c0de3278 <tEdwards_Curve_alloc_init+0x1b4>
c0de3188:	6831      	ldr	r1, [r6, #0]
c0de318a:	4638      	mov	r0, r7
c0de318c:	f008 fc6c 	bl	c0deba68 <cx_mont_init>
c0de3190:	2800      	cmp	r0, #0
c0de3192:	d171      	bne.n	c0de3278 <tEdwards_Curve_alloc_init+0x1b4>
c0de3194:	4625      	mov	r5, r4
c0de3196:	f855 1b28 	ldr.w	r1, [r5], #40
c0de319a:	4628      	mov	r0, r5
c0de319c:	f008 fbca 	bl	c0deb934 <cx_bn_alloc>
c0de31a0:	2800      	cmp	r0, #0
c0de31a2:	d169      	bne.n	c0de3278 <tEdwards_Curve_alloc_init+0x1b4>
c0de31a4:	6828      	ldr	r0, [r5, #0]
c0de31a6:	2101      	movs	r1, #1
c0de31a8:	f008 fbf8 	bl	c0deb99c <cx_bn_set_u32>
c0de31ac:	2800      	cmp	r0, #0
c0de31ae:	d163      	bne.n	c0de3278 <tEdwards_Curve_alloc_init+0x1b4>
c0de31b0:	f000 f9da 	bl	c0de3568 <OUTLINED_FUNCTION_3>
c0de31b4:	2800      	cmp	r0, #0
c0de31b6:	d15f      	bne.n	c0de3278 <tEdwards_Curve_alloc_init+0x1b4>
c0de31b8:	f104 050c 	add.w	r5, r4, #12
c0de31bc:	4620      	mov	r0, r4
c0de31be:	4629      	mov	r1, r5
c0de31c0:	f7ff fe15 	bl	c0de2dee <tEdwards_alloc>
c0de31c4:	2800      	cmp	r0, #0
c0de31c6:	d157      	bne.n	c0de3278 <tEdwards_Curve_alloc_init+0x1b4>
c0de31c8:	4620      	mov	r0, r4
c0de31ca:	4629      	mov	r1, r5
c0de31cc:	f000 f868 	bl	c0de32a0 <tEdwards_SetNeutral>
c0de31d0:	2800      	cmp	r0, #0
c0de31d2:	d151      	bne.n	c0de3278 <tEdwards_Curve_alloc_init+0x1b4>
c0de31d4:	4625      	mov	r5, r4
c0de31d6:	4652      	mov	r2, sl
c0de31d8:	f855 1b18 	ldr.w	r1, [r5], #24
c0de31dc:	4628      	mov	r0, r5
c0de31de:	460b      	mov	r3, r1
c0de31e0:	f008 fbb2 	bl	c0deb948 <cx_bn_alloc_init>
c0de31e4:	2800      	cmp	r0, #0
c0de31e6:	d147      	bne.n	c0de3278 <tEdwards_Curve_alloc_init+0x1b4>
c0de31e8:	f000 f9be 	bl	c0de3568 <OUTLINED_FUNCTION_3>
c0de31ec:	2800      	cmp	r0, #0
c0de31ee:	d143      	bne.n	c0de3278 <tEdwards_Curve_alloc_init+0x1b4>
c0de31f0:	4625      	mov	r5, r4
c0de31f2:	4642      	mov	r2, r8
c0de31f4:	f855 1b1c 	ldr.w	r1, [r5], #28
c0de31f8:	4628      	mov	r0, r5
c0de31fa:	460b      	mov	r3, r1
c0de31fc:	f008 fba4 	bl	c0deb948 <cx_bn_alloc_init>
c0de3200:	bbd0      	cbnz	r0, c0de3278 <tEdwards_Curve_alloc_init+0x1b4>
c0de3202:	f000 f9b1 	bl	c0de3568 <OUTLINED_FUNCTION_3>
c0de3206:	bbb8      	cbnz	r0, c0de3278 <tEdwards_Curve_alloc_init+0x1b4>
c0de3208:	4620      	mov	r0, r4
c0de320a:	f850 1b2c 	ldr.w	r1, [r0], #44
c0de320e:	f008 fb91 	bl	c0deb934 <cx_bn_alloc>
c0de3212:	bb88      	cbnz	r0, c0de3278 <tEdwards_Curve_alloc_init+0x1b4>
c0de3214:	4620      	mov	r0, r4
c0de3216:	f850 1b30 	ldr.w	r1, [r0], #48
c0de321a:	f008 fb8b 	bl	c0deb934 <cx_bn_alloc>
c0de321e:	bb58      	cbnz	r0, c0de3278 <tEdwards_Curve_alloc_init+0x1b4>
c0de3220:	4620      	mov	r0, r4
c0de3222:	f850 1b34 	ldr.w	r1, [r0], #52
c0de3226:	f008 fb85 	bl	c0deb934 <cx_bn_alloc>
c0de322a:	bb28      	cbnz	r0, c0de3278 <tEdwards_Curve_alloc_init+0x1b4>
c0de322c:	4620      	mov	r0, r4
c0de322e:	f850 1b38 	ldr.w	r1, [r0], #56
c0de3232:	f008 fb7f 	bl	c0deb934 <cx_bn_alloc>
c0de3236:	b9f8      	cbnz	r0, c0de3278 <tEdwards_Curve_alloc_init+0x1b4>
c0de3238:	4620      	mov	r0, r4
c0de323a:	f850 1b3c 	ldr.w	r1, [r0], #60
c0de323e:	f008 fb79 	bl	c0deb934 <cx_bn_alloc>
c0de3242:	b9c8      	cbnz	r0, c0de3278 <tEdwards_Curve_alloc_init+0x1b4>
c0de3244:	4620      	mov	r0, r4
c0de3246:	f850 1b40 	ldr.w	r1, [r0], #64
c0de324a:	f008 fb73 	bl	c0deb934 <cx_bn_alloc>
c0de324e:	b998      	cbnz	r0, c0de3278 <tEdwards_Curve_alloc_init+0x1b4>
c0de3250:	4620      	mov	r0, r4
c0de3252:	f850 1b44 	ldr.w	r1, [r0], #68
c0de3256:	f008 fb6d 	bl	c0deb934 <cx_bn_alloc>
c0de325a:	b968      	cbnz	r0, c0de3278 <tEdwards_Curve_alloc_init+0x1b4>
c0de325c:	4620      	mov	r0, r4
c0de325e:	f850 1b48 	ldr.w	r1, [r0], #72
c0de3262:	f008 fb67 	bl	c0deb934 <cx_bn_alloc>
c0de3266:	b938      	cbnz	r0, c0de3278 <tEdwards_Curve_alloc_init+0x1b4>
c0de3268:	f854 1b4c 	ldr.w	r1, [r4], #76
c0de326c:	4620      	mov	r0, r4
c0de326e:	f008 fb61 	bl	c0deb934 <cx_bn_alloc>
c0de3272:	e001      	b.n	c0de3278 <tEdwards_Curve_alloc_init+0x1b4>
c0de3274:	f648 3099 	movw	r0, #35737	@ 0x8b99
c0de3278:	b041      	add	sp, #260	@ 0x104
c0de327a:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}
c0de327e:	bf00      	nop
c0de3280:	0000aa5e 	.word	0x0000aa5e
c0de3284:	0000ab8e 	.word	0x0000ab8e
c0de3288:	0000ab5e 	.word	0x0000ab5e
c0de328c:	0000aab4 	.word	0x0000aab4
c0de3290:	0000aba4 	.word	0x0000aba4
c0de3294:	0000ab14 	.word	0x0000ab14
c0de3298:	0000ab64 	.word	0x0000ab64
c0de329c:	0000aa9a 	.word	0x0000aa9a

c0de32a0 <tEdwards_SetNeutral>:
c0de32a0:	b5b0      	push	{r4, r5, r7, lr}
c0de32a2:	4605      	mov	r5, r0
c0de32a4:	6808      	ldr	r0, [r1, #0]
c0de32a6:	460c      	mov	r4, r1
c0de32a8:	2100      	movs	r1, #0
c0de32aa:	f008 fb77 	bl	c0deb99c <cx_bn_set_u32>
c0de32ae:	b918      	cbnz	r0, c0de32b8 <tEdwards_SetNeutral+0x18>
c0de32b0:	6aa9      	ldr	r1, [r5, #40]	@ 0x28
c0de32b2:	f000 f964 	bl	c0de357e <OUTLINED_FUNCTION_5>
c0de32b6:	b100      	cbz	r0, c0de32ba <tEdwards_SetNeutral+0x1a>
c0de32b8:	bdb0      	pop	{r4, r5, r7, pc}
c0de32ba:	6aa9      	ldr	r1, [r5, #40]	@ 0x28
c0de32bc:	68a0      	ldr	r0, [r4, #8]
c0de32be:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
c0de32c2:	f008 bb61 	b.w	c0deb988 <cx_bn_copy>

c0de32c6 <tEdwards_init>:
c0de32c6:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de32c8:	6806      	ldr	r6, [r0, #0]
c0de32ca:	461c      	mov	r4, r3
c0de32cc:	4617      	mov	r7, r2
c0de32ce:	460a      	mov	r2, r1
c0de32d0:	4605      	mov	r5, r0
c0de32d2:	a802      	add	r0, sp, #8
c0de32d4:	4631      	mov	r1, r6
c0de32d6:	4633      	mov	r3, r6
c0de32d8:	f008 fb36 	bl	c0deb948 <cx_bn_alloc_init>
c0de32dc:	b100      	cbz	r0, c0de32e0 <tEdwards_init+0x1a>
c0de32de:	bdfe      	pop	{r1, r2, r3, r4, r5, r6, r7, pc}
c0de32e0:	a801      	add	r0, sp, #4
c0de32e2:	4631      	mov	r1, r6
c0de32e4:	463a      	mov	r2, r7
c0de32e6:	4633      	mov	r3, r6
c0de32e8:	f008 fb2e 	bl	c0deb948 <cx_bn_alloc_init>
c0de32ec:	2800      	cmp	r0, #0
c0de32ee:	d1f6      	bne.n	c0de32de <tEdwards_init+0x18>
c0de32f0:	4668      	mov	r0, sp
c0de32f2:	4631      	mov	r1, r6
c0de32f4:	f008 fb1e 	bl	c0deb934 <cx_bn_alloc>
c0de32f8:	2800      	cmp	r0, #0
c0de32fa:	d1f0      	bne.n	c0de32de <tEdwards_init+0x18>
c0de32fc:	f105 0620 	add.w	r6, r5, #32
c0de3300:	6820      	ldr	r0, [r4, #0]
c0de3302:	9902      	ldr	r1, [sp, #8]
c0de3304:	4632      	mov	r2, r6
c0de3306:	f008 fbb9 	bl	c0deba7c <cx_mont_to_montgomery>
c0de330a:	2800      	cmp	r0, #0
c0de330c:	d1e7      	bne.n	c0de32de <tEdwards_init+0x18>
c0de330e:	6860      	ldr	r0, [r4, #4]
c0de3310:	9901      	ldr	r1, [sp, #4]
c0de3312:	4632      	mov	r2, r6
c0de3314:	f008 fbb2 	bl	c0deba7c <cx_mont_to_montgomery>
c0de3318:	2800      	cmp	r0, #0
c0de331a:	d1e0      	bne.n	c0de32de <tEdwards_init+0x18>
c0de331c:	6aa9      	ldr	r1, [r5, #40]	@ 0x28
c0de331e:	68a0      	ldr	r0, [r4, #8]
c0de3320:	f008 fb32 	bl	c0deb988 <cx_bn_copy>
c0de3324:	2800      	cmp	r0, #0
c0de3326:	d1da      	bne.n	c0de32de <tEdwards_init+0x18>
c0de3328:	a802      	add	r0, sp, #8
c0de332a:	f008 fb19 	bl	c0deb960 <cx_bn_destroy>
c0de332e:	2800      	cmp	r0, #0
c0de3330:	d1d5      	bne.n	c0de32de <tEdwards_init+0x18>
c0de3332:	a801      	add	r0, sp, #4
c0de3334:	f008 fb14 	bl	c0deb960 <cx_bn_destroy>
c0de3338:	2800      	cmp	r0, #0
c0de333a:	d1d0      	bne.n	c0de32de <tEdwards_init+0x18>
c0de333c:	4668      	mov	r0, sp
c0de333e:	f008 fb0f 	bl	c0deb960 <cx_bn_destroy>
c0de3342:	bdfe      	pop	{r1, r2, r3, r4, r5, r6, r7, pc}

c0de3344 <tEdwards_export>:
c0de3344:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de3348:	4698      	mov	r8, r3
c0de334a:	4616      	mov	r6, r2
c0de334c:	460f      	mov	r7, r1
c0de334e:	4605      	mov	r5, r0
c0de3350:	f000 f81e 	bl	c0de3390 <tEdwards_normalize>
c0de3354:	b998      	cbnz	r0, c0de337e <tEdwards_export+0x3a>
c0de3356:	f105 0420 	add.w	r4, r5, #32
c0de335a:	6839      	ldr	r1, [r7, #0]
c0de335c:	6ae8      	ldr	r0, [r5, #44]	@ 0x2c
c0de335e:	4622      	mov	r2, r4
c0de3360:	f008 fb98 	bl	c0deba94 <cx_mont_from_montgomery>
c0de3364:	b958      	cbnz	r0, c0de337e <tEdwards_export+0x3a>
c0de3366:	6879      	ldr	r1, [r7, #4]
c0de3368:	6b28      	ldr	r0, [r5, #48]	@ 0x30
c0de336a:	4622      	mov	r2, r4
c0de336c:	f008 fb92 	bl	c0deba94 <cx_mont_from_montgomery>
c0de3370:	b928      	cbnz	r0, c0de337e <tEdwards_export+0x3a>
c0de3372:	682a      	ldr	r2, [r5, #0]
c0de3374:	6ae8      	ldr	r0, [r5, #44]	@ 0x2c
c0de3376:	4631      	mov	r1, r6
c0de3378:	f008 fb1a 	bl	c0deb9b0 <cx_bn_export>
c0de337c:	b108      	cbz	r0, c0de3382 <tEdwards_export+0x3e>
c0de337e:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de3382:	682a      	ldr	r2, [r5, #0]
c0de3384:	6b28      	ldr	r0, [r5, #48]	@ 0x30
c0de3386:	4641      	mov	r1, r8
c0de3388:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de338c:	f008 bb10 	b.w	c0deb9b0 <cx_bn_export>

c0de3390 <tEdwards_normalize>:
c0de3390:	b570      	push	{r4, r5, r6, lr}
c0de3392:	4605      	mov	r5, r0
c0de3394:	460c      	mov	r4, r1
c0de3396:	6889      	ldr	r1, [r1, #8]
c0de3398:	6ac0      	ldr	r0, [r0, #44]	@ 0x2c
c0de339a:	f105 0620 	add.w	r6, r5, #32
c0de339e:	4632      	mov	r2, r6
c0de33a0:	f008 fb90 	bl	c0debac4 <cx_mont_invert_nprime>
c0de33a4:	b9d0      	cbnz	r0, c0de33dc <tEdwards_normalize+0x4c>
c0de33a6:	6822      	ldr	r2, [r4, #0]
c0de33a8:	e9d5 100b 	ldrd	r1, r0, [r5, #44]	@ 0x2c
c0de33ac:	f000 f8d2 	bl	c0de3554 <OUTLINED_FUNCTION_0>
c0de33b0:	b9a0      	cbnz	r0, c0de33dc <tEdwards_normalize+0x4c>
c0de33b2:	6862      	ldr	r2, [r4, #4]
c0de33b4:	6ae9      	ldr	r1, [r5, #44]	@ 0x2c
c0de33b6:	6b68      	ldr	r0, [r5, #52]	@ 0x34
c0de33b8:	f000 f8cc 	bl	c0de3554 <OUTLINED_FUNCTION_0>
c0de33bc:	b970      	cbnz	r0, c0de33dc <tEdwards_normalize+0x4c>
c0de33be:	68a2      	ldr	r2, [r4, #8]
c0de33c0:	6ae9      	ldr	r1, [r5, #44]	@ 0x2c
c0de33c2:	6ba8      	ldr	r0, [r5, #56]	@ 0x38
c0de33c4:	f000 f8c6 	bl	c0de3554 <OUTLINED_FUNCTION_0>
c0de33c8:	b940      	cbnz	r0, c0de33dc <tEdwards_normalize+0x4c>
c0de33ca:	6b29      	ldr	r1, [r5, #48]	@ 0x30
c0de33cc:	6820      	ldr	r0, [r4, #0]
c0de33ce:	f008 fadb 	bl	c0deb988 <cx_bn_copy>
c0de33d2:	b918      	cbnz	r0, c0de33dc <tEdwards_normalize+0x4c>
c0de33d4:	6b69      	ldr	r1, [r5, #52]	@ 0x34
c0de33d6:	f000 f8d2 	bl	c0de357e <OUTLINED_FUNCTION_5>
c0de33da:	b100      	cbz	r0, c0de33de <tEdwards_normalize+0x4e>
c0de33dc:	bd70      	pop	{r4, r5, r6, pc}
c0de33de:	6ba9      	ldr	r1, [r5, #56]	@ 0x38
c0de33e0:	68a0      	ldr	r0, [r4, #8]
c0de33e2:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de33e6:	f008 bacf 	b.w	c0deb988 <cx_bn_copy>

c0de33ea <tEdwards_copy>:
c0de33ea:	b5b0      	push	{r4, r5, r7, lr}
c0de33ec:	460c      	mov	r4, r1
c0de33ee:	4605      	mov	r5, r0
c0de33f0:	6801      	ldr	r1, [r0, #0]
c0de33f2:	6820      	ldr	r0, [r4, #0]
c0de33f4:	f008 fac8 	bl	c0deb988 <cx_bn_copy>
c0de33f8:	b918      	cbnz	r0, c0de3402 <tEdwards_copy+0x18>
c0de33fa:	6869      	ldr	r1, [r5, #4]
c0de33fc:	f000 f8bf 	bl	c0de357e <OUTLINED_FUNCTION_5>
c0de3400:	b100      	cbz	r0, c0de3404 <tEdwards_copy+0x1a>
c0de3402:	bdb0      	pop	{r4, r5, r7, pc}
c0de3404:	68a9      	ldr	r1, [r5, #8]
c0de3406:	68a0      	ldr	r0, [r4, #8]
c0de3408:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
c0de340c:	f008 babc 	b.w	c0deb988 <cx_bn_copy>

c0de3410 <tEdwards_alloc_init>:
c0de3410:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de3412:	460e      	mov	r6, r1
c0de3414:	6801      	ldr	r1, [r0, #0]
c0de3416:	4607      	mov	r7, r0
c0de3418:	4618      	mov	r0, r3
c0de341a:	461c      	mov	r4, r3
c0de341c:	4615      	mov	r5, r2
c0de341e:	f008 fa89 	bl	c0deb934 <cx_bn_alloc>
c0de3422:	b950      	cbnz	r0, c0de343a <tEdwards_alloc_init+0x2a>
c0de3424:	6839      	ldr	r1, [r7, #0]
c0de3426:	1d20      	adds	r0, r4, #4
c0de3428:	f008 fa84 	bl	c0deb934 <cx_bn_alloc>
c0de342c:	b928      	cbnz	r0, c0de343a <tEdwards_alloc_init+0x2a>
c0de342e:	6839      	ldr	r1, [r7, #0]
c0de3430:	f104 0008 	add.w	r0, r4, #8
c0de3434:	f008 fa7e 	bl	c0deb934 <cx_bn_alloc>
c0de3438:	b100      	cbz	r0, c0de343c <tEdwards_alloc_init+0x2c>
c0de343a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0de343c:	4638      	mov	r0, r7
c0de343e:	4631      	mov	r1, r6
c0de3440:	462a      	mov	r2, r5
c0de3442:	4623      	mov	r3, r4
c0de3444:	b001      	add	sp, #4
c0de3446:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de344a:	f7ff bf3c 	b.w	c0de32c6 <tEdwards_init>

c0de344e <tEdwards_scalarMul_bn>:
c0de344e:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de3452:	4607      	mov	r7, r0
c0de3454:	2000      	movs	r0, #0
c0de3456:	4688      	mov	r8, r1
c0de3458:	4615      	mov	r5, r2
c0de345a:	2100      	movs	r1, #0
c0de345c:	469b      	mov	fp, r3
c0de345e:	9003      	str	r0, [sp, #12]
c0de3460:	f88d 000b 	strb.w	r0, [sp, #11]
c0de3464:	6810      	ldr	r0, [r2, #0]
c0de3466:	aa03      	add	r2, sp, #12
c0de3468:	f008 faba 	bl	c0deb9e0 <cx_bn_cmp_u32>
c0de346c:	bb38      	cbnz	r0, c0de34be <tEdwards_scalarMul_bn+0x70>
c0de346e:	9803      	ldr	r0, [sp, #12]
c0de3470:	b1d0      	cbz	r0, c0de34a8 <tEdwards_scalarMul_bn+0x5a>
c0de3472:	6828      	ldr	r0, [r5, #0]
c0de3474:	a901      	add	r1, sp, #4
c0de3476:	f008 fa7d 	bl	c0deb974 <cx_bn_nbytes>
c0de347a:	bb00      	cbnz	r0, c0de34be <tEdwards_scalarMul_bn+0x70>
c0de347c:	2002      	movs	r0, #2
c0de347e:	f04f 31ff 	mov.w	r1, #4294967295	@ 0xffffffff
c0de3482:	f10d 040b 	add.w	r4, sp, #11
c0de3486:	6538      	str	r0, [r7, #80]	@ 0x50
c0de3488:	9801      	ldr	r0, [sp, #4]
c0de348a:	eb01 06c0 	add.w	r6, r1, r0, lsl #3
c0de348e:	2000      	movs	r0, #0
c0de3490:	2801      	cmp	r0, #1
c0de3492:	d00f      	beq.n	c0de34b4 <tEdwards_scalarMul_bn+0x66>
c0de3494:	6828      	ldr	r0, [r5, #0]
c0de3496:	4631      	mov	r1, r6
c0de3498:	4622      	mov	r2, r4
c0de349a:	f008 faad 	bl	c0deb9f8 <cx_bn_tst_bit>
c0de349e:	b970      	cbnz	r0, c0de34be <tEdwards_scalarMul_bn+0x70>
c0de34a0:	f89d 000b 	ldrb.w	r0, [sp, #11]
c0de34a4:	3e01      	subs	r6, #1
c0de34a6:	e7f3      	b.n	c0de3490 <tEdwards_scalarMul_bn+0x42>
c0de34a8:	4638      	mov	r0, r7
c0de34aa:	4659      	mov	r1, fp
c0de34ac:	f7ff fef8 	bl	c0de32a0 <tEdwards_SetNeutral>
c0de34b0:	b928      	cbnz	r0, c0de34be <tEdwards_scalarMul_bn+0x70>
c0de34b2:	e7de      	b.n	c0de3472 <tEdwards_scalarMul_bn+0x24>
c0de34b4:	4640      	mov	r0, r8
c0de34b6:	4659      	mov	r1, fp
c0de34b8:	f7ff ff97 	bl	c0de33ea <tEdwards_copy>
c0de34bc:	b110      	cbz	r0, c0de34c4 <tEdwards_scalarMul_bn+0x76>
c0de34be:	b004      	add	sp, #16
c0de34c0:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de34c4:	2001      	movs	r0, #1
c0de34c6:	f10d 0a0b 	add.w	sl, sp, #11
c0de34ca:	e9c7 0614 	strd	r0, r6, [r7, #80]	@ 0x50
c0de34ce:	2e00      	cmp	r6, #0
c0de34d0:	d420      	bmi.n	c0de3514 <tEdwards_scalarMul_bn+0xc6>
c0de34d2:	4638      	mov	r0, r7
c0de34d4:	4659      	mov	r1, fp
c0de34d6:	465a      	mov	r2, fp
c0de34d8:	f7ff fc9a 	bl	c0de2e10 <tEdwards_double>
c0de34dc:	2800      	cmp	r0, #0
c0de34de:	d1ee      	bne.n	c0de34be <tEdwards_scalarMul_bn+0x70>
c0de34e0:	6d38      	ldr	r0, [r7, #80]	@ 0x50
c0de34e2:	4631      	mov	r1, r6
c0de34e4:	4652      	mov	r2, sl
c0de34e6:	0040      	lsls	r0, r0, #1
c0de34e8:	6538      	str	r0, [r7, #80]	@ 0x50
c0de34ea:	6828      	ldr	r0, [r5, #0]
c0de34ec:	f008 fa84 	bl	c0deb9f8 <cx_bn_tst_bit>
c0de34f0:	2800      	cmp	r0, #0
c0de34f2:	d1e4      	bne.n	c0de34be <tEdwards_scalarMul_bn+0x70>
c0de34f4:	f89d 000b 	ldrb.w	r0, [sp, #11]
c0de34f8:	b150      	cbz	r0, c0de3510 <tEdwards_scalarMul_bn+0xc2>
c0de34fa:	4638      	mov	r0, r7
c0de34fc:	4659      	mov	r1, fp
c0de34fe:	4642      	mov	r2, r8
c0de3500:	465b      	mov	r3, fp
c0de3502:	f7ff fcf0 	bl	c0de2ee6 <tEdwards_add>
c0de3506:	2800      	cmp	r0, #0
c0de3508:	d1d9      	bne.n	c0de34be <tEdwards_scalarMul_bn+0x70>
c0de350a:	6d38      	ldr	r0, [r7, #80]	@ 0x50
c0de350c:	3001      	adds	r0, #1
c0de350e:	6538      	str	r0, [r7, #80]	@ 0x50
c0de3510:	3e01      	subs	r6, #1
c0de3512:	e7dc      	b.n	c0de34ce <tEdwards_scalarMul_bn+0x80>
c0de3514:	2000      	movs	r0, #0
c0de3516:	e7d2      	b.n	c0de34be <tEdwards_scalarMul_bn+0x70>

c0de3518 <tEdwards_scalarMul>:
c0de3518:	b5bc      	push	{r2, r3, r4, r5, r7, lr}
c0de351a:	460c      	mov	r4, r1
c0de351c:	6801      	ldr	r1, [r0, #0]
c0de351e:	4299      	cmp	r1, r3
c0de3520:	bf3c      	itt	cc
c0de3522:	f648 3099 	movwcc	r0, #35737	@ 0x8b99
c0de3526:	bdbc      	popcc	{r2, r3, r4, r5, r7, pc}
c0de3528:	4605      	mov	r5, r0
c0de352a:	20ca      	movs	r0, #202	@ 0xca
c0de352c:	6528      	str	r0, [r5, #80]	@ 0x50
c0de352e:	a801      	add	r0, sp, #4
c0de3530:	f008 fa0a 	bl	c0deb948 <cx_bn_alloc_init>
c0de3534:	b100      	cbz	r0, c0de3538 <tEdwards_scalarMul+0x20>
c0de3536:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}
c0de3538:	20b3      	movs	r0, #179	@ 0xb3
c0de353a:	9b06      	ldr	r3, [sp, #24]
c0de353c:	4621      	mov	r1, r4
c0de353e:	6528      	str	r0, [r5, #80]	@ 0x50
c0de3540:	aa01      	add	r2, sp, #4
c0de3542:	4628      	mov	r0, r5
c0de3544:	f7ff ff83 	bl	c0de344e <tEdwards_scalarMul_bn>
c0de3548:	2800      	cmp	r0, #0
c0de354a:	d1f4      	bne.n	c0de3536 <tEdwards_scalarMul+0x1e>
c0de354c:	a801      	add	r0, sp, #4
c0de354e:	f008 fa07 	bl	c0deb960 <cx_bn_destroy>
c0de3552:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}

c0de3554 <OUTLINED_FUNCTION_0>:
c0de3554:	4633      	mov	r3, r6
c0de3556:	f008 baa9 	b.w	c0debaac <cx_mont_mul>

c0de355a <OUTLINED_FUNCTION_1>:
c0de355a:	462b      	mov	r3, r5
c0de355c:	f008 baa6 	b.w	c0debaac <cx_mont_mul>

c0de3560 <OUTLINED_FUNCTION_2>:
c0de3560:	4633      	mov	r3, r6
c0de3562:	460a      	mov	r2, r1
c0de3564:	f008 baa2 	b.w	c0debaac <cx_mont_mul>

c0de3568 <OUTLINED_FUNCTION_3>:
c0de3568:	6828      	ldr	r0, [r5, #0]
c0de356a:	463a      	mov	r2, r7
c0de356c:	4601      	mov	r1, r0
c0de356e:	f008 ba85 	b.w	c0deba7c <cx_mont_to_montgomery>

c0de3572 <OUTLINED_FUNCTION_4>:
c0de3572:	460d      	mov	r5, r1
c0de3574:	6801      	ldr	r1, [r0, #0]
c0de3576:	4604      	mov	r4, r0
c0de3578:	4628      	mov	r0, r5
c0de357a:	f008 b9db 	b.w	c0deb934 <cx_bn_alloc>

c0de357e <OUTLINED_FUNCTION_5>:
c0de357e:	6860      	ldr	r0, [r4, #4]
c0de3580:	f008 ba02 	b.w	c0deb988 <cx_bn_copy>

c0de3584 <grain_lfsr_advance>:
c0de3584:	b5b0      	push	{r4, r5, r7, lr}
c0de3586:	68c2      	ldr	r2, [r0, #12]
c0de3588:	e890 001a 	ldmia.w	r0, {r1, r3, r4}
c0de358c:	ea5f 0552 	movs.w	r5, r2, lsr #1
c0de3590:	ea4f 0234 	mov.w	r2, r4, rrx
c0de3594:	07e4      	lsls	r4, r4, #31
c0de3596:	60c5      	str	r5, [r0, #12]
c0de3598:	07dd      	lsls	r5, r3, #31
c0de359a:	ea44 0453 	orr.w	r4, r4, r3, lsr #1
c0de359e:	ea45 0551 	orr.w	r5, r5, r1, lsr #1
c0de35a2:	6044      	str	r4, [r0, #4]
c0de35a4:	4c15      	ldr	r4, [pc, #84]	@ (c0de35fc <grain_lfsr_advance+0x78>)
c0de35a6:	6005      	str	r5, [r0, #0]
c0de35a8:	4021      	ands	r1, r4
c0de35aa:	4c15      	ldr	r4, [pc, #84]	@ (c0de3600 <grain_lfsr_advance+0x7c>)
c0de35ac:	4023      	ands	r3, r4
c0de35ae:	4419      	add	r1, r3
c0de35b0:	0c0c      	lsrs	r4, r1, #16
c0de35b2:	ea44 4403 	orr.w	r4, r4, r3, lsl #16
c0de35b6:	ea43 4313 	orr.w	r3, r3, r3, lsr #16
c0de35ba:	4421      	add	r1, r4
c0de35bc:	0a0c      	lsrs	r4, r1, #8
c0de35be:	ea44 6403 	orr.w	r4, r4, r3, lsl #24
c0de35c2:	ea83 2313 	eor.w	r3, r3, r3, lsr #8
c0de35c6:	4061      	eors	r1, r4
c0de35c8:	090c      	lsrs	r4, r1, #4
c0de35ca:	ea44 7403 	orr.w	r4, r4, r3, lsl #28
c0de35ce:	ea83 1313 	eor.w	r3, r3, r3, lsr #4
c0de35d2:	4061      	eors	r1, r4
c0de35d4:	088c      	lsrs	r4, r1, #2
c0de35d6:	ea44 7483 	orr.w	r4, r4, r3, lsl #30
c0de35da:	ea83 0393 	eor.w	r3, r3, r3, lsr #2
c0de35de:	4061      	eors	r1, r4
c0de35e0:	ea5f 0353 	movs.w	r3, r3, lsr #1
c0de35e4:	ea4f 0331 	mov.w	r3, r1, rrx
c0de35e8:	4059      	eors	r1, r3
c0de35ea:	f001 0101 	and.w	r1, r1, #1
c0de35ee:	ea82 32c1 	eor.w	r2, r2, r1, lsl #15
c0de35f2:	6082      	str	r2, [r0, #8]
c0de35f4:	4608      	mov	r0, r1
c0de35f6:	2100      	movs	r1, #0
c0de35f8:	bdb0      	pop	{r4, r5, r7, pc}
c0de35fa:	bf00      	nop
c0de35fc:	00802001 	.word	0x00802001
c0de3600:	40080040 	.word	0x40080040

c0de3604 <next64_graingen>:
c0de3604:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de3608:	460c      	mov	r4, r1
c0de360a:	4605      	mov	r5, r0
c0de360c:	f04f 0a00 	mov.w	sl, #0
c0de3610:	f04f 0800 	mov.w	r8, #0
c0de3614:	2700      	movs	r7, #0
c0de3616:	42a7      	cmp	r7, r4
c0de3618:	d215      	bcs.n	c0de3646 <next64_graingen+0x42>
c0de361a:	4628      	mov	r0, r5
c0de361c:	f7ff ffb2 	bl	c0de3584 <grain_lfsr_advance>
c0de3620:	4606      	mov	r6, r0
c0de3622:	4628      	mov	r0, r5
c0de3624:	f7ff ffae 	bl	c0de3584 <grain_lfsr_advance>
c0de3628:	eb10 0046 	adds.w	r0, r0, r6, lsl #1
c0de362c:	0781      	lsls	r1, r0, #30
c0de362e:	d5f2      	bpl.n	c0de3616 <next64_graingen+0x12>
c0de3630:	f000 0001 	and.w	r0, r0, #1
c0de3634:	ea4f 0148 	mov.w	r1, r8, lsl #1
c0de3638:	3701      	adds	r7, #1
c0de363a:	ea40 004a 	orr.w	r0, r0, sl, lsl #1
c0de363e:	ea41 78da 	orr.w	r8, r1, sl, lsr #31
c0de3642:	4682      	mov	sl, r0
c0de3644:	e7e7      	b.n	c0de3616 <next64_graingen+0x12>
c0de3646:	4650      	mov	r0, sl
c0de3648:	4641      	mov	r1, r8
c0de364a:	e8bd 85f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}
	...

c0de3650 <init_generator>:
c0de3650:	b5b0      	push	{r4, r5, r7, lr}
c0de3652:	4a09      	ldr	r2, [pc, #36]	@ (c0de3678 <init_generator+0x28>)
c0de3654:	4b09      	ldr	r3, [pc, #36]	@ (c0de367c <init_generator+0x2c>)
c0de3656:	4604      	mov	r4, r0
c0de3658:	25a0      	movs	r5, #160	@ 0xa0
c0de365a:	2000      	movs	r0, #0
c0de365c:	f64f 71ff 	movw	r1, #65535	@ 0xffff
c0de3660:	e9c4 1002 	strd	r1, r0, [r4, #8]
c0de3664:	e9c4 3200 	strd	r3, r2, [r4]
c0de3668:	b125      	cbz	r5, c0de3674 <init_generator+0x24>
c0de366a:	4620      	mov	r0, r4
c0de366c:	f7ff ff8a 	bl	c0de3584 <grain_lfsr_advance>
c0de3670:	3d01      	subs	r5, #1
c0de3672:	e7f9      	b.n	c0de3668 <init_generator+0x18>
c0de3674:	bdb0      	pop	{r4, r5, r7, pc}
c0de3676:	bf00      	nop
c0de3678:	fffcf010 	.word	0xfffcf010
c0de367c:	1801fc02 	.word	0x1801fc02

c0de3680 <gen_integer>:
c0de3680:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de3684:	4f20      	ldr	r7, [pc, #128]	@ (c0de3708 <gen_integer+0x88>)
c0de3686:	4e22      	ldr	r6, [pc, #136]	@ (c0de3710 <gen_integer+0x90>)
c0de3688:	4605      	mov	r5, r0
c0de368a:	460c      	mov	r4, r1
c0de368c:	2000      	movs	r0, #0
c0de368e:	46b8      	mov	r8, r7
c0de3690:	4f1e      	ldr	r7, [pc, #120]	@ (c0de370c <gen_integer+0x8c>)
c0de3692:	447e      	add	r6, pc
c0de3694:	b9f8      	cbnz	r0, c0de36d6 <gen_integer+0x56>
c0de3696:	4628      	mov	r0, r5
c0de3698:	213e      	movs	r1, #62	@ 0x3e
c0de369a:	47b0      	blx	r6
c0de369c:	e9c4 0100 	strd	r0, r1, [r4]
c0de36a0:	4628      	mov	r0, r5
c0de36a2:	2140      	movs	r1, #64	@ 0x40
c0de36a4:	47b0      	blx	r6
c0de36a6:	e9c4 0102 	strd	r0, r1, [r4, #8]
c0de36aa:	4628      	mov	r0, r5
c0de36ac:	2140      	movs	r1, #64	@ 0x40
c0de36ae:	47b0      	blx	r6
c0de36b0:	e9c4 0104 	strd	r0, r1, [r4, #16]
c0de36b4:	4628      	mov	r0, r5
c0de36b6:	2140      	movs	r1, #64	@ 0x40
c0de36b8:	47b0      	blx	r6
c0de36ba:	e9c4 0106 	strd	r0, r1, [r4, #24]
c0de36be:	e9d4 0100 	ldrd	r0, r1, [r4]
c0de36c2:	463a      	mov	r2, r7
c0de36c4:	1bc0      	subs	r0, r0, r7
c0de36c6:	4640      	mov	r0, r8
c0de36c8:	eb71 0008 	sbcs.w	r0, r1, r8
c0de36cc:	f04f 0000 	mov.w	r0, #0
c0de36d0:	bf38      	it	cc
c0de36d2:	2001      	movcc	r0, #1
c0de36d4:	e7de      	b.n	c0de3694 <gen_integer+0x14>
c0de36d6:	e9d4 0100 	ldrd	r0, r1, [r4]
c0de36da:	4d0e      	ldr	r5, [pc, #56]	@ (c0de3714 <gen_integer+0x94>)
c0de36dc:	447d      	add	r5, pc
c0de36de:	47a8      	blx	r5
c0de36e0:	e9c4 0100 	strd	r0, r1, [r4]
c0de36e4:	e9d4 0102 	ldrd	r0, r1, [r4, #8]
c0de36e8:	47a8      	blx	r5
c0de36ea:	e9c4 0102 	strd	r0, r1, [r4, #8]
c0de36ee:	e9d4 0104 	ldrd	r0, r1, [r4, #16]
c0de36f2:	47a8      	blx	r5
c0de36f4:	e9c4 0104 	strd	r0, r1, [r4, #16]
c0de36f8:	e9d4 0106 	ldrd	r0, r1, [r4, #24]
c0de36fc:	47a8      	blx	r5
c0de36fe:	e9c4 0106 	strd	r0, r1, [r4, #24]
c0de3702:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de3706:	bf00      	nop
c0de3708:	305a4b4e 	.word	0x305a4b4e
c0de370c:	4f582122 	.word	0x4f582122
c0de3710:	ffffff6f 	.word	0xffffff6f
c0de3714:	00000039 	.word	0x00000039

c0de3718 <rev64>:
c0de3718:	ba0a      	rev	r2, r1
c0de371a:	ba01      	rev	r1, r0
c0de371c:	4610      	mov	r0, r2
c0de371e:	4770      	bx	lr

c0de3720 <Poseidon_getNext_RC>:
c0de3720:	3090      	adds	r0, #144	@ 0x90
c0de3722:	f7ff bfad 	b.w	c0de3680 <gen_integer>

c0de3726 <Poseidon_alloc_init>:
c0de3726:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de3728:	4604      	mov	r4, r0
c0de372a:	3090      	adds	r0, #144	@ 0x90
c0de372c:	461d      	mov	r5, r3
c0de372e:	4616      	mov	r6, r2
c0de3730:	460f      	mov	r7, r1
c0de3732:	f7ff ff8d 	bl	c0de3650 <init_generator>
c0de3736:	2000      	movs	r0, #0
c0de3738:	e9c4 7503 	strd	r7, r5, [r4, #12]
c0de373c:	4621      	mov	r1, r4
c0de373e:	f8c4 00a0 	str.w	r0, [r4, #160]	@ 0xa0
c0de3742:	1c70      	adds	r0, r6, #1
c0de3744:	e9c4 6001 	strd	r6, r0, [r4, #4]
c0de3748:	6828      	ldr	r0, [r5, #0]
c0de374a:	f008 f913 	bl	c0deb974 <cx_bn_nbytes>
c0de374e:	68a0      	ldr	r0, [r4, #8]
c0de3750:	f104 0514 	add.w	r5, r4, #20
c0de3754:	f04f 36ff 	mov.w	r6, #4294967295	@ 0xffffffff
c0de3758:	3601      	adds	r6, #1
c0de375a:	4286      	cmp	r6, r0
c0de375c:	bf28      	it	cs
c0de375e:	bdf8      	popcs	{r3, r4, r5, r6, r7, pc}
c0de3760:	6821      	ldr	r1, [r4, #0]
c0de3762:	4628      	mov	r0, r5
c0de3764:	f008 f8e6 	bl	c0deb934 <cx_bn_alloc>
c0de3768:	68a0      	ldr	r0, [r4, #8]
c0de376a:	3504      	adds	r5, #4
c0de376c:	4286      	cmp	r6, r0
c0de376e:	d2f3      	bcs.n	c0de3758 <Poseidon_alloc_init+0x32>
c0de3770:	e7fe      	b.n	c0de3770 <Poseidon_alloc_init+0x4a>

c0de3772 <os_io_handle_default_apdu>:
c0de3772:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de3774:	b09d      	sub	sp, #116	@ 0x74
c0de3776:	4615      	mov	r5, r2
c0de3778:	9a22      	ldr	r2, [sp, #136]	@ 0x88
c0de377a:	b3c8      	cbz	r0, c0de37f0 <os_io_handle_default_apdu+0x7e>
c0de377c:	b3c1      	cbz	r1, c0de37f0 <os_io_handle_default_apdu+0x7e>
c0de377e:	b3bd      	cbz	r5, c0de37f0 <os_io_handle_default_apdu+0x7e>
c0de3780:	461c      	mov	r4, r3
c0de3782:	b3ab      	cbz	r3, c0de37f0 <os_io_handle_default_apdu+0x7e>
c0de3784:	b10a      	cbz	r2, c0de378a <os_io_handle_default_apdu+0x18>
c0de3786:	2100      	movs	r1, #0
c0de3788:	7011      	strb	r1, [r2, #0]
c0de378a:	7801      	ldrb	r1, [r0, #0]
c0de378c:	29b0      	cmp	r1, #176	@ 0xb0
c0de378e:	d131      	bne.n	c0de37f4 <os_io_handle_default_apdu+0x82>
c0de3790:	7841      	ldrb	r1, [r0, #1]
c0de3792:	29a7      	cmp	r1, #167	@ 0xa7
c0de3794:	d031      	beq.n	c0de37fa <os_io_handle_default_apdu+0x88>
c0de3796:	2906      	cmp	r1, #6
c0de3798:	d036      	beq.n	c0de3808 <os_io_handle_default_apdu+0x96>
c0de379a:	2901      	cmp	r1, #1
c0de379c:	d131      	bne.n	c0de3802 <os_io_handle_default_apdu+0x90>
c0de379e:	7881      	ldrb	r1, [r0, #2]
c0de37a0:	bb79      	cbnz	r1, c0de3802 <os_io_handle_default_apdu+0x90>
c0de37a2:	78c0      	ldrb	r0, [r0, #3]
c0de37a4:	bb68      	cbnz	r0, c0de3802 <os_io_handle_default_apdu+0x90>
c0de37a6:	6820      	ldr	r0, [r4, #0]
c0de37a8:	2100      	movs	r1, #0
c0de37aa:	6021      	str	r1, [r4, #0]
c0de37ac:	2803      	cmp	r0, #3
c0de37ae:	d321      	bcc.n	c0de37f4 <os_io_handle_default_apdu+0x82>
c0de37b0:	2601      	movs	r6, #1
c0de37b2:	1ec7      	subs	r7, r0, #3
c0de37b4:	6026      	str	r6, [r4, #0]
c0de37b6:	702e      	strb	r6, [r5, #0]
c0de37b8:	6820      	ldr	r0, [r4, #0]
c0de37ba:	1a3a      	subs	r2, r7, r0
c0de37bc:	4428      	add	r0, r5
c0de37be:	1c41      	adds	r1, r0, #1
c0de37c0:	2001      	movs	r0, #1
c0de37c2:	f008 f9e9 	bl	c0debb98 <os_registry_get_current_app_tag>
c0de37c6:	f000 f83f 	bl	c0de3848 <OUTLINED_FUNCTION_0>
c0de37ca:	6020      	str	r0, [r4, #0]
c0de37cc:	1a3a      	subs	r2, r7, r0
c0de37ce:	4428      	add	r0, r5
c0de37d0:	1c41      	adds	r1, r0, #1
c0de37d2:	2002      	movs	r0, #2
c0de37d4:	f008 f9e0 	bl	c0debb98 <os_registry_get_current_app_tag>
c0de37d8:	f000 f836 	bl	c0de3848 <OUTLINED_FUNCTION_0>
c0de37dc:	1c41      	adds	r1, r0, #1
c0de37de:	6021      	str	r1, [r4, #0]
c0de37e0:	542e      	strb	r6, [r5, r0]
c0de37e2:	f008 f9c5 	bl	c0debb70 <os_flags>
c0de37e6:	6821      	ldr	r1, [r4, #0]
c0de37e8:	1c4a      	adds	r2, r1, #1
c0de37ea:	6022      	str	r2, [r4, #0]
c0de37ec:	5468      	strb	r0, [r5, r1]
c0de37ee:	e028      	b.n	c0de3842 <os_io_handle_default_apdu+0xd0>
c0de37f0:	7814      	ldrb	r4, [r2, #0]
c0de37f2:	e01e      	b.n	c0de3832 <os_io_handle_default_apdu+0xc0>
c0de37f4:	f646 1485 	movw	r4, #27013	@ 0x6985
c0de37f8:	e01b      	b.n	c0de3832 <os_io_handle_default_apdu+0xc0>
c0de37fa:	7881      	ldrb	r1, [r0, #2]
c0de37fc:	b909      	cbnz	r1, c0de3802 <os_io_handle_default_apdu+0x90>
c0de37fe:	78c0      	ldrb	r0, [r0, #3]
c0de3800:	b1d0      	cbz	r0, c0de3838 <os_io_handle_default_apdu+0xc6>
c0de3802:	f44f 44dc 	mov.w	r4, #28160	@ 0x6e00
c0de3806:	e014      	b.n	c0de3832 <os_io_handle_default_apdu+0xc0>
c0de3808:	2100      	movs	r1, #0
c0de380a:	6021      	str	r1, [r4, #0]
c0de380c:	7883      	ldrb	r3, [r0, #2]
c0de380e:	7902      	ldrb	r2, [r0, #4]
c0de3810:	ad02      	add	r5, sp, #8
c0de3812:	e9cd 1500 	strd	r1, r5, [sp]
c0de3816:	1d41      	adds	r1, r0, #5
c0de3818:	4618      	mov	r0, r3
c0de381a:	2300      	movs	r3, #0
c0de381c:	f008 f97c 	bl	c0debb18 <os_pki_load_certificate>
c0de3820:	4604      	mov	r4, r0
c0de3822:	4628      	mov	r0, r5
c0de3824:	216c      	movs	r1, #108	@ 0x6c
c0de3826:	f008 fb45 	bl	c0debeb4 <explicit_bzero>
c0de382a:	2c00      	cmp	r4, #0
c0de382c:	bf08      	it	eq
c0de382e:	f44f 4410 	moveq.w	r4, #36864	@ 0x9000
c0de3832:	4620      	mov	r0, r4
c0de3834:	b01d      	add	sp, #116	@ 0x74
c0de3836:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de3838:	2000      	movs	r0, #0
c0de383a:	6020      	str	r0, [r4, #0]
c0de383c:	b10a      	cbz	r2, c0de3842 <os_io_handle_default_apdu+0xd0>
c0de383e:	2001      	movs	r0, #1
c0de3840:	7010      	strb	r0, [r2, #0]
c0de3842:	f44f 4410 	mov.w	r4, #36864	@ 0x9000
c0de3846:	e7f4      	b.n	c0de3832 <os_io_handle_default_apdu+0xc0>

c0de3848 <OUTLINED_FUNCTION_0>:
c0de3848:	6821      	ldr	r1, [r4, #0]
c0de384a:	1c4a      	adds	r2, r1, #1
c0de384c:	6022      	str	r2, [r4, #0]
c0de384e:	5468      	strb	r0, [r5, r1]
c0de3850:	6821      	ldr	r1, [r4, #0]
c0de3852:	4408      	add	r0, r1
c0de3854:	4770      	bx	lr

c0de3856 <os_io_seph_cmd_piezo_play_tune>:
c0de3856:	b5bc      	push	{r2, r3, r4, r5, r7, lr}
c0de3858:	280b      	cmp	r0, #11
c0de385a:	d902      	bls.n	c0de3862 <os_io_seph_cmd_piezo_play_tune+0xc>
c0de385c:	f06f 0415 	mvn.w	r4, #21
c0de3860:	e021      	b.n	c0de38a6 <os_io_seph_cmd_piezo_play_tune+0x50>
c0de3862:	4605      	mov	r5, r0
c0de3864:	2009      	movs	r0, #9
c0de3866:	2100      	movs	r1, #0
c0de3868:	2200      	movs	r2, #0
c0de386a:	2400      	movs	r4, #0
c0de386c:	f008 f988 	bl	c0debb80 <os_setting_get>
c0de3870:	2d08      	cmp	r5, #8
c0de3872:	d802      	bhi.n	c0de387a <os_io_seph_cmd_piezo_play_tune+0x24>
c0de3874:	f010 0102 	ands.w	r1, r0, #2
c0de3878:	d115      	bne.n	c0de38a6 <os_io_seph_cmd_piezo_play_tune+0x50>
c0de387a:	2400      	movs	r4, #0
c0de387c:	2d09      	cmp	r5, #9
c0de387e:	d302      	bcc.n	c0de3886 <os_io_seph_cmd_piezo_play_tune+0x30>
c0de3880:	f010 0001 	ands.w	r0, r0, #1
c0de3884:	d10f      	bne.n	c0de38a6 <os_io_seph_cmd_piezo_play_tune+0x50>
c0de3886:	2056      	movs	r0, #86	@ 0x56
c0de3888:	f88d 5007 	strb.w	r5, [sp, #7]
c0de388c:	f88d 4005 	strb.w	r4, [sp, #5]
c0de3890:	2204      	movs	r2, #4
c0de3892:	2300      	movs	r3, #0
c0de3894:	f88d 0004 	strb.w	r0, [sp, #4]
c0de3898:	2001      	movs	r0, #1
c0de389a:	f88d 0006 	strb.w	r0, [sp, #6]
c0de389e:	a901      	add	r1, sp, #4
c0de38a0:	f000 f803 	bl	c0de38aa <OUTLINED_FUNCTION_1>
c0de38a4:	4604      	mov	r4, r0
c0de38a6:	4620      	mov	r0, r4
c0de38a8:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}

c0de38aa <OUTLINED_FUNCTION_1>:
c0de38aa:	2001      	movs	r0, #1
c0de38ac:	f008 b99e 	b.w	c0debbec <os_io_tx_cmd>

c0de38b0 <io_process_itc_ux_event>:
c0de38b0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de38b2:	4605      	mov	r5, r0
c0de38b4:	78c0      	ldrb	r0, [r0, #3]
c0de38b6:	2820      	cmp	r0, #32
c0de38b8:	d023      	beq.n	c0de3902 <io_process_itc_ux_event+0x52>
c0de38ba:	2823      	cmp	r0, #35	@ 0x23
c0de38bc:	d029      	beq.n	c0de3912 <io_process_itc_ux_event+0x62>
c0de38be:	460c      	mov	r4, r1
c0de38c0:	2822      	cmp	r0, #34	@ 0x22
c0de38c2:	d132      	bne.n	c0de392a <io_process_itc_ux_event+0x7a>
c0de38c4:	4e1f      	ldr	r6, [pc, #124]	@ (c0de3944 <io_process_itc_ux_event+0x94>)
c0de38c6:	2006      	movs	r0, #6
c0de38c8:	2118      	movs	r1, #24
c0de38ca:	f809 0006 	strb.w	r0, [r9, r6]
c0de38ce:	eb09 0706 	add.w	r7, r9, r6
c0de38d2:	2018      	movs	r0, #24
c0de38d4:	6078      	str	r0, [r7, #4]
c0de38d6:	f107 0008 	add.w	r0, r7, #8
c0de38da:	f008 fadd 	bl	c0debe98 <__aeabi_memclr>
c0de38de:	7928      	ldrb	r0, [r5, #4]
c0de38e0:	7238      	strb	r0, [r7, #8]
c0de38e2:	7868      	ldrb	r0, [r5, #1]
c0de38e4:	78a9      	ldrb	r1, [r5, #2]
c0de38e6:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de38ea:	3802      	subs	r0, #2
c0de38ec:	0401      	lsls	r1, r0, #16
c0de38ee:	d005      	beq.n	c0de38fc <io_process_itc_ux_event+0x4c>
c0de38f0:	b282      	uxth	r2, r0
c0de38f2:	2a10      	cmp	r2, #16
c0de38f4:	d802      	bhi.n	c0de38fc <io_process_itc_ux_event+0x4c>
c0de38f6:	1f60      	subs	r0, r4, #5
c0de38f8:	4290      	cmp	r0, r2
c0de38fa:	d218      	bcs.n	c0de392e <io_process_itc_ux_event+0x7e>
c0de38fc:	f06f 0415 	mvn.w	r4, #21
c0de3900:	e013      	b.n	c0de392a <io_process_itc_ux_event+0x7a>
c0de3902:	2001      	movs	r0, #1
c0de3904:	f007 fdbc 	bl	c0deb480 <nbgl_objAllowDrawing>
c0de3908:	f007 fdc9 	bl	c0deb49e <nbgl_screenRedraw>
c0de390c:	f007 fd9f 	bl	c0deb44e <nbgl_refresh>
c0de3910:	e00a      	b.n	c0de3928 <io_process_itc_ux_event+0x78>
c0de3912:	480c      	ldr	r0, [pc, #48]	@ (c0de3944 <io_process_itc_ux_event+0x94>)
c0de3914:	2107      	movs	r1, #7
c0de3916:	f809 1000 	strb.w	r1, [r9, r0]
c0de391a:	4448      	add	r0, r9
c0de391c:	2101      	movs	r1, #1
c0de391e:	6041      	str	r1, [r0, #4]
c0de3920:	7929      	ldrb	r1, [r5, #4]
c0de3922:	7201      	strb	r1, [r0, #8]
c0de3924:	f008 f91a 	bl	c0debb5c <os_ux>
c0de3928:	2400      	movs	r4, #0
c0de392a:	4620      	mov	r0, r4
c0de392c:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0de392e:	eb09 0406 	add.w	r4, r9, r6
c0de3932:	1d69      	adds	r1, r5, #5
c0de3934:	f104 0010 	add.w	r0, r4, #16
c0de3938:	60e2      	str	r2, [r4, #12]
c0de393a:	f008 faa3 	bl	c0debe84 <__aeabi_memcpy>
c0de393e:	4620      	mov	r0, r4
c0de3940:	e7f0      	b.n	c0de3924 <io_process_itc_ux_event+0x74>
c0de3942:	bf00      	nop
c0de3944:	00001e00 	.word	0x00001e00

c0de3948 <io_legacy_apdu_tx>:
c0de3948:	b5b0      	push	{r4, r5, r7, lr}
c0de394a:	460a      	mov	r2, r1
c0de394c:	4601      	mov	r1, r0
c0de394e:	4808      	ldr	r0, [pc, #32]	@ (c0de3970 <io_legacy_apdu_tx+0x28>)
c0de3950:	2300      	movs	r3, #0
c0de3952:	2500      	movs	r5, #0
c0de3954:	eb09 0400 	add.w	r4, r9, r0
c0de3958:	7860      	ldrb	r0, [r4, #1]
c0de395a:	f008 f947 	bl	c0debbec <os_io_tx_cmd>
c0de395e:	4905      	ldr	r1, [pc, #20]	@ (c0de3974 <io_legacy_apdu_tx+0x2c>)
c0de3960:	7065      	strb	r5, [r4, #1]
c0de3962:	f809 5001 	strb.w	r5, [r9, r1]
c0de3966:	4904      	ldr	r1, [pc, #16]	@ (c0de3978 <io_legacy_apdu_tx+0x30>)
c0de3968:	4449      	add	r1, r9
c0de396a:	718d      	strb	r5, [r1, #6]
c0de396c:	bdb0      	pop	{r4, r5, r7, pc}
c0de396e:	bf00      	nop
c0de3970:	00001728 	.word	0x00001728
c0de3974:	00001e20 	.word	0x00001e20
c0de3978:	0000171c 	.word	0x0000171c

c0de397c <io_legacy_apdu_rx>:
c0de397c:	e92d 41ff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
c0de3980:	4e8c      	ldr	r6, [pc, #560]	@ (c0de3bb4 <io_legacy_apdu_rx+0x238>)
c0de3982:	2100      	movs	r1, #0
c0de3984:	4605      	mov	r5, r0
c0de3986:	2200      	movs	r2, #0
c0de3988:	2301      	movs	r3, #1
c0de398a:	f88d 100f 	strb.w	r1, [sp, #15]
c0de398e:	f240 1111 	movw	r1, #273	@ 0x111
c0de3992:	eb09 0006 	add.w	r0, r9, r6
c0de3996:	f008 f935 	bl	c0debc04 <os_io_rx_evt>
c0de399a:	4604      	mov	r4, r0
c0de399c:	2801      	cmp	r0, #1
c0de399e:	f2c0 8100 	blt.w	c0de3ba2 <io_legacy_apdu_rx+0x226>
c0de39a2:	f819 0006 	ldrb.w	r0, [r9, r6]
c0de39a6:	f1a0 0110 	sub.w	r1, r0, #16
c0de39aa:	2916      	cmp	r1, #22
c0de39ac:	d844      	bhi.n	c0de3a38 <io_legacy_apdu_rx+0xbc>
c0de39ae:	2201      	movs	r2, #1
c0de39b0:	fa02 f101 	lsl.w	r1, r2, r1
c0de39b4:	4a80      	ldr	r2, [pc, #512]	@ (c0de3bb8 <io_legacy_apdu_rx+0x23c>)
c0de39b6:	4211      	tst	r1, r2
c0de39b8:	d03e      	beq.n	c0de3a38 <io_legacy_apdu_rx+0xbc>
c0de39ba:	4f80      	ldr	r7, [pc, #512]	@ (c0de3bbc <io_legacy_apdu_rx+0x240>)
c0de39bc:	eb09 0107 	add.w	r1, r9, r7
c0de39c0:	7048      	strb	r0, [r1, #1]
c0de39c2:	f008 f8b9 	bl	c0debb38 <os_perso_is_pin_set>
c0de39c6:	28aa      	cmp	r0, #170	@ 0xaa
c0de39c8:	d103      	bne.n	c0de39d2 <io_legacy_apdu_rx+0x56>
c0de39ca:	f008 f8be 	bl	c0debb4a <os_global_pin_is_validated>
c0de39ce:	28aa      	cmp	r0, #170	@ 0xaa
c0de39d0:	d161      	bne.n	c0de3a96 <io_legacy_apdu_rx+0x11a>
c0de39d2:	eb09 0006 	add.w	r0, r9, r6
c0de39d6:	7840      	ldrb	r0, [r0, #1]
c0de39d8:	28b0      	cmp	r0, #176	@ 0xb0
c0de39da:	d135      	bne.n	c0de3a48 <io_legacy_apdu_rx+0xcc>
c0de39dc:	f240 1011 	movw	r0, #273	@ 0x111
c0de39e0:	1e61      	subs	r1, r4, #1
c0de39e2:	9002      	str	r0, [sp, #8]
c0de39e4:	f10d 000f 	add.w	r0, sp, #15
c0de39e8:	9000      	str	r0, [sp, #0]
c0de39ea:	4875      	ldr	r0, [pc, #468]	@ (c0de3bc0 <io_legacy_apdu_rx+0x244>)
c0de39ec:	ab02      	add	r3, sp, #8
c0de39ee:	eb09 0500 	add.w	r5, r9, r0
c0de39f2:	eb09 0006 	add.w	r0, r9, r6
c0de39f6:	3001      	adds	r0, #1
c0de39f8:	462a      	mov	r2, r5
c0de39fa:	f7ff feba 	bl	c0de3772 <os_io_handle_default_apdu>
c0de39fe:	2400      	movs	r4, #0
c0de3a00:	9902      	ldr	r1, [sp, #8]
c0de3a02:	eb09 0607 	add.w	r6, r9, r7
c0de3a06:	f5b0 4f10 	cmp.w	r0, #36864	@ 0x9000
c0de3a0a:	bf18      	it	ne
c0de3a0c:	4621      	movne	r1, r4
c0de3a0e:	0a02      	lsrs	r2, r0, #8
c0de3a10:	2300      	movs	r3, #0
c0de3a12:	546a      	strb	r2, [r5, r1]
c0de3a14:	186a      	adds	r2, r5, r1
c0de3a16:	7050      	strb	r0, [r2, #1]
c0de3a18:	1c88      	adds	r0, r1, #2
c0de3a1a:	4629      	mov	r1, r5
c0de3a1c:	9002      	str	r0, [sp, #8]
c0de3a1e:	b282      	uxth	r2, r0
c0de3a20:	7870      	ldrb	r0, [r6, #1]
c0de3a22:	f008 f8e3 	bl	c0debbec <os_io_tx_cmd>
c0de3a26:	f89d 100f 	ldrb.w	r1, [sp, #15]
c0de3a2a:	7074      	strb	r4, [r6, #1]
c0de3a2c:	2901      	cmp	r1, #1
c0de3a2e:	f000 80bd 	beq.w	c0de3bac <io_legacy_apdu_rx+0x230>
c0de3a32:	ea00 75e0 	and.w	r5, r0, r0, asr #31
c0de3a36:	e0b5      	b.n	c0de3ba4 <io_legacy_apdu_rx+0x228>
c0de3a38:	1e41      	subs	r1, r0, #1
c0de3a3a:	2902      	cmp	r1, #2
c0de3a3c:	d33d      	bcc.n	c0de3aba <io_legacy_apdu_rx+0x13e>
c0de3a3e:	2830      	cmp	r0, #48	@ 0x30
c0de3a40:	d0bb      	beq.n	c0de39ba <io_legacy_apdu_rx+0x3e>
c0de3a42:	2840      	cmp	r0, #64	@ 0x40
c0de3a44:	d0b9      	beq.n	c0de39ba <io_legacy_apdu_rx+0x3e>
c0de3a46:	e0a3      	b.n	c0de3b90 <io_legacy_apdu_rx+0x214>
c0de3a48:	eb09 0007 	add.w	r0, r9, r7
c0de3a4c:	7847      	ldrb	r7, [r0, #1]
c0de3a4e:	2f10      	cmp	r7, #16
c0de3a50:	d05f      	beq.n	c0de3b12 <io_legacy_apdu_rx+0x196>
c0de3a52:	2f40      	cmp	r7, #64	@ 0x40
c0de3a54:	d05f      	beq.n	c0de3b16 <io_legacy_apdu_rx+0x19a>
c0de3a56:	2f21      	cmp	r7, #33	@ 0x21
c0de3a58:	d06f      	beq.n	c0de3b3a <io_legacy_apdu_rx+0x1be>
c0de3a5a:	2f22      	cmp	r7, #34	@ 0x22
c0de3a5c:	d048      	beq.n	c0de3af0 <io_legacy_apdu_rx+0x174>
c0de3a5e:	2f23      	cmp	r7, #35	@ 0x23
c0de3a60:	d048      	beq.n	c0de3af4 <io_legacy_apdu_rx+0x178>
c0de3a62:	2f30      	cmp	r7, #48	@ 0x30
c0de3a64:	d053      	beq.n	c0de3b0e <io_legacy_apdu_rx+0x192>
c0de3a66:	f8df 815c 	ldr.w	r8, [pc, #348]	@ c0de3bc4 <io_legacy_apdu_rx+0x248>
c0de3a6a:	2f20      	cmp	r7, #32
c0de3a6c:	eb09 0008 	add.w	r0, r9, r8
c0de3a70:	d16d      	bne.n	c0de3b4e <io_legacy_apdu_rx+0x1d2>
c0de3a72:	2701      	movs	r7, #1
c0de3a74:	eb09 0106 	add.w	r1, r9, r6
c0de3a78:	1e65      	subs	r5, r4, #1
c0de3a7a:	7187      	strb	r7, [r0, #6]
c0de3a7c:	4850      	ldr	r0, [pc, #320]	@ (c0de3bc0 <io_legacy_apdu_rx+0x244>)
c0de3a7e:	3101      	adds	r1, #1
c0de3a80:	462a      	mov	r2, r5
c0de3a82:	4448      	add	r0, r9
c0de3a84:	f008 f9fe 	bl	c0debe84 <__aeabi_memcpy>
c0de3a88:	484f      	ldr	r0, [pc, #316]	@ (c0de3bc8 <io_legacy_apdu_rx+0x24c>)
c0de3a8a:	f809 7000 	strb.w	r7, [r9, r0]
c0de3a8e:	2008      	movs	r0, #8
c0de3a90:	f809 0008 	strb.w	r0, [r9, r8]
c0de3a94:	e086      	b.n	c0de3ba4 <io_legacy_apdu_rx+0x228>
c0de3a96:	484a      	ldr	r0, [pc, #296]	@ (c0de3bc0 <io_legacy_apdu_rx+0x244>)
c0de3a98:	2155      	movs	r1, #85	@ 0x55
c0de3a9a:	2202      	movs	r2, #2
c0de3a9c:	2300      	movs	r3, #0
c0de3a9e:	f809 1000 	strb.w	r1, [r9, r0]
c0de3aa2:	eb09 0100 	add.w	r1, r9, r0
c0de3aa6:	2015      	movs	r0, #21
c0de3aa8:	7048      	strb	r0, [r1, #1]
c0de3aaa:	eb09 0007 	add.w	r0, r9, r7
c0de3aae:	7840      	ldrb	r0, [r0, #1]
c0de3ab0:	b004      	add	sp, #16
c0de3ab2:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de3ab6:	f008 b899 	b.w	c0debbec <os_io_tx_cmd>
c0de3aba:	4f44      	ldr	r7, [pc, #272]	@ (c0de3bcc <io_legacy_apdu_rx+0x250>)
c0de3abc:	444e      	add	r6, r9
c0de3abe:	3c01      	subs	r4, #1
c0de3ac0:	1c71      	adds	r1, r6, #1
c0de3ac2:	4622      	mov	r2, r4
c0de3ac4:	eb09 0007 	add.w	r0, r9, r7
c0de3ac8:	f008 f9dc 	bl	c0debe84 <__aeabi_memcpy>
c0de3acc:	7870      	ldrb	r0, [r6, #1]
c0de3ace:	281a      	cmp	r0, #26
c0de3ad0:	d107      	bne.n	c0de3ae2 <io_legacy_apdu_rx+0x166>
c0de3ad2:	eb09 0007 	add.w	r0, r9, r7
c0de3ad6:	4621      	mov	r1, r4
c0de3ad8:	b004      	add	sp, #16
c0de3ada:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de3ade:	f7ff bee7 	b.w	c0de38b0 <io_process_itc_ux_event>
c0de3ae2:	2d00      	cmp	r5, #0
c0de3ae4:	d04a      	beq.n	c0de3b7c <io_legacy_apdu_rx+0x200>
c0de3ae6:	2000      	movs	r0, #0
c0de3ae8:	2500      	movs	r5, #0
c0de3aea:	f007 fa83 	bl	c0deaff4 <io_event>
c0de3aee:	e059      	b.n	c0de3ba4 <io_legacy_apdu_rx+0x228>
c0de3af0:	2004      	movs	r0, #4
c0de3af2:	e023      	b.n	c0de3b3c <io_legacy_apdu_rx+0x1c0>
c0de3af4:	4f33      	ldr	r7, [pc, #204]	@ (c0de3bc4 <io_legacy_apdu_rx+0x248>)
c0de3af6:	2107      	movs	r1, #7
c0de3af8:	1e65      	subs	r5, r4, #1
c0de3afa:	462a      	mov	r2, r5
c0de3afc:	eb09 0007 	add.w	r0, r9, r7
c0de3b00:	7181      	strb	r1, [r0, #6]
c0de3b02:	482f      	ldr	r0, [pc, #188]	@ (c0de3bc0 <io_legacy_apdu_rx+0x244>)
c0de3b04:	f000 f886 	bl	c0de3c14 <OUTLINED_FUNCTION_0>
c0de3b08:	482f      	ldr	r0, [pc, #188]	@ (c0de3bc8 <io_legacy_apdu_rx+0x24c>)
c0de3b0a:	2101      	movs	r1, #1
c0de3b0c:	e00f      	b.n	c0de3b2e <io_legacy_apdu_rx+0x1b2>
c0de3b0e:	2002      	movs	r0, #2
c0de3b10:	e014      	b.n	c0de3b3c <io_legacy_apdu_rx+0x1c0>
c0de3b12:	2006      	movs	r0, #6
c0de3b14:	e012      	b.n	c0de3b3c <io_legacy_apdu_rx+0x1c0>
c0de3b16:	4f2b      	ldr	r7, [pc, #172]	@ (c0de3bc4 <io_legacy_apdu_rx+0x248>)
c0de3b18:	2103      	movs	r1, #3
c0de3b1a:	1e65      	subs	r5, r4, #1
c0de3b1c:	462a      	mov	r2, r5
c0de3b1e:	eb09 0007 	add.w	r0, r9, r7
c0de3b22:	7181      	strb	r1, [r0, #6]
c0de3b24:	4826      	ldr	r0, [pc, #152]	@ (c0de3bc0 <io_legacy_apdu_rx+0x244>)
c0de3b26:	f000 f875 	bl	c0de3c14 <OUTLINED_FUNCTION_0>
c0de3b2a:	4827      	ldr	r0, [pc, #156]	@ (c0de3bc8 <io_legacy_apdu_rx+0x24c>)
c0de3b2c:	2102      	movs	r1, #2
c0de3b2e:	f809 1000 	strb.w	r1, [r9, r0]
c0de3b32:	200a      	movs	r0, #10
c0de3b34:	f809 0007 	strb.w	r0, [r9, r7]
c0de3b38:	e034      	b.n	c0de3ba4 <io_legacy_apdu_rx+0x228>
c0de3b3a:	2005      	movs	r0, #5
c0de3b3c:	4921      	ldr	r1, [pc, #132]	@ (c0de3bc4 <io_legacy_apdu_rx+0x248>)
c0de3b3e:	1e65      	subs	r5, r4, #1
c0de3b40:	462a      	mov	r2, r5
c0de3b42:	4449      	add	r1, r9
c0de3b44:	7188      	strb	r0, [r1, #6]
c0de3b46:	481e      	ldr	r0, [pc, #120]	@ (c0de3bc0 <io_legacy_apdu_rx+0x244>)
c0de3b48:	f000 f864 	bl	c0de3c14 <OUTLINED_FUNCTION_0>
c0de3b4c:	e02a      	b.n	c0de3ba4 <io_legacy_apdu_rx+0x228>
c0de3b4e:	2100      	movs	r1, #0
c0de3b50:	1e65      	subs	r5, r4, #1
c0de3b52:	7181      	strb	r1, [r0, #6]
c0de3b54:	481a      	ldr	r0, [pc, #104]	@ (c0de3bc0 <io_legacy_apdu_rx+0x244>)
c0de3b56:	eb09 0106 	add.w	r1, r9, r6
c0de3b5a:	462a      	mov	r2, r5
c0de3b5c:	3101      	adds	r1, #1
c0de3b5e:	4448      	add	r0, r9
c0de3b60:	f008 f990 	bl	c0debe84 <__aeabi_memcpy>
c0de3b64:	2f25      	cmp	r7, #37	@ 0x25
c0de3b66:	d015      	beq.n	c0de3b94 <io_legacy_apdu_rx+0x218>
c0de3b68:	2f24      	cmp	r7, #36	@ 0x24
c0de3b6a:	d11b      	bne.n	c0de3ba4 <io_legacy_apdu_rx+0x228>
c0de3b6c:	200b      	movs	r0, #11
c0de3b6e:	2101      	movs	r1, #1
c0de3b70:	f809 0008 	strb.w	r0, [r9, r8]
c0de3b74:	4814      	ldr	r0, [pc, #80]	@ (c0de3bc8 <io_legacy_apdu_rx+0x24c>)
c0de3b76:	f809 1000 	strb.w	r1, [r9, r0]
c0de3b7a:	e013      	b.n	c0de3ba4 <io_legacy_apdu_rx+0x228>
c0de3b7c:	f819 0007 	ldrb.w	r0, [r9, r7]
c0de3b80:	2815      	cmp	r0, #21
c0de3b82:	d8b0      	bhi.n	c0de3ae6 <io_legacy_apdu_rx+0x16a>
c0de3b84:	2101      	movs	r1, #1
c0de3b86:	fa01 f000 	lsl.w	r0, r1, r0
c0de3b8a:	4911      	ldr	r1, [pc, #68]	@ (c0de3bd0 <io_legacy_apdu_rx+0x254>)
c0de3b8c:	4208      	tst	r0, r1
c0de3b8e:	d0aa      	beq.n	c0de3ae6 <io_legacy_apdu_rx+0x16a>
c0de3b90:	2500      	movs	r5, #0
c0de3b92:	e007      	b.n	c0de3ba4 <io_legacy_apdu_rx+0x228>
c0de3b94:	200c      	movs	r0, #12
c0de3b96:	2101      	movs	r1, #1
c0de3b98:	f809 0008 	strb.w	r0, [r9, r8]
c0de3b9c:	480a      	ldr	r0, [pc, #40]	@ (c0de3bc8 <io_legacy_apdu_rx+0x24c>)
c0de3b9e:	f809 1000 	strb.w	r1, [r9, r0]
c0de3ba2:	4625      	mov	r5, r4
c0de3ba4:	4628      	mov	r0, r5
c0de3ba6:	b004      	add	sp, #16
c0de3ba8:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de3bac:	20ff      	movs	r0, #255	@ 0xff
c0de3bae:	f007 ffff 	bl	c0debbb0 <os_sched_exit>
c0de3bb2:	bf00      	nop
c0de3bb4:	00001608 	.word	0x00001608
c0de3bb8:	007f0001 	.word	0x007f0001
c0de3bbc:	00001728 	.word	0x00001728
c0de3bc0:	000014f7 	.word	0x000014f7
c0de3bc4:	0000171c 	.word	0x0000171c
c0de3bc8:	00001e20 	.word	0x00001e20
c0de3bcc:	00001cec 	.word	0x00001cec
c0de3bd0:	00205020 	.word	0x00205020

c0de3bd4 <io_seproxyhal_init>:
c0de3bd4:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de3bd6:	b089      	sub	sp, #36	@ 0x24
c0de3bd8:	4d0c      	ldr	r5, [pc, #48]	@ (c0de3c0c <io_seproxyhal_init+0x38>)
c0de3bda:	2600      	movs	r6, #0
c0de3bdc:	466c      	mov	r4, sp
c0de3bde:	2118      	movs	r1, #24
c0de3be0:	eb09 0005 	add.w	r0, r9, r5
c0de3be4:	7046      	strb	r6, [r0, #1]
c0de3be6:	4620      	mov	r0, r4
c0de3be8:	f008 f956 	bl	c0debe98 <__aeabi_memclr>
c0de3bec:	4808      	ldr	r0, [pc, #32]	@ (c0de3c10 <io_seproxyhal_init+0x3c>)
c0de3bee:	2701      	movs	r7, #1
c0de3bf0:	f88d 601e 	strb.w	r6, [sp, #30]
c0de3bf4:	f8ad 7020 	strh.w	r7, [sp, #32]
c0de3bf8:	f8ad 701c 	strh.w	r7, [sp, #28]
c0de3bfc:	9006      	str	r0, [sp, #24]
c0de3bfe:	4620      	mov	r0, r4
c0de3c00:	f007 ffe0 	bl	c0debbc4 <os_io_init>
c0de3c04:	f809 7005 	strb.w	r7, [r9, r5]
c0de3c08:	b009      	add	sp, #36	@ 0x24
c0de3c0a:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de3c0c:	00001728 	.word	0x00001728
c0de3c10:	00020015 	.word	0x00020015

c0de3c14 <OUTLINED_FUNCTION_0>:
c0de3c14:	eb09 0106 	add.w	r1, r9, r6
c0de3c18:	3101      	adds	r1, #1
c0de3c1a:	4448      	add	r0, r9
c0de3c1c:	f008 b932 	b.w	c0debe84 <__aeabi_memcpy>

c0de3c20 <layoutAddCallbackObj>:
c0de3c20:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de3c22:	f890 40ad 	ldrb.w	r4, [r0, #173]	@ 0xad
c0de3c26:	f890 50ae 	ldrb.w	r5, [r0, #174]	@ 0xae
c0de3c2a:	ea44 2405 	orr.w	r4, r4, r5, lsl #8
c0de3c2e:	f3c4 2505 	ubfx	r5, r4, #8, #6
c0de3c32:	2d0e      	cmp	r5, #14
c0de3c34:	bf84      	itt	hi
c0de3c36:	2000      	movhi	r0, #0
c0de3c38:	bdf0      	pophi	{r4, r5, r6, r7, pc}
c0de3c3a:	0a26      	lsrs	r6, r4, #8
c0de3c3c:	f404 4740 	and.w	r7, r4, #49152	@ 0xc000
c0de3c40:	f880 40ad 	strb.w	r4, [r0, #173]	@ 0xad
c0de3c44:	3601      	adds	r6, #1
c0de3c46:	f006 063f 	and.w	r6, r6, #63	@ 0x3f
c0de3c4a:	ea47 2606 	orr.w	r6, r7, r6, lsl #8
c0de3c4e:	0a36      	lsrs	r6, r6, #8
c0de3c50:	f880 60ae 	strb.w	r6, [r0, #174]	@ 0xae
c0de3c54:	eb00 00c5 	add.w	r0, r0, r5, lsl #3
c0de3c58:	f840 1f20 	str.w	r1, [r0, #32]!
c0de3c5c:	7102      	strb	r2, [r0, #4]
c0de3c5e:	7183      	strb	r3, [r0, #6]
c0de3c60:	bdf0      	pop	{r4, r5, r6, r7, pc}
	...

c0de3c64 <nbgl_layoutGet>:
c0de3c64:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de3c68:	b085      	sub	sp, #20
c0de3c6a:	4604      	mov	r4, r0
c0de3c6c:	7800      	ldrb	r0, [r0, #0]
c0de3c6e:	b190      	cbz	r0, c0de3c96 <nbgl_layoutGet+0x32>
c0de3c70:	486c      	ldr	r0, [pc, #432]	@ (c0de3e24 <nbgl_layoutGet+0x1c0>)
c0de3c72:	496d      	ldr	r1, [pc, #436]	@ (c0de3e28 <nbgl_layoutGet+0x1c4>)
c0de3c74:	2500      	movs	r5, #0
c0de3c76:	b158      	cbz	r0, c0de3c90 <nbgl_layoutGet+0x2c>
c0de3c78:	eb09 0201 	add.w	r2, r9, r1
c0de3c7c:	4402      	add	r2, r0
c0de3c7e:	f892 32ca 	ldrb.w	r3, [r2, #714]	@ 0x2ca
c0de3c82:	021b      	lsls	r3, r3, #8
c0de3c84:	045b      	lsls	r3, r3, #17
c0de3c86:	bf58      	it	pl
c0de3c88:	f502 7507 	addpl.w	r5, r2, #540	@ 0x21c
c0de3c8c:	30b4      	adds	r0, #180	@ 0xb4
c0de3c8e:	e7f2      	b.n	c0de3c76 <nbgl_layoutGet+0x12>
c0de3c90:	b975      	cbnz	r5, c0de3cb0 <nbgl_layoutGet+0x4c>
c0de3c92:	2500      	movs	r5, #0
c0de3c94:	e0c1      	b.n	c0de3e1a <nbgl_layoutGet+0x1b6>
c0de3c96:	4965      	ldr	r1, [pc, #404]	@ (c0de3e2c <nbgl_layoutGet+0x1c8>)
c0de3c98:	4863      	ldr	r0, [pc, #396]	@ (c0de3e28 <nbgl_layoutGet+0x1c4>)
c0de3c9a:	eb09 0201 	add.w	r2, r9, r1
c0de3c9e:	6852      	ldr	r2, [r2, #4]
c0de3ca0:	b112      	cbz	r2, c0de3ca8 <nbgl_layoutGet+0x44>
c0de3ca2:	eb09 0500 	add.w	r5, r9, r0
c0de3ca6:	e003      	b.n	c0de3cb0 <nbgl_layoutGet+0x4c>
c0de3ca8:	eb09 0500 	add.w	r5, r9, r0
c0de3cac:	4449      	add	r1, r9
c0de3cae:	604d      	str	r5, [r1, #4]
c0de3cb0:	4e5d      	ldr	r6, [pc, #372]	@ (c0de3e28 <nbgl_layoutGet+0x1c4>)
c0de3cb2:	4628      	mov	r0, r5
c0de3cb4:	21b4      	movs	r1, #180	@ 0xb4
c0de3cb6:	f859 7006 	ldr.w	r7, [r9, r6]
c0de3cba:	f008 f8ed 	bl	c0debe98 <__aeabi_memclr>
c0de3cbe:	7820      	ldrb	r0, [r4, #0]
c0de3cc0:	b150      	cbz	r0, c0de3cd8 <nbgl_layoutGet+0x74>
c0de3cc2:	485a      	ldr	r0, [pc, #360]	@ (c0de3e2c <nbgl_layoutGet+0x1c8>)
c0de3cc4:	4448      	add	r0, r9
c0de3cc6:	6841      	ldr	r1, [r0, #4]
c0de3cc8:	2900      	cmp	r1, #0
c0de3cca:	bf08      	it	eq
c0de3ccc:	eb09 0106 	addeq.w	r1, r9, r6
c0de3cd0:	600d      	str	r5, [r1, #0]
c0de3cd2:	6069      	str	r1, [r5, #4]
c0de3cd4:	6045      	str	r5, [r0, #4]
c0de3cd6:	e001      	b.n	c0de3cdc <nbgl_layoutGet+0x78>
c0de3cd8:	f849 7006 	str.w	r7, [r9, r6]
c0de3cdc:	4853      	ldr	r0, [pc, #332]	@ (c0de3e2c <nbgl_layoutGet+0x1c8>)
c0de3cde:	2100      	movs	r1, #0
c0de3ce0:	f809 1000 	strb.w	r1, [r9, r0]
c0de3ce4:	68e0      	ldr	r0, [r4, #12]
c0de3ce6:	f007 fdcf 	bl	c0deb888 <pic>
c0de3cea:	4629      	mov	r1, r5
c0de3cec:	7826      	ldrb	r6, [r4, #0]
c0de3cee:	f811 2fad 	ldrb.w	r2, [r1, #173]!
c0de3cf2:	784b      	ldrb	r3, [r1, #1]
c0de3cf4:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de3cf8:	f022 0201 	bic.w	r2, r2, #1
c0de3cfc:	4332      	orrs	r2, r6
c0de3cfe:	700a      	strb	r2, [r1, #0]
c0de3d00:	f002 02fd 	and.w	r2, r2, #253	@ 0xfd
c0de3d04:	7866      	ldrb	r6, [r4, #1]
c0de3d06:	f841 0c91 	str.w	r0, [r1, #-145]
c0de3d0a:	704b      	strb	r3, [r1, #1]
c0de3d0c:	f1a1 00a5 	sub.w	r0, r1, #165	@ 0xa5
c0de3d10:	ea42 0246 	orr.w	r2, r2, r6, lsl #1
c0de3d14:	700a      	strb	r2, [r1, #0]
c0de3d16:	f104 0210 	add.w	r2, r4, #16
c0de3d1a:	7821      	ldrb	r1, [r4, #0]
c0de3d1c:	4b44      	ldr	r3, [pc, #272]	@ (c0de3e30 <nbgl_layoutGet+0x1cc>)
c0de3d1e:	447b      	add	r3, pc
c0de3d20:	b159      	cbz	r1, c0de3d3a <nbgl_layoutGet+0xd6>
c0de3d22:	2106      	movs	r1, #6
c0de3d24:	f007 fbb6 	bl	c0deb494 <nbgl_screenPush>
c0de3d28:	f895 10ad 	ldrb.w	r1, [r5, #173]	@ 0xad
c0de3d2c:	f895 20ae 	ldrb.w	r2, [r5, #174]	@ 0xae
c0de3d30:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de3d34:	f360 01c7 	bfi	r1, r0, #3, #5
c0de3d38:	e00a      	b.n	c0de3d50 <nbgl_layoutGet+0xec>
c0de3d3a:	2106      	movs	r1, #6
c0de3d3c:	f007 fba5 	bl	c0deb48a <nbgl_screenSet>
c0de3d40:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de3d44:	f895 10ae 	ldrb.w	r1, [r5, #174]	@ 0xae
c0de3d48:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de3d4c:	f020 01f8 	bic.w	r1, r0, #248	@ 0xf8
c0de3d50:	462f      	mov	r7, r5
c0de3d52:	0a08      	lsrs	r0, r1, #8
c0de3d54:	f04f 0a01 	mov.w	sl, #1
c0de3d58:	f807 1fad 	strb.w	r1, [r7, #173]!
c0de3d5c:	7078      	strb	r0, [r7, #1]
c0de3d5e:	b2c8      	uxtb	r0, r1
c0de3d60:	f003 fb69 	bl	c0de7436 <OUTLINED_FUNCTION_16>
c0de3d64:	2102      	movs	r1, #2
c0de3d66:	f04f 0800 	mov.w	r8, #0
c0de3d6a:	f880 a005 	strb.w	sl, [r0, #5]
c0de3d6e:	71c1      	strb	r1, [r0, #7]
c0de3d70:	2158      	movs	r1, #88	@ 0x58
c0de3d72:	f880 801f 	strb.w	r8, [r0, #31]
c0de3d76:	7181      	strb	r1, [r0, #6]
c0de3d78:	21e0      	movs	r1, #224	@ 0xe0
c0de3d7a:	7101      	strb	r1, [r0, #4]
c0de3d7c:	f847 0c0d 	str.w	r0, [r7, #-13]
c0de3d80:	7838      	ldrb	r0, [r7, #0]
c0de3d82:	08c1      	lsrs	r1, r0, #3
c0de3d84:	2014      	movs	r0, #20
c0de3d86:	f007 fba3 	bl	c0deb4d0 <nbgl_containerPoolGet>
c0de3d8a:	f857 2c0d 	ldr.w	r2, [r7, #-13]
c0de3d8e:	0a03      	lsrs	r3, r0, #8
c0de3d90:	f857 1ca5 	ldr.w	r1, [r7, #-165]
c0de3d94:	0e06      	lsrs	r6, r0, #24
c0de3d96:	f882 3023 	strb.w	r3, [r2, #35]	@ 0x23
c0de3d9a:	4613      	mov	r3, r2
c0de3d9c:	f882 a016 	strb.w	sl, [r2, #22]
c0de3da0:	f803 0f22 	strb.w	r0, [r3, #34]!
c0de3da4:	0c00      	lsrs	r0, r0, #16
c0de3da6:	70de      	strb	r6, [r3, #3]
c0de3da8:	7098      	strb	r0, [r3, #2]
c0de3daa:	604a      	str	r2, [r1, #4]
c0de3dac:	7838      	ldrb	r0, [r7, #0]
c0de3dae:	7879      	ldrb	r1, [r7, #1]
c0de3db0:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de3db4:	f440 4180 	orr.w	r1, r0, #16384	@ 0x4000
c0de3db8:	0a0a      	lsrs	r2, r1, #8
c0de3dba:	707a      	strb	r2, [r7, #1]
c0de3dbc:	6862      	ldr	r2, [r4, #4]
c0de3dbe:	b362      	cbz	r2, c0de3e1a <nbgl_layoutGet+0x1b6>
c0de3dc0:	eb0a 2210 	add.w	r2, sl, r0, lsr #8
c0de3dc4:	f885 10ad 	strb.w	r1, [r5, #173]	@ 0xad
c0de3dc8:	f401 4140 	and.w	r1, r1, #49152	@ 0xc000
c0de3dcc:	f3c0 2005 	ubfx	r0, r0, #8, #6
c0de3dd0:	f002 023f 	and.w	r2, r2, #63	@ 0x3f
c0de3dd4:	eb05 00c0 	add.w	r0, r5, r0, lsl #3
c0de3dd8:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de3ddc:	2204      	movs	r2, #4
c0de3dde:	0a09      	lsrs	r1, r1, #8
c0de3de0:	f885 10ae 	strb.w	r1, [r5, #174]	@ 0xae
c0de3de4:	f8d5 10a0 	ldr.w	r1, [r5, #160]	@ 0xa0
c0de3de8:	6201      	str	r1, [r0, #32]
c0de3dea:	f881 801d 	strb.w	r8, [r1, #29]
c0de3dee:	f881 a01c 	strb.w	sl, [r1, #28]
c0de3df2:	778a      	strb	r2, [r1, #30]
c0de3df4:	7a21      	ldrb	r1, [r4, #8]
c0de3df6:	7a63      	ldrb	r3, [r4, #9]
c0de3df8:	f880 3026 	strb.w	r3, [r0, #38]	@ 0x26
c0de3dfc:	f880 1024 	strb.w	r1, [r0, #36]	@ 0x24
c0de3e00:	f88d 2000 	strb.w	r2, [sp]
c0de3e04:	6860      	ldr	r0, [r4, #4]
c0de3e06:	f007 fd3f 	bl	c0deb888 <pic>
c0de3e0a:	9001      	str	r0, [sp, #4]
c0de3e0c:	8920      	ldrh	r0, [r4, #8]
c0de3e0e:	4669      	mov	r1, sp
c0de3e10:	f8ad 0008 	strh.w	r0, [sp, #8]
c0de3e14:	4628      	mov	r0, r5
c0de3e16:	f000 f981 	bl	c0de411c <nbgl_layoutAddUpFooter>
c0de3e1a:	4628      	mov	r0, r5
c0de3e1c:	b005      	add	sp, #20
c0de3e1e:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}
c0de3e22:	bf00      	nop
c0de3e24:	fffffe98 	.word	0xfffffe98
c0de3e28:	0000172c 	.word	0x0000172c
c0de3e2c:	00001948 	.word	0x00001948
c0de3e30:	00000113 	.word	0x00000113

c0de3e34 <touchCallback>:
c0de3e34:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de3e38:	2800      	cmp	r0, #0
c0de3e3a:	f000 816d 	beq.w	c0de4118 <touchCallback+0x2e4>
c0de3e3e:	460d      	mov	r5, r1
c0de3e40:	a901      	add	r1, sp, #4
c0de3e42:	466a      	mov	r2, sp
c0de3e44:	4604      	mov	r4, r0
c0de3e46:	f003 f965 	bl	c0de7114 <getLayoutAndLayoutObj>
c0de3e4a:	b968      	cbnz	r0, c0de3e68 <touchCallback+0x34>
c0de3e4c:	4620      	mov	r0, r4
c0de3e4e:	f810 1f0e 	ldrb.w	r1, [r0, #14]!
c0de3e52:	f003 fad1 	bl	c0de73f8 <OUTLINED_FUNCTION_14>
c0de3e56:	466a      	mov	r2, sp
c0de3e58:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de3e5c:	a901      	add	r1, sp, #4
c0de3e5e:	f003 f959 	bl	c0de7114 <getLayoutAndLayoutObj>
c0de3e62:	2800      	cmp	r0, #0
c0de3e64:	f000 8158 	beq.w	c0de4118 <touchCallback+0x2e4>
c0de3e68:	1fe8      	subs	r0, r5, #7
c0de3e6a:	b2c0      	uxtb	r0, r0
c0de3e6c:	2803      	cmp	r0, #3
c0de3e6e:	d833      	bhi.n	c0de3ed8 <touchCallback+0xa4>
c0de3e70:	7ee0      	ldrb	r0, [r4, #27]
c0de3e72:	2801      	cmp	r0, #1
c0de3e74:	d130      	bne.n	c0de3ed8 <touchCallback+0xa4>
c0de3e76:	9901      	ldr	r1, [sp, #4]
c0de3e78:	4628      	mov	r0, r5
c0de3e7a:	f891 20b0 	ldrb.w	r2, [r1, #176]	@ 0xb0
c0de3e7e:	2a01      	cmp	r2, #1
c0de3e80:	d028      	beq.n	c0de3ed4 <touchCallback+0xa0>
c0de3e82:	bb4a      	cbnz	r2, c0de3ed8 <touchCallback+0xa4>
c0de3e84:	f8d1 00a0 	ldr.w	r0, [r1, #160]	@ 0xa0
c0de3e88:	42a0      	cmp	r0, r4
c0de3e8a:	d125      	bne.n	c0de3ed8 <touchCallback+0xa4>
c0de3e8c:	f891 00ab 	ldrb.w	r0, [r1, #171]	@ 0xab
c0de3e90:	2803      	cmp	r0, #3
c0de3e92:	d005      	beq.n	c0de3ea0 <touchCallback+0x6c>
c0de3e94:	2804      	cmp	r0, #4
c0de3e96:	f040 813f 	bne.w	c0de4118 <touchCallback+0x2e4>
c0de3e9a:	f101 0010 	add.w	r0, r1, #16
c0de3e9e:	e00c      	b.n	c0de3eba <touchCallback+0x86>
c0de3ea0:	6908      	ldr	r0, [r1, #16]
c0de3ea2:	f810 2f22 	ldrb.w	r2, [r0, #34]!
c0de3ea6:	7843      	ldrb	r3, [r0, #1]
c0de3ea8:	7886      	ldrb	r6, [r0, #2]
c0de3eaa:	78c0      	ldrb	r0, [r0, #3]
c0de3eac:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de3eb0:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
c0de3eb4:	ea42 4000 	orr.w	r0, r2, r0, lsl #16
c0de3eb8:	3004      	adds	r0, #4
c0de3eba:	f101 06a9 	add.w	r6, r1, #169	@ 0xa9
c0de3ebe:	f891 20a8 	ldrb.w	r2, [r1, #168]	@ 0xa8
c0de3ec2:	6800      	ldr	r0, [r0, #0]
c0de3ec4:	4629      	mov	r1, r5
c0de3ec6:	4633      	mov	r3, r6
c0de3ec8:	f003 fccc 	bl	c0de7864 <layoutNavigationCallback>
c0de3ecc:	2800      	cmp	r0, #0
c0de3ece:	f000 8123 	beq.w	c0de4118 <touchCallback+0x2e4>
c0de3ed2:	7830      	ldrb	r0, [r6, #0]
c0de3ed4:	9900      	ldr	r1, [sp, #0]
c0de3ed6:	7148      	strb	r0, [r1, #5]
c0de3ed8:	4620      	mov	r0, r4
c0de3eda:	9f01      	ldr	r7, [sp, #4]
c0de3edc:	f810 1f0e 	ldrb.w	r1, [r0, #14]!
c0de3ee0:	f003 fc15 	bl	c0de770e <OUTLINED_FUNCTION_53>
c0de3ee4:	6938      	ldr	r0, [r7, #16]
c0de3ee6:	4281      	cmp	r1, r0
c0de3ee8:	d103      	bne.n	c0de3ef2 <touchCallback+0xbe>
c0de3eea:	f897 20ab 	ldrb.w	r2, [r7, #171]	@ 0xab
c0de3eee:	2a04      	cmp	r2, #4
c0de3ef0:	d00c      	beq.n	c0de3f0c <touchCallback+0xd8>
c0de3ef2:	7eca      	ldrb	r2, [r1, #27]
c0de3ef4:	2a01      	cmp	r2, #1
c0de3ef6:	d118      	bne.n	c0de3f2a <touchCallback+0xf6>
c0de3ef8:	f811 2f0e 	ldrb.w	r2, [r1, #14]!
c0de3efc:	f003 fa53 	bl	c0de73a6 <OUTLINED_FUNCTION_11>
c0de3f00:	4281      	cmp	r1, r0
c0de3f02:	d112      	bne.n	c0de3f2a <touchCallback+0xf6>
c0de3f04:	f897 00ab 	ldrb.w	r0, [r7, #171]	@ 0xab
c0de3f08:	2803      	cmp	r0, #3
c0de3f0a:	d10e      	bne.n	c0de3f2a <touchCallback+0xf6>
c0de3f0c:	f107 06a9 	add.w	r6, r7, #169	@ 0xa9
c0de3f10:	f897 20a8 	ldrb.w	r2, [r7, #168]	@ 0xa8
c0de3f14:	4620      	mov	r0, r4
c0de3f16:	4629      	mov	r1, r5
c0de3f18:	4633      	mov	r3, r6
c0de3f1a:	f003 fca3 	bl	c0de7864 <layoutNavigationCallback>
c0de3f1e:	2800      	cmp	r0, #0
c0de3f20:	f000 80fa 	beq.w	c0de4118 <touchCallback+0x2e4>
c0de3f24:	7830      	ldrb	r0, [r6, #0]
c0de3f26:	9900      	ldr	r1, [sp, #0]
c0de3f28:	7148      	strb	r0, [r1, #5]
c0de3f2a:	7ee0      	ldrb	r0, [r4, #27]
c0de3f2c:	2801      	cmp	r0, #1
c0de3f2e:	f040 809b 	bne.w	c0de4068 <touchCallback+0x234>
c0de3f32:	f894 0020 	ldrb.w	r0, [r4, #32]
c0de3f36:	2802      	cmp	r0, #2
c0de3f38:	f0c0 8096 	bcc.w	c0de4068 <touchCallback+0x234>
c0de3f3c:	4621      	mov	r1, r4
c0de3f3e:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de3f42:	f003 fa30 	bl	c0de73a6 <OUTLINED_FUNCTION_11>
c0de3f46:	684e      	ldr	r6, [r1, #4]
c0de3f48:	b196      	cbz	r6, c0de3f70 <touchCallback+0x13c>
c0de3f4a:	7ef1      	ldrb	r1, [r6, #27]
c0de3f4c:	2906      	cmp	r1, #6
c0de3f4e:	d10f      	bne.n	c0de3f70 <touchCallback+0x13c>
c0de3f50:	f896 0021 	ldrb.w	r0, [r6, #33]	@ 0x21
c0de3f54:	3801      	subs	r0, #1
c0de3f56:	bf18      	it	ne
c0de3f58:	2001      	movne	r0, #1
c0de3f5a:	f886 0021 	strb.w	r0, [r6, #33]	@ 0x21
c0de3f5e:	4630      	mov	r0, r6
c0de3f60:	f007 fa89 	bl	c0deb476 <nbgl_objDraw>
c0de3f64:	f896 0021 	ldrb.w	r0, [r6, #33]	@ 0x21
c0de3f68:	9900      	ldr	r1, [sp, #0]
c0de3f6a:	2401      	movs	r4, #1
c0de3f6c:	7148      	strb	r0, [r1, #5]
c0de3f6e:	e07c      	b.n	c0de406a <touchCallback+0x236>
c0de3f70:	2804      	cmp	r0, #4
c0de3f72:	d060      	beq.n	c0de4036 <touchCallback+0x202>
c0de3f74:	2802      	cmp	r0, #2
c0de3f76:	d177      	bne.n	c0de4068 <touchCallback+0x234>
c0de3f78:	f003 fb68 	bl	c0de764c <OUTLINED_FUNCTION_40>
c0de3f7c:	6840      	ldr	r0, [r0, #4]
c0de3f7e:	2800      	cmp	r0, #0
c0de3f80:	d072      	beq.n	c0de4068 <touchCallback+0x234>
c0de3f82:	7ec0      	ldrb	r0, [r0, #27]
c0de3f84:	2809      	cmp	r0, #9
c0de3f86:	d16f      	bne.n	c0de4068 <touchCallback+0x234>
c0de3f88:	2d00      	cmp	r5, #0
c0de3f8a:	f040 80c5 	bne.w	c0de4118 <touchCallback+0x2e4>
c0de3f8e:	f04f 0aff 	mov.w	sl, #255	@ 0xff
c0de3f92:	2500      	movs	r5, #0
c0de3f94:	f04f 0800 	mov.w	r8, #0
c0de3f98:	f897 10ae 	ldrb.w	r1, [r7, #174]	@ 0xae
c0de3f9c:	fa5f f088 	uxtb.w	r0, r8
c0de3fa0:	f001 013f 	and.w	r1, r1, #63	@ 0x3f
c0de3fa4:	4281      	cmp	r1, r0
c0de3fa6:	d977      	bls.n	c0de4098 <touchCallback+0x264>
c0de3fa8:	eb07 00c0 	add.w	r0, r7, r0, lsl #3
c0de3fac:	6a00      	ldr	r0, [r0, #32]
c0de3fae:	42a0      	cmp	r0, r4
c0de3fb0:	d117      	bne.n	c0de3fe2 <touchCallback+0x1ae>
c0de3fb2:	7ee1      	ldrb	r1, [r4, #27]
c0de3fb4:	2901      	cmp	r1, #1
c0de3fb6:	d114      	bne.n	c0de3fe2 <touchCallback+0x1ae>
c0de3fb8:	4620      	mov	r0, r4
c0de3fba:	46ab      	mov	fp, r5
c0de3fbc:	46c2      	mov	sl, r8
c0de3fbe:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de3fc2:	f003 fa19 	bl	c0de73f8 <OUTLINED_FUNCTION_14>
c0de3fc6:	220c      	movs	r2, #12
c0de3fc8:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de3fcc:	e9d0 1000 	ldrd	r1, r0, [r0]
c0de3fd0:	f881 2022 	strb.w	r2, [r1, #34]	@ 0x22
c0de3fd4:	2200      	movs	r2, #0
c0de3fd6:	77ca      	strb	r2, [r1, #31]
c0de3fd8:	2101      	movs	r1, #1
c0de3fda:	f880 1021 	strb.w	r1, [r0, #33]	@ 0x21
c0de3fde:	4620      	mov	r0, r4
c0de3fe0:	e024      	b.n	c0de402c <touchCallback+0x1f8>
c0de3fe2:	7ec1      	ldrb	r1, [r0, #27]
c0de3fe4:	2901      	cmp	r1, #1
c0de3fe6:	d123      	bne.n	c0de4030 <touchCallback+0x1fc>
c0de3fe8:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de3fec:	2902      	cmp	r1, #2
c0de3fee:	d11f      	bne.n	c0de4030 <touchCallback+0x1fc>
c0de3ff0:	4601      	mov	r1, r0
c0de3ff2:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de3ff6:	784b      	ldrb	r3, [r1, #1]
c0de3ff8:	788e      	ldrb	r6, [r1, #2]
c0de3ffa:	78c9      	ldrb	r1, [r1, #3]
c0de3ffc:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de4000:	ea46 2101 	orr.w	r1, r6, r1, lsl #8
c0de4004:	ea42 4201 	orr.w	r2, r2, r1, lsl #16
c0de4008:	6851      	ldr	r1, [r2, #4]
c0de400a:	7ecb      	ldrb	r3, [r1, #27]
c0de400c:	2b09      	cmp	r3, #9
c0de400e:	d10f      	bne.n	c0de4030 <touchCallback+0x1fc>
c0de4010:	f891 3021 	ldrb.w	r3, [r1, #33]	@ 0x21
c0de4014:	3501      	adds	r5, #1
c0de4016:	2b01      	cmp	r3, #1
c0de4018:	d10a      	bne.n	c0de4030 <touchCallback+0x1fc>
c0de401a:	6812      	ldr	r2, [r2, #0]
c0de401c:	230b      	movs	r3, #11
c0de401e:	f882 3022 	strb.w	r3, [r2, #34]	@ 0x22
c0de4022:	2301      	movs	r3, #1
c0de4024:	77d3      	strb	r3, [r2, #31]
c0de4026:	2200      	movs	r2, #0
c0de4028:	f881 2021 	strb.w	r2, [r1, #33]	@ 0x21
c0de402c:	f007 fa23 	bl	c0deb476 <nbgl_objDraw>
c0de4030:	f108 0801 	add.w	r8, r8, #1
c0de4034:	e7b0      	b.n	c0de3f98 <touchCallback+0x164>
c0de4036:	f003 fb09 	bl	c0de764c <OUTLINED_FUNCTION_40>
c0de403a:	68c6      	ldr	r6, [r0, #12]
c0de403c:	b1a6      	cbz	r6, c0de4068 <touchCallback+0x234>
c0de403e:	7ef0      	ldrb	r0, [r6, #27]
c0de4040:	2808      	cmp	r0, #8
c0de4042:	d111      	bne.n	c0de4068 <touchCallback+0x234>
c0de4044:	2d0a      	cmp	r5, #10
c0de4046:	d867      	bhi.n	c0de4118 <touchCallback+0x2e4>
c0de4048:	2001      	movs	r0, #1
c0de404a:	40a8      	lsls	r0, r5
c0de404c:	f410 6fc5 	tst.w	r0, #1576	@ 0x628
c0de4050:	d039      	beq.n	c0de40c6 <touchCallback+0x292>
c0de4052:	f007 fc49 	bl	c0deb8e8 <nbgl_wait_pipeline>
c0de4056:	2000      	movs	r0, #0
c0de4058:	f003 faed 	bl	c0de7636 <OUTLINED_FUNCTION_39>
c0de405c:	2003      	movs	r0, #3
c0de405e:	2100      	movs	r1, #0
c0de4060:	e8bd 4dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de4064:	f007 b9fd 	b.w	c0deb462 <nbgl_refreshSpecialWithPostRefresh>
c0de4068:	2400      	movs	r4, #0
c0de406a:	69f8      	ldr	r0, [r7, #28]
c0de406c:	2800      	cmp	r0, #0
c0de406e:	d053      	beq.n	c0de4118 <touchCallback+0x2e4>
c0de4070:	9d00      	ldr	r5, [sp, #0]
c0de4072:	7928      	ldrb	r0, [r5, #4]
c0de4074:	28ff      	cmp	r0, #255	@ 0xff
c0de4076:	d04f      	beq.n	c0de4118 <touchCallback+0x2e4>
c0de4078:	79a8      	ldrb	r0, [r5, #6]
c0de407a:	280b      	cmp	r0, #11
c0de407c:	bf98      	it	ls
c0de407e:	f7ff fbea 	blls	c0de3856 <os_io_seph_cmd_piezo_play_tune>
c0de4082:	b114      	cbz	r4, c0de408a <touchCallback+0x256>
c0de4084:	2001      	movs	r0, #1
c0de4086:	f007 f9e7 	bl	c0deb458 <nbgl_refreshSpecial>
c0de408a:	7928      	ldrb	r0, [r5, #4]
c0de408c:	7969      	ldrb	r1, [r5, #5]
c0de408e:	69fa      	ldr	r2, [r7, #28]
c0de4090:	b002      	add	sp, #8
c0de4092:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de4096:	4710      	bx	r2
c0de4098:	fa5f f08a 	uxtb.w	r0, sl
c0de409c:	28ff      	cmp	r0, #255	@ 0xff
c0de409e:	d03b      	beq.n	c0de4118 <touchCallback+0x2e4>
c0de40a0:	69f9      	ldr	r1, [r7, #28]
c0de40a2:	b3c9      	cbz	r1, c0de4118 <touchCallback+0x2e4>
c0de40a4:	eb07 04c0 	add.w	r4, r7, r0, lsl #3
c0de40a8:	f894 0026 	ldrb.w	r0, [r4, #38]	@ 0x26
c0de40ac:	280b      	cmp	r0, #11
c0de40ae:	bf98      	it	ls
c0de40b0:	f7ff fbd1 	blls	c0de3856 <os_io_seph_cmd_piezo_play_tune>
c0de40b4:	2001      	movs	r0, #1
c0de40b6:	f007 f9cf 	bl	c0deb458 <nbgl_refreshSpecial>
c0de40ba:	f894 0024 	ldrb.w	r0, [r4, #36]	@ 0x24
c0de40be:	69fa      	ldr	r2, [r7, #28]
c0de40c0:	fa5f f18b 	uxtb.w	r1, fp
c0de40c4:	e7e4      	b.n	c0de4090 <touchCallback+0x25c>
c0de40c6:	2d02      	cmp	r5, #2
c0de40c8:	d126      	bne.n	c0de4118 <touchCallback+0x2e4>
c0de40ca:	9d00      	ldr	r5, [sp, #0]
c0de40cc:	4620      	mov	r0, r4
c0de40ce:	f007 fa31 	bl	c0deb534 <nbgl_touchGetTouchDuration>
c0de40d2:	f896 1021 	ldrb.w	r1, [r6, #33]	@ 0x21
c0de40d6:	2200      	movs	r2, #0
c0de40d8:	2300      	movs	r3, #0
c0de40da:	2964      	cmp	r1, #100	@ 0x64
c0de40dc:	bf38      	it	cc
c0de40de:	2301      	movcc	r3, #1
c0de40e0:	2464      	movs	r4, #100	@ 0x64
c0de40e2:	fbb0 f0f4 	udiv	r0, r0, r4
c0de40e6:	ebc0 00c0 	rsb	r0, r0, r0, lsl #3
c0de40ea:	b2c4      	uxtb	r4, r0
c0de40ec:	2c63      	cmp	r4, #99	@ 0x63
c0de40ee:	bf88      	it	hi
c0de40f0:	2201      	movhi	r2, #1
c0de40f2:	ea02 0403 	and.w	r4, r2, r3
c0de40f6:	bf88      	it	hi
c0de40f8:	2064      	movhi	r0, #100	@ 0x64
c0de40fa:	b2c2      	uxtb	r2, r0
c0de40fc:	428a      	cmp	r2, r1
c0de40fe:	d005      	beq.n	c0de410c <touchCallback+0x2d8>
c0de4100:	f003 fa99 	bl	c0de7636 <OUTLINED_FUNCTION_39>
c0de4104:	2004      	movs	r0, #4
c0de4106:	2102      	movs	r1, #2
c0de4108:	f007 f9ab 	bl	c0deb462 <nbgl_refreshSpecialWithPostRefresh>
c0de410c:	b124      	cbz	r4, c0de4118 <touchCallback+0x2e4>
c0de410e:	69fa      	ldr	r2, [r7, #28]
c0de4110:	b112      	cbz	r2, c0de4118 <touchCallback+0x2e4>
c0de4112:	7928      	ldrb	r0, [r5, #4]
c0de4114:	7969      	ldrb	r1, [r5, #5]
c0de4116:	e7bb      	b.n	c0de4090 <touchCallback+0x25c>
c0de4118:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}

c0de411c <nbgl_layoutAddUpFooter>:
c0de411c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de4120:	2800      	cmp	r0, #0
c0de4122:	f000 827e 	beq.w	c0de4622 <nbgl_layoutAddUpFooter+0x506>
c0de4126:	460d      	mov	r5, r1
c0de4128:	b119      	cbz	r1, c0de4132 <nbgl_layoutAddUpFooter+0x16>
c0de412a:	4604      	mov	r4, r0
c0de412c:	7828      	ldrb	r0, [r5, #0]
c0de412e:	2804      	cmp	r0, #4
c0de4130:	d903      	bls.n	c0de413a <nbgl_layoutAddUpFooter+0x1e>
c0de4132:	f06f 0001 	mvn.w	r0, #1
c0de4136:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de413a:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de413e:	2601      	movs	r6, #1
c0de4140:	f003 f979 	bl	c0de7436 <OUTLINED_FUNCTION_16>
c0de4144:	2100      	movs	r1, #0
c0de4146:	7146      	strb	r6, [r0, #5]
c0de4148:	77c1      	strb	r1, [r0, #31]
c0de414a:	21e0      	movs	r1, #224	@ 0xe0
c0de414c:	7101      	strb	r1, [r0, #4]
c0de414e:	6160      	str	r0, [r4, #20]
c0de4150:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4154:	f003 fb1a 	bl	c0de778c <OUTLINED_FUNCTION_62>
c0de4158:	6961      	ldr	r1, [r4, #20]
c0de415a:	0a02      	lsrs	r2, r0, #8
c0de415c:	f8d4 30a0 	ldr.w	r3, [r4, #160]	@ 0xa0
c0de4160:	0e06      	lsrs	r6, r0, #24
c0de4162:	f881 2023 	strb.w	r2, [r1, #35]	@ 0x23
c0de4166:	2208      	movs	r2, #8
c0de4168:	f003 fb3c 	bl	c0de77e4 <OUTLINED_FUNCTION_70>
c0de416c:	4608      	mov	r0, r1
c0de416e:	70d6      	strb	r6, [r2, #3]
c0de4170:	0e1a      	lsrs	r2, r3, #24
c0de4172:	f800 3f12 	strb.w	r3, [r0, #18]!
c0de4176:	70c2      	strb	r2, [r0, #3]
c0de4178:	0c1a      	lsrs	r2, r3, #16
c0de417a:	7082      	strb	r2, [r0, #2]
c0de417c:	0a18      	lsrs	r0, r3, #8
c0de417e:	74c8      	strb	r0, [r1, #19]
c0de4180:	7828      	ldrb	r0, [r5, #0]
c0de4182:	2804      	cmp	r0, #4
c0de4184:	f000 80c6 	beq.w	c0de4314 <nbgl_layoutAddUpFooter+0x1f8>
c0de4188:	2801      	cmp	r0, #1
c0de418a:	f000 80f1 	beq.w	c0de4370 <nbgl_layoutAddUpFooter+0x254>
c0de418e:	2802      	cmp	r0, #2
c0de4190:	f000 8153 	beq.w	c0de443a <nbgl_layoutAddUpFooter+0x31e>
c0de4194:	2803      	cmp	r0, #3
c0de4196:	f000 81df 	beq.w	c0de4558 <nbgl_layoutAddUpFooter+0x43c>
c0de419a:	2800      	cmp	r0, #0
c0de419c:	d1c9      	bne.n	c0de4132 <nbgl_layoutAddUpFooter+0x16>
c0de419e:	f003 fb13 	bl	c0de77c8 <OUTLINED_FUNCTION_67>
c0de41a2:	2800      	cmp	r0, #0
c0de41a4:	f000 823d 	beq.w	c0de4622 <nbgl_layoutAddUpFooter+0x506>
c0de41a8:	6960      	ldr	r0, [r4, #20]
c0de41aa:	2104      	movs	r1, #4
c0de41ac:	2700      	movs	r7, #0
c0de41ae:	f04f 0806 	mov.w	r8, #6
c0de41b2:	f880 1020 	strb.w	r1, [r0, #32]
c0de41b6:	2112      	movs	r1, #18
c0de41b8:	71c7      	strb	r7, [r0, #7]
c0de41ba:	f880 801d 	strb.w	r8, [r0, #29]
c0de41be:	7781      	strb	r1, [r0, #30]
c0de41c0:	2198      	movs	r1, #152	@ 0x98
c0de41c2:	7181      	strb	r1, [r0, #6]
c0de41c4:	212c      	movs	r1, #44	@ 0x2c
c0de41c6:	7701      	strb	r1, [r0, #28]
c0de41c8:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de41cc:	4ee0      	ldr	r6, [pc, #896]	@ (c0de4550 <nbgl_layoutAddUpFooter+0x434>)
c0de41ce:	08c1      	lsrs	r1, r0, #3
c0de41d0:	447e      	add	r6, pc
c0de41d2:	2005      	movs	r0, #5
c0de41d4:	47b0      	blx	r6
c0de41d6:	46b2      	mov	sl, r6
c0de41d8:	4606      	mov	r6, r0
c0de41da:	7607      	strb	r7, [r0, #24]
c0de41dc:	2020      	movs	r0, #32
c0de41de:	2103      	movs	r1, #3
c0de41e0:	75f0      	strb	r0, [r6, #23]
c0de41e2:	2058      	movs	r0, #88	@ 0x58
c0de41e4:	f886 8016 	strb.w	r8, [r6, #22]
c0de41e8:	46b0      	mov	r8, r6
c0de41ea:	71f7      	strb	r7, [r6, #7]
c0de41ec:	f886 1021 	strb.w	r1, [r6, #33]	@ 0x21
c0de41f0:	77f7      	strb	r7, [r6, #31]
c0de41f2:	f886 7020 	strb.w	r7, [r6, #32]
c0de41f6:	f886 1022 	strb.w	r1, [r6, #34]	@ 0x22
c0de41fa:	f808 0f04 	strb.w	r0, [r8, #4]!
c0de41fe:	71b0      	strb	r0, [r6, #6]
c0de4200:	f888 7001 	strb.w	r7, [r8, #1]
c0de4204:	48d3      	ldr	r0, [pc, #844]	@ (c0de4554 <nbgl_layoutAddUpFooter+0x438>)
c0de4206:	4478      	add	r0, pc
c0de4208:	f007 fb3e 	bl	c0deb888 <pic>
c0de420c:	4631      	mov	r1, r6
c0de420e:	0e02      	lsrs	r2, r0, #24
c0de4210:	f003 f9b3 	bl	c0de757a <OUTLINED_FUNCTION_31>
c0de4214:	6960      	ldr	r0, [r4, #20]
c0de4216:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de421a:	7842      	ldrb	r2, [r0, #1]
c0de421c:	7883      	ldrb	r3, [r0, #2]
c0de421e:	78c0      	ldrb	r0, [r0, #3]
c0de4220:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de4224:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de4228:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de422c:	6006      	str	r6, [r0, #0]
c0de422e:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4232:	08c1      	lsrs	r1, r0, #3
c0de4234:	2004      	movs	r0, #4
c0de4236:	47d0      	blx	sl
c0de4238:	77c7      	strb	r7, [r0, #31]
c0de423a:	4606      	mov	r6, r0
c0de423c:	f003 f944 	bl	c0de74c8 <OUTLINED_FUNCTION_23>
c0de4240:	4601      	mov	r1, r0
c0de4242:	2001      	movs	r0, #1
c0de4244:	f04f 0b04 	mov.w	fp, #4
c0de4248:	2301      	movs	r3, #1
c0de424a:	f886 0024 	strb.w	r0, [r6, #36]	@ 0x24
c0de424e:	200d      	movs	r0, #13
c0de4250:	0e0a      	lsrs	r2, r1, #24
c0de4252:	f886 b020 	strb.w	fp, [r6, #32]
c0de4256:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de425a:	f003 fa40 	bl	c0de76de <OUTLINED_FUNCTION_50>
c0de425e:	f898 0000 	ldrb.w	r0, [r8]
c0de4262:	f898 2001 	ldrb.w	r2, [r8, #1]
c0de4266:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de426a:	f5c0 70c0 	rsb	r0, r0, #384	@ 0x180
c0de426e:	0a02      	lsrs	r2, r0, #8
c0de4270:	7130      	strb	r0, [r6, #4]
c0de4272:	7172      	strb	r2, [r6, #5]
c0de4274:	b282      	uxth	r2, r0
c0de4276:	f003 fae2 	bl	c0de783e <OUTLINED_FUNCTION_78>
c0de427a:	2120      	movs	r1, #32
c0de427c:	71b0      	strb	r0, [r6, #6]
c0de427e:	0a00      	lsrs	r0, r0, #8
c0de4280:	f886 b016 	strb.w	fp, [r6, #22]
c0de4284:	f886 7021 	strb.w	r7, [r6, #33]	@ 0x21
c0de4288:	7637      	strb	r7, [r6, #24]
c0de428a:	f04f 0b04 	mov.w	fp, #4
c0de428e:	75f1      	strb	r1, [r6, #23]
c0de4290:	71f0      	strb	r0, [r6, #7]
c0de4292:	6960      	ldr	r0, [r4, #20]
c0de4294:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de4298:	7842      	ldrb	r2, [r0, #1]
c0de429a:	7883      	ldrb	r3, [r0, #2]
c0de429c:	78c0      	ldrb	r0, [r0, #3]
c0de429e:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de42a2:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de42a6:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de42aa:	6046      	str	r6, [r0, #4]
c0de42ac:	f003 f91f 	bl	c0de74ee <OUTLINED_FUNCTION_25>
c0de42b0:	2103      	movs	r1, #3
c0de42b2:	f04f 0802 	mov.w	r8, #2
c0de42b6:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de42ba:	6961      	ldr	r1, [r4, #20]
c0de42bc:	f880 8016 	strb.w	r8, [r0, #22]
c0de42c0:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de42c4:	784b      	ldrb	r3, [r1, #1]
c0de42c6:	788e      	ldrb	r6, [r1, #2]
c0de42c8:	78c9      	ldrb	r1, [r1, #3]
c0de42ca:	ea46 2101 	orr.w	r1, r6, r1, lsl #8
c0de42ce:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de42d2:	2608      	movs	r6, #8
c0de42d4:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de42d8:	6088      	str	r0, [r1, #8]
c0de42da:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de42de:	08c1      	lsrs	r1, r0, #3
c0de42e0:	2008      	movs	r0, #8
c0de42e2:	47d0      	blx	sl
c0de42e4:	f890 1022 	ldrb.w	r1, [r0, #34]	@ 0x22
c0de42e8:	f880 b019 	strb.w	fp, [r0, #25]
c0de42ec:	7186      	strb	r6, [r0, #6]
c0de42ee:	7687      	strb	r7, [r0, #26]
c0de42f0:	71c7      	strb	r7, [r0, #7]
c0de42f2:	f880 8016 	strb.w	r8, [r0, #22]
c0de42f6:	f041 0104 	orr.w	r1, r1, #4
c0de42fa:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de42fe:	2101      	movs	r1, #1
c0de4300:	7141      	strb	r1, [r0, #5]
c0de4302:	21e0      	movs	r1, #224	@ 0xe0
c0de4304:	7101      	strb	r1, [r0, #4]
c0de4306:	6961      	ldr	r1, [r4, #20]
c0de4308:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de430c:	f003 f84b 	bl	c0de73a6 <OUTLINED_FUNCTION_11>
c0de4310:	60c8      	str	r0, [r1, #12]
c0de4312:	e1f9      	b.n	c0de4708 <nbgl_layoutAddUpFooter+0x5ec>
c0de4314:	f003 fa58 	bl	c0de77c8 <OUTLINED_FUNCTION_67>
c0de4318:	2800      	cmp	r0, #0
c0de431a:	f000 8182 	beq.w	c0de4622 <nbgl_layoutAddUpFooter+0x506>
c0de431e:	6960      	ldr	r0, [r4, #20]
c0de4320:	2104      	movs	r1, #4
c0de4322:	2701      	movs	r7, #1
c0de4324:	2260      	movs	r2, #96	@ 0x60
c0de4326:	7781      	strb	r1, [r0, #30]
c0de4328:	2100      	movs	r1, #0
c0de432a:	f880 7020 	strb.w	r7, [r0, #32]
c0de432e:	7182      	strb	r2, [r0, #6]
c0de4330:	7707      	strb	r7, [r0, #28]
c0de4332:	71c1      	strb	r1, [r0, #7]
c0de4334:	7741      	strb	r1, [r0, #29]
c0de4336:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de433a:	f002 ff93 	bl	c0de7264 <OUTLINED_FUNCTION_0>
c0de433e:	77c7      	strb	r7, [r0, #31]
c0de4340:	4606      	mov	r6, r0
c0de4342:	f003 f8c1 	bl	c0de74c8 <OUTLINED_FUNCTION_23>
c0de4346:	4601      	mov	r1, r0
c0de4348:	20a0      	movs	r0, #160	@ 0xa0
c0de434a:	7177      	strb	r7, [r6, #5]
c0de434c:	f886 7024 	strb.w	r7, [r6, #36]	@ 0x24
c0de4350:	2705      	movs	r7, #5
c0de4352:	2301      	movs	r3, #1
c0de4354:	7130      	strb	r0, [r6, #4]
c0de4356:	200b      	movs	r0, #11
c0de4358:	0e0a      	lsrs	r2, r1, #24
c0de435a:	f886 7020 	strb.w	r7, [r6, #32]
c0de435e:	f003 f8fd 	bl	c0de755c <OUTLINED_FUNCTION_30>
c0de4362:	f007 f8c9 	bl	c0deb4f8 <nbgl_getTextHeightInWidth>
c0de4366:	71b0      	strb	r0, [r6, #6]
c0de4368:	0a00      	lsrs	r0, r0, #8
c0de436a:	75b7      	strb	r7, [r6, #22]
c0de436c:	71f0      	strb	r0, [r6, #7]
c0de436e:	e056      	b.n	c0de441e <nbgl_layoutAddUpFooter+0x302>
c0de4370:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4374:	2705      	movs	r7, #5
c0de4376:	f003 f862 	bl	c0de743e <OUTLINED_FUNCTION_17>
c0de437a:	4606      	mov	r6, r0
c0de437c:	7b2a      	ldrb	r2, [r5, #12]
c0de437e:	7c2b      	ldrb	r3, [r5, #16]
c0de4380:	f002 ffbe 	bl	c0de7300 <OUTLINED_FUNCTION_6>
c0de4384:	2800      	cmp	r0, #0
c0de4386:	f000 814c 	beq.w	c0de4622 <nbgl_layoutAddUpFooter+0x506>
c0de438a:	6960      	ldr	r0, [r4, #20]
c0de438c:	75b7      	strb	r7, [r6, #22]
c0de438e:	f04f 0801 	mov.w	r8, #1
c0de4392:	2700      	movs	r7, #0
c0de4394:	2188      	movs	r1, #136	@ 0x88
c0de4396:	f880 8020 	strb.w	r8, [r0, #32]
c0de439a:	71c7      	strb	r7, [r0, #7]
c0de439c:	7181      	strb	r1, [r0, #6]
c0de439e:	7b68      	ldrb	r0, [r5, #13]
c0de43a0:	2800      	cmp	r0, #0
c0de43a2:	bf18      	it	ne
c0de43a4:	2003      	movne	r0, #3
c0de43a6:	77f0      	strb	r0, [r6, #31]
c0de43a8:	f04f 0000 	mov.w	r0, #0
c0de43ac:	bf08      	it	eq
c0de43ae:	2003      	moveq	r0, #3
c0de43b0:	f886 0021 	strb.w	r0, [r6, #33]	@ 0x21
c0de43b4:	7b68      	ldrb	r0, [r5, #13]
c0de43b6:	4601      	mov	r1, r0
c0de43b8:	2800      	cmp	r0, #0
c0de43ba:	bf18      	it	ne
c0de43bc:	2101      	movne	r1, #1
c0de43be:	0049      	lsls	r1, r1, #1
c0de43c0:	2802      	cmp	r0, #2
c0de43c2:	bf08      	it	eq
c0de43c4:	2103      	moveq	r1, #3
c0de43c6:	f886 1020 	strb.w	r1, [r6, #32]
c0de43ca:	f003 f87d 	bl	c0de74c8 <OUTLINED_FUNCTION_23>
c0de43ce:	210c      	movs	r1, #12
c0de43d0:	0e02      	lsrs	r2, r0, #24
c0de43d2:	f886 1023 	strb.w	r1, [r6, #35]	@ 0x23
c0de43d6:	4631      	mov	r1, r6
c0de43d8:	f003 f8ae 	bl	c0de7538 <OUTLINED_FUNCTION_28>
c0de43dc:	f003 f97c 	bl	c0de76d8 <OUTLINED_FUNCTION_49>
c0de43e0:	4631      	mov	r1, r6
c0de43e2:	0e02      	lsrs	r2, r0, #24
c0de43e4:	74f7      	strb	r7, [r6, #19]
c0de43e6:	71f7      	strb	r7, [r6, #7]
c0de43e8:	f886 8005 	strb.w	r8, [r6, #5]
c0de43ec:	7777      	strb	r7, [r6, #29]
c0de43ee:	f886 801c 	strb.w	r8, [r6, #28]
c0de43f2:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de43f6:	70ca      	strb	r2, [r1, #3]
c0de43f8:	0c02      	lsrs	r2, r0, #16
c0de43fa:	0a00      	lsrs	r0, r0, #8
c0de43fc:	f886 002f 	strb.w	r0, [r6, #47]	@ 0x2f
c0de4400:	4630      	mov	r0, r6
c0de4402:	708a      	strb	r2, [r1, #2]
c0de4404:	f800 7f12 	strb.w	r7, [r0, #18]!
c0de4408:	70c7      	strb	r7, [r0, #3]
c0de440a:	7087      	strb	r7, [r0, #2]
c0de440c:	2058      	movs	r0, #88	@ 0x58
c0de440e:	71b0      	strb	r0, [r6, #6]
c0de4410:	20a0      	movs	r0, #160	@ 0xa0
c0de4412:	7130      	strb	r0, [r6, #4]
c0de4414:	2003      	movs	r0, #3
c0de4416:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de441a:	2007      	movs	r0, #7
c0de441c:	77b0      	strb	r0, [r6, #30]
c0de441e:	6960      	ldr	r0, [r4, #20]
c0de4420:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de4424:	7842      	ldrb	r2, [r0, #1]
c0de4426:	7883      	ldrb	r3, [r0, #2]
c0de4428:	78c0      	ldrb	r0, [r0, #3]
c0de442a:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de442e:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de4432:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de4436:	6006      	str	r6, [r0, #0]
c0de4438:	e166      	b.n	c0de4708 <nbgl_layoutAddUpFooter+0x5ec>
c0de443a:	6868      	ldr	r0, [r5, #4]
c0de443c:	2800      	cmp	r0, #0
c0de443e:	f000 80f0 	beq.w	c0de4622 <nbgl_layoutAddUpFooter+0x506>
c0de4442:	68a8      	ldr	r0, [r5, #8]
c0de4444:	2800      	cmp	r0, #0
c0de4446:	f000 80ec 	beq.w	c0de4622 <nbgl_layoutAddUpFooter+0x506>
c0de444a:	f04f 0b00 	mov.w	fp, #0
c0de444e:	2088      	movs	r0, #136	@ 0x88
c0de4450:	2702      	movs	r7, #2
c0de4452:	f881 b007 	strb.w	fp, [r1, #7]
c0de4456:	7188      	strb	r0, [r1, #6]
c0de4458:	f881 7020 	strb.w	r7, [r1, #32]
c0de445c:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4460:	f002 ffed 	bl	c0de743e <OUTLINED_FUNCTION_17>
c0de4464:	4606      	mov	r6, r0
c0de4466:	7b2a      	ldrb	r2, [r5, #12]
c0de4468:	7bab      	ldrb	r3, [r5, #14]
c0de446a:	f002 ff49 	bl	c0de7300 <OUTLINED_FUNCTION_6>
c0de446e:	2800      	cmp	r0, #0
c0de4470:	f000 80d7 	beq.w	c0de4622 <nbgl_layoutAddUpFooter+0x506>
c0de4474:	2120      	movs	r1, #32
c0de4476:	f04f 0a03 	mov.w	sl, #3
c0de447a:	f04f 0858 	mov.w	r8, #88	@ 0x58
c0de447e:	f886 7020 	strb.w	r7, [r6, #32]
c0de4482:	f886 b018 	strb.w	fp, [r6, #24]
c0de4486:	f886 b021 	strb.w	fp, [r6, #33]	@ 0x21
c0de448a:	f886 b007 	strb.w	fp, [r6, #7]
c0de448e:	f886 b005 	strb.w	fp, [r6, #5]
c0de4492:	75f1      	strb	r1, [r6, #23]
c0de4494:	2104      	movs	r1, #4
c0de4496:	f886 a01f 	strb.w	sl, [r6, #31]
c0de449a:	f886 a022 	strb.w	sl, [r6, #34]	@ 0x22
c0de449e:	75b1      	strb	r1, [r6, #22]
c0de44a0:	2101      	movs	r1, #1
c0de44a2:	7141      	strb	r1, [r0, #5]
c0de44a4:	f886 8006 	strb.w	r8, [r6, #6]
c0de44a8:	f886 8004 	strb.w	r8, [r6, #4]
c0de44ac:	f003 f80c 	bl	c0de74c8 <OUTLINED_FUNCTION_23>
c0de44b0:	4631      	mov	r1, r6
c0de44b2:	0e02      	lsrs	r2, r0, #24
c0de44b4:	f886 b01d 	strb.w	fp, [r6, #29]
c0de44b8:	f04f 0b01 	mov.w	fp, #1
c0de44bc:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de44c0:	f886 b01c 	strb.w	fp, [r6, #28]
c0de44c4:	70ca      	strb	r2, [r1, #3]
c0de44c6:	0c02      	lsrs	r2, r0, #16
c0de44c8:	0a00      	lsrs	r0, r0, #8
c0de44ca:	f886 002f 	strb.w	r0, [r6, #47]	@ 0x2f
c0de44ce:	200c      	movs	r0, #12
c0de44d0:	708a      	strb	r2, [r1, #2]
c0de44d2:	f886 0023 	strb.w	r0, [r6, #35]	@ 0x23
c0de44d6:	200a      	movs	r0, #10
c0de44d8:	f003 f883 	bl	c0de75e2 <OUTLINED_FUNCTION_36>
c0de44dc:	6006      	str	r6, [r0, #0]
c0de44de:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de44e2:	f002 ffac 	bl	c0de743e <OUTLINED_FUNCTION_17>
c0de44e6:	4606      	mov	r6, r0
c0de44e8:	7b6a      	ldrb	r2, [r5, #13]
c0de44ea:	7bab      	ldrb	r3, [r5, #14]
c0de44ec:	f002 ff08 	bl	c0de7300 <OUTLINED_FUNCTION_6>
c0de44f0:	2800      	cmp	r0, #0
c0de44f2:	f000 8096 	beq.w	c0de4622 <nbgl_layoutAddUpFooter+0x506>
c0de44f6:	2700      	movs	r7, #0
c0de44f8:	2120      	movs	r1, #32
c0de44fa:	f886 a021 	strb.w	sl, [r6, #33]	@ 0x21
c0de44fe:	f886 a022 	strb.w	sl, [r6, #34]	@ 0x22
c0de4502:	f886 b005 	strb.w	fp, [r6, #5]
c0de4506:	75f1      	strb	r1, [r6, #23]
c0de4508:	7147      	strb	r7, [r0, #5]
c0de450a:	2106      	movs	r1, #6
c0de450c:	2038      	movs	r0, #56	@ 0x38
c0de450e:	f886 7020 	strb.w	r7, [r6, #32]
c0de4512:	77f7      	strb	r7, [r6, #31]
c0de4514:	7637      	strb	r7, [r6, #24]
c0de4516:	71f7      	strb	r7, [r6, #7]
c0de4518:	f886 8006 	strb.w	r8, [r6, #6]
c0de451c:	75b1      	strb	r1, [r6, #22]
c0de451e:	7130      	strb	r0, [r6, #4]
c0de4520:	f003 f8da 	bl	c0de76d8 <OUTLINED_FUNCTION_49>
c0de4524:	4631      	mov	r1, r6
c0de4526:	0e02      	lsrs	r2, r0, #24
c0de4528:	f886 b01c 	strb.w	fp, [r6, #28]
c0de452c:	7777      	strb	r7, [r6, #29]
c0de452e:	f801 0f25 	strb.w	r0, [r1, #37]!
c0de4532:	70ca      	strb	r2, [r1, #3]
c0de4534:	0c02      	lsrs	r2, r0, #16
c0de4536:	0a00      	lsrs	r0, r0, #8
c0de4538:	f886 0026 	strb.w	r0, [r6, #38]	@ 0x26
c0de453c:	200c      	movs	r0, #12
c0de453e:	708a      	strb	r2, [r1, #2]
c0de4540:	f886 0023 	strb.w	r0, [r6, #35]	@ 0x23
c0de4544:	2009      	movs	r0, #9
c0de4546:	f003 f84c 	bl	c0de75e2 <OUTLINED_FUNCTION_36>
c0de454a:	6046      	str	r6, [r0, #4]
c0de454c:	e0dc      	b.n	c0de4708 <nbgl_layoutAddUpFooter+0x5ec>
c0de454e:	bf00      	nop
c0de4550:	000072f3 	.word	0x000072f3
c0de4554:	0000875f 	.word	0x0000875f
c0de4558:	6868      	ldr	r0, [r5, #4]
c0de455a:	2800      	cmp	r0, #0
c0de455c:	d061      	beq.n	c0de4622 <nbgl_layoutAddUpFooter+0x506>
c0de455e:	7b2a      	ldrb	r2, [r5, #12]
c0de4560:	7b6b      	ldrb	r3, [r5, #13]
c0de4562:	4620      	mov	r0, r4
c0de4564:	f7ff fb5c 	bl	c0de3c20 <layoutAddCallbackObj>
c0de4568:	2800      	cmp	r0, #0
c0de456a:	d05a      	beq.n	c0de4622 <nbgl_layoutAddUpFooter+0x506>
c0de456c:	6960      	ldr	r0, [r4, #20]
c0de456e:	f04f 0803 	mov.w	r8, #3
c0de4572:	2113      	movs	r1, #19
c0de4574:	f04f 0a00 	mov.w	sl, #0
c0de4578:	2701      	movs	r7, #1
c0de457a:	f04f 0b04 	mov.w	fp, #4
c0de457e:	f880 8020 	strb.w	r8, [r0, #32]
c0de4582:	7781      	strb	r1, [r0, #30]
c0de4584:	f880 a01d 	strb.w	sl, [r0, #29]
c0de4588:	7707      	strb	r7, [r0, #28]
c0de458a:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de458e:	f002 fe69 	bl	c0de7264 <OUTLINED_FUNCTION_0>
c0de4592:	f880 a01f 	strb.w	sl, [r0, #31]
c0de4596:	4606      	mov	r6, r0
c0de4598:	f002 ff96 	bl	c0de74c8 <OUTLINED_FUNCTION_23>
c0de459c:	22a0      	movs	r2, #160	@ 0xa0
c0de459e:	4601      	mov	r1, r0
c0de45a0:	200b      	movs	r0, #11
c0de45a2:	f886 7024 	strb.w	r7, [r6, #36]	@ 0x24
c0de45a6:	f886 b020 	strb.w	fp, [r6, #32]
c0de45aa:	7177      	strb	r7, [r6, #5]
c0de45ac:	7132      	strb	r2, [r6, #4]
c0de45ae:	4632      	mov	r2, r6
c0de45b0:	0e0b      	lsrs	r3, r1, #24
c0de45b2:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de45b6:	f802 1f26 	strb.w	r1, [r2, #38]!
c0de45ba:	70d3      	strb	r3, [r2, #3]
c0de45bc:	0c0b      	lsrs	r3, r1, #16
c0de45be:	7093      	strb	r3, [r2, #2]
c0de45c0:	0a0a      	lsrs	r2, r1, #8
c0de45c2:	f886 2027 	strb.w	r2, [r6, #39]	@ 0x27
c0de45c6:	68aa      	ldr	r2, [r5, #8]
c0de45c8:	b37a      	cbz	r2, c0de462a <nbgl_layoutAddUpFooter+0x50e>
c0de45ca:	4610      	mov	r0, r2
c0de45cc:	f007 f95c 	bl	c0deb888 <pic>
c0de45d0:	4633      	mov	r3, r6
c0de45d2:	4601      	mov	r1, r0
c0de45d4:	f813 cf26 	ldrb.w	ip, [r3, #38]!
c0de45d8:	f813 ed22 	ldrb.w	lr, [r3, #-34]!
c0de45dc:	785a      	ldrb	r2, [r3, #1]
c0de45de:	7f98      	ldrb	r0, [r3, #30]
c0de45e0:	f893 7020 	ldrb.w	r7, [r3, #32]
c0de45e4:	f893 8023 	ldrb.w	r8, [r3, #35]	@ 0x23
c0de45e8:	ea4e 2e02 	orr.w	lr, lr, r2, lsl #8
c0de45ec:	780a      	ldrb	r2, [r1, #0]
c0de45ee:	7849      	ldrb	r1, [r1, #1]
c0de45f0:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0de45f4:	ebae 0101 	sub.w	r1, lr, r1
c0de45f8:	f1a1 0220 	sub.w	r2, r1, #32
c0de45fc:	0a11      	lsrs	r1, r2, #8
c0de45fe:	701a      	strb	r2, [r3, #0]
c0de4600:	7059      	strb	r1, [r3, #1]
c0de4602:	f893 1025 	ldrb.w	r1, [r3, #37]	@ 0x25
c0de4606:	f893 3024 	ldrb.w	r3, [r3, #36]	@ 0x24
c0de460a:	2f00      	cmp	r7, #0
c0de460c:	bf18      	it	ne
c0de460e:	2701      	movne	r7, #1
c0de4610:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de4614:	ea4c 2308 	orr.w	r3, ip, r8, lsl #8
c0de4618:	f04f 0803 	mov.w	r8, #3
c0de461c:	ea43 4101 	orr.w	r1, r3, r1, lsl #16
c0de4620:	e005      	b.n	c0de462e <nbgl_layoutAddUpFooter+0x512>
c0de4622:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de4626:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de462a:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de462e:	b292      	uxth	r2, r2
c0de4630:	463b      	mov	r3, r7
c0de4632:	f006 ff61 	bl	c0deb4f8 <nbgl_getTextHeightInWidth>
c0de4636:	6961      	ldr	r1, [r4, #20]
c0de4638:	f886 a018 	strb.w	sl, [r6, #24]
c0de463c:	f886 b016 	strb.w	fp, [r6, #22]
c0de4640:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de4644:	784b      	ldrb	r3, [r1, #1]
c0de4646:	788f      	ldrb	r7, [r1, #2]
c0de4648:	78c9      	ldrb	r1, [r1, #3]
c0de464a:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de464e:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de4652:	2720      	movs	r7, #32
c0de4654:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de4658:	600e      	str	r6, [r1, #0]
c0de465a:	75f7      	strb	r7, [r6, #23]
c0de465c:	71b0      	strb	r0, [r6, #6]
c0de465e:	0a01      	lsrs	r1, r0, #8
c0de4660:	6962      	ldr	r2, [r4, #20]
c0de4662:	71f1      	strb	r1, [r6, #7]
c0de4664:	71d1      	strb	r1, [r2, #7]
c0de4666:	7190      	strb	r0, [r2, #6]
c0de4668:	f002 ff41 	bl	c0de74ee <OUTLINED_FUNCTION_25>
c0de466c:	2102      	movs	r1, #2
c0de466e:	f880 8022 	strb.w	r8, [r0, #34]	@ 0x22
c0de4672:	7581      	strb	r1, [r0, #22]
c0de4674:	6961      	ldr	r1, [r4, #20]
c0de4676:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de467a:	f002 fe94 	bl	c0de73a6 <OUTLINED_FUNCTION_11>
c0de467e:	6048      	str	r0, [r1, #4]
c0de4680:	68a8      	ldr	r0, [r5, #8]
c0de4682:	b3c0      	cbz	r0, c0de46f6 <nbgl_layoutAddUpFooter+0x5da>
c0de4684:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4688:	f002 ff08 	bl	c0de749c <OUTLINED_FUNCTION_21>
c0de468c:	4606      	mov	r6, r0
c0de468e:	2000      	movs	r0, #0
c0de4690:	7630      	strb	r0, [r6, #24]
c0de4692:	77f0      	strb	r0, [r6, #31]
c0de4694:	2006      	movs	r0, #6
c0de4696:	75f7      	strb	r7, [r6, #23]
c0de4698:	75b0      	strb	r0, [r6, #22]
c0de469a:	f003 f81d 	bl	c0de76d8 <OUTLINED_FUNCTION_49>
c0de469e:	4631      	mov	r1, r6
c0de46a0:	0e02      	lsrs	r2, r0, #24
c0de46a2:	f003 f84b 	bl	c0de773c <OUTLINED_FUNCTION_56>
c0de46a6:	6960      	ldr	r0, [r4, #20]
c0de46a8:	f810 2f22 	ldrb.w	r2, [r0, #34]!
c0de46ac:	7843      	ldrb	r3, [r0, #1]
c0de46ae:	7887      	ldrb	r7, [r0, #2]
c0de46b0:	78c0      	ldrb	r0, [r0, #3]
c0de46b2:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de46b6:	ea47 2000 	orr.w	r0, r7, r0, lsl #8
c0de46ba:	ea42 4000 	orr.w	r0, r2, r0, lsl #16
c0de46be:	6086      	str	r6, [r0, #8]
c0de46c0:	f896 0022 	ldrb.w	r0, [r6, #34]	@ 0x22
c0de46c4:	780a      	ldrb	r2, [r1, #0]
c0de46c6:	788b      	ldrb	r3, [r1, #2]
c0de46c8:	78c9      	ldrb	r1, [r1, #3]
c0de46ca:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de46ce:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de46d2:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de46d6:	7881      	ldrb	r1, [r0, #2]
c0de46d8:	78c0      	ldrb	r0, [r0, #3]
c0de46da:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
c0de46de:	6960      	ldr	r0, [r4, #20]
c0de46e0:	7982      	ldrb	r2, [r0, #6]
c0de46e2:	79c3      	ldrb	r3, [r0, #7]
c0de46e4:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de46e8:	428a      	cmp	r2, r1
c0de46ea:	bf2f      	iteee	cs
c0de46ec:	4611      	movcs	r1, r2
c0de46ee:	7181      	strbcc	r1, [r0, #6]
c0de46f0:	0a0a      	lsrcc	r2, r1, #8
c0de46f2:	71c2      	strbcc	r2, [r0, #7]
c0de46f4:	e004      	b.n	c0de4700 <nbgl_layoutAddUpFooter+0x5e4>
c0de46f6:	6960      	ldr	r0, [r4, #20]
c0de46f8:	7981      	ldrb	r1, [r0, #6]
c0de46fa:	79c2      	ldrb	r2, [r0, #7]
c0de46fc:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de4700:	3130      	adds	r1, #48	@ 0x30
c0de4702:	7181      	strb	r1, [r0, #6]
c0de4704:	0a09      	lsrs	r1, r1, #8
c0de4706:	71c1      	strb	r1, [r0, #7]
c0de4708:	f8d4 20a0 	ldr.w	r2, [r4, #160]	@ 0xa0
c0de470c:	6961      	ldr	r1, [r4, #20]
c0de470e:	68a0      	ldr	r0, [r4, #8]
c0de4710:	f812 3f06 	ldrb.w	r3, [r2, #6]!
c0de4714:	79cf      	ldrb	r7, [r1, #7]
c0de4716:	7856      	ldrb	r6, [r2, #1]
c0de4718:	ea43 2306 	orr.w	r3, r3, r6, lsl #8
c0de471c:	798e      	ldrb	r6, [r1, #6]
c0de471e:	ea46 2607 	orr.w	r6, r6, r7, lsl #8
c0de4722:	1b9b      	subs	r3, r3, r6
c0de4724:	7013      	strb	r3, [r2, #0]
c0de4726:	6101      	str	r1, [r0, #16]
c0de4728:	0a1b      	lsrs	r3, r3, #8
c0de472a:	6960      	ldr	r0, [r4, #20]
c0de472c:	7053      	strb	r3, [r2, #1]
c0de472e:	782a      	ldrb	r2, [r5, #0]
c0de4730:	7981      	ldrb	r1, [r0, #6]
c0de4732:	79c0      	ldrb	r0, [r0, #7]
c0de4734:	f884 20ac 	strb.w	r2, [r4, #172]	@ 0xac
c0de4738:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de473c:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de4740 <nbgl_layoutAddSwipe>:
c0de4740:	b3d8      	cbz	r0, c0de47ba <nbgl_layoutAddSwipe+0x7a>
c0de4742:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de4746:	f8dd 8020 	ldr.w	r8, [sp, #32]
c0de474a:	461c      	mov	r4, r3
c0de474c:	4617      	mov	r7, r2
c0de474e:	460d      	mov	r5, r1
c0de4750:	4606      	mov	r6, r0
c0de4752:	b342      	cbz	r2, c0de47a6 <nbgl_layoutAddSwipe+0x66>
c0de4754:	2004      	movs	r0, #4
c0de4756:	2100      	movs	r1, #0
c0de4758:	f04f 0a00 	mov.w	sl, #0
c0de475c:	f006 feb3 	bl	c0deb4c6 <nbgl_objPoolGet>
c0de4760:	61b0      	str	r0, [r6, #24]
c0de4762:	4638      	mov	r0, r7
c0de4764:	f007 f890 	bl	c0deb888 <pic>
c0de4768:	69b1      	ldr	r1, [r6, #24]
c0de476a:	f002 ff7c 	bl	c0de7666 <OUTLINED_FUNCTION_41>
c0de476e:	7048      	strb	r0, [r1, #1]
c0de4770:	2001      	movs	r0, #1
c0de4772:	22a0      	movs	r2, #160	@ 0xa0
c0de4774:	f801 2c22 	strb.w	r2, [r1, #-34]
c0de4778:	220b      	movs	r2, #11
c0de477a:	f801 0c21 	strb.w	r0, [r1, #-33]
c0de477e:	f801 0c07 	strb.w	r0, [r1, #-7]
c0de4782:	200b      	movs	r0, #11
c0de4784:	f801 2c04 	strb.w	r2, [r1, #-4]
c0de4788:	f006 feb1 	bl	c0deb4ee <nbgl_getFontLineHeight>
c0de478c:	69b1      	ldr	r1, [r6, #24]
c0de478e:	7188      	strb	r0, [r1, #6]
c0de4790:	201e      	movs	r0, #30
c0de4792:	f881 a007 	strb.w	sl, [r1, #7]
c0de4796:	f881 a01a 	strb.w	sl, [r1, #26]
c0de479a:	7648      	strb	r0, [r1, #25]
c0de479c:	2005      	movs	r0, #5
c0de479e:	f881 0020 	strb.w	r0, [r1, #32]
c0de47a2:	2008      	movs	r0, #8
c0de47a4:	7588      	strb	r0, [r1, #22]
c0de47a6:	4630      	mov	r0, r6
c0de47a8:	4629      	mov	r1, r5
c0de47aa:	2201      	movs	r2, #1
c0de47ac:	4623      	mov	r3, r4
c0de47ae:	f8cd 8000 	str.w	r8, [sp]
c0de47b2:	f000 f804 	bl	c0de47be <addSwipeInternal>
c0de47b6:	e8bd 85f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}
c0de47ba:	f002 bf0f 	b.w	c0de75dc <OUTLINED_FUNCTION_35>

c0de47be <addSwipeInternal>:
c0de47be:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de47c0:	f411 6ff0 	tst.w	r1, #1920	@ 0x780
c0de47c4:	d013      	beq.n	c0de47ee <addSwipeInternal+0x30>
c0de47c6:	9f06      	ldr	r7, [sp, #24]
c0de47c8:	460c      	mov	r4, r1
c0de47ca:	f8d0 10a0 	ldr.w	r1, [r0, #160]	@ 0xa0
c0de47ce:	4615      	mov	r5, r2
c0de47d0:	461a      	mov	r2, r3
c0de47d2:	4606      	mov	r6, r0
c0de47d4:	463b      	mov	r3, r7
c0de47d6:	f7ff fa23 	bl	c0de3c20 <layoutAddCallbackObj>
c0de47da:	b140      	cbz	r0, c0de47ee <addSwipeInternal+0x30>
c0de47dc:	f8d6 00a0 	ldr.w	r0, [r6, #160]	@ 0xa0
c0de47e0:	0a21      	lsrs	r1, r4, #8
c0de47e2:	f886 50b0 	strb.w	r5, [r6, #176]	@ 0xb0
c0de47e6:	7741      	strb	r1, [r0, #29]
c0de47e8:	7704      	strb	r4, [r0, #28]
c0de47ea:	2000      	movs	r0, #0
c0de47ec:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0de47ee:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de47f2:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}

c0de47f4 <nbgl_layoutAddTopRightButton>:
c0de47f4:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de47f8:	b398      	cbz	r0, c0de4862 <nbgl_layoutAddTopRightButton+0x6e>
c0de47fa:	f003 f823 	bl	c0de7844 <OUTLINED_FUNCTION_79>
c0de47fe:	4688      	mov	r8, r1
c0de4800:	461f      	mov	r7, r3
c0de4802:	4615      	mov	r5, r2
c0de4804:	f04f 0a05 	mov.w	sl, #5
c0de4808:	f002 fe19 	bl	c0de743e <OUTLINED_FUNCTION_17>
c0de480c:	4606      	mov	r6, r0
c0de480e:	4620      	mov	r0, r4
c0de4810:	462a      	mov	r2, r5
c0de4812:	463b      	mov	r3, r7
c0de4814:	f002 fe3f 	bl	c0de7496 <OUTLINED_FUNCTION_20>
c0de4818:	b318      	cbz	r0, c0de4862 <nbgl_layoutAddTopRightButton+0x6e>
c0de481a:	2058      	movs	r0, #88	@ 0x58
c0de481c:	2700      	movs	r7, #0
c0de481e:	2503      	movs	r5, #3
c0de4820:	f886 a01e 	strb.w	sl, [r6, #30]
c0de4824:	71b0      	strb	r0, [r6, #6]
c0de4826:	7130      	strb	r0, [r6, #4]
c0de4828:	2020      	movs	r0, #32
c0de482a:	71f7      	strb	r7, [r6, #7]
c0de482c:	7177      	strb	r7, [r6, #5]
c0de482e:	76b7      	strb	r7, [r6, #26]
c0de4830:	7637      	strb	r7, [r6, #24]
c0de4832:	7777      	strb	r7, [r6, #29]
c0de4834:	f886 5022 	strb.w	r5, [r6, #34]	@ 0x22
c0de4838:	f886 7021 	strb.w	r7, [r6, #33]	@ 0x21
c0de483c:	77f5      	strb	r5, [r6, #31]
c0de483e:	7670      	strb	r0, [r6, #25]
c0de4840:	75f0      	strb	r0, [r6, #23]
c0de4842:	2001      	movs	r0, #1
c0de4844:	7730      	strb	r0, [r6, #28]
c0de4846:	2002      	movs	r0, #2
c0de4848:	f886 0020 	strb.w	r0, [r6, #32]
c0de484c:	4640      	mov	r0, r8
c0de484e:	f007 f81b 	bl	c0deb888 <pic>
c0de4852:	4631      	mov	r1, r6
c0de4854:	0e02      	lsrs	r2, r0, #24
c0de4856:	75b5      	strb	r5, [r6, #22]
c0de4858:	f002 fe8f 	bl	c0de757a <OUTLINED_FUNCTION_31>
c0de485c:	68a0      	ldr	r0, [r4, #8]
c0de485e:	6086      	str	r6, [r0, #8]
c0de4860:	e001      	b.n	c0de4866 <nbgl_layoutAddTopRightButton+0x72>
c0de4862:	f04f 37ff 	mov.w	r7, #4294967295	@ 0xffffffff
c0de4866:	4638      	mov	r0, r7
c0de4868:	e8bd 85f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}

c0de486c <nbgl_layoutAddExtendedFooter>:
c0de486c:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de4870:	2800      	cmp	r0, #0
c0de4872:	f000 834b 	beq.w	c0de4f0c <nbgl_layoutAddExtendedFooter+0x6a0>
c0de4876:	460d      	mov	r5, r1
c0de4878:	b119      	cbz	r1, c0de4882 <nbgl_layoutAddExtendedFooter+0x16>
c0de487a:	4604      	mov	r4, r0
c0de487c:	7828      	ldrb	r0, [r5, #0]
c0de487e:	2806      	cmp	r0, #6
c0de4880:	d902      	bls.n	c0de4888 <nbgl_layoutAddExtendedFooter+0x1c>
c0de4882:	f06f 0701 	mvn.w	r7, #1
c0de4886:	e343      	b.n	c0de4f10 <nbgl_layoutAddExtendedFooter+0x6a4>
c0de4888:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de488c:	2601      	movs	r6, #1
c0de488e:	f002 fdd2 	bl	c0de7436 <OUTLINED_FUNCTION_16>
c0de4892:	2100      	movs	r1, #0
c0de4894:	7146      	strb	r6, [r0, #5]
c0de4896:	77c1      	strb	r1, [r0, #31]
c0de4898:	21a0      	movs	r1, #160	@ 0xa0
c0de489a:	7101      	strb	r1, [r0, #4]
c0de489c:	6120      	str	r0, [r4, #16]
c0de489e:	f002 ff7d 	bl	c0de779c <OUTLINED_FUNCTION_64>
c0de48a2:	4601      	mov	r1, r0
c0de48a4:	0a02      	lsrs	r2, r0, #8
c0de48a6:	6920      	ldr	r0, [r4, #16]
c0de48a8:	0e0b      	lsrs	r3, r1, #24
c0de48aa:	f880 2023 	strb.w	r2, [r0, #35]	@ 0x23
c0de48ae:	2208      	movs	r2, #8
c0de48b0:	7582      	strb	r2, [r0, #22]
c0de48b2:	4602      	mov	r2, r0
c0de48b4:	f802 1f22 	strb.w	r1, [r2, #34]!
c0de48b8:	0c09      	lsrs	r1, r1, #16
c0de48ba:	7091      	strb	r1, [r2, #2]
c0de48bc:	70d3      	strb	r3, [r2, #3]
c0de48be:	7829      	ldrb	r1, [r5, #0]
c0de48c0:	2906      	cmp	r1, #6
c0de48c2:	d017      	beq.n	c0de48f4 <nbgl_layoutAddExtendedFooter+0x88>
c0de48c4:	2901      	cmp	r1, #1
c0de48c6:	f000 80be 	beq.w	c0de4a46 <nbgl_layoutAddExtendedFooter+0x1da>
c0de48ca:	2902      	cmp	r1, #2
c0de48cc:	f000 80f7 	beq.w	c0de4abe <nbgl_layoutAddExtendedFooter+0x252>
c0de48d0:	2903      	cmp	r1, #3
c0de48d2:	f000 8184 	beq.w	c0de4bde <nbgl_layoutAddExtendedFooter+0x372>
c0de48d6:	2904      	cmp	r1, #4
c0de48d8:	f000 8249 	beq.w	c0de4d6e <nbgl_layoutAddExtendedFooter+0x502>
c0de48dc:	2905      	cmp	r1, #5
c0de48de:	f000 8269 	beq.w	c0de4db4 <nbgl_layoutAddExtendedFooter+0x548>
c0de48e2:	2900      	cmp	r1, #0
c0de48e4:	d1cd      	bne.n	c0de4882 <nbgl_layoutAddExtendedFooter+0x16>
c0de48e6:	88a9      	ldrh	r1, [r5, #4]
c0de48e8:	f04f 0800 	mov.w	r8, #0
c0de48ec:	7181      	strb	r1, [r0, #6]
c0de48ee:	0a09      	lsrs	r1, r1, #8
c0de48f0:	71c1      	strb	r1, [r0, #7]
c0de48f2:	e2db      	b.n	c0de4eac <nbgl_layoutAddExtendedFooter+0x640>
c0de48f4:	68a8      	ldr	r0, [r5, #8]
c0de48f6:	2800      	cmp	r0, #0
c0de48f8:	f000 8308 	beq.w	c0de4f0c <nbgl_layoutAddExtendedFooter+0x6a0>
c0de48fc:	6868      	ldr	r0, [r5, #4]
c0de48fe:	2800      	cmp	r0, #0
c0de4900:	f000 8304 	beq.w	c0de4f0c <nbgl_layoutAddExtendedFooter+0x6a0>
c0de4904:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4908:	f002 fd99 	bl	c0de743e <OUTLINED_FUNCTION_17>
c0de490c:	4606      	mov	r6, r0
c0de490e:	7c2a      	ldrb	r2, [r5, #16]
c0de4910:	7cab      	ldrb	r3, [r5, #18]
c0de4912:	f002 fcf5 	bl	c0de7300 <OUTLINED_FUNCTION_6>
c0de4916:	2800      	cmp	r0, #0
c0de4918:	f000 82f8 	beq.w	c0de4f0c <nbgl_layoutAddExtendedFooter+0x6a0>
c0de491c:	2103      	movs	r1, #3
c0de491e:	2208      	movs	r2, #8
c0de4920:	f04f 0801 	mov.w	r8, #1
c0de4924:	f04f 0a00 	mov.w	sl, #0
c0de4928:	75b2      	strb	r2, [r6, #22]
c0de492a:	77f1      	strb	r1, [r6, #31]
c0de492c:	f880 8005 	strb.w	r8, [r0, #5]
c0de4930:	2258      	movs	r2, #88	@ 0x58
c0de4932:	7c68      	ldrb	r0, [r5, #17]
c0de4934:	71b2      	strb	r2, [r6, #6]
c0de4936:	22a0      	movs	r2, #160	@ 0xa0
c0de4938:	f886 a021 	strb.w	sl, [r6, #33]	@ 0x21
c0de493c:	f886 a01a 	strb.w	sl, [r6, #26]
c0de4940:	f886 1022 	strb.w	r1, [r6, #34]	@ 0x22
c0de4944:	f886 a007 	strb.w	sl, [r6, #7]
c0de4948:	f886 8005 	strb.w	r8, [r6, #5]
c0de494c:	7132      	strb	r2, [r6, #4]
c0de494e:	2803      	cmp	r0, #3
c0de4950:	f04f 0004 	mov.w	r0, #4
c0de4954:	bf08      	it	eq
c0de4956:	2102      	moveq	r1, #2
c0de4958:	f886 1020 	strb.w	r1, [r6, #32]
c0de495c:	bf08      	it	eq
c0de495e:	2018      	moveq	r0, #24
c0de4960:	7670      	strb	r0, [r6, #25]
c0de4962:	f002 feb9 	bl	c0de76d8 <OUTLINED_FUNCTION_49>
c0de4966:	f002 fefb 	bl	c0de7760 <OUTLINED_FUNCTION_58>
c0de496a:	f002 fde5 	bl	c0de7538 <OUTLINED_FUNCTION_28>
c0de496e:	f002 fd6a 	bl	c0de7446 <OUTLINED_FUNCTION_18>
c0de4972:	f886 0023 	strb.w	r0, [r6, #35]	@ 0x23
c0de4976:	200a      	movs	r0, #10
c0de4978:	77b0      	strb	r0, [r6, #30]
c0de497a:	6920      	ldr	r0, [r4, #16]
c0de497c:	f002 fc76 	bl	c0de726c <OUTLINED_FUNCTION_1>
c0de4980:	7c68      	ldrb	r0, [r5, #17]
c0de4982:	b1c0      	cbz	r0, c0de49b6 <nbgl_layoutAddExtendedFooter+0x14a>
c0de4984:	2803      	cmp	r0, #3
c0de4986:	d016      	beq.n	c0de49b6 <nbgl_layoutAddExtendedFooter+0x14a>
c0de4988:	f002 fdb1 	bl	c0de74ee <OUTLINED_FUNCTION_25>
c0de498c:	0a31      	lsrs	r1, r6, #8
c0de498e:	0e32      	lsrs	r2, r6, #24
c0de4990:	74c1      	strb	r1, [r0, #19]
c0de4992:	4601      	mov	r1, r0
c0de4994:	f801 6f12 	strb.w	r6, [r1, #18]!
c0de4998:	70ca      	strb	r2, [r1, #3]
c0de499a:	0c32      	lsrs	r2, r6, #16
c0de499c:	708a      	strb	r2, [r1, #2]
c0de499e:	6921      	ldr	r1, [r4, #16]
c0de49a0:	f002 fc91 	bl	c0de72c6 <OUTLINED_FUNCTION_4>
c0de49a4:	2100      	movs	r1, #0
c0de49a6:	7681      	strb	r1, [r0, #26]
c0de49a8:	2104      	movs	r1, #4
c0de49aa:	7641      	strb	r1, [r0, #25]
c0de49ac:	2102      	movs	r1, #2
c0de49ae:	7581      	strb	r1, [r0, #22]
c0de49b0:	6920      	ldr	r0, [r4, #16]
c0de49b2:	f002 fc5b 	bl	c0de726c <OUTLINED_FUNCTION_1>
c0de49b6:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de49ba:	f002 fd40 	bl	c0de743e <OUTLINED_FUNCTION_17>
c0de49be:	4606      	mov	r6, r0
c0de49c0:	7c2a      	ldrb	r2, [r5, #16]
c0de49c2:	7cab      	ldrb	r3, [r5, #18]
c0de49c4:	f002 fc9c 	bl	c0de7300 <OUTLINED_FUNCTION_6>
c0de49c8:	2800      	cmp	r0, #0
c0de49ca:	f000 829f 	beq.w	c0de4f0c <nbgl_layoutAddExtendedFooter+0x6a0>
c0de49ce:	2118      	movs	r1, #24
c0de49d0:	f04f 0a00 	mov.w	sl, #0
c0de49d4:	f04f 0801 	mov.w	r8, #1
c0de49d8:	7671      	strb	r1, [r6, #25]
c0de49da:	2102      	movs	r1, #2
c0de49dc:	f886 a01a 	strb.w	sl, [r6, #26]
c0de49e0:	f880 a005 	strb.w	sl, [r0, #5]
c0de49e4:	75b1      	strb	r1, [r6, #22]
c0de49e6:	2103      	movs	r1, #3
c0de49e8:	7c68      	ldrb	r0, [r5, #17]
c0de49ea:	f886 1022 	strb.w	r1, [r6, #34]	@ 0x22
c0de49ee:	2158      	movs	r1, #88	@ 0x58
c0de49f0:	f886 8005 	strb.w	r8, [r6, #5]
c0de49f4:	f886 a007 	strb.w	sl, [r6, #7]
c0de49f8:	71b1      	strb	r1, [r6, #6]
c0de49fa:	21a0      	movs	r1, #160	@ 0xa0
c0de49fc:	7131      	strb	r1, [r6, #4]
c0de49fe:	2100      	movs	r1, #0
c0de4a00:	2802      	cmp	r0, #2
c0de4a02:	bf08      	it	eq
c0de4a04:	2103      	moveq	r1, #3
c0de4a06:	77f1      	strb	r1, [r6, #31]
c0de4a08:	1e81      	subs	r1, r0, #2
c0de4a0a:	bf18      	it	ne
c0de4a0c:	2103      	movne	r1, #3
c0de4a0e:	3802      	subs	r0, #2
c0de4a10:	f886 1021 	strb.w	r1, [r6, #33]	@ 0x21
c0de4a14:	fab0 f080 	clz	r0, r0
c0de4a18:	0940      	lsrs	r0, r0, #5
c0de4a1a:	0040      	lsls	r0, r0, #1
c0de4a1c:	f886 0020 	strb.w	r0, [r6, #32]
c0de4a20:	f002 fd52 	bl	c0de74c8 <OUTLINED_FUNCTION_23>
c0de4a24:	4631      	mov	r1, r6
c0de4a26:	0e02      	lsrs	r2, r0, #24
c0de4a28:	f801 0f25 	strb.w	r0, [r1, #37]!
c0de4a2c:	70ca      	strb	r2, [r1, #3]
c0de4a2e:	0c02      	lsrs	r2, r0, #16
c0de4a30:	0a00      	lsrs	r0, r0, #8
c0de4a32:	708a      	strb	r2, [r1, #2]
c0de4a34:	7048      	strb	r0, [r1, #1]
c0de4a36:	7c68      	ldrb	r0, [r5, #17]
c0de4a38:	2800      	cmp	r0, #0
c0de4a3a:	f000 8288 	beq.w	c0de4f4e <nbgl_layoutAddExtendedFooter+0x6e2>
c0de4a3e:	68e8      	ldr	r0, [r5, #12]
c0de4a40:	f006 ff22 	bl	c0deb888 <pic>
c0de4a44:	e284      	b.n	c0de4f50 <nbgl_layoutAddExtendedFooter+0x6e4>
c0de4a46:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4a4a:	f002 fc0b 	bl	c0de7264 <OUTLINED_FUNCTION_0>
c0de4a4e:	4606      	mov	r6, r0
c0de4a50:	7a6a      	ldrb	r2, [r5, #9]
c0de4a52:	7aab      	ldrb	r3, [r5, #10]
c0de4a54:	f002 fc54 	bl	c0de7300 <OUTLINED_FUNCTION_6>
c0de4a58:	2800      	cmp	r0, #0
c0de4a5a:	f000 8257 	beq.w	c0de4f0c <nbgl_layoutAddExtendedFooter+0x6a0>
c0de4a5e:	2008      	movs	r0, #8
c0de4a60:	4637      	mov	r7, r6
c0de4a62:	f04f 0a01 	mov.w	sl, #1
c0de4a66:	21a0      	movs	r1, #160	@ 0xa0
c0de4a68:	f04f 0800 	mov.w	r8, #0
c0de4a6c:	75b0      	strb	r0, [r6, #22]
c0de4a6e:	7a28      	ldrb	r0, [r5, #8]
c0de4a70:	f886 a005 	strb.w	sl, [r6, #5]
c0de4a74:	7131      	strb	r1, [r6, #4]
c0de4a76:	77f0      	strb	r0, [r6, #31]
c0de4a78:	2060      	movs	r0, #96	@ 0x60
c0de4a7a:	f807 0f06 	strb.w	r0, [r7, #6]!
c0de4a7e:	f887 8001 	strb.w	r8, [r7, #1]
c0de4a82:	f002 fd21 	bl	c0de74c8 <OUTLINED_FUNCTION_23>
c0de4a86:	4631      	mov	r1, r6
c0de4a88:	0e02      	lsrs	r2, r0, #24
c0de4a8a:	f002 fcbd 	bl	c0de7408 <OUTLINED_FUNCTION_15>
c0de4a8e:	7a29      	ldrb	r1, [r5, #8]
c0de4a90:	f886 801d 	strb.w	r8, [r6, #29]
c0de4a94:	f886 a01e 	strb.w	sl, [r6, #30]
c0de4a98:	f840 602c 	str.w	r6, [r0, ip, lsl #2]
c0de4a9c:	2005      	movs	r0, #5
c0de4a9e:	f886 a01c 	strb.w	sl, [r6, #28]
c0de4aa2:	f886 0020 	strb.w	r0, [r6, #32]
c0de4aa6:	200b      	movs	r0, #11
c0de4aa8:	2900      	cmp	r1, #0
c0de4aaa:	bf08      	it	eq
c0de4aac:	200c      	moveq	r0, #12
c0de4aae:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de4ab2:	6922      	ldr	r2, [r4, #16]
c0de4ab4:	7879      	ldrb	r1, [r7, #1]
c0de4ab6:	7838      	ldrb	r0, [r7, #0]
c0de4ab8:	f002 fe76 	bl	c0de77a8 <OUTLINED_FUNCTION_65>
c0de4abc:	e1f6      	b.n	c0de4eac <nbgl_layoutAddExtendedFooter+0x640>
c0de4abe:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4ac2:	f002 fbcf 	bl	c0de7264 <OUTLINED_FUNCTION_0>
c0de4ac6:	4606      	mov	r6, r0
c0de4ac8:	7b2a      	ldrb	r2, [r5, #12]
c0de4aca:	7bab      	ldrb	r3, [r5, #14]
c0de4acc:	f002 fc18 	bl	c0de7300 <OUTLINED_FUNCTION_6>
c0de4ad0:	2800      	cmp	r0, #0
c0de4ad2:	f000 821b 	beq.w	c0de4f0c <nbgl_layoutAddExtendedFooter+0x6a0>
c0de4ad6:	2007      	movs	r0, #7
c0de4ad8:	f04f 0a00 	mov.w	sl, #0
c0de4adc:	f04f 08d0 	mov.w	r8, #208	@ 0xd0
c0de4ae0:	75b0      	strb	r0, [r6, #22]
c0de4ae2:	2060      	movs	r0, #96	@ 0x60
c0de4ae4:	f886 a01f 	strb.w	sl, [r6, #31]
c0de4ae8:	f886 a007 	strb.w	sl, [r6, #7]
c0de4aec:	f886 a005 	strb.w	sl, [r6, #5]
c0de4af0:	f886 8004 	strb.w	r8, [r6, #4]
c0de4af4:	71b0      	strb	r0, [r6, #6]
c0de4af6:	f002 fce7 	bl	c0de74c8 <OUTLINED_FUNCTION_23>
c0de4afa:	4631      	mov	r1, r6
c0de4afc:	0e02      	lsrs	r2, r0, #24
c0de4afe:	f04f 0b01 	mov.w	fp, #1
c0de4b02:	f886 a01d 	strb.w	sl, [r6, #29]
c0de4b06:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de4b0a:	f886 b01e 	strb.w	fp, [r6, #30]
c0de4b0e:	f002 fc54 	bl	c0de73ba <OUTLINED_FUNCTION_12>
c0de4b12:	f002 fe2a 	bl	c0de776a <OUTLINED_FUNCTION_59>
c0de4b16:	f886 0020 	strb.w	r0, [r6, #32]
c0de4b1a:	6920      	ldr	r0, [r4, #16]
c0de4b1c:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de4b20:	3101      	adds	r1, #1
c0de4b22:	f880 1020 	strb.w	r1, [r0, #32]
c0de4b26:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4b2a:	f002 fb9b 	bl	c0de7264 <OUTLINED_FUNCTION_0>
c0de4b2e:	4606      	mov	r6, r0
c0de4b30:	7b6a      	ldrb	r2, [r5, #13]
c0de4b32:	7bab      	ldrb	r3, [r5, #14]
c0de4b34:	f002 fbe4 	bl	c0de7300 <OUTLINED_FUNCTION_6>
c0de4b38:	f04f 37ff 	mov.w	r7, #4294967295	@ 0xffffffff
c0de4b3c:	2800      	cmp	r0, #0
c0de4b3e:	f000 81e7 	beq.w	c0de4f10 <nbgl_layoutAddExtendedFooter+0x6a4>
c0de4b42:	2009      	movs	r0, #9
c0de4b44:	f886 8004 	strb.w	r8, [r6, #4]
c0de4b48:	46b0      	mov	r8, r6
c0de4b4a:	f886 a01f 	strb.w	sl, [r6, #31]
c0de4b4e:	f886 a005 	strb.w	sl, [r6, #5]
c0de4b52:	75b0      	strb	r0, [r6, #22]
c0de4b54:	2060      	movs	r0, #96	@ 0x60
c0de4b56:	f808 0f06 	strb.w	r0, [r8, #6]!
c0de4b5a:	f888 a001 	strb.w	sl, [r8, #1]
c0de4b5e:	f002 fdbb 	bl	c0de76d8 <OUTLINED_FUNCTION_49>
c0de4b62:	f002 fdfd 	bl	c0de7760 <OUTLINED_FUNCTION_58>
c0de4b66:	f002 fc4f 	bl	c0de7408 <OUTLINED_FUNCTION_15>
c0de4b6a:	f898 1001 	ldrb.w	r1, [r8, #1]
c0de4b6e:	f840 602c 	str.w	r6, [r0, ip, lsl #2]
c0de4b72:	200c      	movs	r0, #12
c0de4b74:	f002 fdf9 	bl	c0de776a <OUTLINED_FUNCTION_59>
c0de4b78:	6922      	ldr	r2, [r4, #16]
c0de4b7a:	f886 0020 	strb.w	r0, [r6, #32]
c0de4b7e:	2003      	movs	r0, #3
c0de4b80:	77b0      	strb	r0, [r6, #30]
c0de4b82:	f898 0000 	ldrb.w	r0, [r8]
c0de4b86:	f002 fe0f 	bl	c0de77a8 <OUTLINED_FUNCTION_65>
c0de4b8a:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4b8e:	f002 fe01 	bl	c0de7794 <OUTLINED_FUNCTION_63>
c0de4b92:	4680      	mov	r8, r0
c0de4b94:	f880 a005 	strb.w	sl, [r0, #5]
c0de4b98:	f880 b004 	strb.w	fp, [r0, #4]
c0de4b9c:	20ff      	movs	r0, #255	@ 0xff
c0de4b9e:	0e31      	lsrs	r1, r6, #24
c0de4ba0:	f888 0018 	strb.w	r0, [r8, #24]
c0de4ba4:	0a30      	lsrs	r0, r6, #8
c0de4ba6:	f888 7017 	strb.w	r7, [r8, #23]
c0de4baa:	f888 b021 	strb.w	fp, [r8, #33]	@ 0x21
c0de4bae:	f888 a01f 	strb.w	sl, [r8, #31]
c0de4bb2:	f888 0013 	strb.w	r0, [r8, #19]
c0de4bb6:	2002      	movs	r0, #2
c0de4bb8:	f888 0020 	strb.w	r0, [r8, #32]
c0de4bbc:	2004      	movs	r0, #4
c0de4bbe:	f888 0016 	strb.w	r0, [r8, #22]
c0de4bc2:	4640      	mov	r0, r8
c0de4bc4:	f800 6f12 	strb.w	r6, [r0, #18]!
c0de4bc8:	70c1      	strb	r1, [r0, #3]
c0de4bca:	0c31      	lsrs	r1, r6, #16
c0de4bcc:	7081      	strb	r1, [r0, #2]
c0de4bce:	6920      	ldr	r0, [r4, #16]
c0de4bd0:	7981      	ldrb	r1, [r0, #6]
c0de4bd2:	79c0      	ldrb	r0, [r0, #7]
c0de4bd4:	f888 0007 	strb.w	r0, [r8, #7]
c0de4bd8:	f888 1006 	strb.w	r1, [r8, #6]
c0de4bdc:	e166      	b.n	c0de4eac <nbgl_layoutAddExtendedFooter+0x640>
c0de4bde:	f04f 0b00 	mov.w	fp, #0
c0de4be2:	2760      	movs	r7, #96	@ 0x60
c0de4be4:	f04f 0a01 	mov.w	sl, #1
c0de4be8:	21e0      	movs	r1, #224	@ 0xe0
c0de4bea:	f880 b007 	strb.w	fp, [r0, #7]
c0de4bee:	7187      	strb	r7, [r0, #6]
c0de4bf0:	f880 a005 	strb.w	sl, [r0, #5]
c0de4bf4:	7101      	strb	r1, [r0, #4]
c0de4bf6:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4bfa:	f002 fb33 	bl	c0de7264 <OUTLINED_FUNCTION_0>
c0de4bfe:	4606      	mov	r6, r0
c0de4c00:	7d2a      	ldrb	r2, [r5, #20]
c0de4c02:	7d6b      	ldrb	r3, [r5, #21]
c0de4c04:	f002 fb7c 	bl	c0de7300 <OUTLINED_FUNCTION_6>
c0de4c08:	2800      	cmp	r0, #0
c0de4c0a:	f000 817f 	beq.w	c0de4f0c <nbgl_layoutAddExtendedFooter+0x6a0>
c0de4c0e:	1d28      	adds	r0, r5, #4
c0de4c10:	46b0      	mov	r8, r6
c0de4c12:	f886 b01f 	strb.w	fp, [r6, #31]
c0de4c16:	f886 b007 	strb.w	fp, [r6, #7]
c0de4c1a:	71b7      	strb	r7, [r6, #6]
c0de4c1c:	9001      	str	r0, [sp, #4]
c0de4c1e:	2007      	movs	r0, #7
c0de4c20:	75b0      	strb	r0, [r6, #22]
c0de4c22:	20c0      	movs	r0, #192	@ 0xc0
c0de4c24:	f808 0f04 	strb.w	r0, [r8, #4]!
c0de4c28:	f888 b001 	strb.w	fp, [r8, #1]
c0de4c2c:	6928      	ldr	r0, [r5, #16]
c0de4c2e:	f006 fe2b 	bl	c0deb888 <pic>
c0de4c32:	4631      	mov	r1, r6
c0de4c34:	0e02      	lsrs	r2, r0, #24
c0de4c36:	f886 a01e 	strb.w	sl, [r6, #30]
c0de4c3a:	f886 b01d 	strb.w	fp, [r6, #29]
c0de4c3e:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de4c42:	f002 fbba 	bl	c0de73ba <OUTLINED_FUNCTION_12>
c0de4c46:	f886 a01c 	strb.w	sl, [r6, #28]
c0de4c4a:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de4c4e:	2005      	movs	r0, #5
c0de4c50:	f886 0020 	strb.w	r0, [r6, #32]
c0de4c54:	6920      	ldr	r0, [r4, #16]
c0de4c56:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de4c5a:	3101      	adds	r1, #1
c0de4c5c:	f880 1020 	strb.w	r1, [r0, #32]
c0de4c60:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4c64:	f002 fbe7 	bl	c0de7436 <OUTLINED_FUNCTION_16>
c0de4c68:	4682      	mov	sl, r0
c0de4c6a:	2004      	movs	r0, #4
c0de4c6c:	2101      	movs	r1, #1
c0de4c6e:	f88a 0020 	strb.w	r0, [sl, #32]
c0de4c72:	20a0      	movs	r0, #160	@ 0xa0
c0de4c74:	4656      	mov	r6, sl
c0de4c76:	f88a b01f 	strb.w	fp, [sl, #31]
c0de4c7a:	f806 0f04 	strb.w	r0, [r6, #4]!
c0de4c7e:	7071      	strb	r1, [r6, #1]
c0de4c80:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4c84:	f002 fd82 	bl	c0de778c <OUTLINED_FUNCTION_62>
c0de4c88:	2109      	movs	r1, #9
c0de4c8a:	0e02      	lsrs	r2, r0, #24
c0de4c8c:	f88a b007 	strb.w	fp, [sl, #7]
c0de4c90:	f88a 1016 	strb.w	r1, [sl, #22]
c0de4c94:	2160      	movs	r1, #96	@ 0x60
c0de4c96:	f88a 1006 	strb.w	r1, [sl, #6]
c0de4c9a:	4651      	mov	r1, sl
c0de4c9c:	f801 0f22 	strb.w	r0, [r1, #34]!
c0de4ca0:	f002 fd0e 	bl	c0de76c0 <OUTLINED_FUNCTION_47>
c0de4ca4:	f88a 0023 	strb.w	r0, [sl, #35]	@ 0x23
c0de4ca8:	f898 0000 	ldrb.w	r0, [r8]
c0de4cac:	f898 1001 	ldrb.w	r1, [r8, #1]
c0de4cb0:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de4cb4:	9901      	ldr	r1, [sp, #4]
c0de4cb6:	f5c0 70f0 	rsb	r0, r0, #480	@ 0x1e0
c0de4cba:	7030      	strb	r0, [r6, #0]
c0de4cbc:	0a00      	lsrs	r0, r0, #8
c0de4cbe:	7070      	strb	r0, [r6, #1]
c0de4cc0:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4cc4:	08c2      	lsrs	r2, r0, #3
c0de4cc6:	4650      	mov	r0, sl
c0de4cc8:	f002 fe40 	bl	c0de794c <layoutNavigationPopulate>
c0de4ccc:	792a      	ldrb	r2, [r5, #4]
c0de4cce:	7b2b      	ldrb	r3, [r5, #12]
c0de4cd0:	4620      	mov	r0, r4
c0de4cd2:	4651      	mov	r1, sl
c0de4cd4:	f7fe ffa4 	bl	c0de3c20 <layoutAddCallbackObj>
c0de4cd8:	f04f 37ff 	mov.w	r7, #4294967295	@ 0xffffffff
c0de4cdc:	2800      	cmp	r0, #0
c0de4cde:	f000 8117 	beq.w	c0de4f10 <nbgl_layoutAddExtendedFooter+0x6a4>
c0de4ce2:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4ce6:	f002 fd55 	bl	c0de7794 <OUTLINED_FUNCTION_63>
c0de4cea:	4680      	mov	r8, r0
c0de4cec:	2002      	movs	r0, #2
c0de4cee:	2101      	movs	r1, #1
c0de4cf0:	f888 0020 	strb.w	r0, [r8, #32]
c0de4cf4:	2000      	movs	r0, #0
c0de4cf6:	f888 1004 	strb.w	r1, [r8, #4]
c0de4cfa:	f888 1021 	strb.w	r1, [r8, #33]	@ 0x21
c0de4cfe:	ea4f 611a 	mov.w	r1, sl, lsr #24
c0de4d02:	f888 7017 	strb.w	r7, [r8, #23]
c0de4d06:	f888 0005 	strb.w	r0, [r8, #5]
c0de4d0a:	f888 001f 	strb.w	r0, [r8, #31]
c0de4d0e:	2004      	movs	r0, #4
c0de4d10:	f888 0016 	strb.w	r0, [r8, #22]
c0de4d14:	20ff      	movs	r0, #255	@ 0xff
c0de4d16:	f888 0018 	strb.w	r0, [r8, #24]
c0de4d1a:	ea4f 201a 	mov.w	r0, sl, lsr #8
c0de4d1e:	f888 0013 	strb.w	r0, [r8, #19]
c0de4d22:	4640      	mov	r0, r8
c0de4d24:	f800 af12 	strb.w	sl, [r0, #18]!
c0de4d28:	70c1      	strb	r1, [r0, #3]
c0de4d2a:	ea4f 411a 	mov.w	r1, sl, lsr #16
c0de4d2e:	7081      	strb	r1, [r0, #2]
c0de4d30:	6920      	ldr	r0, [r4, #16]
c0de4d32:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de4d36:	f810 3c1b 	ldrb.w	r3, [r0, #-27]
c0de4d3a:	f810 2c1c 	ldrb.w	r2, [r0, #-28]
c0de4d3e:	7847      	ldrb	r7, [r0, #1]
c0de4d40:	f810 6c02 	ldrb.w	r6, [r0, #-2]
c0de4d44:	f888 3007 	strb.w	r3, [r8, #7]
c0de4d48:	f888 2006 	strb.w	r2, [r8, #6]
c0de4d4c:	ea41 2107 	orr.w	r1, r1, r7, lsl #8
c0de4d50:	79aa      	ldrb	r2, [r5, #6]
c0de4d52:	f884 20a9 	strb.w	r2, [r4, #169]	@ 0xa9
c0de4d56:	78c2      	ldrb	r2, [r0, #3]
c0de4d58:	7880      	ldrb	r0, [r0, #2]
c0de4d5a:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de4d5e:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de4d62:	7969      	ldrb	r1, [r5, #5]
c0de4d64:	f840 a026 	str.w	sl, [r0, r6, lsl #2]
c0de4d68:	f884 10a8 	strb.w	r1, [r4, #168]	@ 0xa8
c0de4d6c:	e09b      	b.n	c0de4ea6 <nbgl_layoutAddExtendedFooter+0x63a>
c0de4d6e:	2100      	movs	r1, #0
c0de4d70:	71c1      	strb	r1, [r0, #7]
c0de4d72:	2160      	movs	r1, #96	@ 0x60
c0de4d74:	7181      	strb	r1, [r0, #6]
c0de4d76:	2101      	movs	r1, #1
c0de4d78:	7141      	strb	r1, [r0, #5]
c0de4d7a:	21e0      	movs	r1, #224	@ 0xe0
c0de4d7c:	7101      	strb	r1, [r0, #4]
c0de4d7e:	1d29      	adds	r1, r5, #4
c0de4d80:	f894 20ad 	ldrb.w	r2, [r4, #173]	@ 0xad
c0de4d84:	08d2      	lsrs	r2, r2, #3
c0de4d86:	f002 fde1 	bl	c0de794c <layoutNavigationPopulate>
c0de4d8a:	6921      	ldr	r1, [r4, #16]
c0de4d8c:	2004      	movs	r0, #4
c0de4d8e:	f881 0020 	strb.w	r0, [r1, #32]
c0de4d92:	4620      	mov	r0, r4
c0de4d94:	792a      	ldrb	r2, [r5, #4]
c0de4d96:	7b2b      	ldrb	r3, [r5, #12]
c0de4d98:	f7fe ff42 	bl	c0de3c20 <layoutAddCallbackObj>
c0de4d9c:	2800      	cmp	r0, #0
c0de4d9e:	f000 80b5 	beq.w	c0de4f0c <nbgl_layoutAddExtendedFooter+0x6a0>
c0de4da2:	79a8      	ldrb	r0, [r5, #6]
c0de4da4:	f04f 0800 	mov.w	r8, #0
c0de4da8:	f884 00a9 	strb.w	r0, [r4, #169]	@ 0xa9
c0de4dac:	7968      	ldrb	r0, [r5, #5]
c0de4dae:	f884 00a8 	strb.w	r0, [r4, #168]	@ 0xa8
c0de4db2:	e07b      	b.n	c0de4eac <nbgl_layoutAddExtendedFooter+0x640>
c0de4db4:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4db8:	2605      	movs	r6, #5
c0de4dba:	f002 fb40 	bl	c0de743e <OUTLINED_FUNCTION_17>
c0de4dbe:	4607      	mov	r7, r0
c0de4dc0:	7b2a      	ldrb	r2, [r5, #12]
c0de4dc2:	7c2b      	ldrb	r3, [r5, #16]
c0de4dc4:	4620      	mov	r0, r4
c0de4dc6:	4639      	mov	r1, r7
c0de4dc8:	f7fe ff2a 	bl	c0de3c20 <layoutAddCallbackObj>
c0de4dcc:	2800      	cmp	r0, #0
c0de4dce:	f000 809d 	beq.w	c0de4f0c <nbgl_layoutAddExtendedFooter+0x6a0>
c0de4dd2:	75be      	strb	r6, [r7, #22]
c0de4dd4:	2100      	movs	r1, #0
c0de4dd6:	f04f 0800 	mov.w	r8, #0
c0de4dda:	7b68      	ldrb	r0, [r5, #13]
c0de4ddc:	2800      	cmp	r0, #0
c0de4dde:	bf08      	it	eq
c0de4de0:	2103      	moveq	r1, #3
c0de4de2:	f887 1021 	strb.w	r1, [r7, #33]	@ 0x21
c0de4de6:	bf18      	it	ne
c0de4de8:	2003      	movne	r0, #3
c0de4dea:	77f8      	strb	r0, [r7, #31]
c0de4dec:	7b68      	ldrb	r0, [r5, #13]
c0de4dee:	4601      	mov	r1, r0
c0de4df0:	2800      	cmp	r0, #0
c0de4df2:	bf18      	it	ne
c0de4df4:	2101      	movne	r1, #1
c0de4df6:	0049      	lsls	r1, r1, #1
c0de4df8:	2802      	cmp	r0, #2
c0de4dfa:	bf08      	it	eq
c0de4dfc:	2103      	moveq	r1, #3
c0de4dfe:	f887 1020 	strb.w	r1, [r7, #32]
c0de4e02:	f002 fb61 	bl	c0de74c8 <OUTLINED_FUNCTION_23>
c0de4e06:	463e      	mov	r6, r7
c0de4e08:	210c      	movs	r1, #12
c0de4e0a:	f887 1023 	strb.w	r1, [r7, #35]	@ 0x23
c0de4e0e:	f806 0f25 	strb.w	r0, [r6, #37]!
c0de4e12:	0e01      	lsrs	r1, r0, #24
c0de4e14:	f002 fcaf 	bl	c0de7776 <OUTLINED_FUNCTION_60>
c0de4e18:	f887 0026 	strb.w	r0, [r7, #38]	@ 0x26
c0de4e1c:	f002 fc5c 	bl	c0de76d8 <OUTLINED_FUNCTION_49>
c0de4e20:	2103      	movs	r1, #3
c0de4e22:	0e02      	lsrs	r2, r0, #24
c0de4e24:	f887 8007 	strb.w	r8, [r7, #7]
c0de4e28:	f887 1022 	strb.w	r1, [r7, #34]	@ 0x22
c0de4e2c:	2158      	movs	r1, #88	@ 0x58
c0de4e2e:	71b9      	strb	r1, [r7, #6]
c0de4e30:	4639      	mov	r1, r7
c0de4e32:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de4e36:	f002 fc43 	bl	c0de76c0 <OUTLINED_FUNCTION_47>
c0de4e3a:	f887 002f 	strb.w	r0, [r7, #47]	@ 0x2f
c0de4e3e:	2188      	movs	r1, #136	@ 0x88
c0de4e40:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de4e44:	6920      	ldr	r0, [r4, #16]
c0de4e46:	f880 8007 	strb.w	r8, [r0, #7]
c0de4e4a:	7181      	strb	r1, [r0, #6]
c0de4e4c:	6869      	ldr	r1, [r5, #4]
c0de4e4e:	2900      	cmp	r1, #0
c0de4e50:	bf08      	it	eq
c0de4e52:	2258      	moveq	r2, #88	@ 0x58
c0de4e54:	713a      	strb	r2, [r7, #4]
c0de4e56:	f896 c000 	ldrb.w	ip, [r6]
c0de4e5a:	f896 e002 	ldrb.w	lr, [r6, #2]
c0de4e5e:	f896 a003 	ldrb.w	sl, [r6, #3]
c0de4e62:	f887 801d 	strb.w	r8, [r7, #29]
c0de4e66:	0a11      	lsrs	r1, r2, #8
c0de4e68:	7179      	strb	r1, [r7, #5]
c0de4e6a:	f810 6f22 	ldrb.w	r6, [r0, #34]!
c0de4e6e:	7842      	ldrb	r2, [r0, #1]
c0de4e70:	f810 1c02 	ldrb.w	r1, [r0, #-2]
c0de4e74:	7883      	ldrb	r3, [r0, #2]
c0de4e76:	78c0      	ldrb	r0, [r0, #3]
c0de4e78:	ea46 2202 	orr.w	r2, r6, r2, lsl #8
c0de4e7c:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de4e80:	ea42 4000 	orr.w	r0, r2, r0, lsl #16
c0de4e84:	f897 2026 	ldrb.w	r2, [r7, #38]	@ 0x26
c0de4e88:	f840 7021 	str.w	r7, [r0, r1, lsl #2]
c0de4e8c:	2001      	movs	r0, #1
c0de4e8e:	ea4e 210a 	orr.w	r1, lr, sl, lsl #8
c0de4e92:	7738      	strb	r0, [r7, #28]
c0de4e94:	ea4c 2002 	orr.w	r0, ip, r2, lsl #8
c0de4e98:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de4e9c:	2107      	movs	r1, #7
c0de4e9e:	2800      	cmp	r0, #0
c0de4ea0:	bf08      	it	eq
c0de4ea2:	2101      	moveq	r1, #1
c0de4ea4:	77b9      	strb	r1, [r7, #30]
c0de4ea6:	6920      	ldr	r0, [r4, #16]
c0de4ea8:	f002 f9e0 	bl	c0de726c <OUTLINED_FUNCTION_1>
c0de4eac:	7828      	ldrb	r0, [r5, #0]
c0de4eae:	3803      	subs	r0, #3
c0de4eb0:	2801      	cmp	r0, #1
c0de4eb2:	d808      	bhi.n	c0de4ec6 <nbgl_layoutAddExtendedFooter+0x65a>
c0de4eb4:	7b28      	ldrb	r0, [r5, #12]
c0de4eb6:	792b      	ldrb	r3, [r5, #4]
c0de4eb8:	f44f 61c0 	mov.w	r1, #1536	@ 0x600
c0de4ebc:	2200      	movs	r2, #0
c0de4ebe:	9000      	str	r0, [sp, #0]
c0de4ec0:	4620      	mov	r0, r4
c0de4ec2:	f7ff fc7c 	bl	c0de47be <addSwipeInternal>
c0de4ec6:	7868      	ldrb	r0, [r5, #1]
c0de4ec8:	b148      	cbz	r0, c0de4ede <nbgl_layoutAddExtendedFooter+0x672>
c0de4eca:	f002 fb10 	bl	c0de74ee <OUTLINED_FUNCTION_25>
c0de4ece:	6921      	ldr	r1, [r4, #16]
c0de4ed0:	f002 f9f9 	bl	c0de72c6 <OUTLINED_FUNCTION_4>
c0de4ed4:	2102      	movs	r1, #2
c0de4ed6:	7581      	strb	r1, [r0, #22]
c0de4ed8:	6920      	ldr	r0, [r4, #16]
c0de4eda:	f002 f9c7 	bl	c0de726c <OUTLINED_FUNCTION_1>
c0de4ede:	f1b8 0f00 	cmp.w	r8, #0
c0de4ee2:	d018      	beq.n	c0de4f16 <nbgl_layoutAddExtendedFooter+0x6aa>
c0de4ee4:	6920      	ldr	r0, [r4, #16]
c0de4ee6:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de4eea:	7843      	ldrb	r3, [r0, #1]
c0de4eec:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de4ef0:	7886      	ldrb	r6, [r0, #2]
c0de4ef2:	78c0      	ldrb	r0, [r0, #3]
c0de4ef4:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de4ef8:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
c0de4efc:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de4f00:	f840 8022 	str.w	r8, [r0, r2, lsl #2]
c0de4f04:	6920      	ldr	r0, [r4, #16]
c0de4f06:	f002 f9b1 	bl	c0de726c <OUTLINED_FUNCTION_1>
c0de4f0a:	e005      	b.n	c0de4f18 <nbgl_layoutAddExtendedFooter+0x6ac>
c0de4f0c:	f04f 37ff 	mov.w	r7, #4294967295	@ 0xffffffff
c0de4f10:	4638      	mov	r0, r7
c0de4f12:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de4f16:	6920      	ldr	r0, [r4, #16]
c0de4f18:	68a1      	ldr	r1, [r4, #8]
c0de4f1a:	60c8      	str	r0, [r1, #12]
c0de4f1c:	6920      	ldr	r0, [r4, #16]
c0de4f1e:	f8d4 10a0 	ldr.w	r1, [r4, #160]	@ 0xa0
c0de4f22:	f810 2f06 	ldrb.w	r2, [r0, #6]!
c0de4f26:	7843      	ldrb	r3, [r0, #1]
c0de4f28:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de4f2c:	f811 3f06 	ldrb.w	r3, [r1, #6]!
c0de4f30:	784e      	ldrb	r6, [r1, #1]
c0de4f32:	ea43 2306 	orr.w	r3, r3, r6, lsl #8
c0de4f36:	1a9a      	subs	r2, r3, r2
c0de4f38:	700a      	strb	r2, [r1, #0]
c0de4f3a:	0a12      	lsrs	r2, r2, #8
c0de4f3c:	704a      	strb	r2, [r1, #1]
c0de4f3e:	7829      	ldrb	r1, [r5, #0]
c0de4f40:	f884 10ab 	strb.w	r1, [r4, #171]	@ 0xab
c0de4f44:	7801      	ldrb	r1, [r0, #0]
c0de4f46:	7840      	ldrb	r0, [r0, #1]
c0de4f48:	ea41 2700 	orr.w	r7, r1, r0, lsl #8
c0de4f4c:	e7e0      	b.n	c0de4f10 <nbgl_layoutAddExtendedFooter+0x6a4>
c0de4f4e:	2000      	movs	r0, #0
c0de4f50:	f002 fc06 	bl	c0de7760 <OUTLINED_FUNCTION_58>
c0de4f54:	f002 fb11 	bl	c0de757a <OUTLINED_FUNCTION_31>
c0de4f58:	f002 fa75 	bl	c0de7446 <OUTLINED_FUNCTION_18>
c0de4f5c:	f04f 0800 	mov.w	r8, #0
c0de4f60:	f886 0023 	strb.w	r0, [r6, #35]	@ 0x23
c0de4f64:	2009      	movs	r0, #9
c0de4f66:	77b0      	strb	r0, [r6, #30]
c0de4f68:	6920      	ldr	r0, [r4, #16]
c0de4f6a:	f002 f97f 	bl	c0de726c <OUTLINED_FUNCTION_1>
c0de4f6e:	7c69      	ldrb	r1, [r5, #17]
c0de4f70:	f880 8007 	strb.w	r8, [r0, #7]
c0de4f74:	2900      	cmp	r1, #0
c0de4f76:	bf0c      	ite	eq
c0de4f78:	21d0      	moveq	r1, #208	@ 0xd0
c0de4f7a:	21e8      	movne	r1, #232	@ 0xe8
c0de4f7c:	7181      	strb	r1, [r0, #6]
c0de4f7e:	e795      	b.n	c0de4eac <nbgl_layoutAddExtendedFooter+0x640>

c0de4f80 <nbgl_layoutAddBottomButton>:
c0de4f80:	b570      	push	{r4, r5, r6, lr}
c0de4f82:	b086      	sub	sp, #24
c0de4f84:	4605      	mov	r5, r0
c0de4f86:	2005      	movs	r0, #5
c0de4f88:	2600      	movs	r6, #0
c0de4f8a:	4614      	mov	r4, r2
c0de4f8c:	f88d 3001 	strb.w	r3, [sp, #1]
c0de4f90:	f88d 0000 	strb.w	r0, [sp]
c0de4f94:	4608      	mov	r0, r1
c0de4f96:	f88d 600e 	strb.w	r6, [sp, #14]
c0de4f9a:	f006 fc75 	bl	c0deb888 <pic>
c0de4f9e:	9002      	str	r0, [sp, #8]
c0de4fa0:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de4fa2:	4669      	mov	r1, sp
c0de4fa4:	f88d 400c 	strb.w	r4, [sp, #12]
c0de4fa8:	9601      	str	r6, [sp, #4]
c0de4faa:	f88d 0010 	strb.w	r0, [sp, #16]
c0de4fae:	2001      	movs	r0, #1
c0de4fb0:	f88d 000d 	strb.w	r0, [sp, #13]
c0de4fb4:	4628      	mov	r0, r5
c0de4fb6:	f7ff fc59 	bl	c0de486c <nbgl_layoutAddExtendedFooter>
c0de4fba:	b006      	add	sp, #24
c0de4fbc:	bd70      	pop	{r4, r5, r6, pc}

c0de4fbe <nbgl_layoutAddTouchableBar>:
c0de4fbe:	b5b0      	push	{r4, r5, r7, lr}
c0de4fc0:	b086      	sub	sp, #24
c0de4fc2:	b1e8      	cbz	r0, c0de5000 <nbgl_layoutAddTouchableBar+0x42>
c0de4fc4:	2200      	movs	r2, #0
c0de4fc6:	f88d 2000 	strb.w	r2, [sp]
c0de4fca:	e891 003c 	ldmia.w	r1, {r2, r3, r4, r5}
c0de4fce:	e9cd 3503 	strd	r3, r5, [sp, #12]
c0de4fd2:	e9cd 2401 	strd	r2, r4, [sp, #4]
c0de4fd6:	7c4a      	ldrb	r2, [r1, #17]
c0de4fd8:	f88d 2014 	strb.w	r2, [sp, #20]
c0de4fdc:	7d0a      	ldrb	r2, [r1, #20]
c0de4fde:	f88d 2017 	strb.w	r2, [sp, #23]
c0de4fe2:	7c0a      	ldrb	r2, [r1, #16]
c0de4fe4:	7c89      	ldrb	r1, [r1, #18]
c0de4fe6:	f081 0101 	eor.w	r1, r1, #1
c0de4fea:	f88d 2016 	strb.w	r2, [sp, #22]
c0de4fee:	f88d 1015 	strb.w	r1, [sp, #21]
c0de4ff2:	4669      	mov	r1, sp
c0de4ff4:	f000 f808 	bl	c0de5008 <addListItem>
c0de4ff8:	b110      	cbz	r0, c0de5000 <nbgl_layoutAddTouchableBar+0x42>
c0de4ffa:	f002 fb9a 	bl	c0de7732 <OUTLINED_FUNCTION_55>
c0de4ffe:	e001      	b.n	c0de5004 <nbgl_layoutAddTouchableBar+0x46>
c0de5000:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de5004:	b006      	add	sp, #24
c0de5006:	bdb0      	pop	{r4, r5, r7, pc}

c0de5008 <addListItem>:
c0de5008:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de500c:	4682      	mov	sl, r0
c0de500e:	7808      	ldrb	r0, [r1, #0]
c0de5010:	4688      	mov	r8, r1
c0de5012:	b110      	cbz	r0, c0de501a <addListItem+0x12>
c0de5014:	f04f 0b00 	mov.w	fp, #0
c0de5018:	e006      	b.n	c0de5028 <addListItem+0x20>
c0de501a:	f898 0015 	ldrb.w	r0, [r8, #21]
c0de501e:	fab0 f080 	clz	r0, r0
c0de5022:	0940      	lsrs	r0, r0, #5
c0de5024:	ea4f 0b40 	mov.w	fp, r0, lsl #1
c0de5028:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de502c:	2401      	movs	r4, #1
c0de502e:	f002 fa02 	bl	c0de7436 <OUTLINED_FUNCTION_16>
c0de5032:	4606      	mov	r6, r0
c0de5034:	f898 2014 	ldrb.w	r2, [r8, #20]
c0de5038:	f898 3017 	ldrb.w	r3, [r8, #23]
c0de503c:	4650      	mov	r0, sl
c0de503e:	f002 fa2a 	bl	c0de7496 <OUTLINED_FUNCTION_20>
c0de5042:	2500      	movs	r5, #0
c0de5044:	2800      	cmp	r0, #0
c0de5046:	d075      	beq.n	c0de5134 <addListItem+0x12c>
c0de5048:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de504c:	f002 fb9e 	bl	c0de778c <OUTLINED_FUNCTION_62>
c0de5050:	4631      	mov	r1, r6
c0de5052:	0e02      	lsrs	r2, r0, #24
c0de5054:	2364      	movs	r3, #100	@ 0x64
c0de5056:	f801 0f22 	strb.w	r0, [r1, #34]!
c0de505a:	f801 5d10 	strb.w	r5, [r1, #-16]!
c0de505e:	74ca      	strb	r2, [r1, #19]
c0de5060:	0c02      	lsrs	r2, r0, #16
c0de5062:	0a00      	lsrs	r0, r0, #8
c0de5064:	f801 4c0d 	strb.w	r4, [r1, #-13]
c0de5068:	f801 5c0b 	strb.w	r5, [r1, #-11]
c0de506c:	7448      	strb	r0, [r1, #17]
c0de506e:	20a0      	movs	r0, #160	@ 0xa0
c0de5070:	748a      	strb	r2, [r1, #18]
c0de5072:	f801 0c0e 	strb.w	r0, [r1, #-14]
c0de5076:	f898 2016 	ldrb.w	r2, [r8, #22]
c0de507a:	f898 0000 	ldrb.w	r0, [r8]
c0de507e:	2a00      	cmp	r2, #0
c0de5080:	bf08      	it	eq
c0de5082:	235c      	moveq	r3, #92	@ 0x5c
c0de5084:	f801 3c0c 	strb.w	r3, [r1, #-12]
c0de5088:	718d      	strb	r5, [r1, #6]
c0de508a:	70cd      	strb	r5, [r1, #3]
c0de508c:	708d      	strb	r5, [r1, #2]
c0de508e:	704d      	strb	r5, [r1, #1]
c0de5090:	738d      	strb	r5, [r1, #14]
c0de5092:	734c      	strb	r4, [r1, #13]
c0de5094:	710d      	strb	r5, [r1, #4]
c0de5096:	2220      	movs	r2, #32
c0de5098:	2801      	cmp	r0, #1
c0de509a:	714a      	strb	r2, [r1, #5]
c0de509c:	d004      	beq.n	c0de50a8 <addListItem+0xa0>
c0de509e:	b980      	cbnz	r0, c0de50c2 <addListItem+0xba>
c0de50a0:	f898 0015 	ldrb.w	r0, [r8, #21]
c0de50a4:	2801      	cmp	r0, #1
c0de50a6:	d10c      	bne.n	c0de50c2 <addListItem+0xba>
c0de50a8:	48c4      	ldr	r0, [pc, #784]	@ (c0de53bc <addListItem+0x3b4>)
c0de50aa:	f819 1000 	ldrb.w	r1, [r9, r0]
c0de50ae:	1c4a      	adds	r2, r1, #1
c0de50b0:	f809 2000 	strb.w	r2, [r9, r0]
c0de50b4:	2000      	movs	r0, #0
c0de50b6:	7770      	strb	r0, [r6, #29]
c0de50b8:	2001      	movs	r0, #1
c0de50ba:	7730      	strb	r0, [r6, #28]
c0de50bc:	f101 0014 	add.w	r0, r1, #20
c0de50c0:	77b0      	strb	r0, [r6, #30]
c0de50c2:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de50c6:	f002 f8cd 	bl	c0de7264 <OUTLINED_FUNCTION_0>
c0de50ca:	4607      	mov	r7, r0
c0de50cc:	f880 b01f 	strb.w	fp, [r0, #31]
c0de50d0:	f8d8 000c 	ldr.w	r0, [r8, #12]
c0de50d4:	f006 fbd8 	bl	c0deb888 <pic>
c0de50d8:	2201      	movs	r2, #1
c0de50da:	2100      	movs	r1, #0
c0de50dc:	f64f 74f0 	movw	r4, #65520	@ 0xfff0
c0de50e0:	f887 2024 	strb.w	r2, [r7, #36]	@ 0x24
c0de50e4:	220c      	movs	r2, #12
c0de50e6:	f887 102d 	strb.w	r1, [r7, #45]	@ 0x2d
c0de50ea:	f887 2022 	strb.w	r2, [r7, #34]	@ 0x22
c0de50ee:	463a      	mov	r2, r7
c0de50f0:	f802 1f2c 	strb.w	r1, [r2, #44]!
c0de50f4:	70d1      	strb	r1, [r2, #3]
c0de50f6:	7091      	strb	r1, [r2, #2]
c0de50f8:	4639      	mov	r1, r7
c0de50fa:	f002 fab4 	bl	c0de7666 <OUTLINED_FUNCTION_41>
c0de50fe:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de5102:	7931      	ldrb	r1, [r6, #4]
c0de5104:	7972      	ldrb	r2, [r6, #5]
c0de5106:	7139      	strb	r1, [r7, #4]
c0de5108:	717a      	strb	r2, [r7, #5]
c0de510a:	f8d8 0004 	ldr.w	r0, [r8, #4]
c0de510e:	b198      	cbz	r0, c0de5138 <addListItem+0x130>
c0de5110:	f006 fbba 	bl	c0deb888 <pic>
c0de5114:	4639      	mov	r1, r7
c0de5116:	f811 2f04 	ldrb.w	r2, [r1, #4]!
c0de511a:	784b      	ldrb	r3, [r1, #1]
c0de511c:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de5120:	7803      	ldrb	r3, [r0, #0]
c0de5122:	7840      	ldrb	r0, [r0, #1]
c0de5124:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de5128:	1a20      	subs	r0, r4, r0
c0de512a:	4402      	add	r2, r0
c0de512c:	0a10      	lsrs	r0, r2, #8
c0de512e:	700a      	strb	r2, [r1, #0]
c0de5130:	7048      	strb	r0, [r1, #1]
c0de5132:	e003      	b.n	c0de513c <addListItem+0x134>
c0de5134:	2000      	movs	r0, #0
c0de5136:	e13e      	b.n	c0de53b6 <addListItem+0x3ae>
c0de5138:	ea41 2202 	orr.w	r2, r1, r2, lsl #8
c0de513c:	f8d8 0008 	ldr.w	r0, [r8, #8]
c0de5140:	f8cd b00c 	str.w	fp, [sp, #12]
c0de5144:	b160      	cbz	r0, c0de5160 <addListItem+0x158>
c0de5146:	f006 fb9f 	bl	c0deb888 <pic>
c0de514a:	7801      	ldrb	r1, [r0, #0]
c0de514c:	7840      	ldrb	r0, [r0, #1]
c0de514e:	797a      	ldrb	r2, [r7, #5]
c0de5150:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de5154:	7939      	ldrb	r1, [r7, #4]
c0de5156:	1a20      	subs	r0, r4, r0
c0de5158:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de515c:	1842      	adds	r2, r0, r1
c0de515e:	e004      	b.n	c0de516a <addListItem+0x162>
c0de5160:	f898 0000 	ldrb.w	r0, [r8]
c0de5164:	2801      	cmp	r0, #1
c0de5166:	d103      	bne.n	c0de5170 <addListItem+0x168>
c0de5168:	3a4c      	subs	r2, #76	@ 0x4c
c0de516a:	0a10      	lsrs	r0, r2, #8
c0de516c:	713a      	strb	r2, [r7, #4]
c0de516e:	7178      	strb	r0, [r7, #5]
c0de5170:	463c      	mov	r4, r7
c0de5172:	f897 1027 	ldrb.w	r1, [r7, #39]	@ 0x27
c0de5176:	f897 0022 	ldrb.w	r0, [r7, #34]	@ 0x22
c0de517a:	f897 3024 	ldrb.w	r3, [r7, #36]	@ 0x24
c0de517e:	b292      	uxth	r2, r2
c0de5180:	f814 5f26 	ldrb.w	r5, [r4, #38]!
c0de5184:	ea45 2101 	orr.w	r1, r5, r1, lsl #8
c0de5188:	78a5      	ldrb	r5, [r4, #2]
c0de518a:	78e4      	ldrb	r4, [r4, #3]
c0de518c:	ea45 2404 	orr.w	r4, r5, r4, lsl #8
c0de5190:	ea41 4104 	orr.w	r1, r1, r4, lsl #16
c0de5194:	f006 f9b0 	bl	c0deb4f8 <nbgl_getTextHeightInWidth>
c0de5198:	4683      	mov	fp, r0
c0de519a:	4630      	mov	r0, r6
c0de519c:	4634      	mov	r4, r6
c0de519e:	f002 fa3c 	bl	c0de761a <OUTLINED_FUNCTION_38>
c0de51a2:	f841 7022 	str.w	r7, [r1, r2, lsl #2]
c0de51a6:	2100      	movs	r1, #0
c0de51a8:	f887 b006 	strb.w	fp, [r7, #6]
c0de51ac:	f887 1021 	strb.w	r1, [r7, #33]	@ 0x21
c0de51b0:	2104      	movs	r1, #4
c0de51b2:	f887 1020 	strb.w	r1, [r7, #32]
c0de51b6:	75b9      	strb	r1, [r7, #22]
c0de51b8:	ea4f 211b 	mov.w	r1, fp, lsr #8
c0de51bc:	71f9      	strb	r1, [r7, #7]
c0de51be:	1c51      	adds	r1, r2, #1
c0de51c0:	f800 1c02 	strb.w	r1, [r0, #-2]
c0de51c4:	f1bb 0f28 	cmp.w	fp, #40	@ 0x28
c0de51c8:	bf98      	it	ls
c0de51ca:	f04f 0b28 	movls.w	fp, #40	@ 0x28
c0de51ce:	f8d8 0004 	ldr.w	r0, [r8, #4]
c0de51d2:	9402      	str	r4, [sp, #8]
c0de51d4:	b358      	cbz	r0, c0de522e <addListItem+0x226>
c0de51d6:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de51da:	f002 f95f 	bl	c0de749c <OUTLINED_FUNCTION_21>
c0de51de:	4605      	mov	r5, r0
c0de51e0:	9803      	ldr	r0, [sp, #12]
c0de51e2:	77e8      	strb	r0, [r5, #31]
c0de51e4:	f8d8 0004 	ldr.w	r0, [r8, #4]
c0de51e8:	f006 fb4e 	bl	c0deb888 <pic>
c0de51ec:	f002 f93f 	bl	c0de746e <OUTLINED_FUNCTION_19>
c0de51f0:	4620      	mov	r0, r4
c0de51f2:	f810 cf22 	ldrb.w	ip, [r0, #34]!
c0de51f6:	7846      	ldrb	r6, [r0, #1]
c0de51f8:	7884      	ldrb	r4, [r0, #2]
c0de51fa:	78c2      	ldrb	r2, [r0, #3]
c0de51fc:	f810 3c02 	ldrb.w	r3, [r0, #-2]
c0de5200:	ea4c 2606 	orr.w	r6, ip, r6, lsl #8
c0de5204:	ea44 2202 	orr.w	r2, r4, r2, lsl #8
c0de5208:	ea46 4202 	orr.w	r2, r6, r2, lsl #16
c0de520c:	f002 faf8 	bl	c0de7800 <OUTLINED_FUNCTION_72>
c0de5210:	2204      	movs	r2, #4
c0de5212:	f002 f971 	bl	c0de74f8 <OUTLINED_FUNCTION_26>
c0de5216:	7801      	ldrb	r1, [r0, #0]
c0de5218:	f002 f8ee 	bl	c0de73f8 <OUTLINED_FUNCTION_14>
c0de521c:	3110      	adds	r1, #16
c0de521e:	75f9      	strb	r1, [r7, #23]
c0de5220:	0a09      	lsrs	r1, r1, #8
c0de5222:	7639      	strb	r1, [r7, #24]
c0de5224:	fa0f f18b 	sxth.w	r1, fp
c0de5228:	4281      	cmp	r1, r0
c0de522a:	bfd8      	it	le
c0de522c:	4683      	movle	fp, r0
c0de522e:	f8d8 0008 	ldr.w	r0, [r8, #8]
c0de5232:	f8cd a004 	str.w	sl, [sp, #4]
c0de5236:	b348      	cbz	r0, c0de528c <addListItem+0x284>
c0de5238:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de523c:	f002 f92e 	bl	c0de749c <OUTLINED_FUNCTION_21>
c0de5240:	4605      	mov	r5, r0
c0de5242:	9803      	ldr	r0, [sp, #12]
c0de5244:	77e8      	strb	r0, [r5, #31]
c0de5246:	f8d8 0008 	ldr.w	r0, [r8, #8]
c0de524a:	f006 fb1d 	bl	c0deb888 <pic>
c0de524e:	f002 f90e 	bl	c0de746e <OUTLINED_FUNCTION_19>
c0de5252:	9802      	ldr	r0, [sp, #8]
c0de5254:	f810 cf22 	ldrb.w	ip, [r0, #34]!
c0de5258:	7844      	ldrb	r4, [r0, #1]
c0de525a:	7886      	ldrb	r6, [r0, #2]
c0de525c:	78c2      	ldrb	r2, [r0, #3]
c0de525e:	f810 3c02 	ldrb.w	r3, [r0, #-2]
c0de5262:	ea4c 2404 	orr.w	r4, ip, r4, lsl #8
c0de5266:	ea46 2202 	orr.w	r2, r6, r2, lsl #8
c0de526a:	ea44 4202 	orr.w	r2, r4, r2, lsl #16
c0de526e:	f002 fac7 	bl	c0de7800 <OUTLINED_FUNCTION_72>
c0de5272:	2206      	movs	r2, #6
c0de5274:	f002 f940 	bl	c0de74f8 <OUTLINED_FUNCTION_26>
c0de5278:	7881      	ldrb	r1, [r0, #2]
c0de527a:	78c0      	ldrb	r0, [r0, #3]
c0de527c:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
c0de5280:	fa0f f08b 	sxth.w	r0, fp
c0de5284:	4288      	cmp	r0, r1
c0de5286:	bfc8      	it	gt
c0de5288:	4659      	movgt	r1, fp
c0de528a:	e028      	b.n	c0de52de <addListItem+0x2d6>
c0de528c:	f898 0000 	ldrb.w	r0, [r8]
c0de5290:	2801      	cmp	r0, #1
c0de5292:	d123      	bne.n	c0de52dc <addListItem+0x2d4>
c0de5294:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de5298:	f04f 0a06 	mov.w	sl, #6
c0de529c:	08c1      	lsrs	r1, r0, #3
c0de529e:	2006      	movs	r0, #6
c0de52a0:	f006 f911 	bl	c0deb4c6 <nbgl_objPoolGet>
c0de52a4:	0a39      	lsrs	r1, r7, #8
c0de52a6:	0e3a      	lsrs	r2, r7, #24
c0de52a8:	f880 a016 	strb.w	sl, [r0, #22]
c0de52ac:	74c1      	strb	r1, [r0, #19]
c0de52ae:	4601      	mov	r1, r0
c0de52b0:	f002 fa92 	bl	c0de77d8 <OUTLINED_FUNCTION_69>
c0de52b4:	9902      	ldr	r1, [sp, #8]
c0de52b6:	f002 f977 	bl	c0de75a8 <OUTLINED_FUNCTION_33>
c0de52ba:	2410      	movs	r4, #16
c0de52bc:	f842 0023 	str.w	r0, [r2, r3, lsl #2]
c0de52c0:	2200      	movs	r2, #0
c0de52c2:	75c4      	strb	r4, [r0, #23]
c0de52c4:	2402      	movs	r4, #2
c0de52c6:	7602      	strb	r2, [r0, #24]
c0de52c8:	77c2      	strb	r2, [r0, #31]
c0de52ca:	f898 2015 	ldrb.w	r2, [r8, #21]
c0de52ce:	f880 4020 	strb.w	r4, [r0, #32]
c0de52d2:	f880 2021 	strb.w	r2, [r0, #33]	@ 0x21
c0de52d6:	1c58      	adds	r0, r3, #1
c0de52d8:	f801 0c02 	strb.w	r0, [r1, #-2]
c0de52dc:	4659      	mov	r1, fp
c0de52de:	f8d8 0010 	ldr.w	r0, [r8, #16]
c0de52e2:	e9dd 5a01 	ldrd	r5, sl, [sp, #4]
c0de52e6:	2800      	cmp	r0, #0
c0de52e8:	d05c      	beq.n	c0de53a4 <addListItem+0x39c>
c0de52ea:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de52ee:	9100      	str	r1, [sp, #0]
c0de52f0:	2604      	movs	r6, #4
c0de52f2:	f001 ffb7 	bl	c0de7264 <OUTLINED_FUNCTION_0>
c0de52f6:	4604      	mov	r4, r0
c0de52f8:	9803      	ldr	r0, [sp, #12]
c0de52fa:	77e0      	strb	r0, [r4, #31]
c0de52fc:	f8d8 0010 	ldr.w	r0, [r8, #16]
c0de5300:	f006 fac2 	bl	c0deb888 <pic>
c0de5304:	4601      	mov	r1, r0
c0de5306:	200b      	movs	r0, #11
c0de5308:	2301      	movs	r3, #1
c0de530a:	f884 6020 	strb.w	r6, [r4, #32]
c0de530e:	75a6      	strb	r6, [r4, #22]
c0de5310:	f884 0022 	strb.w	r0, [r4, #34]	@ 0x22
c0de5314:	2001      	movs	r0, #1
c0de5316:	0e0a      	lsrs	r2, r1, #24
c0de5318:	f884 0024 	strb.w	r0, [r4, #36]	@ 0x24
c0de531c:	2000      	movs	r0, #0
c0de531e:	f884 0021 	strb.w	r0, [r4, #33]	@ 0x21
c0de5322:	4620      	mov	r0, r4
c0de5324:	f002 f861 	bl	c0de73ea <OUTLINED_FUNCTION_13>
c0de5328:	f884 0027 	strb.w	r0, [r4, #39]	@ 0x27
c0de532c:	f89a 2005 	ldrb.w	r2, [sl, #5]
c0de5330:	f89a 0004 	ldrb.w	r0, [sl, #4]
c0de5334:	7162      	strb	r2, [r4, #5]
c0de5336:	7120      	strb	r0, [r4, #4]
c0de5338:	ea40 2202 	orr.w	r2, r0, r2, lsl #8
c0de533c:	f002 f9a3 	bl	c0de7686 <OUTLINED_FUNCTION_43>
c0de5340:	4651      	mov	r1, sl
c0de5342:	46ac      	mov	ip, r5
c0de5344:	f811 bf22 	ldrb.w	fp, [r1, #34]!
c0de5348:	f811 8d1c 	ldrb.w	r8, [r1, #-28]!
c0de534c:	7f4d      	ldrb	r5, [r1, #29]
c0de534e:	7fce      	ldrb	r6, [r1, #31]
c0de5350:	7f8b      	ldrb	r3, [r1, #30]
c0de5352:	7e8a      	ldrb	r2, [r1, #26]
c0de5354:	f891 e001 	ldrb.w	lr, [r1, #1]
c0de5358:	ea43 2306 	orr.w	r3, r3, r6, lsl #8
c0de535c:	ea4b 2505 	orr.w	r5, fp, r5, lsl #8
c0de5360:	ea45 4303 	orr.w	r3, r5, r3, lsl #16
c0de5364:	2500      	movs	r5, #0
c0de5366:	f843 4022 	str.w	r4, [r3, r2, lsl #2]
c0de536a:	f100 030c 	add.w	r3, r0, #12
c0de536e:	3201      	adds	r2, #1
c0de5370:	eba5 0353 	sub.w	r3, r5, r3, lsr #1
c0de5374:	2502      	movs	r5, #2
c0de5376:	767b      	strb	r3, [r7, #25]
c0de5378:	0a1b      	lsrs	r3, r3, #8
c0de537a:	76bb      	strb	r3, [r7, #26]
c0de537c:	0a03      	lsrs	r3, r0, #8
c0de537e:	71a0      	strb	r0, [r4, #6]
c0de5380:	71e3      	strb	r3, [r4, #7]
c0de5382:	9b00      	ldr	r3, [sp, #0]
c0de5384:	b21b      	sxth	r3, r3
c0de5386:	330c      	adds	r3, #12
c0de5388:	fb93 f3f5 	sdiv	r3, r3, r5
c0de538c:	7663      	strb	r3, [r4, #25]
c0de538e:	768a      	strb	r2, [r1, #26]
c0de5390:	ea48 220e 	orr.w	r2, r8, lr, lsl #8
c0de5394:	0a1d      	lsrs	r5, r3, #8
c0de5396:	4410      	add	r0, r2
c0de5398:	76a5      	strb	r5, [r4, #26]
c0de539a:	4665      	mov	r5, ip
c0de539c:	300c      	adds	r0, #12
c0de539e:	7008      	strb	r0, [r1, #0]
c0de53a0:	0a00      	lsrs	r0, r0, #8
c0de53a2:	7048      	strb	r0, [r1, #1]
c0de53a4:	f8d5 00a0 	ldr.w	r0, [r5, #160]	@ 0xa0
c0de53a8:	f002 f8b6 	bl	c0de7518 <OUTLINED_FUNCTION_27>
c0de53ac:	f8d5 00a0 	ldr.w	r0, [r5, #160]	@ 0xa0
c0de53b0:	f001 ff5c 	bl	c0de726c <OUTLINED_FUNCTION_1>
c0de53b4:	4650      	mov	r0, sl
c0de53b6:	b004      	add	sp, #16
c0de53b8:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de53bc:	00001948 	.word	0x00001948

c0de53c0 <nbgl_layoutAddSwitch>:
c0de53c0:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de53c2:	b1d8      	cbz	r0, c0de53fc <nbgl_layoutAddSwitch+0x3c>
c0de53c4:	2200      	movs	r2, #0
c0de53c6:	e9cd 2201 	strd	r2, r2, [sp, #4]
c0de53ca:	f88d 2016 	strb.w	r2, [sp, #22]
c0de53ce:	2201      	movs	r2, #1
c0de53d0:	f88d 2000 	strb.w	r2, [sp]
c0de53d4:	e9d1 2300 	ldrd	r2, r3, [r1]
c0de53d8:	e9cd 2303 	strd	r2, r3, [sp, #12]
c0de53dc:	7a4a      	ldrb	r2, [r1, #9]
c0de53de:	f88d 2014 	strb.w	r2, [sp, #20]
c0de53e2:	7a8a      	ldrb	r2, [r1, #10]
c0de53e4:	7a09      	ldrb	r1, [r1, #8]
c0de53e6:	f88d 1015 	strb.w	r1, [sp, #21]
c0de53ea:	4669      	mov	r1, sp
c0de53ec:	f88d 2017 	strb.w	r2, [sp, #23]
c0de53f0:	f7ff fe0a 	bl	c0de5008 <addListItem>
c0de53f4:	b110      	cbz	r0, c0de53fc <nbgl_layoutAddSwitch+0x3c>
c0de53f6:	f002 f99c 	bl	c0de7732 <OUTLINED_FUNCTION_55>
c0de53fa:	e001      	b.n	c0de5400 <nbgl_layoutAddSwitch+0x40>
c0de53fc:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de5400:	b006      	add	sp, #24
c0de5402:	bd80      	pop	{r7, pc}

c0de5404 <nbgl_layoutAddText>:
c0de5404:	b5e0      	push	{r5, r6, r7, lr}
c0de5406:	2300      	movs	r3, #0
c0de5408:	e9cd 3300 	strd	r3, r3, [sp]
c0de540c:	2300      	movs	r3, #0
c0de540e:	f000 f801 	bl	c0de5414 <addText>
c0de5412:	bd8c      	pop	{r2, r3, r7, pc}

c0de5414 <addText>:
c0de5414:	2800      	cmp	r0, #0
c0de5416:	f000 8115 	beq.w	c0de5644 <addText+0x230>
c0de541a:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de541e:	4683      	mov	fp, r0
c0de5420:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de5424:	460c      	mov	r4, r1
c0de5426:	9e0d      	ldr	r6, [sp, #52]	@ 0x34
c0de5428:	461f      	mov	r7, r3
c0de542a:	9203      	str	r2, [sp, #12]
c0de542c:	f04f 0a01 	mov.w	sl, #1
c0de5430:	f002 f801 	bl	c0de7436 <OUTLINED_FUNCTION_16>
c0de5434:	4605      	mov	r5, r0
c0de5436:	2002      	movs	r0, #2
c0de5438:	2e00      	cmp	r6, #0
c0de543a:	bf18      	it	ne
c0de543c:	2003      	movne	r0, #3
c0de543e:	f89b 10ad 	ldrb.w	r1, [fp, #173]	@ 0xad
c0de5442:	f002 f9eb 	bl	c0de781c <OUTLINED_FUNCTION_74>
c0de5446:	21a0      	movs	r1, #160	@ 0xa0
c0de5448:	0e02      	lsrs	r2, r0, #24
c0de544a:	f04f 0800 	mov.w	r8, #0
c0de544e:	f885 a005 	strb.w	sl, [r5, #5]
c0de5452:	7129      	strb	r1, [r5, #4]
c0de5454:	4629      	mov	r1, r5
c0de5456:	f801 0f22 	strb.w	r0, [r1, #34]!
c0de545a:	70ca      	strb	r2, [r1, #3]
c0de545c:	0c02      	lsrs	r2, r0, #16
c0de545e:	0a00      	lsrs	r0, r0, #8
c0de5460:	2c00      	cmp	r4, #0
c0de5462:	708a      	strb	r2, [r1, #2]
c0de5464:	f885 0023 	strb.w	r0, [r5, #35]	@ 0x23
c0de5468:	f000 809f 	beq.w	c0de55aa <addText+0x196>
c0de546c:	f89b 00ad 	ldrb.w	r0, [fp, #173]	@ 0xad
c0de5470:	9701      	str	r7, [sp, #4]
c0de5472:	2604      	movs	r6, #4
c0de5474:	f001 fef6 	bl	c0de7264 <OUTLINED_FUNCTION_0>
c0de5478:	4607      	mov	r7, r0
c0de547a:	f880 801f 	strb.w	r8, [r0, #31]
c0de547e:	4620      	mov	r0, r4
c0de5480:	9402      	str	r4, [sp, #8]
c0de5482:	f006 fa01 	bl	c0deb888 <pic>
c0de5486:	4601      	mov	r1, r0
c0de5488:	201c      	movs	r0, #28
c0de548a:	9b0d      	ldr	r3, [sp, #52]	@ 0x34
c0de548c:	f887 a024 	strb.w	sl, [r7, #36]	@ 0x24
c0de5490:	f887 801a 	strb.w	r8, [r7, #26]
c0de5494:	f887 6020 	strb.w	r6, [r7, #32]
c0de5498:	f887 8021 	strb.w	r8, [r7, #33]	@ 0x21
c0de549c:	f887 8016 	strb.w	r8, [r7, #22]
c0de54a0:	7678      	strb	r0, [r7, #25]
c0de54a2:	200c      	movs	r0, #12
c0de54a4:	0e0a      	lsrs	r2, r1, #24
c0de54a6:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de54aa:	4638      	mov	r0, r7
c0de54ac:	469a      	mov	sl, r3
c0de54ae:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de54b2:	f002 f8f7 	bl	c0de76a4 <OUTLINED_FUNCTION_45>
c0de54b6:	796a      	ldrb	r2, [r5, #5]
c0de54b8:	7928      	ldrb	r0, [r5, #4]
c0de54ba:	7138      	strb	r0, [r7, #4]
c0de54bc:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de54c0:	717a      	strb	r2, [r7, #5]
c0de54c2:	b153      	cbz	r3, c0de54da <addText+0xc6>
c0de54c4:	4a71      	ldr	r2, [pc, #452]	@ (c0de568c <addText+0x278>)
c0de54c6:	447a      	add	r2, pc
c0de54c8:	7813      	ldrb	r3, [r2, #0]
c0de54ca:	7852      	ldrb	r2, [r2, #1]
c0de54cc:	ea43 2202 	orr.w	r2, r3, r2, lsl #8
c0de54d0:	1a80      	subs	r0, r0, r2
c0de54d2:	380c      	subs	r0, #12
c0de54d4:	0a02      	lsrs	r2, r0, #8
c0de54d6:	7138      	strb	r0, [r7, #4]
c0de54d8:	717a      	strb	r2, [r7, #5]
c0de54da:	b282      	uxth	r2, r0
c0de54dc:	200c      	movs	r0, #12
c0de54de:	2301      	movs	r3, #1
c0de54e0:	f006 f80a 	bl	c0deb4f8 <nbgl_getTextHeightInWidth>
c0de54e4:	4629      	mov	r1, r5
c0de54e6:	f811 cf22 	ldrb.w	ip, [r1, #34]!
c0de54ea:	784e      	ldrb	r6, [r1, #1]
c0de54ec:	788c      	ldrb	r4, [r1, #2]
c0de54ee:	78ca      	ldrb	r2, [r1, #3]
c0de54f0:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de54f4:	ea4c 2606 	orr.w	r6, ip, r6, lsl #8
c0de54f8:	ea44 2202 	orr.w	r2, r4, r2, lsl #8
c0de54fc:	ea46 4202 	orr.w	r2, r6, r2, lsl #16
c0de5500:	f842 7023 	str.w	r7, [r2, r3, lsl #2]
c0de5504:	0a02      	lsrs	r2, r0, #8
c0de5506:	71b8      	strb	r0, [r7, #6]
c0de5508:	71fa      	strb	r2, [r7, #7]
c0de550a:	1c5a      	adds	r2, r3, #1
c0de550c:	f801 2c02 	strb.w	r2, [r1, #-2]
c0de5510:	7e79      	ldrb	r1, [r7, #25]
c0de5512:	7eba      	ldrb	r2, [r7, #26]
c0de5514:	f1ba 0f00 	cmp.w	sl, #0
c0de5518:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de551c:	eb01 0800 	add.w	r8, r1, r0
c0de5520:	d042      	beq.n	c0de55a8 <addText+0x194>
c0de5522:	f89b 00ad 	ldrb.w	r0, [fp, #173]	@ 0xad
c0de5526:	f8dd a030 	ldr.w	sl, [sp, #48]	@ 0x30
c0de552a:	f001 ffb7 	bl	c0de749c <OUTLINED_FUNCTION_21>
c0de552e:	9a01      	ldr	r2, [sp, #4]
c0de5530:	4606      	mov	r6, r0
c0de5532:	4658      	mov	r0, fp
c0de5534:	4629      	mov	r1, r5
c0de5536:	2309      	movs	r3, #9
c0de5538:	f7fe fb72 	bl	c0de3c20 <layoutAddCallbackObj>
c0de553c:	4954      	ldr	r1, [pc, #336]	@ (c0de5690 <addText+0x27c>)
c0de553e:	4479      	add	r1, pc
c0de5540:	0a0a      	lsrs	r2, r1, #8
c0de5542:	0e0b      	lsrs	r3, r1, #24
c0de5544:	f886 2022 	strb.w	r2, [r6, #34]	@ 0x22
c0de5548:	0a3a      	lsrs	r2, r7, #8
c0de554a:	74f2      	strb	r2, [r6, #19]
c0de554c:	4632      	mov	r2, r6
c0de554e:	f802 1f21 	strb.w	r1, [r2, #33]!
c0de5552:	0c09      	lsrs	r1, r1, #16
c0de5554:	7091      	strb	r1, [r2, #2]
c0de5556:	4631      	mov	r1, r6
c0de5558:	70d3      	strb	r3, [r2, #3]
c0de555a:	0e3a      	lsrs	r2, r7, #24
c0de555c:	f002 f93c 	bl	c0de77d8 <OUTLINED_FUNCTION_69>
c0de5560:	4629      	mov	r1, r5
c0de5562:	f811 cf22 	ldrb.w	ip, [r1, #34]!
c0de5566:	784c      	ldrb	r4, [r1, #1]
c0de5568:	788f      	ldrb	r7, [r1, #2]
c0de556a:	78ca      	ldrb	r2, [r1, #3]
c0de556c:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de5570:	ea4c 2404 	orr.w	r4, ip, r4, lsl #8
c0de5574:	ea47 2202 	orr.w	r2, r7, r2, lsl #8
c0de5578:	ea44 4202 	orr.w	r2, r4, r2, lsl #16
c0de557c:	240c      	movs	r4, #12
c0de557e:	f842 6023 	str.w	r6, [r2, r3, lsl #2]
c0de5582:	2200      	movs	r2, #0
c0de5584:	75f4      	strb	r4, [r6, #23]
c0de5586:	f880 a005 	strb.w	sl, [r0, #5]
c0de558a:	2001      	movs	r0, #1
c0de558c:	75b4      	strb	r4, [r6, #22]
c0de558e:	7632      	strb	r2, [r6, #24]
c0de5590:	77f2      	strb	r2, [r6, #31]
c0de5592:	f801 0c06 	strb.w	r0, [r1, #-6]
c0de5596:	f10a 000f 	add.w	r0, sl, #15
c0de559a:	f801 2c05 	strb.w	r2, [r1, #-5]
c0de559e:	f801 0c04 	strb.w	r0, [r1, #-4]
c0de55a2:	1c58      	adds	r0, r3, #1
c0de55a4:	f801 0c02 	strb.w	r0, [r1, #-2]
c0de55a8:	9c02      	ldr	r4, [sp, #8]
c0de55aa:	9e03      	ldr	r6, [sp, #12]
c0de55ac:	2e00      	cmp	r6, #0
c0de55ae:	d04b      	beq.n	c0de5648 <addText+0x234>
c0de55b0:	f89b 00ad 	ldrb.w	r0, [fp, #173]	@ 0xad
c0de55b4:	f001 fe56 	bl	c0de7264 <OUTLINED_FUNCTION_0>
c0de55b8:	f04f 0a00 	mov.w	sl, #0
c0de55bc:	4607      	mov	r7, r0
c0de55be:	f880 a01f 	strb.w	sl, [r0, #31]
c0de55c2:	f002 f906 	bl	c0de77d2 <OUTLINED_FUNCTION_68>
c0de55c6:	4601      	mov	r1, r0
c0de55c8:	200b      	movs	r0, #11
c0de55ca:	2301      	movs	r3, #1
c0de55cc:	f887 a021 	strb.w	sl, [r7, #33]	@ 0x21
c0de55d0:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de55d4:	2001      	movs	r0, #1
c0de55d6:	0e0a      	lsrs	r2, r1, #24
c0de55d8:	f887 0024 	strb.w	r0, [r7, #36]	@ 0x24
c0de55dc:	4638      	mov	r0, r7
c0de55de:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de55e2:	f002 f85f 	bl	c0de76a4 <OUTLINED_FUNCTION_45>
c0de55e6:	796a      	ldrb	r2, [r5, #5]
c0de55e8:	7928      	ldrb	r0, [r5, #4]
c0de55ea:	717a      	strb	r2, [r7, #5]
c0de55ec:	7138      	strb	r0, [r7, #4]
c0de55ee:	ea40 2202 	orr.w	r2, r0, r2, lsl #8
c0de55f2:	f002 f848 	bl	c0de7686 <OUTLINED_FUNCTION_43>
c0de55f6:	210e      	movs	r1, #14
c0de55f8:	f887 a01a 	strb.w	sl, [r7, #26]
c0de55fc:	462a      	mov	r2, r5
c0de55fe:	2c00      	cmp	r4, #0
c0de5600:	bf08      	it	eq
c0de5602:	211a      	moveq	r1, #26
c0de5604:	7679      	strb	r1, [r7, #25]
c0de5606:	f887 a016 	strb.w	sl, [r7, #22]
c0de560a:	f812 cf22 	ldrb.w	ip, [r2, #34]!
c0de560e:	7856      	ldrb	r6, [r2, #1]
c0de5610:	f892 e002 	ldrb.w	lr, [r2, #2]
c0de5614:	78d3      	ldrb	r3, [r2, #3]
c0de5616:	f812 4c02 	ldrb.w	r4, [r2, #-2]
c0de561a:	ea4c 2606 	orr.w	r6, ip, r6, lsl #8
c0de561e:	ea4e 2303 	orr.w	r3, lr, r3, lsl #8
c0de5622:	ea46 4303 	orr.w	r3, r6, r3, lsl #16
c0de5626:	f843 7024 	str.w	r7, [r3, r4, lsl #2]
c0de562a:	2304      	movs	r3, #4
c0de562c:	71b8      	strb	r0, [r7, #6]
c0de562e:	f887 3020 	strb.w	r3, [r7, #32]
c0de5632:	0a03      	lsrs	r3, r0, #8
c0de5634:	4440      	add	r0, r8
c0de5636:	4408      	add	r0, r1
c0de5638:	71fb      	strb	r3, [r7, #7]
c0de563a:	1c63      	adds	r3, r4, #1
c0de563c:	f802 3c02 	strb.w	r3, [r2, #-2]
c0de5640:	301a      	adds	r0, #26
c0de5642:	e003      	b.n	c0de564c <addText+0x238>
c0de5644:	f001 bfca 	b.w	c0de75dc <OUTLINED_FUNCTION_35>
c0de5648:	f108 001c 	add.w	r0, r8, #28
c0de564c:	f8db 10a0 	ldr.w	r1, [fp, #160]	@ 0xa0
c0de5650:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de5654:	784c      	ldrb	r4, [r1, #1]
c0de5656:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de565a:	788e      	ldrb	r6, [r1, #2]
c0de565c:	78c9      	ldrb	r1, [r1, #3]
c0de565e:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de5662:	ea46 2101 	orr.w	r1, r6, r1, lsl #8
c0de5666:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de566a:	2220      	movs	r2, #32
c0de566c:	f841 5023 	str.w	r5, [r1, r3, lsl #2]
c0de5670:	2100      	movs	r1, #0
c0de5672:	71a8      	strb	r0, [r5, #6]
c0de5674:	75ea      	strb	r2, [r5, #23]
c0de5676:	7629      	strb	r1, [r5, #24]
c0de5678:	77e9      	strb	r1, [r5, #31]
c0de567a:	75a9      	strb	r1, [r5, #22]
c0de567c:	0a01      	lsrs	r1, r0, #8
c0de567e:	b280      	uxth	r0, r0
c0de5680:	71e9      	strb	r1, [r5, #7]
c0de5682:	f8db 10a0 	ldr.w	r1, [fp, #160]	@ 0xa0
c0de5686:	f002 b84c 	b.w	c0de7722 <OUTLINED_FUNCTION_54>
c0de568a:	bf00      	nop
c0de568c:	000077d2 	.word	0x000077d2
c0de5690:	00007495 	.word	0x00007495

c0de5694 <nbgl_layoutAddTextWithAlias>:
c0de5694:	b51c      	push	{r2, r3, r4, lr}
c0de5696:	2401      	movs	r4, #1
c0de5698:	9401      	str	r4, [sp, #4]
c0de569a:	9c04      	ldr	r4, [sp, #16]
c0de569c:	9400      	str	r4, [sp, #0]
c0de569e:	f7ff feb9 	bl	c0de5414 <addText>
c0de56a2:	bd1c      	pop	{r2, r3, r4, pc}

c0de56a4 <nbgl_layoutAddTextContent>:
c0de56a4:	2800      	cmp	r0, #0
c0de56a6:	f000 80b5 	beq.w	c0de5814 <nbgl_layoutAddTextContent+0x170>
c0de56aa:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de56ae:	4682      	mov	sl, r0
c0de56b0:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de56b4:	4e58      	ldr	r6, [pc, #352]	@ (c0de5818 <nbgl_layoutAddTextContent+0x174>)
c0de56b6:	460d      	mov	r5, r1
c0de56b8:	e9cd 2302 	strd	r2, r3, [sp, #8]
c0de56bc:	08c1      	lsrs	r1, r0, #3
c0de56be:	447e      	add	r6, pc
c0de56c0:	2004      	movs	r0, #4
c0de56c2:	47b0      	blx	r6
c0de56c4:	f04f 0b00 	mov.w	fp, #0
c0de56c8:	4607      	mov	r7, r0
c0de56ca:	f880 b01f 	strb.w	fp, [r0, #31]
c0de56ce:	4628      	mov	r0, r5
c0de56d0:	4c52      	ldr	r4, [pc, #328]	@ (c0de581c <nbgl_layoutAddTextContent+0x178>)
c0de56d2:	447c      	add	r4, pc
c0de56d4:	47a0      	blx	r4
c0de56d6:	4601      	mov	r1, r0
c0de56d8:	2010      	movs	r0, #16
c0de56da:	2201      	movs	r2, #1
c0de56dc:	9401      	str	r4, [sp, #4]
c0de56de:	f887 b01a 	strb.w	fp, [r7, #26]
c0de56e2:	f887 b018 	strb.w	fp, [r7, #24]
c0de56e6:	f887 b021 	strb.w	fp, [r7, #33]	@ 0x21
c0de56ea:	f887 b016 	strb.w	fp, [r7, #22]
c0de56ee:	2301      	movs	r3, #1
c0de56f0:	46a0      	mov	r8, r4
c0de56f2:	7678      	strb	r0, [r7, #25]
c0de56f4:	2020      	movs	r0, #32
c0de56f6:	717a      	strb	r2, [r7, #5]
c0de56f8:	f887 2024 	strb.w	r2, [r7, #36]	@ 0x24
c0de56fc:	0e0a      	lsrs	r2, r1, #24
c0de56fe:	75f8      	strb	r0, [r7, #23]
c0de5700:	20a0      	movs	r0, #160	@ 0xa0
c0de5702:	7138      	strb	r0, [r7, #4]
c0de5704:	200d      	movs	r0, #13
c0de5706:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de570a:	2004      	movs	r0, #4
c0de570c:	f887 0020 	strb.w	r0, [r7, #32]
c0de5710:	4638      	mov	r0, r7
c0de5712:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de5716:	70c2      	strb	r2, [r0, #3]
c0de5718:	0c0a      	lsrs	r2, r1, #16
c0de571a:	7082      	strb	r2, [r0, #2]
c0de571c:	0a08      	lsrs	r0, r1, #8
c0de571e:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de5722:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de5726:	200d      	movs	r0, #13
c0de5728:	4d3d      	ldr	r5, [pc, #244]	@ (c0de5820 <nbgl_layoutAddTextContent+0x17c>)
c0de572a:	447d      	add	r5, pc
c0de572c:	47a8      	blx	r5
c0de572e:	f8da 10a0 	ldr.w	r1, [sl, #160]	@ 0xa0
c0de5732:	f001 fecc 	bl	c0de74ce <OUTLINED_FUNCTION_24>
c0de5736:	71b8      	strb	r0, [r7, #6]
c0de5738:	0a00      	lsrs	r0, r0, #8
c0de573a:	71f8      	strb	r0, [r7, #7]
c0de573c:	f001 ff42 	bl	c0de75c4 <OUTLINED_FUNCTION_34>
c0de5740:	4607      	mov	r7, r0
c0de5742:	f880 b01f 	strb.w	fp, [r0, #31]
c0de5746:	9802      	ldr	r0, [sp, #8]
c0de5748:	47c0      	blx	r8
c0de574a:	4601      	mov	r1, r0
c0de574c:	2001      	movs	r0, #1
c0de574e:	22a0      	movs	r2, #160	@ 0xa0
c0de5750:	2301      	movs	r3, #1
c0de5752:	f04f 0801 	mov.w	r8, #1
c0de5756:	f887 b021 	strb.w	fp, [r7, #33]	@ 0x21
c0de575a:	713a      	strb	r2, [r7, #4]
c0de575c:	220b      	movs	r2, #11
c0de575e:	7178      	strb	r0, [r7, #5]
c0de5760:	f887 0024 	strb.w	r0, [r7, #36]	@ 0x24
c0de5764:	4638      	mov	r0, r7
c0de5766:	f887 2022 	strb.w	r2, [r7, #34]	@ 0x22
c0de576a:	f001 ffc6 	bl	c0de76fa <OUTLINED_FUNCTION_52>
c0de576e:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de5772:	200b      	movs	r0, #11
c0de5774:	47a8      	blx	r5
c0de5776:	f8da 10a0 	ldr.w	r1, [sl, #160]	@ 0xa0
c0de577a:	f887 b01a 	strb.w	fp, [r7, #26]
c0de577e:	f887 b018 	strb.w	fp, [r7, #24]
c0de5782:	f887 b016 	strb.w	fp, [r7, #22]
c0de5786:	f001 fea2 	bl	c0de74ce <OUTLINED_FUNCTION_24>
c0de578a:	2104      	movs	r1, #4
c0de578c:	71b8      	strb	r0, [r7, #6]
c0de578e:	0a00      	lsrs	r0, r0, #8
c0de5790:	f887 1020 	strb.w	r1, [r7, #32]
c0de5794:	2118      	movs	r1, #24
c0de5796:	71f8      	strb	r0, [r7, #7]
c0de5798:	7679      	strb	r1, [r7, #25]
c0de579a:	2120      	movs	r1, #32
c0de579c:	75f9      	strb	r1, [r7, #23]
c0de579e:	f001 ff11 	bl	c0de75c4 <OUTLINED_FUNCTION_34>
c0de57a2:	4606      	mov	r6, r0
c0de57a4:	f880 801f 	strb.w	r8, [r0, #31]
c0de57a8:	9803      	ldr	r0, [sp, #12]
c0de57aa:	9901      	ldr	r1, [sp, #4]
c0de57ac:	4788      	blx	r1
c0de57ae:	4601      	mov	r1, r0
c0de57b0:	20a0      	movs	r0, #160	@ 0xa0
c0de57b2:	2301      	movs	r3, #1
c0de57b4:	f886 8005 	strb.w	r8, [r6, #5]
c0de57b8:	f886 8024 	strb.w	r8, [r6, #36]	@ 0x24
c0de57bc:	f886 b021 	strb.w	fp, [r6, #33]	@ 0x21
c0de57c0:	7130      	strb	r0, [r6, #4]
c0de57c2:	200b      	movs	r0, #11
c0de57c4:	0e0a      	lsrs	r2, r1, #24
c0de57c6:	f001 fec9 	bl	c0de755c <OUTLINED_FUNCTION_30>
c0de57ca:	47a8      	blx	r5
c0de57cc:	f8da 10a0 	ldr.w	r1, [sl, #160]	@ 0xa0
c0de57d0:	f886 b01a 	strb.w	fp, [r6, #26]
c0de57d4:	f886 b018 	strb.w	fp, [r6, #24]
c0de57d8:	f001 fdb0 	bl	c0de733c <OUTLINED_FUNCTION_8>
c0de57dc:	f841 6023 	str.w	r6, [r1, r3, lsl #2]
c0de57e0:	2128      	movs	r1, #40	@ 0x28
c0de57e2:	71b0      	strb	r0, [r6, #6]
c0de57e4:	0a00      	lsrs	r0, r0, #8
c0de57e6:	7671      	strb	r1, [r6, #25]
c0de57e8:	2120      	movs	r1, #32
c0de57ea:	71f0      	strb	r0, [r6, #7]
c0de57ec:	75f1      	strb	r1, [r6, #23]
c0de57ee:	2104      	movs	r1, #4
c0de57f0:	f8da 00a0 	ldr.w	r0, [sl, #160]	@ 0xa0
c0de57f4:	f886 1020 	strb.w	r1, [r6, #32]
c0de57f8:	2107      	movs	r1, #7
c0de57fa:	75b1      	strb	r1, [r6, #22]
c0de57fc:	f890 3020 	ldrb.w	r3, [r0, #32]
c0de5800:	7981      	ldrb	r1, [r0, #6]
c0de5802:	79c2      	ldrb	r2, [r0, #7]
c0de5804:	3301      	adds	r3, #1
c0de5806:	f880 3020 	strb.w	r3, [r0, #32]
c0de580a:	ea41 2002 	orr.w	r0, r1, r2, lsl #8
c0de580e:	b004      	add	sp, #16
c0de5810:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de5814:	f001 bee2 	b.w	c0de75dc <OUTLINED_FUNCTION_35>
c0de5818:	00005e05 	.word	0x00005e05
c0de581c:	000061b3 	.word	0x000061b3
c0de5820:	00005dcb 	.word	0x00005dcb

c0de5824 <nbgl_layoutAddRadioChoice>:
c0de5824:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de5828:	2800      	cmp	r0, #0
c0de582a:	f000 8102 	beq.w	c0de5a32 <nbgl_layoutAddRadioChoice+0x20e>
c0de582e:	4605      	mov	r5, r0
c0de5830:	4884      	ldr	r0, [pc, #528]	@ (c0de5a44 <nbgl_layoutAddRadioChoice+0x220>)
c0de5832:	468a      	mov	sl, r1
c0de5834:	f04f 0800 	mov.w	r8, #0
c0de5838:	e9cd 1501 	strd	r1, r5, [sp, #4]
c0de583c:	4478      	add	r0, pc
c0de583e:	9003      	str	r0, [sp, #12]
c0de5840:	f89a 0005 	ldrb.w	r0, [sl, #5]
c0de5844:	4580      	cmp	r8, r0
c0de5846:	f080 80f7 	bcs.w	c0de5a38 <nbgl_layoutAddRadioChoice+0x214>
c0de584a:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de584e:	9c03      	ldr	r4, [sp, #12]
c0de5850:	08c1      	lsrs	r1, r0, #3
c0de5852:	2001      	movs	r0, #1
c0de5854:	47a0      	blx	r4
c0de5856:	4606      	mov	r6, r0
c0de5858:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de585c:	08c1      	lsrs	r1, r0, #3
c0de585e:	2004      	movs	r0, #4
c0de5860:	47a0      	blx	r4
c0de5862:	4607      	mov	r7, r0
c0de5864:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de5868:	08c1      	lsrs	r1, r0, #3
c0de586a:	2009      	movs	r0, #9
c0de586c:	47a0      	blx	r4
c0de586e:	f89a 2007 	ldrb.w	r2, [sl, #7]
c0de5872:	f89a 3008 	ldrb.w	r3, [sl, #8]
c0de5876:	4604      	mov	r4, r0
c0de5878:	4628      	mov	r0, r5
c0de587a:	f001 fe0c 	bl	c0de7496 <OUTLINED_FUNCTION_20>
c0de587e:	2800      	cmp	r0, #0
c0de5880:	f000 80d7 	beq.w	c0de5a32 <nbgl_layoutAddRadioChoice+0x20e>
c0de5884:	2002      	movs	r0, #2
c0de5886:	f886 0020 	strb.w	r0, [r6, #32]
c0de588a:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de588e:	08c1      	lsrs	r1, r0, #3
c0de5890:	2002      	movs	r0, #2
c0de5892:	f005 fe1d 	bl	c0deb4d0 <nbgl_containerPoolGet>
c0de5896:	2300      	movs	r3, #0
c0de5898:	ea4f 2c16 	mov.w	ip, r6, lsr #8
c0de589c:	4631      	mov	r1, r6
c0de589e:	0e02      	lsrs	r2, r0, #24
c0de58a0:	4655      	mov	r5, sl
c0de58a2:	ea4f 6a16 	mov.w	sl, r6, lsr #24
c0de58a6:	ea4f 4b16 	mov.w	fp, r6, lsr #16
c0de58aa:	74f3      	strb	r3, [r6, #19]
c0de58ac:	f884 c013 	strb.w	ip, [r4, #19]
c0de58b0:	f801 0f22 	strb.w	r0, [r1, #34]!
c0de58b4:	70ca      	strb	r2, [r1, #3]
c0de58b6:	0c02      	lsrs	r2, r0, #16
c0de58b8:	708a      	strb	r2, [r1, #2]
c0de58ba:	0a01      	lsrs	r1, r0, #8
c0de58bc:	f886 1023 	strb.w	r1, [r6, #35]	@ 0x23
c0de58c0:	4631      	mov	r1, r6
c0de58c2:	f801 3f12 	strb.w	r3, [r1, #18]!
c0de58c6:	70cb      	strb	r3, [r1, #3]
c0de58c8:	708b      	strb	r3, [r1, #2]
c0de58ca:	4621      	mov	r1, r4
c0de58cc:	f801 6f12 	strb.w	r6, [r1, #18]!
c0de58d0:	f881 b002 	strb.w	fp, [r1, #2]
c0de58d4:	f881 a003 	strb.w	sl, [r1, #3]
c0de58d8:	2120      	movs	r1, #32
c0de58da:	7633      	strb	r3, [r6, #24]
c0de58dc:	71f3      	strb	r3, [r6, #7]
c0de58de:	75b3      	strb	r3, [r6, #22]
c0de58e0:	75f1      	strb	r1, [r6, #23]
c0de58e2:	215c      	movs	r1, #92	@ 0x5c
c0de58e4:	71b1      	strb	r1, [r6, #6]
c0de58e6:	2101      	movs	r1, #1
c0de58e8:	7171      	strb	r1, [r6, #5]
c0de58ea:	21a0      	movs	r1, #160	@ 0xa0
c0de58ec:	7131      	strb	r1, [r6, #4]
c0de58ee:	2102      	movs	r1, #2
c0de58f0:	6044      	str	r4, [r0, #4]
c0de58f2:	77e3      	strb	r3, [r4, #31]
c0de58f4:	f884 3021 	strb.w	r3, [r4, #33]	@ 0x21
c0de58f8:	7928      	ldrb	r0, [r5, #4]
c0de58fa:	f884 1020 	strb.w	r1, [r4, #32]
c0de58fe:	2106      	movs	r1, #6
c0de5900:	75a1      	strb	r1, [r4, #22]
c0de5902:	b110      	cbz	r0, c0de590a <nbgl_layoutAddRadioChoice+0xe6>
c0de5904:	f44f 70d0 	mov.w	r0, #416	@ 0x1a0
c0de5908:	e014      	b.n	c0de5934 <nbgl_layoutAddRadioChoice+0x110>
c0de590a:	6828      	ldr	r0, [r5, #0]
c0de590c:	4665      	mov	r5, ip
c0de590e:	f850 0028 	ldr.w	r0, [r0, r8, lsl #2]
c0de5912:	f005 ffb9 	bl	c0deb888 <pic>
c0de5916:	4639      	mov	r1, r7
c0de5918:	0e02      	lsrs	r2, r0, #24
c0de591a:	46ac      	mov	ip, r5
c0de591c:	9d01      	ldr	r5, [sp, #4]
c0de591e:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de5922:	70ca      	strb	r2, [r1, #3]
c0de5924:	0c02      	lsrs	r2, r0, #16
c0de5926:	0a00      	lsrs	r0, r0, #8
c0de5928:	708a      	strb	r2, [r1, #2]
c0de592a:	7048      	strb	r0, [r1, #1]
c0de592c:	7930      	ldrb	r0, [r6, #4]
c0de592e:	7971      	ldrb	r1, [r6, #5]
c0de5930:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de5934:	4639      	mov	r1, r7
c0de5936:	f887 c013 	strb.w	ip, [r7, #19]
c0de593a:	4632      	mov	r2, r6
c0de593c:	3828      	subs	r0, #40	@ 0x28
c0de593e:	f801 6f12 	strb.w	r6, [r1, #18]!
c0de5942:	f881 b002 	strb.w	fp, [r1, #2]
c0de5946:	f881 a003 	strb.w	sl, [r1, #3]
c0de594a:	f04f 0b00 	mov.w	fp, #0
c0de594e:	46aa      	mov	sl, r5
c0de5950:	f896 1023 	ldrb.w	r1, [r6, #35]	@ 0x23
c0de5954:	f812 3f22 	ldrb.w	r3, [r2, #34]!
c0de5958:	f886 b01d 	strb.w	fp, [r6, #29]
c0de595c:	f001 ff61 	bl	c0de7822 <OUTLINED_FUNCTION_75>
c0de5960:	4b37      	ldr	r3, [pc, #220]	@ (c0de5a40 <nbgl_layoutAddRadioChoice+0x21c>)
c0de5962:	ea41 4102 	orr.w	r1, r1, r2, lsl #16
c0de5966:	600f      	str	r7, [r1, #0]
c0de5968:	f819 1003 	ldrb.w	r1, [r9, r3]
c0de596c:	1c4a      	adds	r2, r1, #1
c0de596e:	3114      	adds	r1, #20
c0de5970:	f809 2003 	strb.w	r2, [r9, r3]
c0de5974:	2201      	movs	r2, #1
c0de5976:	77b1      	strb	r1, [r6, #30]
c0de5978:	2104      	movs	r1, #4
c0de597a:	7732      	strb	r2, [r6, #28]
c0de597c:	f887 b021 	strb.w	fp, [r7, #33]	@ 0x21
c0de5980:	f887 1020 	strb.w	r1, [r7, #32]
c0de5984:	75b9      	strb	r1, [r7, #22]
c0de5986:	79aa      	ldrb	r2, [r5, #6]
c0de5988:	eba8 0302 	sub.w	r3, r8, r2
c0de598c:	fab3 f383 	clz	r3, r3
c0de5990:	095b      	lsrs	r3, r3, #5
c0de5992:	f884 3021 	strb.w	r3, [r4, #33]	@ 0x21
c0de5996:	7138      	strb	r0, [r7, #4]
c0de5998:	0a00      	lsrs	r0, r0, #8
c0de599a:	7178      	strb	r0, [r7, #5]
c0de599c:	ebb8 0002 	subs.w	r0, r8, r2
c0de59a0:	bf18      	it	ne
c0de59a2:	2001      	movne	r0, #1
c0de59a4:	77f8      	strb	r0, [r7, #31]
c0de59a6:	4590      	cmp	r8, r2
c0de59a8:	f04f 000b 	mov.w	r0, #11
c0de59ac:	bf08      	it	eq
c0de59ae:	200c      	moveq	r0, #12
c0de59b0:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de59b4:	f005 fd96 	bl	c0deb4e4 <nbgl_getFontHeight>
c0de59b8:	9d02      	ldr	r5, [sp, #8]
c0de59ba:	f887 b007 	strb.w	fp, [r7, #7]
c0de59be:	71b8      	strb	r0, [r7, #6]
c0de59c0:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de59c4:	08c0      	lsrs	r0, r0, #3
c0de59c6:	f000 f83f 	bl	c0de5a48 <createHorizontalLine>
c0de59ca:	f8d5 10a0 	ldr.w	r1, [r5, #160]	@ 0xa0
c0de59ce:	f108 0801 	add.w	r8, r8, #1
c0de59d2:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de59d6:	784c      	ldrb	r4, [r1, #1]
c0de59d8:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de59dc:	788f      	ldrb	r7, [r1, #2]
c0de59de:	78c9      	ldrb	r1, [r1, #3]
c0de59e0:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de59e4:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de59e8:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de59ec:	f841 6023 	str.w	r6, [r1, r3, lsl #2]
c0de59f0:	f8d5 10a0 	ldr.w	r1, [r5, #160]	@ 0xa0
c0de59f4:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de59f8:	784b      	ldrb	r3, [r1, #1]
c0de59fa:	788c      	ldrb	r4, [r1, #2]
c0de59fc:	78ce      	ldrb	r6, [r1, #3]
c0de59fe:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de5a02:	ea44 2306 	orr.w	r3, r4, r6, lsl #8
c0de5a06:	ea42 4203 	orr.w	r2, r2, r3, lsl #16
c0de5a0a:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de5a0e:	3301      	adds	r3, #1
c0de5a10:	f801 3c02 	strb.w	r3, [r1, #-2]
c0de5a14:	21ff      	movs	r1, #255	@ 0xff
c0de5a16:	b2dc      	uxtb	r4, r3
c0de5a18:	7681      	strb	r1, [r0, #26]
c0de5a1a:	21fc      	movs	r1, #252	@ 0xfc
c0de5a1c:	f842 0024 	str.w	r0, [r2, r4, lsl #2]
c0de5a20:	7641      	strb	r1, [r0, #25]
c0de5a22:	2103      	movs	r1, #3
c0de5a24:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de5a28:	f8d5 00a0 	ldr.w	r0, [r5, #160]	@ 0xa0
c0de5a2c:	f001 fc1e 	bl	c0de726c <OUTLINED_FUNCTION_1>
c0de5a30:	e706      	b.n	c0de5840 <nbgl_layoutAddRadioChoice+0x1c>
c0de5a32:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de5a36:	e000      	b.n	c0de5a3a <nbgl_layoutAddRadioChoice+0x216>
c0de5a38:	2000      	movs	r0, #0
c0de5a3a:	b004      	add	sp, #16
c0de5a3c:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de5a40:	00001948 	.word	0x00001948
c0de5a44:	00005c87 	.word	0x00005c87

c0de5a48 <createHorizontalLine>:
c0de5a48:	b580      	push	{r7, lr}
c0de5a4a:	4601      	mov	r1, r0
c0de5a4c:	2003      	movs	r0, #3
c0de5a4e:	f005 fd3a 	bl	c0deb4c6 <nbgl_objPoolGet>
c0de5a52:	2100      	movs	r1, #0
c0de5a54:	22e0      	movs	r2, #224	@ 0xe0
c0de5a56:	71c1      	strb	r1, [r0, #7]
c0de5a58:	2104      	movs	r1, #4
c0de5a5a:	7102      	strb	r2, [r0, #4]
c0de5a5c:	2202      	movs	r2, #2
c0de5a5e:	7181      	strb	r1, [r0, #6]
c0de5a60:	2101      	movs	r1, #1
c0de5a62:	f880 2020 	strb.w	r2, [r0, #32]
c0de5a66:	7141      	strb	r1, [r0, #5]
c0de5a68:	f880 1021 	strb.w	r1, [r0, #33]	@ 0x21
c0de5a6c:	77c1      	strb	r1, [r0, #31]
c0de5a6e:	bd80      	pop	{r7, pc}

c0de5a70 <nbgl_layoutAddCenteredInfo>:
c0de5a70:	b570      	push	{r4, r5, r6, lr}
c0de5a72:	b08a      	sub	sp, #40	@ 0x28
c0de5a74:	ae01      	add	r6, sp, #4
c0de5a76:	460c      	mov	r4, r1
c0de5a78:	4605      	mov	r5, r0
c0de5a7a:	2124      	movs	r1, #36	@ 0x24
c0de5a7c:	4630      	mov	r0, r6
c0de5a7e:	f006 fa0b 	bl	c0debe98 <__aeabi_memclr>
c0de5a82:	b33d      	cbz	r5, c0de5ad4 <nbgl_layoutAddCenteredInfo+0x64>
c0de5a84:	6820      	ldr	r0, [r4, #0]
c0de5a86:	68e1      	ldr	r1, [r4, #12]
c0de5a88:	9102      	str	r1, [sp, #8]
c0de5a8a:	b128      	cbz	r0, c0de5a98 <nbgl_layoutAddCenteredInfo+0x28>
c0de5a8c:	7c61      	ldrb	r1, [r4, #17]
c0de5a8e:	2210      	movs	r2, #16
c0de5a90:	2903      	cmp	r1, #3
c0de5a92:	bf08      	it	eq
c0de5a94:	2214      	moveq	r2, #20
c0de5a96:	50b0      	str	r0, [r6, r2]
c0de5a98:	6860      	ldr	r0, [r4, #4]
c0de5a9a:	b128      	cbz	r0, c0de5aa8 <nbgl_layoutAddCenteredInfo+0x38>
c0de5a9c:	7c61      	ldrb	r1, [r4, #17]
c0de5a9e:	2218      	movs	r2, #24
c0de5aa0:	2901      	cmp	r1, #1
c0de5aa2:	bf08      	it	eq
c0de5aa4:	2214      	moveq	r2, #20
c0de5aa6:	50b0      	str	r0, [r6, r2]
c0de5aa8:	68a0      	ldr	r0, [r4, #8]
c0de5aaa:	b128      	cbz	r0, c0de5ab8 <nbgl_layoutAddCenteredInfo+0x48>
c0de5aac:	7c61      	ldrb	r1, [r4, #17]
c0de5aae:	2218      	movs	r2, #24
c0de5ab0:	2902      	cmp	r1, #2
c0de5ab2:	bf08      	it	eq
c0de5ab4:	221c      	moveq	r2, #28
c0de5ab6:	50b0      	str	r0, [r6, r2]
c0de5ab8:	a901      	add	r1, sp, #4
c0de5aba:	4628      	mov	r0, r5
c0de5abc:	f000 f816 	bl	c0de5aec <addContentCenter>
c0de5ac0:	7c21      	ldrb	r1, [r4, #16]
c0de5ac2:	b151      	cbz	r1, c0de5ada <nbgl_layoutAddCenteredInfo+0x6a>
c0de5ac4:	2100      	movs	r1, #0
c0de5ac6:	2220      	movs	r2, #32
c0de5ac8:	7601      	strb	r1, [r0, #24]
c0de5aca:	75c2      	strb	r2, [r0, #23]
c0de5acc:	7581      	strb	r1, [r0, #22]
c0de5ace:	8a61      	ldrh	r1, [r4, #18]
c0de5ad0:	3120      	adds	r1, #32
c0de5ad2:	e003      	b.n	c0de5adc <nbgl_layoutAddCenteredInfo+0x6c>
c0de5ad4:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de5ad8:	e005      	b.n	c0de5ae6 <nbgl_layoutAddCenteredInfo+0x76>
c0de5ada:	8a61      	ldrh	r1, [r4, #18]
c0de5adc:	7641      	strb	r1, [r0, #25]
c0de5ade:	0a09      	lsrs	r1, r1, #8
c0de5ae0:	7681      	strb	r1, [r0, #26]
c0de5ae2:	f001 fe26 	bl	c0de7732 <OUTLINED_FUNCTION_55>
c0de5ae6:	b00a      	add	sp, #40	@ 0x28
c0de5ae8:	bd70      	pop	{r4, r5, r6, pc}
	...

c0de5aec <addContentCenter>:
c0de5aec:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de5af0:	4606      	mov	r6, r0
c0de5af2:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de5af6:	468b      	mov	fp, r1
c0de5af8:	f001 fc9d 	bl	c0de7436 <OUTLINED_FUNCTION_16>
c0de5afc:	2400      	movs	r4, #0
c0de5afe:	4680      	mov	r8, r0
c0de5b00:	f880 4020 	strb.w	r4, [r0, #32]
c0de5b04:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de5b08:	08c1      	lsrs	r1, r0, #3
c0de5b0a:	2006      	movs	r0, #6
c0de5b0c:	f005 fce0 	bl	c0deb4d0 <nbgl_containerPoolGet>
c0de5b10:	4641      	mov	r1, r8
c0de5b12:	0e02      	lsrs	r2, r0, #24
c0de5b14:	f801 0f22 	strb.w	r0, [r1, #34]!
c0de5b18:	f001 fdd2 	bl	c0de76c0 <OUTLINED_FUNCTION_47>
c0de5b1c:	f888 0023 	strb.w	r0, [r8, #35]	@ 0x23
c0de5b20:	f8db 0004 	ldr.w	r0, [fp, #4]
c0de5b24:	2800      	cmp	r0, #0
c0de5b26:	d079      	beq.n	c0de5c1c <addContentCenter+0x130>
c0de5b28:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de5b2c:	f001 fcb6 	bl	c0de749c <OUTLINED_FUNCTION_21>
c0de5b30:	4607      	mov	r7, r0
c0de5b32:	77c4      	strb	r4, [r0, #31]
c0de5b34:	f8db 0004 	ldr.w	r0, [fp, #4]
c0de5b38:	f005 fea6 	bl	c0deb888 <pic>
c0de5b3c:	4639      	mov	r1, r7
c0de5b3e:	0e02      	lsrs	r2, r0, #24
c0de5b40:	46b2      	mov	sl, r6
c0de5b42:	f801 0f21 	strb.w	r0, [r1, #33]!
c0de5b46:	70ca      	strb	r2, [r1, #3]
c0de5b48:	0c02      	lsrs	r2, r0, #16
c0de5b4a:	708a      	strb	r2, [r1, #2]
c0de5b4c:	0a01      	lsrs	r1, r0, #8
c0de5b4e:	f887 1022 	strb.w	r1, [r7, #34]	@ 0x22
c0de5b52:	4641      	mov	r1, r8
c0de5b54:	f001 fd28 	bl	c0de75a8 <OUTLINED_FUNCTION_33>
c0de5b58:	f842 7023 	str.w	r7, [r2, r3, lsl #2]
c0de5b5c:	2202      	movs	r2, #2
c0de5b5e:	3301      	adds	r3, #1
c0de5b60:	75ba      	strb	r2, [r7, #22]
c0de5b62:	f8bb 2020 	ldrh.w	r2, [fp, #32]
c0de5b66:	767a      	strb	r2, [r7, #25]
c0de5b68:	f801 3c02 	strb.w	r3, [r1, #-2]
c0de5b6c:	0a14      	lsrs	r4, r2, #8
c0de5b6e:	7881      	ldrb	r1, [r0, #2]
c0de5b70:	78c0      	ldrb	r0, [r0, #3]
c0de5b72:	76bc      	strb	r4, [r7, #26]
c0de5b74:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de5b78:	4410      	add	r0, r2
c0de5b7a:	9000      	str	r0, [sp, #0]
c0de5b7c:	f89b 0000 	ldrb.w	r0, [fp]
c0de5b80:	2801      	cmp	r0, #1
c0de5b82:	d146      	bne.n	c0de5c12 <addContentCenter+0x126>
c0de5b84:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de5b88:	f001 fc88 	bl	c0de749c <OUTLINED_FUNCTION_21>
c0de5b8c:	4604      	mov	r4, r0
c0de5b8e:	2000      	movs	r0, #0
c0de5b90:	77e0      	strb	r0, [r4, #31]
c0de5b92:	f8db 0008 	ldr.w	r0, [fp, #8]
c0de5b96:	6800      	ldr	r0, [r0, #0]
c0de5b98:	6800      	ldr	r0, [r0, #0]
c0de5b9a:	f005 fe75 	bl	c0deb888 <pic>
c0de5b9e:	4621      	mov	r1, r4
c0de5ba0:	0e02      	lsrs	r2, r0, #24
c0de5ba2:	f801 0f21 	strb.w	r0, [r1, #33]!
c0de5ba6:	70ca      	strb	r2, [r1, #3]
c0de5ba8:	0c02      	lsrs	r2, r0, #16
c0de5baa:	0a00      	lsrs	r0, r0, #8
c0de5bac:	f884 0022 	strb.w	r0, [r4, #34]	@ 0x22
c0de5bb0:	708a      	strb	r2, [r1, #2]
c0de5bb2:	4640      	mov	r0, r8
c0de5bb4:	f001 fd31 	bl	c0de761a <OUTLINED_FUNCTION_38>
c0de5bb8:	f841 4022 	str.w	r4, [r1, r2, lsl #2]
c0de5bbc:	2102      	movs	r1, #2
c0de5bbe:	75a1      	strb	r1, [r4, #22]
c0de5bc0:	f8bb 100c 	ldrh.w	r1, [fp, #12]
c0de5bc4:	75e1      	strb	r1, [r4, #23]
c0de5bc6:	0a09      	lsrs	r1, r1, #8
c0de5bc8:	f8bb 3020 	ldrh.w	r3, [fp, #32]
c0de5bcc:	f8bb 500e 	ldrh.w	r5, [fp, #14]
c0de5bd0:	7621      	strb	r1, [r4, #24]
c0de5bd2:	1c51      	adds	r1, r2, #1
c0de5bd4:	442b      	add	r3, r5
c0de5bd6:	7663      	strb	r3, [r4, #25]
c0de5bd8:	f800 1c02 	strb.w	r1, [r0, #-2]
c0de5bdc:	0a18      	lsrs	r0, r3, #8
c0de5bde:	76a0      	strb	r0, [r4, #26]
c0de5be0:	2000      	movs	r0, #0
c0de5be2:	f88a 00af 	strb.w	r0, [sl, #175]	@ 0xaf
c0de5be6:	f8db 0008 	ldr.w	r0, [fp, #8]
c0de5bea:	f8ca 00a4 	str.w	r0, [sl, #164]	@ 0xa4
c0de5bee:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de5bf2:	f040 0104 	orr.w	r1, r0, #4
c0de5bf6:	08c0      	lsrs	r0, r0, #3
c0de5bf8:	f88a 10ad 	strb.w	r1, [sl, #173]	@ 0xad
c0de5bfc:	49b2      	ldr	r1, [pc, #712]	@ (c0de5ec8 <addContentCenter+0x3dc>)
c0de5bfe:	4479      	add	r1, pc
c0de5c00:	9101      	str	r1, [sp, #4]
c0de5c02:	f8db 1008 	ldr.w	r1, [fp, #8]
c0de5c06:	88c9      	ldrh	r1, [r1, #6]
c0de5c08:	e9cd 1102 	strd	r1, r1, [sp, #8]
c0de5c0c:	a901      	add	r1, sp, #4
c0de5c0e:	f005 fc50 	bl	c0deb4b2 <nbgl_screenUpdateTicker>
c0de5c12:	4656      	mov	r6, sl
c0de5c14:	f8dd a000 	ldr.w	sl, [sp]
c0de5c18:	463c      	mov	r4, r7
c0de5c1a:	e001      	b.n	c0de5c20 <addContentCenter+0x134>
c0de5c1c:	f04f 0a00 	mov.w	sl, #0
c0de5c20:	f8db 0010 	ldr.w	r0, [fp, #16]
c0de5c24:	9600      	str	r6, [sp, #0]
c0de5c26:	2800      	cmp	r0, #0
c0de5c28:	d046      	beq.n	c0de5cb8 <addContentCenter+0x1cc>
c0de5c2a:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de5c2e:	f001 fb19 	bl	c0de7264 <OUTLINED_FUNCTION_0>
c0de5c32:	4607      	mov	r7, r0
c0de5c34:	2000      	movs	r0, #0
c0de5c36:	77f8      	strb	r0, [r7, #31]
c0de5c38:	f8db 0010 	ldr.w	r0, [fp, #16]
c0de5c3c:	f005 fe24 	bl	c0deb888 <pic>
c0de5c40:	f001 fd19 	bl	c0de7676 <OUTLINED_FUNCTION_42>
c0de5c44:	200d      	movs	r0, #13
c0de5c46:	f001 fb2b 	bl	c0de72a0 <OUTLINED_FUNCTION_3>
c0de5c4a:	f001 fdf8 	bl	c0de783e <OUTLINED_FUNCTION_78>
c0de5c4e:	71b8      	strb	r0, [r7, #6]
c0de5c50:	0a01      	lsrs	r1, r0, #8
c0de5c52:	f898 c020 	ldrb.w	ip, [r8, #32]
c0de5c56:	71f9      	strb	r1, [r7, #7]
c0de5c58:	f1bc 0f00 	cmp.w	ip, #0
c0de5c5c:	d010      	beq.n	c0de5c80 <addContentCenter+0x194>
c0de5c5e:	463b      	mov	r3, r7
c0de5c60:	0e22      	lsrs	r2, r4, #24
c0de5c62:	f803 4f12 	strb.w	r4, [r3, #18]!
c0de5c66:	70da      	strb	r2, [r3, #3]
c0de5c68:	0c22      	lsrs	r2, r4, #16
c0de5c6a:	709a      	strb	r2, [r3, #2]
c0de5c6c:	0a22      	lsrs	r2, r4, #8
c0de5c6e:	705a      	strb	r2, [r3, #1]
c0de5c70:	f8bb 2020 	ldrh.w	r2, [fp, #32]
c0de5c74:	3218      	adds	r2, #24
c0de5c76:	0a14      	lsrs	r4, r2, #8
c0de5c78:	71da      	strb	r2, [r3, #7]
c0de5c7a:	721c      	strb	r4, [r3, #8]
c0de5c7c:	2308      	movs	r3, #8
c0de5c7e:	e004      	b.n	c0de5c8a <addContentCenter+0x19e>
c0de5c80:	7e7a      	ldrb	r2, [r7, #25]
c0de5c82:	7ebb      	ldrb	r3, [r7, #26]
c0de5c84:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de5c88:	2302      	movs	r3, #2
c0de5c8a:	75bb      	strb	r3, [r7, #22]
c0de5c8c:	4643      	mov	r3, r8
c0de5c8e:	4450      	add	r0, sl
c0de5c90:	f813 4f22 	ldrb.w	r4, [r3, #34]!
c0de5c94:	eb00 0a02 	add.w	sl, r0, r2
c0de5c98:	785d      	ldrb	r5, [r3, #1]
c0de5c9a:	789e      	ldrb	r6, [r3, #2]
c0de5c9c:	78d9      	ldrb	r1, [r3, #3]
c0de5c9e:	ea46 2101 	orr.w	r1, r6, r1, lsl #8
c0de5ca2:	ea44 2405 	orr.w	r4, r4, r5, lsl #8
c0de5ca6:	9e00      	ldr	r6, [sp, #0]
c0de5ca8:	ea44 4101 	orr.w	r1, r4, r1, lsl #16
c0de5cac:	f841 702c 	str.w	r7, [r1, ip, lsl #2]
c0de5cb0:	f10c 0101 	add.w	r1, ip, #1
c0de5cb4:	f803 1c02 	strb.w	r1, [r3, #-2]
c0de5cb8:	f8db 0014 	ldr.w	r0, [fp, #20]
c0de5cbc:	2800      	cmp	r0, #0
c0de5cbe:	d049      	beq.n	c0de5d54 <addContentCenter+0x268>
c0de5cc0:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de5cc4:	f001 face 	bl	c0de7264 <OUTLINED_FUNCTION_0>
c0de5cc8:	4607      	mov	r7, r0
c0de5cca:	2000      	movs	r0, #0
c0de5ccc:	77f8      	strb	r0, [r7, #31]
c0de5cce:	f8db 0014 	ldr.w	r0, [fp, #20]
c0de5cd2:	f005 fdd9 	bl	c0deb888 <pic>
c0de5cd6:	f001 fcce 	bl	c0de7676 <OUTLINED_FUNCTION_42>
c0de5cda:	200c      	movs	r0, #12
c0de5cdc:	f001 fae0 	bl	c0de72a0 <OUTLINED_FUNCTION_3>
c0de5ce0:	200c      	movs	r0, #12
c0de5ce2:	f005 fc09 	bl	c0deb4f8 <nbgl_getTextHeightInWidth>
c0de5ce6:	f001 fce4 	bl	c0de76b2 <OUTLINED_FUNCTION_46>
c0de5cea:	d028      	beq.n	c0de5d3e <addContentCenter+0x252>
c0de5cec:	4642      	mov	r2, r8
c0de5cee:	f04f 0c00 	mov.w	ip, #0
c0de5cf2:	f812 3f22 	ldrb.w	r3, [r2, #34]!
c0de5cf6:	7855      	ldrb	r5, [r2, #1]
c0de5cf8:	7896      	ldrb	r6, [r2, #2]
c0de5cfa:	78d2      	ldrb	r2, [r2, #3]
c0de5cfc:	ea46 2202 	orr.w	r2, r6, r2, lsl #8
c0de5d00:	ea43 2305 	orr.w	r3, r3, r5, lsl #8
c0de5d04:	463e      	mov	r6, r7
c0de5d06:	ea43 4202 	orr.w	r2, r3, r2, lsl #16
c0de5d0a:	eb02 0381 	add.w	r3, r2, r1, lsl #2
c0de5d0e:	f853 5c04 	ldr.w	r5, [r3, #-4]
c0de5d12:	f806 5f12 	strb.w	r5, [r6, #18]!
c0de5d16:	0e2c      	lsrs	r4, r5, #24
c0de5d18:	70f4      	strb	r4, [r6, #3]
c0de5d1a:	0c2c      	lsrs	r4, r5, #16
c0de5d1c:	f886 c008 	strb.w	ip, [r6, #8]
c0de5d20:	70b4      	strb	r4, [r6, #2]
c0de5d22:	0a2c      	lsrs	r4, r5, #8
c0de5d24:	7074      	strb	r4, [r6, #1]
c0de5d26:	2418      	movs	r4, #24
c0de5d28:	71f4      	strb	r4, [r6, #7]
c0de5d2a:	2408      	movs	r4, #8
c0de5d2c:	f853 3c04 	ldr.w	r3, [r3, #-4]
c0de5d30:	7134      	strb	r4, [r6, #4]
c0de5d32:	7edb      	ldrb	r3, [r3, #27]
c0de5d34:	2b02      	cmp	r3, #2
c0de5d36:	d105      	bne.n	c0de5d44 <addContentCenter+0x258>
c0de5d38:	f001 fd5b 	bl	c0de77f2 <OUTLINED_FUNCTION_71>
c0de5d3c:	e006      	b.n	c0de5d4c <addContentCenter+0x260>
c0de5d3e:	f001 fa9b 	bl	c0de7278 <OUTLINED_FUNCTION_2>
c0de5d42:	e005      	b.n	c0de5d50 <addContentCenter+0x264>
c0de5d44:	2300      	movs	r3, #0
c0de5d46:	76bb      	strb	r3, [r7, #26]
c0de5d48:	2310      	movs	r3, #16
c0de5d4a:	767b      	strb	r3, [r7, #25]
c0de5d4c:	9e00      	ldr	r6, [sp, #0]
c0de5d4e:	460c      	mov	r4, r1
c0de5d50:	f001 fbfb 	bl	c0de754a <OUTLINED_FUNCTION_29>
c0de5d54:	f8db 0018 	ldr.w	r0, [fp, #24]
c0de5d58:	b3b8      	cbz	r0, c0de5dca <addContentCenter+0x2de>
c0de5d5a:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de5d5e:	f001 fa81 	bl	c0de7264 <OUTLINED_FUNCTION_0>
c0de5d62:	4607      	mov	r7, r0
c0de5d64:	2000      	movs	r0, #0
c0de5d66:	77f8      	strb	r0, [r7, #31]
c0de5d68:	f8db 0018 	ldr.w	r0, [fp, #24]
c0de5d6c:	f005 fd8c 	bl	c0deb888 <pic>
c0de5d70:	f001 fc81 	bl	c0de7676 <OUTLINED_FUNCTION_42>
c0de5d74:	200b      	movs	r0, #11
c0de5d76:	f001 fa93 	bl	c0de72a0 <OUTLINED_FUNCTION_3>
c0de5d7a:	f001 fc84 	bl	c0de7686 <OUTLINED_FUNCTION_43>
c0de5d7e:	f001 fc98 	bl	c0de76b2 <OUTLINED_FUNCTION_46>
c0de5d82:	d019      	beq.n	c0de5db8 <addContentCenter+0x2cc>
c0de5d84:	f001 fc3b 	bl	c0de75fe <OUTLINED_FUNCTION_37>
c0de5d88:	eb02 0381 	add.w	r3, r2, r1, lsl #2
c0de5d8c:	f853 4c04 	ldr.w	r4, [r3, #-4]
c0de5d90:	f805 4f12 	strb.w	r4, [r5, #18]!
c0de5d94:	0e26      	lsrs	r6, r4, #24
c0de5d96:	70ee      	strb	r6, [r5, #3]
c0de5d98:	0c26      	lsrs	r6, r4, #16
c0de5d9a:	0a24      	lsrs	r4, r4, #8
c0de5d9c:	706c      	strb	r4, [r5, #1]
c0de5d9e:	70ae      	strb	r6, [r5, #2]
c0de5da0:	2408      	movs	r4, #8
c0de5da2:	f853 3c04 	ldr.w	r3, [r3, #-4]
c0de5da6:	712c      	strb	r4, [r5, #4]
c0de5da8:	7edb      	ldrb	r3, [r3, #27]
c0de5daa:	2b04      	cmp	r3, #4
c0de5dac:	d107      	bne.n	c0de5dbe <addContentCenter+0x2d2>
c0de5dae:	2300      	movs	r3, #0
c0de5db0:	76bb      	strb	r3, [r7, #26]
c0de5db2:	2310      	movs	r3, #16
c0de5db4:	767b      	strb	r3, [r7, #25]
c0de5db6:	e004      	b.n	c0de5dc2 <addContentCenter+0x2d6>
c0de5db8:	f001 fa5e 	bl	c0de7278 <OUTLINED_FUNCTION_2>
c0de5dbc:	e003      	b.n	c0de5dc6 <addContentCenter+0x2da>
c0de5dbe:	f001 fd18 	bl	c0de77f2 <OUTLINED_FUNCTION_71>
c0de5dc2:	9e00      	ldr	r6, [sp, #0]
c0de5dc4:	460c      	mov	r4, r1
c0de5dc6:	f001 fbc0 	bl	c0de754a <OUTLINED_FUNCTION_29>
c0de5dca:	f8db 001c 	ldr.w	r0, [fp, #28]
c0de5dce:	2800      	cmp	r0, #0
c0de5dd0:	d04f      	beq.n	c0de5e72 <addContentCenter+0x386>
c0de5dd2:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de5dd6:	f001 fa45 	bl	c0de7264 <OUTLINED_FUNCTION_0>
c0de5dda:	2401      	movs	r4, #1
c0de5ddc:	4607      	mov	r7, r0
c0de5dde:	77c4      	strb	r4, [r0, #31]
c0de5de0:	f8db 001c 	ldr.w	r0, [fp, #28]
c0de5de4:	f005 fd50 	bl	c0deb888 <pic>
c0de5de8:	4601      	mov	r1, r0
c0de5dea:	20a0      	movs	r0, #160	@ 0xa0
c0de5dec:	2301      	movs	r3, #1
c0de5dee:	717c      	strb	r4, [r7, #5]
c0de5df0:	f887 4024 	strb.w	r4, [r7, #36]	@ 0x24
c0de5df4:	7138      	strb	r0, [r7, #4]
c0de5df6:	200b      	movs	r0, #11
c0de5df8:	0e0a      	lsrs	r2, r1, #24
c0de5dfa:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de5dfe:	2005      	movs	r0, #5
c0de5e00:	f887 0020 	strb.w	r0, [r7, #32]
c0de5e04:	4638      	mov	r0, r7
c0de5e06:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de5e0a:	70c2      	strb	r2, [r0, #3]
c0de5e0c:	0c0a      	lsrs	r2, r1, #16
c0de5e0e:	7082      	strb	r2, [r0, #2]
c0de5e10:	0a08      	lsrs	r0, r1, #8
c0de5e12:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de5e16:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de5e1a:	f001 fc34 	bl	c0de7686 <OUTLINED_FUNCTION_43>
c0de5e1e:	3010      	adds	r0, #16
c0de5e20:	f001 fc47 	bl	c0de76b2 <OUTLINED_FUNCTION_46>
c0de5e24:	d021      	beq.n	c0de5e6a <addContentCenter+0x37e>
c0de5e26:	f001 fbea 	bl	c0de75fe <OUTLINED_FUNCTION_37>
c0de5e2a:	eb02 0481 	add.w	r4, r2, r1, lsl #2
c0de5e2e:	f854 3c04 	ldr.w	r3, [r4, #-4]
c0de5e32:	f805 3f12 	strb.w	r3, [r5, #18]!
c0de5e36:	0e1e      	lsrs	r6, r3, #24
c0de5e38:	70ee      	strb	r6, [r5, #3]
c0de5e3a:	0c1e      	lsrs	r6, r3, #16
c0de5e3c:	0a1b      	lsrs	r3, r3, #8
c0de5e3e:	706b      	strb	r3, [r5, #1]
c0de5e40:	2300      	movs	r3, #0
c0de5e42:	70ae      	strb	r6, [r5, #2]
c0de5e44:	2608      	movs	r6, #8
c0de5e46:	722b      	strb	r3, [r5, #8]
c0de5e48:	2310      	movs	r3, #16
c0de5e4a:	712e      	strb	r6, [r5, #4]
c0de5e4c:	71eb      	strb	r3, [r5, #7]
c0de5e4e:	f854 4c04 	ldr.w	r4, [r4, #-4]
c0de5e52:	7ee4      	ldrb	r4, [r4, #27]
c0de5e54:	2c02      	cmp	r4, #2
c0de5e56:	d105      	bne.n	c0de5e64 <addContentCenter+0x378>
c0de5e58:	f8bb 3020 	ldrh.w	r3, [fp, #32]
c0de5e5c:	3310      	adds	r3, #16
c0de5e5e:	0a1c      	lsrs	r4, r3, #8
c0de5e60:	767b      	strb	r3, [r7, #25]
c0de5e62:	76bc      	strb	r4, [r7, #26]
c0de5e64:	9e00      	ldr	r6, [sp, #0]
c0de5e66:	460c      	mov	r4, r1
c0de5e68:	e001      	b.n	c0de5e6e <addContentCenter+0x382>
c0de5e6a:	f001 fa05 	bl	c0de7278 <OUTLINED_FUNCTION_2>
c0de5e6e:	f001 fb6c 	bl	c0de754a <OUTLINED_FUNCTION_29>
c0de5e72:	2001      	movs	r0, #1
c0de5e74:	f888 a006 	strb.w	sl, [r8, #6]
c0de5e78:	f888 0005 	strb.w	r0, [r8, #5]
c0de5e7c:	20a0      	movs	r0, #160	@ 0xa0
c0de5e7e:	f888 0004 	strb.w	r0, [r8, #4]
c0de5e82:	2005      	movs	r0, #5
c0de5e84:	f888 0016 	strb.w	r0, [r8, #22]
c0de5e88:	2000      	movs	r0, #0
c0de5e8a:	f888 001f 	strb.w	r0, [r8, #31]
c0de5e8e:	ea4f 201a 	mov.w	r0, sl, lsr #8
c0de5e92:	f888 0007 	strb.w	r0, [r8, #7]
c0de5e96:	f89b 0022 	ldrb.w	r0, [fp, #34]	@ 0x22
c0de5e9a:	b130      	cbz	r0, c0de5eaa <addContentCenter+0x3be>
c0de5e9c:	f10a 0028 	add.w	r0, sl, #40	@ 0x28
c0de5ea0:	f888 0006 	strb.w	r0, [r8, #6]
c0de5ea4:	0a00      	lsrs	r0, r0, #8
c0de5ea6:	f888 0007 	strb.w	r0, [r8, #7]
c0de5eaa:	f8d6 00a0 	ldr.w	r0, [r6, #160]	@ 0xa0
c0de5eae:	f001 fa6c 	bl	c0de738a <OUTLINED_FUNCTION_10>
c0de5eb2:	f840 8022 	str.w	r8, [r0, r2, lsl #2]
c0de5eb6:	f8d6 00a0 	ldr.w	r0, [r6, #160]	@ 0xa0
c0de5eba:	f001 f9d7 	bl	c0de726c <OUTLINED_FUNCTION_1>
c0de5ebe:	4640      	mov	r0, r8
c0de5ec0:	b004      	add	sp, #16
c0de5ec2:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de5ec6:	bf00      	nop
c0de5ec8:	0000155f 	.word	0x0000155f

c0de5ecc <nbgl_layoutAddContentCenter>:
c0de5ecc:	b128      	cbz	r0, c0de5eda <nbgl_layoutAddContentCenter+0xe>
c0de5ece:	b580      	push	{r7, lr}
c0de5ed0:	f7ff fe0c 	bl	c0de5aec <addContentCenter>
c0de5ed4:	f001 fc2d 	bl	c0de7732 <OUTLINED_FUNCTION_55>
c0de5ed8:	bd80      	pop	{r7, pc}
c0de5eda:	f001 bb7f 	b.w	c0de75dc <OUTLINED_FUNCTION_35>

c0de5ede <nbgl_layoutAddQRCode>:
c0de5ede:	2800      	cmp	r0, #0
c0de5ee0:	f000 8116 	beq.w	c0de6110 <nbgl_layoutAddQRCode+0x232>
c0de5ee4:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de5ee8:	4606      	mov	r6, r0
c0de5eea:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de5eee:	460f      	mov	r7, r1
c0de5ef0:	f001 faa1 	bl	c0de7436 <OUTLINED_FUNCTION_16>
c0de5ef4:	4682      	mov	sl, r0
c0de5ef6:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de5efa:	08c1      	lsrs	r1, r0, #3
c0de5efc:	2003      	movs	r0, #3
c0de5efe:	f005 fae7 	bl	c0deb4d0 <nbgl_containerPoolGet>
c0de5f02:	4654      	mov	r4, sl
c0de5f04:	0e01      	lsrs	r1, r0, #24
c0de5f06:	f04f 0b00 	mov.w	fp, #0
c0de5f0a:	f804 0f22 	strb.w	r0, [r4, #34]!
c0de5f0e:	f88a b020 	strb.w	fp, [sl, #32]
c0de5f12:	70e1      	strb	r1, [r4, #3]
c0de5f14:	0c01      	lsrs	r1, r0, #16
c0de5f16:	0a00      	lsrs	r0, r0, #8
c0de5f18:	70a1      	strb	r1, [r4, #2]
c0de5f1a:	f88a 0023 	strb.w	r0, [sl, #35]	@ 0x23
c0de5f1e:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de5f22:	08c1      	lsrs	r1, r0, #3
c0de5f24:	200a      	movs	r0, #10
c0de5f26:	f005 face 	bl	c0deb4c6 <nbgl_objPoolGet>
c0de5f2a:	4680      	mov	r8, r0
c0de5f2c:	6838      	ldr	r0, [r7, #0]
c0de5f2e:	f005 fcab 	bl	c0deb888 <pic>
c0de5f32:	f006 f81d 	bl	c0debf70 <strlen>
c0de5f36:	283e      	cmp	r0, #62	@ 0x3e
c0de5f38:	f04f 0000 	mov.w	r0, #0
c0de5f3c:	4645      	mov	r5, r8
c0de5f3e:	bf88      	it	hi
c0de5f40:	2001      	movhi	r0, #1
c0de5f42:	f888 0020 	strb.w	r0, [r8, #32]
c0de5f46:	f888 b01f 	strb.w	fp, [r8, #31]
c0de5f4a:	f44f 7084 	mov.w	r0, #264	@ 0x108
c0de5f4e:	bf88      	it	hi
c0de5f50:	20e4      	movhi	r0, #228	@ 0xe4
c0de5f52:	f888 0004 	strb.w	r0, [r8, #4]
c0de5f56:	f805 0f06 	strb.w	r0, [r5, #6]!
c0de5f5a:	0a00      	lsrs	r0, r0, #8
c0de5f5c:	7068      	strb	r0, [r5, #1]
c0de5f5e:	f888 0005 	strb.w	r0, [r8, #5]
c0de5f62:	6838      	ldr	r0, [r7, #0]
c0de5f64:	f005 fc90 	bl	c0deb888 <pic>
c0de5f68:	4641      	mov	r1, r8
c0de5f6a:	0e02      	lsrs	r2, r0, #24
c0de5f6c:	f888 b009 	strb.w	fp, [r8, #9]
c0de5f70:	9601      	str	r6, [sp, #4]
c0de5f72:	f801 0f21 	strb.w	r0, [r1, #33]!
c0de5f76:	f001 fba3 	bl	c0de76c0 <OUTLINED_FUNCTION_47>
c0de5f7a:	f888 0022 	strb.w	r0, [r8, #34]	@ 0x22
c0de5f7e:	7820      	ldrb	r0, [r4, #0]
c0de5f80:	78a1      	ldrb	r1, [r4, #2]
c0de5f82:	78e2      	ldrb	r2, [r4, #3]
c0de5f84:	f89a 4023 	ldrb.w	r4, [sl, #35]	@ 0x23
c0de5f88:	f89a 3020 	ldrb.w	r3, [sl, #32]
c0de5f8c:	ea40 2004 	orr.w	r0, r0, r4, lsl #8
c0de5f90:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de5f94:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de5f98:	7869      	ldrb	r1, [r5, #1]
c0de5f9a:	f840 8023 	str.w	r8, [r0, r3, lsl #2]
c0de5f9e:	2002      	movs	r0, #2
c0de5fa0:	f888 0016 	strb.w	r0, [r8, #22]
c0de5fa4:	1c58      	adds	r0, r3, #1
c0de5fa6:	f88a 0020 	strb.w	r0, [sl, #32]
c0de5faa:	7828      	ldrb	r0, [r5, #0]
c0de5fac:	ea40 2b01 	orr.w	fp, r0, r1, lsl #8
c0de5fb0:	6878      	ldr	r0, [r7, #4]
c0de5fb2:	2800      	cmp	r0, #0
c0de5fb4:	d053      	beq.n	c0de605e <nbgl_layoutAddQRCode+0x180>
c0de5fb6:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de5fba:	f001 f953 	bl	c0de7264 <OUTLINED_FUNCTION_0>
c0de5fbe:	4605      	mov	r5, r0
c0de5fc0:	2000      	movs	r0, #0
c0de5fc2:	77e8      	strb	r0, [r5, #31]
c0de5fc4:	6878      	ldr	r0, [r7, #4]
c0de5fc6:	f005 fc5f 	bl	c0deb888 <pic>
c0de5fca:	4601      	mov	r1, r0
c0de5fcc:	20a0      	movs	r0, #160	@ 0xa0
c0de5fce:	2201      	movs	r2, #1
c0de5fd0:	7128      	strb	r0, [r5, #4]
c0de5fd2:	2005      	movs	r0, #5
c0de5fd4:	716a      	strb	r2, [r5, #5]
c0de5fd6:	f885 2024 	strb.w	r2, [r5, #36]	@ 0x24
c0de5fda:	0e0a      	lsrs	r2, r1, #24
c0de5fdc:	f885 0020 	strb.w	r0, [r5, #32]
c0de5fe0:	4628      	mov	r0, r5
c0de5fe2:	f001 fa02 	bl	c0de73ea <OUTLINED_FUNCTION_13>
c0de5fe6:	f885 0027 	strb.w	r0, [r5, #39]	@ 0x27
c0de5fea:	200d      	movs	r0, #13
c0de5fec:	7bfa      	ldrb	r2, [r7, #15]
c0de5fee:	2a00      	cmp	r2, #0
c0de5ff0:	bf08      	it	eq
c0de5ff2:	200b      	moveq	r0, #11
c0de5ff4:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de5ff8:	f885 0022 	strb.w	r0, [r5, #34]	@ 0x22
c0de5ffc:	2301      	movs	r3, #1
c0de5ffe:	f005 fa7b 	bl	c0deb4f8 <nbgl_getTextHeightInWidth>
c0de6002:	4651      	mov	r1, sl
c0de6004:	46be      	mov	lr, r7
c0de6006:	f811 cf22 	ldrb.w	ip, [r1, #34]!
c0de600a:	784c      	ldrb	r4, [r1, #1]
c0de600c:	788a      	ldrb	r2, [r1, #2]
c0de600e:	78cf      	ldrb	r7, [r1, #3]
c0de6010:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de6014:	ea42 2207 	orr.w	r2, r2, r7, lsl #8
c0de6018:	ea4c 2404 	orr.w	r4, ip, r4, lsl #8
c0de601c:	462f      	mov	r7, r5
c0de601e:	ea44 4202 	orr.w	r2, r4, r2, lsl #16
c0de6022:	eb02 0483 	add.w	r4, r2, r3, lsl #2
c0de6026:	f854 4c04 	ldr.w	r4, [r4, #-4]
c0de602a:	f807 4f12 	strb.w	r4, [r7, #18]!
c0de602e:	0e26      	lsrs	r6, r4, #24
c0de6030:	70fe      	strb	r6, [r7, #3]
c0de6032:	0c26      	lsrs	r6, r4, #16
c0de6034:	0a24      	lsrs	r4, r4, #8
c0de6036:	70be      	strb	r6, [r7, #2]
c0de6038:	74ec      	strb	r4, [r5, #19]
c0de603a:	f842 5023 	str.w	r5, [r2, r3, lsl #2]
c0de603e:	2200      	movs	r2, #0
c0de6040:	71a8      	strb	r0, [r5, #6]
c0de6042:	4677      	mov	r7, lr
c0de6044:	76aa      	strb	r2, [r5, #26]
c0de6046:	2218      	movs	r2, #24
c0de6048:	766a      	strb	r2, [r5, #25]
c0de604a:	2208      	movs	r2, #8
c0de604c:	75aa      	strb	r2, [r5, #22]
c0de604e:	0a02      	lsrs	r2, r0, #8
c0de6050:	4458      	add	r0, fp
c0de6052:	71ea      	strb	r2, [r5, #7]
c0de6054:	1c5a      	adds	r2, r3, #1
c0de6056:	f100 0b18 	add.w	fp, r0, #24
c0de605a:	f801 2c02 	strb.w	r2, [r1, #-2]
c0de605e:	68b8      	ldr	r0, [r7, #8]
c0de6060:	9700      	str	r7, [sp, #0]
c0de6062:	2800      	cmp	r0, #0
c0de6064:	d056      	beq.n	c0de6114 <nbgl_layoutAddQRCode+0x236>
c0de6066:	9801      	ldr	r0, [sp, #4]
c0de6068:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de606c:	f001 f8fa 	bl	c0de7264 <OUTLINED_FUNCTION_0>
c0de6070:	2401      	movs	r4, #1
c0de6072:	4605      	mov	r5, r0
c0de6074:	77c4      	strb	r4, [r0, #31]
c0de6076:	68b8      	ldr	r0, [r7, #8]
c0de6078:	f005 fc06 	bl	c0deb888 <pic>
c0de607c:	4601      	mov	r1, r0
c0de607e:	20a0      	movs	r0, #160	@ 0xa0
c0de6080:	2301      	movs	r3, #1
c0de6082:	716c      	strb	r4, [r5, #5]
c0de6084:	f885 4024 	strb.w	r4, [r5, #36]	@ 0x24
c0de6088:	7128      	strb	r0, [r5, #4]
c0de608a:	200b      	movs	r0, #11
c0de608c:	0e0a      	lsrs	r2, r1, #24
c0de608e:	f885 0022 	strb.w	r0, [r5, #34]	@ 0x22
c0de6092:	2005      	movs	r0, #5
c0de6094:	f885 0020 	strb.w	r0, [r5, #32]
c0de6098:	4628      	mov	r0, r5
c0de609a:	f001 f924 	bl	c0de72e6 <OUTLINED_FUNCTION_5>
c0de609e:	4651      	mov	r1, sl
c0de60a0:	f811 cf22 	ldrb.w	ip, [r1, #34]!
c0de60a4:	784b      	ldrb	r3, [r1, #1]
c0de60a6:	788e      	ldrb	r6, [r1, #2]
c0de60a8:	78cc      	ldrb	r4, [r1, #3]
c0de60aa:	f811 2c02 	ldrb.w	r2, [r1, #-2]
c0de60ae:	ea4c 2303 	orr.w	r3, ip, r3, lsl #8
c0de60b2:	ea46 2404 	orr.w	r4, r6, r4, lsl #8
c0de60b6:	f8d7 c004 	ldr.w	ip, [r7, #4]
c0de60ba:	2700      	movs	r7, #0
c0de60bc:	462e      	mov	r6, r5
c0de60be:	ea43 4e04 	orr.w	lr, r3, r4, lsl #16
c0de60c2:	eb0e 0482 	add.w	r4, lr, r2, lsl #2
c0de60c6:	f854 4c04 	ldr.w	r4, [r4, #-4]
c0de60ca:	76af      	strb	r7, [r5, #26]
c0de60cc:	271c      	movs	r7, #28
c0de60ce:	f1bc 0f00 	cmp.w	ip, #0
c0de60d2:	bf08      	it	eq
c0de60d4:	2720      	moveq	r7, #32
c0de60d6:	766f      	strb	r7, [r5, #25]
c0de60d8:	f806 4f12 	strb.w	r4, [r6, #18]!
c0de60dc:	0e23      	lsrs	r3, r4, #24
c0de60de:	70f3      	strb	r3, [r6, #3]
c0de60e0:	0c23      	lsrs	r3, r4, #16
c0de60e2:	70b3      	strb	r3, [r6, #2]
c0de60e4:	0a23      	lsrs	r3, r4, #8
c0de60e6:	9e01      	ldr	r6, [sp, #4]
c0de60e8:	74eb      	strb	r3, [r5, #19]
c0de60ea:	2308      	movs	r3, #8
c0de60ec:	f84e 5022 	str.w	r5, [lr, r2, lsl #2]
c0de60f0:	3201      	adds	r2, #1
c0de60f2:	71a8      	strb	r0, [r5, #6]
c0de60f4:	75ab      	strb	r3, [r5, #22]
c0de60f6:	0a03      	lsrs	r3, r0, #8
c0de60f8:	f801 2c02 	strb.w	r2, [r1, #-2]
c0de60fc:	71eb      	strb	r3, [r5, #7]
c0de60fe:	f1bc 0f00 	cmp.w	ip, #0
c0de6102:	bf08      	it	eq
c0de6104:	f10b 0b08 	addeq.w	fp, fp, #8
c0de6108:	4458      	add	r0, fp
c0de610a:	eb00 0b07 	add.w	fp, r0, r7
c0de610e:	e002      	b.n	c0de6116 <nbgl_layoutAddQRCode+0x238>
c0de6110:	f001 ba64 	b.w	c0de75dc <OUTLINED_FUNCTION_35>
c0de6114:	9e01      	ldr	r6, [sp, #4]
c0de6116:	f8d6 00a0 	ldr.w	r0, [r6, #160]	@ 0xa0
c0de611a:	fa1f f18b 	uxth.w	r1, fp
c0de611e:	7982      	ldrb	r2, [r0, #6]
c0de6120:	79c3      	ldrb	r3, [r0, #7]
c0de6122:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de6126:	3a10      	subs	r2, #16
c0de6128:	428a      	cmp	r2, r1
c0de612a:	dd01      	ble.n	c0de6130 <nbgl_layoutAddQRCode+0x252>
c0de612c:	9d00      	ldr	r5, [sp, #0]
c0de612e:	e012      	b.n	c0de6156 <nbgl_layoutAddQRCode+0x278>
c0de6130:	f898 1020 	ldrb.w	r1, [r8, #32]
c0de6134:	9d00      	ldr	r5, [sp, #0]
c0de6136:	b971      	cbnz	r1, c0de6156 <nbgl_layoutAddQRCode+0x278>
c0de6138:	2100      	movs	r1, #0
c0de613a:	2284      	movs	r2, #132	@ 0x84
c0de613c:	f1ab 0b84 	sub.w	fp, fp, #132	@ 0x84
c0de6140:	f888 1007 	strb.w	r1, [r8, #7]
c0de6144:	f888 1005 	strb.w	r1, [r8, #5]
c0de6148:	2102      	movs	r1, #2
c0de614a:	f888 2006 	strb.w	r2, [r8, #6]
c0de614e:	f888 2004 	strb.w	r2, [r8, #4]
c0de6152:	f888 1020 	strb.w	r1, [r8, #32]
c0de6156:	2100      	movs	r1, #0
c0de6158:	f88a b006 	strb.w	fp, [sl, #6]
c0de615c:	f88a 101f 	strb.w	r1, [sl, #31]
c0de6160:	ea4f 211b 	mov.w	r1, fp, lsr #8
c0de6164:	f88a 1007 	strb.w	r1, [sl, #7]
c0de6168:	7ba9      	ldrb	r1, [r5, #14]
c0de616a:	b109      	cbz	r1, c0de6170 <nbgl_layoutAddQRCode+0x292>
c0de616c:	2005      	movs	r0, #5
c0de616e:	e00f      	b.n	c0de6190 <nbgl_layoutAddQRCode+0x2b2>
c0de6170:	f001 f90b 	bl	c0de738a <OUTLINED_FUNCTION_10>
c0de6174:	4651      	mov	r1, sl
c0de6176:	eb00 0082 	add.w	r0, r0, r2, lsl #2
c0de617a:	f850 0c04 	ldr.w	r0, [r0, #-4]
c0de617e:	f801 0f12 	strb.w	r0, [r1, #18]!
c0de6182:	0e02      	lsrs	r2, r0, #24
c0de6184:	70ca      	strb	r2, [r1, #3]
c0de6186:	0c02      	lsrs	r2, r0, #16
c0de6188:	0a00      	lsrs	r0, r0, #8
c0de618a:	7048      	strb	r0, [r1, #1]
c0de618c:	2008      	movs	r0, #8
c0de618e:	708a      	strb	r2, [r1, #2]
c0de6190:	f88a 0016 	strb.w	r0, [sl, #22]
c0de6194:	f8d6 00a0 	ldr.w	r0, [r6, #160]	@ 0xa0
c0de6198:	f001 f9be 	bl	c0de7518 <OUTLINED_FUNCTION_27>
c0de619c:	2001      	movs	r0, #1
c0de619e:	f88a 0005 	strb.w	r0, [sl, #5]
c0de61a2:	20a0      	movs	r0, #160	@ 0xa0
c0de61a4:	f88a 0004 	strb.w	r0, [sl, #4]
c0de61a8:	89a8      	ldrh	r0, [r5, #12]
c0de61aa:	f88a 0019 	strb.w	r0, [sl, #25]
c0de61ae:	0a00      	lsrs	r0, r0, #8
c0de61b0:	f88a 001a 	strb.w	r0, [sl, #26]
c0de61b4:	f8d6 00a0 	ldr.w	r0, [r6, #160]	@ 0xa0
c0de61b8:	f001 f858 	bl	c0de726c <OUTLINED_FUNCTION_1>
c0de61bc:	fa1f f08b 	uxth.w	r0, fp
c0de61c0:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}

c0de61c4 <nbgl_layoutAddChoiceButtons>:
c0de61c4:	b510      	push	{r4, lr}
c0de61c6:	b086      	sub	sp, #24
c0de61c8:	2206      	movs	r2, #6
c0de61ca:	f10d 0c04 	add.w	ip, sp, #4
c0de61ce:	f8ad 2000 	strh.w	r2, [sp]
c0de61d2:	e891 001c 	ldmia.w	r1, {r2, r3, r4}
c0de61d6:	e8ac 001c 	stmia.w	ip!, {r2, r3, r4}
c0de61da:	898a      	ldrh	r2, [r1, #12]
c0de61dc:	7b89      	ldrb	r1, [r1, #14]
c0de61de:	f88d 1012 	strb.w	r1, [sp, #18]
c0de61e2:	4669      	mov	r1, sp
c0de61e4:	f8ad 2010 	strh.w	r2, [sp, #16]
c0de61e8:	f7fe fb40 	bl	c0de486c <nbgl_layoutAddExtendedFooter>
c0de61ec:	b006      	add	sp, #24
c0de61ee:	bd10      	pop	{r4, pc}

c0de61f0 <nbgl_layoutAddHorizontalButtons>:
c0de61f0:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de61f2:	2202      	movs	r2, #2
c0de61f4:	f88d 2004 	strb.w	r2, [sp, #4]
c0de61f8:	e9d1 2300 	ldrd	r2, r3, [r1]
c0de61fc:	e9cd 2302 	strd	r2, r3, [sp, #8]
c0de6200:	890a      	ldrh	r2, [r1, #8]
c0de6202:	7a89      	ldrb	r1, [r1, #10]
c0de6204:	f8ad 2010 	strh.w	r2, [sp, #16]
c0de6208:	f88d 1012 	strb.w	r1, [sp, #18]
c0de620c:	a901      	add	r1, sp, #4
c0de620e:	f7fd ff85 	bl	c0de411c <nbgl_layoutAddUpFooter>
c0de6212:	b006      	add	sp, #24
c0de6214:	bd80      	pop	{r7, pc}
	...

c0de6218 <nbgl_layoutAddTagValueList>:
c0de6218:	2800      	cmp	r0, #0
c0de621a:	f000 818a 	beq.w	c0de6532 <nbgl_layoutAddTagValueList+0x31a>
c0de621e:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de6222:	b088      	sub	sp, #32
c0de6224:	4680      	mov	r8, r0
c0de6226:	48c4      	ldr	r0, [pc, #784]	@ (c0de6538 <nbgl_layoutAddTagValueList+0x320>)
c0de6228:	460c      	mov	r4, r1
c0de622a:	2100      	movs	r1, #0
c0de622c:	f04f 0b00 	mov.w	fp, #0
c0de6230:	f8cd 8004 	str.w	r8, [sp, #4]
c0de6234:	9406      	str	r4, [sp, #24]
c0de6236:	4478      	add	r0, pc
c0de6238:	9000      	str	r0, [sp, #0]
c0de623a:	7a20      	ldrb	r0, [r4, #8]
c0de623c:	4583      	cmp	fp, r0
c0de623e:	f080 8174 	bcs.w	c0de652a <nbgl_layoutAddTagValueList+0x312>
c0de6242:	6820      	ldr	r0, [r4, #0]
c0de6244:	e9cd b104 	strd	fp, r1, [sp, #16]
c0de6248:	b110      	cbz	r0, c0de6250 <nbgl_layoutAddTagValueList+0x38>
c0de624a:	eb00 0b01 	add.w	fp, r0, r1
c0de624e:	e005      	b.n	c0de625c <nbgl_layoutAddTagValueList+0x44>
c0de6250:	7a60      	ldrb	r0, [r4, #9]
c0de6252:	6861      	ldr	r1, [r4, #4]
c0de6254:	4458      	add	r0, fp
c0de6256:	b2c0      	uxtb	r0, r0
c0de6258:	4788      	blx	r1
c0de625a:	4683      	mov	fp, r0
c0de625c:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de6260:	9c00      	ldr	r4, [sp, #0]
c0de6262:	08c1      	lsrs	r1, r0, #3
c0de6264:	2001      	movs	r0, #1
c0de6266:	47a0      	blx	r4
c0de6268:	4682      	mov	sl, r0
c0de626a:	f8db 0008 	ldr.w	r0, [fp, #8]
c0de626e:	2800      	cmp	r0, #0
c0de6270:	f04f 0003 	mov.w	r0, #3
c0de6274:	bf08      	it	eq
c0de6276:	2002      	moveq	r0, #2
c0de6278:	f898 10ad 	ldrb.w	r1, [r8, #173]	@ 0xad
c0de627c:	f001 face 	bl	c0de781c <OUTLINED_FUNCTION_74>
c0de6280:	4656      	mov	r6, sl
c0de6282:	0e01      	lsrs	r1, r0, #24
c0de6284:	f806 0f22 	strb.w	r0, [r6, #34]!
c0de6288:	f001 fa75 	bl	c0de7776 <OUTLINED_FUNCTION_60>
c0de628c:	f88a 0023 	strb.w	r0, [sl, #35]	@ 0x23
c0de6290:	f001 fadc 	bl	c0de784c <OUTLINED_FUNCTION_80>
c0de6294:	4605      	mov	r5, r0
c0de6296:	f001 fad9 	bl	c0de784c <OUTLINED_FUNCTION_80>
c0de629a:	4607      	mov	r7, r0
c0de629c:	f8db 0000 	ldr.w	r0, [fp]
c0de62a0:	2401      	movs	r4, #1
c0de62a2:	77ec      	strb	r4, [r5, #31]
c0de62a4:	f005 faf0 	bl	c0deb888 <pic>
c0de62a8:	4601      	mov	r1, r0
c0de62aa:	20a0      	movs	r0, #160	@ 0xa0
c0de62ac:	716c      	strb	r4, [r5, #5]
c0de62ae:	f885 4024 	strb.w	r4, [r5, #36]	@ 0x24
c0de62b2:	2404      	movs	r4, #4
c0de62b4:	2301      	movs	r3, #1
c0de62b6:	7128      	strb	r0, [r5, #4]
c0de62b8:	200b      	movs	r0, #11
c0de62ba:	0e0a      	lsrs	r2, r1, #24
c0de62bc:	f885 4020 	strb.w	r4, [r5, #32]
c0de62c0:	f885 0022 	strb.w	r0, [r5, #34]	@ 0x22
c0de62c4:	4628      	mov	r0, r5
c0de62c6:	f001 f80e 	bl	c0de72e6 <OUTLINED_FUNCTION_5>
c0de62ca:	71a8      	strb	r0, [r5, #6]
c0de62cc:	9003      	str	r0, [sp, #12]
c0de62ce:	0a00      	lsrs	r0, r0, #8
c0de62d0:	f04f 0800 	mov.w	r8, #0
c0de62d4:	2109      	movs	r1, #9
c0de62d6:	71e8      	strb	r0, [r5, #7]
c0de62d8:	f105 0012 	add.w	r0, r5, #18
c0de62dc:	f885 8021 	strb.w	r8, [r5, #33]	@ 0x21
c0de62e0:	f005 fdda 	bl	c0debe98 <__aeabi_memclr>
c0de62e4:	f89a 1023 	ldrb.w	r1, [sl, #35]	@ 0x23
c0de62e8:	7832      	ldrb	r2, [r6, #0]
c0de62ea:	78b3      	ldrb	r3, [r6, #2]
c0de62ec:	78f6      	ldrb	r6, [r6, #3]
c0de62ee:	f89a 0020 	ldrb.w	r0, [sl, #32]
c0de62f2:	f887 801f 	strb.w	r8, [r7, #31]
c0de62f6:	f001 fa9b 	bl	c0de7830 <OUTLINED_FUNCTION_76>
c0de62fa:	f841 5020 	str.w	r5, [r1, r0, lsl #2]
c0de62fe:	3001      	adds	r0, #1
c0de6300:	f88a 0020 	strb.w	r0, [sl, #32]
c0de6304:	f8db 0004 	ldr.w	r0, [fp, #4]
c0de6308:	f005 fabe 	bl	c0deb888 <pic>
c0de630c:	4601      	mov	r1, r0
c0de630e:	4638      	mov	r0, r7
c0de6310:	f887 4020 	strb.w	r4, [r7, #32]
c0de6314:	9c06      	ldr	r4, [sp, #24]
c0de6316:	260c      	movs	r6, #12
c0de6318:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de631c:	0e0a      	lsrs	r2, r1, #24
c0de631e:	f001 f9c1 	bl	c0de76a4 <OUTLINED_FUNCTION_45>
c0de6322:	7b20      	ldrb	r0, [r4, #12]
c0de6324:	2800      	cmp	r0, #0
c0de6326:	bf08      	it	eq
c0de6328:	260d      	moveq	r6, #13
c0de632a:	f887 6022 	strb.w	r6, [r7, #34]	@ 0x22
c0de632e:	f89b 200c 	ldrb.w	r2, [fp, #12]
c0de6332:	0752      	lsls	r2, r2, #29
c0de6334:	d417      	bmi.n	c0de6366 <nbgl_layoutAddTagValueList+0x14e>
c0de6336:	f8db 2008 	ldr.w	r2, [fp, #8]
c0de633a:	2a00      	cmp	r2, #0
c0de633c:	f000 80f0 	beq.w	c0de6520 <nbgl_layoutAddTagValueList+0x308>
c0de6340:	4610      	mov	r0, r2
c0de6342:	f005 faa1 	bl	c0deb888 <pic>
c0de6346:	4639      	mov	r1, r7
c0de6348:	f811 2f26 	ldrb.w	r2, [r1, #38]!
c0de634c:	784b      	ldrb	r3, [r1, #1]
c0de634e:	f811 6c04 	ldrb.w	r6, [r1, #-4]
c0de6352:	f891 c002 	ldrb.w	ip, [r1, #2]
c0de6356:	78c9      	ldrb	r1, [r1, #3]
c0de6358:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de635c:	ea4c 2101 	orr.w	r1, ip, r1, lsl #8
c0de6360:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de6364:	e001      	b.n	c0de636a <nbgl_layoutAddTagValueList+0x152>
c0de6366:	4875      	ldr	r0, [pc, #468]	@ (c0de653c <nbgl_layoutAddTagValueList+0x324>)
c0de6368:	4478      	add	r0, pc
c0de636a:	7802      	ldrb	r2, [r0, #0]
c0de636c:	7843      	ldrb	r3, [r0, #1]
c0de636e:	4680      	mov	r8, r0
c0de6370:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de6374:	f5c2 72ca 	rsb	r2, r2, #404	@ 0x194
c0de6378:	0a13      	lsrs	r3, r2, #8
c0de637a:	713a      	strb	r2, [r7, #4]
c0de637c:	b292      	uxth	r2, r2
c0de637e:	4630      	mov	r0, r6
c0de6380:	717b      	strb	r3, [r7, #5]
c0de6382:	7b63      	ldrb	r3, [r4, #13]
c0de6384:	f005 f8bd 	bl	c0deb502 <nbgl_getTextNbLinesInWidth>
c0de6388:	7aa1      	ldrb	r1, [r4, #10]
c0de638a:	46a3      	mov	fp, r4
c0de638c:	b121      	cbz	r1, c0de6398 <nbgl_layoutAddTagValueList+0x180>
c0de638e:	4288      	cmp	r0, r1
c0de6390:	bf84      	itt	hi
c0de6392:	f887 1025 	strbhi.w	r1, [r7, #37]	@ 0x25
c0de6396:	4608      	movhi	r0, r1
c0de6398:	9007      	str	r0, [sp, #28]
c0de639a:	f897 0022 	ldrb.w	r0, [r7, #34]	@ 0x22
c0de639e:	f005 f89c 	bl	c0deb4da <nbgl_getFont>
c0de63a2:	0a29      	lsrs	r1, r5, #8
c0de63a4:	0e2a      	lsrs	r2, r5, #24
c0de63a6:	46dc      	mov	ip, fp
c0de63a8:	f04f 0e01 	mov.w	lr, #1
c0de63ac:	74f9      	strb	r1, [r7, #19]
c0de63ae:	4639      	mov	r1, r7
c0de63b0:	f801 5f12 	strb.w	r5, [r1, #18]!
c0de63b4:	70ca      	strb	r2, [r1, #3]
c0de63b6:	0c2a      	lsrs	r2, r5, #16
c0de63b8:	708a      	strb	r2, [r1, #2]
c0de63ba:	4651      	mov	r1, sl
c0de63bc:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de63c0:	784d      	ldrb	r5, [r1, #1]
c0de63c2:	788e      	ldrb	r6, [r1, #2]
c0de63c4:	78cc      	ldrb	r4, [r1, #3]
c0de63c6:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de63ca:	ea46 2404 	orr.w	r4, r6, r4, lsl #8
c0de63ce:	ea42 2205 	orr.w	r2, r2, r5, lsl #8
c0de63d2:	2600      	movs	r6, #0
c0de63d4:	ea42 4204 	orr.w	r2, r2, r4, lsl #16
c0de63d8:	4644      	mov	r4, r8
c0de63da:	76be      	strb	r6, [r7, #26]
c0de63dc:	f887 6021 	strb.w	r6, [r7, #33]	@ 0x21
c0de63e0:	f842 7023 	str.w	r7, [r2, r3, lsl #2]
c0de63e4:	2204      	movs	r2, #4
c0de63e6:	767a      	strb	r2, [r7, #25]
c0de63e8:	2207      	movs	r2, #7
c0de63ea:	75ba      	strb	r2, [r7, #22]
c0de63ec:	f89b 200d 	ldrb.w	r2, [fp, #13]
c0de63f0:	79c5      	ldrb	r5, [r0, #7]
c0de63f2:	f8dd b010 	ldr.w	fp, [sp, #16]
c0de63f6:	f887 2024 	strb.w	r2, [r7, #36]	@ 0x24
c0de63fa:	9a07      	ldr	r2, [sp, #28]
c0de63fc:	fb02 f005 	mul.w	r0, r2, r5
c0de6400:	71b8      	strb	r0, [r7, #6]
c0de6402:	0a00      	lsrs	r0, r0, #8
c0de6404:	71f8      	strb	r0, [r7, #7]
c0de6406:	1c58      	adds	r0, r3, #1
c0de6408:	f1b8 0f00 	cmp.w	r8, #0
c0de640c:	f8dd 8004 	ldr.w	r8, [sp, #4]
c0de6410:	f801 0c02 	strb.w	r0, [r1, #-2]
c0de6414:	d048      	beq.n	c0de64a8 <nbgl_layoutAddTagValueList+0x290>
c0de6416:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de641a:	f001 f83f 	bl	c0de749c <OUTLINED_FUNCTION_21>
c0de641e:	9502      	str	r5, [sp, #8]
c0de6420:	4605      	mov	r5, r0
c0de6422:	9806      	ldr	r0, [sp, #24]
c0de6424:	4651      	mov	r1, sl
c0de6426:	2309      	movs	r3, #9
c0de6428:	7ac2      	ldrb	r2, [r0, #11]
c0de642a:	4640      	mov	r0, r8
c0de642c:	f7fd fbf8 	bl	c0de3c20 <layoutAddCallbackObj>
c0de6430:	0a21      	lsrs	r1, r4, #8
c0de6432:	0e22      	lsrs	r2, r4, #24
c0de6434:	2600      	movs	r6, #0
c0de6436:	f04f 0e01 	mov.w	lr, #1
c0de643a:	f885 1022 	strb.w	r1, [r5, #34]	@ 0x22
c0de643e:	0a39      	lsrs	r1, r7, #8
c0de6440:	762e      	strb	r6, [r5, #24]
c0de6442:	77ee      	strb	r6, [r5, #31]
c0de6444:	74e9      	strb	r1, [r5, #19]
c0de6446:	4629      	mov	r1, r5
c0de6448:	f801 4f21 	strb.w	r4, [r1, #33]!
c0de644c:	70ca      	strb	r2, [r1, #3]
c0de644e:	0c22      	lsrs	r2, r4, #16
c0de6450:	708a      	strb	r2, [r1, #2]
c0de6452:	4629      	mov	r1, r5
c0de6454:	0e3a      	lsrs	r2, r7, #24
c0de6456:	4673      	mov	r3, lr
c0de6458:	f001 f9be 	bl	c0de77d8 <OUTLINED_FUNCTION_69>
c0de645c:	469e      	mov	lr, r3
c0de645e:	4651      	mov	r1, sl
c0de6460:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de6464:	784c      	ldrb	r4, [r1, #1]
c0de6466:	788f      	ldrb	r7, [r1, #2]
c0de6468:	78cb      	ldrb	r3, [r1, #3]
c0de646a:	f811 cc02 	ldrb.w	ip, [r1, #-2]
c0de646e:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de6472:	ea47 2403 	orr.w	r4, r7, r3, lsl #8
c0de6476:	ea42 4204 	orr.w	r2, r2, r4, lsl #16
c0de647a:	f842 502c 	str.w	r5, [r2, ip, lsl #2]
c0de647e:	220c      	movs	r2, #12
c0de6480:	75ea      	strb	r2, [r5, #23]
c0de6482:	f880 b005 	strb.w	fp, [r0, #5]
c0de6486:	f10b 000f 	add.w	r0, fp, #15
c0de648a:	75aa      	strb	r2, [r5, #22]
c0de648c:	9d02      	ldr	r5, [sp, #8]
c0de648e:	9a07      	ldr	r2, [sp, #28]
c0de6490:	f801 6c05 	strb.w	r6, [r1, #-5]
c0de6494:	f801 ec06 	strb.w	lr, [r1, #-6]
c0de6498:	f801 0c04 	strb.w	r0, [r1, #-4]
c0de649c:	f10c 0001 	add.w	r0, ip, #1
c0de64a0:	f8dd c018 	ldr.w	ip, [sp, #24]
c0de64a4:	f801 0c02 	strb.w	r0, [r1, #-2]
c0de64a8:	9803      	ldr	r0, [sp, #12]
c0de64aa:	4659      	mov	r1, fp
c0de64ac:	fb02 0005 	mla	r0, r2, r5, r0
c0de64b0:	3004      	adds	r0, #4
c0de64b2:	f1bb 0f00 	cmp.w	fp, #0
c0de64b6:	bf18      	it	ne
c0de64b8:	2118      	movne	r1, #24
c0de64ba:	f88a 1019 	strb.w	r1, [sl, #25]
c0de64be:	f88a e005 	strb.w	lr, [sl, #5]
c0de64c2:	f88a 6018 	strb.w	r6, [sl, #24]
c0de64c6:	f88a 601f 	strb.w	r6, [sl, #31]
c0de64ca:	f88a 6016 	strb.w	r6, [sl, #22]
c0de64ce:	f10b 0b01 	add.w	fp, fp, #1
c0de64d2:	0a09      	lsrs	r1, r1, #8
c0de64d4:	f88a 101a 	strb.w	r1, [sl, #26]
c0de64d8:	f8d8 10a0 	ldr.w	r1, [r8, #160]	@ 0xa0
c0de64dc:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de64e0:	784c      	ldrb	r4, [r1, #1]
c0de64e2:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de64e6:	788d      	ldrb	r5, [r1, #2]
c0de64e8:	78c9      	ldrb	r1, [r1, #3]
c0de64ea:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de64ee:	ea45 2101 	orr.w	r1, r5, r1, lsl #8
c0de64f2:	4664      	mov	r4, ip
c0de64f4:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de64f8:	f841 a023 	str.w	sl, [r1, r3, lsl #2]
c0de64fc:	21a0      	movs	r1, #160	@ 0xa0
c0de64fe:	f88a 0006 	strb.w	r0, [sl, #6]
c0de6502:	0a00      	lsrs	r0, r0, #8
c0de6504:	f88a 1004 	strb.w	r1, [sl, #4]
c0de6508:	2120      	movs	r1, #32
c0de650a:	f88a 0007 	strb.w	r0, [sl, #7]
c0de650e:	f88a 1017 	strb.w	r1, [sl, #23]
c0de6512:	f8d8 00a0 	ldr.w	r0, [r8, #160]	@ 0xa0
c0de6516:	f000 fea9 	bl	c0de726c <OUTLINED_FUNCTION_1>
c0de651a:	9905      	ldr	r1, [sp, #20]
c0de651c:	3110      	adds	r1, #16
c0de651e:	e68c      	b.n	c0de623a <nbgl_layoutAddTagValueList+0x22>
c0de6520:	f04f 0800 	mov.w	r8, #0
c0de6524:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de6528:	e726      	b.n	c0de6378 <nbgl_layoutAddTagValueList+0x160>
c0de652a:	2000      	movs	r0, #0
c0de652c:	b008      	add	sp, #32
c0de652e:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de6532:	f001 b853 	b.w	c0de75dc <OUTLINED_FUNCTION_35>
c0de6536:	bf00      	nop
c0de6538:	0000528d 	.word	0x0000528d
c0de653c:	00006930 	.word	0x00006930

c0de6540 <nbgl_layoutAddSeparationLine>:
c0de6540:	b570      	push	{r4, r5, r6, lr}
c0de6542:	f001 f97f 	bl	c0de7844 <OUTLINED_FUNCTION_79>
c0de6546:	08c0      	lsrs	r0, r0, #3
c0de6548:	f7ff fa7e 	bl	c0de5a48 <createHorizontalLine>
c0de654c:	f000 ffaa 	bl	c0de74a4 <OUTLINED_FUNCTION_22>
c0de6550:	21ff      	movs	r1, #255	@ 0xff
c0de6552:	7681      	strb	r1, [r0, #26]
c0de6554:	21fc      	movs	r1, #252	@ 0xfc
c0de6556:	7641      	strb	r1, [r0, #25]
c0de6558:	2103      	movs	r1, #3
c0de655a:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de655e:	f001 f8f6 	bl	c0de774e <OUTLINED_FUNCTION_57>
c0de6562:	bd70      	pop	{r4, r5, r6, pc}

c0de6564 <nbgl_layoutAddButton>:
c0de6564:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de6568:	b086      	sub	sp, #24
c0de656a:	b310      	cbz	r0, c0de65b2 <nbgl_layoutAddButton+0x4e>
c0de656c:	4680      	mov	r8, r0
c0de656e:	7ac8      	ldrb	r0, [r1, #11]
c0de6570:	460d      	mov	r5, r1
c0de6572:	b108      	cbz	r0, c0de6578 <nbgl_layoutAddButton+0x14>
c0de6574:	7aa8      	ldrb	r0, [r5, #10]
c0de6576:	b1f8      	cbz	r0, c0de65b8 <nbgl_layoutAddButton+0x54>
c0de6578:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de657c:	f000 ff5f 	bl	c0de743e <OUTLINED_FUNCTION_17>
c0de6580:	4606      	mov	r6, r0
c0de6582:	7a2a      	ldrb	r2, [r5, #8]
c0de6584:	7b2b      	ldrb	r3, [r5, #12]
c0de6586:	4640      	mov	r0, r8
c0de6588:	f000 ff85 	bl	c0de7496 <OUTLINED_FUNCTION_20>
c0de658c:	b188      	cbz	r0, c0de65b2 <nbgl_layoutAddButton+0x4e>
c0de658e:	210c      	movs	r1, #12
c0de6590:	2000      	movs	r0, #0
c0de6592:	7671      	strb	r1, [r6, #25]
c0de6594:	2120      	movs	r1, #32
c0de6596:	76b0      	strb	r0, [r6, #26]
c0de6598:	7630      	strb	r0, [r6, #24]
c0de659a:	75b0      	strb	r0, [r6, #22]
c0de659c:	75f1      	strb	r1, [r6, #23]
c0de659e:	7a69      	ldrb	r1, [r5, #9]
c0de65a0:	b1e9      	cbz	r1, c0de65de <nbgl_layoutAddButton+0x7a>
c0de65a2:	f886 0021 	strb.w	r0, [r6, #33]	@ 0x21
c0de65a6:	2003      	movs	r0, #3
c0de65a8:	77f0      	strb	r0, [r6, #31]
c0de65aa:	2902      	cmp	r1, #2
c0de65ac:	bf18      	it	ne
c0de65ae:	2002      	movne	r0, #2
c0de65b0:	e019      	b.n	c0de65e6 <nbgl_layoutAddButton+0x82>
c0de65b2:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de65b6:	e0a3      	b.n	c0de6700 <nbgl_layoutAddButton+0x19c>
c0de65b8:	f8d8 0010 	ldr.w	r0, [r8, #16]
c0de65bc:	2800      	cmp	r0, #0
c0de65be:	f000 80a2 	beq.w	c0de6706 <nbgl_layoutAddButton+0x1a2>
c0de65c2:	2001      	movs	r0, #1
c0de65c4:	f88d 0000 	strb.w	r0, [sp]
c0de65c8:	e9d5 0100 	ldrd	r0, r1, [r5]
c0de65cc:	9001      	str	r0, [sp, #4]
c0de65ce:	7b28      	ldrb	r0, [r5, #12]
c0de65d0:	9102      	str	r1, [sp, #8]
c0de65d2:	4669      	mov	r1, sp
c0de65d4:	f001 f91b 	bl	c0de780e <OUTLINED_FUNCTION_73>
c0de65d8:	f7fd fda0 	bl	c0de411c <nbgl_layoutAddUpFooter>
c0de65dc:	e090      	b.n	c0de6700 <nbgl_layoutAddButton+0x19c>
c0de65de:	2103      	movs	r1, #3
c0de65e0:	77f0      	strb	r0, [r6, #31]
c0de65e2:	f886 1021 	strb.w	r1, [r6, #33]	@ 0x21
c0de65e6:	f886 0020 	strb.w	r0, [r6, #32]
c0de65ea:	6828      	ldr	r0, [r5, #0]
c0de65ec:	f005 f94c 	bl	c0deb888 <pic>
c0de65f0:	210c      	movs	r1, #12
c0de65f2:	0e02      	lsrs	r2, r0, #24
c0de65f4:	f886 1023 	strb.w	r1, [r6, #35]	@ 0x23
c0de65f8:	4631      	mov	r1, r6
c0de65fa:	f000 ff9d 	bl	c0de7538 <OUTLINED_FUNCTION_28>
c0de65fe:	f000 ff63 	bl	c0de74c8 <OUTLINED_FUNCTION_23>
c0de6602:	4631      	mov	r1, r6
c0de6604:	0e02      	lsrs	r2, r0, #24
c0de6606:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de660a:	70ca      	strb	r2, [r1, #3]
c0de660c:	0c02      	lsrs	r2, r0, #16
c0de660e:	0a00      	lsrs	r0, r0, #8
c0de6610:	708a      	strb	r2, [r1, #2]
c0de6612:	7048      	strb	r0, [r1, #1]
c0de6614:	7aa8      	ldrb	r0, [r5, #10]
c0de6616:	b308      	cbz	r0, c0de665c <nbgl_layoutAddButton+0xf8>
c0de6618:	4632      	mov	r2, r6
c0de661a:	f896 1026 	ldrb.w	r1, [r6, #38]	@ 0x26
c0de661e:	f896 0023 	ldrb.w	r0, [r6, #35]	@ 0x23
c0de6622:	f812 3f25 	ldrb.w	r3, [r2, #37]!
c0de6626:	f001 f8fc 	bl	c0de7822 <OUTLINED_FUNCTION_75>
c0de662a:	ea41 4102 	orr.w	r1, r1, r2, lsl #16
c0de662e:	f004 ff6d 	bl	c0deb50c <nbgl_getTextWidth>
c0de6632:	4631      	mov	r1, r6
c0de6634:	3040      	adds	r0, #64	@ 0x40
c0de6636:	f811 2f2e 	ldrb.w	r2, [r1, #46]!
c0de663a:	784b      	ldrb	r3, [r1, #1]
c0de663c:	788f      	ldrb	r7, [r1, #2]
c0de663e:	78c9      	ldrb	r1, [r1, #3]
c0de6640:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de6644:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de6648:	ea42 4201 	orr.w	r2, r2, r1, lsl #16
c0de664c:	2100      	movs	r1, #0
c0de664e:	b18a      	cbz	r2, c0de6674 <nbgl_layoutAddButton+0x110>
c0de6650:	7813      	ldrb	r3, [r2, #0]
c0de6652:	7852      	ldrb	r2, [r2, #1]
c0de6654:	ea43 2202 	orr.w	r2, r3, r2, lsl #8
c0de6658:	320c      	adds	r2, #12
c0de665a:	e00c      	b.n	c0de6676 <nbgl_layoutAddButton+0x112>
c0de665c:	2000      	movs	r0, #0
c0de665e:	71f0      	strb	r0, [r6, #7]
c0de6660:	2058      	movs	r0, #88	@ 0x58
c0de6662:	71b0      	strb	r0, [r6, #6]
c0de6664:	2001      	movs	r0, #1
c0de6666:	7170      	strb	r0, [r6, #5]
c0de6668:	20a0      	movs	r0, #160	@ 0xa0
c0de666a:	7130      	strb	r0, [r6, #4]
c0de666c:	2003      	movs	r0, #3
c0de666e:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de6672:	e01d      	b.n	c0de66b0 <nbgl_layoutAddButton+0x14c>
c0de6674:	2200      	movs	r2, #0
c0de6676:	71f1      	strb	r1, [r6, #7]
c0de6678:	2140      	movs	r1, #64	@ 0x40
c0de667a:	4410      	add	r0, r2
c0de667c:	71b1      	strb	r1, [r6, #6]
c0de667e:	2101      	movs	r1, #1
c0de6680:	7130      	strb	r0, [r6, #4]
c0de6682:	f886 1022 	strb.w	r1, [r6, #34]	@ 0x22
c0de6686:	0a01      	lsrs	r1, r0, #8
c0de6688:	7171      	strb	r1, [r6, #5]
c0de668a:	7ae9      	ldrb	r1, [r5, #11]
c0de668c:	2901      	cmp	r1, #1
c0de668e:	d00f      	beq.n	c0de66b0 <nbgl_layoutAddButton+0x14c>
c0de6690:	b280      	uxth	r0, r0
c0de6692:	2102      	movs	r1, #2
c0de6694:	f5c0 70d0 	rsb	r0, r0, #416	@ 0x1a0
c0de6698:	fb90 f0f1 	sdiv	r0, r0, r1
c0de669c:	4631      	mov	r1, r6
c0de669e:	f811 2f17 	ldrb.w	r2, [r1, #23]!
c0de66a2:	784b      	ldrb	r3, [r1, #1]
c0de66a4:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de66a8:	4410      	add	r0, r2
c0de66aa:	7008      	strb	r0, [r1, #0]
c0de66ac:	0a00      	lsrs	r0, r0, #8
c0de66ae:	7048      	strb	r0, [r1, #1]
c0de66b0:	2000      	movs	r0, #0
c0de66b2:	4631      	mov	r1, r6
c0de66b4:	f801 0f12 	strb.w	r0, [r1, #18]!
c0de66b8:	74f0      	strb	r0, [r6, #19]
c0de66ba:	70c8      	strb	r0, [r1, #3]
c0de66bc:	7088      	strb	r0, [r1, #2]
c0de66be:	f8d8 10a0 	ldr.w	r1, [r8, #160]	@ 0xa0
c0de66c2:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de66c6:	784f      	ldrb	r7, [r1, #1]
c0de66c8:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de66cc:	788c      	ldrb	r4, [r1, #2]
c0de66ce:	78c9      	ldrb	r1, [r1, #3]
c0de66d0:	ea42 2207 	orr.w	r2, r2, r7, lsl #8
c0de66d4:	ea44 2101 	orr.w	r1, r4, r1, lsl #8
c0de66d8:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de66dc:	2208      	movs	r2, #8
c0de66de:	f841 6023 	str.w	r6, [r1, r3, lsl #2]
c0de66e2:	2101      	movs	r1, #1
c0de66e4:	7770      	strb	r0, [r6, #29]
c0de66e6:	7731      	strb	r1, [r6, #28]
c0de66e8:	7aa9      	ldrb	r1, [r5, #10]
c0de66ea:	2900      	cmp	r1, #0
c0de66ec:	bf08      	it	eq
c0de66ee:	2207      	moveq	r2, #7
c0de66f0:	77b2      	strb	r2, [r6, #30]
c0de66f2:	f8d8 10a0 	ldr.w	r1, [r8, #160]	@ 0xa0
c0de66f6:	f891 2020 	ldrb.w	r2, [r1, #32]
c0de66fa:	3201      	adds	r2, #1
c0de66fc:	f881 2020 	strb.w	r2, [r1, #32]
c0de6700:	b006      	add	sp, #24
c0de6702:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de6706:	2005      	movs	r0, #5
c0de6708:	f8ad 0000 	strh.w	r0, [sp]
c0de670c:	e9d5 0100 	ldrd	r0, r1, [r5]
c0de6710:	9001      	str	r0, [sp, #4]
c0de6712:	7b28      	ldrb	r0, [r5, #12]
c0de6714:	9102      	str	r1, [sp, #8]
c0de6716:	4669      	mov	r1, sp
c0de6718:	f001 f879 	bl	c0de780e <OUTLINED_FUNCTION_73>
c0de671c:	f7fe f8a6 	bl	c0de486c <nbgl_layoutAddExtendedFooter>
c0de6720:	e7ee      	b.n	c0de6700 <nbgl_layoutAddButton+0x19c>

c0de6722 <nbgl_layoutAddLongPressButton>:
c0de6722:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de6724:	9102      	str	r1, [sp, #8]
c0de6726:	2100      	movs	r1, #0
c0de6728:	f88d 300d 	strb.w	r3, [sp, #13]
c0de672c:	f88d 200c 	strb.w	r2, [sp, #12]
c0de6730:	f88d 1004 	strb.w	r1, [sp, #4]
c0de6734:	b118      	cbz	r0, c0de673e <nbgl_layoutAddLongPressButton+0x1c>
c0de6736:	a901      	add	r1, sp, #4
c0de6738:	f7fd fcf0 	bl	c0de411c <nbgl_layoutAddUpFooter>
c0de673c:	e001      	b.n	c0de6742 <nbgl_layoutAddLongPressButton+0x20>
c0de673e:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de6742:	b006      	add	sp, #24
c0de6744:	bd80      	pop	{r7, pc}

c0de6746 <nbgl_layoutAddFooter>:
c0de6746:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de6748:	9101      	str	r1, [sp, #4]
c0de674a:	f240 1101 	movw	r1, #257	@ 0x101
c0de674e:	f88d 2009 	strb.w	r2, [sp, #9]
c0de6752:	2200      	movs	r2, #0
c0de6754:	f88d 300a 	strb.w	r3, [sp, #10]
c0de6758:	f8ad 1000 	strh.w	r1, [sp]
c0de675c:	4669      	mov	r1, sp
c0de675e:	f88d 2008 	strb.w	r2, [sp, #8]
c0de6762:	f7fe f883 	bl	c0de486c <nbgl_layoutAddExtendedFooter>
c0de6766:	b006      	add	sp, #24
c0de6768:	bd80      	pop	{r7, pc}

c0de676a <nbgl_layoutAddSplitFooter>:
c0de676a:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de676c:	9101      	str	r1, [sp, #4]
c0de676e:	f44f 7181 	mov.w	r1, #258	@ 0x102
c0de6772:	f88d 200c 	strb.w	r2, [sp, #12]
c0de6776:	9302      	str	r3, [sp, #8]
c0de6778:	f8ad 1000 	strh.w	r1, [sp]
c0de677c:	9909      	ldr	r1, [sp, #36]	@ 0x24
c0de677e:	f88d 100e 	strb.w	r1, [sp, #14]
c0de6782:	9908      	ldr	r1, [sp, #32]
c0de6784:	f88d 100d 	strb.w	r1, [sp, #13]
c0de6788:	4669      	mov	r1, sp
c0de678a:	f7fe f86f 	bl	c0de486c <nbgl_layoutAddExtendedFooter>
c0de678e:	b006      	add	sp, #24
c0de6790:	bd80      	pop	{r7, pc}
	...

c0de6794 <nbgl_layoutAddHeader>:
c0de6794:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de6798:	2800      	cmp	r0, #0
c0de679a:	f000 8239 	beq.w	c0de6c10 <nbgl_layoutAddHeader+0x47c>
c0de679e:	460d      	mov	r5, r1
c0de67a0:	b119      	cbz	r1, c0de67aa <nbgl_layoutAddHeader+0x16>
c0de67a2:	4604      	mov	r4, r0
c0de67a4:	7828      	ldrb	r0, [r5, #0]
c0de67a6:	2806      	cmp	r0, #6
c0de67a8:	d903      	bls.n	c0de67b2 <nbgl_layoutAddHeader+0x1e>
c0de67aa:	f06f 0001 	mvn.w	r0, #1
c0de67ae:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de67b2:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de67b6:	2601      	movs	r6, #1
c0de67b8:	f000 fe3d 	bl	c0de7436 <OUTLINED_FUNCTION_16>
c0de67bc:	2100      	movs	r1, #0
c0de67be:	7146      	strb	r6, [r0, #5]
c0de67c0:	77c1      	strb	r1, [r0, #31]
c0de67c2:	21e0      	movs	r1, #224	@ 0xe0
c0de67c4:	7101      	strb	r1, [r0, #4]
c0de67c6:	60e0      	str	r0, [r4, #12]
c0de67c8:	f000 ffe8 	bl	c0de779c <OUTLINED_FUNCTION_64>
c0de67cc:	68e1      	ldr	r1, [r4, #12]
c0de67ce:	0a02      	lsrs	r2, r0, #8
c0de67d0:	0e03      	lsrs	r3, r0, #24
c0de67d2:	f881 2023 	strb.w	r2, [r1, #35]	@ 0x23
c0de67d6:	2202      	movs	r2, #2
c0de67d8:	f001 f804 	bl	c0de77e4 <OUTLINED_FUNCTION_70>
c0de67dc:	70d3      	strb	r3, [r2, #3]
c0de67de:	7828      	ldrb	r0, [r5, #0]
c0de67e0:	1e42      	subs	r2, r0, #1
c0de67e2:	2a02      	cmp	r2, #2
c0de67e4:	d311      	bcc.n	c0de680a <nbgl_layoutAddHeader+0x76>
c0de67e6:	2806      	cmp	r0, #6
c0de67e8:	f000 80ab 	beq.w	c0de6942 <nbgl_layoutAddHeader+0x1ae>
c0de67ec:	2803      	cmp	r0, #3
c0de67ee:	f000 81d9 	beq.w	c0de6ba4 <nbgl_layoutAddHeader+0x410>
c0de67f2:	2804      	cmp	r0, #4
c0de67f4:	f000 80d5 	beq.w	c0de69a2 <nbgl_layoutAddHeader+0x20e>
c0de67f8:	2805      	cmp	r0, #5
c0de67fa:	d006      	beq.n	c0de680a <nbgl_layoutAddHeader+0x76>
c0de67fc:	2800      	cmp	r0, #0
c0de67fe:	d1d4      	bne.n	c0de67aa <nbgl_layoutAddHeader+0x16>
c0de6800:	88a8      	ldrh	r0, [r5, #4]
c0de6802:	7188      	strb	r0, [r1, #6]
c0de6804:	0a00      	lsrs	r0, r0, #8
c0de6806:	71c8      	strb	r0, [r1, #7]
c0de6808:	e1cc      	b.n	c0de6ba4 <nbgl_layoutAddHeader+0x410>
c0de680a:	f000 ff65 	bl	c0de76d8 <OUTLINED_FUNCTION_49>
c0de680e:	9001      	str	r0, [sp, #4]
c0de6810:	7828      	ldrb	r0, [r5, #0]
c0de6812:	210c      	movs	r1, #12
c0de6814:	2805      	cmp	r0, #5
c0de6816:	bf08      	it	eq
c0de6818:	210d      	moveq	r1, #13
c0de681a:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de681e:	f815 b001 	ldrb.w	fp, [r5, r1]
c0de6822:	f000 fe0c 	bl	c0de743e <OUTLINED_FUNCTION_17>
c0de6826:	4606      	mov	r6, r0
c0de6828:	f04f 0a03 	mov.w	sl, #3
c0de682c:	f1bb 0fff 	cmp.w	fp, #255	@ 0xff
c0de6830:	d00d      	beq.n	c0de684e <nbgl_layoutAddHeader+0xba>
c0de6832:	7828      	ldrb	r0, [r5, #0]
c0de6834:	210d      	movs	r1, #13
c0de6836:	465a      	mov	r2, fp
c0de6838:	2805      	cmp	r0, #5
c0de683a:	bf08      	it	eq
c0de683c:	210f      	moveq	r1, #15
c0de683e:	5c6b      	ldrb	r3, [r5, r1]
c0de6840:	f000 fd5e 	bl	c0de7300 <OUTLINED_FUNCTION_6>
c0de6844:	2800      	cmp	r0, #0
c0de6846:	f000 81e3 	beq.w	c0de6c10 <nbgl_layoutAddHeader+0x47c>
c0de684a:	2000      	movs	r0, #0
c0de684c:	e000      	b.n	c0de6850 <nbgl_layoutAddHeader+0xbc>
c0de684e:	2003      	movs	r0, #3
c0de6850:	f886 0021 	strb.w	r0, [r6, #33]	@ 0x21
c0de6854:	2004      	movs	r0, #4
c0de6856:	f04f 0800 	mov.w	r8, #0
c0de685a:	2160      	movs	r1, #96	@ 0x60
c0de685c:	f886 a01f 	strb.w	sl, [r6, #31]
c0de6860:	f886 a020 	strb.w	sl, [r6, #32]
c0de6864:	75b0      	strb	r0, [r6, #22]
c0de6866:	4630      	mov	r0, r6
c0de6868:	71b1      	strb	r1, [r6, #6]
c0de686a:	2168      	movs	r1, #104	@ 0x68
c0de686c:	f886 8026 	strb.w	r8, [r6, #38]	@ 0x26
c0de6870:	f886 8007 	strb.w	r8, [r6, #7]
c0de6874:	f886 8005 	strb.w	r8, [r6, #5]
c0de6878:	f800 8f25 	strb.w	r8, [r0, #37]!
c0de687c:	7131      	strb	r1, [r6, #4]
c0de687e:	f880 8003 	strb.w	r8, [r0, #3]
c0de6882:	f880 8002 	strb.w	r8, [r0, #2]
c0de6886:	48e4      	ldr	r0, [pc, #912]	@ (c0de6c18 <nbgl_layoutAddHeader+0x484>)
c0de6888:	4478      	add	r0, pc
c0de688a:	f004 fffd 	bl	c0deb888 <pic>
c0de688e:	4631      	mov	r1, r6
c0de6890:	0e02      	lsrs	r2, r0, #24
c0de6892:	f886 801d 	strb.w	r8, [r6, #29]
c0de6896:	f000 fd5f 	bl	c0de7358 <OUTLINED_FUNCTION_9>
c0de689a:	f1bb 00ff 	subs.w	r0, fp, #255	@ 0xff
c0de689e:	bf18      	it	ne
c0de68a0:	2001      	movne	r0, #1
c0de68a2:	7730      	strb	r0, [r6, #28]
c0de68a4:	9f01      	ldr	r7, [sp, #4]
c0de68a6:	68e1      	ldr	r1, [r4, #12]
c0de68a8:	2006      	movs	r0, #6
c0de68aa:	77b0      	strb	r0, [r6, #30]
c0de68ac:	f891 0020 	ldrb.w	r0, [r1, #32]
c0de68b0:	3001      	adds	r0, #1
c0de68b2:	2f00      	cmp	r7, #0
c0de68b4:	f881 0020 	strb.w	r0, [r1, #32]
c0de68b8:	f000 809a 	beq.w	c0de69f0 <nbgl_layoutAddHeader+0x25c>
c0de68bc:	7828      	ldrb	r0, [r5, #0]
c0de68be:	f04f 0a00 	mov.w	sl, #0
c0de68c2:	2802      	cmp	r0, #2
c0de68c4:	d122      	bne.n	c0de690c <nbgl_layoutAddHeader+0x178>
c0de68c6:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de68ca:	f000 fde7 	bl	c0de749c <OUTLINED_FUNCTION_21>
c0de68ce:	4606      	mov	r6, r0
c0de68d0:	f000 fdfa 	bl	c0de74c8 <OUTLINED_FUNCTION_23>
c0de68d4:	4631      	mov	r1, r6
c0de68d6:	0e02      	lsrs	r2, r0, #24
c0de68d8:	f886 a01f 	strb.w	sl, [r6, #31]
c0de68dc:	46b2      	mov	sl, r6
c0de68de:	f000 ff2d 	bl	c0de773c <OUTLINED_FUNCTION_56>
c0de68e2:	68e0      	ldr	r0, [r4, #12]
c0de68e4:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de68e8:	7843      	ldrb	r3, [r0, #1]
c0de68ea:	f810 cc02 	ldrb.w	ip, [r0, #-2]
c0de68ee:	7882      	ldrb	r2, [r0, #2]
c0de68f0:	78c0      	ldrb	r0, [r0, #3]
c0de68f2:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de68f6:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de68fa:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de68fe:	f840 602c 	str.w	r6, [r0, ip, lsl #2]
c0de6902:	2005      	movs	r0, #5
c0de6904:	75b0      	strb	r0, [r6, #22]
c0de6906:	68e0      	ldr	r0, [r4, #12]
c0de6908:	f000 fcb0 	bl	c0de726c <OUTLINED_FUNCTION_1>
c0de690c:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de6910:	f000 fca8 	bl	c0de7264 <OUTLINED_FUNCTION_0>
c0de6914:	782b      	ldrb	r3, [r5, #0]
c0de6916:	4680      	mov	r8, r0
c0de6918:	2b05      	cmp	r3, #5
c0de691a:	d16c      	bne.n	c0de69f6 <nbgl_layoutAddHeader+0x262>
c0de691c:	7b2a      	ldrb	r2, [r5, #12]
c0de691e:	2aff      	cmp	r2, #255	@ 0xff
c0de6920:	d068      	beq.n	c0de69f4 <nbgl_layoutAddHeader+0x260>
c0de6922:	7beb      	ldrb	r3, [r5, #15]
c0de6924:	4620      	mov	r0, r4
c0de6926:	4641      	mov	r1, r8
c0de6928:	f7fd f97a 	bl	c0de3c20 <layoutAddCallbackObj>
c0de692c:	2800      	cmp	r0, #0
c0de692e:	f000 816f 	beq.w	c0de6c10 <nbgl_layoutAddHeader+0x47c>
c0de6932:	2000      	movs	r0, #0
c0de6934:	f888 001d 	strb.w	r0, [r8, #29]
c0de6938:	2001      	movs	r0, #1
c0de693a:	f888 001c 	strb.w	r0, [r8, #28]
c0de693e:	782b      	ldrb	r3, [r5, #0]
c0de6940:	e059      	b.n	c0de69f6 <nbgl_layoutAddHeader+0x262>
c0de6942:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de6946:	f000 fc8d 	bl	c0de7264 <OUTLINED_FUNCTION_0>
c0de694a:	4606      	mov	r6, r0
c0de694c:	7a2a      	ldrb	r2, [r5, #8]
c0de694e:	7a6b      	ldrb	r3, [r5, #9]
c0de6950:	f000 fcd6 	bl	c0de7300 <OUTLINED_FUNCTION_6>
c0de6954:	2800      	cmp	r0, #0
c0de6956:	f000 815b 	beq.w	c0de6c10 <nbgl_layoutAddHeader+0x47c>
c0de695a:	2020      	movs	r0, #32
c0de695c:	4637      	mov	r7, r6
c0de695e:	f04f 0a00 	mov.w	sl, #0
c0de6962:	f04f 0806 	mov.w	r8, #6
c0de6966:	f04f 0b01 	mov.w	fp, #1
c0de696a:	75f0      	strb	r0, [r6, #23]
c0de696c:	20a0      	movs	r0, #160	@ 0xa0
c0de696e:	f886 a01f 	strb.w	sl, [r6, #31]
c0de6972:	f886 a018 	strb.w	sl, [r6, #24]
c0de6976:	f886 8016 	strb.w	r8, [r6, #22]
c0de697a:	f886 b005 	strb.w	fp, [r6, #5]
c0de697e:	7130      	strb	r0, [r6, #4]
c0de6980:	2060      	movs	r0, #96	@ 0x60
c0de6982:	f807 0f06 	strb.w	r0, [r7, #6]!
c0de6986:	f887 a001 	strb.w	sl, [r7, #1]
c0de698a:	f000 fd9d 	bl	c0de74c8 <OUTLINED_FUNCTION_23>
c0de698e:	f000 fee7 	bl	c0de7760 <OUTLINED_FUNCTION_58>
c0de6992:	f886 8020 	strb.w	r8, [r6, #32]
c0de6996:	f000 fcb7 	bl	c0de7308 <OUTLINED_FUNCTION_7>
c0de699a:	f000 fee6 	bl	c0de776a <OUTLINED_FUNCTION_59>
c0de699e:	77b0      	strb	r0, [r6, #30]
c0de69a0:	e01e      	b.n	c0de69e0 <nbgl_layoutAddHeader+0x24c>
c0de69a2:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de69a6:	f000 fc5d 	bl	c0de7264 <OUTLINED_FUNCTION_0>
c0de69aa:	4606      	mov	r6, r0
c0de69ac:	21a0      	movs	r1, #160	@ 0xa0
c0de69ae:	2000      	movs	r0, #0
c0de69b0:	f04f 0801 	mov.w	r8, #1
c0de69b4:	7131      	strb	r1, [r6, #4]
c0de69b6:	2160      	movs	r1, #96	@ 0x60
c0de69b8:	4637      	mov	r7, r6
c0de69ba:	77f0      	strb	r0, [r6, #31]
c0de69bc:	f886 8005 	strb.w	r8, [r6, #5]
c0de69c0:	f807 1f06 	strb.w	r1, [r7, #6]!
c0de69c4:	7078      	strb	r0, [r7, #1]
c0de69c6:	f000 fd7f 	bl	c0de74c8 <OUTLINED_FUNCTION_23>
c0de69ca:	4631      	mov	r1, r6
c0de69cc:	0e02      	lsrs	r2, r0, #24
c0de69ce:	f886 8024 	strb.w	r8, [r6, #36]	@ 0x24
c0de69d2:	f000 fc99 	bl	c0de7308 <OUTLINED_FUNCTION_7>
c0de69d6:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de69da:	2005      	movs	r0, #5
c0de69dc:	f886 0020 	strb.w	r0, [r6, #32]
c0de69e0:	68e1      	ldr	r1, [r4, #12]
c0de69e2:	787a      	ldrb	r2, [r7, #1]
c0de69e4:	7838      	ldrb	r0, [r7, #0]
c0de69e6:	71ca      	strb	r2, [r1, #7]
c0de69e8:	7188      	strb	r0, [r1, #6]
c0de69ea:	f000 fec9 	bl	c0de7780 <OUTLINED_FUNCTION_61>
c0de69ee:	e0d9      	b.n	c0de6ba4 <nbgl_layoutAddHeader+0x410>
c0de69f0:	7828      	ldrb	r0, [r5, #0]
c0de69f2:	e096      	b.n	c0de6b22 <nbgl_layoutAddHeader+0x38e>
c0de69f4:	2305      	movs	r3, #5
c0de69f6:	68e2      	ldr	r2, [r4, #12]
c0de69f8:	f04f 0e00 	mov.w	lr, #0
c0de69fc:	f04f 0c05 	mov.w	ip, #5
c0de6a00:	f888 e01f 	strb.w	lr, [r8, #31]
c0de6a04:	f888 c016 	strb.w	ip, [r8, #22]
c0de6a08:	7916      	ldrb	r6, [r2, #4]
c0de6a0a:	7952      	ldrb	r2, [r2, #5]
c0de6a0c:	ea46 2602 	orr.w	r6, r6, r2, lsl #8
c0de6a10:	f1a6 02d0 	sub.w	r2, r6, #208	@ 0xd0
c0de6a14:	0a10      	lsrs	r0, r2, #8
c0de6a16:	f888 2004 	strb.w	r2, [r8, #4]
c0de6a1a:	2b02      	cmp	r3, #2
c0de6a1c:	f888 0005 	strb.w	r0, [r8, #5]
c0de6a20:	d117      	bne.n	c0de6a52 <nbgl_layoutAddHeader+0x2be>
c0de6a22:	4650      	mov	r0, sl
c0de6a24:	f810 2f21 	ldrb.w	r2, [r0, #33]!
c0de6a28:	7843      	ldrb	r3, [r0, #1]
c0de6a2a:	7881      	ldrb	r1, [r0, #2]
c0de6a2c:	78c0      	ldrb	r0, [r0, #3]
c0de6a2e:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de6a32:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de6a36:	ea42 4000 	orr.w	r0, r2, r0, lsl #16
c0de6a3a:	7801      	ldrb	r1, [r0, #0]
c0de6a3c:	7840      	ldrb	r0, [r0, #1]
c0de6a3e:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de6a42:	1a30      	subs	r0, r6, r0
c0de6a44:	f1a0 02e0 	sub.w	r2, r0, #224	@ 0xe0
c0de6a48:	0a10      	lsrs	r0, r2, #8
c0de6a4a:	f888 2004 	strb.w	r2, [r8, #4]
c0de6a4e:	f888 0005 	strb.w	r0, [r8, #5]
c0de6a52:	4640      	mov	r0, r8
c0de6a54:	0e39      	lsrs	r1, r7, #24
c0de6a56:	b292      	uxth	r2, r2
c0de6a58:	2301      	movs	r3, #1
c0de6a5a:	f800 7f26 	strb.w	r7, [r0, #38]!
c0de6a5e:	70c1      	strb	r1, [r0, #3]
c0de6a60:	0c39      	lsrs	r1, r7, #16
c0de6a62:	f800 ec1f 	strb.w	lr, [r0, #-31]
c0de6a66:	f800 cc06 	strb.w	ip, [r0, #-6]
c0de6a6a:	7081      	strb	r1, [r0, #2]
c0de6a6c:	0a39      	lsrs	r1, r7, #8
c0de6a6e:	7041      	strb	r1, [r0, #1]
c0de6a70:	2160      	movs	r1, #96	@ 0x60
c0de6a72:	f800 1c20 	strb.w	r1, [r0, #-32]
c0de6a76:	210c      	movs	r1, #12
c0de6a78:	f800 1c04 	strb.w	r1, [r0, #-4]
c0de6a7c:	2101      	movs	r1, #1
c0de6a7e:	f800 1c02 	strb.w	r1, [r0, #-2]
c0de6a82:	200c      	movs	r0, #12
c0de6a84:	4639      	mov	r1, r7
c0de6a86:	f004 fd3c 	bl	c0deb502 <nbgl_getTextNbLinesInWidth>
c0de6a8a:	7828      	ldrb	r0, [r5, #0]
c0de6a8c:	2802      	cmp	r0, #2
c0de6a8e:	d115      	bne.n	c0de6abc <nbgl_layoutAddHeader+0x328>
c0de6a90:	4646      	mov	r6, r8
c0de6a92:	f816 cf26 	ldrb.w	ip, [r6, #38]!
c0de6a96:	7872      	ldrb	r2, [r6, #1]
c0de6a98:	78b3      	ldrb	r3, [r6, #2]
c0de6a9a:	78f1      	ldrb	r1, [r6, #3]
c0de6a9c:	f816 0c04 	ldrb.w	r0, [r6, #-4]
c0de6aa0:	ea4c 2202 	orr.w	r2, ip, r2, lsl #8
c0de6aa4:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de6aa8:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de6aac:	f004 fd2e 	bl	c0deb50c <nbgl_getTextWidth>
c0de6ab0:	f806 0c22 	strb.w	r0, [r6, #-34]
c0de6ab4:	0a00      	lsrs	r0, r0, #8
c0de6ab6:	f806 0c21 	strb.w	r0, [r6, #-33]
c0de6aba:	7828      	ldrb	r0, [r5, #0]
c0de6abc:	68e1      	ldr	r1, [r4, #12]
c0de6abe:	f000 fd65 	bl	c0de758c <OUTLINED_FUNCTION_32>
c0de6ac2:	f841 8023 	str.w	r8, [r1, r3, lsl #2]
c0de6ac6:	68e1      	ldr	r1, [r4, #12]
c0de6ac8:	f891 2020 	ldrb.w	r2, [r1, #32]
c0de6acc:	3201      	adds	r2, #1
c0de6ace:	2802      	cmp	r0, #2
c0de6ad0:	f881 2020 	strb.w	r2, [r1, #32]
c0de6ad4:	d125      	bne.n	c0de6b22 <nbgl_layoutAddHeader+0x38e>
c0de6ad6:	f898 0004 	ldrb.w	r0, [r8, #4]
c0de6ada:	f898 2005 	ldrb.w	r2, [r8, #5]
c0de6ade:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de6ae2:	f06f 0207 	mvn.w	r2, #7
c0de6ae6:	eba2 0050 	sub.w	r0, r2, r0, lsr #1
c0de6aea:	f81a 2f21 	ldrb.w	r2, [sl, #33]!
c0de6aee:	f80a 0c0a 	strb.w	r0, [sl, #-10]
c0de6af2:	0a00      	lsrs	r0, r0, #8
c0de6af4:	f89a 3002 	ldrb.w	r3, [sl, #2]
c0de6af8:	f89a 6003 	ldrb.w	r6, [sl, #3]
c0de6afc:	f80a 0c09 	strb.w	r0, [sl, #-9]
c0de6b00:	f89a 0001 	ldrb.w	r0, [sl, #1]
c0de6b04:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de6b08:	ea43 2206 	orr.w	r2, r3, r6, lsl #8
c0de6b0c:	f000 fea3 	bl	c0de7856 <OUTLINED_FUNCTION_81>
c0de6b10:	2208      	movs	r2, #8
c0de6b12:	eb02 0050 	add.w	r0, r2, r0, lsr #1
c0de6b16:	f888 0017 	strb.w	r0, [r8, #23]
c0de6b1a:	0a00      	lsrs	r0, r0, #8
c0de6b1c:	f888 0018 	strb.w	r0, [r8, #24]
c0de6b20:	e03c      	b.n	c0de6b9c <nbgl_layoutAddHeader+0x408>
c0de6b22:	2805      	cmp	r0, #5
c0de6b24:	d13a      	bne.n	c0de6b9c <nbgl_layoutAddHeader+0x408>
c0de6b26:	6868      	ldr	r0, [r5, #4]
c0de6b28:	b3c0      	cbz	r0, c0de6b9c <nbgl_layoutAddHeader+0x408>
c0de6b2a:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de6b2e:	f000 fc86 	bl	c0de743e <OUTLINED_FUNCTION_17>
c0de6b32:	7baa      	ldrb	r2, [r5, #14]
c0de6b34:	4606      	mov	r6, r0
c0de6b36:	2aff      	cmp	r2, #255	@ 0xff
c0de6b38:	d008      	beq.n	c0de6b4c <nbgl_layoutAddHeader+0x3b8>
c0de6b3a:	7beb      	ldrb	r3, [r5, #15]
c0de6b3c:	f000 fbe0 	bl	c0de7300 <OUTLINED_FUNCTION_6>
c0de6b40:	2800      	cmp	r0, #0
c0de6b42:	d065      	beq.n	c0de6c10 <nbgl_layoutAddHeader+0x47c>
c0de6b44:	2000      	movs	r0, #0
c0de6b46:	7770      	strb	r0, [r6, #29]
c0de6b48:	2001      	movs	r0, #1
c0de6b4a:	7730      	strb	r0, [r6, #28]
c0de6b4c:	2003      	movs	r0, #3
c0de6b4e:	2106      	movs	r1, #6
c0de6b50:	2260      	movs	r2, #96	@ 0x60
c0de6b52:	77f0      	strb	r0, [r6, #31]
c0de6b54:	75b1      	strb	r1, [r6, #22]
c0de6b56:	7ba9      	ldrb	r1, [r5, #14]
c0de6b58:	71b2      	strb	r2, [r6, #6]
c0de6b5a:	2268      	movs	r2, #104	@ 0x68
c0de6b5c:	f886 0020 	strb.w	r0, [r6, #32]
c0de6b60:	2000      	movs	r0, #0
c0de6b62:	7132      	strb	r2, [r6, #4]
c0de6b64:	4632      	mov	r2, r6
c0de6b66:	f886 0026 	strb.w	r0, [r6, #38]	@ 0x26
c0de6b6a:	71f0      	strb	r0, [r6, #7]
c0de6b6c:	7170      	strb	r0, [r6, #5]
c0de6b6e:	f802 0f25 	strb.w	r0, [r2, #37]!
c0de6b72:	70d0      	strb	r0, [r2, #3]
c0de6b74:	7090      	strb	r0, [r2, #2]
c0de6b76:	f1a1 00ff 	sub.w	r0, r1, #255	@ 0xff
c0de6b7a:	fab0 f080 	clz	r0, r0
c0de6b7e:	0940      	lsrs	r0, r0, #5
c0de6b80:	0040      	lsls	r0, r0, #1
c0de6b82:	f886 0021 	strb.w	r0, [r6, #33]	@ 0x21
c0de6b86:	f000 fc9f 	bl	c0de74c8 <OUTLINED_FUNCTION_23>
c0de6b8a:	4631      	mov	r1, r6
c0de6b8c:	0e02      	lsrs	r2, r0, #24
c0de6b8e:	f000 fbe3 	bl	c0de7358 <OUTLINED_FUNCTION_9>
c0de6b92:	2008      	movs	r0, #8
c0de6b94:	68e1      	ldr	r1, [r4, #12]
c0de6b96:	77b0      	strb	r0, [r6, #30]
c0de6b98:	f000 fdf2 	bl	c0de7780 <OUTLINED_FUNCTION_61>
c0de6b9c:	2000      	movs	r0, #0
c0de6b9e:	71c8      	strb	r0, [r1, #7]
c0de6ba0:	2060      	movs	r0, #96	@ 0x60
c0de6ba2:	7188      	strb	r0, [r1, #6]
c0de6ba4:	7868      	ldrb	r0, [r5, #1]
c0de6ba6:	b160      	cbz	r0, c0de6bc2 <nbgl_layoutAddHeader+0x42e>
c0de6ba8:	f000 fca1 	bl	c0de74ee <OUTLINED_FUNCTION_25>
c0de6bac:	68e1      	ldr	r1, [r4, #12]
c0de6bae:	f000 fb8a 	bl	c0de72c6 <OUTLINED_FUNCTION_4>
c0de6bb2:	2103      	movs	r1, #3
c0de6bb4:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de6bb8:	2108      	movs	r1, #8
c0de6bba:	7581      	strb	r1, [r0, #22]
c0de6bbc:	68e1      	ldr	r1, [r4, #12]
c0de6bbe:	f000 fddf 	bl	c0de7780 <OUTLINED_FUNCTION_61>
c0de6bc2:	68a0      	ldr	r0, [r4, #8]
c0de6bc4:	6001      	str	r1, [r0, #0]
c0de6bc6:	68e0      	ldr	r0, [r4, #12]
c0de6bc8:	f8d4 10a0 	ldr.w	r1, [r4, #160]	@ 0xa0
c0de6bcc:	4602      	mov	r2, r0
c0de6bce:	f812 3f06 	ldrb.w	r3, [r2, #6]!
c0de6bd2:	7856      	ldrb	r6, [r2, #1]
c0de6bd4:	f801 0f12 	strb.w	r0, [r1, #18]!
c0de6bd8:	ea43 2306 	orr.w	r3, r3, r6, lsl #8
c0de6bdc:	f811 6d0c 	ldrb.w	r6, [r1, #-12]!
c0de6be0:	784f      	ldrb	r7, [r1, #1]
c0de6be2:	ea46 2607 	orr.w	r6, r6, r7, lsl #8
c0de6be6:	1af3      	subs	r3, r6, r3
c0de6be8:	700b      	strb	r3, [r1, #0]
c0de6bea:	0a1b      	lsrs	r3, r3, #8
c0de6bec:	704b      	strb	r3, [r1, #1]
c0de6bee:	782b      	ldrb	r3, [r5, #0]
c0de6bf0:	f884 30aa 	strb.w	r3, [r4, #170]	@ 0xaa
c0de6bf4:	0e03      	lsrs	r3, r0, #24
c0de6bf6:	73cb      	strb	r3, [r1, #15]
c0de6bf8:	0c03      	lsrs	r3, r0, #16
c0de6bfa:	0a00      	lsrs	r0, r0, #8
c0de6bfc:	7348      	strb	r0, [r1, #13]
c0de6bfe:	2007      	movs	r0, #7
c0de6c00:	738b      	strb	r3, [r1, #14]
c0de6c02:	7408      	strb	r0, [r1, #16]
c0de6c04:	7810      	ldrb	r0, [r2, #0]
c0de6c06:	7851      	ldrb	r1, [r2, #1]
c0de6c08:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de6c0c:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de6c10:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de6c14:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de6c18:	00006077 	.word	0x00006077

c0de6c1c <nbgl_layoutAddProgressIndicator>:
c0de6c1c:	b51f      	push	{r0, r1, r2, r3, r4, lr}
c0de6c1e:	9c07      	ldr	r4, [sp, #28]
c0de6c20:	f88d 1008 	strb.w	r1, [sp, #8]
c0de6c24:	2100      	movs	r1, #0
c0de6c26:	f88d 300a 	strb.w	r3, [sp, #10]
c0de6c2a:	f88d 2009 	strb.w	r2, [sp, #9]
c0de6c2e:	9101      	str	r1, [sp, #4]
c0de6c30:	2103      	movs	r1, #3
c0de6c32:	f88d 400d 	strb.w	r4, [sp, #13]
c0de6c36:	24ff      	movs	r4, #255	@ 0xff
c0de6c38:	f8ad 1000 	strh.w	r1, [sp]
c0de6c3c:	4669      	mov	r1, sp
c0de6c3e:	f88d 400c 	strb.w	r4, [sp, #12]
c0de6c42:	9c06      	ldr	r4, [sp, #24]
c0de6c44:	f88d 400b 	strb.w	r4, [sp, #11]
c0de6c48:	f7ff fda4 	bl	c0de6794 <nbgl_layoutAddHeader>
c0de6c4c:	b004      	add	sp, #16
c0de6c4e:	bd10      	pop	{r4, pc}

c0de6c50 <nbgl_layoutAddSpinner>:
c0de6c50:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de6c54:	b088      	sub	sp, #32
c0de6c56:	2800      	cmp	r0, #0
c0de6c58:	f000 811a 	beq.w	c0de6e90 <nbgl_layoutAddSpinner+0x240>
c0de6c5c:	9101      	str	r1, [sp, #4]
c0de6c5e:	f000 fdf1 	bl	c0de7844 <OUTLINED_FUNCTION_79>
c0de6c62:	469a      	mov	sl, r3
c0de6c64:	2601      	movs	r6, #1
c0de6c66:	4f8d      	ldr	r7, [pc, #564]	@ (c0de6e9c <nbgl_layoutAddSpinner+0x24c>)
c0de6c68:	9203      	str	r2, [sp, #12]
c0de6c6a:	08c1      	lsrs	r1, r0, #3
c0de6c6c:	2001      	movs	r0, #1
c0de6c6e:	447f      	add	r7, pc
c0de6c70:	47b8      	blx	r7
c0de6c72:	4683      	mov	fp, r0
c0de6c74:	2003      	movs	r0, #3
c0de6c76:	463d      	mov	r5, r7
c0de6c78:	f88b 0020 	strb.w	r0, [fp, #32]
c0de6c7c:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de6c80:	08c1      	lsrs	r1, r0, #3
c0de6c82:	2003      	movs	r0, #3
c0de6c84:	f004 fc24 	bl	c0deb4d0 <nbgl_containerPoolGet>
c0de6c88:	2100      	movs	r1, #0
c0de6c8a:	f88b 6005 	strb.w	r6, [fp, #5]
c0de6c8e:	465e      	mov	r6, fp
c0de6c90:	270d      	movs	r7, #13
c0de6c92:	f88b 101f 	strb.w	r1, [fp, #31]
c0de6c96:	21a0      	movs	r1, #160	@ 0xa0
c0de6c98:	f806 0f22 	strb.w	r0, [r6, #34]!
c0de6c9c:	f88b 1004 	strb.w	r1, [fp, #4]
c0de6ca0:	2105      	movs	r1, #5
c0de6ca2:	f88b 1016 	strb.w	r1, [fp, #22]
c0de6ca6:	0e01      	lsrs	r1, r0, #24
c0de6ca8:	f000 fd65 	bl	c0de7776 <OUTLINED_FUNCTION_60>
c0de6cac:	f88b 0023 	strb.w	r0, [fp, #35]	@ 0x23
c0de6cb0:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de6cb4:	08c1      	lsrs	r1, r0, #3
c0de6cb6:	200d      	movs	r0, #13
c0de6cb8:	47a8      	blx	r5
c0de6cba:	4680      	mov	r8, r0
c0de6cbc:	f880 a01f 	strb.w	sl, [r0, #31]
c0de6cc0:	2002      	movs	r0, #2
c0de6cc2:	7831      	ldrb	r1, [r6, #0]
c0de6cc4:	78b2      	ldrb	r2, [r6, #2]
c0de6cc6:	78f3      	ldrb	r3, [r6, #3]
c0de6cc8:	f8cd a008 	str.w	sl, [sp, #8]
c0de6ccc:	46da      	mov	sl, fp
c0de6cce:	9404      	str	r4, [sp, #16]
c0de6cd0:	f888 0016 	strb.w	r0, [r8, #22]
c0de6cd4:	f89b 0023 	ldrb.w	r0, [fp, #35]	@ 0x23
c0de6cd8:	f000 fcf7 	bl	c0de76ca <OUTLINED_FUNCTION_48>
c0de6cdc:	f8c0 8000 	str.w	r8, [r0]
c0de6ce0:	f81a 0f06 	ldrb.w	r0, [sl, #6]!
c0de6ce4:	f89a 1001 	ldrb.w	r1, [sl, #1]
c0de6ce8:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de6cec:	3030      	adds	r0, #48	@ 0x30
c0de6cee:	f88a 0000 	strb.w	r0, [sl]
c0de6cf2:	0a00      	lsrs	r0, r0, #8
c0de6cf4:	f88a 0001 	strb.w	r0, [sl, #1]
c0de6cf8:	9804      	ldr	r0, [sp, #16]
c0de6cfa:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de6cfe:	08c1      	lsrs	r1, r0, #3
c0de6d00:	2004      	movs	r0, #4
c0de6d02:	47a8      	blx	r5
c0de6d04:	4605      	mov	r5, r0
c0de6d06:	2000      	movs	r0, #0
c0de6d08:	ea4f 2418 	mov.w	r4, r8, lsr #8
c0de6d0c:	77e8      	strb	r0, [r5, #31]
c0de6d0e:	9801      	ldr	r0, [sp, #4]
c0de6d10:	f004 fdba 	bl	c0deb888 <pic>
c0de6d14:	4601      	mov	r1, r0
c0de6d16:	2001      	movs	r0, #1
c0de6d18:	22a0      	movs	r2, #160	@ 0xa0
c0de6d1a:	74ec      	strb	r4, [r5, #19]
c0de6d1c:	462c      	mov	r4, r5
c0de6d1e:	7168      	strb	r0, [r5, #5]
c0de6d20:	f885 0024 	strb.w	r0, [r5, #36]	@ 0x24
c0de6d24:	9803      	ldr	r0, [sp, #12]
c0de6d26:	712a      	strb	r2, [r5, #4]
c0de6d28:	2800      	cmp	r0, #0
c0de6d2a:	bf08      	it	eq
c0de6d2c:	270b      	moveq	r7, #11
c0de6d2e:	f885 7022 	strb.w	r7, [r5, #34]	@ 0x22
c0de6d32:	2005      	movs	r0, #5
c0de6d34:	0e0a      	lsrs	r2, r1, #24
c0de6d36:	2301      	movs	r3, #1
c0de6d38:	f885 0020 	strb.w	r0, [r5, #32]
c0de6d3c:	2008      	movs	r0, #8
c0de6d3e:	75a8      	strb	r0, [r5, #22]
c0de6d40:	4628      	mov	r0, r5
c0de6d42:	f000 fb52 	bl	c0de73ea <OUTLINED_FUNCTION_13>
c0de6d46:	ea4f 6218 	mov.w	r2, r8, lsr #24
c0de6d4a:	f885 0027 	strb.w	r0, [r5, #39]	@ 0x27
c0de6d4e:	2018      	movs	r0, #24
c0de6d50:	f804 0f19 	strb.w	r0, [r4, #25]!
c0de6d54:	2000      	movs	r0, #0
c0de6d56:	7060      	strb	r0, [r4, #1]
c0de6d58:	4628      	mov	r0, r5
c0de6d5a:	f800 8f12 	strb.w	r8, [r0, #18]!
c0de6d5e:	70c2      	strb	r2, [r0, #3]
c0de6d60:	ea4f 4218 	mov.w	r2, r8, lsr #16
c0de6d64:	f8dd 8010 	ldr.w	r8, [sp, #16]
c0de6d68:	7082      	strb	r2, [r0, #2]
c0de6d6a:	4638      	mov	r0, r7
c0de6d6c:	f000 fcc1 	bl	c0de76f2 <OUTLINED_FUNCTION_51>
c0de6d70:	2100      	movs	r1, #0
c0de6d72:	71a8      	strb	r0, [r5, #6]
c0de6d74:	f885 1021 	strb.w	r1, [r5, #33]	@ 0x21
c0de6d78:	0a01      	lsrs	r1, r0, #8
c0de6d7a:	7832      	ldrb	r2, [r6, #0]
c0de6d7c:	78b3      	ldrb	r3, [r6, #2]
c0de6d7e:	78f6      	ldrb	r6, [r6, #3]
c0de6d80:	71e9      	strb	r1, [r5, #7]
c0de6d82:	f89b 1023 	ldrb.w	r1, [fp, #35]	@ 0x23
c0de6d86:	f000 fd53 	bl	c0de7830 <OUTLINED_FUNCTION_76>
c0de6d8a:	7862      	ldrb	r2, [r4, #1]
c0de6d8c:	604d      	str	r5, [r1, #4]
c0de6d8e:	7821      	ldrb	r1, [r4, #0]
c0de6d90:	9c03      	ldr	r4, [sp, #12]
c0de6d92:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de6d96:	f89a 2001 	ldrb.w	r2, [sl, #1]
c0de6d9a:	4408      	add	r0, r1
c0de6d9c:	f89a 1000 	ldrb.w	r1, [sl]
c0de6da0:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de6da4:	4408      	add	r0, r1
c0de6da6:	f88a 0000 	strb.w	r0, [sl]
c0de6daa:	0a00      	lsrs	r0, r0, #8
c0de6dac:	2c00      	cmp	r4, #0
c0de6dae:	f88a 0001 	strb.w	r0, [sl, #1]
c0de6db2:	d051      	beq.n	c0de6e58 <nbgl_layoutAddSpinner+0x208>
c0de6db4:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de6db8:	f000 fa54 	bl	c0de7264 <OUTLINED_FUNCTION_0>
c0de6dbc:	2600      	movs	r6, #0
c0de6dbe:	4607      	mov	r7, r0
c0de6dc0:	77c6      	strb	r6, [r0, #31]
c0de6dc2:	4620      	mov	r0, r4
c0de6dc4:	f004 fd60 	bl	c0deb888 <pic>
c0de6dc8:	4601      	mov	r1, r0
c0de6dca:	0a28      	lsrs	r0, r5, #8
c0de6dcc:	22a0      	movs	r2, #160	@ 0xa0
c0de6dce:	463c      	mov	r4, r7
c0de6dd0:	2301      	movs	r3, #1
c0de6dd2:	74f8      	strb	r0, [r7, #19]
c0de6dd4:	2001      	movs	r0, #1
c0de6dd6:	713a      	strb	r2, [r7, #4]
c0de6dd8:	0e0a      	lsrs	r2, r1, #24
c0de6dda:	7178      	strb	r0, [r7, #5]
c0de6ddc:	f887 0024 	strb.w	r0, [r7, #36]	@ 0x24
c0de6de0:	200b      	movs	r0, #11
c0de6de2:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de6de6:	2005      	movs	r0, #5
c0de6de8:	f887 0020 	strb.w	r0, [r7, #32]
c0de6dec:	2008      	movs	r0, #8
c0de6dee:	75b8      	strb	r0, [r7, #22]
c0de6df0:	4638      	mov	r0, r7
c0de6df2:	f000 fafa 	bl	c0de73ea <OUTLINED_FUNCTION_13>
c0de6df6:	0e2a      	lsrs	r2, r5, #24
c0de6df8:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de6dfc:	2010      	movs	r0, #16
c0de6dfe:	f804 0f19 	strb.w	r0, [r4, #25]!
c0de6e02:	4638      	mov	r0, r7
c0de6e04:	f800 5f12 	strb.w	r5, [r0, #18]!
c0de6e08:	7066      	strb	r6, [r4, #1]
c0de6e0a:	70c2      	strb	r2, [r0, #3]
c0de6e0c:	0c2a      	lsrs	r2, r5, #16
c0de6e0e:	7082      	strb	r2, [r0, #2]
c0de6e10:	200b      	movs	r0, #11
c0de6e12:	f000 fc6e 	bl	c0de76f2 <OUTLINED_FUNCTION_51>
c0de6e16:	0a01      	lsrs	r1, r0, #8
c0de6e18:	7862      	ldrb	r2, [r4, #1]
c0de6e1a:	71b8      	strb	r0, [r7, #6]
c0de6e1c:	f887 6021 	strb.w	r6, [r7, #33]	@ 0x21
c0de6e20:	71f9      	strb	r1, [r7, #7]
c0de6e22:	7821      	ldrb	r1, [r4, #0]
c0de6e24:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de6e28:	eb01 0c00 	add.w	ip, r1, r0
c0de6e2c:	4659      	mov	r1, fp
c0de6e2e:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de6e32:	f811 3d1c 	ldrb.w	r3, [r1, #-28]!
c0de6e36:	784c      	ldrb	r4, [r1, #1]
c0de6e38:	7f4d      	ldrb	r5, [r1, #29]
c0de6e3a:	7f8e      	ldrb	r6, [r1, #30]
c0de6e3c:	7fc8      	ldrb	r0, [r1, #31]
c0de6e3e:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de6e42:	ea42 2205 	orr.w	r2, r2, r5, lsl #8
c0de6e46:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
c0de6e4a:	4463      	add	r3, ip
c0de6e4c:	ea42 4000 	orr.w	r0, r2, r0, lsl #16
c0de6e50:	700b      	strb	r3, [r1, #0]
c0de6e52:	6087      	str	r7, [r0, #8]
c0de6e54:	0a18      	lsrs	r0, r3, #8
c0de6e56:	7048      	strb	r0, [r1, #1]
c0de6e58:	f8d8 00a0 	ldr.w	r0, [r8, #160]	@ 0xa0
c0de6e5c:	f000 fa95 	bl	c0de738a <OUTLINED_FUNCTION_10>
c0de6e60:	f840 b022 	str.w	fp, [r0, r2, lsl #2]
c0de6e64:	f8d8 00a0 	ldr.w	r0, [r8, #160]	@ 0xa0
c0de6e68:	f000 fa00 	bl	c0de726c <OUTLINED_FUNCTION_1>
c0de6e6c:	9802      	ldr	r0, [sp, #8]
c0de6e6e:	28ff      	cmp	r0, #255	@ 0xff
c0de6e70:	d00c      	beq.n	c0de6e8c <nbgl_layoutAddSpinner+0x23c>
c0de6e72:	f44f 70c8 	mov.w	r0, #400	@ 0x190
c0de6e76:	e9cd 0006 	strd	r0, r0, [sp, #24]
c0de6e7a:	4809      	ldr	r0, [pc, #36]	@ (c0de6ea0 <nbgl_layoutAddSpinner+0x250>)
c0de6e7c:	4478      	add	r0, pc
c0de6e7e:	9005      	str	r0, [sp, #20]
c0de6e80:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de6e84:	a905      	add	r1, sp, #20
c0de6e86:	08c0      	lsrs	r0, r0, #3
c0de6e88:	f004 fb13 	bl	c0deb4b2 <nbgl_screenUpdateTicker>
c0de6e8c:	2000      	movs	r0, #0
c0de6e8e:	e001      	b.n	c0de6e94 <nbgl_layoutAddSpinner+0x244>
c0de6e90:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de6e94:	b008      	add	sp, #32
c0de6e96:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de6e9a:	bf00      	nop
c0de6e9c:	00004855 	.word	0x00004855
c0de6ea0:	00000025 	.word	0x00000025

c0de6ea4 <spinnerTickerCallback>:
c0de6ea4:	b570      	push	{r4, r5, r6, lr}
c0de6ea6:	4819      	ldr	r0, [pc, #100]	@ (c0de6f0c <spinnerTickerCallback+0x68>)
c0de6ea8:	4448      	add	r0, r9
c0de6eaa:	6840      	ldr	r0, [r0, #4]
c0de6eac:	b120      	cbz	r0, c0de6eb8 <spinnerTickerCallback+0x14>
c0de6eae:	f890 10ae 	ldrb.w	r1, [r0, #174]	@ 0xae
c0de6eb2:	0209      	lsls	r1, r1, #8
c0de6eb4:	0449      	lsls	r1, r1, #17
c0de6eb6:	d400      	bmi.n	c0de6eba <spinnerTickerCallback+0x16>
c0de6eb8:	bd70      	pop	{r4, r5, r6, pc}
c0de6eba:	f8d0 10a0 	ldr.w	r1, [r0, #160]	@ 0xa0
c0de6ebe:	2300      	movs	r3, #0
c0de6ec0:	f891 2020 	ldrb.w	r2, [r1, #32]
c0de6ec4:	429a      	cmp	r2, r3
c0de6ec6:	d0f7      	beq.n	c0de6eb8 <spinnerTickerCallback+0x14>
c0de6ec8:	4608      	mov	r0, r1
c0de6eca:	f000 fbdf 	bl	c0de768c <OUTLINED_FUNCTION_44>
c0de6ece:	f850 0023 	ldr.w	r0, [r0, r3, lsl #2]
c0de6ed2:	7ec4      	ldrb	r4, [r0, #27]
c0de6ed4:	2c01      	cmp	r4, #1
c0de6ed6:	d108      	bne.n	c0de6eea <spinnerTickerCallback+0x46>
c0de6ed8:	f890 4020 	ldrb.w	r4, [r0, #32]
c0de6edc:	b12c      	cbz	r4, c0de6eea <spinnerTickerCallback+0x46>
c0de6ede:	f000 fbd5 	bl	c0de768c <OUTLINED_FUNCTION_44>
c0de6ee2:	6800      	ldr	r0, [r0, #0]
c0de6ee4:	7ec4      	ldrb	r4, [r0, #27]
c0de6ee6:	2c0d      	cmp	r4, #13
c0de6ee8:	d001      	beq.n	c0de6eee <spinnerTickerCallback+0x4a>
c0de6eea:	3301      	adds	r3, #1
c0de6eec:	e7ea      	b.n	c0de6ec4 <spinnerTickerCallback+0x20>
c0de6eee:	7fc1      	ldrb	r1, [r0, #31]
c0de6ef0:	3101      	adds	r1, #1
c0de6ef2:	b2ca      	uxtb	r2, r1
c0de6ef4:	3a04      	subs	r2, #4
c0de6ef6:	bf18      	it	ne
c0de6ef8:	460a      	movne	r2, r1
c0de6efa:	77c2      	strb	r2, [r0, #31]
c0de6efc:	f004 fabb 	bl	c0deb476 <nbgl_objDraw>
c0de6f00:	2004      	movs	r0, #4
c0de6f02:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de6f06:	f004 baa7 	b.w	c0deb458 <nbgl_refreshSpecial>
c0de6f0a:	bf00      	nop
c0de6f0c:	00001948 	.word	0x00001948

c0de6f10 <nbgl_layoutUpdateSpinner>:
c0de6f10:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de6f14:	2800      	cmp	r0, #0
c0de6f16:	f000 809a 	beq.w	c0de704e <nbgl_layoutUpdateSpinner+0x13e>
c0de6f1a:	f8d0 00a0 	ldr.w	r0, [r0, #160]	@ 0xa0
c0de6f1e:	460e      	mov	r6, r1
c0de6f20:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de6f24:	2900      	cmp	r1, #0
c0de6f26:	f000 8092 	beq.w	c0de704e <nbgl_layoutUpdateSpinner+0x13e>
c0de6f2a:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de6f2e:	4615      	mov	r5, r2
c0de6f30:	f000 fc42 	bl	c0de77b8 <OUTLINED_FUNCTION_66>
c0de6f34:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de6f38:	6807      	ldr	r7, [r0, #0]
c0de6f3a:	7ef8      	ldrb	r0, [r7, #27]
c0de6f3c:	2801      	cmp	r0, #1
c0de6f3e:	f040 8086 	bne.w	c0de704e <nbgl_layoutUpdateSpinner+0x13e>
c0de6f42:	f897 0020 	ldrb.w	r0, [r7, #32]
c0de6f46:	2802      	cmp	r0, #2
c0de6f48:	f0c0 8081 	bcc.w	c0de704e <nbgl_layoutUpdateSpinner+0x13e>
c0de6f4c:	4638      	mov	r0, r7
c0de6f4e:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de6f52:	f000 fc31 	bl	c0de77b8 <OUTLINED_FUNCTION_66>
c0de6f56:	ea41 4100 	orr.w	r1, r1, r0, lsl #16
c0de6f5a:	6808      	ldr	r0, [r1, #0]
c0de6f5c:	7ec2      	ldrb	r2, [r0, #27]
c0de6f5e:	2a0d      	cmp	r2, #13
c0de6f60:	d175      	bne.n	c0de704e <nbgl_layoutUpdateSpinner+0x13e>
c0de6f62:	7fc2      	ldrb	r2, [r0, #31]
c0de6f64:	429a      	cmp	r2, r3
c0de6f66:	d101      	bne.n	c0de6f6c <nbgl_layoutUpdateSpinner+0x5c>
c0de6f68:	2400      	movs	r4, #0
c0de6f6a:	e008      	b.n	c0de6f7e <nbgl_layoutUpdateSpinner+0x6e>
c0de6f6c:	77c3      	strb	r3, [r0, #31]
c0de6f6e:	f004 fa82 	bl	c0deb476 <nbgl_objDraw>
c0de6f72:	4638      	mov	r0, r7
c0de6f74:	2401      	movs	r4, #1
c0de6f76:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de6f7a:	f000 fbc8 	bl	c0de770e <OUTLINED_FUNCTION_53>
c0de6f7e:	f8d1 b004 	ldr.w	fp, [r1, #4]
c0de6f82:	f89b 001b 	ldrb.w	r0, [fp, #27]
c0de6f86:	2804      	cmp	r0, #4
c0de6f88:	d161      	bne.n	c0de704e <nbgl_layoutUpdateSpinner+0x13e>
c0de6f8a:	f000 fc22 	bl	c0de77d2 <OUTLINED_FUNCTION_68>
c0de6f8e:	4606      	mov	r6, r0
c0de6f90:	f004 ffee 	bl	c0debf70 <strlen>
c0de6f94:	4680      	mov	r8, r0
c0de6f96:	4658      	mov	r0, fp
c0de6f98:	f810 1f26 	ldrb.w	r1, [r0, #38]!
c0de6f9c:	f000 fa2c 	bl	c0de73f8 <OUTLINED_FUNCTION_14>
c0de6fa0:	ea41 4a00 	orr.w	sl, r1, r0, lsl #16
c0de6fa4:	4650      	mov	r0, sl
c0de6fa6:	f004 ffe3 	bl	c0debf70 <strlen>
c0de6faa:	4580      	cmp	r8, r0
c0de6fac:	d105      	bne.n	c0de6fba <nbgl_layoutUpdateSpinner+0xaa>
c0de6fae:	4650      	mov	r0, sl
c0de6fb0:	4631      	mov	r1, r6
c0de6fb2:	4642      	mov	r2, r8
c0de6fb4:	f004 ff84 	bl	c0debec0 <memcmp>
c0de6fb8:	b168      	cbz	r0, c0de6fd6 <nbgl_layoutUpdateSpinner+0xc6>
c0de6fba:	4658      	mov	r0, fp
c0de6fbc:	0e31      	lsrs	r1, r6, #24
c0de6fbe:	f800 6f26 	strb.w	r6, [r0, #38]!
c0de6fc2:	70c1      	strb	r1, [r0, #3]
c0de6fc4:	0c31      	lsrs	r1, r6, #16
c0de6fc6:	7081      	strb	r1, [r0, #2]
c0de6fc8:	0a30      	lsrs	r0, r6, #8
c0de6fca:	f88b 0027 	strb.w	r0, [fp, #39]	@ 0x27
c0de6fce:	4658      	mov	r0, fp
c0de6fd0:	f004 fa51 	bl	c0deb476 <nbgl_objDraw>
c0de6fd4:	2402      	movs	r4, #2
c0de6fd6:	b3e5      	cbz	r5, c0de7052 <nbgl_layoutUpdateSpinner+0x142>
c0de6fd8:	f897 0020 	ldrb.w	r0, [r7, #32]
c0de6fdc:	2803      	cmp	r0, #3
c0de6fde:	d136      	bne.n	c0de704e <nbgl_layoutUpdateSpinner+0x13e>
c0de6fe0:	f817 0f22 	ldrb.w	r0, [r7, #34]!
c0de6fe4:	7879      	ldrb	r1, [r7, #1]
c0de6fe6:	78ba      	ldrb	r2, [r7, #2]
c0de6fe8:	78fb      	ldrb	r3, [r7, #3]
c0de6fea:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de6fee:	ea42 2103 	orr.w	r1, r2, r3, lsl #8
c0de6ff2:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de6ff6:	6886      	ldr	r6, [r0, #8]
c0de6ff8:	7ef0      	ldrb	r0, [r6, #27]
c0de6ffa:	2804      	cmp	r0, #4
c0de6ffc:	d127      	bne.n	c0de704e <nbgl_layoutUpdateSpinner+0x13e>
c0de6ffe:	4628      	mov	r0, r5
c0de7000:	f004 fc42 	bl	c0deb888 <pic>
c0de7004:	4605      	mov	r5, r0
c0de7006:	f004 ffb3 	bl	c0debf70 <strlen>
c0de700a:	4680      	mov	r8, r0
c0de700c:	4630      	mov	r0, r6
c0de700e:	f810 1f26 	ldrb.w	r1, [r0, #38]!
c0de7012:	f000 f9f1 	bl	c0de73f8 <OUTLINED_FUNCTION_14>
c0de7016:	ea41 4700 	orr.w	r7, r1, r0, lsl #16
c0de701a:	4638      	mov	r0, r7
c0de701c:	f004 ffa8 	bl	c0debf70 <strlen>
c0de7020:	4580      	cmp	r8, r0
c0de7022:	d105      	bne.n	c0de7030 <nbgl_layoutUpdateSpinner+0x120>
c0de7024:	4638      	mov	r0, r7
c0de7026:	4629      	mov	r1, r5
c0de7028:	4642      	mov	r2, r8
c0de702a:	f004 ff49 	bl	c0debec0 <memcmp>
c0de702e:	b180      	cbz	r0, c0de7052 <nbgl_layoutUpdateSpinner+0x142>
c0de7030:	4630      	mov	r0, r6
c0de7032:	0e29      	lsrs	r1, r5, #24
c0de7034:	f800 5f26 	strb.w	r5, [r0, #38]!
c0de7038:	70c1      	strb	r1, [r0, #3]
c0de703a:	0c29      	lsrs	r1, r5, #16
c0de703c:	7081      	strb	r1, [r0, #2]
c0de703e:	0a28      	lsrs	r0, r5, #8
c0de7040:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de7044:	4630      	mov	r0, r6
c0de7046:	f004 fa16 	bl	c0deb476 <nbgl_objDraw>
c0de704a:	2402      	movs	r4, #2
c0de704c:	e001      	b.n	c0de7052 <nbgl_layoutUpdateSpinner+0x142>
c0de704e:	f04f 34ff 	mov.w	r4, #4294967295	@ 0xffffffff
c0de7052:	4620      	mov	r0, r4
c0de7054:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de7058 <nbgl_layoutDraw>:
c0de7058:	b348      	cbz	r0, c0de70ae <nbgl_layoutDraw+0x56>
c0de705a:	b570      	push	{r4, r5, r6, lr}
c0de705c:	4604      	mov	r4, r0
c0de705e:	6980      	ldr	r0, [r0, #24]
c0de7060:	b128      	cbz	r0, c0de706e <nbgl_layoutDraw+0x16>
c0de7062:	f000 fa1f 	bl	c0de74a4 <OUTLINED_FUNCTION_22>
c0de7066:	f8d4 00a0 	ldr.w	r0, [r4, #160]	@ 0xa0
c0de706a:	f000 f8ff 	bl	c0de726c <OUTLINED_FUNCTION_1>
c0de706e:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de7072:	f894 10ae 	ldrb.w	r1, [r4, #174]	@ 0xae
c0de7076:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de707a:	0781      	lsls	r1, r0, #30
c0de707c:	d513      	bpl.n	c0de70a6 <nbgl_layoutDraw+0x4e>
c0de707e:	b2c0      	uxtb	r0, r0
c0de7080:	f000 fb88 	bl	c0de7794 <OUTLINED_FUNCTION_63>
c0de7084:	2102      	movs	r1, #2
c0de7086:	2301      	movs	r3, #1
c0de7088:	2258      	movs	r2, #88	@ 0x58
c0de708a:	7182      	strb	r2, [r0, #6]
c0de708c:	71c1      	strb	r1, [r0, #7]
c0de708e:	f880 1020 	strb.w	r1, [r0, #32]
c0de7092:	2104      	movs	r1, #4
c0de7094:	7103      	strb	r3, [r0, #4]
c0de7096:	2200      	movs	r2, #0
c0de7098:	f880 3021 	strb.w	r3, [r0, #33]	@ 0x21
c0de709c:	7581      	strb	r1, [r0, #22]
c0de709e:	68a1      	ldr	r1, [r4, #8]
c0de70a0:	7142      	strb	r2, [r0, #5]
c0de70a2:	77c2      	strb	r2, [r0, #31]
c0de70a4:	6148      	str	r0, [r1, #20]
c0de70a6:	f004 f9fa 	bl	c0deb49e <nbgl_screenRedraw>
c0de70aa:	2000      	movs	r0, #0
c0de70ac:	bd70      	pop	{r4, r5, r6, pc}
c0de70ae:	f000 ba95 	b.w	c0de75dc <OUTLINED_FUNCTION_35>
	...

c0de70b4 <nbgl_layoutRelease>:
c0de70b4:	b510      	push	{r4, lr}
c0de70b6:	b138      	cbz	r0, c0de70c8 <nbgl_layoutRelease+0x14>
c0de70b8:	f000 fbc4 	bl	c0de7844 <OUTLINED_FUNCTION_79>
c0de70bc:	f894 10ae 	ldrb.w	r1, [r4, #174]	@ 0xae
c0de70c0:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de70c4:	0441      	lsls	r1, r0, #17
c0de70c6:	d402      	bmi.n	c0de70ce <nbgl_layoutRelease+0x1a>
c0de70c8:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de70cc:	bd10      	pop	{r4, pc}
c0de70ce:	07c1      	lsls	r1, r0, #31
c0de70d0:	d014      	beq.n	c0de70fc <nbgl_layoutRelease+0x48>
c0de70d2:	b2c0      	uxtb	r0, r0
c0de70d4:	08c0      	lsrs	r0, r0, #3
c0de70d6:	f004 f9e7 	bl	c0deb4a8 <nbgl_screenPop>
c0de70da:	480d      	ldr	r0, [pc, #52]	@ (c0de7110 <nbgl_layoutRelease+0x5c>)
c0de70dc:	eb09 0100 	add.w	r1, r9, r0
c0de70e0:	6849      	ldr	r1, [r1, #4]
c0de70e2:	42a1      	cmp	r1, r4
c0de70e4:	d005      	beq.n	c0de70f2 <nbgl_layoutRelease+0x3e>
c0de70e6:	e9d4 0100 	ldrd	r0, r1, [r4]
c0de70ea:	6008      	str	r0, [r1, #0]
c0de70ec:	6820      	ldr	r0, [r4, #0]
c0de70ee:	6041      	str	r1, [r0, #4]
c0de70f0:	e004      	b.n	c0de70fc <nbgl_layoutRelease+0x48>
c0de70f2:	6861      	ldr	r1, [r4, #4]
c0de70f4:	4448      	add	r0, r9
c0de70f6:	6041      	str	r1, [r0, #4]
c0de70f8:	2000      	movs	r0, #0
c0de70fa:	6008      	str	r0, [r1, #0]
c0de70fc:	f814 0fad 	ldrb.w	r0, [r4, #173]!
c0de7100:	7861      	ldrb	r1, [r4, #1]
c0de7102:	7020      	strb	r0, [r4, #0]
c0de7104:	2000      	movs	r0, #0
c0de7106:	f001 01bf 	and.w	r1, r1, #191	@ 0xbf
c0de710a:	7061      	strb	r1, [r4, #1]
c0de710c:	bd10      	pop	{r4, pc}
c0de710e:	bf00      	nop
c0de7110:	00001948 	.word	0x00001948

c0de7114 <getLayoutAndLayoutObj>:
c0de7114:	b570      	push	{r4, r5, r6, lr}
c0de7116:	4c11      	ldr	r4, [pc, #68]	@ (c0de715c <getLayoutAndLayoutObj+0x48>)
c0de7118:	2300      	movs	r3, #0
c0de711a:	600b      	str	r3, [r1, #0]
c0de711c:	444c      	add	r4, r9
c0de711e:	6864      	ldr	r4, [r4, #4]
c0de7120:	b1d4      	cbz	r4, c0de7158 <getLayoutAndLayoutObj+0x44>
c0de7122:	f894 30ad 	ldrb.w	r3, [r4, #173]	@ 0xad
c0de7126:	f894 50ae 	ldrb.w	r5, [r4, #174]	@ 0xae
c0de712a:	ea43 2305 	orr.w	r3, r3, r5, lsl #8
c0de712e:	045d      	lsls	r5, r3, #17
c0de7130:	d401      	bmi.n	c0de7136 <getLayoutAndLayoutObj+0x22>
c0de7132:	2300      	movs	r3, #0
c0de7134:	e010      	b.n	c0de7158 <getLayoutAndLayoutObj+0x44>
c0de7136:	f44f 75fc 	mov.w	r5, #504	@ 0x1f8
c0de713a:	ea05 1553 	and.w	r5, r5, r3, lsr #5
c0de713e:	2300      	movs	r3, #0
c0de7140:	429d      	cmp	r5, r3
c0de7142:	d0f6      	beq.n	c0de7132 <getLayoutAndLayoutObj+0x1e>
c0de7144:	18e6      	adds	r6, r4, r3
c0de7146:	3308      	adds	r3, #8
c0de7148:	6a36      	ldr	r6, [r6, #32]
c0de714a:	4286      	cmp	r6, r0
c0de714c:	d1f8      	bne.n	c0de7140 <getLayoutAndLayoutObj+0x2c>
c0de714e:	18e0      	adds	r0, r4, r3
c0de7150:	2301      	movs	r3, #1
c0de7152:	600c      	str	r4, [r1, #0]
c0de7154:	3018      	adds	r0, #24
c0de7156:	6010      	str	r0, [r2, #0]
c0de7158:	4618      	mov	r0, r3
c0de715a:	bd70      	pop	{r4, r5, r6, pc}
c0de715c:	00001948 	.word	0x00001948

c0de7160 <animTickerCallback>:
c0de7160:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de7162:	483f      	ldr	r0, [pc, #252]	@ (c0de7260 <animTickerCallback+0x100>)
c0de7164:	4448      	add	r0, r9
c0de7166:	6842      	ldr	r2, [r0, #4]
c0de7168:	b3b2      	cbz	r2, c0de71d8 <animTickerCallback+0x78>
c0de716a:	f892 00ad 	ldrb.w	r0, [r2, #173]	@ 0xad
c0de716e:	f892 10ae 	ldrb.w	r1, [r2, #174]	@ 0xae
c0de7172:	ea40 2e01 	orr.w	lr, r0, r1, lsl #8
c0de7176:	ea5f 404e 	movs.w	r0, lr, lsl #17
c0de717a:	d52d      	bpl.n	c0de71d8 <animTickerCallback+0x78>
c0de717c:	f8d2 c0a4 	ldr.w	ip, [r2, #164]	@ 0xa4
c0de7180:	f1bc 0f00 	cmp.w	ip, #0
c0de7184:	d028      	beq.n	c0de71d8 <animTickerCallback+0x78>
c0de7186:	f8d2 40a0 	ldr.w	r4, [r2, #160]	@ 0xa0
c0de718a:	2600      	movs	r6, #0
c0de718c:	f894 5020 	ldrb.w	r5, [r4, #32]
c0de7190:	42b5      	cmp	r5, r6
c0de7192:	d021      	beq.n	c0de71d8 <animTickerCallback+0x78>
c0de7194:	4620      	mov	r0, r4
c0de7196:	f810 7f22 	ldrb.w	r7, [r0, #34]!
c0de719a:	7841      	ldrb	r1, [r0, #1]
c0de719c:	7883      	ldrb	r3, [r0, #2]
c0de719e:	78c0      	ldrb	r0, [r0, #3]
c0de71a0:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de71a4:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de71a8:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de71ac:	f850 0026 	ldr.w	r0, [r0, r6, lsl #2]
c0de71b0:	7ec1      	ldrb	r1, [r0, #27]
c0de71b2:	2901      	cmp	r1, #1
c0de71b4:	d10e      	bne.n	c0de71d4 <animTickerCallback+0x74>
c0de71b6:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de71ba:	7843      	ldrb	r3, [r0, #1]
c0de71bc:	7887      	ldrb	r7, [r0, #2]
c0de71be:	78c0      	ldrb	r0, [r0, #3]
c0de71c0:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de71c4:	ea47 2000 	orr.w	r0, r7, r0, lsl #8
c0de71c8:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de71cc:	6840      	ldr	r0, [r0, #4]
c0de71ce:	7ec1      	ldrb	r1, [r0, #27]
c0de71d0:	2902      	cmp	r1, #2
c0de71d2:	d002      	beq.n	c0de71da <animTickerCallback+0x7a>
c0de71d4:	3601      	adds	r6, #1
c0de71d6:	e7db      	b.n	c0de7190 <animTickerCallback+0x30>
c0de71d8:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0de71da:	f89c 1005 	ldrb.w	r1, [ip, #5]
c0de71de:	b171      	cbz	r1, c0de71fe <animTickerCallback+0x9e>
c0de71e0:	f892 40af 	ldrb.w	r4, [r2, #175]	@ 0xaf
c0de71e4:	ea5f 714e 	movs.w	r1, lr, lsl #29
c0de71e8:	d504      	bpl.n	c0de71f4 <animTickerCallback+0x94>
c0de71ea:	f89c 1004 	ldrb.w	r1, [ip, #4]
c0de71ee:	3901      	subs	r1, #1
c0de71f0:	42a1      	cmp	r1, r4
c0de71f2:	dd0e      	ble.n	c0de7212 <animTickerCallback+0xb2>
c0de71f4:	b9ac      	cbnz	r4, c0de7222 <animTickerCallback+0xc2>
c0de71f6:	f04e 0e04 	orr.w	lr, lr, #4
c0de71fa:	2400      	movs	r4, #0
c0de71fc:	e00b      	b.n	c0de7216 <animTickerCallback+0xb6>
c0de71fe:	f89c 1004 	ldrb.w	r1, [ip, #4]
c0de7202:	f892 30af 	ldrb.w	r3, [r2, #175]	@ 0xaf
c0de7206:	3901      	subs	r1, #1
c0de7208:	4299      	cmp	r1, r3
c0de720a:	bf14      	ite	ne
c0de720c:	3301      	addne	r3, #1
c0de720e:	2300      	moveq	r3, #0
c0de7210:	e00c      	b.n	c0de722c <animTickerCallback+0xcc>
c0de7212:	f02e 0e04 	bic.w	lr, lr, #4
c0de7216:	ea4f 211e 	mov.w	r1, lr, lsr #8
c0de721a:	f882 e0ad 	strb.w	lr, [r2, #173]	@ 0xad
c0de721e:	f882 10ae 	strb.w	r1, [r2, #174]	@ 0xae
c0de7222:	ea5f 714e 	movs.w	r1, lr, lsl #29
c0de7226:	bf54      	ite	pl
c0de7228:	1e63      	subpl	r3, r4, #1
c0de722a:	1c63      	addmi	r3, r4, #1
c0de722c:	f882 30af 	strb.w	r3, [r2, #175]	@ 0xaf
c0de7230:	f8dc 2000 	ldr.w	r2, [ip]
c0de7234:	b2d9      	uxtb	r1, r3
c0de7236:	f852 1021 	ldr.w	r1, [r2, r1, lsl #2]
c0de723a:	4602      	mov	r2, r0
c0de723c:	f802 1f21 	strb.w	r1, [r2, #33]!
c0de7240:	0e0b      	lsrs	r3, r1, #24
c0de7242:	70d3      	strb	r3, [r2, #3]
c0de7244:	0c0b      	lsrs	r3, r1, #16
c0de7246:	0a09      	lsrs	r1, r1, #8
c0de7248:	7093      	strb	r3, [r2, #2]
c0de724a:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de724e:	f004 f912 	bl	c0deb476 <nbgl_objDraw>
c0de7252:	2004      	movs	r0, #4
c0de7254:	2101      	movs	r1, #1
c0de7256:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de725a:	f004 b902 	b.w	c0deb462 <nbgl_refreshSpecialWithPostRefresh>
c0de725e:	bf00      	nop
c0de7260:	00001948 	.word	0x00001948

c0de7264 <OUTLINED_FUNCTION_0>:
c0de7264:	08c1      	lsrs	r1, r0, #3
c0de7266:	2004      	movs	r0, #4
c0de7268:	f004 b92d 	b.w	c0deb4c6 <nbgl_objPoolGet>

c0de726c <OUTLINED_FUNCTION_1>:
c0de726c:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de7270:	3101      	adds	r1, #1
c0de7272:	f880 1020 	strb.w	r1, [r0, #32]
c0de7276:	4770      	bx	lr

c0de7278 <OUTLINED_FUNCTION_2>:
c0de7278:	2202      	movs	r2, #2
c0de727a:	75ba      	strb	r2, [r7, #22]
c0de727c:	4642      	mov	r2, r8
c0de727e:	f812 3f22 	ldrb.w	r3, [r2, #34]!
c0de7282:	7854      	ldrb	r4, [r2, #1]
c0de7284:	7895      	ldrb	r5, [r2, #2]
c0de7286:	78d2      	ldrb	r2, [r2, #3]
c0de7288:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de728c:	ea45 2202 	orr.w	r2, r5, r2, lsl #8
c0de7290:	7ebc      	ldrb	r4, [r7, #26]
c0de7292:	ea43 4202 	orr.w	r2, r3, r2, lsl #16
c0de7296:	7e7b      	ldrb	r3, [r7, #25]
c0de7298:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de729c:	2400      	movs	r4, #0
c0de729e:	4770      	bx	lr

c0de72a0 <OUTLINED_FUNCTION_3>:
c0de72a0:	713a      	strb	r2, [r7, #4]
c0de72a2:	0e0a      	lsrs	r2, r1, #24
c0de72a4:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de72a8:	2005      	movs	r0, #5
c0de72aa:	f887 0020 	strb.w	r0, [r7, #32]
c0de72ae:	4638      	mov	r0, r7
c0de72b0:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de72b4:	70c2      	strb	r2, [r0, #3]
c0de72b6:	0c0a      	lsrs	r2, r1, #16
c0de72b8:	7082      	strb	r2, [r0, #2]
c0de72ba:	0a08      	lsrs	r0, r1, #8
c0de72bc:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de72c0:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de72c4:	4770      	bx	lr

c0de72c6 <OUTLINED_FUNCTION_4>:
c0de72c6:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de72ca:	784e      	ldrb	r6, [r1, #1]
c0de72cc:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de72d0:	788f      	ldrb	r7, [r1, #2]
c0de72d2:	78c9      	ldrb	r1, [r1, #3]
c0de72d4:	ea42 2206 	orr.w	r2, r2, r6, lsl #8
c0de72d8:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de72dc:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de72e0:	f841 0023 	str.w	r0, [r1, r3, lsl #2]
c0de72e4:	4770      	bx	lr

c0de72e6 <OUTLINED_FUNCTION_5>:
c0de72e6:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de72ea:	70c2      	strb	r2, [r0, #3]
c0de72ec:	0c0a      	lsrs	r2, r1, #16
c0de72ee:	7082      	strb	r2, [r0, #2]
c0de72f0:	0a08      	lsrs	r0, r1, #8
c0de72f2:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de72f6:	f885 0027 	strb.w	r0, [r5, #39]	@ 0x27
c0de72fa:	200b      	movs	r0, #11
c0de72fc:	f004 b8fc 	b.w	c0deb4f8 <nbgl_getTextHeightInWidth>

c0de7300 <OUTLINED_FUNCTION_6>:
c0de7300:	4620      	mov	r0, r4
c0de7302:	4631      	mov	r1, r6
c0de7304:	f7fc bc8c 	b.w	c0de3c20 <layoutAddCallbackObj>

c0de7308 <OUTLINED_FUNCTION_7>:
c0de7308:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de730c:	70ca      	strb	r2, [r1, #3]
c0de730e:	0c02      	lsrs	r2, r0, #16
c0de7310:	0a00      	lsrs	r0, r0, #8
c0de7312:	708a      	strb	r2, [r1, #2]
c0de7314:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de7318:	68e0      	ldr	r0, [r4, #12]
c0de731a:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de731e:	7843      	ldrb	r3, [r0, #1]
c0de7320:	f810 cc02 	ldrb.w	ip, [r0, #-2]
c0de7324:	7882      	ldrb	r2, [r0, #2]
c0de7326:	78c0      	ldrb	r0, [r0, #3]
c0de7328:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de732c:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de7330:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de7334:	f840 602c 	str.w	r6, [r0, ip, lsl #2]
c0de7338:	200c      	movs	r0, #12
c0de733a:	4770      	bx	lr

c0de733c <OUTLINED_FUNCTION_8>:
c0de733c:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de7340:	784c      	ldrb	r4, [r1, #1]
c0de7342:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de7346:	788d      	ldrb	r5, [r1, #2]
c0de7348:	78c9      	ldrb	r1, [r1, #3]
c0de734a:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de734e:	ea45 2101 	orr.w	r1, r5, r1, lsl #8
c0de7352:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de7356:	4770      	bx	lr

c0de7358 <OUTLINED_FUNCTION_9>:
c0de7358:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de735c:	70ca      	strb	r2, [r1, #3]
c0de735e:	0c02      	lsrs	r2, r0, #16
c0de7360:	0a00      	lsrs	r0, r0, #8
c0de7362:	708a      	strb	r2, [r1, #2]
c0de7364:	f886 002f 	strb.w	r0, [r6, #47]	@ 0x2f
c0de7368:	68e0      	ldr	r0, [r4, #12]
c0de736a:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de736e:	7843      	ldrb	r3, [r0, #1]
c0de7370:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de7374:	7887      	ldrb	r7, [r0, #2]
c0de7376:	78c0      	ldrb	r0, [r0, #3]
c0de7378:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de737c:	ea47 2000 	orr.w	r0, r7, r0, lsl #8
c0de7380:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de7384:	f840 6022 	str.w	r6, [r0, r2, lsl #2]
c0de7388:	4770      	bx	lr

c0de738a <OUTLINED_FUNCTION_10>:
c0de738a:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de738e:	7843      	ldrb	r3, [r0, #1]
c0de7390:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de7394:	7884      	ldrb	r4, [r0, #2]
c0de7396:	78c0      	ldrb	r0, [r0, #3]
c0de7398:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de739c:	ea44 2000 	orr.w	r0, r4, r0, lsl #8
c0de73a0:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de73a4:	4770      	bx	lr

c0de73a6 <OUTLINED_FUNCTION_11>:
c0de73a6:	784b      	ldrb	r3, [r1, #1]
c0de73a8:	788e      	ldrb	r6, [r1, #2]
c0de73aa:	78c9      	ldrb	r1, [r1, #3]
c0de73ac:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de73b0:	ea46 2101 	orr.w	r1, r6, r1, lsl #8
c0de73b4:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de73b8:	4770      	bx	lr

c0de73ba <OUTLINED_FUNCTION_12>:
c0de73ba:	70ca      	strb	r2, [r1, #3]
c0de73bc:	0c02      	lsrs	r2, r0, #16
c0de73be:	0a00      	lsrs	r0, r0, #8
c0de73c0:	708a      	strb	r2, [r1, #2]
c0de73c2:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de73c6:	6920      	ldr	r0, [r4, #16]
c0de73c8:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de73cc:	7843      	ldrb	r3, [r0, #1]
c0de73ce:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de73d2:	7887      	ldrb	r7, [r0, #2]
c0de73d4:	78c0      	ldrb	r0, [r0, #3]
c0de73d6:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de73da:	ea47 2000 	orr.w	r0, r7, r0, lsl #8
c0de73de:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de73e2:	f840 6022 	str.w	r6, [r0, r2, lsl #2]
c0de73e6:	200c      	movs	r0, #12
c0de73e8:	4770      	bx	lr

c0de73ea <OUTLINED_FUNCTION_13>:
c0de73ea:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de73ee:	70c2      	strb	r2, [r0, #3]
c0de73f0:	0c0a      	lsrs	r2, r1, #16
c0de73f2:	7082      	strb	r2, [r0, #2]
c0de73f4:	0a08      	lsrs	r0, r1, #8
c0de73f6:	4770      	bx	lr

c0de73f8 <OUTLINED_FUNCTION_14>:
c0de73f8:	7842      	ldrb	r2, [r0, #1]
c0de73fa:	7883      	ldrb	r3, [r0, #2]
c0de73fc:	78c0      	ldrb	r0, [r0, #3]
c0de73fe:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de7402:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de7406:	4770      	bx	lr

c0de7408 <OUTLINED_FUNCTION_15>:
c0de7408:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de740c:	70ca      	strb	r2, [r1, #3]
c0de740e:	0c02      	lsrs	r2, r0, #16
c0de7410:	0a00      	lsrs	r0, r0, #8
c0de7412:	708a      	strb	r2, [r1, #2]
c0de7414:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de7418:	6920      	ldr	r0, [r4, #16]
c0de741a:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de741e:	7843      	ldrb	r3, [r0, #1]
c0de7420:	f810 cc02 	ldrb.w	ip, [r0, #-2]
c0de7424:	7882      	ldrb	r2, [r0, #2]
c0de7426:	78c0      	ldrb	r0, [r0, #3]
c0de7428:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de742c:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de7430:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de7434:	4770      	bx	lr

c0de7436 <OUTLINED_FUNCTION_16>:
c0de7436:	08c1      	lsrs	r1, r0, #3
c0de7438:	2001      	movs	r0, #1
c0de743a:	f004 b844 	b.w	c0deb4c6 <nbgl_objPoolGet>

c0de743e <OUTLINED_FUNCTION_17>:
c0de743e:	08c1      	lsrs	r1, r0, #3
c0de7440:	2005      	movs	r0, #5
c0de7442:	f004 b840 	b.w	c0deb4c6 <nbgl_objPoolGet>

c0de7446 <OUTLINED_FUNCTION_18>:
c0de7446:	6920      	ldr	r0, [r4, #16]
c0de7448:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de744c:	7843      	ldrb	r3, [r0, #1]
c0de744e:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de7452:	7887      	ldrb	r7, [r0, #2]
c0de7454:	78c0      	ldrb	r0, [r0, #3]
c0de7456:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de745a:	ea47 2000 	orr.w	r0, r7, r0, lsl #8
c0de745e:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de7462:	f840 6022 	str.w	r6, [r0, r2, lsl #2]
c0de7466:	200c      	movs	r0, #12
c0de7468:	f886 801c 	strb.w	r8, [r6, #28]
c0de746c:	4770      	bx	lr

c0de746e <OUTLINED_FUNCTION_19>:
c0de746e:	0a39      	lsrs	r1, r7, #8
c0de7470:	0e02      	lsrs	r2, r0, #24
c0de7472:	74e9      	strb	r1, [r5, #19]
c0de7474:	4629      	mov	r1, r5
c0de7476:	f801 0f21 	strb.w	r0, [r1, #33]!
c0de747a:	70ca      	strb	r2, [r1, #3]
c0de747c:	0c02      	lsrs	r2, r0, #16
c0de747e:	0a00      	lsrs	r0, r0, #8
c0de7480:	f885 0022 	strb.w	r0, [r5, #34]	@ 0x22
c0de7484:	4628      	mov	r0, r5
c0de7486:	708a      	strb	r2, [r1, #2]
c0de7488:	0e3a      	lsrs	r2, r7, #24
c0de748a:	f800 7f12 	strb.w	r7, [r0, #18]!
c0de748e:	70c2      	strb	r2, [r0, #3]
c0de7490:	0c3a      	lsrs	r2, r7, #16
c0de7492:	7082      	strb	r2, [r0, #2]
c0de7494:	4770      	bx	lr

c0de7496 <OUTLINED_FUNCTION_20>:
c0de7496:	4631      	mov	r1, r6
c0de7498:	f7fc bbc2 	b.w	c0de3c20 <layoutAddCallbackObj>

c0de749c <OUTLINED_FUNCTION_21>:
c0de749c:	08c1      	lsrs	r1, r0, #3
c0de749e:	2002      	movs	r0, #2
c0de74a0:	f004 b811 	b.w	c0deb4c6 <nbgl_objPoolGet>

c0de74a4 <OUTLINED_FUNCTION_22>:
c0de74a4:	f8d4 10a0 	ldr.w	r1, [r4, #160]	@ 0xa0
c0de74a8:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de74ac:	784d      	ldrb	r5, [r1, #1]
c0de74ae:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de74b2:	788e      	ldrb	r6, [r1, #2]
c0de74b4:	78c9      	ldrb	r1, [r1, #3]
c0de74b6:	ea42 2205 	orr.w	r2, r2, r5, lsl #8
c0de74ba:	ea46 2101 	orr.w	r1, r6, r1, lsl #8
c0de74be:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de74c2:	f841 0023 	str.w	r0, [r1, r3, lsl #2]
c0de74c6:	4770      	bx	lr

c0de74c8 <OUTLINED_FUNCTION_23>:
c0de74c8:	6868      	ldr	r0, [r5, #4]
c0de74ca:	f004 b9dd 	b.w	c0deb888 <pic>

c0de74ce <OUTLINED_FUNCTION_24>:
c0de74ce:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de74d2:	784c      	ldrb	r4, [r1, #1]
c0de74d4:	f811 cc02 	ldrb.w	ip, [r1, #-2]
c0de74d8:	788b      	ldrb	r3, [r1, #2]
c0de74da:	78c9      	ldrb	r1, [r1, #3]
c0de74dc:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de74e0:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de74e4:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de74e8:	f841 702c 	str.w	r7, [r1, ip, lsl #2]
c0de74ec:	4770      	bx	lr

c0de74ee <OUTLINED_FUNCTION_25>:
c0de74ee:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de74f2:	08c0      	lsrs	r0, r0, #3
c0de74f4:	f7fe baa8 	b.w	c0de5a48 <createHorizontalLine>

c0de74f8 <OUTLINED_FUNCTION_26>:
c0de74f8:	75aa      	strb	r2, [r5, #22]
c0de74fa:	1c5a      	adds	r2, r3, #1
c0de74fc:	788b      	ldrb	r3, [r1, #2]
c0de74fe:	f800 2c02 	strb.w	r2, [r0, #-2]
c0de7502:	780a      	ldrb	r2, [r1, #0]
c0de7504:	f895 0022 	ldrb.w	r0, [r5, #34]	@ 0x22
c0de7508:	78c9      	ldrb	r1, [r1, #3]
c0de750a:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de750e:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de7512:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de7516:	4770      	bx	lr

c0de7518 <OUTLINED_FUNCTION_27>:
c0de7518:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de751c:	7843      	ldrb	r3, [r0, #1]
c0de751e:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de7522:	7884      	ldrb	r4, [r0, #2]
c0de7524:	78c0      	ldrb	r0, [r0, #3]
c0de7526:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de752a:	ea44 2000 	orr.w	r0, r4, r0, lsl #8
c0de752e:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de7532:	f840 a022 	str.w	sl, [r0, r2, lsl #2]
c0de7536:	4770      	bx	lr

c0de7538 <OUTLINED_FUNCTION_28>:
c0de7538:	f801 0f25 	strb.w	r0, [r1, #37]!
c0de753c:	70ca      	strb	r2, [r1, #3]
c0de753e:	0c02      	lsrs	r2, r0, #16
c0de7540:	0a00      	lsrs	r0, r0, #8
c0de7542:	708a      	strb	r2, [r1, #2]
c0de7544:	f886 0026 	strb.w	r0, [r6, #38]	@ 0x26
c0de7548:	4770      	bx	lr

c0de754a <OUTLINED_FUNCTION_29>:
c0de754a:	4450      	add	r0, sl
c0de754c:	3101      	adds	r1, #1
c0de754e:	f842 7024 	str.w	r7, [r2, r4, lsl #2]
c0de7552:	eb00 0a03 	add.w	sl, r0, r3
c0de7556:	f888 1020 	strb.w	r1, [r8, #32]
c0de755a:	4770      	bx	lr

c0de755c <OUTLINED_FUNCTION_30>:
c0de755c:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de7560:	4630      	mov	r0, r6
c0de7562:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de7566:	70c2      	strb	r2, [r0, #3]
c0de7568:	0c0a      	lsrs	r2, r1, #16
c0de756a:	7082      	strb	r2, [r0, #2]
c0de756c:	0a08      	lsrs	r0, r1, #8
c0de756e:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de7572:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de7576:	200b      	movs	r0, #11
c0de7578:	4770      	bx	lr

c0de757a <OUTLINED_FUNCTION_31>:
c0de757a:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de757e:	70ca      	strb	r2, [r1, #3]
c0de7580:	0c02      	lsrs	r2, r0, #16
c0de7582:	0a00      	lsrs	r0, r0, #8
c0de7584:	708a      	strb	r2, [r1, #2]
c0de7586:	f886 002f 	strb.w	r0, [r6, #47]	@ 0x2f
c0de758a:	4770      	bx	lr

c0de758c <OUTLINED_FUNCTION_32>:
c0de758c:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de7590:	784e      	ldrb	r6, [r1, #1]
c0de7592:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de7596:	788f      	ldrb	r7, [r1, #2]
c0de7598:	78c9      	ldrb	r1, [r1, #3]
c0de759a:	ea42 2206 	orr.w	r2, r2, r6, lsl #8
c0de759e:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de75a2:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de75a6:	4770      	bx	lr

c0de75a8 <OUTLINED_FUNCTION_33>:
c0de75a8:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de75ac:	784c      	ldrb	r4, [r1, #1]
c0de75ae:	788e      	ldrb	r6, [r1, #2]
c0de75b0:	78cd      	ldrb	r5, [r1, #3]
c0de75b2:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de75b6:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de75ba:	ea46 2405 	orr.w	r4, r6, r5, lsl #8
c0de75be:	ea42 4204 	orr.w	r2, r2, r4, lsl #16
c0de75c2:	4770      	bx	lr

c0de75c4 <OUTLINED_FUNCTION_34>:
c0de75c4:	f8da 00a0 	ldr.w	r0, [sl, #160]	@ 0xa0
c0de75c8:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de75cc:	3101      	adds	r1, #1
c0de75ce:	f880 1020 	strb.w	r1, [r0, #32]
c0de75d2:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de75d6:	08c1      	lsrs	r1, r0, #3
c0de75d8:	2004      	movs	r0, #4
c0de75da:	4730      	bx	r6

c0de75dc <OUTLINED_FUNCTION_35>:
c0de75dc:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de75e0:	4770      	bx	lr

c0de75e2 <OUTLINED_FUNCTION_36>:
c0de75e2:	77b0      	strb	r0, [r6, #30]
c0de75e4:	6960      	ldr	r0, [r4, #20]
c0de75e6:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de75ea:	7842      	ldrb	r2, [r0, #1]
c0de75ec:	7883      	ldrb	r3, [r0, #2]
c0de75ee:	78c0      	ldrb	r0, [r0, #3]
c0de75f0:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de75f4:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de75f8:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de75fc:	4770      	bx	lr

c0de75fe <OUTLINED_FUNCTION_37>:
c0de75fe:	4642      	mov	r2, r8
c0de7600:	f812 3f22 	ldrb.w	r3, [r2, #34]!
c0de7604:	7854      	ldrb	r4, [r2, #1]
c0de7606:	7895      	ldrb	r5, [r2, #2]
c0de7608:	78d2      	ldrb	r2, [r2, #3]
c0de760a:	ea45 2202 	orr.w	r2, r5, r2, lsl #8
c0de760e:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de7612:	463d      	mov	r5, r7
c0de7614:	ea43 4202 	orr.w	r2, r3, r2, lsl #16
c0de7618:	4770      	bx	lr

c0de761a <OUTLINED_FUNCTION_38>:
c0de761a:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de761e:	7843      	ldrb	r3, [r0, #1]
c0de7620:	7885      	ldrb	r5, [r0, #2]
c0de7622:	78c6      	ldrb	r6, [r0, #3]
c0de7624:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de7628:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de762c:	ea45 2306 	orr.w	r3, r5, r6, lsl #8
c0de7630:	ea41 4103 	orr.w	r1, r1, r3, lsl #16
c0de7634:	4770      	bx	lr

c0de7636 <OUTLINED_FUNCTION_39>:
c0de7636:	f886 0021 	strb.w	r0, [r6, #33]	@ 0x21
c0de763a:	f896 0022 	ldrb.w	r0, [r6, #34]	@ 0x22
c0de763e:	f040 0001 	orr.w	r0, r0, #1
c0de7642:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de7646:	4630      	mov	r0, r6
c0de7648:	f003 bf15 	b.w	c0deb476 <nbgl_objDraw>

c0de764c <OUTLINED_FUNCTION_40>:
c0de764c:	4620      	mov	r0, r4
c0de764e:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de7652:	7842      	ldrb	r2, [r0, #1]
c0de7654:	7883      	ldrb	r3, [r0, #2]
c0de7656:	78c0      	ldrb	r0, [r0, #3]
c0de7658:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de765c:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de7660:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de7664:	4770      	bx	lr

c0de7666 <OUTLINED_FUNCTION_41>:
c0de7666:	0e02      	lsrs	r2, r0, #24
c0de7668:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de766c:	70ca      	strb	r2, [r1, #3]
c0de766e:	0c02      	lsrs	r2, r0, #16
c0de7670:	0a00      	lsrs	r0, r0, #8
c0de7672:	708a      	strb	r2, [r1, #2]
c0de7674:	4770      	bx	lr

c0de7676 <OUTLINED_FUNCTION_42>:
c0de7676:	4601      	mov	r1, r0
c0de7678:	2001      	movs	r0, #1
c0de767a:	22a0      	movs	r2, #160	@ 0xa0
c0de767c:	2301      	movs	r3, #1
c0de767e:	7178      	strb	r0, [r7, #5]
c0de7680:	f887 0024 	strb.w	r0, [r7, #36]	@ 0x24
c0de7684:	4770      	bx	lr

c0de7686 <OUTLINED_FUNCTION_43>:
c0de7686:	200b      	movs	r0, #11
c0de7688:	f003 bf36 	b.w	c0deb4f8 <nbgl_getTextHeightInWidth>

c0de768c <OUTLINED_FUNCTION_44>:
c0de768c:	f810 4f22 	ldrb.w	r4, [r0, #34]!
c0de7690:	7845      	ldrb	r5, [r0, #1]
c0de7692:	7886      	ldrb	r6, [r0, #2]
c0de7694:	78c0      	ldrb	r0, [r0, #3]
c0de7696:	ea44 2405 	orr.w	r4, r4, r5, lsl #8
c0de769a:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
c0de769e:	ea44 4000 	orr.w	r0, r4, r0, lsl #16
c0de76a2:	4770      	bx	lr

c0de76a4 <OUTLINED_FUNCTION_45>:
c0de76a4:	70c2      	strb	r2, [r0, #3]
c0de76a6:	0c0a      	lsrs	r2, r1, #16
c0de76a8:	7082      	strb	r2, [r0, #2]
c0de76aa:	0a08      	lsrs	r0, r1, #8
c0de76ac:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de76b0:	4770      	bx	lr

c0de76b2 <OUTLINED_FUNCTION_46>:
c0de76b2:	0a01      	lsrs	r1, r0, #8
c0de76b4:	71b8      	strb	r0, [r7, #6]
c0de76b6:	71f9      	strb	r1, [r7, #7]
c0de76b8:	f898 1020 	ldrb.w	r1, [r8, #32]
c0de76bc:	2900      	cmp	r1, #0
c0de76be:	4770      	bx	lr

c0de76c0 <OUTLINED_FUNCTION_47>:
c0de76c0:	70ca      	strb	r2, [r1, #3]
c0de76c2:	0c02      	lsrs	r2, r0, #16
c0de76c4:	0a00      	lsrs	r0, r0, #8
c0de76c6:	708a      	strb	r2, [r1, #2]
c0de76c8:	4770      	bx	lr

c0de76ca <OUTLINED_FUNCTION_48>:
c0de76ca:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de76ce:	ea42 2103 	orr.w	r1, r2, r3, lsl #8
c0de76d2:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de76d6:	4770      	bx	lr

c0de76d8 <OUTLINED_FUNCTION_49>:
c0de76d8:	68a8      	ldr	r0, [r5, #8]
c0de76da:	f004 b8d5 	b.w	c0deb888 <pic>

c0de76de <OUTLINED_FUNCTION_50>:
c0de76de:	4630      	mov	r0, r6
c0de76e0:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de76e4:	70c2      	strb	r2, [r0, #3]
c0de76e6:	0c0a      	lsrs	r2, r1, #16
c0de76e8:	7082      	strb	r2, [r0, #2]
c0de76ea:	0a08      	lsrs	r0, r1, #8
c0de76ec:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de76f0:	4770      	bx	lr

c0de76f2 <OUTLINED_FUNCTION_51>:
c0de76f2:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de76f6:	f003 beff 	b.w	c0deb4f8 <nbgl_getTextHeightInWidth>

c0de76fa <OUTLINED_FUNCTION_52>:
c0de76fa:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de76fe:	0e0a      	lsrs	r2, r1, #24
c0de7700:	70c2      	strb	r2, [r0, #3]
c0de7702:	0c0a      	lsrs	r2, r1, #16
c0de7704:	7082      	strb	r2, [r0, #2]
c0de7706:	0a08      	lsrs	r0, r1, #8
c0de7708:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de770c:	4770      	bx	lr

c0de770e <OUTLINED_FUNCTION_53>:
c0de770e:	7842      	ldrb	r2, [r0, #1]
c0de7710:	7883      	ldrb	r3, [r0, #2]
c0de7712:	78c0      	ldrb	r0, [r0, #3]
c0de7714:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de7718:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de771c:	ea41 4100 	orr.w	r1, r1, r0, lsl #16
c0de7720:	4770      	bx	lr

c0de7722 <OUTLINED_FUNCTION_54>:
c0de7722:	f891 2020 	ldrb.w	r2, [r1, #32]
c0de7726:	3201      	adds	r2, #1
c0de7728:	f881 2020 	strb.w	r2, [r1, #32]
c0de772c:	b004      	add	sp, #16
c0de772e:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de7732 <OUTLINED_FUNCTION_55>:
c0de7732:	7981      	ldrb	r1, [r0, #6]
c0de7734:	79c0      	ldrb	r0, [r0, #7]
c0de7736:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de773a:	4770      	bx	lr

c0de773c <OUTLINED_FUNCTION_56>:
c0de773c:	f801 0f21 	strb.w	r0, [r1, #33]!
c0de7740:	70ca      	strb	r2, [r1, #3]
c0de7742:	0c02      	lsrs	r2, r0, #16
c0de7744:	0a00      	lsrs	r0, r0, #8
c0de7746:	708a      	strb	r2, [r1, #2]
c0de7748:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de774c:	4770      	bx	lr

c0de774e <OUTLINED_FUNCTION_57>:
c0de774e:	f8d4 00a0 	ldr.w	r0, [r4, #160]	@ 0xa0
c0de7752:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de7756:	3101      	adds	r1, #1
c0de7758:	f880 1020 	strb.w	r1, [r0, #32]
c0de775c:	2000      	movs	r0, #0
c0de775e:	4770      	bx	lr

c0de7760 <OUTLINED_FUNCTION_58>:
c0de7760:	4631      	mov	r1, r6
c0de7762:	0e02      	lsrs	r2, r0, #24
c0de7764:	f886 a01d 	strb.w	sl, [r6, #29]
c0de7768:	4770      	bx	lr

c0de776a <OUTLINED_FUNCTION_59>:
c0de776a:	f886 b01c 	strb.w	fp, [r6, #28]
c0de776e:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de7772:	2005      	movs	r0, #5
c0de7774:	4770      	bx	lr

c0de7776 <OUTLINED_FUNCTION_60>:
c0de7776:	70f1      	strb	r1, [r6, #3]
c0de7778:	0c01      	lsrs	r1, r0, #16
c0de777a:	0a00      	lsrs	r0, r0, #8
c0de777c:	70b1      	strb	r1, [r6, #2]
c0de777e:	4770      	bx	lr

c0de7780 <OUTLINED_FUNCTION_61>:
c0de7780:	f891 0020 	ldrb.w	r0, [r1, #32]
c0de7784:	3001      	adds	r0, #1
c0de7786:	f881 0020 	strb.w	r0, [r1, #32]
c0de778a:	4770      	bx	lr

c0de778c <OUTLINED_FUNCTION_62>:
c0de778c:	08c1      	lsrs	r1, r0, #3
c0de778e:	2004      	movs	r0, #4
c0de7790:	f003 be9e 	b.w	c0deb4d0 <nbgl_containerPoolGet>

c0de7794 <OUTLINED_FUNCTION_63>:
c0de7794:	08c1      	lsrs	r1, r0, #3
c0de7796:	2003      	movs	r0, #3
c0de7798:	f003 be95 	b.w	c0deb4c6 <nbgl_objPoolGet>

c0de779c <OUTLINED_FUNCTION_64>:
c0de779c:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de77a0:	08c1      	lsrs	r1, r0, #3
c0de77a2:	2005      	movs	r0, #5
c0de77a4:	f003 be94 	b.w	c0deb4d0 <nbgl_containerPoolGet>

c0de77a8 <OUTLINED_FUNCTION_65>:
c0de77a8:	71d1      	strb	r1, [r2, #7]
c0de77aa:	7190      	strb	r0, [r2, #6]
c0de77ac:	f892 0020 	ldrb.w	r0, [r2, #32]
c0de77b0:	3001      	adds	r0, #1
c0de77b2:	f882 0020 	strb.w	r0, [r2, #32]
c0de77b6:	4770      	bx	lr

c0de77b8 <OUTLINED_FUNCTION_66>:
c0de77b8:	7842      	ldrb	r2, [r0, #1]
c0de77ba:	7884      	ldrb	r4, [r0, #2]
c0de77bc:	78c0      	ldrb	r0, [r0, #3]
c0de77be:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de77c2:	ea44 2000 	orr.w	r0, r4, r0, lsl #8
c0de77c6:	4770      	bx	lr

c0de77c8 <OUTLINED_FUNCTION_67>:
c0de77c8:	7a2a      	ldrb	r2, [r5, #8]
c0de77ca:	7a6b      	ldrb	r3, [r5, #9]
c0de77cc:	4620      	mov	r0, r4
c0de77ce:	f7fc ba27 	b.w	c0de3c20 <layoutAddCallbackObj>

c0de77d2 <OUTLINED_FUNCTION_68>:
c0de77d2:	4630      	mov	r0, r6
c0de77d4:	f004 b858 	b.w	c0deb888 <pic>

c0de77d8 <OUTLINED_FUNCTION_69>:
c0de77d8:	f801 7f12 	strb.w	r7, [r1, #18]!
c0de77dc:	70ca      	strb	r2, [r1, #3]
c0de77de:	0c3a      	lsrs	r2, r7, #16
c0de77e0:	708a      	strb	r2, [r1, #2]
c0de77e2:	4770      	bx	lr

c0de77e4 <OUTLINED_FUNCTION_70>:
c0de77e4:	758a      	strb	r2, [r1, #22]
c0de77e6:	460a      	mov	r2, r1
c0de77e8:	f802 0f22 	strb.w	r0, [r2, #34]!
c0de77ec:	0c00      	lsrs	r0, r0, #16
c0de77ee:	7090      	strb	r0, [r2, #2]
c0de77f0:	4770      	bx	lr

c0de77f2 <OUTLINED_FUNCTION_71>:
c0de77f2:	f8bb 3020 	ldrh.w	r3, [fp, #32]
c0de77f6:	3318      	adds	r3, #24
c0de77f8:	0a1c      	lsrs	r4, r3, #8
c0de77fa:	767b      	strb	r3, [r7, #25]
c0de77fc:	76bc      	strb	r4, [r7, #26]
c0de77fe:	4770      	bx	lr

c0de7800 <OUTLINED_FUNCTION_72>:
c0de7800:	f842 5023 	str.w	r5, [r2, r3, lsl #2]
c0de7804:	2200      	movs	r2, #0
c0de7806:	762a      	strb	r2, [r5, #24]
c0de7808:	2210      	movs	r2, #16
c0de780a:	75ea      	strb	r2, [r5, #23]
c0de780c:	4770      	bx	lr

c0de780e <OUTLINED_FUNCTION_73>:
c0de780e:	f88d 0010 	strb.w	r0, [sp, #16]
c0de7812:	8928      	ldrh	r0, [r5, #8]
c0de7814:	f8ad 000c 	strh.w	r0, [sp, #12]
c0de7818:	4640      	mov	r0, r8
c0de781a:	4770      	bx	lr

c0de781c <OUTLINED_FUNCTION_74>:
c0de781c:	08c9      	lsrs	r1, r1, #3
c0de781e:	f003 be57 	b.w	c0deb4d0 <nbgl_containerPoolGet>

c0de7822 <OUTLINED_FUNCTION_75>:
c0de7822:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de7826:	7893      	ldrb	r3, [r2, #2]
c0de7828:	78d2      	ldrb	r2, [r2, #3]
c0de782a:	ea43 2202 	orr.w	r2, r3, r2, lsl #8
c0de782e:	4770      	bx	lr

c0de7830 <OUTLINED_FUNCTION_76>:
c0de7830:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0de7834:	ea43 2206 	orr.w	r2, r3, r6, lsl #8
c0de7838:	ea41 4102 	orr.w	r1, r1, r2, lsl #16
c0de783c:	4770      	bx	lr

c0de783e <OUTLINED_FUNCTION_78>:
c0de783e:	200d      	movs	r0, #13
c0de7840:	f003 be5a 	b.w	c0deb4f8 <nbgl_getTextHeightInWidth>

c0de7844 <OUTLINED_FUNCTION_79>:
c0de7844:	4604      	mov	r4, r0
c0de7846:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de784a:	4770      	bx	lr

c0de784c <OUTLINED_FUNCTION_80>:
c0de784c:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de7850:	08c1      	lsrs	r1, r0, #3
c0de7852:	2004      	movs	r0, #4
c0de7854:	4720      	bx	r4

c0de7856 <OUTLINED_FUNCTION_81>:
c0de7856:	ea40 4002 	orr.w	r0, r0, r2, lsl #16
c0de785a:	7802      	ldrb	r2, [r0, #0]
c0de785c:	7840      	ldrb	r0, [r0, #1]
c0de785e:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de7862:	4770      	bx	lr

c0de7864 <layoutNavigationCallback>:
c0de7864:	b570      	push	{r4, r5, r6, lr}
c0de7866:	290a      	cmp	r1, #10
c0de7868:	d029      	beq.n	c0de78be <layoutNavigationCallback+0x5a>
c0de786a:	2909      	cmp	r1, #9
c0de786c:	d02b      	beq.n	c0de78c6 <layoutNavigationCallback+0x62>
c0de786e:	2900      	cmp	r1, #0
c0de7870:	d14a      	bne.n	c0de7908 <layoutNavigationCallback+0xa4>
c0de7872:	4604      	mov	r4, r0
c0de7874:	7bc1      	ldrb	r1, [r0, #15]
c0de7876:	f814 5f0e 	ldrb.w	r5, [r4, #14]!
c0de787a:	ea45 2101 	orr.w	r1, r5, r1, lsl #8
c0de787e:	78a5      	ldrb	r5, [r4, #2]
c0de7880:	78e4      	ldrb	r4, [r4, #3]
c0de7882:	ea45 2404 	orr.w	r4, r5, r4, lsl #8
c0de7886:	ea41 4104 	orr.w	r1, r1, r4, lsl #16
c0de788a:	460d      	mov	r5, r1
c0de788c:	f891 4023 	ldrb.w	r4, [r1, #35]	@ 0x23
c0de7890:	f815 6f22 	ldrb.w	r6, [r5, #34]!
c0de7894:	ea46 2404 	orr.w	r4, r6, r4, lsl #8
c0de7898:	78ae      	ldrb	r6, [r5, #2]
c0de789a:	78ed      	ldrb	r5, [r5, #3]
c0de789c:	ea46 2505 	orr.w	r5, r6, r5, lsl #8
c0de78a0:	ea44 4405 	orr.w	r4, r4, r5, lsl #16
c0de78a4:	6825      	ldr	r5, [r4, #0]
c0de78a6:	4285      	cmp	r5, r0
c0de78a8:	d01e      	beq.n	c0de78e8 <layoutNavigationCallback+0x84>
c0de78aa:	6865      	ldr	r5, [r4, #4]
c0de78ac:	4285      	cmp	r5, r0
c0de78ae:	d01e      	beq.n	c0de78ee <layoutNavigationCallback+0x8a>
c0de78b0:	68a4      	ldr	r4, [r4, #8]
c0de78b2:	4284      	cmp	r4, r0
c0de78b4:	d128      	bne.n	c0de7908 <layoutNavigationCallback+0xa4>
c0de78b6:	2a01      	cmp	r2, #1
c0de78b8:	d81d      	bhi.n	c0de78f6 <layoutNavigationCallback+0x92>
c0de78ba:	7818      	ldrb	r0, [r3, #0]
c0de78bc:	e01f      	b.n	c0de78fe <layoutNavigationCallback+0x9a>
c0de78be:	2a01      	cmp	r2, #1
c0de78c0:	d805      	bhi.n	c0de78ce <layoutNavigationCallback+0x6a>
c0de78c2:	7819      	ldrb	r1, [r3, #0]
c0de78c4:	e007      	b.n	c0de78d6 <layoutNavigationCallback+0x72>
c0de78c6:	7819      	ldrb	r1, [r3, #0]
c0de78c8:	b1f1      	cbz	r1, c0de7908 <layoutNavigationCallback+0xa4>
c0de78ca:	3901      	subs	r1, #1
c0de78cc:	e004      	b.n	c0de78d8 <layoutNavigationCallback+0x74>
c0de78ce:	7819      	ldrb	r1, [r3, #0]
c0de78d0:	1e54      	subs	r4, r2, #1
c0de78d2:	428c      	cmp	r4, r1
c0de78d4:	d918      	bls.n	c0de7908 <layoutNavigationCallback+0xa4>
c0de78d6:	3101      	adds	r1, #1
c0de78d8:	7019      	strb	r1, [r3, #0]
c0de78da:	b2cb      	uxtb	r3, r1
c0de78dc:	4611      	mov	r1, r2
c0de78de:	461a      	mov	r2, r3
c0de78e0:	f000 f814 	bl	c0de790c <configButtons>
c0de78e4:	2001      	movs	r0, #1
c0de78e6:	bd70      	pop	{r4, r5, r6, pc}
c0de78e8:	20ff      	movs	r0, #255	@ 0xff
c0de78ea:	7018      	strb	r0, [r3, #0]
c0de78ec:	e7fa      	b.n	c0de78e4 <layoutNavigationCallback+0x80>
c0de78ee:	7818      	ldrb	r0, [r3, #0]
c0de78f0:	b150      	cbz	r0, c0de7908 <layoutNavigationCallback+0xa4>
c0de78f2:	3801      	subs	r0, #1
c0de78f4:	e004      	b.n	c0de7900 <layoutNavigationCallback+0x9c>
c0de78f6:	7818      	ldrb	r0, [r3, #0]
c0de78f8:	1e54      	subs	r4, r2, #1
c0de78fa:	4284      	cmp	r4, r0
c0de78fc:	d904      	bls.n	c0de7908 <layoutNavigationCallback+0xa4>
c0de78fe:	3001      	adds	r0, #1
c0de7900:	7018      	strb	r0, [r3, #0]
c0de7902:	b2c3      	uxtb	r3, r0
c0de7904:	4608      	mov	r0, r1
c0de7906:	e7e9      	b.n	c0de78dc <layoutNavigationCallback+0x78>
c0de7908:	2000      	movs	r0, #0
c0de790a:	bd70      	pop	{r4, r5, r6, pc}

c0de790c <configButtons>:
c0de790c:	b5b0      	push	{r4, r5, r7, lr}
c0de790e:	f810 3f22 	ldrb.w	r3, [r0, #34]!
c0de7912:	7844      	ldrb	r4, [r0, #1]
c0de7914:	7885      	ldrb	r5, [r0, #2]
c0de7916:	78c0      	ldrb	r0, [r0, #3]
c0de7918:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de791c:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
c0de7920:	ea43 4000 	orr.w	r0, r3, r0, lsl #16
c0de7924:	e9d0 3001 	ldrd	r3, r0, [r0, #4]
c0de7928:	b12b      	cbz	r3, c0de7936 <configButtons+0x2a>
c0de792a:	fab2 f482 	clz	r4, r2
c0de792e:	0964      	lsrs	r4, r4, #5
c0de7930:	0064      	lsls	r4, r4, #1
c0de7932:	f883 4021 	strb.w	r4, [r3, #33]	@ 0x21
c0de7936:	2902      	cmp	r1, #2
c0de7938:	d307      	bcc.n	c0de794a <configButtons+0x3e>
c0de793a:	43d2      	mvns	r2, r2
c0de793c:	4411      	add	r1, r2
c0de793e:	fab1 f181 	clz	r1, r1
c0de7942:	0949      	lsrs	r1, r1, #5
c0de7944:	0049      	lsls	r1, r1, #1
c0de7946:	f880 1021 	strb.w	r1, [r0, #33]	@ 0x21
c0de794a:	bdb0      	pop	{r4, r5, r7, pc}

c0de794c <layoutNavigationPopulate>:
c0de794c:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de7950:	4680      	mov	r8, r0
c0de7952:	78c8      	ldrb	r0, [r1, #3]
c0de7954:	4616      	mov	r6, r2
c0de7956:	460d      	mov	r5, r1
c0de7958:	b338      	cbz	r0, c0de79aa <layoutNavigationPopulate+0x5e>
c0de795a:	2005      	movs	r0, #5
c0de795c:	4631      	mov	r1, r6
c0de795e:	2405      	movs	r4, #5
c0de7960:	f003 fdb1 	bl	c0deb4c6 <nbgl_objPoolGet>
c0de7964:	4976      	ldr	r1, [pc, #472]	@ (c0de7b40 <layoutNavigationPopulate+0x1f4>)
c0de7966:	4479      	add	r1, pc
c0de7968:	f000 f8ff 	bl	c0de7b6a <OUTLINED_FUNCTION_1>
c0de796c:	70d3      	strb	r3, [r2, #3]
c0de796e:	7091      	strb	r1, [r2, #2]
c0de7970:	2258      	movs	r2, #88	@ 0x58
c0de7972:	2100      	movs	r1, #0
c0de7974:	2303      	movs	r3, #3
c0de7976:	7182      	strb	r2, [r0, #6]
c0de7978:	7102      	strb	r2, [r0, #4]
c0de797a:	2201      	movs	r2, #1
c0de797c:	71c1      	strb	r1, [r0, #7]
c0de797e:	7141      	strb	r1, [r0, #5]
c0de7980:	7601      	strb	r1, [r0, #24]
c0de7982:	7741      	strb	r1, [r0, #29]
c0de7984:	f880 3020 	strb.w	r3, [r0, #32]
c0de7988:	77c3      	strb	r3, [r0, #31]
c0de798a:	f880 3022 	strb.w	r3, [r0, #34]	@ 0x22
c0de798e:	7702      	strb	r2, [r0, #28]
c0de7990:	7782      	strb	r2, [r0, #30]
c0de7992:	786a      	ldrb	r2, [r5, #1]
c0de7994:	2a01      	cmp	r2, #1
c0de7996:	bf88      	it	hi
c0de7998:	2404      	movhi	r4, #4
c0de799a:	7584      	strb	r4, [r0, #22]
c0de799c:	bf88      	it	hi
c0de799e:	2101      	movhi	r1, #1
c0de79a0:	00c9      	lsls	r1, r1, #3
c0de79a2:	75c1      	strb	r1, [r0, #23]
c0de79a4:	f000 f8d4 	bl	c0de7b50 <OUTLINED_FUNCTION_0>
c0de79a8:	6008      	str	r0, [r1, #0]
c0de79aa:	7928      	ldrb	r0, [r5, #4]
c0de79ac:	b310      	cbz	r0, c0de79f4 <layoutNavigationPopulate+0xa8>
c0de79ae:	2005      	movs	r0, #5
c0de79b0:	4631      	mov	r1, r6
c0de79b2:	f003 fd88 	bl	c0deb4c6 <nbgl_objPoolGet>
c0de79b6:	4963      	ldr	r1, [pc, #396]	@ (c0de7b44 <layoutNavigationPopulate+0x1f8>)
c0de79b8:	4479      	add	r1, pc
c0de79ba:	f000 f8d6 	bl	c0de7b6a <OUTLINED_FUNCTION_1>
c0de79be:	7091      	strb	r1, [r2, #2]
c0de79c0:	2100      	movs	r1, #0
c0de79c2:	70d3      	strb	r3, [r2, #3]
c0de79c4:	2260      	movs	r2, #96	@ 0x60
c0de79c6:	2301      	movs	r3, #1
c0de79c8:	71c1      	strb	r1, [r0, #7]
c0de79ca:	7141      	strb	r1, [r0, #5]
c0de79cc:	7741      	strb	r1, [r0, #29]
c0de79ce:	7601      	strb	r1, [r0, #24]
c0de79d0:	2103      	movs	r1, #3
c0de79d2:	7182      	strb	r2, [r0, #6]
c0de79d4:	2268      	movs	r2, #104	@ 0x68
c0de79d6:	7703      	strb	r3, [r0, #28]
c0de79d8:	f880 1020 	strb.w	r1, [r0, #32]
c0de79dc:	77c1      	strb	r1, [r0, #31]
c0de79de:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de79e2:	2102      	movs	r1, #2
c0de79e4:	7102      	strb	r2, [r0, #4]
c0de79e6:	75c2      	strb	r2, [r0, #23]
c0de79e8:	7781      	strb	r1, [r0, #30]
c0de79ea:	2106      	movs	r1, #6
c0de79ec:	7581      	strb	r1, [r0, #22]
c0de79ee:	f000 f8af 	bl	c0de7b50 <OUTLINED_FUNCTION_0>
c0de79f2:	6048      	str	r0, [r1, #4]
c0de79f4:	2005      	movs	r0, #5
c0de79f6:	4631      	mov	r1, r6
c0de79f8:	f003 fd65 	bl	c0deb4c6 <nbgl_objPoolGet>
c0de79fc:	4c52      	ldr	r4, [pc, #328]	@ (c0de7b48 <layoutNavigationPopulate+0x1fc>)
c0de79fe:	447c      	add	r4, pc
c0de7a00:	0a21      	lsrs	r1, r4, #8
c0de7a02:	0e22      	lsrs	r2, r4, #24
c0de7a04:	f880 102f 	strb.w	r1, [r0, #47]	@ 0x2f
c0de7a08:	4601      	mov	r1, r0
c0de7a0a:	f801 4f2e 	strb.w	r4, [r1, #46]!
c0de7a0e:	70ca      	strb	r2, [r1, #3]
c0de7a10:	0c22      	lsrs	r2, r4, #16
c0de7a12:	708a      	strb	r2, [r1, #2]
c0de7a14:	2100      	movs	r1, #0
c0de7a16:	2260      	movs	r2, #96	@ 0x60
c0de7a18:	7182      	strb	r2, [r0, #6]
c0de7a1a:	2268      	movs	r2, #104	@ 0x68
c0de7a1c:	71c1      	strb	r1, [r0, #7]
c0de7a1e:	7141      	strb	r1, [r0, #5]
c0de7a20:	7741      	strb	r1, [r0, #29]
c0de7a22:	f880 1021 	strb.w	r1, [r0, #33]	@ 0x21
c0de7a26:	2103      	movs	r1, #3
c0de7a28:	7102      	strb	r2, [r0, #4]
c0de7a2a:	2201      	movs	r2, #1
c0de7a2c:	f880 1020 	strb.w	r1, [r0, #32]
c0de7a30:	77c1      	strb	r1, [r0, #31]
c0de7a32:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de7a36:	7781      	strb	r1, [r0, #30]
c0de7a38:	2106      	movs	r1, #6
c0de7a3a:	7581      	strb	r1, [r0, #22]
c0de7a3c:	7702      	strb	r2, [r0, #28]
c0de7a3e:	4641      	mov	r1, r8
c0de7a40:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de7a44:	784b      	ldrb	r3, [r1, #1]
c0de7a46:	788f      	ldrb	r7, [r1, #2]
c0de7a48:	78c9      	ldrb	r1, [r1, #3]
c0de7a4a:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de7a4e:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de7a52:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de7a56:	6088      	str	r0, [r1, #8]
c0de7a58:	79a8      	ldrb	r0, [r5, #6]
c0de7a5a:	2800      	cmp	r0, #0
c0de7a5c:	d067      	beq.n	c0de7b2e <layoutNavigationPopulate+0x1e2>
c0de7a5e:	79e8      	ldrb	r0, [r5, #7]
c0de7a60:	2800      	cmp	r0, #0
c0de7a62:	d04c      	beq.n	c0de7afe <layoutNavigationPopulate+0x1b2>
c0de7a64:	2004      	movs	r0, #4
c0de7a66:	4631      	mov	r1, r6
c0de7a68:	f003 fd2d 	bl	c0deb4c6 <nbgl_objPoolGet>
c0de7a6c:	4606      	mov	r6, r0
c0de7a6e:	7868      	ldrb	r0, [r5, #1]
c0de7a70:	78a9      	ldrb	r1, [r5, #2]
c0de7a72:	f04f 0a0b 	mov.w	sl, #11
c0de7a76:	9000      	str	r0, [sp, #0]
c0de7a78:	4830      	ldr	r0, [pc, #192]	@ (c0de7b3c <layoutNavigationPopulate+0x1f0>)
c0de7a7a:	1c4b      	adds	r3, r1, #1
c0de7a7c:	210b      	movs	r1, #11
c0de7a7e:	4a33      	ldr	r2, [pc, #204]	@ (c0de7b4c <layoutNavigationPopulate+0x200>)
c0de7a80:	eb09 0700 	add.w	r7, r9, r0
c0de7a84:	447a      	add	r2, pc
c0de7a86:	4638      	mov	r0, r7
c0de7a88:	f003 fd6c 	bl	c0deb564 <snprintf>
c0de7a8c:	0a38      	lsrs	r0, r7, #8
c0de7a8e:	0e39      	lsrs	r1, r7, #24
c0de7a90:	f06f 0201 	mvn.w	r2, #1
c0de7a94:	f886 a022 	strb.w	sl, [r6, #34]	@ 0x22
c0de7a98:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de7a9c:	4630      	mov	r0, r6
c0de7a9e:	f800 7f26 	strb.w	r7, [r0, #38]!
c0de7aa2:	70c1      	strb	r1, [r0, #3]
c0de7aa4:	0c39      	lsrs	r1, r7, #16
c0de7aa6:	7081      	strb	r1, [r0, #2]
c0de7aa8:	2000      	movs	r0, #0
c0de7aaa:	7861      	ldrb	r1, [r4, #1]
c0de7aac:	71f0      	strb	r0, [r6, #7]
c0de7aae:	2060      	movs	r0, #96	@ 0x60
c0de7ab0:	71b0      	strb	r0, [r6, #6]
c0de7ab2:	2001      	movs	r0, #1
c0de7ab4:	77f0      	strb	r0, [r6, #31]
c0de7ab6:	2005      	movs	r0, #5
c0de7ab8:	f886 0020 	strb.w	r0, [r6, #32]
c0de7abc:	75b0      	strb	r0, [r6, #22]
c0de7abe:	7820      	ldrb	r0, [r4, #0]
c0de7ac0:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de7ac4:	f1c0 0168 	rsb	r1, r0, #104	@ 0x68
c0de7ac8:	fb91 f1f2 	sdiv	r1, r1, r2
c0de7acc:	1a08      	subs	r0, r1, r0
c0de7ace:	4641      	mov	r1, r8
c0de7ad0:	f811 cf22 	ldrb.w	ip, [r1, #34]!
c0de7ad4:	f811 3c1e 	ldrb.w	r3, [r1, #-30]
c0de7ad8:	f811 4c1d 	ldrb.w	r4, [r1, #-29]
c0de7adc:	784f      	ldrb	r7, [r1, #1]
c0de7ade:	788a      	ldrb	r2, [r1, #2]
c0de7ae0:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de7ae4:	eb03 0040 	add.w	r0, r3, r0, lsl #1
c0de7ae8:	7130      	strb	r0, [r6, #4]
c0de7aea:	0a00      	lsrs	r0, r0, #8
c0de7aec:	78c9      	ldrb	r1, [r1, #3]
c0de7aee:	7170      	strb	r0, [r6, #5]
c0de7af0:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0de7af4:	ea4c 2207 	orr.w	r2, ip, r7, lsl #8
c0de7af8:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de7afc:	60ce      	str	r6, [r1, #12]
c0de7afe:	7928      	ldrb	r0, [r5, #4]
c0de7b00:	b1a8      	cbz	r0, c0de7b2e <layoutNavigationPopulate+0x1e2>
c0de7b02:	4640      	mov	r0, r8
c0de7b04:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de7b08:	7842      	ldrb	r2, [r0, #1]
c0de7b0a:	7883      	ldrb	r3, [r0, #2]
c0de7b0c:	78c0      	ldrb	r0, [r0, #3]
c0de7b0e:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de7b12:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de7b16:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de7b1a:	6840      	ldr	r0, [r0, #4]
c0de7b1c:	f810 1f17 	ldrb.w	r1, [r0, #23]!
c0de7b20:	7842      	ldrb	r2, [r0, #1]
c0de7b22:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de7b26:	314f      	adds	r1, #79	@ 0x4f
c0de7b28:	7001      	strb	r1, [r0, #0]
c0de7b2a:	0a09      	lsrs	r1, r1, #8
c0de7b2c:	7041      	strb	r1, [r0, #1]
c0de7b2e:	7869      	ldrb	r1, [r5, #1]
c0de7b30:	78aa      	ldrb	r2, [r5, #2]
c0de7b32:	4640      	mov	r0, r8
c0de7b34:	e8bd 45f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de7b38:	f7ff bee8 	b.w	c0de790c <configButtons>
c0de7b3c:	00001950 	.word	0x00001950
c0de7b40:	0000520f 	.word	0x0000520f
c0de7b44:	000050a3 	.word	0x000050a3
c0de7b48:	000050e0 	.word	0x000050e0
c0de7b4c:	00005b92 	.word	0x00005b92

c0de7b50 <OUTLINED_FUNCTION_0>:
c0de7b50:	4641      	mov	r1, r8
c0de7b52:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de7b56:	784b      	ldrb	r3, [r1, #1]
c0de7b58:	788c      	ldrb	r4, [r1, #2]
c0de7b5a:	78c9      	ldrb	r1, [r1, #3]
c0de7b5c:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de7b60:	ea44 2101 	orr.w	r1, r4, r1, lsl #8
c0de7b64:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de7b68:	4770      	bx	lr

c0de7b6a <OUTLINED_FUNCTION_1>:
c0de7b6a:	0a0a      	lsrs	r2, r1, #8
c0de7b6c:	0e0b      	lsrs	r3, r1, #24
c0de7b6e:	f880 202f 	strb.w	r2, [r0, #47]	@ 0x2f
c0de7b72:	4602      	mov	r2, r0
c0de7b74:	f802 1f2e 	strb.w	r1, [r2, #46]!
c0de7b78:	0c09      	lsrs	r1, r1, #16
c0de7b7a:	4770      	bx	lr

c0de7b7c <nbgl_pageDrawLedgerInfo>:
c0de7b7c:	b510      	push	{r4, lr}
c0de7b7e:	b08c      	sub	sp, #48	@ 0x30
c0de7b80:	9008      	str	r0, [sp, #32]
c0de7b82:	f44f 7080 	mov.w	r0, #256	@ 0x100
c0de7b86:	f88d 301c 	strb.w	r3, [sp, #28]
c0de7b8a:	f8ad 0014 	strh.w	r0, [sp, #20]
c0de7b8e:	2009      	movs	r0, #9
c0de7b90:	f88d 001d 	strb.w	r0, [sp, #29]
c0de7b94:	481c      	ldr	r0, [pc, #112]	@ (c0de7c08 <nbgl_pageDrawLedgerInfo+0x8c>)
c0de7b96:	4478      	add	r0, pc
c0de7b98:	9006      	str	r0, [sp, #24]
c0de7b9a:	2000      	movs	r0, #0
c0de7b9c:	9004      	str	r0, [sp, #16]
c0de7b9e:	4b1b      	ldr	r3, [pc, #108]	@ (c0de7c0c <nbgl_pageDrawLedgerInfo+0x90>)
c0de7ba0:	e9cd 2000 	strd	r2, r0, [sp]
c0de7ba4:	784a      	ldrb	r2, [r1, #1]
c0de7ba6:	78cc      	ldrb	r4, [r1, #3]
c0de7ba8:	447b      	add	r3, pc
c0de7baa:	e9cd 0302 	strd	r0, r3, [sp, #8]
c0de7bae:	7808      	ldrb	r0, [r1, #0]
c0de7bb0:	788b      	ldrb	r3, [r1, #2]
c0de7bb2:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de7bb6:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de7bba:	460a      	mov	r2, r1
c0de7bbc:	ea40 4003 	orr.w	r0, r0, r3, lsl #16
c0de7bc0:	f812 3f08 	ldrb.w	r3, [r2, #8]!
c0de7bc4:	9009      	str	r0, [sp, #36]	@ 0x24
c0de7bc6:	7a48      	ldrb	r0, [r1, #9]
c0de7bc8:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de7bcc:	7893      	ldrb	r3, [r2, #2]
c0de7bce:	78d2      	ldrb	r2, [r2, #3]
c0de7bd0:	ea43 2202 	orr.w	r2, r3, r2, lsl #8
c0de7bd4:	ea40 4002 	orr.w	r0, r0, r2, lsl #16
c0de7bd8:	900b      	str	r0, [sp, #44]	@ 0x2c
c0de7bda:	7948      	ldrb	r0, [r1, #5]
c0de7bdc:	f811 2f04 	ldrb.w	r2, [r1, #4]!
c0de7be0:	f000 fb79 	bl	c0de82d6 <OUTLINED_FUNCTION_1>
c0de7be4:	900a      	str	r0, [sp, #40]	@ 0x28
c0de7be6:	a805      	add	r0, sp, #20
c0de7be8:	f7fc f83c 	bl	c0de3c64 <nbgl_layoutGet>
c0de7bec:	2160      	movs	r1, #96	@ 0x60
c0de7bee:	4604      	mov	r4, r0
c0de7bf0:	f000 f80e 	bl	c0de7c10 <addEmptyHeader>
c0de7bf4:	4669      	mov	r1, sp
c0de7bf6:	4620      	mov	r0, r4
c0de7bf8:	f7fd ff3a 	bl	c0de5a70 <nbgl_layoutAddCenteredInfo>
c0de7bfc:	4620      	mov	r0, r4
c0de7bfe:	f7ff fa2b 	bl	c0de7058 <nbgl_layoutDraw>
c0de7c02:	4620      	mov	r0, r4
c0de7c04:	b00c      	add	sp, #48	@ 0x30
c0de7c06:	bd10      	pop	{r4, pc}
c0de7c08:	00005e5b 	.word	0x00005e5b
c0de7c0c:	000046fa 	.word	0x000046fa

c0de7c10 <addEmptyHeader>:
c0de7c10:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de7c12:	f8ad 1004 	strh.w	r1, [sp, #4]
c0de7c16:	2100      	movs	r1, #0
c0de7c18:	f8ad 1000 	strh.w	r1, [sp]
c0de7c1c:	4669      	mov	r1, sp
c0de7c1e:	f7fe fdb9 	bl	c0de6794 <nbgl_layoutAddHeader>
c0de7c22:	bd8f      	pop	{r0, r1, r2, r3, r7, pc}

c0de7c24 <nbgl_pageDrawInfo>:
c0de7c24:	b570      	push	{r4, r5, r6, lr}
c0de7c26:	b08c      	sub	sp, #48	@ 0x30
c0de7c28:	460d      	mov	r5, r1
c0de7c2a:	4606      	mov	r6, r0
c0de7c2c:	a805      	add	r0, sp, #20
c0de7c2e:	211c      	movs	r1, #28
c0de7c30:	4614      	mov	r4, r2
c0de7c32:	f004 f931 	bl	c0debe98 <__aeabi_memclr>
c0de7c36:	2001      	movs	r0, #1
c0de7c38:	9608      	str	r6, [sp, #32]
c0de7c3a:	f88d 0015 	strb.w	r0, [sp, #21]
c0de7c3e:	f894 0024 	ldrb.w	r0, [r4, #36]	@ 0x24
c0de7c42:	b948      	cbnz	r0, c0de7c58 <nbgl_pageDrawInfo+0x34>
c0de7c44:	6a20      	ldr	r0, [r4, #32]
c0de7c46:	9006      	str	r0, [sp, #24]
c0de7c48:	f894 0025 	ldrb.w	r0, [r4, #37]	@ 0x25
c0de7c4c:	f88d 001c 	strb.w	r0, [sp, #28]
c0de7c50:	f894 0031 	ldrb.w	r0, [r4, #49]	@ 0x31
c0de7c54:	f88d 001d 	strb.w	r0, [sp, #29]
c0de7c58:	b1f5      	cbz	r5, c0de7c98 <nbgl_pageDrawInfo+0x74>
c0de7c5a:	4629      	mov	r1, r5
c0de7c5c:	7a68      	ldrb	r0, [r5, #9]
c0de7c5e:	78eb      	ldrb	r3, [r5, #3]
c0de7c60:	f811 2f08 	ldrb.w	r2, [r1, #8]!
c0de7c64:	f000 fb37 	bl	c0de82d6 <OUTLINED_FUNCTION_1>
c0de7c68:	4629      	mov	r1, r5
c0de7c6a:	900b      	str	r0, [sp, #44]	@ 0x2c
c0de7c6c:	7968      	ldrb	r0, [r5, #5]
c0de7c6e:	f811 2f04 	ldrb.w	r2, [r1, #4]!
c0de7c72:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de7c76:	788a      	ldrb	r2, [r1, #2]
c0de7c78:	78c9      	ldrb	r1, [r1, #3]
c0de7c7a:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0de7c7e:	78aa      	ldrb	r2, [r5, #2]
c0de7c80:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de7c84:	7869      	ldrb	r1, [r5, #1]
c0de7c86:	900a      	str	r0, [sp, #40]	@ 0x28
c0de7c88:	7828      	ldrb	r0, [r5, #0]
c0de7c8a:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de7c8e:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de7c92:	ea40 4002 	orr.w	r0, r0, r2, lsl #16
c0de7c96:	e000      	b.n	c0de7c9a <nbgl_pageDrawInfo+0x76>
c0de7c98:	2000      	movs	r0, #0
c0de7c9a:	9009      	str	r0, [sp, #36]	@ 0x24
c0de7c9c:	a805      	add	r0, sp, #20
c0de7c9e:	f7fb ffe1 	bl	c0de3c64 <nbgl_layoutGet>
c0de7ca2:	4605      	mov	r5, r0
c0de7ca4:	f894 0024 	ldrb.w	r0, [r4, #36]	@ 0x24
c0de7ca8:	b150      	cbz	r0, c0de7cc0 <nbgl_pageDrawInfo+0x9c>
c0de7caa:	f894 0031 	ldrb.w	r0, [r4, #49]	@ 0x31
c0de7cae:	f894 3025 	ldrb.w	r3, [r4, #37]	@ 0x25
c0de7cb2:	6a22      	ldr	r2, [r4, #32]
c0de7cb4:	f44f 61c0 	mov.w	r1, #1536	@ 0x600
c0de7cb8:	9000      	str	r0, [sp, #0]
c0de7cba:	4628      	mov	r0, r5
c0de7cbc:	f7fc fd40 	bl	c0de4740 <nbgl_layoutAddSwipe>
c0de7cc0:	7d20      	ldrb	r0, [r4, #20]
c0de7cc2:	b118      	cbz	r0, c0de7ccc <nbgl_pageDrawInfo+0xa8>
c0de7cc4:	4628      	mov	r0, r5
c0de7cc6:	2128      	movs	r1, #40	@ 0x28
c0de7cc8:	f7ff ffa2 	bl	c0de7c10 <addEmptyHeader>
c0de7ccc:	4628      	mov	r0, r5
c0de7cce:	4621      	mov	r1, r4
c0de7cd0:	f7fd fece 	bl	c0de5a70 <nbgl_layoutAddCenteredInfo>
c0de7cd4:	6aa0      	ldr	r0, [r4, #40]	@ 0x28
c0de7cd6:	b1b8      	cbz	r0, c0de7d08 <nbgl_pageDrawInfo+0xe4>
c0de7cd8:	7d61      	ldrb	r1, [r4, #21]
c0de7cda:	2904      	cmp	r1, #4
c0de7cdc:	d014      	beq.n	c0de7d08 <nbgl_pageDrawInfo+0xe4>
c0de7cde:	9001      	str	r0, [sp, #4]
c0de7ce0:	2001      	movs	r0, #1
c0de7ce2:	f8ad 000e 	strh.w	r0, [sp, #14]
c0de7ce6:	6ae0      	ldr	r0, [r4, #44]	@ 0x2c
c0de7ce8:	9002      	str	r0, [sp, #8]
c0de7cea:	7de0      	ldrb	r0, [r4, #23]
c0de7cec:	f88d 000c 	strb.w	r0, [sp, #12]
c0de7cf0:	f894 0030 	ldrb.w	r0, [r4, #48]	@ 0x30
c0de7cf4:	f88d 000d 	strb.w	r0, [sp, #13]
c0de7cf8:	f894 0031 	ldrb.w	r0, [r4, #49]	@ 0x31
c0de7cfc:	f88d 0010 	strb.w	r0, [sp, #16]
c0de7d00:	a901      	add	r1, sp, #4
c0de7d02:	4628      	mov	r0, r5
c0de7d04:	f7fe fc2e 	bl	c0de6564 <nbgl_layoutAddButton>
c0de7d08:	69a0      	ldr	r0, [r4, #24]
c0de7d0a:	b140      	cbz	r0, c0de7d1e <nbgl_pageDrawInfo+0xfa>
c0de7d0c:	f003 fdbc 	bl	c0deb888 <pic>
c0de7d10:	7f22      	ldrb	r2, [r4, #28]
c0de7d12:	f894 3031 	ldrb.w	r3, [r4, #49]	@ 0x31
c0de7d16:	4601      	mov	r1, r0
c0de7d18:	4628      	mov	r0, r5
c0de7d1a:	f7fe fd14 	bl	c0de6746 <nbgl_layoutAddFooter>
c0de7d1e:	7d20      	ldrb	r0, [r4, #20]
c0de7d20:	b1b0      	cbz	r0, c0de7d50 <nbgl_pageDrawInfo+0x12c>
c0de7d22:	2801      	cmp	r0, #1
c0de7d24:	d006      	beq.n	c0de7d34 <nbgl_pageDrawInfo+0x110>
c0de7d26:	2802      	cmp	r0, #2
c0de7d28:	d007      	beq.n	c0de7d3a <nbgl_pageDrawInfo+0x116>
c0de7d2a:	2803      	cmp	r0, #3
c0de7d2c:	d136      	bne.n	c0de7d9c <nbgl_pageDrawInfo+0x178>
c0de7d2e:	482e      	ldr	r0, [pc, #184]	@ (c0de7de8 <nbgl_pageDrawInfo+0x1c4>)
c0de7d30:	4478      	add	r0, pc
c0de7d32:	e004      	b.n	c0de7d3e <nbgl_pageDrawInfo+0x11a>
c0de7d34:	482b      	ldr	r0, [pc, #172]	@ (c0de7de4 <nbgl_pageDrawInfo+0x1c0>)
c0de7d36:	4478      	add	r0, pc
c0de7d38:	e001      	b.n	c0de7d3e <nbgl_pageDrawInfo+0x11a>
c0de7d3a:	482c      	ldr	r0, [pc, #176]	@ (c0de7dec <nbgl_pageDrawInfo+0x1c8>)
c0de7d3c:	4478      	add	r0, pc
c0de7d3e:	f003 fda3 	bl	c0deb888 <pic>
c0de7d42:	7da2      	ldrb	r2, [r4, #22]
c0de7d44:	f894 3031 	ldrb.w	r3, [r4, #49]	@ 0x31
c0de7d48:	4601      	mov	r1, r0
c0de7d4a:	4628      	mov	r0, r5
c0de7d4c:	f7fc fd52 	bl	c0de47f4 <nbgl_layoutAddTopRightButton>
c0de7d50:	7d60      	ldrb	r0, [r4, #21]
c0de7d52:	b3c0      	cbz	r0, c0de7dc6 <nbgl_pageDrawInfo+0x1a2>
c0de7d54:	2801      	cmp	r0, #1
c0de7d56:	d023      	beq.n	c0de7da0 <nbgl_pageDrawInfo+0x17c>
c0de7d58:	2802      	cmp	r0, #2
c0de7d5a:	d024      	beq.n	c0de7da6 <nbgl_pageDrawInfo+0x182>
c0de7d5c:	2803      	cmp	r0, #3
c0de7d5e:	d025      	beq.n	c0de7dac <nbgl_pageDrawInfo+0x188>
c0de7d60:	2804      	cmp	r0, #4
c0de7d62:	d11b      	bne.n	c0de7d9c <nbgl_pageDrawInfo+0x178>
c0de7d64:	6aa0      	ldr	r0, [r4, #40]	@ 0x28
c0de7d66:	b3a0      	cbz	r0, c0de7dd2 <nbgl_pageDrawInfo+0x1ae>
c0de7d68:	4922      	ldr	r1, [pc, #136]	@ (c0de7df4 <nbgl_pageDrawInfo+0x1d0>)
c0de7d6a:	4479      	add	r1, pc
c0de7d6c:	e9cd 0101 	strd	r0, r1, [sp, #4]
c0de7d70:	6ae0      	ldr	r0, [r4, #44]	@ 0x2c
c0de7d72:	2102      	movs	r1, #2
c0de7d74:	9003      	str	r0, [sp, #12]
c0de7d76:	7de0      	ldrb	r0, [r4, #23]
c0de7d78:	f88d 0010 	strb.w	r0, [sp, #16]
c0de7d7c:	f894 0031 	ldrb.w	r0, [r4, #49]	@ 0x31
c0de7d80:	f88d 0012 	strb.w	r0, [sp, #18]
c0de7d84:	f894 0030 	ldrb.w	r0, [r4, #48]	@ 0x30
c0de7d88:	2800      	cmp	r0, #0
c0de7d8a:	bf08      	it	eq
c0de7d8c:	2101      	moveq	r1, #1
c0de7d8e:	f88d 1011 	strb.w	r1, [sp, #17]
c0de7d92:	4628      	mov	r0, r5
c0de7d94:	a901      	add	r1, sp, #4
c0de7d96:	f7fe fa15 	bl	c0de61c4 <nbgl_layoutAddChoiceButtons>
c0de7d9a:	e014      	b.n	c0de7dc6 <nbgl_pageDrawInfo+0x1a2>
c0de7d9c:	2500      	movs	r5, #0
c0de7d9e:	e015      	b.n	c0de7dcc <nbgl_pageDrawInfo+0x1a8>
c0de7da0:	4813      	ldr	r0, [pc, #76]	@ (c0de7df0 <nbgl_pageDrawInfo+0x1cc>)
c0de7da2:	4478      	add	r0, pc
c0de7da4:	e004      	b.n	c0de7db0 <nbgl_pageDrawInfo+0x18c>
c0de7da6:	4816      	ldr	r0, [pc, #88]	@ (c0de7e00 <nbgl_pageDrawInfo+0x1dc>)
c0de7da8:	4478      	add	r0, pc
c0de7daa:	e001      	b.n	c0de7db0 <nbgl_pageDrawInfo+0x18c>
c0de7dac:	4813      	ldr	r0, [pc, #76]	@ (c0de7dfc <nbgl_pageDrawInfo+0x1d8>)
c0de7dae:	4478      	add	r0, pc
c0de7db0:	f003 fd6a 	bl	c0deb888 <pic>
c0de7db4:	4601      	mov	r1, r0
c0de7db6:	f894 0031 	ldrb.w	r0, [r4, #49]	@ 0x31
c0de7dba:	7de2      	ldrb	r2, [r4, #23]
c0de7dbc:	2300      	movs	r3, #0
c0de7dbe:	9000      	str	r0, [sp, #0]
c0de7dc0:	4628      	mov	r0, r5
c0de7dc2:	f7fd f8dd 	bl	c0de4f80 <nbgl_layoutAddBottomButton>
c0de7dc6:	4628      	mov	r0, r5
c0de7dc8:	f7ff f946 	bl	c0de7058 <nbgl_layoutDraw>
c0de7dcc:	4628      	mov	r0, r5
c0de7dce:	b00c      	add	sp, #48	@ 0x30
c0de7dd0:	bd70      	pop	{r4, r5, r6, pc}
c0de7dd2:	7de2      	ldrb	r2, [r4, #23]
c0de7dd4:	f894 3031 	ldrb.w	r3, [r4, #49]	@ 0x31
c0de7dd8:	4907      	ldr	r1, [pc, #28]	@ (c0de7df8 <nbgl_pageDrawInfo+0x1d4>)
c0de7dda:	4628      	mov	r0, r5
c0de7ddc:	4479      	add	r1, pc
c0de7dde:	f7fe fcb2 	bl	c0de6746 <nbgl_layoutAddFooter>
c0de7de2:	e7f0      	b.n	c0de7dc6 <nbgl_pageDrawInfo+0x1a2>
c0de7de4:	00005370 	.word	0x00005370
c0de7de8:	00004e88 	.word	0x00004e88
c0de7dec:	00004e39 	.word	0x00004e39
c0de7df0:	00005304 	.word	0x00005304
c0de7df4:	00005d1c 	.word	0x00005d1c
c0de7df8:	00005caa 	.word	0x00005caa
c0de7dfc:	00004e0a 	.word	0x00004e0a
c0de7e00:	00004dcd 	.word	0x00004dcd

c0de7e04 <nbgl_pageDrawConfirmation>:
c0de7e04:	b5b0      	push	{r4, r5, r7, lr}
c0de7e06:	b08c      	sub	sp, #48	@ 0x30
c0de7e08:	4605      	mov	r5, r0
c0de7e0a:	6948      	ldr	r0, [r1, #20]
c0de7e0c:	460c      	mov	r4, r1
c0de7e0e:	f003 fd3b 	bl	c0deb888 <pic>
c0de7e12:	9001      	str	r0, [sp, #4]
c0de7e14:	69a0      	ldr	r0, [r4, #24]
c0de7e16:	b110      	cbz	r0, c0de7e1e <nbgl_pageDrawConfirmation+0x1a>
c0de7e18:	f003 fd36 	bl	c0deb888 <pic>
c0de7e1c:	e001      	b.n	c0de7e22 <nbgl_pageDrawConfirmation+0x1e>
c0de7e1e:	4815      	ldr	r0, [pc, #84]	@ (c0de7e74 <nbgl_pageDrawConfirmation+0x70>)
c0de7e20:	4478      	add	r0, pc
c0de7e22:	2100      	movs	r1, #0
c0de7e24:	7fe2      	ldrb	r2, [r4, #31]
c0de7e26:	9508      	str	r5, [sp, #32]
c0de7e28:	e9cd 0102 	strd	r0, r1, [sp, #8]
c0de7e2c:	2001      	movs	r0, #1
c0de7e2e:	f88d 1011 	strb.w	r1, [sp, #17]
c0de7e32:	9109      	str	r1, [sp, #36]	@ 0x24
c0de7e34:	9106      	str	r1, [sp, #24]
c0de7e36:	7fa1      	ldrb	r1, [r4, #30]
c0de7e38:	f88d 0015 	strb.w	r0, [sp, #21]
c0de7e3c:	7f20      	ldrb	r0, [r4, #28]
c0de7e3e:	f88d 2014 	strb.w	r2, [sp, #20]
c0de7e42:	f88d 1012 	strb.w	r1, [sp, #18]
c0de7e46:	f88d 0010 	strb.w	r0, [sp, #16]
c0de7e4a:	a805      	add	r0, sp, #20
c0de7e4c:	f7fb ff0a 	bl	c0de3c64 <nbgl_layoutGet>
c0de7e50:	2140      	movs	r1, #64	@ 0x40
c0de7e52:	4605      	mov	r5, r0
c0de7e54:	f7ff fedc 	bl	c0de7c10 <addEmptyHeader>
c0de7e58:	a901      	add	r1, sp, #4
c0de7e5a:	4628      	mov	r0, r5
c0de7e5c:	f7fe f9b2 	bl	c0de61c4 <nbgl_layoutAddChoiceButtons>
c0de7e60:	4628      	mov	r0, r5
c0de7e62:	4621      	mov	r1, r4
c0de7e64:	f7fd fe04 	bl	c0de5a70 <nbgl_layoutAddCenteredInfo>
c0de7e68:	4628      	mov	r0, r5
c0de7e6a:	f7ff f8f5 	bl	c0de7058 <nbgl_layoutDraw>
c0de7e6e:	4628      	mov	r0, r5
c0de7e70:	b00c      	add	sp, #48	@ 0x30
c0de7e72:	bdb0      	pop	{r4, r5, r7, pc}
c0de7e74:	000057b5 	.word	0x000057b5

c0de7e78 <nbgl_pageDrawGenericContentExt>:
c0de7e78:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de7e7c:	b096      	sub	sp, #88	@ 0x58
c0de7e7e:	460e      	mov	r6, r1
c0de7e80:	2100      	movs	r1, #0
c0de7e82:	4615      	mov	r5, r2
c0de7e84:	f88d 3008 	strb.w	r3, [sp, #8]
c0de7e88:	e9cd 0105 	strd	r0, r1, [sp, #20]
c0de7e8c:	2001      	movs	r0, #1
c0de7e8e:	f88d 0009 	strb.w	r0, [sp, #9]
c0de7e92:	b10e      	cbz	r6, c0de7e98 <nbgl_pageDrawGenericContentExt+0x20>
c0de7e94:	78f0      	ldrb	r0, [r6, #3]
c0de7e96:	b108      	cbz	r0, c0de7e9c <nbgl_pageDrawGenericContentExt+0x24>
c0de7e98:	9103      	str	r1, [sp, #12]
c0de7e9a:	e007      	b.n	c0de7eac <nbgl_pageDrawGenericContentExt+0x34>
c0de7e9c:	6970      	ldr	r0, [r6, #20]
c0de7e9e:	7cb1      	ldrb	r1, [r6, #18]
c0de7ea0:	9003      	str	r0, [sp, #12]
c0de7ea2:	7970      	ldrb	r0, [r6, #5]
c0de7ea4:	f88d 1010 	strb.w	r1, [sp, #16]
c0de7ea8:	f88d 0011 	strb.w	r0, [sp, #17]
c0de7eac:	a802      	add	r0, sp, #8
c0de7eae:	f7fb fed9 	bl	c0de3c64 <nbgl_layoutGet>
c0de7eb2:	4682      	mov	sl, r0
c0de7eb4:	b17e      	cbz	r6, c0de7ed6 <nbgl_pageDrawGenericContentExt+0x5e>
c0de7eb6:	78f0      	ldrb	r0, [r6, #3]
c0de7eb8:	2801      	cmp	r0, #1
c0de7eba:	d011      	beq.n	c0de7ee0 <nbgl_pageDrawGenericContentExt+0x68>
c0de7ebc:	b958      	cbnz	r0, c0de7ed6 <nbgl_pageDrawGenericContentExt+0x5e>
c0de7ebe:	68b3      	ldr	r3, [r6, #8]
c0de7ec0:	78b2      	ldrb	r2, [r6, #2]
c0de7ec2:	69b1      	ldr	r1, [r6, #24]
c0de7ec4:	b323      	cbz	r3, c0de7f10 <nbgl_pageDrawGenericContentExt+0x98>
c0de7ec6:	7970      	ldrb	r0, [r6, #5]
c0de7ec8:	7b34      	ldrb	r4, [r6, #12]
c0de7eca:	e9cd 4000 	strd	r4, r0, [sp]
c0de7ece:	4650      	mov	r0, sl
c0de7ed0:	f7fe fc4b 	bl	c0de676a <nbgl_layoutAddSplitFooter>
c0de7ed4:	e020      	b.n	c0de7f18 <nbgl_pageDrawGenericContentExt+0xa0>
c0de7ed6:	f04f 0800 	mov.w	r8, #0
c0de7eda:	f44f 7716 	mov.w	r7, #600	@ 0x258
c0de7ede:	e07e      	b.n	c0de7fde <nbgl_pageDrawGenericContentExt+0x166>
c0de7ee0:	68b0      	ldr	r0, [r6, #8]
c0de7ee2:	2800      	cmp	r0, #0
c0de7ee4:	4680      	mov	r8, r0
c0de7ee6:	bf18      	it	ne
c0de7ee8:	f04f 0801 	movne.w	r8, #1
c0de7eec:	d027      	beq.n	c0de7f3e <nbgl_pageDrawGenericContentExt+0xc6>
c0de7eee:	900e      	str	r0, [sp, #56]	@ 0x38
c0de7ef0:	2006      	movs	r0, #6
c0de7ef2:	7b31      	ldrb	r1, [r6, #12]
c0de7ef4:	f8ad 0034 	strh.w	r0, [sp, #52]	@ 0x34
c0de7ef8:	7970      	ldrb	r0, [r6, #5]
c0de7efa:	f88d 103c 	strb.w	r1, [sp, #60]	@ 0x3c
c0de7efe:	f88d 003d 	strb.w	r0, [sp, #61]	@ 0x3d
c0de7f02:	a90d      	add	r1, sp, #52	@ 0x34
c0de7f04:	4650      	mov	r0, sl
c0de7f06:	f7fe fc45 	bl	c0de6794 <nbgl_layoutAddHeader>
c0de7f0a:	f5c0 7716 	rsb	r7, r0, #600	@ 0x258
c0de7f0e:	e018      	b.n	c0de7f42 <nbgl_pageDrawGenericContentExt+0xca>
c0de7f10:	7973      	ldrb	r3, [r6, #5]
c0de7f12:	4650      	mov	r0, sl
c0de7f14:	f7fe fc17 	bl	c0de6746 <nbgl_layoutAddFooter>
c0de7f18:	f5c0 7716 	rsb	r7, r0, #600	@ 0x258
c0de7f1c:	7930      	ldrb	r0, [r6, #4]
c0de7f1e:	2800      	cmp	r0, #0
c0de7f20:	d042      	beq.n	c0de7fa8 <nbgl_pageDrawGenericContentExt+0x130>
c0de7f22:	7c70      	ldrb	r0, [r6, #17]
c0de7f24:	7974      	ldrb	r4, [r6, #5]
c0de7f26:	7831      	ldrb	r1, [r6, #0]
c0de7f28:	7872      	ldrb	r2, [r6, #1]
c0de7f2a:	7c33      	ldrb	r3, [r6, #16]
c0de7f2c:	e9cd 0400 	strd	r0, r4, [sp]
c0de7f30:	4650      	mov	r0, sl
c0de7f32:	f7fe fe73 	bl	c0de6c1c <nbgl_layoutAddProgressIndicator>
c0de7f36:	1a3f      	subs	r7, r7, r0
c0de7f38:	f04f 0801 	mov.w	r8, #1
c0de7f3c:	e04f      	b.n	c0de7fde <nbgl_pageDrawGenericContentExt+0x166>
c0de7f3e:	f44f 7716 	mov.w	r7, #600	@ 0x258
c0de7f42:	2001      	movs	r0, #1
c0de7f44:	f88d 0035 	strb.w	r0, [sp, #53]	@ 0x35
c0de7f48:	7870      	ldrb	r0, [r6, #1]
c0de7f4a:	2802      	cmp	r0, #2
c0de7f4c:	d31c      	bcc.n	c0de7f88 <nbgl_pageDrawGenericContentExt+0x110>
c0de7f4e:	6971      	ldr	r1, [r6, #20]
c0de7f50:	b369      	cbz	r1, c0de7fae <nbgl_pageDrawGenericContentExt+0x136>
c0de7f52:	f88d 0039 	strb.w	r0, [sp, #57]	@ 0x39
c0de7f56:	2001      	movs	r0, #1
c0de7f58:	9111      	str	r1, [sp, #68]	@ 0x44
c0de7f5a:	2103      	movs	r1, #3
c0de7f5c:	7972      	ldrb	r2, [r6, #5]
c0de7f5e:	f000 f9c9 	bl	c0de82f4 <OUTLINED_FUNCTION_3>
c0de7f62:	2100      	movs	r1, #0
c0de7f64:	f88d 103b 	strb.w	r1, [sp, #59]	@ 0x3b
c0de7f68:	78b1      	ldrb	r1, [r6, #2]
c0de7f6a:	f88d 2049 	strb.w	r2, [sp, #73]	@ 0x49
c0de7f6e:	f88d 303c 	strb.w	r3, [sp, #60]	@ 0x3c
c0de7f72:	f88d 2040 	strb.w	r2, [sp, #64]	@ 0x40
c0de7f76:	f88d 003a 	strb.w	r0, [sp, #58]	@ 0x3a
c0de7f7a:	7cb0      	ldrb	r0, [r6, #18]
c0de7f7c:	f88d 1048 	strb.w	r1, [sp, #72]	@ 0x48
c0de7f80:	f88d 003f 	strb.w	r0, [sp, #63]	@ 0x3f
c0de7f84:	7cf0      	ldrb	r0, [r6, #19]
c0de7f86:	e023      	b.n	c0de7fd0 <nbgl_pageDrawGenericContentExt+0x158>
c0de7f88:	6970      	ldr	r0, [r6, #20]
c0de7f8a:	b340      	cbz	r0, c0de7fde <nbgl_pageDrawGenericContentExt+0x166>
c0de7f8c:	2100      	movs	r1, #0
c0de7f8e:	900e      	str	r0, [sp, #56]	@ 0x38
c0de7f90:	2001      	movs	r0, #1
c0de7f92:	f88d 103c 	strb.w	r1, [sp, #60]	@ 0x3c
c0de7f96:	f88d 0034 	strb.w	r0, [sp, #52]	@ 0x34
c0de7f9a:	78b0      	ldrb	r0, [r6, #2]
c0de7f9c:	7971      	ldrb	r1, [r6, #5]
c0de7f9e:	f88d 003d 	strb.w	r0, [sp, #61]	@ 0x3d
c0de7fa2:	f88d 103e 	strb.w	r1, [sp, #62]	@ 0x3e
c0de7fa6:	e015      	b.n	c0de7fd4 <nbgl_pageDrawGenericContentExt+0x15c>
c0de7fa8:	f04f 0800 	mov.w	r8, #0
c0de7fac:	e017      	b.n	c0de7fde <nbgl_pageDrawGenericContentExt+0x166>
c0de7fae:	f88d 0039 	strb.w	r0, [sp, #57]	@ 0x39
c0de7fb2:	2000      	movs	r0, #0
c0de7fb4:	2104      	movs	r1, #4
c0de7fb6:	7c32      	ldrb	r2, [r6, #16]
c0de7fb8:	f000 f99c 	bl	c0de82f4 <OUTLINED_FUNCTION_3>
c0de7fbc:	7971      	ldrb	r1, [r6, #5]
c0de7fbe:	f88d 203b 	strb.w	r2, [sp, #59]	@ 0x3b
c0de7fc2:	f88d 303c 	strb.w	r3, [sp, #60]	@ 0x3c
c0de7fc6:	f88d 003a 	strb.w	r0, [sp, #58]	@ 0x3a
c0de7fca:	7cf0      	ldrb	r0, [r6, #19]
c0de7fcc:	f88d 1040 	strb.w	r1, [sp, #64]	@ 0x40
c0de7fd0:	f88d 0038 	strb.w	r0, [sp, #56]	@ 0x38
c0de7fd4:	a90d      	add	r1, sp, #52	@ 0x34
c0de7fd6:	4650      	mov	r0, sl
c0de7fd8:	f7fc fc48 	bl	c0de486c <nbgl_layoutAddExtendedFooter>
c0de7fdc:	1a3f      	subs	r7, r7, r0
c0de7fde:	6828      	ldr	r0, [r5, #0]
c0de7fe0:	b190      	cbz	r0, c0de8008 <nbgl_pageDrawGenericContentExt+0x190>
c0de7fe2:	900f      	str	r0, [sp, #60]	@ 0x3c
c0de7fe4:	2000      	movs	r0, #0
c0de7fe6:	79a9      	ldrb	r1, [r5, #6]
c0de7fe8:	900e      	str	r0, [sp, #56]	@ 0x38
c0de7fea:	f240 1001 	movw	r0, #257	@ 0x101
c0de7fee:	f8ad 0034 	strh.w	r0, [sp, #52]	@ 0x34
c0de7ff2:	7968      	ldrb	r0, [r5, #5]
c0de7ff4:	f88d 1041 	strb.w	r1, [sp, #65]	@ 0x41
c0de7ff8:	f88d 0040 	strb.w	r0, [sp, #64]	@ 0x40
c0de7ffc:	a90d      	add	r1, sp, #52	@ 0x34
c0de7ffe:	4650      	mov	r0, sl
c0de8000:	f7fe fbc8 	bl	c0de6794 <nbgl_layoutAddHeader>
c0de8004:	f04f 0801 	mov.w	r8, #1
c0de8008:	68a9      	ldr	r1, [r5, #8]
c0de800a:	b121      	cbz	r1, c0de8016 <nbgl_pageDrawGenericContentExt+0x19e>
c0de800c:	79ab      	ldrb	r3, [r5, #6]
c0de800e:	79ea      	ldrb	r2, [r5, #7]
c0de8010:	4650      	mov	r0, sl
c0de8012:	f7fc fbef 	bl	c0de47f4 <nbgl_layoutAddTopRightButton>
c0de8016:	7b28      	ldrb	r0, [r5, #12]
c0de8018:	2800      	cmp	r0, #0
c0de801a:	d044      	beq.n	c0de80a6 <nbgl_pageDrawGenericContentExt+0x22e>
c0de801c:	2801      	cmp	r0, #1
c0de801e:	d04d      	beq.n	c0de80bc <nbgl_pageDrawGenericContentExt+0x244>
c0de8020:	2802      	cmp	r0, #2
c0de8022:	d067      	beq.n	c0de80f4 <nbgl_pageDrawGenericContentExt+0x27c>
c0de8024:	2803      	cmp	r0, #3
c0de8026:	d075      	beq.n	c0de8114 <nbgl_pageDrawGenericContentExt+0x29c>
c0de8028:	2804      	cmp	r0, #4
c0de802a:	f000 8090 	beq.w	c0de814e <nbgl_pageDrawGenericContentExt+0x2d6>
c0de802e:	2805      	cmp	r0, #5
c0de8030:	f000 8095 	beq.w	c0de815e <nbgl_pageDrawGenericContentExt+0x2e6>
c0de8034:	2806      	cmp	r0, #6
c0de8036:	f000 80ab 	beq.w	c0de8190 <nbgl_pageDrawGenericContentExt+0x318>
c0de803a:	2807      	cmp	r0, #7
c0de803c:	f000 80db 	beq.w	c0de81f6 <nbgl_pageDrawGenericContentExt+0x37e>
c0de8040:	2808      	cmp	r0, #8
c0de8042:	f000 80ec 	beq.w	c0de821e <nbgl_pageDrawGenericContentExt+0x3a6>
c0de8046:	2809      	cmp	r0, #9
c0de8048:	f000 8114 	beq.w	c0de8274 <nbgl_pageDrawGenericContentExt+0x3fc>
c0de804c:	280a      	cmp	r0, #10
c0de804e:	f040 8116 	bne.w	c0de827e <nbgl_pageDrawGenericContentExt+0x406>
c0de8052:	489b      	ldr	r0, [pc, #620]	@ (c0de82c0 <nbgl_pageDrawGenericContentExt+0x448>)
c0de8054:	2400      	movs	r4, #0
c0de8056:	f10d 0834 	add.w	r8, sp, #52	@ 0x34
c0de805a:	2600      	movs	r6, #0
c0de805c:	4478      	add	r0, pc
c0de805e:	4683      	mov	fp, r0
c0de8060:	7e28      	ldrb	r0, [r5, #24]
c0de8062:	4286      	cmp	r6, r0
c0de8064:	f080 810b 	bcs.w	c0de827e <nbgl_pageDrawGenericContentExt+0x406>
c0de8068:	e9d5 0104 	ldrd	r0, r1, [r5, #16]
c0de806c:	f850 0026 	ldr.w	r0, [r0, r6, lsl #2]
c0de8070:	e9cd b40f 	strd	fp, r4, [sp, #60]	@ 0x3c
c0de8074:	e9cd 400d 	strd	r4, r0, [sp, #52]	@ 0x34
c0de8078:	5d88      	ldrb	r0, [r1, r6]
c0de807a:	4641      	mov	r1, r8
c0de807c:	f88d 4046 	strb.w	r4, [sp, #70]	@ 0x46
c0de8080:	f88d 4044 	strb.w	r4, [sp, #68]	@ 0x44
c0de8084:	f88d 0045 	strb.w	r0, [sp, #69]	@ 0x45
c0de8088:	7e68      	ldrb	r0, [r5, #25]
c0de808a:	f88d 0048 	strb.w	r0, [sp, #72]	@ 0x48
c0de808e:	4650      	mov	r0, sl
c0de8090:	f7fc ff95 	bl	c0de4fbe <nbgl_layoutAddTouchableBar>
c0de8094:	1a3f      	subs	r7, r7, r0
c0de8096:	b2b8      	uxth	r0, r7
c0de8098:	280b      	cmp	r0, #11
c0de809a:	d302      	bcc.n	c0de80a2 <nbgl_pageDrawGenericContentExt+0x22a>
c0de809c:	4650      	mov	r0, sl
c0de809e:	f7fe fa4f 	bl	c0de6540 <nbgl_layoutAddSeparationLine>
c0de80a2:	3601      	adds	r6, #1
c0de80a4:	e7dc      	b.n	c0de8060 <nbgl_pageDrawGenericContentExt+0x1e8>
c0de80a6:	f1b8 0f00 	cmp.w	r8, #0
c0de80aa:	d101      	bne.n	c0de80b0 <nbgl_pageDrawGenericContentExt+0x238>
c0de80ac:	f000 f90f 	bl	c0de82ce <OUTLINED_FUNCTION_0>
c0de80b0:	f105 0110 	add.w	r1, r5, #16
c0de80b4:	4650      	mov	r0, sl
c0de80b6:	f7fd fcdb 	bl	c0de5a70 <nbgl_layoutAddCenteredInfo>
c0de80ba:	e0e0      	b.n	c0de827e <nbgl_pageDrawGenericContentExt+0x406>
c0de80bc:	f1b8 0f00 	cmp.w	r8, #0
c0de80c0:	d101      	bne.n	c0de80c6 <nbgl_pageDrawGenericContentExt+0x24e>
c0de80c2:	f000 f904 	bl	c0de82ce <OUTLINED_FUNCTION_0>
c0de80c6:	f105 0110 	add.w	r1, r5, #16
c0de80ca:	4650      	mov	r0, sl
c0de80cc:	f7fd fefe 	bl	c0de5ecc <nbgl_layoutAddContentCenter>
c0de80d0:	6b68      	ldr	r0, [r5, #52]	@ 0x34
c0de80d2:	2800      	cmp	r0, #0
c0de80d4:	f000 80d3 	beq.w	c0de827e <nbgl_pageDrawGenericContentExt+0x406>
c0de80d8:	900e      	str	r0, [sp, #56]	@ 0x38
c0de80da:	2003      	movs	r0, #3
c0de80dc:	f88d 0034 	strb.w	r0, [sp, #52]	@ 0x34
c0de80e0:	6ba8      	ldr	r0, [r5, #56]	@ 0x38
c0de80e2:	900f      	str	r0, [sp, #60]	@ 0x3c
c0de80e4:	8fa8      	ldrh	r0, [r5, #60]	@ 0x3c
c0de80e6:	f8ad 0040 	strh.w	r0, [sp, #64]	@ 0x40
c0de80ea:	a90d      	add	r1, sp, #52	@ 0x34
c0de80ec:	4650      	mov	r0, sl
c0de80ee:	f7fc f815 	bl	c0de411c <nbgl_layoutAddUpFooter>
c0de80f2:	e0c4      	b.n	c0de827e <nbgl_pageDrawGenericContentExt+0x406>
c0de80f4:	ae0d      	add	r6, sp, #52	@ 0x34
c0de80f6:	2124      	movs	r1, #36	@ 0x24
c0de80f8:	4630      	mov	r0, r6
c0de80fa:	f003 fecd 	bl	c0debe98 <__aeabi_memclr>
c0de80fe:	e9d5 0104 	ldrd	r0, r1, [r5, #16]
c0de8102:	f000 f8f1 	bl	c0de82e8 <OUTLINED_FUNCTION_2>
c0de8106:	69a9      	ldr	r1, [r5, #24]
c0de8108:	7f6b      	ldrb	r3, [r5, #29]
c0de810a:	7f2a      	ldrb	r2, [r5, #28]
c0de810c:	4650      	mov	r0, sl
c0de810e:	f7fe fb08 	bl	c0de6722 <nbgl_layoutAddLongPressButton>
c0de8112:	e0b4      	b.n	c0de827e <nbgl_pageDrawGenericContentExt+0x406>
c0de8114:	ae0d      	add	r6, sp, #52	@ 0x34
c0de8116:	2124      	movs	r1, #36	@ 0x24
c0de8118:	4630      	mov	r0, r6
c0de811a:	f003 febd 	bl	c0debe98 <__aeabi_memclr>
c0de811e:	e9d5 0104 	ldrd	r0, r1, [r5, #16]
c0de8122:	2400      	movs	r4, #0
c0de8124:	f88d 4034 	strb.w	r4, [sp, #52]	@ 0x34
c0de8128:	f000 f8de 	bl	c0de82e8 <OUTLINED_FUNCTION_2>
c0de812c:	f44f 7080 	mov.w	r0, #256	@ 0x100
c0de8130:	940a      	str	r4, [sp, #40]	@ 0x28
c0de8132:	f88d 402d 	strb.w	r4, [sp, #45]	@ 0x2d
c0de8136:	f8ad 002e 	strh.w	r0, [sp, #46]	@ 0x2e
c0de813a:	69a8      	ldr	r0, [r5, #24]
c0de813c:	9009      	str	r0, [sp, #36]	@ 0x24
c0de813e:	7f28      	ldrb	r0, [r5, #28]
c0de8140:	f88d 002c 	strb.w	r0, [sp, #44]	@ 0x2c
c0de8144:	7f68      	ldrb	r0, [r5, #29]
c0de8146:	f88d 0030 	strb.w	r0, [sp, #48]	@ 0x30
c0de814a:	a909      	add	r1, sp, #36	@ 0x24
c0de814c:	e04f      	b.n	c0de81ee <nbgl_pageDrawGenericContentExt+0x376>
c0de814e:	f1b8 0f00 	cmp.w	r8, #0
c0de8152:	d101      	bne.n	c0de8158 <nbgl_pageDrawGenericContentExt+0x2e0>
c0de8154:	f000 f8bb 	bl	c0de82ce <OUTLINED_FUNCTION_0>
c0de8158:	f000 f8da 	bl	c0de8310 <OUTLINED_FUNCTION_5>
c0de815c:	e08f      	b.n	c0de827e <nbgl_pageDrawGenericContentExt+0x406>
c0de815e:	f1b8 0f00 	cmp.w	r8, #0
c0de8162:	d101      	bne.n	c0de8168 <nbgl_pageDrawGenericContentExt+0x2f0>
c0de8164:	f000 f8b3 	bl	c0de82ce <OUTLINED_FUNCTION_0>
c0de8168:	7ea8      	ldrb	r0, [r5, #26]
c0de816a:	f105 0110 	add.w	r1, r5, #16
c0de816e:	3803      	subs	r0, #3
c0de8170:	76a8      	strb	r0, [r5, #26]
c0de8172:	4650      	mov	r0, sl
c0de8174:	f7fe f850 	bl	c0de6218 <nbgl_layoutAddTagValueList>
c0de8178:	2001      	movs	r0, #1
c0de817a:	f88d 003d 	strb.w	r0, [sp, #61]	@ 0x3d
c0de817e:	f8ad 003e 	strh.w	r0, [sp, #62]	@ 0x3e
c0de8182:	e9d5 0109 	ldrd	r0, r1, [r5, #36]	@ 0x24
c0de8186:	e9cd 100d 	strd	r1, r0, [sp, #52]	@ 0x34
c0de818a:	f000 f8ba 	bl	c0de8302 <OUTLINED_FUNCTION_4>
c0de818e:	e02b      	b.n	c0de81e8 <nbgl_pageDrawGenericContentExt+0x370>
c0de8190:	f1b8 0f00 	cmp.w	r8, #0
c0de8194:	d101      	bne.n	c0de819a <nbgl_pageDrawGenericContentExt+0x322>
c0de8196:	f000 f89a 	bl	c0de82ce <OUTLINED_FUNCTION_0>
c0de819a:	f000 f8b9 	bl	c0de8310 <OUTLINED_FUNCTION_5>
c0de819e:	6aa8      	ldr	r0, [r5, #40]	@ 0x28
c0de81a0:	2800      	cmp	r0, #0
c0de81a2:	d073      	beq.n	c0de828c <nbgl_pageDrawGenericContentExt+0x414>
c0de81a4:	900d      	str	r0, [sp, #52]	@ 0x34
c0de81a6:	6a68      	ldr	r0, [r5, #36]	@ 0x24
c0de81a8:	2101      	movs	r1, #1
c0de81aa:	f8ad 103e 	strh.w	r1, [sp, #62]	@ 0x3e
c0de81ae:	f88d 103d 	strb.w	r1, [sp, #61]	@ 0x3d
c0de81b2:	900e      	str	r0, [sp, #56]	@ 0x38
c0de81b4:	f000 f8a5 	bl	c0de8302 <OUTLINED_FUNCTION_4>
c0de81b8:	f88d 0040 	strb.w	r0, [sp, #64]	@ 0x40
c0de81bc:	a90d      	add	r1, sp, #52	@ 0x34
c0de81be:	4650      	mov	r0, sl
c0de81c0:	f7fe f9d0 	bl	c0de6564 <nbgl_layoutAddButton>
c0de81c4:	6b28      	ldr	r0, [r5, #48]	@ 0x30
c0de81c6:	2800      	cmp	r0, #0
c0de81c8:	d059      	beq.n	c0de827e <nbgl_pageDrawGenericContentExt+0x406>
c0de81ca:	2100      	movs	r1, #0
c0de81cc:	900d      	str	r0, [sp, #52]	@ 0x34
c0de81ce:	f895 002d 	ldrb.w	r0, [r5, #45]	@ 0x2d
c0de81d2:	f88d 103d 	strb.w	r1, [sp, #61]	@ 0x3d
c0de81d6:	910e      	str	r1, [sp, #56]	@ 0x38
c0de81d8:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de81dc:	f8ad 103e 	strh.w	r1, [sp, #62]	@ 0x3e
c0de81e0:	f895 1038 	ldrb.w	r1, [r5, #56]	@ 0x38
c0de81e4:	f88d 103c 	strb.w	r1, [sp, #60]	@ 0x3c
c0de81e8:	f88d 0040 	strb.w	r0, [sp, #64]	@ 0x40
c0de81ec:	a90d      	add	r1, sp, #52	@ 0x34
c0de81ee:	4650      	mov	r0, sl
c0de81f0:	f7fe f9b8 	bl	c0de6564 <nbgl_layoutAddButton>
c0de81f4:	e043      	b.n	c0de827e <nbgl_pageDrawGenericContentExt+0x406>
c0de81f6:	2400      	movs	r4, #0
c0de81f8:	2600      	movs	r6, #0
c0de81fa:	7d28      	ldrb	r0, [r5, #20]
c0de81fc:	4286      	cmp	r6, r0
c0de81fe:	d23e      	bcs.n	c0de827e <nbgl_pageDrawGenericContentExt+0x406>
c0de8200:	6928      	ldr	r0, [r5, #16]
c0de8202:	1901      	adds	r1, r0, r4
c0de8204:	4650      	mov	r0, sl
c0de8206:	f7fd f8db 	bl	c0de53c0 <nbgl_layoutAddSwitch>
c0de820a:	1a3f      	subs	r7, r7, r0
c0de820c:	b2b8      	uxth	r0, r7
c0de820e:	280b      	cmp	r0, #11
c0de8210:	d302      	bcc.n	c0de8218 <nbgl_pageDrawGenericContentExt+0x3a0>
c0de8212:	4650      	mov	r0, sl
c0de8214:	f7fe f994 	bl	c0de6540 <nbgl_layoutAddSeparationLine>
c0de8218:	340c      	adds	r4, #12
c0de821a:	3601      	adds	r6, #1
c0de821c:	e7ed      	b.n	c0de81fa <nbgl_pageDrawGenericContentExt+0x382>
c0de821e:	2600      	movs	r6, #0
c0de8220:	2400      	movs	r4, #0
c0de8222:	7f28      	ldrb	r0, [r5, #28]
c0de8224:	4284      	cmp	r4, r0
c0de8226:	d22a      	bcs.n	c0de827e <nbgl_pageDrawGenericContentExt+0x406>
c0de8228:	7fa8      	ldrb	r0, [r5, #30]
c0de822a:	b180      	cbz	r0, c0de824e <nbgl_pageDrawGenericContentExt+0x3d6>
c0de822c:	69a8      	ldr	r0, [r5, #24]
c0de822e:	b170      	cbz	r0, c0de824e <nbgl_pageDrawGenericContentExt+0x3d6>
c0de8230:	5980      	ldr	r0, [r0, r6]
c0de8232:	b160      	cbz	r0, c0de824e <nbgl_pageDrawGenericContentExt+0x3d6>
c0de8234:	e9d5 0104 	ldrd	r0, r1, [r5, #16]
c0de8238:	7f6b      	ldrb	r3, [r5, #29]
c0de823a:	f851 2024 	ldr.w	r2, [r1, r4, lsl #2]
c0de823e:	f850 1024 	ldr.w	r1, [r0, r4, lsl #2]
c0de8242:	b2e0      	uxtb	r0, r4
c0de8244:	9000      	str	r0, [sp, #0]
c0de8246:	4650      	mov	r0, sl
c0de8248:	f7fd fa24 	bl	c0de5694 <nbgl_layoutAddTextWithAlias>
c0de824c:	e008      	b.n	c0de8260 <nbgl_pageDrawGenericContentExt+0x3e8>
c0de824e:	e9d5 0104 	ldrd	r0, r1, [r5, #16]
c0de8252:	f851 2024 	ldr.w	r2, [r1, r4, lsl #2]
c0de8256:	f850 1024 	ldr.w	r1, [r0, r4, lsl #2]
c0de825a:	4650      	mov	r0, sl
c0de825c:	f7fd f8d2 	bl	c0de5404 <nbgl_layoutAddText>
c0de8260:	1a3f      	subs	r7, r7, r0
c0de8262:	b2b8      	uxth	r0, r7
c0de8264:	280b      	cmp	r0, #11
c0de8266:	d302      	bcc.n	c0de826e <nbgl_pageDrawGenericContentExt+0x3f6>
c0de8268:	4650      	mov	r0, sl
c0de826a:	f7fe f969 	bl	c0de6540 <nbgl_layoutAddSeparationLine>
c0de826e:	3618      	adds	r6, #24
c0de8270:	3401      	adds	r4, #1
c0de8272:	e7d6      	b.n	c0de8222 <nbgl_pageDrawGenericContentExt+0x3aa>
c0de8274:	f105 0110 	add.w	r1, r5, #16
c0de8278:	4650      	mov	r0, sl
c0de827a:	f7fd fad3 	bl	c0de5824 <nbgl_layoutAddRadioChoice>
c0de827e:	4650      	mov	r0, sl
c0de8280:	f7fe feea 	bl	c0de7058 <nbgl_layoutDraw>
c0de8284:	4650      	mov	r0, sl
c0de8286:	b016      	add	sp, #88	@ 0x58
c0de8288:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de828c:	6a68      	ldr	r0, [r5, #36]	@ 0x24
c0de828e:	2800      	cmp	r0, #0
c0de8290:	d098      	beq.n	c0de81c4 <nbgl_pageDrawGenericContentExt+0x34c>
c0de8292:	6b29      	ldr	r1, [r5, #48]	@ 0x30
c0de8294:	2900      	cmp	r1, #0
c0de8296:	d095      	beq.n	c0de81c4 <nbgl_pageDrawGenericContentExt+0x34c>
c0de8298:	e9cd 010d 	strd	r0, r1, [sp, #52]	@ 0x34
c0de829c:	f895 002c 	ldrb.w	r0, [r5, #44]	@ 0x2c
c0de82a0:	f895 102d 	ldrb.w	r1, [r5, #45]	@ 0x2d
c0de82a4:	f895 2038 	ldrb.w	r2, [r5, #56]	@ 0x38
c0de82a8:	f88d 003c 	strb.w	r0, [sp, #60]	@ 0x3c
c0de82ac:	f88d 203d 	strb.w	r2, [sp, #61]	@ 0x3d
c0de82b0:	f88d 103e 	strb.w	r1, [sp, #62]	@ 0x3e
c0de82b4:	a90d      	add	r1, sp, #52	@ 0x34
c0de82b6:	4650      	mov	r0, sl
c0de82b8:	f7fd ff9a 	bl	c0de61f0 <nbgl_layoutAddHorizontalButtons>
c0de82bc:	e7df      	b.n	c0de827e <nbgl_pageDrawGenericContentExt+0x406>
c0de82be:	bf00      	nop
c0de82c0:	00004977 	.word	0x00004977

c0de82c4 <nbgl_pageDrawGenericContent>:
c0de82c4:	2300      	movs	r3, #0
c0de82c6:	f7ff bdd7 	b.w	c0de7e78 <nbgl_pageDrawGenericContentExt>

c0de82ca <nbgl_pageRelease>:
c0de82ca:	f7fe bef3 	b.w	c0de70b4 <nbgl_layoutRelease>

c0de82ce <OUTLINED_FUNCTION_0>:
c0de82ce:	4650      	mov	r0, sl
c0de82d0:	2128      	movs	r1, #40	@ 0x28
c0de82d2:	f7ff bc9d 	b.w	c0de7c10 <addEmptyHeader>

c0de82d6 <OUTLINED_FUNCTION_1>:
c0de82d6:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de82da:	788a      	ldrb	r2, [r1, #2]
c0de82dc:	78c9      	ldrb	r1, [r1, #3]
c0de82de:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0de82e2:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de82e6:	4770      	bx	lr

c0de82e8 <OUTLINED_FUNCTION_2>:
c0de82e8:	910e      	str	r1, [sp, #56]	@ 0x38
c0de82ea:	9011      	str	r0, [sp, #68]	@ 0x44
c0de82ec:	4650      	mov	r0, sl
c0de82ee:	4631      	mov	r1, r6
c0de82f0:	f7fd bdec 	b.w	c0de5ecc <nbgl_layoutAddContentCenter>

c0de82f4 <OUTLINED_FUNCTION_3>:
c0de82f4:	7c73      	ldrb	r3, [r6, #17]
c0de82f6:	f88d 003e 	strb.w	r0, [sp, #62]	@ 0x3e
c0de82fa:	7830      	ldrb	r0, [r6, #0]
c0de82fc:	f88d 1034 	strb.w	r1, [sp, #52]	@ 0x34
c0de8300:	4770      	bx	lr

c0de8302 <OUTLINED_FUNCTION_4>:
c0de8302:	f895 002c 	ldrb.w	r0, [r5, #44]	@ 0x2c
c0de8306:	f88d 003c 	strb.w	r0, [sp, #60]	@ 0x3c
c0de830a:	f895 002d 	ldrb.w	r0, [r5, #45]	@ 0x2d
c0de830e:	4770      	bx	lr

c0de8310 <OUTLINED_FUNCTION_5>:
c0de8310:	f105 0110 	add.w	r1, r5, #16
c0de8314:	4650      	mov	r0, sl
c0de8316:	f7fd bf7f 	b.w	c0de6218 <nbgl_layoutAddTagValueList>

c0de831a <getNbTagValuesInPage>:
c0de831a:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de831e:	4604      	mov	r4, r0
c0de8320:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0de8322:	f04f 0800 	mov.w	r8, #0
c0de8326:	2b00      	cmp	r3, #0
c0de8328:	460e      	mov	r6, r1
c0de832a:	f04f 0b00 	mov.w	fp, #0
c0de832e:	f880 8000 	strb.w	r8, [r0]
c0de8332:	f44f 70e8 	mov.w	r0, #464	@ 0x1d0
c0de8336:	bf18      	it	ne
c0de8338:	f44f 70cc 	movne.w	r0, #408	@ 0x198
c0de833c:	0111      	lsls	r1, r2, #4
c0de833e:	e9cd 2001 	strd	r2, r0, [sp, #4]
c0de8342:	4544      	cmp	r4, r8
c0de8344:	d052      	beq.n	c0de83ec <getNbTagValuesInPage+0xd2>
c0de8346:	465d      	mov	r5, fp
c0de8348:	f10b 0a18 	add.w	sl, fp, #24
c0de834c:	f1b8 0f00 	cmp.w	r8, #0
c0de8350:	bf18      	it	ne
c0de8352:	4655      	movne	r5, sl
c0de8354:	6830      	ldr	r0, [r6, #0]
c0de8356:	9103      	str	r1, [sp, #12]
c0de8358:	b108      	cbz	r0, c0de835e <getNbTagValuesInPage+0x44>
c0de835a:	4408      	add	r0, r1
c0de835c:	e004      	b.n	c0de8368 <getNbTagValuesInPage+0x4e>
c0de835e:	9801      	ldr	r0, [sp, #4]
c0de8360:	6871      	ldr	r1, [r6, #4]
c0de8362:	4440      	add	r0, r8
c0de8364:	b2c0      	uxtb	r0, r0
c0de8366:	4788      	blx	r1
c0de8368:	f003 fa8e 	bl	c0deb888 <pic>
c0de836c:	4607      	mov	r7, r0
c0de836e:	7b00      	ldrb	r0, [r0, #12]
c0de8370:	07c1      	lsls	r1, r0, #31
c0de8372:	bf18      	it	ne
c0de8374:	f1b8 0f00 	cmpne.w	r8, #0
c0de8378:	d13b      	bne.n	c0de83f2 <getNbTagValuesInPage+0xd8>
c0de837a:	0780      	lsls	r0, r0, #30
c0de837c:	d45d      	bmi.n	c0de843a <getNbTagValuesInPage+0x120>
c0de837e:	7b73      	ldrb	r3, [r6, #13]
c0de8380:	6839      	ldr	r1, [r7, #0]
c0de8382:	200b      	movs	r0, #11
c0de8384:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de8388:	46a2      	mov	sl, r4
c0de838a:	f003 f8b5 	bl	c0deb4f8 <nbgl_getTextHeightInWidth>
c0de838e:	182c      	adds	r4, r5, r0
c0de8390:	7b30      	ldrb	r0, [r6, #12]
c0de8392:	250b      	movs	r5, #11
c0de8394:	7b73      	ldrb	r3, [r6, #13]
c0de8396:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de839a:	2800      	cmp	r0, #0
c0de839c:	bf08      	it	eq
c0de839e:	250d      	moveq	r5, #13
c0de83a0:	6879      	ldr	r1, [r7, #4]
c0de83a2:	4628      	mov	r0, r5
c0de83a4:	f003 f8a8 	bl	c0deb4f8 <nbgl_getTextHeightInWidth>
c0de83a8:	4420      	add	r0, r4
c0de83aa:	6879      	ldr	r1, [r7, #4]
c0de83ac:	7b73      	ldrb	r3, [r6, #13]
c0de83ae:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de83b2:	f100 0b04 	add.w	fp, r0, #4
c0de83b6:	4628      	mov	r0, r5
c0de83b8:	fa1f f48b 	uxth.w	r4, fp
c0de83bc:	f003 f8a1 	bl	c0deb502 <nbgl_getTextNbLinesInWidth>
c0de83c0:	9902      	ldr	r1, [sp, #8]
c0de83c2:	428c      	cmp	r4, r1
c0de83c4:	bf38      	it	cc
c0de83c6:	280a      	cmpcc	r0, #10
c0de83c8:	d205      	bcs.n	c0de83d6 <getNbTagValuesInPage+0xbc>
c0de83ca:	9903      	ldr	r1, [sp, #12]
c0de83cc:	f108 0801 	add.w	r8, r8, #1
c0de83d0:	4654      	mov	r4, sl
c0de83d2:	3110      	adds	r1, #16
c0de83d4:	e7b5      	b.n	c0de8342 <getNbTagValuesInPage+0x28>
c0de83d6:	ea5f 6008 	movs.w	r0, r8, lsl #24
c0de83da:	d104      	bne.n	c0de83e6 <getNbTagValuesInPage+0xcc>
c0de83dc:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0de83de:	f04f 0801 	mov.w	r8, #1
c0de83e2:	f880 8000 	strb.w	r8, [r0]
c0de83e6:	4654      	mov	r4, sl
c0de83e8:	46da      	mov	sl, fp
c0de83ea:	e003      	b.n	c0de83f4 <getNbTagValuesInPage+0xda>
c0de83ec:	46da      	mov	sl, fp
c0de83ee:	46a0      	mov	r8, r4
c0de83f0:	e000      	b.n	c0de83f4 <getNbTagValuesInPage+0xda>
c0de83f2:	46aa      	mov	sl, r5
c0de83f4:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0de83f6:	b170      	cbz	r0, c0de8416 <getNbTagValuesInPage+0xfc>
c0de83f8:	fa5f f088 	uxtb.w	r0, r8
c0de83fc:	42a0      	cmp	r0, r4
c0de83fe:	d10a      	bne.n	c0de8416 <getNbTagValuesInPage+0xfc>
c0de8400:	9902      	ldr	r1, [sp, #8]
c0de8402:	fa1f f08a 	uxth.w	r0, sl
c0de8406:	f501 71bc 	add.w	r1, r1, #376	@ 0x178
c0de840a:	f401 71ac 	and.w	r1, r1, #344	@ 0x158
c0de840e:	4281      	cmp	r1, r0
c0de8410:	bf38      	it	cc
c0de8412:	3c01      	subcc	r4, #1
c0de8414:	e00d      	b.n	c0de8432 <getNbTagValuesInPage+0x118>
c0de8416:	980d      	ldr	r0, [sp, #52]	@ 0x34
c0de8418:	b150      	cbz	r0, c0de8430 <getNbTagValuesInPage+0x116>
c0de841a:	9902      	ldr	r1, [sp, #8]
c0de841c:	fa1f f08a 	uxth.w	r0, sl
c0de8420:	f501 71e0 	add.w	r1, r1, #448	@ 0x1c0
c0de8424:	f401 71ec 	and.w	r1, r1, #472	@ 0x1d8
c0de8428:	4281      	cmp	r1, r0
c0de842a:	bf38      	it	cc
c0de842c:	f1a8 0801 	subcc.w	r8, r8, #1
c0de8430:	4644      	mov	r4, r8
c0de8432:	b2e0      	uxtb	r0, r4
c0de8434:	b004      	add	sp, #16
c0de8436:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de843a:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0de843c:	f1b8 0f00 	cmp.w	r8, #0
c0de8440:	d1d9      	bne.n	c0de83f6 <getNbTagValuesInPage+0xdc>
c0de8442:	990e      	ldr	r1, [sp, #56]	@ 0x38
c0de8444:	f04f 0801 	mov.w	r8, #1
c0de8448:	46da      	mov	sl, fp
c0de844a:	f881 8000 	strb.w	r8, [r1]
c0de844e:	e7d2      	b.n	c0de83f6 <getNbTagValuesInPage+0xdc>

c0de8450 <nbgl_useCaseGetNbInfosInPage>:
c0de8450:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de8454:	f44f 74fc 	mov.w	r4, #504	@ 0x1f8
c0de8458:	9001      	str	r0, [sp, #4]
c0de845a:	9300      	str	r3, [sp, #0]
c0de845c:	2b00      	cmp	r3, #0
c0de845e:	4616      	mov	r6, r2
c0de8460:	460f      	mov	r7, r1
c0de8462:	bf18      	it	ne
c0de8464:	f44f 74cc 	movne.w	r4, #408	@ 0x198
c0de8468:	6808      	ldr	r0, [r1, #0]
c0de846a:	f003 fa0d 	bl	c0deb888 <pic>
c0de846e:	eb00 0b86 	add.w	fp, r0, r6, lsl #2
c0de8472:	6878      	ldr	r0, [r7, #4]
c0de8474:	f003 fa08 	bl	c0deb888 <pic>
c0de8478:	eb00 0586 	add.w	r5, r0, r6, lsl #2
c0de847c:	2700      	movs	r7, #0
c0de847e:	f04f 0800 	mov.w	r8, #0
c0de8482:	f04f 0a00 	mov.w	sl, #0
c0de8486:	9801      	ldr	r0, [sp, #4]
c0de8488:	42b8      	cmp	r0, r7
c0de848a:	d01e      	beq.n	c0de84ca <nbgl_useCaseGetNbInfosInPage+0x7a>
c0de848c:	f85b 0027 	ldr.w	r0, [fp, r7, lsl #2]
c0de8490:	f003 f9fa 	bl	c0deb888 <pic>
c0de8494:	4601      	mov	r1, r0
c0de8496:	200c      	movs	r0, #12
c0de8498:	f002 fb2b 	bl	c0deaaf2 <OUTLINED_FUNCTION_2>
c0de849c:	4606      	mov	r6, r0
c0de849e:	f855 0027 	ldr.w	r0, [r5, r7, lsl #2]
c0de84a2:	f003 f9f1 	bl	c0deb888 <pic>
c0de84a6:	4601      	mov	r1, r0
c0de84a8:	200b      	movs	r0, #11
c0de84aa:	f002 fb22 	bl	c0deaaf2 <OUTLINED_FUNCTION_2>
c0de84ae:	eb0a 0106 	add.w	r1, sl, r6
c0de84b2:	4408      	add	r0, r1
c0de84b4:	302a      	adds	r0, #42	@ 0x2a
c0de84b6:	b280      	uxth	r0, r0
c0de84b8:	f100 0a1a 	add.w	sl, r0, #26
c0de84bc:	fa1f f08a 	uxth.w	r0, sl
c0de84c0:	42a0      	cmp	r0, r4
c0de84c2:	d204      	bcs.n	c0de84ce <nbgl_useCaseGetNbInfosInPage+0x7e>
c0de84c4:	3701      	adds	r7, #1
c0de84c6:	4680      	mov	r8, r0
c0de84c8:	e7dd      	b.n	c0de8486 <nbgl_useCaseGetNbInfosInPage+0x36>
c0de84ca:	9f01      	ldr	r7, [sp, #4]
c0de84cc:	e006      	b.n	c0de84dc <nbgl_useCaseGetNbInfosInPage+0x8c>
c0de84ce:	9800      	ldr	r0, [sp, #0]
c0de84d0:	b920      	cbnz	r0, c0de84dc <nbgl_useCaseGetNbInfosInPage+0x8c>
c0de84d2:	ea4f 00d8 	mov.w	r0, r8, lsr #3
c0de84d6:	2832      	cmp	r0, #50	@ 0x32
c0de84d8:	bf88      	it	hi
c0de84da:	3f01      	subhi	r7, #1
c0de84dc:	b2f8      	uxtb	r0, r7
c0de84de:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}

c0de84e2 <nbgl_useCaseGetNbSwitchesInPage>:
c0de84e2:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de84e6:	f44f 77fc 	mov.w	r7, #504	@ 0x1f8
c0de84ea:	2b00      	cmp	r3, #0
c0de84ec:	4682      	mov	sl, r0
c0de84ee:	4698      	mov	r8, r3
c0de84f0:	4616      	mov	r6, r2
c0de84f2:	bf18      	it	ne
c0de84f4:	f44f 77cc 	movne.w	r7, #408	@ 0x198
c0de84f8:	6808      	ldr	r0, [r1, #0]
c0de84fa:	f003 f9c5 	bl	c0deb888 <pic>
c0de84fe:	eb06 0146 	add.w	r1, r6, r6, lsl #1
c0de8502:	2600      	movs	r6, #0
c0de8504:	eb00 0081 	add.w	r0, r0, r1, lsl #2
c0de8508:	1d04      	adds	r4, r0, #4
c0de850a:	2000      	movs	r0, #0
c0de850c:	4605      	mov	r5, r0
c0de850e:	45b2      	cmp	sl, r6
c0de8510:	d010      	beq.n	c0de8534 <nbgl_useCaseGetNbSwitchesInPage+0x52>
c0de8512:	6821      	ldr	r1, [r4, #0]
c0de8514:	b129      	cbz	r1, c0de8522 <nbgl_useCaseGetNbSwitchesInPage+0x40>
c0de8516:	200b      	movs	r0, #11
c0de8518:	f002 faeb 	bl	c0deaaf2 <OUTLINED_FUNCTION_2>
c0de851c:	4428      	add	r0, r5
c0de851e:	3068      	adds	r0, #104	@ 0x68
c0de8520:	e001      	b.n	c0de8526 <nbgl_useCaseGetNbSwitchesInPage+0x44>
c0de8522:	f105 005c 	add.w	r0, r5, #92	@ 0x5c
c0de8526:	340c      	adds	r4, #12
c0de8528:	3601      	adds	r6, #1
c0de852a:	b281      	uxth	r1, r0
c0de852c:	428f      	cmp	r7, r1
c0de852e:	d8ed      	bhi.n	c0de850c <nbgl_useCaseGetNbSwitchesInPage+0x2a>
c0de8530:	f1a6 0a01 	sub.w	sl, r6, #1
c0de8534:	b2a8      	uxth	r0, r5
c0de8536:	2100      	movs	r1, #0
c0de8538:	08c0      	lsrs	r0, r0, #3
c0de853a:	2832      	cmp	r0, #50	@ 0x32
c0de853c:	bf88      	it	hi
c0de853e:	2101      	movhi	r1, #1
c0de8540:	ea21 0008 	bic.w	r0, r1, r8
c0de8544:	ebaa 0000 	sub.w	r0, sl, r0
c0de8548:	b2c0      	uxtb	r0, r0
c0de854a:	e8bd 85f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}

c0de854e <nbgl_useCaseGetNbBarsInPage>:
c0de854e:	b570      	push	{r4, r5, r6, lr}
c0de8550:	f44f 71fc 	mov.w	r1, #504	@ 0x1f8
c0de8554:	2b00      	cmp	r3, #0
c0de8556:	bf18      	it	ne
c0de8558:	f44f 71cc 	movne.w	r1, #408	@ 0x198
c0de855c:	2200      	movs	r2, #0
c0de855e:	2400      	movs	r4, #0
c0de8560:	2500      	movs	r5, #0
c0de8562:	b2ee      	uxtb	r6, r5
c0de8564:	4286      	cmp	r6, r0
c0de8566:	d208      	bcs.n	c0de857a <nbgl_useCaseGetNbBarsInPage+0x2c>
c0de8568:	b292      	uxth	r2, r2
c0de856a:	325c      	adds	r2, #92	@ 0x5c
c0de856c:	b296      	uxth	r6, r2
c0de856e:	428e      	cmp	r6, r1
c0de8570:	d202      	bcs.n	c0de8578 <nbgl_useCaseGetNbBarsInPage+0x2a>
c0de8572:	3501      	adds	r5, #1
c0de8574:	4634      	mov	r4, r6
c0de8576:	e7f4      	b.n	c0de8562 <nbgl_useCaseGetNbBarsInPage+0x14>
c0de8578:	4628      	mov	r0, r5
c0de857a:	08e1      	lsrs	r1, r4, #3
c0de857c:	2200      	movs	r2, #0
c0de857e:	2932      	cmp	r1, #50	@ 0x32
c0de8580:	bf88      	it	hi
c0de8582:	2201      	movhi	r2, #1
c0de8584:	ea22 0103 	bic.w	r1, r2, r3
c0de8588:	1a40      	subs	r0, r0, r1
c0de858a:	b2c0      	uxtb	r0, r0
c0de858c:	bd70      	pop	{r4, r5, r6, pc}

c0de858e <nbgl_useCaseGetNbChoicesInPage>:
c0de858e:	b570      	push	{r4, r5, r6, lr}
c0de8590:	f44f 72fc 	mov.w	r2, #504	@ 0x1f8
c0de8594:	2b00      	cmp	r3, #0
c0de8596:	bf18      	it	ne
c0de8598:	f44f 72cc 	movne.w	r2, #408	@ 0x198
c0de859c:	2400      	movs	r4, #0
c0de859e:	2500      	movs	r5, #0
c0de85a0:	2100      	movs	r1, #0
c0de85a2:	b2ce      	uxtb	r6, r1
c0de85a4:	4286      	cmp	r6, r0
c0de85a6:	d207      	bcs.n	c0de85b8 <nbgl_useCaseGetNbChoicesInPage+0x2a>
c0de85a8:	b2a4      	uxth	r4, r4
c0de85aa:	345c      	adds	r4, #92	@ 0x5c
c0de85ac:	b2a6      	uxth	r6, r4
c0de85ae:	4296      	cmp	r6, r2
c0de85b0:	d204      	bcs.n	c0de85bc <nbgl_useCaseGetNbChoicesInPage+0x2e>
c0de85b2:	3101      	adds	r1, #1
c0de85b4:	4635      	mov	r5, r6
c0de85b6:	e7f4      	b.n	c0de85a2 <nbgl_useCaseGetNbChoicesInPage+0x14>
c0de85b8:	4601      	mov	r1, r0
c0de85ba:	e004      	b.n	c0de85c6 <nbgl_useCaseGetNbChoicesInPage+0x38>
c0de85bc:	b91b      	cbnz	r3, c0de85c6 <nbgl_useCaseGetNbChoicesInPage+0x38>
c0de85be:	08e8      	lsrs	r0, r5, #3
c0de85c0:	2832      	cmp	r0, #50	@ 0x32
c0de85c2:	bf88      	it	hi
c0de85c4:	3901      	subhi	r1, #1
c0de85c6:	b2c8      	uxtb	r0, r1
c0de85c8:	bd70      	pop	{r4, r5, r6, pc}
	...

c0de85cc <useCaseHomeExt>:
c0de85cc:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de85d0:	b08f      	sub	sp, #60	@ 0x3c
c0de85d2:	4604      	mov	r4, r0
c0de85d4:	a802      	add	r0, sp, #8
c0de85d6:	460f      	mov	r7, r1
c0de85d8:	2130      	movs	r1, #48	@ 0x30
c0de85da:	461e      	mov	r6, r3
c0de85dc:	4615      	mov	r5, r2
c0de85de:	3004      	adds	r0, #4
c0de85e0:	f003 fc5a 	bl	c0debe98 <__aeabi_memclr>
c0de85e4:	2009      	movs	r0, #9
c0de85e6:	f88d 0039 	strb.w	r0, [sp, #57]	@ 0x39
c0de85ea:	2006      	movs	r0, #6
c0de85ec:	f88d 001e 	strb.w	r0, [sp, #30]
c0de85f0:	2004      	movs	r0, #4
c0de85f2:	f88d 001d 	strb.w	r0, [sp, #29]
c0de85f6:	2003      	movs	r0, #3
c0de85f8:	2e00      	cmp	r6, #0
c0de85fa:	bf18      	it	ne
c0de85fc:	2001      	movne	r0, #1
c0de85fe:	f88d 001c 	strb.w	r0, [sp, #28]
c0de8602:	9705      	str	r7, [sp, #20]
c0de8604:	9402      	str	r4, [sp, #8]
c0de8606:	f000 f87b 	bl	c0de8700 <reset_callbacks_and_context>
c0de860a:	9816      	ldr	r0, [sp, #88]	@ 0x58
c0de860c:	e9d0 1200 	ldrd	r1, r2, [r0]
c0de8610:	b951      	cbnz	r1, c0de8628 <useCaseHomeExt+0x5c>
c0de8612:	b94a      	cbnz	r2, c0de8628 <useCaseHomeExt+0x5c>
c0de8614:	4831      	ldr	r0, [pc, #196]	@ (c0de86dc <useCaseHomeExt+0x110>)
c0de8616:	2100      	movs	r1, #0
c0de8618:	e9cd 110c 	strd	r1, r1, [sp, #48]	@ 0x30
c0de861c:	4448      	add	r0, r9
c0de861e:	6241      	str	r1, [r0, #36]	@ 0x24
c0de8620:	2002      	movs	r0, #2
c0de8622:	f88d 001f 	strb.w	r0, [sp, #31]
c0de8626:	e00e      	b.n	c0de8646 <useCaseHomeExt+0x7a>
c0de8628:	4b2c      	ldr	r3, [pc, #176]	@ (c0de86dc <useCaseHomeExt+0x110>)
c0de862a:	6886      	ldr	r6, [r0, #8]
c0de862c:	e9cd 120c 	strd	r1, r2, [sp, #48]	@ 0x30
c0de8630:	444b      	add	r3, r9
c0de8632:	625e      	str	r6, [r3, #36]	@ 0x24
c0de8634:	2308      	movs	r3, #8
c0de8636:	7b00      	ldrb	r0, [r0, #12]
c0de8638:	f88d 301f 	strb.w	r3, [sp, #31]
c0de863c:	2800      	cmp	r0, #0
c0de863e:	bf18      	it	ne
c0de8640:	2001      	movne	r0, #1
c0de8642:	f88d 0038 	strb.w	r0, [sp, #56]	@ 0x38
c0de8646:	e9dd a817 	ldrd	sl, r8, [sp, #92]	@ 0x5c
c0de864a:	bb8d      	cbnz	r5, c0de86b0 <useCaseHomeExt+0xe4>
c0de864c:	4620      	mov	r0, r4
c0de864e:	f003 fc8f 	bl	c0debf70 <strlen>
c0de8652:	4e24      	ldr	r6, [pc, #144]	@ (c0de86e4 <useCaseHomeExt+0x118>)
c0de8654:	2814      	cmp	r0, #20
c0de8656:	447e      	add	r6, pc
c0de8658:	d307      	bcc.n	c0de866a <useCaseHomeExt+0x9e>
c0de865a:	4821      	ldr	r0, [pc, #132]	@ (c0de86e0 <useCaseHomeExt+0x114>)
c0de865c:	4922      	ldr	r1, [pc, #136]	@ (c0de86e8 <useCaseHomeExt+0x11c>)
c0de865e:	2236      	movs	r2, #54	@ 0x36
c0de8660:	4448      	add	r0, r9
c0de8662:	4479      	add	r1, pc
c0de8664:	f003 fc0e 	bl	c0debe84 <__aeabi_memcpy>
c0de8668:	e00a      	b.n	c0de8680 <useCaseHomeExt+0xb4>
c0de866a:	e9cd 4600 	strd	r4, r6, [sp]
c0de866e:	481c      	ldr	r0, [pc, #112]	@ (c0de86e0 <useCaseHomeExt+0x114>)
c0de8670:	214a      	movs	r1, #74	@ 0x4a
c0de8672:	4a1e      	ldr	r2, [pc, #120]	@ (c0de86ec <useCaseHomeExt+0x120>)
c0de8674:	4b1e      	ldr	r3, [pc, #120]	@ (c0de86f0 <useCaseHomeExt+0x124>)
c0de8676:	4448      	add	r0, r9
c0de8678:	447a      	add	r2, pc
c0de867a:	447b      	add	r3, pc
c0de867c:	f002 ff72 	bl	c0deb564 <snprintf>
c0de8680:	4f17      	ldr	r7, [pc, #92]	@ (c0de86e0 <useCaseHomeExt+0x114>)
c0de8682:	200b      	movs	r0, #11
c0de8684:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de8688:	2300      	movs	r3, #0
c0de868a:	eb09 0507 	add.w	r5, r9, r7
c0de868e:	4629      	mov	r1, r5
c0de8690:	f002 ff37 	bl	c0deb502 <nbgl_getTextNbLinesInWidth>
c0de8694:	2804      	cmp	r0, #4
c0de8696:	d30b      	bcc.n	c0de86b0 <useCaseHomeExt+0xe4>
c0de8698:	e9cd 4600 	strd	r4, r6, [sp]
c0de869c:	eb09 0507 	add.w	r5, r9, r7
c0de86a0:	214a      	movs	r1, #74	@ 0x4a
c0de86a2:	4a14      	ldr	r2, [pc, #80]	@ (c0de86f4 <useCaseHomeExt+0x128>)
c0de86a4:	4b14      	ldr	r3, [pc, #80]	@ (c0de86f8 <useCaseHomeExt+0x12c>)
c0de86a6:	4628      	mov	r0, r5
c0de86a8:	447a      	add	r2, pc
c0de86aa:	447b      	add	r3, pc
c0de86ac:	f002 ff5a 	bl	c0deb564 <snprintf>
c0de86b0:	480a      	ldr	r0, [pc, #40]	@ (c0de86dc <useCaseHomeExt+0x110>)
c0de86b2:	9503      	str	r5, [sp, #12]
c0de86b4:	2100      	movs	r1, #0
c0de86b6:	eb09 0400 	add.w	r4, r9, r0
c0de86ba:	f8c4 a028 	str.w	sl, [r4, #40]	@ 0x28
c0de86be:	f8c4 8004 	str.w	r8, [r4, #4]
c0de86c2:	480e      	ldr	r0, [pc, #56]	@ (c0de86fc <useCaseHomeExt+0x130>)
c0de86c4:	aa02      	add	r2, sp, #8
c0de86c6:	4478      	add	r0, pc
c0de86c8:	f7ff faac 	bl	c0de7c24 <nbgl_pageDrawInfo>
c0de86cc:	6160      	str	r0, [r4, #20]
c0de86ce:	2002      	movs	r0, #2
c0de86d0:	f002 fec2 	bl	c0deb458 <nbgl_refreshSpecial>
c0de86d4:	b00f      	add	sp, #60	@ 0x3c
c0de86d6:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}
c0de86da:	bf00      	nop
c0de86dc:	00001c28 	.word	0x00001c28
c0de86e0:	00001aa8 	.word	0x00001aa8
c0de86e4:	000051b1 	.word	0x000051b1
c0de86e8:	00006ace 	.word	0x00006ace
c0de86ec:	00004cca 	.word	0x00004cca
c0de86f0:	00005425 	.word	0x00005425
c0de86f4:	00004d34 	.word	0x00004d34
c0de86f8:	000053f5 	.word	0x000053f5
c0de86fc:	000008fb 	.word	0x000008fb

c0de8700 <reset_callbacks_and_context>:
c0de8700:	b580      	push	{r7, lr}
c0de8702:	4808      	ldr	r0, [pc, #32]	@ (c0de8724 <reset_callbacks_and_context+0x24>)
c0de8704:	2100      	movs	r1, #0
c0de8706:	4448      	add	r0, r9
c0de8708:	e9c0 1109 	strd	r1, r1, [r0, #36]	@ 0x24
c0de870c:	62c1      	str	r1, [r0, #44]	@ 0x2c
c0de870e:	e9c0 1101 	strd	r1, r1, [r0, #4]
c0de8712:	60c1      	str	r1, [r0, #12]
c0de8714:	6181      	str	r1, [r0, #24]
c0de8716:	4804      	ldr	r0, [pc, #16]	@ (c0de8728 <reset_callbacks_and_context+0x28>)
c0de8718:	216c      	movs	r1, #108	@ 0x6c
c0de871a:	4448      	add	r0, r9
c0de871c:	f003 fbbc 	bl	c0debe98 <__aeabi_memclr>
c0de8720:	bd80      	pop	{r7, pc}
c0de8722:	bf00      	nop
c0de8724:	00001c28 	.word	0x00001c28
c0de8728:	0000195c 	.word	0x0000195c

c0de872c <prepareNavInfo>:
c0de872c:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de8730:	4f1b      	ldr	r7, [pc, #108]	@ (c0de87a0 <prepareNavInfo+0x74>)
c0de8732:	460c      	mov	r4, r1
c0de8734:	4606      	mov	r6, r0
c0de8736:	211c      	movs	r1, #28
c0de8738:	4690      	mov	r8, r2
c0de873a:	eb09 0507 	add.w	r5, r9, r7
c0de873e:	f105 0060 	add.w	r0, r5, #96	@ 0x60
c0de8742:	f003 fba9 	bl	c0debe98 <__aeabi_memclr>
c0de8746:	2009      	movs	r0, #9
c0de8748:	f885 4061 	strb.w	r4, [r5, #97]	@ 0x61
c0de874c:	f885 0065 	strb.w	r0, [r5, #101]	@ 0x65
c0de8750:	2001      	movs	r0, #1
c0de8752:	f885 0063 	strb.w	r0, [r5, #99]	@ 0x63
c0de8756:	b1ce      	cbz	r6, c0de878c <prepareNavInfo+0x60>
c0de8758:	eb09 0007 	add.w	r0, r9, r7
c0de875c:	210c      	movs	r1, #12
c0de875e:	f880 1062 	strb.w	r1, [r0, #98]	@ 0x62
c0de8762:	2103      	movs	r1, #3
c0de8764:	f8c0 8074 	str.w	r8, [r0, #116]	@ 0x74
c0de8768:	f880 1073 	strb.w	r1, [r0, #115]	@ 0x73
c0de876c:	f819 1007 	ldrb.w	r1, [r9, r7]
c0de8770:	3903      	subs	r1, #3
c0de8772:	bf18      	it	ne
c0de8774:	2101      	movne	r1, #1
c0de8776:	2200      	movs	r2, #0
c0de8778:	f880 1072 	strb.w	r1, [r0, #114]	@ 0x72
c0de877c:	2c01      	cmp	r4, #1
c0de877e:	bf88      	it	hi
c0de8780:	2201      	movhi	r2, #1
c0de8782:	4311      	orrs	r1, r2
c0de8784:	f880 1071 	strb.w	r1, [r0, #113]	@ 0x71
c0de8788:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de878c:	eb09 0107 	add.w	r1, r9, r7
c0de8790:	f881 0071 	strb.w	r0, [r1, #113]	@ 0x71
c0de8794:	2003      	movs	r0, #3
c0de8796:	f881 0073 	strb.w	r0, [r1, #115]	@ 0x73
c0de879a:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de879e:	bf00      	nop
c0de87a0:	00001c28 	.word	0x00001c28

c0de87a4 <displaySettingsPage>:
c0de87a4:	b570      	push	{r4, r5, r6, lr}
c0de87a6:	b090      	sub	sp, #64	@ 0x40
c0de87a8:	460c      	mov	r4, r1
c0de87aa:	4605      	mov	r5, r0
c0de87ac:	4668      	mov	r0, sp
c0de87ae:	2140      	movs	r1, #64	@ 0x40
c0de87b0:	f003 fb72 	bl	c0debe98 <__aeabi_memclr>
c0de87b4:	4e12      	ldr	r6, [pc, #72]	@ (c0de8800 <displaySettingsPage+0x5c>)
c0de87b6:	eb09 0006 	add.w	r0, r9, r6
c0de87ba:	6882      	ldr	r2, [r0, #8]
c0de87bc:	b1f2      	cbz	r2, c0de87fc <displaySettingsPage+0x58>
c0de87be:	4669      	mov	r1, sp
c0de87c0:	4628      	mov	r0, r5
c0de87c2:	4790      	blx	r2
c0de87c4:	b1d0      	cbz	r0, c0de87fc <displaySettingsPage+0x58>
c0de87c6:	444e      	add	r6, r9
c0de87c8:	2009      	movs	r0, #9
c0de87ca:	466a      	mov	r2, sp
c0de87cc:	f88d 0006 	strb.w	r0, [sp, #6]
c0de87d0:	f240 2001 	movw	r0, #513	@ 0x201
c0de87d4:	f806 5f60 	strb.w	r5, [r6, #96]!
c0de87d8:	f8ad 0004 	strh.w	r0, [sp, #4]
c0de87dc:	f856 0c50 	ldr.w	r0, [r6, #-80]
c0de87e0:	4631      	mov	r1, r6
c0de87e2:	9000      	str	r0, [sp, #0]
c0de87e4:	4807      	ldr	r0, [pc, #28]	@ (c0de8804 <displaySettingsPage+0x60>)
c0de87e6:	4478      	add	r0, pc
c0de87e8:	f7ff fd6c 	bl	c0de82c4 <nbgl_pageDrawGenericContent>
c0de87ec:	f846 0c4c 	str.w	r0, [r6, #-76]
c0de87f0:	2001      	movs	r0, #1
c0de87f2:	2c00      	cmp	r4, #0
c0de87f4:	bf18      	it	ne
c0de87f6:	2002      	movne	r0, #2
c0de87f8:	f002 fe2e 	bl	c0deb458 <nbgl_refreshSpecial>
c0de87fc:	b010      	add	sp, #64	@ 0x40
c0de87fe:	bd70      	pop	{r4, r5, r6, pc}
c0de8800:	00001c28 	.word	0x00001c28
c0de8804:	000007db 	.word	0x000007db

c0de8808 <nbgl_useCaseGenericSettings>:
c0de8808:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de880c:	461d      	mov	r5, r3
c0de880e:	4616      	mov	r6, r2
c0de8810:	4688      	mov	r8, r1
c0de8812:	4607      	mov	r7, r0
c0de8814:	f7ff ff74 	bl	c0de8700 <reset_callbacks_and_context>
c0de8818:	4c25      	ldr	r4, [pc, #148]	@ (c0de88b0 <nbgl_useCaseGenericSettings+0xa8>)
c0de881a:	2002      	movs	r0, #2
c0de881c:	f809 0004 	strb.w	r0, [r9, r4]
c0de8820:	eb09 0004 	add.w	r0, r9, r4
c0de8824:	6107      	str	r7, [r0, #16]
c0de8826:	9906      	ldr	r1, [sp, #24]
c0de8828:	6041      	str	r1, [r0, #4]
c0de882a:	b12e      	cbz	r6, c0de8838 <nbgl_useCaseGenericSettings+0x30>
c0de882c:	4821      	ldr	r0, [pc, #132]	@ (c0de88b4 <nbgl_useCaseGenericSettings+0xac>)
c0de882e:	e896 000e 	ldmia.w	r6, {r1, r2, r3}
c0de8832:	4448      	add	r0, r9
c0de8834:	3004      	adds	r0, #4
c0de8836:	c00e      	stmia	r0!, {r1, r2, r3}
c0de8838:	b1a5      	cbz	r5, c0de8864 <nbgl_useCaseGenericSettings+0x5c>
c0de883a:	481e      	ldr	r0, [pc, #120]	@ (c0de88b4 <nbgl_useCaseGenericSettings+0xac>)
c0de883c:	2101      	movs	r1, #1
c0de883e:	4448      	add	r0, r9
c0de8840:	7501      	strb	r1, [r0, #20]
c0de8842:	481d      	ldr	r0, [pc, #116]	@ (c0de88b8 <nbgl_useCaseGenericSettings+0xb0>)
c0de8844:	2138      	movs	r1, #56	@ 0x38
c0de8846:	eb09 0600 	add.w	r6, r9, r0
c0de884a:	f106 0038 	add.w	r0, r6, #56	@ 0x38
c0de884e:	f003 fb23 	bl	c0debe98 <__aeabi_memclr>
c0de8852:	2008      	movs	r0, #8
c0de8854:	4629      	mov	r1, r5
c0de8856:	2230      	movs	r2, #48	@ 0x30
c0de8858:	f886 0038 	strb.w	r0, [r6, #56]	@ 0x38
c0de885c:	f106 003c 	add.w	r0, r6, #60	@ 0x3c
c0de8860:	f003 fb10 	bl	c0debe84 <__aeabi_memcpy>
c0de8864:	f002 f956 	bl	c0deab14 <OUTLINED_FUNCTION_5>
c0de8868:	4606      	mov	r6, r0
c0de886a:	b145      	cbz	r5, c0de887e <nbgl_useCaseGenericSettings+0x76>
c0de886c:	4812      	ldr	r0, [pc, #72]	@ (c0de88b8 <nbgl_useCaseGenericSettings+0xb0>)
c0de886e:	4631      	mov	r1, r6
c0de8870:	2201      	movs	r2, #1
c0de8872:	2300      	movs	r3, #0
c0de8874:	4448      	add	r0, r9
c0de8876:	3038      	adds	r0, #56	@ 0x38
c0de8878:	f000 f848 	bl	c0de890c <getNbPagesForContent>
c0de887c:	4406      	add	r6, r0
c0de887e:	444c      	add	r4, r9
c0de8880:	211c      	movs	r1, #28
c0de8882:	f104 0060 	add.w	r0, r4, #96	@ 0x60
c0de8886:	f003 fb07 	bl	c0debe98 <__aeabi_memclr>
c0de888a:	2009      	movs	r0, #9
c0de888c:	f884 6061 	strb.w	r6, [r4, #97]	@ 0x61
c0de8890:	2101      	movs	r1, #1
c0de8892:	f884 0065 	strb.w	r0, [r4, #101]	@ 0x65
c0de8896:	2003      	movs	r0, #3
c0de8898:	f884 0073 	strb.w	r0, [r4, #115]	@ 0x73
c0de889c:	2001      	movs	r0, #1
c0de889e:	f884 0063 	strb.w	r0, [r4, #99]	@ 0x63
c0de88a2:	f884 0071 	strb.w	r0, [r4, #113]	@ 0x71
c0de88a6:	4640      	mov	r0, r8
c0de88a8:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de88ac:	f000 b8c0 	b.w	c0de8a30 <displayGenericContextPage>
c0de88b0:	00001c28 	.word	0x00001c28
c0de88b4:	0000195c 	.word	0x0000195c
c0de88b8:	000019c8 	.word	0x000019c8

c0de88bc <getNbPagesForGenericContents>:
c0de88bc:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de88c0:	b08e      	sub	sp, #56	@ 0x38
c0de88c2:	4f11      	ldr	r7, [pc, #68]	@ (c0de8908 <getNbPagesForGenericContents+0x4c>)
c0de88c4:	4604      	mov	r4, r0
c0de88c6:	2600      	movs	r6, #0
c0de88c8:	46e8      	mov	r8, sp
c0de88ca:	2500      	movs	r5, #0
c0de88cc:	eb09 0007 	add.w	r0, r9, r7
c0de88d0:	7b00      	ldrb	r0, [r0, #12]
c0de88d2:	4285      	cmp	r5, r0
c0de88d4:	d214      	bcs.n	c0de8900 <getNbPagesForGenericContents+0x44>
c0de88d6:	b268      	sxtb	r0, r5
c0de88d8:	4641      	mov	r1, r8
c0de88da:	f001 fabb 	bl	c0de9e54 <getContentAtIdx>
c0de88de:	b170      	cbz	r0, c0de88fe <getNbPagesForGenericContents+0x42>
c0de88e0:	eb09 0107 	add.w	r1, r9, r7
c0de88e4:	4623      	mov	r3, r4
c0de88e6:	7b09      	ldrb	r1, [r1, #12]
c0de88e8:	1a69      	subs	r1, r5, r1
c0de88ea:	3101      	adds	r1, #1
c0de88ec:	fab1 f181 	clz	r1, r1
c0de88f0:	094a      	lsrs	r2, r1, #5
c0de88f2:	b2f1      	uxtb	r1, r6
c0de88f4:	f000 f80a 	bl	c0de890c <getNbPagesForContent>
c0de88f8:	4406      	add	r6, r0
c0de88fa:	3501      	adds	r5, #1
c0de88fc:	e7e6      	b.n	c0de88cc <getNbPagesForGenericContents+0x10>
c0de88fe:	2600      	movs	r6, #0
c0de8900:	b2f0      	uxtb	r0, r6
c0de8902:	b00e      	add	sp, #56	@ 0x38
c0de8904:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de8908:	0000195c 	.word	0x0000195c

c0de890c <getNbPagesForContent>:
c0de890c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de8910:	b08c      	sub	sp, #48	@ 0x30
c0de8912:	4606      	mov	r6, r0
c0de8914:	fab1 f081 	clz	r0, r1
c0de8918:	9306      	str	r3, [sp, #24]
c0de891a:	4614      	mov	r4, r2
c0de891c:	9109      	str	r1, [sp, #36]	@ 0x24
c0de891e:	0940      	lsrs	r0, r0, #5
c0de8920:	4010      	ands	r0, r2
c0de8922:	900a      	str	r0, [sp, #40]	@ 0x28
c0de8924:	4630      	mov	r0, r6
c0de8926:	f001 fabf 	bl	c0de9ea8 <getContentNbElement>
c0de892a:	4605      	mov	r5, r0
c0de892c:	f084 0001 	eor.w	r0, r4, #1
c0de8930:	f04f 0800 	mov.w	r8, #0
c0de8934:	f04f 0a00 	mov.w	sl, #0
c0de8938:	f04f 0b00 	mov.w	fp, #0
c0de893c:	270f      	movs	r7, #15
c0de893e:	9405      	str	r4, [sp, #20]
c0de8940:	9608      	str	r6, [sp, #32]
c0de8942:	9004      	str	r0, [sp, #16]
c0de8944:	1d30      	adds	r0, r6, #4
c0de8946:	9007      	str	r0, [sp, #28]
c0de8948:	0628      	lsls	r0, r5, #24
c0de894a:	d068      	beq.n	c0de8a1e <getNbPagesForContent+0x112>
c0de894c:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de894e:	f88d 802f 	strb.w	r8, [sp, #47]	@ 0x2f
c0de8952:	b128      	cbz	r0, c0de8960 <getNbPagesForContent+0x54>
c0de8954:	fa5f f38b 	uxtb.w	r3, fp
c0de8958:	2b00      	cmp	r3, #0
c0de895a:	bf18      	it	ne
c0de895c:	2301      	movne	r3, #1
c0de895e:	e000      	b.n	c0de8962 <getNbPagesForContent+0x56>
c0de8960:	2301      	movs	r3, #1
c0de8962:	9808      	ldr	r0, [sp, #32]
c0de8964:	7800      	ldrb	r0, [r0, #0]
c0de8966:	280a      	cmp	r0, #10
c0de8968:	d00e      	beq.n	c0de8988 <getNbPagesForContent+0x7c>
c0de896a:	2806      	cmp	r0, #6
c0de896c:	d011      	beq.n	c0de8992 <getNbPagesForContent+0x86>
c0de896e:	2807      	cmp	r0, #7
c0de8970:	d01e      	beq.n	c0de89b0 <getNbPagesForContent+0xa4>
c0de8972:	2808      	cmp	r0, #8
c0de8974:	d023      	beq.n	c0de89be <getNbPagesForContent+0xb2>
c0de8976:	2809      	cmp	r0, #9
c0de8978:	d028      	beq.n	c0de89cc <getNbPagesForContent+0xc0>
c0de897a:	2804      	cmp	r0, #4
c0de897c:	d12b      	bne.n	c0de89d6 <getNbPagesForContent+0xca>
c0de897e:	2000      	movs	r0, #0
c0de8980:	f04f 0800 	mov.w	r8, #0
c0de8984:	9000      	str	r0, [sp, #0]
c0de8986:	e007      	b.n	c0de8998 <getNbPagesForContent+0x8c>
c0de8988:	b2e8      	uxtb	r0, r5
c0de898a:	2200      	movs	r2, #0
c0de898c:	f7ff fddf 	bl	c0de854e <nbgl_useCaseGetNbBarsInPage>
c0de8990:	e028      	b.n	c0de89e4 <getNbPagesForContent+0xd8>
c0de8992:	9805      	ldr	r0, [sp, #20]
c0de8994:	9000      	str	r0, [sp, #0]
c0de8996:	9804      	ldr	r0, [sp, #16]
c0de8998:	9001      	str	r0, [sp, #4]
c0de899a:	f10d 002f 	add.w	r0, sp, #47	@ 0x2f
c0de899e:	e9dd 3106 	ldrd	r3, r1, [sp, #24]
c0de89a2:	fa5f f28b 	uxtb.w	r2, fp
c0de89a6:	9002      	str	r0, [sp, #8]
c0de89a8:	b2e8      	uxtb	r0, r5
c0de89aa:	f7ff fcb6 	bl	c0de831a <getNbTagValuesInPage>
c0de89ae:	e019      	b.n	c0de89e4 <getNbPagesForContent+0xd8>
c0de89b0:	9907      	ldr	r1, [sp, #28]
c0de89b2:	b2e8      	uxtb	r0, r5
c0de89b4:	fa5f f28b 	uxtb.w	r2, fp
c0de89b8:	f7ff fd93 	bl	c0de84e2 <nbgl_useCaseGetNbSwitchesInPage>
c0de89bc:	e012      	b.n	c0de89e4 <getNbPagesForContent+0xd8>
c0de89be:	9907      	ldr	r1, [sp, #28]
c0de89c0:	b2e8      	uxtb	r0, r5
c0de89c2:	fa5f f28b 	uxtb.w	r2, fp
c0de89c6:	f7ff fd43 	bl	c0de8450 <nbgl_useCaseGetNbInfosInPage>
c0de89ca:	e00b      	b.n	c0de89e4 <getNbPagesForContent+0xd8>
c0de89cc:	b2e8      	uxtb	r0, r5
c0de89ce:	2200      	movs	r2, #0
c0de89d0:	f7ff fddd 	bl	c0de858e <nbgl_useCaseGetNbChoicesInPage>
c0de89d4:	e006      	b.n	c0de89e4 <getNbPagesForContent+0xd8>
c0de89d6:	4915      	ldr	r1, [pc, #84]	@ (c0de8a2c <getNbPagesForContent+0x120>)
c0de89d8:	4479      	add	r1, pc
c0de89da:	5c08      	ldrb	r0, [r1, r0]
c0de89dc:	b2e9      	uxtb	r1, r5
c0de89de:	4288      	cmp	r0, r1
c0de89e0:	bf28      	it	cs
c0de89e2:	4628      	movcs	r0, r5
c0de89e4:	9909      	ldr	r1, [sp, #36]	@ 0x24
c0de89e6:	f89d 402f 	ldrb.w	r4, [sp, #47]	@ 0x2f
c0de89ea:	f000 0307 	and.w	r3, r0, #7
c0de89ee:	2204      	movs	r2, #4
c0de89f0:	1a2d      	subs	r5, r5, r0
c0de89f2:	4483      	add	fp, r0
c0de89f4:	4451      	add	r1, sl
c0de89f6:	ea43 03c4 	orr.w	r3, r3, r4, lsl #3
c0de89fa:	4c0b      	ldr	r4, [pc, #44]	@ (c0de8a28 <getNbPagesForContent+0x11c>)
c0de89fc:	f10a 0a01 	add.w	sl, sl, #1
c0de8a00:	b2c9      	uxtb	r1, r1
c0de8a02:	b2db      	uxtb	r3, r3
c0de8a04:	ea02 0281 	and.w	r2, r2, r1, lsl #2
c0de8a08:	444c      	add	r4, r9
c0de8a0a:	0849      	lsrs	r1, r1, #1
c0de8a0c:	5c66      	ldrb	r6, [r4, r1]
c0de8a0e:	4093      	lsls	r3, r2
c0de8a10:	fa07 f202 	lsl.w	r2, r7, r2
c0de8a14:	ea26 0202 	bic.w	r2, r6, r2
c0de8a18:	431a      	orrs	r2, r3
c0de8a1a:	5462      	strb	r2, [r4, r1]
c0de8a1c:	e794      	b.n	c0de8948 <getNbPagesForContent+0x3c>
c0de8a1e:	fa5f f08a 	uxtb.w	r0, sl
c0de8a22:	b00c      	add	sp, #48	@ 0x30
c0de8a24:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de8a28:	00001b28 	.word	0x00001b28
c0de8a2c:	0000678e 	.word	0x0000678e

c0de8a30 <displayGenericContextPage>:
c0de8a30:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de8a34:	b0a0      	sub	sp, #128	@ 0x80
c0de8a36:	f8df 23e0 	ldr.w	r2, [pc, #992]	@ c0de8e18 <displayGenericContextPage+0x3e8>
c0de8a3a:	4683      	mov	fp, r0
c0de8a3c:	f819 0002 	ldrb.w	r0, [r9, r2]
c0de8a40:	2803      	cmp	r0, #3
c0de8a42:	d10f      	bne.n	c0de8a64 <displayGenericContextPage+0x34>
c0de8a44:	f8df 03d4 	ldr.w	r0, [pc, #980]	@ c0de8e1c <displayGenericContextPage+0x3ec>
c0de8a48:	f1bb 0fff 	cmp.w	fp, #255	@ 0xff
c0de8a4c:	4448      	add	r0, r9
c0de8a4e:	d05f      	beq.n	c0de8b10 <displayGenericContextPage+0xe0>
c0de8a50:	f890 0030 	ldrb.w	r0, [r0, #48]	@ 0x30
c0de8a54:	4558      	cmp	r0, fp
c0de8a56:	d80e      	bhi.n	c0de8a76 <displayGenericContextPage+0x46>
c0de8a58:	2001      	movs	r0, #1
c0de8a5a:	b020      	add	sp, #128	@ 0x80
c0de8a5c:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de8a60:	f001 b854 	b.w	c0de9b0c <bundleNavReviewStreamingChoice>
c0de8a64:	f1bb 0fff 	cmp.w	fp, #255	@ 0xff
c0de8a68:	d105      	bne.n	c0de8a76 <displayGenericContextPage+0x46>
c0de8a6a:	eb09 0002 	add.w	r0, r9, r2
c0de8a6e:	f890 0061 	ldrb.w	r0, [r0, #97]	@ 0x61
c0de8a72:	f1a0 0b01 	sub.w	fp, r0, #1
c0de8a76:	eb09 0002 	add.w	r0, r9, r2
c0de8a7a:	fa5f f78b 	uxtb.w	r7, fp
c0de8a7e:	9100      	str	r1, [sp, #0]
c0de8a80:	f890 8060 	ldrb.w	r8, [r0, #96]	@ 0x60
c0de8a84:	4547      	cmp	r7, r8
c0de8a86:	d12e      	bne.n	c0de8ae6 <displayGenericContextPage+0xb6>
c0de8a88:	a912      	add	r1, sp, #72	@ 0x48
c0de8a8a:	f10d 0247 	add.w	r2, sp, #71	@ 0x47
c0de8a8e:	f10d 0346 	add.w	r3, sp, #70	@ 0x46
c0de8a92:	4638      	mov	r0, r7
c0de8a94:	f001 fa20 	bl	c0de9ed8 <genericContextComputeNextPageParams>
c0de8a98:	4682      	mov	sl, r0
c0de8a9a:	f1ba 0f00 	cmp.w	sl, #0
c0de8a9e:	f000 8147 	beq.w	c0de8d30 <displayGenericContextPage+0x300>
c0de8aa2:	f8df 8374 	ldr.w	r8, [pc, #884]	@ c0de8e18 <displayGenericContextPage+0x3e8>
c0de8aa6:	f819 0008 	ldrb.w	r0, [r9, r8]
c0de8aaa:	2803      	cmp	r0, #3
c0de8aac:	d041      	beq.n	c0de8b32 <displayGenericContextPage+0x102>
c0de8aae:	48db      	ldr	r0, [pc, #876]	@ (c0de8e1c <displayGenericContextPage+0x3ec>)
c0de8ab0:	4448      	add	r0, r9
c0de8ab2:	f890 0020 	ldrb.w	r0, [r0, #32]
c0de8ab6:	06c0      	lsls	r0, r0, #27
c0de8ab8:	d53b      	bpl.n	c0de8b32 <displayGenericContextPage+0x102>
c0de8aba:	ea5f 600b 	movs.w	r0, fp, lsl #24
c0de8abe:	d034      	beq.n	c0de8b2a <displayGenericContextPage+0xfa>
c0de8ac0:	eb09 0008 	add.w	r0, r9, r8
c0de8ac4:	f890 0061 	ldrb.w	r0, [r0, #97]	@ 0x61
c0de8ac8:	3801      	subs	r0, #1
c0de8aca:	42b8      	cmp	r0, r7
c0de8acc:	dd2d      	ble.n	c0de8b2a <displayGenericContextPage+0xfa>
c0de8ace:	eb09 0008 	add.w	r0, r9, r8
c0de8ad2:	2105      	movs	r1, #5
c0de8ad4:	f880 106c 	strb.w	r1, [r0, #108]	@ 0x6c
c0de8ad8:	49d2      	ldr	r1, [pc, #840]	@ (c0de8e24 <displayGenericContextPage+0x3f4>)
c0de8ada:	4479      	add	r1, pc
c0de8adc:	6681      	str	r1, [r0, #104]	@ 0x68
c0de8ade:	2100      	movs	r1, #0
c0de8ae0:	f880 1064 	strb.w	r1, [r0, #100]	@ 0x64
c0de8ae4:	e025      	b.n	c0de8b32 <displayGenericContextPage+0x102>
c0de8ae6:	d91b      	bls.n	c0de8b20 <displayGenericContextPage+0xf0>
c0de8ae8:	f04f 0a00 	mov.w	sl, #0
c0de8aec:	ac12      	add	r4, sp, #72	@ 0x48
c0de8aee:	f10d 0547 	add.w	r5, sp, #71	@ 0x47
c0de8af2:	f10d 0646 	add.w	r6, sp, #70	@ 0x46
c0de8af6:	4547      	cmp	r7, r8
c0de8af8:	d0cf      	beq.n	c0de8a9a <displayGenericContextPage+0x6a>
c0de8afa:	f108 0801 	add.w	r8, r8, #1
c0de8afe:	4621      	mov	r1, r4
c0de8b00:	462a      	mov	r2, r5
c0de8b02:	4633      	mov	r3, r6
c0de8b04:	fa5f f088 	uxtb.w	r0, r8
c0de8b08:	f001 f9e6 	bl	c0de9ed8 <genericContextComputeNextPageParams>
c0de8b0c:	4682      	mov	sl, r0
c0de8b0e:	e7f2      	b.n	c0de8af6 <displayGenericContextPage+0xc6>
c0de8b10:	6a80      	ldr	r0, [r0, #40]	@ 0x28
c0de8b12:	2800      	cmp	r0, #0
c0de8b14:	f000 810c 	beq.w	c0de8d30 <displayGenericContextPage+0x300>
c0de8b18:	b020      	add	sp, #128	@ 0x80
c0de8b1a:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de8b1e:	4700      	bx	r0
c0de8b20:	eba7 0008 	sub.w	r0, r7, r8
c0de8b24:	2801      	cmp	r0, #1
c0de8b26:	ddaf      	ble.n	c0de8a88 <displayGenericContextPage+0x58>
c0de8b28:	e102      	b.n	c0de8d30 <displayGenericContextPage+0x300>
c0de8b2a:	eb09 0008 	add.w	r0, r9, r8
c0de8b2e:	2100      	movs	r1, #0
c0de8b30:	6681      	str	r1, [r0, #104]	@ 0x68
c0de8b32:	af01      	add	r7, sp, #4
c0de8b34:	213c      	movs	r1, #60	@ 0x3c
c0de8b36:	1d38      	adds	r0, r7, #4
c0de8b38:	f003 f9ae 	bl	c0debe98 <__aeabi_memclr>
c0de8b3c:	2009      	movs	r0, #9
c0de8b3e:	f8df b2e0 	ldr.w	fp, [pc, #736]	@ c0de8e20 <displayGenericContextPage+0x3f0>
c0de8b42:	f89d 5047 	ldrb.w	r5, [sp, #71]	@ 0x47
c0de8b46:	f88d 000a 	strb.w	r0, [sp, #10]
c0de8b4a:	2002      	movs	r0, #2
c0de8b4c:	f88d 0009 	strb.w	r0, [sp, #9]
c0de8b50:	eb09 0008 	add.w	r0, r9, r8
c0de8b54:	eb09 010b 	add.w	r1, r9, fp
c0de8b58:	6900      	ldr	r0, [r0, #16]
c0de8b5a:	7c8e      	ldrb	r6, [r1, #18]
c0de8b5c:	9001      	str	r0, [sp, #4]
c0de8b5e:	f89a 0000 	ldrb.w	r0, [sl]
c0de8b62:	280a      	cmp	r0, #10
c0de8b64:	f88d 0010 	strb.w	r0, [sp, #16]
c0de8b68:	d01e      	beq.n	c0de8ba8 <displayGenericContextPage+0x178>
c0de8b6a:	2801      	cmp	r0, #1
c0de8b6c:	d02c      	beq.n	c0de8bc8 <displayGenericContextPage+0x198>
c0de8b6e:	2802      	cmp	r0, #2
c0de8b70:	d014      	beq.n	c0de8b9c <displayGenericContextPage+0x16c>
c0de8b72:	2803      	cmp	r0, #3
c0de8b74:	d012      	beq.n	c0de8b9c <displayGenericContextPage+0x16c>
c0de8b76:	2804      	cmp	r0, #4
c0de8b78:	d02e      	beq.n	c0de8bd8 <displayGenericContextPage+0x1a8>
c0de8b7a:	2806      	cmp	r0, #6
c0de8b7c:	d042      	beq.n	c0de8c04 <displayGenericContextPage+0x1d4>
c0de8b7e:	2807      	cmp	r0, #7
c0de8b80:	d04e      	beq.n	c0de8c20 <displayGenericContextPage+0x1f0>
c0de8b82:	2808      	cmp	r0, #8
c0de8b84:	d058      	beq.n	c0de8c38 <displayGenericContextPage+0x208>
c0de8b86:	2809      	cmp	r0, #9
c0de8b88:	d063      	beq.n	c0de8c52 <displayGenericContextPage+0x222>
c0de8b8a:	2800      	cmp	r0, #0
c0de8b8c:	f040 80d0 	bne.w	c0de8d30 <displayGenericContextPage+0x300>
c0de8b90:	f001 ffdd 	bl	c0deab4e <OUTLINED_FUNCTION_14>
c0de8b94:	e890 007c 	ldmia.w	r0, {r2, r3, r4, r5, r6}
c0de8b98:	c17c      	stmia	r1!, {r2, r3, r4, r5, r6}
c0de8b9a:	e092      	b.n	c0de8cc2 <displayGenericContextPage+0x292>
c0de8b9c:	f001 ffd7 	bl	c0deab4e <OUTLINED_FUNCTION_14>
c0de8ba0:	e890 003c 	ldmia.w	r0, {r2, r3, r4, r5}
c0de8ba4:	c13c      	stmia	r1!, {r2, r3, r4, r5}
c0de8ba6:	e08c      	b.n	c0de8cc2 <displayGenericContextPage+0x292>
c0de8ba8:	f88d 501c 	strb.w	r5, [sp, #28]
c0de8bac:	f001 ff9b 	bl	c0deaae6 <OUTLINED_FUNCTION_1>
c0de8bb0:	9005      	str	r0, [sp, #20]
c0de8bb2:	f8da 0008 	ldr.w	r0, [sl, #8]
c0de8bb6:	4430      	add	r0, r6
c0de8bb8:	f002 fe66 	bl	c0deb888 <pic>
c0de8bbc:	9006      	str	r0, [sp, #24]
c0de8bbe:	f89a 000d 	ldrb.w	r0, [sl, #13]
c0de8bc2:	f88d 001d 	strb.w	r0, [sp, #29]
c0de8bc6:	e07c      	b.n	c0de8cc2 <displayGenericContextPage+0x292>
c0de8bc8:	f107 0010 	add.w	r0, r7, #16
c0de8bcc:	f10a 0104 	add.w	r1, sl, #4
c0de8bd0:	2230      	movs	r2, #48	@ 0x30
c0de8bd2:	f003 f957 	bl	c0debe84 <__aeabi_memcpy>
c0de8bd6:	e074      	b.n	c0de8cc2 <displayGenericContextPage+0x292>
c0de8bd8:	f8da 2004 	ldr.w	r2, [sl, #4]
c0de8bdc:	eb09 010b 	add.w	r1, r9, fp
c0de8be0:	f89d 0046 	ldrb.w	r0, [sp, #70]	@ 0x46
c0de8be4:	9f00      	ldr	r7, [sp, #0]
c0de8be6:	624a      	str	r2, [r1, #36]	@ 0x24
c0de8be8:	2800      	cmp	r0, #0
c0de8bea:	f8da 2008 	ldr.w	r2, [sl, #8]
c0de8bee:	628a      	str	r2, [r1, #40]	@ 0x28
c0de8bf0:	f000 80bf 	beq.w	c0de8d72 <displayGenericContextPage+0x342>
c0de8bf4:	f8da 0004 	ldr.w	r0, [sl, #4]
c0de8bf8:	2800      	cmp	r0, #0
c0de8bfa:	f000 809c 	beq.w	c0de8d36 <displayGenericContextPage+0x306>
c0de8bfe:	eb00 1006 	add.w	r0, r0, r6, lsl #4
c0de8c02:	e09c      	b.n	c0de8d3e <displayGenericContextPage+0x30e>
c0de8c04:	f89a 100c 	ldrb.w	r1, [sl, #12]
c0de8c08:	1970      	adds	r0, r6, r5
c0de8c0a:	f10a 0404 	add.w	r4, sl, #4
c0de8c0e:	4288      	cmp	r0, r1
c0de8c10:	d134      	bne.n	c0de8c7c <displayGenericContextPage+0x24c>
c0de8c12:	3710      	adds	r7, #16
c0de8c14:	4621      	mov	r1, r4
c0de8c16:	222c      	movs	r2, #44	@ 0x2c
c0de8c18:	4638      	mov	r0, r7
c0de8c1a:	f003 f933 	bl	c0debe84 <__aeabi_memcpy>
c0de8c1e:	e031      	b.n	c0de8c84 <displayGenericContextPage+0x254>
c0de8c20:	f88d 5018 	strb.w	r5, [sp, #24]
c0de8c24:	eb06 0046 	add.w	r0, r6, r6, lsl #1
c0de8c28:	f8da 1004 	ldr.w	r1, [sl, #4]
c0de8c2c:	eb01 0080 	add.w	r0, r1, r0, lsl #2
c0de8c30:	f002 fe2a 	bl	c0deb888 <pic>
c0de8c34:	9005      	str	r0, [sp, #20]
c0de8c36:	e044      	b.n	c0de8cc2 <displayGenericContextPage+0x292>
c0de8c38:	f88d 5020 	strb.w	r5, [sp, #32]
c0de8c3c:	f001 ff53 	bl	c0deaae6 <OUTLINED_FUNCTION_1>
c0de8c40:	9005      	str	r0, [sp, #20]
c0de8c42:	f8da 0008 	ldr.w	r0, [sl, #8]
c0de8c46:	eb00 0086 	add.w	r0, r0, r6, lsl #2
c0de8c4a:	f002 fe1d 	bl	c0deb888 <pic>
c0de8c4e:	9006      	str	r0, [sp, #24]
c0de8c50:	e037      	b.n	c0de8cc2 <displayGenericContextPage+0x292>
c0de8c52:	f001 ff7c 	bl	c0deab4e <OUTLINED_FUNCTION_14>
c0de8c56:	e890 001c 	ldmia.w	r0, {r2, r3, r4}
c0de8c5a:	c11c      	stmia	r1!, {r2, r3, r4}
c0de8c5c:	f88d 5019 	strb.w	r5, [sp, #25]
c0de8c60:	f001 ff41 	bl	c0deaae6 <OUTLINED_FUNCTION_1>
c0de8c64:	9005      	str	r0, [sp, #20]
c0de8c66:	f89a 000a 	ldrb.w	r0, [sl, #10]
c0de8c6a:	42b0      	cmp	r0, r6
c0de8c6c:	d327      	bcc.n	c0de8cbe <displayGenericContextPage+0x28e>
c0de8c6e:	1971      	adds	r1, r6, r5
c0de8c70:	4281      	cmp	r1, r0
c0de8c72:	d924      	bls.n	c0de8cbe <displayGenericContextPage+0x28e>
c0de8c74:	1b80      	subs	r0, r0, r6
c0de8c76:	f88d 001a 	strb.w	r0, [sp, #26]
c0de8c7a:	e022      	b.n	c0de8cc2 <displayGenericContextPage+0x292>
c0de8c7c:	2004      	movs	r0, #4
c0de8c7e:	3710      	adds	r7, #16
c0de8c80:	f88d 0010 	strb.w	r0, [sp, #16]
c0de8c84:	f88d 501c 	strb.w	r5, [sp, #28]
c0de8c88:	6820      	ldr	r0, [r4, #0]
c0de8c8a:	eb00 1006 	add.w	r0, r0, r6, lsl #4
c0de8c8e:	f002 fdfb 	bl	c0deb888 <pic>
c0de8c92:	2110      	movs	r1, #16
c0de8c94:	2200      	movs	r2, #0
c0de8c96:	6038      	str	r0, [r7, #0]
c0de8c98:	eb01 1105 	add.w	r1, r1, r5, lsl #4
c0de8c9c:	f102 0310 	add.w	r3, r2, #16
c0de8ca0:	4299      	cmp	r1, r3
c0de8ca2:	d006      	beq.n	c0de8cb2 <displayGenericContextPage+0x282>
c0de8ca4:	4402      	add	r2, r0
c0de8ca6:	7b12      	ldrb	r2, [r2, #12]
c0de8ca8:	0752      	lsls	r2, r2, #29
c0de8caa:	461a      	mov	r2, r3
c0de8cac:	d5f6      	bpl.n	c0de8c9c <displayGenericContextPage+0x26c>
c0de8cae:	210d      	movs	r1, #13
c0de8cb0:	72f9      	strb	r1, [r7, #11]
c0de8cb2:	9a06      	ldr	r2, [sp, #24]
c0de8cb4:	eb09 010b 	add.w	r1, r9, fp
c0de8cb8:	e9c1 0209 	strd	r0, r2, [r1, #36]	@ 0x24
c0de8cbc:	e001      	b.n	c0de8cc2 <displayGenericContextPage+0x292>
c0de8cbe:	f88d 501a 	strb.w	r5, [sp, #26]
c0de8cc2:	9f00      	ldr	r7, [sp, #0]
c0de8cc4:	f819 0008 	ldrb.w	r0, [r9, r8]
c0de8cc8:	f000 01fe 	and.w	r1, r0, #254	@ 0xfe
c0de8ccc:	4853      	ldr	r0, [pc, #332]	@ (c0de8e1c <displayGenericContextPage+0x3ec>)
c0de8cce:	2902      	cmp	r1, #2
c0de8cd0:	4448      	add	r0, r9
c0de8cd2:	6a00      	ldr	r0, [r0, #32]
c0de8cd4:	bf18      	it	ne
c0de8cd6:	2000      	movne	r0, #0
c0de8cd8:	f89a 1000 	ldrb.w	r1, [sl]
c0de8cdc:	2902      	cmp	r1, #2
c0de8cde:	d817      	bhi.n	c0de8d10 <displayGenericContextPage+0x2e0>
c0de8ce0:	f010 0fe0 	tst.w	r0, #224	@ 0xe0
c0de8ce4:	d014      	beq.n	c0de8d10 <displayGenericContextPage+0x2e0>
c0de8ce6:	0601      	lsls	r1, r0, #24
c0de8ce8:	d508      	bpl.n	c0de8cfc <displayGenericContextPage+0x2cc>
c0de8cea:	eb09 010b 	add.w	r1, r9, fp
c0de8cee:	6d89      	ldr	r1, [r1, #88]	@ 0x58
c0de8cf0:	7809      	ldrb	r1, [r1, #0]
c0de8cf2:	06c9      	lsls	r1, r1, #27
c0de8cf4:	d402      	bmi.n	c0de8cfc <displayGenericContextPage+0x2cc>
c0de8cf6:	494d      	ldr	r1, [pc, #308]	@ (c0de8e2c <displayGenericContextPage+0x3fc>)
c0de8cf8:	4479      	add	r1, pc
c0de8cfa:	e001      	b.n	c0de8d00 <displayGenericContextPage+0x2d0>
c0de8cfc:	494c      	ldr	r1, [pc, #304]	@ (c0de8e30 <displayGenericContextPage+0x400>)
c0de8cfe:	4479      	add	r1, pc
c0de8d00:	0680      	lsls	r0, r0, #26
c0de8d02:	9103      	str	r1, [sp, #12]
c0de8d04:	f04f 0010 	mov.w	r0, #16
c0de8d08:	bf58      	it	pl
c0de8d0a:	2011      	movpl	r0, #17
c0de8d0c:	f88d 000b 	strb.w	r0, [sp, #11]
c0de8d10:	4848      	ldr	r0, [pc, #288]	@ (c0de8e34 <displayGenericContextPage+0x404>)
c0de8d12:	eb09 0408 	add.w	r4, r9, r8
c0de8d16:	aa01      	add	r2, sp, #4
c0de8d18:	f104 0160 	add.w	r1, r4, #96	@ 0x60
c0de8d1c:	4478      	add	r0, pc
c0de8d1e:	f7ff fad1 	bl	c0de82c4 <nbgl_pageDrawGenericContent>
c0de8d22:	6160      	str	r0, [r4, #20]
c0de8d24:	2001      	movs	r0, #1
c0de8d26:	2f00      	cmp	r7, #0
c0de8d28:	bf18      	it	ne
c0de8d2a:	2002      	movne	r0, #2
c0de8d2c:	f002 fb94 	bl	c0deb458 <nbgl_refreshSpecial>
c0de8d30:	b020      	add	sp, #128	@ 0x80
c0de8d32:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de8d36:	f8da 1008 	ldr.w	r1, [sl, #8]
c0de8d3a:	4630      	mov	r0, r6
c0de8d3c:	4788      	blx	r1
c0de8d3e:	f002 fda3 	bl	c0deb888 <pic>
c0de8d42:	7b01      	ldrb	r1, [r0, #12]
c0de8d44:	0789      	lsls	r1, r1, #30
c0de8d46:	d42e      	bmi.n	c0de8da6 <displayGenericContextPage+0x376>
c0de8d48:	4937      	ldr	r1, [pc, #220]	@ (c0de8e28 <displayGenericContextPage+0x3f8>)
c0de8d4a:	4479      	add	r1, pc
c0de8d4c:	910b      	str	r1, [sp, #44]	@ 0x2c
c0de8d4e:	210a      	movs	r1, #10
c0de8d50:	f88d 1030 	strb.w	r1, [sp, #48]	@ 0x30
c0de8d54:	2100      	movs	r1, #0
c0de8d56:	910a      	str	r1, [sp, #40]	@ 0x28
c0de8d58:	eb09 010b 	add.w	r1, r9, fp
c0de8d5c:	e9d0 2000 	ldrd	r2, r0, [r0]
c0de8d60:	e9c1 2006 	strd	r2, r0, [r1, #24]
c0de8d64:	f89a 0011 	ldrb.w	r0, [sl, #17]
c0de8d68:	f881 0020 	strb.w	r0, [r1, #32]
c0de8d6c:	2005      	movs	r0, #5
c0de8d6e:	f88d 0010 	strb.w	r0, [sp, #16]
c0de8d72:	f88d 501c 	strb.w	r5, [sp, #28]
c0de8d76:	f89a 000f 	ldrb.w	r0, [sl, #15]
c0de8d7a:	f88d 001f 	strb.w	r0, [sp, #31]
c0de8d7e:	f8da 0004 	ldr.w	r0, [sl, #4]
c0de8d82:	b328      	cbz	r0, c0de8dd0 <displayGenericContextPage+0x3a0>
c0de8d84:	eb00 1006 	add.w	r0, r0, r6, lsl #4
c0de8d88:	f002 fd7e 	bl	c0deb888 <pic>
c0de8d8c:	9005      	str	r0, [sp, #20]
c0de8d8e:	f100 010c 	add.w	r1, r0, #12
c0de8d92:	1c68      	adds	r0, r5, #1
c0de8d94:	3801      	subs	r0, #1
c0de8d96:	d033      	beq.n	c0de8e00 <displayGenericContextPage+0x3d0>
c0de8d98:	f101 0210 	add.w	r2, r1, #16
c0de8d9c:	7809      	ldrb	r1, [r1, #0]
c0de8d9e:	0749      	lsls	r1, r1, #29
c0de8da0:	4611      	mov	r1, r2
c0de8da2:	d5f7      	bpl.n	c0de8d94 <displayGenericContextPage+0x364>
c0de8da4:	e029      	b.n	c0de8dfa <displayGenericContextPage+0x3ca>
c0de8da6:	2101      	movs	r1, #1
c0de8da8:	f88d 1010 	strb.w	r1, [sp, #16]
c0de8dac:	6881      	ldr	r1, [r0, #8]
c0de8dae:	4a22      	ldr	r2, [pc, #136]	@ (c0de8e38 <displayGenericContextPage+0x408>)
c0de8db0:	447a      	add	r2, pc
c0de8db2:	920c      	str	r2, [sp, #48]	@ 0x30
c0de8db4:	e9d0 2000 	ldrd	r2, r0, [r0]
c0de8db8:	9106      	str	r1, [sp, #24]
c0de8dba:	900b      	str	r0, [sp, #44]	@ 0x2c
c0de8dbc:	2000      	movs	r0, #0
c0de8dbe:	9209      	str	r2, [sp, #36]	@ 0x24
c0de8dc0:	f88d 0036 	strb.w	r0, [sp, #54]	@ 0x36
c0de8dc4:	f8ad 0034 	strh.w	r0, [sp, #52]	@ 0x34
c0de8dc8:	900a      	str	r0, [sp, #40]	@ 0x28
c0de8dca:	f88d 0014 	strb.w	r0, [sp, #20]
c0de8dce:	e779      	b.n	c0de8cc4 <displayGenericContextPage+0x294>
c0de8dd0:	2400      	movs	r4, #0
c0de8dd2:	9405      	str	r4, [sp, #20]
c0de8dd4:	f8da 0008 	ldr.w	r0, [sl, #8]
c0de8dd8:	f88d 601d 	strb.w	r6, [sp, #29]
c0de8ddc:	9006      	str	r0, [sp, #24]
c0de8dde:	b2e0      	uxtb	r0, r4
c0de8de0:	42a8      	cmp	r0, r5
c0de8de2:	d20d      	bcs.n	c0de8e00 <displayGenericContextPage+0x3d0>
c0de8de4:	19a0      	adds	r0, r4, r6
c0de8de6:	f8da 1008 	ldr.w	r1, [sl, #8]
c0de8dea:	b2c0      	uxtb	r0, r0
c0de8dec:	4788      	blx	r1
c0de8dee:	f002 fd4b 	bl	c0deb888 <pic>
c0de8df2:	7b00      	ldrb	r0, [r0, #12]
c0de8df4:	3401      	adds	r4, #1
c0de8df6:	0740      	lsls	r0, r0, #29
c0de8df8:	d5f1      	bpl.n	c0de8dde <displayGenericContextPage+0x3ae>
c0de8dfa:	200d      	movs	r0, #13
c0de8dfc:	f88d 001f 	strb.w	r0, [sp, #31]
c0de8e00:	2009      	movs	r0, #9
c0de8e02:	f88d 001e 	strb.w	r0, [sp, #30]
c0de8e06:	2000      	movs	r0, #0
c0de8e08:	f88d 0020 	strb.w	r0, [sp, #32]
c0de8e0c:	f89a 0011 	ldrb.w	r0, [sl, #17]
c0de8e10:	f88d 0021 	strb.w	r0, [sp, #33]	@ 0x21
c0de8e14:	e756      	b.n	c0de8cc4 <displayGenericContextPage+0x294>
c0de8e16:	bf00      	nop
c0de8e18:	00001c28 	.word	0x00001c28
c0de8e1c:	00001ca4 	.word	0x00001ca4
c0de8e20:	0000195c 	.word	0x0000195c
c0de8e24:	00004f18 	.word	0x00004f18
c0de8e28:	00004852 	.word	0x00004852
c0de8e2c:	0000415e 	.word	0x0000415e
c0de8e30:	000044a1 	.word	0x000044a1
c0de8e34:	000002a5 	.word	0x000002a5
c0de8e38:	00004cdf 	.word	0x00004cdf

c0de8e3c <nbgl_useCaseHomeAndSettings>:
c0de8e3c:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de8e40:	f8df 8060 	ldr.w	r8, [pc, #96]	@ c0de8ea4 <nbgl_useCaseHomeAndSettings+0x68>
c0de8e44:	469a      	mov	sl, r3
c0de8e46:	4615      	mov	r5, r2
c0de8e48:	460e      	mov	r6, r1
c0de8e4a:	4607      	mov	r7, r0
c0de8e4c:	eb09 0408 	add.w	r4, r9, r8
c0de8e50:	f7ff fc56 	bl	c0de8700 <reset_callbacks_and_context>
c0de8e54:	9809      	ldr	r0, [sp, #36]	@ 0x24
c0de8e56:	6320      	str	r0, [r4, #48]	@ 0x30
c0de8e58:	9808      	ldr	r0, [sp, #32]
c0de8e5a:	e9c4 7608 	strd	r7, r6, [r4, #32]
c0de8e5e:	e9c4 500a 	strd	r5, r0, [r4, #40]	@ 0x28
c0de8e62:	e9dd 100a 	ldrd	r1, r0, [sp, #40]	@ 0x28
c0de8e66:	b131      	cbz	r1, c0de8e76 <nbgl_useCaseHomeAndSettings+0x3a>
c0de8e68:	eb09 0208 	add.w	r2, r9, r8
c0de8e6c:	e891 0078 	ldmia.w	r1, {r3, r4, r5, r6}
c0de8e70:	3234      	adds	r2, #52	@ 0x34
c0de8e72:	c278      	stmia	r2!, {r3, r4, r5, r6}
c0de8e74:	e006      	b.n	c0de8e84 <nbgl_useCaseHomeAndSettings+0x48>
c0de8e76:	eb09 0108 	add.w	r1, r9, r8
c0de8e7a:	2200      	movs	r2, #0
c0de8e7c:	e9c1 220d 	strd	r2, r2, [r1, #52]	@ 0x34
c0de8e80:	e9c1 220f 	strd	r2, r2, [r1, #60]	@ 0x3c
c0de8e84:	eb09 0108 	add.w	r1, r9, r8
c0de8e88:	f1ba 0fff 	cmp.w	sl, #255	@ 0xff
c0de8e8c:	6448      	str	r0, [r1, #68]	@ 0x44
c0de8e8e:	d004      	beq.n	c0de8e9a <nbgl_useCaseHomeAndSettings+0x5e>
c0de8e90:	4650      	mov	r0, sl
c0de8e92:	e8bd 45f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de8e96:	f000 b807 	b.w	c0de8ea8 <bundleNavStartSettingsAtPage>
c0de8e9a:	e8bd 45f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de8e9e:	f000 b815 	b.w	c0de8ecc <bundleNavStartHome>
c0de8ea2:	bf00      	nop
c0de8ea4:	00001ca4 	.word	0x00001ca4

c0de8ea8 <bundleNavStartSettingsAtPage>:
c0de8ea8:	b51c      	push	{r2, r3, r4, lr}
c0de8eaa:	4601      	mov	r1, r0
c0de8eac:	4805      	ldr	r0, [pc, #20]	@ (c0de8ec4 <bundleNavStartSettingsAtPage+0x1c>)
c0de8eae:	eb09 0300 	add.w	r3, r9, r0
c0de8eb2:	6a18      	ldr	r0, [r3, #32]
c0de8eb4:	e9d3 230b 	ldrd	r2, r3, [r3, #44]	@ 0x2c
c0de8eb8:	4c03      	ldr	r4, [pc, #12]	@ (c0de8ec8 <bundleNavStartSettingsAtPage+0x20>)
c0de8eba:	447c      	add	r4, pc
c0de8ebc:	9400      	str	r4, [sp, #0]
c0de8ebe:	f7ff fca3 	bl	c0de8808 <nbgl_useCaseGenericSettings>
c0de8ec2:	bd1c      	pop	{r2, r3, r4, pc}
c0de8ec4:	00001ca4 	.word	0x00001ca4
c0de8ec8:	0000000f 	.word	0x0000000f

c0de8ecc <bundleNavStartHome>:
c0de8ecc:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
c0de8ece:	4809      	ldr	r0, [pc, #36]	@ (c0de8ef4 <bundleNavStartHome+0x28>)
c0de8ed0:	eb09 0400 	add.w	r4, r9, r0
c0de8ed4:	f104 0320 	add.w	r3, r4, #32
c0de8ed8:	6c65      	ldr	r5, [r4, #68]	@ 0x44
c0de8eda:	3434      	adds	r4, #52	@ 0x34
c0de8edc:	cb0f      	ldmia	r3, {r0, r1, r2, r3}
c0de8ede:	4e06      	ldr	r6, [pc, #24]	@ (c0de8ef8 <bundleNavStartHome+0x2c>)
c0de8ee0:	2b00      	cmp	r3, #0
c0de8ee2:	9502      	str	r5, [sp, #8]
c0de8ee4:	447e      	add	r6, pc
c0de8ee6:	e9cd 4600 	strd	r4, r6, [sp]
c0de8eea:	bf18      	it	ne
c0de8eec:	2301      	movne	r3, #1
c0de8eee:	f7ff fb6d 	bl	c0de85cc <useCaseHomeExt>
c0de8ef2:	bd7f      	pop	{r0, r1, r2, r3, r4, r5, r6, pc}
c0de8ef4:	00001ca4 	.word	0x00001ca4
c0de8ef8:	0000113d 	.word	0x0000113d

c0de8efc <nbgl_useCaseStatus>:
c0de8efc:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de8f00:	b090      	sub	sp, #64	@ 0x40
c0de8f02:	4604      	mov	r4, r0
c0de8f04:	4822      	ldr	r0, [pc, #136]	@ (c0de8f90 <nbgl_useCaseStatus+0x94>)
c0de8f06:	460e      	mov	r6, r1
c0de8f08:	4615      	mov	r5, r2
c0de8f0a:	a90d      	add	r1, sp, #52	@ 0x34
c0de8f0c:	f8df 807c 	ldr.w	r8, [pc, #124]	@ c0de8f8c <nbgl_useCaseStatus+0x90>
c0de8f10:	4478      	add	r0, pc
c0de8f12:	e890 008c 	ldmia.w	r0, {r2, r3, r7}
c0de8f16:	c18c      	stmia	r1!, {r2, r3, r7}
c0de8f18:	eb09 0708 	add.w	r7, r9, r8
c0de8f1c:	f7ff fbf0 	bl	c0de8700 <reset_callbacks_and_context>
c0de8f20:	607d      	str	r5, [r7, #4]
c0de8f22:	b156      	cbz	r6, c0de8f3a <nbgl_useCaseStatus+0x3e>
c0de8f24:	2003      	movs	r0, #3
c0de8f26:	f7fa fc96 	bl	c0de3856 <os_io_seph_cmd_piezo_play_tune>
c0de8f2a:	481a      	ldr	r0, [pc, #104]	@ (c0de8f94 <nbgl_useCaseStatus+0x98>)
c0de8f2c:	a90d      	add	r1, sp, #52	@ 0x34
c0de8f2e:	4622      	mov	r2, r4
c0de8f30:	2302      	movs	r3, #2
c0de8f32:	4478      	add	r0, pc
c0de8f34:	f7fe fe22 	bl	c0de7b7c <nbgl_pageDrawLedgerInfo>
c0de8f38:	e020      	b.n	c0de8f7c <nbgl_useCaseStatus+0x80>
c0de8f3a:	2000      	movs	r0, #0
c0de8f3c:	f44f 1140 	mov.w	r1, #3145728	@ 0x300000
c0de8f40:	466a      	mov	r2, sp
c0de8f42:	9005      	str	r0, [sp, #20]
c0de8f44:	9104      	str	r1, [sp, #16]
c0de8f46:	4914      	ldr	r1, [pc, #80]	@ (c0de8f98 <nbgl_useCaseStatus+0x9c>)
c0de8f48:	e9cd 4000 	strd	r4, r0, [sp]
c0de8f4c:	9006      	str	r0, [sp, #24]
c0de8f4e:	f88d 001c 	strb.w	r0, [sp, #28]
c0de8f52:	e9cd 000a 	strd	r0, r0, [sp, #40]	@ 0x28
c0de8f56:	4479      	add	r1, pc
c0de8f58:	e9cd 0102 	strd	r0, r1, [sp, #8]
c0de8f5c:	f44f 6110 	mov.w	r1, #2304	@ 0x900
c0de8f60:	f44f 7000 	mov.w	r0, #512	@ 0x200
c0de8f64:	f8ad 1030 	strh.w	r1, [sp, #48]	@ 0x30
c0de8f68:	f8ad 0024 	strh.w	r0, [sp, #36]	@ 0x24
c0de8f6c:	480b      	ldr	r0, [pc, #44]	@ (c0de8f9c <nbgl_useCaseStatus+0xa0>)
c0de8f6e:	4478      	add	r0, pc
c0de8f70:	9008      	str	r0, [sp, #32]
c0de8f72:	480b      	ldr	r0, [pc, #44]	@ (c0de8fa0 <nbgl_useCaseStatus+0xa4>)
c0de8f74:	a90d      	add	r1, sp, #52	@ 0x34
c0de8f76:	4478      	add	r0, pc
c0de8f78:	f7fe fe54 	bl	c0de7c24 <nbgl_pageDrawInfo>
c0de8f7c:	eb09 0108 	add.w	r1, r9, r8
c0de8f80:	6148      	str	r0, [r1, #20]
c0de8f82:	f001 fdbb 	bl	c0deaafc <OUTLINED_FUNCTION_3>
c0de8f86:	b010      	add	sp, #64	@ 0x40
c0de8f88:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de8f8c:	00001c28 	.word	0x00001c28
c0de8f90:	000061ec 	.word	0x000061ec
c0de8f94:	0000008f 	.word	0x0000008f
c0de8f98:	0000358e 	.word	0x0000358e
c0de8f9c:	00004a83 	.word	0x00004a83
c0de8fa0:	0000004b 	.word	0x0000004b

c0de8fa4 <tickerCallback>:
c0de8fa4:	b510      	push	{r4, lr}
c0de8fa6:	4806      	ldr	r0, [pc, #24]	@ (c0de8fc0 <tickerCallback+0x1c>)
c0de8fa8:	eb09 0400 	add.w	r4, r9, r0
c0de8fac:	6960      	ldr	r0, [r4, #20]
c0de8fae:	f7ff f98c 	bl	c0de82ca <nbgl_pageRelease>
c0de8fb2:	6860      	ldr	r0, [r4, #4]
c0de8fb4:	b110      	cbz	r0, c0de8fbc <tickerCallback+0x18>
c0de8fb6:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de8fba:	4700      	bx	r0
c0de8fbc:	bd10      	pop	{r4, pc}
c0de8fbe:	bf00      	nop
c0de8fc0:	00001c28 	.word	0x00001c28

c0de8fc4 <pageCallback>:
c0de8fc4:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de8fc8:	b092      	sub	sp, #72	@ 0x48
c0de8fca:	b350      	cbz	r0, c0de9022 <pageCallback+0x5e>
c0de8fcc:	4605      	mov	r5, r0
c0de8fce:	2801      	cmp	r0, #1
c0de8fd0:	d034      	beq.n	c0de903c <pageCallback+0x78>
c0de8fd2:	2d12      	cmp	r5, #18
c0de8fd4:	d043      	beq.n	c0de905e <pageCallback+0x9a>
c0de8fd6:	460c      	mov	r4, r1
c0de8fd8:	2d03      	cmp	r5, #3
c0de8fda:	d055      	beq.n	c0de9088 <pageCallback+0xc4>
c0de8fdc:	2d05      	cmp	r5, #5
c0de8fde:	d05f      	beq.n	c0de90a0 <pageCallback+0xdc>
c0de8fe0:	2d06      	cmp	r5, #6
c0de8fe2:	d075      	beq.n	c0de90d0 <pageCallback+0x10c>
c0de8fe4:	2d07      	cmp	r5, #7
c0de8fe6:	d077      	beq.n	c0de90d8 <pageCallback+0x114>
c0de8fe8:	2d08      	cmp	r5, #8
c0de8fea:	f000 809e 	beq.w	c0de912a <pageCallback+0x166>
c0de8fee:	2d09      	cmp	r5, #9
c0de8ff0:	f000 80a9 	beq.w	c0de9146 <pageCallback+0x182>
c0de8ff4:	2d0a      	cmp	r5, #10
c0de8ff6:	f000 80b0 	beq.w	c0de915a <pageCallback+0x196>
c0de8ffa:	2d0b      	cmp	r5, #11
c0de8ffc:	f000 80fa 	beq.w	c0de91f4 <pageCallback+0x230>
c0de9000:	2d0c      	cmp	r5, #12
c0de9002:	f000 80fe 	beq.w	c0de9202 <pageCallback+0x23e>
c0de9006:	2d0d      	cmp	r5, #13
c0de9008:	f000 8105 	beq.w	c0de9216 <pageCallback+0x252>
c0de900c:	2d10      	cmp	r5, #16
c0de900e:	f000 810e 	beq.w	c0de922e <pageCallback+0x26a>
c0de9012:	2d11      	cmp	r5, #17
c0de9014:	f000 8113 	beq.w	c0de923e <pageCallback+0x27a>
c0de9018:	2d02      	cmp	r5, #2
c0de901a:	f040 8119 	bne.w	c0de9250 <pageCallback+0x28c>
c0de901e:	48cb      	ldr	r0, [pc, #812]	@ (c0de934c <pageCallback+0x388>)
c0de9020:	e161      	b.n	c0de92e6 <pageCallback+0x322>
c0de9022:	48ca      	ldr	r0, [pc, #808]	@ (c0de934c <pageCallback+0x388>)
c0de9024:	eb09 0100 	add.w	r1, r9, r0
c0de9028:	f891 0060 	ldrb.w	r0, [r1, #96]	@ 0x60
c0de902c:	6889      	ldr	r1, [r1, #8]
c0de902e:	3801      	subs	r0, #1
c0de9030:	2900      	cmp	r1, #0
c0de9032:	f000 8124 	beq.w	c0de927e <pageCallback+0x2ba>
c0de9036:	b2c0      	uxtb	r0, r0
c0de9038:	2101      	movs	r1, #1
c0de903a:	e00b      	b.n	c0de9054 <pageCallback+0x90>
c0de903c:	48c3      	ldr	r0, [pc, #780]	@ (c0de934c <pageCallback+0x388>)
c0de903e:	eb09 0100 	add.w	r1, r9, r0
c0de9042:	f891 0060 	ldrb.w	r0, [r1, #96]	@ 0x60
c0de9046:	6889      	ldr	r1, [r1, #8]
c0de9048:	3001      	adds	r0, #1
c0de904a:	2900      	cmp	r1, #0
c0de904c:	f000 8117 	beq.w	c0de927e <pageCallback+0x2ba>
c0de9050:	b2c0      	uxtb	r0, r0
c0de9052:	2100      	movs	r1, #0
c0de9054:	b012      	add	sp, #72	@ 0x48
c0de9056:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de905a:	f000 baa7 	b.w	c0de95ac <displayReviewPage>
c0de905e:	48b9      	ldr	r0, [pc, #740]	@ (c0de9344 <pageCallback+0x380>)
c0de9060:	eb09 0100 	add.w	r1, r9, r0
c0de9064:	f891 1021 	ldrb.w	r1, [r1, #33]	@ 0x21
c0de9068:	2900      	cmp	r1, #0
c0de906a:	f000 810f 	beq.w	c0de928c <pageCallback+0x2c8>
c0de906e:	eb09 0100 	add.w	r1, r9, r0
c0de9072:	6d89      	ldr	r1, [r1, #88]	@ 0x58
c0de9074:	680a      	ldr	r2, [r1, #0]
c0de9076:	2a00      	cmp	r2, #0
c0de9078:	f000 8108 	beq.w	c0de928c <pageCallback+0x2c8>
c0de907c:	4448      	add	r0, r9
c0de907e:	2201      	movs	r2, #1
c0de9080:	f880 2068 	strb.w	r2, [r0, #104]	@ 0x68
c0de9084:	6808      	ldr	r0, [r1, #0]
c0de9086:	e0de      	b.n	c0de9246 <pageCallback+0x282>
c0de9088:	48b0      	ldr	r0, [pc, #704]	@ (c0de934c <pageCallback+0x388>)
c0de908a:	2cff      	cmp	r4, #255	@ 0xff
c0de908c:	f000 812b 	beq.w	c0de92e6 <pageCallback+0x322>
c0de9090:	f819 0000 	ldrb.w	r0, [r9, r0]
c0de9094:	1e81      	subs	r1, r0, #2
c0de9096:	2902      	cmp	r1, #2
c0de9098:	f080 8144 	bcs.w	c0de9324 <pageCallback+0x360>
c0de909c:	4620      	mov	r0, r4
c0de909e:	e0ef      	b.n	c0de9280 <pageCallback+0x2bc>
c0de90a0:	a80a      	add	r0, sp, #40	@ 0x28
c0de90a2:	49b0      	ldr	r1, [pc, #704]	@ (c0de9364 <pageCallback+0x3a0>)
c0de90a4:	2220      	movs	r2, #32
c0de90a6:	4479      	add	r1, pc
c0de90a8:	f002 feec 	bl	c0debe84 <__aeabi_memcpy>
c0de90ac:	4ca7      	ldr	r4, [pc, #668]	@ (c0de934c <pageCallback+0x388>)
c0de90ae:	eb09 0004 	add.w	r0, r9, r4
c0de90b2:	6a00      	ldr	r0, [r0, #32]
c0de90b4:	b108      	cbz	r0, c0de90ba <pageCallback+0xf6>
c0de90b6:	f7ff f908 	bl	c0de82ca <nbgl_pageRelease>
c0de90ba:	48ab      	ldr	r0, [pc, #684]	@ (c0de9368 <pageCallback+0x3a4>)
c0de90bc:	a90a      	add	r1, sp, #40	@ 0x28
c0de90be:	4478      	add	r0, pc
c0de90c0:	f7fe fea0 	bl	c0de7e04 <nbgl_pageDrawConfirmation>
c0de90c4:	eb09 0104 	add.w	r1, r9, r4
c0de90c8:	6208      	str	r0, [r1, #32]
c0de90ca:	f001 fd17 	bl	c0deaafc <OUTLINED_FUNCTION_3>
c0de90ce:	e111      	b.n	c0de92f4 <pageCallback+0x330>
c0de90d0:	489e      	ldr	r0, [pc, #632]	@ (c0de934c <pageCallback+0x388>)
c0de90d2:	4448      	add	r0, r9
c0de90d4:	6a80      	ldr	r0, [r0, #40]	@ 0x28
c0de90d6:	e108      	b.n	c0de92ea <pageCallback+0x326>
c0de90d8:	ac0a      	add	r4, sp, #40	@ 0x28
c0de90da:	499f      	ldr	r1, [pc, #636]	@ (c0de9358 <pageCallback+0x394>)
c0de90dc:	221c      	movs	r2, #28
c0de90de:	4620      	mov	r0, r4
c0de90e0:	4479      	add	r1, pc
c0de90e2:	f002 fecf 	bl	c0debe84 <__aeabi_memcpy>
c0de90e6:	489d      	ldr	r0, [pc, #628]	@ (c0de935c <pageCallback+0x398>)
c0de90e8:	ad06      	add	r5, sp, #24
c0de90ea:	4629      	mov	r1, r5
c0de90ec:	4478      	add	r0, pc
c0de90ee:	e890 00cc 	ldmia.w	r0, {r2, r3, r6, r7}
c0de90f2:	f44f 3080 	mov.w	r0, #65536	@ 0x10000
c0de90f6:	c1cc      	stmia	r1!, {r2, r3, r6, r7}
c0de90f8:	4e95      	ldr	r6, [pc, #596]	@ (c0de9350 <pageCallback+0x38c>)
c0de90fa:	9005      	str	r0, [sp, #20]
c0de90fc:	eb09 0706 	add.w	r7, r9, r6
c0de9100:	6878      	ldr	r0, [r7, #4]
c0de9102:	9002      	str	r0, [sp, #8]
c0de9104:	2000      	movs	r0, #0
c0de9106:	9003      	str	r0, [sp, #12]
c0de9108:	4620      	mov	r0, r4
c0de910a:	f7fa fdab 	bl	c0de3c64 <nbgl_layoutGet>
c0de910e:	4629      	mov	r1, r5
c0de9110:	6338      	str	r0, [r7, #48]	@ 0x30
c0de9112:	f7fd fb3f 	bl	c0de6794 <nbgl_layoutAddHeader>
c0de9116:	6879      	ldr	r1, [r7, #4]
c0de9118:	200b      	movs	r0, #11
c0de911a:	f001 fd0b 	bl	c0deab34 <OUTLINED_FUNCTION_11>
c0de911e:	6879      	ldr	r1, [r7, #4]
c0de9120:	2804      	cmp	r0, #4
c0de9122:	f080 80be 	bcs.w	c0de92a2 <pageCallback+0x2de>
c0de9126:	460c      	mov	r4, r1
c0de9128:	e0c7      	b.n	c0de92ba <pageCallback+0x2f6>
c0de912a:	4888      	ldr	r0, [pc, #544]	@ (c0de934c <pageCallback+0x388>)
c0de912c:	2c00      	cmp	r4, #0
c0de912e:	f040 80d8 	bne.w	c0de92e2 <pageCallback+0x31e>
c0de9132:	eb09 0100 	add.w	r1, r9, r0
c0de9136:	6a49      	ldr	r1, [r1, #36]	@ 0x24
c0de9138:	2900      	cmp	r1, #0
c0de913a:	f000 80d2 	beq.w	c0de92e2 <pageCallback+0x31e>
c0de913e:	b012      	add	sp, #72	@ 0x48
c0de9140:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9144:	4708      	bx	r1
c0de9146:	4881      	ldr	r0, [pc, #516]	@ (c0de934c <pageCallback+0x388>)
c0de9148:	4448      	add	r0, r9
c0de914a:	6981      	ldr	r1, [r0, #24]
c0de914c:	2900      	cmp	r1, #0
c0de914e:	f000 80d1 	beq.w	c0de92f4 <pageCallback+0x330>
c0de9152:	fab4 f084 	clz	r0, r4
c0de9156:	0940      	lsrs	r0, r0, #5
c0de9158:	e059      	b.n	c0de920e <pageCallback+0x24a>
c0de915a:	487a      	ldr	r0, [pc, #488]	@ (c0de9344 <pageCallback+0x380>)
c0de915c:	f8df 81ec 	ldr.w	r8, [pc, #492]	@ c0de934c <pageCallback+0x388>
c0de9160:	2700      	movs	r7, #0
c0de9162:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de9166:	f04f 0a0b 	mov.w	sl, #11
c0de916a:	4448      	add	r0, r9
c0de916c:	eb09 0608 	add.w	r6, r9, r8
c0de9170:	f890 4020 	ldrb.w	r4, [r0, #32]
c0de9174:	e9d0 b506 	ldrd	fp, r5, [r0, #24]
c0de9178:	200b      	movs	r0, #11
c0de917a:	e9c6 770c 	strd	r7, r7, [r6, #48]	@ 0x30
c0de917e:	e9c6 770e 	strd	r7, r7, [r6, #56]	@ 0x38
c0de9182:	4629      	mov	r1, r5
c0de9184:	4623      	mov	r3, r4
c0de9186:	f002 f9bc 	bl	c0deb502 <nbgl_getTextNbLinesInWidth>
c0de918a:	f100 010a 	add.w	r1, r0, #10
c0de918e:	e9c6 b50d 	strd	fp, r5, [r6, #52]	@ 0x34
c0de9192:	f886 4033 	strb.w	r4, [r6, #51]	@ 0x33
c0de9196:	f886 7031 	strb.w	r7, [r6, #49]	@ 0x31
c0de919a:	fbb1 f1fa 	udiv	r1, r1, sl
c0de919e:	b2ca      	uxtb	r2, r1
c0de91a0:	f886 1030 	strb.w	r1, [r6, #48]	@ 0x30
c0de91a4:	2a02      	cmp	r2, #2
c0de91a6:	d31e      	bcc.n	c0de91e6 <pageCallback+0x222>
c0de91a8:	3a01      	subs	r2, #1
c0de91aa:	241a      	movs	r4, #26
c0de91ac:	eb02 0342 	add.w	r3, r2, r2, lsl #1
c0de91b0:	3319      	adds	r3, #25
c0de91b2:	b29b      	uxth	r3, r3
c0de91b4:	fbb3 f4f4 	udiv	r4, r3, r4
c0de91b8:	b2e4      	uxtb	r4, r4
c0de91ba:	fbb4 f5fa 	udiv	r5, r4, sl
c0de91be:	fb05 441a 	mls	r4, r5, sl, r4
c0de91c2:	f06f 050a 	mvn.w	r5, #10
c0de91c6:	fb02 0005 	mla	r0, r2, r5, r0
c0de91ca:	f44f 728f 	mov.w	r2, #286	@ 0x11e
c0de91ce:	fbb3 f2f2 	udiv	r2, r3, r2
c0de91d2:	b2c0      	uxtb	r0, r0
c0de91d4:	4420      	add	r0, r4
c0de91d6:	4411      	add	r1, r2
c0de91d8:	280b      	cmp	r0, #11
c0de91da:	eb09 0008 	add.w	r0, r9, r8
c0de91de:	bf88      	it	hi
c0de91e0:	3101      	addhi	r1, #1
c0de91e2:	f880 1030 	strb.w	r1, [r0, #48]	@ 0x30
c0de91e6:	2000      	movs	r0, #0
c0de91e8:	2101      	movs	r1, #1
c0de91ea:	b012      	add	sp, #72	@ 0x48
c0de91ec:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de91f0:	f001 ba30 	b.w	c0dea654 <displayDetailsPage>
c0de91f4:	4855      	ldr	r0, [pc, #340]	@ (c0de934c <pageCallback+0x388>)
c0de91f6:	4448      	add	r0, r9
c0de91f8:	6981      	ldr	r1, [r0, #24]
c0de91fa:	2900      	cmp	r1, #0
c0de91fc:	d07a      	beq.n	c0de92f4 <pageCallback+0x330>
c0de91fe:	2001      	movs	r0, #1
c0de9200:	e005      	b.n	c0de920e <pageCallback+0x24a>
c0de9202:	4852      	ldr	r0, [pc, #328]	@ (c0de934c <pageCallback+0x388>)
c0de9204:	4448      	add	r0, r9
c0de9206:	6981      	ldr	r1, [r0, #24]
c0de9208:	2900      	cmp	r1, #0
c0de920a:	d073      	beq.n	c0de92f4 <pageCallback+0x330>
c0de920c:	2000      	movs	r0, #0
c0de920e:	b012      	add	sp, #72	@ 0x48
c0de9210:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9214:	4708      	bx	r1
c0de9216:	484b      	ldr	r0, [pc, #300]	@ (c0de9344 <pageCallback+0x380>)
c0de9218:	eb09 0100 	add.w	r1, r9, r0
c0de921c:	4448      	add	r0, r9
c0de921e:	6a49      	ldr	r1, [r1, #36]	@ 0x24
c0de9220:	2900      	cmp	r1, #0
c0de9222:	d06a      	beq.n	c0de92fa <pageCallback+0x336>
c0de9224:	7c80      	ldrb	r0, [r0, #18]
c0de9226:	4420      	add	r0, r4
c0de9228:	eb01 1000 	add.w	r0, r1, r0, lsl #4
c0de922c:	e06a      	b.n	c0de9304 <pageCallback+0x340>
c0de922e:	4845      	ldr	r0, [pc, #276]	@ (c0de9344 <pageCallback+0x380>)
c0de9230:	2100      	movs	r1, #0
c0de9232:	4448      	add	r0, r9
c0de9234:	6581      	str	r1, [r0, #88]	@ 0x58
c0de9236:	f880 1069 	strb.w	r1, [r0, #105]	@ 0x69
c0de923a:	2010      	movs	r0, #16
c0de923c:	e003      	b.n	c0de9246 <pageCallback+0x282>
c0de923e:	4a41      	ldr	r2, [pc, #260]	@ (c0de9344 <pageCallback+0x380>)
c0de9240:	f001 fc5f 	bl	c0deab02 <OUTLINED_FUNCTION_4>
c0de9244:	d067      	beq.n	c0de9316 <pageCallback+0x352>
c0de9246:	b012      	add	sp, #72	@ 0x48
c0de9248:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de924c:	f000 bfcc 	b.w	c0dea1e8 <displaySecurityReport>
c0de9250:	4e3e      	ldr	r6, [pc, #248]	@ (c0de934c <pageCallback+0x388>)
c0de9252:	eb09 0006 	add.w	r0, r9, r6
c0de9256:	6ac3      	ldr	r3, [r0, #44]	@ 0x2c
c0de9258:	b133      	cbz	r3, c0de9268 <pageCallback+0x2a4>
c0de925a:	eb09 0006 	add.w	r0, r9, r6
c0de925e:	4621      	mov	r1, r4
c0de9260:	f890 2060 	ldrb.w	r2, [r0, #96]	@ 0x60
c0de9264:	4628      	mov	r0, r5
c0de9266:	4798      	blx	r3
c0de9268:	eb09 0006 	add.w	r0, r9, r6
c0de926c:	68c2      	ldr	r2, [r0, #12]
c0de926e:	2a00      	cmp	r2, #0
c0de9270:	d040      	beq.n	c0de92f4 <pageCallback+0x330>
c0de9272:	4628      	mov	r0, r5
c0de9274:	4621      	mov	r1, r4
c0de9276:	b012      	add	sp, #72	@ 0x48
c0de9278:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de927c:	4710      	bx	r2
c0de927e:	b2c0      	uxtb	r0, r0
c0de9280:	2100      	movs	r1, #0
c0de9282:	b012      	add	sp, #72	@ 0x48
c0de9284:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9288:	f7ff bbd2 	b.w	c0de8a30 <displayGenericContextPage>
c0de928c:	482e      	ldr	r0, [pc, #184]	@ (c0de9348 <pageCallback+0x384>)
c0de928e:	2200      	movs	r2, #0
c0de9290:	eb09 0100 	add.w	r1, r9, r0
c0de9294:	6888      	ldr	r0, [r1, #8]
c0de9296:	3110      	adds	r1, #16
c0de9298:	b012      	add	sp, #72	@ 0x48
c0de929a:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de929e:	f001 b929 	b.w	c0dea4f4 <displayInfosListModal>
c0de92a2:	2080      	movs	r0, #128	@ 0x80
c0de92a4:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de92a8:	2303      	movs	r3, #3
c0de92aa:	9001      	str	r0, [sp, #4]
c0de92ac:	4829      	ldr	r0, [pc, #164]	@ (c0de9354 <pageCallback+0x390>)
c0de92ae:	eb09 0400 	add.w	r4, r9, r0
c0de92b2:	200b      	movs	r0, #11
c0de92b4:	9400      	str	r4, [sp, #0]
c0de92b6:	f002 f933 	bl	c0deb520 <nbgl_textReduceOnNbLines>
c0de92ba:	9404      	str	r4, [sp, #16]
c0de92bc:	eb09 0406 	add.w	r4, r9, r6
c0de92c0:	6b20      	ldr	r0, [r4, #48]	@ 0x30
c0de92c2:	a902      	add	r1, sp, #8
c0de92c4:	f7fc fe0b 	bl	c0de5ede <nbgl_layoutAddQRCode>
c0de92c8:	6b20      	ldr	r0, [r4, #48]	@ 0x30
c0de92ca:	4925      	ldr	r1, [pc, #148]	@ (c0de9360 <pageCallback+0x39c>)
c0de92cc:	2215      	movs	r2, #21
c0de92ce:	2309      	movs	r3, #9
c0de92d0:	4479      	add	r1, pc
c0de92d2:	f7fd fa38 	bl	c0de6746 <nbgl_layoutAddFooter>
c0de92d6:	6b20      	ldr	r0, [r4, #48]	@ 0x30
c0de92d8:	f7fd febe 	bl	c0de7058 <nbgl_layoutDraw>
c0de92dc:	f002 f8b7 	bl	c0deb44e <nbgl_refresh>
c0de92e0:	e008      	b.n	c0de92f4 <pageCallback+0x330>
c0de92e2:	2c01      	cmp	r4, #1
c0de92e4:	d106      	bne.n	c0de92f4 <pageCallback+0x330>
c0de92e6:	4448      	add	r0, r9
c0de92e8:	6840      	ldr	r0, [r0, #4]
c0de92ea:	b118      	cbz	r0, c0de92f4 <pageCallback+0x330>
c0de92ec:	b012      	add	sp, #72	@ 0x48
c0de92ee:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de92f2:	4700      	bx	r0
c0de92f4:	b012      	add	sp, #72	@ 0x48
c0de92f6:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de92fa:	6a81      	ldr	r1, [r0, #40]	@ 0x28
c0de92fc:	7c80      	ldrb	r0, [r0, #18]
c0de92fe:	4420      	add	r0, r4
c0de9300:	b2c0      	uxtb	r0, r0
c0de9302:	4788      	blx	r1
c0de9304:	e9d0 3100 	ldrd	r3, r1, [r0]
c0de9308:	6882      	ldr	r2, [r0, #8]
c0de930a:	4618      	mov	r0, r3
c0de930c:	b012      	add	sp, #72	@ 0x48
c0de930e:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9312:	f000 be8b 	b.w	c0dea02c <displayFullValuePage>
c0de9316:	eb09 0002 	add.w	r0, r9, r2
c0de931a:	f890 0069 	ldrb.w	r0, [r0, #105]	@ 0x69
c0de931e:	b120      	cbz	r0, c0de932a <pageCallback+0x366>
c0de9320:	6948      	ldr	r0, [r1, #20]
c0de9322:	e003      	b.n	c0de932c <pageCallback+0x368>
c0de9324:	b938      	cbnz	r0, c0de9336 <pageCallback+0x372>
c0de9326:	4620      	mov	r0, r4
c0de9328:	e693      	b.n	c0de9052 <pageCallback+0x8e>
c0de932a:	6988      	ldr	r0, [r1, #24]
c0de932c:	b012      	add	sp, #72	@ 0x48
c0de932e:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9332:	f001 b863 	b.w	c0dea3fc <displayCustomizedSecurityReport>
c0de9336:	4620      	mov	r0, r4
c0de9338:	2100      	movs	r1, #0
c0de933a:	b012      	add	sp, #72	@ 0x48
c0de933c:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9340:	f7ff ba30 	b.w	c0de87a4 <displaySettingsPage>
c0de9344:	0000195c 	.word	0x0000195c
c0de9348:	00001ca4 	.word	0x00001ca4
c0de934c:	00001c28 	.word	0x00001c28
c0de9350:	00001a70 	.word	0x00001a70
c0de9354:	00001ba8 	.word	0x00001ba8
c0de9358:	00006140 	.word	0x00006140
c0de935c:	000060b8 	.word	0x000060b8
c0de9360:	000041a6 	.word	0x000041a6
c0de9364:	0000611e 	.word	0x0000611e
c0de9368:	00000407 	.word	0x00000407

c0de936c <nbgl_useCaseReviewStatus>:
c0de936c:	460a      	mov	r2, r1
c0de936e:	b198      	cbz	r0, c0de9398 <nbgl_useCaseReviewStatus+0x2c>
c0de9370:	2801      	cmp	r0, #1
c0de9372:	d016      	beq.n	c0de93a2 <nbgl_useCaseReviewStatus+0x36>
c0de9374:	2802      	cmp	r0, #2
c0de9376:	d019      	beq.n	c0de93ac <nbgl_useCaseReviewStatus+0x40>
c0de9378:	2803      	cmp	r0, #3
c0de937a:	d01c      	beq.n	c0de93b6 <nbgl_useCaseReviewStatus+0x4a>
c0de937c:	2804      	cmp	r0, #4
c0de937e:	d01f      	beq.n	c0de93c0 <nbgl_useCaseReviewStatus+0x54>
c0de9380:	2807      	cmp	r0, #7
c0de9382:	d022      	beq.n	c0de93ca <nbgl_useCaseReviewStatus+0x5e>
c0de9384:	2806      	cmp	r0, #6
c0de9386:	d025      	beq.n	c0de93d4 <nbgl_useCaseReviewStatus+0x68>
c0de9388:	2805      	cmp	r0, #5
c0de938a:	bf18      	it	ne
c0de938c:	4770      	bxne	lr
c0de938e:	4815      	ldr	r0, [pc, #84]	@ (c0de93e4 <nbgl_useCaseReviewStatus+0x78>)
c0de9390:	2100      	movs	r1, #0
c0de9392:	4478      	add	r0, pc
c0de9394:	f7ff bdb2 	b.w	c0de8efc <nbgl_useCaseStatus>
c0de9398:	4813      	ldr	r0, [pc, #76]	@ (c0de93e8 <nbgl_useCaseReviewStatus+0x7c>)
c0de939a:	2101      	movs	r1, #1
c0de939c:	4478      	add	r0, pc
c0de939e:	f7ff bdad 	b.w	c0de8efc <nbgl_useCaseStatus>
c0de93a2:	4812      	ldr	r0, [pc, #72]	@ (c0de93ec <nbgl_useCaseReviewStatus+0x80>)
c0de93a4:	2100      	movs	r1, #0
c0de93a6:	4478      	add	r0, pc
c0de93a8:	f7ff bda8 	b.w	c0de8efc <nbgl_useCaseStatus>
c0de93ac:	4810      	ldr	r0, [pc, #64]	@ (c0de93f0 <nbgl_useCaseReviewStatus+0x84>)
c0de93ae:	2101      	movs	r1, #1
c0de93b0:	4478      	add	r0, pc
c0de93b2:	f7ff bda3 	b.w	c0de8efc <nbgl_useCaseStatus>
c0de93b6:	480f      	ldr	r0, [pc, #60]	@ (c0de93f4 <nbgl_useCaseReviewStatus+0x88>)
c0de93b8:	2100      	movs	r1, #0
c0de93ba:	4478      	add	r0, pc
c0de93bc:	f7ff bd9e 	b.w	c0de8efc <nbgl_useCaseStatus>
c0de93c0:	4807      	ldr	r0, [pc, #28]	@ (c0de93e0 <nbgl_useCaseReviewStatus+0x74>)
c0de93c2:	2101      	movs	r1, #1
c0de93c4:	4478      	add	r0, pc
c0de93c6:	f7ff bd99 	b.w	c0de8efc <nbgl_useCaseStatus>
c0de93ca:	480c      	ldr	r0, [pc, #48]	@ (c0de93fc <nbgl_useCaseReviewStatus+0x90>)
c0de93cc:	2100      	movs	r1, #0
c0de93ce:	4478      	add	r0, pc
c0de93d0:	f7ff bd94 	b.w	c0de8efc <nbgl_useCaseStatus>
c0de93d4:	4808      	ldr	r0, [pc, #32]	@ (c0de93f8 <nbgl_useCaseReviewStatus+0x8c>)
c0de93d6:	2101      	movs	r1, #1
c0de93d8:	4478      	add	r0, pc
c0de93da:	f7ff bd8f 	b.w	c0de8efc <nbgl_useCaseStatus>
c0de93de:	bf00      	nop
c0de93e0:	00003e0c 	.word	0x00003e0c
c0de93e4:	00003ebd 	.word	0x00003ebd
c0de93e8:	00003fe9 	.word	0x00003fe9
c0de93ec:	000045e3 	.word	0x000045e3
c0de93f0:	000040b7 	.word	0x000040b7
c0de93f4:	00004419 	.word	0x00004419
c0de93f8:	00003f47 	.word	0x00003f47
c0de93fc:	00003e13 	.word	0x00003e13

c0de9400 <nbgl_useCaseChoice>:
c0de9400:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9404:	b088      	sub	sp, #32
c0de9406:	4683      	mov	fp, r0
c0de9408:	4668      	mov	r0, sp
c0de940a:	460e      	mov	r6, r1
c0de940c:	2118      	movs	r1, #24
c0de940e:	461c      	mov	r4, r3
c0de9410:	4617      	mov	r7, r2
c0de9412:	3008      	adds	r0, #8
c0de9414:	f002 fd40 	bl	c0debe98 <__aeabi_memclr>
c0de9418:	b324      	cbz	r4, c0de9464 <nbgl_useCaseChoice+0x64>
c0de941a:	f8dd 8040 	ldr.w	r8, [sp, #64]	@ 0x40
c0de941e:	f1b8 0f00 	cmp.w	r8, #0
c0de9422:	d01f      	beq.n	c0de9464 <nbgl_useCaseChoice+0x64>
c0de9424:	4811      	ldr	r0, [pc, #68]	@ (c0de946c <nbgl_useCaseChoice+0x6c>)
c0de9426:	f8dd a044 	ldr.w	sl, [sp, #68]	@ 0x44
c0de942a:	eb09 0500 	add.w	r5, r9, r0
c0de942e:	f7ff f967 	bl	c0de8700 <reset_callbacks_and_context>
c0de9432:	2000      	movs	r0, #0
c0de9434:	f8c5 a018 	str.w	sl, [r5, #24]
c0de9438:	e9cd 6700 	strd	r6, r7, [sp]
c0de943c:	f8cd 8018 	str.w	r8, [sp, #24]
c0de9440:	9405      	str	r4, [sp, #20]
c0de9442:	f8cd b00c 	str.w	fp, [sp, #12]
c0de9446:	4669      	mov	r1, sp
c0de9448:	f88d 0011 	strb.w	r0, [sp, #17]
c0de944c:	2009      	movs	r0, #9
c0de944e:	f88d 001e 	strb.w	r0, [sp, #30]
c0de9452:	f88d 001c 	strb.w	r0, [sp, #28]
c0de9456:	4806      	ldr	r0, [pc, #24]	@ (c0de9470 <nbgl_useCaseChoice+0x70>)
c0de9458:	4478      	add	r0, pc
c0de945a:	f7fe fcd3 	bl	c0de7e04 <nbgl_pageDrawConfirmation>
c0de945e:	6168      	str	r0, [r5, #20]
c0de9460:	f001 fb4c 	bl	c0deaafc <OUTLINED_FUNCTION_3>
c0de9464:	b008      	add	sp, #32
c0de9466:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de946a:	bf00      	nop
c0de946c:	00001c28 	.word	0x00001c28
c0de9470:	fffffb69 	.word	0xfffffb69

c0de9474 <nbgl_useCaseConfirm>:
c0de9474:	b570      	push	{r4, r5, r6, lr}
c0de9476:	b088      	sub	sp, #32
c0de9478:	4c0f      	ldr	r4, [pc, #60]	@ (c0de94b8 <nbgl_useCaseConfirm+0x44>)
c0de947a:	9e0c      	ldr	r6, [sp, #48]	@ 0x30
c0de947c:	f10d 0c14 	add.w	ip, sp, #20
c0de9480:	eb09 0504 	add.w	r5, r9, r4
c0de9484:	61ee      	str	r6, [r5, #28]
c0de9486:	4e0d      	ldr	r6, [pc, #52]	@ (c0de94bc <nbgl_useCaseConfirm+0x48>)
c0de9488:	e8ac 004c 	stmia.w	ip!, {r2, r3, r6}
c0de948c:	2200      	movs	r2, #0
c0de948e:	9204      	str	r2, [sp, #16]
c0de9490:	4b0b      	ldr	r3, [pc, #44]	@ (c0de94c0 <nbgl_useCaseConfirm+0x4c>)
c0de9492:	447b      	add	r3, pc
c0de9494:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
c0de9498:	6a28      	ldr	r0, [r5, #32]
c0de949a:	b108      	cbz	r0, c0de94a0 <nbgl_useCaseConfirm+0x2c>
c0de949c:	f7fe ff15 	bl	c0de82ca <nbgl_pageRelease>
c0de94a0:	4808      	ldr	r0, [pc, #32]	@ (c0de94c4 <nbgl_useCaseConfirm+0x50>)
c0de94a2:	4669      	mov	r1, sp
c0de94a4:	4478      	add	r0, pc
c0de94a6:	f7fe fcad 	bl	c0de7e04 <nbgl_pageDrawConfirmation>
c0de94aa:	eb09 0104 	add.w	r1, r9, r4
c0de94ae:	6208      	str	r0, [r1, #32]
c0de94b0:	f001 fb24 	bl	c0deaafc <OUTLINED_FUNCTION_3>
c0de94b4:	b008      	add	sp, #32
c0de94b6:	bd70      	pop	{r4, r5, r6, pc}
c0de94b8:	00001c28 	.word	0x00001c28
c0de94bc:	01090009 	.word	0x01090009
c0de94c0:	0000325e 	.word	0x0000325e
c0de94c4:	00000021 	.word	0x00000021

c0de94c8 <pageModalCallback>:
c0de94c8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de94ca:	460c      	mov	r4, r1
c0de94cc:	280e      	cmp	r0, #14
c0de94ce:	d008      	beq.n	c0de94e2 <pageModalCallback+0x1a>
c0de94d0:	4605      	mov	r5, r0
c0de94d2:	280f      	cmp	r0, #15
c0de94d4:	d117      	bne.n	c0de9506 <pageModalCallback+0x3e>
c0de94d6:	4833      	ldr	r0, [pc, #204]	@ (c0de95a4 <pageModalCallback+0xdc>)
c0de94d8:	4448      	add	r0, r9
c0de94da:	e9d0 2104 	ldrd	r2, r1, [r0, #16]
c0de94de:	6983      	ldr	r3, [r0, #24]
c0de94e0:	e005      	b.n	c0de94ee <pageModalCallback+0x26>
c0de94e2:	482f      	ldr	r0, [pc, #188]	@ (c0de95a0 <pageModalCallback+0xd8>)
c0de94e4:	4448      	add	r0, r9
c0de94e6:	6b40      	ldr	r0, [r0, #52]	@ 0x34
c0de94e8:	e9d0 2100 	ldrd	r2, r1, [r0]
c0de94ec:	6883      	ldr	r3, [r0, #8]
c0de94ee:	f852 0024 	ldr.w	r0, [r2, r4, lsl #2]
c0de94f2:	eb04 0244 	add.w	r2, r4, r4, lsl #1
c0de94f6:	f851 1024 	ldr.w	r1, [r1, r4, lsl #2]
c0de94fa:	eb03 02c2 	add.w	r2, r3, r2, lsl #3
c0de94fe:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de9502:	f000 bd93 	b.w	c0dea02c <displayFullValuePage>
c0de9506:	4e28      	ldr	r6, [pc, #160]	@ (c0de95a8 <pageModalCallback+0xe0>)
c0de9508:	eb09 0706 	add.w	r7, r9, r6
c0de950c:	6a38      	ldr	r0, [r7, #32]
c0de950e:	f7fe fedc 	bl	c0de82ca <nbgl_pageRelease>
c0de9512:	2000      	movs	r0, #0
c0de9514:	2d02      	cmp	r5, #2
c0de9516:	6238      	str	r0, [r7, #32]
c0de9518:	d032      	beq.n	c0de9580 <pageModalCallback+0xb8>
c0de951a:	2d13      	cmp	r5, #19
c0de951c:	d00f      	beq.n	c0de953e <pageModalCallback+0x76>
c0de951e:	2d04      	cmp	r5, #4
c0de9520:	d01e      	beq.n	c0de9560 <pageModalCallback+0x98>
c0de9522:	2d05      	cmp	r5, #5
c0de9524:	d024      	beq.n	c0de9570 <pageModalCallback+0xa8>
c0de9526:	2d09      	cmp	r5, #9
c0de9528:	d029      	beq.n	c0de957e <pageModalCallback+0xb6>
c0de952a:	2d03      	cmp	r5, #3
c0de952c:	d137      	bne.n	c0de959e <pageModalCallback+0xd6>
c0de952e:	2cff      	cmp	r4, #255	@ 0xff
c0de9530:	d026      	beq.n	c0de9580 <pageModalCallback+0xb8>
c0de9532:	4620      	mov	r0, r4
c0de9534:	2100      	movs	r1, #0
c0de9536:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de953a:	f001 b88b 	b.w	c0dea654 <displayDetailsPage>
c0de953e:	4818      	ldr	r0, [pc, #96]	@ (c0de95a0 <pageModalCallback+0xd8>)
c0de9540:	eb09 0100 	add.w	r1, r9, r0
c0de9544:	f891 1068 	ldrb.w	r1, [r1, #104]	@ 0x68
c0de9548:	2902      	cmp	r1, #2
c0de954a:	d119      	bne.n	c0de9580 <pageModalCallback+0xb8>
c0de954c:	4448      	add	r0, r9
c0de954e:	2101      	movs	r1, #1
c0de9550:	f880 1068 	strb.w	r1, [r0, #104]	@ 0x68
c0de9554:	6d80      	ldr	r0, [r0, #88]	@ 0x58
c0de9556:	6800      	ldr	r0, [r0, #0]
c0de9558:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de955c:	f000 be44 	b.w	c0dea1e8 <displaySecurityReport>
c0de9560:	2cff      	cmp	r4, #255	@ 0xff
c0de9562:	d00d      	beq.n	c0de9580 <pageModalCallback+0xb8>
c0de9564:	4620      	mov	r0, r4
c0de9566:	2100      	movs	r1, #0
c0de9568:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de956c:	f001 b92c 	b.w	c0dea7c8 <displayTagValueListModalPage>
c0de9570:	b934      	cbnz	r4, c0de9580 <pageModalCallback+0xb8>
c0de9572:	20ff      	movs	r0, #255	@ 0xff
c0de9574:	2101      	movs	r1, #1
c0de9576:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de957a:	f7ff ba59 	b.w	c0de8a30 <displayGenericContextPage>
c0de957e:	b12c      	cbz	r4, c0de958c <pageModalCallback+0xc4>
c0de9580:	f001 ff8d 	bl	c0deb49e <nbgl_screenRedraw>
c0de9584:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de9588:	f001 bf61 	b.w	c0deb44e <nbgl_refresh>
c0de958c:	eb09 0006 	add.w	r0, r9, r6
c0de9590:	69c0      	ldr	r0, [r0, #28]
c0de9592:	b120      	cbz	r0, c0de959e <pageModalCallback+0xd6>
c0de9594:	4780      	blx	r0
c0de9596:	eb09 0006 	add.w	r0, r9, r6
c0de959a:	2100      	movs	r1, #0
c0de959c:	61c1      	str	r1, [r0, #28]
c0de959e:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0de95a0:	0000195c 	.word	0x0000195c
c0de95a4:	00001ca4 	.word	0x00001ca4
c0de95a8:	00001c28 	.word	0x00001c28

c0de95ac <displayReviewPage>:
c0de95ac:	b570      	push	{r4, r5, r6, lr}
c0de95ae:	b090      	sub	sp, #64	@ 0x40
c0de95b0:	460c      	mov	r4, r1
c0de95b2:	4605      	mov	r5, r0
c0de95b4:	4668      	mov	r0, sp
c0de95b6:	2140      	movs	r1, #64	@ 0x40
c0de95b8:	f002 fc6e 	bl	c0debe98 <__aeabi_memclr>
c0de95bc:	4e24      	ldr	r6, [pc, #144]	@ (c0de9650 <displayReviewPage+0xa4>)
c0de95be:	eb09 0006 	add.w	r0, r9, r6
c0de95c2:	f890 0061 	ldrb.w	r0, [r0, #97]	@ 0x61
c0de95c6:	b108      	cbz	r0, c0de95cc <displayReviewPage+0x20>
c0de95c8:	42a8      	cmp	r0, r5
c0de95ca:	d93f      	bls.n	c0de964c <displayReviewPage+0xa0>
c0de95cc:	eb09 0006 	add.w	r0, r9, r6
c0de95d0:	6882      	ldr	r2, [r0, #8]
c0de95d2:	f880 5060 	strb.w	r5, [r0, #96]	@ 0x60
c0de95d6:	b3ca      	cbz	r2, c0de964c <displayReviewPage+0xa0>
c0de95d8:	4669      	mov	r1, sp
c0de95da:	4628      	mov	r0, r5
c0de95dc:	4790      	blx	r2
c0de95de:	b3a8      	cbz	r0, c0de964c <displayReviewPage+0xa0>
c0de95e0:	2009      	movs	r0, #9
c0de95e2:	2100      	movs	r1, #0
c0de95e4:	f88d 0006 	strb.w	r0, [sp, #6]
c0de95e8:	f89d 000c 	ldrb.w	r0, [sp, #12]
c0de95ec:	f88d 1004 	strb.w	r1, [sp, #4]
c0de95f0:	9100      	str	r1, [sp, #0]
c0de95f2:	2806      	cmp	r0, #6
c0de95f4:	d00e      	beq.n	c0de9614 <displayReviewPage+0x68>
c0de95f6:	2804      	cmp	r0, #4
c0de95f8:	d015      	beq.n	c0de9626 <displayReviewPage+0x7a>
c0de95fa:	2805      	cmp	r0, #5
c0de95fc:	d010      	beq.n	c0de9620 <displayReviewPage+0x74>
c0de95fe:	2802      	cmp	r0, #2
c0de9600:	d114      	bne.n	c0de962c <displayReviewPage+0x80>
c0de9602:	eb09 0006 	add.w	r0, r9, r6
c0de9606:	f890 1060 	ldrb.w	r1, [r0, #96]	@ 0x60
c0de960a:	3101      	adds	r1, #1
c0de960c:	f880 1061 	strb.w	r1, [r0, #97]	@ 0x61
c0de9610:	200b      	movs	r0, #11
c0de9612:	e009      	b.n	c0de9628 <displayReviewPage+0x7c>
c0de9614:	200b      	movs	r0, #11
c0de9616:	f88d 101c 	strb.w	r1, [sp, #28]
c0de961a:	f88d 0038 	strb.w	r0, [sp, #56]	@ 0x38
c0de961e:	e005      	b.n	c0de962c <displayReviewPage+0x80>
c0de9620:	2009      	movs	r0, #9
c0de9622:	f88d 001a 	strb.w	r0, [sp, #26]
c0de9626:	2000      	movs	r0, #0
c0de9628:	f88d 001c 	strb.w	r0, [sp, #28]
c0de962c:	4809      	ldr	r0, [pc, #36]	@ (c0de9654 <displayReviewPage+0xa8>)
c0de962e:	eb09 0506 	add.w	r5, r9, r6
c0de9632:	466a      	mov	r2, sp
c0de9634:	f105 0160 	add.w	r1, r5, #96	@ 0x60
c0de9638:	4478      	add	r0, pc
c0de963a:	f7fe fe43 	bl	c0de82c4 <nbgl_pageDrawGenericContent>
c0de963e:	6168      	str	r0, [r5, #20]
c0de9640:	2001      	movs	r0, #1
c0de9642:	2c00      	cmp	r4, #0
c0de9644:	bf18      	it	ne
c0de9646:	2002      	movne	r0, #2
c0de9648:	f001 ff06 	bl	c0deb458 <nbgl_refreshSpecial>
c0de964c:	b010      	add	sp, #64	@ 0x40
c0de964e:	bd70      	pop	{r4, r5, r6, pc}
c0de9650:	00001c28 	.word	0x00001c28
c0de9654:	fffff989 	.word	0xfffff989

c0de9658 <nbgl_useCaseReview>:
c0de9658:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de965a:	b087      	sub	sp, #28
c0de965c:	461c      	mov	r4, r3
c0de965e:	f001 fa3d 	bl	c0deaadc <OUTLINED_FUNCTION_0>
c0de9662:	2001      	movs	r0, #1
c0de9664:	990e      	ldr	r1, [sp, #56]	@ 0x38
c0de9666:	462a      	mov	r2, r5
c0de9668:	4623      	mov	r3, r4
c0de966a:	9005      	str	r0, [sp, #20]
c0de966c:	2000      	movs	r0, #0
c0de966e:	e9cd 0102 	strd	r0, r1, [sp, #8]
c0de9672:	9004      	str	r0, [sp, #16]
c0de9674:	980d      	ldr	r0, [sp, #52]	@ 0x34
c0de9676:	4631      	mov	r1, r6
c0de9678:	f001 fa52 	bl	c0deab20 <OUTLINED_FUNCTION_7>
c0de967c:	b007      	add	sp, #28
c0de967e:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0de9680 <useCaseReview>:
c0de9680:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de9684:	4682      	mov	sl, r0
c0de9686:	4840      	ldr	r0, [pc, #256]	@ (c0de9788 <useCaseReview+0x108>)
c0de9688:	4688      	mov	r8, r1
c0de968a:	2102      	movs	r1, #2
c0de968c:	4614      	mov	r4, r2
c0de968e:	f04f 0b00 	mov.w	fp, #0
c0de9692:	4e40      	ldr	r6, [pc, #256]	@ (c0de9794 <useCaseReview+0x114>)
c0de9694:	461f      	mov	r7, r3
c0de9696:	f809 1000 	strb.w	r1, [r9, r0]
c0de969a:	493c      	ldr	r1, [pc, #240]	@ (c0de978c <useCaseReview+0x10c>)
c0de969c:	4448      	add	r0, r9
c0de969e:	eb09 0506 	add.w	r5, r9, r6
c0de96a2:	9a0d      	ldr	r2, [sp, #52]	@ 0x34
c0de96a4:	4449      	add	r1, r9
c0de96a6:	e9c1 a208 	strd	sl, r2, [r1, #32]
c0de96aa:	493b      	ldr	r1, [pc, #236]	@ (c0de9798 <useCaseReview+0x118>)
c0de96ac:	f8c0 b010 	str.w	fp, [r0, #16]
c0de96b0:	4479      	add	r1, pc
c0de96b2:	6181      	str	r1, [r0, #24]
c0de96b4:	4836      	ldr	r0, [pc, #216]	@ (c0de9790 <useCaseReview+0x110>)
c0de96b6:	2103      	movs	r1, #3
c0de96b8:	4448      	add	r0, r9
c0de96ba:	7301      	strb	r1, [r0, #12]
c0de96bc:	6085      	str	r5, [r0, #8]
c0de96be:	4628      	mov	r0, r5
c0de96c0:	21a8      	movs	r1, #168	@ 0xa8
c0de96c2:	f002 fbe9 	bl	c0debe98 <__aeabi_memclr>
c0de96c6:	2001      	movs	r0, #1
c0de96c8:	f8a5 b024 	strh.w	fp, [r5, #36]	@ 0x24
c0de96cc:	f809 0006 	strb.w	r0, [r9, r6]
c0de96d0:	4832      	ldr	r0, [pc, #200]	@ (c0de979c <useCaseReview+0x11c>)
c0de96d2:	4478      	add	r0, pc
c0de96d4:	6228      	str	r0, [r5, #32]
c0de96d6:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de96d8:	616f      	str	r7, [r5, #20]
c0de96da:	9401      	str	r4, [sp, #4]
c0de96dc:	60ac      	str	r4, [r5, #8]
c0de96de:	f885 b004 	strb.w	fp, [r5, #4]
c0de96e2:	61e8      	str	r0, [r5, #28]
c0de96e4:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0de96e6:	f001 f915 	bl	c0dea914 <initWarningTipBox>
c0de96ea:	2004      	movs	r0, #4
c0de96ec:	4641      	mov	r1, r8
c0de96ee:	f885 0038 	strb.w	r0, [r5, #56]	@ 0x38
c0de96f2:	f105 003c 	add.w	r0, r5, #60	@ 0x3c
c0de96f6:	e891 00dc 	ldmia.w	r1, {r2, r3, r4, r6, r7}
c0de96fa:	c0dc      	stmia	r0!, {r2, r3, r4, r6, r7}
c0de96fc:	f8d8 0010 	ldr.w	r0, [r8, #16]
c0de9700:	66e8      	str	r0, [r5, #108]	@ 0x6c
c0de9702:	e9dd 050e 	ldrd	r0, r5, [sp, #56]	@ 0x38
c0de9706:	9b0b      	ldr	r3, [sp, #44]	@ 0x2c
c0de9708:	b190      	cbz	r0, c0de9730 <useCaseReview+0xb0>
c0de970a:	4922      	ldr	r1, [pc, #136]	@ (c0de9794 <useCaseReview+0x114>)
c0de970c:	2203      	movs	r2, #3
c0de970e:	eb09 0001 	add.w	r0, r9, r1
c0de9712:	f880 2070 	strb.w	r2, [r0, #112]	@ 0x70
c0de9716:	9a01      	ldr	r2, [sp, #4]
c0de9718:	b343      	cbz	r3, c0de976c <useCaseReview+0xec>
c0de971a:	eb09 0001 	add.w	r0, r9, r1
c0de971e:	210b      	movs	r1, #11
c0de9720:	f880 1080 	strb.w	r1, [r0, #128]	@ 0x80
c0de9724:	4921      	ldr	r1, [pc, #132]	@ (c0de97ac <useCaseReview+0x12c>)
c0de9726:	e9c0 321d 	strd	r3, r2, [r0, #116]	@ 0x74
c0de972a:	4479      	add	r1, pc
c0de972c:	67c1      	str	r1, [r0, #124]	@ 0x7c
c0de972e:	e00a      	b.n	c0de9746 <useCaseReview+0xc6>
c0de9730:	4818      	ldr	r0, [pc, #96]	@ (c0de9794 <useCaseReview+0x114>)
c0de9732:	2102      	movs	r1, #2
c0de9734:	9a01      	ldr	r2, [sp, #4]
c0de9736:	4448      	add	r0, r9
c0de9738:	f880 1070 	strb.w	r1, [r0, #112]	@ 0x70
c0de973c:	f100 0174 	add.w	r1, r0, #116	@ 0x74
c0de9740:	4650      	mov	r0, sl
c0de9742:	f000 fa07 	bl	c0de9b54 <prepareReviewLastPage>
c0de9746:	f3ca 1000 	ubfx	r0, sl, #4, #1
c0de974a:	f7ff f8b7 	bl	c0de88bc <getNbPagesForGenericContents>
c0de974e:	4a18      	ldr	r2, [pc, #96]	@ (c0de97b0 <useCaseReview+0x130>)
c0de9750:	4601      	mov	r1, r0
c0de9752:	2001      	movs	r0, #1
c0de9754:	447a      	add	r2, pc
c0de9756:	f7fe ffe9 	bl	c0de872c <prepareNavInfo>
c0de975a:	b10d      	cbz	r5, c0de9760 <useCaseReview+0xe0>
c0de975c:	f001 f9dd 	bl	c0deab1a <OUTLINED_FUNCTION_6>
c0de9760:	2000      	movs	r0, #0
c0de9762:	2101      	movs	r1, #1
c0de9764:	e8bd 4dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de9768:	f7ff b962 	b.w	c0de8a30 <displayGenericContextPage>
c0de976c:	f01a 0007 	ands.w	r0, sl, #7
c0de9770:	d004      	beq.n	c0de977c <useCaseReview+0xfc>
c0de9772:	2801      	cmp	r0, #1
c0de9774:	d105      	bne.n	c0de9782 <useCaseReview+0x102>
c0de9776:	4b0b      	ldr	r3, [pc, #44]	@ (c0de97a4 <useCaseReview+0x124>)
c0de9778:	447b      	add	r3, pc
c0de977a:	e7ce      	b.n	c0de971a <useCaseReview+0x9a>
c0de977c:	4b08      	ldr	r3, [pc, #32]	@ (c0de97a0 <useCaseReview+0x120>)
c0de977e:	447b      	add	r3, pc
c0de9780:	e7cb      	b.n	c0de971a <useCaseReview+0x9a>
c0de9782:	4b09      	ldr	r3, [pc, #36]	@ (c0de97a8 <useCaseReview+0x128>)
c0de9784:	447b      	add	r3, pc
c0de9786:	e7c8      	b.n	c0de971a <useCaseReview+0x9a>
c0de9788:	00001c28 	.word	0x00001c28
c0de978c:	00001ca4 	.word	0x00001ca4
c0de9790:	0000195c 	.word	0x0000195c
c0de9794:	000019c8 	.word	0x000019c8
c0de9798:	0000123d 	.word	0x0000123d
c0de979c:	000043bd 	.word	0x000043bd
c0de97a0:	00003cfe 	.word	0x00003cfe
c0de97a4:	00003cd3 	.word	0x00003cd3
c0de97a8:	00004246 	.word	0x00004246
c0de97ac:	00003af4 	.word	0x00003af4
c0de97b0:	00003b0e 	.word	0x00003b0e

c0de97b4 <nbgl_useCaseReviewBlindSigning>:
c0de97b4:	b510      	push	{r4, lr}
c0de97b6:	b086      	sub	sp, #24
c0de97b8:	9c0b      	ldr	r4, [sp, #44]	@ 0x2c
c0de97ba:	9404      	str	r4, [sp, #16]
c0de97bc:	4c06      	ldr	r4, [pc, #24]	@ (c0de97d8 <nbgl_useCaseReviewBlindSigning+0x24>)
c0de97be:	447c      	add	r4, pc
c0de97c0:	9403      	str	r4, [sp, #12]
c0de97c2:	9c0a      	ldr	r4, [sp, #40]	@ 0x28
c0de97c4:	9402      	str	r4, [sp, #8]
c0de97c6:	9c09      	ldr	r4, [sp, #36]	@ 0x24
c0de97c8:	9401      	str	r4, [sp, #4]
c0de97ca:	9c08      	ldr	r4, [sp, #32]
c0de97cc:	9400      	str	r4, [sp, #0]
c0de97ce:	f000 f805 	bl	c0de97dc <nbgl_useCaseAdvancedReview>
c0de97d2:	b006      	add	sp, #24
c0de97d4:	bd10      	pop	{r4, pc}
c0de97d6:	bf00      	nop
c0de97d8:	0000594a 	.word	0x0000594a

c0de97dc <nbgl_useCaseAdvancedReview>:
c0de97dc:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de97e0:	b088      	sub	sp, #32
c0de97e2:	e9cd 2306 	strd	r2, r3, [sp, #24]
c0de97e6:	460e      	mov	r6, r1
c0de97e8:	4605      	mov	r5, r0
c0de97ea:	f7fe ff89 	bl	c0de8700 <reset_callbacks_and_context>
c0de97ee:	f10d 0b48 	add.w	fp, sp, #72	@ 0x48
c0de97f2:	482b      	ldr	r0, [pc, #172]	@ (c0de98a0 <nbgl_useCaseAdvancedReview+0xc4>)
c0de97f4:	e9dd 4810 	ldrd	r4, r8, [sp, #64]	@ 0x40
c0de97f8:	e89b 0c80 	ldmia.w	fp, {r7, sl, fp}
c0de97fc:	4448      	add	r0, r9
c0de97fe:	b127      	cbz	r7, c0de980a <nbgl_useCaseAdvancedReview+0x2e>
c0de9800:	4639      	mov	r1, r7
c0de9802:	2220      	movs	r2, #32
c0de9804:	f002 fb3e 	bl	c0debe84 <__aeabi_memcpy>
c0de9808:	e002      	b.n	c0de9810 <nbgl_useCaseAdvancedReview+0x34>
c0de980a:	2120      	movs	r1, #32
c0de980c:	f002 fb44 	bl	c0debe98 <__aeabi_memclr>
c0de9810:	f1ba 0f00 	cmp.w	sl, #0
c0de9814:	d028      	beq.n	c0de9868 <nbgl_useCaseAdvancedReview+0x8c>
c0de9816:	f8da 0000 	ldr.w	r0, [sl]
c0de981a:	b928      	cbnz	r0, c0de9828 <nbgl_useCaseAdvancedReview+0x4c>
c0de981c:	f8da 1014 	ldr.w	r1, [sl, #20]
c0de9820:	b911      	cbnz	r1, c0de9828 <nbgl_useCaseAdvancedReview+0x4c>
c0de9822:	f8da 1018 	ldr.w	r1, [sl, #24]
c0de9826:	b1f9      	cbz	r1, c0de9868 <nbgl_useCaseAdvancedReview+0x8c>
c0de9828:	491e      	ldr	r1, [pc, #120]	@ (c0de98a4 <nbgl_useCaseAdvancedReview+0xc8>)
c0de982a:	2200      	movs	r2, #0
c0de982c:	4449      	add	r1, r9
c0de982e:	f881 203c 	strb.w	r2, [r1, #60]	@ 0x3c
c0de9832:	2240      	movs	r2, #64	@ 0x40
c0de9834:	2808      	cmp	r0, #8
c0de9836:	bf08      	it	eq
c0de9838:	2280      	moveq	r2, #128	@ 0x80
c0de983a:	ea42 0005 	orr.w	r0, r2, r5
c0de983e:	9d06      	ldr	r5, [sp, #24]
c0de9840:	9b07      	ldr	r3, [sp, #28]
c0de9842:	e9c1 0610 	strd	r0, r6, [r1, #64]	@ 0x40
c0de9846:	648d      	str	r5, [r1, #72]	@ 0x48
c0de9848:	314c      	adds	r1, #76	@ 0x4c
c0de984a:	e881 0d18 	stmia.w	r1, {r3, r4, r8, sl, fp}
c0de984e:	f89a 1000 	ldrb.w	r1, [sl]
c0de9852:	f011 0f16 	tst.w	r1, #22
c0de9856:	d102      	bne.n	c0de985e <nbgl_useCaseAdvancedReview+0x82>
c0de9858:	f8da 1014 	ldr.w	r1, [sl, #20]
c0de985c:	b1a9      	cbz	r1, c0de988a <nbgl_useCaseAdvancedReview+0xae>
c0de985e:	b008      	add	sp, #32
c0de9860:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9864:	f000 b820 	b.w	c0de98a8 <displayInitialWarning>
c0de9868:	2001      	movs	r0, #1
c0de986a:	2100      	movs	r1, #0
c0de986c:	e9cd 4800 	strd	r4, r8, [sp]
c0de9870:	e9cd 7b02 	strd	r7, fp, [sp, #8]
c0de9874:	e9cd 1004 	strd	r1, r0, [sp, #16]
c0de9878:	4628      	mov	r0, r5
c0de987a:	4631      	mov	r1, r6
c0de987c:	e9dd 2306 	ldrd	r2, r3, [sp, #24]
c0de9880:	f7ff fefe 	bl	c0de9680 <useCaseReview>
c0de9884:	b008      	add	sp, #32
c0de9886:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de988a:	2101      	movs	r1, #1
c0de988c:	2200      	movs	r2, #0
c0de988e:	e9cd 4800 	strd	r4, r8, [sp]
c0de9892:	e9cd 7b02 	strd	r7, fp, [sp, #8]
c0de9896:	e9cd 2104 	strd	r2, r1, [sp, #16]
c0de989a:	4631      	mov	r1, r6
c0de989c:	462a      	mov	r2, r5
c0de989e:	e7ef      	b.n	c0de9880 <nbgl_useCaseAdvancedReview+0xa4>
c0de98a0:	00001ca4 	.word	0x00001ca4
c0de98a4:	0000195c 	.word	0x0000195c

c0de98a8 <displayInitialWarning>:
c0de98a8:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de98aa:	b099      	sub	sp, #100	@ 0x64
c0de98ac:	4857      	ldr	r0, [pc, #348]	@ (c0de9a0c <displayInitialWarning+0x164>)
c0de98ae:	a90e      	add	r1, sp, #56	@ 0x38
c0de98b0:	4478      	add	r0, pc
c0de98b2:	e890 003c 	ldmia.w	r0, {r2, r3, r4, r5}
c0de98b6:	c13c      	stmia	r1!, {r2, r3, r4, r5}
c0de98b8:	4855      	ldr	r0, [pc, #340]	@ (c0de9a10 <displayInitialWarning+0x168>)
c0de98ba:	ac0a      	add	r4, sp, #40	@ 0x28
c0de98bc:	4621      	mov	r1, r4
c0de98be:	4478      	add	r0, pc
c0de98c0:	e890 006c 	ldmia.w	r0, {r2, r3, r5, r6}
c0de98c4:	c16c      	stmia	r1!, {r2, r3, r5, r6}
c0de98c6:	4d4f      	ldr	r5, [pc, #316]	@ (c0de9a04 <displayInitialWarning+0x15c>)
c0de98c8:	eb09 0705 	add.w	r7, r9, r5
c0de98cc:	6db8      	ldr	r0, [r7, #88]	@ 0x58
c0de98ce:	6806      	ldr	r6, [r0, #0]
c0de98d0:	2001      	movs	r0, #1
c0de98d2:	f887 0069 	strb.w	r0, [r7, #105]	@ 0x69
c0de98d6:	484f      	ldr	r0, [pc, #316]	@ (c0de9a14 <displayInitialWarning+0x16c>)
c0de98d8:	4478      	add	r0, pc
c0de98da:	9015      	str	r0, [sp, #84]	@ 0x54
c0de98dc:	f44f 7080 	mov.w	r0, #256	@ 0x100
c0de98e0:	f8ad 0048 	strh.w	r0, [sp, #72]	@ 0x48
c0de98e4:	2000      	movs	r0, #0
c0de98e6:	9016      	str	r0, [sp, #88]	@ 0x58
c0de98e8:	9013      	str	r0, [sp, #76]	@ 0x4c
c0de98ea:	a812      	add	r0, sp, #72	@ 0x48
c0de98ec:	f7fa f9ba 	bl	c0de3c64 <nbgl_layoutGet>
c0de98f0:	4621      	mov	r1, r4
c0de98f2:	6638      	str	r0, [r7, #96]	@ 0x60
c0de98f4:	f7fc ff4e 	bl	c0de6794 <nbgl_layoutAddHeader>
c0de98f8:	6db8      	ldr	r0, [r7, #88]	@ 0x58
c0de98fa:	f026 0409 	bic.w	r4, r6, #9
c0de98fe:	6801      	ldr	r1, [r0, #0]
c0de9900:	b139      	cbz	r1, c0de9912 <displayInitialWarning+0x6a>
c0de9902:	4845      	ldr	r0, [pc, #276]	@ (c0de9a18 <displayInitialWarning+0x170>)
c0de9904:	4945      	ldr	r1, [pc, #276]	@ (c0de9a1c <displayInitialWarning+0x174>)
c0de9906:	2c10      	cmp	r4, #16
c0de9908:	4479      	add	r1, pc
c0de990a:	4478      	add	r0, pc
c0de990c:	bf08      	it	eq
c0de990e:	4601      	moveq	r1, r0
c0de9910:	e001      	b.n	c0de9916 <displayInitialWarning+0x6e>
c0de9912:	6a01      	ldr	r1, [r0, #32]
c0de9914:	b131      	cbz	r1, c0de9924 <displayInitialWarning+0x7c>
c0de9916:	eb09 0005 	add.w	r0, r9, r5
c0de991a:	2211      	movs	r2, #17
c0de991c:	2309      	movs	r3, #9
c0de991e:	6e00      	ldr	r0, [r0, #96]	@ 0x60
c0de9920:	f7fa ff68 	bl	c0de47f4 <nbgl_layoutAddTopRightButton>
c0de9924:	eb09 0005 	add.w	r0, r9, r5
c0de9928:	6d87      	ldr	r7, [r0, #88]	@ 0x58
c0de992a:	6838      	ldr	r0, [r7, #0]
c0de992c:	b188      	cbz	r0, c0de9952 <displayInitialWarning+0xaa>
c0de992e:	a801      	add	r0, sp, #4
c0de9930:	2124      	movs	r1, #36	@ 0x24
c0de9932:	f002 fab1 	bl	c0debe98 <__aeabi_memclr>
c0de9936:	483a      	ldr	r0, [pc, #232]	@ (c0de9a20 <displayInitialWarning+0x178>)
c0de9938:	2c10      	cmp	r4, #16
c0de993a:	4478      	add	r0, pc
c0de993c:	9002      	str	r0, [sp, #8]
c0de993e:	d111      	bne.n	c0de9964 <displayInitialWarning+0xbc>
c0de9940:	4840      	ldr	r0, [pc, #256]	@ (c0de9a44 <displayInitialWarning+0x19c>)
c0de9942:	2405      	movs	r4, #5
c0de9944:	4478      	add	r0, pc
c0de9946:	9005      	str	r0, [sp, #20]
c0de9948:	493f      	ldr	r1, [pc, #252]	@ (c0de9a48 <displayInitialWarning+0x1a0>)
c0de994a:	4840      	ldr	r0, [pc, #256]	@ (c0de9a4c <displayInitialWarning+0x1a4>)
c0de994c:	4479      	add	r1, pc
c0de994e:	4478      	add	r0, pc
c0de9950:	e03d      	b.n	c0de99ce <displayInitialWarning+0x126>
c0de9952:	69f9      	ldr	r1, [r7, #28]
c0de9954:	b351      	cbz	r1, c0de99ac <displayInitialWarning+0x104>
c0de9956:	eb09 0005 	add.w	r0, r9, r5
c0de995a:	6e00      	ldr	r0, [r0, #96]	@ 0x60
c0de995c:	f7fc fab6 	bl	c0de5ecc <nbgl_layoutAddContentCenter>
c0de9960:	2408      	movs	r4, #8
c0de9962:	e03c      	b.n	c0de99de <displayInitialWarning+0x136>
c0de9964:	4828      	ldr	r0, [pc, #160]	@ (c0de9a08 <displayInitialWarning+0x160>)
c0de9966:	4448      	add	r0, r9
c0de9968:	9006      	str	r0, [sp, #24]
c0de996a:	68f9      	ldr	r1, [r7, #12]
c0de996c:	4b2d      	ldr	r3, [pc, #180]	@ (c0de9a24 <displayInitialWarning+0x17c>)
c0de996e:	447b      	add	r3, pc
c0de9970:	2900      	cmp	r1, #0
c0de9972:	bf18      	it	ne
c0de9974:	460b      	movne	r3, r1
c0de9976:	4a2c      	ldr	r2, [pc, #176]	@ (c0de9a28 <displayInitialWarning+0x180>)
c0de9978:	2180      	movs	r1, #128	@ 0x80
c0de997a:	447a      	add	r2, pc
c0de997c:	f001 fdf2 	bl	c0deb564 <snprintf>
c0de9980:	07b0      	lsls	r0, r6, #30
c0de9982:	d403      	bmi.n	c0de998c <displayInitialWarning+0xe4>
c0de9984:	0770      	lsls	r0, r6, #29
c0de9986:	d413      	bmi.n	c0de99b0 <displayInitialWarning+0x108>
c0de9988:	2400      	movs	r4, #0
c0de998a:	e022      	b.n	c0de99d2 <displayInitialWarning+0x12a>
c0de998c:	4827      	ldr	r0, [pc, #156]	@ (c0de9a2c <displayInitialWarning+0x184>)
c0de998e:	4478      	add	r0, pc
c0de9990:	9005      	str	r0, [sp, #20]
c0de9992:	eb09 0005 	add.w	r0, r9, r5
c0de9996:	6d80      	ldr	r0, [r0, #88]	@ 0x58
c0de9998:	6901      	ldr	r1, [r0, #16]
c0de999a:	4825      	ldr	r0, [pc, #148]	@ (c0de9a30 <displayInitialWarning+0x188>)
c0de999c:	4478      	add	r0, pc
c0de999e:	2900      	cmp	r1, #0
c0de99a0:	bf18      	it	ne
c0de99a2:	4608      	movne	r0, r1
c0de99a4:	4923      	ldr	r1, [pc, #140]	@ (c0de9a34 <displayInitialWarning+0x18c>)
c0de99a6:	2405      	movs	r4, #5
c0de99a8:	4479      	add	r1, pc
c0de99aa:	e010      	b.n	c0de99ce <displayInitialWarning+0x126>
c0de99ac:	2400      	movs	r4, #0
c0de99ae:	e016      	b.n	c0de99de <displayInitialWarning+0x136>
c0de99b0:	4821      	ldr	r0, [pc, #132]	@ (c0de9a38 <displayInitialWarning+0x190>)
c0de99b2:	4478      	add	r0, pc
c0de99b4:	9005      	str	r0, [sp, #20]
c0de99b6:	eb09 0005 	add.w	r0, r9, r5
c0de99ba:	6d80      	ldr	r0, [r0, #88]	@ 0x58
c0de99bc:	6901      	ldr	r1, [r0, #16]
c0de99be:	481f      	ldr	r0, [pc, #124]	@ (c0de9a3c <displayInitialWarning+0x194>)
c0de99c0:	4478      	add	r0, pc
c0de99c2:	2900      	cmp	r1, #0
c0de99c4:	bf18      	it	ne
c0de99c6:	4608      	movne	r0, r1
c0de99c8:	491d      	ldr	r1, [pc, #116]	@ (c0de9a40 <displayInitialWarning+0x198>)
c0de99ca:	2404      	movs	r4, #4
c0de99cc:	4479      	add	r1, pc
c0de99ce:	910f      	str	r1, [sp, #60]	@ 0x3c
c0de99d0:	9007      	str	r0, [sp, #28]
c0de99d2:	eb09 0005 	add.w	r0, r9, r5
c0de99d6:	6e00      	ldr	r0, [r0, #96]	@ 0x60
c0de99d8:	a901      	add	r1, sp, #4
c0de99da:	f7fc fa77 	bl	c0de5ecc <nbgl_layoutAddContentCenter>
c0de99de:	eb09 0005 	add.w	r0, r9, r5
c0de99e2:	6e00      	ldr	r0, [r0, #96]	@ 0x60
c0de99e4:	a90e      	add	r1, sp, #56	@ 0x38
c0de99e6:	f7fc fbed 	bl	c0de61c4 <nbgl_layoutAddChoiceButtons>
c0de99ea:	b114      	cbz	r4, c0de99f2 <displayInitialWarning+0x14a>
c0de99ec:	4620      	mov	r0, r4
c0de99ee:	f7f9 ff32 	bl	c0de3856 <os_io_seph_cmd_piezo_play_tune>
c0de99f2:	eb09 0005 	add.w	r0, r9, r5
c0de99f6:	6e00      	ldr	r0, [r0, #96]	@ 0x60
c0de99f8:	f7fd fb2e 	bl	c0de7058 <nbgl_layoutDraw>
c0de99fc:	f001 fd27 	bl	c0deb44e <nbgl_refresh>
c0de9a00:	b019      	add	sp, #100	@ 0x64
c0de9a02:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de9a04:	0000195c 	.word	0x0000195c
c0de9a08:	00001aa8 	.word	0x00001aa8
c0de9a0c:	000059a8 	.word	0x000059a8
c0de9a10:	000058c6 	.word	0x000058c6
c0de9a14:	00001155 	.word	0x00001155
c0de9a18:	000032ae 	.word	0x000032ae
c0de9a1c:	000035f9 	.word	0x000035f9
c0de9a20:	00002f27 	.word	0x00002f27
c0de9a24:	00003cd5 	.word	0x00003cd5
c0de9a28:	00004068 	.word	0x00004068
c0de9a2c:	000040c6 	.word	0x000040c6
c0de9a30:	00003913 	.word	0x00003913
c0de9a34:	00003d2f 	.word	0x00003d2f
c0de9a38:	00003d15 	.word	0x00003d15
c0de9a3c:	00003cb3 	.word	0x00003cb3
c0de9a40:	00003b8f 	.word	0x00003b8f
c0de9a44:	00003e7b 	.word	0x00003e7b
c0de9a48:	0000412a 	.word	0x0000412a
c0de9a4c:	00003da2 	.word	0x00003da2

c0de9a50 <useCaseReviewStreamingStart>:
c0de9a50:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de9a54:	4604      	mov	r4, r0
c0de9a56:	4826      	ldr	r0, [pc, #152]	@ (c0de9af0 <useCaseReviewStreamingStart+0xa0>)
c0de9a58:	460d      	mov	r5, r1
c0de9a5a:	2103      	movs	r1, #3
c0de9a5c:	e9cd 3200 	strd	r3, r2, [sp]
c0de9a60:	f8df b098 	ldr.w	fp, [pc, #152]	@ c0de9afc <useCaseReviewStreamingStart+0xac>
c0de9a64:	f04f 0a01 	mov.w	sl, #1
c0de9a68:	f809 1000 	strb.w	r1, [r9, r0]
c0de9a6c:	4921      	ldr	r1, [pc, #132]	@ (c0de9af4 <useCaseReviewStreamingStart+0xa4>)
c0de9a6e:	eb09 0700 	add.w	r7, r9, r0
c0de9a72:	eb09 060b 	add.w	r6, r9, fp
c0de9a76:	eb09 0801 	add.w	r8, r9, r1
c0de9a7a:	f8c8 502c 	str.w	r5, [r8, #44]	@ 0x2c
c0de9a7e:	990a      	ldr	r1, [sp, #40]	@ 0x28
c0de9a80:	e9c8 4108 	strd	r4, r1, [r8, #32]
c0de9a84:	2138      	movs	r1, #56	@ 0x38
c0de9a86:	481e      	ldr	r0, [pc, #120]	@ (c0de9b00 <useCaseReviewStreamingStart+0xb0>)
c0de9a88:	4478      	add	r0, pc
c0de9a8a:	61b8      	str	r0, [r7, #24]
c0de9a8c:	2000      	movs	r0, #0
c0de9a8e:	6138      	str	r0, [r7, #16]
c0de9a90:	4819      	ldr	r0, [pc, #100]	@ (c0de9af8 <useCaseReviewStreamingStart+0xa8>)
c0de9a92:	4448      	add	r0, r9
c0de9a94:	f880 a00c 	strb.w	sl, [r0, #12]
c0de9a98:	6086      	str	r6, [r0, #8]
c0de9a9a:	f001 f855 	bl	c0deab48 <OUTLINED_FUNCTION_13>
c0de9a9e:	2100      	movs	r1, #0
c0de9aa0:	f809 a00b 	strb.w	sl, [r9, fp]
c0de9aa4:	84b1      	strh	r1, [r6, #36]	@ 0x24
c0de9aa6:	4817      	ldr	r0, [pc, #92]	@ (c0de9b04 <useCaseReviewStreamingStart+0xb4>)
c0de9aa8:	9a00      	ldr	r2, [sp, #0]
c0de9aaa:	60b5      	str	r5, [r6, #8]
c0de9aac:	7131      	strb	r1, [r6, #4]
c0de9aae:	2500      	movs	r5, #0
c0de9ab0:	4478      	add	r0, pc
c0de9ab2:	e9c6 2007 	strd	r2, r0, [r6, #28]
c0de9ab6:	9801      	ldr	r0, [sp, #4]
c0de9ab8:	6170      	str	r0, [r6, #20]
c0de9aba:	2000      	movs	r0, #0
c0de9abc:	f000 ff2a 	bl	c0dea914 <initWarningTipBox>
c0de9ac0:	f3c4 1000 	ubfx	r0, r4, #4, #1
c0de9ac4:	f7fe fefa 	bl	c0de88bc <getNbPagesForGenericContents>
c0de9ac8:	f888 0030 	strb.w	r0, [r8, #48]	@ 0x30
c0de9acc:	2001      	movs	r0, #1
c0de9ace:	21ff      	movs	r1, #255	@ 0xff
c0de9ad0:	4a0d      	ldr	r2, [pc, #52]	@ (c0de9b08 <useCaseReviewStreamingStart+0xb8>)
c0de9ad2:	447a      	add	r2, pc
c0de9ad4:	f7fe fe2a 	bl	c0de872c <prepareNavInfo>
c0de9ad8:	f887 5071 	strb.w	r5, [r7, #113]	@ 0x71
c0de9adc:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de9ade:	b108      	cbz	r0, c0de9ae4 <useCaseReviewStreamingStart+0x94>
c0de9ae0:	f001 f81b 	bl	c0deab1a <OUTLINED_FUNCTION_6>
c0de9ae4:	2000      	movs	r0, #0
c0de9ae6:	2101      	movs	r1, #1
c0de9ae8:	e8bd 4dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de9aec:	f7fe bfa0 	b.w	c0de8a30 <displayGenericContextPage>
c0de9af0:	00001c28 	.word	0x00001c28
c0de9af4:	00001ca4 	.word	0x00001ca4
c0de9af8:	0000195c 	.word	0x0000195c
c0de9afc:	000019c8 	.word	0x000019c8
c0de9b00:	00000081 	.word	0x00000081
c0de9b04:	00003fdf 	.word	0x00003fdf
c0de9b08:	00003790 	.word	0x00003790

c0de9b0c <bundleNavReviewStreamingChoice>:
c0de9b0c:	b580      	push	{r7, lr}
c0de9b0e:	b178      	cbz	r0, c0de9b30 <bundleNavReviewStreamingChoice+0x24>
c0de9b10:	480d      	ldr	r0, [pc, #52]	@ (c0de9b48 <bundleNavReviewStreamingChoice+0x3c>)
c0de9b12:	f819 0000 	ldrb.w	r0, [r9, r0]
c0de9b16:	2802      	cmp	r0, #2
c0de9b18:	d003      	beq.n	c0de9b22 <bundleNavReviewStreamingChoice+0x16>
c0de9b1a:	480c      	ldr	r0, [pc, #48]	@ (c0de9b4c <bundleNavReviewStreamingChoice+0x40>)
c0de9b1c:	4478      	add	r0, pc
c0de9b1e:	f000 f955 	bl	c0de9dcc <nbgl_useCaseSpinner>
c0de9b22:	4808      	ldr	r0, [pc, #32]	@ (c0de9b44 <bundleNavReviewStreamingChoice+0x38>)
c0de9b24:	4448      	add	r0, r9
c0de9b26:	6a41      	ldr	r1, [r0, #36]	@ 0x24
c0de9b28:	2001      	movs	r0, #1
c0de9b2a:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0de9b2e:	4708      	bx	r1
c0de9b30:	4804      	ldr	r0, [pc, #16]	@ (c0de9b44 <bundleNavReviewStreamingChoice+0x38>)
c0de9b32:	4448      	add	r0, r9
c0de9b34:	6a00      	ldr	r0, [r0, #32]
c0de9b36:	4906      	ldr	r1, [pc, #24]	@ (c0de9b50 <bundleNavReviewStreamingChoice+0x44>)
c0de9b38:	4479      	add	r1, pc
c0de9b3a:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0de9b3e:	f000 bf47 	b.w	c0dea9d0 <bundleNavReviewAskRejectionConfirmation>
c0de9b42:	bf00      	nop
c0de9b44:	00001ca4 	.word	0x00001ca4
c0de9b48:	000019c8 	.word	0x000019c8
c0de9b4c:	0000370a 	.word	0x0000370a
c0de9b50:	00000f95 	.word	0x00000f95

c0de9b54 <prepareReviewLastPage>:
c0de9b54:	b13b      	cbz	r3, c0de9b66 <prepareReviewLastPage+0x12>
c0de9b56:	200b      	movs	r0, #11
c0de9b58:	7308      	strb	r0, [r1, #12]
c0de9b5a:	480d      	ldr	r0, [pc, #52]	@ (c0de9b90 <prepareReviewLastPage+0x3c>)
c0de9b5c:	e9c1 3200 	strd	r3, r2, [r1]
c0de9b60:	4478      	add	r0, pc
c0de9b62:	6088      	str	r0, [r1, #8]
c0de9b64:	4770      	bx	lr
c0de9b66:	f010 0007 	ands.w	r0, r0, #7
c0de9b6a:	d004      	beq.n	c0de9b76 <prepareReviewLastPage+0x22>
c0de9b6c:	2801      	cmp	r0, #1
c0de9b6e:	d105      	bne.n	c0de9b7c <prepareReviewLastPage+0x28>
c0de9b70:	4b05      	ldr	r3, [pc, #20]	@ (c0de9b88 <prepareReviewLastPage+0x34>)
c0de9b72:	447b      	add	r3, pc
c0de9b74:	e7ef      	b.n	c0de9b56 <prepareReviewLastPage+0x2>
c0de9b76:	4b03      	ldr	r3, [pc, #12]	@ (c0de9b84 <prepareReviewLastPage+0x30>)
c0de9b78:	447b      	add	r3, pc
c0de9b7a:	e7ec      	b.n	c0de9b56 <prepareReviewLastPage+0x2>
c0de9b7c:	4b03      	ldr	r3, [pc, #12]	@ (c0de9b8c <prepareReviewLastPage+0x38>)
c0de9b7e:	447b      	add	r3, pc
c0de9b80:	e7e9      	b.n	c0de9b56 <prepareReviewLastPage+0x2>
c0de9b82:	bf00      	nop
c0de9b84:	00003904 	.word	0x00003904
c0de9b88:	000038d9 	.word	0x000038d9
c0de9b8c:	00003e4c 	.word	0x00003e4c
c0de9b90:	000036e2 	.word	0x000036e2

c0de9b94 <prepareAddressConfirmationPages>:
c0de9b94:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9b98:	b08a      	sub	sp, #40	@ 0x28
c0de9b9a:	4688      	mov	r8, r1
c0de9b9c:	4950      	ldr	r1, [pc, #320]	@ (c0de9ce0 <prepareAddressConfirmationPages+0x14c>)
c0de9b9e:	f8df a13c 	ldr.w	sl, [pc, #316]	@ c0de9cdc <prepareAddressConfirmationPages+0x148>
c0de9ba2:	4693      	mov	fp, r2
c0de9ba4:	4479      	add	r1, pc
c0de9ba6:	f849 100a 	str.w	r1, [r9, sl]
c0de9baa:	494e      	ldr	r1, [pc, #312]	@ (c0de9ce4 <prepareAddressConfirmationPages+0x150>)
c0de9bac:	4479      	add	r1, pc
c0de9bae:	6191      	str	r1, [r2, #24]
c0de9bb0:	2106      	movs	r1, #6
c0de9bb2:	7011      	strb	r1, [r2, #0]
c0de9bb4:	2201      	movs	r2, #1
c0de9bb6:	eb09 010a 	add.w	r1, r9, sl
c0de9bba:	f1b8 0f00 	cmp.w	r8, #0
c0de9bbe:	f881 2034 	strb.w	r2, [r1, #52]	@ 0x34
c0de9bc2:	6048      	str	r0, [r1, #4]
c0de9bc4:	d01f      	beq.n	c0de9c06 <prepareAddressConfirmationPages+0x72>
c0de9bc6:	f898 2008 	ldrb.w	r2, [r8, #8]
c0de9bca:	2a02      	cmp	r2, #2
c0de9bcc:	d81b      	bhi.n	c0de9c06 <prepareAddressConfirmationPages+0x72>
c0de9bce:	2001      	movs	r0, #1
c0de9bd0:	2100      	movs	r1, #0
c0de9bd2:	f04f 0c00 	mov.w	ip, #0
c0de9bd6:	9303      	str	r3, [sp, #12]
c0de9bd8:	4594      	cmp	ip, r2
c0de9bda:	d219      	bcs.n	c0de9c10 <prepareAddressConfirmationPages+0x7c>
c0de9bdc:	f8d8 0000 	ldr.w	r0, [r8]
c0de9be0:	eb09 030a 	add.w	r3, r9, sl
c0de9be4:	f10c 0c01 	add.w	ip, ip, #1
c0de9be8:	185c      	adds	r4, r3, r1
c0de9bea:	4408      	add	r0, r1
c0de9bec:	3410      	adds	r4, #16
c0de9bee:	3110      	adds	r1, #16
c0de9bf0:	e890 00e4 	ldmia.w	r0, {r2, r5, r6, r7}
c0de9bf4:	c4e4      	stmia	r4!, {r2, r5, r6, r7}
c0de9bf6:	f893 0034 	ldrb.w	r0, [r3, #52]	@ 0x34
c0de9bfa:	3001      	adds	r0, #1
c0de9bfc:	f883 0034 	strb.w	r0, [r3, #52]	@ 0x34
c0de9c00:	f898 2008 	ldrb.w	r2, [r8, #8]
c0de9c04:	e7e8      	b.n	c0de9bd8 <prepareAddressConfirmationPages+0x44>
c0de9c06:	2000      	movs	r0, #0
c0de9c08:	f8cb 001c 	str.w	r0, [fp, #28]
c0de9c0c:	2001      	movs	r0, #1
c0de9c0e:	e01c      	b.n	c0de9c4a <prepareAddressConfirmationPages+0xb6>
c0de9c10:	46c4      	mov	ip, r8
c0de9c12:	a905      	add	r1, sp, #20
c0de9c14:	e89c 00f4 	ldmia.w	ip, {r2, r4, r5, r6, r7}
c0de9c18:	460b      	mov	r3, r1
c0de9c1a:	c3f4      	stmia	r3!, {r2, r4, r5, r6, r7}
c0de9c1c:	f10d 0213 	add.w	r2, sp, #19
c0de9c20:	b2c7      	uxtb	r7, r0
c0de9c22:	eb09 040a 	add.w	r4, r9, sl
c0de9c26:	f88d 001c 	strb.w	r0, [sp, #28]
c0de9c2a:	2301      	movs	r3, #1
c0de9c2c:	9202      	str	r2, [sp, #8]
c0de9c2e:	4638      	mov	r0, r7
c0de9c30:	2200      	movs	r2, #0
c0de9c32:	9405      	str	r4, [sp, #20]
c0de9c34:	e9cd 3300 	strd	r3, r3, [sp]
c0de9c38:	2300      	movs	r3, #0
c0de9c3a:	f7fe fb6e 	bl	c0de831a <getNbTagValuesInPage>
c0de9c3e:	4287      	cmp	r7, r0
c0de9c40:	bf88      	it	hi
c0de9c42:	2001      	movhi	r0, #1
c0de9c44:	9b03      	ldr	r3, [sp, #12]
c0de9c46:	f884 0034 	strb.w	r0, [r4, #52]	@ 0x34
c0de9c4a:	f640 1107 	movw	r1, #2311	@ 0x907
c0de9c4e:	f88b 000c 	strb.w	r0, [fp, #12]
c0de9c52:	f8ab 1020 	strh.w	r1, [fp, #32]
c0de9c56:	2100      	movs	r1, #0
c0de9c58:	f1b8 0f00 	cmp.w	r8, #0
c0de9c5c:	f8ab 1010 	strh.w	r1, [fp, #16]
c0de9c60:	f88b 100e 	strb.w	r1, [fp, #14]
c0de9c64:	eb09 010a 	add.w	r1, r9, sl
c0de9c68:	f8cb 1004 	str.w	r1, [fp, #4]
c0de9c6c:	d003      	beq.n	c0de9c76 <prepareAddressConfirmationPages+0xe2>
c0de9c6e:	f898 1008 	ldrb.w	r1, [r8, #8]
c0de9c72:	4288      	cmp	r0, r1
c0de9c74:	d907      	bls.n	c0de9c86 <prepareAddressConfirmationPages+0xf2>
c0de9c76:	200b      	movs	r0, #11
c0de9c78:	f88b 002c 	strb.w	r0, [fp, #44]	@ 0x2c
c0de9c7c:	481c      	ldr	r0, [pc, #112]	@ (c0de9cf0 <prepareAddressConfirmationPages+0x15c>)
c0de9c7e:	4478      	add	r0, pc
c0de9c80:	f8cb 0024 	str.w	r0, [fp, #36]	@ 0x24
c0de9c84:	e027      	b.n	c0de9cd6 <prepareAddressConfirmationPages+0x142>
c0de9c86:	2000      	movs	r0, #0
c0de9c88:	f8cb 0024 	str.w	r0, [fp, #36]	@ 0x24
c0de9c8c:	4916      	ldr	r1, [pc, #88]	@ (c0de9ce8 <prepareAddressConfirmationPages+0x154>)
c0de9c8e:	4479      	add	r1, pc
c0de9c90:	f8cb 101c 	str.w	r1, [fp, #28]
c0de9c94:	210b      	movs	r1, #11
c0de9c96:	f883 102c 	strb.w	r1, [r3, #44]	@ 0x2c
c0de9c9a:	2106      	movs	r1, #6
c0de9c9c:	7019      	strb	r1, [r3, #0]
c0de9c9e:	2109      	movs	r1, #9
c0de9ca0:	f883 1021 	strb.w	r1, [r3, #33]	@ 0x21
c0de9ca4:	4911      	ldr	r1, [pc, #68]	@ (c0de9cec <prepareAddressConfirmationPages+0x158>)
c0de9ca6:	e9c3 0006 	strd	r0, r0, [r3, #24]
c0de9caa:	1d18      	adds	r0, r3, #4
c0de9cac:	4479      	add	r1, pc
c0de9cae:	6259      	str	r1, [r3, #36]	@ 0x24
c0de9cb0:	4641      	mov	r1, r8
c0de9cb2:	e891 00f4 	ldmia.w	r1, {r2, r4, r5, r6, r7}
c0de9cb6:	c0f4      	stmia	r0!, {r2, r4, r5, r6, r7}
c0de9cb8:	eb09 000a 	add.w	r0, r9, sl
c0de9cbc:	f898 1008 	ldrb.w	r1, [r8, #8]
c0de9cc0:	f890 0034 	ldrb.w	r0, [r0, #52]	@ 0x34
c0de9cc4:	1a09      	subs	r1, r1, r0
c0de9cc6:	3101      	adds	r1, #1
c0de9cc8:	7319      	strb	r1, [r3, #12]
c0de9cca:	f8d8 1000 	ldr.w	r1, [r8]
c0de9cce:	eb01 1000 	add.w	r0, r1, r0, lsl #4
c0de9cd2:	3810      	subs	r0, #16
c0de9cd4:	6058      	str	r0, [r3, #4]
c0de9cd6:	b00a      	add	sp, #40	@ 0x28
c0de9cd8:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de9cdc:	00001a70 	.word	0x00001a70
c0de9ce0:	00003c75 	.word	0x00003c75
c0de9ce4:	00003355 	.word	0x00003355
c0de9ce8:	00003633 	.word	0x00003633
c0de9cec:	00003e7b 	.word	0x00003e7b
c0de9cf0:	00003ea9 	.word	0x00003ea9

c0de9cf4 <nbgl_useCaseAddressReview>:
c0de9cf4:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de9cf8:	4e2d      	ldr	r6, [pc, #180]	@ (c0de9db0 <nbgl_useCaseAddressReview+0xbc>)
c0de9cfa:	9301      	str	r3, [sp, #4]
c0de9cfc:	4617      	mov	r7, r2
c0de9cfe:	e9cd 0102 	strd	r0, r1, [sp, #8]
c0de9d02:	eb09 0406 	add.w	r4, r9, r6
c0de9d06:	f7fe fcfb 	bl	c0de8700 <reset_callbacks_and_context>
c0de9d0a:	6b20      	ldr	r0, [r4, #48]	@ 0x30
c0de9d0c:	e9dd 540c 	ldrd	r5, r4, [sp, #48]	@ 0x30
c0de9d10:	b108      	cbz	r0, c0de9d16 <nbgl_useCaseAddressReview+0x22>
c0de9d12:	f7fd f9cf 	bl	c0de70b4 <nbgl_layoutRelease>
c0de9d16:	eb09 0006 	add.w	r0, r9, r6
c0de9d1a:	2138      	movs	r1, #56	@ 0x38
c0de9d1c:	f002 f8bc 	bl	c0debe98 <__aeabi_memclr>
c0de9d20:	4824      	ldr	r0, [pc, #144]	@ (c0de9db4 <nbgl_useCaseAddressReview+0xc0>)
c0de9d22:	2602      	movs	r6, #2
c0de9d24:	f04f 0a00 	mov.w	sl, #0
c0de9d28:	f8df b094 	ldr.w	fp, [pc, #148]	@ c0de9dc0 <nbgl_useCaseAddressReview+0xcc>
c0de9d2c:	21a8      	movs	r1, #168	@ 0xa8
c0de9d2e:	f809 6000 	strb.w	r6, [r9, r0]
c0de9d32:	4448      	add	r0, r9
c0de9d34:	6184      	str	r4, [r0, #24]
c0de9d36:	f8c0 a010 	str.w	sl, [r0, #16]
c0de9d3a:	481f      	ldr	r0, [pc, #124]	@ (c0de9db8 <nbgl_useCaseAddressReview+0xc4>)
c0de9d3c:	eb09 040b 	add.w	r4, r9, fp
c0de9d40:	4448      	add	r0, r9
c0de9d42:	6206      	str	r6, [r0, #32]
c0de9d44:	481d      	ldr	r0, [pc, #116]	@ (c0de9dbc <nbgl_useCaseAddressReview+0xc8>)
c0de9d46:	eb09 0800 	add.w	r8, r9, r0
c0de9d4a:	4620      	mov	r0, r4
c0de9d4c:	f8c8 4008 	str.w	r4, [r8, #8]
c0de9d50:	f002 f8a2 	bl	c0debe98 <__aeabi_memclr>
c0de9d54:	2001      	movs	r0, #1
c0de9d56:	60a7      	str	r7, [r4, #8]
c0de9d58:	f884 a026 	strb.w	sl, [r4, #38]	@ 0x26
c0de9d5c:	f104 0238 	add.w	r2, r4, #56	@ 0x38
c0de9d60:	f104 0370 	add.w	r3, r4, #112	@ 0x70
c0de9d64:	f809 000b 	strb.w	r0, [r9, fp]
c0de9d68:	4816      	ldr	r0, [pc, #88]	@ (c0de9dc4 <nbgl_useCaseAddressReview+0xd0>)
c0de9d6a:	9901      	ldr	r1, [sp, #4]
c0de9d6c:	4478      	add	r0, pc
c0de9d6e:	e9c4 1a05 	strd	r1, sl, [r4, #20]
c0de9d72:	e9c4 5007 	strd	r5, r0, [r4, #28]
c0de9d76:	e9dd 0102 	ldrd	r0, r1, [sp, #8]
c0de9d7a:	f7ff ff0b 	bl	c0de9b94 <prepareAddressConfirmationPages>
c0de9d7e:	f894 0070 	ldrb.w	r0, [r4, #112]	@ 0x70
c0de9d82:	2806      	cmp	r0, #6
c0de9d84:	bf08      	it	eq
c0de9d86:	2603      	moveq	r6, #3
c0de9d88:	f888 600c 	strb.w	r6, [r8, #12]
c0de9d8c:	f000 fec2 	bl	c0deab14 <OUTLINED_FUNCTION_5>
c0de9d90:	4a0d      	ldr	r2, [pc, #52]	@ (c0de9dc8 <nbgl_useCaseAddressReview+0xd4>)
c0de9d92:	4601      	mov	r1, r0
c0de9d94:	2001      	movs	r0, #1
c0de9d96:	447a      	add	r2, pc
c0de9d98:	f7fe fcc8 	bl	c0de872c <prepareNavInfo>
c0de9d9c:	f000 febd 	bl	c0deab1a <OUTLINED_FUNCTION_6>
c0de9da0:	2000      	movs	r0, #0
c0de9da2:	2101      	movs	r1, #1
c0de9da4:	b004      	add	sp, #16
c0de9da6:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9daa:	f7fe be41 	b.w	c0de8a30 <displayGenericContextPage>
c0de9dae:	bf00      	nop
c0de9db0:	00001a70 	.word	0x00001a70
c0de9db4:	00001c28 	.word	0x00001c28
c0de9db8:	00001ca4 	.word	0x00001ca4
c0de9dbc:	0000195c 	.word	0x0000195c
c0de9dc0:	000019c8 	.word	0x000019c8
c0de9dc4:	000035c4 	.word	0x000035c4
c0de9dc8:	0000383f 	.word	0x0000383f

c0de9dcc <nbgl_useCaseSpinner>:
c0de9dcc:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de9dce:	b087      	sub	sp, #28
c0de9dd0:	4e1f      	ldr	r6, [pc, #124]	@ (c0de9e50 <nbgl_useCaseSpinner+0x84>)
c0de9dd2:	4604      	mov	r4, r0
c0de9dd4:	f819 0006 	ldrb.w	r0, [r9, r6]
c0de9dd8:	2801      	cmp	r0, #1
c0de9dda:	d114      	bne.n	c0de9e06 <nbgl_useCaseSpinner+0x3a>
c0de9ddc:	eb09 0006 	add.w	r0, r9, r6
c0de9de0:	7841      	ldrb	r1, [r0, #1]
c0de9de2:	3101      	adds	r1, #1
c0de9de4:	b2ca      	uxtb	r2, r1
c0de9de6:	3a04      	subs	r2, #4
c0de9de8:	bf18      	it	ne
c0de9dea:	460a      	movne	r2, r1
c0de9dec:	7042      	strb	r2, [r0, #1]
c0de9dee:	6b00      	ldr	r0, [r0, #48]	@ 0x30
c0de9df0:	b2d3      	uxtb	r3, r2
c0de9df2:	4621      	mov	r1, r4
c0de9df4:	2200      	movs	r2, #0
c0de9df6:	f7fd f88b 	bl	c0de6f10 <nbgl_layoutUpdateSpinner>
c0de9dfa:	2802      	cmp	r0, #2
c0de9dfc:	d022      	beq.n	c0de9e44 <nbgl_useCaseSpinner+0x78>
c0de9dfe:	2801      	cmp	r0, #1
c0de9e00:	d11e      	bne.n	c0de9e40 <nbgl_useCaseSpinner+0x74>
c0de9e02:	2004      	movs	r0, #4
c0de9e04:	e01f      	b.n	c0de9e46 <nbgl_useCaseSpinner+0x7a>
c0de9e06:	eb09 0506 	add.w	r5, r9, r6
c0de9e0a:	216c      	movs	r1, #108	@ 0x6c
c0de9e0c:	4628      	mov	r0, r5
c0de9e0e:	f002 f843 	bl	c0debe98 <__aeabi_memclr>
c0de9e12:	2701      	movs	r7, #1
c0de9e14:	211c      	movs	r1, #28
c0de9e16:	f809 7006 	strb.w	r7, [r9, r6]
c0de9e1a:	466e      	mov	r6, sp
c0de9e1c:	f000 fe94 	bl	c0deab48 <OUTLINED_FUNCTION_13>
c0de9e20:	4630      	mov	r0, r6
c0de9e22:	f88d 7001 	strb.w	r7, [sp, #1]
c0de9e26:	f7f9 ff1d 	bl	c0de3c64 <nbgl_layoutGet>
c0de9e2a:	786b      	ldrb	r3, [r5, #1]
c0de9e2c:	4621      	mov	r1, r4
c0de9e2e:	2200      	movs	r2, #0
c0de9e30:	6328      	str	r0, [r5, #48]	@ 0x30
c0de9e32:	f7fc ff0d 	bl	c0de6c50 <nbgl_layoutAddSpinner>
c0de9e36:	6b28      	ldr	r0, [r5, #48]	@ 0x30
c0de9e38:	f7fd f90e 	bl	c0de7058 <nbgl_layoutDraw>
c0de9e3c:	f000 fe5e 	bl	c0deaafc <OUTLINED_FUNCTION_3>
c0de9e40:	b007      	add	sp, #28
c0de9e42:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de9e44:	2001      	movs	r0, #1
c0de9e46:	b007      	add	sp, #28
c0de9e48:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de9e4c:	f001 bb04 	b.w	c0deb458 <nbgl_refreshSpecial>
c0de9e50:	0000195c 	.word	0x0000195c

c0de9e54 <getContentAtIdx>:
c0de9e54:	b570      	push	{r4, r5, r6, lr}
c0de9e56:	4605      	mov	r5, r0
c0de9e58:	2000      	movs	r0, #0
c0de9e5a:	2d00      	cmp	r5, #0
c0de9e5c:	d415      	bmi.n	c0de9e8a <getContentAtIdx+0x36>
c0de9e5e:	4e11      	ldr	r6, [pc, #68]	@ (c0de9ea4 <getContentAtIdx+0x50>)
c0de9e60:	460c      	mov	r4, r1
c0de9e62:	eb09 0106 	add.w	r1, r9, r6
c0de9e66:	7b09      	ldrb	r1, [r1, #12]
c0de9e68:	428d      	cmp	r5, r1
c0de9e6a:	da0e      	bge.n	c0de9e8a <getContentAtIdx+0x36>
c0de9e6c:	eb09 0006 	add.w	r0, r9, r6
c0de9e70:	7900      	ldrb	r0, [r0, #4]
c0de9e72:	b158      	cbz	r0, c0de9e8c <getContentAtIdx+0x38>
c0de9e74:	4620      	mov	r0, r4
c0de9e76:	2138      	movs	r1, #56	@ 0x38
c0de9e78:	f002 f80e 	bl	c0debe98 <__aeabi_memclr>
c0de9e7c:	eb09 0006 	add.w	r0, r9, r6
c0de9e80:	4621      	mov	r1, r4
c0de9e82:	6882      	ldr	r2, [r0, #8]
c0de9e84:	b2e8      	uxtb	r0, r5
c0de9e86:	4790      	blx	r2
c0de9e88:	4620      	mov	r0, r4
c0de9e8a:	bd70      	pop	{r4, r5, r6, pc}
c0de9e8c:	eb09 0006 	add.w	r0, r9, r6
c0de9e90:	ebc5 01c5 	rsb	r1, r5, r5, lsl #3
c0de9e94:	6880      	ldr	r0, [r0, #8]
c0de9e96:	eb00 00c1 	add.w	r0, r0, r1, lsl #3
c0de9e9a:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de9e9e:	f001 bcf3 	b.w	c0deb888 <pic>
c0de9ea2:	bf00      	nop
c0de9ea4:	0000195c 	.word	0x0000195c

c0de9ea8 <getContentNbElement>:
c0de9ea8:	7801      	ldrb	r1, [r0, #0]
c0de9eaa:	290a      	cmp	r1, #10
c0de9eac:	d00b      	beq.n	c0de9ec6 <getContentNbElement+0x1e>
c0de9eae:	2906      	cmp	r1, #6
c0de9eb0:	d009      	beq.n	c0de9ec6 <getContentNbElement+0x1e>
c0de9eb2:	2907      	cmp	r1, #7
c0de9eb4:	d009      	beq.n	c0de9eca <getContentNbElement+0x22>
c0de9eb6:	2908      	cmp	r1, #8
c0de9eb8:	d009      	beq.n	c0de9ece <getContentNbElement+0x26>
c0de9eba:	2909      	cmp	r1, #9
c0de9ebc:	d009      	beq.n	c0de9ed2 <getContentNbElement+0x2a>
c0de9ebe:	2904      	cmp	r1, #4
c0de9ec0:	bf1c      	itt	ne
c0de9ec2:	2001      	movne	r0, #1
c0de9ec4:	4770      	bxne	lr
c0de9ec6:	7b00      	ldrb	r0, [r0, #12]
c0de9ec8:	4770      	bx	lr
c0de9eca:	7a00      	ldrb	r0, [r0, #8]
c0de9ecc:	4770      	bx	lr
c0de9ece:	7c00      	ldrb	r0, [r0, #16]
c0de9ed0:	4770      	bx	lr
c0de9ed2:	7a40      	ldrb	r0, [r0, #9]
c0de9ed4:	4770      	bx	lr
	...

c0de9ed8 <genericContextComputeNextPageParams>:
c0de9ed8:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de9edc:	f8df 810c 	ldr.w	r8, [pc, #268]	@ c0de9fec <genericContextComputeNextPageParams+0x114>
c0de9ee0:	4682      	mov	sl, r0
c0de9ee2:	4616      	mov	r6, r2
c0de9ee4:	460d      	mov	r5, r1
c0de9ee6:	f10d 0107 	add.w	r1, sp, #7
c0de9eea:	461a      	mov	r2, r3
c0de9eec:	eb09 0008 	add.w	r0, r9, r8
c0de9ef0:	7c04      	ldrb	r4, [r0, #16]
c0de9ef2:	7c87      	ldrb	r7, [r0, #18]
c0de9ef4:	4650      	mov	r0, sl
c0de9ef6:	f000 f881 	bl	c0de9ffc <genericContextGetPageInfo>
c0de9efa:	f89d 0007 	ldrb.w	r0, [sp, #7]
c0de9efe:	f8df b0f0 	ldr.w	fp, [pc, #240]	@ c0de9ff0 <genericContextComputeNextPageParams+0x118>
c0de9f02:	7030      	strb	r0, [r6, #0]
c0de9f04:	eb09 010b 	add.w	r1, r9, fp
c0de9f08:	f891 1060 	ldrb.w	r1, [r1, #96]	@ 0x60
c0de9f0c:	4551      	cmp	r1, sl
c0de9f0e:	d219      	bcs.n	c0de9f44 <genericContextComputeNextPageParams+0x6c>
c0de9f10:	4b38      	ldr	r3, [pc, #224]	@ (c0de9ff4 <genericContextComputeNextPageParams+0x11c>)
c0de9f12:	084e      	lsrs	r6, r1, #1
c0de9f14:	2204      	movs	r2, #4
c0de9f16:	ea02 0281 	and.w	r2, r2, r1, lsl #2
c0de9f1a:	444b      	add	r3, r9
c0de9f1c:	5d9b      	ldrb	r3, [r3, r6]
c0de9f1e:	fa23 f202 	lsr.w	r2, r3, r2
c0de9f22:	2300      	movs	r3, #0
c0de9f24:	f002 0207 	and.w	r2, r2, #7
c0de9f28:	4417      	add	r7, r2
c0de9f2a:	eb09 0208 	add.w	r2, r9, r8
c0de9f2e:	7c52      	ldrb	r2, [r2, #17]
c0de9f30:	4297      	cmp	r7, r2
c0de9f32:	bf28      	it	cs
c0de9f34:	2301      	movcs	r3, #1
c0de9f36:	2a00      	cmp	r2, #0
c0de9f38:	bf18      	it	ne
c0de9f3a:	2201      	movne	r2, #1
c0de9f3c:	401a      	ands	r2, r3
c0de9f3e:	bf18      	it	ne
c0de9f40:	2700      	movne	r7, #0
c0de9f42:	4414      	add	r4, r2
c0de9f44:	4551      	cmp	r1, sl
c0de9f46:	d905      	bls.n	c0de9f54 <genericContextComputeNextPageParams+0x7c>
c0de9f48:	1a3f      	subs	r7, r7, r0
c0de9f4a:	f1b7 3fff 	cmp.w	r7, #4294967295	@ 0xffffffff
c0de9f4e:	bfdc      	itt	le
c0de9f50:	4247      	negle	r7, r0
c0de9f52:	3c01      	suble	r4, #1
c0de9f54:	b2e6      	uxtb	r6, r4
c0de9f56:	2eff      	cmp	r6, #255	@ 0xff
c0de9f58:	d014      	beq.n	c0de9f84 <genericContextComputeNextPageParams+0xac>
c0de9f5a:	eb09 0108 	add.w	r1, r9, r8
c0de9f5e:	b260      	sxtb	r0, r4
c0de9f60:	7b09      	ldrb	r1, [r1, #12]
c0de9f62:	4288      	cmp	r0, r1
c0de9f64:	d108      	bne.n	c0de9f78 <genericContextComputeNextPageParams+0xa0>
c0de9f66:	eb09 0108 	add.w	r1, r9, r8
c0de9f6a:	7d09      	ldrb	r1, [r1, #20]
c0de9f6c:	b121      	cbz	r1, c0de9f78 <genericContextComputeNextPageParams+0xa0>
c0de9f6e:	4822      	ldr	r0, [pc, #136]	@ (c0de9ff8 <genericContextComputeNextPageParams+0x120>)
c0de9f70:	4448      	add	r0, r9
c0de9f72:	f100 0538 	add.w	r5, r0, #56	@ 0x38
c0de9f76:	e00d      	b.n	c0de9f94 <genericContextComputeNextPageParams+0xbc>
c0de9f78:	4629      	mov	r1, r5
c0de9f7a:	f7ff ff6b 	bl	c0de9e54 <getContentAtIdx>
c0de9f7e:	4605      	mov	r5, r0
c0de9f80:	b940      	cbnz	r0, c0de9f94 <genericContextComputeNextPageParams+0xbc>
c0de9f82:	e02e      	b.n	c0de9fe2 <genericContextComputeNextPageParams+0x10a>
c0de9f84:	eb09 0008 	add.w	r0, r9, r8
c0de9f88:	7cc0      	ldrb	r0, [r0, #19]
c0de9f8a:	2800      	cmp	r0, #0
c0de9f8c:	d0e5      	beq.n	c0de9f5a <genericContextComputeNextPageParams+0x82>
c0de9f8e:	481a      	ldr	r0, [pc, #104]	@ (c0de9ff8 <genericContextComputeNextPageParams+0x120>)
c0de9f90:	eb09 0500 	add.w	r5, r9, r0
c0de9f94:	eb09 0008 	add.w	r0, r9, r8
c0de9f98:	7c00      	ldrb	r0, [r0, #16]
c0de9f9a:	4286      	cmp	r6, r0
c0de9f9c:	d103      	bne.n	c0de9fa6 <genericContextComputeNextPageParams+0xce>
c0de9f9e:	eb09 0008 	add.w	r0, r9, r8
c0de9fa2:	7c40      	ldrb	r0, [r0, #17]
c0de9fa4:	b988      	cbnz	r0, c0de9fca <genericContextComputeNextPageParams+0xf2>
c0de9fa6:	eb09 0608 	add.w	r6, r9, r8
c0de9faa:	4628      	mov	r0, r5
c0de9fac:	7434      	strb	r4, [r6, #16]
c0de9fae:	f7ff ff7b 	bl	c0de9ea8 <getContentNbElement>
c0de9fb2:	7470      	strb	r0, [r6, #17]
c0de9fb4:	6b68      	ldr	r0, [r5, #52]	@ 0x34
c0de9fb6:	eb09 040b 	add.w	r4, r9, fp
c0de9fba:	f001 fc65 	bl	c0deb888 <pic>
c0de9fbe:	62e0      	str	r0, [r4, #44]	@ 0x2c
c0de9fc0:	7c70      	ldrb	r0, [r6, #17]
c0de9fc2:	f1b7 3fff 	cmp.w	r7, #4294967295	@ 0xffffffff
c0de9fc6:	dc02      	bgt.n	c0de9fce <genericContextComputeNextPageParams+0xf6>
c0de9fc8:	4407      	add	r7, r0
c0de9fca:	2f00      	cmp	r7, #0
c0de9fcc:	d409      	bmi.n	c0de9fe2 <genericContextComputeNextPageParams+0x10a>
c0de9fce:	4287      	cmp	r7, r0
c0de9fd0:	d207      	bcs.n	c0de9fe2 <genericContextComputeNextPageParams+0x10a>
c0de9fd2:	eb09 000b 	add.w	r0, r9, fp
c0de9fd6:	f880 a060 	strb.w	sl, [r0, #96]	@ 0x60
c0de9fda:	eb09 0008 	add.w	r0, r9, r8
c0de9fde:	7487      	strb	r7, [r0, #18]
c0de9fe0:	e000      	b.n	c0de9fe4 <genericContextComputeNextPageParams+0x10c>
c0de9fe2:	2500      	movs	r5, #0
c0de9fe4:	4628      	mov	r0, r5
c0de9fe6:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de9fea:	bf00      	nop
c0de9fec:	0000195c 	.word	0x0000195c
c0de9ff0:	00001c28 	.word	0x00001c28
c0de9ff4:	00001b28 	.word	0x00001b28
c0de9ff8:	000019c8 	.word	0x000019c8

c0de9ffc <genericContextGetPageInfo>:
c0de9ffc:	b510      	push	{r4, lr}
c0de9ffe:	4c08      	ldr	r4, [pc, #32]	@ (c0dea020 <genericContextGetPageInfo+0x24>)
c0dea000:	2304      	movs	r3, #4
c0dea002:	ea03 0380 	and.w	r3, r3, r0, lsl #2
c0dea006:	0840      	lsrs	r0, r0, #1
c0dea008:	444c      	add	r4, r9
c0dea00a:	5c20      	ldrb	r0, [r4, r0]
c0dea00c:	40d8      	lsrs	r0, r3
c0dea00e:	b111      	cbz	r1, c0dea016 <genericContextGetPageInfo+0x1a>
c0dea010:	f000 0307 	and.w	r3, r0, #7
c0dea014:	700b      	strb	r3, [r1, #0]
c0dea016:	b112      	cbz	r2, c0dea01e <genericContextGetPageInfo+0x22>
c0dea018:	f3c0 00c0 	ubfx	r0, r0, #3, #1
c0dea01c:	7010      	strb	r0, [r2, #0]
c0dea01e:	bd10      	pop	{r4, pc}
c0dea020:	00001b28 	.word	0x00001b28

c0dea024 <bundleNavStartSettings>:
c0dea024:	2000      	movs	r0, #0
c0dea026:	f7fe bf3f 	b.w	c0de8ea8 <bundleNavStartSettingsAtPage>
	...

c0dea02c <displayFullValuePage>:
c0dea02c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dea030:	b092      	sub	sp, #72	@ 0x48
c0dea032:	460d      	mov	r5, r1
c0dea034:	68d1      	ldr	r1, [r2, #12]
c0dea036:	4614      	mov	r4, r2
c0dea038:	b101      	cbz	r1, c0dea03c <displayFullValuePage+0x10>
c0dea03a:	4608      	mov	r0, r1
c0dea03c:	f001 fc24 	bl	c0deb888 <pic>
c0dea040:	4606      	mov	r6, r0
c0dea042:	7d20      	ldrb	r0, [r4, #20]
c0dea044:	2805      	cmp	r0, #5
c0dea046:	d00d      	beq.n	c0dea064 <displayFullValuePage+0x38>
c0dea048:	2804      	cmp	r0, #4
c0dea04a:	d170      	bne.n	c0dea12e <displayFullValuePage+0x102>
c0dea04c:	4861      	ldr	r0, [pc, #388]	@ (c0dea1d4 <displayFullValuePage+0x1a8>)
c0dea04e:	6921      	ldr	r1, [r4, #16]
c0dea050:	2201      	movs	r2, #1
c0dea052:	4448      	add	r0, r9
c0dea054:	6341      	str	r1, [r0, #52]	@ 0x34
c0dea056:	4630      	mov	r0, r6
c0dea058:	6921      	ldr	r1, [r4, #16]
c0dea05a:	b012      	add	sp, #72	@ 0x48
c0dea05c:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dea060:	f000 ba48 	b.w	c0dea4f4 <displayInfosListModal>
c0dea064:	485b      	ldr	r0, [pc, #364]	@ (c0dea1d4 <displayFullValuePage+0x1a8>)
c0dea066:	6921      	ldr	r1, [r4, #16]
c0dea068:	2200      	movs	r2, #0
c0dea06a:	4448      	add	r0, r9
c0dea06c:	6381      	str	r1, [r0, #56]	@ 0x38
c0dea06e:	485a      	ldr	r0, [pc, #360]	@ (c0dea1d8 <displayFullValuePage+0x1ac>)
c0dea070:	2100      	movs	r1, #0
c0dea072:	6927      	ldr	r7, [r4, #16]
c0dea074:	9102      	str	r1, [sp, #8]
c0dea076:	4448      	add	r0, r9
c0dea078:	e9c0 220c 	strd	r2, r2, [r0, #48]	@ 0x30
c0dea07c:	6382      	str	r2, [r0, #56]	@ 0x38
c0dea07e:	63c2      	str	r2, [r0, #60]	@ 0x3c
c0dea080:	7a3d      	ldrb	r5, [r7, #8]
c0dea082:	0628      	lsls	r0, r5, #24
c0dea084:	f000 8087 	beq.w	c0dea196 <displayFullValuePage+0x16a>
c0dea088:	9501      	str	r5, [sp, #4]
c0dea08a:	fa5f fb85 	uxtb.w	fp, r5
c0dea08e:	f04f 0800 	mov.w	r8, #0
c0dea092:	2600      	movs	r6, #0
c0dea094:	9802      	ldr	r0, [sp, #8]
c0dea096:	b2c0      	uxtb	r0, r0
c0dea098:	ea4f 1a00 	mov.w	sl, r0, lsl #4
c0dea09c:	45c3      	cmp	fp, r8
c0dea09e:	d027      	beq.n	c0dea0f0 <displayFullValuePage+0xc4>
c0dea0a0:	f1b8 0f00 	cmp.w	r8, #0
c0dea0a4:	bf18      	it	ne
c0dea0a6:	3618      	addne	r6, #24
c0dea0a8:	6838      	ldr	r0, [r7, #0]
c0dea0aa:	b108      	cbz	r0, c0dea0b0 <displayFullValuePage+0x84>
c0dea0ac:	4450      	add	r0, sl
c0dea0ae:	e004      	b.n	c0dea0ba <displayFullValuePage+0x8e>
c0dea0b0:	9802      	ldr	r0, [sp, #8]
c0dea0b2:	6879      	ldr	r1, [r7, #4]
c0dea0b4:	4440      	add	r0, r8
c0dea0b6:	b2c0      	uxtb	r0, r0
c0dea0b8:	4788      	blx	r1
c0dea0ba:	f001 fbe5 	bl	c0deb888 <pic>
c0dea0be:	7b7b      	ldrb	r3, [r7, #13]
c0dea0c0:	6801      	ldr	r1, [r0, #0]
c0dea0c2:	4604      	mov	r4, r0
c0dea0c4:	f000 fd3b 	bl	c0deab3e <OUTLINED_FUNCTION_12>
c0dea0c8:	6861      	ldr	r1, [r4, #4]
c0dea0ca:	7b7b      	ldrb	r3, [r7, #13]
c0dea0cc:	4605      	mov	r5, r0
c0dea0ce:	f000 fd36 	bl	c0deab3e <OUTLINED_FUNCTION_12>
c0dea0d2:	1971      	adds	r1, r6, r5
c0dea0d4:	f10a 0a10 	add.w	sl, sl, #16
c0dea0d8:	f108 0801 	add.w	r8, r8, #1
c0dea0dc:	4408      	add	r0, r1
c0dea0de:	1d06      	adds	r6, r0, #4
c0dea0e0:	b2b0      	uxth	r0, r6
c0dea0e2:	f5b0 7fe8 	cmp.w	r0, #464	@ 0x1d0
c0dea0e6:	d3d9      	bcc.n	c0dea09c <displayFullValuePage+0x70>
c0dea0e8:	9d01      	ldr	r5, [sp, #4]
c0dea0ea:	f1a8 0001 	sub.w	r0, r8, #1
c0dea0ee:	e001      	b.n	c0dea0f4 <displayFullValuePage+0xc8>
c0dea0f0:	9d01      	ldr	r5, [sp, #4]
c0dea0f2:	4628      	mov	r0, r5
c0dea0f4:	4938      	ldr	r1, [pc, #224]	@ (c0dea1d8 <displayFullValuePage+0x1ac>)
c0dea0f6:	2404      	movs	r4, #4
c0dea0f8:	1a2d      	subs	r5, r5, r0
c0dea0fa:	4449      	add	r1, r9
c0dea0fc:	f891 2030 	ldrb.w	r2, [r1, #48]	@ 0x30
c0dea100:	1c53      	adds	r3, r2, #1
c0dea102:	f881 3030 	strb.w	r3, [r1, #48]	@ 0x30
c0dea106:	eb01 0152 	add.w	r1, r1, r2, lsr #1
c0dea10a:	ea04 0282 	and.w	r2, r4, r2, lsl #2
c0dea10e:	240f      	movs	r4, #15
c0dea110:	f891 3050 	ldrb.w	r3, [r1, #80]	@ 0x50
c0dea114:	4094      	lsls	r4, r2
c0dea116:	43a3      	bics	r3, r4
c0dea118:	f000 0407 	and.w	r4, r0, #7
c0dea11c:	fa04 f202 	lsl.w	r2, r4, r2
c0dea120:	431a      	orrs	r2, r3
c0dea122:	f881 2050 	strb.w	r2, [r1, #80]	@ 0x50
c0dea126:	9902      	ldr	r1, [sp, #8]
c0dea128:	4401      	add	r1, r0
c0dea12a:	9102      	str	r1, [sp, #8]
c0dea12c:	e7a9      	b.n	c0dea082 <displayFullValuePage+0x56>
c0dea12e:	af0b      	add	r7, sp, #44	@ 0x2c
c0dea130:	492a      	ldr	r1, [pc, #168]	@ (c0dea1dc <displayFullValuePage+0x1b0>)
c0dea132:	221c      	movs	r2, #28
c0dea134:	4638      	mov	r0, r7
c0dea136:	4479      	add	r1, pc
c0dea138:	f001 fea4 	bl	c0debe84 <__aeabi_memcpy>
c0dea13c:	f44f 6010 	mov.w	r0, #2304	@ 0x900
c0dea140:	f8df 8090 	ldr.w	r8, [pc, #144]	@ c0dea1d4 <displayFullValuePage+0x1a8>
c0dea144:	9609      	str	r6, [sp, #36]	@ 0x24
c0dea146:	f8ad 0028 	strh.w	r0, [sp, #40]	@ 0x28
c0dea14a:	2000      	movs	r0, #0
c0dea14c:	9008      	str	r0, [sp, #32]
c0dea14e:	2001      	movs	r0, #1
c0dea150:	eb09 0608 	add.w	r6, r9, r8
c0dea154:	f8ad 001c 	strh.w	r0, [sp, #28]
c0dea158:	4638      	mov	r0, r7
c0dea15a:	f7f9 fd83 	bl	c0de3c64 <nbgl_layoutGet>
c0dea15e:	62f0      	str	r0, [r6, #44]	@ 0x2c
c0dea160:	a907      	add	r1, sp, #28
c0dea162:	f7fc fb17 	bl	c0de6794 <nbgl_layoutAddHeader>
c0dea166:	7d20      	ldrb	r0, [r4, #20]
c0dea168:	2801      	cmp	r0, #1
c0dea16a:	d01b      	beq.n	c0dea1a4 <displayFullValuePage+0x178>
c0dea16c:	2802      	cmp	r0, #2
c0dea16e:	d01c      	beq.n	c0dea1aa <displayFullValuePage+0x17e>
c0dea170:	2803      	cmp	r0, #3
c0dea172:	d11d      	bne.n	c0dea1b0 <displayFullValuePage+0x184>
c0dea174:	f44f 3080 	mov.w	r0, #65536	@ 0x10000
c0dea178:	9006      	str	r0, [sp, #24]
c0dea17a:	cc07      	ldmia	r4!, {r0, r1, r2}
c0dea17c:	9105      	str	r1, [sp, #20]
c0dea17e:	2a00      	cmp	r2, #0
c0dea180:	9003      	str	r0, [sp, #12]
c0dea182:	bf08      	it	eq
c0dea184:	4602      	moveq	r2, r0
c0dea186:	eb09 0008 	add.w	r0, r9, r8
c0dea18a:	9204      	str	r2, [sp, #16]
c0dea18c:	6ac0      	ldr	r0, [r0, #44]	@ 0x2c
c0dea18e:	a903      	add	r1, sp, #12
c0dea190:	f7fb fea5 	bl	c0de5ede <nbgl_layoutAddQRCode>
c0dea194:	e014      	b.n	c0dea1c0 <displayFullValuePage+0x194>
c0dea196:	2000      	movs	r0, #0
c0dea198:	2101      	movs	r1, #1
c0dea19a:	b012      	add	sp, #72	@ 0x48
c0dea19c:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dea1a0:	f000 bb12 	b.w	c0dea7c8 <displayTagValueListModalPage>
c0dea1a4:	4b0e      	ldr	r3, [pc, #56]	@ (c0dea1e0 <displayFullValuePage+0x1b4>)
c0dea1a6:	447b      	add	r3, pc
c0dea1a8:	e003      	b.n	c0dea1b2 <displayFullValuePage+0x186>
c0dea1aa:	4b0e      	ldr	r3, [pc, #56]	@ (c0dea1e4 <displayFullValuePage+0x1b8>)
c0dea1ac:	447b      	add	r3, pc
c0dea1ae:	e000      	b.n	c0dea1b2 <displayFullValuePage+0x186>
c0dea1b0:	6863      	ldr	r3, [r4, #4]
c0dea1b2:	eb09 0008 	add.w	r0, r9, r8
c0dea1b6:	6822      	ldr	r2, [r4, #0]
c0dea1b8:	4629      	mov	r1, r5
c0dea1ba:	6ac0      	ldr	r0, [r0, #44]	@ 0x2c
c0dea1bc:	f7fb fa72 	bl	c0de56a4 <nbgl_layoutAddTextContent>
c0dea1c0:	eb09 0008 	add.w	r0, r9, r8
c0dea1c4:	6ac0      	ldr	r0, [r0, #44]	@ 0x2c
c0dea1c6:	f7fc ff47 	bl	c0de7058 <nbgl_layoutDraw>
c0dea1ca:	f001 f940 	bl	c0deb44e <nbgl_refresh>
c0dea1ce:	b012      	add	sp, #72	@ 0x48
c0dea1d0:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0dea1d4:	0000195c 	.word	0x0000195c
c0dea1d8:	00001c28 	.word	0x00001c28
c0dea1dc:	000050ea 	.word	0x000050ea
c0dea1e0:	000031f2 	.word	0x000031f2
c0dea1e4:	000034db 	.word	0x000034db

c0dea1e8 <displaySecurityReport>:
c0dea1e8:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dea1ec:	b09a      	sub	sp, #104	@ 0x68
c0dea1ee:	ac13      	add	r4, sp, #76	@ 0x4c
c0dea1f0:	4974      	ldr	r1, [pc, #464]	@ (c0dea3c4 <displaySecurityReport+0x1dc>)
c0dea1f2:	4605      	mov	r5, r0
c0dea1f4:	221c      	movs	r2, #28
c0dea1f6:	4620      	mov	r0, r4
c0dea1f8:	4479      	add	r1, pc
c0dea1fa:	f001 fe43 	bl	c0debe84 <__aeabi_memcpy>
c0dea1fe:	4872      	ldr	r0, [pc, #456]	@ (c0dea3c8 <displaySecurityReport+0x1e0>)
c0dea200:	a90f      	add	r1, sp, #60	@ 0x3c
c0dea202:	4478      	add	r0, pc
c0dea204:	e890 00cc 	ldmia.w	r0, {r2, r3, r6, r7}
c0dea208:	c1cc      	stmia	r1!, {r2, r3, r6, r7}
c0dea20a:	a809      	add	r0, sp, #36	@ 0x24
c0dea20c:	2118      	movs	r1, #24
c0dea20e:	f001 fe43 	bl	c0debe98 <__aeabi_memclr>
c0dea212:	f8df b1a8 	ldr.w	fp, [pc, #424]	@ c0dea3bc <displaySecurityReport+0x1d4>
c0dea216:	4620      	mov	r0, r4
c0dea218:	eb09 060b 	add.w	r6, r9, fp
c0dea21c:	f7f9 fd22 	bl	c0de3c64 <nbgl_layoutGet>
c0dea220:	4604      	mov	r4, r0
c0dea222:	6670      	str	r0, [r6, #100]	@ 0x64
c0dea224:	f896 0068 	ldrb.w	r0, [r6, #104]	@ 0x68
c0dea228:	2801      	cmp	r0, #1
c0dea22a:	d14b      	bne.n	c0dea2c4 <displaySecurityReport+0xdc>
c0dea22c:	f896 0069 	ldrb.w	r0, [r6, #105]	@ 0x69
c0dea230:	2800      	cmp	r0, #0
c0dea232:	d147      	bne.n	c0dea2c4 <displaySecurityReport+0xdc>
c0dea234:	4865      	ldr	r0, [pc, #404]	@ (c0dea3cc <displaySecurityReport+0x1e4>)
c0dea236:	2600      	movs	r6, #0
c0dea238:	466c      	mov	r4, sp
c0dea23a:	f04f 0800 	mov.w	r8, #0
c0dea23e:	4478      	add	r0, pc
c0dea240:	1d05      	adds	r5, r0, #4
c0dea242:	2e05      	cmp	r6, #5
c0dea244:	d075      	beq.n	c0dea332 <displaySecurityReport+0x14a>
c0dea246:	eb09 000b 	add.w	r0, r9, fp
c0dea24a:	f8d0 a058 	ldr.w	sl, [r0, #88]	@ 0x58
c0dea24e:	f8da 0000 	ldr.w	r0, [sl]
c0dea252:	40f0      	lsrs	r0, r6
c0dea254:	07c0      	lsls	r0, r0, #31
c0dea256:	d02b      	beq.n	c0dea2b0 <displaySecurityReport+0xc8>
c0dea258:	4620      	mov	r0, r4
c0dea25a:	2118      	movs	r1, #24
c0dea25c:	f001 fe1c 	bl	c0debe98 <__aeabi_memclr>
c0dea260:	f008 007f 	and.w	r0, r8, #127	@ 0x7f
c0dea264:	2804      	cmp	r0, #4
c0dea266:	d828      	bhi.n	c0dea2ba <displaySecurityReport+0xd2>
c0dea268:	2101      	movs	r1, #1
c0dea26a:	fa01 f000 	lsl.w	r0, r1, r0
c0dea26e:	f010 0f19 	tst.w	r0, #25
c0dea272:	d022      	beq.n	c0dea2ba <displaySecurityReport+0xd2>
c0dea274:	6868      	ldr	r0, [r5, #4]
c0dea276:	9003      	str	r0, [sp, #12]
c0dea278:	6828      	ldr	r0, [r5, #0]
c0dea27a:	2e03      	cmp	r6, #3
c0dea27c:	9001      	str	r0, [sp, #4]
c0dea27e:	d101      	bne.n	c0dea284 <displaySecurityReport+0x9c>
c0dea280:	20ff      	movs	r0, #255	@ 0xff
c0dea282:	e007      	b.n	c0dea294 <displaySecurityReport+0xac>
c0dea284:	2009      	movs	r0, #9
c0dea286:	f88d 0014 	strb.w	r0, [sp, #20]
c0dea28a:	4851      	ldr	r0, [pc, #324]	@ (c0dea3d0 <displaySecurityReport+0x1e8>)
c0dea28c:	4478      	add	r0, pc
c0dea28e:	9002      	str	r0, [sp, #8]
c0dea290:	f106 0017 	add.w	r0, r6, #23
c0dea294:	f88d 0011 	strb.w	r0, [sp, #17]
c0dea298:	f855 0c04 	ldr.w	r0, [r5, #-4]
c0dea29c:	eb09 070b 	add.w	r7, r9, fp
c0dea2a0:	4621      	mov	r1, r4
c0dea2a2:	9000      	str	r0, [sp, #0]
c0dea2a4:	6e78      	ldr	r0, [r7, #100]	@ 0x64
c0dea2a6:	f7fa fe8a 	bl	c0de4fbe <nbgl_layoutAddTouchableBar>
c0dea2aa:	6e78      	ldr	r0, [r7, #100]	@ 0x64
c0dea2ac:	f7fc f948 	bl	c0de6540 <nbgl_layoutAddSeparationLine>
c0dea2b0:	350c      	adds	r5, #12
c0dea2b2:	f108 0801 	add.w	r8, r8, #1
c0dea2b6:	3601      	adds	r6, #1
c0dea2b8:	e7c3      	b.n	c0dea242 <displaySecurityReport+0x5a>
c0dea2ba:	f8da 0010 	ldr.w	r0, [sl, #16]
c0dea2be:	2800      	cmp	r0, #0
c0dea2c0:	d1d9      	bne.n	c0dea276 <displaySecurityReport+0x8e>
c0dea2c2:	e7d7      	b.n	c0dea274 <displaySecurityReport+0x8c>
c0dea2c4:	eb09 000b 	add.w	r0, r9, fp
c0dea2c8:	6d80      	ldr	r0, [r0, #88]	@ 0x58
c0dea2ca:	b108      	cbz	r0, c0dea2d0 <displaySecurityReport+0xe8>
c0dea2cc:	68c6      	ldr	r6, [r0, #12]
c0dea2ce:	b90e      	cbnz	r6, c0dea2d4 <displaySecurityReport+0xec>
c0dea2d0:	4e40      	ldr	r6, [pc, #256]	@ (c0dea3d4 <displaySecurityReport+0x1ec>)
c0dea2d2:	447e      	add	r6, pc
c0dea2d4:	f015 0f06 	tst.w	r5, #6
c0dea2d8:	d035      	beq.n	c0dea346 <displaySecurityReport+0x15e>
c0dea2da:	f44f 3180 	mov.w	r1, #65536	@ 0x10000
c0dea2de:	9103      	str	r1, [sp, #12]
c0dea2e0:	493d      	ldr	r1, [pc, #244]	@ (c0dea3d8 <displaySecurityReport+0x1f0>)
c0dea2e2:	4479      	add	r1, pc
c0dea2e4:	9102      	str	r1, [sp, #8]
c0dea2e6:	2140      	movs	r1, #64	@ 0x40
c0dea2e8:	6883      	ldr	r3, [r0, #8]
c0dea2ea:	4835      	ldr	r0, [pc, #212]	@ (c0dea3c0 <displaySecurityReport+0x1d8>)
c0dea2ec:	4448      	add	r0, r9
c0dea2ee:	9301      	str	r3, [sp, #4]
c0dea2f0:	f100 0440 	add.w	r4, r0, #64	@ 0x40
c0dea2f4:	9400      	str	r4, [sp, #0]
c0dea2f6:	4620      	mov	r0, r4
c0dea2f8:	4a38      	ldr	r2, [pc, #224]	@ (c0dea3dc <displaySecurityReport+0x1f4>)
c0dea2fa:	447a      	add	r2, pc
c0dea2fc:	f001 f932 	bl	c0deb564 <snprintf>
c0dea300:	4620      	mov	r0, r4
c0dea302:	f001 fe35 	bl	c0debf70 <strlen>
c0dea306:	4605      	mov	r5, r0
c0dea308:	eb09 000b 	add.w	r0, r9, fp
c0dea30c:	4669      	mov	r1, sp
c0dea30e:	6e40      	ldr	r0, [r0, #100]	@ 0x64
c0dea310:	f7fb fde5 	bl	c0de5ede <nbgl_layoutAddQRCode>
c0dea314:	2018      	movs	r0, #24
c0dea316:	f1c5 013f 	rsb	r1, r5, #63	@ 0x3f
c0dea31a:	4633      	mov	r3, r6
c0dea31c:	f8ad 0028 	strh.w	r0, [sp, #40]	@ 0x28
c0dea320:	1928      	adds	r0, r5, r4
c0dea322:	4a2f      	ldr	r2, [pc, #188]	@ (c0dea3e0 <displaySecurityReport+0x1f8>)
c0dea324:	1c44      	adds	r4, r0, #1
c0dea326:	4620      	mov	r0, r4
c0dea328:	447a      	add	r2, pc
c0dea32a:	f001 f91b 	bl	c0deb564 <snprintf>
c0dea32e:	9411      	str	r4, [sp, #68]	@ 0x44
c0dea330:	e030      	b.n	c0dea394 <displaySecurityReport+0x1ac>
c0dea332:	4831      	ldr	r0, [pc, #196]	@ (c0dea3f8 <displaySecurityReport+0x210>)
c0dea334:	4478      	add	r0, pc
c0dea336:	9011      	str	r0, [sp, #68]	@ 0x44
c0dea338:	eb09 000b 	add.w	r0, r9, fp
c0dea33c:	6e40      	ldr	r0, [r0, #100]	@ 0x64
c0dea33e:	a90f      	add	r1, sp, #60	@ 0x3c
c0dea340:	f7fc fa28 	bl	c0de6794 <nbgl_layoutAddHeader>
c0dea344:	e030      	b.n	c0dea3a8 <displaySecurityReport+0x1c0>
c0dea346:	06e8      	lsls	r0, r5, #27
c0dea348:	d40c      	bmi.n	c0dea364 <displaySecurityReport+0x17c>
c0dea34a:	07e8      	lsls	r0, r5, #31
c0dea34c:	d0f4      	beq.n	c0dea338 <displaySecurityReport+0x150>
c0dea34e:	466d      	mov	r5, sp
c0dea350:	2124      	movs	r1, #36	@ 0x24
c0dea352:	4628      	mov	r0, r5
c0dea354:	f001 fda0 	bl	c0debe98 <__aeabi_memclr>
c0dea358:	4825      	ldr	r0, [pc, #148]	@ (c0dea3f0 <displaySecurityReport+0x208>)
c0dea35a:	4478      	add	r0, pc
c0dea35c:	9006      	str	r0, [sp, #24]
c0dea35e:	4825      	ldr	r0, [pc, #148]	@ (c0dea3f4 <displaySecurityReport+0x20c>)
c0dea360:	4478      	add	r0, pc
c0dea362:	e009      	b.n	c0dea378 <displaySecurityReport+0x190>
c0dea364:	466d      	mov	r5, sp
c0dea366:	2124      	movs	r1, #36	@ 0x24
c0dea368:	4628      	mov	r0, r5
c0dea36a:	f001 fd95 	bl	c0debe98 <__aeabi_memclr>
c0dea36e:	481d      	ldr	r0, [pc, #116]	@ (c0dea3e4 <displaySecurityReport+0x1fc>)
c0dea370:	4478      	add	r0, pc
c0dea372:	9006      	str	r0, [sp, #24]
c0dea374:	481c      	ldr	r0, [pc, #112]	@ (c0dea3e8 <displaySecurityReport+0x200>)
c0dea376:	4478      	add	r0, pc
c0dea378:	9004      	str	r0, [sp, #16]
c0dea37a:	4629      	mov	r1, r5
c0dea37c:	481b      	ldr	r0, [pc, #108]	@ (c0dea3ec <displaySecurityReport+0x204>)
c0dea37e:	4478      	add	r0, pc
c0dea380:	9001      	str	r0, [sp, #4]
c0dea382:	4620      	mov	r0, r4
c0dea384:	f7fb fda2 	bl	c0de5ecc <nbgl_layoutAddContentCenter>
c0dea388:	2040      	movs	r0, #64	@ 0x40
c0dea38a:	f8ad 0028 	strh.w	r0, [sp, #40]	@ 0x28
c0dea38e:	2000      	movs	r0, #0
c0dea390:	f88d 003d 	strb.w	r0, [sp, #61]	@ 0x3d
c0dea394:	eb09 040b 	add.w	r4, r9, fp
c0dea398:	6e60      	ldr	r0, [r4, #100]	@ 0x64
c0dea39a:	a90f      	add	r1, sp, #60	@ 0x3c
c0dea39c:	f7fc f9fa 	bl	c0de6794 <nbgl_layoutAddHeader>
c0dea3a0:	6e60      	ldr	r0, [r4, #100]	@ 0x64
c0dea3a2:	a909      	add	r1, sp, #36	@ 0x24
c0dea3a4:	f7fa fa62 	bl	c0de486c <nbgl_layoutAddExtendedFooter>
c0dea3a8:	eb09 000b 	add.w	r0, r9, fp
c0dea3ac:	6e40      	ldr	r0, [r0, #100]	@ 0x64
c0dea3ae:	f7fc fe53 	bl	c0de7058 <nbgl_layoutDraw>
c0dea3b2:	f001 f84c 	bl	c0deb44e <nbgl_refresh>
c0dea3b6:	b01a      	add	sp, #104	@ 0x68
c0dea3b8:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0dea3bc:	0000195c 	.word	0x0000195c
c0dea3c0:	00001aa8 	.word	0x00001aa8
c0dea3c4:	00005028 	.word	0x00005028
c0dea3c8:	00004f92 	.word	0x00004f92
c0dea3cc:	00004fa6 	.word	0x00004fa6
c0dea3d0:	00002747 	.word	0x00002747
c0dea3d4:	00003371 	.word	0x00003371
c0dea3d8:	000031b2 	.word	0x000031b2
c0dea3dc:	00003051 	.word	0x00003051
c0dea3e0:	00003102 	.word	0x00003102
c0dea3e4:	0000313d 	.word	0x0000313d
c0dea3e8:	0000322b 	.word	0x0000322b
c0dea3ec:	000024e3 	.word	0x000024e3
c0dea3f0:	0000351d 	.word	0x0000351d
c0dea3f4:	00002ea0 	.word	0x00002ea0
c0dea3f8:	0000308e 	.word	0x0000308e

c0dea3fc <displayCustomizedSecurityReport>:
c0dea3fc:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dea400:	b092      	sub	sp, #72	@ 0x48
c0dea402:	4939      	ldr	r1, [pc, #228]	@ (c0dea4e8 <displayCustomizedSecurityReport+0xec>)
c0dea404:	f10d 0a2c 	add.w	sl, sp, #44	@ 0x2c
c0dea408:	4604      	mov	r4, r0
c0dea40a:	221c      	movs	r2, #28
c0dea40c:	4650      	mov	r0, sl
c0dea40e:	4479      	add	r1, pc
c0dea410:	f001 fd38 	bl	c0debe84 <__aeabi_memcpy>
c0dea414:	4835      	ldr	r0, [pc, #212]	@ (c0dea4ec <displayCustomizedSecurityReport+0xf0>)
c0dea416:	ae07      	add	r6, sp, #28
c0dea418:	4631      	mov	r1, r6
c0dea41a:	4478      	add	r0, pc
c0dea41c:	e890 00ac 	ldmia.w	r0, {r2, r3, r5, r7}
c0dea420:	4830      	ldr	r0, [pc, #192]	@ (c0dea4e4 <displayCustomizedSecurityReport+0xe8>)
c0dea422:	c1ac      	stmia	r1!, {r2, r3, r5, r7}
c0dea424:	eb09 0500 	add.w	r5, r9, r0
c0dea428:	4650      	mov	r0, sl
c0dea42a:	f7f9 fc1b 	bl	c0de3c64 <nbgl_layoutGet>
c0dea42e:	6668      	str	r0, [r5, #100]	@ 0x64
c0dea430:	6821      	ldr	r1, [r4, #0]
c0dea432:	9109      	str	r1, [sp, #36]	@ 0x24
c0dea434:	4631      	mov	r1, r6
c0dea436:	f7fc f9ad 	bl	c0de6794 <nbgl_layoutAddHeader>
c0dea43a:	7920      	ldrb	r0, [r4, #4]
c0dea43c:	b398      	cbz	r0, c0dea4a6 <displayCustomizedSecurityReport+0xaa>
c0dea43e:	2801      	cmp	r0, #1
c0dea440:	d03c      	beq.n	c0dea4bc <displayCustomizedSecurityReport+0xc0>
c0dea442:	2802      	cmp	r0, #2
c0dea444:	d143      	bne.n	c0dea4ce <displayCustomizedSecurityReport+0xd2>
c0dea446:	4f2a      	ldr	r7, [pc, #168]	@ (c0dea4f0 <displayCustomizedSecurityReport+0xf4>)
c0dea448:	2600      	movs	r6, #0
c0dea44a:	f04f 0a09 	mov.w	sl, #9
c0dea44e:	f10d 0b04 	add.w	fp, sp, #4
c0dea452:	2500      	movs	r5, #0
c0dea454:	447f      	add	r7, pc
c0dea456:	7a20      	ldrb	r0, [r4, #8]
c0dea458:	4285      	cmp	r5, r0
c0dea45a:	d238      	bcs.n	c0dea4ce <displayCustomizedSecurityReport+0xd2>
c0dea45c:	f104 020c 	add.w	r2, r4, #12
c0dea460:	ca07      	ldmia	r2, {r0, r1, r2}
c0dea462:	f850 0025 	ldr.w	r0, [r0, r5, lsl #2]
c0dea466:	9002      	str	r0, [sp, #8]
c0dea468:	f851 0025 	ldr.w	r0, [r1, r5, lsl #2]
c0dea46c:	f88d a018 	strb.w	sl, [sp, #24]
c0dea470:	f88d 6016 	strb.w	r6, [sp, #22]
c0dea474:	f88d 6014 	strb.w	r6, [sp, #20]
c0dea478:	4659      	mov	r1, fp
c0dea47a:	e9cd 7003 	strd	r7, r0, [sp, #12]
c0dea47e:	f105 0017 	add.w	r0, r5, #23
c0dea482:	f88d 0015 	strb.w	r0, [sp, #21]
c0dea486:	f852 0025 	ldr.w	r0, [r2, r5, lsl #2]
c0dea48a:	9001      	str	r0, [sp, #4]
c0dea48c:	4815      	ldr	r0, [pc, #84]	@ (c0dea4e4 <displayCustomizedSecurityReport+0xe8>)
c0dea48e:	eb09 0800 	add.w	r8, r9, r0
c0dea492:	f8d8 0064 	ldr.w	r0, [r8, #100]	@ 0x64
c0dea496:	f7fa fd92 	bl	c0de4fbe <nbgl_layoutAddTouchableBar>
c0dea49a:	f8d8 0064 	ldr.w	r0, [r8, #100]	@ 0x64
c0dea49e:	f7fc f84f 	bl	c0de6540 <nbgl_layoutAddSeparationLine>
c0dea4a2:	3501      	adds	r5, #1
c0dea4a4:	e7d7      	b.n	c0dea456 <displayCustomizedSecurityReport+0x5a>
c0dea4a6:	480f      	ldr	r0, [pc, #60]	@ (c0dea4e4 <displayCustomizedSecurityReport+0xe8>)
c0dea4a8:	f104 0108 	add.w	r1, r4, #8
c0dea4ac:	4448      	add	r0, r9
c0dea4ae:	6e40      	ldr	r0, [r0, #100]	@ 0x64
c0dea4b0:	f7fb fd0c 	bl	c0de5ecc <nbgl_layoutAddContentCenter>
c0dea4b4:	2000      	movs	r0, #0
c0dea4b6:	f88d 001d 	strb.w	r0, [sp, #29]
c0dea4ba:	e008      	b.n	c0dea4ce <displayCustomizedSecurityReport+0xd2>
c0dea4bc:	4809      	ldr	r0, [pc, #36]	@ (c0dea4e4 <displayCustomizedSecurityReport+0xe8>)
c0dea4be:	f104 0108 	add.w	r1, r4, #8
c0dea4c2:	4448      	add	r0, r9
c0dea4c4:	6e40      	ldr	r0, [r0, #100]	@ 0x64
c0dea4c6:	f7fb fd0a 	bl	c0de5ede <nbgl_layoutAddQRCode>
c0dea4ca:	6820      	ldr	r0, [r4, #0]
c0dea4cc:	9009      	str	r0, [sp, #36]	@ 0x24
c0dea4ce:	4805      	ldr	r0, [pc, #20]	@ (c0dea4e4 <displayCustomizedSecurityReport+0xe8>)
c0dea4d0:	4448      	add	r0, r9
c0dea4d2:	6e40      	ldr	r0, [r0, #100]	@ 0x64
c0dea4d4:	f7fc fdc0 	bl	c0de7058 <nbgl_layoutDraw>
c0dea4d8:	f000 ffb9 	bl	c0deb44e <nbgl_refresh>
c0dea4dc:	b012      	add	sp, #72	@ 0x48
c0dea4de:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0dea4e2:	bf00      	nop
c0dea4e4:	0000195c 	.word	0x0000195c
c0dea4e8:	00004e12 	.word	0x00004e12
c0dea4ec:	00004d7a 	.word	0x00004d7a
c0dea4f0:	0000257f 	.word	0x0000257f

c0dea4f4 <displayInfosListModal>:
c0dea4f4:	b570      	push	{r4, r5, r6, lr}
c0dea4f6:	b098      	sub	sp, #96	@ 0x60
c0dea4f8:	4606      	mov	r6, r0
c0dea4fa:	460c      	mov	r4, r1
c0dea4fc:	a811      	add	r0, sp, #68	@ 0x44
c0dea4fe:	491c      	ldr	r1, [pc, #112]	@ (c0dea570 <displayInfosListModal+0x7c>)
c0dea500:	4615      	mov	r5, r2
c0dea502:	221c      	movs	r2, #28
c0dea504:	4479      	add	r1, pc
c0dea506:	f001 fcbd 	bl	c0debe84 <__aeabi_memcpy>
c0dea50a:	2008      	movs	r0, #8
c0dea50c:	f88d 0010 	strb.w	r0, [sp, #16]
c0dea510:	2000      	movs	r0, #0
c0dea512:	9003      	str	r0, [sp, #12]
c0dea514:	4814      	ldr	r0, [pc, #80]	@ (c0dea568 <displayInfosListModal+0x74>)
c0dea516:	e9cd 6001 	strd	r6, r0, [sp, #4]
c0dea51a:	200f      	movs	r0, #15
c0dea51c:	2d00      	cmp	r5, #0
c0dea51e:	bf18      	it	ne
c0dea520:	200e      	movne	r0, #14
c0dea522:	f88d 0021 	strb.w	r0, [sp, #33]	@ 0x21
c0dea526:	e894 0007 	ldmia.w	r4, {r0, r1, r2}
c0dea52a:	ab05      	add	r3, sp, #20
c0dea52c:	c307      	stmia	r3!, {r0, r1, r2}
c0dea52e:	7b20      	ldrb	r0, [r4, #12]
c0dea530:	f88d 0020 	strb.w	r0, [sp, #32]
c0dea534:	7ba0      	ldrb	r0, [r4, #14]
c0dea536:	4c0d      	ldr	r4, [pc, #52]	@ (c0dea56c <displayInfosListModal+0x78>)
c0dea538:	f88d 0022 	strb.w	r0, [sp, #34]	@ 0x22
c0dea53c:	eb09 0004 	add.w	r0, r9, r4
c0dea540:	6a00      	ldr	r0, [r0, #32]
c0dea542:	b108      	cbz	r0, c0dea548 <displayInfosListModal+0x54>
c0dea544:	f7fd fec1 	bl	c0de82ca <nbgl_pageRelease>
c0dea548:	480a      	ldr	r0, [pc, #40]	@ (c0dea574 <displayInfosListModal+0x80>)
c0dea54a:	a911      	add	r1, sp, #68	@ 0x44
c0dea54c:	aa01      	add	r2, sp, #4
c0dea54e:	2301      	movs	r3, #1
c0dea550:	4478      	add	r0, pc
c0dea552:	f7fd fc91 	bl	c0de7e78 <nbgl_pageDrawGenericContentExt>
c0dea556:	eb09 0104 	add.w	r1, r9, r4
c0dea55a:	6208      	str	r0, [r1, #32]
c0dea55c:	2002      	movs	r0, #2
c0dea55e:	f000 ff7b 	bl	c0deb458 <nbgl_refreshSpecial>
c0dea562:	b018      	add	sp, #96	@ 0x60
c0dea564:	bd70      	pop	{r4, r5, r6, pc}
c0dea566:	bf00      	nop
c0dea568:	00091300 	.word	0x00091300
c0dea56c:	00001c28 	.word	0x00001c28
c0dea570:	00004d38 	.word	0x00004d38
c0dea574:	ffffef75 	.word	0xffffef75

c0dea578 <modalLayoutTouchCallback>:
c0dea578:	b570      	push	{r4, r5, r6, lr}
c0dea57a:	2816      	cmp	r0, #22
c0dea57c:	d00a      	beq.n	c0dea594 <modalLayoutTouchCallback+0x1c>
c0dea57e:	2815      	cmp	r0, #21
c0dea580:	d117      	bne.n	c0dea5b2 <modalLayoutTouchCallback+0x3a>
c0dea582:	4833      	ldr	r0, [pc, #204]	@ (c0dea650 <modalLayoutTouchCallback+0xd8>)
c0dea584:	eb09 0400 	add.w	r4, r9, r0
c0dea588:	6b20      	ldr	r0, [r4, #48]	@ 0x30
c0dea58a:	f7fc fd93 	bl	c0de70b4 <nbgl_layoutRelease>
c0dea58e:	2000      	movs	r0, #0
c0dea590:	6320      	str	r0, [r4, #48]	@ 0x30
c0dea592:	e035      	b.n	c0dea600 <modalLayoutTouchCallback+0x88>
c0dea594:	4c2d      	ldr	r4, [pc, #180]	@ (c0dea64c <modalLayoutTouchCallback+0xd4>)
c0dea596:	eb09 0504 	add.w	r5, r9, r4
c0dea59a:	6e68      	ldr	r0, [r5, #100]	@ 0x64
c0dea59c:	f7fc fd8a 	bl	c0de70b4 <nbgl_layoutRelease>
c0dea5a0:	f895 0068 	ldrb.w	r0, [r5, #104]	@ 0x68
c0dea5a4:	2801      	cmp	r0, #1
c0dea5a6:	d817      	bhi.n	c0dea5d8 <modalLayoutTouchCallback+0x60>
c0dea5a8:	eb09 0004 	add.w	r0, r9, r4
c0dea5ac:	2100      	movs	r1, #0
c0dea5ae:	6641      	str	r1, [r0, #100]	@ 0x64
c0dea5b0:	e026      	b.n	c0dea600 <modalLayoutTouchCallback+0x88>
c0dea5b2:	f1a0 0417 	sub.w	r4, r0, #23
c0dea5b6:	2c04      	cmp	r4, #4
c0dea5b8:	d81a      	bhi.n	c0dea5f0 <modalLayoutTouchCallback+0x78>
c0dea5ba:	4d24      	ldr	r5, [pc, #144]	@ (c0dea64c <modalLayoutTouchCallback+0xd4>)
c0dea5bc:	eb09 0605 	add.w	r6, r9, r5
c0dea5c0:	6e70      	ldr	r0, [r6, #100]	@ 0x64
c0dea5c2:	f7fc fd77 	bl	c0de70b4 <nbgl_layoutRelease>
c0dea5c6:	2002      	movs	r0, #2
c0dea5c8:	f886 0068 	strb.w	r0, [r6, #104]	@ 0x68
c0dea5cc:	6db0      	ldr	r0, [r6, #88]	@ 0x58
c0dea5ce:	6801      	ldr	r1, [r0, #0]
c0dea5d0:	b331      	cbz	r1, c0dea620 <modalLayoutTouchCallback+0xa8>
c0dea5d2:	2001      	movs	r0, #1
c0dea5d4:	40a0      	lsls	r0, r4
c0dea5d6:	e007      	b.n	c0dea5e8 <modalLayoutTouchCallback+0x70>
c0dea5d8:	eb09 0004 	add.w	r0, r9, r4
c0dea5dc:	2101      	movs	r1, #1
c0dea5de:	f880 1068 	strb.w	r1, [r0, #104]	@ 0x68
c0dea5e2:	6d81      	ldr	r1, [r0, #88]	@ 0x58
c0dea5e4:	6808      	ldr	r0, [r1, #0]
c0dea5e6:	b188      	cbz	r0, c0dea60c <modalLayoutTouchCallback+0x94>
c0dea5e8:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0dea5ec:	f7ff bdfc 	b.w	c0dea1e8 <displaySecurityReport>
c0dea5f0:	4816      	ldr	r0, [pc, #88]	@ (c0dea64c <modalLayoutTouchCallback+0xd4>)
c0dea5f2:	eb09 0400 	add.w	r4, r9, r0
c0dea5f6:	6ae0      	ldr	r0, [r4, #44]	@ 0x2c
c0dea5f8:	f7fc fd5c 	bl	c0de70b4 <nbgl_layoutRelease>
c0dea5fc:	2000      	movs	r0, #0
c0dea5fe:	62e0      	str	r0, [r4, #44]	@ 0x2c
c0dea600:	f000 ff4d 	bl	c0deb49e <nbgl_screenRedraw>
c0dea604:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0dea608:	f000 bf21 	b.w	c0deb44e <nbgl_refresh>
c0dea60c:	eb09 0004 	add.w	r0, r9, r4
c0dea610:	2214      	movs	r2, #20
c0dea612:	f890 0069 	ldrb.w	r0, [r0, #105]	@ 0x69
c0dea616:	2800      	cmp	r0, #0
c0dea618:	bf08      	it	eq
c0dea61a:	2218      	moveq	r2, #24
c0dea61c:	5888      	ldr	r0, [r1, r2]
c0dea61e:	e010      	b.n	c0dea642 <modalLayoutTouchCallback+0xca>
c0dea620:	eb09 0105 	add.w	r1, r9, r5
c0dea624:	2214      	movs	r2, #20
c0dea626:	f891 1069 	ldrb.w	r1, [r1, #105]	@ 0x69
c0dea62a:	2900      	cmp	r1, #0
c0dea62c:	bf08      	it	eq
c0dea62e:	2218      	moveq	r2, #24
c0dea630:	5880      	ldr	r0, [r0, r2]
c0dea632:	7901      	ldrb	r1, [r0, #4]
c0dea634:	2902      	cmp	r1, #2
c0dea636:	bf18      	it	ne
c0dea638:	bd70      	popne	{r4, r5, r6, pc}
c0dea63a:	6980      	ldr	r0, [r0, #24]
c0dea63c:	212c      	movs	r1, #44	@ 0x2c
c0dea63e:	fb04 0001 	mla	r0, r4, r1, r0
c0dea642:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0dea646:	f7ff bed9 	b.w	c0dea3fc <displayCustomizedSecurityReport>
c0dea64a:	bf00      	nop
c0dea64c:	0000195c 	.word	0x0000195c
c0dea650:	00001a70 	.word	0x00001a70

c0dea654 <displayDetailsPage>:
c0dea654:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0dea658:	b09b      	sub	sp, #108	@ 0x6c
c0dea65a:	f8df a160 	ldr.w	sl, [pc, #352]	@ c0dea7bc <displayDetailsPage+0x168>
c0dea65e:	4604      	mov	r4, r0
c0dea660:	f88d 004c 	strb.w	r0, [sp, #76]	@ 0x4c
c0dea664:	2000      	movs	r0, #0
c0dea666:	460e      	mov	r6, r1
c0dea668:	4953      	ldr	r1, [pc, #332]	@ (c0dea7b8 <displayDetailsPage+0x164>)
c0dea66a:	9018      	str	r0, [sp, #96]	@ 0x60
c0dea66c:	f88d 0058 	strb.w	r0, [sp, #88]	@ 0x58
c0dea670:	9015      	str	r0, [sp, #84]	@ 0x54
c0dea672:	f44f 6010 	mov.w	r0, #2304	@ 0x900
c0dea676:	eb09 050a 	add.w	r5, r9, sl
c0dea67a:	f8ad 0050 	strh.w	r0, [sp, #80]	@ 0x50
c0dea67e:	f44f 7081 	mov.w	r0, #258	@ 0x102
c0dea682:	9117      	str	r1, [sp, #92]	@ 0x5c
c0dea684:	2140      	movs	r1, #64	@ 0x40
c0dea686:	f895 8030 	ldrb.w	r8, [r5, #48]	@ 0x30
c0dea68a:	f8ad 004e 	strh.w	r0, [sp, #78]	@ 0x4e
c0dea68e:	f88d 804d 	strb.w	r8, [sp, #77]	@ 0x4d
c0dea692:	a803      	add	r0, sp, #12
c0dea694:	f001 fc00 	bl	c0debe98 <__aeabi_memclr>
c0dea698:	2001      	movs	r0, #1
c0dea69a:	f88d 0028 	strb.w	r0, [sp, #40]	@ 0x28
c0dea69e:	f88d 0024 	strb.w	r0, [sp, #36]	@ 0x24
c0dea6a2:	f105 0040 	add.w	r0, r5, #64	@ 0x40
c0dea6a6:	9007      	str	r0, [sp, #28]
c0dea6a8:	2004      	movs	r0, #4
c0dea6aa:	f88d 0018 	strb.w	r0, [sp, #24]
c0dea6ae:	f895 0033 	ldrb.w	r0, [r5, #51]	@ 0x33
c0dea6b2:	f88d 0029 	strb.w	r0, [sp, #41]	@ 0x29
c0dea6b6:	6a28      	ldr	r0, [r5, #32]
c0dea6b8:	b108      	cbz	r0, c0dea6be <displayDetailsPage+0x6a>
c0dea6ba:	f7fd fe06 	bl	c0de82ca <nbgl_pageRelease>
c0dea6be:	eb09 000a 	add.w	r0, r9, sl
c0dea6c2:	6b41      	ldr	r1, [r0, #52]	@ 0x34
c0dea6c4:	6401      	str	r1, [r0, #64]	@ 0x40
c0dea6c6:	f890 0031 	ldrb.w	r0, [r0, #49]	@ 0x31
c0dea6ca:	42a0      	cmp	r0, r4
c0dea6cc:	d207      	bcs.n	c0dea6de <displayDetailsPage+0x8a>
c0dea6ce:	2501      	movs	r5, #1
c0dea6d0:	eb09 000a 	add.w	r0, r9, sl
c0dea6d4:	2e00      	cmp	r6, #0
c0dea6d6:	bf18      	it	ne
c0dea6d8:	2502      	movne	r5, #2
c0dea6da:	6bc6      	ldr	r6, [r0, #60]	@ 0x3c
c0dea6dc:	e022      	b.n	c0dea724 <displayDetailsPage+0xd0>
c0dea6de:	eb09 000a 	add.w	r0, r9, sl
c0dea6e2:	2500      	movs	r5, #0
c0dea6e4:	f10d 076a 	add.w	r7, sp, #106	@ 0x6a
c0dea6e8:	6b86      	ldr	r6, [r0, #56]	@ 0x38
c0dea6ea:	42a5      	cmp	r5, r4
c0dea6ec:	d219      	bcs.n	c0dea722 <displayDetailsPage+0xce>
c0dea6ee:	200c      	movs	r0, #12
c0dea6f0:	4631      	mov	r1, r6
c0dea6f2:	f000 fa1f 	bl	c0deab34 <OUTLINED_FUNCTION_11>
c0dea6f6:	280c      	cmp	r0, #12
c0dea6f8:	d311      	bcc.n	c0dea71e <displayDetailsPage+0xca>
c0dea6fa:	eb09 000a 	add.w	r0, r9, sl
c0dea6fe:	4631      	mov	r1, r6
c0dea700:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0dea704:	230b      	movs	r3, #11
c0dea706:	f890 0033 	ldrb.w	r0, [r0, #51]	@ 0x33
c0dea70a:	e9cd 7000 	strd	r7, r0, [sp]
c0dea70e:	200c      	movs	r0, #12
c0dea710:	f000 ff01 	bl	c0deb516 <nbgl_getTextMaxLenInNbLines>
c0dea714:	f8bd 006a 	ldrh.w	r0, [sp, #106]	@ 0x6a
c0dea718:	3803      	subs	r0, #3
c0dea71a:	b280      	uxth	r0, r0
c0dea71c:	4406      	add	r6, r0
c0dea71e:	3501      	adds	r5, #1
c0dea720:	e7e3      	b.n	c0dea6ea <displayDetailsPage+0x96>
c0dea722:	2502      	movs	r5, #2
c0dea724:	eb09 000a 	add.w	r0, r9, sl
c0dea728:	4631      	mov	r1, r6
c0dea72a:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0dea72e:	f890 3033 	ldrb.w	r3, [r0, #51]	@ 0x33
c0dea732:	f880 4031 	strb.w	r4, [r0, #49]	@ 0x31
c0dea736:	6446      	str	r6, [r0, #68]	@ 0x44
c0dea738:	200c      	movs	r0, #12
c0dea73a:	f000 fee2 	bl	c0deb502 <nbgl_getTextNbLinesInWidth>
c0dea73e:	280c      	cmp	r0, #12
c0dea740:	d31e      	bcc.n	c0dea780 <displayDetailsPage+0x12c>
c0dea742:	eb09 040a 	add.w	r4, r9, sl
c0dea746:	f10d 026a 	add.w	r2, sp, #106	@ 0x6a
c0dea74a:	230b      	movs	r3, #11
c0dea74c:	260b      	movs	r6, #11
c0dea74e:	f894 0033 	ldrb.w	r0, [r4, #51]	@ 0x33
c0dea752:	6c61      	ldr	r1, [r4, #68]	@ 0x44
c0dea754:	e9cd 2000 	strd	r2, r0, [sp]
c0dea758:	200c      	movs	r0, #12
c0dea75a:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0dea75e:	f000 feda 	bl	c0deb516 <nbgl_getTextMaxLenInNbLines>
c0dea762:	f8bd 106a 	ldrh.w	r1, [sp, #106]	@ 0x6a
c0dea766:	6c60      	ldr	r0, [r4, #68]	@ 0x44
c0dea768:	1eca      	subs	r2, r1, #3
c0dea76a:	4401      	add	r1, r0
c0dea76c:	f811 3b01 	ldrb.w	r3, [r1], #1
c0dea770:	b292      	uxth	r2, r2
c0dea772:	2b0a      	cmp	r3, #10
c0dea774:	bf18      	it	ne
c0dea776:	1881      	addne	r1, r0, r2
c0dea778:	63e1      	str	r1, [r4, #60]	@ 0x3c
c0dea77a:	f88d 6026 	strb.w	r6, [sp, #38]	@ 0x26
c0dea77e:	e005      	b.n	c0dea78c <displayDetailsPage+0x138>
c0dea780:	2100      	movs	r1, #0
c0dea782:	eb09 000a 	add.w	r0, r9, sl
c0dea786:	63c1      	str	r1, [r0, #60]	@ 0x3c
c0dea788:	f88d 1026 	strb.w	r1, [sp, #38]	@ 0x26
c0dea78c:	f1b8 0f01 	cmp.w	r8, #1
c0dea790:	d102      	bne.n	c0dea798 <displayDetailsPage+0x144>
c0dea792:	480b      	ldr	r0, [pc, #44]	@ (c0dea7c0 <displayDetailsPage+0x16c>)
c0dea794:	4478      	add	r0, pc
c0dea796:	9018      	str	r0, [sp, #96]	@ 0x60
c0dea798:	480a      	ldr	r0, [pc, #40]	@ (c0dea7c4 <displayDetailsPage+0x170>)
c0dea79a:	a913      	add	r1, sp, #76	@ 0x4c
c0dea79c:	aa03      	add	r2, sp, #12
c0dea79e:	2301      	movs	r3, #1
c0dea7a0:	4478      	add	r0, pc
c0dea7a2:	f7fd fb69 	bl	c0de7e78 <nbgl_pageDrawGenericContentExt>
c0dea7a6:	eb09 010a 	add.w	r1, r9, sl
c0dea7aa:	6208      	str	r0, [r1, #32]
c0dea7ac:	4628      	mov	r0, r5
c0dea7ae:	f000 fe53 	bl	c0deb458 <nbgl_refreshSpecial>
c0dea7b2:	b01b      	add	sp, #108	@ 0x6c
c0dea7b4:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}
c0dea7b8:	03000101 	.word	0x03000101
c0dea7bc:	00001c28 	.word	0x00001c28
c0dea7c0:	00002ce2 	.word	0x00002ce2
c0dea7c4:	ffffed25 	.word	0xffffed25

c0dea7c8 <displayTagValueListModalPage>:
c0dea7c8:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0dea7cc:	b098      	sub	sp, #96	@ 0x60
c0dea7ce:	4e44      	ldr	r6, [pc, #272]	@ (c0dea8e0 <displayTagValueListModalPage+0x118>)
c0dea7d0:	4605      	mov	r5, r0
c0dea7d2:	f88d 0044 	strb.w	r0, [sp, #68]	@ 0x44
c0dea7d6:	2000      	movs	r0, #0
c0dea7d8:	4688      	mov	r8, r1
c0dea7da:	4940      	ldr	r1, [pc, #256]	@ (c0dea8dc <displayTagValueListModalPage+0x114>)
c0dea7dc:	9016      	str	r0, [sp, #88]	@ 0x58
c0dea7de:	f88d 0050 	strb.w	r0, [sp, #80]	@ 0x50
c0dea7e2:	9013      	str	r0, [sp, #76]	@ 0x4c
c0dea7e4:	f44f 6010 	mov.w	r0, #2304	@ 0x900
c0dea7e8:	eb09 0406 	add.w	r4, r9, r6
c0dea7ec:	f8ad 0048 	strh.w	r0, [sp, #72]	@ 0x48
c0dea7f0:	f44f 7081 	mov.w	r0, #258	@ 0x102
c0dea7f4:	9115      	str	r1, [sp, #84]	@ 0x54
c0dea7f6:	2140      	movs	r1, #64	@ 0x40
c0dea7f8:	f894 7030 	ldrb.w	r7, [r4, #48]	@ 0x30
c0dea7fc:	f8ad 0046 	strh.w	r0, [sp, #70]	@ 0x46
c0dea800:	f88d 7045 	strb.w	r7, [sp, #69]	@ 0x45
c0dea804:	a801      	add	r0, sp, #4
c0dea806:	f001 fb47 	bl	c0debe98 <__aeabi_memclr>
c0dea80a:	2001      	movs	r0, #1
c0dea80c:	f894 1031 	ldrb.w	r1, [r4, #49]	@ 0x31
c0dea810:	f894 2033 	ldrb.w	r2, [r4, #51]	@ 0x33
c0dea814:	f88d 0020 	strb.w	r0, [sp, #32]
c0dea818:	2004      	movs	r0, #4
c0dea81a:	42a9      	cmp	r1, r5
c0dea81c:	f88d 0010 	strb.w	r0, [sp, #16]
c0dea820:	f88d 2021 	strb.w	r2, [sp, #33]	@ 0x21
c0dea824:	d91b      	bls.n	c0dea85e <displayTagValueListModalPage+0x96>
c0dea826:	1c69      	adds	r1, r5, #1
c0dea828:	eb09 0306 	add.w	r3, r9, r6
c0dea82c:	ea00 0281 	and.w	r2, r0, r1, lsl #2
c0dea830:	b2c9      	uxtb	r1, r1
c0dea832:	f103 0450 	add.w	r4, r3, #80	@ 0x50
c0dea836:	ea00 0085 	and.w	r0, r0, r5, lsl #2
c0dea83a:	0849      	lsrs	r1, r1, #1
c0dea83c:	5c61      	ldrb	r1, [r4, r1]
c0dea83e:	40d1      	lsrs	r1, r2
c0dea840:	f893 2032 	ldrb.w	r2, [r3, #50]	@ 0x32
c0dea844:	f001 0107 	and.w	r1, r1, #7
c0dea848:	1a52      	subs	r2, r2, r1
c0dea84a:	0869      	lsrs	r1, r5, #1
c0dea84c:	5c61      	ldrb	r1, [r4, r1]
c0dea84e:	f883 2032 	strb.w	r2, [r3, #50]	@ 0x32
c0dea852:	fa21 f000 	lsr.w	r0, r1, r0
c0dea856:	f000 0107 	and.w	r1, r0, #7
c0dea85a:	1a50      	subs	r0, r2, r1
c0dea85c:	e00d      	b.n	c0dea87a <displayTagValueListModalPage+0xb2>
c0dea85e:	eb09 0206 	add.w	r2, r9, r6
c0dea862:	ea00 0085 	and.w	r0, r0, r5, lsl #2
c0dea866:	eb02 0155 	add.w	r1, r2, r5, lsr #1
c0dea86a:	f891 1050 	ldrb.w	r1, [r1, #80]	@ 0x50
c0dea86e:	fa21 f000 	lsr.w	r0, r1, r0
c0dea872:	f000 0107 	and.w	r1, r0, #7
c0dea876:	f892 0032 	ldrb.w	r0, [r2, #50]	@ 0x32
c0dea87a:	4b1a      	ldr	r3, [pc, #104]	@ (c0dea8e4 <displayTagValueListModalPage+0x11c>)
c0dea87c:	eb09 0206 	add.w	r2, r9, r6
c0dea880:	2f01      	cmp	r7, #1
c0dea882:	f882 5031 	strb.w	r5, [r2, #49]	@ 0x31
c0dea886:	444b      	add	r3, r9
c0dea888:	6b9b      	ldr	r3, [r3, #56]	@ 0x38
c0dea88a:	681b      	ldr	r3, [r3, #0]
c0dea88c:	f88d 101c 	strb.w	r1, [sp, #28]
c0dea890:	4401      	add	r1, r0
c0dea892:	b2c0      	uxtb	r0, r0
c0dea894:	f882 1032 	strb.w	r1, [r2, #50]	@ 0x32
c0dea898:	eb03 1000 	add.w	r0, r3, r0, lsl #4
c0dea89c:	9005      	str	r0, [sp, #20]
c0dea89e:	d102      	bne.n	c0dea8a6 <displayTagValueListModalPage+0xde>
c0dea8a0:	4811      	ldr	r0, [pc, #68]	@ (c0dea8e8 <displayTagValueListModalPage+0x120>)
c0dea8a2:	4478      	add	r0, pc
c0dea8a4:	9016      	str	r0, [sp, #88]	@ 0x58
c0dea8a6:	eb09 0006 	add.w	r0, r9, r6
c0dea8aa:	6a00      	ldr	r0, [r0, #32]
c0dea8ac:	b108      	cbz	r0, c0dea8b2 <displayTagValueListModalPage+0xea>
c0dea8ae:	f7fd fd0c 	bl	c0de82ca <nbgl_pageRelease>
c0dea8b2:	480e      	ldr	r0, [pc, #56]	@ (c0dea8ec <displayTagValueListModalPage+0x124>)
c0dea8b4:	a911      	add	r1, sp, #68	@ 0x44
c0dea8b6:	aa01      	add	r2, sp, #4
c0dea8b8:	2301      	movs	r3, #1
c0dea8ba:	2501      	movs	r5, #1
c0dea8bc:	4478      	add	r0, pc
c0dea8be:	f7fd fadb 	bl	c0de7e78 <nbgl_pageDrawGenericContentExt>
c0dea8c2:	eb09 0106 	add.w	r1, r9, r6
c0dea8c6:	f1b8 0f00 	cmp.w	r8, #0
c0dea8ca:	6208      	str	r0, [r1, #32]
c0dea8cc:	bf18      	it	ne
c0dea8ce:	2502      	movne	r5, #2
c0dea8d0:	4628      	mov	r0, r5
c0dea8d2:	f000 fdc1 	bl	c0deb458 <nbgl_refreshSpecial>
c0dea8d6:	b018      	add	sp, #96	@ 0x60
c0dea8d8:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0dea8dc:	04000101 	.word	0x04000101
c0dea8e0:	00001c28 	.word	0x00001c28
c0dea8e4:	0000195c 	.word	0x0000195c
c0dea8e8:	00002bd4 	.word	0x00002bd4
c0dea8ec:	ffffec09 	.word	0xffffec09

c0dea8f0 <bundleNavReviewChoice>:
c0dea8f0:	b120      	cbz	r0, c0dea8fc <bundleNavReviewChoice+0xc>
c0dea8f2:	4806      	ldr	r0, [pc, #24]	@ (c0dea90c <bundleNavReviewChoice+0x1c>)
c0dea8f4:	4448      	add	r0, r9
c0dea8f6:	6a41      	ldr	r1, [r0, #36]	@ 0x24
c0dea8f8:	2001      	movs	r0, #1
c0dea8fa:	4708      	bx	r1
c0dea8fc:	4803      	ldr	r0, [pc, #12]	@ (c0dea90c <bundleNavReviewChoice+0x1c>)
c0dea8fe:	4448      	add	r0, r9
c0dea900:	6a00      	ldr	r0, [r0, #32]
c0dea902:	4903      	ldr	r1, [pc, #12]	@ (c0dea910 <bundleNavReviewChoice+0x20>)
c0dea904:	4479      	add	r1, pc
c0dea906:	f000 b863 	b.w	c0dea9d0 <bundleNavReviewAskRejectionConfirmation>
c0dea90a:	bf00      	nop
c0dea90c:	00001ca4 	.word	0x00001ca4
c0dea910:	0000011d 	.word	0x0000011d

c0dea914 <initWarningTipBox>:
c0dea914:	4923      	ldr	r1, [pc, #140]	@ (c0dea9a4 <initWarningTipBox+0x90>)
c0dea916:	eb09 0201 	add.w	r2, r9, r1
c0dea91a:	6d92      	ldr	r2, [r2, #88]	@ 0x58
c0dea91c:	b15a      	cbz	r2, c0dea936 <initWarningTipBox+0x22>
c0dea91e:	6812      	ldr	r2, [r2, #0]
c0dea920:	07d3      	lsls	r3, r2, #31
c0dea922:	d111      	bne.n	c0dea948 <initWarningTipBox+0x34>
c0dea924:	0753      	lsls	r3, r2, #29
c0dea926:	d415      	bmi.n	c0dea954 <initWarningTipBox+0x40>
c0dea928:	0793      	lsls	r3, r2, #30
c0dea92a:	d419      	bmi.n	c0dea960 <initWarningTipBox+0x4c>
c0dea92c:	f002 0310 	and.w	r3, r2, #16
c0dea930:	0712      	lsls	r2, r2, #28
c0dea932:	d42c      	bmi.n	c0dea98e <initWarningTipBox+0x7a>
c0dea934:	bb9b      	cbnz	r3, c0dea99e <initWarningTipBox+0x8a>
c0dea936:	b348      	cbz	r0, c0dea98c <initWarningTipBox+0x78>
c0dea938:	491b      	ldr	r1, [pc, #108]	@ (c0dea9a8 <initWarningTipBox+0x94>)
c0dea93a:	2200      	movs	r2, #0
c0dea93c:	4449      	add	r1, r9
c0dea93e:	620a      	str	r2, [r1, #32]
c0dea940:	6842      	ldr	r2, [r0, #4]
c0dea942:	62ca      	str	r2, [r1, #44]	@ 0x2c
c0dea944:	6800      	ldr	r0, [r0, #0]
c0dea946:	e01b      	b.n	c0dea980 <initWarningTipBox+0x6c>
c0dea948:	06d0      	lsls	r0, r2, #27
c0dea94a:	4a18      	ldr	r2, [pc, #96]	@ (c0dea9ac <initWarningTipBox+0x98>)
c0dea94c:	4818      	ldr	r0, [pc, #96]	@ (c0dea9b0 <initWarningTipBox+0x9c>)
c0dea94e:	447a      	add	r2, pc
c0dea950:	4478      	add	r0, pc
c0dea952:	e00a      	b.n	c0dea96a <initWarningTipBox+0x56>
c0dea954:	06d0      	lsls	r0, r2, #27
c0dea956:	4a17      	ldr	r2, [pc, #92]	@ (c0dea9b4 <initWarningTipBox+0xa0>)
c0dea958:	4817      	ldr	r0, [pc, #92]	@ (c0dea9b8 <initWarningTipBox+0xa4>)
c0dea95a:	447a      	add	r2, pc
c0dea95c:	4478      	add	r0, pc
c0dea95e:	e004      	b.n	c0dea96a <initWarningTipBox+0x56>
c0dea960:	06d0      	lsls	r0, r2, #27
c0dea962:	4a16      	ldr	r2, [pc, #88]	@ (c0dea9bc <initWarningTipBox+0xa8>)
c0dea964:	4816      	ldr	r0, [pc, #88]	@ (c0dea9c0 <initWarningTipBox+0xac>)
c0dea966:	447a      	add	r2, pc
c0dea968:	4478      	add	r0, pc
c0dea96a:	bf58      	it	pl
c0dea96c:	4610      	movpl	r0, r2
c0dea96e:	4449      	add	r1, r9
c0dea970:	2201      	movs	r2, #1
c0dea972:	f881 2021 	strb.w	r2, [r1, #33]	@ 0x21
c0dea976:	490c      	ldr	r1, [pc, #48]	@ (c0dea9a8 <initWarningTipBox+0x94>)
c0dea978:	2200      	movs	r2, #0
c0dea97a:	4449      	add	r1, r9
c0dea97c:	620a      	str	r2, [r1, #32]
c0dea97e:	62ca      	str	r2, [r1, #44]	@ 0x2c
c0dea980:	4909      	ldr	r1, [pc, #36]	@ (c0dea9a8 <initWarningTipBox+0x94>)
c0dea982:	f640 1212 	movw	r2, #2322	@ 0x912
c0dea986:	4449      	add	r1, r9
c0dea988:	860a      	strh	r2, [r1, #48]	@ 0x30
c0dea98a:	6288      	str	r0, [r1, #40]	@ 0x28
c0dea98c:	4770      	bx	lr
c0dea98e:	4a0d      	ldr	r2, [pc, #52]	@ (c0dea9c4 <initWarningTipBox+0xb0>)
c0dea990:	480d      	ldr	r0, [pc, #52]	@ (c0dea9c8 <initWarningTipBox+0xb4>)
c0dea992:	2b00      	cmp	r3, #0
c0dea994:	4478      	add	r0, pc
c0dea996:	447a      	add	r2, pc
c0dea998:	bf08      	it	eq
c0dea99a:	4610      	moveq	r0, r2
c0dea99c:	e7e7      	b.n	c0dea96e <initWarningTipBox+0x5a>
c0dea99e:	480b      	ldr	r0, [pc, #44]	@ (c0dea9cc <initWarningTipBox+0xb8>)
c0dea9a0:	4478      	add	r0, pc
c0dea9a2:	e7e4      	b.n	c0dea96e <initWarningTipBox+0x5a>
c0dea9a4:	0000195c 	.word	0x0000195c
c0dea9a8:	000019c8 	.word	0x000019c8
c0dea9ac:	000028b2 	.word	0x000028b2
c0dea9b0:	00002998 	.word	0x00002998
c0dea9b4:	00003056 	.word	0x00003056
c0dea9b8:	00002921 	.word	0x00002921
c0dea9bc:	00003091 	.word	0x00003091
c0dea9c0:	00002dfd 	.word	0x00002dfd
c0dea9c4:	00002e00 	.word	0x00002e00
c0dea9c8:	0000307c 	.word	0x0000307c
c0dea9cc:	00002cbb 	.word	0x00002cbb

c0dea9d0 <bundleNavReviewAskRejectionConfirmation>:
c0dea9d0:	f020 00f0 	bic.w	r0, r0, #240	@ 0xf0
c0dea9d4:	b130      	cbz	r0, c0dea9e4 <bundleNavReviewAskRejectionConfirmation+0x14>
c0dea9d6:	2801      	cmp	r0, #1
c0dea9d8:	d109      	bne.n	c0dea9ee <bundleNavReviewAskRejectionConfirmation+0x1e>
c0dea9da:	4b0d      	ldr	r3, [pc, #52]	@ (c0deaa10 <bundleNavReviewAskRejectionConfirmation+0x40>)
c0dea9dc:	480d      	ldr	r0, [pc, #52]	@ (c0deaa14 <bundleNavReviewAskRejectionConfirmation+0x44>)
c0dea9de:	447b      	add	r3, pc
c0dea9e0:	4478      	add	r0, pc
c0dea9e2:	e008      	b.n	c0dea9f6 <bundleNavReviewAskRejectionConfirmation+0x26>
c0dea9e4:	4b08      	ldr	r3, [pc, #32]	@ (c0deaa08 <bundleNavReviewAskRejectionConfirmation+0x38>)
c0dea9e6:	4809      	ldr	r0, [pc, #36]	@ (c0deaa0c <bundleNavReviewAskRejectionConfirmation+0x3c>)
c0dea9e8:	447b      	add	r3, pc
c0dea9ea:	4478      	add	r0, pc
c0dea9ec:	e003      	b.n	c0dea9f6 <bundleNavReviewAskRejectionConfirmation+0x26>
c0dea9ee:	4b0a      	ldr	r3, [pc, #40]	@ (c0deaa18 <bundleNavReviewAskRejectionConfirmation+0x48>)
c0dea9f0:	480a      	ldr	r0, [pc, #40]	@ (c0deaa1c <bundleNavReviewAskRejectionConfirmation+0x4c>)
c0dea9f2:	447b      	add	r3, pc
c0dea9f4:	4478      	add	r0, pc
c0dea9f6:	b5e0      	push	{r5, r6, r7, lr}
c0dea9f8:	9100      	str	r1, [sp, #0]
c0dea9fa:	2100      	movs	r1, #0
c0dea9fc:	4a08      	ldr	r2, [pc, #32]	@ (c0deaa20 <bundleNavReviewAskRejectionConfirmation+0x50>)
c0dea9fe:	447a      	add	r2, pc
c0deaa00:	f7fe fd38 	bl	c0de9474 <nbgl_useCaseConfirm>
c0deaa04:	bd8c      	pop	{r2, r3, r7, pc}
c0deaa06:	bf00      	nop
c0deaa08:	00002a4c 	.word	0x00002a4c
c0deaa0c:	0000287f 	.word	0x0000287f
c0deaa10:	00002d74 	.word	0x00002d74
c0deaa14:	0000314f 	.word	0x0000314f
c0deaa18:	000028e1 	.word	0x000028e1
c0deaa1c:	00002df0 	.word	0x00002df0
c0deaa20:	00002bcb 	.word	0x00002bcb

c0deaa24 <bundleNavReviewConfirmRejection>:
c0deaa24:	4801      	ldr	r0, [pc, #4]	@ (c0deaa2c <bundleNavReviewConfirmRejection+0x8>)
c0deaa26:	f000 b881 	b.w	c0deab2c <OUTLINED_FUNCTION_9>
c0deaa2a:	bf00      	nop
c0deaa2c:	00001ca4 	.word	0x00001ca4

c0deaa30 <layoutTouchCallback>:
c0deaa30:	b5f0      	push	{r4, r5, r6, r7, lr}
c0deaa32:	b087      	sub	sp, #28
c0deaa34:	2811      	cmp	r0, #17
c0deaa36:	d017      	beq.n	c0deaa68 <layoutTouchCallback+0x38>
c0deaa38:	2814      	cmp	r0, #20
c0deaa3a:	d142      	bne.n	c0deaac2 <layoutTouchCallback+0x92>
c0deaa3c:	b1e9      	cbz	r1, c0deaa7a <layoutTouchCallback+0x4a>
c0deaa3e:	4922      	ldr	r1, [pc, #136]	@ (c0deaac8 <layoutTouchCallback+0x98>)
c0deaa40:	2400      	movs	r4, #0
c0deaa42:	eb09 0201 	add.w	r2, r9, r1
c0deaa46:	eb09 0501 	add.w	r5, r9, r1
c0deaa4a:	f882 4069 	strb.w	r4, [r2, #105]	@ 0x69
c0deaa4e:	6c10      	ldr	r0, [r2, #64]	@ 0x40
c0deaa50:	f892 203c 	ldrb.w	r2, [r2, #60]	@ 0x3c
c0deaa54:	b33a      	cbz	r2, c0deaaa6 <layoutTouchCallback+0x76>
c0deaa56:	f105 0348 	add.w	r3, r5, #72	@ 0x48
c0deaa5a:	6ded      	ldr	r5, [r5, #92]	@ 0x5c
c0deaa5c:	cb0e      	ldmia	r3, {r1, r2, r3}
c0deaa5e:	e9cd 5400 	strd	r5, r4, [sp]
c0deaa62:	f7fe fff5 	bl	c0de9a50 <useCaseReviewStreamingStart>
c0deaa66:	e02c      	b.n	c0deaac2 <layoutTouchCallback+0x92>
c0deaa68:	4a17      	ldr	r2, [pc, #92]	@ (c0deaac8 <layoutTouchCallback+0x98>)
c0deaa6a:	f000 f84a 	bl	c0deab02 <OUTLINED_FUNCTION_4>
c0deaa6e:	d00c      	beq.n	c0deaa8a <layoutTouchCallback+0x5a>
c0deaa70:	b007      	add	sp, #28
c0deaa72:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0deaa76:	f7ff bbb7 	b.w	c0dea1e8 <displaySecurityReport>
c0deaa7a:	4813      	ldr	r0, [pc, #76]	@ (c0deaac8 <layoutTouchCallback+0x98>)
c0deaa7c:	4448      	add	r0, r9
c0deaa7e:	6dc1      	ldr	r1, [r0, #92]	@ 0x5c
c0deaa80:	2000      	movs	r0, #0
c0deaa82:	b007      	add	sp, #28
c0deaa84:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0deaa88:	4708      	bx	r1
c0deaa8a:	eb09 0002 	add.w	r0, r9, r2
c0deaa8e:	2214      	movs	r2, #20
c0deaa90:	f890 0069 	ldrb.w	r0, [r0, #105]	@ 0x69
c0deaa94:	2800      	cmp	r0, #0
c0deaa96:	bf08      	it	eq
c0deaa98:	2218      	moveq	r2, #24
c0deaa9a:	5888      	ldr	r0, [r1, r2]
c0deaa9c:	b007      	add	sp, #28
c0deaa9e:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0deaaa2:	f7ff bcab 	b.w	c0dea3fc <displayCustomizedSecurityReport>
c0deaaa6:	f105 0744 	add.w	r7, r5, #68	@ 0x44
c0deaaaa:	6ded      	ldr	r5, [r5, #92]	@ 0x5c
c0deaaac:	cfce      	ldmia	r7, {r1, r2, r3, r6, r7}
c0deaaae:	9405      	str	r4, [sp, #20]
c0deaab0:	e9cd 6700 	strd	r6, r7, [sp]
c0deaab4:	e9cd 5403 	strd	r5, r4, [sp, #12]
c0deaab8:	4c04      	ldr	r4, [pc, #16]	@ (c0deaacc <layoutTouchCallback+0x9c>)
c0deaaba:	444c      	add	r4, r9
c0deaabc:	9402      	str	r4, [sp, #8]
c0deaabe:	f7fe fddf 	bl	c0de9680 <useCaseReview>
c0deaac2:	b007      	add	sp, #28
c0deaac4:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0deaac6:	bf00      	nop
c0deaac8:	0000195c 	.word	0x0000195c
c0deaacc:	00001ca4 	.word	0x00001ca4

c0deaad0 <bundleNavReviewStreamingConfirmRejection>:
c0deaad0:	4801      	ldr	r0, [pc, #4]	@ (c0deaad8 <bundleNavReviewStreamingConfirmRejection+0x8>)
c0deaad2:	f000 b82b 	b.w	c0deab2c <OUTLINED_FUNCTION_9>
c0deaad6:	bf00      	nop
c0deaad8:	00001ca4 	.word	0x00001ca4

c0deaadc <OUTLINED_FUNCTION_0>:
c0deaadc:	4615      	mov	r5, r2
c0deaade:	460e      	mov	r6, r1
c0deaae0:	4607      	mov	r7, r0
c0deaae2:	f7fd be0d 	b.w	c0de8700 <reset_callbacks_and_context>

c0deaae6 <OUTLINED_FUNCTION_1>:
c0deaae6:	f8da 0004 	ldr.w	r0, [sl, #4]
c0deaaea:	eb00 0086 	add.w	r0, r0, r6, lsl #2
c0deaaee:	f000 becb 	b.w	c0deb888 <pic>

c0deaaf2 <OUTLINED_FUNCTION_2>:
c0deaaf2:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0deaaf6:	2301      	movs	r3, #1
c0deaaf8:	f000 bcfe 	b.w	c0deb4f8 <nbgl_getTextHeightInWidth>

c0deaafc <OUTLINED_FUNCTION_3>:
c0deaafc:	2001      	movs	r0, #1
c0deaafe:	f000 bcab 	b.w	c0deb458 <nbgl_refreshSpecial>

c0deab02 <OUTLINED_FUNCTION_4>:
c0deab02:	2101      	movs	r1, #1
c0deab04:	eb09 0002 	add.w	r0, r9, r2
c0deab08:	f880 1068 	strb.w	r1, [r0, #104]	@ 0x68
c0deab0c:	6d81      	ldr	r1, [r0, #88]	@ 0x58
c0deab0e:	6808      	ldr	r0, [r1, #0]
c0deab10:	2800      	cmp	r0, #0
c0deab12:	4770      	bx	lr

c0deab14 <OUTLINED_FUNCTION_5>:
c0deab14:	2000      	movs	r0, #0
c0deab16:	f7fd bed1 	b.w	c0de88bc <getNbPagesForGenericContents>

c0deab1a <OUTLINED_FUNCTION_6>:
c0deab1a:	2008      	movs	r0, #8
c0deab1c:	f7f8 be9b 	b.w	c0de3856 <os_io_seph_cmd_piezo_play_tune>

c0deab20 <OUTLINED_FUNCTION_7>:
c0deab20:	9001      	str	r0, [sp, #4]
c0deab22:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0deab24:	9000      	str	r0, [sp, #0]
c0deab26:	4638      	mov	r0, r7
c0deab28:	f7fe bdaa 	b.w	c0de9680 <useCaseReview>

c0deab2c <OUTLINED_FUNCTION_9>:
c0deab2c:	4448      	add	r0, r9
c0deab2e:	6a41      	ldr	r1, [r0, #36]	@ 0x24
c0deab30:	2000      	movs	r0, #0
c0deab32:	4708      	bx	r1

c0deab34 <OUTLINED_FUNCTION_11>:
c0deab34:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0deab38:	2300      	movs	r3, #0
c0deab3a:	f000 bce2 	b.w	c0deb502 <nbgl_getTextNbLinesInWidth>

c0deab3e <OUTLINED_FUNCTION_12>:
c0deab3e:	200b      	movs	r0, #11
c0deab40:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0deab44:	f000 bcd8 	b.w	c0deb4f8 <nbgl_getTextHeightInWidth>

c0deab48 <OUTLINED_FUNCTION_13>:
c0deab48:	4630      	mov	r0, r6
c0deab4a:	f001 b9a5 	b.w	c0debe98 <__aeabi_memclr>

c0deab4e <OUTLINED_FUNCTION_14>:
c0deab4e:	f10a 0004 	add.w	r0, sl, #4
c0deab52:	f107 0110 	add.w	r1, r7, #16
c0deab56:	4770      	bx	lr

c0deab58 <bip32_path_read>:
c0deab58:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0deab5c:	b10b      	cbz	r3, c0deab62 <bip32_path_read+0xa>
c0deab5e:	2b0a      	cmp	r3, #10
c0deab60:	d902      	bls.n	c0deab68 <bip32_path_read+0x10>
c0deab62:	2000      	movs	r0, #0
c0deab64:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0deab68:	4692      	mov	sl, r2
c0deab6a:	460e      	mov	r6, r1
c0deab6c:	4683      	mov	fp, r0
c0deab6e:	425f      	negs	r7, r3
c0deab70:	2500      	movs	r5, #0
c0deab72:	f04f 0800 	mov.w	r8, #0
c0deab76:	9301      	str	r3, [sp, #4]
c0deab78:	42af      	cmp	r7, r5
c0deab7a:	d00c      	beq.n	c0deab96 <bip32_path_read+0x3e>
c0deab7c:	f108 0404 	add.w	r4, r8, #4
c0deab80:	42b4      	cmp	r4, r6
c0deab82:	d808      	bhi.n	c0deab96 <bip32_path_read+0x3e>
c0deab84:	4658      	mov	r0, fp
c0deab86:	4641      	mov	r1, r8
c0deab88:	f000 faee 	bl	c0deb168 <read_u32_be>
c0deab8c:	f84a 0008 	str.w	r0, [sl, r8]
c0deab90:	3d01      	subs	r5, #1
c0deab92:	46a0      	mov	r8, r4
c0deab94:	e7f0      	b.n	c0deab78 <bip32_path_read+0x20>
c0deab96:	9a01      	ldr	r2, [sp, #4]
c0deab98:	4269      	negs	r1, r5
c0deab9a:	2000      	movs	r0, #0
c0deab9c:	4291      	cmp	r1, r2
c0deab9e:	bf28      	it	cs
c0deaba0:	2001      	movcs	r0, #1
c0deaba2:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}

c0deaba6 <buffer_seek_cur>:
c0deaba6:	6882      	ldr	r2, [r0, #8]
c0deaba8:	1889      	adds	r1, r1, r2
c0deabaa:	d205      	bcs.n	c0deabb8 <buffer_seek_cur+0x12>
c0deabac:	6842      	ldr	r2, [r0, #4]
c0deabae:	4291      	cmp	r1, r2
c0deabb0:	bf9e      	ittt	ls
c0deabb2:	6081      	strls	r1, [r0, #8]
c0deabb4:	2001      	movls	r0, #1
c0deabb6:	4770      	bxls	lr
c0deabb8:	2000      	movs	r0, #0
c0deabba:	4770      	bx	lr

c0deabbc <buffer_read_u8>:
c0deabbc:	b510      	push	{r4, lr}
c0deabbe:	e9d0 2301 	ldrd	r2, r3, [r0, #4]
c0deabc2:	429a      	cmp	r2, r3
c0deabc4:	d00a      	beq.n	c0deabdc <buffer_read_u8+0x20>
c0deabc6:	6804      	ldr	r4, [r0, #0]
c0deabc8:	5ce4      	ldrb	r4, [r4, r3]
c0deabca:	700c      	strb	r4, [r1, #0]
c0deabcc:	6881      	ldr	r1, [r0, #8]
c0deabce:	3101      	adds	r1, #1
c0deabd0:	d206      	bcs.n	c0deabe0 <buffer_read_u8+0x24>
c0deabd2:	6844      	ldr	r4, [r0, #4]
c0deabd4:	42a1      	cmp	r1, r4
c0deabd6:	bf98      	it	ls
c0deabd8:	6081      	strls	r1, [r0, #8]
c0deabda:	e001      	b.n	c0deabe0 <buffer_read_u8+0x24>
c0deabdc:	2000      	movs	r0, #0
c0deabde:	7008      	strb	r0, [r1, #0]
c0deabe0:	1ad0      	subs	r0, r2, r3
c0deabe2:	bf18      	it	ne
c0deabe4:	2001      	movne	r0, #1
c0deabe6:	bd10      	pop	{r4, pc}

c0deabe8 <buffer_read_u64>:
c0deabe8:	b570      	push	{r4, r5, r6, lr}
c0deabea:	f000 f87d 	bl	c0deace8 <OUTLINED_FUNCTION_0>
c0deabee:	2e07      	cmp	r6, #7
c0deabf0:	d904      	bls.n	c0deabfc <buffer_read_u64+0x14>
c0deabf2:	6820      	ldr	r0, [r4, #0]
c0deabf4:	b132      	cbz	r2, c0deac04 <buffer_read_u64+0x1c>
c0deabf6:	f000 faee 	bl	c0deb1d6 <read_u64_le>
c0deabfa:	e005      	b.n	c0deac08 <buffer_read_u64+0x20>
c0deabfc:	2000      	movs	r0, #0
c0deabfe:	e9c5 0000 	strd	r0, r0, [r5]
c0deac02:	e00c      	b.n	c0deac1e <buffer_read_u64+0x36>
c0deac04:	f000 fabc 	bl	c0deb180 <read_u64_be>
c0deac08:	e9c5 0100 	strd	r0, r1, [r5]
c0deac0c:	68a0      	ldr	r0, [r4, #8]
c0deac0e:	f110 0f09 	cmn.w	r0, #9
c0deac12:	d804      	bhi.n	c0deac1e <buffer_read_u64+0x36>
c0deac14:	6861      	ldr	r1, [r4, #4]
c0deac16:	3008      	adds	r0, #8
c0deac18:	4288      	cmp	r0, r1
c0deac1a:	bf98      	it	ls
c0deac1c:	60a0      	strls	r0, [r4, #8]
c0deac1e:	2000      	movs	r0, #0
c0deac20:	2e07      	cmp	r6, #7
c0deac22:	bf88      	it	hi
c0deac24:	2001      	movhi	r0, #1
c0deac26:	bd70      	pop	{r4, r5, r6, pc}

c0deac28 <buffer_read_varint>:
c0deac28:	b5b0      	push	{r4, r5, r7, lr}
c0deac2a:	4604      	mov	r4, r0
c0deac2c:	460d      	mov	r5, r1
c0deac2e:	6800      	ldr	r0, [r0, #0]
c0deac30:	e9d4 1201 	ldrd	r1, r2, [r4, #4]
c0deac34:	4410      	add	r0, r2
c0deac36:	1a89      	subs	r1, r1, r2
c0deac38:	462a      	mov	r2, r5
c0deac3a:	f000 fae3 	bl	c0deb204 <varint_read>
c0deac3e:	f1b0 3fff 	cmp.w	r0, #4294967295	@ 0xffffffff
c0deac42:	dd0a      	ble.n	c0deac5a <buffer_read_varint+0x32>
c0deac44:	68a1      	ldr	r1, [r4, #8]
c0deac46:	1840      	adds	r0, r0, r1
c0deac48:	d205      	bcs.n	c0deac56 <buffer_read_varint+0x2e>
c0deac4a:	6861      	ldr	r1, [r4, #4]
c0deac4c:	4288      	cmp	r0, r1
c0deac4e:	bf9e      	ittt	ls
c0deac50:	60a0      	strls	r0, [r4, #8]
c0deac52:	2001      	movls	r0, #1
c0deac54:	bdb0      	popls	{r4, r5, r7, pc}
c0deac56:	2000      	movs	r0, #0
c0deac58:	bdb0      	pop	{r4, r5, r7, pc}
c0deac5a:	2000      	movs	r0, #0
c0deac5c:	e9c5 0000 	strd	r0, r0, [r5]
c0deac60:	bdb0      	pop	{r4, r5, r7, pc}

c0deac62 <buffer_read_bip32_path>:
c0deac62:	b5b0      	push	{r4, r5, r7, lr}
c0deac64:	4604      	mov	r4, r0
c0deac66:	4615      	mov	r5, r2
c0deac68:	460a      	mov	r2, r1
c0deac6a:	6800      	ldr	r0, [r0, #0]
c0deac6c:	e9d4 1301 	ldrd	r1, r3, [r4, #4]
c0deac70:	4418      	add	r0, r3
c0deac72:	1ac9      	subs	r1, r1, r3
c0deac74:	462b      	mov	r3, r5
c0deac76:	f7ff ff6f 	bl	c0deab58 <bip32_path_read>
c0deac7a:	b140      	cbz	r0, c0deac8e <buffer_read_bip32_path+0x2c>
c0deac7c:	68a2      	ldr	r2, [r4, #8]
c0deac7e:	eb02 0185 	add.w	r1, r2, r5, lsl #2
c0deac82:	4291      	cmp	r1, r2
c0deac84:	d303      	bcc.n	c0deac8e <buffer_read_bip32_path+0x2c>
c0deac86:	6862      	ldr	r2, [r4, #4]
c0deac88:	4291      	cmp	r1, r2
c0deac8a:	bf98      	it	ls
c0deac8c:	60a1      	strls	r1, [r4, #8]
c0deac8e:	bdb0      	pop	{r4, r5, r7, pc}

c0deac90 <buffer_copy>:
c0deac90:	b5b0      	push	{r4, r5, r7, lr}
c0deac92:	4614      	mov	r4, r2
c0deac94:	e9d0 3201 	ldrd	r3, r2, [r0, #4]
c0deac98:	1a9d      	subs	r5, r3, r2
c0deac9a:	42a5      	cmp	r5, r4
c0deac9c:	d806      	bhi.n	c0deacac <buffer_copy+0x1c>
c0deac9e:	6800      	ldr	r0, [r0, #0]
c0deaca0:	4402      	add	r2, r0
c0deaca2:	4608      	mov	r0, r1
c0deaca4:	4611      	mov	r1, r2
c0deaca6:	462a      	mov	r2, r5
c0deaca8:	f001 f8ee 	bl	c0debe88 <__aeabi_memmove>
c0deacac:	2000      	movs	r0, #0
c0deacae:	42a5      	cmp	r5, r4
c0deacb0:	bf98      	it	ls
c0deacb2:	2001      	movls	r0, #1
c0deacb4:	bdb0      	pop	{r4, r5, r7, pc}

c0deacb6 <buffer_move>:
c0deacb6:	b5b0      	push	{r4, r5, r7, lr}
c0deacb8:	4615      	mov	r5, r2
c0deacba:	4604      	mov	r4, r0
c0deacbc:	e9d0 2001 	ldrd	r2, r0, [r0, #4]
c0deacc0:	1a12      	subs	r2, r2, r0
c0deacc2:	42aa      	cmp	r2, r5
c0deacc4:	bf84      	itt	hi
c0deacc6:	2000      	movhi	r0, #0
c0deacc8:	bdb0      	pophi	{r4, r5, r7, pc}
c0deacca:	6823      	ldr	r3, [r4, #0]
c0deaccc:	4403      	add	r3, r0
c0deacce:	4608      	mov	r0, r1
c0deacd0:	4619      	mov	r1, r3
c0deacd2:	f001 f8d9 	bl	c0debe88 <__aeabi_memmove>
c0deacd6:	68a0      	ldr	r0, [r4, #8]
c0deacd8:	1940      	adds	r0, r0, r5
c0deacda:	d203      	bcs.n	c0deace4 <buffer_move+0x2e>
c0deacdc:	6861      	ldr	r1, [r4, #4]
c0deacde:	4288      	cmp	r0, r1
c0deace0:	bf98      	it	ls
c0deace2:	60a0      	strls	r0, [r4, #8]
c0deace4:	2001      	movs	r0, #1
c0deace6:	bdb0      	pop	{r4, r5, r7, pc}

c0deace8 <OUTLINED_FUNCTION_0>:
c0deace8:	4604      	mov	r4, r0
c0deacea:	460d      	mov	r5, r1
c0deacec:	6840      	ldr	r0, [r0, #4]
c0deacee:	68a1      	ldr	r1, [r4, #8]
c0deacf0:	1a46      	subs	r6, r0, r1
c0deacf2:	4770      	bx	lr

c0deacf4 <bip32_derive_with_seed_init_privkey_256>:
c0deacf4:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0deacf8:	b095      	sub	sp, #84	@ 0x54
c0deacfa:	460d      	mov	r5, r1
c0deacfc:	4607      	mov	r7, r0
c0deacfe:	a904      	add	r1, sp, #16
c0dead00:	469a      	mov	sl, r3
c0dead02:	4614      	mov	r4, r2
c0dead04:	4628      	mov	r0, r5
c0dead06:	f000 fee9 	bl	c0debadc <cx_ecdomain_parameters_length>
c0dead0a:	f8dd 8070 	ldr.w	r8, [sp, #112]	@ 0x70
c0dead0e:	4606      	mov	r6, r0
c0dead10:	b9e0      	cbnz	r0, c0dead4c <bip32_derive_with_seed_init_privkey_256+0x58>
c0dead12:	9804      	ldr	r0, [sp, #16]
c0dead14:	2820      	cmp	r0, #32
c0dead16:	d117      	bne.n	c0dead48 <bip32_derive_with_seed_init_privkey_256+0x54>
c0dead18:	981f      	ldr	r0, [sp, #124]	@ 0x7c
c0dead1a:	e9dd 211d 	ldrd	r2, r1, [sp, #116]	@ 0x74
c0dead1e:	ab05      	add	r3, sp, #20
c0dead20:	e9cd 3200 	strd	r3, r2, [sp]
c0dead24:	e9cd 1002 	strd	r1, r0, [sp, #8]
c0dead28:	4638      	mov	r0, r7
c0dead2a:	4629      	mov	r1, r5
c0dead2c:	4622      	mov	r2, r4
c0dead2e:	4653      	mov	r3, sl
c0dead30:	f000 f818 	bl	c0dead64 <os_derive_bip32_with_seed_no_throw>
c0dead34:	4606      	mov	r6, r0
c0dead36:	b948      	cbnz	r0, c0dead4c <bip32_derive_with_seed_init_privkey_256+0x58>
c0dead38:	9a04      	ldr	r2, [sp, #16]
c0dead3a:	a905      	add	r1, sp, #20
c0dead3c:	4628      	mov	r0, r5
c0dead3e:	4643      	mov	r3, r8
c0dead40:	f000 fb61 	bl	c0deb406 <cx_ecfp_init_private_key_no_throw>
c0dead44:	4606      	mov	r6, r0
c0dead46:	e001      	b.n	c0dead4c <bip32_derive_with_seed_init_privkey_256+0x58>
c0dead48:	f06f 065c 	mvn.w	r6, #92	@ 0x5c
c0dead4c:	a805      	add	r0, sp, #20
c0dead4e:	2140      	movs	r1, #64	@ 0x40
c0dead50:	f001 f8b0 	bl	c0debeb4 <explicit_bzero>
c0dead54:	b116      	cbz	r6, c0dead5c <bip32_derive_with_seed_init_privkey_256+0x68>
c0dead56:	4640      	mov	r0, r8
c0dead58:	f000 f89f 	bl	c0deae9a <OUTLINED_FUNCTION_0>
c0dead5c:	4630      	mov	r0, r6
c0dead5e:	b015      	add	sp, #84	@ 0x54
c0dead60:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}

c0dead64 <os_derive_bip32_with_seed_no_throw>:
c0dead64:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dead68:	b090      	sub	sp, #64	@ 0x40
c0dead6a:	f10d 0810 	add.w	r8, sp, #16
c0dead6e:	4607      	mov	r7, r0
c0dead70:	469b      	mov	fp, r3
c0dead72:	4616      	mov	r6, r2
c0dead74:	460c      	mov	r4, r1
c0dead76:	4640      	mov	r0, r8
c0dead78:	f001 f8e2 	bl	c0debf40 <setjmp>
c0dead7c:	b285      	uxth	r5, r0
c0dead7e:	f8dd a060 	ldr.w	sl, [sp, #96]	@ 0x60
c0dead82:	f8ad 003c 	strh.w	r0, [sp, #60]	@ 0x3c
c0dead86:	b155      	cbz	r5, c0dead9e <os_derive_bip32_with_seed_no_throw+0x3a>
c0dead88:	2000      	movs	r0, #0
c0dead8a:	f8ad 003c 	strh.w	r0, [sp, #60]	@ 0x3c
c0dead8e:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0dead90:	f000 ff4c 	bl	c0debc2c <try_context_set>
c0dead94:	2140      	movs	r1, #64	@ 0x40
c0dead96:	4650      	mov	r0, sl
c0dead98:	f001 f88c 	bl	c0debeb4 <explicit_bzero>
c0dead9c:	e012      	b.n	c0deadc4 <os_derive_bip32_with_seed_no_throw+0x60>
c0dead9e:	a804      	add	r0, sp, #16
c0deada0:	f000 ff44 	bl	c0debc2c <try_context_set>
c0deada4:	9919      	ldr	r1, [sp, #100]	@ 0x64
c0deada6:	900e      	str	r0, [sp, #56]	@ 0x38
c0deada8:	4668      	mov	r0, sp
c0deadaa:	4632      	mov	r2, r6
c0deadac:	465b      	mov	r3, fp
c0deadae:	f8c0 a000 	str.w	sl, [r0]
c0deadb2:	6041      	str	r1, [r0, #4]
c0deadb4:	991a      	ldr	r1, [sp, #104]	@ 0x68
c0deadb6:	6081      	str	r1, [r0, #8]
c0deadb8:	991b      	ldr	r1, [sp, #108]	@ 0x6c
c0deadba:	60c1      	str	r1, [r0, #12]
c0deadbc:	4638      	mov	r0, r7
c0deadbe:	4621      	mov	r1, r4
c0deadc0:	f000 fe96 	bl	c0debaf0 <os_perso_derive_node_with_seed_key>
c0deadc4:	f000 ff2a 	bl	c0debc1c <try_context_get>
c0deadc8:	4540      	cmp	r0, r8
c0deadca:	d102      	bne.n	c0deadd2 <os_derive_bip32_with_seed_no_throw+0x6e>
c0deadcc:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0deadce:	f000 ff2d 	bl	c0debc2c <try_context_set>
c0deadd2:	f8bd 003c 	ldrh.w	r0, [sp, #60]	@ 0x3c
c0deadd6:	b918      	cbnz	r0, c0deade0 <os_derive_bip32_with_seed_no_throw+0x7c>
c0deadd8:	4628      	mov	r0, r5
c0deadda:	b010      	add	sp, #64	@ 0x40
c0deaddc:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0deade0:	f000 fbb9 	bl	c0deb556 <os_longjmp>

c0deade4 <bip32_derive_with_seed_get_pubkey_256>:
c0deade4:	b5f0      	push	{r4, r5, r6, r7, lr}
c0deade6:	b0a1      	sub	sp, #132	@ 0x84
c0deade8:	460e      	mov	r6, r1
c0deadea:	992a      	ldr	r1, [sp, #168]	@ 0xa8
c0deadec:	9103      	str	r1, [sp, #12]
c0deadee:	9929      	ldr	r1, [sp, #164]	@ 0xa4
c0deadf0:	9102      	str	r1, [sp, #8]
c0deadf2:	9927      	ldr	r1, [sp, #156]	@ 0x9c
c0deadf4:	9101      	str	r1, [sp, #4]
c0deadf6:	a917      	add	r1, sp, #92	@ 0x5c
c0deadf8:	9100      	str	r1, [sp, #0]
c0deadfa:	4631      	mov	r1, r6
c0deadfc:	f7ff ff7a 	bl	c0deacf4 <bip32_derive_with_seed_init_privkey_256>
c0deae00:	9c26      	ldr	r4, [sp, #152]	@ 0x98
c0deae02:	4605      	mov	r5, r0
c0deae04:	b9b8      	cbnz	r0, c0deae36 <bip32_derive_with_seed_get_pubkey_256+0x52>
c0deae06:	9828      	ldr	r0, [sp, #160]	@ 0xa0
c0deae08:	2301      	movs	r3, #1
c0deae0a:	9000      	str	r0, [sp, #0]
c0deae0c:	af04      	add	r7, sp, #16
c0deae0e:	aa17      	add	r2, sp, #92	@ 0x5c
c0deae10:	4630      	mov	r0, r6
c0deae12:	4639      	mov	r1, r7
c0deae14:	f000 faf2 	bl	c0deb3fc <cx_ecfp_generate_pair2_no_throw>
c0deae18:	4605      	mov	r5, r0
c0deae1a:	b960      	cbnz	r0, c0deae36 <bip32_derive_with_seed_get_pubkey_256+0x52>
c0deae1c:	9805      	ldr	r0, [sp, #20]
c0deae1e:	2841      	cmp	r0, #65	@ 0x41
c0deae20:	d107      	bne.n	c0deae32 <bip32_derive_with_seed_get_pubkey_256+0x4e>
c0deae22:	f107 0108 	add.w	r1, r7, #8
c0deae26:	4620      	mov	r0, r4
c0deae28:	2241      	movs	r2, #65	@ 0x41
c0deae2a:	f001 f82b 	bl	c0debe84 <__aeabi_memcpy>
c0deae2e:	2500      	movs	r5, #0
c0deae30:	e001      	b.n	c0deae36 <bip32_derive_with_seed_get_pubkey_256+0x52>
c0deae32:	f06f 055c 	mvn.w	r5, #92	@ 0x5c
c0deae36:	a817      	add	r0, sp, #92	@ 0x5c
c0deae38:	f000 f82f 	bl	c0deae9a <OUTLINED_FUNCTION_0>
c0deae3c:	b11d      	cbz	r5, c0deae46 <bip32_derive_with_seed_get_pubkey_256+0x62>
c0deae3e:	4620      	mov	r0, r4
c0deae40:	2141      	movs	r1, #65	@ 0x41
c0deae42:	f001 f837 	bl	c0debeb4 <explicit_bzero>
c0deae46:	4628      	mov	r0, r5
c0deae48:	b021      	add	sp, #132	@ 0x84
c0deae4a:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0deae4c <bip32_derive_with_seed_ecdsa_sign_hash_256>:
c0deae4c:	b5f0      	push	{r4, r5, r6, r7, lr}
c0deae4e:	b08f      	sub	sp, #60	@ 0x3c
c0deae50:	9f19      	ldr	r7, [sp, #100]	@ 0x64
c0deae52:	9d1c      	ldr	r5, [sp, #112]	@ 0x70
c0deae54:	683c      	ldr	r4, [r7, #0]
c0deae56:	9503      	str	r5, [sp, #12]
c0deae58:	9d1b      	ldr	r5, [sp, #108]	@ 0x6c
c0deae5a:	9502      	str	r5, [sp, #8]
c0deae5c:	2500      	movs	r5, #0
c0deae5e:	9501      	str	r5, [sp, #4]
c0deae60:	ad05      	add	r5, sp, #20
c0deae62:	9500      	str	r5, [sp, #0]
c0deae64:	f7ff ff46 	bl	c0deacf4 <bip32_derive_with_seed_init_privkey_256>
c0deae68:	9d18      	ldr	r5, [sp, #96]	@ 0x60
c0deae6a:	4606      	mov	r6, r0
c0deae6c:	b950      	cbnz	r0, c0deae84 <bip32_derive_with_seed_ecdsa_sign_hash_256+0x38>
c0deae6e:	ae14      	add	r6, sp, #80	@ 0x50
c0deae70:	981a      	ldr	r0, [sp, #104]	@ 0x68
c0deae72:	ce4e      	ldmia	r6, {r1, r2, r3, r6}
c0deae74:	e9cd 6500 	strd	r6, r5, [sp]
c0deae78:	e9cd 7002 	strd	r7, r0, [sp, #8]
c0deae7c:	a805      	add	r0, sp, #20
c0deae7e:	f000 fab8 	bl	c0deb3f2 <cx_ecdsa_sign_no_throw>
c0deae82:	4606      	mov	r6, r0
c0deae84:	a805      	add	r0, sp, #20
c0deae86:	f000 f808 	bl	c0deae9a <OUTLINED_FUNCTION_0>
c0deae8a:	b11e      	cbz	r6, c0deae94 <bip32_derive_with_seed_ecdsa_sign_hash_256+0x48>
c0deae8c:	4628      	mov	r0, r5
c0deae8e:	4621      	mov	r1, r4
c0deae90:	f001 f810 	bl	c0debeb4 <explicit_bzero>
c0deae94:	4630      	mov	r0, r6
c0deae96:	b00f      	add	sp, #60	@ 0x3c
c0deae98:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0deae9a <OUTLINED_FUNCTION_0>:
c0deae9a:	2128      	movs	r1, #40	@ 0x28
c0deae9c:	f001 b80a 	b.w	c0debeb4 <explicit_bzero>

c0deaea0 <format_u64>:
c0deaea0:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0deaea4:	b1f9      	cbz	r1, c0deaee6 <format_u64+0x46>
c0deaea6:	4615      	mov	r5, r2
c0deaea8:	4604      	mov	r4, r0
c0deaeaa:	f1a1 0801 	sub.w	r8, r1, #1
c0deaeae:	2700      	movs	r7, #0
c0deaeb0:	2600      	movs	r6, #0
c0deaeb2:	f1b5 000a 	subs.w	r0, r5, #10
c0deaeb6:	f173 0000 	sbcs.w	r0, r3, #0
c0deaeba:	d316      	bcc.n	c0deaeea <format_u64+0x4a>
c0deaebc:	4619      	mov	r1, r3
c0deaebe:	4628      	mov	r0, r5
c0deaec0:	220a      	movs	r2, #10
c0deaec2:	2300      	movs	r3, #0
c0deaec4:	f000 ffec 	bl	c0debea0 <__aeabi_uldivmod>
c0deaec8:	460b      	mov	r3, r1
c0deaeca:	eb00 0180 	add.w	r1, r0, r0, lsl #2
c0deaece:	1cba      	adds	r2, r7, #2
c0deaed0:	eba5 0141 	sub.w	r1, r5, r1, lsl #1
c0deaed4:	4605      	mov	r5, r0
c0deaed6:	f041 0130 	orr.w	r1, r1, #48	@ 0x30
c0deaeda:	55e1      	strb	r1, [r4, r7]
c0deaedc:	1c79      	adds	r1, r7, #1
c0deaede:	4542      	cmp	r2, r8
c0deaee0:	460f      	mov	r7, r1
c0deaee2:	d9e6      	bls.n	c0deaeb2 <format_u64+0x12>
c0deaee4:	e012      	b.n	c0deaf0c <format_u64+0x6c>
c0deaee6:	2600      	movs	r6, #0
c0deaee8:	e010      	b.n	c0deaf0c <format_u64+0x6c>
c0deaeea:	f105 0030 	add.w	r0, r5, #48	@ 0x30
c0deaeee:	19e1      	adds	r1, r4, r7
c0deaef0:	55e0      	strb	r0, [r4, r7]
c0deaef2:	2000      	movs	r0, #0
c0deaef4:	7048      	strb	r0, [r1, #1]
c0deaef6:	b2c1      	uxtb	r1, r0
c0deaef8:	428f      	cmp	r7, r1
c0deaefa:	d906      	bls.n	c0deaf0a <format_u64+0x6a>
c0deaefc:	5c62      	ldrb	r2, [r4, r1]
c0deaefe:	5de3      	ldrb	r3, [r4, r7]
c0deaf00:	3001      	adds	r0, #1
c0deaf02:	5463      	strb	r3, [r4, r1]
c0deaf04:	55e2      	strb	r2, [r4, r7]
c0deaf06:	3f01      	subs	r7, #1
c0deaf08:	e7f5      	b.n	c0deaef6 <format_u64+0x56>
c0deaf0a:	2601      	movs	r6, #1
c0deaf0c:	4630      	mov	r0, r6
c0deaf0e:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

c0deaf12 <format_fpu64>:
c0deaf12:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0deaf16:	b086      	sub	sp, #24
c0deaf18:	466c      	mov	r4, sp
c0deaf1a:	4688      	mov	r8, r1
c0deaf1c:	4605      	mov	r5, r0
c0deaf1e:	2115      	movs	r1, #21
c0deaf20:	461e      	mov	r6, r3
c0deaf22:	4617      	mov	r7, r2
c0deaf24:	4620      	mov	r0, r4
c0deaf26:	f000 ffb7 	bl	c0debe98 <__aeabi_memclr>
c0deaf2a:	4620      	mov	r0, r4
c0deaf2c:	2115      	movs	r1, #21
c0deaf2e:	463a      	mov	r2, r7
c0deaf30:	4633      	mov	r3, r6
c0deaf32:	f7ff ffb5 	bl	c0deaea0 <format_u64>
c0deaf36:	b340      	cbz	r0, c0deaf8a <format_fpu64+0x78>
c0deaf38:	466f      	mov	r7, sp
c0deaf3a:	9e0c      	ldr	r6, [sp, #48]	@ 0x30
c0deaf3c:	4638      	mov	r0, r7
c0deaf3e:	f001 f817 	bl	c0debf70 <strlen>
c0deaf42:	42b0      	cmp	r0, r6
c0deaf44:	d910      	bls.n	c0deaf68 <format_fpu64+0x56>
c0deaf46:	1831      	adds	r1, r6, r0
c0deaf48:	3101      	adds	r1, #1
c0deaf4a:	4541      	cmp	r1, r8
c0deaf4c:	d21d      	bcs.n	c0deaf8a <format_fpu64+0x78>
c0deaf4e:	1b84      	subs	r4, r0, r6
c0deaf50:	4628      	mov	r0, r5
c0deaf52:	4639      	mov	r1, r7
c0deaf54:	4622      	mov	r2, r4
c0deaf56:	f000 ff95 	bl	c0debe84 <__aeabi_memcpy>
c0deaf5a:	1928      	adds	r0, r5, r4
c0deaf5c:	212e      	movs	r1, #46	@ 0x2e
c0deaf5e:	4632      	mov	r2, r6
c0deaf60:	f800 1b01 	strb.w	r1, [r0], #1
c0deaf64:	1939      	adds	r1, r7, r4
c0deaf66:	e015      	b.n	c0deaf94 <format_fpu64+0x82>
c0deaf68:	1a32      	subs	r2, r6, r0
c0deaf6a:	1c91      	adds	r1, r2, #2
c0deaf6c:	4541      	cmp	r1, r8
c0deaf6e:	d20c      	bcs.n	c0deaf8a <format_fpu64+0x78>
c0deaf70:	202e      	movs	r0, #46	@ 0x2e
c0deaf72:	2330      	movs	r3, #48	@ 0x30
c0deaf74:	2400      	movs	r4, #0
c0deaf76:	7068      	strb	r0, [r5, #1]
c0deaf78:	1ca8      	adds	r0, r5, #2
c0deaf7a:	702b      	strb	r3, [r5, #0]
c0deaf7c:	b2a5      	uxth	r5, r4
c0deaf7e:	42aa      	cmp	r2, r5
c0deaf80:	d905      	bls.n	c0deaf8e <format_fpu64+0x7c>
c0deaf82:	f800 3b01 	strb.w	r3, [r0], #1
c0deaf86:	3401      	adds	r4, #1
c0deaf88:	e7f8      	b.n	c0deaf7c <format_fpu64+0x6a>
c0deaf8a:	2000      	movs	r0, #0
c0deaf8c:	e005      	b.n	c0deaf9a <format_fpu64+0x88>
c0deaf8e:	eba8 0201 	sub.w	r2, r8, r1
c0deaf92:	4669      	mov	r1, sp
c0deaf94:	f000 fff4 	bl	c0debf80 <strncpy>
c0deaf98:	2001      	movs	r0, #1
c0deaf9a:	b006      	add	sp, #24
c0deaf9c:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

c0deafa0 <format_hex>:
c0deafa0:	b5f0      	push	{r4, r5, r6, r7, lr}
c0deafa2:	4604      	mov	r4, r0
c0deafa4:	0048      	lsls	r0, r1, #1
c0deafa6:	f100 0c01 	add.w	ip, r0, #1
c0deafaa:	459c      	cmp	ip, r3
c0deafac:	d902      	bls.n	c0deafb4 <format_hex+0x14>
c0deafae:	f04f 3cff 	mov.w	ip, #4294967295	@ 0xffffffff
c0deafb2:	e018      	b.n	c0deafe6 <format_hex+0x46>
c0deafb4:	480d      	ldr	r0, [pc, #52]	@ (c0deafec <format_hex+0x4c>)
c0deafb6:	2500      	movs	r5, #0
c0deafb8:	4478      	add	r0, pc
c0deafba:	b191      	cbz	r1, c0deafe2 <format_hex+0x42>
c0deafbc:	1cef      	adds	r7, r5, #3
c0deafbe:	429f      	cmp	r7, r3
c0deafc0:	d80d      	bhi.n	c0deafde <format_hex+0x3e>
c0deafc2:	7827      	ldrb	r7, [r4, #0]
c0deafc4:	3901      	subs	r1, #1
c0deafc6:	093f      	lsrs	r7, r7, #4
c0deafc8:	5dc7      	ldrb	r7, [r0, r7]
c0deafca:	5557      	strb	r7, [r2, r5]
c0deafcc:	1957      	adds	r7, r2, r5
c0deafce:	3502      	adds	r5, #2
c0deafd0:	f814 6b01 	ldrb.w	r6, [r4], #1
c0deafd4:	f006 060f 	and.w	r6, r6, #15
c0deafd8:	5d86      	ldrb	r6, [r0, r6]
c0deafda:	707e      	strb	r6, [r7, #1]
c0deafdc:	e7ed      	b.n	c0deafba <format_hex+0x1a>
c0deafde:	f105 0c01 	add.w	ip, r5, #1
c0deafe2:	2000      	movs	r0, #0
c0deafe4:	5550      	strb	r0, [r2, r5]
c0deafe6:	4660      	mov	r0, ip
c0deafe8:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0deafea:	bf00      	nop
c0deafec:	0000283e 	.word	0x0000283e

c0deaff0 <app_ticker_event_callback>:
c0deaff0:	4770      	bx	lr
	...

c0deaff4 <io_event>:
c0deaff4:	b580      	push	{r7, lr}
c0deaff6:	480b      	ldr	r0, [pc, #44]	@ (c0deb024 <io_event+0x30>)
c0deaff8:	f819 1000 	ldrb.w	r1, [r9, r0]
c0deaffc:	2905      	cmp	r1, #5
c0deaffe:	d00e      	beq.n	c0deb01e <io_event+0x2a>
c0deb000:	290e      	cmp	r1, #14
c0deb002:	d005      	beq.n	c0deb010 <io_event+0x1c>
c0deb004:	290c      	cmp	r1, #12
c0deb006:	d108      	bne.n	c0deb01a <io_event+0x26>
c0deb008:	4448      	add	r0, r9
c0deb00a:	f000 f92f 	bl	c0deb26c <ux_process_finger_event>
c0deb00e:	e006      	b.n	c0deb01e <io_event+0x2a>
c0deb010:	f7ff ffee 	bl	c0deaff0 <app_ticker_event_callback>
c0deb014:	f000 f980 	bl	c0deb318 <ux_process_ticker_event>
c0deb018:	e001      	b.n	c0deb01e <io_event+0x2a>
c0deb01a:	f000 f9b3 	bl	c0deb384 <ux_process_default_event>
c0deb01e:	2001      	movs	r0, #1
c0deb020:	bd80      	pop	{r7, pc}
c0deb022:	bf00      	nop
c0deb024:	00001cec 	.word	0x00001cec

c0deb028 <io_init>:
c0deb028:	4802      	ldr	r0, [pc, #8]	@ (c0deb034 <io_init+0xc>)
c0deb02a:	2101      	movs	r1, #1
c0deb02c:	f809 1000 	strb.w	r1, [r9, r0]
c0deb030:	4770      	bx	lr
c0deb032:	bf00      	nop
c0deb034:	00001dfc 	.word	0x00001dfc

c0deb038 <io_recv_command>:
c0deb038:	b510      	push	{r4, lr}
c0deb03a:	4c09      	ldr	r4, [pc, #36]	@ (c0deb060 <io_recv_command+0x28>)
c0deb03c:	f819 0004 	ldrb.w	r0, [r9, r4]
c0deb040:	2801      	cmp	r0, #1
c0deb042:	d104      	bne.n	c0deb04e <io_recv_command+0x16>
c0deb044:	f000 fdc8 	bl	c0debbd8 <os_io_start>
c0deb048:	2000      	movs	r0, #0
c0deb04a:	f809 0004 	strb.w	r0, [r9, r4]
c0deb04e:	2000      	movs	r0, #0
c0deb050:	2800      	cmp	r0, #0
c0deb052:	dc03      	bgt.n	c0deb05c <io_recv_command+0x24>
c0deb054:	2001      	movs	r0, #1
c0deb056:	f7f8 fc91 	bl	c0de397c <io_legacy_apdu_rx>
c0deb05a:	e7f9      	b.n	c0deb050 <io_recv_command+0x18>
c0deb05c:	bd10      	pop	{r4, pc}
c0deb05e:	bf00      	nop
c0deb060:	00001dfc 	.word	0x00001dfc

c0deb064 <io_send_response_buffers>:
c0deb064:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0deb068:	f8df a060 	ldr.w	sl, [pc, #96]	@ c0deb0cc <io_send_response_buffers+0x68>
c0deb06c:	4690      	mov	r8, r2
c0deb06e:	460f      	mov	r7, r1
c0deb070:	4605      	mov	r5, r0
c0deb072:	f240 140f 	movw	r4, #271	@ 0x10f
c0deb076:	2600      	movs	r6, #0
c0deb078:	b1b5      	cbz	r5, c0deb0a8 <io_send_response_buffers+0x44>
c0deb07a:	b1af      	cbz	r7, c0deb0a8 <io_send_response_buffers+0x44>
c0deb07c:	2600      	movs	r6, #0
c0deb07e:	b19f      	cbz	r7, c0deb0a8 <io_send_response_buffers+0x44>
c0deb080:	eb09 000a 	add.w	r0, r9, sl
c0deb084:	1ba2      	subs	r2, r4, r6
c0deb086:	1981      	adds	r1, r0, r6
c0deb088:	4628      	mov	r0, r5
c0deb08a:	f7ff fe01 	bl	c0deac90 <buffer_copy>
c0deb08e:	b130      	cbz	r0, c0deb09e <io_send_response_buffers+0x3a>
c0deb090:	e9d5 0101 	ldrd	r0, r1, [r5, #4]
c0deb094:	350c      	adds	r5, #12
c0deb096:	3f01      	subs	r7, #1
c0deb098:	4430      	add	r0, r6
c0deb09a:	1a46      	subs	r6, r0, r1
c0deb09c:	e7ef      	b.n	c0deb07e <io_send_response_buffers+0x1a>
c0deb09e:	f44f 4830 	mov.w	r8, #45056	@ 0xb000
c0deb0a2:	2500      	movs	r5, #0
c0deb0a4:	2700      	movs	r7, #0
c0deb0a6:	e7e6      	b.n	c0deb076 <io_send_response_buffers+0x12>
c0deb0a8:	eb09 050a 	add.w	r5, r9, sl
c0deb0ac:	fa1f f288 	uxth.w	r2, r8
c0deb0b0:	4631      	mov	r1, r6
c0deb0b2:	4628      	mov	r0, r5
c0deb0b4:	f000 f8d4 	bl	c0deb260 <write_u16_be>
c0deb0b8:	1cb0      	adds	r0, r6, #2
c0deb0ba:	b281      	uxth	r1, r0
c0deb0bc:	4628      	mov	r0, r5
c0deb0be:	f7f8 fc43 	bl	c0de3948 <io_legacy_apdu_tx>
c0deb0c2:	ea40 70e0 	orr.w	r0, r0, r0, asr #31
c0deb0c6:	e8bd 85f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}
c0deb0ca:	bf00      	nop
c0deb0cc:	000014f7 	.word	0x000014f7

c0deb0d0 <app_exit>:
c0deb0d0:	20ff      	movs	r0, #255	@ 0xff
c0deb0d2:	f000 fd6d 	bl	c0debbb0 <os_sched_exit>

c0deb0d6 <common_app_init>:
c0deb0d6:	b580      	push	{r7, lr}
c0deb0d8:	f000 f9c8 	bl	c0deb46c <nbgl_objInit>
c0deb0dc:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0deb0e0:	f7f8 bd78 	b.w	c0de3bd4 <io_seproxyhal_init>

c0deb0e4 <standalone_app_main>:
c0deb0e4:	b510      	push	{r4, lr}
c0deb0e6:	b08c      	sub	sp, #48	@ 0x30
c0deb0e8:	466c      	mov	r4, sp
c0deb0ea:	4620      	mov	r0, r4
c0deb0ec:	f000 ff28 	bl	c0debf40 <setjmp>
c0deb0f0:	f8ad 002c 	strh.w	r0, [sp, #44]	@ 0x2c
c0deb0f4:	0400      	lsls	r0, r0, #16
c0deb0f6:	d108      	bne.n	c0deb10a <standalone_app_main+0x26>
c0deb0f8:	4668      	mov	r0, sp
c0deb0fa:	f000 fd97 	bl	c0debc2c <try_context_set>
c0deb0fe:	900a      	str	r0, [sp, #40]	@ 0x28
c0deb100:	f7ff ffe9 	bl	c0deb0d6 <common_app_init>
c0deb104:	f7f5 f8ce 	bl	c0de02a4 <app_main>
c0deb108:	e005      	b.n	c0deb116 <standalone_app_main+0x32>
c0deb10a:	2000      	movs	r0, #0
c0deb10c:	f8ad 002c 	strh.w	r0, [sp, #44]	@ 0x2c
c0deb110:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0deb112:	f000 fd8b 	bl	c0debc2c <try_context_set>
c0deb116:	f000 fd81 	bl	c0debc1c <try_context_get>
c0deb11a:	42a0      	cmp	r0, r4
c0deb11c:	d102      	bne.n	c0deb124 <standalone_app_main+0x40>
c0deb11e:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0deb120:	f000 fd84 	bl	c0debc2c <try_context_set>
c0deb124:	f8bd 002c 	ldrh.w	r0, [sp, #44]	@ 0x2c
c0deb128:	b908      	cbnz	r0, c0deb12e <standalone_app_main+0x4a>
c0deb12a:	f7ff ffd1 	bl	c0deb0d0 <app_exit>
c0deb12e:	f000 fa12 	bl	c0deb556 <os_longjmp>

c0deb132 <apdu_parser>:
c0deb132:	2a04      	cmp	r2, #4
c0deb134:	d316      	bcc.n	c0deb164 <apdu_parser+0x32>
c0deb136:	d102      	bne.n	c0deb13e <apdu_parser+0xc>
c0deb138:	2300      	movs	r3, #0
c0deb13a:	7103      	strb	r3, [r0, #4]
c0deb13c:	e004      	b.n	c0deb148 <apdu_parser+0x16>
c0deb13e:	790b      	ldrb	r3, [r1, #4]
c0deb140:	3a05      	subs	r2, #5
c0deb142:	429a      	cmp	r2, r3
c0deb144:	7103      	strb	r3, [r0, #4]
c0deb146:	d10d      	bne.n	c0deb164 <apdu_parser+0x32>
c0deb148:	780a      	ldrb	r2, [r1, #0]
c0deb14a:	2b00      	cmp	r3, #0
c0deb14c:	7002      	strb	r2, [r0, #0]
c0deb14e:	784a      	ldrb	r2, [r1, #1]
c0deb150:	7042      	strb	r2, [r0, #1]
c0deb152:	788a      	ldrb	r2, [r1, #2]
c0deb154:	7082      	strb	r2, [r0, #2]
c0deb156:	bf18      	it	ne
c0deb158:	1d4b      	addne	r3, r1, #5
c0deb15a:	78c9      	ldrb	r1, [r1, #3]
c0deb15c:	6083      	str	r3, [r0, #8]
c0deb15e:	70c1      	strb	r1, [r0, #3]
c0deb160:	2001      	movs	r0, #1
c0deb162:	4770      	bx	lr
c0deb164:	2000      	movs	r0, #0
c0deb166:	4770      	bx	lr

c0deb168 <read_u32_be>:
c0deb168:	5c42      	ldrb	r2, [r0, r1]
c0deb16a:	4408      	add	r0, r1
c0deb16c:	7841      	ldrb	r1, [r0, #1]
c0deb16e:	7883      	ldrb	r3, [r0, #2]
c0deb170:	78c0      	ldrb	r0, [r0, #3]
c0deb172:	0409      	lsls	r1, r1, #16
c0deb174:	ea41 6102 	orr.w	r1, r1, r2, lsl #24
c0deb178:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0deb17c:	4408      	add	r0, r1
c0deb17e:	4770      	bx	lr

c0deb180 <read_u64_be>:
c0deb180:	b5f0      	push	{r4, r5, r6, r7, lr}
c0deb182:	1842      	adds	r2, r0, r1
c0deb184:	5c40      	ldrb	r0, [r0, r1]
c0deb186:	7917      	ldrb	r7, [r2, #4]
c0deb188:	7953      	ldrb	r3, [r2, #5]
c0deb18a:	7854      	ldrb	r4, [r2, #1]
c0deb18c:	7895      	ldrb	r5, [r2, #2]
c0deb18e:	78d6      	ldrb	r6, [r2, #3]
c0deb190:	063f      	lsls	r7, r7, #24
c0deb192:	0421      	lsls	r1, r4, #16
c0deb194:	ea47 4303 	orr.w	r3, r7, r3, lsl #16
c0deb198:	7997      	ldrb	r7, [r2, #6]
c0deb19a:	79d2      	ldrb	r2, [r2, #7]
c0deb19c:	ea41 6000 	orr.w	r0, r1, r0, lsl #24
c0deb1a0:	ea40 2005 	orr.w	r0, r0, r5, lsl #8
c0deb1a4:	ea43 2307 	orr.w	r3, r3, r7, lsl #8
c0deb1a8:	1981      	adds	r1, r0, r6
c0deb1aa:	441a      	add	r2, r3
c0deb1ac:	4610      	mov	r0, r2
c0deb1ae:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0deb1b0 <read_u16_le>:
c0deb1b0:	5c42      	ldrb	r2, [r0, r1]
c0deb1b2:	4408      	add	r0, r1
c0deb1b4:	7840      	ldrb	r0, [r0, #1]
c0deb1b6:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0deb1ba:	b280      	uxth	r0, r0
c0deb1bc:	4770      	bx	lr

c0deb1be <read_u32_le>:
c0deb1be:	5c42      	ldrb	r2, [r0, r1]
c0deb1c0:	4408      	add	r0, r1
c0deb1c2:	7841      	ldrb	r1, [r0, #1]
c0deb1c4:	7883      	ldrb	r3, [r0, #2]
c0deb1c6:	78c0      	ldrb	r0, [r0, #3]
c0deb1c8:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0deb1cc:	ea41 4103 	orr.w	r1, r1, r3, lsl #16
c0deb1d0:	ea41 6000 	orr.w	r0, r1, r0, lsl #24
c0deb1d4:	4770      	bx	lr

c0deb1d6 <read_u64_le>:
c0deb1d6:	b5b0      	push	{r4, r5, r7, lr}
c0deb1d8:	5c42      	ldrb	r2, [r0, r1]
c0deb1da:	4401      	add	r1, r0
c0deb1dc:	7848      	ldrb	r0, [r1, #1]
c0deb1de:	788b      	ldrb	r3, [r1, #2]
c0deb1e0:	790d      	ldrb	r5, [r1, #4]
c0deb1e2:	78cc      	ldrb	r4, [r1, #3]
c0deb1e4:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0deb1e8:	794a      	ldrb	r2, [r1, #5]
c0deb1ea:	ea40 4003 	orr.w	r0, r0, r3, lsl #16
c0deb1ee:	798b      	ldrb	r3, [r1, #6]
c0deb1f0:	79c9      	ldrb	r1, [r1, #7]
c0deb1f2:	ea45 2202 	orr.w	r2, r5, r2, lsl #8
c0deb1f6:	ea40 6004 	orr.w	r0, r0, r4, lsl #24
c0deb1fa:	ea42 4203 	orr.w	r2, r2, r3, lsl #16
c0deb1fe:	ea42 6101 	orr.w	r1, r2, r1, lsl #24
c0deb202:	bdb0      	pop	{r4, r5, r7, pc}

c0deb204 <varint_read>:
c0deb204:	b510      	push	{r4, lr}
c0deb206:	b1d9      	cbz	r1, c0deb240 <varint_read+0x3c>
c0deb208:	4614      	mov	r4, r2
c0deb20a:	4602      	mov	r2, r0
c0deb20c:	7800      	ldrb	r0, [r0, #0]
c0deb20e:	28ff      	cmp	r0, #255	@ 0xff
c0deb210:	d00c      	beq.n	c0deb22c <varint_read+0x28>
c0deb212:	28fe      	cmp	r0, #254	@ 0xfe
c0deb214:	d012      	beq.n	c0deb23c <varint_read+0x38>
c0deb216:	28fd      	cmp	r0, #253	@ 0xfd
c0deb218:	d115      	bne.n	c0deb246 <varint_read+0x42>
c0deb21a:	2903      	cmp	r1, #3
c0deb21c:	d310      	bcc.n	c0deb240 <varint_read+0x3c>
c0deb21e:	4610      	mov	r0, r2
c0deb220:	2101      	movs	r1, #1
c0deb222:	f7ff ffc5 	bl	c0deb1b0 <read_u16_le>
c0deb226:	2100      	movs	r1, #0
c0deb228:	2203      	movs	r2, #3
c0deb22a:	e015      	b.n	c0deb258 <varint_read+0x54>
c0deb22c:	2909      	cmp	r1, #9
c0deb22e:	d307      	bcc.n	c0deb240 <varint_read+0x3c>
c0deb230:	4610      	mov	r0, r2
c0deb232:	2101      	movs	r1, #1
c0deb234:	f7ff ffcf 	bl	c0deb1d6 <read_u64_le>
c0deb238:	2209      	movs	r2, #9
c0deb23a:	e00d      	b.n	c0deb258 <varint_read+0x54>
c0deb23c:	2905      	cmp	r1, #5
c0deb23e:	d205      	bcs.n	c0deb24c <varint_read+0x48>
c0deb240:	f04f 32ff 	mov.w	r2, #4294967295	@ 0xffffffff
c0deb244:	e00a      	b.n	c0deb25c <varint_read+0x58>
c0deb246:	2100      	movs	r1, #0
c0deb248:	2201      	movs	r2, #1
c0deb24a:	e005      	b.n	c0deb258 <varint_read+0x54>
c0deb24c:	4610      	mov	r0, r2
c0deb24e:	2101      	movs	r1, #1
c0deb250:	f7ff ffb5 	bl	c0deb1be <read_u32_le>
c0deb254:	2100      	movs	r1, #0
c0deb256:	2205      	movs	r2, #5
c0deb258:	e9c4 0100 	strd	r0, r1, [r4]
c0deb25c:	4610      	mov	r0, r2
c0deb25e:	bd10      	pop	{r4, pc}

c0deb260 <write_u16_be>:
c0deb260:	0a13      	lsrs	r3, r2, #8
c0deb262:	5443      	strb	r3, [r0, r1]
c0deb264:	4408      	add	r0, r1
c0deb266:	7042      	strb	r2, [r0, #1]
c0deb268:	4770      	bx	lr
	...

c0deb26c <ux_process_finger_event>:
c0deb26c:	b5b0      	push	{r4, r5, r7, lr}
c0deb26e:	4604      	mov	r4, r0
c0deb270:	2001      	movs	r0, #1
c0deb272:	f000 f827 	bl	c0deb2c4 <ux_forward_event>
c0deb276:	4605      	mov	r5, r0
c0deb278:	f000 f902 	bl	c0deb480 <nbgl_objAllowDrawing>
c0deb27c:	b1fd      	cbz	r5, c0deb2be <ux_process_finger_event+0x52>
c0deb27e:	78e1      	ldrb	r1, [r4, #3]
c0deb280:	480f      	ldr	r0, [pc, #60]	@ (c0deb2c0 <ux_process_finger_event+0x54>)
c0deb282:	7963      	ldrb	r3, [r4, #5]
c0deb284:	3901      	subs	r1, #1
c0deb286:	eb09 0200 	add.w	r2, r9, r0
c0deb28a:	f859 0000 	ldr.w	r0, [r9, r0]
c0deb28e:	fab1 f181 	clz	r1, r1
c0deb292:	094d      	lsrs	r5, r1, #5
c0deb294:	4611      	mov	r1, r2
c0deb296:	f801 5f04 	strb.w	r5, [r1, #4]!
c0deb29a:	7925      	ldrb	r5, [r4, #4]
c0deb29c:	ea43 2305 	orr.w	r3, r3, r5, lsl #8
c0deb2a0:	80d3      	strh	r3, [r2, #6]
c0deb2a2:	79a3      	ldrb	r3, [r4, #6]
c0deb2a4:	79e4      	ldrb	r4, [r4, #7]
c0deb2a6:	ea44 2303 	orr.w	r3, r4, r3, lsl #8
c0deb2aa:	8113      	strh	r3, [r2, #8]
c0deb2ac:	2264      	movs	r2, #100	@ 0x64
c0deb2ae:	4342      	muls	r2, r0
c0deb2b0:	2000      	movs	r0, #0
c0deb2b2:	f000 f93a 	bl	c0deb52a <nbgl_touchHandler>
c0deb2b6:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
c0deb2ba:	f000 b8c8 	b.w	c0deb44e <nbgl_refresh>
c0deb2be:	bdb0      	pop	{r4, r5, r7, pc}
c0deb2c0:	00001e24 	.word	0x00001e24

c0deb2c4 <ux_forward_event>:
c0deb2c4:	b5b0      	push	{r4, r5, r7, lr}
c0deb2c6:	4604      	mov	r4, r0
c0deb2c8:	4812      	ldr	r0, [pc, #72]	@ (c0deb314 <ux_forward_event+0x50>)
c0deb2ca:	2101      	movs	r1, #1
c0deb2cc:	f809 1000 	strb.w	r1, [r9, r0]
c0deb2d0:	eb09 0500 	add.w	r5, r9, r0
c0deb2d4:	2000      	movs	r0, #0
c0deb2d6:	6068      	str	r0, [r5, #4]
c0deb2d8:	4628      	mov	r0, r5
c0deb2da:	f000 fc3f 	bl	c0debb5c <os_ux>
c0deb2de:	2004      	movs	r0, #4
c0deb2e0:	f000 fcae 	bl	c0debc40 <os_sched_last_status>
c0deb2e4:	2869      	cmp	r0, #105	@ 0x69
c0deb2e6:	6068      	str	r0, [r5, #4]
c0deb2e8:	d108      	bne.n	c0deb2fc <ux_forward_event+0x38>
c0deb2ea:	2001      	movs	r0, #1
c0deb2ec:	f000 f8c8 	bl	c0deb480 <nbgl_objAllowDrawing>
c0deb2f0:	f000 f8d5 	bl	c0deb49e <nbgl_screenRedraw>
c0deb2f4:	f000 f8ab 	bl	c0deb44e <nbgl_refresh>
c0deb2f8:	2000      	movs	r0, #0
c0deb2fa:	bdb0      	pop	{r4, r5, r7, pc}
c0deb2fc:	b144      	cbz	r4, c0deb310 <ux_forward_event+0x4c>
c0deb2fe:	f1b0 0197 	subs.w	r1, r0, #151	@ 0x97
c0deb302:	bf18      	it	ne
c0deb304:	2101      	movne	r1, #1
c0deb306:	2800      	cmp	r0, #0
c0deb308:	bf18      	it	ne
c0deb30a:	2001      	movne	r0, #1
c0deb30c:	4008      	ands	r0, r1
c0deb30e:	bdb0      	pop	{r4, r5, r7, pc}
c0deb310:	2001      	movs	r0, #1
c0deb312:	bdb0      	pop	{r4, r5, r7, pc}
c0deb314:	00001e00 	.word	0x00001e00

c0deb318 <ux_process_ticker_event>:
c0deb318:	b5bc      	push	{r2, r3, r4, r5, r7, lr}
c0deb31a:	4d19      	ldr	r5, [pc, #100]	@ (c0deb380 <ux_process_ticker_event+0x68>)
c0deb31c:	f859 0005 	ldr.w	r0, [r9, r5]
c0deb320:	3001      	adds	r0, #1
c0deb322:	f849 0005 	str.w	r0, [r9, r5]
c0deb326:	2001      	movs	r0, #1
c0deb328:	f7ff ffcc 	bl	c0deb2c4 <ux_forward_event>
c0deb32c:	4604      	mov	r4, r0
c0deb32e:	f000 f8a7 	bl	c0deb480 <nbgl_objAllowDrawing>
c0deb332:	b324      	cbz	r4, c0deb37e <ux_process_ticker_event+0x66>
c0deb334:	2064      	movs	r0, #100	@ 0x64
c0deb336:	2464      	movs	r4, #100	@ 0x64
c0deb338:	f000 f8c0 	bl	c0deb4bc <nbgl_screenHandler>
c0deb33c:	eb09 0005 	add.w	r0, r9, r5
c0deb340:	7900      	ldrb	r0, [r0, #4]
c0deb342:	2801      	cmp	r0, #1
c0deb344:	d119      	bne.n	c0deb37a <ux_process_ticker_event+0x62>
c0deb346:	4668      	mov	r0, sp
c0deb348:	f000 fc86 	bl	c0debc58 <touch_get_last_info>
c0deb34c:	f8bd 0000 	ldrh.w	r0, [sp]
c0deb350:	eb09 0105 	add.w	r1, r9, r5
c0deb354:	80c8      	strh	r0, [r1, #6]
c0deb356:	f8bd 0002 	ldrh.w	r0, [sp, #2]
c0deb35a:	8108      	strh	r0, [r1, #8]
c0deb35c:	f89d 0004 	ldrb.w	r0, [sp, #4]
c0deb360:	3801      	subs	r0, #1
c0deb362:	fab0 f080 	clz	r0, r0
c0deb366:	0940      	lsrs	r0, r0, #5
c0deb368:	f801 0f04 	strb.w	r0, [r1, #4]!
c0deb36c:	f859 0005 	ldr.w	r0, [r9, r5]
c0deb370:	fb00 f204 	mul.w	r2, r0, r4
c0deb374:	2000      	movs	r0, #0
c0deb376:	f000 f8d8 	bl	c0deb52a <nbgl_touchHandler>
c0deb37a:	f000 f868 	bl	c0deb44e <nbgl_refresh>
c0deb37e:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}
c0deb380:	00001e24 	.word	0x00001e24

c0deb384 <ux_process_default_event>:
c0deb384:	2000      	movs	r0, #0
c0deb386:	f7ff bf9d 	b.w	c0deb2c4 <ux_forward_event>

c0deb38a <hash_iovec_ex>:
c0deb38a:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0deb38e:	468a      	mov	sl, r1
c0deb390:	4611      	mov	r1, r2
c0deb392:	461a      	mov	r2, r3
c0deb394:	4605      	mov	r5, r0
c0deb396:	f000 f840 	bl	c0deb41a <cx_hash_init_ex>
c0deb39a:	4607      	mov	r7, r0
c0deb39c:	b9a8      	cbnz	r0, c0deb3ca <hash_iovec_ex+0x40>
c0deb39e:	f10d 0820 	add.w	r8, sp, #32
c0deb3a2:	e898 0141 	ldmia.w	r8, {r0, r6, r8}
c0deb3a6:	1d04      	adds	r4, r0, #4
c0deb3a8:	b156      	cbz	r6, c0deb3c0 <hash_iovec_ex+0x36>
c0deb3aa:	f854 1c04 	ldr.w	r1, [r4, #-4]
c0deb3ae:	f854 2b08 	ldr.w	r2, [r4], #8
c0deb3b2:	4628      	mov	r0, r5
c0deb3b4:	f000 f836 	bl	c0deb424 <cx_hash_update>
c0deb3b8:	3e01      	subs	r6, #1
c0deb3ba:	2800      	cmp	r0, #0
c0deb3bc:	d0f4      	beq.n	c0deb3a8 <hash_iovec_ex+0x1e>
c0deb3be:	e003      	b.n	c0deb3c8 <hash_iovec_ex+0x3e>
c0deb3c0:	4628      	mov	r0, r5
c0deb3c2:	4641      	mov	r1, r8
c0deb3c4:	f000 f824 	bl	c0deb410 <cx_hash_final>
c0deb3c8:	4607      	mov	r7, r0
c0deb3ca:	4628      	mov	r0, r5
c0deb3cc:	4651      	mov	r1, sl
c0deb3ce:	f000 fd71 	bl	c0debeb4 <explicit_bzero>
c0deb3d2:	4638      	mov	r0, r7
c0deb3d4:	e8bd 85f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}

c0deb3d8 <cx_keccak_256_hash_iovec>:
c0deb3d8:	b580      	push	{r7, lr}
c0deb3da:	b0ee      	sub	sp, #440	@ 0x1b8
c0deb3dc:	e88d 0007 	stmia.w	sp, {r0, r1, r2}
c0deb3e0:	a804      	add	r0, sp, #16
c0deb3e2:	f44f 71d4 	mov.w	r1, #424	@ 0x1a8
c0deb3e6:	2206      	movs	r2, #6
c0deb3e8:	2320      	movs	r3, #32
c0deb3ea:	f7ff ffce 	bl	c0deb38a <hash_iovec_ex>
c0deb3ee:	b06e      	add	sp, #440	@ 0x1b8
c0deb3f0:	bd80      	pop	{r7, pc}

c0deb3f2 <cx_ecdsa_sign_no_throw>:
c0deb3f2:	b403      	push	{r0, r1}
c0deb3f4:	f04f 002c 	mov.w	r0, #44	@ 0x2c
c0deb3f8:	f000 b822 	b.w	c0deb440 <cx_trampoline_helper>

c0deb3fc <cx_ecfp_generate_pair2_no_throw>:
c0deb3fc:	b403      	push	{r0, r1}
c0deb3fe:	f04f 0031 	mov.w	r0, #49	@ 0x31
c0deb402:	f000 b81d 	b.w	c0deb440 <cx_trampoline_helper>

c0deb406 <cx_ecfp_init_private_key_no_throw>:
c0deb406:	b403      	push	{r0, r1}
c0deb408:	f04f 0033 	mov.w	r0, #51	@ 0x33
c0deb40c:	f000 b818 	b.w	c0deb440 <cx_trampoline_helper>

c0deb410 <cx_hash_final>:
c0deb410:	b403      	push	{r0, r1}
c0deb412:	f04f 003f 	mov.w	r0, #63	@ 0x3f
c0deb416:	f000 b813 	b.w	c0deb440 <cx_trampoline_helper>

c0deb41a <cx_hash_init_ex>:
c0deb41a:	b403      	push	{r0, r1}
c0deb41c:	f04f 0043 	mov.w	r0, #67	@ 0x43
c0deb420:	f000 b80e 	b.w	c0deb440 <cx_trampoline_helper>

c0deb424 <cx_hash_update>:
c0deb424:	b403      	push	{r0, r1}
c0deb426:	f04f 0048 	mov.w	r0, #72	@ 0x48
c0deb42a:	f000 b809 	b.w	c0deb440 <cx_trampoline_helper>

c0deb42e <cx_rng_no_throw>:
c0deb42e:	b403      	push	{r0, r1}
c0deb430:	f04f 006a 	mov.w	r0, #106	@ 0x6a
c0deb434:	f000 b804 	b.w	c0deb440 <cx_trampoline_helper>

c0deb438 <cx_aes_siv_reset>:
c0deb438:	b403      	push	{r0, r1}
c0deb43a:	f04f 0090 	mov.w	r0, #144	@ 0x90
c0deb43e:	e7ff      	b.n	c0deb440 <cx_trampoline_helper>

c0deb440 <cx_trampoline_helper>:
c0deb440:	4900      	ldr	r1, [pc, #0]	@ (c0deb444 <cx_trampoline_helper+0x4>)
c0deb442:	4708      	bx	r1
c0deb444:	00808001 	.word	0x00808001

c0deb448 <assert_exit>:
c0deb448:	20ff      	movs	r0, #255	@ 0xff
c0deb44a:	f000 fbb1 	bl	c0debbb0 <os_sched_exit>

c0deb44e <nbgl_refresh>:
c0deb44e:	b403      	push	{r0, r1}
c0deb450:	f04f 0091 	mov.w	r0, #145	@ 0x91
c0deb454:	f000 b878 	b.w	c0deb548 <nbgl_trampoline_helper>

c0deb458 <nbgl_refreshSpecial>:
c0deb458:	b403      	push	{r0, r1}
c0deb45a:	f04f 0092 	mov.w	r0, #146	@ 0x92
c0deb45e:	f000 b873 	b.w	c0deb548 <nbgl_trampoline_helper>

c0deb462 <nbgl_refreshSpecialWithPostRefresh>:
c0deb462:	b403      	push	{r0, r1}
c0deb464:	f04f 0093 	mov.w	r0, #147	@ 0x93
c0deb468:	f000 b86e 	b.w	c0deb548 <nbgl_trampoline_helper>

c0deb46c <nbgl_objInit>:
c0deb46c:	b403      	push	{r0, r1}
c0deb46e:	f04f 0096 	mov.w	r0, #150	@ 0x96
c0deb472:	f000 b869 	b.w	c0deb548 <nbgl_trampoline_helper>

c0deb476 <nbgl_objDraw>:
c0deb476:	b403      	push	{r0, r1}
c0deb478:	f04f 0097 	mov.w	r0, #151	@ 0x97
c0deb47c:	f000 b864 	b.w	c0deb548 <nbgl_trampoline_helper>

c0deb480 <nbgl_objAllowDrawing>:
c0deb480:	b403      	push	{r0, r1}
c0deb482:	f04f 0098 	mov.w	r0, #152	@ 0x98
c0deb486:	f000 b85f 	b.w	c0deb548 <nbgl_trampoline_helper>

c0deb48a <nbgl_screenSet>:
c0deb48a:	b403      	push	{r0, r1}
c0deb48c:	f04f 009b 	mov.w	r0, #155	@ 0x9b
c0deb490:	f000 b85a 	b.w	c0deb548 <nbgl_trampoline_helper>

c0deb494 <nbgl_screenPush>:
c0deb494:	b403      	push	{r0, r1}
c0deb496:	f04f 009c 	mov.w	r0, #156	@ 0x9c
c0deb49a:	f000 b855 	b.w	c0deb548 <nbgl_trampoline_helper>

c0deb49e <nbgl_screenRedraw>:
c0deb49e:	b403      	push	{r0, r1}
c0deb4a0:	f04f 009d 	mov.w	r0, #157	@ 0x9d
c0deb4a4:	f000 b850 	b.w	c0deb548 <nbgl_trampoline_helper>

c0deb4a8 <nbgl_screenPop>:
c0deb4a8:	b403      	push	{r0, r1}
c0deb4aa:	f04f 009e 	mov.w	r0, #158	@ 0x9e
c0deb4ae:	f000 b84b 	b.w	c0deb548 <nbgl_trampoline_helper>

c0deb4b2 <nbgl_screenUpdateTicker>:
c0deb4b2:	b403      	push	{r0, r1}
c0deb4b4:	f04f 00a4 	mov.w	r0, #164	@ 0xa4
c0deb4b8:	f000 b846 	b.w	c0deb548 <nbgl_trampoline_helper>

c0deb4bc <nbgl_screenHandler>:
c0deb4bc:	b403      	push	{r0, r1}
c0deb4be:	f04f 00a7 	mov.w	r0, #167	@ 0xa7
c0deb4c2:	f000 b841 	b.w	c0deb548 <nbgl_trampoline_helper>

c0deb4c6 <nbgl_objPoolGet>:
c0deb4c6:	b403      	push	{r0, r1}
c0deb4c8:	f04f 00a8 	mov.w	r0, #168	@ 0xa8
c0deb4cc:	f000 b83c 	b.w	c0deb548 <nbgl_trampoline_helper>

c0deb4d0 <nbgl_containerPoolGet>:
c0deb4d0:	b403      	push	{r0, r1}
c0deb4d2:	f04f 00aa 	mov.w	r0, #170	@ 0xaa
c0deb4d6:	f000 b837 	b.w	c0deb548 <nbgl_trampoline_helper>

c0deb4da <nbgl_getFont>:
c0deb4da:	b403      	push	{r0, r1}
c0deb4dc:	f04f 00ac 	mov.w	r0, #172	@ 0xac
c0deb4e0:	f000 b832 	b.w	c0deb548 <nbgl_trampoline_helper>

c0deb4e4 <nbgl_getFontHeight>:
c0deb4e4:	b403      	push	{r0, r1}
c0deb4e6:	f04f 00ad 	mov.w	r0, #173	@ 0xad
c0deb4ea:	f000 b82d 	b.w	c0deb548 <nbgl_trampoline_helper>

c0deb4ee <nbgl_getFontLineHeight>:
c0deb4ee:	b403      	push	{r0, r1}
c0deb4f0:	f04f 00ae 	mov.w	r0, #174	@ 0xae
c0deb4f4:	f000 b828 	b.w	c0deb548 <nbgl_trampoline_helper>

c0deb4f8 <nbgl_getTextHeightInWidth>:
c0deb4f8:	b403      	push	{r0, r1}
c0deb4fa:	f04f 00b2 	mov.w	r0, #178	@ 0xb2
c0deb4fe:	f000 b823 	b.w	c0deb548 <nbgl_trampoline_helper>

c0deb502 <nbgl_getTextNbLinesInWidth>:
c0deb502:	b403      	push	{r0, r1}
c0deb504:	f04f 00b4 	mov.w	r0, #180	@ 0xb4
c0deb508:	f000 b81e 	b.w	c0deb548 <nbgl_trampoline_helper>

c0deb50c <nbgl_getTextWidth>:
c0deb50c:	b403      	push	{r0, r1}
c0deb50e:	f04f 00b6 	mov.w	r0, #182	@ 0xb6
c0deb512:	f000 b819 	b.w	c0deb548 <nbgl_trampoline_helper>

c0deb516 <nbgl_getTextMaxLenInNbLines>:
c0deb516:	b403      	push	{r0, r1}
c0deb518:	f04f 00b7 	mov.w	r0, #183	@ 0xb7
c0deb51c:	f000 b814 	b.w	c0deb548 <nbgl_trampoline_helper>

c0deb520 <nbgl_textReduceOnNbLines>:
c0deb520:	b403      	push	{r0, r1}
c0deb522:	f04f 00b8 	mov.w	r0, #184	@ 0xb8
c0deb526:	f000 b80f 	b.w	c0deb548 <nbgl_trampoline_helper>

c0deb52a <nbgl_touchHandler>:
c0deb52a:	b403      	push	{r0, r1}
c0deb52c:	f04f 00bb 	mov.w	r0, #187	@ 0xbb
c0deb530:	f000 b80a 	b.w	c0deb548 <nbgl_trampoline_helper>

c0deb534 <nbgl_touchGetTouchDuration>:
c0deb534:	b403      	push	{r0, r1}
c0deb536:	f04f 00bc 	mov.w	r0, #188	@ 0xbc
c0deb53a:	f000 b805 	b.w	c0deb548 <nbgl_trampoline_helper>
	...

c0deb540 <pic_init>:
c0deb540:	b403      	push	{r0, r1}
c0deb542:	f04f 00c4 	mov.w	r0, #196	@ 0xc4
c0deb546:	e7ff      	b.n	c0deb548 <nbgl_trampoline_helper>

c0deb548 <nbgl_trampoline_helper>:
c0deb548:	4900      	ldr	r1, [pc, #0]	@ (c0deb54c <nbgl_trampoline_helper+0x4>)
c0deb54a:	4708      	bx	r1
c0deb54c:	00808001 	.word	0x00808001

c0deb550 <os_boot>:
c0deb550:	2000      	movs	r0, #0
c0deb552:	f000 bb6b 	b.w	c0debc2c <try_context_set>

c0deb556 <os_longjmp>:
c0deb556:	4604      	mov	r4, r0
c0deb558:	f000 fb60 	bl	c0debc1c <try_context_get>
c0deb55c:	4621      	mov	r1, r4
c0deb55e:	f000 fcf5 	bl	c0debf4c <longjmp>
	...

c0deb564 <snprintf>:
c0deb564:	b081      	sub	sp, #4
c0deb566:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0deb56a:	b087      	sub	sp, #28
c0deb56c:	2800      	cmp	r0, #0
c0deb56e:	930f      	str	r3, [sp, #60]	@ 0x3c
c0deb570:	f000 817a 	beq.w	c0deb868 <snprintf+0x304>
c0deb574:	460d      	mov	r5, r1
c0deb576:	2900      	cmp	r1, #0
c0deb578:	f000 8176 	beq.w	c0deb868 <snprintf+0x304>
c0deb57c:	4629      	mov	r1, r5
c0deb57e:	4616      	mov	r6, r2
c0deb580:	4604      	mov	r4, r0
c0deb582:	f000 fc89 	bl	c0debe98 <__aeabi_memclr>
c0deb586:	f1b5 0801 	subs.w	r8, r5, #1
c0deb58a:	f000 816d 	beq.w	c0deb868 <snprintf+0x304>
c0deb58e:	a80f      	add	r0, sp, #60	@ 0x3c
c0deb590:	9002      	str	r0, [sp, #8]
c0deb592:	7830      	ldrb	r0, [r6, #0]
c0deb594:	2800      	cmp	r0, #0
c0deb596:	f000 8167 	beq.w	c0deb868 <snprintf+0x304>
c0deb59a:	2700      	movs	r7, #0
c0deb59c:	b128      	cbz	r0, c0deb5aa <snprintf+0x46>
c0deb59e:	2825      	cmp	r0, #37	@ 0x25
c0deb5a0:	d003      	beq.n	c0deb5aa <snprintf+0x46>
c0deb5a2:	19f0      	adds	r0, r6, r7
c0deb5a4:	3701      	adds	r7, #1
c0deb5a6:	7840      	ldrb	r0, [r0, #1]
c0deb5a8:	e7f8      	b.n	c0deb59c <snprintf+0x38>
c0deb5aa:	4547      	cmp	r7, r8
c0deb5ac:	bf28      	it	cs
c0deb5ae:	4647      	movcs	r7, r8
c0deb5b0:	4620      	mov	r0, r4
c0deb5b2:	4631      	mov	r1, r6
c0deb5b4:	463a      	mov	r2, r7
c0deb5b6:	f000 fc67 	bl	c0debe88 <__aeabi_memmove>
c0deb5ba:	ebb8 0807 	subs.w	r8, r8, r7
c0deb5be:	f000 8153 	beq.w	c0deb868 <snprintf+0x304>
c0deb5c2:	5df1      	ldrb	r1, [r6, r7]
c0deb5c4:	19f0      	adds	r0, r6, r7
c0deb5c6:	443c      	add	r4, r7
c0deb5c8:	4606      	mov	r6, r0
c0deb5ca:	2925      	cmp	r1, #37	@ 0x25
c0deb5cc:	d1e1      	bne.n	c0deb592 <snprintf+0x2e>
c0deb5ce:	1c41      	adds	r1, r0, #1
c0deb5d0:	f04f 0b00 	mov.w	fp, #0
c0deb5d4:	f04f 0e20 	mov.w	lr, #32
c0deb5d8:	2500      	movs	r5, #0
c0deb5da:	2600      	movs	r6, #0
c0deb5dc:	3101      	adds	r1, #1
c0deb5de:	f811 3c01 	ldrb.w	r3, [r1, #-1]
c0deb5e2:	4632      	mov	r2, r6
c0deb5e4:	3101      	adds	r1, #1
c0deb5e6:	2600      	movs	r6, #0
c0deb5e8:	2b2d      	cmp	r3, #45	@ 0x2d
c0deb5ea:	d0f8      	beq.n	c0deb5de <snprintf+0x7a>
c0deb5ec:	f1a3 0630 	sub.w	r6, r3, #48	@ 0x30
c0deb5f0:	2e0a      	cmp	r6, #10
c0deb5f2:	d313      	bcc.n	c0deb61c <snprintf+0xb8>
c0deb5f4:	2b25      	cmp	r3, #37	@ 0x25
c0deb5f6:	d046      	beq.n	c0deb686 <snprintf+0x122>
c0deb5f8:	2b2a      	cmp	r3, #42	@ 0x2a
c0deb5fa:	d01f      	beq.n	c0deb63c <snprintf+0xd8>
c0deb5fc:	2b2e      	cmp	r3, #46	@ 0x2e
c0deb5fe:	d129      	bne.n	c0deb654 <snprintf+0xf0>
c0deb600:	f811 2c01 	ldrb.w	r2, [r1, #-1]
c0deb604:	2a2a      	cmp	r2, #42	@ 0x2a
c0deb606:	d13c      	bne.n	c0deb682 <snprintf+0x11e>
c0deb608:	780a      	ldrb	r2, [r1, #0]
c0deb60a:	2a48      	cmp	r2, #72	@ 0x48
c0deb60c:	d003      	beq.n	c0deb616 <snprintf+0xb2>
c0deb60e:	2a73      	cmp	r2, #115	@ 0x73
c0deb610:	d001      	beq.n	c0deb616 <snprintf+0xb2>
c0deb612:	2a68      	cmp	r2, #104	@ 0x68
c0deb614:	d135      	bne.n	c0deb682 <snprintf+0x11e>
c0deb616:	9a02      	ldr	r2, [sp, #8]
c0deb618:	2601      	movs	r6, #1
c0deb61a:	e017      	b.n	c0deb64c <snprintf+0xe8>
c0deb61c:	f083 0630 	eor.w	r6, r3, #48	@ 0x30
c0deb620:	ea56 060b 	orrs.w	r6, r6, fp
c0deb624:	bf08      	it	eq
c0deb626:	f04f 0e30 	moveq.w	lr, #48	@ 0x30
c0deb62a:	eb0b 068b 	add.w	r6, fp, fp, lsl #2
c0deb62e:	3901      	subs	r1, #1
c0deb630:	eb03 0346 	add.w	r3, r3, r6, lsl #1
c0deb634:	4616      	mov	r6, r2
c0deb636:	f1a3 0b30 	sub.w	fp, r3, #48	@ 0x30
c0deb63a:	e7cf      	b.n	c0deb5dc <snprintf+0x78>
c0deb63c:	460b      	mov	r3, r1
c0deb63e:	f813 2d01 	ldrb.w	r2, [r3, #-1]!
c0deb642:	2a73      	cmp	r2, #115	@ 0x73
c0deb644:	d11d      	bne.n	c0deb682 <snprintf+0x11e>
c0deb646:	9a02      	ldr	r2, [sp, #8]
c0deb648:	2602      	movs	r6, #2
c0deb64a:	4619      	mov	r1, r3
c0deb64c:	1d13      	adds	r3, r2, #4
c0deb64e:	9302      	str	r3, [sp, #8]
c0deb650:	6815      	ldr	r5, [r2, #0]
c0deb652:	e7c3      	b.n	c0deb5dc <snprintf+0x78>
c0deb654:	2b48      	cmp	r3, #72	@ 0x48
c0deb656:	d018      	beq.n	c0deb68a <snprintf+0x126>
c0deb658:	2b58      	cmp	r3, #88	@ 0x58
c0deb65a:	d019      	beq.n	c0deb690 <snprintf+0x12c>
c0deb65c:	2b63      	cmp	r3, #99	@ 0x63
c0deb65e:	d020      	beq.n	c0deb6a2 <snprintf+0x13e>
c0deb660:	2b64      	cmp	r3, #100	@ 0x64
c0deb662:	d02a      	beq.n	c0deb6ba <snprintf+0x156>
c0deb664:	2b68      	cmp	r3, #104	@ 0x68
c0deb666:	d036      	beq.n	c0deb6d6 <snprintf+0x172>
c0deb668:	2b70      	cmp	r3, #112	@ 0x70
c0deb66a:	d006      	beq.n	c0deb67a <snprintf+0x116>
c0deb66c:	2b73      	cmp	r3, #115	@ 0x73
c0deb66e:	d037      	beq.n	c0deb6e0 <snprintf+0x17c>
c0deb670:	2b75      	cmp	r3, #117	@ 0x75
c0deb672:	f000 8081 	beq.w	c0deb778 <snprintf+0x214>
c0deb676:	2b78      	cmp	r3, #120	@ 0x78
c0deb678:	d103      	bne.n	c0deb682 <snprintf+0x11e>
c0deb67a:	9400      	str	r4, [sp, #0]
c0deb67c:	f04f 0c00 	mov.w	ip, #0
c0deb680:	e009      	b.n	c0deb696 <snprintf+0x132>
c0deb682:	1e4e      	subs	r6, r1, #1
c0deb684:	e785      	b.n	c0deb592 <snprintf+0x2e>
c0deb686:	2025      	movs	r0, #37	@ 0x25
c0deb688:	e00f      	b.n	c0deb6aa <snprintf+0x146>
c0deb68a:	487b      	ldr	r0, [pc, #492]	@ (c0deb878 <snprintf+0x314>)
c0deb68c:	4478      	add	r0, pc
c0deb68e:	e024      	b.n	c0deb6da <snprintf+0x176>
c0deb690:	f04f 0c01 	mov.w	ip, #1
c0deb694:	9400      	str	r4, [sp, #0]
c0deb696:	9a02      	ldr	r2, [sp, #8]
c0deb698:	2400      	movs	r4, #0
c0deb69a:	1d13      	adds	r3, r2, #4
c0deb69c:	9302      	str	r3, [sp, #8]
c0deb69e:	2310      	movs	r3, #16
c0deb6a0:	e072      	b.n	c0deb788 <snprintf+0x224>
c0deb6a2:	9802      	ldr	r0, [sp, #8]
c0deb6a4:	1d02      	adds	r2, r0, #4
c0deb6a6:	9202      	str	r2, [sp, #8]
c0deb6a8:	6800      	ldr	r0, [r0, #0]
c0deb6aa:	1e4e      	subs	r6, r1, #1
c0deb6ac:	f804 0b01 	strb.w	r0, [r4], #1
c0deb6b0:	f1b8 0801 	subs.w	r8, r8, #1
c0deb6b4:	f47f af6d 	bne.w	c0deb592 <snprintf+0x2e>
c0deb6b8:	e0d6      	b.n	c0deb868 <snprintf+0x304>
c0deb6ba:	9a02      	ldr	r2, [sp, #8]
c0deb6bc:	9400      	str	r4, [sp, #0]
c0deb6be:	1d13      	adds	r3, r2, #4
c0deb6c0:	9302      	str	r3, [sp, #8]
c0deb6c2:	6813      	ldr	r3, [r2, #0]
c0deb6c4:	2b00      	cmp	r3, #0
c0deb6c6:	461a      	mov	r2, r3
c0deb6c8:	d500      	bpl.n	c0deb6cc <snprintf+0x168>
c0deb6ca:	425a      	negs	r2, r3
c0deb6cc:	0fdc      	lsrs	r4, r3, #31
c0deb6ce:	f04f 0c00 	mov.w	ip, #0
c0deb6d2:	230a      	movs	r3, #10
c0deb6d4:	e059      	b.n	c0deb78a <snprintf+0x226>
c0deb6d6:	4869      	ldr	r0, [pc, #420]	@ (c0deb87c <snprintf+0x318>)
c0deb6d8:	4478      	add	r0, pc
c0deb6da:	f04f 0c01 	mov.w	ip, #1
c0deb6de:	e003      	b.n	c0deb6e8 <snprintf+0x184>
c0deb6e0:	4864      	ldr	r0, [pc, #400]	@ (c0deb874 <snprintf+0x310>)
c0deb6e2:	f04f 0c00 	mov.w	ip, #0
c0deb6e6:	4478      	add	r0, pc
c0deb6e8:	9b02      	ldr	r3, [sp, #8]
c0deb6ea:	b2d2      	uxtb	r2, r2
c0deb6ec:	1d1e      	adds	r6, r3, #4
c0deb6ee:	9602      	str	r6, [sp, #8]
c0deb6f0:	1e4e      	subs	r6, r1, #1
c0deb6f2:	6819      	ldr	r1, [r3, #0]
c0deb6f4:	2a02      	cmp	r2, #2
c0deb6f6:	f000 80a7 	beq.w	c0deb848 <snprintf+0x2e4>
c0deb6fa:	2a01      	cmp	r2, #1
c0deb6fc:	d007      	beq.n	c0deb70e <snprintf+0x1aa>
c0deb6fe:	463d      	mov	r5, r7
c0deb700:	b92a      	cbnz	r2, c0deb70e <snprintf+0x1aa>
c0deb702:	2200      	movs	r2, #0
c0deb704:	5c8b      	ldrb	r3, [r1, r2]
c0deb706:	3201      	adds	r2, #1
c0deb708:	2b00      	cmp	r3, #0
c0deb70a:	d1fb      	bne.n	c0deb704 <snprintf+0x1a0>
c0deb70c:	1e55      	subs	r5, r2, #1
c0deb70e:	f1bc 0f00 	cmp.w	ip, #0
c0deb712:	d016      	beq.n	c0deb742 <snprintf+0x1de>
c0deb714:	2d00      	cmp	r5, #0
c0deb716:	f43f af3c 	beq.w	c0deb592 <snprintf+0x2e>
c0deb71a:	f1b8 0f02 	cmp.w	r8, #2
c0deb71e:	f0c0 80a3 	bcc.w	c0deb868 <snprintf+0x304>
c0deb722:	780a      	ldrb	r2, [r1, #0]
c0deb724:	0913      	lsrs	r3, r2, #4
c0deb726:	f002 020f 	and.w	r2, r2, #15
c0deb72a:	5cc3      	ldrb	r3, [r0, r3]
c0deb72c:	f1b8 0802 	subs.w	r8, r8, #2
c0deb730:	7023      	strb	r3, [r4, #0]
c0deb732:	5c82      	ldrb	r2, [r0, r2]
c0deb734:	7062      	strb	r2, [r4, #1]
c0deb736:	f000 8097 	beq.w	c0deb868 <snprintf+0x304>
c0deb73a:	3101      	adds	r1, #1
c0deb73c:	3d01      	subs	r5, #1
c0deb73e:	3402      	adds	r4, #2
c0deb740:	e7e8      	b.n	c0deb714 <snprintf+0x1b0>
c0deb742:	4545      	cmp	r5, r8
c0deb744:	bf28      	it	cs
c0deb746:	4645      	movcs	r5, r8
c0deb748:	4620      	mov	r0, r4
c0deb74a:	462a      	mov	r2, r5
c0deb74c:	f000 fb9c 	bl	c0debe88 <__aeabi_memmove>
c0deb750:	ebb8 0805 	subs.w	r8, r8, r5
c0deb754:	f000 8088 	beq.w	c0deb868 <snprintf+0x304>
c0deb758:	462f      	mov	r7, r5
c0deb75a:	442c      	add	r4, r5
c0deb75c:	45bb      	cmp	fp, r7
c0deb75e:	f67f af18 	bls.w	c0deb592 <snprintf+0x2e>
c0deb762:	ebab 0507 	sub.w	r5, fp, r7
c0deb766:	4620      	mov	r0, r4
c0deb768:	4545      	cmp	r5, r8
c0deb76a:	bf28      	it	cs
c0deb76c:	4645      	movcs	r5, r8
c0deb76e:	4629      	mov	r1, r5
c0deb770:	2220      	movs	r2, #32
c0deb772:	f000 fb8b 	bl	c0debe8c <__aeabi_memset>
c0deb776:	e061      	b.n	c0deb83c <snprintf+0x2d8>
c0deb778:	9a02      	ldr	r2, [sp, #8]
c0deb77a:	9400      	str	r4, [sp, #0]
c0deb77c:	2400      	movs	r4, #0
c0deb77e:	f04f 0c00 	mov.w	ip, #0
c0deb782:	1d13      	adds	r3, r2, #4
c0deb784:	9302      	str	r3, [sp, #8]
c0deb786:	230a      	movs	r3, #10
c0deb788:	6812      	ldr	r2, [r2, #0]
c0deb78a:	483d      	ldr	r0, [pc, #244]	@ (c0deb880 <snprintf+0x31c>)
c0deb78c:	1e4e      	subs	r6, r1, #1
c0deb78e:	f04f 0a01 	mov.w	sl, #1
c0deb792:	4478      	add	r0, pc
c0deb794:	9001      	str	r0, [sp, #4]
c0deb796:	fba3 570a 	umull	r5, r7, r3, sl
c0deb79a:	2f00      	cmp	r7, #0
c0deb79c:	bf18      	it	ne
c0deb79e:	2701      	movne	r7, #1
c0deb7a0:	4295      	cmp	r5, r2
c0deb7a2:	d804      	bhi.n	c0deb7ae <snprintf+0x24a>
c0deb7a4:	b91f      	cbnz	r7, c0deb7ae <snprintf+0x24a>
c0deb7a6:	f1ab 0b01 	sub.w	fp, fp, #1
c0deb7aa:	46aa      	mov	sl, r5
c0deb7ac:	e7f3      	b.n	c0deb796 <snprintf+0x232>
c0deb7ae:	2c00      	cmp	r4, #0
c0deb7b0:	4627      	mov	r7, r4
c0deb7b2:	f04f 0500 	mov.w	r5, #0
c0deb7b6:	bf18      	it	ne
c0deb7b8:	f04f 37ff 	movne.w	r7, #4294967295	@ 0xffffffff
c0deb7bc:	d00d      	beq.n	c0deb7da <snprintf+0x276>
c0deb7be:	4660      	mov	r0, ip
c0deb7c0:	fa5f fc8e 	uxtb.w	ip, lr
c0deb7c4:	a903      	add	r1, sp, #12
c0deb7c6:	f1bc 0f30 	cmp.w	ip, #48	@ 0x30
c0deb7ca:	4684      	mov	ip, r0
c0deb7cc:	d106      	bne.n	c0deb7dc <snprintf+0x278>
c0deb7ce:	202d      	movs	r0, #45	@ 0x2d
c0deb7d0:	2400      	movs	r4, #0
c0deb7d2:	2501      	movs	r5, #1
c0deb7d4:	f88d 000c 	strb.w	r0, [sp, #12]
c0deb7d8:	e000      	b.n	c0deb7dc <snprintf+0x278>
c0deb7da:	a903      	add	r1, sp, #12
c0deb7dc:	eb07 000b 	add.w	r0, r7, fp
c0deb7e0:	3802      	subs	r0, #2
c0deb7e2:	280d      	cmp	r0, #13
c0deb7e4:	d808      	bhi.n	c0deb7f8 <snprintf+0x294>
c0deb7e6:	f1c7 0701 	rsb	r7, r7, #1
c0deb7ea:	45bb      	cmp	fp, r7
c0deb7ec:	d004      	beq.n	c0deb7f8 <snprintf+0x294>
c0deb7ee:	f801 e005 	strb.w	lr, [r1, r5]
c0deb7f2:	3701      	adds	r7, #1
c0deb7f4:	3501      	adds	r5, #1
c0deb7f6:	e7f8      	b.n	c0deb7ea <snprintf+0x286>
c0deb7f8:	9f01      	ldr	r7, [sp, #4]
c0deb7fa:	b114      	cbz	r4, c0deb802 <snprintf+0x29e>
c0deb7fc:	202d      	movs	r0, #45	@ 0x2d
c0deb7fe:	5548      	strb	r0, [r1, r5]
c0deb800:	3501      	adds	r5, #1
c0deb802:	4820      	ldr	r0, [pc, #128]	@ (c0deb884 <snprintf+0x320>)
c0deb804:	f1bc 0f00 	cmp.w	ip, #0
c0deb808:	4478      	add	r0, pc
c0deb80a:	bf08      	it	eq
c0deb80c:	4638      	moveq	r0, r7
c0deb80e:	f1ba 0f00 	cmp.w	sl, #0
c0deb812:	d00b      	beq.n	c0deb82c <snprintf+0x2c8>
c0deb814:	fbb2 f7fa 	udiv	r7, r2, sl
c0deb818:	fbba faf3 	udiv	sl, sl, r3
c0deb81c:	fbb7 f4f3 	udiv	r4, r7, r3
c0deb820:	fb04 7413 	mls	r4, r4, r3, r7
c0deb824:	5d04      	ldrb	r4, [r0, r4]
c0deb826:	554c      	strb	r4, [r1, r5]
c0deb828:	3501      	adds	r5, #1
c0deb82a:	e7f0      	b.n	c0deb80e <snprintf+0x2aa>
c0deb82c:	4545      	cmp	r5, r8
c0deb82e:	bf28      	it	cs
c0deb830:	4645      	movcs	r5, r8
c0deb832:	9c00      	ldr	r4, [sp, #0]
c0deb834:	462a      	mov	r2, r5
c0deb836:	4620      	mov	r0, r4
c0deb838:	f000 fb26 	bl	c0debe88 <__aeabi_memmove>
c0deb83c:	ebb8 0805 	subs.w	r8, r8, r5
c0deb840:	442c      	add	r4, r5
c0deb842:	f47f aea6 	bne.w	c0deb592 <snprintf+0x2e>
c0deb846:	e00f      	b.n	c0deb868 <snprintf+0x304>
c0deb848:	7808      	ldrb	r0, [r1, #0]
c0deb84a:	2800      	cmp	r0, #0
c0deb84c:	f47f aea1 	bne.w	c0deb592 <snprintf+0x2e>
c0deb850:	4545      	cmp	r5, r8
c0deb852:	bf28      	it	cs
c0deb854:	4645      	movcs	r5, r8
c0deb856:	4620      	mov	r0, r4
c0deb858:	4629      	mov	r1, r5
c0deb85a:	2220      	movs	r2, #32
c0deb85c:	f000 fb16 	bl	c0debe8c <__aeabi_memset>
c0deb860:	ebb8 0805 	subs.w	r8, r8, r5
c0deb864:	f47f af79 	bne.w	c0deb75a <snprintf+0x1f6>
c0deb868:	2000      	movs	r0, #0
c0deb86a:	b007      	add	sp, #28
c0deb86c:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0deb870:	b001      	add	sp, #4
c0deb872:	4770      	bx	lr
c0deb874:	00003a8e 	.word	0x00003a8e
c0deb878:	00003b28 	.word	0x00003b28
c0deb87c:	00003a9c 	.word	0x00003a9c
c0deb880:	000039e2 	.word	0x000039e2
c0deb884:	000039ac 	.word	0x000039ac

c0deb888 <pic>:
c0deb888:	4a0a      	ldr	r2, [pc, #40]	@ (c0deb8b4 <pic+0x2c>)
c0deb88a:	4282      	cmp	r2, r0
c0deb88c:	490a      	ldr	r1, [pc, #40]	@ (c0deb8b8 <pic+0x30>)
c0deb88e:	d806      	bhi.n	c0deb89e <pic+0x16>
c0deb890:	4281      	cmp	r1, r0
c0deb892:	d304      	bcc.n	c0deb89e <pic+0x16>
c0deb894:	b580      	push	{r7, lr}
c0deb896:	f000 f815 	bl	c0deb8c4 <pic_internal>
c0deb89a:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0deb89e:	4907      	ldr	r1, [pc, #28]	@ (c0deb8bc <pic+0x34>)
c0deb8a0:	4288      	cmp	r0, r1
c0deb8a2:	4a07      	ldr	r2, [pc, #28]	@ (c0deb8c0 <pic+0x38>)
c0deb8a4:	d304      	bcc.n	c0deb8b0 <pic+0x28>
c0deb8a6:	4290      	cmp	r0, r2
c0deb8a8:	d802      	bhi.n	c0deb8b0 <pic+0x28>
c0deb8aa:	1a40      	subs	r0, r0, r1
c0deb8ac:	4649      	mov	r1, r9
c0deb8ae:	4408      	add	r0, r1
c0deb8b0:	4770      	bx	lr
c0deb8b2:	0000      	movs	r0, r0
c0deb8b4:	c0de0000 	.word	0xc0de0000
c0deb8b8:	c0def76b 	.word	0xc0def76b
c0deb8bc:	da7a0000 	.word	0xda7a0000
c0deb8c0:	da7a9000 	.word	0xda7a9000

c0deb8c4 <pic_internal>:
c0deb8c4:	467a      	mov	r2, pc
c0deb8c6:	4902      	ldr	r1, [pc, #8]	@ (c0deb8d0 <pic_internal+0xc>)
c0deb8c8:	1cc9      	adds	r1, r1, #3
c0deb8ca:	1a89      	subs	r1, r1, r2
c0deb8cc:	1a40      	subs	r0, r0, r1
c0deb8ce:	4770      	bx	lr
c0deb8d0:	c0deb8c5 	.word	0xc0deb8c5

c0deb8d4 <SVC_Call>:
c0deb8d4:	df01      	svc	1
c0deb8d6:	2900      	cmp	r1, #0
c0deb8d8:	d100      	bne.n	c0deb8dc <exception>
c0deb8da:	4770      	bx	lr

c0deb8dc <exception>:
c0deb8dc:	4608      	mov	r0, r1
c0deb8de:	f7ff fe3a 	bl	c0deb556 <os_longjmp>
	...

c0deb8e4 <SVC_cx_call>:
c0deb8e4:	df01      	svc	1
c0deb8e6:	4770      	bx	lr

c0deb8e8 <nbgl_wait_pipeline>:
c0deb8e8:	b5e0      	push	{r5, r6, r7, lr}
c0deb8ea:	2000      	movs	r0, #0
c0deb8ec:	9001      	str	r0, [sp, #4]
c0deb8ee:	4802      	ldr	r0, [pc, #8]	@ (c0deb8f8 <nbgl_wait_pipeline+0x10>)
c0deb8f0:	a901      	add	r1, sp, #4
c0deb8f2:	f7ff ffef 	bl	c0deb8d4 <SVC_Call>
c0deb8f6:	bd8c      	pop	{r2, r3, r7, pc}
c0deb8f8:	00fa0011 	.word	0x00fa0011

c0deb8fc <nvm_write>:
c0deb8fc:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0deb8fe:	ab01      	add	r3, sp, #4
c0deb900:	c307      	stmia	r3!, {r0, r1, r2}
c0deb902:	4802      	ldr	r0, [pc, #8]	@ (c0deb90c <nvm_write+0x10>)
c0deb904:	a901      	add	r1, sp, #4
c0deb906:	f7ff ffe5 	bl	c0deb8d4 <SVC_Call>
c0deb90a:	bd8f      	pop	{r0, r1, r2, r3, r7, pc}
c0deb90c:	03000003 	.word	0x03000003

c0deb910 <cx_bn_lock>:
c0deb910:	b5e0      	push	{r5, r6, r7, lr}
c0deb912:	e9cd 0100 	strd	r0, r1, [sp]
c0deb916:	4802      	ldr	r0, [pc, #8]	@ (c0deb920 <cx_bn_lock+0x10>)
c0deb918:	4669      	mov	r1, sp
c0deb91a:	f7ff ffe3 	bl	c0deb8e4 <SVC_cx_call>
c0deb91e:	bd8c      	pop	{r2, r3, r7, pc}
c0deb920:	02000112 	.word	0x02000112

c0deb924 <cx_bn_unlock>:
c0deb924:	b5e0      	push	{r5, r6, r7, lr}
c0deb926:	2000      	movs	r0, #0
c0deb928:	4669      	mov	r1, sp
c0deb92a:	9001      	str	r0, [sp, #4]
c0deb92c:	20b6      	movs	r0, #182	@ 0xb6
c0deb92e:	f7ff ffd9 	bl	c0deb8e4 <SVC_cx_call>
c0deb932:	bd8c      	pop	{r2, r3, r7, pc}

c0deb934 <cx_bn_alloc>:
c0deb934:	b5e0      	push	{r5, r6, r7, lr}
c0deb936:	e9cd 0100 	strd	r0, r1, [sp]
c0deb93a:	4802      	ldr	r0, [pc, #8]	@ (c0deb944 <cx_bn_alloc+0x10>)
c0deb93c:	4669      	mov	r1, sp
c0deb93e:	f7ff ffd1 	bl	c0deb8e4 <SVC_cx_call>
c0deb942:	bd8c      	pop	{r2, r3, r7, pc}
c0deb944:	02000113 	.word	0x02000113

c0deb948 <cx_bn_alloc_init>:
c0deb948:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0deb94a:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
c0deb94e:	4803      	ldr	r0, [pc, #12]	@ (c0deb95c <cx_bn_alloc_init+0x14>)
c0deb950:	4669      	mov	r1, sp
c0deb952:	f7ff ffc7 	bl	c0deb8e4 <SVC_cx_call>
c0deb956:	b004      	add	sp, #16
c0deb958:	bd80      	pop	{r7, pc}
c0deb95a:	bf00      	nop
c0deb95c:	04000114 	.word	0x04000114

c0deb960 <cx_bn_destroy>:
c0deb960:	b5e0      	push	{r5, r6, r7, lr}
c0deb962:	f000 f983 	bl	c0debc6c <OUTLINED_FUNCTION_0>
c0deb966:	4802      	ldr	r0, [pc, #8]	@ (c0deb970 <cx_bn_destroy+0x10>)
c0deb968:	4669      	mov	r1, sp
c0deb96a:	f7ff ffbb 	bl	c0deb8e4 <SVC_cx_call>
c0deb96e:	bd8c      	pop	{r2, r3, r7, pc}
c0deb970:	010000bc 	.word	0x010000bc

c0deb974 <cx_bn_nbytes>:
c0deb974:	b5e0      	push	{r5, r6, r7, lr}
c0deb976:	e9cd 0100 	strd	r0, r1, [sp]
c0deb97a:	4802      	ldr	r0, [pc, #8]	@ (c0deb984 <cx_bn_nbytes+0x10>)
c0deb97c:	4669      	mov	r1, sp
c0deb97e:	f7ff ffb1 	bl	c0deb8e4 <SVC_cx_call>
c0deb982:	bd8c      	pop	{r2, r3, r7, pc}
c0deb984:	0200010d 	.word	0x0200010d

c0deb988 <cx_bn_copy>:
c0deb988:	b5e0      	push	{r5, r6, r7, lr}
c0deb98a:	e9cd 0100 	strd	r0, r1, [sp]
c0deb98e:	4802      	ldr	r0, [pc, #8]	@ (c0deb998 <cx_bn_copy+0x10>)
c0deb990:	4669      	mov	r1, sp
c0deb992:	f7ff ffa7 	bl	c0deb8e4 <SVC_cx_call>
c0deb996:	bd8c      	pop	{r2, r3, r7, pc}
c0deb998:	020000c0 	.word	0x020000c0

c0deb99c <cx_bn_set_u32>:
c0deb99c:	b5e0      	push	{r5, r6, r7, lr}
c0deb99e:	e9cd 0100 	strd	r0, r1, [sp]
c0deb9a2:	4802      	ldr	r0, [pc, #8]	@ (c0deb9ac <cx_bn_set_u32+0x10>)
c0deb9a4:	4669      	mov	r1, sp
c0deb9a6:	f7ff ff9d 	bl	c0deb8e4 <SVC_cx_call>
c0deb9aa:	bd8c      	pop	{r2, r3, r7, pc}
c0deb9ac:	020000c1 	.word	0x020000c1

c0deb9b0 <cx_bn_export>:
c0deb9b0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0deb9b2:	ab01      	add	r3, sp, #4
c0deb9b4:	c307      	stmia	r3!, {r0, r1, r2}
c0deb9b6:	4803      	ldr	r0, [pc, #12]	@ (c0deb9c4 <cx_bn_export+0x14>)
c0deb9b8:	a901      	add	r1, sp, #4
c0deb9ba:	f7ff ff93 	bl	c0deb8e4 <SVC_cx_call>
c0deb9be:	b004      	add	sp, #16
c0deb9c0:	bd80      	pop	{r7, pc}
c0deb9c2:	bf00      	nop
c0deb9c4:	030000c3 	.word	0x030000c3

c0deb9c8 <cx_bn_cmp>:
c0deb9c8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0deb9ca:	ab01      	add	r3, sp, #4
c0deb9cc:	c307      	stmia	r3!, {r0, r1, r2}
c0deb9ce:	4803      	ldr	r0, [pc, #12]	@ (c0deb9dc <cx_bn_cmp+0x14>)
c0deb9d0:	a901      	add	r1, sp, #4
c0deb9d2:	f7ff ff87 	bl	c0deb8e4 <SVC_cx_call>
c0deb9d6:	b004      	add	sp, #16
c0deb9d8:	bd80      	pop	{r7, pc}
c0deb9da:	bf00      	nop
c0deb9dc:	030000c4 	.word	0x030000c4

c0deb9e0 <cx_bn_cmp_u32>:
c0deb9e0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0deb9e2:	ab01      	add	r3, sp, #4
c0deb9e4:	c307      	stmia	r3!, {r0, r1, r2}
c0deb9e6:	4803      	ldr	r0, [pc, #12]	@ (c0deb9f4 <cx_bn_cmp_u32+0x14>)
c0deb9e8:	a901      	add	r1, sp, #4
c0deb9ea:	f7ff ff7b 	bl	c0deb8e4 <SVC_cx_call>
c0deb9ee:	b004      	add	sp, #16
c0deb9f0:	bd80      	pop	{r7, pc}
c0deb9f2:	bf00      	nop
c0deb9f4:	030000c5 	.word	0x030000c5

c0deb9f8 <cx_bn_tst_bit>:
c0deb9f8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0deb9fa:	ab01      	add	r3, sp, #4
c0deb9fc:	c307      	stmia	r3!, {r0, r1, r2}
c0deb9fe:	4803      	ldr	r0, [pc, #12]	@ (c0deba0c <cx_bn_tst_bit+0x14>)
c0deba00:	a901      	add	r1, sp, #4
c0deba02:	f7ff ff6f 	bl	c0deb8e4 <SVC_cx_call>
c0deba06:	b004      	add	sp, #16
c0deba08:	bd80      	pop	{r7, pc}
c0deba0a:	bf00      	nop
c0deba0c:	030000cb 	.word	0x030000cb

c0deba10 <cx_bn_mod_add>:
c0deba10:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0deba12:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
c0deba16:	4803      	ldr	r0, [pc, #12]	@ (c0deba24 <cx_bn_mod_add+0x14>)
c0deba18:	4669      	mov	r1, sp
c0deba1a:	f7ff ff63 	bl	c0deb8e4 <SVC_cx_call>
c0deba1e:	b004      	add	sp, #16
c0deba20:	bd80      	pop	{r7, pc}
c0deba22:	bf00      	nop
c0deba24:	040000d3 	.word	0x040000d3

c0deba28 <cx_bn_mod_sub>:
c0deba28:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0deba2a:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
c0deba2e:	4803      	ldr	r0, [pc, #12]	@ (c0deba3c <cx_bn_mod_sub+0x14>)
c0deba30:	4669      	mov	r1, sp
c0deba32:	f7ff ff57 	bl	c0deb8e4 <SVC_cx_call>
c0deba36:	b004      	add	sp, #16
c0deba38:	bd80      	pop	{r7, pc}
c0deba3a:	bf00      	nop
c0deba3c:	040000d4 	.word	0x040000d4

c0deba40 <cx_bn_is_prime>:
c0deba40:	b5e0      	push	{r5, r6, r7, lr}
c0deba42:	e9cd 0100 	strd	r0, r1, [sp]
c0deba46:	4802      	ldr	r0, [pc, #8]	@ (c0deba50 <cx_bn_is_prime+0x10>)
c0deba48:	4669      	mov	r1, sp
c0deba4a:	f7ff ff4b 	bl	c0deb8e4 <SVC_cx_call>
c0deba4e:	bd8c      	pop	{r2, r3, r7, pc}
c0deba50:	020000ef 	.word	0x020000ef

c0deba54 <cx_mont_alloc>:
c0deba54:	b5e0      	push	{r5, r6, r7, lr}
c0deba56:	e9cd 0100 	strd	r0, r1, [sp]
c0deba5a:	4802      	ldr	r0, [pc, #8]	@ (c0deba64 <cx_mont_alloc+0x10>)
c0deba5c:	4669      	mov	r1, sp
c0deba5e:	f7ff ff41 	bl	c0deb8e4 <SVC_cx_call>
c0deba62:	bd8c      	pop	{r2, r3, r7, pc}
c0deba64:	020000dc 	.word	0x020000dc

c0deba68 <cx_mont_init>:
c0deba68:	b5e0      	push	{r5, r6, r7, lr}
c0deba6a:	e9cd 0100 	strd	r0, r1, [sp]
c0deba6e:	4802      	ldr	r0, [pc, #8]	@ (c0deba78 <cx_mont_init+0x10>)
c0deba70:	4669      	mov	r1, sp
c0deba72:	f7ff ff37 	bl	c0deb8e4 <SVC_cx_call>
c0deba76:	bd8c      	pop	{r2, r3, r7, pc}
c0deba78:	020000dd 	.word	0x020000dd

c0deba7c <cx_mont_to_montgomery>:
c0deba7c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0deba7e:	ab01      	add	r3, sp, #4
c0deba80:	c307      	stmia	r3!, {r0, r1, r2}
c0deba82:	4803      	ldr	r0, [pc, #12]	@ (c0deba90 <cx_mont_to_montgomery+0x14>)
c0deba84:	a901      	add	r1, sp, #4
c0deba86:	f7ff ff2d 	bl	c0deb8e4 <SVC_cx_call>
c0deba8a:	b004      	add	sp, #16
c0deba8c:	bd80      	pop	{r7, pc}
c0deba8e:	bf00      	nop
c0deba90:	030000df 	.word	0x030000df

c0deba94 <cx_mont_from_montgomery>:
c0deba94:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0deba96:	ab01      	add	r3, sp, #4
c0deba98:	c307      	stmia	r3!, {r0, r1, r2}
c0deba9a:	4803      	ldr	r0, [pc, #12]	@ (c0debaa8 <cx_mont_from_montgomery+0x14>)
c0deba9c:	a901      	add	r1, sp, #4
c0deba9e:	f7ff ff21 	bl	c0deb8e4 <SVC_cx_call>
c0debaa2:	b004      	add	sp, #16
c0debaa4:	bd80      	pop	{r7, pc}
c0debaa6:	bf00      	nop
c0debaa8:	030000e0 	.word	0x030000e0

c0debaac <cx_mont_mul>:
c0debaac:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0debaae:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
c0debab2:	4803      	ldr	r0, [pc, #12]	@ (c0debac0 <cx_mont_mul+0x14>)
c0debab4:	4669      	mov	r1, sp
c0debab6:	f7ff ff15 	bl	c0deb8e4 <SVC_cx_call>
c0debaba:	b004      	add	sp, #16
c0debabc:	bd80      	pop	{r7, pc}
c0debabe:	bf00      	nop
c0debac0:	040000e1 	.word	0x040000e1

c0debac4 <cx_mont_invert_nprime>:
c0debac4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0debac6:	ab01      	add	r3, sp, #4
c0debac8:	c307      	stmia	r3!, {r0, r1, r2}
c0debaca:	4803      	ldr	r0, [pc, #12]	@ (c0debad8 <cx_mont_invert_nprime+0x14>)
c0debacc:	a901      	add	r1, sp, #4
c0debace:	f7ff ff09 	bl	c0deb8e4 <SVC_cx_call>
c0debad2:	b004      	add	sp, #16
c0debad4:	bd80      	pop	{r7, pc}
c0debad6:	bf00      	nop
c0debad8:	030000e4 	.word	0x030000e4

c0debadc <cx_ecdomain_parameters_length>:
c0debadc:	b5e0      	push	{r5, r6, r7, lr}
c0debade:	e9cd 0100 	strd	r0, r1, [sp]
c0debae2:	4802      	ldr	r0, [pc, #8]	@ (c0debaec <cx_ecdomain_parameters_length+0x10>)
c0debae4:	4669      	mov	r1, sp
c0debae6:	f7ff fefd 	bl	c0deb8e4 <SVC_cx_call>
c0debaea:	bd8c      	pop	{r2, r3, r7, pc}
c0debaec:	0200012f 	.word	0x0200012f

c0debaf0 <os_perso_derive_node_with_seed_key>:
c0debaf0:	b510      	push	{r4, lr}
c0debaf2:	b088      	sub	sp, #32
c0debaf4:	9c0d      	ldr	r4, [sp, #52]	@ 0x34
c0debaf6:	9407      	str	r4, [sp, #28]
c0debaf8:	9c0c      	ldr	r4, [sp, #48]	@ 0x30
c0debafa:	9406      	str	r4, [sp, #24]
c0debafc:	9c0b      	ldr	r4, [sp, #44]	@ 0x2c
c0debafe:	9405      	str	r4, [sp, #20]
c0debb00:	9c0a      	ldr	r4, [sp, #40]	@ 0x28
c0debb02:	e88d 001f 	stmia.w	sp, {r0, r1, r2, r3, r4}
c0debb06:	4803      	ldr	r0, [pc, #12]	@ (c0debb14 <os_perso_derive_node_with_seed_key+0x24>)
c0debb08:	4669      	mov	r1, sp
c0debb0a:	f7ff fee3 	bl	c0deb8d4 <SVC_Call>
c0debb0e:	b008      	add	sp, #32
c0debb10:	bd10      	pop	{r4, pc}
c0debb12:	bf00      	nop
c0debb14:	080000a6 	.word	0x080000a6

c0debb18 <os_pki_load_certificate>:
c0debb18:	b510      	push	{r4, lr}
c0debb1a:	b086      	sub	sp, #24
c0debb1c:	9c09      	ldr	r4, [sp, #36]	@ 0x24
c0debb1e:	9405      	str	r4, [sp, #20]
c0debb20:	9c08      	ldr	r4, [sp, #32]
c0debb22:	e88d 001f 	stmia.w	sp, {r0, r1, r2, r3, r4}
c0debb26:	4803      	ldr	r0, [pc, #12]	@ (c0debb34 <os_pki_load_certificate+0x1c>)
c0debb28:	4669      	mov	r1, sp
c0debb2a:	f7ff fed3 	bl	c0deb8d4 <SVC_Call>
c0debb2e:	b006      	add	sp, #24
c0debb30:	bd10      	pop	{r4, pc}
c0debb32:	bf00      	nop
c0debb34:	060000aa 	.word	0x060000aa

c0debb38 <os_perso_is_pin_set>:
c0debb38:	b5e0      	push	{r5, r6, r7, lr}
c0debb3a:	2000      	movs	r0, #0
c0debb3c:	4669      	mov	r1, sp
c0debb3e:	9001      	str	r0, [sp, #4]
c0debb40:	209e      	movs	r0, #158	@ 0x9e
c0debb42:	f7ff fec7 	bl	c0deb8d4 <SVC_Call>
c0debb46:	b2c0      	uxtb	r0, r0
c0debb48:	bd8c      	pop	{r2, r3, r7, pc}

c0debb4a <os_global_pin_is_validated>:
c0debb4a:	b5e0      	push	{r5, r6, r7, lr}
c0debb4c:	2000      	movs	r0, #0
c0debb4e:	4669      	mov	r1, sp
c0debb50:	9001      	str	r0, [sp, #4]
c0debb52:	20a0      	movs	r0, #160	@ 0xa0
c0debb54:	f7ff febe 	bl	c0deb8d4 <SVC_Call>
c0debb58:	b2c0      	uxtb	r0, r0
c0debb5a:	bd8c      	pop	{r2, r3, r7, pc}

c0debb5c <os_ux>:
c0debb5c:	b5e0      	push	{r5, r6, r7, lr}
c0debb5e:	f000 f885 	bl	c0debc6c <OUTLINED_FUNCTION_0>
c0debb62:	4802      	ldr	r0, [pc, #8]	@ (c0debb6c <os_ux+0x10>)
c0debb64:	4669      	mov	r1, sp
c0debb66:	f7ff feb5 	bl	c0deb8d4 <SVC_Call>
c0debb6a:	bd8c      	pop	{r2, r3, r7, pc}
c0debb6c:	01000064 	.word	0x01000064

c0debb70 <os_flags>:
c0debb70:	b5e0      	push	{r5, r6, r7, lr}
c0debb72:	2000      	movs	r0, #0
c0debb74:	4669      	mov	r1, sp
c0debb76:	9001      	str	r0, [sp, #4]
c0debb78:	206a      	movs	r0, #106	@ 0x6a
c0debb7a:	f7ff feab 	bl	c0deb8d4 <SVC_Call>
c0debb7e:	bd8c      	pop	{r2, r3, r7, pc}

c0debb80 <os_setting_get>:
c0debb80:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0debb82:	ab01      	add	r3, sp, #4
c0debb84:	c307      	stmia	r3!, {r0, r1, r2}
c0debb86:	4803      	ldr	r0, [pc, #12]	@ (c0debb94 <os_setting_get+0x14>)
c0debb88:	a901      	add	r1, sp, #4
c0debb8a:	f7ff fea3 	bl	c0deb8d4 <SVC_Call>
c0debb8e:	b004      	add	sp, #16
c0debb90:	bd80      	pop	{r7, pc}
c0debb92:	bf00      	nop
c0debb94:	03000070 	.word	0x03000070

c0debb98 <os_registry_get_current_app_tag>:
c0debb98:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0debb9a:	ab01      	add	r3, sp, #4
c0debb9c:	c307      	stmia	r3!, {r0, r1, r2}
c0debb9e:	4803      	ldr	r0, [pc, #12]	@ (c0debbac <os_registry_get_current_app_tag+0x14>)
c0debba0:	a901      	add	r1, sp, #4
c0debba2:	f7ff fe97 	bl	c0deb8d4 <SVC_Call>
c0debba6:	b004      	add	sp, #16
c0debba8:	bd80      	pop	{r7, pc}
c0debbaa:	bf00      	nop
c0debbac:	03000074 	.word	0x03000074

c0debbb0 <os_sched_exit>:
c0debbb0:	b082      	sub	sp, #8
c0debbb2:	f000 f85b 	bl	c0debc6c <OUTLINED_FUNCTION_0>
c0debbb6:	4802      	ldr	r0, [pc, #8]	@ (c0debbc0 <os_sched_exit+0x10>)
c0debbb8:	4669      	mov	r1, sp
c0debbba:	f7ff fe8b 	bl	c0deb8d4 <SVC_Call>
c0debbbe:	deff      	udf	#255	@ 0xff
c0debbc0:	0100009a 	.word	0x0100009a

c0debbc4 <os_io_init>:
c0debbc4:	b5e0      	push	{r5, r6, r7, lr}
c0debbc6:	9001      	str	r0, [sp, #4]
c0debbc8:	4802      	ldr	r0, [pc, #8]	@ (c0debbd4 <os_io_init+0x10>)
c0debbca:	a901      	add	r1, sp, #4
c0debbcc:	f7ff fe82 	bl	c0deb8d4 <SVC_Call>
c0debbd0:	bd8c      	pop	{r2, r3, r7, pc}
c0debbd2:	bf00      	nop
c0debbd4:	01000084 	.word	0x01000084

c0debbd8 <os_io_start>:
c0debbd8:	b5e0      	push	{r5, r6, r7, lr}
c0debbda:	2000      	movs	r0, #0
c0debbdc:	4669      	mov	r1, sp
c0debbde:	9001      	str	r0, [sp, #4]
c0debbe0:	4801      	ldr	r0, [pc, #4]	@ (c0debbe8 <os_io_start+0x10>)
c0debbe2:	f7ff fe77 	bl	c0deb8d4 <SVC_Call>
c0debbe6:	bd8c      	pop	{r2, r3, r7, pc}
c0debbe8:	01000085 	.word	0x01000085

c0debbec <os_io_tx_cmd>:
c0debbec:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0debbee:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
c0debbf2:	4803      	ldr	r0, [pc, #12]	@ (c0debc00 <os_io_tx_cmd+0x14>)
c0debbf4:	4669      	mov	r1, sp
c0debbf6:	f7ff fe6d 	bl	c0deb8d4 <SVC_Call>
c0debbfa:	b004      	add	sp, #16
c0debbfc:	bd80      	pop	{r7, pc}
c0debbfe:	bf00      	nop
c0debc00:	04000088 	.word	0x04000088

c0debc04 <os_io_rx_evt>:
c0debc04:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0debc06:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
c0debc0a:	4803      	ldr	r0, [pc, #12]	@ (c0debc18 <os_io_rx_evt+0x14>)
c0debc0c:	4669      	mov	r1, sp
c0debc0e:	f7ff fe61 	bl	c0deb8d4 <SVC_Call>
c0debc12:	b004      	add	sp, #16
c0debc14:	bd80      	pop	{r7, pc}
c0debc16:	bf00      	nop
c0debc18:	03000089 	.word	0x03000089

c0debc1c <try_context_get>:
c0debc1c:	b5e0      	push	{r5, r6, r7, lr}
c0debc1e:	2000      	movs	r0, #0
c0debc20:	4669      	mov	r1, sp
c0debc22:	9001      	str	r0, [sp, #4]
c0debc24:	2087      	movs	r0, #135	@ 0x87
c0debc26:	f7ff fe55 	bl	c0deb8d4 <SVC_Call>
c0debc2a:	bd8c      	pop	{r2, r3, r7, pc}

c0debc2c <try_context_set>:
c0debc2c:	b5e0      	push	{r5, r6, r7, lr}
c0debc2e:	f000 f81d 	bl	c0debc6c <OUTLINED_FUNCTION_0>
c0debc32:	4802      	ldr	r0, [pc, #8]	@ (c0debc3c <try_context_set+0x10>)
c0debc34:	4669      	mov	r1, sp
c0debc36:	f7ff fe4d 	bl	c0deb8d4 <SVC_Call>
c0debc3a:	bd8c      	pop	{r2, r3, r7, pc}
c0debc3c:	0100010b 	.word	0x0100010b

c0debc40 <os_sched_last_status>:
c0debc40:	b5e0      	push	{r5, r6, r7, lr}
c0debc42:	f000 f813 	bl	c0debc6c <OUTLINED_FUNCTION_0>
c0debc46:	4803      	ldr	r0, [pc, #12]	@ (c0debc54 <os_sched_last_status+0x14>)
c0debc48:	4669      	mov	r1, sp
c0debc4a:	f7ff fe43 	bl	c0deb8d4 <SVC_Call>
c0debc4e:	b2c0      	uxtb	r0, r0
c0debc50:	bd8c      	pop	{r2, r3, r7, pc}
c0debc52:	bf00      	nop
c0debc54:	0100009c 	.word	0x0100009c

c0debc58 <touch_get_last_info>:
c0debc58:	b5e0      	push	{r5, r6, r7, lr}
c0debc5a:	9001      	str	r0, [sp, #4]
c0debc5c:	4802      	ldr	r0, [pc, #8]	@ (c0debc68 <touch_get_last_info+0x10>)
c0debc5e:	a901      	add	r1, sp, #4
c0debc60:	f7ff fe38 	bl	c0deb8d4 <SVC_Call>
c0debc64:	bd8c      	pop	{r2, r3, r7, pc}
c0debc66:	bf00      	nop
c0debc68:	01fa000b 	.word	0x01fa000b

c0debc6c <OUTLINED_FUNCTION_0>:
c0debc6c:	2100      	movs	r1, #0
c0debc6e:	e9cd 0100 	strd	r0, r1, [sp]
c0debc72:	4770      	bx	lr

c0debc74 <__aeabi_llsl>:
c0debc74:	0693      	lsls	r3, r2, #26
c0debc76:	d408      	bmi.n	c0debc8a <__aeabi_llsl+0x16>
c0debc78:	b132      	cbz	r2, c0debc88 <__aeabi_llsl+0x14>
c0debc7a:	f1c2 0320 	rsb	r3, r2, #32
c0debc7e:	4091      	lsls	r1, r2
c0debc80:	fa20 f303 	lsr.w	r3, r0, r3
c0debc84:	4090      	lsls	r0, r2
c0debc86:	4319      	orrs	r1, r3
c0debc88:	4770      	bx	lr
c0debc8a:	f1a2 0120 	sub.w	r1, r2, #32
c0debc8e:	fa00 f101 	lsl.w	r1, r0, r1
c0debc92:	2000      	movs	r0, #0
c0debc94:	4770      	bx	lr
	...

c0debc98 <__aeabi_llsr>:
c0debc98:	0693      	lsls	r3, r2, #26
c0debc9a:	d408      	bmi.n	c0debcae <__aeabi_llsr+0x16>
c0debc9c:	b132      	cbz	r2, c0debcac <__aeabi_llsr+0x14>
c0debc9e:	f1c2 0320 	rsb	r3, r2, #32
c0debca2:	40d0      	lsrs	r0, r2
c0debca4:	fa01 f303 	lsl.w	r3, r1, r3
c0debca8:	40d1      	lsrs	r1, r2
c0debcaa:	4318      	orrs	r0, r3
c0debcac:	4770      	bx	lr
c0debcae:	f1a2 0020 	sub.w	r0, r2, #32
c0debcb2:	fa21 f000 	lsr.w	r0, r1, r0
c0debcb6:	2100      	movs	r1, #0
c0debcb8:	4770      	bx	lr
	...

c0debcbc <__udivmoddi4>:
c0debcbc:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0debcc0:	f8dd c020 	ldr.w	ip, [sp, #32]
c0debcc4:	4604      	mov	r4, r0
c0debcc6:	b179      	cbz	r1, c0debce8 <__udivmoddi4+0x2c>
c0debcc8:	b1ba      	cbz	r2, c0debcfa <__udivmoddi4+0x3e>
c0debcca:	b35b      	cbz	r3, c0debd24 <__udivmoddi4+0x68>
c0debccc:	fab1 f581 	clz	r5, r1
c0debcd0:	fab3 f683 	clz	r6, r3
c0debcd4:	1b75      	subs	r5, r6, r5
c0debcd6:	2d20      	cmp	r5, #32
c0debcd8:	d34a      	bcc.n	c0debd70 <__udivmoddi4+0xb4>
c0debcda:	f1bc 0f00 	cmp.w	ip, #0
c0debcde:	bf18      	it	ne
c0debce0:	e9cc 4100 	strdne	r4, r1, [ip]
c0debce4:	2400      	movs	r4, #0
c0debce6:	e066      	b.n	c0debdb6 <__udivmoddi4+0xfa>
c0debce8:	b3cb      	cbz	r3, c0debd5e <__udivmoddi4+0xa2>
c0debcea:	2100      	movs	r1, #0
c0debcec:	f1bc 0f00 	cmp.w	ip, #0
c0debcf0:	bf18      	it	ne
c0debcf2:	e9cc 4100 	strdne	r4, r1, [ip]
c0debcf6:	2400      	movs	r4, #0
c0debcf8:	e0a6      	b.n	c0debe48 <__udivmoddi4+0x18c>
c0debcfa:	2b00      	cmp	r3, #0
c0debcfc:	d03e      	beq.n	c0debd7c <__udivmoddi4+0xc0>
c0debcfe:	2800      	cmp	r0, #0
c0debd00:	d04f      	beq.n	c0debda2 <__udivmoddi4+0xe6>
c0debd02:	1e5d      	subs	r5, r3, #1
c0debd04:	422b      	tst	r3, r5
c0debd06:	d158      	bne.n	c0debdba <__udivmoddi4+0xfe>
c0debd08:	f1bc 0f00 	cmp.w	ip, #0
c0debd0c:	bf1c      	itt	ne
c0debd0e:	ea05 0001 	andne.w	r0, r5, r1
c0debd12:	e9cc 4000 	strdne	r4, r0, [ip]
c0debd16:	fa93 f0a3 	rbit	r0, r3
c0debd1a:	fab0 f080 	clz	r0, r0
c0debd1e:	fa21 f400 	lsr.w	r4, r1, r0
c0debd22:	e048      	b.n	c0debdb6 <__udivmoddi4+0xfa>
c0debd24:	1e55      	subs	r5, r2, #1
c0debd26:	422a      	tst	r2, r5
c0debd28:	d129      	bne.n	c0debd7e <__udivmoddi4+0xc2>
c0debd2a:	f1bc 0f00 	cmp.w	ip, #0
c0debd2e:	bf1e      	ittt	ne
c0debd30:	2300      	movne	r3, #0
c0debd32:	4005      	andne	r5, r0
c0debd34:	e9cc 5300 	strdne	r5, r3, [ip]
c0debd38:	2a01      	cmp	r2, #1
c0debd3a:	f000 8085 	beq.w	c0debe48 <__udivmoddi4+0x18c>
c0debd3e:	fa92 f2a2 	rbit	r2, r2
c0debd42:	004c      	lsls	r4, r1, #1
c0debd44:	fab2 f282 	clz	r2, r2
c0debd48:	f002 031f 	and.w	r3, r2, #31
c0debd4c:	40d1      	lsrs	r1, r2
c0debd4e:	40d8      	lsrs	r0, r3
c0debd50:	231f      	movs	r3, #31
c0debd52:	4393      	bics	r3, r2
c0debd54:	fa04 f303 	lsl.w	r3, r4, r3
c0debd58:	ea43 0400 	orr.w	r4, r3, r0
c0debd5c:	e074      	b.n	c0debe48 <__udivmoddi4+0x18c>
c0debd5e:	fbb0 f4f2 	udiv	r4, r0, r2
c0debd62:	f1bc 0f00 	cmp.w	ip, #0
c0debd66:	d026      	beq.n	c0debdb6 <__udivmoddi4+0xfa>
c0debd68:	fb04 0012 	mls	r0, r4, r2, r0
c0debd6c:	2100      	movs	r1, #0
c0debd6e:	e020      	b.n	c0debdb2 <__udivmoddi4+0xf6>
c0debd70:	f105 0e01 	add.w	lr, r5, #1
c0debd74:	f1be 0f20 	cmp.w	lr, #32
c0debd78:	d00b      	beq.n	c0debd92 <__udivmoddi4+0xd6>
c0debd7a:	e028      	b.n	c0debdce <__udivmoddi4+0x112>
c0debd7c:	e064      	b.n	c0debe48 <__udivmoddi4+0x18c>
c0debd7e:	fab1 f481 	clz	r4, r1
c0debd82:	fab2 f582 	clz	r5, r2
c0debd86:	1b2c      	subs	r4, r5, r4
c0debd88:	f104 0e21 	add.w	lr, r4, #33	@ 0x21
c0debd8c:	f1be 0f20 	cmp.w	lr, #32
c0debd90:	d15d      	bne.n	c0debe4e <__udivmoddi4+0x192>
c0debd92:	f04f 0e20 	mov.w	lr, #32
c0debd96:	f04f 0a00 	mov.w	sl, #0
c0debd9a:	f04f 0b00 	mov.w	fp, #0
c0debd9e:	460e      	mov	r6, r1
c0debda0:	e021      	b.n	c0debde6 <__udivmoddi4+0x12a>
c0debda2:	fbb1 f4f3 	udiv	r4, r1, r3
c0debda6:	f1bc 0f00 	cmp.w	ip, #0
c0debdaa:	d004      	beq.n	c0debdb6 <__udivmoddi4+0xfa>
c0debdac:	2000      	movs	r0, #0
c0debdae:	fb04 1113 	mls	r1, r4, r3, r1
c0debdb2:	e9cc 0100 	strd	r0, r1, [ip]
c0debdb6:	2100      	movs	r1, #0
c0debdb8:	e046      	b.n	c0debe48 <__udivmoddi4+0x18c>
c0debdba:	fab1 f581 	clz	r5, r1
c0debdbe:	fab3 f683 	clz	r6, r3
c0debdc2:	1b75      	subs	r5, r6, r5
c0debdc4:	2d1f      	cmp	r5, #31
c0debdc6:	f4bf af88 	bcs.w	c0debcda <__udivmoddi4+0x1e>
c0debdca:	f105 0e01 	add.w	lr, r5, #1
c0debdce:	fa20 f40e 	lsr.w	r4, r0, lr
c0debdd2:	f1c5 051f 	rsb	r5, r5, #31
c0debdd6:	fa01 f605 	lsl.w	r6, r1, r5
c0debdda:	fa21 fb0e 	lsr.w	fp, r1, lr
c0debdde:	40a8      	lsls	r0, r5
c0debde0:	f04f 0a00 	mov.w	sl, #0
c0debde4:	4326      	orrs	r6, r4
c0debde6:	f04f 0800 	mov.w	r8, #0
c0debdea:	f1be 0f00 	cmp.w	lr, #0
c0debdee:	d01c      	beq.n	c0debe2a <__udivmoddi4+0x16e>
c0debdf0:	ea4f 014b 	mov.w	r1, fp, lsl #1
c0debdf4:	f1ae 0e01 	sub.w	lr, lr, #1
c0debdf8:	ea41 71d6 	orr.w	r1, r1, r6, lsr #31
c0debdfc:	0076      	lsls	r6, r6, #1
c0debdfe:	ea46 75d0 	orr.w	r5, r6, r0, lsr #31
c0debe02:	1aae      	subs	r6, r5, r2
c0debe04:	eb61 0b03 	sbc.w	fp, r1, r3
c0debe08:	43cf      	mvns	r7, r1
c0debe0a:	43ec      	mvns	r4, r5
c0debe0c:	18a4      	adds	r4, r4, r2
c0debe0e:	eb57 0403 	adcs.w	r4, r7, r3
c0debe12:	bf5c      	itt	pl
c0debe14:	468b      	movpl	fp, r1
c0debe16:	462e      	movpl	r6, r5
c0debe18:	0040      	lsls	r0, r0, #1
c0debe1a:	0fe1      	lsrs	r1, r4, #31
c0debe1c:	ea48 044a 	orr.w	r4, r8, sl, lsl #1
c0debe20:	ea40 70da 	orr.w	r0, r0, sl, lsr #31
c0debe24:	46a2      	mov	sl, r4
c0debe26:	4688      	mov	r8, r1
c0debe28:	e7df      	b.n	c0debdea <__udivmoddi4+0x12e>
c0debe2a:	ea4f 71da 	mov.w	r1, sl, lsr #31
c0debe2e:	f1bc 0f00 	cmp.w	ip, #0
c0debe32:	bf18      	it	ne
c0debe34:	e9cc 6b00 	strdne	r6, fp, [ip]
c0debe38:	ea41 0140 	orr.w	r1, r1, r0, lsl #1
c0debe3c:	ea4f 004a 	mov.w	r0, sl, lsl #1
c0debe40:	f020 0001 	bic.w	r0, r0, #1
c0debe44:	ea40 0408 	orr.w	r4, r0, r8
c0debe48:	4620      	mov	r0, r4
c0debe4a:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0debe4e:	f1be 0f1f 	cmp.w	lr, #31
c0debe52:	d804      	bhi.n	c0debe5e <__udivmoddi4+0x1a2>
c0debe54:	fa20 f40e 	lsr.w	r4, r0, lr
c0debe58:	f1ce 0520 	rsb	r5, lr, #32
c0debe5c:	e7bb      	b.n	c0debdd6 <__udivmoddi4+0x11a>
c0debe5e:	f1ce 0740 	rsb	r7, lr, #64	@ 0x40
c0debe62:	f1ae 0420 	sub.w	r4, lr, #32
c0debe66:	f04f 0b00 	mov.w	fp, #0
c0debe6a:	fa20 f504 	lsr.w	r5, r0, r4
c0debe6e:	fa01 f607 	lsl.w	r6, r1, r7
c0debe72:	fa00 fa07 	lsl.w	sl, r0, r7
c0debe76:	ea46 0805 	orr.w	r8, r6, r5
c0debe7a:	fa21 f604 	lsr.w	r6, r1, r4
c0debe7e:	4640      	mov	r0, r8
c0debe80:	e7b1      	b.n	c0debde6 <__udivmoddi4+0x12a>
	...

c0debe84 <__aeabi_memcpy>:
c0debe84:	f000 b82c 	b.w	c0debee0 <memcpy>

c0debe88 <__aeabi_memmove>:
c0debe88:	f000 b838 	b.w	c0debefc <memmove>

c0debe8c <__aeabi_memset>:
c0debe8c:	460b      	mov	r3, r1
c0debe8e:	4611      	mov	r1, r2
c0debe90:	461a      	mov	r2, r3
c0debe92:	f000 b84d 	b.w	c0debf30 <memset>
c0debe96:	bf00      	nop

c0debe98 <__aeabi_memclr>:
c0debe98:	460a      	mov	r2, r1
c0debe9a:	2100      	movs	r1, #0
c0debe9c:	f000 b848 	b.w	c0debf30 <memset>

c0debea0 <__aeabi_uldivmod>:
c0debea0:	b540      	push	{r6, lr}
c0debea2:	b084      	sub	sp, #16
c0debea4:	ae02      	add	r6, sp, #8
c0debea6:	9600      	str	r6, [sp, #0]
c0debea8:	f7ff ff08 	bl	c0debcbc <__udivmoddi4>
c0debeac:	9a02      	ldr	r2, [sp, #8]
c0debeae:	9b03      	ldr	r3, [sp, #12]
c0debeb0:	b004      	add	sp, #16
c0debeb2:	bd40      	pop	{r6, pc}

c0debeb4 <explicit_bzero>:
c0debeb4:	f000 b800 	b.w	c0debeb8 <bzero>

c0debeb8 <bzero>:
c0debeb8:	460a      	mov	r2, r1
c0debeba:	2100      	movs	r1, #0
c0debebc:	f000 b838 	b.w	c0debf30 <memset>

c0debec0 <memcmp>:
c0debec0:	b510      	push	{r4, lr}
c0debec2:	3901      	subs	r1, #1
c0debec4:	4402      	add	r2, r0
c0debec6:	4290      	cmp	r0, r2
c0debec8:	d101      	bne.n	c0debece <memcmp+0xe>
c0debeca:	2000      	movs	r0, #0
c0debecc:	e005      	b.n	c0debeda <memcmp+0x1a>
c0debece:	7803      	ldrb	r3, [r0, #0]
c0debed0:	f811 4f01 	ldrb.w	r4, [r1, #1]!
c0debed4:	42a3      	cmp	r3, r4
c0debed6:	d001      	beq.n	c0debedc <memcmp+0x1c>
c0debed8:	1b18      	subs	r0, r3, r4
c0debeda:	bd10      	pop	{r4, pc}
c0debedc:	3001      	adds	r0, #1
c0debede:	e7f2      	b.n	c0debec6 <memcmp+0x6>

c0debee0 <memcpy>:
c0debee0:	440a      	add	r2, r1
c0debee2:	4291      	cmp	r1, r2
c0debee4:	f100 33ff 	add.w	r3, r0, #4294967295	@ 0xffffffff
c0debee8:	d100      	bne.n	c0debeec <memcpy+0xc>
c0debeea:	4770      	bx	lr
c0debeec:	b510      	push	{r4, lr}
c0debeee:	f811 4b01 	ldrb.w	r4, [r1], #1
c0debef2:	4291      	cmp	r1, r2
c0debef4:	f803 4f01 	strb.w	r4, [r3, #1]!
c0debef8:	d1f9      	bne.n	c0debeee <memcpy+0xe>
c0debefa:	bd10      	pop	{r4, pc}

c0debefc <memmove>:
c0debefc:	4288      	cmp	r0, r1
c0debefe:	b510      	push	{r4, lr}
c0debf00:	eb01 0402 	add.w	r4, r1, r2
c0debf04:	d902      	bls.n	c0debf0c <memmove+0x10>
c0debf06:	4284      	cmp	r4, r0
c0debf08:	4623      	mov	r3, r4
c0debf0a:	d807      	bhi.n	c0debf1c <memmove+0x20>
c0debf0c:	1e43      	subs	r3, r0, #1
c0debf0e:	42a1      	cmp	r1, r4
c0debf10:	d008      	beq.n	c0debf24 <memmove+0x28>
c0debf12:	f811 2b01 	ldrb.w	r2, [r1], #1
c0debf16:	f803 2f01 	strb.w	r2, [r3, #1]!
c0debf1a:	e7f8      	b.n	c0debf0e <memmove+0x12>
c0debf1c:	4601      	mov	r1, r0
c0debf1e:	4402      	add	r2, r0
c0debf20:	428a      	cmp	r2, r1
c0debf22:	d100      	bne.n	c0debf26 <memmove+0x2a>
c0debf24:	bd10      	pop	{r4, pc}
c0debf26:	f813 4d01 	ldrb.w	r4, [r3, #-1]!
c0debf2a:	f802 4d01 	strb.w	r4, [r2, #-1]!
c0debf2e:	e7f7      	b.n	c0debf20 <memmove+0x24>

c0debf30 <memset>:
c0debf30:	4603      	mov	r3, r0
c0debf32:	4402      	add	r2, r0
c0debf34:	4293      	cmp	r3, r2
c0debf36:	d100      	bne.n	c0debf3a <memset+0xa>
c0debf38:	4770      	bx	lr
c0debf3a:	f803 1b01 	strb.w	r1, [r3], #1
c0debf3e:	e7f9      	b.n	c0debf34 <memset+0x4>

c0debf40 <setjmp>:
c0debf40:	46ec      	mov	ip, sp
c0debf42:	e8a0 5ff0 	stmia.w	r0!, {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
c0debf46:	f04f 0000 	mov.w	r0, #0
c0debf4a:	4770      	bx	lr

c0debf4c <longjmp>:
c0debf4c:	e8b0 5ff0 	ldmia.w	r0!, {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
c0debf50:	46e5      	mov	sp, ip
c0debf52:	0008      	movs	r0, r1
c0debf54:	bf08      	it	eq
c0debf56:	2001      	moveq	r0, #1
c0debf58:	4770      	bx	lr
c0debf5a:	bf00      	nop

c0debf5c <strcmp>:
c0debf5c:	f810 2b01 	ldrb.w	r2, [r0], #1
c0debf60:	f811 3b01 	ldrb.w	r3, [r1], #1
c0debf64:	2a01      	cmp	r2, #1
c0debf66:	bf28      	it	cs
c0debf68:	429a      	cmpcs	r2, r3
c0debf6a:	d0f7      	beq.n	c0debf5c <strcmp>
c0debf6c:	1ad0      	subs	r0, r2, r3
c0debf6e:	4770      	bx	lr

c0debf70 <strlen>:
c0debf70:	4603      	mov	r3, r0
c0debf72:	f813 2b01 	ldrb.w	r2, [r3], #1
c0debf76:	2a00      	cmp	r2, #0
c0debf78:	d1fb      	bne.n	c0debf72 <strlen+0x2>
c0debf7a:	1a18      	subs	r0, r3, r0
c0debf7c:	3801      	subs	r0, #1
c0debf7e:	4770      	bx	lr

c0debf80 <strncpy>:
c0debf80:	4603      	mov	r3, r0
c0debf82:	b510      	push	{r4, lr}
c0debf84:	3901      	subs	r1, #1
c0debf86:	b132      	cbz	r2, c0debf96 <strncpy+0x16>
c0debf88:	f811 4f01 	ldrb.w	r4, [r1, #1]!
c0debf8c:	3a01      	subs	r2, #1
c0debf8e:	f803 4b01 	strb.w	r4, [r3], #1
c0debf92:	2c00      	cmp	r4, #0
c0debf94:	d1f7      	bne.n	c0debf86 <strncpy+0x6>
c0debf96:	2100      	movs	r1, #0
c0debf98:	441a      	add	r2, r3
c0debf9a:	4293      	cmp	r3, r2
c0debf9c:	d100      	bne.n	c0debfa0 <strncpy+0x20>
c0debf9e:	bd10      	pop	{r4, pc}
c0debfa0:	f803 1b01 	strb.w	r1, [r3], #1
c0debfa4:	e7f9      	b.n	c0debf9a <strncpy+0x1a>

c0debfa6 <C_app_boilerplate_64px_bitmap>:
c0debfa6:	0040 0040 b301 0000 00b1 8b1f 0008 0000     @.@.............
c0debfb6:	0000 0302 d175 0dbb 2103 060c 9f60 8522     ....u....!..`.".
c0debfc6:	1192 856e 706c 1da3 79a3 a414 6914 2929     ..n.lp...y...i))
c0debfd6:	1c2c ff83 0444 dce5 127c 1b0f a21b b8ab     ,...D...|.......
c0debfe6:	f0c3 2d31 cc32 c0b0 f93a 8530 b368 d0bd     ..1-2...:.0.h...
c0debff6:	a288 0d9d 744a f0f2 c3a6 6bb4 b2ea bf6a     ....Jt.....k..j.
c0dec006:	2fa7 436d 2afd c2b0 b932 fd9b 8609 b3a7     ./mC.*..2.......
c0dec016:	74b0 d747 ab2a d51b 8dd3 8165 eb15 7382     .tG.*.....e....s
c0dec026:	dcbd a301 f3df 848d 460d bcdd 9658 c9f7     .........F..X...
c0dec036:	4f8f 91f4 ef4f a38f 9bf7 7f36 e5b0 69e6     .O..O.....6....i
c0dec046:	0d3e 12f3 afcc f32e cb2d f9dc 7fe2 7f96     >.......-.......
c0dec056:	1ffc e56f a9d1 0021 0002                     ..o...!....

c0dec061 <C_app_boilerplate_64px>:
c0dec061:	0040 0040 0100 bfa6 c0de                    @.@.......

c0dec06b <C_Check_Circle_64px_bitmap>:
c0dec06b:	0040 0040 3321 0002 0231 8b1f 0008 0000     @.@.!3..1.......
c0dec07b:	0000 0302 55ad 4e39 3103 fd14 6124 4b5f     .....U9N.1..$a_K
c0dec08b:	8028 a091 2401 b888 4640 2054 4121 3949     (....$..@FT !AI9
c0dec09b:	152d 00dc a090 1166 05a2 0171 1710 0a48     -.....f...q...H.
c0dec0ab:	026a 6017 41ab 8961 2404 9f21 65ef be66     j..`.Aa..$!..ef.
c0dec0bb:	0e3d c48b 9914 9fb1 fcfd fcfc 8cf3 7ff8     =...............
c0dec0cb:	f54f 1a60 7460 d8a9 de00 fd04 95cc 681c     O.`.`t.........h
c0dec0db:	87cd c9e8 bf14 0185 7952 ae0b 301b 8b40     ........Ry...0@.
c0dec0eb:	c4b5 9cae 7cb5 f88d e070 ef89 0371 137e     .....|..p...q.~.
c0dec0fb:	fd5d 4e7a 4f7d d6b4 9e38 8ea5 b8f9 4c79     ].zN}O..8.....yL
c0dec10b:	34cd e15b da9e 7c13 18bc 1930 a38b 5b15     .4[....|..0....[
c0dec11b:	b94d a901 5a89 34af d0fa fbd4 5d41 b0b9     M....Z.4....A]..
c0dec12b:	0ab1 6830 71fb 5315 0056 6e9a fc6c 2fb3     ..0h.q.SV..nl../
c0dec13b:	24e2 dd75 bf49 012f d486 1057 ac8e 0a5a     .$u.I./...W...Z.
c0dec14b:	aa32 dc97 5d54 3947 803e c954 7a63 b709     2...T]G9>.T.cz..
c0dec15b:	815a c734 7fa9 bc41 000b 6a27 db3a e292     Z.4...A...'j:...
c0dec16b:	12ed 3f6f 8274 64b6 f810 4052 a01d de23     ..o?t..d..R@..#.
c0dec17b:	2712 6220 73a5 9d0a cf04 db00 e588 5bd8     .' b.s.........[
c0dec18b:	e08b 0a5d 027c a128 8093 ee56 ab15 0ca4     ..].|.(...V.....
c0dec19b:	1953 0781 889d a1eb 493b 0082 11da c517     S.......;I......
c0dec1ab:	9b8f 4760 f54c 0b95 822e f14b 41ed 360f     ..`GL.....K..A.6
c0dec1bb:	b820 d215 48a4 c137 3093 c2c8 8139 e70b      ....H7..0..9...
c0dec1cb:	4e04 105c 30ac d4dc 08a7 9856 acbe 7c5d     .N\..0....V...]|
c0dec1db:	5e31 0710 701c 347f 5aff 4fe8 36b3 adc9     1^...p.4.Z.O.6..
c0dec1eb:	802f c436 7653 d63e 3cfe 2d61 5f3f ba73     /.6.Sv>..<a-?_s.
c0dec1fb:	df3a acb2 d712 0ff4 1f59 2554 6ec3 5f7b     :.......Y.T%.n{_
c0dec20b:	6554 3b01 e340 8e78 cad4 febe e91f 4c92     Te.;@.x........L
c0dec21b:	f2b3 e8c9 ce32 92b3 a68c 3457 3971 702e     ....2.....W4q9.p
c0dec22b:	b6aa 0f34 d91d e35f f2e1 639e a7d5 fd79     ..4..._....c..y.
c0dec23b:	ba44 dde8 6369 1aef c3e5 3464 9dd2 272f     D...ic....d4../'
c0dec24b:	cbbf 1fa7 8df3 b09c 9b03 5328 2325 8d5f     ..........(S%#_.
c0dec25b:	3ec0 f233 eb15 7359 39c0 5158 f322 2c7d     .>3...Ys.9XQ".},
c0dec26b:	f7cc 448d cbbe a6c0 e1fb f102 dd51 030f     ...D........Q...
c0dec27b:	0898 fe6c ec64 ac2b 19ea f170 f7af 2d1b     ..l.d.+...p....-
c0dec28b:	1fb1 b3c2 2e0d dad0 0cd6 c8c0 fe72 af1f     ............r...
c0dec29b:	fc6c 2402 5a14 00c5 0008                     l..$.Z.....

c0dec2a6 <C_Check_Circle_64px>:
c0dec2a6:	0040 0040 0102 c06b c0de                    @.@...k...

c0dec2b0 <C_Denied_Circle_64px_bitmap>:
c0dec2b0:	0040 0040 3021 0002 022e 8b1f 0008 0000     @.@.!0..........
c0dec2c0:	0000 0302 55ad 2f4b 4104 2e10 bd6b 479f     .....UK/.A..k..G
c0dec2d0:	d80e 4884 ac90 3f8d e260 2244 e8e1 71b8     ...H...?`.D"...q
c0dec2e0:	e273 201f ece1 7111 fe25 f100 d607 d9c1     s.. ...q%.......
c0dec2f0:	07f2 e63c d64c e363 a6b9 f554 a663 67a7     ..<.L.c...T.c..g
c0dec300:	9766 1f44 b676 babb beaa eafe 6aeb ffc4     f.D.v........j..
c0dec310:	5f1b 13fb 4300 c50b f304 a806 5331 b18a     ._...C......1S..
c0dec320:	1c56 47f0 58ba 0cd5 2a90 6658 642f 6806     V..G.X...*Xf/d.h
c0dec330:	52b4 08ec a5af c46b fdfb ff0c 0d1f df99     .R....k.........
c0dec340:	a978 f947 bb78 5b3c ed35 5a39 0d98 47a6     x.G.x.<[5.9Z...G
c0dec350:	ad34 3237 34b8 331f f3f7 6c86 8e00 3632     4.72.4.3...l..26
c0dec360:	e185 09e6 3f8d a17b 07dd bc61 b41f a934     .....?{...a...4.
c0dec370:	2b27 7d00 1f36 4157 4fc8 ba80 db1b ddfe     '+.}6.WA.O......
c0dec380:	c7ed 7424 511d 2fbe fa01 bfe5 247c 42bb     ..$t.Q./....|$.B
c0dec390:	9690 2555 e336 49ca 44a8 9e99 a3cd 831a     ..U%6..I.D......
c0dec3a0:	e7d6 7bf8 7006 0f2c a96d a005 bf9d 668e     ...{.p,.m......f
c0dec3b0:	5162 3ff3 bf2c 008e 01e0 8ab4 abe9 e34e     bQ.?,.........N.
c0dec3c0:	32c2 c0aa e712 3ab8 aa46 d8a4 7896 009f     .2.....:F....x..
c0dec3d0:	10b6 facb 1974 9385 90e8 df1b c005 8047     ....t.........G.
c0dec3e0:	1a12 9eeb c7de bb99 4b38 a82a d662 e770     ........8K*.b.p.
c0dec3f0:	6d88 6b88 3b3e 12c2 33b8 16a2 79c4 09fe     .m.k>;...3...y..
c0dec400:	1802 b8ee aecd 648e 0741 dc30 44a9 9cf5     .......dA.0..D..
c0dec410:	d3a4 91d4 8ee1 0cb7 804d 7434 1468 91e3     ........M.4th...
c0dec420:	3209 1ced 7020 bbff 2e3d 2d7e b97c 7c40     .2.. p..=.~-|.@|
c0dec430:	f9f6 b8ce f9c0 fc6a 2834 9292 6df8 3c46     ......j.4(...mF<
c0dec440:	56a9 f69f f5da 0b2d 1895 aeeb 9abe 421f     .V....-........B
c0dec450:	a41f 8192 7d78 4b3d 2965 4719 79f5 3328     ....x}=Ke).G.y(3
c0dec460:	ea3b 451e 9df4 0691 b192 cdd5 fa4a 8b5a     ;..E........J.Z.
c0dec470:	65c0 702d b86b bd6a 3762 9f17 151d 49d7     .e-pk.j.b7.....I
c0dec480:	dfba d88a a4bb 90fe 77f5 f7c6 e397 f5df     .........w......
c0dec490:	9aa7 8dfd a6af b0d5 4257 7442 86ed 1a7d     ........WBBt..}.
c0dec4a0:	21d2 b97a 86f0 ee73 91cf 3efe f9a2 8f5f     .!z...s....>.._.
c0dec4b0:	77f4 b0d1 7de9 40b8 907c 43ef 462f b61a     .w...}.@|..C/F..
c0dec4c0:	d239 13f6 95f6 9909 7f8b df7d c528 369e     9.........}.(..6
c0dec4d0:	274f a03c cd95 8029 a5c1 3fc2 d93e 03f8     O'<...)....?>...
c0dec4e0:	a770 8485 0800 0000                         p.......

c0dec4e8 <C_Denied_Circle_64px>:
c0dec4e8:	0040 0040 0102 c2b0 c0de                    @.@.......

c0dec4f2 <C_Important_Circle_64px_bitmap>:
c0dec4f2:	0040 0040 fa21 0001 01f8 8b1f 0008 0000     @.@.!...........
c0dec502:	0000 0302 55b5 4ecd 40c2 1e10 fea1 cfe3     .....U.N.@......
c0dec512:	0f51 892a d45e 8904 602f 49e3 1313 7a3c     Q.*.^.../`.I..<z
c0dec522:	cae4 37cd 1350 a33d 70c6 f8d5 1802 005f     ...7P.=..p...._.
c0dec532:	9e0f 5f05 1fc0 1ace 4910 c054 b38e b6ed     ..._.....IT.....
c0dec542:	db74 d059 e704 76d0 dbf6 7cee 76fd 2dfa     t.Y....v...|.v.-
c0dec552:	ef62 99a2 055b d858 6a29 43e0 b190 6159     b...[.X.)j.C..Ya
c0dec562:	96d0 5e09 c518 308e a440 8010 052d 1806     ...^...0@...-...
c0dec572:	9408 b138 cadf 203c e4be e2e2 4979 3f81     ..8...< ....yI.?
c0dec582:	d0c4 7c94 3ac7 d915 1f9e d24f 56c0 bd3b     ...|.:....O..V;.
c0dec592:	34a4 abea a650 d97c 5f3f 484c c9b4 c551     .4..P.|.?_LH..Q.
c0dec5a2:	9541 9a6e 78d8 3bd9 3ecd f957 d17e 9ad0     A.n..x.;.>W.~...
c0dec5b2:	ec9b cc02 f504 6fb8 d92f e800 0c7b dfe2     .......o/...{...
c0dec5c2:	de93 c49a 2c6e 77ac 6009 79d6 874a 4baa     ....n,.w.`.yJ..K
c0dec5d2:	8606 abb3 26a4 9db7 cac4 a6de ff9a 7d53     .....&........S}
c0dec5e2:	e341 7129 01bf b3c8 02dd 1310 d377 84a7     A.)q........w...
c0dec5f2:	a612 c04d 1802 71e1 d85a b9e1 e3c2 006f     ..M....qZ.....o.
c0dec602:	c459 fb3a 2275 6d3e 5582 0a80 538f 09e5     Y.:.u">m.U...S..
c0dec612:	2551 eba2 38f7 228c f3ee 38ea 0ec2 6e23     Q%...8."...8..#n
c0dec622:	0b8b c71f 55e2 51d3 8b81 4412 9145 3b71     .....U.Q...DE.q;
c0dec632:	f769 20b6 159e 4f43 9a82 924d abc7 a042     i.. ..CO..M...B.
c0dec642:	c6ff f1bb 724b e7cd a06e 4521 e9d2 2fd3     ....Kr..n.!E.../
c0dec652:	d245 3be9 7884 69d5 627f f7dd 2eb7 b2c9     E..;.x.i.b......
c0dec662:	407f eeca 3992 af1e 9d39 ba05 bc0d 2a70     .@...9..9.....p*
c0dec672:	f29b 623f 19e8 8db2 1c0b 90dc d70b 0d35     ..?b..........5.
c0dec682:	965e ade3 b9a0 ea78 75c8 dd4d 2dff 7d85     ^.....x..uM..-.}
c0dec692:	f9d6 c243 c99b 4bfb 77fe d4fe dfd5 8948     ..C....K.w....H.
c0dec6a2:	61a0 92d3 8a91 afe2 618a 2b5f 8afe 5256     .a.......a_+..VR
c0dec6b2:	709d fc2b e439 8bef bfae 841f ddfc 6c36     .p+.9.........6l
c0dec6c2:	1f3a 10ee 9d5f 61f3 431a ed86 230f 53d8     :..._..a.C...#.S
c0dec6d2:	b8cd 1702 7aff 51be 3389 de17 f4d0 eb73     .....z.Q.3....s.
c0dec6e2:	1d68 3e60 e853 91e1 3f8d c10e e439 0800     h.`>S....?..9...
	...

c0dec6f4 <C_Important_Circle_64px>:
c0dec6f4:	0040 0040 0102 c4f2 c0de                    @.@.......

c0dec6fe <C_Warning_64px_bitmap>:
c0dec6fe:	0040 0040 5f21 0001 015d 8b1f 0008 0000     @.@.!_..].......
c0dec70e:	0000 0302 d585 4e31 40c3 0510 8dd0 0885     ......1N.@......
c0dec71e:	454a 9149 25c2 52b2 08e4 4039 19c4 8272     JEI..%.R..9@..r.
c0dec72e:	815c 0384 b880 c441 7205 0a04 e7d2 6908     \.....A..r.....i
c0dec73e:	a202 a50b a113 ec1d 5d99 f6b3 1fee fb6f     .........]....o.
c0dec74e:	96c6 febc 4333 4f84 27b9 5ced ebf2 c293     ....3C.O.'.\....
c0dec75e:	53bf 2663 cf0a 318c 9d23 5bb1 e866 5176     .Sc&...1#..[f.vQ
c0dec76e:	60e1 7d06 3f5d b8fc ce41 24bc cce4 4273     .`.}]?..A..$..sB
c0dec77e:	eafe f818 e79b efb4 966a 4b7b 7339 c841     ........j.{K9sA.
c0dec78e:	ef99 f908 e431 bfd8 1c5a 7979 f15b 9090     ....1...Z.yy[...
c0dec79e:	8733 6891 f33b 1855 96a9 239f f96e 8f25     3..h;.U....#n.%.
c0dec7ae:	7438 4b8e c9d6 bfeb 6f0b 3809 e0f3 8085     8t.K.....o.8....
c0dec7be:	34db 977b c5b0 5dec 46c2 5dc8 90d8 9baf     .4{....].F.]....
c0dec7ce:	94b8 9fc6 fa1b 4631 36dc 7d8c ba4e 3d17     ......1F.6.}N..=
c0dec7de:	bdae e25f c4bc 9f6e eff4 eb93 164b f784     .._...n.....K...
c0dec7ee:	2a9b fe68 5d4f 3d90 7743 5b05 7de8 70f9     .*h.O].=Cw.[.}.p
c0dec7fe:	ebf1 4416 ccf9 a1de 00bb a01f 39d3 b4ef     ...D.........9..
c0dec80e:	b74f bebf fef5 ed72 141b fba4 787b 2e82     O.....r.....{x..
c0dec81e:	f705 e9d8 1833 c93f f4f9 cfa1 9727 0297     ....3.?.....'...
c0dec82e:	14bb b04c c14b 7603 89f2 6e43 fa57 f77c     ..L.K..v..CnW.|.
c0dec83e:	db89 fbe8 4cc5 fd95 50b4 93f7 605f 6523     .....L...P.._`#e
c0dec84e:	e63f 73ba c6a0 fb3d f499 5e05 cbcd e43f     ?..s..=....^..?.
c0dec85e:	7b2a 0024 0008                               *{$....

c0dec865 <C_Warning_64px>:
c0dec865:	0040 0040 0102 c6fe c0de                    @.@.......

c0dec86f <C_Back_40px_bitmap>:
c0dec86f:	0028 0028 8c21 0000 008a 8b1f 0008 0000     (.(.!...........
c0dec87f:	0000 0302 d3ed 09cd 20c0 800c d0d1 0e53     ......... ....S.
c0dec88f:	a21d 39a3 364a 9570 d26e c46d c143 c7e6     ...9J6p.n.m.C...
c0dec89f:	a8d6 73d0 f50f e110 81e3 b010 9794 f843     ...s..........C.
c0dec8af:	efb7 c3b6 53b7 4667 28df dcca b621 6196     .....SgF.(..!..a
c0dec8bf:	2b95 b601 0646 d04a 5b5b fa86 4192 376d     .+..F.J.[[...Am7
c0dec8cf:	50ab c3da 942a 98d6 6e41 198e e6e4 4299     .P..*...An.....B
c0dec8df:	8ec2 2429 99ec 6dc0 6181 0933 c4f8 5561     ..)$...m.a3...aU
c0dec8ef:	6001 605a 199a 7c43 01fb 02e5 04e6 e43a     .`Z`..C|......:.
c0dec8ff:	0320 0000                                    ...

c0dec903 <C_Back_40px>:
c0dec903:	0028 0028 0102 c86f c0de                    (.(...o...

c0dec90d <C_Check_40px_bitmap>:
c0dec90d:	0028 0028 5401 0000 0052 8b1f 0008 0000     (.(..T..R.......
c0dec91d:	0000 0302 6063 05c0 4078 1c84 9088 1307     ....c`..x@......
c0dec92d:	400d ff82 9000 7f60 2400 3f98 0900 1fc6     .@....`..$.?....
c0dec93d:	9920 203f 0ea2 d844 57e3 2608 602a b02c      .? ..D..W.&*`,.
c0dec94d:	5818 ac16 ac0e ac03 1ed7 5e6e 5c0d 0183     .X........n^.\..
c0dec95d:	0103 0000 8363 77dc 00c8 0000               ....c..w....

c0dec969 <C_Check_40px>:
c0dec969:	0028 0028 0100 c90d c0de                    (.(.......

c0dec973 <C_Chevron_40px_bitmap>:
c0dec973:	0028 0028 5c22 0000 ffff ffff ffff ffff     (.(."\..........
c0dec983:	1cda 03e4 0310 03e2 0330 03e0 0350 03de     ........0...P...
c0dec993:	1820 0320 03dc 0820 08c1 0320 03da 0820      . ... ... ... .
c0dec9a3:	08c3 0320 03d8 0820 08c5 0320 03d6 0820     .. ... ... ... .
c0dec9b3:	08c7 0320 05d4 0820 08c9 0520 9ed3 8020     .. ... ... ... .
c0dec9c3:	98cb e002 0ed4 cd09 0e09 ffff ffff ffff     ................
c0dec9d3:	ffff e2ff                                   ....

c0dec9d7 <C_Chevron_40px>:
c0dec9d7:	0028 0028 0102 c973 c0de                    (.(...s...

c0dec9e1 <C_Chevron_Back_40px_bitmap>:
c0dec9e1:	0028 0028 7621 0000 0074 8b1f 0008 0000     (.(.!v..t.......
c0dec9f1:	0000 0302 d2ed 0dc1 3080 0508 8e50 383d     .........0..P.=8
c0deca01:	a3a4 41b0 7157 6e93 3863 d498 1042 eb7e     ...AWq.nc8..B.~.
c0deca11:	4606 340e bfe5 0b84 ffbd aa35 e7e1 2eb2     .F.4......5.....
c0deca21:	6705 b55c 541f 2473 e9b4 1273 7640 27b0     .g\..Ts$..s.@v.'
c0deca31:	2794 c807 0711 4c94 3203 73ac b828 21cd     .'.....L.2.s(..!
c0deca41:	8732 7313 3338 0b83 b833 8532 532b 62f8     2..s83..3.2.+S.b
c0deca51:	9603 1dcf 0dc6 8ef2 7343 0320 0000          ........Cs ...

c0deca5f <C_Chevron_Back_40px>:
c0deca5f:	0028 0028 0102 c9e1 c0de                    (.(.......

c0deca69 <C_Chevron_Next_40px_bitmap>:
c0deca69:	0028 0028 7121 0000 006f 8b1f 0008 0000     (.(.!q..o.......
c0deca79:	0000 0302 ceed 0dbb 3080 450c 5751 0a51     .........0.EQWQ.
c0deca89:	cc86 ac06 0d90 0918 42a6 1448 c48f 8e44     .........BH...D.
c0deca99:	1b3f 6e20 74f9 1964 58f8 8735 22e9 02da     ?. n.td..X5.."..
c0decaa9:	ca23 a581 61e2 f5a5 b074 c031 c6c1 0b00     #....a..t.1.....
c0decab9:	3999 ccc8 c1c2 1c0c 434c 0a61 9b0a 3150     .9......LCa...P1
c0decac9:	c781 1d64 ec2e fe92 bcbe 7707 ddbd ebf8     ..d........w....
c0decad9:	383d be09 209b 0003                          =8... ...

c0decae2 <C_Chevron_Next_40px>:
c0decae2:	0028 0028 0102 ca69 c0de                    (.(...i...

c0decaec <C_Close_40px_bitmap>:
c0decaec:	0028 0028 8521 0000 0083 8b1f 0008 0000     (.(.!...........
c0decafc:	0000 0302 fffb c07f bfc0 08f9 cff6 10f7     ................
c0decb0c:	11fa 4207 41ac 420f 604f 87e8 fd09 e060     ...B.A.BO`....`.
c0decb1c:	3184 0ae0 e01b 70d2 9216 9c2c 5089 6706     .1.....p..,..P.g
c0decb2c:	2923 7383 9590 7941 ca28 5ca0 6554 3e60     #).s..Ay(..\Te`>
c0decb3c:	329a 42b0 6574 8520 cae8 0a40 9431 1561     .2.Bte ...@.1.a.
c0decb4c:	a2c3 9b17 581d 82dc cdcd fc58 2d86 b00c     .....X....X..-..
c0decb5c:	1584 30b6 12c5 d8f6 08e2 5c5b 8b62 6c73     ...0......[\b.sl
c0decb6c:	6369 0040 b400 b40b 2014 0003                ic@...... ...

c0decb79 <C_Close_40px>:
c0decb79:	0028 0028 0102 caec c0de                    (.(.......

c0decb83 <C_Info_40px_bitmap>:
c0decb83:	0028 0028 3121 0000 002f 8b1f 0008 0000     (.(.!1../.......
c0decb93:	0000 0302 fffb 147f 0bd0 f030 67ff 0180     ..........0..g..
c0decba3:	2a7e 7189 5a60 80d3 ec45 cf57 f068 0593     ~*.q`Z..E.W.h...
c0decbb3:	d900 c99e 2019 0003                          ..... ...

c0decbbc <C_Info_40px>:
c0decbbc:	0028 0028 0102 cb83 c0de                    (.(.......

c0decbc6 <C_Mini_Push_40px_bitmap>:
c0decbc6:	0028 0028 ce21 0000 00cc 8b1f 0008 0000     (.(.!...........
c0decbd6:	0000 0302 936d 0dcd 30c2 460c 2123 4ea4     ....m....0.F#!.N
c0decbe6:	ba83 2b01 5230 6037 4604 0762 b006 5c0f     ...+0R7`.Fb....\
c0decbf6:	4240 4936 2f9c f6bf c9a5 b3d3 3913 aaae     @B6I./.......9..
c0decc06:	1085 0eb1 4911 1e0a 7710 829f 6ab0 5a90     .....I...w...j.Z
c0decc16:	9606 3ac2 08a7 a7f5 a2d1 4761 b5e3 d168     ...:......aG..h.
c0decc26:	2f6c 053a a92f f019 a4cc fb95 6b3d cac1     l/:./.......=k..
c0decc36:	53f6 6563 0ef5 8ae1 c043 10f6 3220 db41     .Sce....C... 2A.
c0decc46:	880e d044 1fee 8588 4d45 6215 5161 8553     ..D.....EM.baQS.
c0decc56:	2c68 556b 7634 5a4b cf12 e599 bcbb ab36     h,kU4vKZ......6.
c0decc66:	5c7e fdda 61e4 cbec d6c6 b81e ebcc db95     ~\...a..........
c0decc76:	af53 def7 791b e96f f9be 9628 eac9 b147     S....yo...(...G.
c0decc86:	3926 e6b3 a4ce bb37 8cee ff4f 1fc2 8764     &9....7...O...d.
c0decc96:	9d98 0320 0000                              .. ...

c0decc9c <C_Mini_Push_40px>:
c0decc9c:	0028 0028 0102 cbc6 c0de                    (.(.......

c0decca6 <C_Privacy_40px_bitmap>:
c0decca6:	0028 0028 ac21 0001 01aa 8b1f 0008 0000     (.(.!...........
c0deccb6:	0000 0302 927d 4bbf 50c3 c710 e9af 8b4f     ....}..K.P....O.
c0deccc6:	1768 0741 b335 fe88 6609 1d28 2c44 1fe2     h.A.5....f(.D,..
c0deccd6:	2ea0 cdd2 2e0a 6082 a45c b4b8 0ff8 4418     .......`\......D
c0decce6:	1c50 b3b4 dd28 60a5 8777 38a2 10e9 b56b     P...(..`w..8..k.
c0deccf6:	dac6 bce6 97bb 2da6 378a 25e4 f79f f7de     .......-.7.%....
c0decd06:	77be c439 a3bf ba75 ca9e f75c 26a1 8448     .w9...u...\..&H.
c0decd16:	7a2e 23d8 b178 1f40 5e4e 6ad8 7320 7b7e     .z.#x.@.N^.j s~{
c0decd26:	4cb6 1a70 8cd1 7231 2e21 cf5b 8c06 03a3     .Lp...1r!.[.....
c0decd36:	1ac2 a730 dc34 2ab5 4166 beee c941 6e97     ..0.4..*fA..A..n
c0decd46:	63a8 6968 74dd d859 d595 fb88 81c8 5288     .chi.tY........R
c0decd56:	2181 90c9 a1bb 74a4 16cc 69c7 9e7a 9390     .!.....t...iz...
c0decd66:	4e29 1eda d913 c423 f127 53ac 07d2 22a8     )N....#.'..S..."
c0decd76:	e1d6 5d0e 461d 4b72 49c0 30eb f88b 880a     ...].FrK.I.0....
c0decd86:	10ef 6125 8d93 09ba a8da c904 5c0e 328a     ..%a.........\.2
c0decd96:	283b 1004 218b 5d44 cd39 2bd2 c9dd 15a3     ;(...!D]9..+....
c0decda6:	36c1 084c 01ab 6919 24c1 e237 561b 7d84     .6L....i.$7..V.}
c0decdb6:	8488 c031 51cc 7b85 216b 9bf4 c259 fe9a     ..1..Q.{k!..Y...
c0decdc6:	92dd 9faa b872 cb24 3521 a8b4 62fe b698     ....r.$.!5...b..
c0decdd6:	c2a2 4d4c 6cbc 4560 f7eb 916c 5521 cc5b     ..LM.l`E..l.!U[.
c0decde6:	86e6 8752 3d5c adc2 7bf7 d9a0 a6dc be99     ..R.\=...{......
c0decdf6:	2d5e 26b2 a8cb 1e9e 9a13 8b17 3a52 f30c     ^-.&........R:..
c0dece06:	3ef3 a327 ca61 ae09 8fcf 084f 5aca f908     .>'.a.....O..Z..
c0dece16:	35c8 ffbc a35f 5ec4 41ec f3b8 d353 3a1e     .5.._..^.A..S..:
c0dece26:	f604 9120 5418 b993 8329 5e85 db99 f2e5     .. ..T..)..^....
c0dece36:	56d5 6002 57d4 75ae b266 f08b 114b a76d     .V.`.W.uf...K.m.
c0dece46:	a077 f65f c993 81d4 ff8d 0fc5 af18 4ccb     w._............L
c0dece56:	0320 0000                                    ...

c0dece5a <C_Privacy_40px>:
c0dece5a:	0028 0028 0102 cca6 c0de                    (.(.......

c0dece64 <C_QRCode_40px_bitmap>:
c0dece64:	0028 0028 9921 0000 0097 8b1f 0008 0000     (.(.!...........
c0dece74:	0000 0302 fffb da9f 11e0 0803 bd30 00ff     ............0...
c0dece84:	fea2 607f 8900 8029 18c5 91f4 20c5 0c42     ...`..)...... B.
c0dece94:	28fc fc62 1230 c2c2 f62d a3a7 4307 07ec     .(b.0...-....C..
c0decea4:	0703 ff84 6101 b11e 1062 c0f3 903c 9073     .....a..b...<.s.
c0deceb4:	25ec 8628 07f0 cc3f 4839 85fe 218b 0b85     .%(...?.9H...!..
c0decec4:	923f 49b3 d30a 107f f583 ed90 04f8 99a1     ?..I............
c0deced4:	c230 9b14 d19b 19c2 0c55 061e 3a27 a3ce     0.......U...':..
c0decee4:	1586 d790 d0c0 aa4f 3618 88f3 0b74 7f16     ......O..6..t...
c0decef4:	f360 b62f a170 002e 5b00 1eb2 20fb 0003     `./.p....[... ..
	...

c0decf05 <C_QRCode_40px>:
c0decf05:	0028 0028 0102 ce64 c0de                    (.(...d...

c0decf0f <C_Settings_40px_bitmap>:
c0decf0f:	0028 0028 9321 0001 0191 8b1f 0008 0000     (.(.!...........
c0decf1f:	0000 0302 5275 52b1 40c2 7d10 88c9 9841     ....uR.R.@.}..A.
c0decf2f:	8c91 8e56 10ce 5e87 3e46 ec40 93b0 4e8e     ..V....^F>@....N
c0decf3f:	03fd 4053 850d 1695 9d62 4a42 b03b 8a93     ..S@....b.BJ;...
c0decf4f:	0bf1 04fc 1c1c 40eb a202 3920 2f77 1738     .......@.. 9w/8.
c0decf5f:	d818 6f62 e5ef eef2 bbed 6215 8c7d ad4d     ..bo.......b}.M.
c0decf6f:	8cba 81d5 25ad 8028 6b61 45dd 87ac 8fac     .....%(.ak.E....
c0decf7f:	daac 764f 4e0b 7751 3303 aed6 761c ac42     ..Ov.NQw.3...vB.
c0decf8f:	8a01 1084 f9ad 314a 12e5 74f7 2cb5 8c9a     ......J1...t.,..
c0decf9f:	300d 976b 5c73 4ae5 8b8e 5734 5c1e 3dc5     .0k.s\.J..4W.\.=
c0decfaf:	9e43 1197 0a3a e29b 765c 4780 fd85 1aa0     C...:...\v.G....
c0decfbf:	9e59 5cee 6075 4b8a 57ca 26c0 c381 6890     Y..\u`.K.W.&...h
c0decfcf:	fac4 2c7b 48e3 1f08 7c17 4593 0557 0a16     ..{,.H...|.EW...
c0decfdf:	d037 8459 a74e 601f f108 0385 9e21 2d71     7.Y.N..`....!.q-
c0decfef:	8d44 19ec 2343 7786 f9a6 8a45 b79a 1d50     D...C#.w..E...P.
c0decfff:	84e0 5a08 cc1b 9a7c 0e90 fba5 ef06 716a     ...Z..|.......jq
c0ded00f:	76ce 5398 2c73 25fa 6035 a205 fe11 a49b     .v.Ss,.%5`......
c0ded01f:	81f4 18f4 b93a c7d3 8b1b a6df 5264 755b     ....:.......dR[u
c0ded02f:	59c4 becb af10 c5ac 9ec6 b960 87d4 b385     .Y........`.....
c0ded03f:	cb32 a1f5 4bf3 b27d ff65 79bd f9b2 b2d0     2....K}.e..y....
c0ded04f:	3d80 6650 5e86 2f05 11b7 5733 3a79 f45c     .=Pf.^./..3Wy:\.
c0ded05f:	f25e e8f9 6746 1b24 65be aed0 b864 14ca     ^...Fg$..e..d...
c0ded06f:	6e9c 96f8 f913 44d4 2df3 8e8b 8d9a 9aa4     .n.....D.-......
c0ded07f:	c911 53bb 8a72 1b9a b158 f976 a9b8 3db8     ...Sr...X.v....=
c0ded08f:	3de4 50e9 6624 61a6 6747 dd64 aeec f19c     .=.P$f.aGgd.....
c0ded09f:	fc68 4701 f51a 207f 0003                     h..G... ...

c0ded0aa <C_Settings_40px>:
c0ded0aa:	0028 0028 0102 cf0f c0de                    (.(.......

c0ded0b4 <C_Warning_40px_bitmap>:
c0ded0b4:	0028 0028 e721 0000 00e5 8b1f 0008 0000     (.(.!...........
c0ded0c4:	0000 0302 d36d 0db1 40c2 850c 47e1 2284     ....m....@...G."
c0ded0d4:	283a d511 88d5 1182 0032 8662 904c 0815     :(......2.b.L...
c0ded0e4:	3013 2c03 0ec0 9e88 1025 526d 8450 9d10     .0.,....%.mRP...
c0ded0f4:	73b9 8842 b87d aafc 675f 911f 4b1c 34c1     .sB.}..._g...K.4
c0ded104:	0b26 c128 5b44 c08a c0f6 d95a d811 d2e6     &.(.D[....Z.....
c0ded114:	c0ae a486 81dd 4905 80ab 4939 66ab 4988     .......I..9I.f.I
c0ded124:	635a be30 7349 11ad c0d3 8c52 240e b5cd     Zc0.Is....R..$..
c0ded134:	d476 6f9b 6925 2adc 6dad d615 0eb5 c5ed     v..o%i.*.m......
c0ded144:	25ad 4cfc b04b b93d b035 db42 20db 942e     .%.LK.=.5.B.. ..
c0ded154:	43d1 773e e2db a970 2e8d 4ac0 9d1b 4c80     .C>w..p....J...L
c0ded164:	e51b ec3f a6cd ce88 c8ca 5f26 bc1c 6d7d     ..?.......&_..}m
c0ded174:	5db8 a8ee 76e6 cbb5 5dae bcee 576d c1b7     .]...v...]..mW..
c0ded184:	caed 5db8 6f9b da37 9fec f49b 81ed ccb9     ...].o7.........
c0ded194:	785d fef8 7c2f 1300 b8d8 2006 0003           ]x../|..... ...

c0ded1a3 <C_Warning_40px>:
c0ded1a3:	0028 0028 0102 d0b4 c0de 7544 6d6d 2079     (.(.......Dummy 
c0ded1b3:	0032 6552 6976 7765 7420 6172 736e 6361     2.Review transac
c0ded1c3:	6974 6e6f 740a 206f 6573 646e 4220 4c4f     tion.to send BOL
c0ded1d3:	4f00 6570 6172 6974 6e6f 7320 6769 656e     .Operation signe
c0ded1e3:	0064 6441 7264 7365 2073 6576 6972 6966     d.Address verifi
c0ded1f3:	6163 6974 6e6f 630a 6e61 6563 6c6c 6465     cation.cancelled
c0ded203:	5400 6172 736e 6361 6974 6e6f 4320 6568     .Transaction Che
c0ded213:	6b63 7520 616e 6176 6c69 6261 656c 4100     ck unavailable.A
c0ded223:	7070 6f72 6576 5000 6f72 6563 7373 6e69     pprove.Processin
c0ded233:	0067 6c42 6e69 2d64 6973 6e67 3000 302e     g.Blind-sign.0.0
c0ded243:	312e 4800 6c6f 2064 6f74 7320 6769 006e     .1.Hold to sign.
c0ded253:	704f 7265 7461 6f69 206e 6572 656a 7463     Operation reject
c0ded263:	6465 5200 6a65 6365 0074 6552 656a 7463     ed.Reject.Reject
c0ded273:	7420 6172 736e 6361 6974 6e6f 003f 7243      transaction?.Cr
c0ded283:	7469 6369 6c61 7420 7268 6165 2074 6564     itical threat de
c0ded293:	6574 7463 6465 0a2e 6c42 6e69 2064 6973     tected..Blind si
c0ded2a3:	6e67 6e69 2067 6572 7571 7269 6465 002e     gning required..
c0ded2b3:	6e55 6469 6e65 6974 6966 6465 7220 7369     Unidentified ris
c0ded2c3:	006b 6853 776f 6120 2073 5251 4100 6f6d     k.Show as QR.Amo
c0ded2d3:	6e75 0074 6f47 6220 6361 206b 6f74 6f20     unt.Go back to o
c0ded2e3:	6570 6172 6974 6e6f 5400 6172 736e 6361     peration.Transac
c0ded2f3:	6974 6e6f 4320 6568 6b63 7520 616e 6176     tion Check unava
c0ded303:	6c69 6261 656c 0a2e 6c42 6e69 2064 6973     ilable..Blind si
c0ded313:	6e67 6e69 2067 6572 7571 7269 6465 002e     gning required..
c0ded323:	6441 7264 7365 2073 6576 6972 6966 6465     Address verified
c0ded333:	5300 6977 6570 7420 206f 6f63 746e 6e69     .Swipe to contin
c0ded343:	6575 2500 2073 7325 250a 0073 7468 7074     ue.%s %s.%s.http
c0ded353:	3a73 2f2f 7325 4100 6572 7920 756f 7320     s://%s.Are you s
c0ded363:	7275 2065 6f74 610a 6c6c 776f 6420 6d75     ure to.allow dum
c0ded373:	796d 3220 690a 206e 7274 6e61 6173 7463     my 2.in transact
c0ded383:	6f69 736e 003f 7254 6e61 6173 7463 6f69     ions?.Transactio
c0ded393:	206e 6973 6e67 6465 4500 534e 6e20 6d61     n signed.ENS nam
c0ded3a3:	7365 6120 6572 7220 7365 6c6f 6576 2064     es are resolved 
c0ded3b3:	7962 4c20 6465 6567 2072 6162 6b63 6e65     by Ledger backen
c0ded3c3:	2e64 5300 6365 7275 7469 2079 6572 6f70     d..Security repo
c0ded3d3:	7472 4400 7665 6c65 706f 7265 2500 0a73     rt.Developer.%s.
c0ded3e3:	7325 2520 0073 6c41 6f6c 2077 7564 6d6d     %s %s.Allow dumm
c0ded3f3:	2079 0a31 6e69 7420 6172 736e 6361 6974     y 1.in transacti
c0ded403:	6e6f 0073 6953 6e67 7420 6172 736e 6361     ons.Sign transac
c0ded413:	6974 6e6f 740a 206f 6573 646e 4220 4c4f     tion.to send BOL
c0ded423:	5900 7365 202c 6b73 7069 2500 2073 6572     .Yes, skip.%s re
c0ded433:	6f70 7472 4700 206f 6162 6b63 7420 206f     port.Go back to 
c0ded443:	7274 6e61 6173 7463 6f69 006e 6953 6e67     transaction.Sign
c0ded453:	6d20 7365 6173 6567 4200 6361 206b 6f74      message.Back to
c0ded463:	7320 6661 7465 0079 654d 7373 6761 2065      safety.Message 
c0ded473:	6973 6e67 6465 4300 6f6c 6573 5300 6769     signed.Close.Sig
c0ded483:	206e 7274 6e61 6173 7463 6f69 006e 654c     n transaction.Le
c0ded493:	6764 7265 5300 6163 206e 6f74 7620 6569     dger.Scan to vie
c0ded4a3:	2077 7566 6c6c 7220 7065 726f 0074 6854     w full report.Th
c0ded4b3:	7369 7420 6172 736e 6361 6974 6e6f 6f20     is transaction o
c0ded4c3:	2072 656d 7373 6761 2065 6163 6e6e 746f     r message cannot
c0ded4d3:	6220 2065 6564 6f63 6564 2064 7566 6c6c      be decoded full
c0ded4e3:	2e79 4920 2066 6f79 2075 6863 6f6f 6573     y. If you choose
c0ded4f3:	7420 206f 6973 6e67 202c 6f79 2075 6f63      to sign, you co
c0ded503:	6c75 2064 6562 6120 7475 6f68 6972 697a     uld be authorizi
c0ded513:	676e 6d20 6c61 6369 6f69 7375 6120 7463     ng malicious act
c0ded523:	6f69 736e 7420 6168 2074 6163 206e 7264     ions that can dr
c0ded533:	6961 206e 6f79 7275 7720 6c61 656c 2e74     ain your wallet.
c0ded543:	0a0a 654c 7261 206e 6f6d 6572 203a 656c     ..Learn more: le
c0ded553:	6764 7265 632e 6d6f 652f 0038 6341 6563     dger.com/e8.Acce
c0ded563:	7470 7420 7268 6165 2074 6e61 2064 6f63     pt threat and co
c0ded573:	746e 6e69 6575 4100 6c6c 776f 6420 6d75     ntinue.Allow dum
c0ded583:	796d 3220 690a 206e 7274 6e61 6173 7463     my 2.in transact
c0ded593:	6f69 736e 5600 7265 6973 6e6f 4d00 726f     ions.Version.Mor
c0ded5a3:	0065 6854 7369 7420 6172 736e 6361 6974     e.This transacti
c0ded5b3:	6e6f 6320 6e61 6f6e 2074 6562 4320 656c     on cannot be Cle
c0ded5c3:	7261 5320 6769 656e 0064 6559 2c73 7220     ar Signed.Yes, r
c0ded5d3:	6a65 6365 0074 6143 636e 6c65 5400 6968     eject.Cancel.Thi
c0ded5e3:	2073 7274 6e61 6173 7463 6f69 206e 6177     s transaction wa
c0ded5f3:	2073 6373 6e61 656e 2064 7361 6d20 6c61     s scanned as mal
c0ded603:	6369 6f69 7375 6220 2079 6557 3362 4320     icious by Web3 C
c0ded613:	6568 6b63 2e73 2500 2064 666f 2520 0064     hecks..%d of %d.
c0ded623:	6b53 7069 7220 7665 6569 3f77 4200 696c     Skip review?.Bli
c0ded633:	646e 7320 6769 696e 676e 7220 7165 6975     nd signing requi
c0ded643:	6572 0064 755b 6b6e 6f6e 6e77 005d 6952     red.[unknown].Ri
c0ded653:	6b73 6420 7465 6365 6574 0064 6c42 6e69     sk detected.Blin
c0ded663:	2064 6973 6e67 6e69 2067 6572 7571 7269     d signing requir
c0ded673:	6465 002e 6e55 6469 6e65 6974 6966 6465     ed..Unidentified
c0ded683:	7420 7268 6165 0074 6854 7369 6120 6363      threat.This acc
c0ded693:	756f 746e 6c20 6261 6c65 6320 6d6f 7365     ount label comes
c0ded6a3:	6620 6f72 206d 6f79 7275 4120 6464 6572      from your Addre
c0ded6b3:	7373 4220 6f6f 206b 6e69 4c20 6465 6567     ss Book in Ledge
c0ded6c3:	2072 694c 6576 002e 7243 7469 6369 6c61     r Live..Critical
c0ded6d3:	7420 7268 6165 0074 6341 6563 7470 7220      threat.Accept r
c0ded6e3:	7369 206b 6e61 2064 6f63 746e 6e69 6575     isk and continue
c0ded6f3:	5400 6968 2073 7274 6e61 6173 7463 6f69     .This transactio
c0ded703:	276e 2073 6564 6174 6c69 2073 7261 2065     n's details are 
c0ded713:	6f6e 2074 7566 6c6c 2079 6576 6972 6966     not fully verifi
c0ded723:	6261 656c 202e 6649 7920 756f 7320 6769     able. If you sig
c0ded733:	2c6e 7920 756f 6320 756f 646c 6c20 736f     n, you could los
c0ded743:	2065 6c61 206c 6f79 7275 6120 7373 7465     e all your asset
c0ded753:	2e73 4700 206f 6162 6b63 7420 206f 656d     s..Go back to me
c0ded763:	7373 6761 0065 6f50 6574 746e 6169 206c     ssage.Potential 
c0ded773:	6972 6b73 6420 7465 6365 6574 2e64 420a     risk detected..B
c0ded783:	696c 646e 7320 6769 696e 676e 7220 7165     lind signing req
c0ded793:	6975 6572 2e64 4e00 206f 6874 6572 7461     uired..No threat
c0ded7a3:	6420 7465 6365 6574 2064 7962 5420 6172      detected by Tra
c0ded7b3:	736e 6361 6974 6e6f 4320 6568 6b63 002e     nsaction Check..
c0ded7c3:	6c42 6e69 2064 6973 6e67 6e69 2067 6861     Blind signing ah
c0ded7d3:	6165 0064 654d 7373 6761 2065 6572 656a     ead.Message reje
c0ded7e3:	7463 6465 5200 6a65 6365 2074 706f 7265     cted.Reject oper
c0ded7f3:	7461 6f69 3f6e 3000 3231 3433 3635 3837     ation?.012345678
c0ded803:	4139 4342 4544 0046 656e 7774 726f 2e6b     9ABCDEF.network.
c0ded813:	4200 4c4f 2520 2a2e 0073 6441 7264 7365     .BOL %.*s.Addres
c0ded823:	0073 6649 7920 756f 7227 2065 7573 6572     s.If you're sure
c0ded833:	7920 756f 6420 6e6f 7427 6e20 6565 2064      you don't need 
c0ded843:	6f74 7220 7665 6569 2077 6c61 206c 6966     to review all fi
c0ded853:	6c65 7364 202c 6f79 2075 6163 206e 6b73     elds, you can sk
c0ded863:	7069 7320 7274 6961 6867 2074 6f74 7320     ip straight to s
c0ded873:	6769 696e 676e 002e 6649 7920 756f 7227     igning..If you'r
c0ded883:	2065 6f6e 2074 7375 6e69 2067 6874 0a65     e not using the.
c0ded893:	654c 6764 7265 4c20 7669 2065 7061 2c70     Ledger Live app,
c0ded8a3:	5420 6172 736e 6361 6974 6e6f 4320 6568      Transaction Che
c0ded8b3:	6b63 6d20 6769 7468 6e20 746f 7720 726f     ck might not wor
c0ded8c3:	2e6b 4920 2066 6f79 2075 7261 2065 7375     k. If you are us
c0ded8d3:	6e69 2067 654c 6764 7265 4c20 7669 2c65     ing Ledger Live,
c0ded8e3:	7220 6a65 6365 2074 6874 2065 7274 6e61      reject the tran
c0ded8f3:	6173 7463 6f69 206e 6e61 2064 7274 2079     saction and try 
c0ded903:	6761 6961 2e6e 0a0a 6547 2074 6568 706c     again...Get help
c0ded913:	6120 2074 656c 6764 7265 632e 6d6f 652f      at ledger.com/e
c0ded923:	3131 5400 6968 2073 7274 6e61 6173 7463     11.This transact
c0ded933:	6f69 206e 6177 2073 6373 6e61 656e 2064     ion was scanned 
c0ded943:	7361 7220 7369 796b 6220 2079 6557 3362     as risky by Web3
c0ded953:	4320 6568 6b63 2e73 4400 6d75 796d 3120      Checks..Dummy 1
c0ded963:	4900 7520 646e 7265 7473 6e61 2c64 6320     .I understand, c
c0ded973:	6e6f 6966 6d72 4e00 206f 6874 6572 7461     onfirm.No threat
c0ded983:	6420 7465 6365 6574 0064 7254 6e61 6173      detected.Transa
c0ded993:	7463 6f69 206e 6572 656a 7463 6465 4700     ction rejected.G
c0ded9a3:	206f 6162 6b63 7420 206f 6572 6976 7765     o back to review
c0ded9b3:	4300 6972 6974 6163 206c 6874 6572 7461     .Critical threat
c0ded9c3:	6420 7465 6365 6574 2e64 5300 6769 206e      detected..Sign 
c0ded9d3:	706f 7265 7461 6f69 006e 4c4d 5344 4541     operation.MLDSAE
c0ded9e3:	4854 4400 7465 6365 6574 2064 7962 2520     TH.Detected by %
c0ded9f3:	0073 5300 696b 0070 6f50 6574 746e 6169     s..Skip.Potentia
c0deda03:	206c 6972 6b73 6420 7465 6365 6574 2e64     l risk detected.
c0deda13:	4e00 206f 6874 6572 7461 6420 7465 6365     .No threat detec
c0deda23:	6574 2064 7962 5420 6172 736e 6361 6974     ted by Transacti
c0deda33:	6e6f 4320 6568 6b63 6220 7475 6220 696c     on Check but bli
c0deda43:	646e 7320 6769 696e 676e 7220 7165 6975     nd signing requi
c0deda53:	6572 2e64 5000 746f 6e65 6974 6c61 7220     red..Potential r
c0deda63:	7369 006b 6556 6972 7966 4220 4c4f 6120     isk.Verify BOL a
c0deda73:	6464 6572 7373 4300 6e6f 6974 756e 2065     ddress.Continue 
c0deda83:	6e61 7779 7961 5100 6975 2074 7061 0070     anyway.Quit app.
c0deda93:	7753 7069 2065 6f74 7220 7665 6569 0077     Swipe to review.
c0dedaa3:	6854 7369 6120 7070 6520 616e 6c62 7365     This app enables
c0dedab3:	7320 6769 696e 676e 740a 6172 736e 6361      signing.transac
c0dedac3:	6974 6e6f 2073 6e6f 7420 6568 5400 6172     tions on the.Tra
c0dedad3:	736e 6361 6974 6e6f 4320 6568 6b63 6420     nsaction Check d
c0dedae3:	6469 276e 2074 6966 646e 6120 796e 7420     idn't find any t
c0dedaf3:	7268 6165 2c74 6220 7475 6120 776c 7961     hreat, but alway
c0dedb03:	2073 6572 6976 7765 7420 6172 736e 6361     s review transac
c0dedb13:	6974 6e6f 6420 7465 6961 736c 6320 7261     tion details car
c0dedb23:	6665 6c75 796c 002e 6f43 666e 7269 006d     efully..Confirm.
c0dedb33:	6552 656a 7463 6d20 7365 6173 6567 003f     Reject message?.
c0dedb43:	7300 a7ed 2953 7d9d 3348 d839 0908 d8a1     .s..S).}H39.....
c0dedb53:	5305 a4bd ff02 5bfe fffe ffff 00ff 0000     .S.....[........
c0dedb63:	0501 98ce 1bc6 f405 e27f e9ea 42a5 99bd     .............B..
c0dedb73:	b2f6 82e7 2346 4016 45b5 fe95 d5bf b81e     ....F#.@.E......
c0dedb83:	1c53 eec6 1338 1c9c 0211 5323 8c7a 9de7     S...8.....#Sz...
c0dedb93:	7e06 cc58 6710 fbc6 d8b7 a1b3 8db0 8ffc     .~X..g..........
c0dedba3:	2708 bc4d d1e8 7951 9b96 d4c0 a79f bd25     .'M...Qy......%.
c0dedbb3:	9ddf 55e5 bae0 696a 6a3c 52db 9efc a8e7     ...U..ji<j.R....
c0dedbc3:	1c2c 69fb cad4 5f67 0c52 76ce 0202 7668     ,..i..g_R..v..hv
c0dedbd3:	ff00 878f 7400 0419 7471 06fd 28b5 e776     .....t..qt...(v.
c0dedbe3:	06e1 890c 5cce 3426 3705 080a d0b6 2b30     .....\&4.7....0+
c0dedbf3:	ab0b ed3e 39b8 ee20 670a 9772 39dc 2621     ..>..9 ..gr..9!&
c0dedc03:	70f1 89a5 644a 5444 d038 ac15 ba32 0f36     .p..JdDT8...2.6.
c0dedc13:	2c09 44de b1ba c21f d4b7 c0b5 16d2 8c22     .,.D..........".
c0dedc23:	a3ce c03b a0a7 138c d4c0 17c1 dd4d 6a88     ..;.........M..j
c0dedc33:	4cac 6656 f4e1 1f83 6c00 1995 6bd3 e82c     .LVf.....l...k,.
c0dedc43:	0082 0000 0000 0000 0000 0000 0000 0000     ................
	...
c0dedc5f:	0000 9202 63fc c189 3326 67c2 c6cb 3b6e     .....c..&3.g..n;
c0dedc6f:	6bf8 b6e3 cbd8 6766 7771 4fe5 b392 f269     .k....fgqw.O..i.
c0dedc7f:	18f5 588d 73e7 a7ed 2953 7d9d 3348 d839     ...X.s..S).}H39.
c0dedc8f:	0908 d8a1 5305 a4bd ff02 5bfe fffe ffff     .....S.....[....
c0dedc9f:	fffe ffff 00fc 0000 0000 0000 0000 0000     ................
	...
c0dedcbf:	0000 9202 30f8 4e64 e172 a031 b829 4550     .....0dNr.1.).PE
c0dedccf:	81b6 5881 285d e833 7948 70b9 4391 f5e1     ...X](3.Hy.p.C..
c0dedcdf:	f093 0000                                    .....

c0dedce4 <handler_cmd_verify_dilithium.sig>:
c0dedce4:	6193 b128 b2a6 c9f2 9a4b 7ee4 4896 d274     .a(.....K..~.Ht.
c0dedcf4:	9592 59da 1be5 29ef 8b95 55f8 26d9 af6d     ...Y...)...U.&m.
c0dedd04:	2425 e843 c1a1 f5cd badc 27aa a1db bf64     %$C........'..d.
c0dedd14:	6d79 a5ac 1d33 009a 18e5 4002 3ecb b67a     ym..3......@.>z.
c0dedd24:	2569 3e5c 2fe1 81dd 868f a3fd 6914 e0e8     i%\>./.......i..
c0dedd34:	df2d 0573 dc39 ddd3 1fc5 6442 1648 ef86     -.s.9.....BdH...
c0dedd44:	f283 c300 077b 1f7b 4610 28ed 694b 6818     ....{.{..F.(Ki.h
c0dedd54:	c39e 454e ea20 db7d 4315 fe5c b291 a47f     ..NE .}..C\.....
c0dedd64:	fb91 5e8f 2c01 3a19 364f fedd 4558 a9db     ...^.,.:O6..XE..
c0dedd74:	3f4b dd84 e2da ea56 2d53 0e29 5d8f 3823     K?....V.S-)..]#8
c0dedd84:	e6a8 371c 0f4f 90aa 4fe6 cca9 7d0a b976     ...7O....O...}v.
c0dedd94:	ed6c 46be 2679 7d6b 7d53 07e3 2b95 e42c     l..Fy&k}S}...+,.
c0dedda4:	7061 60cf ab4c 2add 2046 af90 2803 32dd     ap.`L..*F ...(.2
c0deddb4:	f998 f506 5bc4 0a97 961f f2d7 bbc5 5aa0     .....[.........Z
c0deddc4:	d546 d49d f992 5905 749b e49b 7a8b 6fbd     F......Y.t...z.o
c0deddd4:	34cc bae3 74ac 7391 4ff7 1a93 59d8 5b23     .4...t.s.O...Y#[
c0dedde4:	4e01 bc5f 5030 3d13 8cfb 8486 ee78 5116     .N_.0P.=....x..Q
c0deddf4:	55f2 1291 fc05 eead 5f18 3653 6f1d e98b     .U......._S6.o..
c0dede04:	31ae cf90 313d 252e 8d8f 6235 b8e3 cb93     .1..=1.%..5b....
c0dede14:	19f9 48e4 69e7 f329 85c7 3a96 57b0 002f     ...H.i)....:.W/.
c0dede24:	e050 f38b ab81 1c21 cb78 43ec 811a b1e6     P.....!.x..C....
c0dede34:	9f07 07ca f452 6d94 1448 e297 3f00 9507     ....R..mH....?..
c0dede44:	1a47 98f9 2cb0 f817 d14f 5d5f 9873 aa15     G....,..O._]s...
c0dede54:	5dfb ae6d 3b65 c833 835b 2ca8 98b5 7906     .]m.e;3.[..,...y
c0dede64:	b571 b358 12bb 5f9b b015 4180 e145 2b65     q.X...._...AE.e+
c0dede74:	ea61 ea65 37e8 ab75 fec1 a358 6b36 f83e     a.e..7u...X.6k>.
c0dede84:	f8db bbb4 f57d 0fe6 745d a532 dcdf 8690     ....}...]t2.....
c0dede94:	b217 71fa 7848 146e 85bb 341e 7d95 4190     ...qHxn....4.}.A
c0dedea4:	e2be faac 55b4 8892 9936 64d0 58cc 0383     .....U..6..d.X..
c0dedeb4:	9204 291e 0304 1f30 fad8 f66e d5f2 7f6f     ...)..0...n...o.
c0dedec4:	3b52 ca90 41b9 f55e ef0c aa1e 3e75 98bc     R;...A^.....u>..
c0deded4:	749f 8391 0c9f 9dbe 0ff3 8cfc b65f e18e     .t.........._...
c0dedee4:	4a62 6072 d27f 9af9 a434 c6c6 eb02 0042     bJr`....4.....B.
c0dedef4:	403c 83a6 36c3 fbf8 b30d bd78 01b6 2d67     <@...6....x...g-
c0dedf04:	0ee9 2092 2cd8 4817 5a26 e648 8d9a a192     ... .,.H&ZH.....
c0dedf14:	5bc4 f31d 2cee deeb ef1c cfe7 2566 7e7f     .[...,......f%.~
c0dedf24:	ad82 d4ff 4b6a 9e9f 4856 6301 4aa6 9ea6     ....jK..VH.c.J..
c0dedf34:	7ca0 93e7 08be f9ac 0ba4 59a9 cb9f 19df     .|.........Y....
c0dedf44:	6c1c d1a7 c1b0 0a10 fc11 a572 948d e0f7     .l........r.....
c0dedf54:	0bd4 dfcd c753 3105 701e d8b5 d9a8 951a     ....S..1.p......
c0dedf64:	154f 6fcb 2787 ee3a eadc 4175 49ad db69     O..o.':...uA.Ii.
c0dedf74:	df94 d71c 827f 9b84 eabb 064d 85ad 5461     ..........M...aT
c0dedf84:	057d 6271 a419 fccf 755c 819c d1ed 04cc     }.qb....\u......
c0dedf94:	5439 3156 a2c1 074d b296 29d9 16b9 d5f4     9TV1..M....)....
c0dedfa4:	a443 38ff 6670 38e9 208b 7127 aa41 a76f     C..8pf.8. 'qA.o.
c0dedfb4:	f413 9f5d 8897 edf5 9722 0e01 f915 468d     ..]....."......F
c0dedfc4:	6e66 d1ef d73e be07 debe 9347 9d23 52df     fn..>.....G.#..R
c0dedfd4:	37be 6705 db1d 47cd a661 4864 847e 593c     .7.g...Ga.dH~.<Y
c0dedfe4:	99ac 7676 1d66 78ae ee05 85fd 12b8 d181     ..vvf..x........
c0dedff4:	11ed f771 8111 fa3b 9931 6e0d cd4d a811     ..q...;.1..nM...
c0dee004:	0f92 81e6 e0ff c365 b563 b4bf 4616 c54a     ......e.c....FJ.
c0dee014:	5822 8994 8dd7 eff4 95f0 66e8 c9a9 12b7     "X.........f....
c0dee024:	a7d4 495d 15c8 93e9 db31 35ca 33b7 d019     ..]I....1..5.3..
c0dee034:	1bc3 ce8c 913d 4c9e d2b5 280f 1618 8f32     ....=..L...(..2.
c0dee044:	7715 1dd3 6e18 75f5 cfe6 ec0a 5502 c85c     .w...n.u.....U\.
c0dee054:	b370 2d30 a23f 03df 0c3b 60f6 b1dd 5ecf     p.0-?...;..`...^
c0dee064:	38da 89b4 30ed 89fc 26c9 3494 4ab6 de0b     .8...0...&.4.J..
c0dee074:	590b 1c65 94f6 12ac 1165 da50 420e 018d     .Ye.....e.P..B..
c0dee084:	5ef4 d262 3b80 bbd6 d7ef 8066 c599 c4f8     .^b..;....f.....
c0dee094:	65aa 20c0 cf86 fc24 91c9 07e4 3a1a 6cec     .e. ..$......:.l
c0dee0a4:	8787 aa6f 033f ee54 7645 96b6 08bc eecf     ..o.?.T.Ev......
c0dee0b4:	29ef 2607 2e6c 0590 2b97 0fff 49f2 2d87     .).&l....+...I.-
c0dee0c4:	606b a11d ff02 e4c8 927b e3a0 ac84 f695     k`......{.......
c0dee0d4:	4ec5 aba6 960a c26b 51a6 a5ac e920 fbba     .N....k..Q.. ...
c0dee0e4:	b66b 8502 3c1c 0c50 66c0 0062 8d53 5c61     k....<P..fb.S.a\
c0dee0f4:	2de7 a8ef 2202 ebd6 25bf fe39 6bbd a978     .-..."...%9..kx.
c0dee104:	f4d1 7bbf cf6a 9233 55e5 2f1d d976 c956     ...{j.3..U./v.V.
c0dee114:	1445 18ae c006 a110 b11f 82f6 de41 24f4     E...........A..$
c0dee124:	33e6 ae85 46b1 703d 81f6 b34f ab6d e013     .3...F=p..O.m...
c0dee134:	fb77 84b2 927d d346 e751 f7b6 63b1 5e8e     w...}.F.Q....c.^
c0dee144:	8605 3e12 a1e7 ac74 ab29 eb69 f033 c2a7     ...>..t.).i.3...
c0dee154:	208a 48f1 76b1 5513 b1f1 53be 9f78 bf46     . .H.v.U...Sx.F.
c0dee164:	62f6 8901 ff95 9fad 8e87 7c56 318d 02f2     .b........V|.1..
c0dee174:	265a 4f39 eae9 f1ad bd9e 30b6 1712 931f     Z&9O.......0....
c0dee184:	d19c 897e 85ee 1370 7ed5 9b91 6d0d 4a77     ..~...p..~...mwJ
c0dee194:	2542 9544 8796 344b ff23 3c22 fdc5 1912     B%D...K4#."<....
c0dee1a4:	b7f9 8228 15aa 7bc8 7b9f 1dbf e790 93e9     ..(....{.{......
c0dee1b4:	e263 8083 7602 630c 86bd 8997 073b 62b7     c....v.c....;..b
c0dee1c4:	3107 2633 10f5 6133 0987 ce50 f71f 4af3     .13&..3a..P....J
c0dee1d4:	2922 e325 96d0 64a2 3503 3669 8f95 1bce     ")%....d.5i6....
c0dee1e4:	6ede a80d d0fa 9d41 80c5 4680 bc47 1ff7     .n....A....FG...
c0dee1f4:	01e9 5c8f 48e3 0417 5ca4 479f 7fae cc19     ...\.H...\.G....
c0dee204:	3205 43a5 f783 dc00 e1ef a83a ccd7 f47f     .2.C......:.....
c0dee214:	5d58 18a3 8c32 e723 7e29 2ded 0a60 7a8a     X]..2.#.)~.-`..z
c0dee224:	9fef 5134 4caa 1853 6aeb 4531 0af7 0d1b     ..4Q.LS..j1E....
c0dee234:	6391 63c7 d3af 462e 4887 d0ca 5e2e 7a1c     .c.c...F.H...^.z
c0dee244:	2675 fd69 29ed 5dd3 06fb d43f d2db 0502     u&i..).]..?.....
c0dee254:	ad21 1cbb 1a20 238a c229 28ac 973d 0a15     !... ..#)..(=...
c0dee264:	96c2 fe60 7268 0e64 96d7 56eb be4b 2aa1     ..`.hrd....VK..*
c0dee274:	a6f5 756f 4f64 e0cf 1632 1145 2eac 7d6d     ..oudO..2.E...m}
c0dee284:	b724 dbef e1b1 09c2 961e 439f 73df 9763     $..........C.sc.
c0dee294:	3dbd 2198 3583 c086 3859 bea6 2141 c4f2     .=.!.5..Y8..A!..
c0dee2a4:	aff8 98ae 7e86 caee 09a5 840a 3ea1 890b     .....~.......>..
c0dee2b4:	f904 5fe9 9cc6 b0f2 ea77 3111 7d1f d5f1     ..._....w..1.}..
c0dee2c4:	d3a3 96ae ef16 5f94 1e3c e269 f00c 1a4b     ......._<.i...K.
c0dee2d4:	7e9a 2aab d1b5 b4f1 0604 314d 0774 6639     .~.*......M1t.9f
c0dee2e4:	2e43 d646 21db ef98 d8d0 6dbf dbd9 39c5     C.F..!.....m...9
c0dee2f4:	4531 1d25 8f41 78f8 d3af 673d ed94 20ed     1E%.A..x..=g... 
c0dee304:	50ed 3e00 972d 600b 2d5a 63bf e5d3 e3be     .P.>-..`Z-.c....
c0dee314:	7d5c 65bc 9421 2756 ee83 3343 4fff d3c0     \}.e!.V'..C3.O..
c0dee324:	c382 841c 608a f196 fbd4 1f78 9720 676f     .....`....x. .og
c0dee334:	6b7c d2db e092 4dfd 16d7 de8d cb5e 375f     |k.....M....^._7
c0dee344:	e98f 9cf4 99f7 ba6d 747a 004b 03e7 d21b     ......m.ztK.....
c0dee354:	4290 5df8 f84d f3cd b9f7 f727 fd31 51c9     .B.]M.....'.1..Q
c0dee364:	da82 aa7f 23f4 60d7 e619 527e cca3 e96f     .....#.`..~R..o.
c0dee374:	3bdb ce43 46b3 2328 04a0 43e9 8f63 2ec1     .;C..F(#...Cc...
c0dee384:	e5db 3eba 5f7f 994b 16c2 ae8d edfc 7060     ...>._K.......`p
c0dee394:	8dd9 a673 75e1 b64d 0cf3 658e 7672 2dac     ..s..uM....erv.-
c0dee3a4:	e95f 54f7 3097 9119 5ee6 8d6f 2fb9 696e     _..T.0...^o../ni
c0dee3b4:	ca01 bc42 ad99 fab0 3a15 80a1 5d0c 3741     ..B......:...]A7
c0dee3c4:	13db 1855 0849 dc1d 9305 e7b1 9ab0 26fd     ..U.I..........&
c0dee3d4:	345b b19b c16f b905 8358 a609 de0a e699     [4..o...X.......
c0dee3e4:	a16e d490 5bc3 7a1f ddc2 dc8c 4210 a442     n....[.z.....BB.
c0dee3f4:	0b0b a3d1 297d 4c35 0274 a399 4a18 1cd0     ....})5Lt....J..
c0dee404:	50e9 1744 26b8 7d3e e8a8 ee32 8828 d05e     .PD..&>}..2.(.^.
c0dee414:	8185 44d9 13b8 9ff1 1d9e add2 3b40 b24e     ...D........@;N.
c0dee424:	10ec dce9 8119 19f2 beb8 e1bf fdc3 034e     ..............N.
c0dee434:	2afa aab9 36a6 fa54 d005 654c 0426 cd95     .*...6T...Le&...
c0dee444:	685a 2141 59ee e89f dbf3 d401 4f37 d820     ZhA!.Y......7O .
c0dee454:	f7a9 5322 5f4e b0a4 b8dc 99a7 d7a1 85b8     .."SN_..........
c0dee464:	079e 67f9 bc1d 86e1 60a5 fbff 1074 91b2     ...g.....`..t...
c0dee474:	e203 850f 6c23 99ff ae43 6054 0f59 c585     ....#l..C.T`Y...
c0dee484:	f196 d72b 0e54 6ac0 3105 9dc3 9b21 e89d     ..+.T..j.1..!...
c0dee494:	5383 5f8e 6860 a3d0 7132 433c b19f 3722     .S._`h..2q<C.."7
c0dee4a4:	2177 e9ae 8584 0985 4d83 bfc1 461f c991     w!.......M...F..
c0dee4b4:	3d7f 26b7 60ff 2eb2 142b cf17 02a9 2cd9     .=.&.`..+......,
c0dee4c4:	3120 f1a7 d4bb b1bc 6fec eaaa 3722 a36f      1.......o.."7o.
c0dee4d4:	da49 009f 1682 1154 5020 5855 6044 2c4a     I.....T. PUXD`J,
c0dee4e4:	0d53 8ec7 cc40 366e f143 88cf d075 c778     S...@.n6C...u.x.
c0dee4f4:	faac 028f 8b0e ad24 cf5e 04a0 f0b7 4a5a     ......$.^.....ZJ
c0dee504:	34d5 6ffc 40cd e590 4ad1 9348 2f64 5395     .4.o.@...JH.d/.S
c0dee514:	207c d634 966a 2571 1bbb 9e52 0a9a 29eb     | 4.j.q%..R....)
c0dee524:	bbf2 06a8 a498 68e3 4195 b6ce a78e 7a1c     .......h.A.....z
c0dee534:	226e a567 9168 9825 defd ece9 d3b8 3585     n"g.h.%........5
c0dee544:	0c74 8edd 873d ad66 5cdb 5ce9 4c24 74e4     t...=.f..\.\$L.t
c0dee554:	e76c b702 26e6 cea2 d100 25ad 8de4 6ae3     l....&.....%...j
c0dee564:	a50e cb49 8758 b01e f9bb ddd7 15ab 8503     ..I.X...........
c0dee574:	d36d 45be 19ba c1d6 f082 0adb 5ace 350c     m..E.........Z.5
c0dee584:	6955 ab0a 5737 5260 9a64 6565 f739 99cd     Ui..7W`Rd.ee9...
c0dee594:	0c61 fa68 436d ed67 f2d4 3b7c df96 9fcd     a.h.mCg...|;....
c0dee5a4:	471f 5ca4 e60d e7a7 a991 8e13 d019 9318     .G.\............
c0dee5b4:	54ee 86b9 92cc 6fb0 319c f9c9 aac9 e2bb     .T.....o.1......
c0dee5c4:	49a7 4aa4 ad39 a666 472a f872 ab21 689b     .I.J9.f.*Gr.!..h
c0dee5d4:	48c1 bd53 2f19 f4c7 5739 9c10 30d9 d354     .HS../..9W...0T.
c0dee5e4:	cf67 c1e4 4e3a 8715 9b55 c2cd 7050 41fa     g...:N..U...Pp.A
c0dee5f4:	2f71 7207 3072 2c5e ec40 f9cc 7de9 ff02     q/.rr0^,@....}..
c0dee604:	300d 5740 7570 807d 9f90 c7a8 d6ce eae8     .0@Wpu}.........
c0dee614:	fcf0 1e18 3929 3f3e 7244 8783 9488 e5c6     ....)9>?Dr......
c0dee624:	e9e6 f8f3 1c07 1e1d 5326 5b54 7e72 8e86     ........&ST[r~..
c0dee634:	ae97 c3c2 d7c7 e5dc f0ee 1508 211c 6924     .............!$i
c0dee644:	857c aea2 c1c0 f4cd 0000 0000 0000 0000     |...............
c0dee654:	2412 483a 1cd8 8d4d 4f73 fbcb deea 3f3d     .$:H..M.sO....=?
c0dee664:	038a aa9f 2c2a 5799 35e8 55ad 2eb2 bf75     ....*,.W.5.U..u.
c0dee674:	bb57 6a55                                    W.Uj.

c0dee679 <handler_cmd_verify_dilithium.pk>:
c0dee679:	327a 5741 a941 7c35 07db 85a5 803f 8ad1     z2AWA.5|....?...
c0dee689:	2a7a bcaa 44de 441b 3aa0 3f0e 4d84 194a     z*...D.D.:.?.MJ.
c0dee699:	d32a 5df5 437d ad53 4cba 3b91 9cdd 55a7     *..]}CS..L.;...U
c0dee6a9:	9a70 9b10 4592 c2f9 c6cb b1ae bdde 6661     p....E........af
c0dee6b9:	3851 912d 01c8 ad7c 13aa 7db3 cc14 4ca2     Q8-...|....}...L
c0dee6c9:	7cb3 e01f 08d1 69e5 1d94 cde9 f744 4948     .|.....i....D.HI
c0dee6d9:	9241 9af1 8421 a34e 4a74 75af d752 d710     A...!.N.tJ.uR...
c0dee6e9:	865c 4baa e604 72b1 61e9 108b ffef 08e7     \..K...r.a......
c0dee6f9:	4b0e aca6 f1de f372 22cd 2d04 aa53 134d     .K....r..".-S.M.
c0dee709:	4545 e081 21fa 30d9 deae 7b8d 59ff 38ca     EE...!.0...{.Y.8
c0dee719:	4870 de91 19f7 e87e f00a f7dd c702 6ea3     pH....~........n
c0dee729:	2095 a999 5aca aaef 51c9 3a78 7fa1 7244     . ...Z...Qx:..Dr
c0dee739:	046e ec79 19fd a0c9 013a fdfe 0399 0fd4     n.y.....:.......
c0dee749:	04d1 afae 1316 9f4b efef ef96 7dae 679d     ......K......}.g
c0dee759:	9f84 0bac 3f2c 03a1 7020 849e 5bac 5859     ....,?.. p...[YX
c0dee769:	5da1 8c97 6a5a 764a 9339 e684 c356 634b     .]..ZjJv9...V.Kc
c0dee779:	78af 25ba ec71 a999 3adc 1e0c b932 79f2     .x.%q....:..2..y
c0dee789:	5552 9a5f 2428 8dd4 ac6e a97a 03d9 6a71     RU_.($..n.z...qj
c0dee799:	347c b956 4264 d69d a454 d917 a9b1 5df1     |4V.dB..T......]
c0dee7a9:	ad2a c3cf f802 726b d86f d60a 0295 7a48     *.....kro.....Hz
c0dee7b9:	b72a eb2f b497 6e3b fb57 b5a0 be54 4a08     *./...;nW...T..J
c0dee7c9:	4e64 511e 66e2 239d da96 aad4 6d1c add2     dN.Q.f.#.....m..
c0dee7d9:	4e23 0891 c269 9a65 ea74 4559 52b4 39a1     #N..i.e.t.YE.R.9
c0dee7e9:	3d14 aed7 2371 576b 2840 952d 9280 e187     .=..q#kW@(-.....
c0dee7f9:	a52e 4e47 f12e 3aa9 315e 5e10 2826 2640     ..GN...:^1.^&(@&
c0dee809:	18a0 71a4 6a75 1650 3904 53b7 f134 099e     ...qujP..9.S4...
c0dee819:	30ec f718 800d cbb6 2c00 d883 5d0b c153     .0.......,...]S.
c0dee829:	5169 396e f1e3 5585 c7dc 55b5 5fdb 18a4     iQn9...U...U._..
c0dee839:	8ab3 78cb 11d0 1f02 dcea 43bf 5af3 6917     ...x.......C.Z.i
c0dee849:	d8d2 bf9d d264 6ca6 1aef 4a41 8170 de2e     ....d..l..AJp...
c0dee859:	7e3f 503a 969a c149 9b0c 5140 1364 54d5     ?~:P..I...@Qd..T
c0dee869:	2261 b31f 7f51 38aa c47c 3160 bf0e d6e0     a"..Q..8|.`1....
c0dee879:	caf9 6619 0453 7cdd 7dfa 80f9 9c3d 8dc8     ...fS..|.}..=...
c0dee889:	03dc fba1 9396 d980 90d8 c488 2b31 b6ef     ............1+..
c0dee899:	3fa6 7e45 cf83 53e0 f344 5461 e621 ba01     .?E~...SD.aT!...
c0dee8a9:	c295 a899 2c84 150b 7423 2dfe 0251 2f9e     .....,..#t.-Q../
c0dee8b9:	97d2 97a6 b961 e363 ee3a bf98 3bef 810d     ....a.c.:....;..
c0dee8c9:	377f a25a 7cf4 ac35 c4aa f11a 52e8 1367     .7Z..|5......Rg.
c0dee8d9:	ca57 1a82 abe8 f901 85b4 6f3b 3869 ecbe     W.........;oi8..
c0dee8e9:	9acd cf7a 4f61 67eb 6944 9164 d202 c923     ..z.aO.gDid...#.
c0dee8f9:	f887 9e24 2924 d833 55ea f328 1c8f 89d5     ..$.$)3..U(.....
c0dee909:	8367 8969 e721 0bd9 d97e ecac 3043 d9c4     g.i.!...~...C0..
c0dee919:	12d9 17f5 5bf8 2462 690e 5358 0de6 114b     .....[b$.iXS..K.
c0dee929:	4efa a889 522f 9396 982c 05a1 0c60 7912     .N../R..,...`..y
c0dee939:	0178 1617 b82e e983 2282 90c0 d80f e32f     x........"..../.
c0dee949:	0906 0bc3 03f1 a465 3814 6857 7870 db4d     ......e..8WhpxM.
c0dee959:	f4cb 442c 630c d79e 15e0 675b 679c 7c98     ..,D.c....[g.g.|
c0dee969:	9e42 f7ac 1b33 3e5a 0ff1 1e1e 2ab1 aa1f     B...3.Z>.....*..
c0dee979:	94b4 0eb5 5d2a 9da6 29f4 4d0f 8b76 fb6f     ....*]...).Mv.o.
c0dee989:	8c3f 3046 1ab7 5215 ede8 b5fe 42e1 1fc5     ?.F0...R.....B..
c0dee999:	0cf1 13b8 cdf3 394e 9f97 fef5 2700 bb42     ......N9.....'B.
c0dee9a9:	e96e 10c4 18c8 a829 b82c deb5 e6de e7a4     n.....).,.......
c0dee9b9:	4c6b ab84 c102 1466 d85e 59fc f4f7 16b4     kL....f.^..Y....
c0dee9c9:	39be ab0e fc8b 49dc 6f8d 3148 cf38 15a0     .9.....I.oH18...
c0dee9d9:	0b2f c988 75de 901d 1107 6d59 d064 c3c6     /....u....Ymd...
c0dee9e9:	a2bd c2d1 5545 fc1f 1bb8 3b5d b1bd 38a7     ....EU....];...8
c0dee9f9:	622c dfd0 a24c dd3b 28d2 999a ff78 bc31     ,b..L.;..(..x.1.
c0deea09:	995f ef25 d2f1 7984 8396 408c f4d2 0547     _.%....y...@..G.
c0deea19:	37d7 aa35 d6ac a7c6 f196 1388 69f0 1534     .75..........i4.
c0deea29:	5055 72df a339 2a6a 9200 8500 cceb ff37     UP.r9.j*......7.
c0deea39:	1230 34bc 030a 4724 9529 9c3b 8dc1 bd2d     0..4..$G).;...-.
c0deea49:	fd9b 36e8 7f6d 88f6 6c2c 99cf b40b d3da     ...6m...,l......
c0deea59:	32ae 38b1 f347 475b 612e 7417 9df6 1c73     .2.8G.[G.a.t..s.
c0deea69:	fd79 27f7 4aab 2140 daf4 9cc5 ff2e 57bc     y..'.J@!.......W
c0deea79:	669c 08f2 2601 6d00 4a81 43d8 8831 1dde     .f...&.m.J.C1...
c0deea89:	53b0 aafb f44d 52f7 a54f e800 dc9c 8a58     .S..M..RO.....X.
c0deea99:	76e8 c12a 4c72 449a 0fac 9773 32f7 87c3     .v*.rL.D..s..2..
c0deeaa9:	4b2f 40dc 2875 4d14 373b 49ac 2653 48a8     /K.@u(.M;7.IS&.H
c0deeab9:	1045 dff6 8480 ea9b e8d5 5bf8 1f11 c9ff     E..........[....
c0deeac9:	f401 be47 f9b6 f974 1438 356f d0b5 9bed     ..G...t.8.o5....
c0deead9:	9ec3 9b60 2cfb 3791 9646 8f80 701e 8bae     ..`..,.7F....p..
c0deeae9:	673b b56a d4ce 44ec bf67 4c90 18bd ca70     ;gj....Dg..L..p.
c0deeaf9:	a9ab fbc5 923e f712 b4c3 2836 7e5a 276e     ....>.....6(Z~n'
c0deeb09:	c32a f960 7e13 52bc 7352 8535 2a21 db91     *.`..~.RRs5.!*..
c0deeb19:	9e4b de86 de4c f52a 1699 a8e6 5904 45f1     K...L.*......Y.E
c0deeb29:	6b0e acad 14ee ea83 b1c5 295b 79d7 5554     .k........[).yTU
c0deeb39:	547e eafb d73a a98f eba3 0b05 fb68 9695     ~T..:.......h...
c0deeb49:	7369 4cb1 c91a aa56 4845 b981 d16a 92f4     is.L..V.EH..j...
c0deeb59:	83e1 1c09 ff31 41a2 f10b 842b 43bf 5a21     ....1..A..+..C!Z
c0deeb69:	3f07 c916 41ef e919 6101 de5d 41b1 67de     .?...A...a]..A.g
c0deeb79:	919f 451e b0a3 89f1 2aa9 0f95 e22e 9d62     ...E.....*....b.
c0deeb89:	014c 1dd4 1da3 081d 4712 6382 183f ee68     L........G.c?.h.
c0deeb99:	0000                                         ...

c0deeb9c <settingContents>:
c0deeb9c:	0000 0000 ebb8 c0de 0001 0000               ............

c0deeba8 <infoList>:
c0deeba8:	ebf0 c0de ebf8 c0de 0000 0000 0002 0000     ................

c0deebb8 <contents>:
c0deebb8:	0007 0000 1434 da7a 0002 0000 0000 0000     ....4.z.........
	...
c0deebec:	0cd5 c0de                                   ....

c0deebf0 <INFO_TYPES>:
c0deebf0:	d598 c0de d3d6 c0de                         ........

c0deebf8 <INFO_CONTENTS>:
c0deebf8:	d240 c0de d491 c0de                         @.......

c0deec00 <zetas>:
c0deec00:	0000 0000 64f7 0000 3102 ffd8 1503 fff8     .....d...1......
c0deec10:	9e44 0003 2118 fff4 a128 fff2 1e24 0007     D....!..(...$...
c0deec20:	de2b 001b e92b 0023 84ad fffa 147f ffe0     +...+.#.........
c0deec30:	9a75 002f fb09 ffd3 7a49 002f e527 0028     u./.....Iz/.'.(.
c0deec40:	9658 0029 a070 000f 85a4 ffef b788 0036     X.).p.........6.
c0deec50:	9d90 fff7 eaa0 ffee f968 0027 d37b ffdf     ........h.'.{...
c0deec60:	add6 ffdf 1ae7 ffc5 a4f7 ffea fc98 ffcd     ................
c0deec70:	d035 001a b422 ffff 3201 003d 45c5 0004     5..."....2=..E..
c0deec80:	4a67 0029 7620 0001 f4cd 002e dec5 0035     gJ). v........5.
c0deec90:	a503 ffe6 302c ffc9 47d4 ffd9 beaf 003b     ....,0...G....;.
c0deeca0:	1585 ffc5 8e7c ffd1 8a96 0036 3e41 ffd4     ....|.....6.A>..
c0deecb0:	0400 0036 6a4d fffb d69c 0023 c55d fff7     ..6.Mj....#.]...
c0deecc0:	123d ffe6 ead6 ffe6 7e1e 0035 af59 ffc5     =........~5.Y...
c0deecd0:	843f 0035 5617 ffdf 945c ffe7 738c 0038     ?.5..V..\....s8.
c0deece0:	63a8 000c 1b9a 0008 8f76 000e 3853 003b     .c......v...S8;.
c0deecf0:	8534 003b fc30 ffd8 9d54 001f 4f2d ffd5     4.;.0...T...-O..
c0deed00:	06e5 ffc4 ac81 ffe8 e1cf ffc7 9819 ffd1     ................
c0deed10:	d65d ffe9 09ee 0035 35c7 0021 cfbb ffe7     ].....5..5!.....
c0deed20:	cf75 ffec 9772 001d b072 ffc1 bcf6 fff0     u...r...r.......
c0deed30:	5280 ffcf d2ae ffcf 90e0 ffc8 efca 0001     .R..............
c0deed40:	10f2 0034 fe85 fff0 c638 0020 6e9f 0029     ..4.....8. ..n).
c0deed50:	b7a3 ffd2 a44b ffc7 ba6d fff9 3409 ffda     ....K...m....4..
c0deed60:	c282 fff5 4113 ffed a63b ffff 09f7 ffec     .....A..;.......
c0deed70:	2bdd fffa 95d4 0014 4563 001c 2c62 ffea     .+......cE..b,..
c0deed80:	fbe9 ffcc 0af0 0004 c417 0007 4588 002f     .............E/.
c0deed90:	ad00 0000 36be ffef cd44 000d 675a 003c     .....6..D...Zg<.
c0deeda0:	2bca ffc7 de7e ffff 3948 0019 69c0 ffce     .+..~...H9...i..
c0deedb0:	756c 0024 c7df fffc 98a1 000b e808 ffeb     lu$.............
c0deedc0:	e46c 0002 c808 ffc9 36c2 0030 bff6 ffe3     l........60.....
c0deedd0:	3c93 ffdb 4ae0 fffd 1305 0014 7792 0014     .<...J.......w..
c0deede0:	9e25 0013 d0e0 ffe7 9944 fff3 0802 ffea     %.......D.......
c0deedf0:	eea2 ffd1 c79c ffc4 a057 ffc8 97d9 003a     ........W.....:.
c0deee00:	ea93 001f ff5a 0033 58d4 0023 41f8 003a     ....Z.3..X#..A:.
c0deee10:	ff72 ffcc 3dfb 0022 ab9f ffda a422 ffc9     r....="....."...
c0deee20:	12f5 0004 2587 0025 24f0 ffed 9b5d 0035     .....%%..$..].5.
c0deee30:	48a0 ffca a2fc ffc6 bb56 ffed 45de ffcf     .H......V....E..
c0deee40:	be5e 000d 5e1a 001c e0e6 000d 7f5a 000c     ^....^......Z...
c0deee50:	8f83 0007 628a ffe7 5704 ffff 06fc fff8     .....b...W......
c0deee60:	0021 fff6 5af6 ffd0 0084 001f ef86 0030     !....Z........0.
c0deee70:	b97d ffc9 fcd6 fff7 4592 fff4 21c2 ffc9     }........E...!..
c0deee80:	3919 0005 610c 0004 cd41 ffda b01b 003e     .9...a..A.....>.
c0deee90:	72e7 0034 003b ffcd 7cc7 001a 1924 0003     .r4.;....|..$...
c0deeea0:	5ee5 002b 1199 0029 7a3a ffd8 4d71 0013     .^+...).:z..qM..
c0deeeb0:	e11c 003d 0984 0013 f051 0025 5a46 0018     ..=.....Q.%.FZ..
c0deeec0:	8518 ffc6 14be 0013 3891 0028 db90 ffc9     .........8(.....
c0deeed0:	5089 ffd2 853f 001c 0b4b 001d f6a6 ffef     .P..?...K.......
c0deeee0:	a8be ffeb e11b 0012 5e3e ffcd 2d2f ffea     ........>^../-..
c0deeef0:	1de4 fff9 06c7 0014 7283 0032 0d6e ffe2     .........r2.n...
c0deef00:	7953 ffec 4099 001d 2578 ffd9 05ad ffeb     Sy...@..x%......
c0deef10:	e405 0016 dbe7 000b 1de8 0022 f8cf 0033     .........."...3.
c0deef20:	b934 fff7 ca0c ffd4 7ff8 ffe6 d157 ffe3     4...........W...
c0deef30:	911b ffd8 2c12 ffc7 10d8 0009 5e1f ffc6     .....,.......^..
c0deef40:	4658 ffe1 1d8b 0025 73b7 0025 7c8f fffd     XF....%..s%..|..
c0deef50:	dd98 001d 6898 0033 d4bb 0002 93a7 ffed     .....h3.........
c0deef60:	6cbe ffcf 7c1c 0002 aa08 0018 fd71 002d     .l...|......q.-.
c0deef70:	5ca5 000c 379a 0019 a167 ffc7 8c3d ffe4     .\...7..g...=...
c0deef80:	a13c ffd1 c539 0035 0115 003b 1dc0 0004     <...9.5...;.....
c0deef90:	c4f7 0021 1bf4 fff1 35e7 001a 340e 0007     ..!......5...4..
c0deefa0:	7d45 fff9 4cd0 001a 7cae ffe4 2668 001d     E}...L...|..h&..
c0deefb0:	8e98 ffe6 2633 ffef 05da fffc 7fdb ffc5     ....3&..........
c0deefc0:	2764 ffd3 e1af ffdd 93dd fff9 1d09 ffdd     d'..............
c0deefd0:	cc93 0002 1805 fff1 9c2a 0018 e5a9 ffc9     ........*.......
c0deefe0:	8a50 fff7 cf2c 003b 434e ffff 36df ffeb     P...,.;.NC...6..
c0deeff0:	15ca 003c 5e68 0015 16b6 fff3 29ce 001e     ..<.h^.......)..

c0def000 <small_zetas>:
c0def000:	fbec fd0a fe99 fa13 05d5 058e 011f 00ca     ................
c0def010:	ff55 026e 0629 00b6 03c2 fb4e fa3e 05bc     U.n.).....N.>...
c0def020:	023d fad3 0108 017f fcc3 05b2 f9be ff7e     =.............~.
c0def030:	fd57 03f9 02dc 0260 f9fa 019b ff33 f9dd     W.....`.....3...
c0def040:	04c7 028c fdd8 03f7 faf3 05d3 fee6 f9f8     ................
c0def050:	0204 fff8 fec0 fd66 f9ae fb76 007e 05bd     ......f...v.~...
c0def060:	fcab ffa6 fef1 033e 006b fa73 ff09 fc49     ......>.k.s...I.
c0def070:	fe72 03c1 fa1c fd2b 01c0 fbd7 02a5 fb05     r.....+.........
c0def080:	fbb1 01ae 022b 034b fb1d 0367 060e 0069     ....+.K...g...i.
c0def090:	01a6 024b 00b1 ff15 fedd fe34 0626 0675     ..K.......4.&.u.
c0def0a0:	ff0a 030a 0487 ff6d fcf7 05cb fda6 045f     ......m......._.
c0def0b0:	f9ca 0284 fc98 015d 01a2 0149 ff64 ffb5     ......]...I.d...
c0def0c0:	0331 0449 025b 0262 052a fafb fa47 0180     1.I.[.b.*...G...
c0def0d0:	fb41 ff78 04c2 fac9 fc96 00dc fb5d f985     A.x.........]...
c0def0e0:	fb5f fa06 fb02 031a fa1a fcaa fc9a 01de     _...............
c0def0f0:	ff94 fecc 03e4 03df 03be fa4c 05f2 065c     ..........L...\.

c0def100 <.L__const.nbgl_useCaseStatus.ticker>:
c0def100:	8fa5 c0de 0bb8 0000 0000 0000               ............

c0def10c <blindSigningWarning>:
c0def10c:	0010 0000 0000 0000 0000 0000 0000 0000     ................
	...
c0def134:	6854 7369 6120 7070 6520 616e 6c62 7365     This app enables
c0def144:	7320 6769 696e 676e 740a 6172 736e 6361      signing.transac
c0def154:	6974 6e6f 2073 6e6f 6920 7374 6e20 7465     tions on its net
c0def164:	6f77 6b72 002e                              work..

c0def16a <nbMaxElementsPerContentType>:
c0def16a:	0101 0101 0101 0301 0503 0005 0000          ..............

c0def178 <g_pcHex>:
c0def178:	3130 3332 3534 3736 3938 6261 6463 6665     0123456789abcdef
c0def188:	0000 0000 0040 0000 0000 0000 0000 0000     ....@...........
c0def198:	0101 0000 0000 0000 0000 0000 0916 0000     ................
c0def1a8:	0000 0000 0028 0000 0000 0000 0000 0000     ....(...........

c0def1b8 <g_pcHex_cap>:
c0def1b8:	3130 3332 3534 3736 3938 4241 4443 4645     0123456789ABCDEF

c0def1c8 <.L__const.displaySkipWarning.info>:
c0def1c8:	d623 c0de d825 c0de 0000 0000 c6f4 c0de     #...%...........
c0def1d8:	0000 0000 d424 c0de d9a2 c0de 0005 0109     ....$...........

c0def1e8 <securityReportItems>:
c0def1e8:	d1a3 c0de d204 c0de 0000 0000 d1a3 c0de     ................
c0def1f8:	d651 c0de d926 c0de d1a3 c0de d6cb c0de     Q...&...........
c0def208:	d5e0 c0de 0000 0000 d97a c0de dad0 c0de     ........z.......
c0def218:	d1a3 c0de d630 c0de d6f4 c0de               ....0.......

c0def224 <.L__const.displayCustomizedSecurityReport.layoutDescription>:
c0def224:	0101 0000 0000 0000 0000 0000 a579 c0de     ............y...
	...

c0def240 <.L__const.displayInfosListModal.info>:
c0def240:	0100 0113 0900 0000 0000 0000 0000 0000     ................
c0def250:	0100 0300 0000 0000 0000 0000               ............

c0def25c <.L__const.displayInitialWarning.buttonsInfo>:
c0def25c:	d45c c0de da7a c0de 0000 0000 0014 0009     \...z...........

c0def26c <_etext>:
	...

c0def400 <N_storage_real>:
	...

c0def600 <install_parameters>:
c0def600:	0801 4c4d 5344 4541 4854 0502 2e30 2e30     ..MLDSAETH..0.0.
c0def610:	0331 0182 284a 2800 2200 0142 ff00 ffff     1...J(.(."B.....
c0def620:	ffff 8ccc 1082 5a91 dce0 020b 1110 8130     .......Z......0.
c0def630:	d98e 0107 1152 0320 d70c 3485 3233 3001     ....R. ....432.0
c0def640:	d50a 5696 4340 2122 0c20 89d3 3446 2233     ...V@C"! ...F43"
c0def650:	2011 0d01 9dd1 5037 1314 1314 1132 0520     . ....7P....2. .
c0def660:	08d1 1607 1c0a 080b 2233 3011 cf0c 479e     ........3".0...G
c0def670:	c5b0 050d 2213 3011 c406 c72e 6c8b 8dc7     .....".0.....l..
c0def680:	2253 9588 0e30 0bc2 0310 08c7 c309 ce8e     S"..0...........
c0def690:	0bc2 1302 dcbc 00d9 2691 c180 1005 c702     .........&......
c0def6a0:	0d05 acc2 9cbd bec1 9d43 a130 67bd 091c     ........C.0..g..
c0def6b0:	2314 0b02 05c6 0ac3 0ec1 c208 0306 9218     .#..............
c0def6c0:	e017 2c3d 8a2b c53c c209 0a0e 08c2 09c2     ..=,+.<.........
c0def6d0:	1703 8811 1ced 1b1d 0a2c c609 c308 dfaa     ........,.......
c0def6e0:	c2cb 27bc 70e8 b31d a906 adb0 787a 0ac7     ...'.p......zx..
c0def6f0:	af2e adec 9ec3 9072 bd1e 5a60 0ec0 86c1     ......r...`Z....
c0def700:	c8a7 0b0d c02e c50e d6be 3012 06a1 c2c8     ...........0....
c0def710:	8b9e c950 7e07 ba5e 7b64 0bd0 c20a 070e     ..P..~^.d{......
c0def720:	c918 0c0b 7e7e 1d0e d208 7e07 0e7e ac8d     ....~~.....~~...
c0def730:	0dd2 7e09 8d6e d4b9 0a0b 4e7e c98d 0bd6     ...~n.....~N....
c0def740:	7e09 1d1e 090b 8dd8 3e7c 1e1d 8d8c 9cdb     .~......|>......
c0def750:	b089 9b1c b0a8 9de0 d0cb ffff ffff 04c4     ................
c0def760:	010a 8002 0000 802c 0000                     ......,....
