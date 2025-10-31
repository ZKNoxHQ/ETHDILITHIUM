
build/flex/bin/app.elf:     file format elf32-littlearm


Disassembly of section .text:

c0de0000 <main>:
c0de0000:	b510      	push	{r4, lr}
c0de0002:	4604      	mov	r4, r0
c0de0004:	b662      	cpsie	i
c0de0006:	f00c fbdf 	bl	c0dec7c8 <os_boot>
c0de000a:	b90c      	cbnz	r4, c0de0010 <main+0x10>
c0de000c:	f00c f9a6 	bl	c0dec35c <standalone_app_main>
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
c0de0022:	f00d f875 	bl	c0ded110 <__aeabi_memclr>
c0de0026:	b914      	cbnz	r4, c0de002e <address_from_pubkey+0x1a>
c0de0028:	2001      	movs	r0, #1
c0de002a:	f00c fb49 	bl	c0dec6c0 <assert_exit>
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
c0de0042:	f00c fb05 	bl	c0dec650 <cx_keccak_256_hash_iovec>
c0de0046:	b108      	cbz	r0, c0de004c <address_from_pubkey+0x38>
c0de0048:	2000      	movs	r0, #0
c0de004a:	e006      	b.n	c0de005a <address_from_pubkey+0x46>
c0de004c:	f105 010c 	add.w	r1, r5, #12
c0de0050:	4620      	mov	r0, r4
c0de0052:	2214      	movs	r2, #20
c0de0054:	f00d f852 	bl	c0ded0fc <__aeabi_memcpy>
c0de0058:	2001      	movs	r0, #1
c0de005a:	b00a      	add	sp, #40	@ 0x28
c0de005c:	bd70      	pop	{r4, r5, r6, pc}

c0de005e <apdu_dispatcher>:
c0de005e:	b51f      	push	{r0, r1, r2, r3, r4, lr}
c0de0060:	4604      	mov	r4, r0
c0de0062:	b910      	cbnz	r0, c0de006a <apdu_dispatcher+0xc>
c0de0064:	2001      	movs	r0, #1
c0de0066:	f00c fb2b 	bl	c0dec6c0 <assert_exit>
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
c0de0294:	f00c f822 	bl	c0dec2dc <io_send_response_buffers>
c0de0298:	bd80      	pop	{r7, pc}

c0de029a <OUTLINED_FUNCTION_0>:
c0de029a:	9001      	str	r0, [sp, #4]
c0de029c:	7920      	ldrb	r0, [r4, #4]
c0de029e:	9002      	str	r0, [sp, #8]
c0de02a0:	4770      	bx	lr
	...

c0de02a4 <app_main>:
c0de02a4:	b5bf      	push	{r0, r1, r2, r3, r4, r5, r7, lr}
c0de02a6:	f00b fffb 	bl	c0dec2a0 <io_init>
c0de02aa:	f000 fcc7 	bl	c0de0c3c <ui_menu_main>
c0de02ae:	481b      	ldr	r0, [pc, #108]	@ (c0de031c <app_main+0x78>)
c0de02b0:	f44f 7136 	mov.w	r1, #728	@ 0x2d8
c0de02b4:	4448      	add	r0, r9
c0de02b6:	f00c ff39 	bl	c0ded12c <explicit_bzero>
c0de02ba:	481a      	ldr	r0, [pc, #104]	@ (c0de0324 <app_main+0x80>)
c0de02bc:	4478      	add	r0, pc
c0de02be:	f00c fc1f 	bl	c0decb00 <pic>
c0de02c2:	7880      	ldrb	r0, [r0, #2]
c0de02c4:	2801      	cmp	r0, #1
c0de02c6:	d00d      	beq.n	c0de02e4 <app_main+0x40>
c0de02c8:	2001      	movs	r0, #1
c0de02ca:	f88d 0002 	strb.w	r0, [sp, #2]
c0de02ce:	2000      	movs	r0, #0
c0de02d0:	f8ad 0000 	strh.w	r0, [sp]
c0de02d4:	4814      	ldr	r0, [pc, #80]	@ (c0de0328 <app_main+0x84>)
c0de02d6:	4478      	add	r0, pc
c0de02d8:	f00c fc12 	bl	c0decb00 <pic>
c0de02dc:	4669      	mov	r1, sp
c0de02de:	2203      	movs	r2, #3
c0de02e0:	f00c fc48 	bl	c0decb74 <nvm_write>
c0de02e4:	4d0e      	ldr	r5, [pc, #56]	@ (c0de0320 <app_main+0x7c>)
c0de02e6:	ac01      	add	r4, sp, #4
c0de02e8:	f00b ffe2 	bl	c0dec2b0 <io_recv_command>
c0de02ec:	2800      	cmp	r0, #0
c0de02ee:	d414      	bmi.n	c0de031a <app_main+0x76>
c0de02f0:	4602      	mov	r2, r0
c0de02f2:	eb09 0105 	add.w	r1, r9, r5
c0de02f6:	4620      	mov	r0, r4
c0de02f8:	f00c f857 	bl	c0dec3aa <apdu_parser>
c0de02fc:	b130      	cbz	r0, c0de030c <app_main+0x68>
c0de02fe:	4620      	mov	r0, r4
c0de0300:	f7ff fead 	bl	c0de005e <apdu_dispatcher>
c0de0304:	f1b0 3fff 	cmp.w	r0, #4294967295	@ 0xffffffff
c0de0308:	dcee      	bgt.n	c0de02e8 <app_main+0x44>
c0de030a:	e006      	b.n	c0de031a <app_main+0x76>
c0de030c:	2000      	movs	r0, #0
c0de030e:	2100      	movs	r1, #0
c0de0310:	f646 2287 	movw	r2, #27271	@ 0x6a87
c0de0314:	f00b ffe2 	bl	c0dec2dc <io_send_response_buffers>
c0de0318:	e7e6      	b.n	c0de02e8 <app_main+0x44>
c0de031a:	bdbf      	pop	{r0, r1, r2, r3, r4, r5, r7, pc}
c0de031c:	00000000 	.word	0x00000000
c0de0320:	00001497 	.word	0x00001497
c0de0324:	00010340 	.word	0x00010340
c0de0328:	00010326 	.word	0x00010326

c0de032c <handler_get_app_name>:
c0de032c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de032e:	4808      	ldr	r0, [pc, #32]	@ (c0de0350 <handler_get_app_name+0x24>)
c0de0330:	4478      	add	r0, pc
c0de0332:	f00c fbe5 	bl	c0decb00 <pic>
c0de0336:	2100      	movs	r1, #0
c0de0338:	f44f 4210 	mov.w	r2, #36864	@ 0x9000
c0de033c:	9103      	str	r1, [sp, #12]
c0de033e:	2105      	movs	r1, #5
c0de0340:	e9cd 0101 	strd	r0, r1, [sp, #4]
c0de0344:	a801      	add	r0, sp, #4
c0de0346:	2101      	movs	r1, #1
c0de0348:	f00b ffc8 	bl	c0dec2dc <io_send_response_buffers>
c0de034c:	b004      	add	sp, #16
c0de034e:	bd80      	pop	{r7, pc}
c0de0350:	0000e6de 	.word	0x0000e6de

c0de0354 <handler_get_public_key>:
c0de0354:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de0356:	b085      	sub	sp, #20
c0de0358:	4f23      	ldr	r7, [pc, #140]	@ (c0de03e8 <handler_get_public_key+0x94>)
c0de035a:	460c      	mov	r4, r1
c0de035c:	4605      	mov	r5, r0
c0de035e:	f44f 7136 	mov.w	r1, #728	@ 0x2d8
c0de0362:	eb09 0607 	add.w	r6, r9, r7
c0de0366:	4630      	mov	r0, r6
c0de0368:	f00c fee0 	bl	c0ded12c <explicit_bzero>
c0de036c:	2000      	movs	r0, #0
c0de036e:	f506 7135 	add.w	r1, r6, #724	@ 0x2d4
c0de0372:	f809 0007 	strb.w	r0, [r9, r7]
c0de0376:	f886 02a8 	strb.w	r0, [r6, #680]	@ 0x2a8
c0de037a:	4628      	mov	r0, r5
c0de037c:	f00b fd5a 	bl	c0debe34 <buffer_read_u8>
c0de0380:	b308      	cbz	r0, c0de03c6 <handler_get_public_key+0x72>
c0de0382:	eb09 0007 	add.w	r0, r9, r7
c0de0386:	f890 22d4 	ldrb.w	r2, [r0, #724]	@ 0x2d4
c0de038a:	f500 712b 	add.w	r1, r0, #684	@ 0x2ac
c0de038e:	4628      	mov	r0, r5
c0de0390:	f00b fda3 	bl	c0debeda <buffer_read_bip32_path>
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
c0de03bc:	f00b fe4e 	bl	c0dec05c <bip32_derive_with_seed_get_pubkey_256>
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
c0de03f4:	f00b ff72 	bl	c0dec2dc <io_send_response_buffers>
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
c0de0420:	f00b ff5c 	bl	c0dec2dc <io_send_response_buffers>
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
c0de0462:	f00c fe63 	bl	c0ded12c <explicit_bzero>
c0de0466:	2000      	movs	r0, #0
c0de0468:	f505 7135 	add.w	r1, r5, #724	@ 0x2d4
c0de046c:	f809 0006 	strb.w	r0, [r9, r6]
c0de0470:	2001      	movs	r0, #1
c0de0472:	f885 02a8 	strb.w	r0, [r5, #680]	@ 0x2a8
c0de0476:	4620      	mov	r0, r4
c0de0478:	f00b fcdc 	bl	c0debe34 <buffer_read_u8>
c0de047c:	b148      	cbz	r0, c0de0492 <handler_sign_tx+0x6a>
c0de047e:	eb09 0006 	add.w	r0, r9, r6
c0de0482:	f890 22d4 	ldrb.w	r2, [r0, #724]	@ 0x2d4
c0de0486:	f500 712b 	add.w	r1, r0, #684	@ 0x2ac
c0de048a:	4620      	mov	r0, r4
c0de048c:	f00b fd25 	bl	c0debeda <buffer_read_bip32_path>
c0de0490:	b9b8      	cbnz	r0, c0de04c2 <handler_sign_tx+0x9a>
c0de0492:	f646 2087 	movw	r0, #27271	@ 0x6a87
c0de0496:	e019      	b.n	c0de04cc <handler_sign_tx+0xa4>
c0de0498:	f24b 0007 	movw	r0, #45063	@ 0xb007
c0de049c:	e016      	b.n	c0de04cc <handler_sign_tx+0xa4>
c0de049e:	eb09 0106 	add.w	r1, r9, r6
c0de04a2:	4408      	add	r0, r1
c0de04a4:	f100 0108 	add.w	r1, r0, #8
c0de04a8:	4620      	mov	r0, r4
c0de04aa:	f00b fd40 	bl	c0debf2e <buffer_move>
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
c0de0512:	f00c f89d 	bl	c0dec650 <cx_keccak_256_hash_iovec>
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
c0de0536:	f00c fe4d 	bl	c0ded1d4 <strcmp>
c0de053a:	b110      	cbz	r0, c0de0542 <handler_sign_tx+0x11a>
c0de053c:	f000 fd8b 	bl	c0de1056 <ui_display_transaction>
c0de0540:	e7f1      	b.n	c0de0526 <handler_sign_tx+0xfe>
c0de0542:	f000 fd85 	bl	c0de1050 <ui_display_blind_signed_transaction>
c0de0546:	e7ee      	b.n	c0de0526 <handler_sign_tx+0xfe>
c0de0548:	00000000 	.word	0x00000000
c0de054c:	0000df75 	.word	0x0000df75

c0de0550 <io_send_sw>:
c0de0550:	b580      	push	{r7, lr}
c0de0552:	4602      	mov	r2, r0
c0de0554:	2000      	movs	r0, #0
c0de0556:	2100      	movs	r1, #0
c0de0558:	f00b fec0 	bl	c0dec2dc <io_send_response_buffers>
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
c0de057e:	f00b fead 	bl	c0dec2dc <io_send_response_buffers>
c0de0582:	bd8f      	pop	{r0, r1, r2, r3, r7, pc}

c0de0584 <io_send_sw>:
c0de0584:	b580      	push	{r7, lr}
c0de0586:	4602      	mov	r2, r0
c0de0588:	2000      	movs	r0, #0
c0de058a:	2100      	movs	r1, #0
c0de058c:	f00b fea6 	bl	c0dec2dc <io_send_response_buffers>
c0de0590:	bd80      	pop	{r7, pc}

c0de0592 <handler_cmd_keccakH>:
c0de0592:	b5b0      	push	{r4, r5, r7, lr}
c0de0594:	b0f2      	sub	sp, #456	@ 0x1c8
c0de0596:	466d      	mov	r5, sp
c0de0598:	4604      	mov	r4, r0
c0de059a:	4628      	mov	r0, r5
c0de059c:	f001 fe71 	bl	c0de2282 <keccak_init>
c0de05a0:	88a2      	ldrh	r2, [r4, #4]
c0de05a2:	6821      	ldr	r1, [r4, #0]
c0de05a4:	4628      	mov	r0, r5
c0de05a6:	f001 fe70 	bl	c0de228a <keccak_update>
c0de05aa:	ac6a      	add	r4, sp, #424	@ 0x1a8
c0de05ac:	4628      	mov	r0, r5
c0de05ae:	4621      	mov	r1, r4
c0de05b0:	f001 fe6d 	bl	c0de228e <keccak_final>
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
c0de05d6:	f001 fe5c 	bl	c0de2292 <inner_keccak256_init>
c0de05da:	e019      	b.n	c0de0610 <handler_cmd_keccak_prng+0x4c>
c0de05dc:	4c14      	ldr	r4, [pc, #80]	@ (c0de0630 <handler_cmd_keccak_prng+0x6c>)
c0de05de:	eb09 0004 	add.w	r0, r9, r4
c0de05e2:	f001 fe79 	bl	c0de22d8 <inner_keccak256_flip>
c0de05e6:	b9a0      	cbnz	r0, c0de0612 <handler_cmd_keccak_prng+0x4e>
c0de05e8:	eb09 0004 	add.w	r0, r9, r4
c0de05ec:	4669      	mov	r1, sp
c0de05ee:	2240      	movs	r2, #64	@ 0x40
c0de05f0:	f001 fe88 	bl	c0de2304 <inner_keccak256_extract>
c0de05f4:	b968      	cbnz	r0, c0de0612 <handler_cmd_keccak_prng+0x4e>
c0de05f6:	4668      	mov	r0, sp
c0de05f8:	2140      	movs	r1, #64	@ 0x40
c0de05fa:	f7ff ffb8 	bl	c0de056e <io_send_response_pointer>
c0de05fe:	e014      	b.n	c0de062a <handler_cmd_keccak_prng+0x66>
c0de0600:	490b      	ldr	r1, [pc, #44]	@ (c0de0630 <handler_cmd_keccak_prng+0x6c>)
c0de0602:	eb09 0301 	add.w	r3, r9, r1
c0de0606:	e9d0 1200 	ldrd	r1, r2, [r0]
c0de060a:	4618      	mov	r0, r3
c0de060c:	f001 fe52 	bl	c0de22b4 <inner_keccak256_inject>
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
c0de0640:	f002 fd89 	bl	c0de3156 <pqcrystals_dilithium2_lowram_poly_challenge>
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
c0de0660:	f002 ff64 	bl	c0de352c <crypto_sign_keypair_core>
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
c0de0686:	f002 ff40 	bl	c0de350a <pqcrystals_dilithium2_lowram_keypair>
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
c0de06b4:	f00c fd22 	bl	c0ded0fc <__aeabi_memcpy>
c0de06b8:	2d80      	cmp	r5, #128	@ 0x80
c0de06ba:	d013      	beq.n	c0de06e4 <handler_cmd_sign_dilithium+0x44>
c0de06bc:	2d01      	cmp	r5, #1
c0de06be:	d01f      	beq.n	c0de0700 <handler_cmd_sign_dilithium+0x60>
c0de06c0:	bb35      	cbnz	r5, c0de0710 <handler_cmd_sign_dilithium+0x70>
c0de06c2:	f60d 2008 	addw	r0, sp, #2568	@ 0xa08
c0de06c6:	a902      	add	r1, sp, #8
c0de06c8:	f60d 7228 	addw	r2, sp, #3880	@ 0xf28
c0de06cc:	f002 ff2e 	bl	c0de352c <crypto_sign_keypair_core>
c0de06d0:	4604      	mov	r4, r0
c0de06d2:	2800      	cmp	r0, #0
c0de06d4:	d13e      	bne.n	c0de0754 <handler_cmd_sign_dilithium+0xb4>
c0de06d6:	2000      	movs	r0, #0
c0de06d8:	2100      	movs	r1, #0
c0de06da:	f002 fffd 	bl	c0de36d8 <crypto_sign_signature_init>
c0de06de:	f000 f979 	bl	c0de09d4 <OUTLINED_FUNCTION_2>
c0de06e2:	e037      	b.n	c0de0754 <handler_cmd_sign_dilithium+0xb4>
c0de06e4:	f60d 2008 	addw	r0, sp, #2568	@ 0xa08
c0de06e8:	a902      	add	r1, sp, #8
c0de06ea:	f60d 7228 	addw	r2, sp, #3880	@ 0xf28
c0de06ee:	f002 ff1d 	bl	c0de352c <crypto_sign_keypair_core>
c0de06f2:	bb80      	cbnz	r0, c0de0756 <handler_cmd_sign_dilithium+0xb6>
c0de06f4:	6860      	ldr	r0, [r4, #4]
c0de06f6:	2801      	cmp	r0, #1
c0de06f8:	d812      	bhi.n	c0de0720 <handler_cmd_sign_dilithium+0x80>
c0de06fa:	f646 2087 	movw	r0, #27271	@ 0x6a87
c0de06fe:	e02c      	b.n	c0de075a <handler_cmd_sign_dilithium+0xba>
c0de0700:	e9d4 0100 	ldrd	r0, r1, [r4]
c0de0704:	f003 f814 	bl	c0de3730 <crypto_sign_signature_absorb>
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
c0de0738:	f500 60f0 	add.w	r0, r0, #1920	@ 0x780
c0de073c:	f003 f804 	bl	c0de3748 <crypto_sign_signature_core>
c0de0740:	4604      	mov	r4, r0
c0de0742:	b938      	cbnz	r0, c0de0754 <handler_cmd_sign_dilithium+0xb4>
c0de0744:	eb09 0005 	add.w	r0, r9, r5
c0de0748:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de074c:	f500 60f0 	add.w	r0, r0, #1920	@ 0x780
c0de0750:	f7ff ff0d 	bl	c0de056e <io_send_response_pointer>
c0de0754:	b124      	cbz	r4, c0de0760 <handler_cmd_sign_dilithium+0xc0>
c0de0756:	f24b 0005 	movw	r0, #45061	@ 0xb005
c0de075a:	f7ff ff13 	bl	c0de0584 <io_send_sw>
c0de075e:	e000      	b.n	c0de0762 <handler_cmd_sign_dilithium+0xc2>
c0de0760:	2000      	movs	r0, #0
c0de0762:	f60d 7d48 	addw	sp, sp, #3912	@ 0xf48
c0de0766:	bdb0      	pop	{r4, r5, r7, pc}
c0de0768:	000002d8 	.word	0x000002d8
c0de076c:	0000e7e2 	.word	0x0000e7e2

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
c0de078e:	f003 fa7f 	bl	c0de3c90 <pqcrystals_dilithium2_lowram_open>
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
c0de07ac:	0000f169 	.word	0x0000f169
c0de07b0:	0000e7c8 	.word	0x0000e7c8

c0de07b4 <handler_cmd_get_sig_chunk>:
c0de07b4:	b580      	push	{r7, lr}
c0de07b6:	4806      	ldr	r0, [pc, #24]	@ (c0de07d0 <handler_cmd_get_sig_chunk+0x1c>)
c0de07b8:	ebc1 2101 	rsb	r1, r1, r1, lsl #8
c0de07bc:	4448      	add	r0, r9
c0de07be:	4408      	add	r0, r1
c0de07c0:	4611      	mov	r1, r2
c0de07c2:	f500 60f0 	add.w	r0, r0, #1920	@ 0x780
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
c0de07e2:	f500 7018 	add.w	r0, r0, #608	@ 0x260
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
c0de0804:	f00c fc7a 	bl	c0ded0fc <__aeabi_memcpy>
c0de0808:	a811      	add	r0, sp, #68	@ 0x44
c0de080a:	2120      	movs	r1, #32
c0de080c:	462a      	mov	r2, r5
c0de080e:	2320      	movs	r3, #32
c0de0810:	f00c f9d6 	bl	c0decbc0 <cx_bn_alloc_init>
c0de0814:	9911      	ldr	r1, [sp, #68]	@ 0x44
c0de0816:	ae12      	add	r6, sp, #72	@ 0x48
c0de0818:	4630      	mov	r0, r6
c0de081a:	f00c fa61 	bl	c0decce0 <cx_mont_init>
c0de081e:	ad14      	add	r5, sp, #80	@ 0x50
c0de0820:	2105      	movs	r1, #5
c0de0822:	2205      	movs	r2, #5
c0de0824:	4633      	mov	r3, r6
c0de0826:	4628      	mov	r0, r5
c0de0828:	f004 f8b9 	bl	c0de499e <Poseidon_alloc_init>
c0de082c:	6820      	ldr	r0, [r4, #0]
c0de082e:	466c      	mov	r4, sp
c0de0830:	7806      	ldrb	r6, [r0, #0]
c0de0832:	b12e      	cbz	r6, c0de0840 <handler_cmd_Poseidon_ithRC+0x4c>
c0de0834:	4628      	mov	r0, r5
c0de0836:	4621      	mov	r1, r4
c0de0838:	f004 f8ae 	bl	c0de4998 <Poseidon_getNext_RC>
c0de083c:	3e01      	subs	r6, #1
c0de083e:	e7f8      	b.n	c0de0832 <handler_cmd_Poseidon_ithRC+0x3e>
c0de0840:	4668      	mov	r0, sp
c0de0842:	2120      	movs	r1, #32
c0de0844:	f7ff fe93 	bl	c0de056e <io_send_response_pointer>
c0de0848:	b03e      	add	sp, #248	@ 0xf8
c0de084a:	bd70      	pop	{r4, r5, r6, pc}
c0de084c:	0000e732 	.word	0x0000e732

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
c0de0880:	f00c f982 	bl	c0decb88 <cx_bn_lock>
c0de0884:	b920      	cbnz	r0, c0de0890 <handler_cmd_tEdwards+0x40>
c0de0886:	a819      	add	r0, sp, #100	@ 0x64
c0de0888:	4631      	mov	r1, r6
c0de088a:	f003 fd57 	bl	c0de433c <tEdwards_Curve_alloc_init>
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
c0de08ae:	f00c fc25 	bl	c0ded0fc <__aeabi_memcpy>
c0de08b2:	af03      	add	r7, sp, #12
c0de08b4:	4940      	ldr	r1, [pc, #256]	@ (c0de09b8 <handler_cmd_tEdwards+0x168>)
c0de08b6:	4479      	add	r1, pc
c0de08b8:	e009      	b.n	c0de08ce <handler_cmd_tEdwards+0x7e>
c0de08ba:	ae0b      	add	r6, sp, #44	@ 0x2c
c0de08bc:	493f      	ldr	r1, [pc, #252]	@ (c0de09bc <handler_cmd_tEdwards+0x16c>)
c0de08be:	2220      	movs	r2, #32
c0de08c0:	4630      	mov	r0, r6
c0de08c2:	4479      	add	r1, pc
c0de08c4:	f00c fc1a 	bl	c0ded0fc <__aeabi_memcpy>
c0de08c8:	af03      	add	r7, sp, #12
c0de08ca:	493d      	ldr	r1, [pc, #244]	@ (c0de09c0 <handler_cmd_tEdwards+0x170>)
c0de08cc:	4479      	add	r1, pc
c0de08ce:	4638      	mov	r0, r7
c0de08d0:	2220      	movs	r2, #32
c0de08d2:	f00c fc13 	bl	c0ded0fc <__aeabi_memcpy>
c0de08d6:	a819      	add	r0, sp, #100	@ 0x64
c0de08d8:	ab16      	add	r3, sp, #88	@ 0x58
c0de08da:	4631      	mov	r1, r6
c0de08dc:	463a      	mov	r2, r7
c0de08de:	f003 fed3 	bl	c0de4688 <tEdwards_alloc_init>
c0de08e2:	2800      	cmp	r0, #0
c0de08e4:	d1d4      	bne.n	c0de0890 <handler_cmd_tEdwards+0x40>
c0de08e6:	a819      	add	r0, sp, #100	@ 0x64
c0de08e8:	a90b      	add	r1, sp, #44	@ 0x2c
c0de08ea:	aa03      	add	r2, sp, #12
c0de08ec:	ab13      	add	r3, sp, #76	@ 0x4c
c0de08ee:	f003 fecb 	bl	c0de4688 <tEdwards_alloc_init>
c0de08f2:	2800      	cmp	r0, #0
c0de08f4:	d1cc      	bne.n	c0de0890 <handler_cmd_tEdwards+0x40>
c0de08f6:	2000      	movs	r0, #0
c0de08f8:	f10d 020b 	add.w	r2, sp, #11
c0de08fc:	f88d 000b 	strb.w	r0, [sp, #11]
c0de0900:	a819      	add	r0, sp, #100	@ 0x64
c0de0902:	a916      	add	r1, sp, #88	@ 0x58
c0de0904:	f003 fcc4 	bl	c0de4290 <tEdwards_IsOnCurve>
c0de0908:	2800      	cmp	r0, #0
c0de090a:	d1c1      	bne.n	c0de0890 <handler_cmd_tEdwards+0x40>
c0de090c:	f89d 000b 	ldrb.w	r0, [sp, #11]
c0de0910:	2801      	cmp	r0, #1
c0de0912:	d143      	bne.n	c0de099c <handler_cmd_tEdwards+0x14c>
c0de0914:	a819      	add	r0, sp, #100	@ 0x64
c0de0916:	ae13      	add	r6, sp, #76	@ 0x4c
c0de0918:	f10d 020b 	add.w	r2, sp, #11
c0de091c:	4631      	mov	r1, r6
c0de091e:	f003 fcb7 	bl	c0de4290 <tEdwards_IsOnCurve>
c0de0922:	2800      	cmp	r0, #0
c0de0924:	d1b4      	bne.n	c0de0890 <handler_cmd_tEdwards+0x40>
c0de0926:	f89d 000b 	ldrb.w	r0, [sp, #11]
c0de092a:	2801      	cmp	r0, #1
c0de092c:	d139      	bne.n	c0de09a2 <handler_cmd_tEdwards+0x152>
c0de092e:	981a      	ldr	r0, [sp, #104]	@ 0x68
c0de0930:	f10d 010b 	add.w	r1, sp, #11
c0de0934:	f00c f9c0 	bl	c0deccb8 <cx_bn_is_prime>
c0de0938:	2800      	cmp	r0, #0
c0de093a:	d1a9      	bne.n	c0de0890 <handler_cmd_tEdwards+0x40>
c0de093c:	f89d 000b 	ldrb.w	r0, [sp, #11]
c0de0940:	2801      	cmp	r0, #1
c0de0942:	d131      	bne.n	c0de09a8 <handler_cmd_tEdwards+0x158>
c0de0944:	981b      	ldr	r0, [sp, #108]	@ 0x6c
c0de0946:	f10d 010b 	add.w	r1, sp, #11
c0de094a:	f00c f9b5 	bl	c0deccb8 <cx_bn_is_prime>
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
c0de0968:	f003 ff12 	bl	c0de4790 <tEdwards_scalarMul>
c0de096c:	2800      	cmp	r0, #0
c0de096e:	d18f      	bne.n	c0de0890 <handler_cmd_tEdwards+0x40>
c0de0970:	a819      	add	r0, sp, #100	@ 0x64
c0de0972:	f104 0320 	add.w	r3, r4, #32
c0de0976:	a913      	add	r1, sp, #76	@ 0x4c
c0de0978:	4622      	mov	r2, r4
c0de097a:	f003 fe1f 	bl	c0de45bc <tEdwards_export>
c0de097e:	2800      	cmp	r0, #0
c0de0980:	f47f af86 	bne.w	c0de0890 <handler_cmd_tEdwards+0x40>
c0de0984:	f00c f90a 	bl	c0decb9c <cx_bn_unlock>
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
c0de09b4:	0000e548 	.word	0x0000e548
c0de09b8:	0000e5be 	.word	0x0000e5be
c0de09bc:	0000e552 	.word	0x0000e552
c0de09c0:	0000e508 	.word	0x0000e508

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
c0de09f8:	f00c fb80 	bl	c0ded0fc <__aeabi_memcpy>
c0de09fc:	2020      	movs	r0, #32
c0de09fe:	f105 0149 	add.w	r1, r5, #73	@ 0x49
c0de0a02:	2220      	movs	r2, #32
c0de0a04:	f88d 0047 	strb.w	r0, [sp, #71]	@ 0x47
c0de0a08:	f104 0043 	add.w	r0, r4, #67	@ 0x43
c0de0a0c:	f00c fb76 	bl	c0ded0fc <__aeabi_memcpy>
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
c0de0a30:	f00b fc54 	bl	c0dec2dc <io_send_response_buffers>
c0de0a34:	b004      	add	sp, #16
c0de0a36:	bd80      	pop	{r7, pc}

c0de0a38 <helper_send_response_sig>:
c0de0a38:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de0a3a:	b093      	sub	sp, #76	@ 0x4c
c0de0a3c:	f10d 0402 	add.w	r4, sp, #2
c0de0a40:	2149      	movs	r1, #73	@ 0x49
c0de0a42:	1c65      	adds	r5, r4, #1
c0de0a44:	4628      	mov	r0, r5
c0de0a46:	f00c fb63 	bl	c0ded110 <__aeabi_memclr>
c0de0a4a:	480b      	ldr	r0, [pc, #44]	@ (c0de0a78 <helper_send_response_sig+0x40>)
c0de0a4c:	eb09 0700 	add.w	r7, r9, r0
c0de0a50:	4628      	mov	r0, r5
c0de0a52:	f897 62a0 	ldrb.w	r6, [r7, #672]	@ 0x2a0
c0de0a56:	f507 7116 	add.w	r1, r7, #600	@ 0x258
c0de0a5a:	4632      	mov	r2, r6
c0de0a5c:	f88d 6002 	strb.w	r6, [sp, #2]
c0de0a60:	f00c fb4c 	bl	c0ded0fc <__aeabi_memcpy>
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
c0de0a86:	f00b fe1b 	bl	c0dec6c0 <assert_exit>
c0de0a8a:	b915      	cbnz	r5, c0de0a92 <transaction_deserialize+0x16>
c0de0a8c:	2001      	movs	r0, #1
c0de0a8e:	f00b fe17 	bl	c0dec6c0 <assert_exit>
c0de0a92:	6860      	ldr	r0, [r4, #4]
c0de0a94:	f5b0 7fff 	cmp.w	r0, #510	@ 0x1fe
c0de0a98:	d901      	bls.n	c0de0a9e <transaction_deserialize+0x22>
c0de0a9a:	20f9      	movs	r0, #249	@ 0xf9
c0de0a9c:	e04b      	b.n	c0de0b36 <transaction_deserialize+0xba>
c0de0a9e:	4620      	mov	r0, r4
c0de0aa0:	4629      	mov	r1, r5
c0de0aa2:	2200      	movs	r2, #0
c0de0aa4:	f00b f9dc 	bl	c0debe60 <buffer_read_u64>
c0de0aa8:	b330      	cbz	r0, c0de0af8 <transaction_deserialize+0x7c>
c0de0aaa:	6820      	ldr	r0, [r4, #0]
c0de0aac:	68a1      	ldr	r1, [r4, #8]
c0de0aae:	4408      	add	r0, r1
c0de0ab0:	2114      	movs	r1, #20
c0de0ab2:	61a8      	str	r0, [r5, #24]
c0de0ab4:	4620      	mov	r0, r4
c0de0ab6:	f00b f9b2 	bl	c0debe1e <buffer_seek_cur>
c0de0aba:	b1f8      	cbz	r0, c0de0afc <transaction_deserialize+0x80>
c0de0abc:	f105 0108 	add.w	r1, r5, #8
c0de0ac0:	4620      	mov	r0, r4
c0de0ac2:	2200      	movs	r2, #0
c0de0ac4:	2600      	movs	r6, #0
c0de0ac6:	f00b f9cb 	bl	c0debe60 <buffer_read_u64>
c0de0aca:	b1c8      	cbz	r0, c0de0b00 <transaction_deserialize+0x84>
c0de0acc:	f105 0120 	add.w	r1, r5, #32
c0de0ad0:	4620      	mov	r0, r4
c0de0ad2:	e9c5 6604 	strd	r6, r6, [r5, #16]
c0de0ad6:	f00b f9e3 	bl	c0debea0 <buffer_read_varint>
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
c0de0b0e:	f00b f986 	bl	c0debe1e <buffer_seek_cur>
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
c0de0b46:	f00b fdbb 	bl	c0dec6c0 <assert_exit>
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
c0de0b8a:	f00b fba7 	bl	c0dec2dc <io_send_response_buffers>
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
c0de0be4:	f00b fa6e 	bl	c0dec0c4 <bip32_derive_with_seed_ecdsa_sign_hash_256>
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
c0de0c36:	f00c f8f7 	bl	c0dece28 <os_sched_exit>
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
c0de0ca0:	f009 fa08 	bl	c0dea0b4 <nbgl_useCaseHomeAndSettings>
c0de0ca4:	bd7f      	pop	{r0, r1, r2, r3, r4, r5, r6, pc}
c0de0ca6:	bf00      	nop
c0de0ca8:	000013d0 	.word	0x000013d0
c0de0cac:	0000f9ba 	.word	0x0000f9ba
c0de0cb0:	0000da05 	.word	0x0000da05
c0de0cb4:	0000df7c 	.word	0x0000df7c
c0de0cb8:	0000db7c 	.word	0x0000db7c
c0de0cbc:	0000d7ad 	.word	0x0000d7ad
c0de0cc0:	ffffffab 	.word	0xffffffab
c0de0cc4:	0000f190 	.word	0x0000f190
c0de0cc8:	0000f182 	.word	0x0000f182
c0de0ccc:	0000dd72 	.word	0x0000dd72
c0de0cd0:	0000c637 	.word	0x0000c637

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
c0de0d08:	f00b fefa 	bl	c0decb00 <pic>
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
c0de0d36:	f00b ff1d 	bl	c0decb74 <nvm_write>
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
c0de0d58:	f009 fc8e 	bl	c0dea678 <nbgl_useCaseChoice>
c0de0d5c:	bdbf      	pop	{r0, r1, r2, r3, r4, r5, r7, pc}
c0de0d5e:	bf00      	nop
c0de0d60:	000013d0 	.word	0x000013d0
c0de0d64:	0000f912 	.word	0x0000f912
c0de0d68:	0000f8f6 	.word	0x0000f8f6
c0de0d6c:	0000f8e6 	.word	0x0000f8e6
c0de0d70:	00000045 	.word	0x00000045
c0de0d74:	0000db0b 	.word	0x0000db0b
c0de0d78:	0000cd89 	.word	0x0000cd89
c0de0d7c:	0000d6cf 	.word	0x0000d6cf
c0de0d80:	0000d87a 	.word	0x0000d87a
c0de0d84:	0000de88 	.word	0x0000de88

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
c0de0db6:	f00b fedd 	bl	c0decb74 <nvm_write>
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
c0de0de0:	f009 f968 	bl	c0dea0b4 <nbgl_useCaseHomeAndSettings>
c0de0de4:	b006      	add	sp, #24
c0de0de6:	bdb0      	pop	{r4, r5, r7, pc}
c0de0de8:	000013d0 	.word	0x000013d0
c0de0dec:	0000f86a 	.word	0x0000f86a
c0de0df0:	fffffe69 	.word	0xfffffe69
c0de0df4:	0000f04e 	.word	0x0000f04e
c0de0df8:	0000f040 	.word	0x0000f040
c0de0dfc:	0000dc32 	.word	0x0000dc32
c0de0e00:	0000c4f7 	.word	0x0000c4f7

c0de0e04 <OUTLINED_FUNCTION_0>:
c0de0e04:	4620      	mov	r0, r4
c0de0e06:	f00b be7b 	b.w	c0decb00 <pic>
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
c0de0e2a:	f00c f971 	bl	c0ded110 <__aeabi_memclr>
c0de0e2e:	ac03      	add	r4, sp, #12
c0de0e30:	2114      	movs	r1, #20
c0de0e32:	4620      	mov	r0, r4
c0de0e34:	f00c f96c 	bl	c0ded110 <__aeabi_memclr>
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
c0de0e52:	f00b f9e1 	bl	c0dec218 <format_hex>
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
c0de0e72:	f00a f87b 	bl	c0deaf6c <nbgl_useCaseAddressReview>
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
c0de0ea0:	000013ec 	.word	0x000013ec
c0de0ea4:	0000005d 	.word	0x0000005d
c0de0ea8:	0000c467 	.word	0x0000c467
c0de0eac:	0000de68 	.word	0x0000de68

c0de0eb0 <io_send_sw>:
c0de0eb0:	b580      	push	{r7, lr}
c0de0eb2:	4602      	mov	r2, r0
c0de0eb4:	2000      	movs	r0, #0
c0de0eb6:	2100      	movs	r1, #0
c0de0eb8:	f00b fa10 	bl	c0dec2dc <io_send_response_buffers>
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
c0de0ed8:	f009 bb84 	b.w	c0dea5e4 <nbgl_useCaseReviewStatus>
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
c0de0f06:	f00c f903 	bl	c0ded110 <__aeabi_memclr>
c0de0f0a:	ad05      	add	r5, sp, #20
c0de0f0c:	211e      	movs	r1, #30
c0de0f0e:	4628      	mov	r0, r5
c0de0f10:	f00c f8fe 	bl	c0ded110 <__aeabi_memclr>
c0de0f14:	eb09 0007 	add.w	r0, r9, r7
c0de0f18:	211e      	movs	r1, #30
c0de0f1a:	e9d0 2386 	ldrd	r2, r3, [r0, #536]	@ 0x218
c0de0f1e:	2003      	movs	r0, #3
c0de0f20:	9000      	str	r0, [sp, #0]
c0de0f22:	4628      	mov	r0, r5
c0de0f24:	f00b f931 	bl	c0dec18a <format_fpu64>
c0de0f28:	2800      	cmp	r0, #0
c0de0f2a:	d04d      	beq.n	c0de0fc8 <ui_display_transaction_bs_choice+0xe8>
c0de0f2c:	9500      	str	r5, [sp, #0]
c0de0f2e:	eb09 0506 	add.w	r5, r9, r6
c0de0f32:	211e      	movs	r1, #30
c0de0f34:	231e      	movs	r3, #30
c0de0f36:	4a32      	ldr	r2, [pc, #200]	@ (c0de1000 <ui_display_transaction_bs_choice+0x120>)
c0de0f38:	f105 0014 	add.w	r0, r5, #20
c0de0f3c:	447a      	add	r2, pc
c0de0f3e:	f00b fc4d 	bl	c0dec7dc <snprintf>
c0de0f42:	3554      	adds	r5, #84	@ 0x54
c0de0f44:	212b      	movs	r1, #43	@ 0x2b
c0de0f46:	4628      	mov	r0, r5
c0de0f48:	f00c f8e2 	bl	c0ded110 <__aeabi_memclr>
c0de0f4c:	eb09 0007 	add.w	r0, r9, r7
c0de0f50:	2114      	movs	r1, #20
c0de0f52:	462a      	mov	r2, r5
c0de0f54:	232b      	movs	r3, #43	@ 0x2b
c0de0f56:	f8d0 0228 	ldr.w	r0, [r0, #552]	@ 0x228
c0de0f5a:	f00b f95d 	bl	c0dec218 <format_hex>
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
c0de0fae:	f009 fd3d 	bl	c0deaa2c <nbgl_useCaseReviewBlindSigning>
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
c0de0ff2:	f009 fc6d 	bl	c0dea8d0 <nbgl_useCaseReview>
c0de0ff6:	e7ef      	b.n	c0de0fd8 <ui_display_transaction_bs_choice+0xf8>
c0de0ff8:	00000000 	.word	0x00000000
c0de0ffc:	00001418 	.word	0x00001418
c0de1000:	0000db52 	.word	0x0000db52
c0de1004:	0000d5d8 	.word	0x0000d5d8
c0de1008:	0000db15 	.word	0x0000db15
c0de100c:	0000009f 	.word	0x0000009f
c0de1010:	0000d6e7 	.word	0x0000d6e7
c0de1014:	0000c32b 	.word	0x0000c32b
c0de1018:	0000d47d 	.word	0x0000d47d
c0de101c:	0000c2e7 	.word	0x0000c2e7
c0de1020:	0000d439 	.word	0x0000d439

c0de1024 <io_send_sw>:
c0de1024:	b580      	push	{r7, lr}
c0de1026:	4602      	mov	r2, r0
c0de1028:	2000      	movs	r0, #0
c0de102a:	2100      	movs	r1, #0
c0de102c:	f00b f956 	bl	c0dec2dc <io_send_response_buffers>
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
c0de1048:	f009 bacc 	b.w	c0dea5e4 <nbgl_useCaseReviewStatus>
c0de104c:	fffffbf7 	.word	0xfffffbf7

c0de1050 <ui_display_blind_signed_transaction>:
c0de1050:	2001      	movs	r0, #1
c0de1052:	f7ff bf45 	b.w	c0de0ee0 <ui_display_transaction_bs_choice>

c0de1056 <ui_display_transaction>:
c0de1056:	2000      	movs	r0, #0
c0de1058:	f7ff bf42 	b.w	c0de0ee0 <ui_display_transaction_bs_choice>

c0de105c <pqcrystals_dilithium_fips202_ref_shake128_init>:
c0de105c:	b510      	push	{r4, lr}
c0de105e:	4604      	mov	r4, r0
c0de1060:	f000 f804 	bl	c0de106c <keccak_init>
c0de1064:	2000      	movs	r0, #0
c0de1066:	f8c4 00c8 	str.w	r0, [r4, #200]	@ 0xc8
c0de106a:	bd10      	pop	{r4, pc}

c0de106c <keccak_init>:
c0de106c:	2100      	movs	r1, #0
c0de106e:	2200      	movs	r2, #0
c0de1070:	2ac8      	cmp	r2, #200	@ 0xc8
c0de1072:	bf08      	it	eq
c0de1074:	4770      	bxeq	lr
c0de1076:	1883      	adds	r3, r0, r2
c0de1078:	5081      	str	r1, [r0, r2]
c0de107a:	3208      	adds	r2, #8
c0de107c:	6059      	str	r1, [r3, #4]
c0de107e:	e7f7      	b.n	c0de1070 <keccak_init+0x4>

c0de1080 <pqcrystals_dilithium_fips202_ref_shake128_absorb>:
c0de1080:	b51c      	push	{r2, r3, r4, lr}
c0de1082:	460b      	mov	r3, r1
c0de1084:	f8d0 10c8 	ldr.w	r1, [r0, #200]	@ 0xc8
c0de1088:	9200      	str	r2, [sp, #0]
c0de108a:	22a8      	movs	r2, #168	@ 0xa8
c0de108c:	4604      	mov	r4, r0
c0de108e:	f000 f802 	bl	c0de1096 <keccak_absorb>
c0de1092:	f001 b8f3 	b.w	c0de227c <OUTLINED_FUNCTION_3>

c0de1096 <keccak_absorb>:
c0de1096:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de109a:	f8dd 8020 	ldr.w	r8, [sp, #32]
c0de109e:	461c      	mov	r4, r3
c0de10a0:	4693      	mov	fp, r2
c0de10a2:	468a      	mov	sl, r1
c0de10a4:	4606      	mov	r6, r0
c0de10a6:	eb08 050a 	add.w	r5, r8, sl
c0de10aa:	455d      	cmp	r5, fp
c0de10ac:	d31b      	bcc.n	c0de10e6 <keccak_absorb+0x50>
c0de10ae:	ea4f 05ca 	mov.w	r5, sl, lsl #3
c0de10b2:	4657      	mov	r7, sl
c0de10b4:	455f      	cmp	r7, fp
c0de10b6:	d20d      	bcs.n	c0de10d4 <keccak_absorb+0x3e>
c0de10b8:	f814 0b01 	ldrb.w	r0, [r4], #1
c0de10bc:	f005 0238 	and.w	r2, r5, #56	@ 0x38
c0de10c0:	2100      	movs	r1, #0
c0de10c2:	f00b ff13 	bl	c0deceec <__aeabi_llsl>
c0de10c6:	f027 0207 	bic.w	r2, r7, #7
c0de10ca:	3508      	adds	r5, #8
c0de10cc:	3701      	adds	r7, #1
c0de10ce:	f001 f8c5 	bl	c0de225c <OUTLINED_FUNCTION_0>
c0de10d2:	e7ef      	b.n	c0de10b4 <keccak_absorb+0x1e>
c0de10d4:	4630      	mov	r0, r6
c0de10d6:	f000 f963 	bl	c0de13a0 <KeccakF1600_StatePermute>
c0de10da:	ebaa 000b 	sub.w	r0, sl, fp
c0de10de:	f04f 0a00 	mov.w	sl, #0
c0de10e2:	4480      	add	r8, r0
c0de10e4:	e7df      	b.n	c0de10a6 <keccak_absorb+0x10>
c0de10e6:	ea4f 07ca 	mov.w	r7, sl, lsl #3
c0de10ea:	45aa      	cmp	sl, r5
c0de10ec:	d20e      	bcs.n	c0de110c <keccak_absorb+0x76>
c0de10ee:	f814 0b01 	ldrb.w	r0, [r4], #1
c0de10f2:	f007 0238 	and.w	r2, r7, #56	@ 0x38
c0de10f6:	2100      	movs	r1, #0
c0de10f8:	f00b fef8 	bl	c0deceec <__aeabi_llsl>
c0de10fc:	f02a 0207 	bic.w	r2, sl, #7
c0de1100:	3708      	adds	r7, #8
c0de1102:	f10a 0a01 	add.w	sl, sl, #1
c0de1106:	f001 f8a9 	bl	c0de225c <OUTLINED_FUNCTION_0>
c0de110a:	e7ee      	b.n	c0de10ea <keccak_absorb+0x54>
c0de110c:	4650      	mov	r0, sl
c0de110e:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de1112 <pqcrystals_dilithium_fips202_ref_shake128_finalize>:
c0de1112:	b5b0      	push	{r4, r5, r7, lr}
c0de1114:	f8d0 10c8 	ldr.w	r1, [r0, #200]	@ 0xc8
c0de1118:	22a8      	movs	r2, #168	@ 0xa8
c0de111a:	4604      	mov	r4, r0
c0de111c:	25a8      	movs	r5, #168	@ 0xa8
c0de111e:	f000 f803 	bl	c0de1128 <keccak_finalize>
c0de1122:	f8c4 50c8 	str.w	r5, [r4, #200]	@ 0xc8
c0de1126:	bdb0      	pop	{r4, r5, r7, pc}

c0de1128 <keccak_finalize>:
c0de1128:	b570      	push	{r4, r5, r6, lr}
c0de112a:	4606      	mov	r6, r0
c0de112c:	2038      	movs	r0, #56	@ 0x38
c0de112e:	4614      	mov	r4, r2
c0de1130:	460d      	mov	r5, r1
c0de1132:	ea00 02c1 	and.w	r2, r0, r1, lsl #3
c0de1136:	201f      	movs	r0, #31
c0de1138:	2100      	movs	r1, #0
c0de113a:	f00b fed7 	bl	c0deceec <__aeabi_llsl>
c0de113e:	f025 0207 	bic.w	r2, r5, #7
c0de1142:	f001 f88b 	bl	c0de225c <OUTLINED_FUNCTION_0>
c0de1146:	f024 0007 	bic.w	r0, r4, #7
c0de114a:	4430      	add	r0, r6
c0de114c:	f850 1c04 	ldr.w	r1, [r0, #-4]
c0de1150:	f081 4100 	eor.w	r1, r1, #2147483648	@ 0x80000000
c0de1154:	f840 1c04 	str.w	r1, [r0, #-4]
c0de1158:	bd70      	pop	{r4, r5, r6, pc}

c0de115a <pqcrystals_dilithium_fips202_ref_shake128_squeeze>:
c0de115a:	b51c      	push	{r2, r3, r4, lr}
c0de115c:	4614      	mov	r4, r2
c0de115e:	f8d2 30c8 	ldr.w	r3, [r2, #200]	@ 0xc8
c0de1162:	22a8      	movs	r2, #168	@ 0xa8
c0de1164:	9200      	str	r2, [sp, #0]
c0de1166:	4622      	mov	r2, r4
c0de1168:	f000 f802 	bl	c0de1170 <keccak_squeeze>
c0de116c:	f001 b886 	b.w	c0de227c <OUTLINED_FUNCTION_3>

c0de1170 <keccak_squeeze>:
c0de1170:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de1174:	f8dd 8020 	ldr.w	r8, [sp, #32]
c0de1178:	461f      	mov	r7, r3
c0de117a:	4693      	mov	fp, r2
c0de117c:	460d      	mov	r5, r1
c0de117e:	4606      	mov	r6, r0
c0de1180:	b1e5      	cbz	r5, c0de11bc <keccak_squeeze+0x4c>
c0de1182:	4547      	cmp	r7, r8
c0de1184:	d103      	bne.n	c0de118e <keccak_squeeze+0x1e>
c0de1186:	4658      	mov	r0, fp
c0de1188:	f000 f90a 	bl	c0de13a0 <KeccakF1600_StatePermute>
c0de118c:	2700      	movs	r7, #0
c0de118e:	eb07 0a05 	add.w	sl, r7, r5
c0de1192:	00fc      	lsls	r4, r7, #3
c0de1194:	4547      	cmp	r7, r8
c0de1196:	d2f3      	bcs.n	c0de1180 <keccak_squeeze+0x10>
c0de1198:	45ba      	cmp	sl, r7
c0de119a:	d9f1      	bls.n	c0de1180 <keccak_squeeze+0x10>
c0de119c:	f027 0107 	bic.w	r1, r7, #7
c0de11a0:	f004 0238 	and.w	r2, r4, #56	@ 0x38
c0de11a4:	f85b 0001 	ldr.w	r0, [fp, r1]
c0de11a8:	4459      	add	r1, fp
c0de11aa:	6849      	ldr	r1, [r1, #4]
c0de11ac:	f00b feb0 	bl	c0decf10 <__aeabi_llsr>
c0de11b0:	f806 0b01 	strb.w	r0, [r6], #1
c0de11b4:	3408      	adds	r4, #8
c0de11b6:	3d01      	subs	r5, #1
c0de11b8:	3701      	adds	r7, #1
c0de11ba:	e7eb      	b.n	c0de1194 <keccak_squeeze+0x24>
c0de11bc:	4638      	mov	r0, r7
c0de11be:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de11c2 <keccak_absorb_once>:
c0de11c2:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de11c6:	4688      	mov	r8, r1
c0de11c8:	4604      	mov	r4, r0
c0de11ca:	461f      	mov	r7, r3
c0de11cc:	2000      	movs	r0, #0
c0de11ce:	2100      	movs	r1, #0
c0de11d0:	9202      	str	r2, [sp, #8]
c0de11d2:	29c8      	cmp	r1, #200	@ 0xc8
c0de11d4:	d004      	beq.n	c0de11e0 <keccak_absorb_once+0x1e>
c0de11d6:	1862      	adds	r2, r4, r1
c0de11d8:	5060      	str	r0, [r4, r1]
c0de11da:	3108      	adds	r1, #8
c0de11dc:	6050      	str	r0, [r2, #4]
c0de11de:	e7f8      	b.n	c0de11d2 <keccak_absorb_once+0x10>
c0de11e0:	ea4f 00d8 	mov.w	r0, r8, lsr #3
c0de11e4:	f8cd 8000 	str.w	r8, [sp]
c0de11e8:	9003      	str	r0, [sp, #12]
c0de11ea:	4547      	cmp	r7, r8
c0de11ec:	d335      	bcc.n	c0de125a <keccak_absorb_once+0x98>
c0de11ee:	9e02      	ldr	r6, [sp, #8]
c0de11f0:	f04f 0800 	mov.w	r8, #0
c0de11f4:	9701      	str	r7, [sp, #4]
c0de11f6:	9803      	ldr	r0, [sp, #12]
c0de11f8:	4580      	cmp	r8, r0
c0de11fa:	d023      	beq.n	c0de1244 <keccak_absorb_once+0x82>
c0de11fc:	2500      	movs	r5, #0
c0de11fe:	4637      	mov	r7, r6
c0de1200:	f04f 0a00 	mov.w	sl, #0
c0de1204:	f04f 0b00 	mov.w	fp, #0
c0de1208:	2d40      	cmp	r5, #64	@ 0x40
c0de120a:	d00b      	beq.n	c0de1224 <keccak_absorb_once+0x62>
c0de120c:	f817 0b01 	ldrb.w	r0, [r7], #1
c0de1210:	2100      	movs	r1, #0
c0de1212:	462a      	mov	r2, r5
c0de1214:	f00b fe6a 	bl	c0deceec <__aeabi_llsl>
c0de1218:	ea4b 0b01 	orr.w	fp, fp, r1
c0de121c:	ea4a 0a00 	orr.w	sl, sl, r0
c0de1220:	3508      	adds	r5, #8
c0de1222:	e7f1      	b.n	c0de1208 <keccak_absorb_once+0x46>
c0de1224:	f854 0038 	ldr.w	r0, [r4, r8, lsl #3]
c0de1228:	3608      	adds	r6, #8
c0de122a:	ea80 000a 	eor.w	r0, r0, sl
c0de122e:	f844 0038 	str.w	r0, [r4, r8, lsl #3]
c0de1232:	eb04 00c8 	add.w	r0, r4, r8, lsl #3
c0de1236:	f108 0801 	add.w	r8, r8, #1
c0de123a:	6841      	ldr	r1, [r0, #4]
c0de123c:	ea81 010b 	eor.w	r1, r1, fp
c0de1240:	6041      	str	r1, [r0, #4]
c0de1242:	e7d8      	b.n	c0de11f6 <keccak_absorb_once+0x34>
c0de1244:	4620      	mov	r0, r4
c0de1246:	f000 f8ab 	bl	c0de13a0 <KeccakF1600_StatePermute>
c0de124a:	e9dd 8700 	ldrd	r8, r7, [sp]
c0de124e:	9802      	ldr	r0, [sp, #8]
c0de1250:	4440      	add	r0, r8
c0de1252:	eba7 0708 	sub.w	r7, r7, r8
c0de1256:	9002      	str	r0, [sp, #8]
c0de1258:	e7c7      	b.n	c0de11ea <keccak_absorb_once+0x28>
c0de125a:	2500      	movs	r5, #0
c0de125c:	2600      	movs	r6, #0
c0de125e:	42b7      	cmp	r7, r6
c0de1260:	d00d      	beq.n	c0de127e <keccak_absorb_once+0xbc>
c0de1262:	9802      	ldr	r0, [sp, #8]
c0de1264:	f005 0238 	and.w	r2, r5, #56	@ 0x38
c0de1268:	2100      	movs	r1, #0
c0de126a:	5d80      	ldrb	r0, [r0, r6]
c0de126c:	f00b fe3e 	bl	c0deceec <__aeabi_llsl>
c0de1270:	f026 0207 	bic.w	r2, r6, #7
c0de1274:	3508      	adds	r5, #8
c0de1276:	3601      	adds	r6, #1
c0de1278:	f000 fff8 	bl	c0de226c <OUTLINED_FUNCTION_2>
c0de127c:	e7ef      	b.n	c0de125e <keccak_absorb_once+0x9c>
c0de127e:	2038      	movs	r0, #56	@ 0x38
c0de1280:	2100      	movs	r1, #0
c0de1282:	ea00 02c7 	and.w	r2, r0, r7, lsl #3
c0de1286:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0de1288:	f00b fe30 	bl	c0deceec <__aeabi_llsl>
c0de128c:	f027 0207 	bic.w	r2, r7, #7
c0de1290:	f000 ffec 	bl	c0de226c <OUTLINED_FUNCTION_2>
c0de1294:	f1a8 0001 	sub.w	r0, r8, #1
c0de1298:	f020 0007 	bic.w	r0, r0, #7
c0de129c:	4420      	add	r0, r4
c0de129e:	6841      	ldr	r1, [r0, #4]
c0de12a0:	f081 4100 	eor.w	r1, r1, #2147483648	@ 0x80000000
c0de12a4:	6041      	str	r1, [r0, #4]
c0de12a6:	e8bd 8dff 	ldmia.w	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}

c0de12aa <pqcrystals_dilithium_fips202_ref_shake128_squeezeblocks>:
c0de12aa:	23a8      	movs	r3, #168	@ 0xa8
c0de12ac:	f000 b800 	b.w	c0de12b0 <keccak_squeezeblocks>

c0de12b0 <keccak_squeezeblocks>:
c0de12b0:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de12b4:	4698      	mov	r8, r3
c0de12b6:	4615      	mov	r5, r2
c0de12b8:	468b      	mov	fp, r1
c0de12ba:	4607      	mov	r7, r0
c0de12bc:	ea4f 0ad3 	mov.w	sl, r3, lsr #3
c0de12c0:	f1bb 0f00 	cmp.w	fp, #0
c0de12c4:	bf08      	it	eq
c0de12c6:	e8bd 8df0 	ldmiaeq.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de12ca:	4628      	mov	r0, r5
c0de12cc:	f000 f868 	bl	c0de13a0 <KeccakF1600_StatePermute>
c0de12d0:	2400      	movs	r4, #0
c0de12d2:	4656      	mov	r6, sl
c0de12d4:	b146      	cbz	r6, c0de12e8 <keccak_squeezeblocks+0x38>
c0de12d6:	1929      	adds	r1, r5, r4
c0de12d8:	592a      	ldr	r2, [r5, r4]
c0de12da:	1938      	adds	r0, r7, r4
c0de12dc:	684b      	ldr	r3, [r1, #4]
c0de12de:	f000 ffac 	bl	c0de223a <store64>
c0de12e2:	3408      	adds	r4, #8
c0de12e4:	3e01      	subs	r6, #1
c0de12e6:	e7f5      	b.n	c0de12d4 <keccak_squeezeblocks+0x24>
c0de12e8:	4447      	add	r7, r8
c0de12ea:	f1ab 0b01 	sub.w	fp, fp, #1
c0de12ee:	e7e7      	b.n	c0de12c0 <keccak_squeezeblocks+0x10>

c0de12f0 <pqcrystals_dilithium_fips202_ref_shake256_init>:
c0de12f0:	b510      	push	{r4, lr}
c0de12f2:	4604      	mov	r4, r0
c0de12f4:	f7ff feba 	bl	c0de106c <keccak_init>
c0de12f8:	2000      	movs	r0, #0
c0de12fa:	f8c4 00c8 	str.w	r0, [r4, #200]	@ 0xc8
c0de12fe:	bd10      	pop	{r4, pc}

c0de1300 <pqcrystals_dilithium_fips202_ref_shake256_absorb>:
c0de1300:	b51c      	push	{r2, r3, r4, lr}
c0de1302:	460b      	mov	r3, r1
c0de1304:	f8d0 10c8 	ldr.w	r1, [r0, #200]	@ 0xc8
c0de1308:	9200      	str	r2, [sp, #0]
c0de130a:	2288      	movs	r2, #136	@ 0x88
c0de130c:	4604      	mov	r4, r0
c0de130e:	f7ff fec2 	bl	c0de1096 <keccak_absorb>
c0de1312:	f000 bfb3 	b.w	c0de227c <OUTLINED_FUNCTION_3>

c0de1316 <pqcrystals_dilithium_fips202_ref_shake256_finalize>:
c0de1316:	b5b0      	push	{r4, r5, r7, lr}
c0de1318:	f8d0 10c8 	ldr.w	r1, [r0, #200]	@ 0xc8
c0de131c:	2288      	movs	r2, #136	@ 0x88
c0de131e:	4604      	mov	r4, r0
c0de1320:	2588      	movs	r5, #136	@ 0x88
c0de1322:	f7ff ff01 	bl	c0de1128 <keccak_finalize>
c0de1326:	f8c4 50c8 	str.w	r5, [r4, #200]	@ 0xc8
c0de132a:	bdb0      	pop	{r4, r5, r7, pc}

c0de132c <pqcrystals_dilithium_fips202_ref_shake256_squeeze>:
c0de132c:	b51c      	push	{r2, r3, r4, lr}
c0de132e:	4614      	mov	r4, r2
c0de1330:	f8d2 30c8 	ldr.w	r3, [r2, #200]	@ 0xc8
c0de1334:	2288      	movs	r2, #136	@ 0x88
c0de1336:	9200      	str	r2, [sp, #0]
c0de1338:	4622      	mov	r2, r4
c0de133a:	f7ff ff19 	bl	c0de1170 <keccak_squeeze>
c0de133e:	f000 bf9d 	b.w	c0de227c <OUTLINED_FUNCTION_3>

c0de1342 <pqcrystals_dilithium_fips202_ref_shake256_absorb_once>:
c0de1342:	b5bc      	push	{r2, r3, r4, r5, r7, lr}
c0de1344:	4604      	mov	r4, r0
c0de1346:	201f      	movs	r0, #31
c0de1348:	4613      	mov	r3, r2
c0de134a:	460a      	mov	r2, r1
c0de134c:	2188      	movs	r1, #136	@ 0x88
c0de134e:	2588      	movs	r5, #136	@ 0x88
c0de1350:	9000      	str	r0, [sp, #0]
c0de1352:	4620      	mov	r0, r4
c0de1354:	f7ff ff35 	bl	c0de11c2 <keccak_absorb_once>
c0de1358:	f8c4 50c8 	str.w	r5, [r4, #200]	@ 0xc8
c0de135c:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}

c0de135e <pqcrystals_dilithium_fips202_ref_shake256_squeezeblocks>:
c0de135e:	2388      	movs	r3, #136	@ 0x88
c0de1360:	f7ff bfa6 	b.w	c0de12b0 <keccak_squeezeblocks>

c0de1364 <pqcrystals_dilithium_fips202_ref_shake256>:
c0de1364:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de1366:	b0b5      	sub	sp, #212	@ 0xd4
c0de1368:	466e      	mov	r6, sp
c0de136a:	460c      	mov	r4, r1
c0de136c:	4605      	mov	r5, r0
c0de136e:	4611      	mov	r1, r2
c0de1370:	461a      	mov	r2, r3
c0de1372:	4630      	mov	r0, r6
c0de1374:	f7ff ffe5 	bl	c0de1342 <pqcrystals_dilithium_fips202_ref_shake256_absorb_once>
c0de1378:	2088      	movs	r0, #136	@ 0x88
c0de137a:	4632      	mov	r2, r6
c0de137c:	fbb4 f7f0 	udiv	r7, r4, r0
c0de1380:	4628      	mov	r0, r5
c0de1382:	4639      	mov	r1, r7
c0de1384:	f7ff ffeb 	bl	c0de135e <pqcrystals_dilithium_fips202_ref_shake256_squeezeblocks>
c0de1388:	eb07 1107 	add.w	r1, r7, r7, lsl #4
c0de138c:	4632      	mov	r2, r6
c0de138e:	eb05 00c1 	add.w	r0, r5, r1, lsl #3
c0de1392:	eba4 01c1 	sub.w	r1, r4, r1, lsl #3
c0de1396:	f7ff ffc9 	bl	c0de132c <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de139a:	b035      	add	sp, #212	@ 0xd4
c0de139c:	bdf0      	pop	{r4, r5, r6, r7, pc}
	...

c0de13a0 <KeccakF1600_StatePermute>:
c0de13a0:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de13a4:	b0de      	sub	sp, #376	@ 0x178
c0de13a6:	e9d0 2130 	ldrd	r2, r1, [r0, #192]	@ 0xc0
c0de13aa:	9000      	str	r0, [sp, #0]
c0de13ac:	9156      	str	r1, [sp, #344]	@ 0x158
c0de13ae:	f8d0 10a0 	ldr.w	r1, [r0, #160]	@ 0xa0
c0de13b2:	9253      	str	r2, [sp, #332]	@ 0x14c
c0de13b4:	e9d0 2302 	ldrd	r2, r3, [r0, #8]
c0de13b8:	912a      	str	r1, [sp, #168]	@ 0xa8
c0de13ba:	f8d0 10a4 	ldr.w	r1, [r0, #164]	@ 0xa4
c0de13be:	912c      	str	r1, [sp, #176]	@ 0xb0
c0de13c0:	f8d0 10a8 	ldr.w	r1, [r0, #168]	@ 0xa8
c0de13c4:	9148      	str	r1, [sp, #288]	@ 0x120
c0de13c6:	f8d0 10ac 	ldr.w	r1, [r0, #172]	@ 0xac
c0de13ca:	914f      	str	r1, [sp, #316]	@ 0x13c
c0de13cc:	f8d0 10b0 	ldr.w	r1, [r0, #176]	@ 0xb0
c0de13d0:	9143      	str	r1, [sp, #268]	@ 0x10c
c0de13d2:	f8d0 10b4 	ldr.w	r1, [r0, #180]	@ 0xb4
c0de13d6:	914d      	str	r1, [sp, #308]	@ 0x134
c0de13d8:	f8d0 10b8 	ldr.w	r1, [r0, #184]	@ 0xb8
c0de13dc:	9151      	str	r1, [sp, #324]	@ 0x144
c0de13de:	f8d0 10bc 	ldr.w	r1, [r0, #188]	@ 0xbc
c0de13e2:	9154      	str	r1, [sp, #336]	@ 0x150
c0de13e4:	f8d0 1080 	ldr.w	r1, [r0, #128]	@ 0x80
c0de13e8:	9136      	str	r1, [sp, #216]	@ 0xd8
c0de13ea:	f8d0 1084 	ldr.w	r1, [r0, #132]	@ 0x84
c0de13ee:	913e      	str	r1, [sp, #248]	@ 0xf8
c0de13f0:	f8d0 1088 	ldr.w	r1, [r0, #136]	@ 0x88
c0de13f4:	9142      	str	r1, [sp, #264]	@ 0x108
c0de13f6:	f8d0 108c 	ldr.w	r1, [r0, #140]	@ 0x8c
c0de13fa:	914a      	str	r1, [sp, #296]	@ 0x128
c0de13fc:	f8d0 1090 	ldr.w	r1, [r0, #144]	@ 0x90
c0de1400:	913f      	str	r1, [sp, #252]	@ 0xfc
c0de1402:	f8d0 1094 	ldr.w	r1, [r0, #148]	@ 0x94
c0de1406:	9147      	str	r1, [sp, #284]	@ 0x11c
c0de1408:	f8d0 1098 	ldr.w	r1, [r0, #152]	@ 0x98
c0de140c:	9134      	str	r1, [sp, #208]	@ 0xd0
c0de140e:	f8d0 109c 	ldr.w	r1, [r0, #156]	@ 0x9c
c0de1412:	913a      	str	r1, [sp, #232]	@ 0xe8
c0de1414:	6e01      	ldr	r1, [r0, #96]	@ 0x60
c0de1416:	9141      	str	r1, [sp, #260]	@ 0x104
c0de1418:	6e41      	ldr	r1, [r0, #100]	@ 0x64
c0de141a:	9149      	str	r1, [sp, #292]	@ 0x124
c0de141c:	6e81      	ldr	r1, [r0, #104]	@ 0x68
c0de141e:	914e      	str	r1, [sp, #312]	@ 0x138
c0de1420:	6ec1      	ldr	r1, [r0, #108]	@ 0x6c
c0de1422:	9152      	str	r1, [sp, #328]	@ 0x148
c0de1424:	6f01      	ldr	r1, [r0, #112]	@ 0x70
c0de1426:	9150      	str	r1, [sp, #320]	@ 0x140
c0de1428:	6f41      	ldr	r1, [r0, #116]	@ 0x74
c0de142a:	9155      	str	r1, [sp, #340]	@ 0x154
c0de142c:	6f81      	ldr	r1, [r0, #120]	@ 0x78
c0de142e:	9135      	str	r1, [sp, #212]	@ 0xd4
c0de1430:	6fc1      	ldr	r1, [r0, #124]	@ 0x7c
c0de1432:	913c      	str	r1, [sp, #240]	@ 0xf0
c0de1434:	6c01      	ldr	r1, [r0, #64]	@ 0x40
c0de1436:	9145      	str	r1, [sp, #276]	@ 0x114
c0de1438:	6c41      	ldr	r1, [r0, #68]	@ 0x44
c0de143a:	914c      	str	r1, [sp, #304]	@ 0x130
c0de143c:	6c81      	ldr	r1, [r0, #72]	@ 0x48
c0de143e:	9139      	str	r1, [sp, #228]	@ 0xe4
c0de1440:	6cc1      	ldr	r1, [r0, #76]	@ 0x4c
c0de1442:	913b      	str	r1, [sp, #236]	@ 0xec
c0de1444:	6d01      	ldr	r1, [r0, #80]	@ 0x50
c0de1446:	9140      	str	r1, [sp, #256]	@ 0x100
c0de1448:	6d41      	ldr	r1, [r0, #84]	@ 0x54
c0de144a:	9146      	str	r1, [sp, #280]	@ 0x118
c0de144c:	6d81      	ldr	r1, [r0, #88]	@ 0x58
c0de144e:	9144      	str	r1, [sp, #272]	@ 0x110
c0de1450:	6dc1      	ldr	r1, [r0, #92]	@ 0x5c
c0de1452:	914b      	str	r1, [sp, #300]	@ 0x12c
c0de1454:	6a01      	ldr	r1, [r0, #32]
c0de1456:	9158      	str	r1, [sp, #352]	@ 0x160
c0de1458:	e9d0 e109 	ldrd	lr, r1, [r0, #36]	@ 0x24
c0de145c:	9133      	str	r1, [sp, #204]	@ 0xcc
c0de145e:	6ac1      	ldr	r1, [r0, #44]	@ 0x2c
c0de1460:	913d      	str	r1, [sp, #244]	@ 0xf4
c0de1462:	6b01      	ldr	r1, [r0, #48]	@ 0x30
c0de1464:	9131      	str	r1, [sp, #196]	@ 0xc4
c0de1466:	6b41      	ldr	r1, [r0, #52]	@ 0x34
c0de1468:	9132      	str	r1, [sp, #200]	@ 0xc8
c0de146a:	6b81      	ldr	r1, [r0, #56]	@ 0x38
c0de146c:	9137      	str	r1, [sp, #220]	@ 0xdc
c0de146e:	6bc1      	ldr	r1, [r0, #60]	@ 0x3c
c0de1470:	9138      	str	r1, [sp, #224]	@ 0xe0
c0de1472:	6801      	ldr	r1, [r0, #0]
c0de1474:	915a      	str	r1, [sp, #360]	@ 0x168
c0de1476:	6841      	ldr	r1, [r0, #4]
c0de1478:	915b      	str	r1, [sp, #364]	@ 0x16c
c0de147a:	6901      	ldr	r1, [r0, #16]
c0de147c:	9159      	str	r1, [sp, #356]	@ 0x164
c0de147e:	6941      	ldr	r1, [r0, #20]
c0de1480:	915c      	str	r1, [sp, #368]	@ 0x170
c0de1482:	6981      	ldr	r1, [r0, #24]
c0de1484:	69c0      	ldr	r0, [r0, #28]
c0de1486:	912e      	str	r1, [sp, #184]	@ 0xb8
c0de1488:	9030      	str	r0, [sp, #192]	@ 0xc0
c0de148a:	4803      	ldr	r0, [pc, #12]	@ (c0de1498 <KeccakF1600_StatePermute+0xf8>)
c0de148c:	4478      	add	r0, pc
c0de148e:	3008      	adds	r0, #8
c0de1490:	905d      	str	r0, [sp, #372]	@ 0x174
c0de1492:	2000      	movs	r0, #0
c0de1494:	e002      	b.n	c0de149c <KeccakF1600_StatePermute+0xfc>
c0de1496:	bf00      	nop
c0de1498:	0000e9e8 	.word	0x0000e9e8
c0de149c:	2817      	cmp	r0, #23
c0de149e:	f200 8654 	bhi.w	c0de214a <KeccakF1600_StatePermute+0xdaa>
c0de14a2:	9027      	str	r0, [sp, #156]	@ 0x9c
c0de14a4:	9848      	ldr	r0, [sp, #288]	@ 0x120
c0de14a6:	9936      	ldr	r1, [sp, #216]	@ 0xd8
c0de14a8:	469a      	mov	sl, r3
c0de14aa:	9257      	str	r2, [sp, #348]	@ 0x15c
c0de14ac:	f8cd e098 	str.w	lr, [sp, #152]	@ 0x98
c0de14b0:	4048      	eors	r0, r1
c0de14b2:	9944      	ldr	r1, [sp, #272]	@ 0x110
c0de14b4:	4048      	eors	r0, r1
c0de14b6:	9931      	ldr	r1, [sp, #196]	@ 0xc4
c0de14b8:	4048      	eors	r0, r1
c0de14ba:	993e      	ldr	r1, [sp, #248]	@ 0xf8
c0de14bc:	ea80 0402 	eor.w	r4, r0, r2
c0de14c0:	984f      	ldr	r0, [sp, #316]	@ 0x13c
c0de14c2:	9423      	str	r4, [sp, #140]	@ 0x8c
c0de14c4:	4048      	eors	r0, r1
c0de14c6:	994b      	ldr	r1, [sp, #300]	@ 0x12c
c0de14c8:	4048      	eors	r0, r1
c0de14ca:	9932      	ldr	r1, [sp, #200]	@ 0xc8
c0de14cc:	4048      	eors	r0, r1
c0de14ce:	993a      	ldr	r1, [sp, #232]	@ 0xe8
c0de14d0:	4058      	eors	r0, r3
c0de14d2:	0043      	lsls	r3, r0, #1
c0de14d4:	4606      	mov	r6, r0
c0de14d6:	9028      	str	r0, [sp, #160]	@ 0xa0
c0de14d8:	9856      	ldr	r0, [sp, #344]	@ 0x158
c0de14da:	ea43 75d4 	orr.w	r5, r3, r4, lsr #31
c0de14de:	ea81 0300 	eor.w	r3, r1, r0
c0de14e2:	9855      	ldr	r0, [sp, #340]	@ 0x154
c0de14e4:	4043      	eors	r3, r0
c0de14e6:	983b      	ldr	r0, [sp, #236]	@ 0xec
c0de14e8:	4043      	eors	r3, r0
c0de14ea:	982c      	ldr	r0, [sp, #176]	@ 0xb0
c0de14ec:	ea83 0b0e 	eor.w	fp, r3, lr
c0de14f0:	9b34      	ldr	r3, [sp, #208]	@ 0xd0
c0de14f2:	ea85 010b 	eor.w	r1, r5, fp
c0de14f6:	0065      	lsls	r5, r4, #1
c0de14f8:	ea81 0200 	eor.w	r2, r1, r0
c0de14fc:	912f      	str	r1, [sp, #188]	@ 0xbc
c0de14fe:	9953      	ldr	r1, [sp, #332]	@ 0x14c
c0de1500:	ea45 76d6 	orr.w	r6, r5, r6, lsr #31
c0de1504:	9222      	str	r2, [sp, #136]	@ 0x88
c0de1506:	ea83 0501 	eor.w	r5, r3, r1
c0de150a:	9950      	ldr	r1, [sp, #320]	@ 0x140
c0de150c:	9b2a      	ldr	r3, [sp, #168]	@ 0xa8
c0de150e:	404d      	eors	r5, r1
c0de1510:	9939      	ldr	r1, [sp, #228]	@ 0xe4
c0de1512:	404d      	eors	r5, r1
c0de1514:	9958      	ldr	r1, [sp, #352]	@ 0x160
c0de1516:	ea85 0801 	eor.w	r8, r5, r1
c0de151a:	ea86 0108 	eor.w	r1, r6, r8
c0de151e:	ea81 0403 	eor.w	r4, r1, r3
c0de1522:	912b      	str	r1, [sp, #172]	@ 0xac
c0de1524:	04a6      	lsls	r6, r4, #18
c0de1526:	9425      	str	r4, [sp, #148]	@ 0x94
c0de1528:	ea46 3c92 	orr.w	ip, r6, r2, lsr #14
c0de152c:	e9dd 1242 	ldrd	r1, r2, [sp, #264]	@ 0x108
c0de1530:	f8cd c070 	str.w	ip, [sp, #112]	@ 0x70
c0de1534:	ea81 0602 	eor.w	r6, r1, r2
c0de1538:	9941      	ldr	r1, [sp, #260]	@ 0x104
c0de153a:	9a4d      	ldr	r2, [sp, #308]	@ 0x134
c0de153c:	404e      	eors	r6, r1
c0de153e:	9937      	ldr	r1, [sp, #220]	@ 0xdc
c0de1540:	404e      	eors	r6, r1
c0de1542:	9959      	ldr	r1, [sp, #356]	@ 0x164
c0de1544:	ea86 0e01 	eor.w	lr, r6, r1
c0de1548:	994a      	ldr	r1, [sp, #296]	@ 0x128
c0de154a:	9e30      	ldr	r6, [sp, #192]	@ 0xc0
c0de154c:	ea81 0702 	eor.w	r7, r1, r2
c0de1550:	9949      	ldr	r1, [sp, #292]	@ 0x124
c0de1552:	404f      	eors	r7, r1
c0de1554:	9938      	ldr	r1, [sp, #224]	@ 0xe0
c0de1556:	404f      	eors	r7, r1
c0de1558:	995c      	ldr	r1, [sp, #368]	@ 0x170
c0de155a:	404f      	eors	r7, r1
c0de155c:	993c      	ldr	r1, [sp, #240]	@ 0xf0
c0de155e:	007c      	lsls	r4, r7, #1
c0de1560:	ea81 0200 	eor.w	r2, r1, r0
c0de1564:	9846      	ldr	r0, [sp, #280]	@ 0x118
c0de1566:	ea44 74de 	orr.w	r4, r4, lr, lsr #31
c0de156a:	4042      	eors	r2, r0
c0de156c:	983d      	ldr	r0, [sp, #244]	@ 0xf4
c0de156e:	4042      	eors	r2, r0
c0de1570:	985b      	ldr	r0, [sp, #364]	@ 0x16c
c0de1572:	ea82 0100 	eor.w	r1, r2, r0
c0de1576:	ea4f 024e 	mov.w	r2, lr, lsl #1
c0de157a:	ea81 0004 	eor.w	r0, r1, r4
c0de157e:	ea42 72d7 	orr.w	r2, r2, r7, lsr #31
c0de1582:	ea80 050a 	eor.w	r5, r0, sl
c0de1586:	902d      	str	r0, [sp, #180]	@ 0xb4
c0de1588:	9835      	ldr	r0, [sp, #212]	@ 0xd4
c0de158a:	9520      	str	r5, [sp, #128]	@ 0x80
c0de158c:	ea80 0403 	eor.w	r4, r0, r3
c0de1590:	9840      	ldr	r0, [sp, #256]	@ 0x100
c0de1592:	4044      	eors	r4, r0
c0de1594:	9833      	ldr	r0, [sp, #204]	@ 0xcc
c0de1596:	4044      	eors	r4, r0
c0de1598:	985a      	ldr	r0, [sp, #360]	@ 0x168
c0de159a:	4044      	eors	r4, r0
c0de159c:	9857      	ldr	r0, [sp, #348]	@ 0x15c
c0de159e:	ea84 0a02 	eor.w	sl, r4, r2
c0de15a2:	ea80 000a 	eor.w	r0, r0, sl
c0de15a6:	f8cd a064 	str.w	sl, [sp, #100]	@ 0x64
c0de15aa:	0042      	lsls	r2, r0, #1
c0de15ac:	9021      	str	r0, [sp, #132]	@ 0x84
c0de15ae:	9854      	ldr	r0, [sp, #336]	@ 0x150
c0de15b0:	ea42 72d5 	orr.w	r2, r2, r5, lsr #31
c0de15b4:	9257      	str	r2, [sp, #348]	@ 0x15c
c0de15b6:	ea22 0c0c 	bic.w	ip, r2, ip
c0de15ba:	004a      	lsls	r2, r1, #1
c0de15bc:	ea42 73d4 	orr.w	r3, r2, r4, lsr #31
c0de15c0:	9a47      	ldr	r2, [sp, #284]	@ 0x11c
c0de15c2:	4042      	eors	r2, r0
c0de15c4:	9852      	ldr	r0, [sp, #328]	@ 0x148
c0de15c6:	4042      	eors	r2, r0
c0de15c8:	984c      	ldr	r0, [sp, #304]	@ 0x130
c0de15ca:	4042      	eors	r2, r0
c0de15cc:	ea82 0506 	eor.w	r5, r2, r6
c0de15d0:	9a3a      	ldr	r2, [sp, #232]	@ 0xe8
c0de15d2:	ea83 0005 	eor.w	r0, r3, r5
c0de15d6:	0063      	lsls	r3, r4, #1
c0de15d8:	9c2e      	ldr	r4, [sp, #184]	@ 0xb8
c0de15da:	4042      	eors	r2, r0
c0de15dc:	902a      	str	r0, [sp, #168]	@ 0xa8
c0de15de:	ea43 70d1 	orr.w	r0, r3, r1, lsr #31
c0de15e2:	9951      	ldr	r1, [sp, #324]	@ 0x144
c0de15e4:	9b3f      	ldr	r3, [sp, #252]	@ 0xfc
c0de15e6:	9212      	str	r2, [sp, #72]	@ 0x48
c0de15e8:	404b      	eors	r3, r1
c0de15ea:	994e      	ldr	r1, [sp, #312]	@ 0x138
c0de15ec:	404b      	eors	r3, r1
c0de15ee:	9945      	ldr	r1, [sp, #276]	@ 0x114
c0de15f0:	404b      	eors	r3, r1
c0de15f2:	4063      	eors	r3, r4
c0de15f4:	ea80 0103 	eor.w	r1, r0, r3
c0de15f8:	9834      	ldr	r0, [sp, #208]	@ 0xd0
c0de15fa:	9129      	str	r1, [sp, #164]	@ 0xa4
c0de15fc:	4048      	eors	r0, r1
c0de15fe:	901d      	str	r0, [sp, #116]	@ 0x74
c0de1600:	0200      	lsls	r0, r0, #8
c0de1602:	ea40 6012 	orr.w	r0, r0, r2, lsr #24
c0de1606:	ea8c 0c00 	eor.w	ip, ip, r0
c0de160a:	9034      	str	r0, [sp, #208]	@ 0xd0
c0de160c:	ea4f 004b 	mov.w	r0, fp, lsl #1
c0de1610:	ea40 70d8 	orr.w	r0, r0, r8, lsr #31
c0de1614:	f8cd c090 	str.w	ip, [sp, #144]	@ 0x90
c0de1618:	4078      	eors	r0, r7
c0de161a:	ea80 0106 	eor.w	r1, r0, r6
c0de161e:	902c      	str	r0, [sp, #176]	@ 0xb0
c0de1620:	ea4f 0048 	mov.w	r0, r8, lsl #1
c0de1624:	ea40 70db 	orr.w	r0, r0, fp, lsr #31
c0de1628:	9130      	str	r1, [sp, #192]	@ 0xc0
c0de162a:	ea80 000e 	eor.w	r0, r0, lr
c0de162e:	ea80 0204 	eor.w	r2, r0, r4
c0de1632:	4604      	mov	r4, r0
c0de1634:	0710      	lsls	r0, r2, #28
c0de1636:	922e      	str	r2, [sp, #184]	@ 0xb8
c0de1638:	9a23      	ldr	r2, [sp, #140]	@ 0x8c
c0de163a:	9413      	str	r4, [sp, #76]	@ 0x4c
c0de163c:	ea40 1111 	orr.w	r1, r0, r1, lsr #4
c0de1640:	0058      	lsls	r0, r3, #1
c0de1642:	ea40 70d5 	orr.w	r0, r0, r5, lsr #31
c0de1646:	913a      	str	r1, [sp, #232]	@ 0xe8
c0de1648:	ea82 0800 	eor.w	r8, r2, r0
c0de164c:	9a43      	ldr	r2, [sp, #268]	@ 0x10c
c0de164e:	0068      	lsls	r0, r5, #1
c0de1650:	ea40 70d3 	orr.w	r0, r0, r3, lsr #31
c0de1654:	9b2b      	ldr	r3, [sp, #172]	@ 0xac
c0de1656:	f8cd 802c 	str.w	r8, [sp, #44]	@ 0x2c
c0de165a:	ea88 0602 	eor.w	r6, r8, r2
c0de165e:	9a28      	ldr	r2, [sp, #160]	@ 0xa0
c0de1660:	9616      	str	r6, [sp, #88]	@ 0x58
c0de1662:	ea82 0e00 	eor.w	lr, r2, r0
c0de1666:	9a4d      	ldr	r2, [sp, #308]	@ 0x134
c0de1668:	f8cd e0a0 	str.w	lr, [sp, #160]	@ 0xa0
c0de166c:	ea82 020e 	eor.w	r2, r2, lr
c0de1670:	0750      	lsls	r0, r2, #29
c0de1672:	9214      	str	r2, [sp, #80]	@ 0x50
c0de1674:	9a2d      	ldr	r2, [sp, #180]	@ 0xb4
c0de1676:	ea40 00d6 	orr.w	r0, r0, r6, lsr #3
c0de167a:	901a      	str	r0, [sp, #104]	@ 0x68
c0de167c:	ea21 0000 	bic.w	r0, r1, r0
c0de1680:	9936      	ldr	r1, [sp, #216]	@ 0xd8
c0de1682:	ea8a 0501 	eor.w	r5, sl, r1
c0de1686:	993e      	ldr	r1, [sp, #248]	@ 0xf8
c0de1688:	950d      	str	r5, [sp, #52]	@ 0x34
c0de168a:	4051      	eors	r1, r2
c0de168c:	9117      	str	r1, [sp, #92]	@ 0x5c
c0de168e:	0349      	lsls	r1, r1, #13
c0de1690:	ea41 41d5 	orr.w	r1, r1, r5, lsr #19
c0de1694:	4048      	eors	r0, r1
c0de1696:	9143      	str	r1, [sp, #268]	@ 0x10c
c0de1698:	994f      	ldr	r1, [sp, #316]	@ 0x13c
c0de169a:	901b      	str	r0, [sp, #108]	@ 0x6c
c0de169c:	ea80 000c 	eor.w	r0, r0, ip
c0de16a0:	404a      	eors	r2, r1
c0de16a2:	9948      	ldr	r1, [sp, #288]	@ 0x120
c0de16a4:	9211      	str	r2, [sp, #68]	@ 0x44
c0de16a6:	ea81 010a 	eor.w	r1, r1, sl
c0de16aa:	9148      	str	r1, [sp, #288]	@ 0x120
c0de16ac:	0089      	lsls	r1, r1, #2
c0de16ae:	ea41 7292 	orr.w	r2, r1, r2, lsr #30
c0de16b2:	9959      	ldr	r1, [sp, #356]	@ 0x164
c0de16b4:	923e      	str	r2, [sp, #248]	@ 0xf8
c0de16b6:	ea88 0501 	eor.w	r5, r8, r1
c0de16ba:	995c      	ldr	r1, [sp, #368]	@ 0x170
c0de16bc:	9510      	str	r5, [sp, #64]	@ 0x40
c0de16be:	ea81 010e 	eor.w	r1, r1, lr
c0de16c2:	915c      	str	r1, [sp, #368]	@ 0x170
c0de16c4:	0789      	lsls	r1, r1, #30
c0de16c6:	ea41 0195 	orr.w	r1, r1, r5, lsr #2
c0de16ca:	9d3c      	ldr	r5, [sp, #240]	@ 0xf0
c0de16cc:	914f      	str	r1, [sp, #316]	@ 0x13c
c0de16ce:	4391      	bics	r1, r2
c0de16d0:	9a35      	ldr	r2, [sp, #212]	@ 0xd4
c0de16d2:	ea83 0602 	eor.w	r6, r3, r2
c0de16d6:	9a2f      	ldr	r2, [sp, #188]	@ 0xbc
c0de16d8:	960f      	str	r6, [sp, #60]	@ 0x3c
c0de16da:	406a      	eors	r2, r5
c0de16dc:	920e      	str	r2, [sp, #56]	@ 0x38
c0de16de:	0252      	lsls	r2, r2, #9
c0de16e0:	ea42 52d6 	orr.w	r2, r2, r6, lsr #23
c0de16e4:	9e2c      	ldr	r6, [sp, #176]	@ 0xb0
c0de16e6:	4051      	eors	r1, r2
c0de16e8:	9236      	str	r2, [sp, #216]	@ 0xd8
c0de16ea:	ea80 0c01 	eor.w	ip, r0, r1
c0de16ee:	911f      	str	r1, [sp, #124]	@ 0x7c
c0de16f0:	993f      	ldr	r1, [sp, #252]	@ 0xfc
c0de16f2:	9847      	ldr	r0, [sp, #284]	@ 0x11c
c0de16f4:	4061      	eors	r1, r4
c0de16f6:	ea86 0200 	eor.w	r2, r6, r0
c0de16fa:	4620      	mov	r0, r4
c0de16fc:	9c29      	ldr	r4, [sp, #164]	@ 0xa4
c0de16fe:	910c      	str	r1, [sp, #48]	@ 0x30
c0de1700:	0549      	lsls	r1, r1, #21
c0de1702:	9247      	str	r2, [sp, #284]	@ 0x11c
c0de1704:	ea41 25d2 	orr.w	r5, r1, r2, lsr #11
c0de1708:	9a2a      	ldr	r2, [sp, #168]	@ 0xa8
c0de170a:	9956      	ldr	r1, [sp, #344]	@ 0x158
c0de170c:	9518      	str	r5, [sp, #96]	@ 0x60
c0de170e:	ea82 0b01 	eor.w	fp, r2, r1
c0de1712:	9953      	ldr	r1, [sp, #332]	@ 0x14c
c0de1714:	4061      	eors	r1, r4
c0de1716:	910a      	str	r1, [sp, #40]	@ 0x28
c0de1718:	0389      	lsls	r1, r1, #14
c0de171a:	ea41 479b 	orr.w	r7, r1, fp, lsr #18
c0de171e:	995a      	ldr	r1, [sp, #360]	@ 0x168
c0de1720:	971e      	str	r7, [sp, #120]	@ 0x78
c0de1722:	4059      	eors	r1, r3
c0de1724:	9156      	str	r1, [sp, #344]	@ 0x158
c0de1726:	43b9      	bics	r1, r7
c0de1728:	9f21      	ldr	r7, [sp, #132]	@ 0x84
c0de172a:	4069      	eors	r1, r5
c0de172c:	9123      	str	r1, [sp, #140]	@ 0x8c
c0de172e:	ea8c 0301 	eor.w	r3, ip, r1
c0de1732:	9926      	ldr	r1, [sp, #152]	@ 0x98
c0de1734:	ea82 0a01 	eor.w	sl, r2, r1
c0de1738:	9958      	ldr	r1, [sp, #352]	@ 0x160
c0de173a:	4061      	eors	r1, r4
c0de173c:	915a      	str	r1, [sp, #360]	@ 0x168
c0de173e:	06c9      	lsls	r1, r1, #27
c0de1740:	ea41 155a 	orr.w	r5, r1, sl, lsr #5
c0de1744:	9951      	ldr	r1, [sp, #324]	@ 0x144
c0de1746:	9535      	str	r5, [sp, #212]	@ 0xd4
c0de1748:	ea80 0401 	eor.w	r4, r0, r1
c0de174c:	9854      	ldr	r0, [sp, #336]	@ 0x150
c0de174e:	ea86 0100 	eor.w	r1, r6, r0
c0de1752:	9e2e      	ldr	r6, [sp, #184]	@ 0xb8
c0de1754:	060a      	lsls	r2, r1, #24
c0de1756:	ea42 2014 	orr.w	r0, r2, r4, lsr #8
c0de175a:	9a4a      	ldr	r2, [sp, #296]	@ 0x128
c0de175c:	9015      	str	r0, [sp, #84]	@ 0x54
c0de175e:	ea25 0000 	bic.w	r0, r5, r0
c0de1762:	9d42      	ldr	r5, [sp, #264]	@ 0x108
c0de1764:	ea82 020e 	eor.w	r2, r2, lr
c0de1768:	f8dd e0a4 	ldr.w	lr, [sp, #164]	@ 0xa4
c0de176c:	ea85 0508 	eor.w	r5, r5, r8
c0de1770:	ea4f 3cc5 	mov.w	ip, r5, lsl #15
c0de1774:	ea4c 4c52 	orr.w	ip, ip, r2, lsr #17
c0de1778:	03d2      	lsls	r2, r2, #15
c0de177a:	ea80 000c 	eor.w	r0, r0, ip
c0de177e:	f8cd c164 	str.w	ip, [sp, #356]	@ 0x164
c0de1782:	ea42 4255 	orr.w	r2, r2, r5, lsr #17
c0de1786:	9d19      	ldr	r5, [sp, #100]	@ 0x64
c0de1788:	ea83 0c00 	eor.w	ip, r3, r0
c0de178c:	9026      	str	r0, [sp, #152]	@ 0x98
c0de178e:	9816      	ldr	r0, [sp, #88]	@ 0x58
c0de1790:	9b14      	ldr	r3, [sp, #80]	@ 0x50
c0de1792:	f8cd c134 	str.w	ip, [sp, #308]	@ 0x134
c0de1796:	0740      	lsls	r0, r0, #29
c0de1798:	ea40 03d3 	orr.w	r3, r0, r3, lsr #3
c0de179c:	9830      	ldr	r0, [sp, #192]	@ 0xc0
c0de179e:	9316      	str	r3, [sp, #88]	@ 0x58
c0de17a0:	0700      	lsls	r0, r0, #28
c0de17a2:	ea40 1016 	orr.w	r0, r0, r6, lsr #4
c0de17a6:	9e17      	ldr	r6, [sp, #92]	@ 0x5c
c0de17a8:	9058      	str	r0, [sp, #352]	@ 0x160
c0de17aa:	4398      	bics	r0, r3
c0de17ac:	9b0d      	ldr	r3, [sp, #52]	@ 0x34
c0de17ae:	035b      	lsls	r3, r3, #13
c0de17b0:	ea43 43d6 	orr.w	r3, r3, r6, lsr #19
c0de17b4:	ea83 0600 	eor.w	r6, r3, r0
c0de17b8:	9822      	ldr	r0, [sp, #136]	@ 0x88
c0de17ba:	933c      	str	r3, [sp, #240]	@ 0xf0
c0de17bc:	9b25      	ldr	r3, [sp, #148]	@ 0x94
c0de17be:	9617      	str	r6, [sp, #92]	@ 0x5c
c0de17c0:	0480      	lsls	r0, r0, #18
c0de17c2:	ea40 3393 	orr.w	r3, r0, r3, lsr #14
c0de17c6:	9820      	ldr	r0, [sp, #128]	@ 0x80
c0de17c8:	9314      	str	r3, [sp, #80]	@ 0x50
c0de17ca:	0040      	lsls	r0, r0, #1
c0de17cc:	ea40 70d7 	orr.w	r0, r0, r7, lsr #31
c0de17d0:	9f1d      	ldr	r7, [sp, #116]	@ 0x74
c0de17d2:	9054      	str	r0, [sp, #336]	@ 0x150
c0de17d4:	4398      	bics	r0, r3
c0de17d6:	9b12      	ldr	r3, [sp, #72]	@ 0x48
c0de17d8:	021b      	lsls	r3, r3, #8
c0de17da:	ea43 6317 	orr.w	r3, r3, r7, lsr #24
c0de17de:	4058      	eors	r0, r3
c0de17e0:	933f      	str	r3, [sp, #252]	@ 0xfc
c0de17e2:	9021      	str	r0, [sp, #132]	@ 0x84
c0de17e4:	ea80 0806 	eor.w	r8, r0, r6
c0de17e8:	9810      	ldr	r0, [sp, #64]	@ 0x40
c0de17ea:	0783      	lsls	r3, r0, #30
c0de17ec:	985c      	ldr	r0, [sp, #368]	@ 0x170
c0de17ee:	ea43 0690 	orr.w	r6, r3, r0, lsr #2
c0de17f2:	9811      	ldr	r0, [sp, #68]	@ 0x44
c0de17f4:	9653      	str	r6, [sp, #332]	@ 0x14c
c0de17f6:	0083      	lsls	r3, r0, #2
c0de17f8:	9848      	ldr	r0, [sp, #288]	@ 0x120
c0de17fa:	ea43 7090 	orr.w	r0, r3, r0, lsr #30
c0de17fe:	9012      	str	r0, [sp, #72]	@ 0x48
c0de1800:	ea26 0300 	bic.w	r3, r6, r0
c0de1804:	980f      	ldr	r0, [sp, #60]	@ 0x3c
c0de1806:	0246      	lsls	r6, r0, #9
c0de1808:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0de180a:	920e      	str	r2, [sp, #56]	@ 0x38
c0de180c:	ea46 50d0 	orr.w	r0, r6, r0, lsr #23
c0de1810:	9e0c      	ldr	r6, [sp, #48]	@ 0x30
c0de1812:	4043      	eors	r3, r0
c0de1814:	9030      	str	r0, [sp, #192]	@ 0xc0
c0de1816:	ea88 0003 	eor.w	r0, r8, r3
c0de181a:	931d      	str	r3, [sp, #116]	@ 0x74
c0de181c:	9b47      	ldr	r3, [sp, #284]	@ 0x11c
c0de181e:	f8dd 80bc 	ldr.w	r8, [sp, #188]	@ 0xbc
c0de1822:	055b      	lsls	r3, r3, #21
c0de1824:	ea43 27d6 	orr.w	r7, r3, r6, lsr #11
c0de1828:	9e0a      	ldr	r6, [sp, #40]	@ 0x28
c0de182a:	ea4f 338b 	mov.w	r3, fp, lsl #14
c0de182e:	4693      	mov	fp, r2
c0de1830:	970d      	str	r7, [sp, #52]	@ 0x34
c0de1832:	ea43 4696 	orr.w	r6, r3, r6, lsr #18
c0de1836:	9b5b      	ldr	r3, [sp, #364]	@ 0x16c
c0de1838:	962e      	str	r6, [sp, #184]	@ 0xb8
c0de183a:	ea83 0308 	eor.w	r3, r3, r8
c0de183e:	9351      	str	r3, [sp, #324]	@ 0x144
c0de1840:	43b3      	bics	r3, r6
c0de1842:	407b      	eors	r3, r7
c0de1844:	9320      	str	r3, [sp, #128]	@ 0x80
c0de1846:	4058      	eors	r0, r3
c0de1848:	0623      	lsls	r3, r4, #24
c0de184a:	9c5a      	ldr	r4, [sp, #360]	@ 0x168
c0de184c:	ea43 2311 	orr.w	r3, r3, r1, lsr #8
c0de1850:	ea4f 61ca 	mov.w	r1, sl, lsl #27
c0de1854:	f8dd a02c 	ldr.w	sl, [sp, #44]	@ 0x2c
c0de1858:	ea41 1154 	orr.w	r1, r1, r4, lsr #5
c0de185c:	935b      	str	r3, [sp, #364]	@ 0x16c
c0de185e:	9c2b      	ldr	r4, [sp, #172]	@ 0xac
c0de1860:	9148      	str	r1, [sp, #288]	@ 0x120
c0de1862:	4399      	bics	r1, r3
c0de1864:	4051      	eors	r1, r2
c0de1866:	4048      	eors	r0, r1
c0de1868:	9125      	str	r1, [sp, #148]	@ 0x94
c0de186a:	9928      	ldr	r1, [sp, #160]	@ 0xa0
c0de186c:	904a      	str	r0, [sp, #296]	@ 0x128
c0de186e:	0040      	lsls	r0, r0, #1
c0de1870:	ea40 70dc 	orr.w	r0, r0, ip, lsr #31
c0de1874:	f8dd c0a8 	ldr.w	ip, [sp, #168]	@ 0xa8
c0de1878:	905c      	str	r0, [sp, #368]	@ 0x170
c0de187a:	9849      	ldr	r0, [sp, #292]	@ 0x124
c0de187c:	4041      	eors	r1, r0
c0de187e:	9841      	ldr	r0, [sp, #260]	@ 0x104
c0de1880:	915a      	str	r1, [sp, #360]	@ 0x168
c0de1882:	ea80 000a 	eor.w	r0, r0, sl
c0de1886:	9011      	str	r0, [sp, #68]	@ 0x44
c0de1888:	02c0      	lsls	r0, r0, #11
c0de188a:	ea40 5051 	orr.w	r0, r0, r1, lsr #21
c0de188e:	9932      	ldr	r1, [sp, #200]	@ 0xc8
c0de1890:	9049      	str	r0, [sp, #292]	@ 0x124
c0de1892:	ea27 0000 	bic.w	r0, r7, r0
c0de1896:	9f2d      	ldr	r7, [sp, #180]	@ 0xb4
c0de1898:	ea87 0201 	eor.w	r2, r7, r1
c0de189c:	9931      	ldr	r1, [sp, #196]	@ 0xc4
c0de189e:	9232      	str	r2, [sp, #200]	@ 0xc8
c0de18a0:	4069      	eors	r1, r5
c0de18a2:	9110      	str	r1, [sp, #64]	@ 0x40
c0de18a4:	0309      	lsls	r1, r1, #12
c0de18a6:	ea41 5112 	orr.w	r1, r1, r2, lsr #20
c0de18aa:	ea81 0300 	eor.w	r3, r1, r0
c0de18ae:	9840      	ldr	r0, [sp, #256]	@ 0x100
c0de18b0:	9147      	str	r1, [sp, #284]	@ 0x11c
c0de18b2:	9341      	str	r3, [sp, #260]	@ 0x104
c0de18b4:	ea84 0100 	eor.w	r1, r4, r0
c0de18b8:	9846      	ldr	r0, [sp, #280]	@ 0x118
c0de18ba:	910f      	str	r1, [sp, #60]	@ 0x3c
c0de18bc:	ea80 0008 	eor.w	r0, r0, r8
c0de18c0:	900c      	str	r0, [sp, #48]	@ 0x30
c0de18c2:	00c0      	lsls	r0, r0, #3
c0de18c4:	ea40 7051 	orr.w	r0, r0, r1, lsr #29
c0de18c8:	993c      	ldr	r1, [sp, #240]	@ 0xf0
c0de18ca:	9046      	str	r0, [sp, #280]	@ 0x118
c0de18cc:	ea21 0600 	bic.w	r6, r1, r0
c0de18d0:	9939      	ldr	r1, [sp, #228]	@ 0xe4
c0de18d2:	ea8e 0201 	eor.w	r2, lr, r1
c0de18d6:	993b      	ldr	r1, [sp, #236]	@ 0xec
c0de18d8:	9239      	str	r2, [sp, #228]	@ 0xe4
c0de18da:	ea8c 0001 	eor.w	r0, ip, r1
c0de18de:	0501      	lsls	r1, r0, #20
c0de18e0:	903b      	str	r0, [sp, #236]	@ 0xec
c0de18e2:	ea41 3112 	orr.w	r1, r1, r2, lsr #12
c0de18e6:	ea81 0006 	eor.w	r0, r1, r6
c0de18ea:	9142      	str	r1, [sp, #264]	@ 0x108
c0de18ec:	9944      	ldr	r1, [sp, #272]	@ 0x110
c0de18ee:	9e49      	ldr	r6, [sp, #292]	@ 0x124
c0de18f0:	9022      	str	r0, [sp, #136]	@ 0x88
c0de18f2:	4058      	eors	r0, r3
c0de18f4:	ea85 0201 	eor.w	r2, r5, r1
c0de18f8:	994b      	ldr	r1, [sp, #300]	@ 0x12c
c0de18fa:	9219      	str	r2, [sp, #100]	@ 0x64
c0de18fc:	4079      	eors	r1, r7
c0de18fe:	9f2c      	ldr	r7, [sp, #176]	@ 0xb0
c0de1900:	9109      	str	r1, [sp, #36]	@ 0x24
c0de1902:	0289      	lsls	r1, r1, #10
c0de1904:	ea41 5192 	orr.w	r1, r1, r2, lsr #22
c0de1908:	9a3d      	ldr	r2, [sp, #244]	@ 0xf4
c0de190a:	914b      	str	r1, [sp, #300]	@ 0x12c
c0de190c:	ea2b 0101 	bic.w	r1, fp, r1
c0de1910:	ea88 0302 	eor.w	r3, r8, r2
c0de1914:	9a33      	ldr	r2, [sp, #204]	@ 0xcc
c0de1916:	9308      	str	r3, [sp, #32]
c0de1918:	4062      	eors	r2, r4
c0de191a:	9c28      	ldr	r4, [sp, #160]	@ 0xa0
c0de191c:	9233      	str	r2, [sp, #204]	@ 0xcc
c0de191e:	0112      	lsls	r2, r2, #4
c0de1920:	ea42 7213 	orr.w	r2, r2, r3, lsr #28
c0de1924:	9b13      	ldr	r3, [sp, #76]	@ 0x4c
c0de1926:	4051      	eors	r1, r2
c0de1928:	9244      	str	r2, [sp, #272]	@ 0x110
c0de192a:	913d      	str	r1, [sp, #244]	@ 0xf4
c0de192c:	4048      	eors	r0, r1
c0de192e:	994e      	ldr	r1, [sp, #312]	@ 0x138
c0de1930:	ea83 0201 	eor.w	r2, r3, r1
c0de1934:	9952      	ldr	r1, [sp, #328]	@ 0x148
c0de1936:	9206      	str	r2, [sp, #24]
c0de1938:	4079      	eors	r1, r7
c0de193a:	9105      	str	r1, [sp, #20]
c0de193c:	0649      	lsls	r1, r1, #25
c0de193e:	ea41 12d2 	orr.w	r2, r1, r2, lsr #7
c0de1942:	993f      	ldr	r1, [sp, #252]	@ 0xfc
c0de1944:	924e      	str	r2, [sp, #312]	@ 0x138
c0de1946:	4391      	bics	r1, r2
c0de1948:	9a37      	ldr	r2, [sp, #220]	@ 0xdc
c0de194a:	ea8a 0502 	eor.w	r5, sl, r2
c0de194e:	9a38      	ldr	r2, [sp, #224]	@ 0xe0
c0de1950:	9537      	str	r5, [sp, #220]	@ 0xdc
c0de1952:	4062      	eors	r2, r4
c0de1954:	9228      	str	r2, [sp, #160]	@ 0xa0
c0de1956:	0192      	lsls	r2, r2, #6
c0de1958:	ea42 6295 	orr.w	r2, r2, r5, lsr #26
c0de195c:	9d28      	ldr	r5, [sp, #160]	@ 0xa0
c0de195e:	4051      	eors	r1, r2
c0de1960:	9252      	str	r2, [sp, #328]	@ 0x148
c0de1962:	ea80 0201 	eor.w	r2, r0, r1
c0de1966:	9855      	ldr	r0, [sp, #340]	@ 0x154
c0de1968:	9140      	str	r1, [sp, #256]	@ 0x100
c0de196a:	ea8c 0400 	eor.w	r4, ip, r0
c0de196e:	9850      	ldr	r0, [sp, #320]	@ 0x140
c0de1970:	940b      	str	r4, [sp, #44]	@ 0x2c
c0de1972:	ea80 000e 	eor.w	r0, r0, lr
c0de1976:	01c1      	lsls	r1, r0, #7
c0de1978:	902a      	str	r0, [sp, #168]	@ 0xa8
c0de197a:	9830      	ldr	r0, [sp, #192]	@ 0xc0
c0de197c:	ea41 6154 	orr.w	r1, r1, r4, lsr #25
c0de1980:	9c10      	ldr	r4, [sp, #64]	@ 0x40
c0de1982:	9155      	str	r1, [sp, #340]	@ 0x154
c0de1984:	4388      	bics	r0, r1
c0de1986:	994c      	ldr	r1, [sp, #304]	@ 0x130
c0de1988:	ea87 0e01 	eor.w	lr, r7, r1
c0de198c:	9945      	ldr	r1, [sp, #276]	@ 0x114
c0de198e:	9f33      	ldr	r7, [sp, #204]	@ 0xcc
c0de1990:	ea83 0b01 	eor.w	fp, r3, r1
c0de1994:	ea4f 5acb 	mov.w	sl, fp, lsl #23
c0de1998:	ea4a 215e 	orr.w	r1, sl, lr, lsr #9
c0de199c:	4048      	eors	r0, r1
c0de199e:	9150      	str	r1, [sp, #320]	@ 0x140
c0de19a0:	995c      	ldr	r1, [sp, #368]	@ 0x170
c0de19a2:	902c      	str	r0, [sp, #176]	@ 0xb0
c0de19a4:	4050      	eors	r0, r2
c0de19a6:	ea81 0200 	eor.w	r2, r1, r0
c0de19aa:	902d      	str	r0, [sp, #180]	@ 0xb4
c0de19ac:	982e      	ldr	r0, [sp, #184]	@ 0xb8
c0de19ae:	990d      	ldr	r1, [sp, #52]	@ 0x34
c0de19b0:	925c      	str	r2, [sp, #368]	@ 0x170
c0de19b2:	4388      	bics	r0, r1
c0de19b4:	9911      	ldr	r1, [sp, #68]	@ 0x44
c0de19b6:	4070      	eors	r0, r6
c0de19b8:	9e09      	ldr	r6, [sp, #36]	@ 0x24
c0de19ba:	ea82 0a00 	eor.w	sl, r2, r0
c0de19be:	9031      	str	r0, [sp, #196]	@ 0xc4
c0de19c0:	984d      	ldr	r0, [sp, #308]	@ 0x134
c0de19c2:	9a4a      	ldr	r2, [sp, #296]	@ 0x128
c0de19c4:	f8cd a034 	str.w	sl, [sp, #52]	@ 0x34
c0de19c8:	0040      	lsls	r0, r0, #1
c0de19ca:	ea40 70d2 	orr.w	r0, r0, r2, lsr #31
c0de19ce:	9a32      	ldr	r2, [sp, #200]	@ 0xc8
c0de19d0:	904c      	str	r0, [sp, #304]	@ 0x130
c0de19d2:	985a      	ldr	r0, [sp, #360]	@ 0x168
c0de19d4:	0312      	lsls	r2, r2, #12
c0de19d6:	02c0      	lsls	r0, r0, #11
c0de19d8:	ea42 5c14 	orr.w	ip, r2, r4, lsr #20
c0de19dc:	9a0c      	ldr	r2, [sp, #48]	@ 0x30
c0de19de:	9c3b      	ldr	r4, [sp, #236]	@ 0xec
c0de19e0:	ea40 5351 	orr.w	r3, r0, r1, lsr #21
c0de19e4:	9918      	ldr	r1, [sp, #96]	@ 0x60
c0de19e6:	f8cd c01c 	str.w	ip, [sp, #28]
c0de19ea:	930a      	str	r3, [sp, #40]	@ 0x28
c0de19ec:	ea21 0003 	bic.w	r0, r1, r3
c0de19f0:	ea8c 0800 	eor.w	r8, ip, r0
c0de19f4:	980f      	ldr	r0, [sp, #60]	@ 0x3c
c0de19f6:	f8cd 80e0 	str.w	r8, [sp, #224]	@ 0xe0
c0de19fa:	00c0      	lsls	r0, r0, #3
c0de19fc:	ea40 7252 	orr.w	r2, r0, r2, lsr #29
c0de1a00:	9843      	ldr	r0, [sp, #268]	@ 0x10c
c0de1a02:	922f      	str	r2, [sp, #188]	@ 0xbc
c0de1a04:	4390      	bics	r0, r2
c0de1a06:	9a39      	ldr	r2, [sp, #228]	@ 0xe4
c0de1a08:	0512      	lsls	r2, r2, #20
c0de1a0a:	ea42 3414 	orr.w	r4, r2, r4, lsr #12
c0de1a0e:	9a19      	ldr	r2, [sp, #100]	@ 0x64
c0de1a10:	4060      	eors	r0, r4
c0de1a12:	9404      	str	r4, [sp, #16]
c0de1a14:	0292      	lsls	r2, r2, #10
c0de1a16:	902b      	str	r0, [sp, #172]	@ 0xac
c0de1a18:	ea80 0008 	eor.w	r0, r0, r8
c0de1a1c:	ea42 5696 	orr.w	r6, r2, r6, lsr #22
c0de1a20:	9a59      	ldr	r2, [sp, #356]	@ 0x164
c0de1a22:	9609      	str	r6, [sp, #36]	@ 0x24
c0de1a24:	43b2      	bics	r2, r6
c0de1a26:	9e08      	ldr	r6, [sp, #32]
c0de1a28:	0136      	lsls	r6, r6, #4
c0de1a2a:	ea46 7717 	orr.w	r7, r6, r7, lsr #28
c0de1a2e:	9e05      	ldr	r6, [sp, #20]
c0de1a30:	407a      	eors	r2, r7
c0de1a32:	9701      	str	r7, [sp, #4]
c0de1a34:	9245      	str	r2, [sp, #276]	@ 0x114
c0de1a36:	4050      	eors	r0, r2
c0de1a38:	9a06      	ldr	r2, [sp, #24]
c0de1a3a:	0652      	lsls	r2, r2, #25
c0de1a3c:	ea42 16d6 	orr.w	r6, r2, r6, lsr #7
c0de1a40:	9a34      	ldr	r2, [sp, #208]	@ 0xd0
c0de1a42:	9633      	str	r6, [sp, #204]	@ 0xcc
c0de1a44:	43b2      	bics	r2, r6
c0de1a46:	9e37      	ldr	r6, [sp, #220]	@ 0xdc
c0de1a48:	01b6      	lsls	r6, r6, #6
c0de1a4a:	ea46 6695 	orr.w	r6, r6, r5, lsr #26
c0de1a4e:	4072      	eors	r2, r6
c0de1a50:	9603      	str	r6, [sp, #12]
c0de1a52:	ea80 0802 	eor.w	r8, r0, r2
c0de1a56:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de1a58:	9219      	str	r2, [sp, #100]	@ 0x64
c0de1a5a:	9a2a      	ldr	r2, [sp, #168]	@ 0xa8
c0de1a5c:	01c0      	lsls	r0, r0, #7
c0de1a5e:	ea40 6252 	orr.w	r2, r0, r2, lsr #25
c0de1a62:	9836      	ldr	r0, [sp, #216]	@ 0xd8
c0de1a64:	9208      	str	r2, [sp, #32]
c0de1a66:	ea20 0502 	bic.w	r5, r0, r2
c0de1a6a:	ea4f 50ce 	mov.w	r0, lr, lsl #23
c0de1a6e:	ea40 225b 	orr.w	r2, r0, fp, lsr #9
c0de1a72:	f8dd b070 	ldr.w	fp, [sp, #112]	@ 0x70
c0de1a76:	ea85 0002 	eor.w	r0, r5, r2
c0de1a7a:	9d1e      	ldr	r5, [sp, #120]	@ 0x78
c0de1a7c:	4696      	mov	lr, r2
c0de1a7e:	e9cd 200b 	strd	r2, r0, [sp, #44]	@ 0x2c
c0de1a82:	9a4c      	ldr	r2, [sp, #304]	@ 0x130
c0de1a84:	ea80 0008 	eor.w	r0, r0, r8
c0de1a88:	f8dd 8054 	ldr.w	r8, [sp, #84]	@ 0x54
c0de1a8c:	ea25 0101 	bic.w	r1, r5, r1
c0de1a90:	9010      	str	r0, [sp, #64]	@ 0x40
c0de1a92:	4050      	eors	r0, r2
c0de1a94:	4059      	eors	r1, r3
c0de1a96:	905a      	str	r0, [sp, #360]	@ 0x168
c0de1a98:	4048      	eors	r0, r1
c0de1a9a:	9105      	str	r1, [sp, #20]
c0de1a9c:	9912      	ldr	r1, [sp, #72]	@ 0x48
c0de1a9e:	0782      	lsls	r2, r0, #30
c0de1aa0:	900f      	str	r0, [sp, #60]	@ 0x3c
c0de1aa2:	ea42 009a 	orr.w	r0, r2, sl, lsr #2
c0de1aa6:	9a4f      	ldr	r2, [sp, #316]	@ 0x13c
c0de1aa8:	f8dd a068 	ldr.w	sl, [sp, #104]	@ 0x68
c0de1aac:	904c      	str	r0, [sp, #304]	@ 0x130
c0de1aae:	983e      	ldr	r0, [sp, #248]	@ 0xf8
c0de1ab0:	ea2e 0202 	bic.w	r2, lr, r2
c0de1ab4:	ea80 0302 	eor.w	r3, r0, r2
c0de1ab8:	9a56      	ldr	r2, [sp, #344]	@ 0x158
c0de1aba:	9329      	str	r3, [sp, #164]	@ 0xa4
c0de1abc:	ea2c 0202 	bic.w	r2, ip, r2
c0de1ac0:	ea85 0002 	eor.w	r0, r5, r2
c0de1ac4:	9d47      	ldr	r5, [sp, #284]	@ 0x11c
c0de1ac6:	ea80 0203 	eor.w	r2, r0, r3
c0de1aca:	9b57      	ldr	r3, [sp, #348]	@ 0x15c
c0de1acc:	9013      	str	r0, [sp, #76]	@ 0x4c
c0de1ace:	ea26 0303 	bic.w	r3, r6, r3
c0de1ad2:	9e44      	ldr	r6, [sp, #272]	@ 0x110
c0de1ad4:	ea83 000b 	eor.w	r0, r3, fp
c0de1ad8:	9b3a      	ldr	r3, [sp, #232]	@ 0xe8
c0de1ada:	902a      	str	r0, [sp, #168]	@ 0xa8
c0de1adc:	4042      	eors	r2, r0
c0de1ade:	9835      	ldr	r0, [sp, #212]	@ 0xd4
c0de1ae0:	ea24 0303 	bic.w	r3, r4, r3
c0de1ae4:	9c14      	ldr	r4, [sp, #80]	@ 0x50
c0de1ae6:	ea83 030a 	eor.w	r3, r3, sl
c0de1aea:	933b      	str	r3, [sp, #236]	@ 0xec
c0de1aec:	405a      	eors	r2, r3
c0de1aee:	ea27 0300 	bic.w	r3, r7, r0
c0de1af2:	9850      	ldr	r0, [sp, #320]	@ 0x140
c0de1af4:	ea83 0308 	eor.w	r3, r3, r8
c0de1af8:	ea82 0c03 	eor.w	ip, r2, r3
c0de1afc:	9a53      	ldr	r2, [sp, #332]	@ 0x14c
c0de1afe:	9332      	str	r3, [sp, #200]	@ 0xc8
c0de1b00:	4667      	mov	r7, ip
c0de1b02:	f8cd c018 	str.w	ip, [sp, #24]
c0de1b06:	ea20 0202 	bic.w	r2, r0, r2
c0de1b0a:	982e      	ldr	r0, [sp, #184]	@ 0xb8
c0de1b0c:	ea81 0302 	eor.w	r3, r1, r2
c0de1b10:	9a51      	ldr	r2, [sp, #324]	@ 0x144
c0de1b12:	931e      	str	r3, [sp, #120]	@ 0x78
c0de1b14:	ea25 0202 	bic.w	r2, r5, r2
c0de1b18:	9d42      	ldr	r5, [sp, #264]	@ 0x108
c0de1b1a:	4050      	eors	r0, r2
c0de1b1c:	ea80 0203 	eor.w	r2, r0, r3
c0de1b20:	9011      	str	r0, [sp, #68]	@ 0x44
c0de1b22:	9b54      	ldr	r3, [sp, #336]	@ 0x150
c0de1b24:	9852      	ldr	r0, [sp, #328]	@ 0x148
c0de1b26:	ea20 0303 	bic.w	r3, r0, r3
c0de1b2a:	4063      	eors	r3, r4
c0de1b2c:	932e      	str	r3, [sp, #184]	@ 0xb8
c0de1b2e:	405a      	eors	r2, r3
c0de1b30:	9b58      	ldr	r3, [sp, #352]	@ 0x160
c0de1b32:	ea25 0303 	bic.w	r3, r5, r3
c0de1b36:	9d16      	ldr	r5, [sp, #88]	@ 0x58
c0de1b38:	406b      	eors	r3, r5
c0de1b3a:	9339      	str	r3, [sp, #228]	@ 0xe4
c0de1b3c:	405a      	eors	r2, r3
c0de1b3e:	9b48      	ldr	r3, [sp, #288]	@ 0x120
c0de1b40:	ea26 0303 	bic.w	r3, r6, r3
c0de1b44:	9e5b      	ldr	r6, [sp, #364]	@ 0x16c
c0de1b46:	4073      	eors	r3, r6
c0de1b48:	ea82 0003 	eor.w	r0, r2, r3
c0de1b4c:	9318      	str	r3, [sp, #96]	@ 0x60
c0de1b4e:	9b3c      	ldr	r3, [sp, #240]	@ 0xf0
c0de1b50:	0042      	lsls	r2, r0, #1
c0de1b52:	9002      	str	r0, [sp, #8]
c0de1b54:	ea25 0303 	bic.w	r3, r5, r3
c0de1b58:	9d46      	ldr	r5, [sp, #280]	@ 0x118
c0de1b5a:	ea42 72dc 	orr.w	r2, r2, ip, lsr #31
c0de1b5e:	f8dd c12c 	ldr.w	ip, [sp, #300]	@ 0x12c
c0de1b62:	405d      	eors	r5, r3
c0de1b64:	9b0e      	ldr	r3, [sp, #56]	@ 0x38
c0de1b66:	9516      	str	r5, [sp, #88]	@ 0x58
c0de1b68:	ea26 0303 	bic.w	r3, r6, r3
c0de1b6c:	9e09      	ldr	r6, [sp, #36]	@ 0x24
c0de1b6e:	ea83 030c 	eor.w	r3, r3, ip
c0de1b72:	933c      	str	r3, [sp, #240]	@ 0xf0
c0de1b74:	406b      	eors	r3, r5
c0de1b76:	9d30      	ldr	r5, [sp, #192]	@ 0xc0
c0de1b78:	ea21 0505 	bic.w	r5, r1, r5
c0de1b7c:	9955      	ldr	r1, [sp, #340]	@ 0x154
c0de1b7e:	404d      	eors	r5, r1
c0de1b80:	9931      	ldr	r1, [sp, #196]	@ 0xc4
c0de1b82:	406b      	eors	r3, r5
c0de1b84:	9537      	str	r5, [sp, #220]	@ 0xdc
c0de1b86:	9d3f      	ldr	r5, [sp, #252]	@ 0xfc
c0de1b88:	404b      	eors	r3, r1
c0de1b8a:	994e      	ldr	r1, [sp, #312]	@ 0x138
c0de1b8c:	ea24 0505 	bic.w	r5, r4, r5
c0de1b90:	9c08      	ldr	r4, [sp, #32]
c0de1b92:	404d      	eors	r5, r1
c0de1b94:	ea83 0e05 	eor.w	lr, r3, r5
c0de1b98:	9b17      	ldr	r3, [sp, #92]	@ 0x5c
c0de1b9a:	9528      	str	r5, [sp, #160]	@ 0xa0
c0de1b9c:	9d2f      	ldr	r5, [sp, #188]	@ 0xbc
c0de1b9e:	ea82 020e 	eor.w	r2, r2, lr
c0de1ba2:	ea82 0c03 	eor.w	ip, r2, r3
c0de1ba6:	9b59      	ldr	r3, [sp, #356]	@ 0x164
c0de1ba8:	925b      	str	r2, [sp, #364]	@ 0x16c
c0de1baa:	007a      	lsls	r2, r7, #1
c0de1bac:	ea42 72d0 	orr.w	r2, r2, r0, lsr #31
c0de1bb0:	ea28 0303 	bic.w	r3, r8, r3
c0de1bb4:	ea86 0103 	eor.w	r1, r6, r3
c0de1bb8:	9b43      	ldr	r3, [sp, #268]	@ 0x10c
c0de1bba:	913f      	str	r1, [sp, #252]	@ 0xfc
c0de1bbc:	ea2a 0303 	bic.w	r3, sl, r3
c0de1bc0:	f8dd a130 	ldr.w	sl, [sp, #304]	@ 0x130
c0de1bc4:	ea83 0005 	eor.w	r0, r3, r5
c0de1bc8:	ea80 0301 	eor.w	r3, r0, r1
c0de1bcc:	9015      	str	r0, [sp, #84]	@ 0x54
c0de1bce:	9836      	ldr	r0, [sp, #216]	@ 0xd8
c0de1bd0:	993e      	ldr	r1, [sp, #248]	@ 0xf8
c0de1bd2:	ea21 0700 	bic.w	r7, r1, r0
c0de1bd6:	9805      	ldr	r0, [sp, #20]
c0de1bd8:	ea84 0107 	eor.w	r1, r4, r7
c0de1bdc:	9f33      	ldr	r7, [sp, #204]	@ 0xcc
c0de1bde:	404b      	eors	r3, r1
c0de1be0:	9131      	str	r1, [sp, #196]	@ 0xc4
c0de1be2:	ea83 0100 	eor.w	r1, r3, r0
c0de1be6:	9b34      	ldr	r3, [sp, #208]	@ 0xd0
c0de1be8:	ea2b 0303 	bic.w	r3, fp, r3
c0de1bec:	407b      	eors	r3, r7
c0de1bee:	ea81 0b03 	eor.w	fp, r1, r3
c0de1bf2:	931c      	str	r3, [sp, #112]	@ 0x70
c0de1bf4:	9957      	ldr	r1, [sp, #348]	@ 0x15c
c0de1bf6:	ea82 000b 	eor.w	r0, r2, fp
c0de1bfa:	9a1b      	ldr	r2, [sp, #108]	@ 0x6c
c0de1bfc:	9059      	str	r0, [sp, #356]	@ 0x164
c0de1bfe:	ea80 0802 	eor.w	r8, r0, r2
c0de1c02:	ea4f 52c8 	mov.w	r2, r8, lsl #23
c0de1c06:	ea42 205c 	orr.w	r0, r2, ip, lsr #9
c0de1c0a:	ea4f 024b 	mov.w	r2, fp, lsl #1
c0de1c0e:	9036      	str	r0, [sp, #216]	@ 0xd8
c0de1c10:	ea20 000a 	bic.w	r0, r0, sl
c0de1c14:	ea42 72de 	orr.w	r2, r2, lr, lsr #31
c0de1c18:	9034      	str	r0, [sp, #208]	@ 0xd0
c0de1c1a:	9803      	ldr	r0, [sp, #12]
c0de1c1c:	ea27 0300 	bic.w	r3, r7, r0
c0de1c20:	9801      	ldr	r0, [sp, #4]
c0de1c22:	4059      	eors	r1, r3
c0de1c24:	ea26 0300 	bic.w	r3, r6, r0
c0de1c28:	9835      	ldr	r0, [sp, #212]	@ 0xd4
c0de1c2a:	9133      	str	r1, [sp, #204]	@ 0xcc
c0de1c2c:	4058      	eors	r0, r3
c0de1c2e:	9b07      	ldr	r3, [sp, #28]
c0de1c30:	ea80 0601 	eor.w	r6, r0, r1
c0de1c34:	9043      	str	r0, [sp, #268]	@ 0x10c
c0de1c36:	9804      	ldr	r0, [sp, #16]
c0de1c38:	993a      	ldr	r1, [sp, #232]	@ 0xe8
c0de1c3a:	ea25 0700 	bic.w	r7, r5, r0
c0de1c3e:	ea87 0001 	eor.w	r0, r7, r1
c0de1c42:	994f      	ldr	r1, [sp, #316]	@ 0x13c
c0de1c44:	903e      	str	r0, [sp, #248]	@ 0xf8
c0de1c46:	4046      	eors	r6, r0
c0de1c48:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de1c4a:	ea24 0000 	bic.w	r0, r4, r0
c0de1c4e:	4048      	eors	r0, r1
c0de1c50:	990a      	ldr	r1, [sp, #40]	@ 0x28
c0de1c52:	9014      	str	r0, [sp, #80]	@ 0x50
c0de1c54:	4070      	eors	r0, r6
c0de1c56:	ea21 0403 	bic.w	r4, r1, r3
c0de1c5a:	9956      	ldr	r1, [sp, #344]	@ 0x158
c0de1c5c:	9b44      	ldr	r3, [sp, #272]	@ 0x110
c0de1c5e:	404c      	eors	r4, r1
c0de1c60:	995d      	ldr	r1, [sp, #372]	@ 0x174
c0de1c62:	e951 6702 	ldrd	r6, r7, [r1, #-8]
c0de1c66:	ea84 0106 	eor.w	r1, r4, r6
c0de1c6a:	9e10      	ldr	r6, [sp, #64]	@ 0x40
c0de1c6c:	4048      	eors	r0, r1
c0de1c6e:	911b      	str	r1, [sp, #108]	@ 0x6c
c0de1c70:	990c      	ldr	r1, [sp, #48]	@ 0x30
c0de1c72:	904f      	str	r0, [sp, #316]	@ 0x13c
c0de1c74:	4050      	eors	r0, r2
c0de1c76:	ea4f 024e 	mov.w	r2, lr, lsl #1
c0de1c7a:	f8dd e0b4 	ldr.w	lr, [sp, #180]	@ 0xb4
c0de1c7e:	ea42 74db 	orr.w	r4, r2, fp, lsr #31
c0de1c82:	902f      	str	r0, [sp, #188]	@ 0xbc
c0de1c84:	4041      	eors	r1, r0
c0de1c86:	9852      	ldr	r0, [sp, #328]	@ 0x148
c0de1c88:	9a4e      	ldr	r2, [sp, #312]	@ 0x138
c0de1c8a:	4382      	bics	r2, r0
c0de1c8c:	9854      	ldr	r0, [sp, #336]	@ 0x150
c0de1c8e:	4050      	eors	r0, r2
c0de1c90:	9a4b      	ldr	r2, [sp, #300]	@ 0x12c
c0de1c92:	9017      	str	r0, [sp, #92]	@ 0x5c
c0de1c94:	439a      	bics	r2, r3
c0de1c96:	9b48      	ldr	r3, [sp, #288]	@ 0x120
c0de1c98:	ea83 0b02 	eor.w	fp, r3, r2
c0de1c9c:	9b42      	ldr	r3, [sp, #264]	@ 0x108
c0de1c9e:	ea8b 0200 	eor.w	r2, fp, r0
c0de1ca2:	9846      	ldr	r0, [sp, #280]	@ 0x118
c0de1ca4:	ea20 0503 	bic.w	r5, r0, r3
c0de1ca8:	9858      	ldr	r0, [sp, #352]	@ 0x160
c0de1caa:	9b50      	ldr	r3, [sp, #320]	@ 0x140
c0de1cac:	4068      	eors	r0, r5
c0de1cae:	9052      	str	r0, [sp, #328]	@ 0x148
c0de1cb0:	4042      	eors	r2, r0
c0de1cb2:	9855      	ldr	r0, [sp, #340]	@ 0x154
c0de1cb4:	ea20 0503 	bic.w	r5, r0, r3
c0de1cb8:	9853      	ldr	r0, [sp, #332]	@ 0x14c
c0de1cba:	9b47      	ldr	r3, [sp, #284]	@ 0x11c
c0de1cbc:	4068      	eors	r0, r5
c0de1cbe:	9055      	str	r0, [sp, #340]	@ 0x154
c0de1cc0:	4042      	eors	r2, r0
c0de1cc2:	9849      	ldr	r0, [sp, #292]	@ 0x124
c0de1cc4:	ea20 0503 	bic.w	r5, r0, r3
c0de1cc8:	9851      	ldr	r0, [sp, #324]	@ 0x144
c0de1cca:	9b2c      	ldr	r3, [sp, #176]	@ 0xb0
c0de1ccc:	4045      	eors	r5, r0
c0de1cce:	ea85 0007 	eor.w	r0, r5, r7
c0de1cd2:	4042      	eors	r2, r0
c0de1cd4:	901a      	str	r0, [sp, #104]	@ 0x68
c0de1cd6:	ea82 0004 	eor.w	r0, r2, r4
c0de1cda:	ea80 0703 	eor.w	r7, r0, r3
c0de1cde:	9b34      	ldr	r3, [sp, #208]	@ 0xd0
c0de1ce0:	9057      	str	r0, [sp, #348]	@ 0x15c
c0de1ce2:	00bc      	lsls	r4, r7, #2
c0de1ce4:	ea44 7091 	orr.w	r0, r4, r1, lsr #30
c0de1ce8:	ea4f 54cc 	mov.w	r4, ip, lsl #23
c0de1cec:	0089      	lsls	r1, r1, #2
c0de1cee:	4043      	eors	r3, r0
c0de1cf0:	ea44 2858 	orr.w	r8, r4, r8, lsr #9
c0de1cf4:	ea41 7797 	orr.w	r7, r1, r7, lsr #30
c0de1cf8:	9356      	str	r3, [sp, #344]	@ 0x158
c0de1cfa:	9b0d      	ldr	r3, [sp, #52]	@ 0x34
c0de1cfc:	079d      	lsls	r5, r3, #30
c0de1cfe:	9b0f      	ldr	r3, [sp, #60]	@ 0x3c
c0de1d00:	ea45 0c93 	orr.w	ip, r5, r3, lsr #2
c0de1d04:	9b02      	ldr	r3, [sp, #8]
c0de1d06:	9d06      	ldr	r5, [sp, #24]
c0de1d08:	ea28 040c 	bic.w	r4, r8, ip
c0de1d0c:	ea87 0104 	eor.w	r1, r7, r4
c0de1d10:	ea4f 044e 	mov.w	r4, lr, lsl #1
c0de1d14:	ea44 74d6 	orr.w	r4, r4, r6, lsr #31
c0de1d18:	9153      	str	r1, [sp, #332]	@ 0x14c
c0de1d1a:	ea2a 0100 	bic.w	r1, sl, r0
c0de1d1e:	ea83 0a04 	eor.w	sl, r3, r4
c0de1d22:	0073      	lsls	r3, r6, #1
c0de1d24:	ea43 73de 	orr.w	r3, r3, lr, lsr #31
c0de1d28:	ea8a 040b 	eor.w	r4, sl, fp
c0de1d2c:	f8cd a0c0 	str.w	sl, [sp, #192]	@ 0xc0
c0de1d30:	ea85 0b03 	eor.w	fp, r5, r3
c0de1d34:	9b43      	ldr	r3, [sp, #268]	@ 0x10c
c0de1d36:	9d4f      	ldr	r5, [sp, #316]	@ 0x13c
c0de1d38:	f8cd b160 	str.w	fp, [sp, #352]	@ 0x160
c0de1d3c:	ea83 030b 	eor.w	r3, r3, fp
c0de1d40:	025e      	lsls	r6, r3, #9
c0de1d42:	ea46 56d4 	orr.w	r6, r6, r4, lsr #23
c0de1d46:	0264      	lsls	r4, r4, #9
c0de1d48:	4071      	eors	r1, r6
c0de1d4a:	ea44 53d3 	orr.w	r3, r4, r3, lsr #23
c0de1d4e:	ea20 0406 	bic.w	r4, r0, r6
c0de1d52:	0050      	lsls	r0, r2, #1
c0de1d54:	9154      	str	r1, [sp, #336]	@ 0x150
c0de1d56:	ea2c 0107 	bic.w	r1, ip, r7
c0de1d5a:	ea40 70d5 	orr.w	r0, r0, r5, lsr #31
c0de1d5e:	4059      	eors	r1, r3
c0de1d60:	9151      	str	r1, [sp, #324]	@ 0x144
c0de1d62:	994a      	ldr	r1, [sp, #296]	@ 0x128
c0de1d64:	ea80 0e01 	eor.w	lr, r0, r1
c0de1d68:	0068      	lsls	r0, r5, #1
c0de1d6a:	992e      	ldr	r1, [sp, #184]	@ 0xb8
c0de1d6c:	ea40 70d2 	orr.w	r0, r0, r2, lsr #31
c0de1d70:	9a4d      	ldr	r2, [sp, #308]	@ 0x134
c0de1d72:	f8cd e0b4 	str.w	lr, [sp, #180]	@ 0xb4
c0de1d76:	ea81 010e 	eor.w	r1, r1, lr
c0de1d7a:	4050      	eors	r0, r2
c0de1d7c:	9a2a      	ldr	r2, [sp, #168]	@ 0xa8
c0de1d7e:	4605      	mov	r5, r0
c0de1d80:	902e      	str	r0, [sp, #184]	@ 0xb8
c0de1d82:	4042      	eors	r2, r0
c0de1d84:	01d0      	lsls	r0, r2, #7
c0de1d86:	ea40 6051 	orr.w	r0, r0, r1, lsr #25
c0de1d8a:	01c9      	lsls	r1, r1, #7
c0de1d8c:	4044      	eors	r4, r0
c0de1d8e:	ea41 6152 	orr.w	r1, r1, r2, lsr #25
c0de1d92:	944d      	str	r4, [sp, #308]	@ 0x134
c0de1d94:	ea27 0403 	bic.w	r4, r7, r3
c0de1d98:	ea81 0204 	eor.w	r2, r1, r4
c0de1d9c:	9c36      	ldr	r4, [sp, #216]	@ 0xd8
c0de1d9e:	9243      	str	r2, [sp, #268]	@ 0x10c
c0de1da0:	ea26 0200 	bic.w	r2, r6, r0
c0de1da4:	4062      	eors	r2, r4
c0de1da6:	43a0      	bics	r0, r4
c0de1da8:	9c5b      	ldr	r4, [sp, #364]	@ 0x16c
c0de1daa:	924f      	str	r2, [sp, #316]	@ 0x13c
c0de1dac:	ea23 0201 	bic.w	r2, r3, r1
c0de1db0:	ea82 0208 	eor.w	r2, r2, r8
c0de1db4:	9248      	str	r2, [sp, #288]	@ 0x120
c0de1db6:	9a4c      	ldr	r2, [sp, #304]	@ 0x130
c0de1db8:	4050      	eors	r0, r2
c0de1dba:	902c      	str	r0, [sp, #176]	@ 0xb0
c0de1dbc:	ea21 0008 	bic.w	r0, r1, r8
c0de1dc0:	9911      	ldr	r1, [sp, #68]	@ 0x44
c0de1dc2:	f8dd 8170 	ldr.w	r8, [sp, #368]	@ 0x170
c0de1dc6:	ea80 000c 	eor.w	r0, r0, ip
c0de1dca:	902a      	str	r0, [sp, #168]	@ 0xa8
c0de1dcc:	9813      	ldr	r0, [sp, #76]	@ 0x4c
c0de1dce:	ea8e 0c01 	eor.w	ip, lr, r1
c0de1dd2:	f8dd e168 	ldr.w	lr, [sp, #360]	@ 0x168
c0de1dd6:	ea4f 62cc 	mov.w	r2, ip, lsl #27
c0de1dda:	4068      	eors	r0, r5
c0de1ddc:	ea42 1350 	orr.w	r3, r2, r0, lsr #5
c0de1de0:	9a52      	ldr	r2, [sp, #328]	@ 0x148
c0de1de2:	06c0      	lsls	r0, r0, #27
c0de1de4:	461d      	mov	r5, r3
c0de1de6:	9350      	str	r3, [sp, #320]	@ 0x140
c0de1de8:	ea8a 0102 	eor.w	r1, sl, r2
c0de1dec:	9a3e      	ldr	r2, [sp, #248]	@ 0xf8
c0de1dee:	ea40 1a5c 	orr.w	sl, r0, ip, lsr #5
c0de1df2:	0108      	lsls	r0, r1, #4
c0de1df4:	ea8b 0602 	eor.w	r6, fp, r2
c0de1df8:	0132      	lsls	r2, r6, #4
c0de1dfa:	ea40 7c16 	orr.w	ip, r0, r6, lsr #28
c0de1dfe:	ea42 7211 	orr.w	r2, r2, r1, lsr #28
c0de1e02:	ea2c 000a 	bic.w	r0, ip, sl
c0de1e06:	9252      	str	r2, [sp, #328]	@ 0x148
c0de1e08:	439a      	bics	r2, r3
c0de1e0a:	9b1d      	ldr	r3, [sp, #116]	@ 0x74
c0de1e0c:	ea84 0703 	eor.w	r7, r4, r3
c0de1e10:	9b1f      	ldr	r3, [sp, #124]	@ 0x7c
c0de1e12:	9c59      	ldr	r4, [sp, #356]	@ 0x164
c0de1e14:	0639      	lsls	r1, r7, #24
c0de1e16:	405c      	eors	r4, r3
c0de1e18:	0623      	lsls	r3, r4, #24
c0de1e1a:	ea41 2114 	orr.w	r1, r1, r4, lsr #8
c0de1e1e:	ea43 2317 	orr.w	r3, r3, r7, lsr #8
c0de1e22:	4048      	eors	r0, r1
c0de1e24:	405a      	eors	r2, r3
c0de1e26:	9034      	str	r0, [sp, #208]	@ 0xd0
c0de1e28:	ea25 0003 	bic.w	r0, r5, r3
c0de1e2c:	9d2f      	ldr	r5, [sp, #188]	@ 0xbc
c0de1e2e:	923a      	str	r2, [sp, #232]	@ 0xe8
c0de1e30:	9a3f      	ldr	r2, [sp, #252]	@ 0xfc
c0de1e32:	ea8e 0402 	eor.w	r4, lr, r2
c0de1e36:	9a3c      	ldr	r2, [sp, #240]	@ 0xf0
c0de1e38:	ea88 0602 	eor.w	r6, r8, r2
c0de1e3c:	9a19      	ldr	r2, [sp, #100]	@ 0x64
c0de1e3e:	03f7      	lsls	r7, r6, #15
c0de1e40:	ea47 4754 	orr.w	r7, r7, r4, lsr #17
c0de1e44:	03e4      	lsls	r4, r4, #15
c0de1e46:	4078      	eors	r0, r7
c0de1e48:	ea44 4456 	orr.w	r4, r4, r6, lsr #17
c0de1e4c:	9e40      	ldr	r6, [sp, #256]	@ 0x100
c0de1e4e:	9047      	str	r0, [sp, #284]	@ 0x11c
c0de1e50:	ea2a 0001 	bic.w	r0, sl, r1
c0de1e54:	4060      	eors	r0, r4
c0de1e56:	903f      	str	r0, [sp, #252]	@ 0xfc
c0de1e58:	ea23 0007 	bic.w	r0, r3, r7
c0de1e5c:	ea85 0302 	eor.w	r3, r5, r2
c0de1e60:	9a57      	ldr	r2, [sp, #348]	@ 0x15c
c0de1e62:	4056      	eors	r6, r2
c0de1e64:	ea4f 2b86 	mov.w	fp, r6, lsl #10
c0de1e68:	ea4b 5b93 	orr.w	fp, fp, r3, lsr #22
c0de1e6c:	ea80 000b 	eor.w	r0, r0, fp
c0de1e70:	904a      	str	r0, [sp, #296]	@ 0x128
c0de1e72:	ea21 0004 	bic.w	r0, r1, r4
c0de1e76:	0299      	lsls	r1, r3, #10
c0de1e78:	9b52      	ldr	r3, [sp, #328]	@ 0x148
c0de1e7a:	ea41 5196 	orr.w	r1, r1, r6, lsr #22
c0de1e7e:	4048      	eors	r0, r1
c0de1e80:	9042      	str	r0, [sp, #264]	@ 0x108
c0de1e82:	ea27 000b 	bic.w	r0, r7, fp
c0de1e86:	4058      	eors	r0, r3
c0de1e88:	903e      	str	r0, [sp, #248]	@ 0xf8
c0de1e8a:	ea24 0001 	bic.w	r0, r4, r1
c0de1e8e:	9c14      	ldr	r4, [sp, #80]	@ 0x50
c0de1e90:	ea80 000c 	eor.w	r0, r0, ip
c0de1e94:	9036      	str	r0, [sp, #216]	@ 0xd8
c0de1e96:	ea2b 0003 	bic.w	r0, fp, r3
c0de1e9a:	9b50      	ldr	r3, [sp, #320]	@ 0x140
c0de1e9c:	f8dd b16c 	ldr.w	fp, [sp, #364]	@ 0x16c
c0de1ea0:	4058      	eors	r0, r3
c0de1ea2:	9b58      	ldr	r3, [sp, #352]	@ 0x160
c0de1ea4:	903c      	str	r0, [sp, #240]	@ 0xf0
c0de1ea6:	ea21 000c 	bic.w	r0, r1, ip
c0de1eaa:	9941      	ldr	r1, [sp, #260]	@ 0x104
c0de1eac:	ea80 000a 	eor.w	r0, r0, sl
c0de1eb0:	ea83 0704 	eor.w	r7, r3, r4
c0de1eb4:	9b30      	ldr	r3, [sp, #192]	@ 0xc0
c0de1eb6:	9c55      	ldr	r4, [sp, #340]	@ 0x154
c0de1eb8:	9035      	str	r0, [sp, #212]	@ 0xd4
c0de1eba:	9838      	ldr	r0, [sp, #224]	@ 0xe0
c0de1ebc:	ea82 0c01 	eor.w	ip, r2, r1
c0de1ec0:	ea4f 024c 	mov.w	r2, ip, lsl #1
c0de1ec4:	4063      	eors	r3, r4
c0de1ec6:	4068      	eors	r0, r5
c0de1ec8:	049c      	lsls	r4, r3, #18
c0de1eca:	ea42 75d0 	orr.w	r5, r2, r0, lsr #31
c0de1ece:	9a15      	ldr	r2, [sp, #84]	@ 0x54
c0de1ed0:	ea44 3497 	orr.w	r4, r4, r7, lsr #14
c0de1ed4:	0040      	lsls	r0, r0, #1
c0de1ed6:	ea40 7adc 	orr.w	sl, r0, ip, lsr #31
c0de1eda:	f8dd c0b8 	ldr.w	ip, [sp, #184]	@ 0xb8
c0de1ede:	9546      	str	r5, [sp, #280]	@ 0x118
c0de1ee0:	ea8e 0102 	eor.w	r1, lr, r2
c0de1ee4:	9a16      	ldr	r2, [sp, #88]	@ 0x58
c0de1ee6:	0188      	lsls	r0, r1, #6
c0de1ee8:	ea88 0602 	eor.w	r6, r8, r2
c0de1eec:	f8dd 80b4 	ldr.w	r8, [sp, #180]	@ 0xb4
c0de1ef0:	01b2      	lsls	r2, r6, #6
c0de1ef2:	ea40 6e96 	orr.w	lr, r0, r6, lsr #26
c0de1ef6:	ea42 6291 	orr.w	r2, r2, r1, lsr #26
c0de1efa:	04b9      	lsls	r1, r7, #18
c0de1efc:	ea2e 000a 	bic.w	r0, lr, sl
c0de1f00:	924c      	str	r2, [sp, #304]	@ 0x130
c0de1f02:	43aa      	bics	r2, r5
c0de1f04:	ea41 3193 	orr.w	r1, r1, r3, lsr #14
c0de1f08:	4062      	eors	r2, r4
c0de1f0a:	4048      	eors	r0, r1
c0de1f0c:	9255      	str	r2, [sp, #340]	@ 0x154
c0de1f0e:	9a32      	ldr	r2, [sp, #200]	@ 0xc8
c0de1f10:	9050      	str	r0, [sp, #320]	@ 0x140
c0de1f12:	ea25 0004 	bic.w	r0, r5, r4
c0de1f16:	9d59      	ldr	r5, [sp, #356]	@ 0x164
c0de1f18:	ea8c 0302 	eor.w	r3, ip, r2
c0de1f1c:	9a18      	ldr	r2, [sp, #96]	@ 0x60
c0de1f1e:	ea88 0602 	eor.w	r6, r8, r2
c0de1f22:	0237      	lsls	r7, r6, #8
c0de1f24:	ea47 6713 	orr.w	r7, r7, r3, lsr #24
c0de1f28:	021b      	lsls	r3, r3, #8
c0de1f2a:	4078      	eors	r0, r7
c0de1f2c:	ea43 6316 	orr.w	r3, r3, r6, lsr #24
c0de1f30:	ea24 0207 	bic.w	r2, r4, r7
c0de1f34:	9052      	str	r0, [sp, #328]	@ 0x148
c0de1f36:	ea2a 0001 	bic.w	r0, sl, r1
c0de1f3a:	4399      	bics	r1, r3
c0de1f3c:	4058      	eors	r0, r3
c0de1f3e:	904e      	str	r0, [sp, #312]	@ 0x138
c0de1f40:	9824      	ldr	r0, [sp, #144]	@ 0x90
c0de1f42:	ea85 0400 	eor.w	r4, r5, r0
c0de1f46:	9821      	ldr	r0, [sp, #132]	@ 0x84
c0de1f48:	ea8b 0600 	eor.w	r6, fp, r0
c0de1f4c:	0670      	lsls	r0, r6, #25
c0de1f4e:	ea40 10d4 	orr.w	r0, r0, r4, lsr #7
c0de1f52:	0664      	lsls	r4, r4, #25
c0de1f54:	4042      	eors	r2, r0
c0de1f56:	ea44 14d6 	orr.w	r4, r4, r6, lsr #7
c0de1f5a:	9249      	str	r2, [sp, #292]	@ 0x124
c0de1f5c:	4061      	eors	r1, r4
c0de1f5e:	9a4c      	ldr	r2, [sp, #304]	@ 0x130
c0de1f60:	9141      	str	r1, [sp, #260]	@ 0x104
c0de1f62:	ea27 0100 	bic.w	r1, r7, r0
c0de1f66:	4051      	eors	r1, r2
c0de1f68:	4390      	bics	r0, r2
c0de1f6a:	914b      	str	r1, [sp, #300]	@ 0x12c
c0de1f6c:	ea23 0104 	bic.w	r1, r3, r4
c0de1f70:	9b37      	ldr	r3, [sp, #220]	@ 0xdc
c0de1f72:	ea81 010e 	eor.w	r1, r1, lr
c0de1f76:	9144      	str	r1, [sp, #272]	@ 0x110
c0de1f78:	9946      	ldr	r1, [sp, #280]	@ 0x118
c0de1f7a:	4048      	eors	r0, r1
c0de1f7c:	9920      	ldr	r1, [sp, #128]	@ 0x80
c0de1f7e:	9046      	str	r0, [sp, #280]	@ 0x118
c0de1f80:	ea24 000e 	bic.w	r0, r4, lr
c0de1f84:	9c5c      	ldr	r4, [sp, #368]	@ 0x170
c0de1f86:	ea80 000a 	eor.w	r0, r0, sl
c0de1f8a:	ea8b 0e01 	eor.w	lr, fp, r1
c0de1f8e:	9040      	str	r0, [sp, #256]	@ 0x100
c0de1f90:	9823      	ldr	r0, [sp, #140]	@ 0x8c
c0de1f92:	ea4f 720e 	mov.w	r2, lr, lsl #28
c0de1f96:	ea84 0703 	eor.w	r7, r4, r3
c0de1f9a:	9b31      	ldr	r3, [sp, #196]	@ 0xc4
c0de1f9c:	9c5a      	ldr	r4, [sp, #360]	@ 0x168
c0de1f9e:	4068      	eors	r0, r5
c0de1fa0:	4063      	eors	r3, r4
c0de1fa2:	ea42 1610 	orr.w	r6, r2, r0, lsr #4
c0de1fa6:	9a3b      	ldr	r2, [sp, #236]	@ 0xec
c0de1fa8:	075c      	lsls	r4, r3, #29
c0de1faa:	0700      	lsls	r0, r0, #28
c0de1fac:	ea44 04d7 	orr.w	r4, r4, r7, lsr #3
c0de1fb0:	ea40 1e1e 	orr.w	lr, r0, lr, lsr #4
c0de1fb4:	9624      	str	r6, [sp, #144]	@ 0x90
c0de1fb6:	ea8c 0502 	eor.w	r5, ip, r2
c0de1fba:	9a39      	ldr	r2, [sp, #228]	@ 0xe4
c0de1fbc:	f8dd c0c0 	ldr.w	ip, [sp, #192]	@ 0xc0
c0de1fc0:	0528      	lsls	r0, r5, #20
c0de1fc2:	ea88 0102 	eor.w	r1, r8, r2
c0de1fc6:	f8dd 80bc 	ldr.w	r8, [sp, #188]	@ 0xbc
c0de1fca:	050a      	lsls	r2, r1, #20
c0de1fcc:	ea42 3a15 	orr.w	sl, r2, r5, lsr #12
c0de1fd0:	ea40 3511 	orr.w	r5, r0, r1, lsr #12
c0de1fd4:	0779      	lsls	r1, r7, #29
c0de1fd6:	ea2a 0206 	bic.w	r2, sl, r6
c0de1fda:	ea41 01d3 	orr.w	r1, r1, r3, lsr #3
c0de1fde:	9b57      	ldr	r3, [sp, #348]	@ 0x15c
c0de1fe0:	ea25 000e 	bic.w	r0, r5, lr
c0de1fe4:	4062      	eors	r2, r4
c0de1fe6:	4048      	eors	r0, r1
c0de1fe8:	923b      	str	r2, [sp, #236]	@ 0xec
c0de1fea:	9a3d      	ldr	r2, [sp, #244]	@ 0xf4
c0de1fec:	9039      	str	r0, [sp, #228]	@ 0xe4
c0de1fee:	ea26 0004 	bic.w	r0, r6, r4
c0de1ff2:	4053      	eors	r3, r2
c0de1ff4:	9a45      	ldr	r2, [sp, #276]	@ 0x114
c0de1ff6:	ea88 0602 	eor.w	r6, r8, r2
c0de1ffa:	9a58      	ldr	r2, [sp, #352]	@ 0x160
c0de1ffc:	0377      	lsls	r7, r6, #13
c0de1ffe:	ea47 47d3 	orr.w	r7, r7, r3, lsr #19
c0de2002:	035b      	lsls	r3, r3, #13
c0de2004:	4078      	eors	r0, r7
c0de2006:	ea43 43d6 	orr.w	r3, r3, r6, lsr #19
c0de200a:	ea24 0b07 	bic.w	fp, r4, r7
c0de200e:	904c      	str	r0, [sp, #304]	@ 0x130
c0de2010:	ea2e 0001 	bic.w	r0, lr, r1
c0de2014:	4399      	bics	r1, r3
c0de2016:	4058      	eors	r0, r3
c0de2018:	9045      	str	r0, [sp, #276]	@ 0x114
c0de201a:	9833      	ldr	r0, [sp, #204]	@ 0xcc
c0de201c:	ea82 0400 	eor.w	r4, r2, r0
c0de2020:	9817      	ldr	r0, [sp, #92]	@ 0x5c
c0de2022:	ea8c 0600 	eor.w	r6, ip, r0
c0de2026:	00f0      	lsls	r0, r6, #3
c0de2028:	ea40 7054 	orr.w	r0, r0, r4, lsr #29
c0de202c:	00e4      	lsls	r4, r4, #3
c0de202e:	ea44 7456 	orr.w	r4, r4, r6, lsr #29
c0de2032:	ea8b 0200 	eor.w	r2, fp, r0
c0de2036:	4061      	eors	r1, r4
c0de2038:	9238      	str	r2, [sp, #224]	@ 0xe0
c0de203a:	9137      	str	r1, [sp, #220]	@ 0xdc
c0de203c:	ea27 0100 	bic.w	r1, r7, r0
c0de2040:	ea20 000a 	bic.w	r0, r0, sl
c0de2044:	ea81 010a 	eor.w	r1, r1, sl
c0de2048:	9132      	str	r1, [sp, #200]	@ 0xc8
c0de204a:	ea23 0104 	bic.w	r1, r3, r4
c0de204e:	4069      	eors	r1, r5
c0de2050:	9131      	str	r1, [sp, #196]	@ 0xc4
c0de2052:	9924      	ldr	r1, [sp, #144]	@ 0x90
c0de2054:	4048      	eors	r0, r1
c0de2056:	992e      	ldr	r1, [sp, #184]	@ 0xb8
c0de2058:	903d      	str	r0, [sp, #244]	@ 0xf4
c0de205a:	ea24 0005 	bic.w	r0, r4, r5
c0de205e:	ea80 000e 	eor.w	r0, r0, lr
c0de2062:	9033      	str	r0, [sp, #204]	@ 0xcc
c0de2064:	9829      	ldr	r0, [sp, #164]	@ 0xa4
c0de2066:	ea81 0200 	eor.w	r2, r1, r0
c0de206a:	981e      	ldr	r0, [sp, #120]	@ 0x78
c0de206c:	992d      	ldr	r1, [sp, #180]	@ 0xb4
c0de206e:	ea81 0300 	eor.w	r3, r1, r0
c0de2072:	9957      	ldr	r1, [sp, #348]	@ 0x15c
c0de2074:	0398      	lsls	r0, r3, #14
c0de2076:	ea40 4492 	orr.w	r4, r0, r2, lsr #18
c0de207a:	9822      	ldr	r0, [sp, #136]	@ 0x88
c0de207c:	0392      	lsls	r2, r2, #14
c0de207e:	ea42 4293 	orr.w	r2, r2, r3, lsr #18
c0de2082:	ea81 0500 	eor.w	r5, r1, r0
c0de2086:	982b      	ldr	r0, [sp, #172]	@ 0xac
c0de2088:	9958      	ldr	r1, [sp, #352]	@ 0x160
c0de208a:	032b      	lsls	r3, r5, #12
c0de208c:	ea88 0600 	eor.w	r6, r8, r0
c0de2090:	0330      	lsls	r0, r6, #12
c0de2092:	ea40 5a15 	orr.w	sl, r0, r5, lsr #20
c0de2096:	981a      	ldr	r0, [sp, #104]	@ 0x68
c0de2098:	ea43 5516 	orr.w	r5, r3, r6, lsr #20
c0de209c:	ea80 080c 	eor.w	r8, r0, ip
c0de20a0:	981b      	ldr	r0, [sp, #108]	@ 0x6c
c0de20a2:	ea2a 0708 	bic.w	r7, sl, r8
c0de20a6:	ea80 0b01 	eor.w	fp, r0, r1
c0de20aa:	9959      	ldr	r1, [sp, #356]	@ 0x164
c0de20ac:	ea84 0e07 	eor.w	lr, r4, r7
c0de20b0:	ea25 060b 	bic.w	r6, r5, fp
c0de20b4:	ea82 0006 	eor.w	r0, r2, r6
c0de20b8:	9058      	str	r0, [sp, #352]	@ 0x160
c0de20ba:	9826      	ldr	r0, [sp, #152]	@ 0x98
c0de20bc:	ea81 0600 	eor.w	r6, r1, r0
c0de20c0:	9825      	ldr	r0, [sp, #148]	@ 0x94
c0de20c2:	995b      	ldr	r1, [sp, #364]	@ 0x16c
c0de20c4:	ea81 0700 	eor.w	r7, r1, r0
c0de20c8:	ea28 0104 	bic.w	r1, r8, r4
c0de20cc:	0578      	lsls	r0, r7, #21
c0de20ce:	ea40 20d6 	orr.w	r0, r0, r6, lsr #11
c0de20d2:	4041      	eors	r1, r0
c0de20d4:	ea24 0c00 	bic.w	ip, r4, r0
c0de20d8:	9c5c      	ldr	r4, [sp, #368]	@ 0x170
c0de20da:	9130      	str	r1, [sp, #192]	@ 0xc0
c0de20dc:	0571      	lsls	r1, r6, #21
c0de20de:	ea2b 0602 	bic.w	r6, fp, r2
c0de20e2:	ea41 21d7 	orr.w	r1, r1, r7, lsr #11
c0de20e6:	ea86 0301 	eor.w	r3, r6, r1
c0de20ea:	438a      	bics	r2, r1
c0de20ec:	932e      	str	r3, [sp, #184]	@ 0xb8
c0de20ee:	9b28      	ldr	r3, [sp, #160]	@ 0xa0
c0de20f0:	ea84 0603 	eor.w	r6, r4, r3
c0de20f4:	9b1c      	ldr	r3, [sp, #112]	@ 0x70
c0de20f6:	9c5a      	ldr	r4, [sp, #360]	@ 0x168
c0de20f8:	ea84 0703 	eor.w	r7, r4, r3
c0de20fc:	02fc      	lsls	r4, r7, #11
c0de20fe:	ea44 5456 	orr.w	r4, r4, r6, lsr #21
c0de2102:	02f6      	lsls	r6, r6, #11
c0de2104:	ea8c 0304 	eor.w	r3, ip, r4
c0de2108:	ea46 5657 	orr.w	r6, r6, r7, lsr #21
c0de210c:	43a0      	bics	r0, r4
c0de210e:	935c      	str	r3, [sp, #368]	@ 0x170
c0de2110:	4072      	eors	r2, r6
c0de2112:	ea8a 0300 	eor.w	r3, sl, r0
c0de2116:	ea21 0006 	bic.w	r0, r1, r6
c0de211a:	9259      	str	r2, [sp, #356]	@ 0x164
c0de211c:	ea85 0200 	eor.w	r2, r5, r0
c0de2120:	ea24 000a 	bic.w	r0, r4, sl
c0de2124:	9c5d      	ldr	r4, [sp, #372]	@ 0x174
c0de2126:	6861      	ldr	r1, [r4, #4]
c0de2128:	ea81 0108 	eor.w	r1, r1, r8
c0de212c:	4048      	eors	r0, r1
c0de212e:	f854 1b10 	ldr.w	r1, [r4], #16
c0de2132:	905b      	str	r0, [sp, #364]	@ 0x16c
c0de2134:	ea26 0005 	bic.w	r0, r6, r5
c0de2138:	ea81 010b 	eor.w	r1, r1, fp
c0de213c:	945d      	str	r4, [sp, #372]	@ 0x174
c0de213e:	4048      	eors	r0, r1
c0de2140:	905a      	str	r0, [sp, #360]	@ 0x168
c0de2142:	9827      	ldr	r0, [sp, #156]	@ 0x9c
c0de2144:	3002      	adds	r0, #2
c0de2146:	f7ff b9a9 	b.w	c0de149c <KeccakF1600_StatePermute+0xfc>
c0de214a:	9800      	ldr	r0, [sp, #0]
c0de214c:	9953      	ldr	r1, [sp, #332]	@ 0x14c
c0de214e:	f8c0 10c0 	str.w	r1, [r0, #192]	@ 0xc0
c0de2152:	9951      	ldr	r1, [sp, #324]	@ 0x144
c0de2154:	6082      	str	r2, [r0, #8]
c0de2156:	f8c0 e024 	str.w	lr, [r0, #36]	@ 0x24
c0de215a:	60c3      	str	r3, [r0, #12]
c0de215c:	f8c0 10b8 	str.w	r1, [r0, #184]	@ 0xb8
c0de2160:	9943      	ldr	r1, [sp, #268]	@ 0x10c
c0de2162:	f8c0 10b0 	str.w	r1, [r0, #176]	@ 0xb0
c0de2166:	9948      	ldr	r1, [sp, #288]	@ 0x120
c0de2168:	f8c0 10a8 	str.w	r1, [r0, #168]	@ 0xa8
c0de216c:	992a      	ldr	r1, [sp, #168]	@ 0xa8
c0de216e:	f8c0 10a0 	str.w	r1, [r0, #160]	@ 0xa0
c0de2172:	9934      	ldr	r1, [sp, #208]	@ 0xd0
c0de2174:	f8c0 1098 	str.w	r1, [r0, #152]	@ 0x98
c0de2178:	993f      	ldr	r1, [sp, #252]	@ 0xfc
c0de217a:	f8c0 1090 	str.w	r1, [r0, #144]	@ 0x90
c0de217e:	9942      	ldr	r1, [sp, #264]	@ 0x108
c0de2180:	f8c0 1088 	str.w	r1, [r0, #136]	@ 0x88
c0de2184:	9936      	ldr	r1, [sp, #216]	@ 0xd8
c0de2186:	f8c0 1080 	str.w	r1, [r0, #128]	@ 0x80
c0de218a:	9935      	ldr	r1, [sp, #212]	@ 0xd4
c0de218c:	6781      	str	r1, [r0, #120]	@ 0x78
c0de218e:	9950      	ldr	r1, [sp, #320]	@ 0x140
c0de2190:	6701      	str	r1, [r0, #112]	@ 0x70
c0de2192:	994e      	ldr	r1, [sp, #312]	@ 0x138
c0de2194:	6681      	str	r1, [r0, #104]	@ 0x68
c0de2196:	9941      	ldr	r1, [sp, #260]	@ 0x104
c0de2198:	6601      	str	r1, [r0, #96]	@ 0x60
c0de219a:	9944      	ldr	r1, [sp, #272]	@ 0x110
c0de219c:	6581      	str	r1, [r0, #88]	@ 0x58
c0de219e:	9940      	ldr	r1, [sp, #256]	@ 0x100
c0de21a0:	6501      	str	r1, [r0, #80]	@ 0x50
c0de21a2:	9939      	ldr	r1, [sp, #228]	@ 0xe4
c0de21a4:	6481      	str	r1, [r0, #72]	@ 0x48
c0de21a6:	9945      	ldr	r1, [sp, #276]	@ 0x114
c0de21a8:	6401      	str	r1, [r0, #64]	@ 0x40
c0de21aa:	9937      	ldr	r1, [sp, #220]	@ 0xdc
c0de21ac:	6381      	str	r1, [r0, #56]	@ 0x38
c0de21ae:	9931      	ldr	r1, [sp, #196]	@ 0xc4
c0de21b0:	6301      	str	r1, [r0, #48]	@ 0x30
c0de21b2:	9933      	ldr	r1, [sp, #204]	@ 0xcc
c0de21b4:	6281      	str	r1, [r0, #40]	@ 0x28
c0de21b6:	9958      	ldr	r1, [sp, #352]	@ 0x160
c0de21b8:	6201      	str	r1, [r0, #32]
c0de21ba:	992e      	ldr	r1, [sp, #184]	@ 0xb8
c0de21bc:	6181      	str	r1, [r0, #24]
c0de21be:	9959      	ldr	r1, [sp, #356]	@ 0x164
c0de21c0:	6101      	str	r1, [r0, #16]
c0de21c2:	995a      	ldr	r1, [sp, #360]	@ 0x168
c0de21c4:	6001      	str	r1, [r0, #0]
c0de21c6:	9956      	ldr	r1, [sp, #344]	@ 0x158
c0de21c8:	f8c0 10c4 	str.w	r1, [r0, #196]	@ 0xc4
c0de21cc:	9954      	ldr	r1, [sp, #336]	@ 0x150
c0de21ce:	f8c0 10bc 	str.w	r1, [r0, #188]	@ 0xbc
c0de21d2:	994d      	ldr	r1, [sp, #308]	@ 0x134
c0de21d4:	f8c0 10b4 	str.w	r1, [r0, #180]	@ 0xb4
c0de21d8:	994f      	ldr	r1, [sp, #316]	@ 0x13c
c0de21da:	f8c0 10ac 	str.w	r1, [r0, #172]	@ 0xac
c0de21de:	992c      	ldr	r1, [sp, #176]	@ 0xb0
c0de21e0:	f8c0 10a4 	str.w	r1, [r0, #164]	@ 0xa4
c0de21e4:	993a      	ldr	r1, [sp, #232]	@ 0xe8
c0de21e6:	f8c0 109c 	str.w	r1, [r0, #156]	@ 0x9c
c0de21ea:	9947      	ldr	r1, [sp, #284]	@ 0x11c
c0de21ec:	f8c0 1094 	str.w	r1, [r0, #148]	@ 0x94
c0de21f0:	994a      	ldr	r1, [sp, #296]	@ 0x128
c0de21f2:	f8c0 108c 	str.w	r1, [r0, #140]	@ 0x8c
c0de21f6:	993e      	ldr	r1, [sp, #248]	@ 0xf8
c0de21f8:	f8c0 1084 	str.w	r1, [r0, #132]	@ 0x84
c0de21fc:	993c      	ldr	r1, [sp, #240]	@ 0xf0
c0de21fe:	67c1      	str	r1, [r0, #124]	@ 0x7c
c0de2200:	9955      	ldr	r1, [sp, #340]	@ 0x154
c0de2202:	6741      	str	r1, [r0, #116]	@ 0x74
c0de2204:	9952      	ldr	r1, [sp, #328]	@ 0x148
c0de2206:	66c1      	str	r1, [r0, #108]	@ 0x6c
c0de2208:	9949      	ldr	r1, [sp, #292]	@ 0x124
c0de220a:	6641      	str	r1, [r0, #100]	@ 0x64
c0de220c:	994b      	ldr	r1, [sp, #300]	@ 0x12c
c0de220e:	65c1      	str	r1, [r0, #92]	@ 0x5c
c0de2210:	9946      	ldr	r1, [sp, #280]	@ 0x118
c0de2212:	6541      	str	r1, [r0, #84]	@ 0x54
c0de2214:	993b      	ldr	r1, [sp, #236]	@ 0xec
c0de2216:	64c1      	str	r1, [r0, #76]	@ 0x4c
c0de2218:	994c      	ldr	r1, [sp, #304]	@ 0x130
c0de221a:	6441      	str	r1, [r0, #68]	@ 0x44
c0de221c:	9938      	ldr	r1, [sp, #224]	@ 0xe0
c0de221e:	63c1      	str	r1, [r0, #60]	@ 0x3c
c0de2220:	9932      	ldr	r1, [sp, #200]	@ 0xc8
c0de2222:	6341      	str	r1, [r0, #52]	@ 0x34
c0de2224:	993d      	ldr	r1, [sp, #244]	@ 0xf4
c0de2226:	62c1      	str	r1, [r0, #44]	@ 0x2c
c0de2228:	9930      	ldr	r1, [sp, #192]	@ 0xc0
c0de222a:	61c1      	str	r1, [r0, #28]
c0de222c:	995c      	ldr	r1, [sp, #368]	@ 0x170
c0de222e:	6141      	str	r1, [r0, #20]
c0de2230:	995b      	ldr	r1, [sp, #364]	@ 0x16c
c0de2232:	6041      	str	r1, [r0, #4]
c0de2234:	b05e      	add	sp, #376	@ 0x178
c0de2236:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de223a <store64>:
c0de223a:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de223c:	461c      	mov	r4, r3
c0de223e:	4615      	mov	r5, r2
c0de2240:	4606      	mov	r6, r0
c0de2242:	2700      	movs	r7, #0
c0de2244:	2f40      	cmp	r7, #64	@ 0x40
c0de2246:	bf08      	it	eq
c0de2248:	bdf8      	popeq	{r3, r4, r5, r6, r7, pc}
c0de224a:	4628      	mov	r0, r5
c0de224c:	4621      	mov	r1, r4
c0de224e:	463a      	mov	r2, r7
c0de2250:	f00a fe5e 	bl	c0decf10 <__aeabi_llsr>
c0de2254:	f806 0b01 	strb.w	r0, [r6], #1
c0de2258:	3708      	adds	r7, #8
c0de225a:	e7f3      	b.n	c0de2244 <store64+0xa>

c0de225c <OUTLINED_FUNCTION_0>:
c0de225c:	58b3      	ldr	r3, [r6, r2]
c0de225e:	4058      	eors	r0, r3
c0de2260:	50b0      	str	r0, [r6, r2]
c0de2262:	18b0      	adds	r0, r6, r2
c0de2264:	6842      	ldr	r2, [r0, #4]
c0de2266:	4051      	eors	r1, r2
c0de2268:	6041      	str	r1, [r0, #4]
c0de226a:	4770      	bx	lr

c0de226c <OUTLINED_FUNCTION_2>:
c0de226c:	58a3      	ldr	r3, [r4, r2]
c0de226e:	4058      	eors	r0, r3
c0de2270:	50a0      	str	r0, [r4, r2]
c0de2272:	18a0      	adds	r0, r4, r2
c0de2274:	6842      	ldr	r2, [r0, #4]
c0de2276:	4051      	eors	r1, r2
c0de2278:	6041      	str	r1, [r0, #4]
c0de227a:	4770      	bx	lr

c0de227c <OUTLINED_FUNCTION_3>:
c0de227c:	f8c4 00c8 	str.w	r0, [r4, #200]	@ 0xc8
c0de2280:	bd1c      	pop	{r2, r3, r4, pc}

c0de2282 <keccak_init>:
c0de2282:	2106      	movs	r1, #6
c0de2284:	2220      	movs	r2, #32
c0de2286:	f00a ba04 	b.w	c0dec692 <cx_hash_init_ex>

c0de228a <keccak_update>:
c0de228a:	f00a ba07 	b.w	c0dec69c <cx_hash_update>

c0de228e <keccak_final>:
c0de228e:	f00a b9fb 	b.w	c0dec688 <cx_hash_final>

c0de2292 <inner_keccak256_init>:
c0de2292:	b160      	cbz	r0, c0de22ae <inner_keccak256_init+0x1c>
c0de2294:	b510      	push	{r4, lr}
c0de2296:	212c      	movs	r1, #44	@ 0x2c
c0de2298:	4604      	mov	r4, r0
c0de229a:	f00a ff39 	bl	c0ded110 <__aeabi_memclr>
c0de229e:	f104 0030 	add.w	r0, r4, #48	@ 0x30
c0de22a2:	f7ff ffee 	bl	c0de2282 <keccak_init>
c0de22a6:	2000      	movs	r0, #0
c0de22a8:	e9c4 007e 	strd	r0, r0, [r4, #504]	@ 0x1f8
c0de22ac:	bd10      	pop	{r4, pc}
c0de22ae:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de22b2:	4770      	bx	lr

c0de22b4 <inner_keccak256_inject>:
c0de22b4:	b580      	push	{r7, lr}
c0de22b6:	4603      	mov	r3, r0
c0de22b8:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de22bc:	b15b      	cbz	r3, c0de22d6 <inner_keccak256_inject+0x22>
c0de22be:	b151      	cbz	r1, c0de22d6 <inner_keccak256_inject+0x22>
c0de22c0:	6a98      	ldr	r0, [r3, #40]	@ 0x28
c0de22c2:	b110      	cbz	r0, c0de22ca <inner_keccak256_inject+0x16>
c0de22c4:	f06f 0001 	mvn.w	r0, #1
c0de22c8:	bd80      	pop	{r7, pc}
c0de22ca:	f103 0030 	add.w	r0, r3, #48	@ 0x30
c0de22ce:	b292      	uxth	r2, r2
c0de22d0:	f7ff ffdb 	bl	c0de228a <keccak_update>
c0de22d4:	2000      	movs	r0, #0
c0de22d6:	bd80      	pop	{r7, pc}

c0de22d8 <inner_keccak256_flip>:
c0de22d8:	b510      	push	{r4, lr}
c0de22da:	b128      	cbz	r0, c0de22e8 <inner_keccak256_flip+0x10>
c0de22dc:	4604      	mov	r4, r0
c0de22de:	6a80      	ldr	r0, [r0, #40]	@ 0x28
c0de22e0:	b128      	cbz	r0, c0de22ee <inner_keccak256_flip+0x16>
c0de22e2:	f06f 0001 	mvn.w	r0, #1
c0de22e6:	bd10      	pop	{r4, pc}
c0de22e8:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de22ec:	bd10      	pop	{r4, pc}
c0de22ee:	f104 0030 	add.w	r0, r4, #48	@ 0x30
c0de22f2:	4621      	mov	r1, r4
c0de22f4:	f7ff ffcb 	bl	c0de228e <keccak_final>
c0de22f8:	2000      	movs	r0, #0
c0de22fa:	2101      	movs	r1, #1
c0de22fc:	e9c4 007e 	strd	r0, r0, [r4, #504]	@ 0x1f8
c0de2300:	62a1      	str	r1, [r4, #40]	@ 0x28
c0de2302:	bd10      	pop	{r4, pc}

c0de2304 <inner_keccak256_extract>:
c0de2304:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de2308:	b0f8      	sub	sp, #480	@ 0x1e0
c0de230a:	4682      	mov	sl, r0
c0de230c:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de2310:	f1ba 0f00 	cmp.w	sl, #0
c0de2314:	d020      	beq.n	c0de2358 <inner_keccak256_extract+0x54>
c0de2316:	460e      	mov	r6, r1
c0de2318:	b1f1      	cbz	r1, c0de2358 <inner_keccak256_extract+0x54>
c0de231a:	f8da 0028 	ldr.w	r0, [sl, #40]	@ 0x28
c0de231e:	b1c8      	cbz	r0, c0de2354 <inner_keccak256_extract+0x50>
c0de2320:	e9da 017e 	ldrd	r0, r1, [sl, #504]	@ 0x1f8
c0de2324:	4615      	mov	r5, r2
c0de2326:	4281      	cmp	r1, r0
c0de2328:	d919      	bls.n	c0de235e <inner_keccak256_extract+0x5a>
c0de232a:	1a0c      	subs	r4, r1, r0
c0de232c:	4450      	add	r0, sl
c0de232e:	46a3      	mov	fp, r4
c0de2330:	42ac      	cmp	r4, r5
c0de2332:	f500 71ec 	add.w	r1, r0, #472	@ 0x1d8
c0de2336:	4630      	mov	r0, r6
c0de2338:	bf88      	it	hi
c0de233a:	46ab      	movhi	fp, r5
c0de233c:	465a      	mov	r2, fp
c0de233e:	f00a fedd 	bl	c0ded0fc <__aeabi_memcpy>
c0de2342:	f8da 01f8 	ldr.w	r0, [sl, #504]	@ 0x1f8
c0de2346:	42ac      	cmp	r4, r5
c0de2348:	4458      	add	r0, fp
c0de234a:	f8ca 01f8 	str.w	r0, [sl, #504]	@ 0x1f8
c0de234e:	d308      	bcc.n	c0de2362 <inner_keccak256_extract+0x5e>
c0de2350:	2000      	movs	r0, #0
c0de2352:	e001      	b.n	c0de2358 <inner_keccak256_extract+0x54>
c0de2354:	f06f 0001 	mvn.w	r0, #1
c0de2358:	b078      	add	sp, #480	@ 0x1e0
c0de235a:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de235e:	f04f 0b00 	mov.w	fp, #0
c0de2362:	ac6e      	add	r4, sp, #440	@ 0x1b8
c0de2364:	9503      	str	r5, [sp, #12]
c0de2366:	f104 0020 	add.w	r0, r4, #32
c0de236a:	9002      	str	r0, [sp, #8]
c0de236c:	f50a 70ec 	add.w	r0, sl, #472	@ 0x1d8
c0de2370:	e9cd 0600 	strd	r0, r6, [sp]
c0de2374:	45ab      	cmp	fp, r5
c0de2376:	d2eb      	bcs.n	c0de2350 <inner_keccak256_extract+0x4c>
c0de2378:	4620      	mov	r0, r4
c0de237a:	4651      	mov	r1, sl
c0de237c:	2220      	movs	r2, #32
c0de237e:	46a0      	mov	r8, r4
c0de2380:	f00a febc 	bl	c0ded0fc <__aeabi_memcpy>
c0de2384:	e9da 5408 	ldrd	r5, r4, [sl, #32]
c0de2388:	9f02      	ldr	r7, [sp, #8]
c0de238a:	2638      	movs	r6, #56	@ 0x38
c0de238c:	f116 0008 	adds.w	r0, r6, #8
c0de2390:	d008      	beq.n	c0de23a4 <inner_keccak256_extract+0xa0>
c0de2392:	4628      	mov	r0, r5
c0de2394:	4621      	mov	r1, r4
c0de2396:	4632      	mov	r2, r6
c0de2398:	f00a fdba 	bl	c0decf10 <__aeabi_llsr>
c0de239c:	f807 0b01 	strb.w	r0, [r7], #1
c0de23a0:	3e08      	subs	r6, #8
c0de23a2:	e7f3      	b.n	c0de238c <inner_keccak256_extract+0x88>
c0de23a4:	af04      	add	r7, sp, #16
c0de23a6:	4638      	mov	r0, r7
c0de23a8:	f7ff ff6b 	bl	c0de2282 <keccak_init>
c0de23ac:	4638      	mov	r0, r7
c0de23ae:	4641      	mov	r1, r8
c0de23b0:	2228      	movs	r2, #40	@ 0x28
c0de23b2:	4644      	mov	r4, r8
c0de23b4:	f7ff ff69 	bl	c0de228a <keccak_update>
c0de23b8:	9d03      	ldr	r5, [sp, #12]
c0de23ba:	eba5 080b 	sub.w	r8, r5, fp
c0de23be:	f1b8 0f1f 	cmp.w	r8, #31
c0de23c2:	d90b      	bls.n	c0de23dc <inner_keccak256_extract+0xd8>
c0de23c4:	9e01      	ldr	r6, [sp, #4]
c0de23c6:	4638      	mov	r0, r7
c0de23c8:	eb06 010b 	add.w	r1, r6, fp
c0de23cc:	f7ff ff5f 	bl	c0de228e <keccak_final>
c0de23d0:	f10b 0b20 	add.w	fp, fp, #32
c0de23d4:	f04f 0800 	mov.w	r8, #0
c0de23d8:	2000      	movs	r0, #0
c0de23da:	e00d      	b.n	c0de23f8 <inner_keccak256_extract+0xf4>
c0de23dc:	4638      	mov	r0, r7
c0de23de:	9f00      	ldr	r7, [sp, #0]
c0de23e0:	4639      	mov	r1, r7
c0de23e2:	f7ff ff54 	bl	c0de228e <keccak_final>
c0de23e6:	9e01      	ldr	r6, [sp, #4]
c0de23e8:	4639      	mov	r1, r7
c0de23ea:	4642      	mov	r2, r8
c0de23ec:	eb06 000b 	add.w	r0, r6, fp
c0de23f0:	f00a fe84 	bl	c0ded0fc <__aeabi_memcpy>
c0de23f4:	2020      	movs	r0, #32
c0de23f6:	46ab      	mov	fp, r5
c0de23f8:	e9ca 807e 	strd	r8, r0, [sl, #504]	@ 0x1f8
c0de23fc:	e9da 0108 	ldrd	r0, r1, [sl, #32]
c0de2400:	3001      	adds	r0, #1
c0de2402:	f141 0100 	adc.w	r1, r1, #0
c0de2406:	e9ca 0108 	strd	r0, r1, [sl, #32]
c0de240a:	e7b3      	b.n	c0de2374 <inner_keccak256_extract+0x70>

c0de240c <pqcrystals_dilithium2_lowram_pack_sig_h>:
c0de240c:	b5b0      	push	{r4, r5, r7, lr}
c0de240e:	f500 6012 	add.w	r0, r0, #2336	@ 0x920
c0de2412:	2400      	movs	r4, #0
c0de2414:	f5b4 7f80 	cmp.w	r4, #256	@ 0x100
c0de2418:	d009      	beq.n	c0de242e <pqcrystals_dilithium2_lowram_pack_sig_h+0x22>
c0de241a:	f851 5024 	ldr.w	r5, [r1, r4, lsl #2]
c0de241e:	b125      	cbz	r5, c0de242a <pqcrystals_dilithium2_lowram_pack_sig_h+0x1e>
c0de2420:	681d      	ldr	r5, [r3, #0]
c0de2422:	5544      	strb	r4, [r0, r5]
c0de2424:	681d      	ldr	r5, [r3, #0]
c0de2426:	3501      	adds	r5, #1
c0de2428:	601d      	str	r5, [r3, #0]
c0de242a:	3401      	adds	r4, #1
c0de242c:	e7f2      	b.n	c0de2414 <pqcrystals_dilithium2_lowram_pack_sig_h+0x8>
c0de242e:	6819      	ldr	r1, [r3, #0]
c0de2430:	4410      	add	r0, r2
c0de2432:	f880 1050 	strb.w	r1, [r0, #80]	@ 0x50
c0de2436:	bdb0      	pop	{r4, r5, r7, pc}

c0de2438 <pqcrystals_dilithium2_lowram_pack_sig_h_zero>:
c0de2438:	680a      	ldr	r2, [r1, #0]
c0de243a:	f500 6012 	add.w	r0, r0, #2336	@ 0x920
c0de243e:	2300      	movs	r3, #0
c0de2440:	2a4f      	cmp	r2, #79	@ 0x4f
c0de2442:	bf88      	it	hi
c0de2444:	4770      	bxhi	lr
c0de2446:	5483      	strb	r3, [r0, r2]
c0de2448:	680a      	ldr	r2, [r1, #0]
c0de244a:	3201      	adds	r2, #1
c0de244c:	600a      	str	r2, [r1, #0]
c0de244e:	e7f7      	b.n	c0de2440 <pqcrystals_dilithium2_lowram_pack_sig_h_zero+0x8>

c0de2450 <poly_challenge_compress>:
c0de2450:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de2454:	2200      	movs	r2, #0
c0de2456:	2300      	movs	r3, #0
c0de2458:	2b44      	cmp	r3, #68	@ 0x44
c0de245a:	d002      	beq.n	c0de2462 <poly_challenge_compress+0x12>
c0de245c:	54c2      	strb	r2, [r0, r3]
c0de245e:	3301      	adds	r3, #1
c0de2460:	e7fa      	b.n	c0de2458 <poly_challenge_compress+0x8>
c0de2462:	2200      	movs	r2, #0
c0de2464:	2301      	movs	r3, #1
c0de2466:	2600      	movs	r6, #0
c0de2468:	f04f 0800 	mov.w	r8, #0
c0de246c:	2500      	movs	r5, #0
c0de246e:	2700      	movs	r7, #0
c0de2470:	f5b2 7f80 	cmp.w	r2, #256	@ 0x100
c0de2474:	d011      	beq.n	c0de249a <poly_challenge_compress+0x4a>
c0de2476:	f851 4022 	ldr.w	r4, [r1, r2, lsl #2]
c0de247a:	b164      	cbz	r4, c0de2496 <poly_challenge_compress+0x46>
c0de247c:	5582      	strb	r2, [r0, r6]
c0de247e:	f851 4022 	ldr.w	r4, [r1, r2, lsl #2]
c0de2482:	3401      	adds	r4, #1
c0de2484:	bf04      	itt	eq
c0de2486:	433d      	orreq	r5, r7
c0de2488:	ea48 0803 	orreq.w	r8, r8, r3
c0de248c:	007c      	lsls	r4, r7, #1
c0de248e:	3601      	adds	r6, #1
c0de2490:	ea44 77d3 	orr.w	r7, r4, r3, lsr #31
c0de2494:	005b      	lsls	r3, r3, #1
c0de2496:	3201      	adds	r2, #1
c0de2498:	e7ea      	b.n	c0de2470 <poly_challenge_compress+0x20>
c0de249a:	f100 073c 	add.w	r7, r0, #60	@ 0x3c
c0de249e:	2600      	movs	r6, #0
c0de24a0:	2e40      	cmp	r6, #64	@ 0x40
c0de24a2:	bf08      	it	eq
c0de24a4:	e8bd 81f0 	ldmiaeq.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de24a8:	4640      	mov	r0, r8
c0de24aa:	4629      	mov	r1, r5
c0de24ac:	4632      	mov	r2, r6
c0de24ae:	f00a fd2f 	bl	c0decf10 <__aeabi_llsr>
c0de24b2:	f807 0b01 	strb.w	r0, [r7], #1
c0de24b6:	3608      	adds	r6, #8
c0de24b8:	e7f2      	b.n	c0de24a0 <poly_challenge_compress+0x50>

c0de24ba <poly_challenge_decompress>:
c0de24ba:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de24be:	4688      	mov	r8, r1
c0de24c0:	4682      	mov	sl, r0
c0de24c2:	2000      	movs	r0, #0
c0de24c4:	2100      	movs	r1, #0
c0de24c6:	f5b1 7f80 	cmp.w	r1, #256	@ 0x100
c0de24ca:	d003      	beq.n	c0de24d4 <poly_challenge_decompress+0x1a>
c0de24cc:	f84a 0021 	str.w	r0, [sl, r1, lsl #2]
c0de24d0:	3101      	adds	r1, #1
c0de24d2:	e7f8      	b.n	c0de24c6 <poly_challenge_decompress+0xc>
c0de24d4:	f108 053c 	add.w	r5, r8, #60	@ 0x3c
c0de24d8:	2600      	movs	r6, #0
c0de24da:	2700      	movs	r7, #0
c0de24dc:	2400      	movs	r4, #0
c0de24de:	2e40      	cmp	r6, #64	@ 0x40
c0de24e0:	d009      	beq.n	c0de24f6 <poly_challenge_decompress+0x3c>
c0de24e2:	f815 0b01 	ldrb.w	r0, [r5], #1
c0de24e6:	2100      	movs	r1, #0
c0de24e8:	4632      	mov	r2, r6
c0de24ea:	f00a fcff 	bl	c0deceec <__aeabi_llsl>
c0de24ee:	430c      	orrs	r4, r1
c0de24f0:	4307      	orrs	r7, r0
c0de24f2:	3608      	adds	r6, #8
c0de24f4:	e7f3      	b.n	c0de24de <poly_challenge_decompress+0x24>
c0de24f6:	2000      	movs	r0, #0
c0de24f8:	2827      	cmp	r0, #39	@ 0x27
c0de24fa:	bf08      	it	eq
c0de24fc:	e8bd 85f8 	ldmiaeq.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}
c0de2500:	07fa      	lsls	r2, r7, #31
c0de2502:	f818 1000 	ldrb.w	r1, [r8, r0]
c0de2506:	f04f 32ff 	mov.w	r2, #4294967295	@ 0xffffffff
c0de250a:	bf08      	it	eq
c0de250c:	2201      	moveq	r2, #1
c0de250e:	ea5f 0454 	movs.w	r4, r4, lsr #1
c0de2512:	f84a 2021 	str.w	r2, [sl, r1, lsl #2]
c0de2516:	ea4f 0737 	mov.w	r7, r7, rrx
c0de251a:	3001      	adds	r0, #1
c0de251c:	e7ec      	b.n	c0de24f8 <poly_challenge_decompress+0x3e>

c0de251e <poly_schoolbook>:
c0de251e:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de2522:	4614      	mov	r4, r2
c0de2524:	468a      	mov	sl, r1
c0de2526:	2200      	movs	r2, #0
c0de2528:	2100      	movs	r1, #0
c0de252a:	f5b1 7f80 	cmp.w	r1, #256	@ 0x100
c0de252e:	d003      	beq.n	c0de2538 <poly_schoolbook+0x1a>
c0de2530:	f840 2021 	str.w	r2, [r0, r1, lsl #2]
c0de2534:	3101      	adds	r1, #1
c0de2536:	e7f8      	b.n	c0de252a <poly_schoolbook+0xc>
c0de2538:	f10a 053c 	add.w	r5, sl, #60	@ 0x3c
c0de253c:	2700      	movs	r7, #0
c0de253e:	f04f 0b00 	mov.w	fp, #0
c0de2542:	2600      	movs	r6, #0
c0de2544:	9003      	str	r0, [sp, #12]
c0de2546:	2f40      	cmp	r7, #64	@ 0x40
c0de2548:	d006      	beq.n	c0de2558 <poly_schoolbook+0x3a>
c0de254a:	f000 fc0a 	bl	c0de2d62 <OUTLINED_FUNCTION_2>
c0de254e:	430e      	orrs	r6, r1
c0de2550:	ea4b 0b00 	orr.w	fp, fp, r0
c0de2554:	3708      	adds	r7, #8
c0de2556:	e7f6      	b.n	c0de2546 <poly_schoolbook+0x28>
c0de2558:	f04f 0800 	mov.w	r8, #0
c0de255c:	f8cd a004 	str.w	sl, [sp, #4]
c0de2560:	f1b8 0f27 	cmp.w	r8, #39	@ 0x27
c0de2564:	bf08      	it	eq
c0de2566:	e8bd 8dff 	ldmiaeq.w	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de256a:	f81a 0008 	ldrb.w	r0, [sl, r8]
c0de256e:	ea5f 71cb 	movs.w	r1, fp, lsl #31
c0de2572:	f5c0 7780 	rsb	r7, r0, #256	@ 0x100
c0de2576:	d111      	bne.n	c0de259c <poly_schoolbook+0x7e>
c0de2578:	9903      	ldr	r1, [sp, #12]
c0de257a:	9602      	str	r6, [sp, #8]
c0de257c:	2500      	movs	r5, #0
c0de257e:	eb01 0680 	add.w	r6, r1, r0, lsl #2
c0de2582:	42af      	cmp	r7, r5
c0de2584:	d01b      	beq.n	c0de25be <poly_schoolbook+0xa0>
c0de2586:	4620      	mov	r0, r4
c0de2588:	4629      	mov	r1, r5
c0de258a:	f000 f842 	bl	c0de2612 <polyt0_unpack_idx>
c0de258e:	f856 1025 	ldr.w	r1, [r6, r5, lsl #2]
c0de2592:	4408      	add	r0, r1
c0de2594:	f846 0025 	str.w	r0, [r6, r5, lsl #2]
c0de2598:	3501      	adds	r5, #1
c0de259a:	e7f2      	b.n	c0de2582 <poly_schoolbook+0x64>
c0de259c:	9903      	ldr	r1, [sp, #12]
c0de259e:	2500      	movs	r5, #0
c0de25a0:	eb01 0a80 	add.w	sl, r1, r0, lsl #2
c0de25a4:	42af      	cmp	r7, r5
c0de25a6:	d01b      	beq.n	c0de25e0 <poly_schoolbook+0xc2>
c0de25a8:	4620      	mov	r0, r4
c0de25aa:	4629      	mov	r1, r5
c0de25ac:	f000 f831 	bl	c0de2612 <polyt0_unpack_idx>
c0de25b0:	f85a 1025 	ldr.w	r1, [sl, r5, lsl #2]
c0de25b4:	1a08      	subs	r0, r1, r0
c0de25b6:	f84a 0025 	str.w	r0, [sl, r5, lsl #2]
c0de25ba:	3501      	adds	r5, #1
c0de25bc:	e7f2      	b.n	c0de25a4 <poly_schoolbook+0x86>
c0de25be:	f5a6 6580 	sub.w	r5, r6, #1024	@ 0x400
c0de25c2:	9e02      	ldr	r6, [sp, #8]
c0de25c4:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de25c8:	d01c      	beq.n	c0de2604 <poly_schoolbook+0xe6>
c0de25ca:	4620      	mov	r0, r4
c0de25cc:	4639      	mov	r1, r7
c0de25ce:	f000 f820 	bl	c0de2612 <polyt0_unpack_idx>
c0de25d2:	f855 1027 	ldr.w	r1, [r5, r7, lsl #2]
c0de25d6:	1a08      	subs	r0, r1, r0
c0de25d8:	f845 0027 	str.w	r0, [r5, r7, lsl #2]
c0de25dc:	3701      	adds	r7, #1
c0de25de:	e7f1      	b.n	c0de25c4 <poly_schoolbook+0xa6>
c0de25e0:	f5aa 6580 	sub.w	r5, sl, #1024	@ 0x400
c0de25e4:	f8dd a004 	ldr.w	sl, [sp, #4]
c0de25e8:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de25ec:	d00a      	beq.n	c0de2604 <poly_schoolbook+0xe6>
c0de25ee:	4620      	mov	r0, r4
c0de25f0:	4639      	mov	r1, r7
c0de25f2:	f000 f80e 	bl	c0de2612 <polyt0_unpack_idx>
c0de25f6:	f855 1027 	ldr.w	r1, [r5, r7, lsl #2]
c0de25fa:	4408      	add	r0, r1
c0de25fc:	f845 0027 	str.w	r0, [r5, r7, lsl #2]
c0de2600:	3701      	adds	r7, #1
c0de2602:	e7f1      	b.n	c0de25e8 <poly_schoolbook+0xca>
c0de2604:	ea5f 0656 	movs.w	r6, r6, lsr #1
c0de2608:	f108 0801 	add.w	r8, r8, #1
c0de260c:	ea4f 0b3b 	mov.w	fp, fp, rrx
c0de2610:	e7a6      	b.n	c0de2560 <poly_schoolbook+0x42>

c0de2612 <polyt0_unpack_idx>:
c0de2612:	08ca      	lsrs	r2, r1, #3
c0de2614:	230d      	movs	r3, #13
c0de2616:	f001 0107 	and.w	r1, r1, #7
c0de261a:	fb02 0003 	mla	r0, r2, r3, r0
c0de261e:	2906      	cmp	r1, #6
c0de2620:	d00e      	beq.n	c0de2640 <polyt0_unpack_idx+0x2e>
c0de2622:	2901      	cmp	r1, #1
c0de2624:	d014      	beq.n	c0de2650 <polyt0_unpack_idx+0x3e>
c0de2626:	2902      	cmp	r1, #2
c0de2628:	d01a      	beq.n	c0de2660 <polyt0_unpack_idx+0x4e>
c0de262a:	2903      	cmp	r1, #3
c0de262c:	d01d      	beq.n	c0de266a <polyt0_unpack_idx+0x58>
c0de262e:	2904      	cmp	r1, #4
c0de2630:	d023      	beq.n	c0de267a <polyt0_unpack_idx+0x68>
c0de2632:	2905      	cmp	r1, #5
c0de2634:	d029      	beq.n	c0de268a <polyt0_unpack_idx+0x78>
c0de2636:	bb69      	cbnz	r1, c0de2694 <polyt0_unpack_idx+0x82>
c0de2638:	7801      	ldrb	r1, [r0, #0]
c0de263a:	7840      	ldrb	r0, [r0, #1]
c0de263c:	0200      	lsls	r0, r0, #8
c0de263e:	e02d      	b.n	c0de269c <polyt0_unpack_idx+0x8a>
c0de2640:	7a82      	ldrb	r2, [r0, #10]
c0de2642:	7a41      	ldrb	r1, [r0, #9]
c0de2644:	7ac3      	ldrb	r3, [r0, #11]
c0de2646:	0090      	lsls	r0, r2, #2
c0de2648:	ea40 1091 	orr.w	r0, r0, r1, lsr #6
c0de264c:	0299      	lsls	r1, r3, #10
c0de264e:	e025      	b.n	c0de269c <polyt0_unpack_idx+0x8a>
c0de2650:	7882      	ldrb	r2, [r0, #2]
c0de2652:	7841      	ldrb	r1, [r0, #1]
c0de2654:	78c3      	ldrb	r3, [r0, #3]
c0de2656:	00d0      	lsls	r0, r2, #3
c0de2658:	ea40 1051 	orr.w	r0, r0, r1, lsr #5
c0de265c:	02d9      	lsls	r1, r3, #11
c0de265e:	e01d      	b.n	c0de269c <polyt0_unpack_idx+0x8a>
c0de2660:	78c1      	ldrb	r1, [r0, #3]
c0de2662:	7900      	ldrb	r0, [r0, #4]
c0de2664:	0180      	lsls	r0, r0, #6
c0de2666:	0889      	lsrs	r1, r1, #2
c0de2668:	e018      	b.n	c0de269c <polyt0_unpack_idx+0x8a>
c0de266a:	7942      	ldrb	r2, [r0, #5]
c0de266c:	7901      	ldrb	r1, [r0, #4]
c0de266e:	7983      	ldrb	r3, [r0, #6]
c0de2670:	0050      	lsls	r0, r2, #1
c0de2672:	ea40 10d1 	orr.w	r0, r0, r1, lsr #7
c0de2676:	0259      	lsls	r1, r3, #9
c0de2678:	e010      	b.n	c0de269c <polyt0_unpack_idx+0x8a>
c0de267a:	79c2      	ldrb	r2, [r0, #7]
c0de267c:	7981      	ldrb	r1, [r0, #6]
c0de267e:	7a03      	ldrb	r3, [r0, #8]
c0de2680:	0110      	lsls	r0, r2, #4
c0de2682:	ea40 1011 	orr.w	r0, r0, r1, lsr #4
c0de2686:	0319      	lsls	r1, r3, #12
c0de2688:	e008      	b.n	c0de269c <polyt0_unpack_idx+0x8a>
c0de268a:	7a01      	ldrb	r1, [r0, #8]
c0de268c:	7a40      	ldrb	r0, [r0, #9]
c0de268e:	01c0      	lsls	r0, r0, #7
c0de2690:	0849      	lsrs	r1, r1, #1
c0de2692:	e003      	b.n	c0de269c <polyt0_unpack_idx+0x8a>
c0de2694:	7ac1      	ldrb	r1, [r0, #11]
c0de2696:	7b00      	ldrb	r0, [r0, #12]
c0de2698:	0140      	lsls	r0, r0, #5
c0de269a:	08c9      	lsrs	r1, r1, #3
c0de269c:	4308      	orrs	r0, r1
c0de269e:	f36f 305f 	bfc	r0, #13, #19
c0de26a2:	f5c0 5080 	rsb	r0, r0, #4096	@ 0x1000
c0de26a6:	4770      	bx	lr

c0de26a8 <poly_schoolbook_t1>:
c0de26a8:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de26ac:	4614      	mov	r4, r2
c0de26ae:	468b      	mov	fp, r1
c0de26b0:	2200      	movs	r2, #0
c0de26b2:	2100      	movs	r1, #0
c0de26b4:	f5b1 7f80 	cmp.w	r1, #256	@ 0x100
c0de26b8:	d003      	beq.n	c0de26c2 <poly_schoolbook_t1+0x1a>
c0de26ba:	f840 2021 	str.w	r2, [r0, r1, lsl #2]
c0de26be:	3101      	adds	r1, #1
c0de26c0:	e7f8      	b.n	c0de26b4 <poly_schoolbook_t1+0xc>
c0de26c2:	f10b 053c 	add.w	r5, fp, #60	@ 0x3c
c0de26c6:	2700      	movs	r7, #0
c0de26c8:	f04f 0a00 	mov.w	sl, #0
c0de26cc:	2600      	movs	r6, #0
c0de26ce:	9002      	str	r0, [sp, #8]
c0de26d0:	2f40      	cmp	r7, #64	@ 0x40
c0de26d2:	d006      	beq.n	c0de26e2 <poly_schoolbook_t1+0x3a>
c0de26d4:	f000 fb45 	bl	c0de2d62 <OUTLINED_FUNCTION_2>
c0de26d8:	430e      	orrs	r6, r1
c0de26da:	ea4a 0a00 	orr.w	sl, sl, r0
c0de26de:	3708      	adds	r7, #8
c0de26e0:	e7f6      	b.n	c0de26d0 <poly_schoolbook_t1+0x28>
c0de26e2:	4832      	ldr	r0, [pc, #200]	@ (c0de27ac <poly_schoolbook_t1+0x104>)
c0de26e4:	2200      	movs	r2, #0
c0de26e6:	f8cd b000 	str.w	fp, [sp]
c0de26ea:	4680      	mov	r8, r0
c0de26ec:	2a27      	cmp	r2, #39	@ 0x27
c0de26ee:	bf08      	it	eq
c0de26f0:	e8bd 8dff 	ldmiaeq.w	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de26f4:	f81b 0002 	ldrb.w	r0, [fp, r2]
c0de26f8:	ea5f 71ca 	movs.w	r1, sl, lsl #31
c0de26fc:	9203      	str	r2, [sp, #12]
c0de26fe:	f5c0 7780 	rsb	r7, r0, #256	@ 0x100
c0de2702:	d112      	bne.n	c0de272a <poly_schoolbook_t1+0x82>
c0de2704:	9902      	ldr	r1, [sp, #8]
c0de2706:	9601      	str	r6, [sp, #4]
c0de2708:	2500      	movs	r5, #0
c0de270a:	eb01 0680 	add.w	r6, r1, r0, lsl #2
c0de270e:	42af      	cmp	r7, r5
c0de2710:	d01e      	beq.n	c0de2750 <poly_schoolbook_t1+0xa8>
c0de2712:	4620      	mov	r0, r4
c0de2714:	4629      	mov	r1, r5
c0de2716:	f000 f84b 	bl	c0de27b0 <polyt1_unpack_idx>
c0de271a:	f856 1025 	ldr.w	r1, [r6, r5, lsl #2]
c0de271e:	eb01 3040 	add.w	r0, r1, r0, lsl #13
c0de2722:	f846 0025 	str.w	r0, [r6, r5, lsl #2]
c0de2726:	3501      	adds	r5, #1
c0de2728:	e7f1      	b.n	c0de270e <poly_schoolbook_t1+0x66>
c0de272a:	9902      	ldr	r1, [sp, #8]
c0de272c:	2500      	movs	r5, #0
c0de272e:	eb01 0b80 	add.w	fp, r1, r0, lsl #2
c0de2732:	42af      	cmp	r7, r5
c0de2734:	d01f      	beq.n	c0de2776 <poly_schoolbook_t1+0xce>
c0de2736:	4620      	mov	r0, r4
c0de2738:	4629      	mov	r1, r5
c0de273a:	f000 f839 	bl	c0de27b0 <polyt1_unpack_idx>
c0de273e:	f85b 1025 	ldr.w	r1, [fp, r5, lsl #2]
c0de2742:	4642      	mov	r2, r8
c0de2744:	fb00 1008 	mla	r0, r0, r8, r1
c0de2748:	f84b 0025 	str.w	r0, [fp, r5, lsl #2]
c0de274c:	3501      	adds	r5, #1
c0de274e:	e7f0      	b.n	c0de2732 <poly_schoolbook_t1+0x8a>
c0de2750:	f5a6 6580 	sub.w	r5, r6, #1024	@ 0x400
c0de2754:	9e01      	ldr	r6, [sp, #4]
c0de2756:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de275a:	d01f      	beq.n	c0de279c <poly_schoolbook_t1+0xf4>
c0de275c:	4620      	mov	r0, r4
c0de275e:	4639      	mov	r1, r7
c0de2760:	f000 f826 	bl	c0de27b0 <polyt1_unpack_idx>
c0de2764:	f855 1027 	ldr.w	r1, [r5, r7, lsl #2]
c0de2768:	4642      	mov	r2, r8
c0de276a:	fb00 1008 	mla	r0, r0, r8, r1
c0de276e:	f845 0027 	str.w	r0, [r5, r7, lsl #2]
c0de2772:	3701      	adds	r7, #1
c0de2774:	e7ef      	b.n	c0de2756 <poly_schoolbook_t1+0xae>
c0de2776:	f5ab 6580 	sub.w	r5, fp, #1024	@ 0x400
c0de277a:	f8dd b000 	ldr.w	fp, [sp]
c0de277e:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de2782:	d00b      	beq.n	c0de279c <poly_schoolbook_t1+0xf4>
c0de2784:	4620      	mov	r0, r4
c0de2786:	4639      	mov	r1, r7
c0de2788:	f000 f812 	bl	c0de27b0 <polyt1_unpack_idx>
c0de278c:	f855 1027 	ldr.w	r1, [r5, r7, lsl #2]
c0de2790:	eb01 3040 	add.w	r0, r1, r0, lsl #13
c0de2794:	f845 0027 	str.w	r0, [r5, r7, lsl #2]
c0de2798:	3701      	adds	r7, #1
c0de279a:	e7f0      	b.n	c0de277e <poly_schoolbook_t1+0xd6>
c0de279c:	9a03      	ldr	r2, [sp, #12]
c0de279e:	ea5f 0656 	movs.w	r6, r6, lsr #1
c0de27a2:	ea4f 0a3a 	mov.w	sl, sl, rrx
c0de27a6:	3201      	adds	r2, #1
c0de27a8:	e7a0      	b.n	c0de26ec <poly_schoolbook_t1+0x44>
c0de27aa:	bf00      	nop
c0de27ac:	ffffe000 	.word	0xffffe000

c0de27b0 <polyt1_unpack_idx>:
c0de27b0:	088a      	lsrs	r2, r1, #2
c0de27b2:	f001 0103 	and.w	r1, r1, #3
c0de27b6:	eb02 0282 	add.w	r2, r2, r2, lsl #2
c0de27ba:	2902      	cmp	r1, #2
c0de27bc:	4410      	add	r0, r2
c0de27be:	d006      	beq.n	c0de27ce <polyt1_unpack_idx+0x1e>
c0de27c0:	2901      	cmp	r1, #1
c0de27c2:	d009      	beq.n	c0de27d8 <polyt1_unpack_idx+0x28>
c0de27c4:	b969      	cbnz	r1, c0de27e2 <polyt1_unpack_idx+0x32>
c0de27c6:	7801      	ldrb	r1, [r0, #0]
c0de27c8:	2208      	movs	r2, #8
c0de27ca:	2301      	movs	r3, #1
c0de27cc:	e00d      	b.n	c0de27ea <polyt1_unpack_idx+0x3a>
c0de27ce:	7881      	ldrb	r1, [r0, #2]
c0de27d0:	2204      	movs	r2, #4
c0de27d2:	2303      	movs	r3, #3
c0de27d4:	0909      	lsrs	r1, r1, #4
c0de27d6:	e008      	b.n	c0de27ea <polyt1_unpack_idx+0x3a>
c0de27d8:	7841      	ldrb	r1, [r0, #1]
c0de27da:	2206      	movs	r2, #6
c0de27dc:	2302      	movs	r3, #2
c0de27de:	0889      	lsrs	r1, r1, #2
c0de27e0:	e003      	b.n	c0de27ea <polyt1_unpack_idx+0x3a>
c0de27e2:	78c1      	ldrb	r1, [r0, #3]
c0de27e4:	2202      	movs	r2, #2
c0de27e6:	2304      	movs	r3, #4
c0de27e8:	0989      	lsrs	r1, r1, #6
c0de27ea:	5cc0      	ldrb	r0, [r0, r3]
c0de27ec:	4090      	lsls	r0, r2
c0de27ee:	f400 707f 	and.w	r0, r0, #1020	@ 0x3fc
c0de27f2:	4308      	orrs	r0, r1
c0de27f4:	4770      	bx	lr

c0de27f6 <polyw_pack>:
c0de27f6:	b5b0      	push	{r4, r5, r7, lr}
c0de27f8:	4605      	mov	r5, r0
c0de27fa:	4608      	mov	r0, r1
c0de27fc:	460c      	mov	r4, r1
c0de27fe:	f000 fb3d 	bl	c0de2e7c <pqcrystals_dilithium2_lowram_poly_reduce>
c0de2802:	4620      	mov	r0, r4
c0de2804:	f000 fb49 	bl	c0de2e9a <pqcrystals_dilithium2_lowram_poly_caddq>
c0de2808:	2000      	movs	r0, #0
c0de280a:	f5b0 7f80 	cmp.w	r0, #256	@ 0x100
c0de280e:	bf08      	it	eq
c0de2810:	bdb0      	popeq	{r4, r5, r7, pc}
c0de2812:	f854 1020 	ldr.w	r1, [r4, r0, lsl #2]
c0de2816:	eb00 0240 	add.w	r2, r0, r0, lsl #1
c0de281a:	54a9      	strb	r1, [r5, r2]
c0de281c:	18a9      	adds	r1, r5, r2
c0de281e:	f854 2020 	ldr.w	r2, [r4, r0, lsl #2]
c0de2822:	0a12      	lsrs	r2, r2, #8
c0de2824:	704a      	strb	r2, [r1, #1]
c0de2826:	eb04 0280 	add.w	r2, r4, r0, lsl #2
c0de282a:	3001      	adds	r0, #1
c0de282c:	8852      	ldrh	r2, [r2, #2]
c0de282e:	708a      	strb	r2, [r1, #2]
c0de2830:	e7eb      	b.n	c0de280a <polyw_pack+0x14>

c0de2832 <polyw_unpack>:
c0de2832:	b5b0      	push	{r4, r5, r7, lr}
c0de2834:	2200      	movs	r2, #0
c0de2836:	f5b2 7f80 	cmp.w	r2, #256	@ 0x100
c0de283a:	bf08      	it	eq
c0de283c:	bdb0      	popeq	{r4, r5, r7, pc}
c0de283e:	eb02 0342 	add.w	r3, r2, r2, lsl #1
c0de2842:	5ccc      	ldrb	r4, [r1, r3]
c0de2844:	440b      	add	r3, r1
c0de2846:	f840 4022 	str.w	r4, [r0, r2, lsl #2]
c0de284a:	785d      	ldrb	r5, [r3, #1]
c0de284c:	ea44 2405 	orr.w	r4, r4, r5, lsl #8
c0de2850:	f840 4022 	str.w	r4, [r0, r2, lsl #2]
c0de2854:	789b      	ldrb	r3, [r3, #2]
c0de2856:	ea44 4303 	orr.w	r3, r4, r3, lsl #16
c0de285a:	f840 3022 	str.w	r3, [r0, r2, lsl #2]
c0de285e:	3201      	adds	r2, #1
c0de2860:	e7e9      	b.n	c0de2836 <polyw_unpack+0x4>

c0de2862 <polyw_sub>:
c0de2862:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de2864:	3102      	adds	r1, #2
c0de2866:	2300      	movs	r3, #0
c0de2868:	f5b3 7f80 	cmp.w	r3, #256	@ 0x100
c0de286c:	bf08      	it	eq
c0de286e:	bdf0      	popeq	{r4, r5, r6, r7, pc}
c0de2870:	f811 5c02 	ldrb.w	r5, [r1, #-2]
c0de2874:	f811 6c01 	ldrb.w	r6, [r1, #-1]
c0de2878:	f811 7b03 	ldrb.w	r7, [r1], #3
c0de287c:	f852 4023 	ldr.w	r4, [r2, r3, lsl #2]
c0de2880:	ea45 2506 	orr.w	r5, r5, r6, lsl #8
c0de2884:	ea45 4507 	orr.w	r5, r5, r7, lsl #16
c0de2888:	1b2c      	subs	r4, r5, r4
c0de288a:	f840 4023 	str.w	r4, [r0, r3, lsl #2]
c0de288e:	3301      	adds	r3, #1
c0de2890:	e7ea      	b.n	c0de2868 <polyw_sub+0x6>

c0de2892 <poly_highbits>:
c0de2892:	b5b0      	push	{r4, r5, r7, lr}
c0de2894:	2200      	movs	r2, #0
c0de2896:	f642 430b 	movw	r3, #11275	@ 0x2c0b
c0de289a:	f5b2 7f80 	cmp.w	r2, #256	@ 0x100
c0de289e:	bf08      	it	eq
c0de28a0:	bdb0      	popeq	{r4, r5, r7, pc}
c0de28a2:	f851 4022 	ldr.w	r4, [r1, r2, lsl #2]
c0de28a6:	347f      	adds	r4, #127	@ 0x7f
c0de28a8:	11e4      	asrs	r4, r4, #7
c0de28aa:	435c      	muls	r4, r3
c0de28ac:	f504 0500 	add.w	r5, r4, #8388608	@ 0x800000
c0de28b0:	162d      	asrs	r5, r5, #24
c0de28b2:	f1b4 5f2e 	cmp.w	r4, #729808896	@ 0x2b800000
c0de28b6:	bfa8      	it	ge
c0de28b8:	2500      	movge	r5, #0
c0de28ba:	f840 5022 	str.w	r5, [r0, r2, lsl #2]
c0de28be:	3201      	adds	r2, #1
c0de28c0:	e7eb      	b.n	c0de289a <poly_highbits+0x8>
	...

c0de28c4 <poly_lowbits>:
c0de28c4:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de28c8:	4e13      	ldr	r6, [pc, #76]	@ (c0de2918 <poly_lowbits+0x54>)
c0de28ca:	4f15      	ldr	r7, [pc, #84]	@ (c0de2920 <poly_lowbits+0x5c>)
c0de28cc:	2200      	movs	r2, #0
c0de28ce:	f642 4c0b 	movw	ip, #11275	@ 0x2c0b
c0de28d2:	f06f 0e01 	mvn.w	lr, #1
c0de28d6:	46b0      	mov	r8, r6
c0de28d8:	4e10      	ldr	r6, [pc, #64]	@ (c0de291c <poly_lowbits+0x58>)
c0de28da:	f5b2 7f80 	cmp.w	r2, #256	@ 0x100
c0de28de:	bf08      	it	eq
c0de28e0:	e8bd 81f0 	ldmiaeq.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de28e4:	f851 3022 	ldr.w	r3, [r1, r2, lsl #2]
c0de28e8:	f103 047f 	add.w	r4, r3, #127	@ 0x7f
c0de28ec:	11e4      	asrs	r4, r4, #7
c0de28ee:	fb04 f40c 	mul.w	r4, r4, ip
c0de28f2:	f504 0500 	add.w	r5, r4, #8388608	@ 0x800000
c0de28f6:	f1b4 5f2e 	cmp.w	r4, #729808896	@ 0x2b800000
c0de28fa:	4644      	mov	r4, r8
c0de28fc:	ea0e 55e5 	and.w	r5, lr, r5, asr #23
c0de2900:	bfb8      	it	lt
c0de2902:	fb05 3308 	mlalt	r3, r5, r8, r3
c0de2906:	42bb      	cmp	r3, r7
c0de2908:	4634      	mov	r4, r6
c0de290a:	bfc8      	it	gt
c0de290c:	4433      	addgt	r3, r6
c0de290e:	f840 3022 	str.w	r3, [r0, r2, lsl #2]
c0de2912:	3201      	adds	r2, #1
c0de2914:	e7e1      	b.n	c0de28da <poly_lowbits+0x16>
c0de2916:	bf00      	nop
c0de2918:	fffe8c00 	.word	0xfffe8c00
c0de291c:	ff801fff 	.word	0xff801fff
c0de2920:	003ff000 	.word	0x003ff000

c0de2924 <unpack_sk_s1>:
c0de2924:	eb02 0242 	add.w	r2, r2, r2, lsl #1
c0de2928:	eb01 1142 	add.w	r1, r1, r2, lsl #5
c0de292c:	3180      	adds	r1, #128	@ 0x80
c0de292e:	f001 bb18 	b.w	c0de3f62 <small_polyeta_unpack>

c0de2932 <unpack_sk_s2>:
c0de2932:	eb02 0242 	add.w	r2, r2, r2, lsl #1
c0de2936:	eb01 1142 	add.w	r1, r1, r2, lsl #5
c0de293a:	f501 7100 	add.w	r1, r1, #512	@ 0x200
c0de293e:	f001 bb10 	b.w	c0de3f62 <small_polyeta_unpack>
	...

c0de2944 <poly_uniform_pointwise_montgomery_polywadd_lowram>:
c0de2944:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de2948:	f8dd 8030 	ldr.w	r8, [sp, #48]	@ 0x30
c0de294c:	468a      	mov	sl, r1
c0de294e:	4683      	mov	fp, r0
c0de2950:	4611      	mov	r1, r2
c0de2952:	461a      	mov	r2, r3
c0de2954:	4640      	mov	r0, r8
c0de2956:	f001 fb56 	bl	c0de4006 <pqcrystals_dilithium2_lowram_dilithium_shake128_stream_init>
c0de295a:	4c10      	ldr	r4, [pc, #64]	@ (c0de299c <poly_uniform_pointwise_montgomery_polywadd_lowram+0x58>)
c0de295c:	2700      	movs	r7, #0
c0de295e:	f10d 0607 	add.w	r6, sp, #7
c0de2962:	4630      	mov	r0, r6
c0de2964:	2109      	movs	r1, #9
c0de2966:	4642      	mov	r2, r8
c0de2968:	f7fe fbf7 	bl	c0de115a <pqcrystals_dilithium_fips202_ref_shake128_squeeze>
c0de296c:	2500      	movs	r5, #0
c0de296e:	2d08      	cmp	r5, #8
c0de2970:	bf98      	it	ls
c0de2972:	f5b7 7f80 	cmpls.w	r7, #256	@ 0x100
c0de2976:	d20b      	bcs.n	c0de2990 <poly_uniform_pointwise_montgomery_polywadd_lowram+0x4c>
c0de2978:	f000 f9de 	bl	c0de2d38 <OUTLINED_FUNCTION_0>
c0de297c:	d806      	bhi.n	c0de298c <poly_uniform_pointwise_montgomery_polywadd_lowram+0x48>
c0de297e:	f85a 1027 	ldr.w	r1, [sl, r7, lsl #2]
c0de2982:	f000 f9f4 	bl	c0de2d6e <OUTLINED_FUNCTION_3>
c0de2986:	f000 f9f6 	bl	c0de2d76 <OUTLINED_FUNCTION_4>
c0de298a:	3701      	adds	r7, #1
c0de298c:	3503      	adds	r5, #3
c0de298e:	e7ee      	b.n	c0de296e <poly_uniform_pointwise_montgomery_polywadd_lowram+0x2a>
c0de2990:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de2994:	bf28      	it	cs
c0de2996:	e8bd 8dff 	ldmiacs.w	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de299a:	e7e2      	b.n	c0de2962 <poly_uniform_pointwise_montgomery_polywadd_lowram+0x1e>
c0de299c:	007fe000 	.word	0x007fe000

c0de29a0 <polyw_add_idx>:
c0de29a0:	b570      	push	{r4, r5, r6, lr}
c0de29a2:	4604      	mov	r4, r0
c0de29a4:	eb02 0542 	add.w	r5, r2, r2, lsl #1
c0de29a8:	1966      	adds	r6, r4, r5
c0de29aa:	5d40      	ldrb	r0, [r0, r5]
c0de29ac:	7872      	ldrb	r2, [r6, #1]
c0de29ae:	78b3      	ldrb	r3, [r6, #2]
c0de29b0:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de29b4:	ea40 4003 	orr.w	r0, r0, r3, lsl #16
c0de29b8:	4408      	add	r0, r1
c0de29ba:	f000 fd57 	bl	c0de346c <pqcrystals_dilithium2_lowram_freeze>
c0de29be:	0c01      	lsrs	r1, r0, #16
c0de29c0:	5560      	strb	r0, [r4, r5]
c0de29c2:	0a00      	lsrs	r0, r0, #8
c0de29c4:	70b1      	strb	r1, [r6, #2]
c0de29c6:	7070      	strb	r0, [r6, #1]
c0de29c8:	bd70      	pop	{r4, r5, r6, pc}

c0de29ca <poly_uniform_gamma1_lowram>:
c0de29ca:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de29cc:	b085      	sub	sp, #20
c0de29ce:	4605      	mov	r5, r0
c0de29d0:	4618      	mov	r0, r3
c0de29d2:	461c      	mov	r4, r3
c0de29d4:	f001 fb2b 	bl	c0de402e <pqcrystals_dilithium2_lowram_dilithium_shake256_stream_init>
c0de29d8:	2700      	movs	r7, #0
c0de29da:	ae01      	add	r6, sp, #4
c0de29dc:	2f40      	cmp	r7, #64	@ 0x40
c0de29de:	bf04      	itt	eq
c0de29e0:	b005      	addeq	sp, #20
c0de29e2:	bdf0      	popeq	{r4, r5, r6, r7, pc}
c0de29e4:	4630      	mov	r0, r6
c0de29e6:	2109      	movs	r1, #9
c0de29e8:	4622      	mov	r2, r4
c0de29ea:	f7fe fc9f 	bl	c0de132c <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de29ee:	4630      	mov	r0, r6
c0de29f0:	f000 f80c 	bl	c0de2a0c <polyz_unpack_inplace>
c0de29f4:	2000      	movs	r0, #0
c0de29f6:	2804      	cmp	r0, #4
c0de29f8:	d005      	beq.n	c0de2a06 <poly_uniform_gamma1_lowram+0x3c>
c0de29fa:	f856 1020 	ldr.w	r1, [r6, r0, lsl #2]
c0de29fe:	f845 1020 	str.w	r1, [r5, r0, lsl #2]
c0de2a02:	3001      	adds	r0, #1
c0de2a04:	e7f7      	b.n	c0de29f6 <poly_uniform_gamma1_lowram+0x2c>
c0de2a06:	3510      	adds	r5, #16
c0de2a08:	3701      	adds	r7, #1
c0de2a0a:	e7e7      	b.n	c0de29dc <poly_uniform_gamma1_lowram+0x12>

c0de2a0c <polyz_unpack_inplace>:
c0de2a0c:	b5b0      	push	{r4, r5, r7, lr}
c0de2a0e:	7801      	ldrb	r1, [r0, #0]
c0de2a10:	7883      	ldrb	r3, [r0, #2]
c0de2a12:	7842      	ldrb	r2, [r0, #1]
c0de2a14:	78c4      	ldrb	r4, [r0, #3]
c0de2a16:	7a05      	ldrb	r5, [r0, #8]
c0de2a18:	f363 4111 	bfi	r1, r3, #16, #2
c0de2a1c:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de2a20:	79c2      	ldrb	r2, [r0, #7]
c0de2a22:	f5c1 3100 	rsb	r1, r1, #131072	@ 0x20000
c0de2a26:	6001      	str	r1, [r0, #0]
c0de2a28:	7981      	ldrb	r1, [r0, #6]
c0de2a2a:	0092      	lsls	r2, r2, #2
c0de2a2c:	ea42 1291 	orr.w	r2, r2, r1, lsr #6
c0de2a30:	f001 013f 	and.w	r1, r1, #63	@ 0x3f
c0de2a34:	ea42 2285 	orr.w	r2, r2, r5, lsl #10
c0de2a38:	7945      	ldrb	r5, [r0, #5]
c0de2a3a:	f5c2 3200 	rsb	r2, r2, #131072	@ 0x20000
c0de2a3e:	60c2      	str	r2, [r0, #12]
c0de2a40:	7902      	ldrb	r2, [r0, #4]
c0de2a42:	012d      	lsls	r5, r5, #4
c0de2a44:	ea45 1512 	orr.w	r5, r5, r2, lsr #4
c0de2a48:	ea45 3101 	orr.w	r1, r5, r1, lsl #12
c0de2a4c:	f5c1 3100 	rsb	r1, r1, #131072	@ 0x20000
c0de2a50:	6081      	str	r1, [r0, #8]
c0de2a52:	0899      	lsrs	r1, r3, #2
c0de2a54:	f362 3191 	bfi	r1, r2, #14, #4
c0de2a58:	ea41 1184 	orr.w	r1, r1, r4, lsl #6
c0de2a5c:	f5c1 3100 	rsb	r1, r1, #131072	@ 0x20000
c0de2a60:	6041      	str	r1, [r0, #4]
c0de2a62:	bdb0      	pop	{r4, r5, r7, pc}

c0de2a64 <poly_uniform_gamma1_add_lowram>:
c0de2a64:	e92d 41ff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
c0de2a68:	f8dd 8028 	ldr.w	r8, [sp, #40]	@ 0x28
c0de2a6c:	460c      	mov	r4, r1
c0de2a6e:	4605      	mov	r5, r0
c0de2a70:	4611      	mov	r1, r2
c0de2a72:	461a      	mov	r2, r3
c0de2a74:	4640      	mov	r0, r8
c0de2a76:	f001 fada 	bl	c0de402e <pqcrystals_dilithium2_lowram_dilithium_shake256_stream_init>
c0de2a7a:	2600      	movs	r6, #0
c0de2a7c:	466f      	mov	r7, sp
c0de2a7e:	2e40      	cmp	r6, #64	@ 0x40
c0de2a80:	bf08      	it	eq
c0de2a82:	e8bd 81ff 	ldmiaeq.w	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, pc}
c0de2a86:	4638      	mov	r0, r7
c0de2a88:	2109      	movs	r1, #9
c0de2a8a:	4642      	mov	r2, r8
c0de2a8c:	f7fe fc4e 	bl	c0de132c <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de2a90:	4638      	mov	r0, r7
c0de2a92:	f7ff ffbb 	bl	c0de2a0c <polyz_unpack_inplace>
c0de2a96:	2000      	movs	r0, #0
c0de2a98:	2804      	cmp	r0, #4
c0de2a9a:	d002      	beq.n	c0de2aa2 <poly_uniform_gamma1_add_lowram+0x3e>
c0de2a9c:	f000 f958 	bl	c0de2d50 <OUTLINED_FUNCTION_1>
c0de2aa0:	e7fa      	b.n	c0de2a98 <poly_uniform_gamma1_add_lowram+0x34>
c0de2aa2:	3410      	adds	r4, #16
c0de2aa4:	3510      	adds	r5, #16
c0de2aa6:	3601      	adds	r6, #1
c0de2aa8:	e7e9      	b.n	c0de2a7e <poly_uniform_gamma1_add_lowram+0x1a>
	...

c0de2aac <poly_make_hint_lowram>:
c0de2aac:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de2ab0:	4686      	mov	lr, r0
c0de2ab2:	481a      	ldr	r0, [pc, #104]	@ (c0de2b1c <poly_make_hint_lowram+0x70>)
c0de2ab4:	1c93      	adds	r3, r2, #2
c0de2ab6:	468c      	mov	ip, r1
c0de2ab8:	2200      	movs	r2, #0
c0de2aba:	f642 450b 	movw	r5, #11275	@ 0x2c0b
c0de2abe:	2600      	movs	r6, #0
c0de2ac0:	4680      	mov	r8, r0
c0de2ac2:	f5b6 7f80 	cmp.w	r6, #256	@ 0x100
c0de2ac6:	d026      	beq.n	c0de2b16 <poly_make_hint_lowram+0x6a>
c0de2ac8:	f813 4c02 	ldrb.w	r4, [r3, #-2]
c0de2acc:	f813 1c01 	ldrb.w	r1, [r3, #-1]
c0de2ad0:	f813 0b03 	ldrb.w	r0, [r3], #3
c0de2ad4:	f85c 7026 	ldr.w	r7, [ip, r6, lsl #2]
c0de2ad8:	ea44 2101 	orr.w	r1, r4, r1, lsl #8
c0de2adc:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de2ae0:	307f      	adds	r0, #127	@ 0x7f
c0de2ae2:	19c1      	adds	r1, r0, r7
c0de2ae4:	4647      	mov	r7, r8
c0de2ae6:	11c9      	asrs	r1, r1, #7
c0de2ae8:	4369      	muls	r1, r5
c0de2aea:	f501 0400 	add.w	r4, r1, #8388608	@ 0x800000
c0de2aee:	1624      	asrs	r4, r4, #24
c0de2af0:	4541      	cmp	r1, r8
c0de2af2:	bfc8      	it	gt
c0de2af4:	2400      	movgt	r4, #0
c0de2af6:	09c0      	lsrs	r0, r0, #7
c0de2af8:	4368      	muls	r0, r5
c0de2afa:	f500 0100 	add.w	r1, r0, #8388608	@ 0x800000
c0de2afe:	0e09      	lsrs	r1, r1, #24
c0de2b00:	4540      	cmp	r0, r8
c0de2b02:	bf88      	it	hi
c0de2b04:	2100      	movhi	r1, #0
c0de2b06:	1a60      	subs	r0, r4, r1
c0de2b08:	bf18      	it	ne
c0de2b0a:	2001      	movne	r0, #1
c0de2b0c:	f84e 0026 	str.w	r0, [lr, r6, lsl #2]
c0de2b10:	4402      	add	r2, r0
c0de2b12:	3601      	adds	r6, #1
c0de2b14:	e7d5      	b.n	c0de2ac2 <poly_make_hint_lowram+0x16>
c0de2b16:	4610      	mov	r0, r2
c0de2b18:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de2b1c:	2b7fffff 	.word	0x2b7fffff

c0de2b20 <unpack_sig_h_indices>:
c0de2b20:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de2b24:	f503 6c12 	add.w	ip, r3, #2336	@ 0x920
c0de2b28:	b142      	cbz	r2, c0de2b3c <unpack_sig_h_indices+0x1c>
c0de2b2a:	eb02 0e0c 	add.w	lr, r2, ip
c0de2b2e:	f81e 6f50 	ldrb.w	r6, [lr, #80]!
c0de2b32:	f81e 5c01 	ldrb.w	r5, [lr, #-1]
c0de2b36:	42b5      	cmp	r5, r6
c0de2b38:	d905      	bls.n	c0de2b46 <unpack_sig_h_indices+0x26>
c0de2b3a:	e006      	b.n	c0de2b4a <unpack_sig_h_indices+0x2a>
c0de2b3c:	f893 6970 	ldrb.w	r6, [r3, #2416]	@ 0x970
c0de2b40:	f503 6e17 	add.w	lr, r3, #2416	@ 0x970
c0de2b44:	2500      	movs	r5, #0
c0de2b46:	2e50      	cmp	r6, #80	@ 0x50
c0de2b48:	d902      	bls.n	c0de2b50 <unpack_sig_h_indices+0x30>
c0de2b4a:	2001      	movs	r0, #1
c0de2b4c:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de2b50:	eb03 0805 	add.w	r8, r3, r5
c0de2b54:	2700      	movs	r7, #0
c0de2b56:	19ea      	adds	r2, r5, r7
c0de2b58:	42b2      	cmp	r2, r6
c0de2b5a:	d20e      	bcs.n	c0de2b7a <unpack_sig_h_indices+0x5a>
c0de2b5c:	eb08 0407 	add.w	r4, r8, r7
c0de2b60:	42aa      	cmp	r2, r5
c0de2b62:	f894 6920 	ldrb.w	r6, [r4, #2336]	@ 0x920
c0de2b66:	d903      	bls.n	c0de2b70 <unpack_sig_h_indices+0x50>
c0de2b68:	f894 291f 	ldrb.w	r2, [r4, #2335]	@ 0x91f
c0de2b6c:	4296      	cmp	r6, r2
c0de2b6e:	d9ec      	bls.n	c0de2b4a <unpack_sig_h_indices+0x2a>
c0de2b70:	55c6      	strb	r6, [r0, r7]
c0de2b72:	3701      	adds	r7, #1
c0de2b74:	f89e 6000 	ldrb.w	r6, [lr]
c0de2b78:	e7ed      	b.n	c0de2b56 <unpack_sig_h_indices+0x36>
c0de2b7a:	600f      	str	r7, [r1, #0]
c0de2b7c:	f893 0973 	ldrb.w	r0, [r3, #2419]	@ 0x973
c0de2b80:	4601      	mov	r1, r0
c0de2b82:	284f      	cmp	r0, #79	@ 0x4f
c0de2b84:	d804      	bhi.n	c0de2b90 <unpack_sig_h_indices+0x70>
c0de2b86:	f81c 2001 	ldrb.w	r2, [ip, r1]
c0de2b8a:	1c48      	adds	r0, r1, #1
c0de2b8c:	2a00      	cmp	r2, #0
c0de2b8e:	d0f7      	beq.n	c0de2b80 <unpack_sig_h_indices+0x60>
c0de2b90:	2000      	movs	r0, #0
c0de2b92:	2950      	cmp	r1, #80	@ 0x50
c0de2b94:	bf38      	it	cc
c0de2b96:	2001      	movcc	r0, #1
c0de2b98:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

c0de2b9c <poly_use_hint_lowram>:
c0de2b9c:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de2ba0:	4698      	mov	r8, r3
c0de2ba2:	4615      	mov	r5, r2
c0de2ba4:	460e      	mov	r6, r1
c0de2ba6:	4607      	mov	r7, r0
c0de2ba8:	2400      	movs	r4, #0
c0de2baa:	f5b4 7f80 	cmp.w	r4, #256	@ 0x100
c0de2bae:	bf08      	it	eq
c0de2bb0:	e8bd 81f0 	ldmiaeq.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de2bb4:	4628      	mov	r0, r5
c0de2bb6:	4641      	mov	r1, r8
c0de2bb8:	b131      	cbz	r1, c0de2bc8 <poly_use_hint_lowram+0x2c>
c0de2bba:	f810 2b01 	ldrb.w	r2, [r0], #1
c0de2bbe:	3901      	subs	r1, #1
c0de2bc0:	4294      	cmp	r4, r2
c0de2bc2:	d1f9      	bne.n	c0de2bb8 <poly_use_hint_lowram+0x1c>
c0de2bc4:	2101      	movs	r1, #1
c0de2bc6:	e000      	b.n	c0de2bca <poly_use_hint_lowram+0x2e>
c0de2bc8:	2100      	movs	r1, #0
c0de2bca:	f856 0024 	ldr.w	r0, [r6, r4, lsl #2]
c0de2bce:	f000 fc87 	bl	c0de34e0 <pqcrystals_dilithium2_lowram_use_hint>
c0de2bd2:	f847 0024 	str.w	r0, [r7, r4, lsl #2]
c0de2bd6:	3401      	adds	r4, #1
c0de2bd8:	e7e7      	b.n	c0de2baa <poly_use_hint_lowram+0xe>

c0de2bda <pack_pk_rho>:
c0de2bda:	2200      	movs	r2, #0
c0de2bdc:	2a20      	cmp	r2, #32
c0de2bde:	bf08      	it	eq
c0de2be0:	4770      	bxeq	lr
c0de2be2:	5c8b      	ldrb	r3, [r1, r2]
c0de2be4:	5483      	strb	r3, [r0, r2]
c0de2be6:	3201      	adds	r2, #1
c0de2be8:	e7f8      	b.n	c0de2bdc <pack_pk_rho+0x2>

c0de2bea <pack_pk_t1>:
c0de2bea:	eb02 0282 	add.w	r2, r2, r2, lsl #2
c0de2bee:	eb00 1082 	add.w	r0, r0, r2, lsl #6
c0de2bf2:	3020      	adds	r0, #32
c0de2bf4:	f000 bb42 	b.w	c0de327c <pqcrystals_dilithium2_lowram_polyt1_pack>

c0de2bf8 <pack_sk_s1>:
c0de2bf8:	eb02 0242 	add.w	r2, r2, r2, lsl #1
c0de2bfc:	eb00 1042 	add.w	r0, r0, r2, lsl #5
c0de2c00:	3080      	adds	r0, #128	@ 0x80
c0de2c02:	f000 bafd 	b.w	c0de3200 <pqcrystals_dilithium2_lowram_polyeta_pack>

c0de2c06 <pack_sk_s2>:
c0de2c06:	eb02 0242 	add.w	r2, r2, r2, lsl #1
c0de2c0a:	eb00 1042 	add.w	r0, r0, r2, lsl #5
c0de2c0e:	f500 7000 	add.w	r0, r0, #512	@ 0x200
c0de2c12:	f000 baf5 	b.w	c0de3200 <pqcrystals_dilithium2_lowram_polyeta_pack>

c0de2c16 <pack_sk_t0>:
c0de2c16:	f44f 73d0 	mov.w	r3, #416	@ 0x1a0
c0de2c1a:	fb02 0003 	mla	r0, r2, r3, r0
c0de2c1e:	f500 7060 	add.w	r0, r0, #896	@ 0x380
c0de2c22:	f000 bb4f 	b.w	c0de32c4 <pqcrystals_dilithium2_lowram_polyt0_pack>

c0de2c26 <pack_sk_rho>:
c0de2c26:	2200      	movs	r2, #0
c0de2c28:	2a20      	cmp	r2, #32
c0de2c2a:	bf08      	it	eq
c0de2c2c:	4770      	bxeq	lr
c0de2c2e:	5c8b      	ldrb	r3, [r1, r2]
c0de2c30:	5483      	strb	r3, [r0, r2]
c0de2c32:	3201      	adds	r2, #1
c0de2c34:	e7f8      	b.n	c0de2c28 <pack_sk_rho+0x2>

c0de2c36 <pack_sk_key>:
c0de2c36:	3020      	adds	r0, #32
c0de2c38:	2200      	movs	r2, #0
c0de2c3a:	2a20      	cmp	r2, #32
c0de2c3c:	bf08      	it	eq
c0de2c3e:	4770      	bxeq	lr
c0de2c40:	5c8b      	ldrb	r3, [r1, r2]
c0de2c42:	5483      	strb	r3, [r0, r2]
c0de2c44:	3201      	adds	r2, #1
c0de2c46:	e7f8      	b.n	c0de2c3a <pack_sk_key+0x4>

c0de2c48 <pack_sk_tr>:
c0de2c48:	3040      	adds	r0, #64	@ 0x40
c0de2c4a:	2200      	movs	r2, #0
c0de2c4c:	2a40      	cmp	r2, #64	@ 0x40
c0de2c4e:	bf08      	it	eq
c0de2c50:	4770      	bxeq	lr
c0de2c52:	5c8b      	ldrb	r3, [r1, r2]
c0de2c54:	5483      	strb	r3, [r0, r2]
c0de2c56:	3201      	adds	r2, #1
c0de2c58:	e7f8      	b.n	c0de2c4c <pack_sk_tr+0x4>

c0de2c5a <poly_challenge_lowram>:
c0de2c5a:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de2c5e:	b0b6      	sub	sp, #216	@ 0xd8
c0de2c60:	466e      	mov	r6, sp
c0de2c62:	4680      	mov	r8, r0
c0de2c64:	460d      	mov	r5, r1
c0de2c66:	4630      	mov	r0, r6
c0de2c68:	f7fe fb42 	bl	c0de12f0 <pqcrystals_dilithium_fips202_ref_shake256_init>
c0de2c6c:	4630      	mov	r0, r6
c0de2c6e:	4629      	mov	r1, r5
c0de2c70:	2220      	movs	r2, #32
c0de2c72:	f7fe fb45 	bl	c0de1300 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
c0de2c76:	4630      	mov	r0, r6
c0de2c78:	f7fe fb4d 	bl	c0de1316 <pqcrystals_dilithium_fips202_ref_shake256_finalize>
c0de2c7c:	ad34      	add	r5, sp, #208	@ 0xd0
c0de2c7e:	2108      	movs	r1, #8
c0de2c80:	4632      	mov	r2, r6
c0de2c82:	4628      	mov	r0, r5
c0de2c84:	f7fe fb52 	bl	c0de132c <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de2c88:	2600      	movs	r6, #0
c0de2c8a:	462c      	mov	r4, r5
c0de2c8c:	2700      	movs	r7, #0
c0de2c8e:	f04f 0a00 	mov.w	sl, #0
c0de2c92:	2e40      	cmp	r6, #64	@ 0x40
c0de2c94:	d00a      	beq.n	c0de2cac <poly_challenge_lowram+0x52>
c0de2c96:	f814 0b01 	ldrb.w	r0, [r4], #1
c0de2c9a:	2100      	movs	r1, #0
c0de2c9c:	4632      	mov	r2, r6
c0de2c9e:	f00a f925 	bl	c0deceec <__aeabi_llsl>
c0de2ca2:	ea4a 0a01 	orr.w	sl, sl, r1
c0de2ca6:	4307      	orrs	r7, r0
c0de2ca8:	3608      	adds	r6, #8
c0de2caa:	e7f2      	b.n	c0de2c92 <poly_challenge_lowram+0x38>
c0de2cac:	2000      	movs	r0, #0
c0de2cae:	2100      	movs	r1, #0
c0de2cb0:	f5b1 7f80 	cmp.w	r1, #256	@ 0x100
c0de2cb4:	d003      	beq.n	c0de2cbe <poly_challenge_lowram+0x64>
c0de2cb6:	f848 0021 	str.w	r0, [r8, r1, lsl #2]
c0de2cba:	3101      	adds	r1, #1
c0de2cbc:	e7f8      	b.n	c0de2cb0 <poly_challenge_lowram+0x56>
c0de2cbe:	2008      	movs	r0, #8
c0de2cc0:	24d9      	movs	r4, #217	@ 0xd9
c0de2cc2:	466e      	mov	r6, sp
c0de2cc4:	f04f 0b02 	mov.w	fp, #2
c0de2cc8:	f5b4 7f80 	cmp.w	r4, #256	@ 0x100
c0de2ccc:	d01b      	beq.n	c0de2d06 <poly_challenge_lowram+0xac>
c0de2cce:	2808      	cmp	r0, #8
c0de2cd0:	d305      	bcc.n	c0de2cde <poly_challenge_lowram+0x84>
c0de2cd2:	4628      	mov	r0, r5
c0de2cd4:	2108      	movs	r1, #8
c0de2cd6:	4632      	mov	r2, r6
c0de2cd8:	f7fe fb28 	bl	c0de132c <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de2cdc:	2000      	movs	r0, #0
c0de2cde:	5c29      	ldrb	r1, [r5, r0]
c0de2ce0:	3001      	adds	r0, #1
c0de2ce2:	428c      	cmp	r4, r1
c0de2ce4:	d3f3      	bcc.n	c0de2cce <poly_challenge_lowram+0x74>
c0de2ce6:	f858 2021 	ldr.w	r2, [r8, r1, lsl #2]
c0de2cea:	ea5f 0a5a 	movs.w	sl, sl, lsr #1
c0de2cee:	f848 2024 	str.w	r2, [r8, r4, lsl #2]
c0de2cf2:	ea0b 0247 	and.w	r2, fp, r7, lsl #1
c0de2cf6:	ea4f 0737 	mov.w	r7, r7, rrx
c0de2cfa:	3401      	adds	r4, #1
c0de2cfc:	f1c2 0201 	rsb	r2, r2, #1
c0de2d00:	f848 2021 	str.w	r2, [r8, r1, lsl #2]
c0de2d04:	e7e0      	b.n	c0de2cc8 <poly_challenge_lowram+0x6e>
c0de2d06:	b036      	add	sp, #216	@ 0xd8
c0de2d08:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de2d0c <pqcrystals_dilithium2_lowram_poly_pointwise_acc_montgomery>:
c0de2d0c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de2d0e:	4614      	mov	r4, r2
c0de2d10:	460d      	mov	r5, r1
c0de2d12:	4606      	mov	r6, r0
c0de2d14:	2700      	movs	r7, #0
c0de2d16:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de2d1a:	bf08      	it	eq
c0de2d1c:	bdf8      	popeq	{r3, r4, r5, r6, r7, pc}
c0de2d1e:	f855 0027 	ldr.w	r0, [r5, r7, lsl #2]
c0de2d22:	f854 1027 	ldr.w	r1, [r4, r7, lsl #2]
c0de2d26:	f000 f822 	bl	c0de2d6e <OUTLINED_FUNCTION_3>
c0de2d2a:	f856 1027 	ldr.w	r1, [r6, r7, lsl #2]
c0de2d2e:	4408      	add	r0, r1
c0de2d30:	f846 0027 	str.w	r0, [r6, r7, lsl #2]
c0de2d34:	3701      	adds	r7, #1
c0de2d36:	e7ee      	b.n	c0de2d16 <pqcrystals_dilithium2_lowram_poly_pointwise_acc_montgomery+0xa>

c0de2d38 <OUTLINED_FUNCTION_0>:
c0de2d38:	1971      	adds	r1, r6, r5
c0de2d3a:	5d70      	ldrb	r0, [r6, r5]
c0de2d3c:	784a      	ldrb	r2, [r1, #1]
c0de2d3e:	7889      	ldrb	r1, [r1, #2]
c0de2d40:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de2d44:	f001 017f 	and.w	r1, r1, #127	@ 0x7f
c0de2d48:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de2d4c:	42a0      	cmp	r0, r4
c0de2d4e:	4770      	bx	lr

c0de2d50 <OUTLINED_FUNCTION_1>:
c0de2d50:	f857 1020 	ldr.w	r1, [r7, r0, lsl #2]
c0de2d54:	f854 2020 	ldr.w	r2, [r4, r0, lsl #2]
c0de2d58:	4411      	add	r1, r2
c0de2d5a:	f845 1020 	str.w	r1, [r5, r0, lsl #2]
c0de2d5e:	3001      	adds	r0, #1
c0de2d60:	4770      	bx	lr

c0de2d62 <OUTLINED_FUNCTION_2>:
c0de2d62:	f815 0b01 	ldrb.w	r0, [r5], #1
c0de2d66:	2100      	movs	r1, #0
c0de2d68:	463a      	mov	r2, r7
c0de2d6a:	f00a b8bf 	b.w	c0deceec <__aeabi_llsl>

c0de2d6e <OUTLINED_FUNCTION_3>:
c0de2d6e:	fb81 0100 	smull	r0, r1, r1, r0
c0de2d72:	f000 bb5d 	b.w	c0de3430 <pqcrystals_dilithium2_lowram_montgomery_reduce>

c0de2d76 <OUTLINED_FUNCTION_4>:
c0de2d76:	4601      	mov	r1, r0
c0de2d78:	4658      	mov	r0, fp
c0de2d7a:	463a      	mov	r2, r7
c0de2d7c:	f7ff be10 	b.w	c0de29a0 <polyw_add_idx>

c0de2d80 <pqcrystals_dilithium2_lowram_ntt>:
c0de2d80:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de2d84:	4604      	mov	r4, r0
c0de2d86:	4817      	ldr	r0, [pc, #92]	@ (c0de2de4 <pqcrystals_dilithium2_lowram_ntt+0x64>)
c0de2d88:	f04f 0880 	mov.w	r8, #128	@ 0x80
c0de2d8c:	f04f 0a00 	mov.w	sl, #0
c0de2d90:	4478      	add	r0, pc
c0de2d92:	9001      	str	r0, [sp, #4]
c0de2d94:	f1b8 0f00 	cmp.w	r8, #0
c0de2d98:	bf08      	it	eq
c0de2d9a:	e8bd 8dfc 	ldmiaeq.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de2d9e:	2700      	movs	r7, #0
c0de2da0:	2fff      	cmp	r7, #255	@ 0xff
c0de2da2:	d81c      	bhi.n	c0de2dde <pqcrystals_dilithium2_lowram_ntt+0x5e>
c0de2da4:	9801      	ldr	r0, [sp, #4]
c0de2da6:	f10a 0a01 	add.w	sl, sl, #1
c0de2daa:	eb07 0608 	add.w	r6, r7, r8
c0de2dae:	4635      	mov	r5, r6
c0de2db0:	f850 b02a 	ldr.w	fp, [r0, sl, lsl #2]
c0de2db4:	42b7      	cmp	r7, r6
c0de2db6:	d210      	bcs.n	c0de2dda <pqcrystals_dilithium2_lowram_ntt+0x5a>
c0de2db8:	f854 0025 	ldr.w	r0, [r4, r5, lsl #2]
c0de2dbc:	fb80 010b 	smull	r0, r1, r0, fp
c0de2dc0:	f000 fb36 	bl	c0de3430 <pqcrystals_dilithium2_lowram_montgomery_reduce>
c0de2dc4:	f854 1027 	ldr.w	r1, [r4, r7, lsl #2]
c0de2dc8:	180a      	adds	r2, r1, r0
c0de2dca:	1a08      	subs	r0, r1, r0
c0de2dcc:	f844 2027 	str.w	r2, [r4, r7, lsl #2]
c0de2dd0:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de2dd4:	3501      	adds	r5, #1
c0de2dd6:	3701      	adds	r7, #1
c0de2dd8:	e7ec      	b.n	c0de2db4 <pqcrystals_dilithium2_lowram_ntt+0x34>
c0de2dda:	462f      	mov	r7, r5
c0de2ddc:	e7e0      	b.n	c0de2da0 <pqcrystals_dilithium2_lowram_ntt+0x20>
c0de2dde:	ea4f 0858 	mov.w	r8, r8, lsr #1
c0de2de2:	e7d7      	b.n	c0de2d94 <pqcrystals_dilithium2_lowram_ntt+0x14>
c0de2de4:	0000d1a4 	.word	0x0000d1a4

c0de2de8 <pqcrystals_dilithium2_lowram_invntt_tomont>:
c0de2de8:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de2dec:	4604      	mov	r4, r0
c0de2dee:	4822      	ldr	r0, [pc, #136]	@ (c0de2e78 <pqcrystals_dilithium2_lowram_invntt_tomont+0x90>)
c0de2df0:	f04f 0801 	mov.w	r8, #1
c0de2df4:	f44f 7a80 	mov.w	sl, #256	@ 0x100
c0de2df8:	4478      	add	r0, pc
c0de2dfa:	9001      	str	r0, [sp, #4]
c0de2dfc:	f1b8 0fff 	cmp.w	r8, #255	@ 0xff
c0de2e00:	d828      	bhi.n	c0de2e54 <pqcrystals_dilithium2_lowram_invntt_tomont+0x6c>
c0de2e02:	2700      	movs	r7, #0
c0de2e04:	2fff      	cmp	r7, #255	@ 0xff
c0de2e06:	d822      	bhi.n	c0de2e4e <pqcrystals_dilithium2_lowram_invntt_tomont+0x66>
c0de2e08:	9801      	ldr	r0, [sp, #4]
c0de2e0a:	f1aa 0a01 	sub.w	sl, sl, #1
c0de2e0e:	eb07 0608 	add.w	r6, r7, r8
c0de2e12:	4635      	mov	r5, r6
c0de2e14:	f850 002a 	ldr.w	r0, [r0, sl, lsl #2]
c0de2e18:	f1c0 0b00 	rsb	fp, r0, #0
c0de2e1c:	42b7      	cmp	r7, r6
c0de2e1e:	d214      	bcs.n	c0de2e4a <pqcrystals_dilithium2_lowram_invntt_tomont+0x62>
c0de2e20:	f854 0027 	ldr.w	r0, [r4, r7, lsl #2]
c0de2e24:	f854 1025 	ldr.w	r1, [r4, r5, lsl #2]
c0de2e28:	4401      	add	r1, r0
c0de2e2a:	f844 1027 	str.w	r1, [r4, r7, lsl #2]
c0de2e2e:	f854 1025 	ldr.w	r1, [r4, r5, lsl #2]
c0de2e32:	1a40      	subs	r0, r0, r1
c0de2e34:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de2e38:	fb80 010b 	smull	r0, r1, r0, fp
c0de2e3c:	f000 faf8 	bl	c0de3430 <pqcrystals_dilithium2_lowram_montgomery_reduce>
c0de2e40:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de2e44:	3501      	adds	r5, #1
c0de2e46:	3701      	adds	r7, #1
c0de2e48:	e7e8      	b.n	c0de2e1c <pqcrystals_dilithium2_lowram_invntt_tomont+0x34>
c0de2e4a:	462f      	mov	r7, r5
c0de2e4c:	e7da      	b.n	c0de2e04 <pqcrystals_dilithium2_lowram_invntt_tomont+0x1c>
c0de2e4e:	ea4f 0848 	mov.w	r8, r8, lsl #1
c0de2e52:	e7d3      	b.n	c0de2dfc <pqcrystals_dilithium2_lowram_invntt_tomont+0x14>
c0de2e54:	2500      	movs	r5, #0
c0de2e56:	f24a 36fa 	movw	r6, #41978	@ 0xa3fa
c0de2e5a:	f5b5 7f80 	cmp.w	r5, #256	@ 0x100
c0de2e5e:	bf08      	it	eq
c0de2e60:	e8bd 8dfc 	ldmiaeq.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de2e64:	f854 0025 	ldr.w	r0, [r4, r5, lsl #2]
c0de2e68:	fb80 0106 	smull	r0, r1, r0, r6
c0de2e6c:	f000 fae0 	bl	c0de3430 <pqcrystals_dilithium2_lowram_montgomery_reduce>
c0de2e70:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de2e74:	3501      	adds	r5, #1
c0de2e76:	e7f0      	b.n	c0de2e5a <pqcrystals_dilithium2_lowram_invntt_tomont+0x72>
c0de2e78:	0000d13c 	.word	0x0000d13c

c0de2e7c <pqcrystals_dilithium2_lowram_poly_reduce>:
c0de2e7c:	b5b0      	push	{r4, r5, r7, lr}
c0de2e7e:	4604      	mov	r4, r0
c0de2e80:	2500      	movs	r5, #0
c0de2e82:	f5b5 7f80 	cmp.w	r5, #256	@ 0x100
c0de2e86:	bf08      	it	eq
c0de2e88:	bdb0      	popeq	{r4, r5, r7, pc}
c0de2e8a:	f854 0025 	ldr.w	r0, [r4, r5, lsl #2]
c0de2e8e:	f000 fadb 	bl	c0de3448 <pqcrystals_dilithium2_lowram_reduce32>
c0de2e92:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de2e96:	3501      	adds	r5, #1
c0de2e98:	e7f3      	b.n	c0de2e82 <pqcrystals_dilithium2_lowram_poly_reduce+0x6>

c0de2e9a <pqcrystals_dilithium2_lowram_poly_caddq>:
c0de2e9a:	b5b0      	push	{r4, r5, r7, lr}
c0de2e9c:	4604      	mov	r4, r0
c0de2e9e:	2500      	movs	r5, #0
c0de2ea0:	f5b5 7f80 	cmp.w	r5, #256	@ 0x100
c0de2ea4:	bf08      	it	eq
c0de2ea6:	bdb0      	popeq	{r4, r5, r7, pc}
c0de2ea8:	f854 0025 	ldr.w	r0, [r4, r5, lsl #2]
c0de2eac:	f000 fad6 	bl	c0de345c <pqcrystals_dilithium2_lowram_caddq>
c0de2eb0:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de2eb4:	3501      	adds	r5, #1
c0de2eb6:	e7f3      	b.n	c0de2ea0 <pqcrystals_dilithium2_lowram_poly_caddq+0x6>

c0de2eb8 <pqcrystals_dilithium2_lowram_poly_add>:
c0de2eb8:	b5b0      	push	{r4, r5, r7, lr}
c0de2eba:	2300      	movs	r3, #0
c0de2ebc:	f5b3 7f80 	cmp.w	r3, #256	@ 0x100
c0de2ec0:	bf08      	it	eq
c0de2ec2:	bdb0      	popeq	{r4, r5, r7, pc}
c0de2ec4:	f851 4023 	ldr.w	r4, [r1, r3, lsl #2]
c0de2ec8:	f852 5023 	ldr.w	r5, [r2, r3, lsl #2]
c0de2ecc:	442c      	add	r4, r5
c0de2ece:	f840 4023 	str.w	r4, [r0, r3, lsl #2]
c0de2ed2:	3301      	adds	r3, #1
c0de2ed4:	e7f2      	b.n	c0de2ebc <pqcrystals_dilithium2_lowram_poly_add+0x4>

c0de2ed6 <pqcrystals_dilithium2_lowram_poly_ntt>:
c0de2ed6:	f7ff bf53 	b.w	c0de2d80 <pqcrystals_dilithium2_lowram_ntt>

c0de2eda <pqcrystals_dilithium2_lowram_poly_invntt_tomont>:
c0de2eda:	f7ff bf85 	b.w	c0de2de8 <pqcrystals_dilithium2_lowram_invntt_tomont>

c0de2ede <pqcrystals_dilithium2_lowram_poly_pointwise_montgomery>:
c0de2ede:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de2ee0:	f000 fa99 	bl	c0de3416 <OUTLINED_FUNCTION_0>
c0de2ee4:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de2ee8:	bf08      	it	eq
c0de2eea:	bdf8      	popeq	{r3, r4, r5, r6, r7, pc}
c0de2eec:	f855 0027 	ldr.w	r0, [r5, r7, lsl #2]
c0de2ef0:	f854 1027 	ldr.w	r1, [r4, r7, lsl #2]
c0de2ef4:	fb81 0100 	smull	r0, r1, r1, r0
c0de2ef8:	f000 fa9a 	bl	c0de3430 <pqcrystals_dilithium2_lowram_montgomery_reduce>
c0de2efc:	f846 0027 	str.w	r0, [r6, r7, lsl #2]
c0de2f00:	3701      	adds	r7, #1
c0de2f02:	e7ef      	b.n	c0de2ee4 <pqcrystals_dilithium2_lowram_poly_pointwise_montgomery+0x6>

c0de2f04 <pqcrystals_dilithium2_lowram_poly_power2round>:
c0de2f04:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de2f06:	f000 fa86 	bl	c0de3416 <OUTLINED_FUNCTION_0>
c0de2f0a:	f5b7 6f80 	cmp.w	r7, #1024	@ 0x400
c0de2f0e:	bf08      	it	eq
c0de2f10:	bdf8      	popeq	{r3, r4, r5, r6, r7, pc}
c0de2f12:	59e1      	ldr	r1, [r4, r7]
c0de2f14:	19e8      	adds	r0, r5, r7
c0de2f16:	f000 fab9 	bl	c0de348c <pqcrystals_dilithium2_lowram_power2round>
c0de2f1a:	51f0      	str	r0, [r6, r7]
c0de2f1c:	3704      	adds	r7, #4
c0de2f1e:	e7f4      	b.n	c0de2f0a <pqcrystals_dilithium2_lowram_poly_power2round+0x6>

c0de2f20 <pqcrystals_dilithium2_lowram_poly_chknorm>:
c0de2f20:	4a09      	ldr	r2, [pc, #36]	@ (c0de2f48 <pqcrystals_dilithium2_lowram_poly_chknorm+0x28>)
c0de2f22:	4291      	cmp	r1, r2
c0de2f24:	dc0e      	bgt.n	c0de2f44 <pqcrystals_dilithium2_lowram_poly_chknorm+0x24>
c0de2f26:	2200      	movs	r2, #0
c0de2f28:	f5b2 7f80 	cmp.w	r2, #256	@ 0x100
c0de2f2c:	bf04      	itt	eq
c0de2f2e:	2000      	moveq	r0, #0
c0de2f30:	4770      	bxeq	lr
c0de2f32:	f850 3022 	ldr.w	r3, [r0, r2, lsl #2]
c0de2f36:	2b00      	cmp	r3, #0
c0de2f38:	bf48      	it	mi
c0de2f3a:	eba3 0343 	submi.w	r3, r3, r3, lsl #1
c0de2f3e:	3201      	adds	r2, #1
c0de2f40:	428b      	cmp	r3, r1
c0de2f42:	dbf1      	blt.n	c0de2f28 <pqcrystals_dilithium2_lowram_poly_chknorm+0x8>
c0de2f44:	2001      	movs	r0, #1
c0de2f46:	4770      	bx	lr
c0de2f48:	000ffc00 	.word	0x000ffc00

c0de2f4c <pqcrystals_dilithium2_lowram_poly_uniform>:
c0de2f4c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de2f50:	f5ad 6d84 	sub.w	sp, sp, #1056	@ 0x420
c0de2f54:	46e8      	mov	r8, sp
c0de2f56:	4683      	mov	fp, r0
c0de2f58:	4640      	mov	r0, r8
c0de2f5a:	f001 f854 	bl	c0de4006 <pqcrystals_dilithium2_lowram_dilithium_shake128_stream_init>
c0de2f5e:	f10d 06d6 	add.w	r6, sp, #214	@ 0xd6
c0de2f62:	2105      	movs	r1, #5
c0de2f64:	4642      	mov	r2, r8
c0de2f66:	4630      	mov	r0, r6
c0de2f68:	f7fe f99f 	bl	c0de12aa <pqcrystals_dilithium_fips202_ref_shake128_squeezeblocks>
c0de2f6c:	4658      	mov	r0, fp
c0de2f6e:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de2f72:	4632      	mov	r2, r6
c0de2f74:	f44f 7352 	mov.w	r3, #840	@ 0x348
c0de2f78:	f44f 7552 	mov.w	r5, #840	@ 0x348
c0de2f7c:	f000 f828 	bl	c0de2fd0 <rej_uniform>
c0de2f80:	4607      	mov	r7, r0
c0de2f82:	f04f 0a03 	mov.w	sl, #3
c0de2f86:	2fff      	cmp	r7, #255	@ 0xff
c0de2f88:	d81d      	bhi.n	c0de2fc6 <pqcrystals_dilithium2_lowram_poly_uniform+0x7a>
c0de2f8a:	fbb5 f0fa 	udiv	r0, r5, sl
c0de2f8e:	4631      	mov	r1, r6
c0de2f90:	eb00 0040 	add.w	r0, r0, r0, lsl #1
c0de2f94:	1a2c      	subs	r4, r5, r0
c0de2f96:	42a8      	cmp	r0, r5
c0de2f98:	d004      	beq.n	c0de2fa4 <pqcrystals_dilithium2_lowram_poly_uniform+0x58>
c0de2f9a:	5c0a      	ldrb	r2, [r1, r0]
c0de2f9c:	3d01      	subs	r5, #1
c0de2f9e:	700a      	strb	r2, [r1, #0]
c0de2fa0:	3101      	adds	r1, #1
c0de2fa2:	e7f8      	b.n	c0de2f96 <pqcrystals_dilithium2_lowram_poly_uniform+0x4a>
c0de2fa4:	1930      	adds	r0, r6, r4
c0de2fa6:	2101      	movs	r1, #1
c0de2fa8:	4642      	mov	r2, r8
c0de2faa:	f7fe f97e 	bl	c0de12aa <pqcrystals_dilithium_fips202_ref_shake128_squeezeblocks>
c0de2fae:	f044 05a8 	orr.w	r5, r4, #168	@ 0xa8
c0de2fb2:	eb0b 0087 	add.w	r0, fp, r7, lsl #2
c0de2fb6:	f5c7 7180 	rsb	r1, r7, #256	@ 0x100
c0de2fba:	4632      	mov	r2, r6
c0de2fbc:	462b      	mov	r3, r5
c0de2fbe:	f000 f807 	bl	c0de2fd0 <rej_uniform>
c0de2fc2:	4407      	add	r7, r0
c0de2fc4:	e7df      	b.n	c0de2f86 <pqcrystals_dilithium2_lowram_poly_uniform+0x3a>
c0de2fc6:	f50d 6d84 	add.w	sp, sp, #1056	@ 0x420
c0de2fca:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
	...

c0de2fd0 <rej_uniform>:
c0de2fd0:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de2fd2:	4c0f      	ldr	r4, [pc, #60]	@ (c0de3010 <rej_uniform+0x40>)
c0de2fd4:	4684      	mov	ip, r0
c0de2fd6:	2000      	movs	r0, #0
c0de2fd8:	2700      	movs	r7, #0
c0de2fda:	46a6      	mov	lr, r4
c0de2fdc:	4288      	cmp	r0, r1
c0de2fde:	d215      	bcs.n	c0de300c <rej_uniform+0x3c>
c0de2fe0:	1cfe      	adds	r6, r7, #3
c0de2fe2:	429e      	cmp	r6, r3
c0de2fe4:	d812      	bhi.n	c0de300c <rej_uniform+0x3c>
c0de2fe6:	5dd4      	ldrb	r4, [r2, r7]
c0de2fe8:	4417      	add	r7, r2
c0de2fea:	787d      	ldrb	r5, [r7, #1]
c0de2fec:	78bf      	ldrb	r7, [r7, #2]
c0de2fee:	ea44 2405 	orr.w	r4, r4, r5, lsl #8
c0de2ff2:	f007 057f 	and.w	r5, r7, #127	@ 0x7f
c0de2ff6:	4637      	mov	r7, r6
c0de2ff8:	ea44 4405 	orr.w	r4, r4, r5, lsl #16
c0de2ffc:	4675      	mov	r5, lr
c0de2ffe:	4574      	cmp	r4, lr
c0de3000:	d8ec      	bhi.n	c0de2fdc <rej_uniform+0xc>
c0de3002:	f84c 4020 	str.w	r4, [ip, r0, lsl #2]
c0de3006:	3001      	adds	r0, #1
c0de3008:	4637      	mov	r7, r6
c0de300a:	e7e7      	b.n	c0de2fdc <rej_uniform+0xc>
c0de300c:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de300e:	bf00      	nop
c0de3010:	007fe000 	.word	0x007fe000

c0de3014 <pqcrystals_dilithium2_lowram_poly_uniform_eta>:
c0de3014:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de3016:	b0d7      	sub	sp, #348	@ 0x15c
c0de3018:	466d      	mov	r5, sp
c0de301a:	4604      	mov	r4, r0
c0de301c:	4628      	mov	r0, r5
c0de301e:	f001 f806 	bl	c0de402e <pqcrystals_dilithium2_lowram_dilithium_shake256_stream_init>
c0de3022:	ae35      	add	r6, sp, #212	@ 0xd4
c0de3024:	2101      	movs	r1, #1
c0de3026:	462a      	mov	r2, r5
c0de3028:	4630      	mov	r0, r6
c0de302a:	f7fe f998 	bl	c0de135e <pqcrystals_dilithium_fips202_ref_shake256_squeezeblocks>
c0de302e:	4620      	mov	r0, r4
c0de3030:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de3034:	4632      	mov	r2, r6
c0de3036:	f000 f813 	bl	c0de3060 <rej_eta>
c0de303a:	4607      	mov	r7, r0
c0de303c:	2fff      	cmp	r7, #255	@ 0xff
c0de303e:	bf84      	itt	hi
c0de3040:	b057      	addhi	sp, #348	@ 0x15c
c0de3042:	bdf0      	pophi	{r4, r5, r6, r7, pc}
c0de3044:	4630      	mov	r0, r6
c0de3046:	2101      	movs	r1, #1
c0de3048:	462a      	mov	r2, r5
c0de304a:	f7fe f988 	bl	c0de135e <pqcrystals_dilithium_fips202_ref_shake256_squeezeblocks>
c0de304e:	eb04 0087 	add.w	r0, r4, r7, lsl #2
c0de3052:	f5c7 7180 	rsb	r1, r7, #256	@ 0x100
c0de3056:	4632      	mov	r2, r6
c0de3058:	f000 f802 	bl	c0de3060 <rej_eta>
c0de305c:	4407      	add	r7, r0
c0de305e:	e7ed      	b.n	c0de303c <pqcrystals_dilithium2_lowram_poly_uniform_eta+0x28>

c0de3060 <rej_eta>:
c0de3060:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de3062:	4603      	mov	r3, r0
c0de3064:	2000      	movs	r0, #0
c0de3066:	f04f 0ccd 	mov.w	ip, #205	@ 0xcd
c0de306a:	2500      	movs	r5, #0
c0de306c:	4288      	cmp	r0, r1
c0de306e:	d221      	bcs.n	c0de30b4 <rej_eta+0x54>
c0de3070:	2d87      	cmp	r5, #135	@ 0x87
c0de3072:	d81f      	bhi.n	c0de30b4 <rej_eta+0x54>
c0de3074:	5d56      	ldrb	r6, [r2, r5]
c0de3076:	f006 070f 	and.w	r7, r6, #15
c0de307a:	2f0f      	cmp	r7, #15
c0de307c:	d009      	beq.n	c0de3092 <rej_eta+0x32>
c0de307e:	fb07 f40c 	mul.w	r4, r7, ip
c0de3082:	0aa4      	lsrs	r4, r4, #10
c0de3084:	eb04 0484 	add.w	r4, r4, r4, lsl #2
c0de3088:	1be4      	subs	r4, r4, r7
c0de308a:	3402      	adds	r4, #2
c0de308c:	f843 4020 	str.w	r4, [r3, r0, lsl #2]
c0de3090:	3001      	adds	r0, #1
c0de3092:	0936      	lsrs	r6, r6, #4
c0de3094:	2e0f      	cmp	r6, #15
c0de3096:	d00b      	beq.n	c0de30b0 <rej_eta+0x50>
c0de3098:	4288      	cmp	r0, r1
c0de309a:	d209      	bcs.n	c0de30b0 <rej_eta+0x50>
c0de309c:	fb06 f40c 	mul.w	r4, r6, ip
c0de30a0:	0aa4      	lsrs	r4, r4, #10
c0de30a2:	eb04 0484 	add.w	r4, r4, r4, lsl #2
c0de30a6:	1ba4      	subs	r4, r4, r6
c0de30a8:	3402      	adds	r4, #2
c0de30aa:	f843 4020 	str.w	r4, [r3, r0, lsl #2]
c0de30ae:	3001      	adds	r0, #1
c0de30b0:	3501      	adds	r5, #1
c0de30b2:	e7db      	b.n	c0de306c <rej_eta+0xc>
c0de30b4:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0de30b6 <pqcrystals_dilithium2_lowram_polyz_unpack>:
c0de30b6:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de30b8:	3008      	adds	r0, #8
c0de30ba:	f04f 0c00 	mov.w	ip, #0
c0de30be:	f5bc 7f10 	cmp.w	ip, #576	@ 0x240
c0de30c2:	bf08      	it	eq
c0de30c4:	bdf0      	popeq	{r4, r5, r6, r7, pc}
c0de30c6:	f811 300c 	ldrb.w	r3, [r1, ip]
c0de30ca:	eb01 040c 	add.w	r4, r1, ip
c0de30ce:	f10c 0c09 	add.w	ip, ip, #9
c0de30d2:	f840 3c08 	str.w	r3, [r0, #-8]
c0de30d6:	7865      	ldrb	r5, [r4, #1]
c0de30d8:	ea43 2305 	orr.w	r3, r3, r5, lsl #8
c0de30dc:	f840 3c08 	str.w	r3, [r0, #-8]
c0de30e0:	78a5      	ldrb	r5, [r4, #2]
c0de30e2:	f365 4311 	bfi	r3, r5, #16, #2
c0de30e6:	f840 3c08 	str.w	r3, [r0, #-8]
c0de30ea:	f5c3 3300 	rsb	r3, r3, #131072	@ 0x20000
c0de30ee:	78a5      	ldrb	r5, [r4, #2]
c0de30f0:	08ae      	lsrs	r6, r5, #2
c0de30f2:	f840 6c04 	str.w	r6, [r0, #-4]
c0de30f6:	78e6      	ldrb	r6, [r4, #3]
c0de30f8:	01b6      	lsls	r6, r6, #6
c0de30fa:	ea46 0595 	orr.w	r5, r6, r5, lsr #2
c0de30fe:	f840 5c04 	str.w	r5, [r0, #-4]
c0de3102:	7926      	ldrb	r6, [r4, #4]
c0de3104:	f366 3591 	bfi	r5, r6, #14, #4
c0de3108:	f840 5c04 	str.w	r5, [r0, #-4]
c0de310c:	f5c5 3500 	rsb	r5, r5, #131072	@ 0x20000
c0de3110:	7926      	ldrb	r6, [r4, #4]
c0de3112:	0937      	lsrs	r7, r6, #4
c0de3114:	6007      	str	r7, [r0, #0]
c0de3116:	7967      	ldrb	r7, [r4, #5]
c0de3118:	013f      	lsls	r7, r7, #4
c0de311a:	ea47 1616 	orr.w	r6, r7, r6, lsr #4
c0de311e:	6006      	str	r6, [r0, #0]
c0de3120:	79a7      	ldrb	r7, [r4, #6]
c0de3122:	f367 3611 	bfi	r6, r7, #12, #6
c0de3126:	6006      	str	r6, [r0, #0]
c0de3128:	f5c6 3600 	rsb	r6, r6, #131072	@ 0x20000
c0de312c:	79a7      	ldrb	r7, [r4, #6]
c0de312e:	09ba      	lsrs	r2, r7, #6
c0de3130:	6042      	str	r2, [r0, #4]
c0de3132:	79e2      	ldrb	r2, [r4, #7]
c0de3134:	0092      	lsls	r2, r2, #2
c0de3136:	ea42 1297 	orr.w	r2, r2, r7, lsr #6
c0de313a:	6042      	str	r2, [r0, #4]
c0de313c:	7a24      	ldrb	r4, [r4, #8]
c0de313e:	6006      	str	r6, [r0, #0]
c0de3140:	f840 5c04 	str.w	r5, [r0, #-4]
c0de3144:	f840 3c08 	str.w	r3, [r0, #-8]
c0de3148:	ea42 2284 	orr.w	r2, r2, r4, lsl #10
c0de314c:	f5c2 3200 	rsb	r2, r2, #131072	@ 0x20000
c0de3150:	6042      	str	r2, [r0, #4]
c0de3152:	3010      	adds	r0, #16
c0de3154:	e7b3      	b.n	c0de30be <pqcrystals_dilithium2_lowram_polyz_unpack+0x8>

c0de3156 <pqcrystals_dilithium2_lowram_poly_challenge>:
c0de3156:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de315a:	b0d6      	sub	sp, #344	@ 0x158
c0de315c:	466e      	mov	r6, sp
c0de315e:	4680      	mov	r8, r0
c0de3160:	460d      	mov	r5, r1
c0de3162:	4630      	mov	r0, r6
c0de3164:	f7fe f8c4 	bl	c0de12f0 <pqcrystals_dilithium_fips202_ref_shake256_init>
c0de3168:	4630      	mov	r0, r6
c0de316a:	4629      	mov	r1, r5
c0de316c:	2220      	movs	r2, #32
c0de316e:	f7fe f8c7 	bl	c0de1300 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
c0de3172:	4630      	mov	r0, r6
c0de3174:	f7fe f8cf 	bl	c0de1316 <pqcrystals_dilithium_fips202_ref_shake256_finalize>
c0de3178:	ad34      	add	r5, sp, #208	@ 0xd0
c0de317a:	2101      	movs	r1, #1
c0de317c:	4632      	mov	r2, r6
c0de317e:	4628      	mov	r0, r5
c0de3180:	f7fe f8ed 	bl	c0de135e <pqcrystals_dilithium_fips202_ref_shake256_squeezeblocks>
c0de3184:	2600      	movs	r6, #0
c0de3186:	462c      	mov	r4, r5
c0de3188:	2700      	movs	r7, #0
c0de318a:	f04f 0a00 	mov.w	sl, #0
c0de318e:	2e40      	cmp	r6, #64	@ 0x40
c0de3190:	d006      	beq.n	c0de31a0 <pqcrystals_dilithium2_lowram_poly_challenge+0x4a>
c0de3192:	f000 f945 	bl	c0de3420 <OUTLINED_FUNCTION_1>
c0de3196:	ea4a 0a01 	orr.w	sl, sl, r1
c0de319a:	4307      	orrs	r7, r0
c0de319c:	3608      	adds	r6, #8
c0de319e:	e7f6      	b.n	c0de318e <pqcrystals_dilithium2_lowram_poly_challenge+0x38>
c0de31a0:	2000      	movs	r0, #0
c0de31a2:	2100      	movs	r1, #0
c0de31a4:	f5b1 7f80 	cmp.w	r1, #256	@ 0x100
c0de31a8:	d003      	beq.n	c0de31b2 <pqcrystals_dilithium2_lowram_poly_challenge+0x5c>
c0de31aa:	f848 0021 	str.w	r0, [r8, r1, lsl #2]
c0de31ae:	3101      	adds	r1, #1
c0de31b0:	e7f8      	b.n	c0de31a4 <pqcrystals_dilithium2_lowram_poly_challenge+0x4e>
c0de31b2:	2008      	movs	r0, #8
c0de31b4:	24d9      	movs	r4, #217	@ 0xd9
c0de31b6:	466e      	mov	r6, sp
c0de31b8:	f04f 0b02 	mov.w	fp, #2
c0de31bc:	f5b4 7f80 	cmp.w	r4, #256	@ 0x100
c0de31c0:	d01b      	beq.n	c0de31fa <pqcrystals_dilithium2_lowram_poly_challenge+0xa4>
c0de31c2:	2888      	cmp	r0, #136	@ 0x88
c0de31c4:	d305      	bcc.n	c0de31d2 <pqcrystals_dilithium2_lowram_poly_challenge+0x7c>
c0de31c6:	4628      	mov	r0, r5
c0de31c8:	2101      	movs	r1, #1
c0de31ca:	4632      	mov	r2, r6
c0de31cc:	f7fe f8c7 	bl	c0de135e <pqcrystals_dilithium_fips202_ref_shake256_squeezeblocks>
c0de31d0:	2000      	movs	r0, #0
c0de31d2:	5c29      	ldrb	r1, [r5, r0]
c0de31d4:	3001      	adds	r0, #1
c0de31d6:	428c      	cmp	r4, r1
c0de31d8:	d3f3      	bcc.n	c0de31c2 <pqcrystals_dilithium2_lowram_poly_challenge+0x6c>
c0de31da:	f858 2021 	ldr.w	r2, [r8, r1, lsl #2]
c0de31de:	ea5f 0a5a 	movs.w	sl, sl, lsr #1
c0de31e2:	f848 2024 	str.w	r2, [r8, r4, lsl #2]
c0de31e6:	ea0b 0247 	and.w	r2, fp, r7, lsl #1
c0de31ea:	ea4f 0737 	mov.w	r7, r7, rrx
c0de31ee:	3401      	adds	r4, #1
c0de31f0:	f1c2 0201 	rsb	r2, r2, #1
c0de31f4:	f848 2021 	str.w	r2, [r8, r1, lsl #2]
c0de31f8:	e7e0      	b.n	c0de31bc <pqcrystals_dilithium2_lowram_poly_challenge+0x66>
c0de31fa:	b056      	add	sp, #344	@ 0x158
c0de31fc:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de3200 <pqcrystals_dilithium2_lowram_polyeta_pack>:
c0de3200:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de3204:	3001      	adds	r0, #1
c0de3206:	2200      	movs	r2, #0
c0de3208:	2640      	movs	r6, #64	@ 0x40
c0de320a:	f5b2 6f80 	cmp.w	r2, #1024	@ 0x400
c0de320e:	bf08      	it	eq
c0de3210:	e8bd 8df0 	ldmiaeq.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de3214:	188b      	adds	r3, r1, r2
c0de3216:	f851 8002 	ldr.w	r8, [r1, r2]
c0de321a:	2710      	movs	r7, #16
c0de321c:	3220      	adds	r2, #32
c0de321e:	f103 0b04 	add.w	fp, r3, #4
c0de3222:	f103 0e10 	add.w	lr, r3, #16
c0de3226:	69db      	ldr	r3, [r3, #28]
c0de3228:	e89b 0830 	ldmia.w	fp, {r4, r5, fp}
c0de322c:	e89e 5400 	ldmia.w	lr, {sl, ip, lr}
c0de3230:	f1c5 0502 	rsb	r5, r5, #2
c0de3234:	eba6 1343 	sub.w	r3, r6, r3, lsl #5
c0de3238:	eba7 04c4 	sub.w	r4, r7, r4, lsl #3
c0de323c:	f1c8 0702 	rsb	r7, r8, #2
c0de3240:	b2ed      	uxtb	r5, r5
c0de3242:	433c      	orrs	r4, r7
c0de3244:	f1cc 0702 	rsb	r7, ip, #2
c0de3248:	ea44 1485 	orr.w	r4, r4, r5, lsl #6
c0de324c:	b2ff      	uxtb	r7, r7
c0de324e:	f800 4c01 	strb.w	r4, [r0, #-1]
c0de3252:	2408      	movs	r4, #8
c0de3254:	eba4 048e 	sub.w	r4, r4, lr, lsl #2
c0de3258:	ea44 0457 	orr.w	r4, r4, r7, lsr #1
c0de325c:	4323      	orrs	r3, r4
c0de325e:	2420      	movs	r4, #32
c0de3260:	7043      	strb	r3, [r0, #1]
c0de3262:	2304      	movs	r3, #4
c0de3264:	eba4 140a 	sub.w	r4, r4, sl, lsl #4
c0de3268:	eba3 034b 	sub.w	r3, r3, fp, lsl #1
c0de326c:	ea43 0395 	orr.w	r3, r3, r5, lsr #2
c0de3270:	4323      	orrs	r3, r4
c0de3272:	ea43 13c7 	orr.w	r3, r3, r7, lsl #7
c0de3276:	f800 3b03 	strb.w	r3, [r0], #3
c0de327a:	e7c6      	b.n	c0de320a <pqcrystals_dilithium2_lowram_polyeta_pack+0xa>

c0de327c <pqcrystals_dilithium2_lowram_polyt1_pack>:
c0de327c:	b5b0      	push	{r4, r5, r7, lr}
c0de327e:	3108      	adds	r1, #8
c0de3280:	2200      	movs	r2, #0
c0de3282:	f5b2 7fa0 	cmp.w	r2, #320	@ 0x140
c0de3286:	bf08      	it	eq
c0de3288:	bdb0      	popeq	{r4, r5, r7, pc}
c0de328a:	f851 3c08 	ldr.w	r3, [r1, #-8]
c0de328e:	5483      	strb	r3, [r0, r2]
c0de3290:	1883      	adds	r3, r0, r2
c0de3292:	3205      	adds	r2, #5
c0de3294:	e951 4502 	ldrd	r4, r5, [r1, #-8]
c0de3298:	00ad      	lsls	r5, r5, #2
c0de329a:	ea45 2414 	orr.w	r4, r5, r4, lsr #8
c0de329e:	705c      	strb	r4, [r3, #1]
c0de32a0:	680d      	ldr	r5, [r1, #0]
c0de32a2:	f851 4c04 	ldr.w	r4, [r1, #-4]
c0de32a6:	012d      	lsls	r5, r5, #4
c0de32a8:	ea45 1494 	orr.w	r4, r5, r4, lsr #6
c0de32ac:	709c      	strb	r4, [r3, #2]
c0de32ae:	e9d1 4500 	ldrd	r4, r5, [r1]
c0de32b2:	01ad      	lsls	r5, r5, #6
c0de32b4:	ea45 1414 	orr.w	r4, r5, r4, lsr #4
c0de32b8:	70dc      	strb	r4, [r3, #3]
c0de32ba:	684c      	ldr	r4, [r1, #4]
c0de32bc:	3110      	adds	r1, #16
c0de32be:	08a4      	lsrs	r4, r4, #2
c0de32c0:	711c      	strb	r4, [r3, #4]
c0de32c2:	e7de      	b.n	c0de3282 <pqcrystals_dilithium2_lowram_polyt1_pack+0x6>

c0de32c4 <pqcrystals_dilithium2_lowram_polyt0_pack>:
c0de32c4:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de32c8:	311c      	adds	r1, #28
c0de32ca:	f04f 0c00 	mov.w	ip, #0
c0de32ce:	9000      	str	r0, [sp, #0]
c0de32d0:	f5bc 7fd0 	cmp.w	ip, #416	@ 0x1a0
c0de32d4:	bf08      	it	eq
c0de32d6:	e8bd 8dfc 	ldmiaeq.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de32da:	f851 0c14 	ldr.w	r0, [r1, #-20]
c0de32de:	e951 a504 	ldrd	sl, r5, [r1, #-16]
c0de32e2:	e951 3807 	ldrd	r3, r8, [r1, #-28]
c0de32e6:	e951 e602 	ldrd	lr, r6, [r1, #-8]
c0de32ea:	f851 7b20 	ldr.w	r7, [r1], #32
c0de32ee:	9001      	str	r0, [sp, #4]
c0de32f0:	9800      	ldr	r0, [sp, #0]
c0de32f2:	f5c7 5780 	rsb	r7, r7, #4096	@ 0x1000
c0de32f6:	f5c3 5b80 	rsb	fp, r3, #4096	@ 0x1000
c0de32fa:	f5c5 5580 	rsb	r5, r5, #4096	@ 0x1000
c0de32fe:	097b      	lsrs	r3, r7, #5
c0de3300:	eb00 040c 	add.w	r4, r0, ip
c0de3304:	f800 b00c 	strb.w	fp, [r0, ip]
c0de3308:	f10c 0c0d 	add.w	ip, ip, #13
c0de330c:	7323      	strb	r3, [r4, #12]
c0de330e:	f5c6 5380 	rsb	r3, r6, #4096	@ 0x1000
c0de3312:	089e      	lsrs	r6, r3, #2
c0de3314:	72a6      	strb	r6, [r4, #10]
c0de3316:	092e      	lsrs	r6, r5, #4
c0de3318:	71e6      	strb	r6, [r4, #7]
c0de331a:	f5ca 5680 	rsb	r6, sl, #4096	@ 0x1000
c0de331e:	0872      	lsrs	r2, r6, #1
c0de3320:	7162      	strb	r2, [r4, #5]
c0de3322:	f5c8 5280 	rsb	r2, r8, #4096	@ 0x1000
c0de3326:	08d0      	lsrs	r0, r2, #3
c0de3328:	70a0      	strb	r0, [r4, #2]
c0de332a:	00f8      	lsls	r0, r7, #3
c0de332c:	ea40 2093 	orr.w	r0, r0, r3, lsr #10
c0de3330:	019b      	lsls	r3, r3, #6
c0de3332:	72e0      	strb	r0, [r4, #11]
c0de3334:	f5ce 5080 	rsb	r0, lr, #4096	@ 0x1000
c0de3338:	ea43 13d0 	orr.w	r3, r3, r0, lsr #7
c0de333c:	0040      	lsls	r0, r0, #1
c0de333e:	ea40 3015 	orr.w	r0, r0, r5, lsr #12
c0de3342:	7263      	strb	r3, [r4, #9]
c0de3344:	01f3      	lsls	r3, r6, #7
c0de3346:	7220      	strb	r0, [r4, #8]
c0de3348:	0128      	lsls	r0, r5, #4
c0de334a:	ea40 2056 	orr.w	r0, r0, r6, lsr #9
c0de334e:	71a0      	strb	r0, [r4, #6]
c0de3350:	9801      	ldr	r0, [sp, #4]
c0de3352:	f5c0 5080 	rsb	r0, r0, #4096	@ 0x1000
c0de3356:	ea43 1390 	orr.w	r3, r3, r0, lsr #6
c0de335a:	0080      	lsls	r0, r0, #2
c0de335c:	ea40 20d2 	orr.w	r0, r0, r2, lsr #11
c0de3360:	7123      	strb	r3, [r4, #4]
c0de3362:	70e0      	strb	r0, [r4, #3]
c0de3364:	0150      	lsls	r0, r2, #5
c0de3366:	ea40 201b 	orr.w	r0, r0, fp, lsr #8
c0de336a:	7060      	strb	r0, [r4, #1]
c0de336c:	e7b0      	b.n	c0de32d0 <pqcrystals_dilithium2_lowram_polyt0_pack+0xc>

c0de336e <pqcrystals_dilithium2_lowram_polyz_pack>:
c0de336e:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de3370:	3108      	adds	r1, #8
c0de3372:	f04f 0e00 	mov.w	lr, #0
c0de3376:	f5be 7f10 	cmp.w	lr, #576	@ 0x240
c0de337a:	bf08      	it	eq
c0de337c:	bdf0      	popeq	{r4, r5, r6, r7, pc}
c0de337e:	e951 3c02 	ldrd	r3, ip, [r1, #-8]
c0de3382:	e8f1 5604 	ldrd	r5, r6, [r1], #16
c0de3386:	eb00 070e 	add.w	r7, r0, lr
c0de338a:	f5c6 3600 	rsb	r6, r6, #131072	@ 0x20000
c0de338e:	f5c3 3300 	rsb	r3, r3, #131072	@ 0x20000
c0de3392:	0ab4      	lsrs	r4, r6, #10
c0de3394:	f800 300e 	strb.w	r3, [r0, lr]
c0de3398:	f10e 0e09 	add.w	lr, lr, #9
c0de339c:	723c      	strb	r4, [r7, #8]
c0de339e:	08b4      	lsrs	r4, r6, #2
c0de33a0:	71fc      	strb	r4, [r7, #7]
c0de33a2:	f5c5 3400 	rsb	r4, r5, #131072	@ 0x20000
c0de33a6:	0925      	lsrs	r5, r4, #4
c0de33a8:	717d      	strb	r5, [r7, #5]
c0de33aa:	f5cc 3500 	rsb	r5, ip, #131072	@ 0x20000
c0de33ae:	09aa      	lsrs	r2, r5, #6
c0de33b0:	70fa      	strb	r2, [r7, #3]
c0de33b2:	0a1a      	lsrs	r2, r3, #8
c0de33b4:	707a      	strb	r2, [r7, #1]
c0de33b6:	01b2      	lsls	r2, r6, #6
c0de33b8:	ea42 3214 	orr.w	r2, r2, r4, lsr #12
c0de33bc:	71ba      	strb	r2, [r7, #6]
c0de33be:	0122      	lsls	r2, r4, #4
c0de33c0:	ea42 3295 	orr.w	r2, r2, r5, lsr #14
c0de33c4:	713a      	strb	r2, [r7, #4]
c0de33c6:	00aa      	lsls	r2, r5, #2
c0de33c8:	ea42 4213 	orr.w	r2, r2, r3, lsr #16
c0de33cc:	70ba      	strb	r2, [r7, #2]
c0de33ce:	e7d2      	b.n	c0de3376 <pqcrystals_dilithium2_lowram_polyz_pack+0x8>

c0de33d0 <pqcrystals_dilithium2_lowram_polyw1_pack>:
c0de33d0:	b5b0      	push	{r4, r5, r7, lr}
c0de33d2:	3001      	adds	r0, #1
c0de33d4:	2200      	movs	r2, #0
c0de33d6:	f5b2 6f80 	cmp.w	r2, #1024	@ 0x400
c0de33da:	bf08      	it	eq
c0de33dc:	bdb0      	popeq	{r4, r5, r7, pc}
c0de33de:	588b      	ldr	r3, [r1, r2]
c0de33e0:	188c      	adds	r4, r1, r2
c0de33e2:	3210      	adds	r2, #16
c0de33e4:	f800 3c01 	strb.w	r3, [r0, #-1]
c0de33e8:	6865      	ldr	r5, [r4, #4]
c0de33ea:	ea43 1385 	orr.w	r3, r3, r5, lsl #6
c0de33ee:	f800 3c01 	strb.w	r3, [r0, #-1]
c0de33f2:	6863      	ldr	r3, [r4, #4]
c0de33f4:	089d      	lsrs	r5, r3, #2
c0de33f6:	7005      	strb	r5, [r0, #0]
c0de33f8:	68a5      	ldr	r5, [r4, #8]
c0de33fa:	012d      	lsls	r5, r5, #4
c0de33fc:	ea45 0393 	orr.w	r3, r5, r3, lsr #2
c0de3400:	7003      	strb	r3, [r0, #0]
c0de3402:	68a3      	ldr	r3, [r4, #8]
c0de3404:	091d      	lsrs	r5, r3, #4
c0de3406:	7045      	strb	r5, [r0, #1]
c0de3408:	68e4      	ldr	r4, [r4, #12]
c0de340a:	00a4      	lsls	r4, r4, #2
c0de340c:	ea44 1313 	orr.w	r3, r4, r3, lsr #4
c0de3410:	7043      	strb	r3, [r0, #1]
c0de3412:	3003      	adds	r0, #3
c0de3414:	e7df      	b.n	c0de33d6 <pqcrystals_dilithium2_lowram_polyw1_pack+0x6>

c0de3416 <OUTLINED_FUNCTION_0>:
c0de3416:	4614      	mov	r4, r2
c0de3418:	460d      	mov	r5, r1
c0de341a:	4606      	mov	r6, r0
c0de341c:	2700      	movs	r7, #0
c0de341e:	4770      	bx	lr

c0de3420 <OUTLINED_FUNCTION_1>:
c0de3420:	f814 0b01 	ldrb.w	r0, [r4], #1
c0de3424:	2100      	movs	r1, #0
c0de3426:	4632      	mov	r2, r6
c0de3428:	f009 bd60 	b.w	c0deceec <__aeabi_llsl>

c0de342c <randombytes>:
c0de342c:	f009 b93b 	b.w	c0dec6a6 <cx_rng_no_throw>

c0de3430 <pqcrystals_dilithium2_lowram_montgomery_reduce>:
c0de3430:	4a03      	ldr	r2, [pc, #12]	@ (c0de3440 <pqcrystals_dilithium2_lowram_montgomery_reduce+0x10>)
c0de3432:	4b04      	ldr	r3, [pc, #16]	@ (c0de3444 <pqcrystals_dilithium2_lowram_montgomery_reduce+0x14>)
c0de3434:	4342      	muls	r2, r0
c0de3436:	fbc2 0103 	smlal	r0, r1, r2, r3
c0de343a:	4608      	mov	r0, r1
c0de343c:	4770      	bx	lr
c0de343e:	bf00      	nop
c0de3440:	03802001 	.word	0x03802001
c0de3444:	ff801fff 	.word	0xff801fff

c0de3448 <pqcrystals_dilithium2_lowram_reduce32>:
c0de3448:	f500 0180 	add.w	r1, r0, #4194304	@ 0x400000
c0de344c:	4a02      	ldr	r2, [pc, #8]	@ (c0de3458 <pqcrystals_dilithium2_lowram_reduce32+0x10>)
c0de344e:	15c9      	asrs	r1, r1, #23
c0de3450:	fb01 0002 	mla	r0, r1, r2, r0
c0de3454:	4770      	bx	lr
c0de3456:	bf00      	nop
c0de3458:	ff801fff 	.word	0xff801fff

c0de345c <pqcrystals_dilithium2_lowram_caddq>:
c0de345c:	4902      	ldr	r1, [pc, #8]	@ (c0de3468 <pqcrystals_dilithium2_lowram_caddq+0xc>)
c0de345e:	2800      	cmp	r0, #0
c0de3460:	bf48      	it	mi
c0de3462:	4408      	addmi	r0, r1
c0de3464:	4770      	bx	lr
c0de3466:	bf00      	nop
c0de3468:	007fe001 	.word	0x007fe001

c0de346c <pqcrystals_dilithium2_lowram_freeze>:
c0de346c:	f500 0180 	add.w	r1, r0, #4194304	@ 0x400000
c0de3470:	4a04      	ldr	r2, [pc, #16]	@ (c0de3484 <pqcrystals_dilithium2_lowram_freeze+0x18>)
c0de3472:	15c9      	asrs	r1, r1, #23
c0de3474:	fb01 0002 	mla	r0, r1, r2, r0
c0de3478:	4903      	ldr	r1, [pc, #12]	@ (c0de3488 <pqcrystals_dilithium2_lowram_freeze+0x1c>)
c0de347a:	2800      	cmp	r0, #0
c0de347c:	bf48      	it	mi
c0de347e:	4408      	addmi	r0, r1
c0de3480:	4770      	bx	lr
c0de3482:	bf00      	nop
c0de3484:	ff801fff 	.word	0xff801fff
c0de3488:	007fe001 	.word	0x007fe001

c0de348c <pqcrystals_dilithium2_lowram_power2round>:
c0de348c:	f601 72ff 	addw	r2, r1, #4095	@ 0xfff
c0de3490:	f641 73ff 	movw	r3, #8191	@ 0x1fff
c0de3494:	ea22 0303 	bic.w	r3, r2, r3
c0de3498:	1ac9      	subs	r1, r1, r3
c0de349a:	6001      	str	r1, [r0, #0]
c0de349c:	1350      	asrs	r0, r2, #13
c0de349e:	4770      	bx	lr

c0de34a0 <pqcrystals_dilithium2_lowram_decompose>:
c0de34a0:	b510      	push	{r4, lr}
c0de34a2:	f101 027f 	add.w	r2, r1, #127	@ 0x7f
c0de34a6:	f642 430b 	movw	r3, #11275	@ 0x2c0b
c0de34aa:	4c0c      	ldr	r4, [pc, #48]	@ (c0de34dc <pqcrystals_dilithium2_lowram_decompose+0x3c>)
c0de34ac:	11d2      	asrs	r2, r2, #7
c0de34ae:	4353      	muls	r3, r2
c0de34b0:	f503 0200 	add.w	r2, r3, #8388608	@ 0x800000
c0de34b4:	1612      	asrs	r2, r2, #24
c0de34b6:	f1b3 5f2e 	cmp.w	r3, #729808896	@ 0x2b800000
c0de34ba:	4b06      	ldr	r3, [pc, #24]	@ (c0de34d4 <pqcrystals_dilithium2_lowram_decompose+0x34>)
c0de34bc:	bfa8      	it	ge
c0de34be:	2200      	movge	r2, #0
c0de34c0:	fb02 1103 	mla	r1, r2, r3, r1
c0de34c4:	4b04      	ldr	r3, [pc, #16]	@ (c0de34d8 <pqcrystals_dilithium2_lowram_decompose+0x38>)
c0de34c6:	42a1      	cmp	r1, r4
c0de34c8:	bfc8      	it	gt
c0de34ca:	4419      	addgt	r1, r3
c0de34cc:	6001      	str	r1, [r0, #0]
c0de34ce:	4610      	mov	r0, r2
c0de34d0:	bd10      	pop	{r4, pc}
c0de34d2:	bf00      	nop
c0de34d4:	fffd1800 	.word	0xfffd1800
c0de34d8:	ff801fff 	.word	0xff801fff
c0de34dc:	003ff000 	.word	0x003ff000

c0de34e0 <pqcrystals_dilithium2_lowram_use_hint>:
c0de34e0:	b51c      	push	{r2, r3, r4, lr}
c0de34e2:	460c      	mov	r4, r1
c0de34e4:	4601      	mov	r1, r0
c0de34e6:	a801      	add	r0, sp, #4
c0de34e8:	f7ff ffda 	bl	c0de34a0 <pqcrystals_dilithium2_lowram_decompose>
c0de34ec:	b164      	cbz	r4, c0de3508 <pqcrystals_dilithium2_lowram_use_hint+0x28>
c0de34ee:	9901      	ldr	r1, [sp, #4]
c0de34f0:	2901      	cmp	r1, #1
c0de34f2:	db04      	blt.n	c0de34fe <pqcrystals_dilithium2_lowram_use_hint+0x1e>
c0de34f4:	f1b0 012b 	subs.w	r1, r0, #43	@ 0x2b
c0de34f8:	bf18      	it	ne
c0de34fa:	1c41      	addne	r1, r0, #1
c0de34fc:	e003      	b.n	c0de3506 <pqcrystals_dilithium2_lowram_use_hint+0x26>
c0de34fe:	1e41      	subs	r1, r0, #1
c0de3500:	2800      	cmp	r0, #0
c0de3502:	bf08      	it	eq
c0de3504:	212b      	moveq	r1, #43	@ 0x2b
c0de3506:	4608      	mov	r0, r1
c0de3508:	bd1c      	pop	{r2, r3, r4, pc}

c0de350a <pqcrystals_dilithium2_lowram_keypair>:
c0de350a:	b570      	push	{r4, r5, r6, lr}
c0de350c:	b088      	sub	sp, #32
c0de350e:	466e      	mov	r6, sp
c0de3510:	460c      	mov	r4, r1
c0de3512:	4605      	mov	r5, r0
c0de3514:	2120      	movs	r1, #32
c0de3516:	4630      	mov	r0, r6
c0de3518:	f7ff ff88 	bl	c0de342c <randombytes>
c0de351c:	4628      	mov	r0, r5
c0de351e:	4621      	mov	r1, r4
c0de3520:	4632      	mov	r2, r6
c0de3522:	f000 f803 	bl	c0de352c <crypto_sign_keypair_core>
c0de3526:	2000      	movs	r0, #0
c0de3528:	b008      	add	sp, #32
c0de352a:	bd70      	pop	{r4, r5, r6, pc}

c0de352c <crypto_sign_keypair_core>:
c0de352c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de3530:	f6ad 4d88 	subw	sp, sp, #3208	@ 0xc88
c0de3534:	f60d 4608 	addw	r6, sp, #3080	@ 0xc08
c0de3538:	460c      	mov	r4, r1
c0de353a:	4605      	mov	r5, r0
c0de353c:	4611      	mov	r1, r2
c0de353e:	2220      	movs	r2, #32
c0de3540:	4630      	mov	r0, r6
c0de3542:	f009 fddb 	bl	c0ded0fc <__aeabi_memcpy>
c0de3546:	f240 4004 	movw	r0, #1028	@ 0x404
c0de354a:	f8ad 0c28 	strh.w	r0, [sp, #3112]	@ 0xc28
c0de354e:	af02      	add	r7, sp, #8
c0de3550:	4638      	mov	r0, r7
c0de3552:	f7fd fecd 	bl	c0de12f0 <pqcrystals_dilithium_fips202_ref_shake256_init>
c0de3556:	4638      	mov	r0, r7
c0de3558:	4631      	mov	r1, r6
c0de355a:	2222      	movs	r2, #34	@ 0x22
c0de355c:	f7fd fed0 	bl	c0de1300 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
c0de3560:	4638      	mov	r0, r7
c0de3562:	f7fd fed8 	bl	c0de1316 <pqcrystals_dilithium_fips202_ref_shake256_finalize>
c0de3566:	4630      	mov	r0, r6
c0de3568:	2180      	movs	r1, #128	@ 0x80
c0de356a:	463a      	mov	r2, r7
c0de356c:	f7fd fede 	bl	c0de132c <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de3570:	4620      	mov	r0, r4
c0de3572:	4631      	mov	r1, r6
c0de3574:	f7ff fb57 	bl	c0de2c26 <pack_sk_rho>
c0de3578:	f106 0160 	add.w	r1, r6, #96	@ 0x60
c0de357c:	4620      	mov	r0, r4
c0de357e:	9401      	str	r4, [sp, #4]
c0de3580:	f7ff fb59 	bl	c0de2c36 <pack_sk_key>
c0de3584:	4628      	mov	r0, r5
c0de3586:	4631      	mov	r1, r6
c0de3588:	9500      	str	r5, [sp, #0]
c0de358a:	f7ff fb26 	bl	c0de2bda <pack_pk_rho>
c0de358e:	f106 0520 	add.w	r5, r6, #32
c0de3592:	f04f 0b00 	mov.w	fp, #0
c0de3596:	f50d 6481 	add.w	r4, sp, #1032	@ 0x408
c0de359a:	f60d 0608 	addw	r6, sp, #2056	@ 0x808
c0de359e:	f04f 0800 	mov.w	r8, #0
c0de35a2:	f1b8 0f04 	cmp.w	r8, #4
c0de35a6:	d072      	beq.n	c0de368e <crypto_sign_keypair_core+0x162>
c0de35a8:	4638      	mov	r0, r7
c0de35aa:	4629      	mov	r1, r5
c0de35ac:	2200      	movs	r2, #0
c0de35ae:	f7ff fd31 	bl	c0de3014 <pqcrystals_dilithium2_lowram_poly_uniform_eta>
c0de35b2:	f1b8 0f00 	cmp.w	r8, #0
c0de35b6:	d104      	bne.n	c0de35c2 <crypto_sign_keypair_core+0x96>
c0de35b8:	9801      	ldr	r0, [sp, #4]
c0de35ba:	4639      	mov	r1, r7
c0de35bc:	2200      	movs	r2, #0
c0de35be:	f7ff fb1b 	bl	c0de2bf8 <pack_sk_s1>
c0de35c2:	4638      	mov	r0, r7
c0de35c4:	f7ff fc87 	bl	c0de2ed6 <pqcrystals_dilithium2_lowram_poly_ntt>
c0de35c8:	ea4f 2008 	mov.w	r0, r8, lsl #8
c0de35cc:	f60d 4108 	addw	r1, sp, #3080	@ 0xc08
c0de35d0:	b282      	uxth	r2, r0
c0de35d2:	4620      	mov	r0, r4
c0de35d4:	f7ff fcba 	bl	c0de2f4c <pqcrystals_dilithium2_lowram_poly_uniform>
c0de35d8:	4630      	mov	r0, r6
c0de35da:	4621      	mov	r1, r4
c0de35dc:	463a      	mov	r2, r7
c0de35de:	f7ff fc7e 	bl	c0de2ede <pqcrystals_dilithium2_lowram_poly_pointwise_montgomery>
c0de35e2:	f04f 0a01 	mov.w	sl, #1
c0de35e6:	f1ba 0f04 	cmp.w	sl, #4
c0de35ea:	d020      	beq.n	c0de362e <crypto_sign_keypair_core+0x102>
c0de35ec:	fa1f f28a 	uxth.w	r2, sl
c0de35f0:	4638      	mov	r0, r7
c0de35f2:	4629      	mov	r1, r5
c0de35f4:	f7ff fd0e 	bl	c0de3014 <pqcrystals_dilithium2_lowram_poly_uniform_eta>
c0de35f8:	f1b8 0f00 	cmp.w	r8, #0
c0de35fc:	d104      	bne.n	c0de3608 <crypto_sign_keypair_core+0xdc>
c0de35fe:	9801      	ldr	r0, [sp, #4]
c0de3600:	4639      	mov	r1, r7
c0de3602:	4652      	mov	r2, sl
c0de3604:	f7ff faf8 	bl	c0de2bf8 <pack_sk_s1>
c0de3608:	4638      	mov	r0, r7
c0de360a:	f7ff fc64 	bl	c0de2ed6 <pqcrystals_dilithium2_lowram_poly_ntt>
c0de360e:	eb0b 000a 	add.w	r0, fp, sl
c0de3612:	f60d 4108 	addw	r1, sp, #3080	@ 0xc08
c0de3616:	b282      	uxth	r2, r0
c0de3618:	4620      	mov	r0, r4
c0de361a:	f7ff fc97 	bl	c0de2f4c <pqcrystals_dilithium2_lowram_poly_uniform>
c0de361e:	4630      	mov	r0, r6
c0de3620:	4621      	mov	r1, r4
c0de3622:	463a      	mov	r2, r7
c0de3624:	f7ff fb72 	bl	c0de2d0c <pqcrystals_dilithium2_lowram_poly_pointwise_acc_montgomery>
c0de3628:	f10a 0a01 	add.w	sl, sl, #1
c0de362c:	e7db      	b.n	c0de35e6 <crypto_sign_keypair_core+0xba>
c0de362e:	4630      	mov	r0, r6
c0de3630:	f7ff fc24 	bl	c0de2e7c <pqcrystals_dilithium2_lowram_poly_reduce>
c0de3634:	4630      	mov	r0, r6
c0de3636:	f7ff fc50 	bl	c0de2eda <pqcrystals_dilithium2_lowram_poly_invntt_tomont>
c0de363a:	f108 0004 	add.w	r0, r8, #4
c0de363e:	4629      	mov	r1, r5
c0de3640:	b282      	uxth	r2, r0
c0de3642:	4620      	mov	r0, r4
c0de3644:	f7ff fce6 	bl	c0de3014 <pqcrystals_dilithium2_lowram_poly_uniform_eta>
c0de3648:	f8dd a004 	ldr.w	sl, [sp, #4]
c0de364c:	4621      	mov	r1, r4
c0de364e:	4642      	mov	r2, r8
c0de3650:	4650      	mov	r0, sl
c0de3652:	f7ff fad8 	bl	c0de2c06 <pack_sk_s2>
c0de3656:	4630      	mov	r0, r6
c0de3658:	4631      	mov	r1, r6
c0de365a:	4622      	mov	r2, r4
c0de365c:	f7ff fc2c 	bl	c0de2eb8 <pqcrystals_dilithium2_lowram_poly_add>
c0de3660:	4630      	mov	r0, r6
c0de3662:	f7ff fc1a 	bl	c0de2e9a <pqcrystals_dilithium2_lowram_poly_caddq>
c0de3666:	4638      	mov	r0, r7
c0de3668:	4621      	mov	r1, r4
c0de366a:	4632      	mov	r2, r6
c0de366c:	f7ff fc4a 	bl	c0de2f04 <pqcrystals_dilithium2_lowram_poly_power2round>
c0de3670:	4650      	mov	r0, sl
c0de3672:	4621      	mov	r1, r4
c0de3674:	4642      	mov	r2, r8
c0de3676:	f7ff face 	bl	c0de2c16 <pack_sk_t0>
c0de367a:	9800      	ldr	r0, [sp, #0]
c0de367c:	4639      	mov	r1, r7
c0de367e:	4642      	mov	r2, r8
c0de3680:	f7ff fab3 	bl	c0de2bea <pack_pk_t1>
c0de3684:	f50b 7b80 	add.w	fp, fp, #256	@ 0x100
c0de3688:	f108 0801 	add.w	r8, r8, #1
c0de368c:	e789      	b.n	c0de35a2 <crypto_sign_keypair_core+0x76>
c0de368e:	ac02      	add	r4, sp, #8
c0de3690:	9e00      	ldr	r6, [sp, #0]
c0de3692:	2140      	movs	r1, #64	@ 0x40
c0de3694:	f44f 63a4 	mov.w	r3, #1312	@ 0x520
c0de3698:	4620      	mov	r0, r4
c0de369a:	4632      	mov	r2, r6
c0de369c:	f7fd fe62 	bl	c0de1364 <pqcrystals_dilithium_fips202_ref_shake256>
c0de36a0:	480c      	ldr	r0, [pc, #48]	@ (c0de36d4 <crypto_sign_keypair_core+0x1a8>)
c0de36a2:	4621      	mov	r1, r4
c0de36a4:	2240      	movs	r2, #64	@ 0x40
c0de36a6:	eb09 0500 	add.w	r5, r9, r0
c0de36aa:	f505 7008 	add.w	r0, r5, #544	@ 0x220
c0de36ae:	f009 fd25 	bl	c0ded0fc <__aeabi_memcpy>
c0de36b2:	f505 7018 	add.w	r0, r5, #608	@ 0x260
c0de36b6:	4631      	mov	r1, r6
c0de36b8:	f44f 62a4 	mov.w	r2, #1312	@ 0x520
c0de36bc:	f009 fd1e 	bl	c0ded0fc <__aeabi_memcpy>
c0de36c0:	9801      	ldr	r0, [sp, #4]
c0de36c2:	4621      	mov	r1, r4
c0de36c4:	f7ff fac0 	bl	c0de2c48 <pack_sk_tr>
c0de36c8:	2000      	movs	r0, #0
c0de36ca:	f60d 4d88 	addw	sp, sp, #3208	@ 0xc88
c0de36ce:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de36d2:	bf00      	nop
c0de36d4:	000002d8 	.word	0x000002d8

c0de36d8 <crypto_sign_signature_init>:
c0de36d8:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de36dc:	29ff      	cmp	r1, #255	@ 0xff
c0de36de:	d902      	bls.n	c0de36e6 <crypto_sign_signature_init+0xe>
c0de36e0:	f04f 34ff 	mov.w	r4, #4294967295	@ 0xffffffff
c0de36e4:	e01c      	b.n	c0de3720 <crypto_sign_signature_init+0x48>
c0de36e6:	4680      	mov	r8, r0
c0de36e8:	480f      	ldr	r0, [pc, #60]	@ (c0de3728 <crypto_sign_signature_init+0x50>)
c0de36ea:	2400      	movs	r4, #0
c0de36ec:	460d      	mov	r5, r1
c0de36ee:	eb09 0700 	add.w	r7, r9, r0
c0de36f2:	4638      	mov	r0, r7
c0de36f4:	f887 11a1 	strb.w	r1, [r7, #417]	@ 0x1a1
c0de36f8:	f887 41a0 	strb.w	r4, [r7, #416]	@ 0x1a0
c0de36fc:	f7fd fdf8 	bl	c0de12f0 <pqcrystals_dilithium_fips202_ref_shake256_init>
c0de3700:	4e0a      	ldr	r6, [pc, #40]	@ (c0de372c <crypto_sign_signature_init+0x54>)
c0de3702:	f507 7108 	add.w	r1, r7, #544	@ 0x220
c0de3706:	4638      	mov	r0, r7
c0de3708:	2240      	movs	r2, #64	@ 0x40
c0de370a:	447e      	add	r6, pc
c0de370c:	47b0      	blx	r6
c0de370e:	f507 71d0 	add.w	r1, r7, #416	@ 0x1a0
c0de3712:	4638      	mov	r0, r7
c0de3714:	2202      	movs	r2, #2
c0de3716:	47b0      	blx	r6
c0de3718:	4638      	mov	r0, r7
c0de371a:	4641      	mov	r1, r8
c0de371c:	462a      	mov	r2, r5
c0de371e:	47b0      	blx	r6
c0de3720:	4620      	mov	r0, r4
c0de3722:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de3726:	bf00      	nop
c0de3728:	000002d8 	.word	0x000002d8
c0de372c:	ffffdbf3 	.word	0xffffdbf3

c0de3730 <crypto_sign_signature_absorb>:
c0de3730:	b580      	push	{r7, lr}
c0de3732:	460a      	mov	r2, r1
c0de3734:	4601      	mov	r1, r0
c0de3736:	4803      	ldr	r0, [pc, #12]	@ (c0de3744 <crypto_sign_signature_absorb+0x14>)
c0de3738:	4448      	add	r0, r9
c0de373a:	f7fd fde1 	bl	c0de1300 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
c0de373e:	2000      	movs	r0, #0
c0de3740:	bd80      	pop	{r7, pc}
c0de3742:	bf00      	nop
c0de3744:	000002d8 	.word	0x000002d8

c0de3748 <crypto_sign_signature_core>:
c0de3748:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de374c:	f5ad 5d83 	sub.w	sp, sp, #4192	@ 0x1060
c0de3750:	b086      	sub	sp, #24
c0de3752:	f8df 8300 	ldr.w	r8, [pc, #768]	@ c0de3a54 <crypto_sign_signature_core+0x30c>
c0de3756:	900b      	str	r0, [sp, #44]	@ 0x2c
c0de3758:	4616      	mov	r6, r2
c0de375a:	9102      	str	r1, [sp, #8]
c0de375c:	eb09 0408 	add.w	r4, r9, r8
c0de3760:	4620      	mov	r0, r4
c0de3762:	f7fd fdd8 	bl	c0de1316 <pqcrystals_dilithium_fips202_ref_shake256_finalize>
c0de3766:	f504 70d0 	add.w	r0, r4, #416	@ 0x1a0
c0de376a:	2140      	movs	r1, #64	@ 0x40
c0de376c:	4622      	mov	r2, r4
c0de376e:	f7fd fddd 	bl	c0de132c <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de3772:	a80d      	add	r0, sp, #52	@ 0x34
c0de3774:	2100      	movs	r1, #0
c0de3776:	f500 7000 	add.w	r0, r0, #512	@ 0x200
c0de377a:	9009      	str	r0, [sp, #36]	@ 0x24
c0de377c:	2000      	movs	r0, #0
c0de377e:	2920      	cmp	r1, #32
c0de3780:	d006      	beq.n	c0de3790 <crypto_sign_signature_core+0x48>
c0de3782:	eb09 0208 	add.w	r2, r9, r8
c0de3786:	440a      	add	r2, r1
c0de3788:	3101      	adds	r1, #1
c0de378a:	f882 01e0 	strb.w	r0, [r2, #480]	@ 0x1e0
c0de378e:	e7f6      	b.n	c0de377e <crypto_sign_signature_core+0x36>
c0de3790:	eb09 0408 	add.w	r4, r9, r8
c0de3794:	4620      	mov	r0, r4
c0de3796:	f7fd fdab 	bl	c0de12f0 <pqcrystals_dilithium_fips202_ref_shake256_init>
c0de379a:	4fb0      	ldr	r7, [pc, #704]	@ (c0de3a5c <crypto_sign_signature_core+0x314>)
c0de379c:	f106 0120 	add.w	r1, r6, #32
c0de37a0:	4620      	mov	r0, r4
c0de37a2:	2220      	movs	r2, #32
c0de37a4:	447f      	add	r7, pc
c0de37a6:	47b8      	blx	r7
c0de37a8:	f504 75f0 	add.w	r5, r4, #480	@ 0x1e0
c0de37ac:	4620      	mov	r0, r4
c0de37ae:	2220      	movs	r2, #32
c0de37b0:	4629      	mov	r1, r5
c0de37b2:	47b8      	blx	r7
c0de37b4:	f504 71d0 	add.w	r1, r4, #416	@ 0x1a0
c0de37b8:	4620      	mov	r0, r4
c0de37ba:	2240      	movs	r2, #64	@ 0x40
c0de37bc:	47b8      	blx	r7
c0de37be:	4620      	mov	r0, r4
c0de37c0:	f7fd fda9 	bl	c0de1316 <pqcrystals_dilithium_fips202_ref_shake256_finalize>
c0de37c4:	4628      	mov	r0, r5
c0de37c6:	2140      	movs	r1, #64	@ 0x40
c0de37c8:	4622      	mov	r2, r4
c0de37ca:	f7fd fdaf 	bl	c0de132c <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de37ce:	f506 7060 	add.w	r0, r6, #896	@ 0x380
c0de37d2:	2100      	movs	r1, #0
c0de37d4:	f04f 0b00 	mov.w	fp, #0
c0de37d8:	9003      	str	r0, [sp, #12]
c0de37da:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de37dc:	3020      	adds	r0, #32
c0de37de:	9004      	str	r0, [sp, #16]
c0de37e0:	ac0d      	add	r4, sp, #52	@ 0x34
c0de37e2:	2001      	movs	r0, #1
c0de37e4:	9106      	str	r1, [sp, #24]
c0de37e6:	9005      	str	r0, [sp, #20]
c0de37e8:	b280      	uxth	r0, r0
c0de37ea:	f64f 71fc 	movw	r1, #65532	@ 0xfffc
c0de37ee:	eb01 0080 	add.w	r0, r1, r0, lsl #2
c0de37f2:	f50d 618f 	add.w	r1, sp, #1144	@ 0x478
c0de37f6:	9008      	str	r0, [sp, #32]
c0de37f8:	2000      	movs	r0, #0
c0de37fa:	2804      	cmp	r0, #4
c0de37fc:	d00b      	beq.n	c0de3816 <crypto_sign_signature_core+0xce>
c0de37fe:	2200      	movs	r2, #0
c0de3800:	f5b2 7f40 	cmp.w	r2, #768	@ 0x300
c0de3804:	d003      	beq.n	c0de380e <crypto_sign_signature_core+0xc6>
c0de3806:	f801 b002 	strb.w	fp, [r1, r2]
c0de380a:	3201      	adds	r2, #1
c0de380c:	e7f8      	b.n	c0de3800 <crypto_sign_signature_core+0xb8>
c0de380e:	f501 7140 	add.w	r1, r1, #768	@ 0x300
c0de3812:	3001      	adds	r0, #1
c0de3814:	e7f1      	b.n	c0de37fa <crypto_sign_signature_core+0xb2>
c0de3816:	9806      	ldr	r0, [sp, #24]
c0de3818:	f04f 0a00 	mov.w	sl, #0
c0de381c:	b280      	uxth	r0, r0
c0de381e:	0080      	lsls	r0, r0, #2
c0de3820:	900a      	str	r0, [sp, #40]	@ 0x28
c0de3822:	f1ba 0f04 	cmp.w	sl, #4
c0de3826:	d026      	beq.n	c0de3876 <crypto_sign_signature_core+0x12e>
c0de3828:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de382a:	eb09 0308 	add.w	r3, r9, r8
c0de382e:	f503 71f0 	add.w	r1, r3, #480	@ 0x1e0
c0de3832:	4450      	add	r0, sl
c0de3834:	b282      	uxth	r2, r0
c0de3836:	4620      	mov	r0, r4
c0de3838:	f7ff f8c7 	bl	c0de29ca <poly_uniform_gamma1_lowram>
c0de383c:	4620      	mov	r0, r4
c0de383e:	f7ff fb4a 	bl	c0de2ed6 <pqcrystals_dilithium2_lowram_poly_ntt>
c0de3842:	2700      	movs	r7, #0
c0de3844:	f50d 658f 	add.w	r5, sp, #1144	@ 0x478
c0de3848:	f5b7 6f80 	cmp.w	r7, #1024	@ 0x400
c0de384c:	d010      	beq.n	c0de3870 <crypto_sign_signature_core+0x128>
c0de384e:	eb09 0008 	add.w	r0, r9, r8
c0de3852:	4621      	mov	r1, r4
c0de3854:	4632      	mov	r2, r6
c0de3856:	30d0      	adds	r0, #208	@ 0xd0
c0de3858:	9000      	str	r0, [sp, #0]
c0de385a:	eb0a 0007 	add.w	r0, sl, r7
c0de385e:	b283      	uxth	r3, r0
c0de3860:	4628      	mov	r0, r5
c0de3862:	f7ff f86f 	bl	c0de2944 <poly_uniform_pointwise_montgomery_polywadd_lowram>
c0de3866:	f505 7540 	add.w	r5, r5, #768	@ 0x300
c0de386a:	f507 7780 	add.w	r7, r7, #256	@ 0x100
c0de386e:	e7eb      	b.n	c0de3848 <crypto_sign_signature_core+0x100>
c0de3870:	f10a 0a01 	add.w	sl, sl, #1
c0de3874:	e7d5      	b.n	c0de3822 <crypto_sign_signature_core+0xda>
c0de3876:	2700      	movs	r7, #0
c0de3878:	f50d 658f 	add.w	r5, sp, #1144	@ 0x478
c0de387c:	f5b7 7f40 	cmp.w	r7, #768	@ 0x300
c0de3880:	d01a      	beq.n	c0de38b8 <crypto_sign_signature_core+0x170>
c0de3882:	4620      	mov	r0, r4
c0de3884:	4629      	mov	r1, r5
c0de3886:	f7fe ffd4 	bl	c0de2832 <polyw_unpack>
c0de388a:	4620      	mov	r0, r4
c0de388c:	f7ff fb25 	bl	c0de2eda <pqcrystals_dilithium2_lowram_poly_invntt_tomont>
c0de3890:	4620      	mov	r0, r4
c0de3892:	f7ff fb02 	bl	c0de2e9a <pqcrystals_dilithium2_lowram_poly_caddq>
c0de3896:	4628      	mov	r0, r5
c0de3898:	4621      	mov	r1, r4
c0de389a:	f7fe ffac 	bl	c0de27f6 <polyw_pack>
c0de389e:	4620      	mov	r0, r4
c0de38a0:	4621      	mov	r1, r4
c0de38a2:	f7fe fff6 	bl	c0de2892 <poly_highbits>
c0de38a6:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de38a8:	4621      	mov	r1, r4
c0de38aa:	4438      	add	r0, r7
c0de38ac:	f7ff fd90 	bl	c0de33d0 <pqcrystals_dilithium2_lowram_polyw1_pack>
c0de38b0:	f505 7540 	add.w	r5, r5, #768	@ 0x300
c0de38b4:	37c0      	adds	r7, #192	@ 0xc0
c0de38b6:	e7e1      	b.n	c0de387c <crypto_sign_signature_core+0x134>
c0de38b8:	eb09 0508 	add.w	r5, r9, r8
c0de38bc:	4628      	mov	r0, r5
c0de38be:	f7fd fd17 	bl	c0de12f0 <pqcrystals_dilithium_fips202_ref_shake256_init>
c0de38c2:	f505 71d0 	add.w	r1, r5, #416	@ 0x1a0
c0de38c6:	4628      	mov	r0, r5
c0de38c8:	2240      	movs	r2, #64	@ 0x40
c0de38ca:	f7fd fd19 	bl	c0de1300 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
c0de38ce:	9f0b      	ldr	r7, [sp, #44]	@ 0x2c
c0de38d0:	4628      	mov	r0, r5
c0de38d2:	f44f 7240 	mov.w	r2, #768	@ 0x300
c0de38d6:	4639      	mov	r1, r7
c0de38d8:	f7fd fd12 	bl	c0de1300 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
c0de38dc:	4628      	mov	r0, r5
c0de38de:	f7fd fd1a 	bl	c0de1316 <pqcrystals_dilithium_fips202_ref_shake256_finalize>
c0de38e2:	4638      	mov	r0, r7
c0de38e4:	2120      	movs	r1, #32
c0de38e6:	462a      	mov	r2, r5
c0de38e8:	f7fd fd20 	bl	c0de132c <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de38ec:	4620      	mov	r0, r4
c0de38ee:	4639      	mov	r1, r7
c0de38f0:	f7ff fc31 	bl	c0de3156 <pqcrystals_dilithium2_lowram_poly_challenge>
c0de38f4:	f20d 4034 	addw	r0, sp, #1076	@ 0x434
c0de38f8:	4621      	mov	r1, r4
c0de38fa:	f7fe fda9 	bl	c0de2450 <poly_challenge_compress>
c0de38fe:	9806      	ldr	r0, [sp, #24]
c0de3900:	f8dd a010 	ldr.w	sl, [sp, #16]
c0de3904:	2500      	movs	r5, #0
c0de3906:	3001      	adds	r0, #1
c0de3908:	9006      	str	r0, [sp, #24]
c0de390a:	b135      	cbz	r5, c0de391a <crypto_sign_signature_core+0x1d2>
c0de390c:	2d04      	cmp	r5, #4
c0de390e:	d032      	beq.n	c0de3976 <crypto_sign_signature_core+0x22e>
c0de3910:	4620      	mov	r0, r4
c0de3912:	f20d 4134 	addw	r1, sp, #1076	@ 0x434
c0de3916:	f7fe fdd0 	bl	c0de24ba <poly_challenge_decompress>
c0de391a:	f000 f9e7 	bl	c0de3cec <OUTLINED_FUNCTION_0>
c0de391e:	4620      	mov	r0, r4
c0de3920:	4631      	mov	r1, r6
c0de3922:	462a      	mov	r2, r5
c0de3924:	f7fe fffe 	bl	c0de2924 <unpack_sk_s1>
c0de3928:	4620      	mov	r0, r4
c0de392a:	f000 f9e5 	bl	c0de3cf8 <small_ntt>
c0de392e:	4620      	mov	r0, r4
c0de3930:	4639      	mov	r1, r7
c0de3932:	4622      	mov	r2, r4
c0de3934:	f000 fb04 	bl	c0de3f40 <poly_small_basemul_invntt>
c0de3938:	eb09 0008 	add.w	r0, r9, r8
c0de393c:	4621      	mov	r1, r4
c0de393e:	9000      	str	r0, [sp, #0]
c0de3940:	f500 72f0 	add.w	r2, r0, #480	@ 0x1e0
c0de3944:	9808      	ldr	r0, [sp, #32]
c0de3946:	4428      	add	r0, r5
c0de3948:	b283      	uxth	r3, r0
c0de394a:	4620      	mov	r0, r4
c0de394c:	f7ff f88a 	bl	c0de2a64 <poly_uniform_gamma1_add_lowram>
c0de3950:	4620      	mov	r0, r4
c0de3952:	f7ff fa93 	bl	c0de2e7c <pqcrystals_dilithium2_lowram_poly_reduce>
c0de3956:	4840      	ldr	r0, [pc, #256]	@ (c0de3a58 <crypto_sign_signature_core+0x310>)
c0de3958:	f500 410c 	add.w	r1, r0, #35840	@ 0x8c00
c0de395c:	4620      	mov	r0, r4
c0de395e:	f7ff fadf 	bl	c0de2f20 <pqcrystals_dilithium2_lowram_poly_chknorm>
c0de3962:	2800      	cmp	r0, #0
c0de3964:	d165      	bne.n	c0de3a32 <crypto_sign_signature_core+0x2ea>
c0de3966:	4650      	mov	r0, sl
c0de3968:	4621      	mov	r1, r4
c0de396a:	f7ff fd00 	bl	c0de336e <pqcrystals_dilithium2_lowram_polyz_pack>
c0de396e:	f50a 7a10 	add.w	sl, sl, #576	@ 0x240
c0de3972:	3501      	adds	r5, #1
c0de3974:	e7c9      	b.n	c0de390a <crypto_sign_signature_core+0x1c2>
c0de3976:	f8dd a00c 	ldr.w	sl, [sp, #12]
c0de397a:	2100      	movs	r1, #0
c0de397c:	2000      	movs	r0, #0
c0de397e:	f50d 658f 	add.w	r5, sp, #1144	@ 0x478
c0de3982:	2700      	movs	r7, #0
c0de3984:	9008      	str	r0, [sp, #32]
c0de3986:	910c      	str	r1, [sp, #48]	@ 0x30
c0de3988:	2f04      	cmp	r7, #4
c0de398a:	d055      	beq.n	c0de3a38 <crypto_sign_signature_core+0x2f0>
c0de398c:	4620      	mov	r0, r4
c0de398e:	f20d 4134 	addw	r1, sp, #1076	@ 0x434
c0de3992:	f7fe fd92 	bl	c0de24ba <poly_challenge_decompress>
c0de3996:	950a      	str	r5, [sp, #40]	@ 0x28
c0de3998:	463d      	mov	r5, r7
c0de399a:	f000 f9a7 	bl	c0de3cec <OUTLINED_FUNCTION_0>
c0de399e:	4620      	mov	r0, r4
c0de39a0:	4631      	mov	r1, r6
c0de39a2:	462a      	mov	r2, r5
c0de39a4:	9507      	str	r5, [sp, #28]
c0de39a6:	f7fe ffc4 	bl	c0de2932 <unpack_sk_s2>
c0de39aa:	4620      	mov	r0, r4
c0de39ac:	f000 f9a4 	bl	c0de3cf8 <small_ntt>
c0de39b0:	4620      	mov	r0, r4
c0de39b2:	4639      	mov	r1, r7
c0de39b4:	9d0a      	ldr	r5, [sp, #40]	@ 0x28
c0de39b6:	4622      	mov	r2, r4
c0de39b8:	f000 fac2 	bl	c0de3f40 <poly_small_basemul_invntt>
c0de39bc:	4620      	mov	r0, r4
c0de39be:	4629      	mov	r1, r5
c0de39c0:	4622      	mov	r2, r4
c0de39c2:	f7fe ff4e 	bl	c0de2862 <polyw_sub>
c0de39c6:	4620      	mov	r0, r4
c0de39c8:	f7ff fa58 	bl	c0de2e7c <pqcrystals_dilithium2_lowram_poly_reduce>
c0de39cc:	4628      	mov	r0, r5
c0de39ce:	4621      	mov	r1, r4
c0de39d0:	f7fe ff11 	bl	c0de27f6 <polyw_pack>
c0de39d4:	4620      	mov	r0, r4
c0de39d6:	4621      	mov	r1, r4
c0de39d8:	f7fe ff74 	bl	c0de28c4 <poly_lowbits>
c0de39dc:	4620      	mov	r0, r4
c0de39de:	f7ff fa4d 	bl	c0de2e7c <pqcrystals_dilithium2_lowram_poly_reduce>
c0de39e2:	491d      	ldr	r1, [pc, #116]	@ (c0de3a58 <crypto_sign_signature_core+0x310>)
c0de39e4:	4620      	mov	r0, r4
c0de39e6:	f7ff fa9b 	bl	c0de2f20 <pqcrystals_dilithium2_lowram_poly_chknorm>
c0de39ea:	bb10      	cbnz	r0, c0de3a32 <crypto_sign_signature_core+0x2ea>
c0de39ec:	4620      	mov	r0, r4
c0de39ee:	f20d 4134 	addw	r1, sp, #1076	@ 0x434
c0de39f2:	4652      	mov	r2, sl
c0de39f4:	f7fe fd93 	bl	c0de251e <poly_schoolbook>
c0de39f8:	4620      	mov	r0, r4
c0de39fa:	f44f 31ba 	mov.w	r1, #95232	@ 0x17400
c0de39fe:	f7ff fa8f 	bl	c0de2f20 <pqcrystals_dilithium2_lowram_poly_chknorm>
c0de3a02:	b9b0      	cbnz	r0, c0de3a32 <crypto_sign_signature_core+0x2ea>
c0de3a04:	4620      	mov	r0, r4
c0de3a06:	4621      	mov	r1, r4
c0de3a08:	462a      	mov	r2, r5
c0de3a0a:	f7ff f84f 	bl	c0de2aac <poly_make_hint_lowram>
c0de3a0e:	9908      	ldr	r1, [sp, #32]
c0de3a10:	4401      	add	r1, r0
c0de3a12:	2950      	cmp	r1, #80	@ 0x50
c0de3a14:	9108      	str	r1, [sp, #32]
c0de3a16:	d80c      	bhi.n	c0de3a32 <crypto_sign_signature_core+0x2ea>
c0de3a18:	9f07      	ldr	r7, [sp, #28]
c0de3a1a:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de3a1c:	4621      	mov	r1, r4
c0de3a1e:	ab0c      	add	r3, sp, #48	@ 0x30
c0de3a20:	463a      	mov	r2, r7
c0de3a22:	f7fe fcf3 	bl	c0de240c <pqcrystals_dilithium2_lowram_pack_sig_h>
c0de3a26:	f50a 7ad0 	add.w	sl, sl, #416	@ 0x1a0
c0de3a2a:	f505 7540 	add.w	r5, r5, #768	@ 0x300
c0de3a2e:	3701      	adds	r7, #1
c0de3a30:	e7aa      	b.n	c0de3988 <crypto_sign_signature_core+0x240>
c0de3a32:	9805      	ldr	r0, [sp, #20]
c0de3a34:	3001      	adds	r0, #1
c0de3a36:	e6d6      	b.n	c0de37e6 <crypto_sign_signature_core+0x9e>
c0de3a38:	a90c      	add	r1, sp, #48	@ 0x30
c0de3a3a:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de3a3c:	f7fe fcfc 	bl	c0de2438 <pqcrystals_dilithium2_lowram_pack_sig_h_zero>
c0de3a40:	9902      	ldr	r1, [sp, #8]
c0de3a42:	f640 1074 	movw	r0, #2420	@ 0x974
c0de3a46:	6008      	str	r0, [r1, #0]
c0de3a48:	2000      	movs	r0, #0
c0de3a4a:	f50d 5d83 	add.w	sp, sp, #4192	@ 0x1060
c0de3a4e:	b006      	add	sp, #24
c0de3a50:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de3a54:	000002d8 	.word	0x000002d8
c0de3a58:	000173b2 	.word	0x000173b2
c0de3a5c:	ffffdb59 	.word	0xffffdb59

c0de3a60 <pqcrystals_dilithium2_lowram_verify>:
c0de3a60:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de3a64:	f5ad 6d10 	sub.w	sp, sp, #2304	@ 0x900
c0de3a68:	4615      	mov	r5, r2
c0de3a6a:	f640 1274 	movw	r2, #2420	@ 0x974
c0de3a6e:	4604      	mov	r4, r0
c0de3a70:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de3a74:	4291      	cmp	r1, r2
c0de3a76:	f040 80ea 	bne.w	c0de3c4e <pqcrystals_dilithium2_lowram_verify+0x1ee>
c0de3a7a:	f8dd a924 	ldr.w	sl, [sp, #2340]	@ 0x924
c0de3a7e:	f1ba 0fff 	cmp.w	sl, #255	@ 0xff
c0de3a82:	f200 80e4 	bhi.w	c0de3c4e <pqcrystals_dilithium2_lowram_verify+0x1ee>
c0de3a86:	4f80      	ldr	r7, [pc, #512]	@ (c0de3c88 <pqcrystals_dilithium2_lowram_verify+0x228>)
c0de3a88:	f10d 0be8 	add.w	fp, sp, #232	@ 0xe8
c0de3a8c:	f8dd 6928 	ldr.w	r6, [sp, #2344]	@ 0x928
c0de3a90:	9305      	str	r3, [sp, #20]
c0de3a92:	4658      	mov	r0, fp
c0de3a94:	447f      	add	r7, pc
c0de3a96:	47b8      	blx	r7
c0de3a98:	9504      	str	r5, [sp, #16]
c0de3a9a:	4658      	mov	r0, fp
c0de3a9c:	4631      	mov	r1, r6
c0de3a9e:	f44f 62a4 	mov.w	r2, #1312	@ 0x520
c0de3aa2:	4d7a      	ldr	r5, [pc, #488]	@ (c0de3c8c <pqcrystals_dilithium2_lowram_verify+0x22c>)
c0de3aa4:	447d      	add	r5, pc
c0de3aa6:	47a8      	blx	r5
c0de3aa8:	4658      	mov	r0, fp
c0de3aaa:	f7fd fc34 	bl	c0de1316 <pqcrystals_dilithium_fips202_ref_shake256_finalize>
c0de3aae:	f50d 78dc 	add.w	r8, sp, #440	@ 0x1b8
c0de3ab2:	2140      	movs	r1, #64	@ 0x40
c0de3ab4:	465a      	mov	r2, fp
c0de3ab6:	4640      	mov	r0, r8
c0de3ab8:	f7fd fc38 	bl	c0de132c <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de3abc:	4658      	mov	r0, fp
c0de3abe:	47b8      	blx	r7
c0de3ac0:	4658      	mov	r0, fp
c0de3ac2:	4641      	mov	r1, r8
c0de3ac4:	2240      	movs	r2, #64	@ 0x40
c0de3ac6:	47a8      	blx	r5
c0de3ac8:	f88d a1b9 	strb.w	sl, [sp, #441]	@ 0x1b9
c0de3acc:	4656      	mov	r6, sl
c0de3ace:	f04f 0a00 	mov.w	sl, #0
c0de3ad2:	4658      	mov	r0, fp
c0de3ad4:	4641      	mov	r1, r8
c0de3ad6:	2202      	movs	r2, #2
c0de3ad8:	f88d a1b8 	strb.w	sl, [sp, #440]	@ 0x1b8
c0de3adc:	47a8      	blx	r5
c0de3ade:	f8dd 1920 	ldr.w	r1, [sp, #2336]	@ 0x920
c0de3ae2:	4658      	mov	r0, fp
c0de3ae4:	4632      	mov	r2, r6
c0de3ae6:	47a8      	blx	r5
c0de3ae8:	e9dd 1204 	ldrd	r1, r2, [sp, #16]
c0de3aec:	4658      	mov	r0, fp
c0de3aee:	47a8      	blx	r5
c0de3af0:	4658      	mov	r0, fp
c0de3af2:	f7fd fc10 	bl	c0de1316 <pqcrystals_dilithium_fips202_ref_shake256_finalize>
c0de3af6:	4640      	mov	r0, r8
c0de3af8:	2140      	movs	r1, #64	@ 0x40
c0de3afa:	465a      	mov	r2, fp
c0de3afc:	f7fd fc16 	bl	c0de132c <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de3b00:	4658      	mov	r0, fp
c0de3b02:	47b8      	blx	r7
c0de3b04:	4658      	mov	r0, fp
c0de3b06:	4641      	mov	r1, r8
c0de3b08:	2240      	movs	r2, #64	@ 0x40
c0de3b0a:	47a8      	blx	r5
c0de3b0c:	f20d 46fc 	addw	r6, sp, #1276	@ 0x4fc
c0de3b10:	4621      	mov	r1, r4
c0de3b12:	4630      	mov	r0, r6
c0de3b14:	f7ff f8a1 	bl	c0de2c5a <poly_challenge_lowram>
c0de3b18:	4640      	mov	r0, r8
c0de3b1a:	4631      	mov	r1, r6
c0de3b1c:	f7fe fc98 	bl	c0de2450 <poly_challenge_compress>
c0de3b20:	f8dd 0928 	ldr.w	r0, [sp, #2344]	@ 0x928
c0de3b24:	f104 0520 	add.w	r5, r4, #32
c0de3b28:	f10d 0b18 	add.w	fp, sp, #24
c0de3b2c:	f50d 78fe 	add.w	r8, sp, #508	@ 0x1fc
c0de3b30:	2700      	movs	r7, #0
c0de3b32:	9502      	str	r5, [sp, #8]
c0de3b34:	3020      	adds	r0, #32
c0de3b36:	9003      	str	r0, [sp, #12]
c0de3b38:	2001      	movs	r0, #1
c0de3b3a:	9005      	str	r0, [sp, #20]
c0de3b3c:	2f04      	cmp	r7, #4
c0de3b3e:	f000 808a 	beq.w	c0de3c56 <pqcrystals_dilithium2_lowram_verify+0x1f6>
c0de3b42:	2000      	movs	r0, #0
c0de3b44:	f5b0 7f40 	cmp.w	r0, #768	@ 0x300
c0de3b48:	d003      	beq.n	c0de3b52 <pqcrystals_dilithium2_lowram_verify+0xf2>
c0de3b4a:	f808 a000 	strb.w	sl, [r8, r0]
c0de3b4e:	3001      	adds	r0, #1
c0de3b50:	e7f8      	b.n	c0de3b44 <pqcrystals_dilithium2_lowram_verify+0xe4>
c0de3b52:	4630      	mov	r0, r6
c0de3b54:	4629      	mov	r1, r5
c0de3b56:	f7ff faae 	bl	c0de30b6 <pqcrystals_dilithium2_lowram_polyz_unpack>
c0de3b5a:	494a      	ldr	r1, [pc, #296]	@ (c0de3c84 <pqcrystals_dilithium2_lowram_verify+0x224>)
c0de3b5c:	4630      	mov	r0, r6
c0de3b5e:	f7ff f9df 	bl	c0de2f20 <pqcrystals_dilithium2_lowram_poly_chknorm>
c0de3b62:	2800      	cmp	r0, #0
c0de3b64:	d171      	bne.n	c0de3c4a <pqcrystals_dilithium2_lowram_verify+0x1ea>
c0de3b66:	4630      	mov	r0, r6
c0de3b68:	f7ff f9b5 	bl	c0de2ed6 <pqcrystals_dilithium2_lowram_poly_ntt>
c0de3b6c:	0238      	lsls	r0, r7, #8
c0de3b6e:	f8dd 2928 	ldr.w	r2, [sp, #2344]	@ 0x928
c0de3b72:	4631      	mov	r1, r6
c0de3b74:	465d      	mov	r5, fp
c0de3b76:	f8cd b000 	str.w	fp, [sp]
c0de3b7a:	9704      	str	r7, [sp, #16]
c0de3b7c:	b283      	uxth	r3, r0
c0de3b7e:	4640      	mov	r0, r8
c0de3b80:	f7fe fee0 	bl	c0de2944 <poly_uniform_pointwise_montgomery_polywadd_lowram>
c0de3b84:	9f05      	ldr	r7, [sp, #20]
c0de3b86:	f44f 7b18 	mov.w	fp, #608	@ 0x260
c0de3b8a:	f5bb 6f12 	cmp.w	fp, #2336	@ 0x920
c0de3b8e:	d019      	beq.n	c0de3bc4 <pqcrystals_dilithium2_lowram_verify+0x164>
c0de3b90:	eb04 010b 	add.w	r1, r4, fp
c0de3b94:	4630      	mov	r0, r6
c0de3b96:	f7ff fa8e 	bl	c0de30b6 <pqcrystals_dilithium2_lowram_polyz_unpack>
c0de3b9a:	493a      	ldr	r1, [pc, #232]	@ (c0de3c84 <pqcrystals_dilithium2_lowram_verify+0x224>)
c0de3b9c:	4630      	mov	r0, r6
c0de3b9e:	f7ff f9bf 	bl	c0de2f20 <pqcrystals_dilithium2_lowram_poly_chknorm>
c0de3ba2:	2800      	cmp	r0, #0
c0de3ba4:	d151      	bne.n	c0de3c4a <pqcrystals_dilithium2_lowram_verify+0x1ea>
c0de3ba6:	4630      	mov	r0, r6
c0de3ba8:	f7ff f995 	bl	c0de2ed6 <pqcrystals_dilithium2_lowram_poly_ntt>
c0de3bac:	f8dd 2928 	ldr.w	r2, [sp, #2344]	@ 0x928
c0de3bb0:	b2bb      	uxth	r3, r7
c0de3bb2:	4640      	mov	r0, r8
c0de3bb4:	4631      	mov	r1, r6
c0de3bb6:	9500      	str	r5, [sp, #0]
c0de3bb8:	f7fe fec4 	bl	c0de2944 <poly_uniform_pointwise_montgomery_polywadd_lowram>
c0de3bbc:	3701      	adds	r7, #1
c0de3bbe:	f50b 7b10 	add.w	fp, fp, #576	@ 0x240
c0de3bc2:	e7e2      	b.n	c0de3b8a <pqcrystals_dilithium2_lowram_verify+0x12a>
c0de3bc4:	4630      	mov	r0, r6
c0de3bc6:	4641      	mov	r1, r8
c0de3bc8:	f7fe fe33 	bl	c0de2832 <polyw_unpack>
c0de3bcc:	4630      	mov	r0, r6
c0de3bce:	f7ff f955 	bl	c0de2e7c <pqcrystals_dilithium2_lowram_poly_reduce>
c0de3bd2:	4630      	mov	r0, r6
c0de3bd4:	f7ff f981 	bl	c0de2eda <pqcrystals_dilithium2_lowram_poly_invntt_tomont>
c0de3bd8:	4640      	mov	r0, r8
c0de3bda:	4631      	mov	r1, r6
c0de3bdc:	f7fe fe0b 	bl	c0de27f6 <polyw_pack>
c0de3be0:	9f04      	ldr	r7, [sp, #16]
c0de3be2:	9903      	ldr	r1, [sp, #12]
c0de3be4:	eb07 0087 	add.w	r0, r7, r7, lsl #2
c0de3be8:	eb01 1280 	add.w	r2, r1, r0, lsl #6
c0de3bec:	4630      	mov	r0, r6
c0de3bee:	a96e      	add	r1, sp, #440	@ 0x1b8
c0de3bf0:	f7fe fd5a 	bl	c0de26a8 <poly_schoolbook_t1>
c0de3bf4:	4630      	mov	r0, r6
c0de3bf6:	4641      	mov	r1, r8
c0de3bf8:	4632      	mov	r2, r6
c0de3bfa:	f7fe fe32 	bl	c0de2862 <polyw_sub>
c0de3bfe:	4630      	mov	r0, r6
c0de3c00:	f7ff f93c 	bl	c0de2e7c <pqcrystals_dilithium2_lowram_poly_reduce>
c0de3c04:	4630      	mov	r0, r6
c0de3c06:	f7ff f948 	bl	c0de2e9a <pqcrystals_dilithium2_lowram_poly_caddq>
c0de3c0a:	4628      	mov	r0, r5
c0de3c0c:	f60d 01fc 	addw	r1, sp, #2300	@ 0x8fc
c0de3c10:	463a      	mov	r2, r7
c0de3c12:	4623      	mov	r3, r4
c0de3c14:	46ab      	mov	fp, r5
c0de3c16:	f7fe ff83 	bl	c0de2b20 <unpack_sig_h_indices>
c0de3c1a:	b9b0      	cbnz	r0, c0de3c4a <pqcrystals_dilithium2_lowram_verify+0x1ea>
c0de3c1c:	f8dd 38fc 	ldr.w	r3, [sp, #2300]	@ 0x8fc
c0de3c20:	4630      	mov	r0, r6
c0de3c22:	4631      	mov	r1, r6
c0de3c24:	465a      	mov	r2, fp
c0de3c26:	f7fe ffb9 	bl	c0de2b9c <poly_use_hint_lowram>
c0de3c2a:	4640      	mov	r0, r8
c0de3c2c:	4631      	mov	r1, r6
c0de3c2e:	f7ff fbcf 	bl	c0de33d0 <pqcrystals_dilithium2_lowram_polyw1_pack>
c0de3c32:	a83a      	add	r0, sp, #232	@ 0xe8
c0de3c34:	4641      	mov	r1, r8
c0de3c36:	22c0      	movs	r2, #192	@ 0xc0
c0de3c38:	f7fd fb62 	bl	c0de1300 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
c0de3c3c:	9805      	ldr	r0, [sp, #20]
c0de3c3e:	9d02      	ldr	r5, [sp, #8]
c0de3c40:	3701      	adds	r7, #1
c0de3c42:	f500 7080 	add.w	r0, r0, #256	@ 0x100
c0de3c46:	9005      	str	r0, [sp, #20]
c0de3c48:	e778      	b.n	c0de3b3c <pqcrystals_dilithium2_lowram_verify+0xdc>
c0de3c4a:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de3c4e:	f50d 6d10 	add.w	sp, sp, #2304	@ 0x900
c0de3c52:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de3c56:	ad3a      	add	r5, sp, #232	@ 0xe8
c0de3c58:	4628      	mov	r0, r5
c0de3c5a:	f7fd fb5c 	bl	c0de1316 <pqcrystals_dilithium_fips202_ref_shake256_finalize>
c0de3c5e:	4658      	mov	r0, fp
c0de3c60:	2120      	movs	r1, #32
c0de3c62:	462a      	mov	r2, r5
c0de3c64:	f7fd fb62 	bl	c0de132c <pqcrystals_dilithium_fips202_ref_shake256_squeeze>
c0de3c68:	2100      	movs	r1, #0
c0de3c6a:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de3c6e:	2920      	cmp	r1, #32
c0de3c70:	d006      	beq.n	c0de3c80 <pqcrystals_dilithium2_lowram_verify+0x220>
c0de3c72:	f81b 2001 	ldrb.w	r2, [fp, r1]
c0de3c76:	5c63      	ldrb	r3, [r4, r1]
c0de3c78:	3101      	adds	r1, #1
c0de3c7a:	4293      	cmp	r3, r2
c0de3c7c:	d0f7      	beq.n	c0de3c6e <pqcrystals_dilithium2_lowram_verify+0x20e>
c0de3c7e:	e7e6      	b.n	c0de3c4e <pqcrystals_dilithium2_lowram_verify+0x1ee>
c0de3c80:	2000      	movs	r0, #0
c0de3c82:	e7e4      	b.n	c0de3c4e <pqcrystals_dilithium2_lowram_verify+0x1ee>
c0de3c84:	0001ffb2 	.word	0x0001ffb2
c0de3c88:	ffffd859 	.word	0xffffd859
c0de3c8c:	ffffd859 	.word	0xffffd859

c0de3c90 <pqcrystals_dilithium2_lowram_open>:
c0de3c90:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de3c92:	4604      	mov	r4, r0
c0de3c94:	f640 1074 	movw	r0, #2420	@ 0x974
c0de3c98:	461d      	mov	r5, r3
c0de3c9a:	460e      	mov	r6, r1
c0de3c9c:	4283      	cmp	r3, r0
c0de3c9e:	d311      	bcc.n	c0de3cc4 <pqcrystals_dilithium2_lowram_open+0x34>
c0de3ca0:	e9dd 7108 	ldrd	r7, r1, [sp, #32]
c0de3ca4:	f6a5 1374 	subw	r3, r5, #2420	@ 0x974
c0de3ca8:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de3caa:	6033      	str	r3, [r6, #0]
c0de3cac:	e9cd 7100 	strd	r7, r1, [sp]
c0de3cb0:	f602 1774 	addw	r7, r2, #2420	@ 0x974
c0de3cb4:	9002      	str	r0, [sp, #8]
c0de3cb6:	4610      	mov	r0, r2
c0de3cb8:	f640 1174 	movw	r1, #2420	@ 0x974
c0de3cbc:	463a      	mov	r2, r7
c0de3cbe:	f7ff fecf 	bl	c0de3a60 <pqcrystals_dilithium2_lowram_verify>
c0de3cc2:	b148      	cbz	r0, c0de3cd8 <pqcrystals_dilithium2_lowram_open+0x48>
c0de3cc4:	2000      	movs	r0, #0
c0de3cc6:	6030      	str	r0, [r6, #0]
c0de3cc8:	b11d      	cbz	r5, c0de3cd2 <pqcrystals_dilithium2_lowram_open+0x42>
c0de3cca:	f804 0b01 	strb.w	r0, [r4], #1
c0de3cce:	3d01      	subs	r5, #1
c0de3cd0:	e7fa      	b.n	c0de3cc8 <pqcrystals_dilithium2_lowram_open+0x38>
c0de3cd2:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de3cd6:	bdfe      	pop	{r1, r2, r3, r4, r5, r6, r7, pc}
c0de3cd8:	2000      	movs	r0, #0
c0de3cda:	6831      	ldr	r1, [r6, #0]
c0de3cdc:	4288      	cmp	r0, r1
c0de3cde:	bf24      	itt	cs
c0de3ce0:	2000      	movcs	r0, #0
c0de3ce2:	bdfe      	popcs	{r1, r2, r3, r4, r5, r6, r7, pc}
c0de3ce4:	5c39      	ldrb	r1, [r7, r0]
c0de3ce6:	5421      	strb	r1, [r4, r0]
c0de3ce8:	3001      	adds	r0, #1
c0de3cea:	e7f6      	b.n	c0de3cda <pqcrystals_dilithium2_lowram_open+0x4a>

c0de3cec <OUTLINED_FUNCTION_0>:
c0de3cec:	9f09      	ldr	r7, [sp, #36]	@ 0x24
c0de3cee:	4621      	mov	r1, r4
c0de3cf0:	4638      	mov	r0, r7
c0de3cf2:	f000 b8ed 	b.w	c0de3ed0 <poly_small_ntt_copy>
	...

c0de3cf8 <small_ntt>:
c0de3cf8:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de3cfc:	491c      	ldr	r1, [pc, #112]	@ (c0de3d70 <small_ntt+0x78>)
c0de3cfe:	f04f 0c80 	mov.w	ip, #128	@ 0x80
c0de3d02:	f04f 0e01 	mov.w	lr, #1
c0de3d06:	f46f 6850 	mvn.w	r8, #3328	@ 0xd00
c0de3d0a:	4479      	add	r1, pc
c0de3d0c:	468a      	mov	sl, r1
c0de3d0e:	4917      	ldr	r1, [pc, #92]	@ (c0de3d6c <small_ntt+0x74>)
c0de3d10:	468b      	mov	fp, r1
c0de3d12:	f1bc 0f02 	cmp.w	ip, #2
c0de3d16:	bf38      	it	cc
c0de3d18:	e8bd 8df0 	ldmiacc.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de3d1c:	2600      	movs	r6, #0
c0de3d1e:	2eff      	cmp	r6, #255	@ 0xff
c0de3d20:	d821      	bhi.n	c0de3d66 <small_ntt+0x6e>
c0de3d22:	4651      	mov	r1, sl
c0de3d24:	f93a 301e 	ldrsh.w	r3, [sl, lr, lsl #1]
c0de3d28:	eb06 010c 	add.w	r1, r6, ip
c0de3d2c:	460f      	mov	r7, r1
c0de3d2e:	428e      	cmp	r6, r1
c0de3d30:	d215      	bcs.n	c0de3d5e <small_ntt+0x66>
c0de3d32:	f930 2017 	ldrsh.w	r2, [r0, r7, lsl #1]
c0de3d36:	465c      	mov	r4, fp
c0de3d38:	435a      	muls	r2, r3
c0de3d3a:	fb02 f40b 	mul.w	r4, r2, fp
c0de3d3e:	1424      	asrs	r4, r4, #16
c0de3d40:	fb04 2208 	mla	r2, r4, r8, r2
c0de3d44:	f830 4016 	ldrh.w	r4, [r0, r6, lsl #1]
c0de3d48:	eba4 4512 	sub.w	r5, r4, r2, lsr #16
c0de3d4c:	eb04 4212 	add.w	r2, r4, r2, lsr #16
c0de3d50:	f820 5017 	strh.w	r5, [r0, r7, lsl #1]
c0de3d54:	f820 2016 	strh.w	r2, [r0, r6, lsl #1]
c0de3d58:	3701      	adds	r7, #1
c0de3d5a:	3601      	adds	r6, #1
c0de3d5c:	e7e7      	b.n	c0de3d2e <small_ntt+0x36>
c0de3d5e:	f10e 0e01 	add.w	lr, lr, #1
c0de3d62:	463e      	mov	r6, r7
c0de3d64:	e7db      	b.n	c0de3d1e <small_ntt+0x26>
c0de3d66:	ea4f 0c5c 	mov.w	ip, ip, lsr #1
c0de3d6a:	e7d2      	b.n	c0de3d12 <small_ntt+0x1a>
c0de3d6c:	f3010000 	.word	0xf3010000
c0de3d70:	0000c62a 	.word	0x0000c62a

c0de3d74 <small_invntt_tomont>:
c0de3d74:	e92d 4dfe 	stmdb	sp!, {r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de3d78:	4934      	ldr	r1, [pc, #208]	@ (c0de3e4c <small_invntt_tomont+0xd8>)
c0de3d7a:	4b36      	ldr	r3, [pc, #216]	@ (c0de3e54 <small_invntt_tomont+0xe0>)
c0de3d7c:	2202      	movs	r2, #2
c0de3d7e:	247f      	movs	r4, #127	@ 0x7f
c0de3d80:	f644 68bf 	movw	r8, #20159	@ 0x4ebf
c0de3d84:	f46f 6a50 	mvn.w	sl, #3328	@ 0xd00
c0de3d88:	468e      	mov	lr, r1
c0de3d8a:	4931      	ldr	r1, [pc, #196]	@ (c0de3e50 <small_invntt_tomont+0xdc>)
c0de3d8c:	447b      	add	r3, pc
c0de3d8e:	9300      	str	r3, [sp, #0]
c0de3d90:	f101 5bd3 	add.w	fp, r1, #442499072	@ 0x1a600000
c0de3d94:	2a80      	cmp	r2, #128	@ 0x80
c0de3d96:	d834      	bhi.n	c0de3e02 <small_invntt_tomont+0x8e>
c0de3d98:	2300      	movs	r3, #0
c0de3d9a:	9201      	str	r2, [sp, #4]
c0de3d9c:	2bff      	cmp	r3, #255	@ 0xff
c0de3d9e:	d82e      	bhi.n	c0de3dfe <small_invntt_tomont+0x8a>
c0de3da0:	9900      	ldr	r1, [sp, #0]
c0de3da2:	9402      	str	r4, [sp, #8]
c0de3da4:	f931 4014 	ldrsh.w	r4, [r1, r4, lsl #1]
c0de3da8:	1899      	adds	r1, r3, r2
c0de3daa:	460d      	mov	r5, r1
c0de3dac:	428b      	cmp	r3, r1
c0de3dae:	d221      	bcs.n	c0de3df4 <small_invntt_tomont+0x80>
c0de3db0:	f830 6013 	ldrh.w	r6, [r0, r3, lsl #1]
c0de3db4:	f830 2015 	ldrh.w	r2, [r0, r5, lsl #1]
c0de3db8:	46f4      	mov	ip, lr
c0de3dba:	4432      	add	r2, r6
c0de3dbc:	b217      	sxth	r7, r2
c0de3dbe:	fb07 f708 	mul.w	r7, r7, r8
c0de3dc2:	f107 7700 	add.w	r7, r7, #33554432	@ 0x2000000
c0de3dc6:	16bf      	asrs	r7, r7, #26
c0de3dc8:	fb07 f70e 	mul.w	r7, r7, lr
c0de3dcc:	eba2 4217 	sub.w	r2, r2, r7, lsr #16
c0de3dd0:	f820 2013 	strh.w	r2, [r0, r3, lsl #1]
c0de3dd4:	3301      	adds	r3, #1
c0de3dd6:	f830 2015 	ldrh.w	r2, [r0, r5, lsl #1]
c0de3dda:	1b92      	subs	r2, r2, r6
c0de3ddc:	b212      	sxth	r2, r2
c0de3dde:	4362      	muls	r2, r4
c0de3de0:	fb02 f60b 	mul.w	r6, r2, fp
c0de3de4:	1436      	asrs	r6, r6, #16
c0de3de6:	fb06 220a 	mla	r2, r6, sl, r2
c0de3dea:	0c12      	lsrs	r2, r2, #16
c0de3dec:	f820 2015 	strh.w	r2, [r0, r5, lsl #1]
c0de3df0:	3501      	adds	r5, #1
c0de3df2:	e7db      	b.n	c0de3dac <small_invntt_tomont+0x38>
c0de3df4:	9c02      	ldr	r4, [sp, #8]
c0de3df6:	9a01      	ldr	r2, [sp, #4]
c0de3df8:	462b      	mov	r3, r5
c0de3dfa:	3c01      	subs	r4, #1
c0de3dfc:	e7ce      	b.n	c0de3d9c <small_invntt_tomont+0x28>
c0de3dfe:	0052      	lsls	r2, r2, #1
c0de3e00:	e7c8      	b.n	c0de3d94 <small_invntt_tomont+0x20>
c0de3e02:	2100      	movs	r1, #0
c0de3e04:	f240 52a1 	movw	r2, #1441	@ 0x5a1
c0de3e08:	f46f 6350 	mvn.w	r3, #3328	@ 0xd00
c0de3e0c:	f644 64bf 	movw	r4, #20159	@ 0x4ebf
c0de3e10:	f5b1 7f80 	cmp.w	r1, #256	@ 0x100
c0de3e14:	bf08      	it	eq
c0de3e16:	e8bd 8dfe 	ldmiaeq.w	sp!, {r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de3e1a:	f930 5011 	ldrsh.w	r5, [r0, r1, lsl #1]
c0de3e1e:	4f0c      	ldr	r7, [pc, #48]	@ (c0de3e50 <small_invntt_tomont+0xdc>)
c0de3e20:	fb05 f602 	mul.w	r6, r5, r2
c0de3e24:	437d      	muls	r5, r7
c0de3e26:	4677      	mov	r7, lr
c0de3e28:	142d      	asrs	r5, r5, #16
c0de3e2a:	fb05 6503 	mla	r5, r5, r3, r6
c0de3e2e:	142e      	asrs	r6, r5, #16
c0de3e30:	0c2d      	lsrs	r5, r5, #16
c0de3e32:	4366      	muls	r6, r4
c0de3e34:	f106 7600 	add.w	r6, r6, #33554432	@ 0x2000000
c0de3e38:	16b6      	asrs	r6, r6, #26
c0de3e3a:	fb06 f60e 	mul.w	r6, r6, lr
c0de3e3e:	eba5 4516 	sub.w	r5, r5, r6, lsr #16
c0de3e42:	f820 5011 	strh.w	r5, [r0, r1, lsl #1]
c0de3e46:	3101      	adds	r1, #1
c0de3e48:	e7e2      	b.n	c0de3e10 <small_invntt_tomont+0x9c>
c0de3e4a:	bf00      	nop
c0de3e4c:	0d010000 	.word	0x0d010000
c0de3e50:	d8a10000 	.word	0xd8a10000
c0de3e54:	0000c5a8 	.word	0x0000c5a8

c0de3e58 <small_basemul>:
c0de3e58:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de3e5a:	f9b1 c000 	ldrsh.w	ip, [r1]
c0de3e5e:	f9b1 5002 	ldrsh.w	r5, [r1, #2]
c0de3e62:	f9b2 1002 	ldrsh.w	r1, [r2, #2]
c0de3e66:	f46f 6e50 	mvn.w	lr, #3328	@ 0xd00
c0de3e6a:	f9b2 6000 	ldrsh.w	r6, [r2]
c0de3e6e:	fb01 f705 	mul.w	r7, r1, r5
c0de3e72:	4916      	ldr	r1, [pc, #88]	@ (c0de3ecc <small_basemul+0x74>)
c0de3e74:	fb07 f401 	mul.w	r4, r7, r1
c0de3e78:	1424      	asrs	r4, r4, #16
c0de3e7a:	fb04 740e 	mla	r4, r4, lr, r7
c0de3e7e:	1424      	asrs	r4, r4, #16
c0de3e80:	4363      	muls	r3, r4
c0de3e82:	fb03 f401 	mul.w	r4, r3, r1
c0de3e86:	1424      	asrs	r4, r4, #16
c0de3e88:	fb04 330e 	mla	r3, r4, lr, r3
c0de3e8c:	fb06 f40c 	mul.w	r4, r6, ip
c0de3e90:	fb04 f701 	mul.w	r7, r4, r1
c0de3e94:	143f      	asrs	r7, r7, #16
c0de3e96:	0c1b      	lsrs	r3, r3, #16
c0de3e98:	fb07 440e 	mla	r4, r7, lr, r4
c0de3e9c:	eb03 4314 	add.w	r3, r3, r4, lsr #16
c0de3ea0:	8003      	strh	r3, [r0, #0]
c0de3ea2:	fb06 f305 	mul.w	r3, r6, r5
c0de3ea6:	f9b2 2002 	ldrsh.w	r2, [r2, #2]
c0de3eaa:	fb03 f401 	mul.w	r4, r3, r1
c0de3eae:	1424      	asrs	r4, r4, #16
c0de3eb0:	fb02 f20c 	mul.w	r2, r2, ip
c0de3eb4:	fb04 330e 	mla	r3, r4, lr, r3
c0de3eb8:	4351      	muls	r1, r2
c0de3eba:	1409      	asrs	r1, r1, #16
c0de3ebc:	fb01 210e 	mla	r1, r1, lr, r2
c0de3ec0:	0c09      	lsrs	r1, r1, #16
c0de3ec2:	eb01 4113 	add.w	r1, r1, r3, lsr #16
c0de3ec6:	8041      	strh	r1, [r0, #2]
c0de3ec8:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de3eca:	bf00      	nop
c0de3ecc:	f3010000 	.word	0xf3010000

c0de3ed0 <poly_small_ntt_copy>:
c0de3ed0:	22ff      	movs	r2, #255	@ 0xff
c0de3ed2:	f1b2 3fff 	cmp.w	r2, #4294967295	@ 0xffffffff
c0de3ed6:	bfd8      	it	le
c0de3ed8:	f7ff bf0e 	ble.w	c0de3cf8 <small_ntt>
c0de3edc:	f851 3022 	ldr.w	r3, [r1, r2, lsl #2]
c0de3ee0:	f820 3012 	strh.w	r3, [r0, r2, lsl #1]
c0de3ee4:	3a01      	subs	r2, #1
c0de3ee6:	e7f4      	b.n	c0de3ed2 <poly_small_ntt_copy+0x2>

c0de3ee8 <poly_small_basemul>:
c0de3ee8:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de3eec:	e9cd 1200 	strd	r1, r2, [sp]
c0de3ef0:	4683      	mov	fp, r0
c0de3ef2:	f04f 0a00 	mov.w	sl, #0
c0de3ef6:	4811      	ldr	r0, [pc, #68]	@ (c0de3f3c <poly_small_basemul+0x54>)
c0de3ef8:	4478      	add	r0, pc
c0de3efa:	f100 0880 	add.w	r8, r0, #128	@ 0x80
c0de3efe:	f5ba 7f00 	cmp.w	sl, #512	@ 0x200
c0de3f02:	bf08      	it	eq
c0de3f04:	e8bd 8dfc 	ldmiaeq.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de3f08:	9800      	ldr	r0, [sp, #0]
c0de3f0a:	f938 6b02 	ldrsh.w	r6, [r8], #2
c0de3f0e:	eb0b 070a 	add.w	r7, fp, sl
c0de3f12:	eb00 040a 	add.w	r4, r0, sl
c0de3f16:	9801      	ldr	r0, [sp, #4]
c0de3f18:	4633      	mov	r3, r6
c0de3f1a:	4621      	mov	r1, r4
c0de3f1c:	eb00 050a 	add.w	r5, r0, sl
c0de3f20:	4638      	mov	r0, r7
c0de3f22:	462a      	mov	r2, r5
c0de3f24:	f7ff ff98 	bl	c0de3e58 <small_basemul>
c0de3f28:	4273      	negs	r3, r6
c0de3f2a:	1d38      	adds	r0, r7, #4
c0de3f2c:	1d21      	adds	r1, r4, #4
c0de3f2e:	1d2a      	adds	r2, r5, #4
c0de3f30:	b21b      	sxth	r3, r3
c0de3f32:	f7ff ff91 	bl	c0de3e58 <small_basemul>
c0de3f36:	f10a 0a08 	add.w	sl, sl, #8
c0de3f3a:	e7e0      	b.n	c0de3efe <poly_small_basemul+0x16>
c0de3f3c:	0000c43c 	.word	0x0000c43c

c0de3f40 <poly_small_basemul_invntt>:
c0de3f40:	b510      	push	{r4, lr}
c0de3f42:	4604      	mov	r4, r0
c0de3f44:	f7ff ffd0 	bl	c0de3ee8 <poly_small_basemul>
c0de3f48:	4620      	mov	r0, r4
c0de3f4a:	f7ff ff13 	bl	c0de3d74 <small_invntt_tomont>
c0de3f4e:	20ff      	movs	r0, #255	@ 0xff
c0de3f50:	2800      	cmp	r0, #0
c0de3f52:	d405      	bmi.n	c0de3f60 <poly_small_basemul_invntt+0x20>
c0de3f54:	f934 1010 	ldrsh.w	r1, [r4, r0, lsl #1]
c0de3f58:	f844 1020 	str.w	r1, [r4, r0, lsl #2]
c0de3f5c:	3801      	subs	r0, #1
c0de3f5e:	e7f7      	b.n	c0de3f50 <poly_small_basemul_invntt+0x10>
c0de3f60:	bd10      	pop	{r4, pc}

c0de3f62 <small_polyeta_unpack>:
c0de3f62:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de3f66:	3101      	adds	r1, #1
c0de3f68:	f04f 0c00 	mov.w	ip, #0
c0de3f6c:	f5bc 7f00 	cmp.w	ip, #512	@ 0x200
c0de3f70:	bf08      	it	eq
c0de3f72:	e8bd 8df0 	ldmiaeq.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de3f76:	f811 4c01 	ldrb.w	r4, [r1, #-1]
c0de3f7a:	f004 0807 	and.w	r8, r4, #7
c0de3f7e:	eb00 040c 	add.w	r4, r0, ip
c0de3f82:	f820 800c 	strh.w	r8, [r0, ip]
c0de3f86:	f1c8 0202 	rsb	r2, r8, #2
c0de3f8a:	f811 5c01 	ldrb.w	r5, [r1, #-1]
c0de3f8e:	f3c5 0ec2 	ubfx	lr, r5, #3, #3
c0de3f92:	f8a4 e002 	strh.w	lr, [r4, #2]
c0de3f96:	f811 6c01 	ldrb.w	r6, [r1, #-1]
c0de3f9a:	780b      	ldrb	r3, [r1, #0]
c0de3f9c:	09b6      	lsrs	r6, r6, #6
c0de3f9e:	f363 0682 	bfi	r6, r3, #2, #1
c0de3fa2:	80a6      	strh	r6, [r4, #4]
c0de3fa4:	780b      	ldrb	r3, [r1, #0]
c0de3fa6:	f3c3 0a42 	ubfx	sl, r3, #1, #3
c0de3faa:	f8a4 a006 	strh.w	sl, [r4, #6]
c0de3fae:	780d      	ldrb	r5, [r1, #0]
c0de3fb0:	f3c5 1502 	ubfx	r5, r5, #4, #3
c0de3fb4:	8125      	strh	r5, [r4, #8]
c0de3fb6:	780f      	ldrb	r7, [r1, #0]
c0de3fb8:	784b      	ldrb	r3, [r1, #1]
c0de3fba:	09ff      	lsrs	r7, r7, #7
c0de3fbc:	f363 0742 	bfi	r7, r3, #1, #2
c0de3fc0:	8167      	strh	r7, [r4, #10]
c0de3fc2:	784b      	ldrb	r3, [r1, #1]
c0de3fc4:	f3c3 0382 	ubfx	r3, r3, #2, #3
c0de3fc8:	81a3      	strh	r3, [r4, #12]
c0de3fca:	f891 b001 	ldrb.w	fp, [r1, #1]
c0de3fce:	f820 200c 	strh.w	r2, [r0, ip]
c0de3fd2:	f1c3 0202 	rsb	r2, r3, #2
c0de3fd6:	3103      	adds	r1, #3
c0de3fd8:	f10c 0c10 	add.w	ip, ip, #16
c0de3fdc:	81a2      	strh	r2, [r4, #12]
c0de3fde:	f1c7 0202 	rsb	r2, r7, #2
c0de3fe2:	8162      	strh	r2, [r4, #10]
c0de3fe4:	f1c5 0202 	rsb	r2, r5, #2
c0de3fe8:	8122      	strh	r2, [r4, #8]
c0de3fea:	f1ca 0202 	rsb	r2, sl, #2
c0de3fee:	80e2      	strh	r2, [r4, #6]
c0de3ff0:	f1c6 0202 	rsb	r2, r6, #2
c0de3ff4:	80a2      	strh	r2, [r4, #4]
c0de3ff6:	f1ce 0202 	rsb	r2, lr, #2
c0de3ffa:	8062      	strh	r2, [r4, #2]
c0de3ffc:	2202      	movs	r2, #2
c0de3ffe:	eba2 125b 	sub.w	r2, r2, fp, lsr #5
c0de4002:	81e2      	strh	r2, [r4, #14]
c0de4004:	e7b2      	b.n	c0de3f6c <small_polyeta_unpack+0xa>

c0de4006 <pqcrystals_dilithium2_lowram_dilithium_shake128_stream_init>:
c0de4006:	b5bc      	push	{r2, r3, r4, r5, r7, lr}
c0de4008:	f000 f825 	bl	c0de4056 <OUTLINED_FUNCTION_0>
c0de400c:	f7fd f826 	bl	c0de105c <pqcrystals_dilithium_fips202_ref_shake128_init>
c0de4010:	4628      	mov	r0, r5
c0de4012:	4621      	mov	r1, r4
c0de4014:	2220      	movs	r2, #32
c0de4016:	f7fd f833 	bl	c0de1080 <pqcrystals_dilithium_fips202_ref_shake128_absorb>
c0de401a:	f10d 0106 	add.w	r1, sp, #6
c0de401e:	4628      	mov	r0, r5
c0de4020:	2202      	movs	r2, #2
c0de4022:	f7fd f82d 	bl	c0de1080 <pqcrystals_dilithium_fips202_ref_shake128_absorb>
c0de4026:	4628      	mov	r0, r5
c0de4028:	f7fd f873 	bl	c0de1112 <pqcrystals_dilithium_fips202_ref_shake128_finalize>
c0de402c:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}

c0de402e <pqcrystals_dilithium2_lowram_dilithium_shake256_stream_init>:
c0de402e:	b5bc      	push	{r2, r3, r4, r5, r7, lr}
c0de4030:	f000 f811 	bl	c0de4056 <OUTLINED_FUNCTION_0>
c0de4034:	f7fd f95c 	bl	c0de12f0 <pqcrystals_dilithium_fips202_ref_shake256_init>
c0de4038:	4628      	mov	r0, r5
c0de403a:	4621      	mov	r1, r4
c0de403c:	2240      	movs	r2, #64	@ 0x40
c0de403e:	f7fd f95f 	bl	c0de1300 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
c0de4042:	f10d 0106 	add.w	r1, sp, #6
c0de4046:	4628      	mov	r0, r5
c0de4048:	2202      	movs	r2, #2
c0de404a:	f7fd f959 	bl	c0de1300 <pqcrystals_dilithium_fips202_ref_shake256_absorb>
c0de404e:	4628      	mov	r0, r5
c0de4050:	f7fd f961 	bl	c0de1316 <pqcrystals_dilithium_fips202_ref_shake256_finalize>
c0de4054:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}

c0de4056 <OUTLINED_FUNCTION_0>:
c0de4056:	4605      	mov	r5, r0
c0de4058:	0a10      	lsrs	r0, r2, #8
c0de405a:	460c      	mov	r4, r1
c0de405c:	f88d 2006 	strb.w	r2, [sp, #6]
c0de4060:	f88d 0007 	strb.w	r0, [sp, #7]
c0de4064:	4628      	mov	r0, r5
c0de4066:	4770      	bx	lr

c0de4068 <tEdwards_alloc>:
c0de4068:	b5b0      	push	{r4, r5, r7, lr}
c0de406a:	f000 fbbe 	bl	c0de47ea <OUTLINED_FUNCTION_4>
c0de406e:	b920      	cbnz	r0, c0de407a <tEdwards_alloc+0x12>
c0de4070:	6821      	ldr	r1, [r4, #0]
c0de4072:	1d28      	adds	r0, r5, #4
c0de4074:	f008 fd9a 	bl	c0decbac <cx_bn_alloc>
c0de4078:	b100      	cbz	r0, c0de407c <tEdwards_alloc+0x14>
c0de407a:	bdb0      	pop	{r4, r5, r7, pc}
c0de407c:	6821      	ldr	r1, [r4, #0]
c0de407e:	f105 0008 	add.w	r0, r5, #8
c0de4082:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
c0de4086:	f008 bd91 	b.w	c0decbac <cx_bn_alloc>

c0de408a <tEdwards_double>:
c0de408a:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de408c:	460f      	mov	r7, r1
c0de408e:	4614      	mov	r4, r2
c0de4090:	4605      	mov	r5, r0
c0de4092:	6843      	ldr	r3, [r0, #4]
c0de4094:	6809      	ldr	r1, [r1, #0]
c0de4096:	6b40      	ldr	r0, [r0, #52]	@ 0x34
c0de4098:	687a      	ldr	r2, [r7, #4]
c0de409a:	f008 fdf5 	bl	c0decc88 <cx_bn_mod_add>
c0de409e:	2800      	cmp	r0, #0
c0de40a0:	d154      	bne.n	c0de414c <tEdwards_double+0xc2>
c0de40a2:	e9d5 010c 	ldrd	r0, r1, [r5, #48]	@ 0x30
c0de40a6:	f105 0620 	add.w	r6, r5, #32
c0de40aa:	f000 fb95 	bl	c0de47d8 <OUTLINED_FUNCTION_2>
c0de40ae:	2800      	cmp	r0, #0
c0de40b0:	d14c      	bne.n	c0de414c <tEdwards_double+0xc2>
c0de40b2:	6839      	ldr	r1, [r7, #0]
c0de40b4:	6b68      	ldr	r0, [r5, #52]	@ 0x34
c0de40b6:	f000 fb8f 	bl	c0de47d8 <OUTLINED_FUNCTION_2>
c0de40ba:	2800      	cmp	r0, #0
c0de40bc:	d146      	bne.n	c0de414c <tEdwards_double+0xc2>
c0de40be:	6879      	ldr	r1, [r7, #4]
c0de40c0:	6ba8      	ldr	r0, [r5, #56]	@ 0x38
c0de40c2:	f000 fb89 	bl	c0de47d8 <OUTLINED_FUNCTION_2>
c0de40c6:	2800      	cmp	r0, #0
c0de40c8:	d140      	bne.n	c0de414c <tEdwards_double+0xc2>
c0de40ca:	69a9      	ldr	r1, [r5, #24]
c0de40cc:	6b6a      	ldr	r2, [r5, #52]	@ 0x34
c0de40ce:	6be8      	ldr	r0, [r5, #60]	@ 0x3c
c0de40d0:	f000 fb7c 	bl	c0de47cc <OUTLINED_FUNCTION_0>
c0de40d4:	bbd0      	cbnz	r0, c0de414c <tEdwards_double+0xc2>
c0de40d6:	686b      	ldr	r3, [r5, #4]
c0de40d8:	e9d5 210e 	ldrd	r2, r1, [r5, #56]	@ 0x38
c0de40dc:	6c28      	ldr	r0, [r5, #64]	@ 0x40
c0de40de:	f008 fdd3 	bl	c0decc88 <cx_bn_mod_add>
c0de40e2:	bb98      	cbnz	r0, c0de414c <tEdwards_double+0xc2>
c0de40e4:	68b9      	ldr	r1, [r7, #8]
c0de40e6:	6ca8      	ldr	r0, [r5, #72]	@ 0x48
c0de40e8:	f000 fb76 	bl	c0de47d8 <OUTLINED_FUNCTION_2>
c0de40ec:	bb70      	cbnz	r0, c0de414c <tEdwards_double+0xc2>
c0de40ee:	686b      	ldr	r3, [r5, #4]
c0de40f0:	6ae8      	ldr	r0, [r5, #44]	@ 0x2c
c0de40f2:	6c29      	ldr	r1, [r5, #64]	@ 0x40
c0de40f4:	6caa      	ldr	r2, [r5, #72]	@ 0x48
c0de40f6:	f008 fdd3 	bl	c0decca0 <cx_bn_mod_sub>
c0de40fa:	bb38      	cbnz	r0, c0de414c <tEdwards_double+0xc2>
c0de40fc:	686b      	ldr	r3, [r5, #4]
c0de40fe:	6ae9      	ldr	r1, [r5, #44]	@ 0x2c
c0de4100:	e9d5 2012 	ldrd	r2, r0, [r5, #72]	@ 0x48
c0de4104:	f008 fdcc 	bl	c0decca0 <cx_bn_mod_sub>
c0de4108:	bb00      	cbnz	r0, c0de414c <tEdwards_double+0xc2>
c0de410a:	f105 022c 	add.w	r2, r5, #44	@ 0x2c
c0de410e:	686b      	ldr	r3, [r5, #4]
c0de4110:	ca07      	ldmia	r2, {r0, r1, r2}
c0de4112:	f008 fdc5 	bl	c0decca0 <cx_bn_mod_sub>
c0de4116:	b9c8      	cbnz	r0, c0de414c <tEdwards_double+0xc2>
c0de4118:	686b      	ldr	r3, [r5, #4]
c0de411a:	e9d5 100b 	ldrd	r1, r0, [r5, #44]	@ 0x2c
c0de411e:	6baa      	ldr	r2, [r5, #56]	@ 0x38
c0de4120:	f008 fdbe 	bl	c0decca0 <cx_bn_mod_sub>
c0de4124:	b990      	cbnz	r0, c0de414c <tEdwards_double+0xc2>
c0de4126:	6b2a      	ldr	r2, [r5, #48]	@ 0x30
c0de4128:	6ce9      	ldr	r1, [r5, #76]	@ 0x4c
c0de412a:	6820      	ldr	r0, [r4, #0]
c0de412c:	f000 fb4e 	bl	c0de47cc <OUTLINED_FUNCTION_0>
c0de4130:	b960      	cbnz	r0, c0de414c <tEdwards_double+0xc2>
c0de4132:	686b      	ldr	r3, [r5, #4]
c0de4134:	e9d5 020d 	ldrd	r0, r2, [r5, #52]	@ 0x34
c0de4138:	6be9      	ldr	r1, [r5, #60]	@ 0x3c
c0de413a:	f008 fdb1 	bl	c0decca0 <cx_bn_mod_sub>
c0de413e:	b928      	cbnz	r0, c0de414c <tEdwards_double+0xc2>
c0de4140:	6b6a      	ldr	r2, [r5, #52]	@ 0x34
c0de4142:	6c29      	ldr	r1, [r5, #64]	@ 0x40
c0de4144:	6860      	ldr	r0, [r4, #4]
c0de4146:	f000 fb41 	bl	c0de47cc <OUTLINED_FUNCTION_0>
c0de414a:	b100      	cbz	r0, c0de414e <tEdwards_double+0xc4>
c0de414c:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0de414e:	6c29      	ldr	r1, [r5, #64]	@ 0x40
c0de4150:	6cea      	ldr	r2, [r5, #76]	@ 0x4c
c0de4152:	68a0      	ldr	r0, [r4, #8]
c0de4154:	4633      	mov	r3, r6
c0de4156:	b001      	add	sp, #4
c0de4158:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de415c:	f008 bde2 	b.w	c0decd24 <cx_mont_mul>

c0de4160 <tEdwards_add>:
c0de4160:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de4164:	4606      	mov	r6, r0
c0de4166:	4617      	mov	r7, r2
c0de4168:	460c      	mov	r4, r1
c0de416a:	6892      	ldr	r2, [r2, #8]
c0de416c:	6889      	ldr	r1, [r1, #8]
c0de416e:	6ac0      	ldr	r0, [r0, #44]	@ 0x2c
c0de4170:	4698      	mov	r8, r3
c0de4172:	f106 0520 	add.w	r5, r6, #32
c0de4176:	f000 fb2c 	bl	c0de47d2 <OUTLINED_FUNCTION_1>
c0de417a:	2800      	cmp	r0, #0
c0de417c:	d17d      	bne.n	c0de427a <tEdwards_add+0x11a>
c0de417e:	e9d6 100b 	ldrd	r1, r0, [r6, #44]	@ 0x2c
c0de4182:	462b      	mov	r3, r5
c0de4184:	460a      	mov	r2, r1
c0de4186:	f008 fdcd 	bl	c0decd24 <cx_mont_mul>
c0de418a:	2800      	cmp	r0, #0
c0de418c:	d175      	bne.n	c0de427a <tEdwards_add+0x11a>
c0de418e:	683a      	ldr	r2, [r7, #0]
c0de4190:	6821      	ldr	r1, [r4, #0]
c0de4192:	6b70      	ldr	r0, [r6, #52]	@ 0x34
c0de4194:	f000 fb1d 	bl	c0de47d2 <OUTLINED_FUNCTION_1>
c0de4198:	2800      	cmp	r0, #0
c0de419a:	d16e      	bne.n	c0de427a <tEdwards_add+0x11a>
c0de419c:	687a      	ldr	r2, [r7, #4]
c0de419e:	6861      	ldr	r1, [r4, #4]
c0de41a0:	6bb0      	ldr	r0, [r6, #56]	@ 0x38
c0de41a2:	f000 fb16 	bl	c0de47d2 <OUTLINED_FUNCTION_1>
c0de41a6:	2800      	cmp	r0, #0
c0de41a8:	d167      	bne.n	c0de427a <tEdwards_add+0x11a>
c0de41aa:	e9d6 120d 	ldrd	r1, r2, [r6, #52]	@ 0x34
c0de41ae:	6cf0      	ldr	r0, [r6, #76]	@ 0x4c
c0de41b0:	f000 fb0f 	bl	c0de47d2 <OUTLINED_FUNCTION_1>
c0de41b4:	2800      	cmp	r0, #0
c0de41b6:	d160      	bne.n	c0de427a <tEdwards_add+0x11a>
c0de41b8:	69f2      	ldr	r2, [r6, #28]
c0de41ba:	6bf0      	ldr	r0, [r6, #60]	@ 0x3c
c0de41bc:	6cf1      	ldr	r1, [r6, #76]	@ 0x4c
c0de41be:	f000 fb08 	bl	c0de47d2 <OUTLINED_FUNCTION_1>
c0de41c2:	2800      	cmp	r0, #0
c0de41c4:	d159      	bne.n	c0de427a <tEdwards_add+0x11a>
c0de41c6:	6873      	ldr	r3, [r6, #4]
c0de41c8:	6b31      	ldr	r1, [r6, #48]	@ 0x30
c0de41ca:	e9d6 200f 	ldrd	r2, r0, [r6, #60]	@ 0x3c
c0de41ce:	f008 fd67 	bl	c0decca0 <cx_bn_mod_sub>
c0de41d2:	2800      	cmp	r0, #0
c0de41d4:	d151      	bne.n	c0de427a <tEdwards_add+0x11a>
c0de41d6:	6873      	ldr	r3, [r6, #4]
c0de41d8:	6b31      	ldr	r1, [r6, #48]	@ 0x30
c0de41da:	6bf2      	ldr	r2, [r6, #60]	@ 0x3c
c0de41dc:	6c70      	ldr	r0, [r6, #68]	@ 0x44
c0de41de:	f008 fd53 	bl	c0decc88 <cx_bn_mod_add>
c0de41e2:	2800      	cmp	r0, #0
c0de41e4:	d149      	bne.n	c0de427a <tEdwards_add+0x11a>
c0de41e6:	e9d4 1200 	ldrd	r1, r2, [r4]
c0de41ea:	6873      	ldr	r3, [r6, #4]
c0de41ec:	6cb0      	ldr	r0, [r6, #72]	@ 0x48
c0de41ee:	f008 fd4b 	bl	c0decc88 <cx_bn_mod_add>
c0de41f2:	2800      	cmp	r0, #0
c0de41f4:	d141      	bne.n	c0de427a <tEdwards_add+0x11a>
c0de41f6:	e9d7 1200 	ldrd	r1, r2, [r7]
c0de41fa:	6873      	ldr	r3, [r6, #4]
c0de41fc:	6cf0      	ldr	r0, [r6, #76]	@ 0x4c
c0de41fe:	f008 fd43 	bl	c0decc88 <cx_bn_mod_add>
c0de4202:	bbd0      	cbnz	r0, c0de427a <tEdwards_add+0x11a>
c0de4204:	6b30      	ldr	r0, [r6, #48]	@ 0x30
c0de4206:	e9d6 1212 	ldrd	r1, r2, [r6, #72]	@ 0x48
c0de420a:	f000 fae2 	bl	c0de47d2 <OUTLINED_FUNCTION_1>
c0de420e:	bba0      	cbnz	r0, c0de427a <tEdwards_add+0x11a>
c0de4210:	6873      	ldr	r3, [r6, #4]
c0de4212:	e9d6 120c 	ldrd	r1, r2, [r6, #48]	@ 0x30
c0de4216:	6cb0      	ldr	r0, [r6, #72]	@ 0x48
c0de4218:	f008 fd42 	bl	c0decca0 <cx_bn_mod_sub>
c0de421c:	bb68      	cbnz	r0, c0de427a <tEdwards_add+0x11a>
c0de421e:	6873      	ldr	r3, [r6, #4]
c0de4220:	6bb2      	ldr	r2, [r6, #56]	@ 0x38
c0de4222:	e9d6 1012 	ldrd	r1, r0, [r6, #72]	@ 0x48
c0de4226:	f008 fd3b 	bl	c0decca0 <cx_bn_mod_sub>
c0de422a:	bb30      	cbnz	r0, c0de427a <tEdwards_add+0x11a>
c0de422c:	e9d6 100b 	ldrd	r1, r0, [r6, #44]	@ 0x2c
c0de4230:	6cf2      	ldr	r2, [r6, #76]	@ 0x4c
c0de4232:	f000 face 	bl	c0de47d2 <OUTLINED_FUNCTION_1>
c0de4236:	bb00      	cbnz	r0, c0de427a <tEdwards_add+0x11a>
c0de4238:	6b32      	ldr	r2, [r6, #48]	@ 0x30
c0de423a:	6c31      	ldr	r1, [r6, #64]	@ 0x40
c0de423c:	f8d8 0000 	ldr.w	r0, [r8]
c0de4240:	f000 fac7 	bl	c0de47d2 <OUTLINED_FUNCTION_1>
c0de4244:	b9c8      	cbnz	r0, c0de427a <tEdwards_add+0x11a>
c0de4246:	69b1      	ldr	r1, [r6, #24]
c0de4248:	e9d6 020c 	ldrd	r0, r2, [r6, #48]	@ 0x30
c0de424c:	f000 fac1 	bl	c0de47d2 <OUTLINED_FUNCTION_1>
c0de4250:	b998      	cbnz	r0, c0de427a <tEdwards_add+0x11a>
c0de4252:	6873      	ldr	r3, [r6, #4]
c0de4254:	6b32      	ldr	r2, [r6, #48]	@ 0x30
c0de4256:	6bb1      	ldr	r1, [r6, #56]	@ 0x38
c0de4258:	6cf0      	ldr	r0, [r6, #76]	@ 0x4c
c0de425a:	f008 fd21 	bl	c0decca0 <cx_bn_mod_sub>
c0de425e:	b960      	cbnz	r0, c0de427a <tEdwards_add+0x11a>
c0de4260:	6b30      	ldr	r0, [r6, #48]	@ 0x30
c0de4262:	6c71      	ldr	r1, [r6, #68]	@ 0x44
c0de4264:	6cf2      	ldr	r2, [r6, #76]	@ 0x4c
c0de4266:	f000 fab4 	bl	c0de47d2 <OUTLINED_FUNCTION_1>
c0de426a:	b930      	cbnz	r0, c0de427a <tEdwards_add+0x11a>
c0de426c:	e9d6 120b 	ldrd	r1, r2, [r6, #44]	@ 0x2c
c0de4270:	f8d8 0004 	ldr.w	r0, [r8, #4]
c0de4274:	f000 faad 	bl	c0de47d2 <OUTLINED_FUNCTION_1>
c0de4278:	b108      	cbz	r0, c0de427e <tEdwards_add+0x11e>
c0de427a:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de427e:	e9d6 1210 	ldrd	r1, r2, [r6, #64]	@ 0x40
c0de4282:	f8d8 0008 	ldr.w	r0, [r8, #8]
c0de4286:	462b      	mov	r3, r5
c0de4288:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de428c:	f008 bd4a 	b.w	c0decd24 <cx_mont_mul>

c0de4290 <tEdwards_IsOnCurve>:
c0de4290:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de4292:	4605      	mov	r5, r0
c0de4294:	460f      	mov	r7, r1
c0de4296:	2005      	movs	r0, #5
c0de4298:	6809      	ldr	r1, [r1, #0]
c0de429a:	4614      	mov	r4, r2
c0de429c:	9000      	str	r0, [sp, #0]
c0de429e:	f105 0620 	add.w	r6, r5, #32
c0de42a2:	6ae8      	ldr	r0, [r5, #44]	@ 0x2c
c0de42a4:	460a      	mov	r2, r1
c0de42a6:	f000 fa91 	bl	c0de47cc <OUTLINED_FUNCTION_0>
c0de42aa:	b100      	cbz	r0, c0de42ae <tEdwards_IsOnCurve+0x1e>
c0de42ac:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0de42ae:	6879      	ldr	r1, [r7, #4]
c0de42b0:	6b28      	ldr	r0, [r5, #48]	@ 0x30
c0de42b2:	f000 fa91 	bl	c0de47d8 <OUTLINED_FUNCTION_2>
c0de42b6:	2800      	cmp	r0, #0
c0de42b8:	d1f8      	bne.n	c0de42ac <tEdwards_IsOnCurve+0x1c>
c0de42ba:	e9d5 120b 	ldrd	r1, r2, [r5, #44]	@ 0x2c
c0de42be:	6b68      	ldr	r0, [r5, #52]	@ 0x34
c0de42c0:	f000 fa84 	bl	c0de47cc <OUTLINED_FUNCTION_0>
c0de42c4:	2800      	cmp	r0, #0
c0de42c6:	d1f1      	bne.n	c0de42ac <tEdwards_IsOnCurve+0x1c>
c0de42c8:	69a9      	ldr	r1, [r5, #24]
c0de42ca:	6aea      	ldr	r2, [r5, #44]	@ 0x2c
c0de42cc:	6be8      	ldr	r0, [r5, #60]	@ 0x3c
c0de42ce:	f000 fa7d 	bl	c0de47cc <OUTLINED_FUNCTION_0>
c0de42d2:	2800      	cmp	r0, #0
c0de42d4:	d1ea      	bne.n	c0de42ac <tEdwards_IsOnCurve+0x1c>
c0de42d6:	6be8      	ldr	r0, [r5, #60]	@ 0x3c
c0de42d8:	686b      	ldr	r3, [r5, #4]
c0de42da:	6b2a      	ldr	r2, [r5, #48]	@ 0x30
c0de42dc:	4601      	mov	r1, r0
c0de42de:	f008 fcd3 	bl	c0decc88 <cx_bn_mod_add>
c0de42e2:	2800      	cmp	r0, #0
c0de42e4:	d1e2      	bne.n	c0de42ac <tEdwards_IsOnCurve+0x1c>
c0de42e6:	69e9      	ldr	r1, [r5, #28]
c0de42e8:	6b6a      	ldr	r2, [r5, #52]	@ 0x34
c0de42ea:	6c28      	ldr	r0, [r5, #64]	@ 0x40
c0de42ec:	f000 fa6e 	bl	c0de47cc <OUTLINED_FUNCTION_0>
c0de42f0:	2800      	cmp	r0, #0
c0de42f2:	d1db      	bne.n	c0de42ac <tEdwards_IsOnCurve+0x1c>
c0de42f4:	686b      	ldr	r3, [r5, #4]
c0de42f6:	6aaa      	ldr	r2, [r5, #40]	@ 0x28
c0de42f8:	6ba8      	ldr	r0, [r5, #56]	@ 0x38
c0de42fa:	6c29      	ldr	r1, [r5, #64]	@ 0x40
c0de42fc:	f008 fcc4 	bl	c0decc88 <cx_bn_mod_add>
c0de4300:	2800      	cmp	r0, #0
c0de4302:	d1d3      	bne.n	c0de42ac <tEdwards_IsOnCurve+0x1c>
c0de4304:	6ba8      	ldr	r0, [r5, #56]	@ 0x38
c0de4306:	4632      	mov	r2, r6
c0de4308:	4601      	mov	r1, r0
c0de430a:	f008 fcff 	bl	c0decd0c <cx_mont_from_montgomery>
c0de430e:	2800      	cmp	r0, #0
c0de4310:	d1cc      	bne.n	c0de42ac <tEdwards_IsOnCurve+0x1c>
c0de4312:	6be8      	ldr	r0, [r5, #60]	@ 0x3c
c0de4314:	4632      	mov	r2, r6
c0de4316:	4601      	mov	r1, r0
c0de4318:	f008 fcf8 	bl	c0decd0c <cx_mont_from_montgomery>
c0de431c:	2800      	cmp	r0, #0
c0de431e:	d1c5      	bne.n	c0de42ac <tEdwards_IsOnCurve+0x1c>
c0de4320:	e9d5 010e 	ldrd	r0, r1, [r5, #56]	@ 0x38
c0de4324:	466a      	mov	r2, sp
c0de4326:	f008 fc8b 	bl	c0decc40 <cx_bn_cmp>
c0de432a:	2800      	cmp	r0, #0
c0de432c:	d1be      	bne.n	c0de42ac <tEdwards_IsOnCurve+0x1c>
c0de432e:	9800      	ldr	r0, [sp, #0]
c0de4330:	fab0 f080 	clz	r0, r0
c0de4334:	0940      	lsrs	r0, r0, #5
c0de4336:	7020      	strb	r0, [r4, #0]
c0de4338:	2000      	movs	r0, #0
c0de433a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}

c0de433c <tEdwards_Curve_alloc_init>:
c0de433c:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de4340:	b0c1      	sub	sp, #260	@ 0x104
c0de4342:	4604      	mov	r4, r0
c0de4344:	2902      	cmp	r1, #2
c0de4346:	d01f      	beq.n	c0de4388 <tEdwards_Curve_alloc_init+0x4c>
c0de4348:	2901      	cmp	r1, #1
c0de434a:	f040 80cf 	bne.w	c0de44ec <tEdwards_Curve_alloc_init+0x1b0>
c0de434e:	2020      	movs	r0, #32
c0de4350:	2220      	movs	r2, #32
c0de4352:	6020      	str	r0, [r4, #0]
c0de4354:	af39      	add	r7, sp, #228	@ 0xe4
c0de4356:	4968      	ldr	r1, [pc, #416]	@ (c0de44f8 <tEdwards_Curve_alloc_init+0x1bc>)
c0de4358:	4638      	mov	r0, r7
c0de435a:	4479      	add	r1, pc
c0de435c:	f008 fece 	bl	c0ded0fc <__aeabi_memcpy>
c0de4360:	4966      	ldr	r1, [pc, #408]	@ (c0de44fc <tEdwards_Curve_alloc_init+0x1c0>)
c0de4362:	f10d 0ac4 	add.w	sl, sp, #196	@ 0xc4
c0de4366:	2220      	movs	r2, #32
c0de4368:	4650      	mov	r0, sl
c0de436a:	4479      	add	r1, pc
c0de436c:	f008 fec6 	bl	c0ded0fc <__aeabi_memcpy>
c0de4370:	4963      	ldr	r1, [pc, #396]	@ (c0de4500 <tEdwards_Curve_alloc_init+0x1c4>)
c0de4372:	f10d 08a4 	add.w	r8, sp, #164	@ 0xa4
c0de4376:	2220      	movs	r2, #32
c0de4378:	4640      	mov	r0, r8
c0de437a:	4479      	add	r1, pc
c0de437c:	f008 febe 	bl	c0ded0fc <__aeabi_memcpy>
c0de4380:	ad21      	add	r5, sp, #132	@ 0x84
c0de4382:	4960      	ldr	r1, [pc, #384]	@ (c0de4504 <tEdwards_Curve_alloc_init+0x1c8>)
c0de4384:	4479      	add	r1, pc
c0de4386:	e01b      	b.n	c0de43c0 <tEdwards_Curve_alloc_init+0x84>
c0de4388:	2020      	movs	r0, #32
c0de438a:	2220      	movs	r2, #32
c0de438c:	6020      	str	r0, [r4, #0]
c0de438e:	af19      	add	r7, sp, #100	@ 0x64
c0de4390:	495d      	ldr	r1, [pc, #372]	@ (c0de4508 <tEdwards_Curve_alloc_init+0x1cc>)
c0de4392:	4638      	mov	r0, r7
c0de4394:	4479      	add	r1, pc
c0de4396:	f008 feb1 	bl	c0ded0fc <__aeabi_memcpy>
c0de439a:	495c      	ldr	r1, [pc, #368]	@ (c0de450c <tEdwards_Curve_alloc_init+0x1d0>)
c0de439c:	f10d 0a44 	add.w	sl, sp, #68	@ 0x44
c0de43a0:	2220      	movs	r2, #32
c0de43a2:	4650      	mov	r0, sl
c0de43a4:	4479      	add	r1, pc
c0de43a6:	f008 fea9 	bl	c0ded0fc <__aeabi_memcpy>
c0de43aa:	4959      	ldr	r1, [pc, #356]	@ (c0de4510 <tEdwards_Curve_alloc_init+0x1d4>)
c0de43ac:	f10d 0824 	add.w	r8, sp, #36	@ 0x24
c0de43b0:	2220      	movs	r2, #32
c0de43b2:	4640      	mov	r0, r8
c0de43b4:	4479      	add	r1, pc
c0de43b6:	f008 fea1 	bl	c0ded0fc <__aeabi_memcpy>
c0de43ba:	ad01      	add	r5, sp, #4
c0de43bc:	4955      	ldr	r1, [pc, #340]	@ (c0de4514 <tEdwards_Curve_alloc_init+0x1d8>)
c0de43be:	4479      	add	r1, pc
c0de43c0:	4628      	mov	r0, r5
c0de43c2:	2220      	movs	r2, #32
c0de43c4:	f008 fe9a 	bl	c0ded0fc <__aeabi_memcpy>
c0de43c8:	1d26      	adds	r6, r4, #4
c0de43ca:	2120      	movs	r1, #32
c0de43cc:	463a      	mov	r2, r7
c0de43ce:	2320      	movs	r3, #32
c0de43d0:	4630      	mov	r0, r6
c0de43d2:	f008 fbf5 	bl	c0decbc0 <cx_bn_alloc_init>
c0de43d6:	2800      	cmp	r0, #0
c0de43d8:	f040 808a 	bne.w	c0de44f0 <tEdwards_Curve_alloc_init+0x1b4>
c0de43dc:	4620      	mov	r0, r4
c0de43de:	462a      	mov	r2, r5
c0de43e0:	f850 1b08 	ldr.w	r1, [r0], #8
c0de43e4:	460b      	mov	r3, r1
c0de43e6:	f008 fbeb 	bl	c0decbc0 <cx_bn_alloc_init>
c0de43ea:	2800      	cmp	r0, #0
c0de43ec:	f040 8080 	bne.w	c0de44f0 <tEdwards_Curve_alloc_init+0x1b4>
c0de43f0:	f104 0720 	add.w	r7, r4, #32
c0de43f4:	2120      	movs	r1, #32
c0de43f6:	4638      	mov	r0, r7
c0de43f8:	f008 fc68 	bl	c0decccc <cx_mont_alloc>
c0de43fc:	2800      	cmp	r0, #0
c0de43fe:	d177      	bne.n	c0de44f0 <tEdwards_Curve_alloc_init+0x1b4>
c0de4400:	6831      	ldr	r1, [r6, #0]
c0de4402:	4638      	mov	r0, r7
c0de4404:	f008 fc6c 	bl	c0decce0 <cx_mont_init>
c0de4408:	2800      	cmp	r0, #0
c0de440a:	d171      	bne.n	c0de44f0 <tEdwards_Curve_alloc_init+0x1b4>
c0de440c:	4625      	mov	r5, r4
c0de440e:	f855 1b28 	ldr.w	r1, [r5], #40
c0de4412:	4628      	mov	r0, r5
c0de4414:	f008 fbca 	bl	c0decbac <cx_bn_alloc>
c0de4418:	2800      	cmp	r0, #0
c0de441a:	d169      	bne.n	c0de44f0 <tEdwards_Curve_alloc_init+0x1b4>
c0de441c:	6828      	ldr	r0, [r5, #0]
c0de441e:	2101      	movs	r1, #1
c0de4420:	f008 fbf8 	bl	c0decc14 <cx_bn_set_u32>
c0de4424:	2800      	cmp	r0, #0
c0de4426:	d163      	bne.n	c0de44f0 <tEdwards_Curve_alloc_init+0x1b4>
c0de4428:	f000 f9da 	bl	c0de47e0 <OUTLINED_FUNCTION_3>
c0de442c:	2800      	cmp	r0, #0
c0de442e:	d15f      	bne.n	c0de44f0 <tEdwards_Curve_alloc_init+0x1b4>
c0de4430:	f104 050c 	add.w	r5, r4, #12
c0de4434:	4620      	mov	r0, r4
c0de4436:	4629      	mov	r1, r5
c0de4438:	f7ff fe16 	bl	c0de4068 <tEdwards_alloc>
c0de443c:	2800      	cmp	r0, #0
c0de443e:	d157      	bne.n	c0de44f0 <tEdwards_Curve_alloc_init+0x1b4>
c0de4440:	4620      	mov	r0, r4
c0de4442:	4629      	mov	r1, r5
c0de4444:	f000 f868 	bl	c0de4518 <tEdwards_SetNeutral>
c0de4448:	2800      	cmp	r0, #0
c0de444a:	d151      	bne.n	c0de44f0 <tEdwards_Curve_alloc_init+0x1b4>
c0de444c:	4625      	mov	r5, r4
c0de444e:	4652      	mov	r2, sl
c0de4450:	f855 1b18 	ldr.w	r1, [r5], #24
c0de4454:	4628      	mov	r0, r5
c0de4456:	460b      	mov	r3, r1
c0de4458:	f008 fbb2 	bl	c0decbc0 <cx_bn_alloc_init>
c0de445c:	2800      	cmp	r0, #0
c0de445e:	d147      	bne.n	c0de44f0 <tEdwards_Curve_alloc_init+0x1b4>
c0de4460:	f000 f9be 	bl	c0de47e0 <OUTLINED_FUNCTION_3>
c0de4464:	2800      	cmp	r0, #0
c0de4466:	d143      	bne.n	c0de44f0 <tEdwards_Curve_alloc_init+0x1b4>
c0de4468:	4625      	mov	r5, r4
c0de446a:	4642      	mov	r2, r8
c0de446c:	f855 1b1c 	ldr.w	r1, [r5], #28
c0de4470:	4628      	mov	r0, r5
c0de4472:	460b      	mov	r3, r1
c0de4474:	f008 fba4 	bl	c0decbc0 <cx_bn_alloc_init>
c0de4478:	bbd0      	cbnz	r0, c0de44f0 <tEdwards_Curve_alloc_init+0x1b4>
c0de447a:	f000 f9b1 	bl	c0de47e0 <OUTLINED_FUNCTION_3>
c0de447e:	bbb8      	cbnz	r0, c0de44f0 <tEdwards_Curve_alloc_init+0x1b4>
c0de4480:	4620      	mov	r0, r4
c0de4482:	f850 1b2c 	ldr.w	r1, [r0], #44
c0de4486:	f008 fb91 	bl	c0decbac <cx_bn_alloc>
c0de448a:	bb88      	cbnz	r0, c0de44f0 <tEdwards_Curve_alloc_init+0x1b4>
c0de448c:	4620      	mov	r0, r4
c0de448e:	f850 1b30 	ldr.w	r1, [r0], #48
c0de4492:	f008 fb8b 	bl	c0decbac <cx_bn_alloc>
c0de4496:	bb58      	cbnz	r0, c0de44f0 <tEdwards_Curve_alloc_init+0x1b4>
c0de4498:	4620      	mov	r0, r4
c0de449a:	f850 1b34 	ldr.w	r1, [r0], #52
c0de449e:	f008 fb85 	bl	c0decbac <cx_bn_alloc>
c0de44a2:	bb28      	cbnz	r0, c0de44f0 <tEdwards_Curve_alloc_init+0x1b4>
c0de44a4:	4620      	mov	r0, r4
c0de44a6:	f850 1b38 	ldr.w	r1, [r0], #56
c0de44aa:	f008 fb7f 	bl	c0decbac <cx_bn_alloc>
c0de44ae:	b9f8      	cbnz	r0, c0de44f0 <tEdwards_Curve_alloc_init+0x1b4>
c0de44b0:	4620      	mov	r0, r4
c0de44b2:	f850 1b3c 	ldr.w	r1, [r0], #60
c0de44b6:	f008 fb79 	bl	c0decbac <cx_bn_alloc>
c0de44ba:	b9c8      	cbnz	r0, c0de44f0 <tEdwards_Curve_alloc_init+0x1b4>
c0de44bc:	4620      	mov	r0, r4
c0de44be:	f850 1b40 	ldr.w	r1, [r0], #64
c0de44c2:	f008 fb73 	bl	c0decbac <cx_bn_alloc>
c0de44c6:	b998      	cbnz	r0, c0de44f0 <tEdwards_Curve_alloc_init+0x1b4>
c0de44c8:	4620      	mov	r0, r4
c0de44ca:	f850 1b44 	ldr.w	r1, [r0], #68
c0de44ce:	f008 fb6d 	bl	c0decbac <cx_bn_alloc>
c0de44d2:	b968      	cbnz	r0, c0de44f0 <tEdwards_Curve_alloc_init+0x1b4>
c0de44d4:	4620      	mov	r0, r4
c0de44d6:	f850 1b48 	ldr.w	r1, [r0], #72
c0de44da:	f008 fb67 	bl	c0decbac <cx_bn_alloc>
c0de44de:	b938      	cbnz	r0, c0de44f0 <tEdwards_Curve_alloc_init+0x1b4>
c0de44e0:	f854 1b4c 	ldr.w	r1, [r4], #76
c0de44e4:	4620      	mov	r0, r4
c0de44e6:	f008 fb61 	bl	c0decbac <cx_bn_alloc>
c0de44ea:	e001      	b.n	c0de44f0 <tEdwards_Curve_alloc_init+0x1b4>
c0de44ec:	f648 3099 	movw	r0, #35737	@ 0x8b99
c0de44f0:	b041      	add	sp, #260	@ 0x104
c0de44f2:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}
c0de44f6:	bf00      	nop
c0de44f8:	0000aa5a 	.word	0x0000aa5a
c0de44fc:	0000ab8a 	.word	0x0000ab8a
c0de4500:	0000ab5a 	.word	0x0000ab5a
c0de4504:	0000aab0 	.word	0x0000aab0
c0de4508:	0000aba0 	.word	0x0000aba0
c0de450c:	0000ab10 	.word	0x0000ab10
c0de4510:	0000ab60 	.word	0x0000ab60
c0de4514:	0000aa96 	.word	0x0000aa96

c0de4518 <tEdwards_SetNeutral>:
c0de4518:	b5b0      	push	{r4, r5, r7, lr}
c0de451a:	4605      	mov	r5, r0
c0de451c:	6808      	ldr	r0, [r1, #0]
c0de451e:	460c      	mov	r4, r1
c0de4520:	2100      	movs	r1, #0
c0de4522:	f008 fb77 	bl	c0decc14 <cx_bn_set_u32>
c0de4526:	b918      	cbnz	r0, c0de4530 <tEdwards_SetNeutral+0x18>
c0de4528:	6aa9      	ldr	r1, [r5, #40]	@ 0x28
c0de452a:	f000 f964 	bl	c0de47f6 <OUTLINED_FUNCTION_5>
c0de452e:	b100      	cbz	r0, c0de4532 <tEdwards_SetNeutral+0x1a>
c0de4530:	bdb0      	pop	{r4, r5, r7, pc}
c0de4532:	6aa9      	ldr	r1, [r5, #40]	@ 0x28
c0de4534:	68a0      	ldr	r0, [r4, #8]
c0de4536:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
c0de453a:	f008 bb61 	b.w	c0decc00 <cx_bn_copy>

c0de453e <tEdwards_init>:
c0de453e:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de4540:	6806      	ldr	r6, [r0, #0]
c0de4542:	461c      	mov	r4, r3
c0de4544:	4617      	mov	r7, r2
c0de4546:	460a      	mov	r2, r1
c0de4548:	4605      	mov	r5, r0
c0de454a:	a802      	add	r0, sp, #8
c0de454c:	4631      	mov	r1, r6
c0de454e:	4633      	mov	r3, r6
c0de4550:	f008 fb36 	bl	c0decbc0 <cx_bn_alloc_init>
c0de4554:	b100      	cbz	r0, c0de4558 <tEdwards_init+0x1a>
c0de4556:	bdfe      	pop	{r1, r2, r3, r4, r5, r6, r7, pc}
c0de4558:	a801      	add	r0, sp, #4
c0de455a:	4631      	mov	r1, r6
c0de455c:	463a      	mov	r2, r7
c0de455e:	4633      	mov	r3, r6
c0de4560:	f008 fb2e 	bl	c0decbc0 <cx_bn_alloc_init>
c0de4564:	2800      	cmp	r0, #0
c0de4566:	d1f6      	bne.n	c0de4556 <tEdwards_init+0x18>
c0de4568:	4668      	mov	r0, sp
c0de456a:	4631      	mov	r1, r6
c0de456c:	f008 fb1e 	bl	c0decbac <cx_bn_alloc>
c0de4570:	2800      	cmp	r0, #0
c0de4572:	d1f0      	bne.n	c0de4556 <tEdwards_init+0x18>
c0de4574:	f105 0620 	add.w	r6, r5, #32
c0de4578:	6820      	ldr	r0, [r4, #0]
c0de457a:	9902      	ldr	r1, [sp, #8]
c0de457c:	4632      	mov	r2, r6
c0de457e:	f008 fbb9 	bl	c0deccf4 <cx_mont_to_montgomery>
c0de4582:	2800      	cmp	r0, #0
c0de4584:	d1e7      	bne.n	c0de4556 <tEdwards_init+0x18>
c0de4586:	6860      	ldr	r0, [r4, #4]
c0de4588:	9901      	ldr	r1, [sp, #4]
c0de458a:	4632      	mov	r2, r6
c0de458c:	f008 fbb2 	bl	c0deccf4 <cx_mont_to_montgomery>
c0de4590:	2800      	cmp	r0, #0
c0de4592:	d1e0      	bne.n	c0de4556 <tEdwards_init+0x18>
c0de4594:	6aa9      	ldr	r1, [r5, #40]	@ 0x28
c0de4596:	68a0      	ldr	r0, [r4, #8]
c0de4598:	f008 fb32 	bl	c0decc00 <cx_bn_copy>
c0de459c:	2800      	cmp	r0, #0
c0de459e:	d1da      	bne.n	c0de4556 <tEdwards_init+0x18>
c0de45a0:	a802      	add	r0, sp, #8
c0de45a2:	f008 fb19 	bl	c0decbd8 <cx_bn_destroy>
c0de45a6:	2800      	cmp	r0, #0
c0de45a8:	d1d5      	bne.n	c0de4556 <tEdwards_init+0x18>
c0de45aa:	a801      	add	r0, sp, #4
c0de45ac:	f008 fb14 	bl	c0decbd8 <cx_bn_destroy>
c0de45b0:	2800      	cmp	r0, #0
c0de45b2:	d1d0      	bne.n	c0de4556 <tEdwards_init+0x18>
c0de45b4:	4668      	mov	r0, sp
c0de45b6:	f008 fb0f 	bl	c0decbd8 <cx_bn_destroy>
c0de45ba:	bdfe      	pop	{r1, r2, r3, r4, r5, r6, r7, pc}

c0de45bc <tEdwards_export>:
c0de45bc:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de45c0:	4698      	mov	r8, r3
c0de45c2:	4616      	mov	r6, r2
c0de45c4:	460f      	mov	r7, r1
c0de45c6:	4605      	mov	r5, r0
c0de45c8:	f000 f81e 	bl	c0de4608 <tEdwards_normalize>
c0de45cc:	b998      	cbnz	r0, c0de45f6 <tEdwards_export+0x3a>
c0de45ce:	f105 0420 	add.w	r4, r5, #32
c0de45d2:	6839      	ldr	r1, [r7, #0]
c0de45d4:	6ae8      	ldr	r0, [r5, #44]	@ 0x2c
c0de45d6:	4622      	mov	r2, r4
c0de45d8:	f008 fb98 	bl	c0decd0c <cx_mont_from_montgomery>
c0de45dc:	b958      	cbnz	r0, c0de45f6 <tEdwards_export+0x3a>
c0de45de:	6879      	ldr	r1, [r7, #4]
c0de45e0:	6b28      	ldr	r0, [r5, #48]	@ 0x30
c0de45e2:	4622      	mov	r2, r4
c0de45e4:	f008 fb92 	bl	c0decd0c <cx_mont_from_montgomery>
c0de45e8:	b928      	cbnz	r0, c0de45f6 <tEdwards_export+0x3a>
c0de45ea:	682a      	ldr	r2, [r5, #0]
c0de45ec:	6ae8      	ldr	r0, [r5, #44]	@ 0x2c
c0de45ee:	4631      	mov	r1, r6
c0de45f0:	f008 fb1a 	bl	c0decc28 <cx_bn_export>
c0de45f4:	b108      	cbz	r0, c0de45fa <tEdwards_export+0x3e>
c0de45f6:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de45fa:	682a      	ldr	r2, [r5, #0]
c0de45fc:	6b28      	ldr	r0, [r5, #48]	@ 0x30
c0de45fe:	4641      	mov	r1, r8
c0de4600:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de4604:	f008 bb10 	b.w	c0decc28 <cx_bn_export>

c0de4608 <tEdwards_normalize>:
c0de4608:	b570      	push	{r4, r5, r6, lr}
c0de460a:	4605      	mov	r5, r0
c0de460c:	460c      	mov	r4, r1
c0de460e:	6889      	ldr	r1, [r1, #8]
c0de4610:	6ac0      	ldr	r0, [r0, #44]	@ 0x2c
c0de4612:	f105 0620 	add.w	r6, r5, #32
c0de4616:	4632      	mov	r2, r6
c0de4618:	f008 fb90 	bl	c0decd3c <cx_mont_invert_nprime>
c0de461c:	b9d0      	cbnz	r0, c0de4654 <tEdwards_normalize+0x4c>
c0de461e:	6822      	ldr	r2, [r4, #0]
c0de4620:	e9d5 100b 	ldrd	r1, r0, [r5, #44]	@ 0x2c
c0de4624:	f000 f8d2 	bl	c0de47cc <OUTLINED_FUNCTION_0>
c0de4628:	b9a0      	cbnz	r0, c0de4654 <tEdwards_normalize+0x4c>
c0de462a:	6862      	ldr	r2, [r4, #4]
c0de462c:	6ae9      	ldr	r1, [r5, #44]	@ 0x2c
c0de462e:	6b68      	ldr	r0, [r5, #52]	@ 0x34
c0de4630:	f000 f8cc 	bl	c0de47cc <OUTLINED_FUNCTION_0>
c0de4634:	b970      	cbnz	r0, c0de4654 <tEdwards_normalize+0x4c>
c0de4636:	68a2      	ldr	r2, [r4, #8]
c0de4638:	6ae9      	ldr	r1, [r5, #44]	@ 0x2c
c0de463a:	6ba8      	ldr	r0, [r5, #56]	@ 0x38
c0de463c:	f000 f8c6 	bl	c0de47cc <OUTLINED_FUNCTION_0>
c0de4640:	b940      	cbnz	r0, c0de4654 <tEdwards_normalize+0x4c>
c0de4642:	6b29      	ldr	r1, [r5, #48]	@ 0x30
c0de4644:	6820      	ldr	r0, [r4, #0]
c0de4646:	f008 fadb 	bl	c0decc00 <cx_bn_copy>
c0de464a:	b918      	cbnz	r0, c0de4654 <tEdwards_normalize+0x4c>
c0de464c:	6b69      	ldr	r1, [r5, #52]	@ 0x34
c0de464e:	f000 f8d2 	bl	c0de47f6 <OUTLINED_FUNCTION_5>
c0de4652:	b100      	cbz	r0, c0de4656 <tEdwards_normalize+0x4e>
c0de4654:	bd70      	pop	{r4, r5, r6, pc}
c0de4656:	6ba9      	ldr	r1, [r5, #56]	@ 0x38
c0de4658:	68a0      	ldr	r0, [r4, #8]
c0de465a:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de465e:	f008 bacf 	b.w	c0decc00 <cx_bn_copy>

c0de4662 <tEdwards_copy>:
c0de4662:	b5b0      	push	{r4, r5, r7, lr}
c0de4664:	460c      	mov	r4, r1
c0de4666:	4605      	mov	r5, r0
c0de4668:	6801      	ldr	r1, [r0, #0]
c0de466a:	6820      	ldr	r0, [r4, #0]
c0de466c:	f008 fac8 	bl	c0decc00 <cx_bn_copy>
c0de4670:	b918      	cbnz	r0, c0de467a <tEdwards_copy+0x18>
c0de4672:	6869      	ldr	r1, [r5, #4]
c0de4674:	f000 f8bf 	bl	c0de47f6 <OUTLINED_FUNCTION_5>
c0de4678:	b100      	cbz	r0, c0de467c <tEdwards_copy+0x1a>
c0de467a:	bdb0      	pop	{r4, r5, r7, pc}
c0de467c:	68a9      	ldr	r1, [r5, #8]
c0de467e:	68a0      	ldr	r0, [r4, #8]
c0de4680:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
c0de4684:	f008 babc 	b.w	c0decc00 <cx_bn_copy>

c0de4688 <tEdwards_alloc_init>:
c0de4688:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de468a:	460e      	mov	r6, r1
c0de468c:	6801      	ldr	r1, [r0, #0]
c0de468e:	4607      	mov	r7, r0
c0de4690:	4618      	mov	r0, r3
c0de4692:	461c      	mov	r4, r3
c0de4694:	4615      	mov	r5, r2
c0de4696:	f008 fa89 	bl	c0decbac <cx_bn_alloc>
c0de469a:	b950      	cbnz	r0, c0de46b2 <tEdwards_alloc_init+0x2a>
c0de469c:	6839      	ldr	r1, [r7, #0]
c0de469e:	1d20      	adds	r0, r4, #4
c0de46a0:	f008 fa84 	bl	c0decbac <cx_bn_alloc>
c0de46a4:	b928      	cbnz	r0, c0de46b2 <tEdwards_alloc_init+0x2a>
c0de46a6:	6839      	ldr	r1, [r7, #0]
c0de46a8:	f104 0008 	add.w	r0, r4, #8
c0de46ac:	f008 fa7e 	bl	c0decbac <cx_bn_alloc>
c0de46b0:	b100      	cbz	r0, c0de46b4 <tEdwards_alloc_init+0x2c>
c0de46b2:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0de46b4:	4638      	mov	r0, r7
c0de46b6:	4631      	mov	r1, r6
c0de46b8:	462a      	mov	r2, r5
c0de46ba:	4623      	mov	r3, r4
c0de46bc:	b001      	add	sp, #4
c0de46be:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de46c2:	f7ff bf3c 	b.w	c0de453e <tEdwards_init>

c0de46c6 <tEdwards_scalarMul_bn>:
c0de46c6:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de46ca:	4607      	mov	r7, r0
c0de46cc:	2000      	movs	r0, #0
c0de46ce:	4688      	mov	r8, r1
c0de46d0:	4615      	mov	r5, r2
c0de46d2:	2100      	movs	r1, #0
c0de46d4:	469b      	mov	fp, r3
c0de46d6:	9003      	str	r0, [sp, #12]
c0de46d8:	f88d 000b 	strb.w	r0, [sp, #11]
c0de46dc:	6810      	ldr	r0, [r2, #0]
c0de46de:	aa03      	add	r2, sp, #12
c0de46e0:	f008 faba 	bl	c0decc58 <cx_bn_cmp_u32>
c0de46e4:	bb38      	cbnz	r0, c0de4736 <tEdwards_scalarMul_bn+0x70>
c0de46e6:	9803      	ldr	r0, [sp, #12]
c0de46e8:	b1d0      	cbz	r0, c0de4720 <tEdwards_scalarMul_bn+0x5a>
c0de46ea:	6828      	ldr	r0, [r5, #0]
c0de46ec:	a901      	add	r1, sp, #4
c0de46ee:	f008 fa7d 	bl	c0decbec <cx_bn_nbytes>
c0de46f2:	bb00      	cbnz	r0, c0de4736 <tEdwards_scalarMul_bn+0x70>
c0de46f4:	2002      	movs	r0, #2
c0de46f6:	f04f 31ff 	mov.w	r1, #4294967295	@ 0xffffffff
c0de46fa:	f10d 040b 	add.w	r4, sp, #11
c0de46fe:	6538      	str	r0, [r7, #80]	@ 0x50
c0de4700:	9801      	ldr	r0, [sp, #4]
c0de4702:	eb01 06c0 	add.w	r6, r1, r0, lsl #3
c0de4706:	2000      	movs	r0, #0
c0de4708:	2801      	cmp	r0, #1
c0de470a:	d00f      	beq.n	c0de472c <tEdwards_scalarMul_bn+0x66>
c0de470c:	6828      	ldr	r0, [r5, #0]
c0de470e:	4631      	mov	r1, r6
c0de4710:	4622      	mov	r2, r4
c0de4712:	f008 faad 	bl	c0decc70 <cx_bn_tst_bit>
c0de4716:	b970      	cbnz	r0, c0de4736 <tEdwards_scalarMul_bn+0x70>
c0de4718:	f89d 000b 	ldrb.w	r0, [sp, #11]
c0de471c:	3e01      	subs	r6, #1
c0de471e:	e7f3      	b.n	c0de4708 <tEdwards_scalarMul_bn+0x42>
c0de4720:	4638      	mov	r0, r7
c0de4722:	4659      	mov	r1, fp
c0de4724:	f7ff fef8 	bl	c0de4518 <tEdwards_SetNeutral>
c0de4728:	b928      	cbnz	r0, c0de4736 <tEdwards_scalarMul_bn+0x70>
c0de472a:	e7de      	b.n	c0de46ea <tEdwards_scalarMul_bn+0x24>
c0de472c:	4640      	mov	r0, r8
c0de472e:	4659      	mov	r1, fp
c0de4730:	f7ff ff97 	bl	c0de4662 <tEdwards_copy>
c0de4734:	b110      	cbz	r0, c0de473c <tEdwards_scalarMul_bn+0x76>
c0de4736:	b004      	add	sp, #16
c0de4738:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de473c:	2001      	movs	r0, #1
c0de473e:	f10d 0a0b 	add.w	sl, sp, #11
c0de4742:	e9c7 0614 	strd	r0, r6, [r7, #80]	@ 0x50
c0de4746:	2e00      	cmp	r6, #0
c0de4748:	d420      	bmi.n	c0de478c <tEdwards_scalarMul_bn+0xc6>
c0de474a:	4638      	mov	r0, r7
c0de474c:	4659      	mov	r1, fp
c0de474e:	465a      	mov	r2, fp
c0de4750:	f7ff fc9b 	bl	c0de408a <tEdwards_double>
c0de4754:	2800      	cmp	r0, #0
c0de4756:	d1ee      	bne.n	c0de4736 <tEdwards_scalarMul_bn+0x70>
c0de4758:	6d38      	ldr	r0, [r7, #80]	@ 0x50
c0de475a:	4631      	mov	r1, r6
c0de475c:	4652      	mov	r2, sl
c0de475e:	0040      	lsls	r0, r0, #1
c0de4760:	6538      	str	r0, [r7, #80]	@ 0x50
c0de4762:	6828      	ldr	r0, [r5, #0]
c0de4764:	f008 fa84 	bl	c0decc70 <cx_bn_tst_bit>
c0de4768:	2800      	cmp	r0, #0
c0de476a:	d1e4      	bne.n	c0de4736 <tEdwards_scalarMul_bn+0x70>
c0de476c:	f89d 000b 	ldrb.w	r0, [sp, #11]
c0de4770:	b150      	cbz	r0, c0de4788 <tEdwards_scalarMul_bn+0xc2>
c0de4772:	4638      	mov	r0, r7
c0de4774:	4659      	mov	r1, fp
c0de4776:	4642      	mov	r2, r8
c0de4778:	465b      	mov	r3, fp
c0de477a:	f7ff fcf1 	bl	c0de4160 <tEdwards_add>
c0de477e:	2800      	cmp	r0, #0
c0de4780:	d1d9      	bne.n	c0de4736 <tEdwards_scalarMul_bn+0x70>
c0de4782:	6d38      	ldr	r0, [r7, #80]	@ 0x50
c0de4784:	3001      	adds	r0, #1
c0de4786:	6538      	str	r0, [r7, #80]	@ 0x50
c0de4788:	3e01      	subs	r6, #1
c0de478a:	e7dc      	b.n	c0de4746 <tEdwards_scalarMul_bn+0x80>
c0de478c:	2000      	movs	r0, #0
c0de478e:	e7d2      	b.n	c0de4736 <tEdwards_scalarMul_bn+0x70>

c0de4790 <tEdwards_scalarMul>:
c0de4790:	b5bc      	push	{r2, r3, r4, r5, r7, lr}
c0de4792:	460c      	mov	r4, r1
c0de4794:	6801      	ldr	r1, [r0, #0]
c0de4796:	4299      	cmp	r1, r3
c0de4798:	bf3c      	itt	cc
c0de479a:	f648 3099 	movwcc	r0, #35737	@ 0x8b99
c0de479e:	bdbc      	popcc	{r2, r3, r4, r5, r7, pc}
c0de47a0:	4605      	mov	r5, r0
c0de47a2:	20ca      	movs	r0, #202	@ 0xca
c0de47a4:	6528      	str	r0, [r5, #80]	@ 0x50
c0de47a6:	a801      	add	r0, sp, #4
c0de47a8:	f008 fa0a 	bl	c0decbc0 <cx_bn_alloc_init>
c0de47ac:	b100      	cbz	r0, c0de47b0 <tEdwards_scalarMul+0x20>
c0de47ae:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}
c0de47b0:	20b3      	movs	r0, #179	@ 0xb3
c0de47b2:	9b06      	ldr	r3, [sp, #24]
c0de47b4:	4621      	mov	r1, r4
c0de47b6:	6528      	str	r0, [r5, #80]	@ 0x50
c0de47b8:	aa01      	add	r2, sp, #4
c0de47ba:	4628      	mov	r0, r5
c0de47bc:	f7ff ff83 	bl	c0de46c6 <tEdwards_scalarMul_bn>
c0de47c0:	2800      	cmp	r0, #0
c0de47c2:	d1f4      	bne.n	c0de47ae <tEdwards_scalarMul+0x1e>
c0de47c4:	a801      	add	r0, sp, #4
c0de47c6:	f008 fa07 	bl	c0decbd8 <cx_bn_destroy>
c0de47ca:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}

c0de47cc <OUTLINED_FUNCTION_0>:
c0de47cc:	4633      	mov	r3, r6
c0de47ce:	f008 baa9 	b.w	c0decd24 <cx_mont_mul>

c0de47d2 <OUTLINED_FUNCTION_1>:
c0de47d2:	462b      	mov	r3, r5
c0de47d4:	f008 baa6 	b.w	c0decd24 <cx_mont_mul>

c0de47d8 <OUTLINED_FUNCTION_2>:
c0de47d8:	4633      	mov	r3, r6
c0de47da:	460a      	mov	r2, r1
c0de47dc:	f008 baa2 	b.w	c0decd24 <cx_mont_mul>

c0de47e0 <OUTLINED_FUNCTION_3>:
c0de47e0:	6828      	ldr	r0, [r5, #0]
c0de47e2:	463a      	mov	r2, r7
c0de47e4:	4601      	mov	r1, r0
c0de47e6:	f008 ba85 	b.w	c0deccf4 <cx_mont_to_montgomery>

c0de47ea <OUTLINED_FUNCTION_4>:
c0de47ea:	460d      	mov	r5, r1
c0de47ec:	6801      	ldr	r1, [r0, #0]
c0de47ee:	4604      	mov	r4, r0
c0de47f0:	4628      	mov	r0, r5
c0de47f2:	f008 b9db 	b.w	c0decbac <cx_bn_alloc>

c0de47f6 <OUTLINED_FUNCTION_5>:
c0de47f6:	6860      	ldr	r0, [r4, #4]
c0de47f8:	f008 ba02 	b.w	c0decc00 <cx_bn_copy>

c0de47fc <grain_lfsr_advance>:
c0de47fc:	b5b0      	push	{r4, r5, r7, lr}
c0de47fe:	68c2      	ldr	r2, [r0, #12]
c0de4800:	e890 001a 	ldmia.w	r0, {r1, r3, r4}
c0de4804:	ea5f 0552 	movs.w	r5, r2, lsr #1
c0de4808:	ea4f 0234 	mov.w	r2, r4, rrx
c0de480c:	07e4      	lsls	r4, r4, #31
c0de480e:	60c5      	str	r5, [r0, #12]
c0de4810:	07dd      	lsls	r5, r3, #31
c0de4812:	ea44 0453 	orr.w	r4, r4, r3, lsr #1
c0de4816:	ea45 0551 	orr.w	r5, r5, r1, lsr #1
c0de481a:	6044      	str	r4, [r0, #4]
c0de481c:	4c15      	ldr	r4, [pc, #84]	@ (c0de4874 <grain_lfsr_advance+0x78>)
c0de481e:	6005      	str	r5, [r0, #0]
c0de4820:	4021      	ands	r1, r4
c0de4822:	4c15      	ldr	r4, [pc, #84]	@ (c0de4878 <grain_lfsr_advance+0x7c>)
c0de4824:	4023      	ands	r3, r4
c0de4826:	4419      	add	r1, r3
c0de4828:	0c0c      	lsrs	r4, r1, #16
c0de482a:	ea44 4403 	orr.w	r4, r4, r3, lsl #16
c0de482e:	ea43 4313 	orr.w	r3, r3, r3, lsr #16
c0de4832:	4421      	add	r1, r4
c0de4834:	0a0c      	lsrs	r4, r1, #8
c0de4836:	ea44 6403 	orr.w	r4, r4, r3, lsl #24
c0de483a:	ea83 2313 	eor.w	r3, r3, r3, lsr #8
c0de483e:	4061      	eors	r1, r4
c0de4840:	090c      	lsrs	r4, r1, #4
c0de4842:	ea44 7403 	orr.w	r4, r4, r3, lsl #28
c0de4846:	ea83 1313 	eor.w	r3, r3, r3, lsr #4
c0de484a:	4061      	eors	r1, r4
c0de484c:	088c      	lsrs	r4, r1, #2
c0de484e:	ea44 7483 	orr.w	r4, r4, r3, lsl #30
c0de4852:	ea83 0393 	eor.w	r3, r3, r3, lsr #2
c0de4856:	4061      	eors	r1, r4
c0de4858:	ea5f 0353 	movs.w	r3, r3, lsr #1
c0de485c:	ea4f 0331 	mov.w	r3, r1, rrx
c0de4860:	4059      	eors	r1, r3
c0de4862:	f001 0101 	and.w	r1, r1, #1
c0de4866:	ea82 32c1 	eor.w	r2, r2, r1, lsl #15
c0de486a:	6082      	str	r2, [r0, #8]
c0de486c:	4608      	mov	r0, r1
c0de486e:	2100      	movs	r1, #0
c0de4870:	bdb0      	pop	{r4, r5, r7, pc}
c0de4872:	bf00      	nop
c0de4874:	00802001 	.word	0x00802001
c0de4878:	40080040 	.word	0x40080040

c0de487c <next64_graingen>:
c0de487c:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de4880:	460c      	mov	r4, r1
c0de4882:	4605      	mov	r5, r0
c0de4884:	f04f 0a00 	mov.w	sl, #0
c0de4888:	f04f 0800 	mov.w	r8, #0
c0de488c:	2700      	movs	r7, #0
c0de488e:	42a7      	cmp	r7, r4
c0de4890:	d215      	bcs.n	c0de48be <next64_graingen+0x42>
c0de4892:	4628      	mov	r0, r5
c0de4894:	f7ff ffb2 	bl	c0de47fc <grain_lfsr_advance>
c0de4898:	4606      	mov	r6, r0
c0de489a:	4628      	mov	r0, r5
c0de489c:	f7ff ffae 	bl	c0de47fc <grain_lfsr_advance>
c0de48a0:	eb10 0046 	adds.w	r0, r0, r6, lsl #1
c0de48a4:	0781      	lsls	r1, r0, #30
c0de48a6:	d5f2      	bpl.n	c0de488e <next64_graingen+0x12>
c0de48a8:	f000 0001 	and.w	r0, r0, #1
c0de48ac:	ea4f 0148 	mov.w	r1, r8, lsl #1
c0de48b0:	3701      	adds	r7, #1
c0de48b2:	ea40 004a 	orr.w	r0, r0, sl, lsl #1
c0de48b6:	ea41 78da 	orr.w	r8, r1, sl, lsr #31
c0de48ba:	4682      	mov	sl, r0
c0de48bc:	e7e7      	b.n	c0de488e <next64_graingen+0x12>
c0de48be:	4650      	mov	r0, sl
c0de48c0:	4641      	mov	r1, r8
c0de48c2:	e8bd 85f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}
	...

c0de48c8 <init_generator>:
c0de48c8:	b5b0      	push	{r4, r5, r7, lr}
c0de48ca:	4a09      	ldr	r2, [pc, #36]	@ (c0de48f0 <init_generator+0x28>)
c0de48cc:	4b09      	ldr	r3, [pc, #36]	@ (c0de48f4 <init_generator+0x2c>)
c0de48ce:	4604      	mov	r4, r0
c0de48d0:	25a0      	movs	r5, #160	@ 0xa0
c0de48d2:	2000      	movs	r0, #0
c0de48d4:	f64f 71ff 	movw	r1, #65535	@ 0xffff
c0de48d8:	e9c4 1002 	strd	r1, r0, [r4, #8]
c0de48dc:	e9c4 3200 	strd	r3, r2, [r4]
c0de48e0:	b125      	cbz	r5, c0de48ec <init_generator+0x24>
c0de48e2:	4620      	mov	r0, r4
c0de48e4:	f7ff ff8a 	bl	c0de47fc <grain_lfsr_advance>
c0de48e8:	3d01      	subs	r5, #1
c0de48ea:	e7f9      	b.n	c0de48e0 <init_generator+0x18>
c0de48ec:	bdb0      	pop	{r4, r5, r7, pc}
c0de48ee:	bf00      	nop
c0de48f0:	fffcf010 	.word	0xfffcf010
c0de48f4:	1801fc02 	.word	0x1801fc02

c0de48f8 <gen_integer>:
c0de48f8:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de48fc:	4f20      	ldr	r7, [pc, #128]	@ (c0de4980 <gen_integer+0x88>)
c0de48fe:	4e22      	ldr	r6, [pc, #136]	@ (c0de4988 <gen_integer+0x90>)
c0de4900:	4605      	mov	r5, r0
c0de4902:	460c      	mov	r4, r1
c0de4904:	2000      	movs	r0, #0
c0de4906:	46b8      	mov	r8, r7
c0de4908:	4f1e      	ldr	r7, [pc, #120]	@ (c0de4984 <gen_integer+0x8c>)
c0de490a:	447e      	add	r6, pc
c0de490c:	b9f8      	cbnz	r0, c0de494e <gen_integer+0x56>
c0de490e:	4628      	mov	r0, r5
c0de4910:	213e      	movs	r1, #62	@ 0x3e
c0de4912:	47b0      	blx	r6
c0de4914:	e9c4 0100 	strd	r0, r1, [r4]
c0de4918:	4628      	mov	r0, r5
c0de491a:	2140      	movs	r1, #64	@ 0x40
c0de491c:	47b0      	blx	r6
c0de491e:	e9c4 0102 	strd	r0, r1, [r4, #8]
c0de4922:	4628      	mov	r0, r5
c0de4924:	2140      	movs	r1, #64	@ 0x40
c0de4926:	47b0      	blx	r6
c0de4928:	e9c4 0104 	strd	r0, r1, [r4, #16]
c0de492c:	4628      	mov	r0, r5
c0de492e:	2140      	movs	r1, #64	@ 0x40
c0de4930:	47b0      	blx	r6
c0de4932:	e9c4 0106 	strd	r0, r1, [r4, #24]
c0de4936:	e9d4 0100 	ldrd	r0, r1, [r4]
c0de493a:	463a      	mov	r2, r7
c0de493c:	1bc0      	subs	r0, r0, r7
c0de493e:	4640      	mov	r0, r8
c0de4940:	eb71 0008 	sbcs.w	r0, r1, r8
c0de4944:	f04f 0000 	mov.w	r0, #0
c0de4948:	bf38      	it	cc
c0de494a:	2001      	movcc	r0, #1
c0de494c:	e7de      	b.n	c0de490c <gen_integer+0x14>
c0de494e:	e9d4 0100 	ldrd	r0, r1, [r4]
c0de4952:	4d0e      	ldr	r5, [pc, #56]	@ (c0de498c <gen_integer+0x94>)
c0de4954:	447d      	add	r5, pc
c0de4956:	47a8      	blx	r5
c0de4958:	e9c4 0100 	strd	r0, r1, [r4]
c0de495c:	e9d4 0102 	ldrd	r0, r1, [r4, #8]
c0de4960:	47a8      	blx	r5
c0de4962:	e9c4 0102 	strd	r0, r1, [r4, #8]
c0de4966:	e9d4 0104 	ldrd	r0, r1, [r4, #16]
c0de496a:	47a8      	blx	r5
c0de496c:	e9c4 0104 	strd	r0, r1, [r4, #16]
c0de4970:	e9d4 0106 	ldrd	r0, r1, [r4, #24]
c0de4974:	47a8      	blx	r5
c0de4976:	e9c4 0106 	strd	r0, r1, [r4, #24]
c0de497a:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de497e:	bf00      	nop
c0de4980:	305a4b4e 	.word	0x305a4b4e
c0de4984:	4f582122 	.word	0x4f582122
c0de4988:	ffffff6f 	.word	0xffffff6f
c0de498c:	00000039 	.word	0x00000039

c0de4990 <rev64>:
c0de4990:	ba0a      	rev	r2, r1
c0de4992:	ba01      	rev	r1, r0
c0de4994:	4610      	mov	r0, r2
c0de4996:	4770      	bx	lr

c0de4998 <Poseidon_getNext_RC>:
c0de4998:	3090      	adds	r0, #144	@ 0x90
c0de499a:	f7ff bfad 	b.w	c0de48f8 <gen_integer>

c0de499e <Poseidon_alloc_init>:
c0de499e:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de49a0:	4604      	mov	r4, r0
c0de49a2:	3090      	adds	r0, #144	@ 0x90
c0de49a4:	461d      	mov	r5, r3
c0de49a6:	4616      	mov	r6, r2
c0de49a8:	460f      	mov	r7, r1
c0de49aa:	f7ff ff8d 	bl	c0de48c8 <init_generator>
c0de49ae:	2000      	movs	r0, #0
c0de49b0:	e9c4 7503 	strd	r7, r5, [r4, #12]
c0de49b4:	4621      	mov	r1, r4
c0de49b6:	f8c4 00a0 	str.w	r0, [r4, #160]	@ 0xa0
c0de49ba:	1c70      	adds	r0, r6, #1
c0de49bc:	e9c4 6001 	strd	r6, r0, [r4, #4]
c0de49c0:	6828      	ldr	r0, [r5, #0]
c0de49c2:	f008 f913 	bl	c0decbec <cx_bn_nbytes>
c0de49c6:	68a0      	ldr	r0, [r4, #8]
c0de49c8:	f104 0514 	add.w	r5, r4, #20
c0de49cc:	f04f 36ff 	mov.w	r6, #4294967295	@ 0xffffffff
c0de49d0:	3601      	adds	r6, #1
c0de49d2:	4286      	cmp	r6, r0
c0de49d4:	bf28      	it	cs
c0de49d6:	bdf8      	popcs	{r3, r4, r5, r6, r7, pc}
c0de49d8:	6821      	ldr	r1, [r4, #0]
c0de49da:	4628      	mov	r0, r5
c0de49dc:	f008 f8e6 	bl	c0decbac <cx_bn_alloc>
c0de49e0:	68a0      	ldr	r0, [r4, #8]
c0de49e2:	3504      	adds	r5, #4
c0de49e4:	4286      	cmp	r6, r0
c0de49e6:	d2f3      	bcs.n	c0de49d0 <Poseidon_alloc_init+0x32>
c0de49e8:	e7fe      	b.n	c0de49e8 <Poseidon_alloc_init+0x4a>

c0de49ea <os_io_handle_default_apdu>:
c0de49ea:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de49ec:	b09d      	sub	sp, #116	@ 0x74
c0de49ee:	4615      	mov	r5, r2
c0de49f0:	9a22      	ldr	r2, [sp, #136]	@ 0x88
c0de49f2:	b3c8      	cbz	r0, c0de4a68 <os_io_handle_default_apdu+0x7e>
c0de49f4:	b3c1      	cbz	r1, c0de4a68 <os_io_handle_default_apdu+0x7e>
c0de49f6:	b3bd      	cbz	r5, c0de4a68 <os_io_handle_default_apdu+0x7e>
c0de49f8:	461c      	mov	r4, r3
c0de49fa:	b3ab      	cbz	r3, c0de4a68 <os_io_handle_default_apdu+0x7e>
c0de49fc:	b10a      	cbz	r2, c0de4a02 <os_io_handle_default_apdu+0x18>
c0de49fe:	2100      	movs	r1, #0
c0de4a00:	7011      	strb	r1, [r2, #0]
c0de4a02:	7801      	ldrb	r1, [r0, #0]
c0de4a04:	29b0      	cmp	r1, #176	@ 0xb0
c0de4a06:	d131      	bne.n	c0de4a6c <os_io_handle_default_apdu+0x82>
c0de4a08:	7841      	ldrb	r1, [r0, #1]
c0de4a0a:	29a7      	cmp	r1, #167	@ 0xa7
c0de4a0c:	d031      	beq.n	c0de4a72 <os_io_handle_default_apdu+0x88>
c0de4a0e:	2906      	cmp	r1, #6
c0de4a10:	d036      	beq.n	c0de4a80 <os_io_handle_default_apdu+0x96>
c0de4a12:	2901      	cmp	r1, #1
c0de4a14:	d131      	bne.n	c0de4a7a <os_io_handle_default_apdu+0x90>
c0de4a16:	7881      	ldrb	r1, [r0, #2]
c0de4a18:	bb79      	cbnz	r1, c0de4a7a <os_io_handle_default_apdu+0x90>
c0de4a1a:	78c0      	ldrb	r0, [r0, #3]
c0de4a1c:	bb68      	cbnz	r0, c0de4a7a <os_io_handle_default_apdu+0x90>
c0de4a1e:	6820      	ldr	r0, [r4, #0]
c0de4a20:	2100      	movs	r1, #0
c0de4a22:	6021      	str	r1, [r4, #0]
c0de4a24:	2803      	cmp	r0, #3
c0de4a26:	d321      	bcc.n	c0de4a6c <os_io_handle_default_apdu+0x82>
c0de4a28:	2601      	movs	r6, #1
c0de4a2a:	1ec7      	subs	r7, r0, #3
c0de4a2c:	6026      	str	r6, [r4, #0]
c0de4a2e:	702e      	strb	r6, [r5, #0]
c0de4a30:	6820      	ldr	r0, [r4, #0]
c0de4a32:	1a3a      	subs	r2, r7, r0
c0de4a34:	4428      	add	r0, r5
c0de4a36:	1c41      	adds	r1, r0, #1
c0de4a38:	2001      	movs	r0, #1
c0de4a3a:	f008 f9e9 	bl	c0dece10 <os_registry_get_current_app_tag>
c0de4a3e:	f000 f83f 	bl	c0de4ac0 <OUTLINED_FUNCTION_0>
c0de4a42:	6020      	str	r0, [r4, #0]
c0de4a44:	1a3a      	subs	r2, r7, r0
c0de4a46:	4428      	add	r0, r5
c0de4a48:	1c41      	adds	r1, r0, #1
c0de4a4a:	2002      	movs	r0, #2
c0de4a4c:	f008 f9e0 	bl	c0dece10 <os_registry_get_current_app_tag>
c0de4a50:	f000 f836 	bl	c0de4ac0 <OUTLINED_FUNCTION_0>
c0de4a54:	1c41      	adds	r1, r0, #1
c0de4a56:	6021      	str	r1, [r4, #0]
c0de4a58:	542e      	strb	r6, [r5, r0]
c0de4a5a:	f008 f9c5 	bl	c0decde8 <os_flags>
c0de4a5e:	6821      	ldr	r1, [r4, #0]
c0de4a60:	1c4a      	adds	r2, r1, #1
c0de4a62:	6022      	str	r2, [r4, #0]
c0de4a64:	5468      	strb	r0, [r5, r1]
c0de4a66:	e028      	b.n	c0de4aba <os_io_handle_default_apdu+0xd0>
c0de4a68:	7814      	ldrb	r4, [r2, #0]
c0de4a6a:	e01e      	b.n	c0de4aaa <os_io_handle_default_apdu+0xc0>
c0de4a6c:	f646 1485 	movw	r4, #27013	@ 0x6985
c0de4a70:	e01b      	b.n	c0de4aaa <os_io_handle_default_apdu+0xc0>
c0de4a72:	7881      	ldrb	r1, [r0, #2]
c0de4a74:	b909      	cbnz	r1, c0de4a7a <os_io_handle_default_apdu+0x90>
c0de4a76:	78c0      	ldrb	r0, [r0, #3]
c0de4a78:	b1d0      	cbz	r0, c0de4ab0 <os_io_handle_default_apdu+0xc6>
c0de4a7a:	f44f 44dc 	mov.w	r4, #28160	@ 0x6e00
c0de4a7e:	e014      	b.n	c0de4aaa <os_io_handle_default_apdu+0xc0>
c0de4a80:	2100      	movs	r1, #0
c0de4a82:	6021      	str	r1, [r4, #0]
c0de4a84:	7883      	ldrb	r3, [r0, #2]
c0de4a86:	7902      	ldrb	r2, [r0, #4]
c0de4a88:	ad02      	add	r5, sp, #8
c0de4a8a:	e9cd 1500 	strd	r1, r5, [sp]
c0de4a8e:	1d41      	adds	r1, r0, #5
c0de4a90:	4618      	mov	r0, r3
c0de4a92:	2300      	movs	r3, #0
c0de4a94:	f008 f97c 	bl	c0decd90 <os_pki_load_certificate>
c0de4a98:	4604      	mov	r4, r0
c0de4a9a:	4628      	mov	r0, r5
c0de4a9c:	216c      	movs	r1, #108	@ 0x6c
c0de4a9e:	f008 fb45 	bl	c0ded12c <explicit_bzero>
c0de4aa2:	2c00      	cmp	r4, #0
c0de4aa4:	bf08      	it	eq
c0de4aa6:	f44f 4410 	moveq.w	r4, #36864	@ 0x9000
c0de4aaa:	4620      	mov	r0, r4
c0de4aac:	b01d      	add	sp, #116	@ 0x74
c0de4aae:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de4ab0:	2000      	movs	r0, #0
c0de4ab2:	6020      	str	r0, [r4, #0]
c0de4ab4:	b10a      	cbz	r2, c0de4aba <os_io_handle_default_apdu+0xd0>
c0de4ab6:	2001      	movs	r0, #1
c0de4ab8:	7010      	strb	r0, [r2, #0]
c0de4aba:	f44f 4410 	mov.w	r4, #36864	@ 0x9000
c0de4abe:	e7f4      	b.n	c0de4aaa <os_io_handle_default_apdu+0xc0>

c0de4ac0 <OUTLINED_FUNCTION_0>:
c0de4ac0:	6821      	ldr	r1, [r4, #0]
c0de4ac2:	1c4a      	adds	r2, r1, #1
c0de4ac4:	6022      	str	r2, [r4, #0]
c0de4ac6:	5468      	strb	r0, [r5, r1]
c0de4ac8:	6821      	ldr	r1, [r4, #0]
c0de4aca:	4408      	add	r0, r1
c0de4acc:	4770      	bx	lr

c0de4ace <os_io_seph_cmd_piezo_play_tune>:
c0de4ace:	b5bc      	push	{r2, r3, r4, r5, r7, lr}
c0de4ad0:	280b      	cmp	r0, #11
c0de4ad2:	d902      	bls.n	c0de4ada <os_io_seph_cmd_piezo_play_tune+0xc>
c0de4ad4:	f06f 0415 	mvn.w	r4, #21
c0de4ad8:	e021      	b.n	c0de4b1e <os_io_seph_cmd_piezo_play_tune+0x50>
c0de4ada:	4605      	mov	r5, r0
c0de4adc:	2009      	movs	r0, #9
c0de4ade:	2100      	movs	r1, #0
c0de4ae0:	2200      	movs	r2, #0
c0de4ae2:	2400      	movs	r4, #0
c0de4ae4:	f008 f988 	bl	c0decdf8 <os_setting_get>
c0de4ae8:	2d08      	cmp	r5, #8
c0de4aea:	d802      	bhi.n	c0de4af2 <os_io_seph_cmd_piezo_play_tune+0x24>
c0de4aec:	f010 0102 	ands.w	r1, r0, #2
c0de4af0:	d115      	bne.n	c0de4b1e <os_io_seph_cmd_piezo_play_tune+0x50>
c0de4af2:	2400      	movs	r4, #0
c0de4af4:	2d09      	cmp	r5, #9
c0de4af6:	d302      	bcc.n	c0de4afe <os_io_seph_cmd_piezo_play_tune+0x30>
c0de4af8:	f010 0001 	ands.w	r0, r0, #1
c0de4afc:	d10f      	bne.n	c0de4b1e <os_io_seph_cmd_piezo_play_tune+0x50>
c0de4afe:	2056      	movs	r0, #86	@ 0x56
c0de4b00:	f88d 5007 	strb.w	r5, [sp, #7]
c0de4b04:	f88d 4005 	strb.w	r4, [sp, #5]
c0de4b08:	2204      	movs	r2, #4
c0de4b0a:	2300      	movs	r3, #0
c0de4b0c:	f88d 0004 	strb.w	r0, [sp, #4]
c0de4b10:	2001      	movs	r0, #1
c0de4b12:	f88d 0006 	strb.w	r0, [sp, #6]
c0de4b16:	a901      	add	r1, sp, #4
c0de4b18:	f000 f803 	bl	c0de4b22 <OUTLINED_FUNCTION_1>
c0de4b1c:	4604      	mov	r4, r0
c0de4b1e:	4620      	mov	r0, r4
c0de4b20:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}

c0de4b22 <OUTLINED_FUNCTION_1>:
c0de4b22:	2001      	movs	r0, #1
c0de4b24:	f008 b99e 	b.w	c0dece64 <os_io_tx_cmd>

c0de4b28 <io_process_itc_ux_event>:
c0de4b28:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de4b2a:	4605      	mov	r5, r0
c0de4b2c:	78c0      	ldrb	r0, [r0, #3]
c0de4b2e:	2820      	cmp	r0, #32
c0de4b30:	d023      	beq.n	c0de4b7a <io_process_itc_ux_event+0x52>
c0de4b32:	2823      	cmp	r0, #35	@ 0x23
c0de4b34:	d029      	beq.n	c0de4b8a <io_process_itc_ux_event+0x62>
c0de4b36:	460c      	mov	r4, r1
c0de4b38:	2822      	cmp	r0, #34	@ 0x22
c0de4b3a:	d132      	bne.n	c0de4ba2 <io_process_itc_ux_event+0x7a>
c0de4b3c:	4e1f      	ldr	r6, [pc, #124]	@ (c0de4bbc <io_process_itc_ux_event+0x94>)
c0de4b3e:	2006      	movs	r0, #6
c0de4b40:	2118      	movs	r1, #24
c0de4b42:	f809 0006 	strb.w	r0, [r9, r6]
c0de4b46:	eb09 0706 	add.w	r7, r9, r6
c0de4b4a:	2018      	movs	r0, #24
c0de4b4c:	6078      	str	r0, [r7, #4]
c0de4b4e:	f107 0008 	add.w	r0, r7, #8
c0de4b52:	f008 fadd 	bl	c0ded110 <__aeabi_memclr>
c0de4b56:	7928      	ldrb	r0, [r5, #4]
c0de4b58:	7238      	strb	r0, [r7, #8]
c0de4b5a:	7868      	ldrb	r0, [r5, #1]
c0de4b5c:	78a9      	ldrb	r1, [r5, #2]
c0de4b5e:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de4b62:	3802      	subs	r0, #2
c0de4b64:	0401      	lsls	r1, r0, #16
c0de4b66:	d005      	beq.n	c0de4b74 <io_process_itc_ux_event+0x4c>
c0de4b68:	b282      	uxth	r2, r0
c0de4b6a:	2a10      	cmp	r2, #16
c0de4b6c:	d802      	bhi.n	c0de4b74 <io_process_itc_ux_event+0x4c>
c0de4b6e:	1f60      	subs	r0, r4, #5
c0de4b70:	4290      	cmp	r0, r2
c0de4b72:	d218      	bcs.n	c0de4ba6 <io_process_itc_ux_event+0x7e>
c0de4b74:	f06f 0415 	mvn.w	r4, #21
c0de4b78:	e013      	b.n	c0de4ba2 <io_process_itc_ux_event+0x7a>
c0de4b7a:	2001      	movs	r0, #1
c0de4b7c:	f007 fdbc 	bl	c0dec6f8 <nbgl_objAllowDrawing>
c0de4b80:	f007 fdc9 	bl	c0dec716 <nbgl_screenRedraw>
c0de4b84:	f007 fd9f 	bl	c0dec6c6 <nbgl_refresh>
c0de4b88:	e00a      	b.n	c0de4ba0 <io_process_itc_ux_event+0x78>
c0de4b8a:	480c      	ldr	r0, [pc, #48]	@ (c0de4bbc <io_process_itc_ux_event+0x94>)
c0de4b8c:	2107      	movs	r1, #7
c0de4b8e:	f809 1000 	strb.w	r1, [r9, r0]
c0de4b92:	4448      	add	r0, r9
c0de4b94:	2101      	movs	r1, #1
c0de4b96:	6041      	str	r1, [r0, #4]
c0de4b98:	7929      	ldrb	r1, [r5, #4]
c0de4b9a:	7201      	strb	r1, [r0, #8]
c0de4b9c:	f008 f91a 	bl	c0decdd4 <os_ux>
c0de4ba0:	2400      	movs	r4, #0
c0de4ba2:	4620      	mov	r0, r4
c0de4ba4:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0de4ba6:	eb09 0406 	add.w	r4, r9, r6
c0de4baa:	1d69      	adds	r1, r5, #5
c0de4bac:	f104 0010 	add.w	r0, r4, #16
c0de4bb0:	60e2      	str	r2, [r4, #12]
c0de4bb2:	f008 faa3 	bl	c0ded0fc <__aeabi_memcpy>
c0de4bb6:	4620      	mov	r0, r4
c0de4bb8:	e7f0      	b.n	c0de4b9c <io_process_itc_ux_event+0x74>
c0de4bba:	bf00      	nop
c0de4bbc:	00001da0 	.word	0x00001da0

c0de4bc0 <io_legacy_apdu_tx>:
c0de4bc0:	b5b0      	push	{r4, r5, r7, lr}
c0de4bc2:	460a      	mov	r2, r1
c0de4bc4:	4601      	mov	r1, r0
c0de4bc6:	4808      	ldr	r0, [pc, #32]	@ (c0de4be8 <io_legacy_apdu_tx+0x28>)
c0de4bc8:	2300      	movs	r3, #0
c0de4bca:	2500      	movs	r5, #0
c0de4bcc:	eb09 0400 	add.w	r4, r9, r0
c0de4bd0:	7860      	ldrb	r0, [r4, #1]
c0de4bd2:	f008 f947 	bl	c0dece64 <os_io_tx_cmd>
c0de4bd6:	4905      	ldr	r1, [pc, #20]	@ (c0de4bec <io_legacy_apdu_tx+0x2c>)
c0de4bd8:	7065      	strb	r5, [r4, #1]
c0de4bda:	f809 5001 	strb.w	r5, [r9, r1]
c0de4bde:	4904      	ldr	r1, [pc, #16]	@ (c0de4bf0 <io_legacy_apdu_tx+0x30>)
c0de4be0:	4449      	add	r1, r9
c0de4be2:	718d      	strb	r5, [r1, #6]
c0de4be4:	bdb0      	pop	{r4, r5, r7, pc}
c0de4be6:	bf00      	nop
c0de4be8:	000016c8 	.word	0x000016c8
c0de4bec:	00001dc0 	.word	0x00001dc0
c0de4bf0:	000016bc 	.word	0x000016bc

c0de4bf4 <io_legacy_apdu_rx>:
c0de4bf4:	e92d 41ff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
c0de4bf8:	4e8c      	ldr	r6, [pc, #560]	@ (c0de4e2c <io_legacy_apdu_rx+0x238>)
c0de4bfa:	2100      	movs	r1, #0
c0de4bfc:	4605      	mov	r5, r0
c0de4bfe:	2200      	movs	r2, #0
c0de4c00:	2301      	movs	r3, #1
c0de4c02:	f88d 100f 	strb.w	r1, [sp, #15]
c0de4c06:	f240 1111 	movw	r1, #273	@ 0x111
c0de4c0a:	eb09 0006 	add.w	r0, r9, r6
c0de4c0e:	f008 f935 	bl	c0dece7c <os_io_rx_evt>
c0de4c12:	4604      	mov	r4, r0
c0de4c14:	2801      	cmp	r0, #1
c0de4c16:	f2c0 8100 	blt.w	c0de4e1a <io_legacy_apdu_rx+0x226>
c0de4c1a:	f819 0006 	ldrb.w	r0, [r9, r6]
c0de4c1e:	f1a0 0110 	sub.w	r1, r0, #16
c0de4c22:	2916      	cmp	r1, #22
c0de4c24:	d844      	bhi.n	c0de4cb0 <io_legacy_apdu_rx+0xbc>
c0de4c26:	2201      	movs	r2, #1
c0de4c28:	fa02 f101 	lsl.w	r1, r2, r1
c0de4c2c:	4a80      	ldr	r2, [pc, #512]	@ (c0de4e30 <io_legacy_apdu_rx+0x23c>)
c0de4c2e:	4211      	tst	r1, r2
c0de4c30:	d03e      	beq.n	c0de4cb0 <io_legacy_apdu_rx+0xbc>
c0de4c32:	4f80      	ldr	r7, [pc, #512]	@ (c0de4e34 <io_legacy_apdu_rx+0x240>)
c0de4c34:	eb09 0107 	add.w	r1, r9, r7
c0de4c38:	7048      	strb	r0, [r1, #1]
c0de4c3a:	f008 f8b9 	bl	c0decdb0 <os_perso_is_pin_set>
c0de4c3e:	28aa      	cmp	r0, #170	@ 0xaa
c0de4c40:	d103      	bne.n	c0de4c4a <io_legacy_apdu_rx+0x56>
c0de4c42:	f008 f8be 	bl	c0decdc2 <os_global_pin_is_validated>
c0de4c46:	28aa      	cmp	r0, #170	@ 0xaa
c0de4c48:	d161      	bne.n	c0de4d0e <io_legacy_apdu_rx+0x11a>
c0de4c4a:	eb09 0006 	add.w	r0, r9, r6
c0de4c4e:	7840      	ldrb	r0, [r0, #1]
c0de4c50:	28b0      	cmp	r0, #176	@ 0xb0
c0de4c52:	d135      	bne.n	c0de4cc0 <io_legacy_apdu_rx+0xcc>
c0de4c54:	f240 1011 	movw	r0, #273	@ 0x111
c0de4c58:	1e61      	subs	r1, r4, #1
c0de4c5a:	9002      	str	r0, [sp, #8]
c0de4c5c:	f10d 000f 	add.w	r0, sp, #15
c0de4c60:	9000      	str	r0, [sp, #0]
c0de4c62:	4875      	ldr	r0, [pc, #468]	@ (c0de4e38 <io_legacy_apdu_rx+0x244>)
c0de4c64:	ab02      	add	r3, sp, #8
c0de4c66:	eb09 0500 	add.w	r5, r9, r0
c0de4c6a:	eb09 0006 	add.w	r0, r9, r6
c0de4c6e:	3001      	adds	r0, #1
c0de4c70:	462a      	mov	r2, r5
c0de4c72:	f7ff feba 	bl	c0de49ea <os_io_handle_default_apdu>
c0de4c76:	2400      	movs	r4, #0
c0de4c78:	9902      	ldr	r1, [sp, #8]
c0de4c7a:	eb09 0607 	add.w	r6, r9, r7
c0de4c7e:	f5b0 4f10 	cmp.w	r0, #36864	@ 0x9000
c0de4c82:	bf18      	it	ne
c0de4c84:	4621      	movne	r1, r4
c0de4c86:	0a02      	lsrs	r2, r0, #8
c0de4c88:	2300      	movs	r3, #0
c0de4c8a:	546a      	strb	r2, [r5, r1]
c0de4c8c:	186a      	adds	r2, r5, r1
c0de4c8e:	7050      	strb	r0, [r2, #1]
c0de4c90:	1c88      	adds	r0, r1, #2
c0de4c92:	4629      	mov	r1, r5
c0de4c94:	9002      	str	r0, [sp, #8]
c0de4c96:	b282      	uxth	r2, r0
c0de4c98:	7870      	ldrb	r0, [r6, #1]
c0de4c9a:	f008 f8e3 	bl	c0dece64 <os_io_tx_cmd>
c0de4c9e:	f89d 100f 	ldrb.w	r1, [sp, #15]
c0de4ca2:	7074      	strb	r4, [r6, #1]
c0de4ca4:	2901      	cmp	r1, #1
c0de4ca6:	f000 80bd 	beq.w	c0de4e24 <io_legacy_apdu_rx+0x230>
c0de4caa:	ea00 75e0 	and.w	r5, r0, r0, asr #31
c0de4cae:	e0b5      	b.n	c0de4e1c <io_legacy_apdu_rx+0x228>
c0de4cb0:	1e41      	subs	r1, r0, #1
c0de4cb2:	2902      	cmp	r1, #2
c0de4cb4:	d33d      	bcc.n	c0de4d32 <io_legacy_apdu_rx+0x13e>
c0de4cb6:	2830      	cmp	r0, #48	@ 0x30
c0de4cb8:	d0bb      	beq.n	c0de4c32 <io_legacy_apdu_rx+0x3e>
c0de4cba:	2840      	cmp	r0, #64	@ 0x40
c0de4cbc:	d0b9      	beq.n	c0de4c32 <io_legacy_apdu_rx+0x3e>
c0de4cbe:	e0a3      	b.n	c0de4e08 <io_legacy_apdu_rx+0x214>
c0de4cc0:	eb09 0007 	add.w	r0, r9, r7
c0de4cc4:	7847      	ldrb	r7, [r0, #1]
c0de4cc6:	2f10      	cmp	r7, #16
c0de4cc8:	d05f      	beq.n	c0de4d8a <io_legacy_apdu_rx+0x196>
c0de4cca:	2f40      	cmp	r7, #64	@ 0x40
c0de4ccc:	d05f      	beq.n	c0de4d8e <io_legacy_apdu_rx+0x19a>
c0de4cce:	2f21      	cmp	r7, #33	@ 0x21
c0de4cd0:	d06f      	beq.n	c0de4db2 <io_legacy_apdu_rx+0x1be>
c0de4cd2:	2f22      	cmp	r7, #34	@ 0x22
c0de4cd4:	d048      	beq.n	c0de4d68 <io_legacy_apdu_rx+0x174>
c0de4cd6:	2f23      	cmp	r7, #35	@ 0x23
c0de4cd8:	d048      	beq.n	c0de4d6c <io_legacy_apdu_rx+0x178>
c0de4cda:	2f30      	cmp	r7, #48	@ 0x30
c0de4cdc:	d053      	beq.n	c0de4d86 <io_legacy_apdu_rx+0x192>
c0de4cde:	f8df 815c 	ldr.w	r8, [pc, #348]	@ c0de4e3c <io_legacy_apdu_rx+0x248>
c0de4ce2:	2f20      	cmp	r7, #32
c0de4ce4:	eb09 0008 	add.w	r0, r9, r8
c0de4ce8:	d16d      	bne.n	c0de4dc6 <io_legacy_apdu_rx+0x1d2>
c0de4cea:	2701      	movs	r7, #1
c0de4cec:	eb09 0106 	add.w	r1, r9, r6
c0de4cf0:	1e65      	subs	r5, r4, #1
c0de4cf2:	7187      	strb	r7, [r0, #6]
c0de4cf4:	4850      	ldr	r0, [pc, #320]	@ (c0de4e38 <io_legacy_apdu_rx+0x244>)
c0de4cf6:	3101      	adds	r1, #1
c0de4cf8:	462a      	mov	r2, r5
c0de4cfa:	4448      	add	r0, r9
c0de4cfc:	f008 f9fe 	bl	c0ded0fc <__aeabi_memcpy>
c0de4d00:	484f      	ldr	r0, [pc, #316]	@ (c0de4e40 <io_legacy_apdu_rx+0x24c>)
c0de4d02:	f809 7000 	strb.w	r7, [r9, r0]
c0de4d06:	2008      	movs	r0, #8
c0de4d08:	f809 0008 	strb.w	r0, [r9, r8]
c0de4d0c:	e086      	b.n	c0de4e1c <io_legacy_apdu_rx+0x228>
c0de4d0e:	484a      	ldr	r0, [pc, #296]	@ (c0de4e38 <io_legacy_apdu_rx+0x244>)
c0de4d10:	2155      	movs	r1, #85	@ 0x55
c0de4d12:	2202      	movs	r2, #2
c0de4d14:	2300      	movs	r3, #0
c0de4d16:	f809 1000 	strb.w	r1, [r9, r0]
c0de4d1a:	eb09 0100 	add.w	r1, r9, r0
c0de4d1e:	2015      	movs	r0, #21
c0de4d20:	7048      	strb	r0, [r1, #1]
c0de4d22:	eb09 0007 	add.w	r0, r9, r7
c0de4d26:	7840      	ldrb	r0, [r0, #1]
c0de4d28:	b004      	add	sp, #16
c0de4d2a:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de4d2e:	f008 b899 	b.w	c0dece64 <os_io_tx_cmd>
c0de4d32:	4f44      	ldr	r7, [pc, #272]	@ (c0de4e44 <io_legacy_apdu_rx+0x250>)
c0de4d34:	444e      	add	r6, r9
c0de4d36:	3c01      	subs	r4, #1
c0de4d38:	1c71      	adds	r1, r6, #1
c0de4d3a:	4622      	mov	r2, r4
c0de4d3c:	eb09 0007 	add.w	r0, r9, r7
c0de4d40:	f008 f9dc 	bl	c0ded0fc <__aeabi_memcpy>
c0de4d44:	7870      	ldrb	r0, [r6, #1]
c0de4d46:	281a      	cmp	r0, #26
c0de4d48:	d107      	bne.n	c0de4d5a <io_legacy_apdu_rx+0x166>
c0de4d4a:	eb09 0007 	add.w	r0, r9, r7
c0de4d4e:	4621      	mov	r1, r4
c0de4d50:	b004      	add	sp, #16
c0de4d52:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de4d56:	f7ff bee7 	b.w	c0de4b28 <io_process_itc_ux_event>
c0de4d5a:	2d00      	cmp	r5, #0
c0de4d5c:	d04a      	beq.n	c0de4df4 <io_legacy_apdu_rx+0x200>
c0de4d5e:	2000      	movs	r0, #0
c0de4d60:	2500      	movs	r5, #0
c0de4d62:	f007 fa83 	bl	c0dec26c <io_event>
c0de4d66:	e059      	b.n	c0de4e1c <io_legacy_apdu_rx+0x228>
c0de4d68:	2004      	movs	r0, #4
c0de4d6a:	e023      	b.n	c0de4db4 <io_legacy_apdu_rx+0x1c0>
c0de4d6c:	4f33      	ldr	r7, [pc, #204]	@ (c0de4e3c <io_legacy_apdu_rx+0x248>)
c0de4d6e:	2107      	movs	r1, #7
c0de4d70:	1e65      	subs	r5, r4, #1
c0de4d72:	462a      	mov	r2, r5
c0de4d74:	eb09 0007 	add.w	r0, r9, r7
c0de4d78:	7181      	strb	r1, [r0, #6]
c0de4d7a:	482f      	ldr	r0, [pc, #188]	@ (c0de4e38 <io_legacy_apdu_rx+0x244>)
c0de4d7c:	f000 f886 	bl	c0de4e8c <OUTLINED_FUNCTION_0>
c0de4d80:	482f      	ldr	r0, [pc, #188]	@ (c0de4e40 <io_legacy_apdu_rx+0x24c>)
c0de4d82:	2101      	movs	r1, #1
c0de4d84:	e00f      	b.n	c0de4da6 <io_legacy_apdu_rx+0x1b2>
c0de4d86:	2002      	movs	r0, #2
c0de4d88:	e014      	b.n	c0de4db4 <io_legacy_apdu_rx+0x1c0>
c0de4d8a:	2006      	movs	r0, #6
c0de4d8c:	e012      	b.n	c0de4db4 <io_legacy_apdu_rx+0x1c0>
c0de4d8e:	4f2b      	ldr	r7, [pc, #172]	@ (c0de4e3c <io_legacy_apdu_rx+0x248>)
c0de4d90:	2103      	movs	r1, #3
c0de4d92:	1e65      	subs	r5, r4, #1
c0de4d94:	462a      	mov	r2, r5
c0de4d96:	eb09 0007 	add.w	r0, r9, r7
c0de4d9a:	7181      	strb	r1, [r0, #6]
c0de4d9c:	4826      	ldr	r0, [pc, #152]	@ (c0de4e38 <io_legacy_apdu_rx+0x244>)
c0de4d9e:	f000 f875 	bl	c0de4e8c <OUTLINED_FUNCTION_0>
c0de4da2:	4827      	ldr	r0, [pc, #156]	@ (c0de4e40 <io_legacy_apdu_rx+0x24c>)
c0de4da4:	2102      	movs	r1, #2
c0de4da6:	f809 1000 	strb.w	r1, [r9, r0]
c0de4daa:	200a      	movs	r0, #10
c0de4dac:	f809 0007 	strb.w	r0, [r9, r7]
c0de4db0:	e034      	b.n	c0de4e1c <io_legacy_apdu_rx+0x228>
c0de4db2:	2005      	movs	r0, #5
c0de4db4:	4921      	ldr	r1, [pc, #132]	@ (c0de4e3c <io_legacy_apdu_rx+0x248>)
c0de4db6:	1e65      	subs	r5, r4, #1
c0de4db8:	462a      	mov	r2, r5
c0de4dba:	4449      	add	r1, r9
c0de4dbc:	7188      	strb	r0, [r1, #6]
c0de4dbe:	481e      	ldr	r0, [pc, #120]	@ (c0de4e38 <io_legacy_apdu_rx+0x244>)
c0de4dc0:	f000 f864 	bl	c0de4e8c <OUTLINED_FUNCTION_0>
c0de4dc4:	e02a      	b.n	c0de4e1c <io_legacy_apdu_rx+0x228>
c0de4dc6:	2100      	movs	r1, #0
c0de4dc8:	1e65      	subs	r5, r4, #1
c0de4dca:	7181      	strb	r1, [r0, #6]
c0de4dcc:	481a      	ldr	r0, [pc, #104]	@ (c0de4e38 <io_legacy_apdu_rx+0x244>)
c0de4dce:	eb09 0106 	add.w	r1, r9, r6
c0de4dd2:	462a      	mov	r2, r5
c0de4dd4:	3101      	adds	r1, #1
c0de4dd6:	4448      	add	r0, r9
c0de4dd8:	f008 f990 	bl	c0ded0fc <__aeabi_memcpy>
c0de4ddc:	2f25      	cmp	r7, #37	@ 0x25
c0de4dde:	d015      	beq.n	c0de4e0c <io_legacy_apdu_rx+0x218>
c0de4de0:	2f24      	cmp	r7, #36	@ 0x24
c0de4de2:	d11b      	bne.n	c0de4e1c <io_legacy_apdu_rx+0x228>
c0de4de4:	200b      	movs	r0, #11
c0de4de6:	2101      	movs	r1, #1
c0de4de8:	f809 0008 	strb.w	r0, [r9, r8]
c0de4dec:	4814      	ldr	r0, [pc, #80]	@ (c0de4e40 <io_legacy_apdu_rx+0x24c>)
c0de4dee:	f809 1000 	strb.w	r1, [r9, r0]
c0de4df2:	e013      	b.n	c0de4e1c <io_legacy_apdu_rx+0x228>
c0de4df4:	f819 0007 	ldrb.w	r0, [r9, r7]
c0de4df8:	2815      	cmp	r0, #21
c0de4dfa:	d8b0      	bhi.n	c0de4d5e <io_legacy_apdu_rx+0x16a>
c0de4dfc:	2101      	movs	r1, #1
c0de4dfe:	fa01 f000 	lsl.w	r0, r1, r0
c0de4e02:	4911      	ldr	r1, [pc, #68]	@ (c0de4e48 <io_legacy_apdu_rx+0x254>)
c0de4e04:	4208      	tst	r0, r1
c0de4e06:	d0aa      	beq.n	c0de4d5e <io_legacy_apdu_rx+0x16a>
c0de4e08:	2500      	movs	r5, #0
c0de4e0a:	e007      	b.n	c0de4e1c <io_legacy_apdu_rx+0x228>
c0de4e0c:	200c      	movs	r0, #12
c0de4e0e:	2101      	movs	r1, #1
c0de4e10:	f809 0008 	strb.w	r0, [r9, r8]
c0de4e14:	480a      	ldr	r0, [pc, #40]	@ (c0de4e40 <io_legacy_apdu_rx+0x24c>)
c0de4e16:	f809 1000 	strb.w	r1, [r9, r0]
c0de4e1a:	4625      	mov	r5, r4
c0de4e1c:	4628      	mov	r0, r5
c0de4e1e:	b004      	add	sp, #16
c0de4e20:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de4e24:	20ff      	movs	r0, #255	@ 0xff
c0de4e26:	f007 ffff 	bl	c0dece28 <os_sched_exit>
c0de4e2a:	bf00      	nop
c0de4e2c:	000015a8 	.word	0x000015a8
c0de4e30:	007f0001 	.word	0x007f0001
c0de4e34:	000016c8 	.word	0x000016c8
c0de4e38:	00001497 	.word	0x00001497
c0de4e3c:	000016bc 	.word	0x000016bc
c0de4e40:	00001dc0 	.word	0x00001dc0
c0de4e44:	00001c8c 	.word	0x00001c8c
c0de4e48:	00205020 	.word	0x00205020

c0de4e4c <io_seproxyhal_init>:
c0de4e4c:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de4e4e:	b089      	sub	sp, #36	@ 0x24
c0de4e50:	4d0c      	ldr	r5, [pc, #48]	@ (c0de4e84 <io_seproxyhal_init+0x38>)
c0de4e52:	2600      	movs	r6, #0
c0de4e54:	466c      	mov	r4, sp
c0de4e56:	2118      	movs	r1, #24
c0de4e58:	eb09 0005 	add.w	r0, r9, r5
c0de4e5c:	7046      	strb	r6, [r0, #1]
c0de4e5e:	4620      	mov	r0, r4
c0de4e60:	f008 f956 	bl	c0ded110 <__aeabi_memclr>
c0de4e64:	4808      	ldr	r0, [pc, #32]	@ (c0de4e88 <io_seproxyhal_init+0x3c>)
c0de4e66:	2701      	movs	r7, #1
c0de4e68:	f88d 601e 	strb.w	r6, [sp, #30]
c0de4e6c:	f8ad 7020 	strh.w	r7, [sp, #32]
c0de4e70:	f8ad 701c 	strh.w	r7, [sp, #28]
c0de4e74:	9006      	str	r0, [sp, #24]
c0de4e76:	4620      	mov	r0, r4
c0de4e78:	f007 ffe0 	bl	c0dece3c <os_io_init>
c0de4e7c:	f809 7005 	strb.w	r7, [r9, r5]
c0de4e80:	b009      	add	sp, #36	@ 0x24
c0de4e82:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de4e84:	000016c8 	.word	0x000016c8
c0de4e88:	00020015 	.word	0x00020015

c0de4e8c <OUTLINED_FUNCTION_0>:
c0de4e8c:	eb09 0106 	add.w	r1, r9, r6
c0de4e90:	3101      	adds	r1, #1
c0de4e92:	4448      	add	r0, r9
c0de4e94:	f008 b932 	b.w	c0ded0fc <__aeabi_memcpy>

c0de4e98 <layoutAddCallbackObj>:
c0de4e98:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de4e9a:	f890 40ad 	ldrb.w	r4, [r0, #173]	@ 0xad
c0de4e9e:	f890 50ae 	ldrb.w	r5, [r0, #174]	@ 0xae
c0de4ea2:	ea44 2405 	orr.w	r4, r4, r5, lsl #8
c0de4ea6:	f3c4 2505 	ubfx	r5, r4, #8, #6
c0de4eaa:	2d0e      	cmp	r5, #14
c0de4eac:	bf84      	itt	hi
c0de4eae:	2000      	movhi	r0, #0
c0de4eb0:	bdf0      	pophi	{r4, r5, r6, r7, pc}
c0de4eb2:	0a26      	lsrs	r6, r4, #8
c0de4eb4:	f404 4740 	and.w	r7, r4, #49152	@ 0xc000
c0de4eb8:	f880 40ad 	strb.w	r4, [r0, #173]	@ 0xad
c0de4ebc:	3601      	adds	r6, #1
c0de4ebe:	f006 063f 	and.w	r6, r6, #63	@ 0x3f
c0de4ec2:	ea47 2606 	orr.w	r6, r7, r6, lsl #8
c0de4ec6:	0a36      	lsrs	r6, r6, #8
c0de4ec8:	f880 60ae 	strb.w	r6, [r0, #174]	@ 0xae
c0de4ecc:	eb00 00c5 	add.w	r0, r0, r5, lsl #3
c0de4ed0:	f840 1f20 	str.w	r1, [r0, #32]!
c0de4ed4:	7102      	strb	r2, [r0, #4]
c0de4ed6:	7183      	strb	r3, [r0, #6]
c0de4ed8:	bdf0      	pop	{r4, r5, r6, r7, pc}
	...

c0de4edc <nbgl_layoutGet>:
c0de4edc:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de4ee0:	b085      	sub	sp, #20
c0de4ee2:	4604      	mov	r4, r0
c0de4ee4:	7800      	ldrb	r0, [r0, #0]
c0de4ee6:	b190      	cbz	r0, c0de4f0e <nbgl_layoutGet+0x32>
c0de4ee8:	486c      	ldr	r0, [pc, #432]	@ (c0de509c <nbgl_layoutGet+0x1c0>)
c0de4eea:	496d      	ldr	r1, [pc, #436]	@ (c0de50a0 <nbgl_layoutGet+0x1c4>)
c0de4eec:	2500      	movs	r5, #0
c0de4eee:	b158      	cbz	r0, c0de4f08 <nbgl_layoutGet+0x2c>
c0de4ef0:	eb09 0201 	add.w	r2, r9, r1
c0de4ef4:	4402      	add	r2, r0
c0de4ef6:	f892 32ca 	ldrb.w	r3, [r2, #714]	@ 0x2ca
c0de4efa:	021b      	lsls	r3, r3, #8
c0de4efc:	045b      	lsls	r3, r3, #17
c0de4efe:	bf58      	it	pl
c0de4f00:	f502 7507 	addpl.w	r5, r2, #540	@ 0x21c
c0de4f04:	30b4      	adds	r0, #180	@ 0xb4
c0de4f06:	e7f2      	b.n	c0de4eee <nbgl_layoutGet+0x12>
c0de4f08:	b975      	cbnz	r5, c0de4f28 <nbgl_layoutGet+0x4c>
c0de4f0a:	2500      	movs	r5, #0
c0de4f0c:	e0c1      	b.n	c0de5092 <nbgl_layoutGet+0x1b6>
c0de4f0e:	4965      	ldr	r1, [pc, #404]	@ (c0de50a4 <nbgl_layoutGet+0x1c8>)
c0de4f10:	4863      	ldr	r0, [pc, #396]	@ (c0de50a0 <nbgl_layoutGet+0x1c4>)
c0de4f12:	eb09 0201 	add.w	r2, r9, r1
c0de4f16:	6852      	ldr	r2, [r2, #4]
c0de4f18:	b112      	cbz	r2, c0de4f20 <nbgl_layoutGet+0x44>
c0de4f1a:	eb09 0500 	add.w	r5, r9, r0
c0de4f1e:	e003      	b.n	c0de4f28 <nbgl_layoutGet+0x4c>
c0de4f20:	eb09 0500 	add.w	r5, r9, r0
c0de4f24:	4449      	add	r1, r9
c0de4f26:	604d      	str	r5, [r1, #4]
c0de4f28:	4e5d      	ldr	r6, [pc, #372]	@ (c0de50a0 <nbgl_layoutGet+0x1c4>)
c0de4f2a:	4628      	mov	r0, r5
c0de4f2c:	21b4      	movs	r1, #180	@ 0xb4
c0de4f2e:	f859 7006 	ldr.w	r7, [r9, r6]
c0de4f32:	f008 f8ed 	bl	c0ded110 <__aeabi_memclr>
c0de4f36:	7820      	ldrb	r0, [r4, #0]
c0de4f38:	b150      	cbz	r0, c0de4f50 <nbgl_layoutGet+0x74>
c0de4f3a:	485a      	ldr	r0, [pc, #360]	@ (c0de50a4 <nbgl_layoutGet+0x1c8>)
c0de4f3c:	4448      	add	r0, r9
c0de4f3e:	6841      	ldr	r1, [r0, #4]
c0de4f40:	2900      	cmp	r1, #0
c0de4f42:	bf08      	it	eq
c0de4f44:	eb09 0106 	addeq.w	r1, r9, r6
c0de4f48:	600d      	str	r5, [r1, #0]
c0de4f4a:	6069      	str	r1, [r5, #4]
c0de4f4c:	6045      	str	r5, [r0, #4]
c0de4f4e:	e001      	b.n	c0de4f54 <nbgl_layoutGet+0x78>
c0de4f50:	f849 7006 	str.w	r7, [r9, r6]
c0de4f54:	4853      	ldr	r0, [pc, #332]	@ (c0de50a4 <nbgl_layoutGet+0x1c8>)
c0de4f56:	2100      	movs	r1, #0
c0de4f58:	f809 1000 	strb.w	r1, [r9, r0]
c0de4f5c:	68e0      	ldr	r0, [r4, #12]
c0de4f5e:	f007 fdcf 	bl	c0decb00 <pic>
c0de4f62:	4629      	mov	r1, r5
c0de4f64:	7826      	ldrb	r6, [r4, #0]
c0de4f66:	f811 2fad 	ldrb.w	r2, [r1, #173]!
c0de4f6a:	784b      	ldrb	r3, [r1, #1]
c0de4f6c:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de4f70:	f022 0201 	bic.w	r2, r2, #1
c0de4f74:	4332      	orrs	r2, r6
c0de4f76:	700a      	strb	r2, [r1, #0]
c0de4f78:	f002 02fd 	and.w	r2, r2, #253	@ 0xfd
c0de4f7c:	7866      	ldrb	r6, [r4, #1]
c0de4f7e:	f841 0c91 	str.w	r0, [r1, #-145]
c0de4f82:	704b      	strb	r3, [r1, #1]
c0de4f84:	f1a1 00a5 	sub.w	r0, r1, #165	@ 0xa5
c0de4f88:	ea42 0246 	orr.w	r2, r2, r6, lsl #1
c0de4f8c:	700a      	strb	r2, [r1, #0]
c0de4f8e:	f104 0210 	add.w	r2, r4, #16
c0de4f92:	7821      	ldrb	r1, [r4, #0]
c0de4f94:	4b44      	ldr	r3, [pc, #272]	@ (c0de50a8 <nbgl_layoutGet+0x1cc>)
c0de4f96:	447b      	add	r3, pc
c0de4f98:	b159      	cbz	r1, c0de4fb2 <nbgl_layoutGet+0xd6>
c0de4f9a:	2106      	movs	r1, #6
c0de4f9c:	f007 fbb6 	bl	c0dec70c <nbgl_screenPush>
c0de4fa0:	f895 10ad 	ldrb.w	r1, [r5, #173]	@ 0xad
c0de4fa4:	f895 20ae 	ldrb.w	r2, [r5, #174]	@ 0xae
c0de4fa8:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de4fac:	f360 01c7 	bfi	r1, r0, #3, #5
c0de4fb0:	e00a      	b.n	c0de4fc8 <nbgl_layoutGet+0xec>
c0de4fb2:	2106      	movs	r1, #6
c0de4fb4:	f007 fba5 	bl	c0dec702 <nbgl_screenSet>
c0de4fb8:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de4fbc:	f895 10ae 	ldrb.w	r1, [r5, #174]	@ 0xae
c0de4fc0:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de4fc4:	f020 01f8 	bic.w	r1, r0, #248	@ 0xf8
c0de4fc8:	462f      	mov	r7, r5
c0de4fca:	0a08      	lsrs	r0, r1, #8
c0de4fcc:	f04f 0a01 	mov.w	sl, #1
c0de4fd0:	f807 1fad 	strb.w	r1, [r7, #173]!
c0de4fd4:	7078      	strb	r0, [r7, #1]
c0de4fd6:	b2c8      	uxtb	r0, r1
c0de4fd8:	f003 fb69 	bl	c0de86ae <OUTLINED_FUNCTION_16>
c0de4fdc:	2102      	movs	r1, #2
c0de4fde:	f04f 0800 	mov.w	r8, #0
c0de4fe2:	f880 a005 	strb.w	sl, [r0, #5]
c0de4fe6:	71c1      	strb	r1, [r0, #7]
c0de4fe8:	2158      	movs	r1, #88	@ 0x58
c0de4fea:	f880 801f 	strb.w	r8, [r0, #31]
c0de4fee:	7181      	strb	r1, [r0, #6]
c0de4ff0:	21e0      	movs	r1, #224	@ 0xe0
c0de4ff2:	7101      	strb	r1, [r0, #4]
c0de4ff4:	f847 0c0d 	str.w	r0, [r7, #-13]
c0de4ff8:	7838      	ldrb	r0, [r7, #0]
c0de4ffa:	08c1      	lsrs	r1, r0, #3
c0de4ffc:	2014      	movs	r0, #20
c0de4ffe:	f007 fba3 	bl	c0dec748 <nbgl_containerPoolGet>
c0de5002:	f857 2c0d 	ldr.w	r2, [r7, #-13]
c0de5006:	0a03      	lsrs	r3, r0, #8
c0de5008:	f857 1ca5 	ldr.w	r1, [r7, #-165]
c0de500c:	0e06      	lsrs	r6, r0, #24
c0de500e:	f882 3023 	strb.w	r3, [r2, #35]	@ 0x23
c0de5012:	4613      	mov	r3, r2
c0de5014:	f882 a016 	strb.w	sl, [r2, #22]
c0de5018:	f803 0f22 	strb.w	r0, [r3, #34]!
c0de501c:	0c00      	lsrs	r0, r0, #16
c0de501e:	70de      	strb	r6, [r3, #3]
c0de5020:	7098      	strb	r0, [r3, #2]
c0de5022:	604a      	str	r2, [r1, #4]
c0de5024:	7838      	ldrb	r0, [r7, #0]
c0de5026:	7879      	ldrb	r1, [r7, #1]
c0de5028:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de502c:	f440 4180 	orr.w	r1, r0, #16384	@ 0x4000
c0de5030:	0a0a      	lsrs	r2, r1, #8
c0de5032:	707a      	strb	r2, [r7, #1]
c0de5034:	6862      	ldr	r2, [r4, #4]
c0de5036:	b362      	cbz	r2, c0de5092 <nbgl_layoutGet+0x1b6>
c0de5038:	eb0a 2210 	add.w	r2, sl, r0, lsr #8
c0de503c:	f885 10ad 	strb.w	r1, [r5, #173]	@ 0xad
c0de5040:	f401 4140 	and.w	r1, r1, #49152	@ 0xc000
c0de5044:	f3c0 2005 	ubfx	r0, r0, #8, #6
c0de5048:	f002 023f 	and.w	r2, r2, #63	@ 0x3f
c0de504c:	eb05 00c0 	add.w	r0, r5, r0, lsl #3
c0de5050:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de5054:	2204      	movs	r2, #4
c0de5056:	0a09      	lsrs	r1, r1, #8
c0de5058:	f885 10ae 	strb.w	r1, [r5, #174]	@ 0xae
c0de505c:	f8d5 10a0 	ldr.w	r1, [r5, #160]	@ 0xa0
c0de5060:	6201      	str	r1, [r0, #32]
c0de5062:	f881 801d 	strb.w	r8, [r1, #29]
c0de5066:	f881 a01c 	strb.w	sl, [r1, #28]
c0de506a:	778a      	strb	r2, [r1, #30]
c0de506c:	7a21      	ldrb	r1, [r4, #8]
c0de506e:	7a63      	ldrb	r3, [r4, #9]
c0de5070:	f880 3026 	strb.w	r3, [r0, #38]	@ 0x26
c0de5074:	f880 1024 	strb.w	r1, [r0, #36]	@ 0x24
c0de5078:	f88d 2000 	strb.w	r2, [sp]
c0de507c:	6860      	ldr	r0, [r4, #4]
c0de507e:	f007 fd3f 	bl	c0decb00 <pic>
c0de5082:	9001      	str	r0, [sp, #4]
c0de5084:	8920      	ldrh	r0, [r4, #8]
c0de5086:	4669      	mov	r1, sp
c0de5088:	f8ad 0008 	strh.w	r0, [sp, #8]
c0de508c:	4628      	mov	r0, r5
c0de508e:	f000 f981 	bl	c0de5394 <nbgl_layoutAddUpFooter>
c0de5092:	4628      	mov	r0, r5
c0de5094:	b005      	add	sp, #20
c0de5096:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}
c0de509a:	bf00      	nop
c0de509c:	fffffe98 	.word	0xfffffe98
c0de50a0:	000016cc 	.word	0x000016cc
c0de50a4:	000018e8 	.word	0x000018e8
c0de50a8:	00000113 	.word	0x00000113

c0de50ac <touchCallback>:
c0de50ac:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de50b0:	2800      	cmp	r0, #0
c0de50b2:	f000 816d 	beq.w	c0de5390 <touchCallback+0x2e4>
c0de50b6:	460d      	mov	r5, r1
c0de50b8:	a901      	add	r1, sp, #4
c0de50ba:	466a      	mov	r2, sp
c0de50bc:	4604      	mov	r4, r0
c0de50be:	f003 f965 	bl	c0de838c <getLayoutAndLayoutObj>
c0de50c2:	b968      	cbnz	r0, c0de50e0 <touchCallback+0x34>
c0de50c4:	4620      	mov	r0, r4
c0de50c6:	f810 1f0e 	ldrb.w	r1, [r0, #14]!
c0de50ca:	f003 fad1 	bl	c0de8670 <OUTLINED_FUNCTION_14>
c0de50ce:	466a      	mov	r2, sp
c0de50d0:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de50d4:	a901      	add	r1, sp, #4
c0de50d6:	f003 f959 	bl	c0de838c <getLayoutAndLayoutObj>
c0de50da:	2800      	cmp	r0, #0
c0de50dc:	f000 8158 	beq.w	c0de5390 <touchCallback+0x2e4>
c0de50e0:	1fe8      	subs	r0, r5, #7
c0de50e2:	b2c0      	uxtb	r0, r0
c0de50e4:	2803      	cmp	r0, #3
c0de50e6:	d833      	bhi.n	c0de5150 <touchCallback+0xa4>
c0de50e8:	7ee0      	ldrb	r0, [r4, #27]
c0de50ea:	2801      	cmp	r0, #1
c0de50ec:	d130      	bne.n	c0de5150 <touchCallback+0xa4>
c0de50ee:	9901      	ldr	r1, [sp, #4]
c0de50f0:	4628      	mov	r0, r5
c0de50f2:	f891 20b0 	ldrb.w	r2, [r1, #176]	@ 0xb0
c0de50f6:	2a01      	cmp	r2, #1
c0de50f8:	d028      	beq.n	c0de514c <touchCallback+0xa0>
c0de50fa:	bb4a      	cbnz	r2, c0de5150 <touchCallback+0xa4>
c0de50fc:	f8d1 00a0 	ldr.w	r0, [r1, #160]	@ 0xa0
c0de5100:	42a0      	cmp	r0, r4
c0de5102:	d125      	bne.n	c0de5150 <touchCallback+0xa4>
c0de5104:	f891 00ab 	ldrb.w	r0, [r1, #171]	@ 0xab
c0de5108:	2803      	cmp	r0, #3
c0de510a:	d005      	beq.n	c0de5118 <touchCallback+0x6c>
c0de510c:	2804      	cmp	r0, #4
c0de510e:	f040 813f 	bne.w	c0de5390 <touchCallback+0x2e4>
c0de5112:	f101 0010 	add.w	r0, r1, #16
c0de5116:	e00c      	b.n	c0de5132 <touchCallback+0x86>
c0de5118:	6908      	ldr	r0, [r1, #16]
c0de511a:	f810 2f22 	ldrb.w	r2, [r0, #34]!
c0de511e:	7843      	ldrb	r3, [r0, #1]
c0de5120:	7886      	ldrb	r6, [r0, #2]
c0de5122:	78c0      	ldrb	r0, [r0, #3]
c0de5124:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de5128:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
c0de512c:	ea42 4000 	orr.w	r0, r2, r0, lsl #16
c0de5130:	3004      	adds	r0, #4
c0de5132:	f101 06a9 	add.w	r6, r1, #169	@ 0xa9
c0de5136:	f891 20a8 	ldrb.w	r2, [r1, #168]	@ 0xa8
c0de513a:	6800      	ldr	r0, [r0, #0]
c0de513c:	4629      	mov	r1, r5
c0de513e:	4633      	mov	r3, r6
c0de5140:	f003 fccc 	bl	c0de8adc <layoutNavigationCallback>
c0de5144:	2800      	cmp	r0, #0
c0de5146:	f000 8123 	beq.w	c0de5390 <touchCallback+0x2e4>
c0de514a:	7830      	ldrb	r0, [r6, #0]
c0de514c:	9900      	ldr	r1, [sp, #0]
c0de514e:	7148      	strb	r0, [r1, #5]
c0de5150:	4620      	mov	r0, r4
c0de5152:	9f01      	ldr	r7, [sp, #4]
c0de5154:	f810 1f0e 	ldrb.w	r1, [r0, #14]!
c0de5158:	f003 fc15 	bl	c0de8986 <OUTLINED_FUNCTION_53>
c0de515c:	6938      	ldr	r0, [r7, #16]
c0de515e:	4281      	cmp	r1, r0
c0de5160:	d103      	bne.n	c0de516a <touchCallback+0xbe>
c0de5162:	f897 20ab 	ldrb.w	r2, [r7, #171]	@ 0xab
c0de5166:	2a04      	cmp	r2, #4
c0de5168:	d00c      	beq.n	c0de5184 <touchCallback+0xd8>
c0de516a:	7eca      	ldrb	r2, [r1, #27]
c0de516c:	2a01      	cmp	r2, #1
c0de516e:	d118      	bne.n	c0de51a2 <touchCallback+0xf6>
c0de5170:	f811 2f0e 	ldrb.w	r2, [r1, #14]!
c0de5174:	f003 fa53 	bl	c0de861e <OUTLINED_FUNCTION_11>
c0de5178:	4281      	cmp	r1, r0
c0de517a:	d112      	bne.n	c0de51a2 <touchCallback+0xf6>
c0de517c:	f897 00ab 	ldrb.w	r0, [r7, #171]	@ 0xab
c0de5180:	2803      	cmp	r0, #3
c0de5182:	d10e      	bne.n	c0de51a2 <touchCallback+0xf6>
c0de5184:	f107 06a9 	add.w	r6, r7, #169	@ 0xa9
c0de5188:	f897 20a8 	ldrb.w	r2, [r7, #168]	@ 0xa8
c0de518c:	4620      	mov	r0, r4
c0de518e:	4629      	mov	r1, r5
c0de5190:	4633      	mov	r3, r6
c0de5192:	f003 fca3 	bl	c0de8adc <layoutNavigationCallback>
c0de5196:	2800      	cmp	r0, #0
c0de5198:	f000 80fa 	beq.w	c0de5390 <touchCallback+0x2e4>
c0de519c:	7830      	ldrb	r0, [r6, #0]
c0de519e:	9900      	ldr	r1, [sp, #0]
c0de51a0:	7148      	strb	r0, [r1, #5]
c0de51a2:	7ee0      	ldrb	r0, [r4, #27]
c0de51a4:	2801      	cmp	r0, #1
c0de51a6:	f040 809b 	bne.w	c0de52e0 <touchCallback+0x234>
c0de51aa:	f894 0020 	ldrb.w	r0, [r4, #32]
c0de51ae:	2802      	cmp	r0, #2
c0de51b0:	f0c0 8096 	bcc.w	c0de52e0 <touchCallback+0x234>
c0de51b4:	4621      	mov	r1, r4
c0de51b6:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de51ba:	f003 fa30 	bl	c0de861e <OUTLINED_FUNCTION_11>
c0de51be:	684e      	ldr	r6, [r1, #4]
c0de51c0:	b196      	cbz	r6, c0de51e8 <touchCallback+0x13c>
c0de51c2:	7ef1      	ldrb	r1, [r6, #27]
c0de51c4:	2906      	cmp	r1, #6
c0de51c6:	d10f      	bne.n	c0de51e8 <touchCallback+0x13c>
c0de51c8:	f896 0021 	ldrb.w	r0, [r6, #33]	@ 0x21
c0de51cc:	3801      	subs	r0, #1
c0de51ce:	bf18      	it	ne
c0de51d0:	2001      	movne	r0, #1
c0de51d2:	f886 0021 	strb.w	r0, [r6, #33]	@ 0x21
c0de51d6:	4630      	mov	r0, r6
c0de51d8:	f007 fa89 	bl	c0dec6ee <nbgl_objDraw>
c0de51dc:	f896 0021 	ldrb.w	r0, [r6, #33]	@ 0x21
c0de51e0:	9900      	ldr	r1, [sp, #0]
c0de51e2:	2401      	movs	r4, #1
c0de51e4:	7148      	strb	r0, [r1, #5]
c0de51e6:	e07c      	b.n	c0de52e2 <touchCallback+0x236>
c0de51e8:	2804      	cmp	r0, #4
c0de51ea:	d060      	beq.n	c0de52ae <touchCallback+0x202>
c0de51ec:	2802      	cmp	r0, #2
c0de51ee:	d177      	bne.n	c0de52e0 <touchCallback+0x234>
c0de51f0:	f003 fb68 	bl	c0de88c4 <OUTLINED_FUNCTION_40>
c0de51f4:	6840      	ldr	r0, [r0, #4]
c0de51f6:	2800      	cmp	r0, #0
c0de51f8:	d072      	beq.n	c0de52e0 <touchCallback+0x234>
c0de51fa:	7ec0      	ldrb	r0, [r0, #27]
c0de51fc:	2809      	cmp	r0, #9
c0de51fe:	d16f      	bne.n	c0de52e0 <touchCallback+0x234>
c0de5200:	2d00      	cmp	r5, #0
c0de5202:	f040 80c5 	bne.w	c0de5390 <touchCallback+0x2e4>
c0de5206:	f04f 0aff 	mov.w	sl, #255	@ 0xff
c0de520a:	2500      	movs	r5, #0
c0de520c:	f04f 0800 	mov.w	r8, #0
c0de5210:	f897 10ae 	ldrb.w	r1, [r7, #174]	@ 0xae
c0de5214:	fa5f f088 	uxtb.w	r0, r8
c0de5218:	f001 013f 	and.w	r1, r1, #63	@ 0x3f
c0de521c:	4281      	cmp	r1, r0
c0de521e:	d977      	bls.n	c0de5310 <touchCallback+0x264>
c0de5220:	eb07 00c0 	add.w	r0, r7, r0, lsl #3
c0de5224:	6a00      	ldr	r0, [r0, #32]
c0de5226:	42a0      	cmp	r0, r4
c0de5228:	d117      	bne.n	c0de525a <touchCallback+0x1ae>
c0de522a:	7ee1      	ldrb	r1, [r4, #27]
c0de522c:	2901      	cmp	r1, #1
c0de522e:	d114      	bne.n	c0de525a <touchCallback+0x1ae>
c0de5230:	4620      	mov	r0, r4
c0de5232:	46ab      	mov	fp, r5
c0de5234:	46c2      	mov	sl, r8
c0de5236:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de523a:	f003 fa19 	bl	c0de8670 <OUTLINED_FUNCTION_14>
c0de523e:	220c      	movs	r2, #12
c0de5240:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de5244:	e9d0 1000 	ldrd	r1, r0, [r0]
c0de5248:	f881 2022 	strb.w	r2, [r1, #34]	@ 0x22
c0de524c:	2200      	movs	r2, #0
c0de524e:	77ca      	strb	r2, [r1, #31]
c0de5250:	2101      	movs	r1, #1
c0de5252:	f880 1021 	strb.w	r1, [r0, #33]	@ 0x21
c0de5256:	4620      	mov	r0, r4
c0de5258:	e024      	b.n	c0de52a4 <touchCallback+0x1f8>
c0de525a:	7ec1      	ldrb	r1, [r0, #27]
c0de525c:	2901      	cmp	r1, #1
c0de525e:	d123      	bne.n	c0de52a8 <touchCallback+0x1fc>
c0de5260:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de5264:	2902      	cmp	r1, #2
c0de5266:	d11f      	bne.n	c0de52a8 <touchCallback+0x1fc>
c0de5268:	4601      	mov	r1, r0
c0de526a:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de526e:	784b      	ldrb	r3, [r1, #1]
c0de5270:	788e      	ldrb	r6, [r1, #2]
c0de5272:	78c9      	ldrb	r1, [r1, #3]
c0de5274:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de5278:	ea46 2101 	orr.w	r1, r6, r1, lsl #8
c0de527c:	ea42 4201 	orr.w	r2, r2, r1, lsl #16
c0de5280:	6851      	ldr	r1, [r2, #4]
c0de5282:	7ecb      	ldrb	r3, [r1, #27]
c0de5284:	2b09      	cmp	r3, #9
c0de5286:	d10f      	bne.n	c0de52a8 <touchCallback+0x1fc>
c0de5288:	f891 3021 	ldrb.w	r3, [r1, #33]	@ 0x21
c0de528c:	3501      	adds	r5, #1
c0de528e:	2b01      	cmp	r3, #1
c0de5290:	d10a      	bne.n	c0de52a8 <touchCallback+0x1fc>
c0de5292:	6812      	ldr	r2, [r2, #0]
c0de5294:	230b      	movs	r3, #11
c0de5296:	f882 3022 	strb.w	r3, [r2, #34]	@ 0x22
c0de529a:	2301      	movs	r3, #1
c0de529c:	77d3      	strb	r3, [r2, #31]
c0de529e:	2200      	movs	r2, #0
c0de52a0:	f881 2021 	strb.w	r2, [r1, #33]	@ 0x21
c0de52a4:	f007 fa23 	bl	c0dec6ee <nbgl_objDraw>
c0de52a8:	f108 0801 	add.w	r8, r8, #1
c0de52ac:	e7b0      	b.n	c0de5210 <touchCallback+0x164>
c0de52ae:	f003 fb09 	bl	c0de88c4 <OUTLINED_FUNCTION_40>
c0de52b2:	68c6      	ldr	r6, [r0, #12]
c0de52b4:	b1a6      	cbz	r6, c0de52e0 <touchCallback+0x234>
c0de52b6:	7ef0      	ldrb	r0, [r6, #27]
c0de52b8:	2808      	cmp	r0, #8
c0de52ba:	d111      	bne.n	c0de52e0 <touchCallback+0x234>
c0de52bc:	2d0a      	cmp	r5, #10
c0de52be:	d867      	bhi.n	c0de5390 <touchCallback+0x2e4>
c0de52c0:	2001      	movs	r0, #1
c0de52c2:	40a8      	lsls	r0, r5
c0de52c4:	f410 6fc5 	tst.w	r0, #1576	@ 0x628
c0de52c8:	d039      	beq.n	c0de533e <touchCallback+0x292>
c0de52ca:	f007 fc49 	bl	c0decb60 <nbgl_wait_pipeline>
c0de52ce:	2000      	movs	r0, #0
c0de52d0:	f003 faed 	bl	c0de88ae <OUTLINED_FUNCTION_39>
c0de52d4:	2003      	movs	r0, #3
c0de52d6:	2100      	movs	r1, #0
c0de52d8:	e8bd 4dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de52dc:	f007 b9fd 	b.w	c0dec6da <nbgl_refreshSpecialWithPostRefresh>
c0de52e0:	2400      	movs	r4, #0
c0de52e2:	69f8      	ldr	r0, [r7, #28]
c0de52e4:	2800      	cmp	r0, #0
c0de52e6:	d053      	beq.n	c0de5390 <touchCallback+0x2e4>
c0de52e8:	9d00      	ldr	r5, [sp, #0]
c0de52ea:	7928      	ldrb	r0, [r5, #4]
c0de52ec:	28ff      	cmp	r0, #255	@ 0xff
c0de52ee:	d04f      	beq.n	c0de5390 <touchCallback+0x2e4>
c0de52f0:	79a8      	ldrb	r0, [r5, #6]
c0de52f2:	280b      	cmp	r0, #11
c0de52f4:	bf98      	it	ls
c0de52f6:	f7ff fbea 	blls	c0de4ace <os_io_seph_cmd_piezo_play_tune>
c0de52fa:	b114      	cbz	r4, c0de5302 <touchCallback+0x256>
c0de52fc:	2001      	movs	r0, #1
c0de52fe:	f007 f9e7 	bl	c0dec6d0 <nbgl_refreshSpecial>
c0de5302:	7928      	ldrb	r0, [r5, #4]
c0de5304:	7969      	ldrb	r1, [r5, #5]
c0de5306:	69fa      	ldr	r2, [r7, #28]
c0de5308:	b002      	add	sp, #8
c0de530a:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de530e:	4710      	bx	r2
c0de5310:	fa5f f08a 	uxtb.w	r0, sl
c0de5314:	28ff      	cmp	r0, #255	@ 0xff
c0de5316:	d03b      	beq.n	c0de5390 <touchCallback+0x2e4>
c0de5318:	69f9      	ldr	r1, [r7, #28]
c0de531a:	b3c9      	cbz	r1, c0de5390 <touchCallback+0x2e4>
c0de531c:	eb07 04c0 	add.w	r4, r7, r0, lsl #3
c0de5320:	f894 0026 	ldrb.w	r0, [r4, #38]	@ 0x26
c0de5324:	280b      	cmp	r0, #11
c0de5326:	bf98      	it	ls
c0de5328:	f7ff fbd1 	blls	c0de4ace <os_io_seph_cmd_piezo_play_tune>
c0de532c:	2001      	movs	r0, #1
c0de532e:	f007 f9cf 	bl	c0dec6d0 <nbgl_refreshSpecial>
c0de5332:	f894 0024 	ldrb.w	r0, [r4, #36]	@ 0x24
c0de5336:	69fa      	ldr	r2, [r7, #28]
c0de5338:	fa5f f18b 	uxtb.w	r1, fp
c0de533c:	e7e4      	b.n	c0de5308 <touchCallback+0x25c>
c0de533e:	2d02      	cmp	r5, #2
c0de5340:	d126      	bne.n	c0de5390 <touchCallback+0x2e4>
c0de5342:	9d00      	ldr	r5, [sp, #0]
c0de5344:	4620      	mov	r0, r4
c0de5346:	f007 fa31 	bl	c0dec7ac <nbgl_touchGetTouchDuration>
c0de534a:	f896 1021 	ldrb.w	r1, [r6, #33]	@ 0x21
c0de534e:	2200      	movs	r2, #0
c0de5350:	2300      	movs	r3, #0
c0de5352:	2964      	cmp	r1, #100	@ 0x64
c0de5354:	bf38      	it	cc
c0de5356:	2301      	movcc	r3, #1
c0de5358:	2464      	movs	r4, #100	@ 0x64
c0de535a:	fbb0 f0f4 	udiv	r0, r0, r4
c0de535e:	ebc0 00c0 	rsb	r0, r0, r0, lsl #3
c0de5362:	b2c4      	uxtb	r4, r0
c0de5364:	2c63      	cmp	r4, #99	@ 0x63
c0de5366:	bf88      	it	hi
c0de5368:	2201      	movhi	r2, #1
c0de536a:	ea02 0403 	and.w	r4, r2, r3
c0de536e:	bf88      	it	hi
c0de5370:	2064      	movhi	r0, #100	@ 0x64
c0de5372:	b2c2      	uxtb	r2, r0
c0de5374:	428a      	cmp	r2, r1
c0de5376:	d005      	beq.n	c0de5384 <touchCallback+0x2d8>
c0de5378:	f003 fa99 	bl	c0de88ae <OUTLINED_FUNCTION_39>
c0de537c:	2004      	movs	r0, #4
c0de537e:	2102      	movs	r1, #2
c0de5380:	f007 f9ab 	bl	c0dec6da <nbgl_refreshSpecialWithPostRefresh>
c0de5384:	b124      	cbz	r4, c0de5390 <touchCallback+0x2e4>
c0de5386:	69fa      	ldr	r2, [r7, #28]
c0de5388:	b112      	cbz	r2, c0de5390 <touchCallback+0x2e4>
c0de538a:	7928      	ldrb	r0, [r5, #4]
c0de538c:	7969      	ldrb	r1, [r5, #5]
c0de538e:	e7bb      	b.n	c0de5308 <touchCallback+0x25c>
c0de5390:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}

c0de5394 <nbgl_layoutAddUpFooter>:
c0de5394:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de5398:	2800      	cmp	r0, #0
c0de539a:	f000 827e 	beq.w	c0de589a <nbgl_layoutAddUpFooter+0x506>
c0de539e:	460d      	mov	r5, r1
c0de53a0:	b119      	cbz	r1, c0de53aa <nbgl_layoutAddUpFooter+0x16>
c0de53a2:	4604      	mov	r4, r0
c0de53a4:	7828      	ldrb	r0, [r5, #0]
c0de53a6:	2804      	cmp	r0, #4
c0de53a8:	d903      	bls.n	c0de53b2 <nbgl_layoutAddUpFooter+0x1e>
c0de53aa:	f06f 0001 	mvn.w	r0, #1
c0de53ae:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de53b2:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de53b6:	2601      	movs	r6, #1
c0de53b8:	f003 f979 	bl	c0de86ae <OUTLINED_FUNCTION_16>
c0de53bc:	2100      	movs	r1, #0
c0de53be:	7146      	strb	r6, [r0, #5]
c0de53c0:	77c1      	strb	r1, [r0, #31]
c0de53c2:	21e0      	movs	r1, #224	@ 0xe0
c0de53c4:	7101      	strb	r1, [r0, #4]
c0de53c6:	6160      	str	r0, [r4, #20]
c0de53c8:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de53cc:	f003 fb1a 	bl	c0de8a04 <OUTLINED_FUNCTION_62>
c0de53d0:	6961      	ldr	r1, [r4, #20]
c0de53d2:	0a02      	lsrs	r2, r0, #8
c0de53d4:	f8d4 30a0 	ldr.w	r3, [r4, #160]	@ 0xa0
c0de53d8:	0e06      	lsrs	r6, r0, #24
c0de53da:	f881 2023 	strb.w	r2, [r1, #35]	@ 0x23
c0de53de:	2208      	movs	r2, #8
c0de53e0:	f003 fb3c 	bl	c0de8a5c <OUTLINED_FUNCTION_70>
c0de53e4:	4608      	mov	r0, r1
c0de53e6:	70d6      	strb	r6, [r2, #3]
c0de53e8:	0e1a      	lsrs	r2, r3, #24
c0de53ea:	f800 3f12 	strb.w	r3, [r0, #18]!
c0de53ee:	70c2      	strb	r2, [r0, #3]
c0de53f0:	0c1a      	lsrs	r2, r3, #16
c0de53f2:	7082      	strb	r2, [r0, #2]
c0de53f4:	0a18      	lsrs	r0, r3, #8
c0de53f6:	74c8      	strb	r0, [r1, #19]
c0de53f8:	7828      	ldrb	r0, [r5, #0]
c0de53fa:	2804      	cmp	r0, #4
c0de53fc:	f000 80c6 	beq.w	c0de558c <nbgl_layoutAddUpFooter+0x1f8>
c0de5400:	2801      	cmp	r0, #1
c0de5402:	f000 80f1 	beq.w	c0de55e8 <nbgl_layoutAddUpFooter+0x254>
c0de5406:	2802      	cmp	r0, #2
c0de5408:	f000 8153 	beq.w	c0de56b2 <nbgl_layoutAddUpFooter+0x31e>
c0de540c:	2803      	cmp	r0, #3
c0de540e:	f000 81df 	beq.w	c0de57d0 <nbgl_layoutAddUpFooter+0x43c>
c0de5412:	2800      	cmp	r0, #0
c0de5414:	d1c9      	bne.n	c0de53aa <nbgl_layoutAddUpFooter+0x16>
c0de5416:	f003 fb13 	bl	c0de8a40 <OUTLINED_FUNCTION_67>
c0de541a:	2800      	cmp	r0, #0
c0de541c:	f000 823d 	beq.w	c0de589a <nbgl_layoutAddUpFooter+0x506>
c0de5420:	6960      	ldr	r0, [r4, #20]
c0de5422:	2104      	movs	r1, #4
c0de5424:	2700      	movs	r7, #0
c0de5426:	f04f 0806 	mov.w	r8, #6
c0de542a:	f880 1020 	strb.w	r1, [r0, #32]
c0de542e:	2112      	movs	r1, #18
c0de5430:	71c7      	strb	r7, [r0, #7]
c0de5432:	f880 801d 	strb.w	r8, [r0, #29]
c0de5436:	7781      	strb	r1, [r0, #30]
c0de5438:	2198      	movs	r1, #152	@ 0x98
c0de543a:	7181      	strb	r1, [r0, #6]
c0de543c:	212c      	movs	r1, #44	@ 0x2c
c0de543e:	7701      	strb	r1, [r0, #28]
c0de5440:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5444:	4ee0      	ldr	r6, [pc, #896]	@ (c0de57c8 <nbgl_layoutAddUpFooter+0x434>)
c0de5446:	08c1      	lsrs	r1, r0, #3
c0de5448:	447e      	add	r6, pc
c0de544a:	2005      	movs	r0, #5
c0de544c:	47b0      	blx	r6
c0de544e:	46b2      	mov	sl, r6
c0de5450:	4606      	mov	r6, r0
c0de5452:	7607      	strb	r7, [r0, #24]
c0de5454:	2020      	movs	r0, #32
c0de5456:	2103      	movs	r1, #3
c0de5458:	75f0      	strb	r0, [r6, #23]
c0de545a:	2058      	movs	r0, #88	@ 0x58
c0de545c:	f886 8016 	strb.w	r8, [r6, #22]
c0de5460:	46b0      	mov	r8, r6
c0de5462:	71f7      	strb	r7, [r6, #7]
c0de5464:	f886 1021 	strb.w	r1, [r6, #33]	@ 0x21
c0de5468:	77f7      	strb	r7, [r6, #31]
c0de546a:	f886 7020 	strb.w	r7, [r6, #32]
c0de546e:	f886 1022 	strb.w	r1, [r6, #34]	@ 0x22
c0de5472:	f808 0f04 	strb.w	r0, [r8, #4]!
c0de5476:	71b0      	strb	r0, [r6, #6]
c0de5478:	f888 7001 	strb.w	r7, [r8, #1]
c0de547c:	48d3      	ldr	r0, [pc, #844]	@ (c0de57cc <nbgl_layoutAddUpFooter+0x438>)
c0de547e:	4478      	add	r0, pc
c0de5480:	f007 fb3e 	bl	c0decb00 <pic>
c0de5484:	4631      	mov	r1, r6
c0de5486:	0e02      	lsrs	r2, r0, #24
c0de5488:	f003 f9b3 	bl	c0de87f2 <OUTLINED_FUNCTION_31>
c0de548c:	6960      	ldr	r0, [r4, #20]
c0de548e:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de5492:	7842      	ldrb	r2, [r0, #1]
c0de5494:	7883      	ldrb	r3, [r0, #2]
c0de5496:	78c0      	ldrb	r0, [r0, #3]
c0de5498:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de549c:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de54a0:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de54a4:	6006      	str	r6, [r0, #0]
c0de54a6:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de54aa:	08c1      	lsrs	r1, r0, #3
c0de54ac:	2004      	movs	r0, #4
c0de54ae:	47d0      	blx	sl
c0de54b0:	77c7      	strb	r7, [r0, #31]
c0de54b2:	4606      	mov	r6, r0
c0de54b4:	f003 f944 	bl	c0de8740 <OUTLINED_FUNCTION_23>
c0de54b8:	4601      	mov	r1, r0
c0de54ba:	2001      	movs	r0, #1
c0de54bc:	f04f 0b04 	mov.w	fp, #4
c0de54c0:	2301      	movs	r3, #1
c0de54c2:	f886 0024 	strb.w	r0, [r6, #36]	@ 0x24
c0de54c6:	200d      	movs	r0, #13
c0de54c8:	0e0a      	lsrs	r2, r1, #24
c0de54ca:	f886 b020 	strb.w	fp, [r6, #32]
c0de54ce:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de54d2:	f003 fa40 	bl	c0de8956 <OUTLINED_FUNCTION_50>
c0de54d6:	f898 0000 	ldrb.w	r0, [r8]
c0de54da:	f898 2001 	ldrb.w	r2, [r8, #1]
c0de54de:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de54e2:	f5c0 70c0 	rsb	r0, r0, #384	@ 0x180
c0de54e6:	0a02      	lsrs	r2, r0, #8
c0de54e8:	7130      	strb	r0, [r6, #4]
c0de54ea:	7172      	strb	r2, [r6, #5]
c0de54ec:	b282      	uxth	r2, r0
c0de54ee:	f003 fae2 	bl	c0de8ab6 <OUTLINED_FUNCTION_78>
c0de54f2:	2120      	movs	r1, #32
c0de54f4:	71b0      	strb	r0, [r6, #6]
c0de54f6:	0a00      	lsrs	r0, r0, #8
c0de54f8:	f886 b016 	strb.w	fp, [r6, #22]
c0de54fc:	f886 7021 	strb.w	r7, [r6, #33]	@ 0x21
c0de5500:	7637      	strb	r7, [r6, #24]
c0de5502:	f04f 0b04 	mov.w	fp, #4
c0de5506:	75f1      	strb	r1, [r6, #23]
c0de5508:	71f0      	strb	r0, [r6, #7]
c0de550a:	6960      	ldr	r0, [r4, #20]
c0de550c:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de5510:	7842      	ldrb	r2, [r0, #1]
c0de5512:	7883      	ldrb	r3, [r0, #2]
c0de5514:	78c0      	ldrb	r0, [r0, #3]
c0de5516:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de551a:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de551e:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de5522:	6046      	str	r6, [r0, #4]
c0de5524:	f003 f91f 	bl	c0de8766 <OUTLINED_FUNCTION_25>
c0de5528:	2103      	movs	r1, #3
c0de552a:	f04f 0802 	mov.w	r8, #2
c0de552e:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de5532:	6961      	ldr	r1, [r4, #20]
c0de5534:	f880 8016 	strb.w	r8, [r0, #22]
c0de5538:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de553c:	784b      	ldrb	r3, [r1, #1]
c0de553e:	788e      	ldrb	r6, [r1, #2]
c0de5540:	78c9      	ldrb	r1, [r1, #3]
c0de5542:	ea46 2101 	orr.w	r1, r6, r1, lsl #8
c0de5546:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de554a:	2608      	movs	r6, #8
c0de554c:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de5550:	6088      	str	r0, [r1, #8]
c0de5552:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5556:	08c1      	lsrs	r1, r0, #3
c0de5558:	2008      	movs	r0, #8
c0de555a:	47d0      	blx	sl
c0de555c:	f890 1022 	ldrb.w	r1, [r0, #34]	@ 0x22
c0de5560:	f880 b019 	strb.w	fp, [r0, #25]
c0de5564:	7186      	strb	r6, [r0, #6]
c0de5566:	7687      	strb	r7, [r0, #26]
c0de5568:	71c7      	strb	r7, [r0, #7]
c0de556a:	f880 8016 	strb.w	r8, [r0, #22]
c0de556e:	f041 0104 	orr.w	r1, r1, #4
c0de5572:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de5576:	2101      	movs	r1, #1
c0de5578:	7141      	strb	r1, [r0, #5]
c0de557a:	21e0      	movs	r1, #224	@ 0xe0
c0de557c:	7101      	strb	r1, [r0, #4]
c0de557e:	6961      	ldr	r1, [r4, #20]
c0de5580:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de5584:	f003 f84b 	bl	c0de861e <OUTLINED_FUNCTION_11>
c0de5588:	60c8      	str	r0, [r1, #12]
c0de558a:	e1f9      	b.n	c0de5980 <nbgl_layoutAddUpFooter+0x5ec>
c0de558c:	f003 fa58 	bl	c0de8a40 <OUTLINED_FUNCTION_67>
c0de5590:	2800      	cmp	r0, #0
c0de5592:	f000 8182 	beq.w	c0de589a <nbgl_layoutAddUpFooter+0x506>
c0de5596:	6960      	ldr	r0, [r4, #20]
c0de5598:	2104      	movs	r1, #4
c0de559a:	2701      	movs	r7, #1
c0de559c:	2260      	movs	r2, #96	@ 0x60
c0de559e:	7781      	strb	r1, [r0, #30]
c0de55a0:	2100      	movs	r1, #0
c0de55a2:	f880 7020 	strb.w	r7, [r0, #32]
c0de55a6:	7182      	strb	r2, [r0, #6]
c0de55a8:	7707      	strb	r7, [r0, #28]
c0de55aa:	71c1      	strb	r1, [r0, #7]
c0de55ac:	7741      	strb	r1, [r0, #29]
c0de55ae:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de55b2:	f002 ff93 	bl	c0de84dc <OUTLINED_FUNCTION_0>
c0de55b6:	77c7      	strb	r7, [r0, #31]
c0de55b8:	4606      	mov	r6, r0
c0de55ba:	f003 f8c1 	bl	c0de8740 <OUTLINED_FUNCTION_23>
c0de55be:	4601      	mov	r1, r0
c0de55c0:	20a0      	movs	r0, #160	@ 0xa0
c0de55c2:	7177      	strb	r7, [r6, #5]
c0de55c4:	f886 7024 	strb.w	r7, [r6, #36]	@ 0x24
c0de55c8:	2705      	movs	r7, #5
c0de55ca:	2301      	movs	r3, #1
c0de55cc:	7130      	strb	r0, [r6, #4]
c0de55ce:	200b      	movs	r0, #11
c0de55d0:	0e0a      	lsrs	r2, r1, #24
c0de55d2:	f886 7020 	strb.w	r7, [r6, #32]
c0de55d6:	f003 f8fd 	bl	c0de87d4 <OUTLINED_FUNCTION_30>
c0de55da:	f007 f8c9 	bl	c0dec770 <nbgl_getTextHeightInWidth>
c0de55de:	71b0      	strb	r0, [r6, #6]
c0de55e0:	0a00      	lsrs	r0, r0, #8
c0de55e2:	75b7      	strb	r7, [r6, #22]
c0de55e4:	71f0      	strb	r0, [r6, #7]
c0de55e6:	e056      	b.n	c0de5696 <nbgl_layoutAddUpFooter+0x302>
c0de55e8:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de55ec:	2705      	movs	r7, #5
c0de55ee:	f003 f862 	bl	c0de86b6 <OUTLINED_FUNCTION_17>
c0de55f2:	4606      	mov	r6, r0
c0de55f4:	7b2a      	ldrb	r2, [r5, #12]
c0de55f6:	7c2b      	ldrb	r3, [r5, #16]
c0de55f8:	f002 ffbe 	bl	c0de8578 <OUTLINED_FUNCTION_6>
c0de55fc:	2800      	cmp	r0, #0
c0de55fe:	f000 814c 	beq.w	c0de589a <nbgl_layoutAddUpFooter+0x506>
c0de5602:	6960      	ldr	r0, [r4, #20]
c0de5604:	75b7      	strb	r7, [r6, #22]
c0de5606:	f04f 0801 	mov.w	r8, #1
c0de560a:	2700      	movs	r7, #0
c0de560c:	2188      	movs	r1, #136	@ 0x88
c0de560e:	f880 8020 	strb.w	r8, [r0, #32]
c0de5612:	71c7      	strb	r7, [r0, #7]
c0de5614:	7181      	strb	r1, [r0, #6]
c0de5616:	7b68      	ldrb	r0, [r5, #13]
c0de5618:	2800      	cmp	r0, #0
c0de561a:	bf18      	it	ne
c0de561c:	2003      	movne	r0, #3
c0de561e:	77f0      	strb	r0, [r6, #31]
c0de5620:	f04f 0000 	mov.w	r0, #0
c0de5624:	bf08      	it	eq
c0de5626:	2003      	moveq	r0, #3
c0de5628:	f886 0021 	strb.w	r0, [r6, #33]	@ 0x21
c0de562c:	7b68      	ldrb	r0, [r5, #13]
c0de562e:	4601      	mov	r1, r0
c0de5630:	2800      	cmp	r0, #0
c0de5632:	bf18      	it	ne
c0de5634:	2101      	movne	r1, #1
c0de5636:	0049      	lsls	r1, r1, #1
c0de5638:	2802      	cmp	r0, #2
c0de563a:	bf08      	it	eq
c0de563c:	2103      	moveq	r1, #3
c0de563e:	f886 1020 	strb.w	r1, [r6, #32]
c0de5642:	f003 f87d 	bl	c0de8740 <OUTLINED_FUNCTION_23>
c0de5646:	210c      	movs	r1, #12
c0de5648:	0e02      	lsrs	r2, r0, #24
c0de564a:	f886 1023 	strb.w	r1, [r6, #35]	@ 0x23
c0de564e:	4631      	mov	r1, r6
c0de5650:	f003 f8ae 	bl	c0de87b0 <OUTLINED_FUNCTION_28>
c0de5654:	f003 f97c 	bl	c0de8950 <OUTLINED_FUNCTION_49>
c0de5658:	4631      	mov	r1, r6
c0de565a:	0e02      	lsrs	r2, r0, #24
c0de565c:	74f7      	strb	r7, [r6, #19]
c0de565e:	71f7      	strb	r7, [r6, #7]
c0de5660:	f886 8005 	strb.w	r8, [r6, #5]
c0de5664:	7777      	strb	r7, [r6, #29]
c0de5666:	f886 801c 	strb.w	r8, [r6, #28]
c0de566a:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de566e:	70ca      	strb	r2, [r1, #3]
c0de5670:	0c02      	lsrs	r2, r0, #16
c0de5672:	0a00      	lsrs	r0, r0, #8
c0de5674:	f886 002f 	strb.w	r0, [r6, #47]	@ 0x2f
c0de5678:	4630      	mov	r0, r6
c0de567a:	708a      	strb	r2, [r1, #2]
c0de567c:	f800 7f12 	strb.w	r7, [r0, #18]!
c0de5680:	70c7      	strb	r7, [r0, #3]
c0de5682:	7087      	strb	r7, [r0, #2]
c0de5684:	2058      	movs	r0, #88	@ 0x58
c0de5686:	71b0      	strb	r0, [r6, #6]
c0de5688:	20a0      	movs	r0, #160	@ 0xa0
c0de568a:	7130      	strb	r0, [r6, #4]
c0de568c:	2003      	movs	r0, #3
c0de568e:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de5692:	2007      	movs	r0, #7
c0de5694:	77b0      	strb	r0, [r6, #30]
c0de5696:	6960      	ldr	r0, [r4, #20]
c0de5698:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de569c:	7842      	ldrb	r2, [r0, #1]
c0de569e:	7883      	ldrb	r3, [r0, #2]
c0de56a0:	78c0      	ldrb	r0, [r0, #3]
c0de56a2:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de56a6:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de56aa:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de56ae:	6006      	str	r6, [r0, #0]
c0de56b0:	e166      	b.n	c0de5980 <nbgl_layoutAddUpFooter+0x5ec>
c0de56b2:	6868      	ldr	r0, [r5, #4]
c0de56b4:	2800      	cmp	r0, #0
c0de56b6:	f000 80f0 	beq.w	c0de589a <nbgl_layoutAddUpFooter+0x506>
c0de56ba:	68a8      	ldr	r0, [r5, #8]
c0de56bc:	2800      	cmp	r0, #0
c0de56be:	f000 80ec 	beq.w	c0de589a <nbgl_layoutAddUpFooter+0x506>
c0de56c2:	f04f 0b00 	mov.w	fp, #0
c0de56c6:	2088      	movs	r0, #136	@ 0x88
c0de56c8:	2702      	movs	r7, #2
c0de56ca:	f881 b007 	strb.w	fp, [r1, #7]
c0de56ce:	7188      	strb	r0, [r1, #6]
c0de56d0:	f881 7020 	strb.w	r7, [r1, #32]
c0de56d4:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de56d8:	f002 ffed 	bl	c0de86b6 <OUTLINED_FUNCTION_17>
c0de56dc:	4606      	mov	r6, r0
c0de56de:	7b2a      	ldrb	r2, [r5, #12]
c0de56e0:	7bab      	ldrb	r3, [r5, #14]
c0de56e2:	f002 ff49 	bl	c0de8578 <OUTLINED_FUNCTION_6>
c0de56e6:	2800      	cmp	r0, #0
c0de56e8:	f000 80d7 	beq.w	c0de589a <nbgl_layoutAddUpFooter+0x506>
c0de56ec:	2120      	movs	r1, #32
c0de56ee:	f04f 0a03 	mov.w	sl, #3
c0de56f2:	f04f 0858 	mov.w	r8, #88	@ 0x58
c0de56f6:	f886 7020 	strb.w	r7, [r6, #32]
c0de56fa:	f886 b018 	strb.w	fp, [r6, #24]
c0de56fe:	f886 b021 	strb.w	fp, [r6, #33]	@ 0x21
c0de5702:	f886 b007 	strb.w	fp, [r6, #7]
c0de5706:	f886 b005 	strb.w	fp, [r6, #5]
c0de570a:	75f1      	strb	r1, [r6, #23]
c0de570c:	2104      	movs	r1, #4
c0de570e:	f886 a01f 	strb.w	sl, [r6, #31]
c0de5712:	f886 a022 	strb.w	sl, [r6, #34]	@ 0x22
c0de5716:	75b1      	strb	r1, [r6, #22]
c0de5718:	2101      	movs	r1, #1
c0de571a:	7141      	strb	r1, [r0, #5]
c0de571c:	f886 8006 	strb.w	r8, [r6, #6]
c0de5720:	f886 8004 	strb.w	r8, [r6, #4]
c0de5724:	f003 f80c 	bl	c0de8740 <OUTLINED_FUNCTION_23>
c0de5728:	4631      	mov	r1, r6
c0de572a:	0e02      	lsrs	r2, r0, #24
c0de572c:	f886 b01d 	strb.w	fp, [r6, #29]
c0de5730:	f04f 0b01 	mov.w	fp, #1
c0de5734:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de5738:	f886 b01c 	strb.w	fp, [r6, #28]
c0de573c:	70ca      	strb	r2, [r1, #3]
c0de573e:	0c02      	lsrs	r2, r0, #16
c0de5740:	0a00      	lsrs	r0, r0, #8
c0de5742:	f886 002f 	strb.w	r0, [r6, #47]	@ 0x2f
c0de5746:	200c      	movs	r0, #12
c0de5748:	708a      	strb	r2, [r1, #2]
c0de574a:	f886 0023 	strb.w	r0, [r6, #35]	@ 0x23
c0de574e:	200a      	movs	r0, #10
c0de5750:	f003 f883 	bl	c0de885a <OUTLINED_FUNCTION_36>
c0de5754:	6006      	str	r6, [r0, #0]
c0de5756:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de575a:	f002 ffac 	bl	c0de86b6 <OUTLINED_FUNCTION_17>
c0de575e:	4606      	mov	r6, r0
c0de5760:	7b6a      	ldrb	r2, [r5, #13]
c0de5762:	7bab      	ldrb	r3, [r5, #14]
c0de5764:	f002 ff08 	bl	c0de8578 <OUTLINED_FUNCTION_6>
c0de5768:	2800      	cmp	r0, #0
c0de576a:	f000 8096 	beq.w	c0de589a <nbgl_layoutAddUpFooter+0x506>
c0de576e:	2700      	movs	r7, #0
c0de5770:	2120      	movs	r1, #32
c0de5772:	f886 a021 	strb.w	sl, [r6, #33]	@ 0x21
c0de5776:	f886 a022 	strb.w	sl, [r6, #34]	@ 0x22
c0de577a:	f886 b005 	strb.w	fp, [r6, #5]
c0de577e:	75f1      	strb	r1, [r6, #23]
c0de5780:	7147      	strb	r7, [r0, #5]
c0de5782:	2106      	movs	r1, #6
c0de5784:	2038      	movs	r0, #56	@ 0x38
c0de5786:	f886 7020 	strb.w	r7, [r6, #32]
c0de578a:	77f7      	strb	r7, [r6, #31]
c0de578c:	7637      	strb	r7, [r6, #24]
c0de578e:	71f7      	strb	r7, [r6, #7]
c0de5790:	f886 8006 	strb.w	r8, [r6, #6]
c0de5794:	75b1      	strb	r1, [r6, #22]
c0de5796:	7130      	strb	r0, [r6, #4]
c0de5798:	f003 f8da 	bl	c0de8950 <OUTLINED_FUNCTION_49>
c0de579c:	4631      	mov	r1, r6
c0de579e:	0e02      	lsrs	r2, r0, #24
c0de57a0:	f886 b01c 	strb.w	fp, [r6, #28]
c0de57a4:	7777      	strb	r7, [r6, #29]
c0de57a6:	f801 0f25 	strb.w	r0, [r1, #37]!
c0de57aa:	70ca      	strb	r2, [r1, #3]
c0de57ac:	0c02      	lsrs	r2, r0, #16
c0de57ae:	0a00      	lsrs	r0, r0, #8
c0de57b0:	f886 0026 	strb.w	r0, [r6, #38]	@ 0x26
c0de57b4:	200c      	movs	r0, #12
c0de57b6:	708a      	strb	r2, [r1, #2]
c0de57b8:	f886 0023 	strb.w	r0, [r6, #35]	@ 0x23
c0de57bc:	2009      	movs	r0, #9
c0de57be:	f003 f84c 	bl	c0de885a <OUTLINED_FUNCTION_36>
c0de57c2:	6046      	str	r6, [r0, #4]
c0de57c4:	e0dc      	b.n	c0de5980 <nbgl_layoutAddUpFooter+0x5ec>
c0de57c6:	bf00      	nop
c0de57c8:	000072f3 	.word	0x000072f3
c0de57cc:	0000875f 	.word	0x0000875f
c0de57d0:	6868      	ldr	r0, [r5, #4]
c0de57d2:	2800      	cmp	r0, #0
c0de57d4:	d061      	beq.n	c0de589a <nbgl_layoutAddUpFooter+0x506>
c0de57d6:	7b2a      	ldrb	r2, [r5, #12]
c0de57d8:	7b6b      	ldrb	r3, [r5, #13]
c0de57da:	4620      	mov	r0, r4
c0de57dc:	f7ff fb5c 	bl	c0de4e98 <layoutAddCallbackObj>
c0de57e0:	2800      	cmp	r0, #0
c0de57e2:	d05a      	beq.n	c0de589a <nbgl_layoutAddUpFooter+0x506>
c0de57e4:	6960      	ldr	r0, [r4, #20]
c0de57e6:	f04f 0803 	mov.w	r8, #3
c0de57ea:	2113      	movs	r1, #19
c0de57ec:	f04f 0a00 	mov.w	sl, #0
c0de57f0:	2701      	movs	r7, #1
c0de57f2:	f04f 0b04 	mov.w	fp, #4
c0de57f6:	f880 8020 	strb.w	r8, [r0, #32]
c0de57fa:	7781      	strb	r1, [r0, #30]
c0de57fc:	f880 a01d 	strb.w	sl, [r0, #29]
c0de5800:	7707      	strb	r7, [r0, #28]
c0de5802:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5806:	f002 fe69 	bl	c0de84dc <OUTLINED_FUNCTION_0>
c0de580a:	f880 a01f 	strb.w	sl, [r0, #31]
c0de580e:	4606      	mov	r6, r0
c0de5810:	f002 ff96 	bl	c0de8740 <OUTLINED_FUNCTION_23>
c0de5814:	22a0      	movs	r2, #160	@ 0xa0
c0de5816:	4601      	mov	r1, r0
c0de5818:	200b      	movs	r0, #11
c0de581a:	f886 7024 	strb.w	r7, [r6, #36]	@ 0x24
c0de581e:	f886 b020 	strb.w	fp, [r6, #32]
c0de5822:	7177      	strb	r7, [r6, #5]
c0de5824:	7132      	strb	r2, [r6, #4]
c0de5826:	4632      	mov	r2, r6
c0de5828:	0e0b      	lsrs	r3, r1, #24
c0de582a:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de582e:	f802 1f26 	strb.w	r1, [r2, #38]!
c0de5832:	70d3      	strb	r3, [r2, #3]
c0de5834:	0c0b      	lsrs	r3, r1, #16
c0de5836:	7093      	strb	r3, [r2, #2]
c0de5838:	0a0a      	lsrs	r2, r1, #8
c0de583a:	f886 2027 	strb.w	r2, [r6, #39]	@ 0x27
c0de583e:	68aa      	ldr	r2, [r5, #8]
c0de5840:	b37a      	cbz	r2, c0de58a2 <nbgl_layoutAddUpFooter+0x50e>
c0de5842:	4610      	mov	r0, r2
c0de5844:	f007 f95c 	bl	c0decb00 <pic>
c0de5848:	4633      	mov	r3, r6
c0de584a:	4601      	mov	r1, r0
c0de584c:	f813 cf26 	ldrb.w	ip, [r3, #38]!
c0de5850:	f813 ed22 	ldrb.w	lr, [r3, #-34]!
c0de5854:	785a      	ldrb	r2, [r3, #1]
c0de5856:	7f98      	ldrb	r0, [r3, #30]
c0de5858:	f893 7020 	ldrb.w	r7, [r3, #32]
c0de585c:	f893 8023 	ldrb.w	r8, [r3, #35]	@ 0x23
c0de5860:	ea4e 2e02 	orr.w	lr, lr, r2, lsl #8
c0de5864:	780a      	ldrb	r2, [r1, #0]
c0de5866:	7849      	ldrb	r1, [r1, #1]
c0de5868:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0de586c:	ebae 0101 	sub.w	r1, lr, r1
c0de5870:	f1a1 0220 	sub.w	r2, r1, #32
c0de5874:	0a11      	lsrs	r1, r2, #8
c0de5876:	701a      	strb	r2, [r3, #0]
c0de5878:	7059      	strb	r1, [r3, #1]
c0de587a:	f893 1025 	ldrb.w	r1, [r3, #37]	@ 0x25
c0de587e:	f893 3024 	ldrb.w	r3, [r3, #36]	@ 0x24
c0de5882:	2f00      	cmp	r7, #0
c0de5884:	bf18      	it	ne
c0de5886:	2701      	movne	r7, #1
c0de5888:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de588c:	ea4c 2308 	orr.w	r3, ip, r8, lsl #8
c0de5890:	f04f 0803 	mov.w	r8, #3
c0de5894:	ea43 4101 	orr.w	r1, r3, r1, lsl #16
c0de5898:	e005      	b.n	c0de58a6 <nbgl_layoutAddUpFooter+0x512>
c0de589a:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de589e:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de58a2:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de58a6:	b292      	uxth	r2, r2
c0de58a8:	463b      	mov	r3, r7
c0de58aa:	f006 ff61 	bl	c0dec770 <nbgl_getTextHeightInWidth>
c0de58ae:	6961      	ldr	r1, [r4, #20]
c0de58b0:	f886 a018 	strb.w	sl, [r6, #24]
c0de58b4:	f886 b016 	strb.w	fp, [r6, #22]
c0de58b8:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de58bc:	784b      	ldrb	r3, [r1, #1]
c0de58be:	788f      	ldrb	r7, [r1, #2]
c0de58c0:	78c9      	ldrb	r1, [r1, #3]
c0de58c2:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de58c6:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de58ca:	2720      	movs	r7, #32
c0de58cc:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de58d0:	600e      	str	r6, [r1, #0]
c0de58d2:	75f7      	strb	r7, [r6, #23]
c0de58d4:	71b0      	strb	r0, [r6, #6]
c0de58d6:	0a01      	lsrs	r1, r0, #8
c0de58d8:	6962      	ldr	r2, [r4, #20]
c0de58da:	71f1      	strb	r1, [r6, #7]
c0de58dc:	71d1      	strb	r1, [r2, #7]
c0de58de:	7190      	strb	r0, [r2, #6]
c0de58e0:	f002 ff41 	bl	c0de8766 <OUTLINED_FUNCTION_25>
c0de58e4:	2102      	movs	r1, #2
c0de58e6:	f880 8022 	strb.w	r8, [r0, #34]	@ 0x22
c0de58ea:	7581      	strb	r1, [r0, #22]
c0de58ec:	6961      	ldr	r1, [r4, #20]
c0de58ee:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de58f2:	f002 fe94 	bl	c0de861e <OUTLINED_FUNCTION_11>
c0de58f6:	6048      	str	r0, [r1, #4]
c0de58f8:	68a8      	ldr	r0, [r5, #8]
c0de58fa:	b3c0      	cbz	r0, c0de596e <nbgl_layoutAddUpFooter+0x5da>
c0de58fc:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5900:	f002 ff08 	bl	c0de8714 <OUTLINED_FUNCTION_21>
c0de5904:	4606      	mov	r6, r0
c0de5906:	2000      	movs	r0, #0
c0de5908:	7630      	strb	r0, [r6, #24]
c0de590a:	77f0      	strb	r0, [r6, #31]
c0de590c:	2006      	movs	r0, #6
c0de590e:	75f7      	strb	r7, [r6, #23]
c0de5910:	75b0      	strb	r0, [r6, #22]
c0de5912:	f003 f81d 	bl	c0de8950 <OUTLINED_FUNCTION_49>
c0de5916:	4631      	mov	r1, r6
c0de5918:	0e02      	lsrs	r2, r0, #24
c0de591a:	f003 f84b 	bl	c0de89b4 <OUTLINED_FUNCTION_56>
c0de591e:	6960      	ldr	r0, [r4, #20]
c0de5920:	f810 2f22 	ldrb.w	r2, [r0, #34]!
c0de5924:	7843      	ldrb	r3, [r0, #1]
c0de5926:	7887      	ldrb	r7, [r0, #2]
c0de5928:	78c0      	ldrb	r0, [r0, #3]
c0de592a:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de592e:	ea47 2000 	orr.w	r0, r7, r0, lsl #8
c0de5932:	ea42 4000 	orr.w	r0, r2, r0, lsl #16
c0de5936:	6086      	str	r6, [r0, #8]
c0de5938:	f896 0022 	ldrb.w	r0, [r6, #34]	@ 0x22
c0de593c:	780a      	ldrb	r2, [r1, #0]
c0de593e:	788b      	ldrb	r3, [r1, #2]
c0de5940:	78c9      	ldrb	r1, [r1, #3]
c0de5942:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de5946:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de594a:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de594e:	7881      	ldrb	r1, [r0, #2]
c0de5950:	78c0      	ldrb	r0, [r0, #3]
c0de5952:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
c0de5956:	6960      	ldr	r0, [r4, #20]
c0de5958:	7982      	ldrb	r2, [r0, #6]
c0de595a:	79c3      	ldrb	r3, [r0, #7]
c0de595c:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de5960:	428a      	cmp	r2, r1
c0de5962:	bf2f      	iteee	cs
c0de5964:	4611      	movcs	r1, r2
c0de5966:	7181      	strbcc	r1, [r0, #6]
c0de5968:	0a0a      	lsrcc	r2, r1, #8
c0de596a:	71c2      	strbcc	r2, [r0, #7]
c0de596c:	e004      	b.n	c0de5978 <nbgl_layoutAddUpFooter+0x5e4>
c0de596e:	6960      	ldr	r0, [r4, #20]
c0de5970:	7981      	ldrb	r1, [r0, #6]
c0de5972:	79c2      	ldrb	r2, [r0, #7]
c0de5974:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de5978:	3130      	adds	r1, #48	@ 0x30
c0de597a:	7181      	strb	r1, [r0, #6]
c0de597c:	0a09      	lsrs	r1, r1, #8
c0de597e:	71c1      	strb	r1, [r0, #7]
c0de5980:	f8d4 20a0 	ldr.w	r2, [r4, #160]	@ 0xa0
c0de5984:	6961      	ldr	r1, [r4, #20]
c0de5986:	68a0      	ldr	r0, [r4, #8]
c0de5988:	f812 3f06 	ldrb.w	r3, [r2, #6]!
c0de598c:	79cf      	ldrb	r7, [r1, #7]
c0de598e:	7856      	ldrb	r6, [r2, #1]
c0de5990:	ea43 2306 	orr.w	r3, r3, r6, lsl #8
c0de5994:	798e      	ldrb	r6, [r1, #6]
c0de5996:	ea46 2607 	orr.w	r6, r6, r7, lsl #8
c0de599a:	1b9b      	subs	r3, r3, r6
c0de599c:	7013      	strb	r3, [r2, #0]
c0de599e:	6101      	str	r1, [r0, #16]
c0de59a0:	0a1b      	lsrs	r3, r3, #8
c0de59a2:	6960      	ldr	r0, [r4, #20]
c0de59a4:	7053      	strb	r3, [r2, #1]
c0de59a6:	782a      	ldrb	r2, [r5, #0]
c0de59a8:	7981      	ldrb	r1, [r0, #6]
c0de59aa:	79c0      	ldrb	r0, [r0, #7]
c0de59ac:	f884 20ac 	strb.w	r2, [r4, #172]	@ 0xac
c0de59b0:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de59b4:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de59b8 <nbgl_layoutAddSwipe>:
c0de59b8:	b3d8      	cbz	r0, c0de5a32 <nbgl_layoutAddSwipe+0x7a>
c0de59ba:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de59be:	f8dd 8020 	ldr.w	r8, [sp, #32]
c0de59c2:	461c      	mov	r4, r3
c0de59c4:	4617      	mov	r7, r2
c0de59c6:	460d      	mov	r5, r1
c0de59c8:	4606      	mov	r6, r0
c0de59ca:	b342      	cbz	r2, c0de5a1e <nbgl_layoutAddSwipe+0x66>
c0de59cc:	2004      	movs	r0, #4
c0de59ce:	2100      	movs	r1, #0
c0de59d0:	f04f 0a00 	mov.w	sl, #0
c0de59d4:	f006 feb3 	bl	c0dec73e <nbgl_objPoolGet>
c0de59d8:	61b0      	str	r0, [r6, #24]
c0de59da:	4638      	mov	r0, r7
c0de59dc:	f007 f890 	bl	c0decb00 <pic>
c0de59e0:	69b1      	ldr	r1, [r6, #24]
c0de59e2:	f002 ff7c 	bl	c0de88de <OUTLINED_FUNCTION_41>
c0de59e6:	7048      	strb	r0, [r1, #1]
c0de59e8:	2001      	movs	r0, #1
c0de59ea:	22a0      	movs	r2, #160	@ 0xa0
c0de59ec:	f801 2c22 	strb.w	r2, [r1, #-34]
c0de59f0:	220b      	movs	r2, #11
c0de59f2:	f801 0c21 	strb.w	r0, [r1, #-33]
c0de59f6:	f801 0c07 	strb.w	r0, [r1, #-7]
c0de59fa:	200b      	movs	r0, #11
c0de59fc:	f801 2c04 	strb.w	r2, [r1, #-4]
c0de5a00:	f006 feb1 	bl	c0dec766 <nbgl_getFontLineHeight>
c0de5a04:	69b1      	ldr	r1, [r6, #24]
c0de5a06:	7188      	strb	r0, [r1, #6]
c0de5a08:	201e      	movs	r0, #30
c0de5a0a:	f881 a007 	strb.w	sl, [r1, #7]
c0de5a0e:	f881 a01a 	strb.w	sl, [r1, #26]
c0de5a12:	7648      	strb	r0, [r1, #25]
c0de5a14:	2005      	movs	r0, #5
c0de5a16:	f881 0020 	strb.w	r0, [r1, #32]
c0de5a1a:	2008      	movs	r0, #8
c0de5a1c:	7588      	strb	r0, [r1, #22]
c0de5a1e:	4630      	mov	r0, r6
c0de5a20:	4629      	mov	r1, r5
c0de5a22:	2201      	movs	r2, #1
c0de5a24:	4623      	mov	r3, r4
c0de5a26:	f8cd 8000 	str.w	r8, [sp]
c0de5a2a:	f000 f804 	bl	c0de5a36 <addSwipeInternal>
c0de5a2e:	e8bd 85f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}
c0de5a32:	f002 bf0f 	b.w	c0de8854 <OUTLINED_FUNCTION_35>

c0de5a36 <addSwipeInternal>:
c0de5a36:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de5a38:	f411 6ff0 	tst.w	r1, #1920	@ 0x780
c0de5a3c:	d013      	beq.n	c0de5a66 <addSwipeInternal+0x30>
c0de5a3e:	9f06      	ldr	r7, [sp, #24]
c0de5a40:	460c      	mov	r4, r1
c0de5a42:	f8d0 10a0 	ldr.w	r1, [r0, #160]	@ 0xa0
c0de5a46:	4615      	mov	r5, r2
c0de5a48:	461a      	mov	r2, r3
c0de5a4a:	4606      	mov	r6, r0
c0de5a4c:	463b      	mov	r3, r7
c0de5a4e:	f7ff fa23 	bl	c0de4e98 <layoutAddCallbackObj>
c0de5a52:	b140      	cbz	r0, c0de5a66 <addSwipeInternal+0x30>
c0de5a54:	f8d6 00a0 	ldr.w	r0, [r6, #160]	@ 0xa0
c0de5a58:	0a21      	lsrs	r1, r4, #8
c0de5a5a:	f886 50b0 	strb.w	r5, [r6, #176]	@ 0xb0
c0de5a5e:	7741      	strb	r1, [r0, #29]
c0de5a60:	7704      	strb	r4, [r0, #28]
c0de5a62:	2000      	movs	r0, #0
c0de5a64:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0de5a66:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de5a6a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}

c0de5a6c <nbgl_layoutAddTopRightButton>:
c0de5a6c:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de5a70:	b398      	cbz	r0, c0de5ada <nbgl_layoutAddTopRightButton+0x6e>
c0de5a72:	f003 f823 	bl	c0de8abc <OUTLINED_FUNCTION_79>
c0de5a76:	4688      	mov	r8, r1
c0de5a78:	461f      	mov	r7, r3
c0de5a7a:	4615      	mov	r5, r2
c0de5a7c:	f04f 0a05 	mov.w	sl, #5
c0de5a80:	f002 fe19 	bl	c0de86b6 <OUTLINED_FUNCTION_17>
c0de5a84:	4606      	mov	r6, r0
c0de5a86:	4620      	mov	r0, r4
c0de5a88:	462a      	mov	r2, r5
c0de5a8a:	463b      	mov	r3, r7
c0de5a8c:	f002 fe3f 	bl	c0de870e <OUTLINED_FUNCTION_20>
c0de5a90:	b318      	cbz	r0, c0de5ada <nbgl_layoutAddTopRightButton+0x6e>
c0de5a92:	2058      	movs	r0, #88	@ 0x58
c0de5a94:	2700      	movs	r7, #0
c0de5a96:	2503      	movs	r5, #3
c0de5a98:	f886 a01e 	strb.w	sl, [r6, #30]
c0de5a9c:	71b0      	strb	r0, [r6, #6]
c0de5a9e:	7130      	strb	r0, [r6, #4]
c0de5aa0:	2020      	movs	r0, #32
c0de5aa2:	71f7      	strb	r7, [r6, #7]
c0de5aa4:	7177      	strb	r7, [r6, #5]
c0de5aa6:	76b7      	strb	r7, [r6, #26]
c0de5aa8:	7637      	strb	r7, [r6, #24]
c0de5aaa:	7777      	strb	r7, [r6, #29]
c0de5aac:	f886 5022 	strb.w	r5, [r6, #34]	@ 0x22
c0de5ab0:	f886 7021 	strb.w	r7, [r6, #33]	@ 0x21
c0de5ab4:	77f5      	strb	r5, [r6, #31]
c0de5ab6:	7670      	strb	r0, [r6, #25]
c0de5ab8:	75f0      	strb	r0, [r6, #23]
c0de5aba:	2001      	movs	r0, #1
c0de5abc:	7730      	strb	r0, [r6, #28]
c0de5abe:	2002      	movs	r0, #2
c0de5ac0:	f886 0020 	strb.w	r0, [r6, #32]
c0de5ac4:	4640      	mov	r0, r8
c0de5ac6:	f007 f81b 	bl	c0decb00 <pic>
c0de5aca:	4631      	mov	r1, r6
c0de5acc:	0e02      	lsrs	r2, r0, #24
c0de5ace:	75b5      	strb	r5, [r6, #22]
c0de5ad0:	f002 fe8f 	bl	c0de87f2 <OUTLINED_FUNCTION_31>
c0de5ad4:	68a0      	ldr	r0, [r4, #8]
c0de5ad6:	6086      	str	r6, [r0, #8]
c0de5ad8:	e001      	b.n	c0de5ade <nbgl_layoutAddTopRightButton+0x72>
c0de5ada:	f04f 37ff 	mov.w	r7, #4294967295	@ 0xffffffff
c0de5ade:	4638      	mov	r0, r7
c0de5ae0:	e8bd 85f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}

c0de5ae4 <nbgl_layoutAddExtendedFooter>:
c0de5ae4:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de5ae8:	2800      	cmp	r0, #0
c0de5aea:	f000 834b 	beq.w	c0de6184 <nbgl_layoutAddExtendedFooter+0x6a0>
c0de5aee:	460d      	mov	r5, r1
c0de5af0:	b119      	cbz	r1, c0de5afa <nbgl_layoutAddExtendedFooter+0x16>
c0de5af2:	4604      	mov	r4, r0
c0de5af4:	7828      	ldrb	r0, [r5, #0]
c0de5af6:	2806      	cmp	r0, #6
c0de5af8:	d902      	bls.n	c0de5b00 <nbgl_layoutAddExtendedFooter+0x1c>
c0de5afa:	f06f 0701 	mvn.w	r7, #1
c0de5afe:	e343      	b.n	c0de6188 <nbgl_layoutAddExtendedFooter+0x6a4>
c0de5b00:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5b04:	2601      	movs	r6, #1
c0de5b06:	f002 fdd2 	bl	c0de86ae <OUTLINED_FUNCTION_16>
c0de5b0a:	2100      	movs	r1, #0
c0de5b0c:	7146      	strb	r6, [r0, #5]
c0de5b0e:	77c1      	strb	r1, [r0, #31]
c0de5b10:	21a0      	movs	r1, #160	@ 0xa0
c0de5b12:	7101      	strb	r1, [r0, #4]
c0de5b14:	6120      	str	r0, [r4, #16]
c0de5b16:	f002 ff7d 	bl	c0de8a14 <OUTLINED_FUNCTION_64>
c0de5b1a:	4601      	mov	r1, r0
c0de5b1c:	0a02      	lsrs	r2, r0, #8
c0de5b1e:	6920      	ldr	r0, [r4, #16]
c0de5b20:	0e0b      	lsrs	r3, r1, #24
c0de5b22:	f880 2023 	strb.w	r2, [r0, #35]	@ 0x23
c0de5b26:	2208      	movs	r2, #8
c0de5b28:	7582      	strb	r2, [r0, #22]
c0de5b2a:	4602      	mov	r2, r0
c0de5b2c:	f802 1f22 	strb.w	r1, [r2, #34]!
c0de5b30:	0c09      	lsrs	r1, r1, #16
c0de5b32:	7091      	strb	r1, [r2, #2]
c0de5b34:	70d3      	strb	r3, [r2, #3]
c0de5b36:	7829      	ldrb	r1, [r5, #0]
c0de5b38:	2906      	cmp	r1, #6
c0de5b3a:	d017      	beq.n	c0de5b6c <nbgl_layoutAddExtendedFooter+0x88>
c0de5b3c:	2901      	cmp	r1, #1
c0de5b3e:	f000 80be 	beq.w	c0de5cbe <nbgl_layoutAddExtendedFooter+0x1da>
c0de5b42:	2902      	cmp	r1, #2
c0de5b44:	f000 80f7 	beq.w	c0de5d36 <nbgl_layoutAddExtendedFooter+0x252>
c0de5b48:	2903      	cmp	r1, #3
c0de5b4a:	f000 8184 	beq.w	c0de5e56 <nbgl_layoutAddExtendedFooter+0x372>
c0de5b4e:	2904      	cmp	r1, #4
c0de5b50:	f000 8249 	beq.w	c0de5fe6 <nbgl_layoutAddExtendedFooter+0x502>
c0de5b54:	2905      	cmp	r1, #5
c0de5b56:	f000 8269 	beq.w	c0de602c <nbgl_layoutAddExtendedFooter+0x548>
c0de5b5a:	2900      	cmp	r1, #0
c0de5b5c:	d1cd      	bne.n	c0de5afa <nbgl_layoutAddExtendedFooter+0x16>
c0de5b5e:	88a9      	ldrh	r1, [r5, #4]
c0de5b60:	f04f 0800 	mov.w	r8, #0
c0de5b64:	7181      	strb	r1, [r0, #6]
c0de5b66:	0a09      	lsrs	r1, r1, #8
c0de5b68:	71c1      	strb	r1, [r0, #7]
c0de5b6a:	e2db      	b.n	c0de6124 <nbgl_layoutAddExtendedFooter+0x640>
c0de5b6c:	68a8      	ldr	r0, [r5, #8]
c0de5b6e:	2800      	cmp	r0, #0
c0de5b70:	f000 8308 	beq.w	c0de6184 <nbgl_layoutAddExtendedFooter+0x6a0>
c0de5b74:	6868      	ldr	r0, [r5, #4]
c0de5b76:	2800      	cmp	r0, #0
c0de5b78:	f000 8304 	beq.w	c0de6184 <nbgl_layoutAddExtendedFooter+0x6a0>
c0de5b7c:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5b80:	f002 fd99 	bl	c0de86b6 <OUTLINED_FUNCTION_17>
c0de5b84:	4606      	mov	r6, r0
c0de5b86:	7c2a      	ldrb	r2, [r5, #16]
c0de5b88:	7cab      	ldrb	r3, [r5, #18]
c0de5b8a:	f002 fcf5 	bl	c0de8578 <OUTLINED_FUNCTION_6>
c0de5b8e:	2800      	cmp	r0, #0
c0de5b90:	f000 82f8 	beq.w	c0de6184 <nbgl_layoutAddExtendedFooter+0x6a0>
c0de5b94:	2103      	movs	r1, #3
c0de5b96:	2208      	movs	r2, #8
c0de5b98:	f04f 0801 	mov.w	r8, #1
c0de5b9c:	f04f 0a00 	mov.w	sl, #0
c0de5ba0:	75b2      	strb	r2, [r6, #22]
c0de5ba2:	77f1      	strb	r1, [r6, #31]
c0de5ba4:	f880 8005 	strb.w	r8, [r0, #5]
c0de5ba8:	2258      	movs	r2, #88	@ 0x58
c0de5baa:	7c68      	ldrb	r0, [r5, #17]
c0de5bac:	71b2      	strb	r2, [r6, #6]
c0de5bae:	22a0      	movs	r2, #160	@ 0xa0
c0de5bb0:	f886 a021 	strb.w	sl, [r6, #33]	@ 0x21
c0de5bb4:	f886 a01a 	strb.w	sl, [r6, #26]
c0de5bb8:	f886 1022 	strb.w	r1, [r6, #34]	@ 0x22
c0de5bbc:	f886 a007 	strb.w	sl, [r6, #7]
c0de5bc0:	f886 8005 	strb.w	r8, [r6, #5]
c0de5bc4:	7132      	strb	r2, [r6, #4]
c0de5bc6:	2803      	cmp	r0, #3
c0de5bc8:	f04f 0004 	mov.w	r0, #4
c0de5bcc:	bf08      	it	eq
c0de5bce:	2102      	moveq	r1, #2
c0de5bd0:	f886 1020 	strb.w	r1, [r6, #32]
c0de5bd4:	bf08      	it	eq
c0de5bd6:	2018      	moveq	r0, #24
c0de5bd8:	7670      	strb	r0, [r6, #25]
c0de5bda:	f002 feb9 	bl	c0de8950 <OUTLINED_FUNCTION_49>
c0de5bde:	f002 fefb 	bl	c0de89d8 <OUTLINED_FUNCTION_58>
c0de5be2:	f002 fde5 	bl	c0de87b0 <OUTLINED_FUNCTION_28>
c0de5be6:	f002 fd6a 	bl	c0de86be <OUTLINED_FUNCTION_18>
c0de5bea:	f886 0023 	strb.w	r0, [r6, #35]	@ 0x23
c0de5bee:	200a      	movs	r0, #10
c0de5bf0:	77b0      	strb	r0, [r6, #30]
c0de5bf2:	6920      	ldr	r0, [r4, #16]
c0de5bf4:	f002 fc76 	bl	c0de84e4 <OUTLINED_FUNCTION_1>
c0de5bf8:	7c68      	ldrb	r0, [r5, #17]
c0de5bfa:	b1c0      	cbz	r0, c0de5c2e <nbgl_layoutAddExtendedFooter+0x14a>
c0de5bfc:	2803      	cmp	r0, #3
c0de5bfe:	d016      	beq.n	c0de5c2e <nbgl_layoutAddExtendedFooter+0x14a>
c0de5c00:	f002 fdb1 	bl	c0de8766 <OUTLINED_FUNCTION_25>
c0de5c04:	0a31      	lsrs	r1, r6, #8
c0de5c06:	0e32      	lsrs	r2, r6, #24
c0de5c08:	74c1      	strb	r1, [r0, #19]
c0de5c0a:	4601      	mov	r1, r0
c0de5c0c:	f801 6f12 	strb.w	r6, [r1, #18]!
c0de5c10:	70ca      	strb	r2, [r1, #3]
c0de5c12:	0c32      	lsrs	r2, r6, #16
c0de5c14:	708a      	strb	r2, [r1, #2]
c0de5c16:	6921      	ldr	r1, [r4, #16]
c0de5c18:	f002 fc91 	bl	c0de853e <OUTLINED_FUNCTION_4>
c0de5c1c:	2100      	movs	r1, #0
c0de5c1e:	7681      	strb	r1, [r0, #26]
c0de5c20:	2104      	movs	r1, #4
c0de5c22:	7641      	strb	r1, [r0, #25]
c0de5c24:	2102      	movs	r1, #2
c0de5c26:	7581      	strb	r1, [r0, #22]
c0de5c28:	6920      	ldr	r0, [r4, #16]
c0de5c2a:	f002 fc5b 	bl	c0de84e4 <OUTLINED_FUNCTION_1>
c0de5c2e:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5c32:	f002 fd40 	bl	c0de86b6 <OUTLINED_FUNCTION_17>
c0de5c36:	4606      	mov	r6, r0
c0de5c38:	7c2a      	ldrb	r2, [r5, #16]
c0de5c3a:	7cab      	ldrb	r3, [r5, #18]
c0de5c3c:	f002 fc9c 	bl	c0de8578 <OUTLINED_FUNCTION_6>
c0de5c40:	2800      	cmp	r0, #0
c0de5c42:	f000 829f 	beq.w	c0de6184 <nbgl_layoutAddExtendedFooter+0x6a0>
c0de5c46:	2118      	movs	r1, #24
c0de5c48:	f04f 0a00 	mov.w	sl, #0
c0de5c4c:	f04f 0801 	mov.w	r8, #1
c0de5c50:	7671      	strb	r1, [r6, #25]
c0de5c52:	2102      	movs	r1, #2
c0de5c54:	f886 a01a 	strb.w	sl, [r6, #26]
c0de5c58:	f880 a005 	strb.w	sl, [r0, #5]
c0de5c5c:	75b1      	strb	r1, [r6, #22]
c0de5c5e:	2103      	movs	r1, #3
c0de5c60:	7c68      	ldrb	r0, [r5, #17]
c0de5c62:	f886 1022 	strb.w	r1, [r6, #34]	@ 0x22
c0de5c66:	2158      	movs	r1, #88	@ 0x58
c0de5c68:	f886 8005 	strb.w	r8, [r6, #5]
c0de5c6c:	f886 a007 	strb.w	sl, [r6, #7]
c0de5c70:	71b1      	strb	r1, [r6, #6]
c0de5c72:	21a0      	movs	r1, #160	@ 0xa0
c0de5c74:	7131      	strb	r1, [r6, #4]
c0de5c76:	2100      	movs	r1, #0
c0de5c78:	2802      	cmp	r0, #2
c0de5c7a:	bf08      	it	eq
c0de5c7c:	2103      	moveq	r1, #3
c0de5c7e:	77f1      	strb	r1, [r6, #31]
c0de5c80:	1e81      	subs	r1, r0, #2
c0de5c82:	bf18      	it	ne
c0de5c84:	2103      	movne	r1, #3
c0de5c86:	3802      	subs	r0, #2
c0de5c88:	f886 1021 	strb.w	r1, [r6, #33]	@ 0x21
c0de5c8c:	fab0 f080 	clz	r0, r0
c0de5c90:	0940      	lsrs	r0, r0, #5
c0de5c92:	0040      	lsls	r0, r0, #1
c0de5c94:	f886 0020 	strb.w	r0, [r6, #32]
c0de5c98:	f002 fd52 	bl	c0de8740 <OUTLINED_FUNCTION_23>
c0de5c9c:	4631      	mov	r1, r6
c0de5c9e:	0e02      	lsrs	r2, r0, #24
c0de5ca0:	f801 0f25 	strb.w	r0, [r1, #37]!
c0de5ca4:	70ca      	strb	r2, [r1, #3]
c0de5ca6:	0c02      	lsrs	r2, r0, #16
c0de5ca8:	0a00      	lsrs	r0, r0, #8
c0de5caa:	708a      	strb	r2, [r1, #2]
c0de5cac:	7048      	strb	r0, [r1, #1]
c0de5cae:	7c68      	ldrb	r0, [r5, #17]
c0de5cb0:	2800      	cmp	r0, #0
c0de5cb2:	f000 8288 	beq.w	c0de61c6 <nbgl_layoutAddExtendedFooter+0x6e2>
c0de5cb6:	68e8      	ldr	r0, [r5, #12]
c0de5cb8:	f006 ff22 	bl	c0decb00 <pic>
c0de5cbc:	e284      	b.n	c0de61c8 <nbgl_layoutAddExtendedFooter+0x6e4>
c0de5cbe:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5cc2:	f002 fc0b 	bl	c0de84dc <OUTLINED_FUNCTION_0>
c0de5cc6:	4606      	mov	r6, r0
c0de5cc8:	7a6a      	ldrb	r2, [r5, #9]
c0de5cca:	7aab      	ldrb	r3, [r5, #10]
c0de5ccc:	f002 fc54 	bl	c0de8578 <OUTLINED_FUNCTION_6>
c0de5cd0:	2800      	cmp	r0, #0
c0de5cd2:	f000 8257 	beq.w	c0de6184 <nbgl_layoutAddExtendedFooter+0x6a0>
c0de5cd6:	2008      	movs	r0, #8
c0de5cd8:	4637      	mov	r7, r6
c0de5cda:	f04f 0a01 	mov.w	sl, #1
c0de5cde:	21a0      	movs	r1, #160	@ 0xa0
c0de5ce0:	f04f 0800 	mov.w	r8, #0
c0de5ce4:	75b0      	strb	r0, [r6, #22]
c0de5ce6:	7a28      	ldrb	r0, [r5, #8]
c0de5ce8:	f886 a005 	strb.w	sl, [r6, #5]
c0de5cec:	7131      	strb	r1, [r6, #4]
c0de5cee:	77f0      	strb	r0, [r6, #31]
c0de5cf0:	2060      	movs	r0, #96	@ 0x60
c0de5cf2:	f807 0f06 	strb.w	r0, [r7, #6]!
c0de5cf6:	f887 8001 	strb.w	r8, [r7, #1]
c0de5cfa:	f002 fd21 	bl	c0de8740 <OUTLINED_FUNCTION_23>
c0de5cfe:	4631      	mov	r1, r6
c0de5d00:	0e02      	lsrs	r2, r0, #24
c0de5d02:	f002 fcbd 	bl	c0de8680 <OUTLINED_FUNCTION_15>
c0de5d06:	7a29      	ldrb	r1, [r5, #8]
c0de5d08:	f886 801d 	strb.w	r8, [r6, #29]
c0de5d0c:	f886 a01e 	strb.w	sl, [r6, #30]
c0de5d10:	f840 602c 	str.w	r6, [r0, ip, lsl #2]
c0de5d14:	2005      	movs	r0, #5
c0de5d16:	f886 a01c 	strb.w	sl, [r6, #28]
c0de5d1a:	f886 0020 	strb.w	r0, [r6, #32]
c0de5d1e:	200b      	movs	r0, #11
c0de5d20:	2900      	cmp	r1, #0
c0de5d22:	bf08      	it	eq
c0de5d24:	200c      	moveq	r0, #12
c0de5d26:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de5d2a:	6922      	ldr	r2, [r4, #16]
c0de5d2c:	7879      	ldrb	r1, [r7, #1]
c0de5d2e:	7838      	ldrb	r0, [r7, #0]
c0de5d30:	f002 fe76 	bl	c0de8a20 <OUTLINED_FUNCTION_65>
c0de5d34:	e1f6      	b.n	c0de6124 <nbgl_layoutAddExtendedFooter+0x640>
c0de5d36:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5d3a:	f002 fbcf 	bl	c0de84dc <OUTLINED_FUNCTION_0>
c0de5d3e:	4606      	mov	r6, r0
c0de5d40:	7b2a      	ldrb	r2, [r5, #12]
c0de5d42:	7bab      	ldrb	r3, [r5, #14]
c0de5d44:	f002 fc18 	bl	c0de8578 <OUTLINED_FUNCTION_6>
c0de5d48:	2800      	cmp	r0, #0
c0de5d4a:	f000 821b 	beq.w	c0de6184 <nbgl_layoutAddExtendedFooter+0x6a0>
c0de5d4e:	2007      	movs	r0, #7
c0de5d50:	f04f 0a00 	mov.w	sl, #0
c0de5d54:	f04f 08d0 	mov.w	r8, #208	@ 0xd0
c0de5d58:	75b0      	strb	r0, [r6, #22]
c0de5d5a:	2060      	movs	r0, #96	@ 0x60
c0de5d5c:	f886 a01f 	strb.w	sl, [r6, #31]
c0de5d60:	f886 a007 	strb.w	sl, [r6, #7]
c0de5d64:	f886 a005 	strb.w	sl, [r6, #5]
c0de5d68:	f886 8004 	strb.w	r8, [r6, #4]
c0de5d6c:	71b0      	strb	r0, [r6, #6]
c0de5d6e:	f002 fce7 	bl	c0de8740 <OUTLINED_FUNCTION_23>
c0de5d72:	4631      	mov	r1, r6
c0de5d74:	0e02      	lsrs	r2, r0, #24
c0de5d76:	f04f 0b01 	mov.w	fp, #1
c0de5d7a:	f886 a01d 	strb.w	sl, [r6, #29]
c0de5d7e:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de5d82:	f886 b01e 	strb.w	fp, [r6, #30]
c0de5d86:	f002 fc54 	bl	c0de8632 <OUTLINED_FUNCTION_12>
c0de5d8a:	f002 fe2a 	bl	c0de89e2 <OUTLINED_FUNCTION_59>
c0de5d8e:	f886 0020 	strb.w	r0, [r6, #32]
c0de5d92:	6920      	ldr	r0, [r4, #16]
c0de5d94:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de5d98:	3101      	adds	r1, #1
c0de5d9a:	f880 1020 	strb.w	r1, [r0, #32]
c0de5d9e:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5da2:	f002 fb9b 	bl	c0de84dc <OUTLINED_FUNCTION_0>
c0de5da6:	4606      	mov	r6, r0
c0de5da8:	7b6a      	ldrb	r2, [r5, #13]
c0de5daa:	7bab      	ldrb	r3, [r5, #14]
c0de5dac:	f002 fbe4 	bl	c0de8578 <OUTLINED_FUNCTION_6>
c0de5db0:	f04f 37ff 	mov.w	r7, #4294967295	@ 0xffffffff
c0de5db4:	2800      	cmp	r0, #0
c0de5db6:	f000 81e7 	beq.w	c0de6188 <nbgl_layoutAddExtendedFooter+0x6a4>
c0de5dba:	2009      	movs	r0, #9
c0de5dbc:	f886 8004 	strb.w	r8, [r6, #4]
c0de5dc0:	46b0      	mov	r8, r6
c0de5dc2:	f886 a01f 	strb.w	sl, [r6, #31]
c0de5dc6:	f886 a005 	strb.w	sl, [r6, #5]
c0de5dca:	75b0      	strb	r0, [r6, #22]
c0de5dcc:	2060      	movs	r0, #96	@ 0x60
c0de5dce:	f808 0f06 	strb.w	r0, [r8, #6]!
c0de5dd2:	f888 a001 	strb.w	sl, [r8, #1]
c0de5dd6:	f002 fdbb 	bl	c0de8950 <OUTLINED_FUNCTION_49>
c0de5dda:	f002 fdfd 	bl	c0de89d8 <OUTLINED_FUNCTION_58>
c0de5dde:	f002 fc4f 	bl	c0de8680 <OUTLINED_FUNCTION_15>
c0de5de2:	f898 1001 	ldrb.w	r1, [r8, #1]
c0de5de6:	f840 602c 	str.w	r6, [r0, ip, lsl #2]
c0de5dea:	200c      	movs	r0, #12
c0de5dec:	f002 fdf9 	bl	c0de89e2 <OUTLINED_FUNCTION_59>
c0de5df0:	6922      	ldr	r2, [r4, #16]
c0de5df2:	f886 0020 	strb.w	r0, [r6, #32]
c0de5df6:	2003      	movs	r0, #3
c0de5df8:	77b0      	strb	r0, [r6, #30]
c0de5dfa:	f898 0000 	ldrb.w	r0, [r8]
c0de5dfe:	f002 fe0f 	bl	c0de8a20 <OUTLINED_FUNCTION_65>
c0de5e02:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5e06:	f002 fe01 	bl	c0de8a0c <OUTLINED_FUNCTION_63>
c0de5e0a:	4680      	mov	r8, r0
c0de5e0c:	f880 a005 	strb.w	sl, [r0, #5]
c0de5e10:	f880 b004 	strb.w	fp, [r0, #4]
c0de5e14:	20ff      	movs	r0, #255	@ 0xff
c0de5e16:	0e31      	lsrs	r1, r6, #24
c0de5e18:	f888 0018 	strb.w	r0, [r8, #24]
c0de5e1c:	0a30      	lsrs	r0, r6, #8
c0de5e1e:	f888 7017 	strb.w	r7, [r8, #23]
c0de5e22:	f888 b021 	strb.w	fp, [r8, #33]	@ 0x21
c0de5e26:	f888 a01f 	strb.w	sl, [r8, #31]
c0de5e2a:	f888 0013 	strb.w	r0, [r8, #19]
c0de5e2e:	2002      	movs	r0, #2
c0de5e30:	f888 0020 	strb.w	r0, [r8, #32]
c0de5e34:	2004      	movs	r0, #4
c0de5e36:	f888 0016 	strb.w	r0, [r8, #22]
c0de5e3a:	4640      	mov	r0, r8
c0de5e3c:	f800 6f12 	strb.w	r6, [r0, #18]!
c0de5e40:	70c1      	strb	r1, [r0, #3]
c0de5e42:	0c31      	lsrs	r1, r6, #16
c0de5e44:	7081      	strb	r1, [r0, #2]
c0de5e46:	6920      	ldr	r0, [r4, #16]
c0de5e48:	7981      	ldrb	r1, [r0, #6]
c0de5e4a:	79c0      	ldrb	r0, [r0, #7]
c0de5e4c:	f888 0007 	strb.w	r0, [r8, #7]
c0de5e50:	f888 1006 	strb.w	r1, [r8, #6]
c0de5e54:	e166      	b.n	c0de6124 <nbgl_layoutAddExtendedFooter+0x640>
c0de5e56:	f04f 0b00 	mov.w	fp, #0
c0de5e5a:	2760      	movs	r7, #96	@ 0x60
c0de5e5c:	f04f 0a01 	mov.w	sl, #1
c0de5e60:	21e0      	movs	r1, #224	@ 0xe0
c0de5e62:	f880 b007 	strb.w	fp, [r0, #7]
c0de5e66:	7187      	strb	r7, [r0, #6]
c0de5e68:	f880 a005 	strb.w	sl, [r0, #5]
c0de5e6c:	7101      	strb	r1, [r0, #4]
c0de5e6e:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5e72:	f002 fb33 	bl	c0de84dc <OUTLINED_FUNCTION_0>
c0de5e76:	4606      	mov	r6, r0
c0de5e78:	7d2a      	ldrb	r2, [r5, #20]
c0de5e7a:	7d6b      	ldrb	r3, [r5, #21]
c0de5e7c:	f002 fb7c 	bl	c0de8578 <OUTLINED_FUNCTION_6>
c0de5e80:	2800      	cmp	r0, #0
c0de5e82:	f000 817f 	beq.w	c0de6184 <nbgl_layoutAddExtendedFooter+0x6a0>
c0de5e86:	1d28      	adds	r0, r5, #4
c0de5e88:	46b0      	mov	r8, r6
c0de5e8a:	f886 b01f 	strb.w	fp, [r6, #31]
c0de5e8e:	f886 b007 	strb.w	fp, [r6, #7]
c0de5e92:	71b7      	strb	r7, [r6, #6]
c0de5e94:	9001      	str	r0, [sp, #4]
c0de5e96:	2007      	movs	r0, #7
c0de5e98:	75b0      	strb	r0, [r6, #22]
c0de5e9a:	20c0      	movs	r0, #192	@ 0xc0
c0de5e9c:	f808 0f04 	strb.w	r0, [r8, #4]!
c0de5ea0:	f888 b001 	strb.w	fp, [r8, #1]
c0de5ea4:	6928      	ldr	r0, [r5, #16]
c0de5ea6:	f006 fe2b 	bl	c0decb00 <pic>
c0de5eaa:	4631      	mov	r1, r6
c0de5eac:	0e02      	lsrs	r2, r0, #24
c0de5eae:	f886 a01e 	strb.w	sl, [r6, #30]
c0de5eb2:	f886 b01d 	strb.w	fp, [r6, #29]
c0de5eb6:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de5eba:	f002 fbba 	bl	c0de8632 <OUTLINED_FUNCTION_12>
c0de5ebe:	f886 a01c 	strb.w	sl, [r6, #28]
c0de5ec2:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de5ec6:	2005      	movs	r0, #5
c0de5ec8:	f886 0020 	strb.w	r0, [r6, #32]
c0de5ecc:	6920      	ldr	r0, [r4, #16]
c0de5ece:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de5ed2:	3101      	adds	r1, #1
c0de5ed4:	f880 1020 	strb.w	r1, [r0, #32]
c0de5ed8:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5edc:	f002 fbe7 	bl	c0de86ae <OUTLINED_FUNCTION_16>
c0de5ee0:	4682      	mov	sl, r0
c0de5ee2:	2004      	movs	r0, #4
c0de5ee4:	2101      	movs	r1, #1
c0de5ee6:	f88a 0020 	strb.w	r0, [sl, #32]
c0de5eea:	20a0      	movs	r0, #160	@ 0xa0
c0de5eec:	4656      	mov	r6, sl
c0de5eee:	f88a b01f 	strb.w	fp, [sl, #31]
c0de5ef2:	f806 0f04 	strb.w	r0, [r6, #4]!
c0de5ef6:	7071      	strb	r1, [r6, #1]
c0de5ef8:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5efc:	f002 fd82 	bl	c0de8a04 <OUTLINED_FUNCTION_62>
c0de5f00:	2109      	movs	r1, #9
c0de5f02:	0e02      	lsrs	r2, r0, #24
c0de5f04:	f88a b007 	strb.w	fp, [sl, #7]
c0de5f08:	f88a 1016 	strb.w	r1, [sl, #22]
c0de5f0c:	2160      	movs	r1, #96	@ 0x60
c0de5f0e:	f88a 1006 	strb.w	r1, [sl, #6]
c0de5f12:	4651      	mov	r1, sl
c0de5f14:	f801 0f22 	strb.w	r0, [r1, #34]!
c0de5f18:	f002 fd0e 	bl	c0de8938 <OUTLINED_FUNCTION_47>
c0de5f1c:	f88a 0023 	strb.w	r0, [sl, #35]	@ 0x23
c0de5f20:	f898 0000 	ldrb.w	r0, [r8]
c0de5f24:	f898 1001 	ldrb.w	r1, [r8, #1]
c0de5f28:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de5f2c:	9901      	ldr	r1, [sp, #4]
c0de5f2e:	f5c0 70f0 	rsb	r0, r0, #480	@ 0x1e0
c0de5f32:	7030      	strb	r0, [r6, #0]
c0de5f34:	0a00      	lsrs	r0, r0, #8
c0de5f36:	7070      	strb	r0, [r6, #1]
c0de5f38:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5f3c:	08c2      	lsrs	r2, r0, #3
c0de5f3e:	4650      	mov	r0, sl
c0de5f40:	f002 fe40 	bl	c0de8bc4 <layoutNavigationPopulate>
c0de5f44:	792a      	ldrb	r2, [r5, #4]
c0de5f46:	7b2b      	ldrb	r3, [r5, #12]
c0de5f48:	4620      	mov	r0, r4
c0de5f4a:	4651      	mov	r1, sl
c0de5f4c:	f7fe ffa4 	bl	c0de4e98 <layoutAddCallbackObj>
c0de5f50:	f04f 37ff 	mov.w	r7, #4294967295	@ 0xffffffff
c0de5f54:	2800      	cmp	r0, #0
c0de5f56:	f000 8117 	beq.w	c0de6188 <nbgl_layoutAddExtendedFooter+0x6a4>
c0de5f5a:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5f5e:	f002 fd55 	bl	c0de8a0c <OUTLINED_FUNCTION_63>
c0de5f62:	4680      	mov	r8, r0
c0de5f64:	2002      	movs	r0, #2
c0de5f66:	2101      	movs	r1, #1
c0de5f68:	f888 0020 	strb.w	r0, [r8, #32]
c0de5f6c:	2000      	movs	r0, #0
c0de5f6e:	f888 1004 	strb.w	r1, [r8, #4]
c0de5f72:	f888 1021 	strb.w	r1, [r8, #33]	@ 0x21
c0de5f76:	ea4f 611a 	mov.w	r1, sl, lsr #24
c0de5f7a:	f888 7017 	strb.w	r7, [r8, #23]
c0de5f7e:	f888 0005 	strb.w	r0, [r8, #5]
c0de5f82:	f888 001f 	strb.w	r0, [r8, #31]
c0de5f86:	2004      	movs	r0, #4
c0de5f88:	f888 0016 	strb.w	r0, [r8, #22]
c0de5f8c:	20ff      	movs	r0, #255	@ 0xff
c0de5f8e:	f888 0018 	strb.w	r0, [r8, #24]
c0de5f92:	ea4f 201a 	mov.w	r0, sl, lsr #8
c0de5f96:	f888 0013 	strb.w	r0, [r8, #19]
c0de5f9a:	4640      	mov	r0, r8
c0de5f9c:	f800 af12 	strb.w	sl, [r0, #18]!
c0de5fa0:	70c1      	strb	r1, [r0, #3]
c0de5fa2:	ea4f 411a 	mov.w	r1, sl, lsr #16
c0de5fa6:	7081      	strb	r1, [r0, #2]
c0de5fa8:	6920      	ldr	r0, [r4, #16]
c0de5faa:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de5fae:	f810 3c1b 	ldrb.w	r3, [r0, #-27]
c0de5fb2:	f810 2c1c 	ldrb.w	r2, [r0, #-28]
c0de5fb6:	7847      	ldrb	r7, [r0, #1]
c0de5fb8:	f810 6c02 	ldrb.w	r6, [r0, #-2]
c0de5fbc:	f888 3007 	strb.w	r3, [r8, #7]
c0de5fc0:	f888 2006 	strb.w	r2, [r8, #6]
c0de5fc4:	ea41 2107 	orr.w	r1, r1, r7, lsl #8
c0de5fc8:	79aa      	ldrb	r2, [r5, #6]
c0de5fca:	f884 20a9 	strb.w	r2, [r4, #169]	@ 0xa9
c0de5fce:	78c2      	ldrb	r2, [r0, #3]
c0de5fd0:	7880      	ldrb	r0, [r0, #2]
c0de5fd2:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de5fd6:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de5fda:	7969      	ldrb	r1, [r5, #5]
c0de5fdc:	f840 a026 	str.w	sl, [r0, r6, lsl #2]
c0de5fe0:	f884 10a8 	strb.w	r1, [r4, #168]	@ 0xa8
c0de5fe4:	e09b      	b.n	c0de611e <nbgl_layoutAddExtendedFooter+0x63a>
c0de5fe6:	2100      	movs	r1, #0
c0de5fe8:	71c1      	strb	r1, [r0, #7]
c0de5fea:	2160      	movs	r1, #96	@ 0x60
c0de5fec:	7181      	strb	r1, [r0, #6]
c0de5fee:	2101      	movs	r1, #1
c0de5ff0:	7141      	strb	r1, [r0, #5]
c0de5ff2:	21e0      	movs	r1, #224	@ 0xe0
c0de5ff4:	7101      	strb	r1, [r0, #4]
c0de5ff6:	1d29      	adds	r1, r5, #4
c0de5ff8:	f894 20ad 	ldrb.w	r2, [r4, #173]	@ 0xad
c0de5ffc:	08d2      	lsrs	r2, r2, #3
c0de5ffe:	f002 fde1 	bl	c0de8bc4 <layoutNavigationPopulate>
c0de6002:	6921      	ldr	r1, [r4, #16]
c0de6004:	2004      	movs	r0, #4
c0de6006:	f881 0020 	strb.w	r0, [r1, #32]
c0de600a:	4620      	mov	r0, r4
c0de600c:	792a      	ldrb	r2, [r5, #4]
c0de600e:	7b2b      	ldrb	r3, [r5, #12]
c0de6010:	f7fe ff42 	bl	c0de4e98 <layoutAddCallbackObj>
c0de6014:	2800      	cmp	r0, #0
c0de6016:	f000 80b5 	beq.w	c0de6184 <nbgl_layoutAddExtendedFooter+0x6a0>
c0de601a:	79a8      	ldrb	r0, [r5, #6]
c0de601c:	f04f 0800 	mov.w	r8, #0
c0de6020:	f884 00a9 	strb.w	r0, [r4, #169]	@ 0xa9
c0de6024:	7968      	ldrb	r0, [r5, #5]
c0de6026:	f884 00a8 	strb.w	r0, [r4, #168]	@ 0xa8
c0de602a:	e07b      	b.n	c0de6124 <nbgl_layoutAddExtendedFooter+0x640>
c0de602c:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de6030:	2605      	movs	r6, #5
c0de6032:	f002 fb40 	bl	c0de86b6 <OUTLINED_FUNCTION_17>
c0de6036:	4607      	mov	r7, r0
c0de6038:	7b2a      	ldrb	r2, [r5, #12]
c0de603a:	7c2b      	ldrb	r3, [r5, #16]
c0de603c:	4620      	mov	r0, r4
c0de603e:	4639      	mov	r1, r7
c0de6040:	f7fe ff2a 	bl	c0de4e98 <layoutAddCallbackObj>
c0de6044:	2800      	cmp	r0, #0
c0de6046:	f000 809d 	beq.w	c0de6184 <nbgl_layoutAddExtendedFooter+0x6a0>
c0de604a:	75be      	strb	r6, [r7, #22]
c0de604c:	2100      	movs	r1, #0
c0de604e:	f04f 0800 	mov.w	r8, #0
c0de6052:	7b68      	ldrb	r0, [r5, #13]
c0de6054:	2800      	cmp	r0, #0
c0de6056:	bf08      	it	eq
c0de6058:	2103      	moveq	r1, #3
c0de605a:	f887 1021 	strb.w	r1, [r7, #33]	@ 0x21
c0de605e:	bf18      	it	ne
c0de6060:	2003      	movne	r0, #3
c0de6062:	77f8      	strb	r0, [r7, #31]
c0de6064:	7b68      	ldrb	r0, [r5, #13]
c0de6066:	4601      	mov	r1, r0
c0de6068:	2800      	cmp	r0, #0
c0de606a:	bf18      	it	ne
c0de606c:	2101      	movne	r1, #1
c0de606e:	0049      	lsls	r1, r1, #1
c0de6070:	2802      	cmp	r0, #2
c0de6072:	bf08      	it	eq
c0de6074:	2103      	moveq	r1, #3
c0de6076:	f887 1020 	strb.w	r1, [r7, #32]
c0de607a:	f002 fb61 	bl	c0de8740 <OUTLINED_FUNCTION_23>
c0de607e:	463e      	mov	r6, r7
c0de6080:	210c      	movs	r1, #12
c0de6082:	f887 1023 	strb.w	r1, [r7, #35]	@ 0x23
c0de6086:	f806 0f25 	strb.w	r0, [r6, #37]!
c0de608a:	0e01      	lsrs	r1, r0, #24
c0de608c:	f002 fcaf 	bl	c0de89ee <OUTLINED_FUNCTION_60>
c0de6090:	f887 0026 	strb.w	r0, [r7, #38]	@ 0x26
c0de6094:	f002 fc5c 	bl	c0de8950 <OUTLINED_FUNCTION_49>
c0de6098:	2103      	movs	r1, #3
c0de609a:	0e02      	lsrs	r2, r0, #24
c0de609c:	f887 8007 	strb.w	r8, [r7, #7]
c0de60a0:	f887 1022 	strb.w	r1, [r7, #34]	@ 0x22
c0de60a4:	2158      	movs	r1, #88	@ 0x58
c0de60a6:	71b9      	strb	r1, [r7, #6]
c0de60a8:	4639      	mov	r1, r7
c0de60aa:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de60ae:	f002 fc43 	bl	c0de8938 <OUTLINED_FUNCTION_47>
c0de60b2:	f887 002f 	strb.w	r0, [r7, #47]	@ 0x2f
c0de60b6:	2188      	movs	r1, #136	@ 0x88
c0de60b8:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de60bc:	6920      	ldr	r0, [r4, #16]
c0de60be:	f880 8007 	strb.w	r8, [r0, #7]
c0de60c2:	7181      	strb	r1, [r0, #6]
c0de60c4:	6869      	ldr	r1, [r5, #4]
c0de60c6:	2900      	cmp	r1, #0
c0de60c8:	bf08      	it	eq
c0de60ca:	2258      	moveq	r2, #88	@ 0x58
c0de60cc:	713a      	strb	r2, [r7, #4]
c0de60ce:	f896 c000 	ldrb.w	ip, [r6]
c0de60d2:	f896 e002 	ldrb.w	lr, [r6, #2]
c0de60d6:	f896 a003 	ldrb.w	sl, [r6, #3]
c0de60da:	f887 801d 	strb.w	r8, [r7, #29]
c0de60de:	0a11      	lsrs	r1, r2, #8
c0de60e0:	7179      	strb	r1, [r7, #5]
c0de60e2:	f810 6f22 	ldrb.w	r6, [r0, #34]!
c0de60e6:	7842      	ldrb	r2, [r0, #1]
c0de60e8:	f810 1c02 	ldrb.w	r1, [r0, #-2]
c0de60ec:	7883      	ldrb	r3, [r0, #2]
c0de60ee:	78c0      	ldrb	r0, [r0, #3]
c0de60f0:	ea46 2202 	orr.w	r2, r6, r2, lsl #8
c0de60f4:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de60f8:	ea42 4000 	orr.w	r0, r2, r0, lsl #16
c0de60fc:	f897 2026 	ldrb.w	r2, [r7, #38]	@ 0x26
c0de6100:	f840 7021 	str.w	r7, [r0, r1, lsl #2]
c0de6104:	2001      	movs	r0, #1
c0de6106:	ea4e 210a 	orr.w	r1, lr, sl, lsl #8
c0de610a:	7738      	strb	r0, [r7, #28]
c0de610c:	ea4c 2002 	orr.w	r0, ip, r2, lsl #8
c0de6110:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de6114:	2107      	movs	r1, #7
c0de6116:	2800      	cmp	r0, #0
c0de6118:	bf08      	it	eq
c0de611a:	2101      	moveq	r1, #1
c0de611c:	77b9      	strb	r1, [r7, #30]
c0de611e:	6920      	ldr	r0, [r4, #16]
c0de6120:	f002 f9e0 	bl	c0de84e4 <OUTLINED_FUNCTION_1>
c0de6124:	7828      	ldrb	r0, [r5, #0]
c0de6126:	3803      	subs	r0, #3
c0de6128:	2801      	cmp	r0, #1
c0de612a:	d808      	bhi.n	c0de613e <nbgl_layoutAddExtendedFooter+0x65a>
c0de612c:	7b28      	ldrb	r0, [r5, #12]
c0de612e:	792b      	ldrb	r3, [r5, #4]
c0de6130:	f44f 61c0 	mov.w	r1, #1536	@ 0x600
c0de6134:	2200      	movs	r2, #0
c0de6136:	9000      	str	r0, [sp, #0]
c0de6138:	4620      	mov	r0, r4
c0de613a:	f7ff fc7c 	bl	c0de5a36 <addSwipeInternal>
c0de613e:	7868      	ldrb	r0, [r5, #1]
c0de6140:	b148      	cbz	r0, c0de6156 <nbgl_layoutAddExtendedFooter+0x672>
c0de6142:	f002 fb10 	bl	c0de8766 <OUTLINED_FUNCTION_25>
c0de6146:	6921      	ldr	r1, [r4, #16]
c0de6148:	f002 f9f9 	bl	c0de853e <OUTLINED_FUNCTION_4>
c0de614c:	2102      	movs	r1, #2
c0de614e:	7581      	strb	r1, [r0, #22]
c0de6150:	6920      	ldr	r0, [r4, #16]
c0de6152:	f002 f9c7 	bl	c0de84e4 <OUTLINED_FUNCTION_1>
c0de6156:	f1b8 0f00 	cmp.w	r8, #0
c0de615a:	d018      	beq.n	c0de618e <nbgl_layoutAddExtendedFooter+0x6aa>
c0de615c:	6920      	ldr	r0, [r4, #16]
c0de615e:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de6162:	7843      	ldrb	r3, [r0, #1]
c0de6164:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de6168:	7886      	ldrb	r6, [r0, #2]
c0de616a:	78c0      	ldrb	r0, [r0, #3]
c0de616c:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de6170:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
c0de6174:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de6178:	f840 8022 	str.w	r8, [r0, r2, lsl #2]
c0de617c:	6920      	ldr	r0, [r4, #16]
c0de617e:	f002 f9b1 	bl	c0de84e4 <OUTLINED_FUNCTION_1>
c0de6182:	e005      	b.n	c0de6190 <nbgl_layoutAddExtendedFooter+0x6ac>
c0de6184:	f04f 37ff 	mov.w	r7, #4294967295	@ 0xffffffff
c0de6188:	4638      	mov	r0, r7
c0de618a:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de618e:	6920      	ldr	r0, [r4, #16]
c0de6190:	68a1      	ldr	r1, [r4, #8]
c0de6192:	60c8      	str	r0, [r1, #12]
c0de6194:	6920      	ldr	r0, [r4, #16]
c0de6196:	f8d4 10a0 	ldr.w	r1, [r4, #160]	@ 0xa0
c0de619a:	f810 2f06 	ldrb.w	r2, [r0, #6]!
c0de619e:	7843      	ldrb	r3, [r0, #1]
c0de61a0:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de61a4:	f811 3f06 	ldrb.w	r3, [r1, #6]!
c0de61a8:	784e      	ldrb	r6, [r1, #1]
c0de61aa:	ea43 2306 	orr.w	r3, r3, r6, lsl #8
c0de61ae:	1a9a      	subs	r2, r3, r2
c0de61b0:	700a      	strb	r2, [r1, #0]
c0de61b2:	0a12      	lsrs	r2, r2, #8
c0de61b4:	704a      	strb	r2, [r1, #1]
c0de61b6:	7829      	ldrb	r1, [r5, #0]
c0de61b8:	f884 10ab 	strb.w	r1, [r4, #171]	@ 0xab
c0de61bc:	7801      	ldrb	r1, [r0, #0]
c0de61be:	7840      	ldrb	r0, [r0, #1]
c0de61c0:	ea41 2700 	orr.w	r7, r1, r0, lsl #8
c0de61c4:	e7e0      	b.n	c0de6188 <nbgl_layoutAddExtendedFooter+0x6a4>
c0de61c6:	2000      	movs	r0, #0
c0de61c8:	f002 fc06 	bl	c0de89d8 <OUTLINED_FUNCTION_58>
c0de61cc:	f002 fb11 	bl	c0de87f2 <OUTLINED_FUNCTION_31>
c0de61d0:	f002 fa75 	bl	c0de86be <OUTLINED_FUNCTION_18>
c0de61d4:	f04f 0800 	mov.w	r8, #0
c0de61d8:	f886 0023 	strb.w	r0, [r6, #35]	@ 0x23
c0de61dc:	2009      	movs	r0, #9
c0de61de:	77b0      	strb	r0, [r6, #30]
c0de61e0:	6920      	ldr	r0, [r4, #16]
c0de61e2:	f002 f97f 	bl	c0de84e4 <OUTLINED_FUNCTION_1>
c0de61e6:	7c69      	ldrb	r1, [r5, #17]
c0de61e8:	f880 8007 	strb.w	r8, [r0, #7]
c0de61ec:	2900      	cmp	r1, #0
c0de61ee:	bf0c      	ite	eq
c0de61f0:	21d0      	moveq	r1, #208	@ 0xd0
c0de61f2:	21e8      	movne	r1, #232	@ 0xe8
c0de61f4:	7181      	strb	r1, [r0, #6]
c0de61f6:	e795      	b.n	c0de6124 <nbgl_layoutAddExtendedFooter+0x640>

c0de61f8 <nbgl_layoutAddBottomButton>:
c0de61f8:	b570      	push	{r4, r5, r6, lr}
c0de61fa:	b086      	sub	sp, #24
c0de61fc:	4605      	mov	r5, r0
c0de61fe:	2005      	movs	r0, #5
c0de6200:	2600      	movs	r6, #0
c0de6202:	4614      	mov	r4, r2
c0de6204:	f88d 3001 	strb.w	r3, [sp, #1]
c0de6208:	f88d 0000 	strb.w	r0, [sp]
c0de620c:	4608      	mov	r0, r1
c0de620e:	f88d 600e 	strb.w	r6, [sp, #14]
c0de6212:	f006 fc75 	bl	c0decb00 <pic>
c0de6216:	9002      	str	r0, [sp, #8]
c0de6218:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de621a:	4669      	mov	r1, sp
c0de621c:	f88d 400c 	strb.w	r4, [sp, #12]
c0de6220:	9601      	str	r6, [sp, #4]
c0de6222:	f88d 0010 	strb.w	r0, [sp, #16]
c0de6226:	2001      	movs	r0, #1
c0de6228:	f88d 000d 	strb.w	r0, [sp, #13]
c0de622c:	4628      	mov	r0, r5
c0de622e:	f7ff fc59 	bl	c0de5ae4 <nbgl_layoutAddExtendedFooter>
c0de6232:	b006      	add	sp, #24
c0de6234:	bd70      	pop	{r4, r5, r6, pc}

c0de6236 <nbgl_layoutAddTouchableBar>:
c0de6236:	b5b0      	push	{r4, r5, r7, lr}
c0de6238:	b086      	sub	sp, #24
c0de623a:	b1e8      	cbz	r0, c0de6278 <nbgl_layoutAddTouchableBar+0x42>
c0de623c:	2200      	movs	r2, #0
c0de623e:	f88d 2000 	strb.w	r2, [sp]
c0de6242:	e891 003c 	ldmia.w	r1, {r2, r3, r4, r5}
c0de6246:	e9cd 3503 	strd	r3, r5, [sp, #12]
c0de624a:	e9cd 2401 	strd	r2, r4, [sp, #4]
c0de624e:	7c4a      	ldrb	r2, [r1, #17]
c0de6250:	f88d 2014 	strb.w	r2, [sp, #20]
c0de6254:	7d0a      	ldrb	r2, [r1, #20]
c0de6256:	f88d 2017 	strb.w	r2, [sp, #23]
c0de625a:	7c0a      	ldrb	r2, [r1, #16]
c0de625c:	7c89      	ldrb	r1, [r1, #18]
c0de625e:	f081 0101 	eor.w	r1, r1, #1
c0de6262:	f88d 2016 	strb.w	r2, [sp, #22]
c0de6266:	f88d 1015 	strb.w	r1, [sp, #21]
c0de626a:	4669      	mov	r1, sp
c0de626c:	f000 f808 	bl	c0de6280 <addListItem>
c0de6270:	b110      	cbz	r0, c0de6278 <nbgl_layoutAddTouchableBar+0x42>
c0de6272:	f002 fb9a 	bl	c0de89aa <OUTLINED_FUNCTION_55>
c0de6276:	e001      	b.n	c0de627c <nbgl_layoutAddTouchableBar+0x46>
c0de6278:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de627c:	b006      	add	sp, #24
c0de627e:	bdb0      	pop	{r4, r5, r7, pc}

c0de6280 <addListItem>:
c0de6280:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de6284:	4682      	mov	sl, r0
c0de6286:	7808      	ldrb	r0, [r1, #0]
c0de6288:	4688      	mov	r8, r1
c0de628a:	b110      	cbz	r0, c0de6292 <addListItem+0x12>
c0de628c:	f04f 0b00 	mov.w	fp, #0
c0de6290:	e006      	b.n	c0de62a0 <addListItem+0x20>
c0de6292:	f898 0015 	ldrb.w	r0, [r8, #21]
c0de6296:	fab0 f080 	clz	r0, r0
c0de629a:	0940      	lsrs	r0, r0, #5
c0de629c:	ea4f 0b40 	mov.w	fp, r0, lsl #1
c0de62a0:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de62a4:	2401      	movs	r4, #1
c0de62a6:	f002 fa02 	bl	c0de86ae <OUTLINED_FUNCTION_16>
c0de62aa:	4606      	mov	r6, r0
c0de62ac:	f898 2014 	ldrb.w	r2, [r8, #20]
c0de62b0:	f898 3017 	ldrb.w	r3, [r8, #23]
c0de62b4:	4650      	mov	r0, sl
c0de62b6:	f002 fa2a 	bl	c0de870e <OUTLINED_FUNCTION_20>
c0de62ba:	2500      	movs	r5, #0
c0de62bc:	2800      	cmp	r0, #0
c0de62be:	d075      	beq.n	c0de63ac <addListItem+0x12c>
c0de62c0:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de62c4:	f002 fb9e 	bl	c0de8a04 <OUTLINED_FUNCTION_62>
c0de62c8:	4631      	mov	r1, r6
c0de62ca:	0e02      	lsrs	r2, r0, #24
c0de62cc:	2364      	movs	r3, #100	@ 0x64
c0de62ce:	f801 0f22 	strb.w	r0, [r1, #34]!
c0de62d2:	f801 5d10 	strb.w	r5, [r1, #-16]!
c0de62d6:	74ca      	strb	r2, [r1, #19]
c0de62d8:	0c02      	lsrs	r2, r0, #16
c0de62da:	0a00      	lsrs	r0, r0, #8
c0de62dc:	f801 4c0d 	strb.w	r4, [r1, #-13]
c0de62e0:	f801 5c0b 	strb.w	r5, [r1, #-11]
c0de62e4:	7448      	strb	r0, [r1, #17]
c0de62e6:	20a0      	movs	r0, #160	@ 0xa0
c0de62e8:	748a      	strb	r2, [r1, #18]
c0de62ea:	f801 0c0e 	strb.w	r0, [r1, #-14]
c0de62ee:	f898 2016 	ldrb.w	r2, [r8, #22]
c0de62f2:	f898 0000 	ldrb.w	r0, [r8]
c0de62f6:	2a00      	cmp	r2, #0
c0de62f8:	bf08      	it	eq
c0de62fa:	235c      	moveq	r3, #92	@ 0x5c
c0de62fc:	f801 3c0c 	strb.w	r3, [r1, #-12]
c0de6300:	718d      	strb	r5, [r1, #6]
c0de6302:	70cd      	strb	r5, [r1, #3]
c0de6304:	708d      	strb	r5, [r1, #2]
c0de6306:	704d      	strb	r5, [r1, #1]
c0de6308:	738d      	strb	r5, [r1, #14]
c0de630a:	734c      	strb	r4, [r1, #13]
c0de630c:	710d      	strb	r5, [r1, #4]
c0de630e:	2220      	movs	r2, #32
c0de6310:	2801      	cmp	r0, #1
c0de6312:	714a      	strb	r2, [r1, #5]
c0de6314:	d004      	beq.n	c0de6320 <addListItem+0xa0>
c0de6316:	b980      	cbnz	r0, c0de633a <addListItem+0xba>
c0de6318:	f898 0015 	ldrb.w	r0, [r8, #21]
c0de631c:	2801      	cmp	r0, #1
c0de631e:	d10c      	bne.n	c0de633a <addListItem+0xba>
c0de6320:	48c4      	ldr	r0, [pc, #784]	@ (c0de6634 <addListItem+0x3b4>)
c0de6322:	f819 1000 	ldrb.w	r1, [r9, r0]
c0de6326:	1c4a      	adds	r2, r1, #1
c0de6328:	f809 2000 	strb.w	r2, [r9, r0]
c0de632c:	2000      	movs	r0, #0
c0de632e:	7770      	strb	r0, [r6, #29]
c0de6330:	2001      	movs	r0, #1
c0de6332:	7730      	strb	r0, [r6, #28]
c0de6334:	f101 0014 	add.w	r0, r1, #20
c0de6338:	77b0      	strb	r0, [r6, #30]
c0de633a:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de633e:	f002 f8cd 	bl	c0de84dc <OUTLINED_FUNCTION_0>
c0de6342:	4607      	mov	r7, r0
c0de6344:	f880 b01f 	strb.w	fp, [r0, #31]
c0de6348:	f8d8 000c 	ldr.w	r0, [r8, #12]
c0de634c:	f006 fbd8 	bl	c0decb00 <pic>
c0de6350:	2201      	movs	r2, #1
c0de6352:	2100      	movs	r1, #0
c0de6354:	f64f 74f0 	movw	r4, #65520	@ 0xfff0
c0de6358:	f887 2024 	strb.w	r2, [r7, #36]	@ 0x24
c0de635c:	220c      	movs	r2, #12
c0de635e:	f887 102d 	strb.w	r1, [r7, #45]	@ 0x2d
c0de6362:	f887 2022 	strb.w	r2, [r7, #34]	@ 0x22
c0de6366:	463a      	mov	r2, r7
c0de6368:	f802 1f2c 	strb.w	r1, [r2, #44]!
c0de636c:	70d1      	strb	r1, [r2, #3]
c0de636e:	7091      	strb	r1, [r2, #2]
c0de6370:	4639      	mov	r1, r7
c0de6372:	f002 fab4 	bl	c0de88de <OUTLINED_FUNCTION_41>
c0de6376:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de637a:	7931      	ldrb	r1, [r6, #4]
c0de637c:	7972      	ldrb	r2, [r6, #5]
c0de637e:	7139      	strb	r1, [r7, #4]
c0de6380:	717a      	strb	r2, [r7, #5]
c0de6382:	f8d8 0004 	ldr.w	r0, [r8, #4]
c0de6386:	b198      	cbz	r0, c0de63b0 <addListItem+0x130>
c0de6388:	f006 fbba 	bl	c0decb00 <pic>
c0de638c:	4639      	mov	r1, r7
c0de638e:	f811 2f04 	ldrb.w	r2, [r1, #4]!
c0de6392:	784b      	ldrb	r3, [r1, #1]
c0de6394:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de6398:	7803      	ldrb	r3, [r0, #0]
c0de639a:	7840      	ldrb	r0, [r0, #1]
c0de639c:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de63a0:	1a20      	subs	r0, r4, r0
c0de63a2:	4402      	add	r2, r0
c0de63a4:	0a10      	lsrs	r0, r2, #8
c0de63a6:	700a      	strb	r2, [r1, #0]
c0de63a8:	7048      	strb	r0, [r1, #1]
c0de63aa:	e003      	b.n	c0de63b4 <addListItem+0x134>
c0de63ac:	2000      	movs	r0, #0
c0de63ae:	e13e      	b.n	c0de662e <addListItem+0x3ae>
c0de63b0:	ea41 2202 	orr.w	r2, r1, r2, lsl #8
c0de63b4:	f8d8 0008 	ldr.w	r0, [r8, #8]
c0de63b8:	f8cd b00c 	str.w	fp, [sp, #12]
c0de63bc:	b160      	cbz	r0, c0de63d8 <addListItem+0x158>
c0de63be:	f006 fb9f 	bl	c0decb00 <pic>
c0de63c2:	7801      	ldrb	r1, [r0, #0]
c0de63c4:	7840      	ldrb	r0, [r0, #1]
c0de63c6:	797a      	ldrb	r2, [r7, #5]
c0de63c8:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de63cc:	7939      	ldrb	r1, [r7, #4]
c0de63ce:	1a20      	subs	r0, r4, r0
c0de63d0:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de63d4:	1842      	adds	r2, r0, r1
c0de63d6:	e004      	b.n	c0de63e2 <addListItem+0x162>
c0de63d8:	f898 0000 	ldrb.w	r0, [r8]
c0de63dc:	2801      	cmp	r0, #1
c0de63de:	d103      	bne.n	c0de63e8 <addListItem+0x168>
c0de63e0:	3a4c      	subs	r2, #76	@ 0x4c
c0de63e2:	0a10      	lsrs	r0, r2, #8
c0de63e4:	713a      	strb	r2, [r7, #4]
c0de63e6:	7178      	strb	r0, [r7, #5]
c0de63e8:	463c      	mov	r4, r7
c0de63ea:	f897 1027 	ldrb.w	r1, [r7, #39]	@ 0x27
c0de63ee:	f897 0022 	ldrb.w	r0, [r7, #34]	@ 0x22
c0de63f2:	f897 3024 	ldrb.w	r3, [r7, #36]	@ 0x24
c0de63f6:	b292      	uxth	r2, r2
c0de63f8:	f814 5f26 	ldrb.w	r5, [r4, #38]!
c0de63fc:	ea45 2101 	orr.w	r1, r5, r1, lsl #8
c0de6400:	78a5      	ldrb	r5, [r4, #2]
c0de6402:	78e4      	ldrb	r4, [r4, #3]
c0de6404:	ea45 2404 	orr.w	r4, r5, r4, lsl #8
c0de6408:	ea41 4104 	orr.w	r1, r1, r4, lsl #16
c0de640c:	f006 f9b0 	bl	c0dec770 <nbgl_getTextHeightInWidth>
c0de6410:	4683      	mov	fp, r0
c0de6412:	4630      	mov	r0, r6
c0de6414:	4634      	mov	r4, r6
c0de6416:	f002 fa3c 	bl	c0de8892 <OUTLINED_FUNCTION_38>
c0de641a:	f841 7022 	str.w	r7, [r1, r2, lsl #2]
c0de641e:	2100      	movs	r1, #0
c0de6420:	f887 b006 	strb.w	fp, [r7, #6]
c0de6424:	f887 1021 	strb.w	r1, [r7, #33]	@ 0x21
c0de6428:	2104      	movs	r1, #4
c0de642a:	f887 1020 	strb.w	r1, [r7, #32]
c0de642e:	75b9      	strb	r1, [r7, #22]
c0de6430:	ea4f 211b 	mov.w	r1, fp, lsr #8
c0de6434:	71f9      	strb	r1, [r7, #7]
c0de6436:	1c51      	adds	r1, r2, #1
c0de6438:	f800 1c02 	strb.w	r1, [r0, #-2]
c0de643c:	f1bb 0f28 	cmp.w	fp, #40	@ 0x28
c0de6440:	bf98      	it	ls
c0de6442:	f04f 0b28 	movls.w	fp, #40	@ 0x28
c0de6446:	f8d8 0004 	ldr.w	r0, [r8, #4]
c0de644a:	9402      	str	r4, [sp, #8]
c0de644c:	b358      	cbz	r0, c0de64a6 <addListItem+0x226>
c0de644e:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de6452:	f002 f95f 	bl	c0de8714 <OUTLINED_FUNCTION_21>
c0de6456:	4605      	mov	r5, r0
c0de6458:	9803      	ldr	r0, [sp, #12]
c0de645a:	77e8      	strb	r0, [r5, #31]
c0de645c:	f8d8 0004 	ldr.w	r0, [r8, #4]
c0de6460:	f006 fb4e 	bl	c0decb00 <pic>
c0de6464:	f002 f93f 	bl	c0de86e6 <OUTLINED_FUNCTION_19>
c0de6468:	4620      	mov	r0, r4
c0de646a:	f810 cf22 	ldrb.w	ip, [r0, #34]!
c0de646e:	7846      	ldrb	r6, [r0, #1]
c0de6470:	7884      	ldrb	r4, [r0, #2]
c0de6472:	78c2      	ldrb	r2, [r0, #3]
c0de6474:	f810 3c02 	ldrb.w	r3, [r0, #-2]
c0de6478:	ea4c 2606 	orr.w	r6, ip, r6, lsl #8
c0de647c:	ea44 2202 	orr.w	r2, r4, r2, lsl #8
c0de6480:	ea46 4202 	orr.w	r2, r6, r2, lsl #16
c0de6484:	f002 faf8 	bl	c0de8a78 <OUTLINED_FUNCTION_72>
c0de6488:	2204      	movs	r2, #4
c0de648a:	f002 f971 	bl	c0de8770 <OUTLINED_FUNCTION_26>
c0de648e:	7801      	ldrb	r1, [r0, #0]
c0de6490:	f002 f8ee 	bl	c0de8670 <OUTLINED_FUNCTION_14>
c0de6494:	3110      	adds	r1, #16
c0de6496:	75f9      	strb	r1, [r7, #23]
c0de6498:	0a09      	lsrs	r1, r1, #8
c0de649a:	7639      	strb	r1, [r7, #24]
c0de649c:	fa0f f18b 	sxth.w	r1, fp
c0de64a0:	4281      	cmp	r1, r0
c0de64a2:	bfd8      	it	le
c0de64a4:	4683      	movle	fp, r0
c0de64a6:	f8d8 0008 	ldr.w	r0, [r8, #8]
c0de64aa:	f8cd a004 	str.w	sl, [sp, #4]
c0de64ae:	b348      	cbz	r0, c0de6504 <addListItem+0x284>
c0de64b0:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de64b4:	f002 f92e 	bl	c0de8714 <OUTLINED_FUNCTION_21>
c0de64b8:	4605      	mov	r5, r0
c0de64ba:	9803      	ldr	r0, [sp, #12]
c0de64bc:	77e8      	strb	r0, [r5, #31]
c0de64be:	f8d8 0008 	ldr.w	r0, [r8, #8]
c0de64c2:	f006 fb1d 	bl	c0decb00 <pic>
c0de64c6:	f002 f90e 	bl	c0de86e6 <OUTLINED_FUNCTION_19>
c0de64ca:	9802      	ldr	r0, [sp, #8]
c0de64cc:	f810 cf22 	ldrb.w	ip, [r0, #34]!
c0de64d0:	7844      	ldrb	r4, [r0, #1]
c0de64d2:	7886      	ldrb	r6, [r0, #2]
c0de64d4:	78c2      	ldrb	r2, [r0, #3]
c0de64d6:	f810 3c02 	ldrb.w	r3, [r0, #-2]
c0de64da:	ea4c 2404 	orr.w	r4, ip, r4, lsl #8
c0de64de:	ea46 2202 	orr.w	r2, r6, r2, lsl #8
c0de64e2:	ea44 4202 	orr.w	r2, r4, r2, lsl #16
c0de64e6:	f002 fac7 	bl	c0de8a78 <OUTLINED_FUNCTION_72>
c0de64ea:	2206      	movs	r2, #6
c0de64ec:	f002 f940 	bl	c0de8770 <OUTLINED_FUNCTION_26>
c0de64f0:	7881      	ldrb	r1, [r0, #2]
c0de64f2:	78c0      	ldrb	r0, [r0, #3]
c0de64f4:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
c0de64f8:	fa0f f08b 	sxth.w	r0, fp
c0de64fc:	4288      	cmp	r0, r1
c0de64fe:	bfc8      	it	gt
c0de6500:	4659      	movgt	r1, fp
c0de6502:	e028      	b.n	c0de6556 <addListItem+0x2d6>
c0de6504:	f898 0000 	ldrb.w	r0, [r8]
c0de6508:	2801      	cmp	r0, #1
c0de650a:	d123      	bne.n	c0de6554 <addListItem+0x2d4>
c0de650c:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de6510:	f04f 0a06 	mov.w	sl, #6
c0de6514:	08c1      	lsrs	r1, r0, #3
c0de6516:	2006      	movs	r0, #6
c0de6518:	f006 f911 	bl	c0dec73e <nbgl_objPoolGet>
c0de651c:	0a39      	lsrs	r1, r7, #8
c0de651e:	0e3a      	lsrs	r2, r7, #24
c0de6520:	f880 a016 	strb.w	sl, [r0, #22]
c0de6524:	74c1      	strb	r1, [r0, #19]
c0de6526:	4601      	mov	r1, r0
c0de6528:	f002 fa92 	bl	c0de8a50 <OUTLINED_FUNCTION_69>
c0de652c:	9902      	ldr	r1, [sp, #8]
c0de652e:	f002 f977 	bl	c0de8820 <OUTLINED_FUNCTION_33>
c0de6532:	2410      	movs	r4, #16
c0de6534:	f842 0023 	str.w	r0, [r2, r3, lsl #2]
c0de6538:	2200      	movs	r2, #0
c0de653a:	75c4      	strb	r4, [r0, #23]
c0de653c:	2402      	movs	r4, #2
c0de653e:	7602      	strb	r2, [r0, #24]
c0de6540:	77c2      	strb	r2, [r0, #31]
c0de6542:	f898 2015 	ldrb.w	r2, [r8, #21]
c0de6546:	f880 4020 	strb.w	r4, [r0, #32]
c0de654a:	f880 2021 	strb.w	r2, [r0, #33]	@ 0x21
c0de654e:	1c58      	adds	r0, r3, #1
c0de6550:	f801 0c02 	strb.w	r0, [r1, #-2]
c0de6554:	4659      	mov	r1, fp
c0de6556:	f8d8 0010 	ldr.w	r0, [r8, #16]
c0de655a:	e9dd 5a01 	ldrd	r5, sl, [sp, #4]
c0de655e:	2800      	cmp	r0, #0
c0de6560:	d05c      	beq.n	c0de661c <addListItem+0x39c>
c0de6562:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de6566:	9100      	str	r1, [sp, #0]
c0de6568:	2604      	movs	r6, #4
c0de656a:	f001 ffb7 	bl	c0de84dc <OUTLINED_FUNCTION_0>
c0de656e:	4604      	mov	r4, r0
c0de6570:	9803      	ldr	r0, [sp, #12]
c0de6572:	77e0      	strb	r0, [r4, #31]
c0de6574:	f8d8 0010 	ldr.w	r0, [r8, #16]
c0de6578:	f006 fac2 	bl	c0decb00 <pic>
c0de657c:	4601      	mov	r1, r0
c0de657e:	200b      	movs	r0, #11
c0de6580:	2301      	movs	r3, #1
c0de6582:	f884 6020 	strb.w	r6, [r4, #32]
c0de6586:	75a6      	strb	r6, [r4, #22]
c0de6588:	f884 0022 	strb.w	r0, [r4, #34]	@ 0x22
c0de658c:	2001      	movs	r0, #1
c0de658e:	0e0a      	lsrs	r2, r1, #24
c0de6590:	f884 0024 	strb.w	r0, [r4, #36]	@ 0x24
c0de6594:	2000      	movs	r0, #0
c0de6596:	f884 0021 	strb.w	r0, [r4, #33]	@ 0x21
c0de659a:	4620      	mov	r0, r4
c0de659c:	f002 f861 	bl	c0de8662 <OUTLINED_FUNCTION_13>
c0de65a0:	f884 0027 	strb.w	r0, [r4, #39]	@ 0x27
c0de65a4:	f89a 2005 	ldrb.w	r2, [sl, #5]
c0de65a8:	f89a 0004 	ldrb.w	r0, [sl, #4]
c0de65ac:	7162      	strb	r2, [r4, #5]
c0de65ae:	7120      	strb	r0, [r4, #4]
c0de65b0:	ea40 2202 	orr.w	r2, r0, r2, lsl #8
c0de65b4:	f002 f9a3 	bl	c0de88fe <OUTLINED_FUNCTION_43>
c0de65b8:	4651      	mov	r1, sl
c0de65ba:	46ac      	mov	ip, r5
c0de65bc:	f811 bf22 	ldrb.w	fp, [r1, #34]!
c0de65c0:	f811 8d1c 	ldrb.w	r8, [r1, #-28]!
c0de65c4:	7f4d      	ldrb	r5, [r1, #29]
c0de65c6:	7fce      	ldrb	r6, [r1, #31]
c0de65c8:	7f8b      	ldrb	r3, [r1, #30]
c0de65ca:	7e8a      	ldrb	r2, [r1, #26]
c0de65cc:	f891 e001 	ldrb.w	lr, [r1, #1]
c0de65d0:	ea43 2306 	orr.w	r3, r3, r6, lsl #8
c0de65d4:	ea4b 2505 	orr.w	r5, fp, r5, lsl #8
c0de65d8:	ea45 4303 	orr.w	r3, r5, r3, lsl #16
c0de65dc:	2500      	movs	r5, #0
c0de65de:	f843 4022 	str.w	r4, [r3, r2, lsl #2]
c0de65e2:	f100 030c 	add.w	r3, r0, #12
c0de65e6:	3201      	adds	r2, #1
c0de65e8:	eba5 0353 	sub.w	r3, r5, r3, lsr #1
c0de65ec:	2502      	movs	r5, #2
c0de65ee:	767b      	strb	r3, [r7, #25]
c0de65f0:	0a1b      	lsrs	r3, r3, #8
c0de65f2:	76bb      	strb	r3, [r7, #26]
c0de65f4:	0a03      	lsrs	r3, r0, #8
c0de65f6:	71a0      	strb	r0, [r4, #6]
c0de65f8:	71e3      	strb	r3, [r4, #7]
c0de65fa:	9b00      	ldr	r3, [sp, #0]
c0de65fc:	b21b      	sxth	r3, r3
c0de65fe:	330c      	adds	r3, #12
c0de6600:	fb93 f3f5 	sdiv	r3, r3, r5
c0de6604:	7663      	strb	r3, [r4, #25]
c0de6606:	768a      	strb	r2, [r1, #26]
c0de6608:	ea48 220e 	orr.w	r2, r8, lr, lsl #8
c0de660c:	0a1d      	lsrs	r5, r3, #8
c0de660e:	4410      	add	r0, r2
c0de6610:	76a5      	strb	r5, [r4, #26]
c0de6612:	4665      	mov	r5, ip
c0de6614:	300c      	adds	r0, #12
c0de6616:	7008      	strb	r0, [r1, #0]
c0de6618:	0a00      	lsrs	r0, r0, #8
c0de661a:	7048      	strb	r0, [r1, #1]
c0de661c:	f8d5 00a0 	ldr.w	r0, [r5, #160]	@ 0xa0
c0de6620:	f002 f8b6 	bl	c0de8790 <OUTLINED_FUNCTION_27>
c0de6624:	f8d5 00a0 	ldr.w	r0, [r5, #160]	@ 0xa0
c0de6628:	f001 ff5c 	bl	c0de84e4 <OUTLINED_FUNCTION_1>
c0de662c:	4650      	mov	r0, sl
c0de662e:	b004      	add	sp, #16
c0de6630:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de6634:	000018e8 	.word	0x000018e8

c0de6638 <nbgl_layoutAddSwitch>:
c0de6638:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de663a:	b1d8      	cbz	r0, c0de6674 <nbgl_layoutAddSwitch+0x3c>
c0de663c:	2200      	movs	r2, #0
c0de663e:	e9cd 2201 	strd	r2, r2, [sp, #4]
c0de6642:	f88d 2016 	strb.w	r2, [sp, #22]
c0de6646:	2201      	movs	r2, #1
c0de6648:	f88d 2000 	strb.w	r2, [sp]
c0de664c:	e9d1 2300 	ldrd	r2, r3, [r1]
c0de6650:	e9cd 2303 	strd	r2, r3, [sp, #12]
c0de6654:	7a4a      	ldrb	r2, [r1, #9]
c0de6656:	f88d 2014 	strb.w	r2, [sp, #20]
c0de665a:	7a8a      	ldrb	r2, [r1, #10]
c0de665c:	7a09      	ldrb	r1, [r1, #8]
c0de665e:	f88d 1015 	strb.w	r1, [sp, #21]
c0de6662:	4669      	mov	r1, sp
c0de6664:	f88d 2017 	strb.w	r2, [sp, #23]
c0de6668:	f7ff fe0a 	bl	c0de6280 <addListItem>
c0de666c:	b110      	cbz	r0, c0de6674 <nbgl_layoutAddSwitch+0x3c>
c0de666e:	f002 f99c 	bl	c0de89aa <OUTLINED_FUNCTION_55>
c0de6672:	e001      	b.n	c0de6678 <nbgl_layoutAddSwitch+0x40>
c0de6674:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de6678:	b006      	add	sp, #24
c0de667a:	bd80      	pop	{r7, pc}

c0de667c <nbgl_layoutAddText>:
c0de667c:	b5e0      	push	{r5, r6, r7, lr}
c0de667e:	2300      	movs	r3, #0
c0de6680:	e9cd 3300 	strd	r3, r3, [sp]
c0de6684:	2300      	movs	r3, #0
c0de6686:	f000 f801 	bl	c0de668c <addText>
c0de668a:	bd8c      	pop	{r2, r3, r7, pc}

c0de668c <addText>:
c0de668c:	2800      	cmp	r0, #0
c0de668e:	f000 8115 	beq.w	c0de68bc <addText+0x230>
c0de6692:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de6696:	4683      	mov	fp, r0
c0de6698:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de669c:	460c      	mov	r4, r1
c0de669e:	9e0d      	ldr	r6, [sp, #52]	@ 0x34
c0de66a0:	461f      	mov	r7, r3
c0de66a2:	9203      	str	r2, [sp, #12]
c0de66a4:	f04f 0a01 	mov.w	sl, #1
c0de66a8:	f002 f801 	bl	c0de86ae <OUTLINED_FUNCTION_16>
c0de66ac:	4605      	mov	r5, r0
c0de66ae:	2002      	movs	r0, #2
c0de66b0:	2e00      	cmp	r6, #0
c0de66b2:	bf18      	it	ne
c0de66b4:	2003      	movne	r0, #3
c0de66b6:	f89b 10ad 	ldrb.w	r1, [fp, #173]	@ 0xad
c0de66ba:	f002 f9eb 	bl	c0de8a94 <OUTLINED_FUNCTION_74>
c0de66be:	21a0      	movs	r1, #160	@ 0xa0
c0de66c0:	0e02      	lsrs	r2, r0, #24
c0de66c2:	f04f 0800 	mov.w	r8, #0
c0de66c6:	f885 a005 	strb.w	sl, [r5, #5]
c0de66ca:	7129      	strb	r1, [r5, #4]
c0de66cc:	4629      	mov	r1, r5
c0de66ce:	f801 0f22 	strb.w	r0, [r1, #34]!
c0de66d2:	70ca      	strb	r2, [r1, #3]
c0de66d4:	0c02      	lsrs	r2, r0, #16
c0de66d6:	0a00      	lsrs	r0, r0, #8
c0de66d8:	2c00      	cmp	r4, #0
c0de66da:	708a      	strb	r2, [r1, #2]
c0de66dc:	f885 0023 	strb.w	r0, [r5, #35]	@ 0x23
c0de66e0:	f000 809f 	beq.w	c0de6822 <addText+0x196>
c0de66e4:	f89b 00ad 	ldrb.w	r0, [fp, #173]	@ 0xad
c0de66e8:	9701      	str	r7, [sp, #4]
c0de66ea:	2604      	movs	r6, #4
c0de66ec:	f001 fef6 	bl	c0de84dc <OUTLINED_FUNCTION_0>
c0de66f0:	4607      	mov	r7, r0
c0de66f2:	f880 801f 	strb.w	r8, [r0, #31]
c0de66f6:	4620      	mov	r0, r4
c0de66f8:	9402      	str	r4, [sp, #8]
c0de66fa:	f006 fa01 	bl	c0decb00 <pic>
c0de66fe:	4601      	mov	r1, r0
c0de6700:	201c      	movs	r0, #28
c0de6702:	9b0d      	ldr	r3, [sp, #52]	@ 0x34
c0de6704:	f887 a024 	strb.w	sl, [r7, #36]	@ 0x24
c0de6708:	f887 801a 	strb.w	r8, [r7, #26]
c0de670c:	f887 6020 	strb.w	r6, [r7, #32]
c0de6710:	f887 8021 	strb.w	r8, [r7, #33]	@ 0x21
c0de6714:	f887 8016 	strb.w	r8, [r7, #22]
c0de6718:	7678      	strb	r0, [r7, #25]
c0de671a:	200c      	movs	r0, #12
c0de671c:	0e0a      	lsrs	r2, r1, #24
c0de671e:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de6722:	4638      	mov	r0, r7
c0de6724:	469a      	mov	sl, r3
c0de6726:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de672a:	f002 f8f7 	bl	c0de891c <OUTLINED_FUNCTION_45>
c0de672e:	796a      	ldrb	r2, [r5, #5]
c0de6730:	7928      	ldrb	r0, [r5, #4]
c0de6732:	7138      	strb	r0, [r7, #4]
c0de6734:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de6738:	717a      	strb	r2, [r7, #5]
c0de673a:	b153      	cbz	r3, c0de6752 <addText+0xc6>
c0de673c:	4a71      	ldr	r2, [pc, #452]	@ (c0de6904 <addText+0x278>)
c0de673e:	447a      	add	r2, pc
c0de6740:	7813      	ldrb	r3, [r2, #0]
c0de6742:	7852      	ldrb	r2, [r2, #1]
c0de6744:	ea43 2202 	orr.w	r2, r3, r2, lsl #8
c0de6748:	1a80      	subs	r0, r0, r2
c0de674a:	380c      	subs	r0, #12
c0de674c:	0a02      	lsrs	r2, r0, #8
c0de674e:	7138      	strb	r0, [r7, #4]
c0de6750:	717a      	strb	r2, [r7, #5]
c0de6752:	b282      	uxth	r2, r0
c0de6754:	200c      	movs	r0, #12
c0de6756:	2301      	movs	r3, #1
c0de6758:	f006 f80a 	bl	c0dec770 <nbgl_getTextHeightInWidth>
c0de675c:	4629      	mov	r1, r5
c0de675e:	f811 cf22 	ldrb.w	ip, [r1, #34]!
c0de6762:	784e      	ldrb	r6, [r1, #1]
c0de6764:	788c      	ldrb	r4, [r1, #2]
c0de6766:	78ca      	ldrb	r2, [r1, #3]
c0de6768:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de676c:	ea4c 2606 	orr.w	r6, ip, r6, lsl #8
c0de6770:	ea44 2202 	orr.w	r2, r4, r2, lsl #8
c0de6774:	ea46 4202 	orr.w	r2, r6, r2, lsl #16
c0de6778:	f842 7023 	str.w	r7, [r2, r3, lsl #2]
c0de677c:	0a02      	lsrs	r2, r0, #8
c0de677e:	71b8      	strb	r0, [r7, #6]
c0de6780:	71fa      	strb	r2, [r7, #7]
c0de6782:	1c5a      	adds	r2, r3, #1
c0de6784:	f801 2c02 	strb.w	r2, [r1, #-2]
c0de6788:	7e79      	ldrb	r1, [r7, #25]
c0de678a:	7eba      	ldrb	r2, [r7, #26]
c0de678c:	f1ba 0f00 	cmp.w	sl, #0
c0de6790:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de6794:	eb01 0800 	add.w	r8, r1, r0
c0de6798:	d042      	beq.n	c0de6820 <addText+0x194>
c0de679a:	f89b 00ad 	ldrb.w	r0, [fp, #173]	@ 0xad
c0de679e:	f8dd a030 	ldr.w	sl, [sp, #48]	@ 0x30
c0de67a2:	f001 ffb7 	bl	c0de8714 <OUTLINED_FUNCTION_21>
c0de67a6:	9a01      	ldr	r2, [sp, #4]
c0de67a8:	4606      	mov	r6, r0
c0de67aa:	4658      	mov	r0, fp
c0de67ac:	4629      	mov	r1, r5
c0de67ae:	2309      	movs	r3, #9
c0de67b0:	f7fe fb72 	bl	c0de4e98 <layoutAddCallbackObj>
c0de67b4:	4954      	ldr	r1, [pc, #336]	@ (c0de6908 <addText+0x27c>)
c0de67b6:	4479      	add	r1, pc
c0de67b8:	0a0a      	lsrs	r2, r1, #8
c0de67ba:	0e0b      	lsrs	r3, r1, #24
c0de67bc:	f886 2022 	strb.w	r2, [r6, #34]	@ 0x22
c0de67c0:	0a3a      	lsrs	r2, r7, #8
c0de67c2:	74f2      	strb	r2, [r6, #19]
c0de67c4:	4632      	mov	r2, r6
c0de67c6:	f802 1f21 	strb.w	r1, [r2, #33]!
c0de67ca:	0c09      	lsrs	r1, r1, #16
c0de67cc:	7091      	strb	r1, [r2, #2]
c0de67ce:	4631      	mov	r1, r6
c0de67d0:	70d3      	strb	r3, [r2, #3]
c0de67d2:	0e3a      	lsrs	r2, r7, #24
c0de67d4:	f002 f93c 	bl	c0de8a50 <OUTLINED_FUNCTION_69>
c0de67d8:	4629      	mov	r1, r5
c0de67da:	f811 cf22 	ldrb.w	ip, [r1, #34]!
c0de67de:	784c      	ldrb	r4, [r1, #1]
c0de67e0:	788f      	ldrb	r7, [r1, #2]
c0de67e2:	78ca      	ldrb	r2, [r1, #3]
c0de67e4:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de67e8:	ea4c 2404 	orr.w	r4, ip, r4, lsl #8
c0de67ec:	ea47 2202 	orr.w	r2, r7, r2, lsl #8
c0de67f0:	ea44 4202 	orr.w	r2, r4, r2, lsl #16
c0de67f4:	240c      	movs	r4, #12
c0de67f6:	f842 6023 	str.w	r6, [r2, r3, lsl #2]
c0de67fa:	2200      	movs	r2, #0
c0de67fc:	75f4      	strb	r4, [r6, #23]
c0de67fe:	f880 a005 	strb.w	sl, [r0, #5]
c0de6802:	2001      	movs	r0, #1
c0de6804:	75b4      	strb	r4, [r6, #22]
c0de6806:	7632      	strb	r2, [r6, #24]
c0de6808:	77f2      	strb	r2, [r6, #31]
c0de680a:	f801 0c06 	strb.w	r0, [r1, #-6]
c0de680e:	f10a 000f 	add.w	r0, sl, #15
c0de6812:	f801 2c05 	strb.w	r2, [r1, #-5]
c0de6816:	f801 0c04 	strb.w	r0, [r1, #-4]
c0de681a:	1c58      	adds	r0, r3, #1
c0de681c:	f801 0c02 	strb.w	r0, [r1, #-2]
c0de6820:	9c02      	ldr	r4, [sp, #8]
c0de6822:	9e03      	ldr	r6, [sp, #12]
c0de6824:	2e00      	cmp	r6, #0
c0de6826:	d04b      	beq.n	c0de68c0 <addText+0x234>
c0de6828:	f89b 00ad 	ldrb.w	r0, [fp, #173]	@ 0xad
c0de682c:	f001 fe56 	bl	c0de84dc <OUTLINED_FUNCTION_0>
c0de6830:	f04f 0a00 	mov.w	sl, #0
c0de6834:	4607      	mov	r7, r0
c0de6836:	f880 a01f 	strb.w	sl, [r0, #31]
c0de683a:	f002 f906 	bl	c0de8a4a <OUTLINED_FUNCTION_68>
c0de683e:	4601      	mov	r1, r0
c0de6840:	200b      	movs	r0, #11
c0de6842:	2301      	movs	r3, #1
c0de6844:	f887 a021 	strb.w	sl, [r7, #33]	@ 0x21
c0de6848:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de684c:	2001      	movs	r0, #1
c0de684e:	0e0a      	lsrs	r2, r1, #24
c0de6850:	f887 0024 	strb.w	r0, [r7, #36]	@ 0x24
c0de6854:	4638      	mov	r0, r7
c0de6856:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de685a:	f002 f85f 	bl	c0de891c <OUTLINED_FUNCTION_45>
c0de685e:	796a      	ldrb	r2, [r5, #5]
c0de6860:	7928      	ldrb	r0, [r5, #4]
c0de6862:	717a      	strb	r2, [r7, #5]
c0de6864:	7138      	strb	r0, [r7, #4]
c0de6866:	ea40 2202 	orr.w	r2, r0, r2, lsl #8
c0de686a:	f002 f848 	bl	c0de88fe <OUTLINED_FUNCTION_43>
c0de686e:	210e      	movs	r1, #14
c0de6870:	f887 a01a 	strb.w	sl, [r7, #26]
c0de6874:	462a      	mov	r2, r5
c0de6876:	2c00      	cmp	r4, #0
c0de6878:	bf08      	it	eq
c0de687a:	211a      	moveq	r1, #26
c0de687c:	7679      	strb	r1, [r7, #25]
c0de687e:	f887 a016 	strb.w	sl, [r7, #22]
c0de6882:	f812 cf22 	ldrb.w	ip, [r2, #34]!
c0de6886:	7856      	ldrb	r6, [r2, #1]
c0de6888:	f892 e002 	ldrb.w	lr, [r2, #2]
c0de688c:	78d3      	ldrb	r3, [r2, #3]
c0de688e:	f812 4c02 	ldrb.w	r4, [r2, #-2]
c0de6892:	ea4c 2606 	orr.w	r6, ip, r6, lsl #8
c0de6896:	ea4e 2303 	orr.w	r3, lr, r3, lsl #8
c0de689a:	ea46 4303 	orr.w	r3, r6, r3, lsl #16
c0de689e:	f843 7024 	str.w	r7, [r3, r4, lsl #2]
c0de68a2:	2304      	movs	r3, #4
c0de68a4:	71b8      	strb	r0, [r7, #6]
c0de68a6:	f887 3020 	strb.w	r3, [r7, #32]
c0de68aa:	0a03      	lsrs	r3, r0, #8
c0de68ac:	4440      	add	r0, r8
c0de68ae:	4408      	add	r0, r1
c0de68b0:	71fb      	strb	r3, [r7, #7]
c0de68b2:	1c63      	adds	r3, r4, #1
c0de68b4:	f802 3c02 	strb.w	r3, [r2, #-2]
c0de68b8:	301a      	adds	r0, #26
c0de68ba:	e003      	b.n	c0de68c4 <addText+0x238>
c0de68bc:	f001 bfca 	b.w	c0de8854 <OUTLINED_FUNCTION_35>
c0de68c0:	f108 001c 	add.w	r0, r8, #28
c0de68c4:	f8db 10a0 	ldr.w	r1, [fp, #160]	@ 0xa0
c0de68c8:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de68cc:	784c      	ldrb	r4, [r1, #1]
c0de68ce:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de68d2:	788e      	ldrb	r6, [r1, #2]
c0de68d4:	78c9      	ldrb	r1, [r1, #3]
c0de68d6:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de68da:	ea46 2101 	orr.w	r1, r6, r1, lsl #8
c0de68de:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de68e2:	2220      	movs	r2, #32
c0de68e4:	f841 5023 	str.w	r5, [r1, r3, lsl #2]
c0de68e8:	2100      	movs	r1, #0
c0de68ea:	71a8      	strb	r0, [r5, #6]
c0de68ec:	75ea      	strb	r2, [r5, #23]
c0de68ee:	7629      	strb	r1, [r5, #24]
c0de68f0:	77e9      	strb	r1, [r5, #31]
c0de68f2:	75a9      	strb	r1, [r5, #22]
c0de68f4:	0a01      	lsrs	r1, r0, #8
c0de68f6:	b280      	uxth	r0, r0
c0de68f8:	71e9      	strb	r1, [r5, #7]
c0de68fa:	f8db 10a0 	ldr.w	r1, [fp, #160]	@ 0xa0
c0de68fe:	f002 b84c 	b.w	c0de899a <OUTLINED_FUNCTION_54>
c0de6902:	bf00      	nop
c0de6904:	000077d2 	.word	0x000077d2
c0de6908:	00007495 	.word	0x00007495

c0de690c <nbgl_layoutAddTextWithAlias>:
c0de690c:	b51c      	push	{r2, r3, r4, lr}
c0de690e:	2401      	movs	r4, #1
c0de6910:	9401      	str	r4, [sp, #4]
c0de6912:	9c04      	ldr	r4, [sp, #16]
c0de6914:	9400      	str	r4, [sp, #0]
c0de6916:	f7ff feb9 	bl	c0de668c <addText>
c0de691a:	bd1c      	pop	{r2, r3, r4, pc}

c0de691c <nbgl_layoutAddTextContent>:
c0de691c:	2800      	cmp	r0, #0
c0de691e:	f000 80b5 	beq.w	c0de6a8c <nbgl_layoutAddTextContent+0x170>
c0de6922:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de6926:	4682      	mov	sl, r0
c0de6928:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de692c:	4e58      	ldr	r6, [pc, #352]	@ (c0de6a90 <nbgl_layoutAddTextContent+0x174>)
c0de692e:	460d      	mov	r5, r1
c0de6930:	e9cd 2302 	strd	r2, r3, [sp, #8]
c0de6934:	08c1      	lsrs	r1, r0, #3
c0de6936:	447e      	add	r6, pc
c0de6938:	2004      	movs	r0, #4
c0de693a:	47b0      	blx	r6
c0de693c:	f04f 0b00 	mov.w	fp, #0
c0de6940:	4607      	mov	r7, r0
c0de6942:	f880 b01f 	strb.w	fp, [r0, #31]
c0de6946:	4628      	mov	r0, r5
c0de6948:	4c52      	ldr	r4, [pc, #328]	@ (c0de6a94 <nbgl_layoutAddTextContent+0x178>)
c0de694a:	447c      	add	r4, pc
c0de694c:	47a0      	blx	r4
c0de694e:	4601      	mov	r1, r0
c0de6950:	2010      	movs	r0, #16
c0de6952:	2201      	movs	r2, #1
c0de6954:	9401      	str	r4, [sp, #4]
c0de6956:	f887 b01a 	strb.w	fp, [r7, #26]
c0de695a:	f887 b018 	strb.w	fp, [r7, #24]
c0de695e:	f887 b021 	strb.w	fp, [r7, #33]	@ 0x21
c0de6962:	f887 b016 	strb.w	fp, [r7, #22]
c0de6966:	2301      	movs	r3, #1
c0de6968:	46a0      	mov	r8, r4
c0de696a:	7678      	strb	r0, [r7, #25]
c0de696c:	2020      	movs	r0, #32
c0de696e:	717a      	strb	r2, [r7, #5]
c0de6970:	f887 2024 	strb.w	r2, [r7, #36]	@ 0x24
c0de6974:	0e0a      	lsrs	r2, r1, #24
c0de6976:	75f8      	strb	r0, [r7, #23]
c0de6978:	20a0      	movs	r0, #160	@ 0xa0
c0de697a:	7138      	strb	r0, [r7, #4]
c0de697c:	200d      	movs	r0, #13
c0de697e:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de6982:	2004      	movs	r0, #4
c0de6984:	f887 0020 	strb.w	r0, [r7, #32]
c0de6988:	4638      	mov	r0, r7
c0de698a:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de698e:	70c2      	strb	r2, [r0, #3]
c0de6990:	0c0a      	lsrs	r2, r1, #16
c0de6992:	7082      	strb	r2, [r0, #2]
c0de6994:	0a08      	lsrs	r0, r1, #8
c0de6996:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de699a:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de699e:	200d      	movs	r0, #13
c0de69a0:	4d3d      	ldr	r5, [pc, #244]	@ (c0de6a98 <nbgl_layoutAddTextContent+0x17c>)
c0de69a2:	447d      	add	r5, pc
c0de69a4:	47a8      	blx	r5
c0de69a6:	f8da 10a0 	ldr.w	r1, [sl, #160]	@ 0xa0
c0de69aa:	f001 fecc 	bl	c0de8746 <OUTLINED_FUNCTION_24>
c0de69ae:	71b8      	strb	r0, [r7, #6]
c0de69b0:	0a00      	lsrs	r0, r0, #8
c0de69b2:	71f8      	strb	r0, [r7, #7]
c0de69b4:	f001 ff42 	bl	c0de883c <OUTLINED_FUNCTION_34>
c0de69b8:	4607      	mov	r7, r0
c0de69ba:	f880 b01f 	strb.w	fp, [r0, #31]
c0de69be:	9802      	ldr	r0, [sp, #8]
c0de69c0:	47c0      	blx	r8
c0de69c2:	4601      	mov	r1, r0
c0de69c4:	2001      	movs	r0, #1
c0de69c6:	22a0      	movs	r2, #160	@ 0xa0
c0de69c8:	2301      	movs	r3, #1
c0de69ca:	f04f 0801 	mov.w	r8, #1
c0de69ce:	f887 b021 	strb.w	fp, [r7, #33]	@ 0x21
c0de69d2:	713a      	strb	r2, [r7, #4]
c0de69d4:	220b      	movs	r2, #11
c0de69d6:	7178      	strb	r0, [r7, #5]
c0de69d8:	f887 0024 	strb.w	r0, [r7, #36]	@ 0x24
c0de69dc:	4638      	mov	r0, r7
c0de69de:	f887 2022 	strb.w	r2, [r7, #34]	@ 0x22
c0de69e2:	f001 ffc6 	bl	c0de8972 <OUTLINED_FUNCTION_52>
c0de69e6:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de69ea:	200b      	movs	r0, #11
c0de69ec:	47a8      	blx	r5
c0de69ee:	f8da 10a0 	ldr.w	r1, [sl, #160]	@ 0xa0
c0de69f2:	f887 b01a 	strb.w	fp, [r7, #26]
c0de69f6:	f887 b018 	strb.w	fp, [r7, #24]
c0de69fa:	f887 b016 	strb.w	fp, [r7, #22]
c0de69fe:	f001 fea2 	bl	c0de8746 <OUTLINED_FUNCTION_24>
c0de6a02:	2104      	movs	r1, #4
c0de6a04:	71b8      	strb	r0, [r7, #6]
c0de6a06:	0a00      	lsrs	r0, r0, #8
c0de6a08:	f887 1020 	strb.w	r1, [r7, #32]
c0de6a0c:	2118      	movs	r1, #24
c0de6a0e:	71f8      	strb	r0, [r7, #7]
c0de6a10:	7679      	strb	r1, [r7, #25]
c0de6a12:	2120      	movs	r1, #32
c0de6a14:	75f9      	strb	r1, [r7, #23]
c0de6a16:	f001 ff11 	bl	c0de883c <OUTLINED_FUNCTION_34>
c0de6a1a:	4606      	mov	r6, r0
c0de6a1c:	f880 801f 	strb.w	r8, [r0, #31]
c0de6a20:	9803      	ldr	r0, [sp, #12]
c0de6a22:	9901      	ldr	r1, [sp, #4]
c0de6a24:	4788      	blx	r1
c0de6a26:	4601      	mov	r1, r0
c0de6a28:	20a0      	movs	r0, #160	@ 0xa0
c0de6a2a:	2301      	movs	r3, #1
c0de6a2c:	f886 8005 	strb.w	r8, [r6, #5]
c0de6a30:	f886 8024 	strb.w	r8, [r6, #36]	@ 0x24
c0de6a34:	f886 b021 	strb.w	fp, [r6, #33]	@ 0x21
c0de6a38:	7130      	strb	r0, [r6, #4]
c0de6a3a:	200b      	movs	r0, #11
c0de6a3c:	0e0a      	lsrs	r2, r1, #24
c0de6a3e:	f001 fec9 	bl	c0de87d4 <OUTLINED_FUNCTION_30>
c0de6a42:	47a8      	blx	r5
c0de6a44:	f8da 10a0 	ldr.w	r1, [sl, #160]	@ 0xa0
c0de6a48:	f886 b01a 	strb.w	fp, [r6, #26]
c0de6a4c:	f886 b018 	strb.w	fp, [r6, #24]
c0de6a50:	f001 fdb0 	bl	c0de85b4 <OUTLINED_FUNCTION_8>
c0de6a54:	f841 6023 	str.w	r6, [r1, r3, lsl #2]
c0de6a58:	2128      	movs	r1, #40	@ 0x28
c0de6a5a:	71b0      	strb	r0, [r6, #6]
c0de6a5c:	0a00      	lsrs	r0, r0, #8
c0de6a5e:	7671      	strb	r1, [r6, #25]
c0de6a60:	2120      	movs	r1, #32
c0de6a62:	71f0      	strb	r0, [r6, #7]
c0de6a64:	75f1      	strb	r1, [r6, #23]
c0de6a66:	2104      	movs	r1, #4
c0de6a68:	f8da 00a0 	ldr.w	r0, [sl, #160]	@ 0xa0
c0de6a6c:	f886 1020 	strb.w	r1, [r6, #32]
c0de6a70:	2107      	movs	r1, #7
c0de6a72:	75b1      	strb	r1, [r6, #22]
c0de6a74:	f890 3020 	ldrb.w	r3, [r0, #32]
c0de6a78:	7981      	ldrb	r1, [r0, #6]
c0de6a7a:	79c2      	ldrb	r2, [r0, #7]
c0de6a7c:	3301      	adds	r3, #1
c0de6a7e:	f880 3020 	strb.w	r3, [r0, #32]
c0de6a82:	ea41 2002 	orr.w	r0, r1, r2, lsl #8
c0de6a86:	b004      	add	sp, #16
c0de6a88:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de6a8c:	f001 bee2 	b.w	c0de8854 <OUTLINED_FUNCTION_35>
c0de6a90:	00005e05 	.word	0x00005e05
c0de6a94:	000061b3 	.word	0x000061b3
c0de6a98:	00005dcb 	.word	0x00005dcb

c0de6a9c <nbgl_layoutAddRadioChoice>:
c0de6a9c:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de6aa0:	2800      	cmp	r0, #0
c0de6aa2:	f000 8102 	beq.w	c0de6caa <nbgl_layoutAddRadioChoice+0x20e>
c0de6aa6:	4605      	mov	r5, r0
c0de6aa8:	4884      	ldr	r0, [pc, #528]	@ (c0de6cbc <nbgl_layoutAddRadioChoice+0x220>)
c0de6aaa:	468a      	mov	sl, r1
c0de6aac:	f04f 0800 	mov.w	r8, #0
c0de6ab0:	e9cd 1501 	strd	r1, r5, [sp, #4]
c0de6ab4:	4478      	add	r0, pc
c0de6ab6:	9003      	str	r0, [sp, #12]
c0de6ab8:	f89a 0005 	ldrb.w	r0, [sl, #5]
c0de6abc:	4580      	cmp	r8, r0
c0de6abe:	f080 80f7 	bcs.w	c0de6cb0 <nbgl_layoutAddRadioChoice+0x214>
c0de6ac2:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de6ac6:	9c03      	ldr	r4, [sp, #12]
c0de6ac8:	08c1      	lsrs	r1, r0, #3
c0de6aca:	2001      	movs	r0, #1
c0de6acc:	47a0      	blx	r4
c0de6ace:	4606      	mov	r6, r0
c0de6ad0:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de6ad4:	08c1      	lsrs	r1, r0, #3
c0de6ad6:	2004      	movs	r0, #4
c0de6ad8:	47a0      	blx	r4
c0de6ada:	4607      	mov	r7, r0
c0de6adc:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de6ae0:	08c1      	lsrs	r1, r0, #3
c0de6ae2:	2009      	movs	r0, #9
c0de6ae4:	47a0      	blx	r4
c0de6ae6:	f89a 2007 	ldrb.w	r2, [sl, #7]
c0de6aea:	f89a 3008 	ldrb.w	r3, [sl, #8]
c0de6aee:	4604      	mov	r4, r0
c0de6af0:	4628      	mov	r0, r5
c0de6af2:	f001 fe0c 	bl	c0de870e <OUTLINED_FUNCTION_20>
c0de6af6:	2800      	cmp	r0, #0
c0de6af8:	f000 80d7 	beq.w	c0de6caa <nbgl_layoutAddRadioChoice+0x20e>
c0de6afc:	2002      	movs	r0, #2
c0de6afe:	f886 0020 	strb.w	r0, [r6, #32]
c0de6b02:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de6b06:	08c1      	lsrs	r1, r0, #3
c0de6b08:	2002      	movs	r0, #2
c0de6b0a:	f005 fe1d 	bl	c0dec748 <nbgl_containerPoolGet>
c0de6b0e:	2300      	movs	r3, #0
c0de6b10:	ea4f 2c16 	mov.w	ip, r6, lsr #8
c0de6b14:	4631      	mov	r1, r6
c0de6b16:	0e02      	lsrs	r2, r0, #24
c0de6b18:	4655      	mov	r5, sl
c0de6b1a:	ea4f 6a16 	mov.w	sl, r6, lsr #24
c0de6b1e:	ea4f 4b16 	mov.w	fp, r6, lsr #16
c0de6b22:	74f3      	strb	r3, [r6, #19]
c0de6b24:	f884 c013 	strb.w	ip, [r4, #19]
c0de6b28:	f801 0f22 	strb.w	r0, [r1, #34]!
c0de6b2c:	70ca      	strb	r2, [r1, #3]
c0de6b2e:	0c02      	lsrs	r2, r0, #16
c0de6b30:	708a      	strb	r2, [r1, #2]
c0de6b32:	0a01      	lsrs	r1, r0, #8
c0de6b34:	f886 1023 	strb.w	r1, [r6, #35]	@ 0x23
c0de6b38:	4631      	mov	r1, r6
c0de6b3a:	f801 3f12 	strb.w	r3, [r1, #18]!
c0de6b3e:	70cb      	strb	r3, [r1, #3]
c0de6b40:	708b      	strb	r3, [r1, #2]
c0de6b42:	4621      	mov	r1, r4
c0de6b44:	f801 6f12 	strb.w	r6, [r1, #18]!
c0de6b48:	f881 b002 	strb.w	fp, [r1, #2]
c0de6b4c:	f881 a003 	strb.w	sl, [r1, #3]
c0de6b50:	2120      	movs	r1, #32
c0de6b52:	7633      	strb	r3, [r6, #24]
c0de6b54:	71f3      	strb	r3, [r6, #7]
c0de6b56:	75b3      	strb	r3, [r6, #22]
c0de6b58:	75f1      	strb	r1, [r6, #23]
c0de6b5a:	215c      	movs	r1, #92	@ 0x5c
c0de6b5c:	71b1      	strb	r1, [r6, #6]
c0de6b5e:	2101      	movs	r1, #1
c0de6b60:	7171      	strb	r1, [r6, #5]
c0de6b62:	21a0      	movs	r1, #160	@ 0xa0
c0de6b64:	7131      	strb	r1, [r6, #4]
c0de6b66:	2102      	movs	r1, #2
c0de6b68:	6044      	str	r4, [r0, #4]
c0de6b6a:	77e3      	strb	r3, [r4, #31]
c0de6b6c:	f884 3021 	strb.w	r3, [r4, #33]	@ 0x21
c0de6b70:	7928      	ldrb	r0, [r5, #4]
c0de6b72:	f884 1020 	strb.w	r1, [r4, #32]
c0de6b76:	2106      	movs	r1, #6
c0de6b78:	75a1      	strb	r1, [r4, #22]
c0de6b7a:	b110      	cbz	r0, c0de6b82 <nbgl_layoutAddRadioChoice+0xe6>
c0de6b7c:	f44f 70d0 	mov.w	r0, #416	@ 0x1a0
c0de6b80:	e014      	b.n	c0de6bac <nbgl_layoutAddRadioChoice+0x110>
c0de6b82:	6828      	ldr	r0, [r5, #0]
c0de6b84:	4665      	mov	r5, ip
c0de6b86:	f850 0028 	ldr.w	r0, [r0, r8, lsl #2]
c0de6b8a:	f005 ffb9 	bl	c0decb00 <pic>
c0de6b8e:	4639      	mov	r1, r7
c0de6b90:	0e02      	lsrs	r2, r0, #24
c0de6b92:	46ac      	mov	ip, r5
c0de6b94:	9d01      	ldr	r5, [sp, #4]
c0de6b96:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de6b9a:	70ca      	strb	r2, [r1, #3]
c0de6b9c:	0c02      	lsrs	r2, r0, #16
c0de6b9e:	0a00      	lsrs	r0, r0, #8
c0de6ba0:	708a      	strb	r2, [r1, #2]
c0de6ba2:	7048      	strb	r0, [r1, #1]
c0de6ba4:	7930      	ldrb	r0, [r6, #4]
c0de6ba6:	7971      	ldrb	r1, [r6, #5]
c0de6ba8:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de6bac:	4639      	mov	r1, r7
c0de6bae:	f887 c013 	strb.w	ip, [r7, #19]
c0de6bb2:	4632      	mov	r2, r6
c0de6bb4:	3828      	subs	r0, #40	@ 0x28
c0de6bb6:	f801 6f12 	strb.w	r6, [r1, #18]!
c0de6bba:	f881 b002 	strb.w	fp, [r1, #2]
c0de6bbe:	f881 a003 	strb.w	sl, [r1, #3]
c0de6bc2:	f04f 0b00 	mov.w	fp, #0
c0de6bc6:	46aa      	mov	sl, r5
c0de6bc8:	f896 1023 	ldrb.w	r1, [r6, #35]	@ 0x23
c0de6bcc:	f812 3f22 	ldrb.w	r3, [r2, #34]!
c0de6bd0:	f886 b01d 	strb.w	fp, [r6, #29]
c0de6bd4:	f001 ff61 	bl	c0de8a9a <OUTLINED_FUNCTION_75>
c0de6bd8:	4b37      	ldr	r3, [pc, #220]	@ (c0de6cb8 <nbgl_layoutAddRadioChoice+0x21c>)
c0de6bda:	ea41 4102 	orr.w	r1, r1, r2, lsl #16
c0de6bde:	600f      	str	r7, [r1, #0]
c0de6be0:	f819 1003 	ldrb.w	r1, [r9, r3]
c0de6be4:	1c4a      	adds	r2, r1, #1
c0de6be6:	3114      	adds	r1, #20
c0de6be8:	f809 2003 	strb.w	r2, [r9, r3]
c0de6bec:	2201      	movs	r2, #1
c0de6bee:	77b1      	strb	r1, [r6, #30]
c0de6bf0:	2104      	movs	r1, #4
c0de6bf2:	7732      	strb	r2, [r6, #28]
c0de6bf4:	f887 b021 	strb.w	fp, [r7, #33]	@ 0x21
c0de6bf8:	f887 1020 	strb.w	r1, [r7, #32]
c0de6bfc:	75b9      	strb	r1, [r7, #22]
c0de6bfe:	79aa      	ldrb	r2, [r5, #6]
c0de6c00:	eba8 0302 	sub.w	r3, r8, r2
c0de6c04:	fab3 f383 	clz	r3, r3
c0de6c08:	095b      	lsrs	r3, r3, #5
c0de6c0a:	f884 3021 	strb.w	r3, [r4, #33]	@ 0x21
c0de6c0e:	7138      	strb	r0, [r7, #4]
c0de6c10:	0a00      	lsrs	r0, r0, #8
c0de6c12:	7178      	strb	r0, [r7, #5]
c0de6c14:	ebb8 0002 	subs.w	r0, r8, r2
c0de6c18:	bf18      	it	ne
c0de6c1a:	2001      	movne	r0, #1
c0de6c1c:	77f8      	strb	r0, [r7, #31]
c0de6c1e:	4590      	cmp	r8, r2
c0de6c20:	f04f 000b 	mov.w	r0, #11
c0de6c24:	bf08      	it	eq
c0de6c26:	200c      	moveq	r0, #12
c0de6c28:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de6c2c:	f005 fd96 	bl	c0dec75c <nbgl_getFontHeight>
c0de6c30:	9d02      	ldr	r5, [sp, #8]
c0de6c32:	f887 b007 	strb.w	fp, [r7, #7]
c0de6c36:	71b8      	strb	r0, [r7, #6]
c0de6c38:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de6c3c:	08c0      	lsrs	r0, r0, #3
c0de6c3e:	f000 f83f 	bl	c0de6cc0 <createHorizontalLine>
c0de6c42:	f8d5 10a0 	ldr.w	r1, [r5, #160]	@ 0xa0
c0de6c46:	f108 0801 	add.w	r8, r8, #1
c0de6c4a:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de6c4e:	784c      	ldrb	r4, [r1, #1]
c0de6c50:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de6c54:	788f      	ldrb	r7, [r1, #2]
c0de6c56:	78c9      	ldrb	r1, [r1, #3]
c0de6c58:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de6c5c:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de6c60:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de6c64:	f841 6023 	str.w	r6, [r1, r3, lsl #2]
c0de6c68:	f8d5 10a0 	ldr.w	r1, [r5, #160]	@ 0xa0
c0de6c6c:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de6c70:	784b      	ldrb	r3, [r1, #1]
c0de6c72:	788c      	ldrb	r4, [r1, #2]
c0de6c74:	78ce      	ldrb	r6, [r1, #3]
c0de6c76:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de6c7a:	ea44 2306 	orr.w	r3, r4, r6, lsl #8
c0de6c7e:	ea42 4203 	orr.w	r2, r2, r3, lsl #16
c0de6c82:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de6c86:	3301      	adds	r3, #1
c0de6c88:	f801 3c02 	strb.w	r3, [r1, #-2]
c0de6c8c:	21ff      	movs	r1, #255	@ 0xff
c0de6c8e:	b2dc      	uxtb	r4, r3
c0de6c90:	7681      	strb	r1, [r0, #26]
c0de6c92:	21fc      	movs	r1, #252	@ 0xfc
c0de6c94:	f842 0024 	str.w	r0, [r2, r4, lsl #2]
c0de6c98:	7641      	strb	r1, [r0, #25]
c0de6c9a:	2103      	movs	r1, #3
c0de6c9c:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de6ca0:	f8d5 00a0 	ldr.w	r0, [r5, #160]	@ 0xa0
c0de6ca4:	f001 fc1e 	bl	c0de84e4 <OUTLINED_FUNCTION_1>
c0de6ca8:	e706      	b.n	c0de6ab8 <nbgl_layoutAddRadioChoice+0x1c>
c0de6caa:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de6cae:	e000      	b.n	c0de6cb2 <nbgl_layoutAddRadioChoice+0x216>
c0de6cb0:	2000      	movs	r0, #0
c0de6cb2:	b004      	add	sp, #16
c0de6cb4:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de6cb8:	000018e8 	.word	0x000018e8
c0de6cbc:	00005c87 	.word	0x00005c87

c0de6cc0 <createHorizontalLine>:
c0de6cc0:	b580      	push	{r7, lr}
c0de6cc2:	4601      	mov	r1, r0
c0de6cc4:	2003      	movs	r0, #3
c0de6cc6:	f005 fd3a 	bl	c0dec73e <nbgl_objPoolGet>
c0de6cca:	2100      	movs	r1, #0
c0de6ccc:	22e0      	movs	r2, #224	@ 0xe0
c0de6cce:	71c1      	strb	r1, [r0, #7]
c0de6cd0:	2104      	movs	r1, #4
c0de6cd2:	7102      	strb	r2, [r0, #4]
c0de6cd4:	2202      	movs	r2, #2
c0de6cd6:	7181      	strb	r1, [r0, #6]
c0de6cd8:	2101      	movs	r1, #1
c0de6cda:	f880 2020 	strb.w	r2, [r0, #32]
c0de6cde:	7141      	strb	r1, [r0, #5]
c0de6ce0:	f880 1021 	strb.w	r1, [r0, #33]	@ 0x21
c0de6ce4:	77c1      	strb	r1, [r0, #31]
c0de6ce6:	bd80      	pop	{r7, pc}

c0de6ce8 <nbgl_layoutAddCenteredInfo>:
c0de6ce8:	b570      	push	{r4, r5, r6, lr}
c0de6cea:	b08a      	sub	sp, #40	@ 0x28
c0de6cec:	ae01      	add	r6, sp, #4
c0de6cee:	460c      	mov	r4, r1
c0de6cf0:	4605      	mov	r5, r0
c0de6cf2:	2124      	movs	r1, #36	@ 0x24
c0de6cf4:	4630      	mov	r0, r6
c0de6cf6:	f006 fa0b 	bl	c0ded110 <__aeabi_memclr>
c0de6cfa:	b33d      	cbz	r5, c0de6d4c <nbgl_layoutAddCenteredInfo+0x64>
c0de6cfc:	6820      	ldr	r0, [r4, #0]
c0de6cfe:	68e1      	ldr	r1, [r4, #12]
c0de6d00:	9102      	str	r1, [sp, #8]
c0de6d02:	b128      	cbz	r0, c0de6d10 <nbgl_layoutAddCenteredInfo+0x28>
c0de6d04:	7c61      	ldrb	r1, [r4, #17]
c0de6d06:	2210      	movs	r2, #16
c0de6d08:	2903      	cmp	r1, #3
c0de6d0a:	bf08      	it	eq
c0de6d0c:	2214      	moveq	r2, #20
c0de6d0e:	50b0      	str	r0, [r6, r2]
c0de6d10:	6860      	ldr	r0, [r4, #4]
c0de6d12:	b128      	cbz	r0, c0de6d20 <nbgl_layoutAddCenteredInfo+0x38>
c0de6d14:	7c61      	ldrb	r1, [r4, #17]
c0de6d16:	2218      	movs	r2, #24
c0de6d18:	2901      	cmp	r1, #1
c0de6d1a:	bf08      	it	eq
c0de6d1c:	2214      	moveq	r2, #20
c0de6d1e:	50b0      	str	r0, [r6, r2]
c0de6d20:	68a0      	ldr	r0, [r4, #8]
c0de6d22:	b128      	cbz	r0, c0de6d30 <nbgl_layoutAddCenteredInfo+0x48>
c0de6d24:	7c61      	ldrb	r1, [r4, #17]
c0de6d26:	2218      	movs	r2, #24
c0de6d28:	2902      	cmp	r1, #2
c0de6d2a:	bf08      	it	eq
c0de6d2c:	221c      	moveq	r2, #28
c0de6d2e:	50b0      	str	r0, [r6, r2]
c0de6d30:	a901      	add	r1, sp, #4
c0de6d32:	4628      	mov	r0, r5
c0de6d34:	f000 f816 	bl	c0de6d64 <addContentCenter>
c0de6d38:	7c21      	ldrb	r1, [r4, #16]
c0de6d3a:	b151      	cbz	r1, c0de6d52 <nbgl_layoutAddCenteredInfo+0x6a>
c0de6d3c:	2100      	movs	r1, #0
c0de6d3e:	2220      	movs	r2, #32
c0de6d40:	7601      	strb	r1, [r0, #24]
c0de6d42:	75c2      	strb	r2, [r0, #23]
c0de6d44:	7581      	strb	r1, [r0, #22]
c0de6d46:	8a61      	ldrh	r1, [r4, #18]
c0de6d48:	3120      	adds	r1, #32
c0de6d4a:	e003      	b.n	c0de6d54 <nbgl_layoutAddCenteredInfo+0x6c>
c0de6d4c:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de6d50:	e005      	b.n	c0de6d5e <nbgl_layoutAddCenteredInfo+0x76>
c0de6d52:	8a61      	ldrh	r1, [r4, #18]
c0de6d54:	7641      	strb	r1, [r0, #25]
c0de6d56:	0a09      	lsrs	r1, r1, #8
c0de6d58:	7681      	strb	r1, [r0, #26]
c0de6d5a:	f001 fe26 	bl	c0de89aa <OUTLINED_FUNCTION_55>
c0de6d5e:	b00a      	add	sp, #40	@ 0x28
c0de6d60:	bd70      	pop	{r4, r5, r6, pc}
	...

c0de6d64 <addContentCenter>:
c0de6d64:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de6d68:	4606      	mov	r6, r0
c0de6d6a:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de6d6e:	468b      	mov	fp, r1
c0de6d70:	f001 fc9d 	bl	c0de86ae <OUTLINED_FUNCTION_16>
c0de6d74:	2400      	movs	r4, #0
c0de6d76:	4680      	mov	r8, r0
c0de6d78:	f880 4020 	strb.w	r4, [r0, #32]
c0de6d7c:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de6d80:	08c1      	lsrs	r1, r0, #3
c0de6d82:	2006      	movs	r0, #6
c0de6d84:	f005 fce0 	bl	c0dec748 <nbgl_containerPoolGet>
c0de6d88:	4641      	mov	r1, r8
c0de6d8a:	0e02      	lsrs	r2, r0, #24
c0de6d8c:	f801 0f22 	strb.w	r0, [r1, #34]!
c0de6d90:	f001 fdd2 	bl	c0de8938 <OUTLINED_FUNCTION_47>
c0de6d94:	f888 0023 	strb.w	r0, [r8, #35]	@ 0x23
c0de6d98:	f8db 0004 	ldr.w	r0, [fp, #4]
c0de6d9c:	2800      	cmp	r0, #0
c0de6d9e:	d079      	beq.n	c0de6e94 <addContentCenter+0x130>
c0de6da0:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de6da4:	f001 fcb6 	bl	c0de8714 <OUTLINED_FUNCTION_21>
c0de6da8:	4607      	mov	r7, r0
c0de6daa:	77c4      	strb	r4, [r0, #31]
c0de6dac:	f8db 0004 	ldr.w	r0, [fp, #4]
c0de6db0:	f005 fea6 	bl	c0decb00 <pic>
c0de6db4:	4639      	mov	r1, r7
c0de6db6:	0e02      	lsrs	r2, r0, #24
c0de6db8:	46b2      	mov	sl, r6
c0de6dba:	f801 0f21 	strb.w	r0, [r1, #33]!
c0de6dbe:	70ca      	strb	r2, [r1, #3]
c0de6dc0:	0c02      	lsrs	r2, r0, #16
c0de6dc2:	708a      	strb	r2, [r1, #2]
c0de6dc4:	0a01      	lsrs	r1, r0, #8
c0de6dc6:	f887 1022 	strb.w	r1, [r7, #34]	@ 0x22
c0de6dca:	4641      	mov	r1, r8
c0de6dcc:	f001 fd28 	bl	c0de8820 <OUTLINED_FUNCTION_33>
c0de6dd0:	f842 7023 	str.w	r7, [r2, r3, lsl #2]
c0de6dd4:	2202      	movs	r2, #2
c0de6dd6:	3301      	adds	r3, #1
c0de6dd8:	75ba      	strb	r2, [r7, #22]
c0de6dda:	f8bb 2020 	ldrh.w	r2, [fp, #32]
c0de6dde:	767a      	strb	r2, [r7, #25]
c0de6de0:	f801 3c02 	strb.w	r3, [r1, #-2]
c0de6de4:	0a14      	lsrs	r4, r2, #8
c0de6de6:	7881      	ldrb	r1, [r0, #2]
c0de6de8:	78c0      	ldrb	r0, [r0, #3]
c0de6dea:	76bc      	strb	r4, [r7, #26]
c0de6dec:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de6df0:	4410      	add	r0, r2
c0de6df2:	9000      	str	r0, [sp, #0]
c0de6df4:	f89b 0000 	ldrb.w	r0, [fp]
c0de6df8:	2801      	cmp	r0, #1
c0de6dfa:	d146      	bne.n	c0de6e8a <addContentCenter+0x126>
c0de6dfc:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de6e00:	f001 fc88 	bl	c0de8714 <OUTLINED_FUNCTION_21>
c0de6e04:	4604      	mov	r4, r0
c0de6e06:	2000      	movs	r0, #0
c0de6e08:	77e0      	strb	r0, [r4, #31]
c0de6e0a:	f8db 0008 	ldr.w	r0, [fp, #8]
c0de6e0e:	6800      	ldr	r0, [r0, #0]
c0de6e10:	6800      	ldr	r0, [r0, #0]
c0de6e12:	f005 fe75 	bl	c0decb00 <pic>
c0de6e16:	4621      	mov	r1, r4
c0de6e18:	0e02      	lsrs	r2, r0, #24
c0de6e1a:	f801 0f21 	strb.w	r0, [r1, #33]!
c0de6e1e:	70ca      	strb	r2, [r1, #3]
c0de6e20:	0c02      	lsrs	r2, r0, #16
c0de6e22:	0a00      	lsrs	r0, r0, #8
c0de6e24:	f884 0022 	strb.w	r0, [r4, #34]	@ 0x22
c0de6e28:	708a      	strb	r2, [r1, #2]
c0de6e2a:	4640      	mov	r0, r8
c0de6e2c:	f001 fd31 	bl	c0de8892 <OUTLINED_FUNCTION_38>
c0de6e30:	f841 4022 	str.w	r4, [r1, r2, lsl #2]
c0de6e34:	2102      	movs	r1, #2
c0de6e36:	75a1      	strb	r1, [r4, #22]
c0de6e38:	f8bb 100c 	ldrh.w	r1, [fp, #12]
c0de6e3c:	75e1      	strb	r1, [r4, #23]
c0de6e3e:	0a09      	lsrs	r1, r1, #8
c0de6e40:	f8bb 3020 	ldrh.w	r3, [fp, #32]
c0de6e44:	f8bb 500e 	ldrh.w	r5, [fp, #14]
c0de6e48:	7621      	strb	r1, [r4, #24]
c0de6e4a:	1c51      	adds	r1, r2, #1
c0de6e4c:	442b      	add	r3, r5
c0de6e4e:	7663      	strb	r3, [r4, #25]
c0de6e50:	f800 1c02 	strb.w	r1, [r0, #-2]
c0de6e54:	0a18      	lsrs	r0, r3, #8
c0de6e56:	76a0      	strb	r0, [r4, #26]
c0de6e58:	2000      	movs	r0, #0
c0de6e5a:	f88a 00af 	strb.w	r0, [sl, #175]	@ 0xaf
c0de6e5e:	f8db 0008 	ldr.w	r0, [fp, #8]
c0de6e62:	f8ca 00a4 	str.w	r0, [sl, #164]	@ 0xa4
c0de6e66:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de6e6a:	f040 0104 	orr.w	r1, r0, #4
c0de6e6e:	08c0      	lsrs	r0, r0, #3
c0de6e70:	f88a 10ad 	strb.w	r1, [sl, #173]	@ 0xad
c0de6e74:	49b2      	ldr	r1, [pc, #712]	@ (c0de7140 <addContentCenter+0x3dc>)
c0de6e76:	4479      	add	r1, pc
c0de6e78:	9101      	str	r1, [sp, #4]
c0de6e7a:	f8db 1008 	ldr.w	r1, [fp, #8]
c0de6e7e:	88c9      	ldrh	r1, [r1, #6]
c0de6e80:	e9cd 1102 	strd	r1, r1, [sp, #8]
c0de6e84:	a901      	add	r1, sp, #4
c0de6e86:	f005 fc50 	bl	c0dec72a <nbgl_screenUpdateTicker>
c0de6e8a:	4656      	mov	r6, sl
c0de6e8c:	f8dd a000 	ldr.w	sl, [sp]
c0de6e90:	463c      	mov	r4, r7
c0de6e92:	e001      	b.n	c0de6e98 <addContentCenter+0x134>
c0de6e94:	f04f 0a00 	mov.w	sl, #0
c0de6e98:	f8db 0010 	ldr.w	r0, [fp, #16]
c0de6e9c:	9600      	str	r6, [sp, #0]
c0de6e9e:	2800      	cmp	r0, #0
c0de6ea0:	d046      	beq.n	c0de6f30 <addContentCenter+0x1cc>
c0de6ea2:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de6ea6:	f001 fb19 	bl	c0de84dc <OUTLINED_FUNCTION_0>
c0de6eaa:	4607      	mov	r7, r0
c0de6eac:	2000      	movs	r0, #0
c0de6eae:	77f8      	strb	r0, [r7, #31]
c0de6eb0:	f8db 0010 	ldr.w	r0, [fp, #16]
c0de6eb4:	f005 fe24 	bl	c0decb00 <pic>
c0de6eb8:	f001 fd19 	bl	c0de88ee <OUTLINED_FUNCTION_42>
c0de6ebc:	200d      	movs	r0, #13
c0de6ebe:	f001 fb2b 	bl	c0de8518 <OUTLINED_FUNCTION_3>
c0de6ec2:	f001 fdf8 	bl	c0de8ab6 <OUTLINED_FUNCTION_78>
c0de6ec6:	71b8      	strb	r0, [r7, #6]
c0de6ec8:	0a01      	lsrs	r1, r0, #8
c0de6eca:	f898 c020 	ldrb.w	ip, [r8, #32]
c0de6ece:	71f9      	strb	r1, [r7, #7]
c0de6ed0:	f1bc 0f00 	cmp.w	ip, #0
c0de6ed4:	d010      	beq.n	c0de6ef8 <addContentCenter+0x194>
c0de6ed6:	463b      	mov	r3, r7
c0de6ed8:	0e22      	lsrs	r2, r4, #24
c0de6eda:	f803 4f12 	strb.w	r4, [r3, #18]!
c0de6ede:	70da      	strb	r2, [r3, #3]
c0de6ee0:	0c22      	lsrs	r2, r4, #16
c0de6ee2:	709a      	strb	r2, [r3, #2]
c0de6ee4:	0a22      	lsrs	r2, r4, #8
c0de6ee6:	705a      	strb	r2, [r3, #1]
c0de6ee8:	f8bb 2020 	ldrh.w	r2, [fp, #32]
c0de6eec:	3218      	adds	r2, #24
c0de6eee:	0a14      	lsrs	r4, r2, #8
c0de6ef0:	71da      	strb	r2, [r3, #7]
c0de6ef2:	721c      	strb	r4, [r3, #8]
c0de6ef4:	2308      	movs	r3, #8
c0de6ef6:	e004      	b.n	c0de6f02 <addContentCenter+0x19e>
c0de6ef8:	7e7a      	ldrb	r2, [r7, #25]
c0de6efa:	7ebb      	ldrb	r3, [r7, #26]
c0de6efc:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de6f00:	2302      	movs	r3, #2
c0de6f02:	75bb      	strb	r3, [r7, #22]
c0de6f04:	4643      	mov	r3, r8
c0de6f06:	4450      	add	r0, sl
c0de6f08:	f813 4f22 	ldrb.w	r4, [r3, #34]!
c0de6f0c:	eb00 0a02 	add.w	sl, r0, r2
c0de6f10:	785d      	ldrb	r5, [r3, #1]
c0de6f12:	789e      	ldrb	r6, [r3, #2]
c0de6f14:	78d9      	ldrb	r1, [r3, #3]
c0de6f16:	ea46 2101 	orr.w	r1, r6, r1, lsl #8
c0de6f1a:	ea44 2405 	orr.w	r4, r4, r5, lsl #8
c0de6f1e:	9e00      	ldr	r6, [sp, #0]
c0de6f20:	ea44 4101 	orr.w	r1, r4, r1, lsl #16
c0de6f24:	f841 702c 	str.w	r7, [r1, ip, lsl #2]
c0de6f28:	f10c 0101 	add.w	r1, ip, #1
c0de6f2c:	f803 1c02 	strb.w	r1, [r3, #-2]
c0de6f30:	f8db 0014 	ldr.w	r0, [fp, #20]
c0de6f34:	2800      	cmp	r0, #0
c0de6f36:	d049      	beq.n	c0de6fcc <addContentCenter+0x268>
c0de6f38:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de6f3c:	f001 face 	bl	c0de84dc <OUTLINED_FUNCTION_0>
c0de6f40:	4607      	mov	r7, r0
c0de6f42:	2000      	movs	r0, #0
c0de6f44:	77f8      	strb	r0, [r7, #31]
c0de6f46:	f8db 0014 	ldr.w	r0, [fp, #20]
c0de6f4a:	f005 fdd9 	bl	c0decb00 <pic>
c0de6f4e:	f001 fcce 	bl	c0de88ee <OUTLINED_FUNCTION_42>
c0de6f52:	200c      	movs	r0, #12
c0de6f54:	f001 fae0 	bl	c0de8518 <OUTLINED_FUNCTION_3>
c0de6f58:	200c      	movs	r0, #12
c0de6f5a:	f005 fc09 	bl	c0dec770 <nbgl_getTextHeightInWidth>
c0de6f5e:	f001 fce4 	bl	c0de892a <OUTLINED_FUNCTION_46>
c0de6f62:	d028      	beq.n	c0de6fb6 <addContentCenter+0x252>
c0de6f64:	4642      	mov	r2, r8
c0de6f66:	f04f 0c00 	mov.w	ip, #0
c0de6f6a:	f812 3f22 	ldrb.w	r3, [r2, #34]!
c0de6f6e:	7855      	ldrb	r5, [r2, #1]
c0de6f70:	7896      	ldrb	r6, [r2, #2]
c0de6f72:	78d2      	ldrb	r2, [r2, #3]
c0de6f74:	ea46 2202 	orr.w	r2, r6, r2, lsl #8
c0de6f78:	ea43 2305 	orr.w	r3, r3, r5, lsl #8
c0de6f7c:	463e      	mov	r6, r7
c0de6f7e:	ea43 4202 	orr.w	r2, r3, r2, lsl #16
c0de6f82:	eb02 0381 	add.w	r3, r2, r1, lsl #2
c0de6f86:	f853 5c04 	ldr.w	r5, [r3, #-4]
c0de6f8a:	f806 5f12 	strb.w	r5, [r6, #18]!
c0de6f8e:	0e2c      	lsrs	r4, r5, #24
c0de6f90:	70f4      	strb	r4, [r6, #3]
c0de6f92:	0c2c      	lsrs	r4, r5, #16
c0de6f94:	f886 c008 	strb.w	ip, [r6, #8]
c0de6f98:	70b4      	strb	r4, [r6, #2]
c0de6f9a:	0a2c      	lsrs	r4, r5, #8
c0de6f9c:	7074      	strb	r4, [r6, #1]
c0de6f9e:	2418      	movs	r4, #24
c0de6fa0:	71f4      	strb	r4, [r6, #7]
c0de6fa2:	2408      	movs	r4, #8
c0de6fa4:	f853 3c04 	ldr.w	r3, [r3, #-4]
c0de6fa8:	7134      	strb	r4, [r6, #4]
c0de6faa:	7edb      	ldrb	r3, [r3, #27]
c0de6fac:	2b02      	cmp	r3, #2
c0de6fae:	d105      	bne.n	c0de6fbc <addContentCenter+0x258>
c0de6fb0:	f001 fd5b 	bl	c0de8a6a <OUTLINED_FUNCTION_71>
c0de6fb4:	e006      	b.n	c0de6fc4 <addContentCenter+0x260>
c0de6fb6:	f001 fa9b 	bl	c0de84f0 <OUTLINED_FUNCTION_2>
c0de6fba:	e005      	b.n	c0de6fc8 <addContentCenter+0x264>
c0de6fbc:	2300      	movs	r3, #0
c0de6fbe:	76bb      	strb	r3, [r7, #26]
c0de6fc0:	2310      	movs	r3, #16
c0de6fc2:	767b      	strb	r3, [r7, #25]
c0de6fc4:	9e00      	ldr	r6, [sp, #0]
c0de6fc6:	460c      	mov	r4, r1
c0de6fc8:	f001 fbfb 	bl	c0de87c2 <OUTLINED_FUNCTION_29>
c0de6fcc:	f8db 0018 	ldr.w	r0, [fp, #24]
c0de6fd0:	b3b8      	cbz	r0, c0de7042 <addContentCenter+0x2de>
c0de6fd2:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de6fd6:	f001 fa81 	bl	c0de84dc <OUTLINED_FUNCTION_0>
c0de6fda:	4607      	mov	r7, r0
c0de6fdc:	2000      	movs	r0, #0
c0de6fde:	77f8      	strb	r0, [r7, #31]
c0de6fe0:	f8db 0018 	ldr.w	r0, [fp, #24]
c0de6fe4:	f005 fd8c 	bl	c0decb00 <pic>
c0de6fe8:	f001 fc81 	bl	c0de88ee <OUTLINED_FUNCTION_42>
c0de6fec:	200b      	movs	r0, #11
c0de6fee:	f001 fa93 	bl	c0de8518 <OUTLINED_FUNCTION_3>
c0de6ff2:	f001 fc84 	bl	c0de88fe <OUTLINED_FUNCTION_43>
c0de6ff6:	f001 fc98 	bl	c0de892a <OUTLINED_FUNCTION_46>
c0de6ffa:	d019      	beq.n	c0de7030 <addContentCenter+0x2cc>
c0de6ffc:	f001 fc3b 	bl	c0de8876 <OUTLINED_FUNCTION_37>
c0de7000:	eb02 0381 	add.w	r3, r2, r1, lsl #2
c0de7004:	f853 4c04 	ldr.w	r4, [r3, #-4]
c0de7008:	f805 4f12 	strb.w	r4, [r5, #18]!
c0de700c:	0e26      	lsrs	r6, r4, #24
c0de700e:	70ee      	strb	r6, [r5, #3]
c0de7010:	0c26      	lsrs	r6, r4, #16
c0de7012:	0a24      	lsrs	r4, r4, #8
c0de7014:	706c      	strb	r4, [r5, #1]
c0de7016:	70ae      	strb	r6, [r5, #2]
c0de7018:	2408      	movs	r4, #8
c0de701a:	f853 3c04 	ldr.w	r3, [r3, #-4]
c0de701e:	712c      	strb	r4, [r5, #4]
c0de7020:	7edb      	ldrb	r3, [r3, #27]
c0de7022:	2b04      	cmp	r3, #4
c0de7024:	d107      	bne.n	c0de7036 <addContentCenter+0x2d2>
c0de7026:	2300      	movs	r3, #0
c0de7028:	76bb      	strb	r3, [r7, #26]
c0de702a:	2310      	movs	r3, #16
c0de702c:	767b      	strb	r3, [r7, #25]
c0de702e:	e004      	b.n	c0de703a <addContentCenter+0x2d6>
c0de7030:	f001 fa5e 	bl	c0de84f0 <OUTLINED_FUNCTION_2>
c0de7034:	e003      	b.n	c0de703e <addContentCenter+0x2da>
c0de7036:	f001 fd18 	bl	c0de8a6a <OUTLINED_FUNCTION_71>
c0de703a:	9e00      	ldr	r6, [sp, #0]
c0de703c:	460c      	mov	r4, r1
c0de703e:	f001 fbc0 	bl	c0de87c2 <OUTLINED_FUNCTION_29>
c0de7042:	f8db 001c 	ldr.w	r0, [fp, #28]
c0de7046:	2800      	cmp	r0, #0
c0de7048:	d04f      	beq.n	c0de70ea <addContentCenter+0x386>
c0de704a:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de704e:	f001 fa45 	bl	c0de84dc <OUTLINED_FUNCTION_0>
c0de7052:	2401      	movs	r4, #1
c0de7054:	4607      	mov	r7, r0
c0de7056:	77c4      	strb	r4, [r0, #31]
c0de7058:	f8db 001c 	ldr.w	r0, [fp, #28]
c0de705c:	f005 fd50 	bl	c0decb00 <pic>
c0de7060:	4601      	mov	r1, r0
c0de7062:	20a0      	movs	r0, #160	@ 0xa0
c0de7064:	2301      	movs	r3, #1
c0de7066:	717c      	strb	r4, [r7, #5]
c0de7068:	f887 4024 	strb.w	r4, [r7, #36]	@ 0x24
c0de706c:	7138      	strb	r0, [r7, #4]
c0de706e:	200b      	movs	r0, #11
c0de7070:	0e0a      	lsrs	r2, r1, #24
c0de7072:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de7076:	2005      	movs	r0, #5
c0de7078:	f887 0020 	strb.w	r0, [r7, #32]
c0de707c:	4638      	mov	r0, r7
c0de707e:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de7082:	70c2      	strb	r2, [r0, #3]
c0de7084:	0c0a      	lsrs	r2, r1, #16
c0de7086:	7082      	strb	r2, [r0, #2]
c0de7088:	0a08      	lsrs	r0, r1, #8
c0de708a:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de708e:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de7092:	f001 fc34 	bl	c0de88fe <OUTLINED_FUNCTION_43>
c0de7096:	3010      	adds	r0, #16
c0de7098:	f001 fc47 	bl	c0de892a <OUTLINED_FUNCTION_46>
c0de709c:	d021      	beq.n	c0de70e2 <addContentCenter+0x37e>
c0de709e:	f001 fbea 	bl	c0de8876 <OUTLINED_FUNCTION_37>
c0de70a2:	eb02 0481 	add.w	r4, r2, r1, lsl #2
c0de70a6:	f854 3c04 	ldr.w	r3, [r4, #-4]
c0de70aa:	f805 3f12 	strb.w	r3, [r5, #18]!
c0de70ae:	0e1e      	lsrs	r6, r3, #24
c0de70b0:	70ee      	strb	r6, [r5, #3]
c0de70b2:	0c1e      	lsrs	r6, r3, #16
c0de70b4:	0a1b      	lsrs	r3, r3, #8
c0de70b6:	706b      	strb	r3, [r5, #1]
c0de70b8:	2300      	movs	r3, #0
c0de70ba:	70ae      	strb	r6, [r5, #2]
c0de70bc:	2608      	movs	r6, #8
c0de70be:	722b      	strb	r3, [r5, #8]
c0de70c0:	2310      	movs	r3, #16
c0de70c2:	712e      	strb	r6, [r5, #4]
c0de70c4:	71eb      	strb	r3, [r5, #7]
c0de70c6:	f854 4c04 	ldr.w	r4, [r4, #-4]
c0de70ca:	7ee4      	ldrb	r4, [r4, #27]
c0de70cc:	2c02      	cmp	r4, #2
c0de70ce:	d105      	bne.n	c0de70dc <addContentCenter+0x378>
c0de70d0:	f8bb 3020 	ldrh.w	r3, [fp, #32]
c0de70d4:	3310      	adds	r3, #16
c0de70d6:	0a1c      	lsrs	r4, r3, #8
c0de70d8:	767b      	strb	r3, [r7, #25]
c0de70da:	76bc      	strb	r4, [r7, #26]
c0de70dc:	9e00      	ldr	r6, [sp, #0]
c0de70de:	460c      	mov	r4, r1
c0de70e0:	e001      	b.n	c0de70e6 <addContentCenter+0x382>
c0de70e2:	f001 fa05 	bl	c0de84f0 <OUTLINED_FUNCTION_2>
c0de70e6:	f001 fb6c 	bl	c0de87c2 <OUTLINED_FUNCTION_29>
c0de70ea:	2001      	movs	r0, #1
c0de70ec:	f888 a006 	strb.w	sl, [r8, #6]
c0de70f0:	f888 0005 	strb.w	r0, [r8, #5]
c0de70f4:	20a0      	movs	r0, #160	@ 0xa0
c0de70f6:	f888 0004 	strb.w	r0, [r8, #4]
c0de70fa:	2005      	movs	r0, #5
c0de70fc:	f888 0016 	strb.w	r0, [r8, #22]
c0de7100:	2000      	movs	r0, #0
c0de7102:	f888 001f 	strb.w	r0, [r8, #31]
c0de7106:	ea4f 201a 	mov.w	r0, sl, lsr #8
c0de710a:	f888 0007 	strb.w	r0, [r8, #7]
c0de710e:	f89b 0022 	ldrb.w	r0, [fp, #34]	@ 0x22
c0de7112:	b130      	cbz	r0, c0de7122 <addContentCenter+0x3be>
c0de7114:	f10a 0028 	add.w	r0, sl, #40	@ 0x28
c0de7118:	f888 0006 	strb.w	r0, [r8, #6]
c0de711c:	0a00      	lsrs	r0, r0, #8
c0de711e:	f888 0007 	strb.w	r0, [r8, #7]
c0de7122:	f8d6 00a0 	ldr.w	r0, [r6, #160]	@ 0xa0
c0de7126:	f001 fa6c 	bl	c0de8602 <OUTLINED_FUNCTION_10>
c0de712a:	f840 8022 	str.w	r8, [r0, r2, lsl #2]
c0de712e:	f8d6 00a0 	ldr.w	r0, [r6, #160]	@ 0xa0
c0de7132:	f001 f9d7 	bl	c0de84e4 <OUTLINED_FUNCTION_1>
c0de7136:	4640      	mov	r0, r8
c0de7138:	b004      	add	sp, #16
c0de713a:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de713e:	bf00      	nop
c0de7140:	0000155f 	.word	0x0000155f

c0de7144 <nbgl_layoutAddContentCenter>:
c0de7144:	b128      	cbz	r0, c0de7152 <nbgl_layoutAddContentCenter+0xe>
c0de7146:	b580      	push	{r7, lr}
c0de7148:	f7ff fe0c 	bl	c0de6d64 <addContentCenter>
c0de714c:	f001 fc2d 	bl	c0de89aa <OUTLINED_FUNCTION_55>
c0de7150:	bd80      	pop	{r7, pc}
c0de7152:	f001 bb7f 	b.w	c0de8854 <OUTLINED_FUNCTION_35>

c0de7156 <nbgl_layoutAddQRCode>:
c0de7156:	2800      	cmp	r0, #0
c0de7158:	f000 8116 	beq.w	c0de7388 <nbgl_layoutAddQRCode+0x232>
c0de715c:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de7160:	4606      	mov	r6, r0
c0de7162:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de7166:	460f      	mov	r7, r1
c0de7168:	f001 faa1 	bl	c0de86ae <OUTLINED_FUNCTION_16>
c0de716c:	4682      	mov	sl, r0
c0de716e:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de7172:	08c1      	lsrs	r1, r0, #3
c0de7174:	2003      	movs	r0, #3
c0de7176:	f005 fae7 	bl	c0dec748 <nbgl_containerPoolGet>
c0de717a:	4654      	mov	r4, sl
c0de717c:	0e01      	lsrs	r1, r0, #24
c0de717e:	f04f 0b00 	mov.w	fp, #0
c0de7182:	f804 0f22 	strb.w	r0, [r4, #34]!
c0de7186:	f88a b020 	strb.w	fp, [sl, #32]
c0de718a:	70e1      	strb	r1, [r4, #3]
c0de718c:	0c01      	lsrs	r1, r0, #16
c0de718e:	0a00      	lsrs	r0, r0, #8
c0de7190:	70a1      	strb	r1, [r4, #2]
c0de7192:	f88a 0023 	strb.w	r0, [sl, #35]	@ 0x23
c0de7196:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de719a:	08c1      	lsrs	r1, r0, #3
c0de719c:	200a      	movs	r0, #10
c0de719e:	f005 face 	bl	c0dec73e <nbgl_objPoolGet>
c0de71a2:	4680      	mov	r8, r0
c0de71a4:	6838      	ldr	r0, [r7, #0]
c0de71a6:	f005 fcab 	bl	c0decb00 <pic>
c0de71aa:	f006 f81d 	bl	c0ded1e8 <strlen>
c0de71ae:	283e      	cmp	r0, #62	@ 0x3e
c0de71b0:	f04f 0000 	mov.w	r0, #0
c0de71b4:	4645      	mov	r5, r8
c0de71b6:	bf88      	it	hi
c0de71b8:	2001      	movhi	r0, #1
c0de71ba:	f888 0020 	strb.w	r0, [r8, #32]
c0de71be:	f888 b01f 	strb.w	fp, [r8, #31]
c0de71c2:	f44f 7084 	mov.w	r0, #264	@ 0x108
c0de71c6:	bf88      	it	hi
c0de71c8:	20e4      	movhi	r0, #228	@ 0xe4
c0de71ca:	f888 0004 	strb.w	r0, [r8, #4]
c0de71ce:	f805 0f06 	strb.w	r0, [r5, #6]!
c0de71d2:	0a00      	lsrs	r0, r0, #8
c0de71d4:	7068      	strb	r0, [r5, #1]
c0de71d6:	f888 0005 	strb.w	r0, [r8, #5]
c0de71da:	6838      	ldr	r0, [r7, #0]
c0de71dc:	f005 fc90 	bl	c0decb00 <pic>
c0de71e0:	4641      	mov	r1, r8
c0de71e2:	0e02      	lsrs	r2, r0, #24
c0de71e4:	f888 b009 	strb.w	fp, [r8, #9]
c0de71e8:	9601      	str	r6, [sp, #4]
c0de71ea:	f801 0f21 	strb.w	r0, [r1, #33]!
c0de71ee:	f001 fba3 	bl	c0de8938 <OUTLINED_FUNCTION_47>
c0de71f2:	f888 0022 	strb.w	r0, [r8, #34]	@ 0x22
c0de71f6:	7820      	ldrb	r0, [r4, #0]
c0de71f8:	78a1      	ldrb	r1, [r4, #2]
c0de71fa:	78e2      	ldrb	r2, [r4, #3]
c0de71fc:	f89a 4023 	ldrb.w	r4, [sl, #35]	@ 0x23
c0de7200:	f89a 3020 	ldrb.w	r3, [sl, #32]
c0de7204:	ea40 2004 	orr.w	r0, r0, r4, lsl #8
c0de7208:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de720c:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de7210:	7869      	ldrb	r1, [r5, #1]
c0de7212:	f840 8023 	str.w	r8, [r0, r3, lsl #2]
c0de7216:	2002      	movs	r0, #2
c0de7218:	f888 0016 	strb.w	r0, [r8, #22]
c0de721c:	1c58      	adds	r0, r3, #1
c0de721e:	f88a 0020 	strb.w	r0, [sl, #32]
c0de7222:	7828      	ldrb	r0, [r5, #0]
c0de7224:	ea40 2b01 	orr.w	fp, r0, r1, lsl #8
c0de7228:	6878      	ldr	r0, [r7, #4]
c0de722a:	2800      	cmp	r0, #0
c0de722c:	d053      	beq.n	c0de72d6 <nbgl_layoutAddQRCode+0x180>
c0de722e:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de7232:	f001 f953 	bl	c0de84dc <OUTLINED_FUNCTION_0>
c0de7236:	4605      	mov	r5, r0
c0de7238:	2000      	movs	r0, #0
c0de723a:	77e8      	strb	r0, [r5, #31]
c0de723c:	6878      	ldr	r0, [r7, #4]
c0de723e:	f005 fc5f 	bl	c0decb00 <pic>
c0de7242:	4601      	mov	r1, r0
c0de7244:	20a0      	movs	r0, #160	@ 0xa0
c0de7246:	2201      	movs	r2, #1
c0de7248:	7128      	strb	r0, [r5, #4]
c0de724a:	2005      	movs	r0, #5
c0de724c:	716a      	strb	r2, [r5, #5]
c0de724e:	f885 2024 	strb.w	r2, [r5, #36]	@ 0x24
c0de7252:	0e0a      	lsrs	r2, r1, #24
c0de7254:	f885 0020 	strb.w	r0, [r5, #32]
c0de7258:	4628      	mov	r0, r5
c0de725a:	f001 fa02 	bl	c0de8662 <OUTLINED_FUNCTION_13>
c0de725e:	f885 0027 	strb.w	r0, [r5, #39]	@ 0x27
c0de7262:	200d      	movs	r0, #13
c0de7264:	7bfa      	ldrb	r2, [r7, #15]
c0de7266:	2a00      	cmp	r2, #0
c0de7268:	bf08      	it	eq
c0de726a:	200b      	moveq	r0, #11
c0de726c:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de7270:	f885 0022 	strb.w	r0, [r5, #34]	@ 0x22
c0de7274:	2301      	movs	r3, #1
c0de7276:	f005 fa7b 	bl	c0dec770 <nbgl_getTextHeightInWidth>
c0de727a:	4651      	mov	r1, sl
c0de727c:	46be      	mov	lr, r7
c0de727e:	f811 cf22 	ldrb.w	ip, [r1, #34]!
c0de7282:	784c      	ldrb	r4, [r1, #1]
c0de7284:	788a      	ldrb	r2, [r1, #2]
c0de7286:	78cf      	ldrb	r7, [r1, #3]
c0de7288:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de728c:	ea42 2207 	orr.w	r2, r2, r7, lsl #8
c0de7290:	ea4c 2404 	orr.w	r4, ip, r4, lsl #8
c0de7294:	462f      	mov	r7, r5
c0de7296:	ea44 4202 	orr.w	r2, r4, r2, lsl #16
c0de729a:	eb02 0483 	add.w	r4, r2, r3, lsl #2
c0de729e:	f854 4c04 	ldr.w	r4, [r4, #-4]
c0de72a2:	f807 4f12 	strb.w	r4, [r7, #18]!
c0de72a6:	0e26      	lsrs	r6, r4, #24
c0de72a8:	70fe      	strb	r6, [r7, #3]
c0de72aa:	0c26      	lsrs	r6, r4, #16
c0de72ac:	0a24      	lsrs	r4, r4, #8
c0de72ae:	70be      	strb	r6, [r7, #2]
c0de72b0:	74ec      	strb	r4, [r5, #19]
c0de72b2:	f842 5023 	str.w	r5, [r2, r3, lsl #2]
c0de72b6:	2200      	movs	r2, #0
c0de72b8:	71a8      	strb	r0, [r5, #6]
c0de72ba:	4677      	mov	r7, lr
c0de72bc:	76aa      	strb	r2, [r5, #26]
c0de72be:	2218      	movs	r2, #24
c0de72c0:	766a      	strb	r2, [r5, #25]
c0de72c2:	2208      	movs	r2, #8
c0de72c4:	75aa      	strb	r2, [r5, #22]
c0de72c6:	0a02      	lsrs	r2, r0, #8
c0de72c8:	4458      	add	r0, fp
c0de72ca:	71ea      	strb	r2, [r5, #7]
c0de72cc:	1c5a      	adds	r2, r3, #1
c0de72ce:	f100 0b18 	add.w	fp, r0, #24
c0de72d2:	f801 2c02 	strb.w	r2, [r1, #-2]
c0de72d6:	68b8      	ldr	r0, [r7, #8]
c0de72d8:	9700      	str	r7, [sp, #0]
c0de72da:	2800      	cmp	r0, #0
c0de72dc:	d056      	beq.n	c0de738c <nbgl_layoutAddQRCode+0x236>
c0de72de:	9801      	ldr	r0, [sp, #4]
c0de72e0:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de72e4:	f001 f8fa 	bl	c0de84dc <OUTLINED_FUNCTION_0>
c0de72e8:	2401      	movs	r4, #1
c0de72ea:	4605      	mov	r5, r0
c0de72ec:	77c4      	strb	r4, [r0, #31]
c0de72ee:	68b8      	ldr	r0, [r7, #8]
c0de72f0:	f005 fc06 	bl	c0decb00 <pic>
c0de72f4:	4601      	mov	r1, r0
c0de72f6:	20a0      	movs	r0, #160	@ 0xa0
c0de72f8:	2301      	movs	r3, #1
c0de72fa:	716c      	strb	r4, [r5, #5]
c0de72fc:	f885 4024 	strb.w	r4, [r5, #36]	@ 0x24
c0de7300:	7128      	strb	r0, [r5, #4]
c0de7302:	200b      	movs	r0, #11
c0de7304:	0e0a      	lsrs	r2, r1, #24
c0de7306:	f885 0022 	strb.w	r0, [r5, #34]	@ 0x22
c0de730a:	2005      	movs	r0, #5
c0de730c:	f885 0020 	strb.w	r0, [r5, #32]
c0de7310:	4628      	mov	r0, r5
c0de7312:	f001 f924 	bl	c0de855e <OUTLINED_FUNCTION_5>
c0de7316:	4651      	mov	r1, sl
c0de7318:	f811 cf22 	ldrb.w	ip, [r1, #34]!
c0de731c:	784b      	ldrb	r3, [r1, #1]
c0de731e:	788e      	ldrb	r6, [r1, #2]
c0de7320:	78cc      	ldrb	r4, [r1, #3]
c0de7322:	f811 2c02 	ldrb.w	r2, [r1, #-2]
c0de7326:	ea4c 2303 	orr.w	r3, ip, r3, lsl #8
c0de732a:	ea46 2404 	orr.w	r4, r6, r4, lsl #8
c0de732e:	f8d7 c004 	ldr.w	ip, [r7, #4]
c0de7332:	2700      	movs	r7, #0
c0de7334:	462e      	mov	r6, r5
c0de7336:	ea43 4e04 	orr.w	lr, r3, r4, lsl #16
c0de733a:	eb0e 0482 	add.w	r4, lr, r2, lsl #2
c0de733e:	f854 4c04 	ldr.w	r4, [r4, #-4]
c0de7342:	76af      	strb	r7, [r5, #26]
c0de7344:	271c      	movs	r7, #28
c0de7346:	f1bc 0f00 	cmp.w	ip, #0
c0de734a:	bf08      	it	eq
c0de734c:	2720      	moveq	r7, #32
c0de734e:	766f      	strb	r7, [r5, #25]
c0de7350:	f806 4f12 	strb.w	r4, [r6, #18]!
c0de7354:	0e23      	lsrs	r3, r4, #24
c0de7356:	70f3      	strb	r3, [r6, #3]
c0de7358:	0c23      	lsrs	r3, r4, #16
c0de735a:	70b3      	strb	r3, [r6, #2]
c0de735c:	0a23      	lsrs	r3, r4, #8
c0de735e:	9e01      	ldr	r6, [sp, #4]
c0de7360:	74eb      	strb	r3, [r5, #19]
c0de7362:	2308      	movs	r3, #8
c0de7364:	f84e 5022 	str.w	r5, [lr, r2, lsl #2]
c0de7368:	3201      	adds	r2, #1
c0de736a:	71a8      	strb	r0, [r5, #6]
c0de736c:	75ab      	strb	r3, [r5, #22]
c0de736e:	0a03      	lsrs	r3, r0, #8
c0de7370:	f801 2c02 	strb.w	r2, [r1, #-2]
c0de7374:	71eb      	strb	r3, [r5, #7]
c0de7376:	f1bc 0f00 	cmp.w	ip, #0
c0de737a:	bf08      	it	eq
c0de737c:	f10b 0b08 	addeq.w	fp, fp, #8
c0de7380:	4458      	add	r0, fp
c0de7382:	eb00 0b07 	add.w	fp, r0, r7
c0de7386:	e002      	b.n	c0de738e <nbgl_layoutAddQRCode+0x238>
c0de7388:	f001 ba64 	b.w	c0de8854 <OUTLINED_FUNCTION_35>
c0de738c:	9e01      	ldr	r6, [sp, #4]
c0de738e:	f8d6 00a0 	ldr.w	r0, [r6, #160]	@ 0xa0
c0de7392:	fa1f f18b 	uxth.w	r1, fp
c0de7396:	7982      	ldrb	r2, [r0, #6]
c0de7398:	79c3      	ldrb	r3, [r0, #7]
c0de739a:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de739e:	3a10      	subs	r2, #16
c0de73a0:	428a      	cmp	r2, r1
c0de73a2:	dd01      	ble.n	c0de73a8 <nbgl_layoutAddQRCode+0x252>
c0de73a4:	9d00      	ldr	r5, [sp, #0]
c0de73a6:	e012      	b.n	c0de73ce <nbgl_layoutAddQRCode+0x278>
c0de73a8:	f898 1020 	ldrb.w	r1, [r8, #32]
c0de73ac:	9d00      	ldr	r5, [sp, #0]
c0de73ae:	b971      	cbnz	r1, c0de73ce <nbgl_layoutAddQRCode+0x278>
c0de73b0:	2100      	movs	r1, #0
c0de73b2:	2284      	movs	r2, #132	@ 0x84
c0de73b4:	f1ab 0b84 	sub.w	fp, fp, #132	@ 0x84
c0de73b8:	f888 1007 	strb.w	r1, [r8, #7]
c0de73bc:	f888 1005 	strb.w	r1, [r8, #5]
c0de73c0:	2102      	movs	r1, #2
c0de73c2:	f888 2006 	strb.w	r2, [r8, #6]
c0de73c6:	f888 2004 	strb.w	r2, [r8, #4]
c0de73ca:	f888 1020 	strb.w	r1, [r8, #32]
c0de73ce:	2100      	movs	r1, #0
c0de73d0:	f88a b006 	strb.w	fp, [sl, #6]
c0de73d4:	f88a 101f 	strb.w	r1, [sl, #31]
c0de73d8:	ea4f 211b 	mov.w	r1, fp, lsr #8
c0de73dc:	f88a 1007 	strb.w	r1, [sl, #7]
c0de73e0:	7ba9      	ldrb	r1, [r5, #14]
c0de73e2:	b109      	cbz	r1, c0de73e8 <nbgl_layoutAddQRCode+0x292>
c0de73e4:	2005      	movs	r0, #5
c0de73e6:	e00f      	b.n	c0de7408 <nbgl_layoutAddQRCode+0x2b2>
c0de73e8:	f001 f90b 	bl	c0de8602 <OUTLINED_FUNCTION_10>
c0de73ec:	4651      	mov	r1, sl
c0de73ee:	eb00 0082 	add.w	r0, r0, r2, lsl #2
c0de73f2:	f850 0c04 	ldr.w	r0, [r0, #-4]
c0de73f6:	f801 0f12 	strb.w	r0, [r1, #18]!
c0de73fa:	0e02      	lsrs	r2, r0, #24
c0de73fc:	70ca      	strb	r2, [r1, #3]
c0de73fe:	0c02      	lsrs	r2, r0, #16
c0de7400:	0a00      	lsrs	r0, r0, #8
c0de7402:	7048      	strb	r0, [r1, #1]
c0de7404:	2008      	movs	r0, #8
c0de7406:	708a      	strb	r2, [r1, #2]
c0de7408:	f88a 0016 	strb.w	r0, [sl, #22]
c0de740c:	f8d6 00a0 	ldr.w	r0, [r6, #160]	@ 0xa0
c0de7410:	f001 f9be 	bl	c0de8790 <OUTLINED_FUNCTION_27>
c0de7414:	2001      	movs	r0, #1
c0de7416:	f88a 0005 	strb.w	r0, [sl, #5]
c0de741a:	20a0      	movs	r0, #160	@ 0xa0
c0de741c:	f88a 0004 	strb.w	r0, [sl, #4]
c0de7420:	89a8      	ldrh	r0, [r5, #12]
c0de7422:	f88a 0019 	strb.w	r0, [sl, #25]
c0de7426:	0a00      	lsrs	r0, r0, #8
c0de7428:	f88a 001a 	strb.w	r0, [sl, #26]
c0de742c:	f8d6 00a0 	ldr.w	r0, [r6, #160]	@ 0xa0
c0de7430:	f001 f858 	bl	c0de84e4 <OUTLINED_FUNCTION_1>
c0de7434:	fa1f f08b 	uxth.w	r0, fp
c0de7438:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}

c0de743c <nbgl_layoutAddChoiceButtons>:
c0de743c:	b510      	push	{r4, lr}
c0de743e:	b086      	sub	sp, #24
c0de7440:	2206      	movs	r2, #6
c0de7442:	f10d 0c04 	add.w	ip, sp, #4
c0de7446:	f8ad 2000 	strh.w	r2, [sp]
c0de744a:	e891 001c 	ldmia.w	r1, {r2, r3, r4}
c0de744e:	e8ac 001c 	stmia.w	ip!, {r2, r3, r4}
c0de7452:	898a      	ldrh	r2, [r1, #12]
c0de7454:	7b89      	ldrb	r1, [r1, #14]
c0de7456:	f88d 1012 	strb.w	r1, [sp, #18]
c0de745a:	4669      	mov	r1, sp
c0de745c:	f8ad 2010 	strh.w	r2, [sp, #16]
c0de7460:	f7fe fb40 	bl	c0de5ae4 <nbgl_layoutAddExtendedFooter>
c0de7464:	b006      	add	sp, #24
c0de7466:	bd10      	pop	{r4, pc}

c0de7468 <nbgl_layoutAddHorizontalButtons>:
c0de7468:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de746a:	2202      	movs	r2, #2
c0de746c:	f88d 2004 	strb.w	r2, [sp, #4]
c0de7470:	e9d1 2300 	ldrd	r2, r3, [r1]
c0de7474:	e9cd 2302 	strd	r2, r3, [sp, #8]
c0de7478:	890a      	ldrh	r2, [r1, #8]
c0de747a:	7a89      	ldrb	r1, [r1, #10]
c0de747c:	f8ad 2010 	strh.w	r2, [sp, #16]
c0de7480:	f88d 1012 	strb.w	r1, [sp, #18]
c0de7484:	a901      	add	r1, sp, #4
c0de7486:	f7fd ff85 	bl	c0de5394 <nbgl_layoutAddUpFooter>
c0de748a:	b006      	add	sp, #24
c0de748c:	bd80      	pop	{r7, pc}
	...

c0de7490 <nbgl_layoutAddTagValueList>:
c0de7490:	2800      	cmp	r0, #0
c0de7492:	f000 818a 	beq.w	c0de77aa <nbgl_layoutAddTagValueList+0x31a>
c0de7496:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de749a:	b088      	sub	sp, #32
c0de749c:	4680      	mov	r8, r0
c0de749e:	48c4      	ldr	r0, [pc, #784]	@ (c0de77b0 <nbgl_layoutAddTagValueList+0x320>)
c0de74a0:	460c      	mov	r4, r1
c0de74a2:	2100      	movs	r1, #0
c0de74a4:	f04f 0b00 	mov.w	fp, #0
c0de74a8:	f8cd 8004 	str.w	r8, [sp, #4]
c0de74ac:	9406      	str	r4, [sp, #24]
c0de74ae:	4478      	add	r0, pc
c0de74b0:	9000      	str	r0, [sp, #0]
c0de74b2:	7a20      	ldrb	r0, [r4, #8]
c0de74b4:	4583      	cmp	fp, r0
c0de74b6:	f080 8174 	bcs.w	c0de77a2 <nbgl_layoutAddTagValueList+0x312>
c0de74ba:	6820      	ldr	r0, [r4, #0]
c0de74bc:	e9cd b104 	strd	fp, r1, [sp, #16]
c0de74c0:	b110      	cbz	r0, c0de74c8 <nbgl_layoutAddTagValueList+0x38>
c0de74c2:	eb00 0b01 	add.w	fp, r0, r1
c0de74c6:	e005      	b.n	c0de74d4 <nbgl_layoutAddTagValueList+0x44>
c0de74c8:	7a60      	ldrb	r0, [r4, #9]
c0de74ca:	6861      	ldr	r1, [r4, #4]
c0de74cc:	4458      	add	r0, fp
c0de74ce:	b2c0      	uxtb	r0, r0
c0de74d0:	4788      	blx	r1
c0de74d2:	4683      	mov	fp, r0
c0de74d4:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de74d8:	9c00      	ldr	r4, [sp, #0]
c0de74da:	08c1      	lsrs	r1, r0, #3
c0de74dc:	2001      	movs	r0, #1
c0de74de:	47a0      	blx	r4
c0de74e0:	4682      	mov	sl, r0
c0de74e2:	f8db 0008 	ldr.w	r0, [fp, #8]
c0de74e6:	2800      	cmp	r0, #0
c0de74e8:	f04f 0003 	mov.w	r0, #3
c0de74ec:	bf08      	it	eq
c0de74ee:	2002      	moveq	r0, #2
c0de74f0:	f898 10ad 	ldrb.w	r1, [r8, #173]	@ 0xad
c0de74f4:	f001 face 	bl	c0de8a94 <OUTLINED_FUNCTION_74>
c0de74f8:	4656      	mov	r6, sl
c0de74fa:	0e01      	lsrs	r1, r0, #24
c0de74fc:	f806 0f22 	strb.w	r0, [r6, #34]!
c0de7500:	f001 fa75 	bl	c0de89ee <OUTLINED_FUNCTION_60>
c0de7504:	f88a 0023 	strb.w	r0, [sl, #35]	@ 0x23
c0de7508:	f001 fadc 	bl	c0de8ac4 <OUTLINED_FUNCTION_80>
c0de750c:	4605      	mov	r5, r0
c0de750e:	f001 fad9 	bl	c0de8ac4 <OUTLINED_FUNCTION_80>
c0de7512:	4607      	mov	r7, r0
c0de7514:	f8db 0000 	ldr.w	r0, [fp]
c0de7518:	2401      	movs	r4, #1
c0de751a:	77ec      	strb	r4, [r5, #31]
c0de751c:	f005 faf0 	bl	c0decb00 <pic>
c0de7520:	4601      	mov	r1, r0
c0de7522:	20a0      	movs	r0, #160	@ 0xa0
c0de7524:	716c      	strb	r4, [r5, #5]
c0de7526:	f885 4024 	strb.w	r4, [r5, #36]	@ 0x24
c0de752a:	2404      	movs	r4, #4
c0de752c:	2301      	movs	r3, #1
c0de752e:	7128      	strb	r0, [r5, #4]
c0de7530:	200b      	movs	r0, #11
c0de7532:	0e0a      	lsrs	r2, r1, #24
c0de7534:	f885 4020 	strb.w	r4, [r5, #32]
c0de7538:	f885 0022 	strb.w	r0, [r5, #34]	@ 0x22
c0de753c:	4628      	mov	r0, r5
c0de753e:	f001 f80e 	bl	c0de855e <OUTLINED_FUNCTION_5>
c0de7542:	71a8      	strb	r0, [r5, #6]
c0de7544:	9003      	str	r0, [sp, #12]
c0de7546:	0a00      	lsrs	r0, r0, #8
c0de7548:	f04f 0800 	mov.w	r8, #0
c0de754c:	2109      	movs	r1, #9
c0de754e:	71e8      	strb	r0, [r5, #7]
c0de7550:	f105 0012 	add.w	r0, r5, #18
c0de7554:	f885 8021 	strb.w	r8, [r5, #33]	@ 0x21
c0de7558:	f005 fdda 	bl	c0ded110 <__aeabi_memclr>
c0de755c:	f89a 1023 	ldrb.w	r1, [sl, #35]	@ 0x23
c0de7560:	7832      	ldrb	r2, [r6, #0]
c0de7562:	78b3      	ldrb	r3, [r6, #2]
c0de7564:	78f6      	ldrb	r6, [r6, #3]
c0de7566:	f89a 0020 	ldrb.w	r0, [sl, #32]
c0de756a:	f887 801f 	strb.w	r8, [r7, #31]
c0de756e:	f001 fa9b 	bl	c0de8aa8 <OUTLINED_FUNCTION_76>
c0de7572:	f841 5020 	str.w	r5, [r1, r0, lsl #2]
c0de7576:	3001      	adds	r0, #1
c0de7578:	f88a 0020 	strb.w	r0, [sl, #32]
c0de757c:	f8db 0004 	ldr.w	r0, [fp, #4]
c0de7580:	f005 fabe 	bl	c0decb00 <pic>
c0de7584:	4601      	mov	r1, r0
c0de7586:	4638      	mov	r0, r7
c0de7588:	f887 4020 	strb.w	r4, [r7, #32]
c0de758c:	9c06      	ldr	r4, [sp, #24]
c0de758e:	260c      	movs	r6, #12
c0de7590:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de7594:	0e0a      	lsrs	r2, r1, #24
c0de7596:	f001 f9c1 	bl	c0de891c <OUTLINED_FUNCTION_45>
c0de759a:	7b20      	ldrb	r0, [r4, #12]
c0de759c:	2800      	cmp	r0, #0
c0de759e:	bf08      	it	eq
c0de75a0:	260d      	moveq	r6, #13
c0de75a2:	f887 6022 	strb.w	r6, [r7, #34]	@ 0x22
c0de75a6:	f89b 200c 	ldrb.w	r2, [fp, #12]
c0de75aa:	0752      	lsls	r2, r2, #29
c0de75ac:	d417      	bmi.n	c0de75de <nbgl_layoutAddTagValueList+0x14e>
c0de75ae:	f8db 2008 	ldr.w	r2, [fp, #8]
c0de75b2:	2a00      	cmp	r2, #0
c0de75b4:	f000 80f0 	beq.w	c0de7798 <nbgl_layoutAddTagValueList+0x308>
c0de75b8:	4610      	mov	r0, r2
c0de75ba:	f005 faa1 	bl	c0decb00 <pic>
c0de75be:	4639      	mov	r1, r7
c0de75c0:	f811 2f26 	ldrb.w	r2, [r1, #38]!
c0de75c4:	784b      	ldrb	r3, [r1, #1]
c0de75c6:	f811 6c04 	ldrb.w	r6, [r1, #-4]
c0de75ca:	f891 c002 	ldrb.w	ip, [r1, #2]
c0de75ce:	78c9      	ldrb	r1, [r1, #3]
c0de75d0:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de75d4:	ea4c 2101 	orr.w	r1, ip, r1, lsl #8
c0de75d8:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de75dc:	e001      	b.n	c0de75e2 <nbgl_layoutAddTagValueList+0x152>
c0de75de:	4875      	ldr	r0, [pc, #468]	@ (c0de77b4 <nbgl_layoutAddTagValueList+0x324>)
c0de75e0:	4478      	add	r0, pc
c0de75e2:	7802      	ldrb	r2, [r0, #0]
c0de75e4:	7843      	ldrb	r3, [r0, #1]
c0de75e6:	4680      	mov	r8, r0
c0de75e8:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de75ec:	f5c2 72ca 	rsb	r2, r2, #404	@ 0x194
c0de75f0:	0a13      	lsrs	r3, r2, #8
c0de75f2:	713a      	strb	r2, [r7, #4]
c0de75f4:	b292      	uxth	r2, r2
c0de75f6:	4630      	mov	r0, r6
c0de75f8:	717b      	strb	r3, [r7, #5]
c0de75fa:	7b63      	ldrb	r3, [r4, #13]
c0de75fc:	f005 f8bd 	bl	c0dec77a <nbgl_getTextNbLinesInWidth>
c0de7600:	7aa1      	ldrb	r1, [r4, #10]
c0de7602:	46a3      	mov	fp, r4
c0de7604:	b121      	cbz	r1, c0de7610 <nbgl_layoutAddTagValueList+0x180>
c0de7606:	4288      	cmp	r0, r1
c0de7608:	bf84      	itt	hi
c0de760a:	f887 1025 	strbhi.w	r1, [r7, #37]	@ 0x25
c0de760e:	4608      	movhi	r0, r1
c0de7610:	9007      	str	r0, [sp, #28]
c0de7612:	f897 0022 	ldrb.w	r0, [r7, #34]	@ 0x22
c0de7616:	f005 f89c 	bl	c0dec752 <nbgl_getFont>
c0de761a:	0a29      	lsrs	r1, r5, #8
c0de761c:	0e2a      	lsrs	r2, r5, #24
c0de761e:	46dc      	mov	ip, fp
c0de7620:	f04f 0e01 	mov.w	lr, #1
c0de7624:	74f9      	strb	r1, [r7, #19]
c0de7626:	4639      	mov	r1, r7
c0de7628:	f801 5f12 	strb.w	r5, [r1, #18]!
c0de762c:	70ca      	strb	r2, [r1, #3]
c0de762e:	0c2a      	lsrs	r2, r5, #16
c0de7630:	708a      	strb	r2, [r1, #2]
c0de7632:	4651      	mov	r1, sl
c0de7634:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de7638:	784d      	ldrb	r5, [r1, #1]
c0de763a:	788e      	ldrb	r6, [r1, #2]
c0de763c:	78cc      	ldrb	r4, [r1, #3]
c0de763e:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de7642:	ea46 2404 	orr.w	r4, r6, r4, lsl #8
c0de7646:	ea42 2205 	orr.w	r2, r2, r5, lsl #8
c0de764a:	2600      	movs	r6, #0
c0de764c:	ea42 4204 	orr.w	r2, r2, r4, lsl #16
c0de7650:	4644      	mov	r4, r8
c0de7652:	76be      	strb	r6, [r7, #26]
c0de7654:	f887 6021 	strb.w	r6, [r7, #33]	@ 0x21
c0de7658:	f842 7023 	str.w	r7, [r2, r3, lsl #2]
c0de765c:	2204      	movs	r2, #4
c0de765e:	767a      	strb	r2, [r7, #25]
c0de7660:	2207      	movs	r2, #7
c0de7662:	75ba      	strb	r2, [r7, #22]
c0de7664:	f89b 200d 	ldrb.w	r2, [fp, #13]
c0de7668:	79c5      	ldrb	r5, [r0, #7]
c0de766a:	f8dd b010 	ldr.w	fp, [sp, #16]
c0de766e:	f887 2024 	strb.w	r2, [r7, #36]	@ 0x24
c0de7672:	9a07      	ldr	r2, [sp, #28]
c0de7674:	fb02 f005 	mul.w	r0, r2, r5
c0de7678:	71b8      	strb	r0, [r7, #6]
c0de767a:	0a00      	lsrs	r0, r0, #8
c0de767c:	71f8      	strb	r0, [r7, #7]
c0de767e:	1c58      	adds	r0, r3, #1
c0de7680:	f1b8 0f00 	cmp.w	r8, #0
c0de7684:	f8dd 8004 	ldr.w	r8, [sp, #4]
c0de7688:	f801 0c02 	strb.w	r0, [r1, #-2]
c0de768c:	d048      	beq.n	c0de7720 <nbgl_layoutAddTagValueList+0x290>
c0de768e:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de7692:	f001 f83f 	bl	c0de8714 <OUTLINED_FUNCTION_21>
c0de7696:	9502      	str	r5, [sp, #8]
c0de7698:	4605      	mov	r5, r0
c0de769a:	9806      	ldr	r0, [sp, #24]
c0de769c:	4651      	mov	r1, sl
c0de769e:	2309      	movs	r3, #9
c0de76a0:	7ac2      	ldrb	r2, [r0, #11]
c0de76a2:	4640      	mov	r0, r8
c0de76a4:	f7fd fbf8 	bl	c0de4e98 <layoutAddCallbackObj>
c0de76a8:	0a21      	lsrs	r1, r4, #8
c0de76aa:	0e22      	lsrs	r2, r4, #24
c0de76ac:	2600      	movs	r6, #0
c0de76ae:	f04f 0e01 	mov.w	lr, #1
c0de76b2:	f885 1022 	strb.w	r1, [r5, #34]	@ 0x22
c0de76b6:	0a39      	lsrs	r1, r7, #8
c0de76b8:	762e      	strb	r6, [r5, #24]
c0de76ba:	77ee      	strb	r6, [r5, #31]
c0de76bc:	74e9      	strb	r1, [r5, #19]
c0de76be:	4629      	mov	r1, r5
c0de76c0:	f801 4f21 	strb.w	r4, [r1, #33]!
c0de76c4:	70ca      	strb	r2, [r1, #3]
c0de76c6:	0c22      	lsrs	r2, r4, #16
c0de76c8:	708a      	strb	r2, [r1, #2]
c0de76ca:	4629      	mov	r1, r5
c0de76cc:	0e3a      	lsrs	r2, r7, #24
c0de76ce:	4673      	mov	r3, lr
c0de76d0:	f001 f9be 	bl	c0de8a50 <OUTLINED_FUNCTION_69>
c0de76d4:	469e      	mov	lr, r3
c0de76d6:	4651      	mov	r1, sl
c0de76d8:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de76dc:	784c      	ldrb	r4, [r1, #1]
c0de76de:	788f      	ldrb	r7, [r1, #2]
c0de76e0:	78cb      	ldrb	r3, [r1, #3]
c0de76e2:	f811 cc02 	ldrb.w	ip, [r1, #-2]
c0de76e6:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de76ea:	ea47 2403 	orr.w	r4, r7, r3, lsl #8
c0de76ee:	ea42 4204 	orr.w	r2, r2, r4, lsl #16
c0de76f2:	f842 502c 	str.w	r5, [r2, ip, lsl #2]
c0de76f6:	220c      	movs	r2, #12
c0de76f8:	75ea      	strb	r2, [r5, #23]
c0de76fa:	f880 b005 	strb.w	fp, [r0, #5]
c0de76fe:	f10b 000f 	add.w	r0, fp, #15
c0de7702:	75aa      	strb	r2, [r5, #22]
c0de7704:	9d02      	ldr	r5, [sp, #8]
c0de7706:	9a07      	ldr	r2, [sp, #28]
c0de7708:	f801 6c05 	strb.w	r6, [r1, #-5]
c0de770c:	f801 ec06 	strb.w	lr, [r1, #-6]
c0de7710:	f801 0c04 	strb.w	r0, [r1, #-4]
c0de7714:	f10c 0001 	add.w	r0, ip, #1
c0de7718:	f8dd c018 	ldr.w	ip, [sp, #24]
c0de771c:	f801 0c02 	strb.w	r0, [r1, #-2]
c0de7720:	9803      	ldr	r0, [sp, #12]
c0de7722:	4659      	mov	r1, fp
c0de7724:	fb02 0005 	mla	r0, r2, r5, r0
c0de7728:	3004      	adds	r0, #4
c0de772a:	f1bb 0f00 	cmp.w	fp, #0
c0de772e:	bf18      	it	ne
c0de7730:	2118      	movne	r1, #24
c0de7732:	f88a 1019 	strb.w	r1, [sl, #25]
c0de7736:	f88a e005 	strb.w	lr, [sl, #5]
c0de773a:	f88a 6018 	strb.w	r6, [sl, #24]
c0de773e:	f88a 601f 	strb.w	r6, [sl, #31]
c0de7742:	f88a 6016 	strb.w	r6, [sl, #22]
c0de7746:	f10b 0b01 	add.w	fp, fp, #1
c0de774a:	0a09      	lsrs	r1, r1, #8
c0de774c:	f88a 101a 	strb.w	r1, [sl, #26]
c0de7750:	f8d8 10a0 	ldr.w	r1, [r8, #160]	@ 0xa0
c0de7754:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de7758:	784c      	ldrb	r4, [r1, #1]
c0de775a:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de775e:	788d      	ldrb	r5, [r1, #2]
c0de7760:	78c9      	ldrb	r1, [r1, #3]
c0de7762:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de7766:	ea45 2101 	orr.w	r1, r5, r1, lsl #8
c0de776a:	4664      	mov	r4, ip
c0de776c:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de7770:	f841 a023 	str.w	sl, [r1, r3, lsl #2]
c0de7774:	21a0      	movs	r1, #160	@ 0xa0
c0de7776:	f88a 0006 	strb.w	r0, [sl, #6]
c0de777a:	0a00      	lsrs	r0, r0, #8
c0de777c:	f88a 1004 	strb.w	r1, [sl, #4]
c0de7780:	2120      	movs	r1, #32
c0de7782:	f88a 0007 	strb.w	r0, [sl, #7]
c0de7786:	f88a 1017 	strb.w	r1, [sl, #23]
c0de778a:	f8d8 00a0 	ldr.w	r0, [r8, #160]	@ 0xa0
c0de778e:	f000 fea9 	bl	c0de84e4 <OUTLINED_FUNCTION_1>
c0de7792:	9905      	ldr	r1, [sp, #20]
c0de7794:	3110      	adds	r1, #16
c0de7796:	e68c      	b.n	c0de74b2 <nbgl_layoutAddTagValueList+0x22>
c0de7798:	f04f 0800 	mov.w	r8, #0
c0de779c:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de77a0:	e726      	b.n	c0de75f0 <nbgl_layoutAddTagValueList+0x160>
c0de77a2:	2000      	movs	r0, #0
c0de77a4:	b008      	add	sp, #32
c0de77a6:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de77aa:	f001 b853 	b.w	c0de8854 <OUTLINED_FUNCTION_35>
c0de77ae:	bf00      	nop
c0de77b0:	0000528d 	.word	0x0000528d
c0de77b4:	00006930 	.word	0x00006930

c0de77b8 <nbgl_layoutAddSeparationLine>:
c0de77b8:	b570      	push	{r4, r5, r6, lr}
c0de77ba:	f001 f97f 	bl	c0de8abc <OUTLINED_FUNCTION_79>
c0de77be:	08c0      	lsrs	r0, r0, #3
c0de77c0:	f7ff fa7e 	bl	c0de6cc0 <createHorizontalLine>
c0de77c4:	f000 ffaa 	bl	c0de871c <OUTLINED_FUNCTION_22>
c0de77c8:	21ff      	movs	r1, #255	@ 0xff
c0de77ca:	7681      	strb	r1, [r0, #26]
c0de77cc:	21fc      	movs	r1, #252	@ 0xfc
c0de77ce:	7641      	strb	r1, [r0, #25]
c0de77d0:	2103      	movs	r1, #3
c0de77d2:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de77d6:	f001 f8f6 	bl	c0de89c6 <OUTLINED_FUNCTION_57>
c0de77da:	bd70      	pop	{r4, r5, r6, pc}

c0de77dc <nbgl_layoutAddButton>:
c0de77dc:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de77e0:	b086      	sub	sp, #24
c0de77e2:	b310      	cbz	r0, c0de782a <nbgl_layoutAddButton+0x4e>
c0de77e4:	4680      	mov	r8, r0
c0de77e6:	7ac8      	ldrb	r0, [r1, #11]
c0de77e8:	460d      	mov	r5, r1
c0de77ea:	b108      	cbz	r0, c0de77f0 <nbgl_layoutAddButton+0x14>
c0de77ec:	7aa8      	ldrb	r0, [r5, #10]
c0de77ee:	b1f8      	cbz	r0, c0de7830 <nbgl_layoutAddButton+0x54>
c0de77f0:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de77f4:	f000 ff5f 	bl	c0de86b6 <OUTLINED_FUNCTION_17>
c0de77f8:	4606      	mov	r6, r0
c0de77fa:	7a2a      	ldrb	r2, [r5, #8]
c0de77fc:	7b2b      	ldrb	r3, [r5, #12]
c0de77fe:	4640      	mov	r0, r8
c0de7800:	f000 ff85 	bl	c0de870e <OUTLINED_FUNCTION_20>
c0de7804:	b188      	cbz	r0, c0de782a <nbgl_layoutAddButton+0x4e>
c0de7806:	210c      	movs	r1, #12
c0de7808:	2000      	movs	r0, #0
c0de780a:	7671      	strb	r1, [r6, #25]
c0de780c:	2120      	movs	r1, #32
c0de780e:	76b0      	strb	r0, [r6, #26]
c0de7810:	7630      	strb	r0, [r6, #24]
c0de7812:	75b0      	strb	r0, [r6, #22]
c0de7814:	75f1      	strb	r1, [r6, #23]
c0de7816:	7a69      	ldrb	r1, [r5, #9]
c0de7818:	b1e9      	cbz	r1, c0de7856 <nbgl_layoutAddButton+0x7a>
c0de781a:	f886 0021 	strb.w	r0, [r6, #33]	@ 0x21
c0de781e:	2003      	movs	r0, #3
c0de7820:	77f0      	strb	r0, [r6, #31]
c0de7822:	2902      	cmp	r1, #2
c0de7824:	bf18      	it	ne
c0de7826:	2002      	movne	r0, #2
c0de7828:	e019      	b.n	c0de785e <nbgl_layoutAddButton+0x82>
c0de782a:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de782e:	e0a3      	b.n	c0de7978 <nbgl_layoutAddButton+0x19c>
c0de7830:	f8d8 0010 	ldr.w	r0, [r8, #16]
c0de7834:	2800      	cmp	r0, #0
c0de7836:	f000 80a2 	beq.w	c0de797e <nbgl_layoutAddButton+0x1a2>
c0de783a:	2001      	movs	r0, #1
c0de783c:	f88d 0000 	strb.w	r0, [sp]
c0de7840:	e9d5 0100 	ldrd	r0, r1, [r5]
c0de7844:	9001      	str	r0, [sp, #4]
c0de7846:	7b28      	ldrb	r0, [r5, #12]
c0de7848:	9102      	str	r1, [sp, #8]
c0de784a:	4669      	mov	r1, sp
c0de784c:	f001 f91b 	bl	c0de8a86 <OUTLINED_FUNCTION_73>
c0de7850:	f7fd fda0 	bl	c0de5394 <nbgl_layoutAddUpFooter>
c0de7854:	e090      	b.n	c0de7978 <nbgl_layoutAddButton+0x19c>
c0de7856:	2103      	movs	r1, #3
c0de7858:	77f0      	strb	r0, [r6, #31]
c0de785a:	f886 1021 	strb.w	r1, [r6, #33]	@ 0x21
c0de785e:	f886 0020 	strb.w	r0, [r6, #32]
c0de7862:	6828      	ldr	r0, [r5, #0]
c0de7864:	f005 f94c 	bl	c0decb00 <pic>
c0de7868:	210c      	movs	r1, #12
c0de786a:	0e02      	lsrs	r2, r0, #24
c0de786c:	f886 1023 	strb.w	r1, [r6, #35]	@ 0x23
c0de7870:	4631      	mov	r1, r6
c0de7872:	f000 ff9d 	bl	c0de87b0 <OUTLINED_FUNCTION_28>
c0de7876:	f000 ff63 	bl	c0de8740 <OUTLINED_FUNCTION_23>
c0de787a:	4631      	mov	r1, r6
c0de787c:	0e02      	lsrs	r2, r0, #24
c0de787e:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de7882:	70ca      	strb	r2, [r1, #3]
c0de7884:	0c02      	lsrs	r2, r0, #16
c0de7886:	0a00      	lsrs	r0, r0, #8
c0de7888:	708a      	strb	r2, [r1, #2]
c0de788a:	7048      	strb	r0, [r1, #1]
c0de788c:	7aa8      	ldrb	r0, [r5, #10]
c0de788e:	b308      	cbz	r0, c0de78d4 <nbgl_layoutAddButton+0xf8>
c0de7890:	4632      	mov	r2, r6
c0de7892:	f896 1026 	ldrb.w	r1, [r6, #38]	@ 0x26
c0de7896:	f896 0023 	ldrb.w	r0, [r6, #35]	@ 0x23
c0de789a:	f812 3f25 	ldrb.w	r3, [r2, #37]!
c0de789e:	f001 f8fc 	bl	c0de8a9a <OUTLINED_FUNCTION_75>
c0de78a2:	ea41 4102 	orr.w	r1, r1, r2, lsl #16
c0de78a6:	f004 ff6d 	bl	c0dec784 <nbgl_getTextWidth>
c0de78aa:	4631      	mov	r1, r6
c0de78ac:	3040      	adds	r0, #64	@ 0x40
c0de78ae:	f811 2f2e 	ldrb.w	r2, [r1, #46]!
c0de78b2:	784b      	ldrb	r3, [r1, #1]
c0de78b4:	788f      	ldrb	r7, [r1, #2]
c0de78b6:	78c9      	ldrb	r1, [r1, #3]
c0de78b8:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de78bc:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de78c0:	ea42 4201 	orr.w	r2, r2, r1, lsl #16
c0de78c4:	2100      	movs	r1, #0
c0de78c6:	b18a      	cbz	r2, c0de78ec <nbgl_layoutAddButton+0x110>
c0de78c8:	7813      	ldrb	r3, [r2, #0]
c0de78ca:	7852      	ldrb	r2, [r2, #1]
c0de78cc:	ea43 2202 	orr.w	r2, r3, r2, lsl #8
c0de78d0:	320c      	adds	r2, #12
c0de78d2:	e00c      	b.n	c0de78ee <nbgl_layoutAddButton+0x112>
c0de78d4:	2000      	movs	r0, #0
c0de78d6:	71f0      	strb	r0, [r6, #7]
c0de78d8:	2058      	movs	r0, #88	@ 0x58
c0de78da:	71b0      	strb	r0, [r6, #6]
c0de78dc:	2001      	movs	r0, #1
c0de78de:	7170      	strb	r0, [r6, #5]
c0de78e0:	20a0      	movs	r0, #160	@ 0xa0
c0de78e2:	7130      	strb	r0, [r6, #4]
c0de78e4:	2003      	movs	r0, #3
c0de78e6:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de78ea:	e01d      	b.n	c0de7928 <nbgl_layoutAddButton+0x14c>
c0de78ec:	2200      	movs	r2, #0
c0de78ee:	71f1      	strb	r1, [r6, #7]
c0de78f0:	2140      	movs	r1, #64	@ 0x40
c0de78f2:	4410      	add	r0, r2
c0de78f4:	71b1      	strb	r1, [r6, #6]
c0de78f6:	2101      	movs	r1, #1
c0de78f8:	7130      	strb	r0, [r6, #4]
c0de78fa:	f886 1022 	strb.w	r1, [r6, #34]	@ 0x22
c0de78fe:	0a01      	lsrs	r1, r0, #8
c0de7900:	7171      	strb	r1, [r6, #5]
c0de7902:	7ae9      	ldrb	r1, [r5, #11]
c0de7904:	2901      	cmp	r1, #1
c0de7906:	d00f      	beq.n	c0de7928 <nbgl_layoutAddButton+0x14c>
c0de7908:	b280      	uxth	r0, r0
c0de790a:	2102      	movs	r1, #2
c0de790c:	f5c0 70d0 	rsb	r0, r0, #416	@ 0x1a0
c0de7910:	fb90 f0f1 	sdiv	r0, r0, r1
c0de7914:	4631      	mov	r1, r6
c0de7916:	f811 2f17 	ldrb.w	r2, [r1, #23]!
c0de791a:	784b      	ldrb	r3, [r1, #1]
c0de791c:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de7920:	4410      	add	r0, r2
c0de7922:	7008      	strb	r0, [r1, #0]
c0de7924:	0a00      	lsrs	r0, r0, #8
c0de7926:	7048      	strb	r0, [r1, #1]
c0de7928:	2000      	movs	r0, #0
c0de792a:	4631      	mov	r1, r6
c0de792c:	f801 0f12 	strb.w	r0, [r1, #18]!
c0de7930:	74f0      	strb	r0, [r6, #19]
c0de7932:	70c8      	strb	r0, [r1, #3]
c0de7934:	7088      	strb	r0, [r1, #2]
c0de7936:	f8d8 10a0 	ldr.w	r1, [r8, #160]	@ 0xa0
c0de793a:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de793e:	784f      	ldrb	r7, [r1, #1]
c0de7940:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de7944:	788c      	ldrb	r4, [r1, #2]
c0de7946:	78c9      	ldrb	r1, [r1, #3]
c0de7948:	ea42 2207 	orr.w	r2, r2, r7, lsl #8
c0de794c:	ea44 2101 	orr.w	r1, r4, r1, lsl #8
c0de7950:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de7954:	2208      	movs	r2, #8
c0de7956:	f841 6023 	str.w	r6, [r1, r3, lsl #2]
c0de795a:	2101      	movs	r1, #1
c0de795c:	7770      	strb	r0, [r6, #29]
c0de795e:	7731      	strb	r1, [r6, #28]
c0de7960:	7aa9      	ldrb	r1, [r5, #10]
c0de7962:	2900      	cmp	r1, #0
c0de7964:	bf08      	it	eq
c0de7966:	2207      	moveq	r2, #7
c0de7968:	77b2      	strb	r2, [r6, #30]
c0de796a:	f8d8 10a0 	ldr.w	r1, [r8, #160]	@ 0xa0
c0de796e:	f891 2020 	ldrb.w	r2, [r1, #32]
c0de7972:	3201      	adds	r2, #1
c0de7974:	f881 2020 	strb.w	r2, [r1, #32]
c0de7978:	b006      	add	sp, #24
c0de797a:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de797e:	2005      	movs	r0, #5
c0de7980:	f8ad 0000 	strh.w	r0, [sp]
c0de7984:	e9d5 0100 	ldrd	r0, r1, [r5]
c0de7988:	9001      	str	r0, [sp, #4]
c0de798a:	7b28      	ldrb	r0, [r5, #12]
c0de798c:	9102      	str	r1, [sp, #8]
c0de798e:	4669      	mov	r1, sp
c0de7990:	f001 f879 	bl	c0de8a86 <OUTLINED_FUNCTION_73>
c0de7994:	f7fe f8a6 	bl	c0de5ae4 <nbgl_layoutAddExtendedFooter>
c0de7998:	e7ee      	b.n	c0de7978 <nbgl_layoutAddButton+0x19c>

c0de799a <nbgl_layoutAddLongPressButton>:
c0de799a:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de799c:	9102      	str	r1, [sp, #8]
c0de799e:	2100      	movs	r1, #0
c0de79a0:	f88d 300d 	strb.w	r3, [sp, #13]
c0de79a4:	f88d 200c 	strb.w	r2, [sp, #12]
c0de79a8:	f88d 1004 	strb.w	r1, [sp, #4]
c0de79ac:	b118      	cbz	r0, c0de79b6 <nbgl_layoutAddLongPressButton+0x1c>
c0de79ae:	a901      	add	r1, sp, #4
c0de79b0:	f7fd fcf0 	bl	c0de5394 <nbgl_layoutAddUpFooter>
c0de79b4:	e001      	b.n	c0de79ba <nbgl_layoutAddLongPressButton+0x20>
c0de79b6:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de79ba:	b006      	add	sp, #24
c0de79bc:	bd80      	pop	{r7, pc}

c0de79be <nbgl_layoutAddFooter>:
c0de79be:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de79c0:	9101      	str	r1, [sp, #4]
c0de79c2:	f240 1101 	movw	r1, #257	@ 0x101
c0de79c6:	f88d 2009 	strb.w	r2, [sp, #9]
c0de79ca:	2200      	movs	r2, #0
c0de79cc:	f88d 300a 	strb.w	r3, [sp, #10]
c0de79d0:	f8ad 1000 	strh.w	r1, [sp]
c0de79d4:	4669      	mov	r1, sp
c0de79d6:	f88d 2008 	strb.w	r2, [sp, #8]
c0de79da:	f7fe f883 	bl	c0de5ae4 <nbgl_layoutAddExtendedFooter>
c0de79de:	b006      	add	sp, #24
c0de79e0:	bd80      	pop	{r7, pc}

c0de79e2 <nbgl_layoutAddSplitFooter>:
c0de79e2:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de79e4:	9101      	str	r1, [sp, #4]
c0de79e6:	f44f 7181 	mov.w	r1, #258	@ 0x102
c0de79ea:	f88d 200c 	strb.w	r2, [sp, #12]
c0de79ee:	9302      	str	r3, [sp, #8]
c0de79f0:	f8ad 1000 	strh.w	r1, [sp]
c0de79f4:	9909      	ldr	r1, [sp, #36]	@ 0x24
c0de79f6:	f88d 100e 	strb.w	r1, [sp, #14]
c0de79fa:	9908      	ldr	r1, [sp, #32]
c0de79fc:	f88d 100d 	strb.w	r1, [sp, #13]
c0de7a00:	4669      	mov	r1, sp
c0de7a02:	f7fe f86f 	bl	c0de5ae4 <nbgl_layoutAddExtendedFooter>
c0de7a06:	b006      	add	sp, #24
c0de7a08:	bd80      	pop	{r7, pc}
	...

c0de7a0c <nbgl_layoutAddHeader>:
c0de7a0c:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de7a10:	2800      	cmp	r0, #0
c0de7a12:	f000 8239 	beq.w	c0de7e88 <nbgl_layoutAddHeader+0x47c>
c0de7a16:	460d      	mov	r5, r1
c0de7a18:	b119      	cbz	r1, c0de7a22 <nbgl_layoutAddHeader+0x16>
c0de7a1a:	4604      	mov	r4, r0
c0de7a1c:	7828      	ldrb	r0, [r5, #0]
c0de7a1e:	2806      	cmp	r0, #6
c0de7a20:	d903      	bls.n	c0de7a2a <nbgl_layoutAddHeader+0x1e>
c0de7a22:	f06f 0001 	mvn.w	r0, #1
c0de7a26:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de7a2a:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de7a2e:	2601      	movs	r6, #1
c0de7a30:	f000 fe3d 	bl	c0de86ae <OUTLINED_FUNCTION_16>
c0de7a34:	2100      	movs	r1, #0
c0de7a36:	7146      	strb	r6, [r0, #5]
c0de7a38:	77c1      	strb	r1, [r0, #31]
c0de7a3a:	21e0      	movs	r1, #224	@ 0xe0
c0de7a3c:	7101      	strb	r1, [r0, #4]
c0de7a3e:	60e0      	str	r0, [r4, #12]
c0de7a40:	f000 ffe8 	bl	c0de8a14 <OUTLINED_FUNCTION_64>
c0de7a44:	68e1      	ldr	r1, [r4, #12]
c0de7a46:	0a02      	lsrs	r2, r0, #8
c0de7a48:	0e03      	lsrs	r3, r0, #24
c0de7a4a:	f881 2023 	strb.w	r2, [r1, #35]	@ 0x23
c0de7a4e:	2202      	movs	r2, #2
c0de7a50:	f001 f804 	bl	c0de8a5c <OUTLINED_FUNCTION_70>
c0de7a54:	70d3      	strb	r3, [r2, #3]
c0de7a56:	7828      	ldrb	r0, [r5, #0]
c0de7a58:	1e42      	subs	r2, r0, #1
c0de7a5a:	2a02      	cmp	r2, #2
c0de7a5c:	d311      	bcc.n	c0de7a82 <nbgl_layoutAddHeader+0x76>
c0de7a5e:	2806      	cmp	r0, #6
c0de7a60:	f000 80ab 	beq.w	c0de7bba <nbgl_layoutAddHeader+0x1ae>
c0de7a64:	2803      	cmp	r0, #3
c0de7a66:	f000 81d9 	beq.w	c0de7e1c <nbgl_layoutAddHeader+0x410>
c0de7a6a:	2804      	cmp	r0, #4
c0de7a6c:	f000 80d5 	beq.w	c0de7c1a <nbgl_layoutAddHeader+0x20e>
c0de7a70:	2805      	cmp	r0, #5
c0de7a72:	d006      	beq.n	c0de7a82 <nbgl_layoutAddHeader+0x76>
c0de7a74:	2800      	cmp	r0, #0
c0de7a76:	d1d4      	bne.n	c0de7a22 <nbgl_layoutAddHeader+0x16>
c0de7a78:	88a8      	ldrh	r0, [r5, #4]
c0de7a7a:	7188      	strb	r0, [r1, #6]
c0de7a7c:	0a00      	lsrs	r0, r0, #8
c0de7a7e:	71c8      	strb	r0, [r1, #7]
c0de7a80:	e1cc      	b.n	c0de7e1c <nbgl_layoutAddHeader+0x410>
c0de7a82:	f000 ff65 	bl	c0de8950 <OUTLINED_FUNCTION_49>
c0de7a86:	9001      	str	r0, [sp, #4]
c0de7a88:	7828      	ldrb	r0, [r5, #0]
c0de7a8a:	210c      	movs	r1, #12
c0de7a8c:	2805      	cmp	r0, #5
c0de7a8e:	bf08      	it	eq
c0de7a90:	210d      	moveq	r1, #13
c0de7a92:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de7a96:	f815 b001 	ldrb.w	fp, [r5, r1]
c0de7a9a:	f000 fe0c 	bl	c0de86b6 <OUTLINED_FUNCTION_17>
c0de7a9e:	4606      	mov	r6, r0
c0de7aa0:	f04f 0a03 	mov.w	sl, #3
c0de7aa4:	f1bb 0fff 	cmp.w	fp, #255	@ 0xff
c0de7aa8:	d00d      	beq.n	c0de7ac6 <nbgl_layoutAddHeader+0xba>
c0de7aaa:	7828      	ldrb	r0, [r5, #0]
c0de7aac:	210d      	movs	r1, #13
c0de7aae:	465a      	mov	r2, fp
c0de7ab0:	2805      	cmp	r0, #5
c0de7ab2:	bf08      	it	eq
c0de7ab4:	210f      	moveq	r1, #15
c0de7ab6:	5c6b      	ldrb	r3, [r5, r1]
c0de7ab8:	f000 fd5e 	bl	c0de8578 <OUTLINED_FUNCTION_6>
c0de7abc:	2800      	cmp	r0, #0
c0de7abe:	f000 81e3 	beq.w	c0de7e88 <nbgl_layoutAddHeader+0x47c>
c0de7ac2:	2000      	movs	r0, #0
c0de7ac4:	e000      	b.n	c0de7ac8 <nbgl_layoutAddHeader+0xbc>
c0de7ac6:	2003      	movs	r0, #3
c0de7ac8:	f886 0021 	strb.w	r0, [r6, #33]	@ 0x21
c0de7acc:	2004      	movs	r0, #4
c0de7ace:	f04f 0800 	mov.w	r8, #0
c0de7ad2:	2160      	movs	r1, #96	@ 0x60
c0de7ad4:	f886 a01f 	strb.w	sl, [r6, #31]
c0de7ad8:	f886 a020 	strb.w	sl, [r6, #32]
c0de7adc:	75b0      	strb	r0, [r6, #22]
c0de7ade:	4630      	mov	r0, r6
c0de7ae0:	71b1      	strb	r1, [r6, #6]
c0de7ae2:	2168      	movs	r1, #104	@ 0x68
c0de7ae4:	f886 8026 	strb.w	r8, [r6, #38]	@ 0x26
c0de7ae8:	f886 8007 	strb.w	r8, [r6, #7]
c0de7aec:	f886 8005 	strb.w	r8, [r6, #5]
c0de7af0:	f800 8f25 	strb.w	r8, [r0, #37]!
c0de7af4:	7131      	strb	r1, [r6, #4]
c0de7af6:	f880 8003 	strb.w	r8, [r0, #3]
c0de7afa:	f880 8002 	strb.w	r8, [r0, #2]
c0de7afe:	48e4      	ldr	r0, [pc, #912]	@ (c0de7e90 <nbgl_layoutAddHeader+0x484>)
c0de7b00:	4478      	add	r0, pc
c0de7b02:	f004 fffd 	bl	c0decb00 <pic>
c0de7b06:	4631      	mov	r1, r6
c0de7b08:	0e02      	lsrs	r2, r0, #24
c0de7b0a:	f886 801d 	strb.w	r8, [r6, #29]
c0de7b0e:	f000 fd5f 	bl	c0de85d0 <OUTLINED_FUNCTION_9>
c0de7b12:	f1bb 00ff 	subs.w	r0, fp, #255	@ 0xff
c0de7b16:	bf18      	it	ne
c0de7b18:	2001      	movne	r0, #1
c0de7b1a:	7730      	strb	r0, [r6, #28]
c0de7b1c:	9f01      	ldr	r7, [sp, #4]
c0de7b1e:	68e1      	ldr	r1, [r4, #12]
c0de7b20:	2006      	movs	r0, #6
c0de7b22:	77b0      	strb	r0, [r6, #30]
c0de7b24:	f891 0020 	ldrb.w	r0, [r1, #32]
c0de7b28:	3001      	adds	r0, #1
c0de7b2a:	2f00      	cmp	r7, #0
c0de7b2c:	f881 0020 	strb.w	r0, [r1, #32]
c0de7b30:	f000 809a 	beq.w	c0de7c68 <nbgl_layoutAddHeader+0x25c>
c0de7b34:	7828      	ldrb	r0, [r5, #0]
c0de7b36:	f04f 0a00 	mov.w	sl, #0
c0de7b3a:	2802      	cmp	r0, #2
c0de7b3c:	d122      	bne.n	c0de7b84 <nbgl_layoutAddHeader+0x178>
c0de7b3e:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de7b42:	f000 fde7 	bl	c0de8714 <OUTLINED_FUNCTION_21>
c0de7b46:	4606      	mov	r6, r0
c0de7b48:	f000 fdfa 	bl	c0de8740 <OUTLINED_FUNCTION_23>
c0de7b4c:	4631      	mov	r1, r6
c0de7b4e:	0e02      	lsrs	r2, r0, #24
c0de7b50:	f886 a01f 	strb.w	sl, [r6, #31]
c0de7b54:	46b2      	mov	sl, r6
c0de7b56:	f000 ff2d 	bl	c0de89b4 <OUTLINED_FUNCTION_56>
c0de7b5a:	68e0      	ldr	r0, [r4, #12]
c0de7b5c:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de7b60:	7843      	ldrb	r3, [r0, #1]
c0de7b62:	f810 cc02 	ldrb.w	ip, [r0, #-2]
c0de7b66:	7882      	ldrb	r2, [r0, #2]
c0de7b68:	78c0      	ldrb	r0, [r0, #3]
c0de7b6a:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de7b6e:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de7b72:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de7b76:	f840 602c 	str.w	r6, [r0, ip, lsl #2]
c0de7b7a:	2005      	movs	r0, #5
c0de7b7c:	75b0      	strb	r0, [r6, #22]
c0de7b7e:	68e0      	ldr	r0, [r4, #12]
c0de7b80:	f000 fcb0 	bl	c0de84e4 <OUTLINED_FUNCTION_1>
c0de7b84:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de7b88:	f000 fca8 	bl	c0de84dc <OUTLINED_FUNCTION_0>
c0de7b8c:	782b      	ldrb	r3, [r5, #0]
c0de7b8e:	4680      	mov	r8, r0
c0de7b90:	2b05      	cmp	r3, #5
c0de7b92:	d16c      	bne.n	c0de7c6e <nbgl_layoutAddHeader+0x262>
c0de7b94:	7b2a      	ldrb	r2, [r5, #12]
c0de7b96:	2aff      	cmp	r2, #255	@ 0xff
c0de7b98:	d068      	beq.n	c0de7c6c <nbgl_layoutAddHeader+0x260>
c0de7b9a:	7beb      	ldrb	r3, [r5, #15]
c0de7b9c:	4620      	mov	r0, r4
c0de7b9e:	4641      	mov	r1, r8
c0de7ba0:	f7fd f97a 	bl	c0de4e98 <layoutAddCallbackObj>
c0de7ba4:	2800      	cmp	r0, #0
c0de7ba6:	f000 816f 	beq.w	c0de7e88 <nbgl_layoutAddHeader+0x47c>
c0de7baa:	2000      	movs	r0, #0
c0de7bac:	f888 001d 	strb.w	r0, [r8, #29]
c0de7bb0:	2001      	movs	r0, #1
c0de7bb2:	f888 001c 	strb.w	r0, [r8, #28]
c0de7bb6:	782b      	ldrb	r3, [r5, #0]
c0de7bb8:	e059      	b.n	c0de7c6e <nbgl_layoutAddHeader+0x262>
c0de7bba:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de7bbe:	f000 fc8d 	bl	c0de84dc <OUTLINED_FUNCTION_0>
c0de7bc2:	4606      	mov	r6, r0
c0de7bc4:	7a2a      	ldrb	r2, [r5, #8]
c0de7bc6:	7a6b      	ldrb	r3, [r5, #9]
c0de7bc8:	f000 fcd6 	bl	c0de8578 <OUTLINED_FUNCTION_6>
c0de7bcc:	2800      	cmp	r0, #0
c0de7bce:	f000 815b 	beq.w	c0de7e88 <nbgl_layoutAddHeader+0x47c>
c0de7bd2:	2020      	movs	r0, #32
c0de7bd4:	4637      	mov	r7, r6
c0de7bd6:	f04f 0a00 	mov.w	sl, #0
c0de7bda:	f04f 0806 	mov.w	r8, #6
c0de7bde:	f04f 0b01 	mov.w	fp, #1
c0de7be2:	75f0      	strb	r0, [r6, #23]
c0de7be4:	20a0      	movs	r0, #160	@ 0xa0
c0de7be6:	f886 a01f 	strb.w	sl, [r6, #31]
c0de7bea:	f886 a018 	strb.w	sl, [r6, #24]
c0de7bee:	f886 8016 	strb.w	r8, [r6, #22]
c0de7bf2:	f886 b005 	strb.w	fp, [r6, #5]
c0de7bf6:	7130      	strb	r0, [r6, #4]
c0de7bf8:	2060      	movs	r0, #96	@ 0x60
c0de7bfa:	f807 0f06 	strb.w	r0, [r7, #6]!
c0de7bfe:	f887 a001 	strb.w	sl, [r7, #1]
c0de7c02:	f000 fd9d 	bl	c0de8740 <OUTLINED_FUNCTION_23>
c0de7c06:	f000 fee7 	bl	c0de89d8 <OUTLINED_FUNCTION_58>
c0de7c0a:	f886 8020 	strb.w	r8, [r6, #32]
c0de7c0e:	f000 fcb7 	bl	c0de8580 <OUTLINED_FUNCTION_7>
c0de7c12:	f000 fee6 	bl	c0de89e2 <OUTLINED_FUNCTION_59>
c0de7c16:	77b0      	strb	r0, [r6, #30]
c0de7c18:	e01e      	b.n	c0de7c58 <nbgl_layoutAddHeader+0x24c>
c0de7c1a:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de7c1e:	f000 fc5d 	bl	c0de84dc <OUTLINED_FUNCTION_0>
c0de7c22:	4606      	mov	r6, r0
c0de7c24:	21a0      	movs	r1, #160	@ 0xa0
c0de7c26:	2000      	movs	r0, #0
c0de7c28:	f04f 0801 	mov.w	r8, #1
c0de7c2c:	7131      	strb	r1, [r6, #4]
c0de7c2e:	2160      	movs	r1, #96	@ 0x60
c0de7c30:	4637      	mov	r7, r6
c0de7c32:	77f0      	strb	r0, [r6, #31]
c0de7c34:	f886 8005 	strb.w	r8, [r6, #5]
c0de7c38:	f807 1f06 	strb.w	r1, [r7, #6]!
c0de7c3c:	7078      	strb	r0, [r7, #1]
c0de7c3e:	f000 fd7f 	bl	c0de8740 <OUTLINED_FUNCTION_23>
c0de7c42:	4631      	mov	r1, r6
c0de7c44:	0e02      	lsrs	r2, r0, #24
c0de7c46:	f886 8024 	strb.w	r8, [r6, #36]	@ 0x24
c0de7c4a:	f000 fc99 	bl	c0de8580 <OUTLINED_FUNCTION_7>
c0de7c4e:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de7c52:	2005      	movs	r0, #5
c0de7c54:	f886 0020 	strb.w	r0, [r6, #32]
c0de7c58:	68e1      	ldr	r1, [r4, #12]
c0de7c5a:	787a      	ldrb	r2, [r7, #1]
c0de7c5c:	7838      	ldrb	r0, [r7, #0]
c0de7c5e:	71ca      	strb	r2, [r1, #7]
c0de7c60:	7188      	strb	r0, [r1, #6]
c0de7c62:	f000 fec9 	bl	c0de89f8 <OUTLINED_FUNCTION_61>
c0de7c66:	e0d9      	b.n	c0de7e1c <nbgl_layoutAddHeader+0x410>
c0de7c68:	7828      	ldrb	r0, [r5, #0]
c0de7c6a:	e096      	b.n	c0de7d9a <nbgl_layoutAddHeader+0x38e>
c0de7c6c:	2305      	movs	r3, #5
c0de7c6e:	68e2      	ldr	r2, [r4, #12]
c0de7c70:	f04f 0e00 	mov.w	lr, #0
c0de7c74:	f04f 0c05 	mov.w	ip, #5
c0de7c78:	f888 e01f 	strb.w	lr, [r8, #31]
c0de7c7c:	f888 c016 	strb.w	ip, [r8, #22]
c0de7c80:	7916      	ldrb	r6, [r2, #4]
c0de7c82:	7952      	ldrb	r2, [r2, #5]
c0de7c84:	ea46 2602 	orr.w	r6, r6, r2, lsl #8
c0de7c88:	f1a6 02d0 	sub.w	r2, r6, #208	@ 0xd0
c0de7c8c:	0a10      	lsrs	r0, r2, #8
c0de7c8e:	f888 2004 	strb.w	r2, [r8, #4]
c0de7c92:	2b02      	cmp	r3, #2
c0de7c94:	f888 0005 	strb.w	r0, [r8, #5]
c0de7c98:	d117      	bne.n	c0de7cca <nbgl_layoutAddHeader+0x2be>
c0de7c9a:	4650      	mov	r0, sl
c0de7c9c:	f810 2f21 	ldrb.w	r2, [r0, #33]!
c0de7ca0:	7843      	ldrb	r3, [r0, #1]
c0de7ca2:	7881      	ldrb	r1, [r0, #2]
c0de7ca4:	78c0      	ldrb	r0, [r0, #3]
c0de7ca6:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de7caa:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de7cae:	ea42 4000 	orr.w	r0, r2, r0, lsl #16
c0de7cb2:	7801      	ldrb	r1, [r0, #0]
c0de7cb4:	7840      	ldrb	r0, [r0, #1]
c0de7cb6:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de7cba:	1a30      	subs	r0, r6, r0
c0de7cbc:	f1a0 02e0 	sub.w	r2, r0, #224	@ 0xe0
c0de7cc0:	0a10      	lsrs	r0, r2, #8
c0de7cc2:	f888 2004 	strb.w	r2, [r8, #4]
c0de7cc6:	f888 0005 	strb.w	r0, [r8, #5]
c0de7cca:	4640      	mov	r0, r8
c0de7ccc:	0e39      	lsrs	r1, r7, #24
c0de7cce:	b292      	uxth	r2, r2
c0de7cd0:	2301      	movs	r3, #1
c0de7cd2:	f800 7f26 	strb.w	r7, [r0, #38]!
c0de7cd6:	70c1      	strb	r1, [r0, #3]
c0de7cd8:	0c39      	lsrs	r1, r7, #16
c0de7cda:	f800 ec1f 	strb.w	lr, [r0, #-31]
c0de7cde:	f800 cc06 	strb.w	ip, [r0, #-6]
c0de7ce2:	7081      	strb	r1, [r0, #2]
c0de7ce4:	0a39      	lsrs	r1, r7, #8
c0de7ce6:	7041      	strb	r1, [r0, #1]
c0de7ce8:	2160      	movs	r1, #96	@ 0x60
c0de7cea:	f800 1c20 	strb.w	r1, [r0, #-32]
c0de7cee:	210c      	movs	r1, #12
c0de7cf0:	f800 1c04 	strb.w	r1, [r0, #-4]
c0de7cf4:	2101      	movs	r1, #1
c0de7cf6:	f800 1c02 	strb.w	r1, [r0, #-2]
c0de7cfa:	200c      	movs	r0, #12
c0de7cfc:	4639      	mov	r1, r7
c0de7cfe:	f004 fd3c 	bl	c0dec77a <nbgl_getTextNbLinesInWidth>
c0de7d02:	7828      	ldrb	r0, [r5, #0]
c0de7d04:	2802      	cmp	r0, #2
c0de7d06:	d115      	bne.n	c0de7d34 <nbgl_layoutAddHeader+0x328>
c0de7d08:	4646      	mov	r6, r8
c0de7d0a:	f816 cf26 	ldrb.w	ip, [r6, #38]!
c0de7d0e:	7872      	ldrb	r2, [r6, #1]
c0de7d10:	78b3      	ldrb	r3, [r6, #2]
c0de7d12:	78f1      	ldrb	r1, [r6, #3]
c0de7d14:	f816 0c04 	ldrb.w	r0, [r6, #-4]
c0de7d18:	ea4c 2202 	orr.w	r2, ip, r2, lsl #8
c0de7d1c:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de7d20:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de7d24:	f004 fd2e 	bl	c0dec784 <nbgl_getTextWidth>
c0de7d28:	f806 0c22 	strb.w	r0, [r6, #-34]
c0de7d2c:	0a00      	lsrs	r0, r0, #8
c0de7d2e:	f806 0c21 	strb.w	r0, [r6, #-33]
c0de7d32:	7828      	ldrb	r0, [r5, #0]
c0de7d34:	68e1      	ldr	r1, [r4, #12]
c0de7d36:	f000 fd65 	bl	c0de8804 <OUTLINED_FUNCTION_32>
c0de7d3a:	f841 8023 	str.w	r8, [r1, r3, lsl #2]
c0de7d3e:	68e1      	ldr	r1, [r4, #12]
c0de7d40:	f891 2020 	ldrb.w	r2, [r1, #32]
c0de7d44:	3201      	adds	r2, #1
c0de7d46:	2802      	cmp	r0, #2
c0de7d48:	f881 2020 	strb.w	r2, [r1, #32]
c0de7d4c:	d125      	bne.n	c0de7d9a <nbgl_layoutAddHeader+0x38e>
c0de7d4e:	f898 0004 	ldrb.w	r0, [r8, #4]
c0de7d52:	f898 2005 	ldrb.w	r2, [r8, #5]
c0de7d56:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de7d5a:	f06f 0207 	mvn.w	r2, #7
c0de7d5e:	eba2 0050 	sub.w	r0, r2, r0, lsr #1
c0de7d62:	f81a 2f21 	ldrb.w	r2, [sl, #33]!
c0de7d66:	f80a 0c0a 	strb.w	r0, [sl, #-10]
c0de7d6a:	0a00      	lsrs	r0, r0, #8
c0de7d6c:	f89a 3002 	ldrb.w	r3, [sl, #2]
c0de7d70:	f89a 6003 	ldrb.w	r6, [sl, #3]
c0de7d74:	f80a 0c09 	strb.w	r0, [sl, #-9]
c0de7d78:	f89a 0001 	ldrb.w	r0, [sl, #1]
c0de7d7c:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de7d80:	ea43 2206 	orr.w	r2, r3, r6, lsl #8
c0de7d84:	f000 fea3 	bl	c0de8ace <OUTLINED_FUNCTION_81>
c0de7d88:	2208      	movs	r2, #8
c0de7d8a:	eb02 0050 	add.w	r0, r2, r0, lsr #1
c0de7d8e:	f888 0017 	strb.w	r0, [r8, #23]
c0de7d92:	0a00      	lsrs	r0, r0, #8
c0de7d94:	f888 0018 	strb.w	r0, [r8, #24]
c0de7d98:	e03c      	b.n	c0de7e14 <nbgl_layoutAddHeader+0x408>
c0de7d9a:	2805      	cmp	r0, #5
c0de7d9c:	d13a      	bne.n	c0de7e14 <nbgl_layoutAddHeader+0x408>
c0de7d9e:	6868      	ldr	r0, [r5, #4]
c0de7da0:	b3c0      	cbz	r0, c0de7e14 <nbgl_layoutAddHeader+0x408>
c0de7da2:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de7da6:	f000 fc86 	bl	c0de86b6 <OUTLINED_FUNCTION_17>
c0de7daa:	7baa      	ldrb	r2, [r5, #14]
c0de7dac:	4606      	mov	r6, r0
c0de7dae:	2aff      	cmp	r2, #255	@ 0xff
c0de7db0:	d008      	beq.n	c0de7dc4 <nbgl_layoutAddHeader+0x3b8>
c0de7db2:	7beb      	ldrb	r3, [r5, #15]
c0de7db4:	f000 fbe0 	bl	c0de8578 <OUTLINED_FUNCTION_6>
c0de7db8:	2800      	cmp	r0, #0
c0de7dba:	d065      	beq.n	c0de7e88 <nbgl_layoutAddHeader+0x47c>
c0de7dbc:	2000      	movs	r0, #0
c0de7dbe:	7770      	strb	r0, [r6, #29]
c0de7dc0:	2001      	movs	r0, #1
c0de7dc2:	7730      	strb	r0, [r6, #28]
c0de7dc4:	2003      	movs	r0, #3
c0de7dc6:	2106      	movs	r1, #6
c0de7dc8:	2260      	movs	r2, #96	@ 0x60
c0de7dca:	77f0      	strb	r0, [r6, #31]
c0de7dcc:	75b1      	strb	r1, [r6, #22]
c0de7dce:	7ba9      	ldrb	r1, [r5, #14]
c0de7dd0:	71b2      	strb	r2, [r6, #6]
c0de7dd2:	2268      	movs	r2, #104	@ 0x68
c0de7dd4:	f886 0020 	strb.w	r0, [r6, #32]
c0de7dd8:	2000      	movs	r0, #0
c0de7dda:	7132      	strb	r2, [r6, #4]
c0de7ddc:	4632      	mov	r2, r6
c0de7dde:	f886 0026 	strb.w	r0, [r6, #38]	@ 0x26
c0de7de2:	71f0      	strb	r0, [r6, #7]
c0de7de4:	7170      	strb	r0, [r6, #5]
c0de7de6:	f802 0f25 	strb.w	r0, [r2, #37]!
c0de7dea:	70d0      	strb	r0, [r2, #3]
c0de7dec:	7090      	strb	r0, [r2, #2]
c0de7dee:	f1a1 00ff 	sub.w	r0, r1, #255	@ 0xff
c0de7df2:	fab0 f080 	clz	r0, r0
c0de7df6:	0940      	lsrs	r0, r0, #5
c0de7df8:	0040      	lsls	r0, r0, #1
c0de7dfa:	f886 0021 	strb.w	r0, [r6, #33]	@ 0x21
c0de7dfe:	f000 fc9f 	bl	c0de8740 <OUTLINED_FUNCTION_23>
c0de7e02:	4631      	mov	r1, r6
c0de7e04:	0e02      	lsrs	r2, r0, #24
c0de7e06:	f000 fbe3 	bl	c0de85d0 <OUTLINED_FUNCTION_9>
c0de7e0a:	2008      	movs	r0, #8
c0de7e0c:	68e1      	ldr	r1, [r4, #12]
c0de7e0e:	77b0      	strb	r0, [r6, #30]
c0de7e10:	f000 fdf2 	bl	c0de89f8 <OUTLINED_FUNCTION_61>
c0de7e14:	2000      	movs	r0, #0
c0de7e16:	71c8      	strb	r0, [r1, #7]
c0de7e18:	2060      	movs	r0, #96	@ 0x60
c0de7e1a:	7188      	strb	r0, [r1, #6]
c0de7e1c:	7868      	ldrb	r0, [r5, #1]
c0de7e1e:	b160      	cbz	r0, c0de7e3a <nbgl_layoutAddHeader+0x42e>
c0de7e20:	f000 fca1 	bl	c0de8766 <OUTLINED_FUNCTION_25>
c0de7e24:	68e1      	ldr	r1, [r4, #12]
c0de7e26:	f000 fb8a 	bl	c0de853e <OUTLINED_FUNCTION_4>
c0de7e2a:	2103      	movs	r1, #3
c0de7e2c:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de7e30:	2108      	movs	r1, #8
c0de7e32:	7581      	strb	r1, [r0, #22]
c0de7e34:	68e1      	ldr	r1, [r4, #12]
c0de7e36:	f000 fddf 	bl	c0de89f8 <OUTLINED_FUNCTION_61>
c0de7e3a:	68a0      	ldr	r0, [r4, #8]
c0de7e3c:	6001      	str	r1, [r0, #0]
c0de7e3e:	68e0      	ldr	r0, [r4, #12]
c0de7e40:	f8d4 10a0 	ldr.w	r1, [r4, #160]	@ 0xa0
c0de7e44:	4602      	mov	r2, r0
c0de7e46:	f812 3f06 	ldrb.w	r3, [r2, #6]!
c0de7e4a:	7856      	ldrb	r6, [r2, #1]
c0de7e4c:	f801 0f12 	strb.w	r0, [r1, #18]!
c0de7e50:	ea43 2306 	orr.w	r3, r3, r6, lsl #8
c0de7e54:	f811 6d0c 	ldrb.w	r6, [r1, #-12]!
c0de7e58:	784f      	ldrb	r7, [r1, #1]
c0de7e5a:	ea46 2607 	orr.w	r6, r6, r7, lsl #8
c0de7e5e:	1af3      	subs	r3, r6, r3
c0de7e60:	700b      	strb	r3, [r1, #0]
c0de7e62:	0a1b      	lsrs	r3, r3, #8
c0de7e64:	704b      	strb	r3, [r1, #1]
c0de7e66:	782b      	ldrb	r3, [r5, #0]
c0de7e68:	f884 30aa 	strb.w	r3, [r4, #170]	@ 0xaa
c0de7e6c:	0e03      	lsrs	r3, r0, #24
c0de7e6e:	73cb      	strb	r3, [r1, #15]
c0de7e70:	0c03      	lsrs	r3, r0, #16
c0de7e72:	0a00      	lsrs	r0, r0, #8
c0de7e74:	7348      	strb	r0, [r1, #13]
c0de7e76:	2007      	movs	r0, #7
c0de7e78:	738b      	strb	r3, [r1, #14]
c0de7e7a:	7408      	strb	r0, [r1, #16]
c0de7e7c:	7810      	ldrb	r0, [r2, #0]
c0de7e7e:	7851      	ldrb	r1, [r2, #1]
c0de7e80:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de7e84:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de7e88:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de7e8c:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de7e90:	00006077 	.word	0x00006077

c0de7e94 <nbgl_layoutAddProgressIndicator>:
c0de7e94:	b51f      	push	{r0, r1, r2, r3, r4, lr}
c0de7e96:	9c07      	ldr	r4, [sp, #28]
c0de7e98:	f88d 1008 	strb.w	r1, [sp, #8]
c0de7e9c:	2100      	movs	r1, #0
c0de7e9e:	f88d 300a 	strb.w	r3, [sp, #10]
c0de7ea2:	f88d 2009 	strb.w	r2, [sp, #9]
c0de7ea6:	9101      	str	r1, [sp, #4]
c0de7ea8:	2103      	movs	r1, #3
c0de7eaa:	f88d 400d 	strb.w	r4, [sp, #13]
c0de7eae:	24ff      	movs	r4, #255	@ 0xff
c0de7eb0:	f8ad 1000 	strh.w	r1, [sp]
c0de7eb4:	4669      	mov	r1, sp
c0de7eb6:	f88d 400c 	strb.w	r4, [sp, #12]
c0de7eba:	9c06      	ldr	r4, [sp, #24]
c0de7ebc:	f88d 400b 	strb.w	r4, [sp, #11]
c0de7ec0:	f7ff fda4 	bl	c0de7a0c <nbgl_layoutAddHeader>
c0de7ec4:	b004      	add	sp, #16
c0de7ec6:	bd10      	pop	{r4, pc}

c0de7ec8 <nbgl_layoutAddSpinner>:
c0de7ec8:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de7ecc:	b088      	sub	sp, #32
c0de7ece:	2800      	cmp	r0, #0
c0de7ed0:	f000 811a 	beq.w	c0de8108 <nbgl_layoutAddSpinner+0x240>
c0de7ed4:	9101      	str	r1, [sp, #4]
c0de7ed6:	f000 fdf1 	bl	c0de8abc <OUTLINED_FUNCTION_79>
c0de7eda:	469a      	mov	sl, r3
c0de7edc:	2601      	movs	r6, #1
c0de7ede:	4f8d      	ldr	r7, [pc, #564]	@ (c0de8114 <nbgl_layoutAddSpinner+0x24c>)
c0de7ee0:	9203      	str	r2, [sp, #12]
c0de7ee2:	08c1      	lsrs	r1, r0, #3
c0de7ee4:	2001      	movs	r0, #1
c0de7ee6:	447f      	add	r7, pc
c0de7ee8:	47b8      	blx	r7
c0de7eea:	4683      	mov	fp, r0
c0de7eec:	2003      	movs	r0, #3
c0de7eee:	463d      	mov	r5, r7
c0de7ef0:	f88b 0020 	strb.w	r0, [fp, #32]
c0de7ef4:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de7ef8:	08c1      	lsrs	r1, r0, #3
c0de7efa:	2003      	movs	r0, #3
c0de7efc:	f004 fc24 	bl	c0dec748 <nbgl_containerPoolGet>
c0de7f00:	2100      	movs	r1, #0
c0de7f02:	f88b 6005 	strb.w	r6, [fp, #5]
c0de7f06:	465e      	mov	r6, fp
c0de7f08:	270d      	movs	r7, #13
c0de7f0a:	f88b 101f 	strb.w	r1, [fp, #31]
c0de7f0e:	21a0      	movs	r1, #160	@ 0xa0
c0de7f10:	f806 0f22 	strb.w	r0, [r6, #34]!
c0de7f14:	f88b 1004 	strb.w	r1, [fp, #4]
c0de7f18:	2105      	movs	r1, #5
c0de7f1a:	f88b 1016 	strb.w	r1, [fp, #22]
c0de7f1e:	0e01      	lsrs	r1, r0, #24
c0de7f20:	f000 fd65 	bl	c0de89ee <OUTLINED_FUNCTION_60>
c0de7f24:	f88b 0023 	strb.w	r0, [fp, #35]	@ 0x23
c0de7f28:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de7f2c:	08c1      	lsrs	r1, r0, #3
c0de7f2e:	200d      	movs	r0, #13
c0de7f30:	47a8      	blx	r5
c0de7f32:	4680      	mov	r8, r0
c0de7f34:	f880 a01f 	strb.w	sl, [r0, #31]
c0de7f38:	2002      	movs	r0, #2
c0de7f3a:	7831      	ldrb	r1, [r6, #0]
c0de7f3c:	78b2      	ldrb	r2, [r6, #2]
c0de7f3e:	78f3      	ldrb	r3, [r6, #3]
c0de7f40:	f8cd a008 	str.w	sl, [sp, #8]
c0de7f44:	46da      	mov	sl, fp
c0de7f46:	9404      	str	r4, [sp, #16]
c0de7f48:	f888 0016 	strb.w	r0, [r8, #22]
c0de7f4c:	f89b 0023 	ldrb.w	r0, [fp, #35]	@ 0x23
c0de7f50:	f000 fcf7 	bl	c0de8942 <OUTLINED_FUNCTION_48>
c0de7f54:	f8c0 8000 	str.w	r8, [r0]
c0de7f58:	f81a 0f06 	ldrb.w	r0, [sl, #6]!
c0de7f5c:	f89a 1001 	ldrb.w	r1, [sl, #1]
c0de7f60:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de7f64:	3030      	adds	r0, #48	@ 0x30
c0de7f66:	f88a 0000 	strb.w	r0, [sl]
c0de7f6a:	0a00      	lsrs	r0, r0, #8
c0de7f6c:	f88a 0001 	strb.w	r0, [sl, #1]
c0de7f70:	9804      	ldr	r0, [sp, #16]
c0de7f72:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de7f76:	08c1      	lsrs	r1, r0, #3
c0de7f78:	2004      	movs	r0, #4
c0de7f7a:	47a8      	blx	r5
c0de7f7c:	4605      	mov	r5, r0
c0de7f7e:	2000      	movs	r0, #0
c0de7f80:	ea4f 2418 	mov.w	r4, r8, lsr #8
c0de7f84:	77e8      	strb	r0, [r5, #31]
c0de7f86:	9801      	ldr	r0, [sp, #4]
c0de7f88:	f004 fdba 	bl	c0decb00 <pic>
c0de7f8c:	4601      	mov	r1, r0
c0de7f8e:	2001      	movs	r0, #1
c0de7f90:	22a0      	movs	r2, #160	@ 0xa0
c0de7f92:	74ec      	strb	r4, [r5, #19]
c0de7f94:	462c      	mov	r4, r5
c0de7f96:	7168      	strb	r0, [r5, #5]
c0de7f98:	f885 0024 	strb.w	r0, [r5, #36]	@ 0x24
c0de7f9c:	9803      	ldr	r0, [sp, #12]
c0de7f9e:	712a      	strb	r2, [r5, #4]
c0de7fa0:	2800      	cmp	r0, #0
c0de7fa2:	bf08      	it	eq
c0de7fa4:	270b      	moveq	r7, #11
c0de7fa6:	f885 7022 	strb.w	r7, [r5, #34]	@ 0x22
c0de7faa:	2005      	movs	r0, #5
c0de7fac:	0e0a      	lsrs	r2, r1, #24
c0de7fae:	2301      	movs	r3, #1
c0de7fb0:	f885 0020 	strb.w	r0, [r5, #32]
c0de7fb4:	2008      	movs	r0, #8
c0de7fb6:	75a8      	strb	r0, [r5, #22]
c0de7fb8:	4628      	mov	r0, r5
c0de7fba:	f000 fb52 	bl	c0de8662 <OUTLINED_FUNCTION_13>
c0de7fbe:	ea4f 6218 	mov.w	r2, r8, lsr #24
c0de7fc2:	f885 0027 	strb.w	r0, [r5, #39]	@ 0x27
c0de7fc6:	2018      	movs	r0, #24
c0de7fc8:	f804 0f19 	strb.w	r0, [r4, #25]!
c0de7fcc:	2000      	movs	r0, #0
c0de7fce:	7060      	strb	r0, [r4, #1]
c0de7fd0:	4628      	mov	r0, r5
c0de7fd2:	f800 8f12 	strb.w	r8, [r0, #18]!
c0de7fd6:	70c2      	strb	r2, [r0, #3]
c0de7fd8:	ea4f 4218 	mov.w	r2, r8, lsr #16
c0de7fdc:	f8dd 8010 	ldr.w	r8, [sp, #16]
c0de7fe0:	7082      	strb	r2, [r0, #2]
c0de7fe2:	4638      	mov	r0, r7
c0de7fe4:	f000 fcc1 	bl	c0de896a <OUTLINED_FUNCTION_51>
c0de7fe8:	2100      	movs	r1, #0
c0de7fea:	71a8      	strb	r0, [r5, #6]
c0de7fec:	f885 1021 	strb.w	r1, [r5, #33]	@ 0x21
c0de7ff0:	0a01      	lsrs	r1, r0, #8
c0de7ff2:	7832      	ldrb	r2, [r6, #0]
c0de7ff4:	78b3      	ldrb	r3, [r6, #2]
c0de7ff6:	78f6      	ldrb	r6, [r6, #3]
c0de7ff8:	71e9      	strb	r1, [r5, #7]
c0de7ffa:	f89b 1023 	ldrb.w	r1, [fp, #35]	@ 0x23
c0de7ffe:	f000 fd53 	bl	c0de8aa8 <OUTLINED_FUNCTION_76>
c0de8002:	7862      	ldrb	r2, [r4, #1]
c0de8004:	604d      	str	r5, [r1, #4]
c0de8006:	7821      	ldrb	r1, [r4, #0]
c0de8008:	9c03      	ldr	r4, [sp, #12]
c0de800a:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de800e:	f89a 2001 	ldrb.w	r2, [sl, #1]
c0de8012:	4408      	add	r0, r1
c0de8014:	f89a 1000 	ldrb.w	r1, [sl]
c0de8018:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de801c:	4408      	add	r0, r1
c0de801e:	f88a 0000 	strb.w	r0, [sl]
c0de8022:	0a00      	lsrs	r0, r0, #8
c0de8024:	2c00      	cmp	r4, #0
c0de8026:	f88a 0001 	strb.w	r0, [sl, #1]
c0de802a:	d051      	beq.n	c0de80d0 <nbgl_layoutAddSpinner+0x208>
c0de802c:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de8030:	f000 fa54 	bl	c0de84dc <OUTLINED_FUNCTION_0>
c0de8034:	2600      	movs	r6, #0
c0de8036:	4607      	mov	r7, r0
c0de8038:	77c6      	strb	r6, [r0, #31]
c0de803a:	4620      	mov	r0, r4
c0de803c:	f004 fd60 	bl	c0decb00 <pic>
c0de8040:	4601      	mov	r1, r0
c0de8042:	0a28      	lsrs	r0, r5, #8
c0de8044:	22a0      	movs	r2, #160	@ 0xa0
c0de8046:	463c      	mov	r4, r7
c0de8048:	2301      	movs	r3, #1
c0de804a:	74f8      	strb	r0, [r7, #19]
c0de804c:	2001      	movs	r0, #1
c0de804e:	713a      	strb	r2, [r7, #4]
c0de8050:	0e0a      	lsrs	r2, r1, #24
c0de8052:	7178      	strb	r0, [r7, #5]
c0de8054:	f887 0024 	strb.w	r0, [r7, #36]	@ 0x24
c0de8058:	200b      	movs	r0, #11
c0de805a:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de805e:	2005      	movs	r0, #5
c0de8060:	f887 0020 	strb.w	r0, [r7, #32]
c0de8064:	2008      	movs	r0, #8
c0de8066:	75b8      	strb	r0, [r7, #22]
c0de8068:	4638      	mov	r0, r7
c0de806a:	f000 fafa 	bl	c0de8662 <OUTLINED_FUNCTION_13>
c0de806e:	0e2a      	lsrs	r2, r5, #24
c0de8070:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de8074:	2010      	movs	r0, #16
c0de8076:	f804 0f19 	strb.w	r0, [r4, #25]!
c0de807a:	4638      	mov	r0, r7
c0de807c:	f800 5f12 	strb.w	r5, [r0, #18]!
c0de8080:	7066      	strb	r6, [r4, #1]
c0de8082:	70c2      	strb	r2, [r0, #3]
c0de8084:	0c2a      	lsrs	r2, r5, #16
c0de8086:	7082      	strb	r2, [r0, #2]
c0de8088:	200b      	movs	r0, #11
c0de808a:	f000 fc6e 	bl	c0de896a <OUTLINED_FUNCTION_51>
c0de808e:	0a01      	lsrs	r1, r0, #8
c0de8090:	7862      	ldrb	r2, [r4, #1]
c0de8092:	71b8      	strb	r0, [r7, #6]
c0de8094:	f887 6021 	strb.w	r6, [r7, #33]	@ 0x21
c0de8098:	71f9      	strb	r1, [r7, #7]
c0de809a:	7821      	ldrb	r1, [r4, #0]
c0de809c:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de80a0:	eb01 0c00 	add.w	ip, r1, r0
c0de80a4:	4659      	mov	r1, fp
c0de80a6:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de80aa:	f811 3d1c 	ldrb.w	r3, [r1, #-28]!
c0de80ae:	784c      	ldrb	r4, [r1, #1]
c0de80b0:	7f4d      	ldrb	r5, [r1, #29]
c0de80b2:	7f8e      	ldrb	r6, [r1, #30]
c0de80b4:	7fc8      	ldrb	r0, [r1, #31]
c0de80b6:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de80ba:	ea42 2205 	orr.w	r2, r2, r5, lsl #8
c0de80be:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
c0de80c2:	4463      	add	r3, ip
c0de80c4:	ea42 4000 	orr.w	r0, r2, r0, lsl #16
c0de80c8:	700b      	strb	r3, [r1, #0]
c0de80ca:	6087      	str	r7, [r0, #8]
c0de80cc:	0a18      	lsrs	r0, r3, #8
c0de80ce:	7048      	strb	r0, [r1, #1]
c0de80d0:	f8d8 00a0 	ldr.w	r0, [r8, #160]	@ 0xa0
c0de80d4:	f000 fa95 	bl	c0de8602 <OUTLINED_FUNCTION_10>
c0de80d8:	f840 b022 	str.w	fp, [r0, r2, lsl #2]
c0de80dc:	f8d8 00a0 	ldr.w	r0, [r8, #160]	@ 0xa0
c0de80e0:	f000 fa00 	bl	c0de84e4 <OUTLINED_FUNCTION_1>
c0de80e4:	9802      	ldr	r0, [sp, #8]
c0de80e6:	28ff      	cmp	r0, #255	@ 0xff
c0de80e8:	d00c      	beq.n	c0de8104 <nbgl_layoutAddSpinner+0x23c>
c0de80ea:	f44f 70c8 	mov.w	r0, #400	@ 0x190
c0de80ee:	e9cd 0006 	strd	r0, r0, [sp, #24]
c0de80f2:	4809      	ldr	r0, [pc, #36]	@ (c0de8118 <nbgl_layoutAddSpinner+0x250>)
c0de80f4:	4478      	add	r0, pc
c0de80f6:	9005      	str	r0, [sp, #20]
c0de80f8:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de80fc:	a905      	add	r1, sp, #20
c0de80fe:	08c0      	lsrs	r0, r0, #3
c0de8100:	f004 fb13 	bl	c0dec72a <nbgl_screenUpdateTicker>
c0de8104:	2000      	movs	r0, #0
c0de8106:	e001      	b.n	c0de810c <nbgl_layoutAddSpinner+0x244>
c0de8108:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de810c:	b008      	add	sp, #32
c0de810e:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de8112:	bf00      	nop
c0de8114:	00004855 	.word	0x00004855
c0de8118:	00000025 	.word	0x00000025

c0de811c <spinnerTickerCallback>:
c0de811c:	b570      	push	{r4, r5, r6, lr}
c0de811e:	4819      	ldr	r0, [pc, #100]	@ (c0de8184 <spinnerTickerCallback+0x68>)
c0de8120:	4448      	add	r0, r9
c0de8122:	6840      	ldr	r0, [r0, #4]
c0de8124:	b120      	cbz	r0, c0de8130 <spinnerTickerCallback+0x14>
c0de8126:	f890 10ae 	ldrb.w	r1, [r0, #174]	@ 0xae
c0de812a:	0209      	lsls	r1, r1, #8
c0de812c:	0449      	lsls	r1, r1, #17
c0de812e:	d400      	bmi.n	c0de8132 <spinnerTickerCallback+0x16>
c0de8130:	bd70      	pop	{r4, r5, r6, pc}
c0de8132:	f8d0 10a0 	ldr.w	r1, [r0, #160]	@ 0xa0
c0de8136:	2300      	movs	r3, #0
c0de8138:	f891 2020 	ldrb.w	r2, [r1, #32]
c0de813c:	429a      	cmp	r2, r3
c0de813e:	d0f7      	beq.n	c0de8130 <spinnerTickerCallback+0x14>
c0de8140:	4608      	mov	r0, r1
c0de8142:	f000 fbdf 	bl	c0de8904 <OUTLINED_FUNCTION_44>
c0de8146:	f850 0023 	ldr.w	r0, [r0, r3, lsl #2]
c0de814a:	7ec4      	ldrb	r4, [r0, #27]
c0de814c:	2c01      	cmp	r4, #1
c0de814e:	d108      	bne.n	c0de8162 <spinnerTickerCallback+0x46>
c0de8150:	f890 4020 	ldrb.w	r4, [r0, #32]
c0de8154:	b12c      	cbz	r4, c0de8162 <spinnerTickerCallback+0x46>
c0de8156:	f000 fbd5 	bl	c0de8904 <OUTLINED_FUNCTION_44>
c0de815a:	6800      	ldr	r0, [r0, #0]
c0de815c:	7ec4      	ldrb	r4, [r0, #27]
c0de815e:	2c0d      	cmp	r4, #13
c0de8160:	d001      	beq.n	c0de8166 <spinnerTickerCallback+0x4a>
c0de8162:	3301      	adds	r3, #1
c0de8164:	e7ea      	b.n	c0de813c <spinnerTickerCallback+0x20>
c0de8166:	7fc1      	ldrb	r1, [r0, #31]
c0de8168:	3101      	adds	r1, #1
c0de816a:	b2ca      	uxtb	r2, r1
c0de816c:	3a04      	subs	r2, #4
c0de816e:	bf18      	it	ne
c0de8170:	460a      	movne	r2, r1
c0de8172:	77c2      	strb	r2, [r0, #31]
c0de8174:	f004 fabb 	bl	c0dec6ee <nbgl_objDraw>
c0de8178:	2004      	movs	r0, #4
c0de817a:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de817e:	f004 baa7 	b.w	c0dec6d0 <nbgl_refreshSpecial>
c0de8182:	bf00      	nop
c0de8184:	000018e8 	.word	0x000018e8

c0de8188 <nbgl_layoutUpdateSpinner>:
c0de8188:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de818c:	2800      	cmp	r0, #0
c0de818e:	f000 809a 	beq.w	c0de82c6 <nbgl_layoutUpdateSpinner+0x13e>
c0de8192:	f8d0 00a0 	ldr.w	r0, [r0, #160]	@ 0xa0
c0de8196:	460e      	mov	r6, r1
c0de8198:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de819c:	2900      	cmp	r1, #0
c0de819e:	f000 8092 	beq.w	c0de82c6 <nbgl_layoutUpdateSpinner+0x13e>
c0de81a2:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de81a6:	4615      	mov	r5, r2
c0de81a8:	f000 fc42 	bl	c0de8a30 <OUTLINED_FUNCTION_66>
c0de81ac:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de81b0:	6807      	ldr	r7, [r0, #0]
c0de81b2:	7ef8      	ldrb	r0, [r7, #27]
c0de81b4:	2801      	cmp	r0, #1
c0de81b6:	f040 8086 	bne.w	c0de82c6 <nbgl_layoutUpdateSpinner+0x13e>
c0de81ba:	f897 0020 	ldrb.w	r0, [r7, #32]
c0de81be:	2802      	cmp	r0, #2
c0de81c0:	f0c0 8081 	bcc.w	c0de82c6 <nbgl_layoutUpdateSpinner+0x13e>
c0de81c4:	4638      	mov	r0, r7
c0de81c6:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de81ca:	f000 fc31 	bl	c0de8a30 <OUTLINED_FUNCTION_66>
c0de81ce:	ea41 4100 	orr.w	r1, r1, r0, lsl #16
c0de81d2:	6808      	ldr	r0, [r1, #0]
c0de81d4:	7ec2      	ldrb	r2, [r0, #27]
c0de81d6:	2a0d      	cmp	r2, #13
c0de81d8:	d175      	bne.n	c0de82c6 <nbgl_layoutUpdateSpinner+0x13e>
c0de81da:	7fc2      	ldrb	r2, [r0, #31]
c0de81dc:	429a      	cmp	r2, r3
c0de81de:	d101      	bne.n	c0de81e4 <nbgl_layoutUpdateSpinner+0x5c>
c0de81e0:	2400      	movs	r4, #0
c0de81e2:	e008      	b.n	c0de81f6 <nbgl_layoutUpdateSpinner+0x6e>
c0de81e4:	77c3      	strb	r3, [r0, #31]
c0de81e6:	f004 fa82 	bl	c0dec6ee <nbgl_objDraw>
c0de81ea:	4638      	mov	r0, r7
c0de81ec:	2401      	movs	r4, #1
c0de81ee:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de81f2:	f000 fbc8 	bl	c0de8986 <OUTLINED_FUNCTION_53>
c0de81f6:	f8d1 b004 	ldr.w	fp, [r1, #4]
c0de81fa:	f89b 001b 	ldrb.w	r0, [fp, #27]
c0de81fe:	2804      	cmp	r0, #4
c0de8200:	d161      	bne.n	c0de82c6 <nbgl_layoutUpdateSpinner+0x13e>
c0de8202:	f000 fc22 	bl	c0de8a4a <OUTLINED_FUNCTION_68>
c0de8206:	4606      	mov	r6, r0
c0de8208:	f004 ffee 	bl	c0ded1e8 <strlen>
c0de820c:	4680      	mov	r8, r0
c0de820e:	4658      	mov	r0, fp
c0de8210:	f810 1f26 	ldrb.w	r1, [r0, #38]!
c0de8214:	f000 fa2c 	bl	c0de8670 <OUTLINED_FUNCTION_14>
c0de8218:	ea41 4a00 	orr.w	sl, r1, r0, lsl #16
c0de821c:	4650      	mov	r0, sl
c0de821e:	f004 ffe3 	bl	c0ded1e8 <strlen>
c0de8222:	4580      	cmp	r8, r0
c0de8224:	d105      	bne.n	c0de8232 <nbgl_layoutUpdateSpinner+0xaa>
c0de8226:	4650      	mov	r0, sl
c0de8228:	4631      	mov	r1, r6
c0de822a:	4642      	mov	r2, r8
c0de822c:	f004 ff84 	bl	c0ded138 <memcmp>
c0de8230:	b168      	cbz	r0, c0de824e <nbgl_layoutUpdateSpinner+0xc6>
c0de8232:	4658      	mov	r0, fp
c0de8234:	0e31      	lsrs	r1, r6, #24
c0de8236:	f800 6f26 	strb.w	r6, [r0, #38]!
c0de823a:	70c1      	strb	r1, [r0, #3]
c0de823c:	0c31      	lsrs	r1, r6, #16
c0de823e:	7081      	strb	r1, [r0, #2]
c0de8240:	0a30      	lsrs	r0, r6, #8
c0de8242:	f88b 0027 	strb.w	r0, [fp, #39]	@ 0x27
c0de8246:	4658      	mov	r0, fp
c0de8248:	f004 fa51 	bl	c0dec6ee <nbgl_objDraw>
c0de824c:	2402      	movs	r4, #2
c0de824e:	b3e5      	cbz	r5, c0de82ca <nbgl_layoutUpdateSpinner+0x142>
c0de8250:	f897 0020 	ldrb.w	r0, [r7, #32]
c0de8254:	2803      	cmp	r0, #3
c0de8256:	d136      	bne.n	c0de82c6 <nbgl_layoutUpdateSpinner+0x13e>
c0de8258:	f817 0f22 	ldrb.w	r0, [r7, #34]!
c0de825c:	7879      	ldrb	r1, [r7, #1]
c0de825e:	78ba      	ldrb	r2, [r7, #2]
c0de8260:	78fb      	ldrb	r3, [r7, #3]
c0de8262:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de8266:	ea42 2103 	orr.w	r1, r2, r3, lsl #8
c0de826a:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de826e:	6886      	ldr	r6, [r0, #8]
c0de8270:	7ef0      	ldrb	r0, [r6, #27]
c0de8272:	2804      	cmp	r0, #4
c0de8274:	d127      	bne.n	c0de82c6 <nbgl_layoutUpdateSpinner+0x13e>
c0de8276:	4628      	mov	r0, r5
c0de8278:	f004 fc42 	bl	c0decb00 <pic>
c0de827c:	4605      	mov	r5, r0
c0de827e:	f004 ffb3 	bl	c0ded1e8 <strlen>
c0de8282:	4680      	mov	r8, r0
c0de8284:	4630      	mov	r0, r6
c0de8286:	f810 1f26 	ldrb.w	r1, [r0, #38]!
c0de828a:	f000 f9f1 	bl	c0de8670 <OUTLINED_FUNCTION_14>
c0de828e:	ea41 4700 	orr.w	r7, r1, r0, lsl #16
c0de8292:	4638      	mov	r0, r7
c0de8294:	f004 ffa8 	bl	c0ded1e8 <strlen>
c0de8298:	4580      	cmp	r8, r0
c0de829a:	d105      	bne.n	c0de82a8 <nbgl_layoutUpdateSpinner+0x120>
c0de829c:	4638      	mov	r0, r7
c0de829e:	4629      	mov	r1, r5
c0de82a0:	4642      	mov	r2, r8
c0de82a2:	f004 ff49 	bl	c0ded138 <memcmp>
c0de82a6:	b180      	cbz	r0, c0de82ca <nbgl_layoutUpdateSpinner+0x142>
c0de82a8:	4630      	mov	r0, r6
c0de82aa:	0e29      	lsrs	r1, r5, #24
c0de82ac:	f800 5f26 	strb.w	r5, [r0, #38]!
c0de82b0:	70c1      	strb	r1, [r0, #3]
c0de82b2:	0c29      	lsrs	r1, r5, #16
c0de82b4:	7081      	strb	r1, [r0, #2]
c0de82b6:	0a28      	lsrs	r0, r5, #8
c0de82b8:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de82bc:	4630      	mov	r0, r6
c0de82be:	f004 fa16 	bl	c0dec6ee <nbgl_objDraw>
c0de82c2:	2402      	movs	r4, #2
c0de82c4:	e001      	b.n	c0de82ca <nbgl_layoutUpdateSpinner+0x142>
c0de82c6:	f04f 34ff 	mov.w	r4, #4294967295	@ 0xffffffff
c0de82ca:	4620      	mov	r0, r4
c0de82cc:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de82d0 <nbgl_layoutDraw>:
c0de82d0:	b348      	cbz	r0, c0de8326 <nbgl_layoutDraw+0x56>
c0de82d2:	b570      	push	{r4, r5, r6, lr}
c0de82d4:	4604      	mov	r4, r0
c0de82d6:	6980      	ldr	r0, [r0, #24]
c0de82d8:	b128      	cbz	r0, c0de82e6 <nbgl_layoutDraw+0x16>
c0de82da:	f000 fa1f 	bl	c0de871c <OUTLINED_FUNCTION_22>
c0de82de:	f8d4 00a0 	ldr.w	r0, [r4, #160]	@ 0xa0
c0de82e2:	f000 f8ff 	bl	c0de84e4 <OUTLINED_FUNCTION_1>
c0de82e6:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de82ea:	f894 10ae 	ldrb.w	r1, [r4, #174]	@ 0xae
c0de82ee:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de82f2:	0781      	lsls	r1, r0, #30
c0de82f4:	d513      	bpl.n	c0de831e <nbgl_layoutDraw+0x4e>
c0de82f6:	b2c0      	uxtb	r0, r0
c0de82f8:	f000 fb88 	bl	c0de8a0c <OUTLINED_FUNCTION_63>
c0de82fc:	2102      	movs	r1, #2
c0de82fe:	2301      	movs	r3, #1
c0de8300:	2258      	movs	r2, #88	@ 0x58
c0de8302:	7182      	strb	r2, [r0, #6]
c0de8304:	71c1      	strb	r1, [r0, #7]
c0de8306:	f880 1020 	strb.w	r1, [r0, #32]
c0de830a:	2104      	movs	r1, #4
c0de830c:	7103      	strb	r3, [r0, #4]
c0de830e:	2200      	movs	r2, #0
c0de8310:	f880 3021 	strb.w	r3, [r0, #33]	@ 0x21
c0de8314:	7581      	strb	r1, [r0, #22]
c0de8316:	68a1      	ldr	r1, [r4, #8]
c0de8318:	7142      	strb	r2, [r0, #5]
c0de831a:	77c2      	strb	r2, [r0, #31]
c0de831c:	6148      	str	r0, [r1, #20]
c0de831e:	f004 f9fa 	bl	c0dec716 <nbgl_screenRedraw>
c0de8322:	2000      	movs	r0, #0
c0de8324:	bd70      	pop	{r4, r5, r6, pc}
c0de8326:	f000 ba95 	b.w	c0de8854 <OUTLINED_FUNCTION_35>
	...

c0de832c <nbgl_layoutRelease>:
c0de832c:	b510      	push	{r4, lr}
c0de832e:	b138      	cbz	r0, c0de8340 <nbgl_layoutRelease+0x14>
c0de8330:	f000 fbc4 	bl	c0de8abc <OUTLINED_FUNCTION_79>
c0de8334:	f894 10ae 	ldrb.w	r1, [r4, #174]	@ 0xae
c0de8338:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de833c:	0441      	lsls	r1, r0, #17
c0de833e:	d402      	bmi.n	c0de8346 <nbgl_layoutRelease+0x1a>
c0de8340:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de8344:	bd10      	pop	{r4, pc}
c0de8346:	07c1      	lsls	r1, r0, #31
c0de8348:	d014      	beq.n	c0de8374 <nbgl_layoutRelease+0x48>
c0de834a:	b2c0      	uxtb	r0, r0
c0de834c:	08c0      	lsrs	r0, r0, #3
c0de834e:	f004 f9e7 	bl	c0dec720 <nbgl_screenPop>
c0de8352:	480d      	ldr	r0, [pc, #52]	@ (c0de8388 <nbgl_layoutRelease+0x5c>)
c0de8354:	eb09 0100 	add.w	r1, r9, r0
c0de8358:	6849      	ldr	r1, [r1, #4]
c0de835a:	42a1      	cmp	r1, r4
c0de835c:	d005      	beq.n	c0de836a <nbgl_layoutRelease+0x3e>
c0de835e:	e9d4 0100 	ldrd	r0, r1, [r4]
c0de8362:	6008      	str	r0, [r1, #0]
c0de8364:	6820      	ldr	r0, [r4, #0]
c0de8366:	6041      	str	r1, [r0, #4]
c0de8368:	e004      	b.n	c0de8374 <nbgl_layoutRelease+0x48>
c0de836a:	6861      	ldr	r1, [r4, #4]
c0de836c:	4448      	add	r0, r9
c0de836e:	6041      	str	r1, [r0, #4]
c0de8370:	2000      	movs	r0, #0
c0de8372:	6008      	str	r0, [r1, #0]
c0de8374:	f814 0fad 	ldrb.w	r0, [r4, #173]!
c0de8378:	7861      	ldrb	r1, [r4, #1]
c0de837a:	7020      	strb	r0, [r4, #0]
c0de837c:	2000      	movs	r0, #0
c0de837e:	f001 01bf 	and.w	r1, r1, #191	@ 0xbf
c0de8382:	7061      	strb	r1, [r4, #1]
c0de8384:	bd10      	pop	{r4, pc}
c0de8386:	bf00      	nop
c0de8388:	000018e8 	.word	0x000018e8

c0de838c <getLayoutAndLayoutObj>:
c0de838c:	b570      	push	{r4, r5, r6, lr}
c0de838e:	4c11      	ldr	r4, [pc, #68]	@ (c0de83d4 <getLayoutAndLayoutObj+0x48>)
c0de8390:	2300      	movs	r3, #0
c0de8392:	600b      	str	r3, [r1, #0]
c0de8394:	444c      	add	r4, r9
c0de8396:	6864      	ldr	r4, [r4, #4]
c0de8398:	b1d4      	cbz	r4, c0de83d0 <getLayoutAndLayoutObj+0x44>
c0de839a:	f894 30ad 	ldrb.w	r3, [r4, #173]	@ 0xad
c0de839e:	f894 50ae 	ldrb.w	r5, [r4, #174]	@ 0xae
c0de83a2:	ea43 2305 	orr.w	r3, r3, r5, lsl #8
c0de83a6:	045d      	lsls	r5, r3, #17
c0de83a8:	d401      	bmi.n	c0de83ae <getLayoutAndLayoutObj+0x22>
c0de83aa:	2300      	movs	r3, #0
c0de83ac:	e010      	b.n	c0de83d0 <getLayoutAndLayoutObj+0x44>
c0de83ae:	f44f 75fc 	mov.w	r5, #504	@ 0x1f8
c0de83b2:	ea05 1553 	and.w	r5, r5, r3, lsr #5
c0de83b6:	2300      	movs	r3, #0
c0de83b8:	429d      	cmp	r5, r3
c0de83ba:	d0f6      	beq.n	c0de83aa <getLayoutAndLayoutObj+0x1e>
c0de83bc:	18e6      	adds	r6, r4, r3
c0de83be:	3308      	adds	r3, #8
c0de83c0:	6a36      	ldr	r6, [r6, #32]
c0de83c2:	4286      	cmp	r6, r0
c0de83c4:	d1f8      	bne.n	c0de83b8 <getLayoutAndLayoutObj+0x2c>
c0de83c6:	18e0      	adds	r0, r4, r3
c0de83c8:	2301      	movs	r3, #1
c0de83ca:	600c      	str	r4, [r1, #0]
c0de83cc:	3018      	adds	r0, #24
c0de83ce:	6010      	str	r0, [r2, #0]
c0de83d0:	4618      	mov	r0, r3
c0de83d2:	bd70      	pop	{r4, r5, r6, pc}
c0de83d4:	000018e8 	.word	0x000018e8

c0de83d8 <animTickerCallback>:
c0de83d8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de83da:	483f      	ldr	r0, [pc, #252]	@ (c0de84d8 <animTickerCallback+0x100>)
c0de83dc:	4448      	add	r0, r9
c0de83de:	6842      	ldr	r2, [r0, #4]
c0de83e0:	b3b2      	cbz	r2, c0de8450 <animTickerCallback+0x78>
c0de83e2:	f892 00ad 	ldrb.w	r0, [r2, #173]	@ 0xad
c0de83e6:	f892 10ae 	ldrb.w	r1, [r2, #174]	@ 0xae
c0de83ea:	ea40 2e01 	orr.w	lr, r0, r1, lsl #8
c0de83ee:	ea5f 404e 	movs.w	r0, lr, lsl #17
c0de83f2:	d52d      	bpl.n	c0de8450 <animTickerCallback+0x78>
c0de83f4:	f8d2 c0a4 	ldr.w	ip, [r2, #164]	@ 0xa4
c0de83f8:	f1bc 0f00 	cmp.w	ip, #0
c0de83fc:	d028      	beq.n	c0de8450 <animTickerCallback+0x78>
c0de83fe:	f8d2 40a0 	ldr.w	r4, [r2, #160]	@ 0xa0
c0de8402:	2600      	movs	r6, #0
c0de8404:	f894 5020 	ldrb.w	r5, [r4, #32]
c0de8408:	42b5      	cmp	r5, r6
c0de840a:	d021      	beq.n	c0de8450 <animTickerCallback+0x78>
c0de840c:	4620      	mov	r0, r4
c0de840e:	f810 7f22 	ldrb.w	r7, [r0, #34]!
c0de8412:	7841      	ldrb	r1, [r0, #1]
c0de8414:	7883      	ldrb	r3, [r0, #2]
c0de8416:	78c0      	ldrb	r0, [r0, #3]
c0de8418:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de841c:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de8420:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de8424:	f850 0026 	ldr.w	r0, [r0, r6, lsl #2]
c0de8428:	7ec1      	ldrb	r1, [r0, #27]
c0de842a:	2901      	cmp	r1, #1
c0de842c:	d10e      	bne.n	c0de844c <animTickerCallback+0x74>
c0de842e:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de8432:	7843      	ldrb	r3, [r0, #1]
c0de8434:	7887      	ldrb	r7, [r0, #2]
c0de8436:	78c0      	ldrb	r0, [r0, #3]
c0de8438:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de843c:	ea47 2000 	orr.w	r0, r7, r0, lsl #8
c0de8440:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de8444:	6840      	ldr	r0, [r0, #4]
c0de8446:	7ec1      	ldrb	r1, [r0, #27]
c0de8448:	2902      	cmp	r1, #2
c0de844a:	d002      	beq.n	c0de8452 <animTickerCallback+0x7a>
c0de844c:	3601      	adds	r6, #1
c0de844e:	e7db      	b.n	c0de8408 <animTickerCallback+0x30>
c0de8450:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0de8452:	f89c 1005 	ldrb.w	r1, [ip, #5]
c0de8456:	b171      	cbz	r1, c0de8476 <animTickerCallback+0x9e>
c0de8458:	f892 40af 	ldrb.w	r4, [r2, #175]	@ 0xaf
c0de845c:	ea5f 714e 	movs.w	r1, lr, lsl #29
c0de8460:	d504      	bpl.n	c0de846c <animTickerCallback+0x94>
c0de8462:	f89c 1004 	ldrb.w	r1, [ip, #4]
c0de8466:	3901      	subs	r1, #1
c0de8468:	42a1      	cmp	r1, r4
c0de846a:	dd0e      	ble.n	c0de848a <animTickerCallback+0xb2>
c0de846c:	b9ac      	cbnz	r4, c0de849a <animTickerCallback+0xc2>
c0de846e:	f04e 0e04 	orr.w	lr, lr, #4
c0de8472:	2400      	movs	r4, #0
c0de8474:	e00b      	b.n	c0de848e <animTickerCallback+0xb6>
c0de8476:	f89c 1004 	ldrb.w	r1, [ip, #4]
c0de847a:	f892 30af 	ldrb.w	r3, [r2, #175]	@ 0xaf
c0de847e:	3901      	subs	r1, #1
c0de8480:	4299      	cmp	r1, r3
c0de8482:	bf14      	ite	ne
c0de8484:	3301      	addne	r3, #1
c0de8486:	2300      	moveq	r3, #0
c0de8488:	e00c      	b.n	c0de84a4 <animTickerCallback+0xcc>
c0de848a:	f02e 0e04 	bic.w	lr, lr, #4
c0de848e:	ea4f 211e 	mov.w	r1, lr, lsr #8
c0de8492:	f882 e0ad 	strb.w	lr, [r2, #173]	@ 0xad
c0de8496:	f882 10ae 	strb.w	r1, [r2, #174]	@ 0xae
c0de849a:	ea5f 714e 	movs.w	r1, lr, lsl #29
c0de849e:	bf54      	ite	pl
c0de84a0:	1e63      	subpl	r3, r4, #1
c0de84a2:	1c63      	addmi	r3, r4, #1
c0de84a4:	f882 30af 	strb.w	r3, [r2, #175]	@ 0xaf
c0de84a8:	f8dc 2000 	ldr.w	r2, [ip]
c0de84ac:	b2d9      	uxtb	r1, r3
c0de84ae:	f852 1021 	ldr.w	r1, [r2, r1, lsl #2]
c0de84b2:	4602      	mov	r2, r0
c0de84b4:	f802 1f21 	strb.w	r1, [r2, #33]!
c0de84b8:	0e0b      	lsrs	r3, r1, #24
c0de84ba:	70d3      	strb	r3, [r2, #3]
c0de84bc:	0c0b      	lsrs	r3, r1, #16
c0de84be:	0a09      	lsrs	r1, r1, #8
c0de84c0:	7093      	strb	r3, [r2, #2]
c0de84c2:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de84c6:	f004 f912 	bl	c0dec6ee <nbgl_objDraw>
c0de84ca:	2004      	movs	r0, #4
c0de84cc:	2101      	movs	r1, #1
c0de84ce:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de84d2:	f004 b902 	b.w	c0dec6da <nbgl_refreshSpecialWithPostRefresh>
c0de84d6:	bf00      	nop
c0de84d8:	000018e8 	.word	0x000018e8

c0de84dc <OUTLINED_FUNCTION_0>:
c0de84dc:	08c1      	lsrs	r1, r0, #3
c0de84de:	2004      	movs	r0, #4
c0de84e0:	f004 b92d 	b.w	c0dec73e <nbgl_objPoolGet>

c0de84e4 <OUTLINED_FUNCTION_1>:
c0de84e4:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de84e8:	3101      	adds	r1, #1
c0de84ea:	f880 1020 	strb.w	r1, [r0, #32]
c0de84ee:	4770      	bx	lr

c0de84f0 <OUTLINED_FUNCTION_2>:
c0de84f0:	2202      	movs	r2, #2
c0de84f2:	75ba      	strb	r2, [r7, #22]
c0de84f4:	4642      	mov	r2, r8
c0de84f6:	f812 3f22 	ldrb.w	r3, [r2, #34]!
c0de84fa:	7854      	ldrb	r4, [r2, #1]
c0de84fc:	7895      	ldrb	r5, [r2, #2]
c0de84fe:	78d2      	ldrb	r2, [r2, #3]
c0de8500:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de8504:	ea45 2202 	orr.w	r2, r5, r2, lsl #8
c0de8508:	7ebc      	ldrb	r4, [r7, #26]
c0de850a:	ea43 4202 	orr.w	r2, r3, r2, lsl #16
c0de850e:	7e7b      	ldrb	r3, [r7, #25]
c0de8510:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de8514:	2400      	movs	r4, #0
c0de8516:	4770      	bx	lr

c0de8518 <OUTLINED_FUNCTION_3>:
c0de8518:	713a      	strb	r2, [r7, #4]
c0de851a:	0e0a      	lsrs	r2, r1, #24
c0de851c:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de8520:	2005      	movs	r0, #5
c0de8522:	f887 0020 	strb.w	r0, [r7, #32]
c0de8526:	4638      	mov	r0, r7
c0de8528:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de852c:	70c2      	strb	r2, [r0, #3]
c0de852e:	0c0a      	lsrs	r2, r1, #16
c0de8530:	7082      	strb	r2, [r0, #2]
c0de8532:	0a08      	lsrs	r0, r1, #8
c0de8534:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de8538:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de853c:	4770      	bx	lr

c0de853e <OUTLINED_FUNCTION_4>:
c0de853e:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de8542:	784e      	ldrb	r6, [r1, #1]
c0de8544:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de8548:	788f      	ldrb	r7, [r1, #2]
c0de854a:	78c9      	ldrb	r1, [r1, #3]
c0de854c:	ea42 2206 	orr.w	r2, r2, r6, lsl #8
c0de8550:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de8554:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de8558:	f841 0023 	str.w	r0, [r1, r3, lsl #2]
c0de855c:	4770      	bx	lr

c0de855e <OUTLINED_FUNCTION_5>:
c0de855e:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de8562:	70c2      	strb	r2, [r0, #3]
c0de8564:	0c0a      	lsrs	r2, r1, #16
c0de8566:	7082      	strb	r2, [r0, #2]
c0de8568:	0a08      	lsrs	r0, r1, #8
c0de856a:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de856e:	f885 0027 	strb.w	r0, [r5, #39]	@ 0x27
c0de8572:	200b      	movs	r0, #11
c0de8574:	f004 b8fc 	b.w	c0dec770 <nbgl_getTextHeightInWidth>

c0de8578 <OUTLINED_FUNCTION_6>:
c0de8578:	4620      	mov	r0, r4
c0de857a:	4631      	mov	r1, r6
c0de857c:	f7fc bc8c 	b.w	c0de4e98 <layoutAddCallbackObj>

c0de8580 <OUTLINED_FUNCTION_7>:
c0de8580:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de8584:	70ca      	strb	r2, [r1, #3]
c0de8586:	0c02      	lsrs	r2, r0, #16
c0de8588:	0a00      	lsrs	r0, r0, #8
c0de858a:	708a      	strb	r2, [r1, #2]
c0de858c:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de8590:	68e0      	ldr	r0, [r4, #12]
c0de8592:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de8596:	7843      	ldrb	r3, [r0, #1]
c0de8598:	f810 cc02 	ldrb.w	ip, [r0, #-2]
c0de859c:	7882      	ldrb	r2, [r0, #2]
c0de859e:	78c0      	ldrb	r0, [r0, #3]
c0de85a0:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de85a4:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de85a8:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de85ac:	f840 602c 	str.w	r6, [r0, ip, lsl #2]
c0de85b0:	200c      	movs	r0, #12
c0de85b2:	4770      	bx	lr

c0de85b4 <OUTLINED_FUNCTION_8>:
c0de85b4:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de85b8:	784c      	ldrb	r4, [r1, #1]
c0de85ba:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de85be:	788d      	ldrb	r5, [r1, #2]
c0de85c0:	78c9      	ldrb	r1, [r1, #3]
c0de85c2:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de85c6:	ea45 2101 	orr.w	r1, r5, r1, lsl #8
c0de85ca:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de85ce:	4770      	bx	lr

c0de85d0 <OUTLINED_FUNCTION_9>:
c0de85d0:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de85d4:	70ca      	strb	r2, [r1, #3]
c0de85d6:	0c02      	lsrs	r2, r0, #16
c0de85d8:	0a00      	lsrs	r0, r0, #8
c0de85da:	708a      	strb	r2, [r1, #2]
c0de85dc:	f886 002f 	strb.w	r0, [r6, #47]	@ 0x2f
c0de85e0:	68e0      	ldr	r0, [r4, #12]
c0de85e2:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de85e6:	7843      	ldrb	r3, [r0, #1]
c0de85e8:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de85ec:	7887      	ldrb	r7, [r0, #2]
c0de85ee:	78c0      	ldrb	r0, [r0, #3]
c0de85f0:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de85f4:	ea47 2000 	orr.w	r0, r7, r0, lsl #8
c0de85f8:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de85fc:	f840 6022 	str.w	r6, [r0, r2, lsl #2]
c0de8600:	4770      	bx	lr

c0de8602 <OUTLINED_FUNCTION_10>:
c0de8602:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de8606:	7843      	ldrb	r3, [r0, #1]
c0de8608:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de860c:	7884      	ldrb	r4, [r0, #2]
c0de860e:	78c0      	ldrb	r0, [r0, #3]
c0de8610:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de8614:	ea44 2000 	orr.w	r0, r4, r0, lsl #8
c0de8618:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de861c:	4770      	bx	lr

c0de861e <OUTLINED_FUNCTION_11>:
c0de861e:	784b      	ldrb	r3, [r1, #1]
c0de8620:	788e      	ldrb	r6, [r1, #2]
c0de8622:	78c9      	ldrb	r1, [r1, #3]
c0de8624:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de8628:	ea46 2101 	orr.w	r1, r6, r1, lsl #8
c0de862c:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de8630:	4770      	bx	lr

c0de8632 <OUTLINED_FUNCTION_12>:
c0de8632:	70ca      	strb	r2, [r1, #3]
c0de8634:	0c02      	lsrs	r2, r0, #16
c0de8636:	0a00      	lsrs	r0, r0, #8
c0de8638:	708a      	strb	r2, [r1, #2]
c0de863a:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de863e:	6920      	ldr	r0, [r4, #16]
c0de8640:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de8644:	7843      	ldrb	r3, [r0, #1]
c0de8646:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de864a:	7887      	ldrb	r7, [r0, #2]
c0de864c:	78c0      	ldrb	r0, [r0, #3]
c0de864e:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de8652:	ea47 2000 	orr.w	r0, r7, r0, lsl #8
c0de8656:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de865a:	f840 6022 	str.w	r6, [r0, r2, lsl #2]
c0de865e:	200c      	movs	r0, #12
c0de8660:	4770      	bx	lr

c0de8662 <OUTLINED_FUNCTION_13>:
c0de8662:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de8666:	70c2      	strb	r2, [r0, #3]
c0de8668:	0c0a      	lsrs	r2, r1, #16
c0de866a:	7082      	strb	r2, [r0, #2]
c0de866c:	0a08      	lsrs	r0, r1, #8
c0de866e:	4770      	bx	lr

c0de8670 <OUTLINED_FUNCTION_14>:
c0de8670:	7842      	ldrb	r2, [r0, #1]
c0de8672:	7883      	ldrb	r3, [r0, #2]
c0de8674:	78c0      	ldrb	r0, [r0, #3]
c0de8676:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de867a:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de867e:	4770      	bx	lr

c0de8680 <OUTLINED_FUNCTION_15>:
c0de8680:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de8684:	70ca      	strb	r2, [r1, #3]
c0de8686:	0c02      	lsrs	r2, r0, #16
c0de8688:	0a00      	lsrs	r0, r0, #8
c0de868a:	708a      	strb	r2, [r1, #2]
c0de868c:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de8690:	6920      	ldr	r0, [r4, #16]
c0de8692:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de8696:	7843      	ldrb	r3, [r0, #1]
c0de8698:	f810 cc02 	ldrb.w	ip, [r0, #-2]
c0de869c:	7882      	ldrb	r2, [r0, #2]
c0de869e:	78c0      	ldrb	r0, [r0, #3]
c0de86a0:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de86a4:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de86a8:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de86ac:	4770      	bx	lr

c0de86ae <OUTLINED_FUNCTION_16>:
c0de86ae:	08c1      	lsrs	r1, r0, #3
c0de86b0:	2001      	movs	r0, #1
c0de86b2:	f004 b844 	b.w	c0dec73e <nbgl_objPoolGet>

c0de86b6 <OUTLINED_FUNCTION_17>:
c0de86b6:	08c1      	lsrs	r1, r0, #3
c0de86b8:	2005      	movs	r0, #5
c0de86ba:	f004 b840 	b.w	c0dec73e <nbgl_objPoolGet>

c0de86be <OUTLINED_FUNCTION_18>:
c0de86be:	6920      	ldr	r0, [r4, #16]
c0de86c0:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de86c4:	7843      	ldrb	r3, [r0, #1]
c0de86c6:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de86ca:	7887      	ldrb	r7, [r0, #2]
c0de86cc:	78c0      	ldrb	r0, [r0, #3]
c0de86ce:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de86d2:	ea47 2000 	orr.w	r0, r7, r0, lsl #8
c0de86d6:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de86da:	f840 6022 	str.w	r6, [r0, r2, lsl #2]
c0de86de:	200c      	movs	r0, #12
c0de86e0:	f886 801c 	strb.w	r8, [r6, #28]
c0de86e4:	4770      	bx	lr

c0de86e6 <OUTLINED_FUNCTION_19>:
c0de86e6:	0a39      	lsrs	r1, r7, #8
c0de86e8:	0e02      	lsrs	r2, r0, #24
c0de86ea:	74e9      	strb	r1, [r5, #19]
c0de86ec:	4629      	mov	r1, r5
c0de86ee:	f801 0f21 	strb.w	r0, [r1, #33]!
c0de86f2:	70ca      	strb	r2, [r1, #3]
c0de86f4:	0c02      	lsrs	r2, r0, #16
c0de86f6:	0a00      	lsrs	r0, r0, #8
c0de86f8:	f885 0022 	strb.w	r0, [r5, #34]	@ 0x22
c0de86fc:	4628      	mov	r0, r5
c0de86fe:	708a      	strb	r2, [r1, #2]
c0de8700:	0e3a      	lsrs	r2, r7, #24
c0de8702:	f800 7f12 	strb.w	r7, [r0, #18]!
c0de8706:	70c2      	strb	r2, [r0, #3]
c0de8708:	0c3a      	lsrs	r2, r7, #16
c0de870a:	7082      	strb	r2, [r0, #2]
c0de870c:	4770      	bx	lr

c0de870e <OUTLINED_FUNCTION_20>:
c0de870e:	4631      	mov	r1, r6
c0de8710:	f7fc bbc2 	b.w	c0de4e98 <layoutAddCallbackObj>

c0de8714 <OUTLINED_FUNCTION_21>:
c0de8714:	08c1      	lsrs	r1, r0, #3
c0de8716:	2002      	movs	r0, #2
c0de8718:	f004 b811 	b.w	c0dec73e <nbgl_objPoolGet>

c0de871c <OUTLINED_FUNCTION_22>:
c0de871c:	f8d4 10a0 	ldr.w	r1, [r4, #160]	@ 0xa0
c0de8720:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de8724:	784d      	ldrb	r5, [r1, #1]
c0de8726:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de872a:	788e      	ldrb	r6, [r1, #2]
c0de872c:	78c9      	ldrb	r1, [r1, #3]
c0de872e:	ea42 2205 	orr.w	r2, r2, r5, lsl #8
c0de8732:	ea46 2101 	orr.w	r1, r6, r1, lsl #8
c0de8736:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de873a:	f841 0023 	str.w	r0, [r1, r3, lsl #2]
c0de873e:	4770      	bx	lr

c0de8740 <OUTLINED_FUNCTION_23>:
c0de8740:	6868      	ldr	r0, [r5, #4]
c0de8742:	f004 b9dd 	b.w	c0decb00 <pic>

c0de8746 <OUTLINED_FUNCTION_24>:
c0de8746:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de874a:	784c      	ldrb	r4, [r1, #1]
c0de874c:	f811 cc02 	ldrb.w	ip, [r1, #-2]
c0de8750:	788b      	ldrb	r3, [r1, #2]
c0de8752:	78c9      	ldrb	r1, [r1, #3]
c0de8754:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de8758:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de875c:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de8760:	f841 702c 	str.w	r7, [r1, ip, lsl #2]
c0de8764:	4770      	bx	lr

c0de8766 <OUTLINED_FUNCTION_25>:
c0de8766:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de876a:	08c0      	lsrs	r0, r0, #3
c0de876c:	f7fe baa8 	b.w	c0de6cc0 <createHorizontalLine>

c0de8770 <OUTLINED_FUNCTION_26>:
c0de8770:	75aa      	strb	r2, [r5, #22]
c0de8772:	1c5a      	adds	r2, r3, #1
c0de8774:	788b      	ldrb	r3, [r1, #2]
c0de8776:	f800 2c02 	strb.w	r2, [r0, #-2]
c0de877a:	780a      	ldrb	r2, [r1, #0]
c0de877c:	f895 0022 	ldrb.w	r0, [r5, #34]	@ 0x22
c0de8780:	78c9      	ldrb	r1, [r1, #3]
c0de8782:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de8786:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de878a:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de878e:	4770      	bx	lr

c0de8790 <OUTLINED_FUNCTION_27>:
c0de8790:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de8794:	7843      	ldrb	r3, [r0, #1]
c0de8796:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de879a:	7884      	ldrb	r4, [r0, #2]
c0de879c:	78c0      	ldrb	r0, [r0, #3]
c0de879e:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de87a2:	ea44 2000 	orr.w	r0, r4, r0, lsl #8
c0de87a6:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de87aa:	f840 a022 	str.w	sl, [r0, r2, lsl #2]
c0de87ae:	4770      	bx	lr

c0de87b0 <OUTLINED_FUNCTION_28>:
c0de87b0:	f801 0f25 	strb.w	r0, [r1, #37]!
c0de87b4:	70ca      	strb	r2, [r1, #3]
c0de87b6:	0c02      	lsrs	r2, r0, #16
c0de87b8:	0a00      	lsrs	r0, r0, #8
c0de87ba:	708a      	strb	r2, [r1, #2]
c0de87bc:	f886 0026 	strb.w	r0, [r6, #38]	@ 0x26
c0de87c0:	4770      	bx	lr

c0de87c2 <OUTLINED_FUNCTION_29>:
c0de87c2:	4450      	add	r0, sl
c0de87c4:	3101      	adds	r1, #1
c0de87c6:	f842 7024 	str.w	r7, [r2, r4, lsl #2]
c0de87ca:	eb00 0a03 	add.w	sl, r0, r3
c0de87ce:	f888 1020 	strb.w	r1, [r8, #32]
c0de87d2:	4770      	bx	lr

c0de87d4 <OUTLINED_FUNCTION_30>:
c0de87d4:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de87d8:	4630      	mov	r0, r6
c0de87da:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de87de:	70c2      	strb	r2, [r0, #3]
c0de87e0:	0c0a      	lsrs	r2, r1, #16
c0de87e2:	7082      	strb	r2, [r0, #2]
c0de87e4:	0a08      	lsrs	r0, r1, #8
c0de87e6:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de87ea:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de87ee:	200b      	movs	r0, #11
c0de87f0:	4770      	bx	lr

c0de87f2 <OUTLINED_FUNCTION_31>:
c0de87f2:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de87f6:	70ca      	strb	r2, [r1, #3]
c0de87f8:	0c02      	lsrs	r2, r0, #16
c0de87fa:	0a00      	lsrs	r0, r0, #8
c0de87fc:	708a      	strb	r2, [r1, #2]
c0de87fe:	f886 002f 	strb.w	r0, [r6, #47]	@ 0x2f
c0de8802:	4770      	bx	lr

c0de8804 <OUTLINED_FUNCTION_32>:
c0de8804:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de8808:	784e      	ldrb	r6, [r1, #1]
c0de880a:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de880e:	788f      	ldrb	r7, [r1, #2]
c0de8810:	78c9      	ldrb	r1, [r1, #3]
c0de8812:	ea42 2206 	orr.w	r2, r2, r6, lsl #8
c0de8816:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de881a:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de881e:	4770      	bx	lr

c0de8820 <OUTLINED_FUNCTION_33>:
c0de8820:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de8824:	784c      	ldrb	r4, [r1, #1]
c0de8826:	788e      	ldrb	r6, [r1, #2]
c0de8828:	78cd      	ldrb	r5, [r1, #3]
c0de882a:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de882e:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de8832:	ea46 2405 	orr.w	r4, r6, r5, lsl #8
c0de8836:	ea42 4204 	orr.w	r2, r2, r4, lsl #16
c0de883a:	4770      	bx	lr

c0de883c <OUTLINED_FUNCTION_34>:
c0de883c:	f8da 00a0 	ldr.w	r0, [sl, #160]	@ 0xa0
c0de8840:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de8844:	3101      	adds	r1, #1
c0de8846:	f880 1020 	strb.w	r1, [r0, #32]
c0de884a:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de884e:	08c1      	lsrs	r1, r0, #3
c0de8850:	2004      	movs	r0, #4
c0de8852:	4730      	bx	r6

c0de8854 <OUTLINED_FUNCTION_35>:
c0de8854:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de8858:	4770      	bx	lr

c0de885a <OUTLINED_FUNCTION_36>:
c0de885a:	77b0      	strb	r0, [r6, #30]
c0de885c:	6960      	ldr	r0, [r4, #20]
c0de885e:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de8862:	7842      	ldrb	r2, [r0, #1]
c0de8864:	7883      	ldrb	r3, [r0, #2]
c0de8866:	78c0      	ldrb	r0, [r0, #3]
c0de8868:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de886c:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de8870:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de8874:	4770      	bx	lr

c0de8876 <OUTLINED_FUNCTION_37>:
c0de8876:	4642      	mov	r2, r8
c0de8878:	f812 3f22 	ldrb.w	r3, [r2, #34]!
c0de887c:	7854      	ldrb	r4, [r2, #1]
c0de887e:	7895      	ldrb	r5, [r2, #2]
c0de8880:	78d2      	ldrb	r2, [r2, #3]
c0de8882:	ea45 2202 	orr.w	r2, r5, r2, lsl #8
c0de8886:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de888a:	463d      	mov	r5, r7
c0de888c:	ea43 4202 	orr.w	r2, r3, r2, lsl #16
c0de8890:	4770      	bx	lr

c0de8892 <OUTLINED_FUNCTION_38>:
c0de8892:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de8896:	7843      	ldrb	r3, [r0, #1]
c0de8898:	7885      	ldrb	r5, [r0, #2]
c0de889a:	78c6      	ldrb	r6, [r0, #3]
c0de889c:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de88a0:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de88a4:	ea45 2306 	orr.w	r3, r5, r6, lsl #8
c0de88a8:	ea41 4103 	orr.w	r1, r1, r3, lsl #16
c0de88ac:	4770      	bx	lr

c0de88ae <OUTLINED_FUNCTION_39>:
c0de88ae:	f886 0021 	strb.w	r0, [r6, #33]	@ 0x21
c0de88b2:	f896 0022 	ldrb.w	r0, [r6, #34]	@ 0x22
c0de88b6:	f040 0001 	orr.w	r0, r0, #1
c0de88ba:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de88be:	4630      	mov	r0, r6
c0de88c0:	f003 bf15 	b.w	c0dec6ee <nbgl_objDraw>

c0de88c4 <OUTLINED_FUNCTION_40>:
c0de88c4:	4620      	mov	r0, r4
c0de88c6:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de88ca:	7842      	ldrb	r2, [r0, #1]
c0de88cc:	7883      	ldrb	r3, [r0, #2]
c0de88ce:	78c0      	ldrb	r0, [r0, #3]
c0de88d0:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de88d4:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de88d8:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de88dc:	4770      	bx	lr

c0de88de <OUTLINED_FUNCTION_41>:
c0de88de:	0e02      	lsrs	r2, r0, #24
c0de88e0:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de88e4:	70ca      	strb	r2, [r1, #3]
c0de88e6:	0c02      	lsrs	r2, r0, #16
c0de88e8:	0a00      	lsrs	r0, r0, #8
c0de88ea:	708a      	strb	r2, [r1, #2]
c0de88ec:	4770      	bx	lr

c0de88ee <OUTLINED_FUNCTION_42>:
c0de88ee:	4601      	mov	r1, r0
c0de88f0:	2001      	movs	r0, #1
c0de88f2:	22a0      	movs	r2, #160	@ 0xa0
c0de88f4:	2301      	movs	r3, #1
c0de88f6:	7178      	strb	r0, [r7, #5]
c0de88f8:	f887 0024 	strb.w	r0, [r7, #36]	@ 0x24
c0de88fc:	4770      	bx	lr

c0de88fe <OUTLINED_FUNCTION_43>:
c0de88fe:	200b      	movs	r0, #11
c0de8900:	f003 bf36 	b.w	c0dec770 <nbgl_getTextHeightInWidth>

c0de8904 <OUTLINED_FUNCTION_44>:
c0de8904:	f810 4f22 	ldrb.w	r4, [r0, #34]!
c0de8908:	7845      	ldrb	r5, [r0, #1]
c0de890a:	7886      	ldrb	r6, [r0, #2]
c0de890c:	78c0      	ldrb	r0, [r0, #3]
c0de890e:	ea44 2405 	orr.w	r4, r4, r5, lsl #8
c0de8912:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
c0de8916:	ea44 4000 	orr.w	r0, r4, r0, lsl #16
c0de891a:	4770      	bx	lr

c0de891c <OUTLINED_FUNCTION_45>:
c0de891c:	70c2      	strb	r2, [r0, #3]
c0de891e:	0c0a      	lsrs	r2, r1, #16
c0de8920:	7082      	strb	r2, [r0, #2]
c0de8922:	0a08      	lsrs	r0, r1, #8
c0de8924:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de8928:	4770      	bx	lr

c0de892a <OUTLINED_FUNCTION_46>:
c0de892a:	0a01      	lsrs	r1, r0, #8
c0de892c:	71b8      	strb	r0, [r7, #6]
c0de892e:	71f9      	strb	r1, [r7, #7]
c0de8930:	f898 1020 	ldrb.w	r1, [r8, #32]
c0de8934:	2900      	cmp	r1, #0
c0de8936:	4770      	bx	lr

c0de8938 <OUTLINED_FUNCTION_47>:
c0de8938:	70ca      	strb	r2, [r1, #3]
c0de893a:	0c02      	lsrs	r2, r0, #16
c0de893c:	0a00      	lsrs	r0, r0, #8
c0de893e:	708a      	strb	r2, [r1, #2]
c0de8940:	4770      	bx	lr

c0de8942 <OUTLINED_FUNCTION_48>:
c0de8942:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de8946:	ea42 2103 	orr.w	r1, r2, r3, lsl #8
c0de894a:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de894e:	4770      	bx	lr

c0de8950 <OUTLINED_FUNCTION_49>:
c0de8950:	68a8      	ldr	r0, [r5, #8]
c0de8952:	f004 b8d5 	b.w	c0decb00 <pic>

c0de8956 <OUTLINED_FUNCTION_50>:
c0de8956:	4630      	mov	r0, r6
c0de8958:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de895c:	70c2      	strb	r2, [r0, #3]
c0de895e:	0c0a      	lsrs	r2, r1, #16
c0de8960:	7082      	strb	r2, [r0, #2]
c0de8962:	0a08      	lsrs	r0, r1, #8
c0de8964:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de8968:	4770      	bx	lr

c0de896a <OUTLINED_FUNCTION_51>:
c0de896a:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de896e:	f003 beff 	b.w	c0dec770 <nbgl_getTextHeightInWidth>

c0de8972 <OUTLINED_FUNCTION_52>:
c0de8972:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de8976:	0e0a      	lsrs	r2, r1, #24
c0de8978:	70c2      	strb	r2, [r0, #3]
c0de897a:	0c0a      	lsrs	r2, r1, #16
c0de897c:	7082      	strb	r2, [r0, #2]
c0de897e:	0a08      	lsrs	r0, r1, #8
c0de8980:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de8984:	4770      	bx	lr

c0de8986 <OUTLINED_FUNCTION_53>:
c0de8986:	7842      	ldrb	r2, [r0, #1]
c0de8988:	7883      	ldrb	r3, [r0, #2]
c0de898a:	78c0      	ldrb	r0, [r0, #3]
c0de898c:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de8990:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de8994:	ea41 4100 	orr.w	r1, r1, r0, lsl #16
c0de8998:	4770      	bx	lr

c0de899a <OUTLINED_FUNCTION_54>:
c0de899a:	f891 2020 	ldrb.w	r2, [r1, #32]
c0de899e:	3201      	adds	r2, #1
c0de89a0:	f881 2020 	strb.w	r2, [r1, #32]
c0de89a4:	b004      	add	sp, #16
c0de89a6:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de89aa <OUTLINED_FUNCTION_55>:
c0de89aa:	7981      	ldrb	r1, [r0, #6]
c0de89ac:	79c0      	ldrb	r0, [r0, #7]
c0de89ae:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de89b2:	4770      	bx	lr

c0de89b4 <OUTLINED_FUNCTION_56>:
c0de89b4:	f801 0f21 	strb.w	r0, [r1, #33]!
c0de89b8:	70ca      	strb	r2, [r1, #3]
c0de89ba:	0c02      	lsrs	r2, r0, #16
c0de89bc:	0a00      	lsrs	r0, r0, #8
c0de89be:	708a      	strb	r2, [r1, #2]
c0de89c0:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de89c4:	4770      	bx	lr

c0de89c6 <OUTLINED_FUNCTION_57>:
c0de89c6:	f8d4 00a0 	ldr.w	r0, [r4, #160]	@ 0xa0
c0de89ca:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de89ce:	3101      	adds	r1, #1
c0de89d0:	f880 1020 	strb.w	r1, [r0, #32]
c0de89d4:	2000      	movs	r0, #0
c0de89d6:	4770      	bx	lr

c0de89d8 <OUTLINED_FUNCTION_58>:
c0de89d8:	4631      	mov	r1, r6
c0de89da:	0e02      	lsrs	r2, r0, #24
c0de89dc:	f886 a01d 	strb.w	sl, [r6, #29]
c0de89e0:	4770      	bx	lr

c0de89e2 <OUTLINED_FUNCTION_59>:
c0de89e2:	f886 b01c 	strb.w	fp, [r6, #28]
c0de89e6:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de89ea:	2005      	movs	r0, #5
c0de89ec:	4770      	bx	lr

c0de89ee <OUTLINED_FUNCTION_60>:
c0de89ee:	70f1      	strb	r1, [r6, #3]
c0de89f0:	0c01      	lsrs	r1, r0, #16
c0de89f2:	0a00      	lsrs	r0, r0, #8
c0de89f4:	70b1      	strb	r1, [r6, #2]
c0de89f6:	4770      	bx	lr

c0de89f8 <OUTLINED_FUNCTION_61>:
c0de89f8:	f891 0020 	ldrb.w	r0, [r1, #32]
c0de89fc:	3001      	adds	r0, #1
c0de89fe:	f881 0020 	strb.w	r0, [r1, #32]
c0de8a02:	4770      	bx	lr

c0de8a04 <OUTLINED_FUNCTION_62>:
c0de8a04:	08c1      	lsrs	r1, r0, #3
c0de8a06:	2004      	movs	r0, #4
c0de8a08:	f003 be9e 	b.w	c0dec748 <nbgl_containerPoolGet>

c0de8a0c <OUTLINED_FUNCTION_63>:
c0de8a0c:	08c1      	lsrs	r1, r0, #3
c0de8a0e:	2003      	movs	r0, #3
c0de8a10:	f003 be95 	b.w	c0dec73e <nbgl_objPoolGet>

c0de8a14 <OUTLINED_FUNCTION_64>:
c0de8a14:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de8a18:	08c1      	lsrs	r1, r0, #3
c0de8a1a:	2005      	movs	r0, #5
c0de8a1c:	f003 be94 	b.w	c0dec748 <nbgl_containerPoolGet>

c0de8a20 <OUTLINED_FUNCTION_65>:
c0de8a20:	71d1      	strb	r1, [r2, #7]
c0de8a22:	7190      	strb	r0, [r2, #6]
c0de8a24:	f892 0020 	ldrb.w	r0, [r2, #32]
c0de8a28:	3001      	adds	r0, #1
c0de8a2a:	f882 0020 	strb.w	r0, [r2, #32]
c0de8a2e:	4770      	bx	lr

c0de8a30 <OUTLINED_FUNCTION_66>:
c0de8a30:	7842      	ldrb	r2, [r0, #1]
c0de8a32:	7884      	ldrb	r4, [r0, #2]
c0de8a34:	78c0      	ldrb	r0, [r0, #3]
c0de8a36:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de8a3a:	ea44 2000 	orr.w	r0, r4, r0, lsl #8
c0de8a3e:	4770      	bx	lr

c0de8a40 <OUTLINED_FUNCTION_67>:
c0de8a40:	7a2a      	ldrb	r2, [r5, #8]
c0de8a42:	7a6b      	ldrb	r3, [r5, #9]
c0de8a44:	4620      	mov	r0, r4
c0de8a46:	f7fc ba27 	b.w	c0de4e98 <layoutAddCallbackObj>

c0de8a4a <OUTLINED_FUNCTION_68>:
c0de8a4a:	4630      	mov	r0, r6
c0de8a4c:	f004 b858 	b.w	c0decb00 <pic>

c0de8a50 <OUTLINED_FUNCTION_69>:
c0de8a50:	f801 7f12 	strb.w	r7, [r1, #18]!
c0de8a54:	70ca      	strb	r2, [r1, #3]
c0de8a56:	0c3a      	lsrs	r2, r7, #16
c0de8a58:	708a      	strb	r2, [r1, #2]
c0de8a5a:	4770      	bx	lr

c0de8a5c <OUTLINED_FUNCTION_70>:
c0de8a5c:	758a      	strb	r2, [r1, #22]
c0de8a5e:	460a      	mov	r2, r1
c0de8a60:	f802 0f22 	strb.w	r0, [r2, #34]!
c0de8a64:	0c00      	lsrs	r0, r0, #16
c0de8a66:	7090      	strb	r0, [r2, #2]
c0de8a68:	4770      	bx	lr

c0de8a6a <OUTLINED_FUNCTION_71>:
c0de8a6a:	f8bb 3020 	ldrh.w	r3, [fp, #32]
c0de8a6e:	3318      	adds	r3, #24
c0de8a70:	0a1c      	lsrs	r4, r3, #8
c0de8a72:	767b      	strb	r3, [r7, #25]
c0de8a74:	76bc      	strb	r4, [r7, #26]
c0de8a76:	4770      	bx	lr

c0de8a78 <OUTLINED_FUNCTION_72>:
c0de8a78:	f842 5023 	str.w	r5, [r2, r3, lsl #2]
c0de8a7c:	2200      	movs	r2, #0
c0de8a7e:	762a      	strb	r2, [r5, #24]
c0de8a80:	2210      	movs	r2, #16
c0de8a82:	75ea      	strb	r2, [r5, #23]
c0de8a84:	4770      	bx	lr

c0de8a86 <OUTLINED_FUNCTION_73>:
c0de8a86:	f88d 0010 	strb.w	r0, [sp, #16]
c0de8a8a:	8928      	ldrh	r0, [r5, #8]
c0de8a8c:	f8ad 000c 	strh.w	r0, [sp, #12]
c0de8a90:	4640      	mov	r0, r8
c0de8a92:	4770      	bx	lr

c0de8a94 <OUTLINED_FUNCTION_74>:
c0de8a94:	08c9      	lsrs	r1, r1, #3
c0de8a96:	f003 be57 	b.w	c0dec748 <nbgl_containerPoolGet>

c0de8a9a <OUTLINED_FUNCTION_75>:
c0de8a9a:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de8a9e:	7893      	ldrb	r3, [r2, #2]
c0de8aa0:	78d2      	ldrb	r2, [r2, #3]
c0de8aa2:	ea43 2202 	orr.w	r2, r3, r2, lsl #8
c0de8aa6:	4770      	bx	lr

c0de8aa8 <OUTLINED_FUNCTION_76>:
c0de8aa8:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0de8aac:	ea43 2206 	orr.w	r2, r3, r6, lsl #8
c0de8ab0:	ea41 4102 	orr.w	r1, r1, r2, lsl #16
c0de8ab4:	4770      	bx	lr

c0de8ab6 <OUTLINED_FUNCTION_78>:
c0de8ab6:	200d      	movs	r0, #13
c0de8ab8:	f003 be5a 	b.w	c0dec770 <nbgl_getTextHeightInWidth>

c0de8abc <OUTLINED_FUNCTION_79>:
c0de8abc:	4604      	mov	r4, r0
c0de8abe:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de8ac2:	4770      	bx	lr

c0de8ac4 <OUTLINED_FUNCTION_80>:
c0de8ac4:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de8ac8:	08c1      	lsrs	r1, r0, #3
c0de8aca:	2004      	movs	r0, #4
c0de8acc:	4720      	bx	r4

c0de8ace <OUTLINED_FUNCTION_81>:
c0de8ace:	ea40 4002 	orr.w	r0, r0, r2, lsl #16
c0de8ad2:	7802      	ldrb	r2, [r0, #0]
c0de8ad4:	7840      	ldrb	r0, [r0, #1]
c0de8ad6:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de8ada:	4770      	bx	lr

c0de8adc <layoutNavigationCallback>:
c0de8adc:	b570      	push	{r4, r5, r6, lr}
c0de8ade:	290a      	cmp	r1, #10
c0de8ae0:	d029      	beq.n	c0de8b36 <layoutNavigationCallback+0x5a>
c0de8ae2:	2909      	cmp	r1, #9
c0de8ae4:	d02b      	beq.n	c0de8b3e <layoutNavigationCallback+0x62>
c0de8ae6:	2900      	cmp	r1, #0
c0de8ae8:	d14a      	bne.n	c0de8b80 <layoutNavigationCallback+0xa4>
c0de8aea:	4604      	mov	r4, r0
c0de8aec:	7bc1      	ldrb	r1, [r0, #15]
c0de8aee:	f814 5f0e 	ldrb.w	r5, [r4, #14]!
c0de8af2:	ea45 2101 	orr.w	r1, r5, r1, lsl #8
c0de8af6:	78a5      	ldrb	r5, [r4, #2]
c0de8af8:	78e4      	ldrb	r4, [r4, #3]
c0de8afa:	ea45 2404 	orr.w	r4, r5, r4, lsl #8
c0de8afe:	ea41 4104 	orr.w	r1, r1, r4, lsl #16
c0de8b02:	460d      	mov	r5, r1
c0de8b04:	f891 4023 	ldrb.w	r4, [r1, #35]	@ 0x23
c0de8b08:	f815 6f22 	ldrb.w	r6, [r5, #34]!
c0de8b0c:	ea46 2404 	orr.w	r4, r6, r4, lsl #8
c0de8b10:	78ae      	ldrb	r6, [r5, #2]
c0de8b12:	78ed      	ldrb	r5, [r5, #3]
c0de8b14:	ea46 2505 	orr.w	r5, r6, r5, lsl #8
c0de8b18:	ea44 4405 	orr.w	r4, r4, r5, lsl #16
c0de8b1c:	6825      	ldr	r5, [r4, #0]
c0de8b1e:	4285      	cmp	r5, r0
c0de8b20:	d01e      	beq.n	c0de8b60 <layoutNavigationCallback+0x84>
c0de8b22:	6865      	ldr	r5, [r4, #4]
c0de8b24:	4285      	cmp	r5, r0
c0de8b26:	d01e      	beq.n	c0de8b66 <layoutNavigationCallback+0x8a>
c0de8b28:	68a4      	ldr	r4, [r4, #8]
c0de8b2a:	4284      	cmp	r4, r0
c0de8b2c:	d128      	bne.n	c0de8b80 <layoutNavigationCallback+0xa4>
c0de8b2e:	2a01      	cmp	r2, #1
c0de8b30:	d81d      	bhi.n	c0de8b6e <layoutNavigationCallback+0x92>
c0de8b32:	7818      	ldrb	r0, [r3, #0]
c0de8b34:	e01f      	b.n	c0de8b76 <layoutNavigationCallback+0x9a>
c0de8b36:	2a01      	cmp	r2, #1
c0de8b38:	d805      	bhi.n	c0de8b46 <layoutNavigationCallback+0x6a>
c0de8b3a:	7819      	ldrb	r1, [r3, #0]
c0de8b3c:	e007      	b.n	c0de8b4e <layoutNavigationCallback+0x72>
c0de8b3e:	7819      	ldrb	r1, [r3, #0]
c0de8b40:	b1f1      	cbz	r1, c0de8b80 <layoutNavigationCallback+0xa4>
c0de8b42:	3901      	subs	r1, #1
c0de8b44:	e004      	b.n	c0de8b50 <layoutNavigationCallback+0x74>
c0de8b46:	7819      	ldrb	r1, [r3, #0]
c0de8b48:	1e54      	subs	r4, r2, #1
c0de8b4a:	428c      	cmp	r4, r1
c0de8b4c:	d918      	bls.n	c0de8b80 <layoutNavigationCallback+0xa4>
c0de8b4e:	3101      	adds	r1, #1
c0de8b50:	7019      	strb	r1, [r3, #0]
c0de8b52:	b2cb      	uxtb	r3, r1
c0de8b54:	4611      	mov	r1, r2
c0de8b56:	461a      	mov	r2, r3
c0de8b58:	f000 f814 	bl	c0de8b84 <configButtons>
c0de8b5c:	2001      	movs	r0, #1
c0de8b5e:	bd70      	pop	{r4, r5, r6, pc}
c0de8b60:	20ff      	movs	r0, #255	@ 0xff
c0de8b62:	7018      	strb	r0, [r3, #0]
c0de8b64:	e7fa      	b.n	c0de8b5c <layoutNavigationCallback+0x80>
c0de8b66:	7818      	ldrb	r0, [r3, #0]
c0de8b68:	b150      	cbz	r0, c0de8b80 <layoutNavigationCallback+0xa4>
c0de8b6a:	3801      	subs	r0, #1
c0de8b6c:	e004      	b.n	c0de8b78 <layoutNavigationCallback+0x9c>
c0de8b6e:	7818      	ldrb	r0, [r3, #0]
c0de8b70:	1e54      	subs	r4, r2, #1
c0de8b72:	4284      	cmp	r4, r0
c0de8b74:	d904      	bls.n	c0de8b80 <layoutNavigationCallback+0xa4>
c0de8b76:	3001      	adds	r0, #1
c0de8b78:	7018      	strb	r0, [r3, #0]
c0de8b7a:	b2c3      	uxtb	r3, r0
c0de8b7c:	4608      	mov	r0, r1
c0de8b7e:	e7e9      	b.n	c0de8b54 <layoutNavigationCallback+0x78>
c0de8b80:	2000      	movs	r0, #0
c0de8b82:	bd70      	pop	{r4, r5, r6, pc}

c0de8b84 <configButtons>:
c0de8b84:	b5b0      	push	{r4, r5, r7, lr}
c0de8b86:	f810 3f22 	ldrb.w	r3, [r0, #34]!
c0de8b8a:	7844      	ldrb	r4, [r0, #1]
c0de8b8c:	7885      	ldrb	r5, [r0, #2]
c0de8b8e:	78c0      	ldrb	r0, [r0, #3]
c0de8b90:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de8b94:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
c0de8b98:	ea43 4000 	orr.w	r0, r3, r0, lsl #16
c0de8b9c:	e9d0 3001 	ldrd	r3, r0, [r0, #4]
c0de8ba0:	b12b      	cbz	r3, c0de8bae <configButtons+0x2a>
c0de8ba2:	fab2 f482 	clz	r4, r2
c0de8ba6:	0964      	lsrs	r4, r4, #5
c0de8ba8:	0064      	lsls	r4, r4, #1
c0de8baa:	f883 4021 	strb.w	r4, [r3, #33]	@ 0x21
c0de8bae:	2902      	cmp	r1, #2
c0de8bb0:	d307      	bcc.n	c0de8bc2 <configButtons+0x3e>
c0de8bb2:	43d2      	mvns	r2, r2
c0de8bb4:	4411      	add	r1, r2
c0de8bb6:	fab1 f181 	clz	r1, r1
c0de8bba:	0949      	lsrs	r1, r1, #5
c0de8bbc:	0049      	lsls	r1, r1, #1
c0de8bbe:	f880 1021 	strb.w	r1, [r0, #33]	@ 0x21
c0de8bc2:	bdb0      	pop	{r4, r5, r7, pc}

c0de8bc4 <layoutNavigationPopulate>:
c0de8bc4:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de8bc8:	4680      	mov	r8, r0
c0de8bca:	78c8      	ldrb	r0, [r1, #3]
c0de8bcc:	4616      	mov	r6, r2
c0de8bce:	460d      	mov	r5, r1
c0de8bd0:	b338      	cbz	r0, c0de8c22 <layoutNavigationPopulate+0x5e>
c0de8bd2:	2005      	movs	r0, #5
c0de8bd4:	4631      	mov	r1, r6
c0de8bd6:	2405      	movs	r4, #5
c0de8bd8:	f003 fdb1 	bl	c0dec73e <nbgl_objPoolGet>
c0de8bdc:	4976      	ldr	r1, [pc, #472]	@ (c0de8db8 <layoutNavigationPopulate+0x1f4>)
c0de8bde:	4479      	add	r1, pc
c0de8be0:	f000 f8ff 	bl	c0de8de2 <OUTLINED_FUNCTION_1>
c0de8be4:	70d3      	strb	r3, [r2, #3]
c0de8be6:	7091      	strb	r1, [r2, #2]
c0de8be8:	2258      	movs	r2, #88	@ 0x58
c0de8bea:	2100      	movs	r1, #0
c0de8bec:	2303      	movs	r3, #3
c0de8bee:	7182      	strb	r2, [r0, #6]
c0de8bf0:	7102      	strb	r2, [r0, #4]
c0de8bf2:	2201      	movs	r2, #1
c0de8bf4:	71c1      	strb	r1, [r0, #7]
c0de8bf6:	7141      	strb	r1, [r0, #5]
c0de8bf8:	7601      	strb	r1, [r0, #24]
c0de8bfa:	7741      	strb	r1, [r0, #29]
c0de8bfc:	f880 3020 	strb.w	r3, [r0, #32]
c0de8c00:	77c3      	strb	r3, [r0, #31]
c0de8c02:	f880 3022 	strb.w	r3, [r0, #34]	@ 0x22
c0de8c06:	7702      	strb	r2, [r0, #28]
c0de8c08:	7782      	strb	r2, [r0, #30]
c0de8c0a:	786a      	ldrb	r2, [r5, #1]
c0de8c0c:	2a01      	cmp	r2, #1
c0de8c0e:	bf88      	it	hi
c0de8c10:	2404      	movhi	r4, #4
c0de8c12:	7584      	strb	r4, [r0, #22]
c0de8c14:	bf88      	it	hi
c0de8c16:	2101      	movhi	r1, #1
c0de8c18:	00c9      	lsls	r1, r1, #3
c0de8c1a:	75c1      	strb	r1, [r0, #23]
c0de8c1c:	f000 f8d4 	bl	c0de8dc8 <OUTLINED_FUNCTION_0>
c0de8c20:	6008      	str	r0, [r1, #0]
c0de8c22:	7928      	ldrb	r0, [r5, #4]
c0de8c24:	b310      	cbz	r0, c0de8c6c <layoutNavigationPopulate+0xa8>
c0de8c26:	2005      	movs	r0, #5
c0de8c28:	4631      	mov	r1, r6
c0de8c2a:	f003 fd88 	bl	c0dec73e <nbgl_objPoolGet>
c0de8c2e:	4963      	ldr	r1, [pc, #396]	@ (c0de8dbc <layoutNavigationPopulate+0x1f8>)
c0de8c30:	4479      	add	r1, pc
c0de8c32:	f000 f8d6 	bl	c0de8de2 <OUTLINED_FUNCTION_1>
c0de8c36:	7091      	strb	r1, [r2, #2]
c0de8c38:	2100      	movs	r1, #0
c0de8c3a:	70d3      	strb	r3, [r2, #3]
c0de8c3c:	2260      	movs	r2, #96	@ 0x60
c0de8c3e:	2301      	movs	r3, #1
c0de8c40:	71c1      	strb	r1, [r0, #7]
c0de8c42:	7141      	strb	r1, [r0, #5]
c0de8c44:	7741      	strb	r1, [r0, #29]
c0de8c46:	7601      	strb	r1, [r0, #24]
c0de8c48:	2103      	movs	r1, #3
c0de8c4a:	7182      	strb	r2, [r0, #6]
c0de8c4c:	2268      	movs	r2, #104	@ 0x68
c0de8c4e:	7703      	strb	r3, [r0, #28]
c0de8c50:	f880 1020 	strb.w	r1, [r0, #32]
c0de8c54:	77c1      	strb	r1, [r0, #31]
c0de8c56:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de8c5a:	2102      	movs	r1, #2
c0de8c5c:	7102      	strb	r2, [r0, #4]
c0de8c5e:	75c2      	strb	r2, [r0, #23]
c0de8c60:	7781      	strb	r1, [r0, #30]
c0de8c62:	2106      	movs	r1, #6
c0de8c64:	7581      	strb	r1, [r0, #22]
c0de8c66:	f000 f8af 	bl	c0de8dc8 <OUTLINED_FUNCTION_0>
c0de8c6a:	6048      	str	r0, [r1, #4]
c0de8c6c:	2005      	movs	r0, #5
c0de8c6e:	4631      	mov	r1, r6
c0de8c70:	f003 fd65 	bl	c0dec73e <nbgl_objPoolGet>
c0de8c74:	4c52      	ldr	r4, [pc, #328]	@ (c0de8dc0 <layoutNavigationPopulate+0x1fc>)
c0de8c76:	447c      	add	r4, pc
c0de8c78:	0a21      	lsrs	r1, r4, #8
c0de8c7a:	0e22      	lsrs	r2, r4, #24
c0de8c7c:	f880 102f 	strb.w	r1, [r0, #47]	@ 0x2f
c0de8c80:	4601      	mov	r1, r0
c0de8c82:	f801 4f2e 	strb.w	r4, [r1, #46]!
c0de8c86:	70ca      	strb	r2, [r1, #3]
c0de8c88:	0c22      	lsrs	r2, r4, #16
c0de8c8a:	708a      	strb	r2, [r1, #2]
c0de8c8c:	2100      	movs	r1, #0
c0de8c8e:	2260      	movs	r2, #96	@ 0x60
c0de8c90:	7182      	strb	r2, [r0, #6]
c0de8c92:	2268      	movs	r2, #104	@ 0x68
c0de8c94:	71c1      	strb	r1, [r0, #7]
c0de8c96:	7141      	strb	r1, [r0, #5]
c0de8c98:	7741      	strb	r1, [r0, #29]
c0de8c9a:	f880 1021 	strb.w	r1, [r0, #33]	@ 0x21
c0de8c9e:	2103      	movs	r1, #3
c0de8ca0:	7102      	strb	r2, [r0, #4]
c0de8ca2:	2201      	movs	r2, #1
c0de8ca4:	f880 1020 	strb.w	r1, [r0, #32]
c0de8ca8:	77c1      	strb	r1, [r0, #31]
c0de8caa:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de8cae:	7781      	strb	r1, [r0, #30]
c0de8cb0:	2106      	movs	r1, #6
c0de8cb2:	7581      	strb	r1, [r0, #22]
c0de8cb4:	7702      	strb	r2, [r0, #28]
c0de8cb6:	4641      	mov	r1, r8
c0de8cb8:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de8cbc:	784b      	ldrb	r3, [r1, #1]
c0de8cbe:	788f      	ldrb	r7, [r1, #2]
c0de8cc0:	78c9      	ldrb	r1, [r1, #3]
c0de8cc2:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de8cc6:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de8cca:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de8cce:	6088      	str	r0, [r1, #8]
c0de8cd0:	79a8      	ldrb	r0, [r5, #6]
c0de8cd2:	2800      	cmp	r0, #0
c0de8cd4:	d067      	beq.n	c0de8da6 <layoutNavigationPopulate+0x1e2>
c0de8cd6:	79e8      	ldrb	r0, [r5, #7]
c0de8cd8:	2800      	cmp	r0, #0
c0de8cda:	d04c      	beq.n	c0de8d76 <layoutNavigationPopulate+0x1b2>
c0de8cdc:	2004      	movs	r0, #4
c0de8cde:	4631      	mov	r1, r6
c0de8ce0:	f003 fd2d 	bl	c0dec73e <nbgl_objPoolGet>
c0de8ce4:	4606      	mov	r6, r0
c0de8ce6:	7868      	ldrb	r0, [r5, #1]
c0de8ce8:	78a9      	ldrb	r1, [r5, #2]
c0de8cea:	f04f 0a0b 	mov.w	sl, #11
c0de8cee:	9000      	str	r0, [sp, #0]
c0de8cf0:	4830      	ldr	r0, [pc, #192]	@ (c0de8db4 <layoutNavigationPopulate+0x1f0>)
c0de8cf2:	1c4b      	adds	r3, r1, #1
c0de8cf4:	210b      	movs	r1, #11
c0de8cf6:	4a33      	ldr	r2, [pc, #204]	@ (c0de8dc4 <layoutNavigationPopulate+0x200>)
c0de8cf8:	eb09 0700 	add.w	r7, r9, r0
c0de8cfc:	447a      	add	r2, pc
c0de8cfe:	4638      	mov	r0, r7
c0de8d00:	f003 fd6c 	bl	c0dec7dc <snprintf>
c0de8d04:	0a38      	lsrs	r0, r7, #8
c0de8d06:	0e39      	lsrs	r1, r7, #24
c0de8d08:	f06f 0201 	mvn.w	r2, #1
c0de8d0c:	f886 a022 	strb.w	sl, [r6, #34]	@ 0x22
c0de8d10:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de8d14:	4630      	mov	r0, r6
c0de8d16:	f800 7f26 	strb.w	r7, [r0, #38]!
c0de8d1a:	70c1      	strb	r1, [r0, #3]
c0de8d1c:	0c39      	lsrs	r1, r7, #16
c0de8d1e:	7081      	strb	r1, [r0, #2]
c0de8d20:	2000      	movs	r0, #0
c0de8d22:	7861      	ldrb	r1, [r4, #1]
c0de8d24:	71f0      	strb	r0, [r6, #7]
c0de8d26:	2060      	movs	r0, #96	@ 0x60
c0de8d28:	71b0      	strb	r0, [r6, #6]
c0de8d2a:	2001      	movs	r0, #1
c0de8d2c:	77f0      	strb	r0, [r6, #31]
c0de8d2e:	2005      	movs	r0, #5
c0de8d30:	f886 0020 	strb.w	r0, [r6, #32]
c0de8d34:	75b0      	strb	r0, [r6, #22]
c0de8d36:	7820      	ldrb	r0, [r4, #0]
c0de8d38:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de8d3c:	f1c0 0168 	rsb	r1, r0, #104	@ 0x68
c0de8d40:	fb91 f1f2 	sdiv	r1, r1, r2
c0de8d44:	1a08      	subs	r0, r1, r0
c0de8d46:	4641      	mov	r1, r8
c0de8d48:	f811 cf22 	ldrb.w	ip, [r1, #34]!
c0de8d4c:	f811 3c1e 	ldrb.w	r3, [r1, #-30]
c0de8d50:	f811 4c1d 	ldrb.w	r4, [r1, #-29]
c0de8d54:	784f      	ldrb	r7, [r1, #1]
c0de8d56:	788a      	ldrb	r2, [r1, #2]
c0de8d58:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de8d5c:	eb03 0040 	add.w	r0, r3, r0, lsl #1
c0de8d60:	7130      	strb	r0, [r6, #4]
c0de8d62:	0a00      	lsrs	r0, r0, #8
c0de8d64:	78c9      	ldrb	r1, [r1, #3]
c0de8d66:	7170      	strb	r0, [r6, #5]
c0de8d68:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0de8d6c:	ea4c 2207 	orr.w	r2, ip, r7, lsl #8
c0de8d70:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de8d74:	60ce      	str	r6, [r1, #12]
c0de8d76:	7928      	ldrb	r0, [r5, #4]
c0de8d78:	b1a8      	cbz	r0, c0de8da6 <layoutNavigationPopulate+0x1e2>
c0de8d7a:	4640      	mov	r0, r8
c0de8d7c:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de8d80:	7842      	ldrb	r2, [r0, #1]
c0de8d82:	7883      	ldrb	r3, [r0, #2]
c0de8d84:	78c0      	ldrb	r0, [r0, #3]
c0de8d86:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de8d8a:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de8d8e:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de8d92:	6840      	ldr	r0, [r0, #4]
c0de8d94:	f810 1f17 	ldrb.w	r1, [r0, #23]!
c0de8d98:	7842      	ldrb	r2, [r0, #1]
c0de8d9a:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de8d9e:	314f      	adds	r1, #79	@ 0x4f
c0de8da0:	7001      	strb	r1, [r0, #0]
c0de8da2:	0a09      	lsrs	r1, r1, #8
c0de8da4:	7041      	strb	r1, [r0, #1]
c0de8da6:	7869      	ldrb	r1, [r5, #1]
c0de8da8:	78aa      	ldrb	r2, [r5, #2]
c0de8daa:	4640      	mov	r0, r8
c0de8dac:	e8bd 45f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de8db0:	f7ff bee8 	b.w	c0de8b84 <configButtons>
c0de8db4:	000018f0 	.word	0x000018f0
c0de8db8:	0000520f 	.word	0x0000520f
c0de8dbc:	000050a3 	.word	0x000050a3
c0de8dc0:	000050e0 	.word	0x000050e0
c0de8dc4:	00005b92 	.word	0x00005b92

c0de8dc8 <OUTLINED_FUNCTION_0>:
c0de8dc8:	4641      	mov	r1, r8
c0de8dca:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de8dce:	784b      	ldrb	r3, [r1, #1]
c0de8dd0:	788c      	ldrb	r4, [r1, #2]
c0de8dd2:	78c9      	ldrb	r1, [r1, #3]
c0de8dd4:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de8dd8:	ea44 2101 	orr.w	r1, r4, r1, lsl #8
c0de8ddc:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de8de0:	4770      	bx	lr

c0de8de2 <OUTLINED_FUNCTION_1>:
c0de8de2:	0a0a      	lsrs	r2, r1, #8
c0de8de4:	0e0b      	lsrs	r3, r1, #24
c0de8de6:	f880 202f 	strb.w	r2, [r0, #47]	@ 0x2f
c0de8dea:	4602      	mov	r2, r0
c0de8dec:	f802 1f2e 	strb.w	r1, [r2, #46]!
c0de8df0:	0c09      	lsrs	r1, r1, #16
c0de8df2:	4770      	bx	lr

c0de8df4 <nbgl_pageDrawLedgerInfo>:
c0de8df4:	b510      	push	{r4, lr}
c0de8df6:	b08c      	sub	sp, #48	@ 0x30
c0de8df8:	9008      	str	r0, [sp, #32]
c0de8dfa:	f44f 7080 	mov.w	r0, #256	@ 0x100
c0de8dfe:	f88d 301c 	strb.w	r3, [sp, #28]
c0de8e02:	f8ad 0014 	strh.w	r0, [sp, #20]
c0de8e06:	2009      	movs	r0, #9
c0de8e08:	f88d 001d 	strb.w	r0, [sp, #29]
c0de8e0c:	481c      	ldr	r0, [pc, #112]	@ (c0de8e80 <nbgl_pageDrawLedgerInfo+0x8c>)
c0de8e0e:	4478      	add	r0, pc
c0de8e10:	9006      	str	r0, [sp, #24]
c0de8e12:	2000      	movs	r0, #0
c0de8e14:	9004      	str	r0, [sp, #16]
c0de8e16:	4b1b      	ldr	r3, [pc, #108]	@ (c0de8e84 <nbgl_pageDrawLedgerInfo+0x90>)
c0de8e18:	e9cd 2000 	strd	r2, r0, [sp]
c0de8e1c:	784a      	ldrb	r2, [r1, #1]
c0de8e1e:	78cc      	ldrb	r4, [r1, #3]
c0de8e20:	447b      	add	r3, pc
c0de8e22:	e9cd 0302 	strd	r0, r3, [sp, #8]
c0de8e26:	7808      	ldrb	r0, [r1, #0]
c0de8e28:	788b      	ldrb	r3, [r1, #2]
c0de8e2a:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de8e2e:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de8e32:	460a      	mov	r2, r1
c0de8e34:	ea40 4003 	orr.w	r0, r0, r3, lsl #16
c0de8e38:	f812 3f08 	ldrb.w	r3, [r2, #8]!
c0de8e3c:	9009      	str	r0, [sp, #36]	@ 0x24
c0de8e3e:	7a48      	ldrb	r0, [r1, #9]
c0de8e40:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de8e44:	7893      	ldrb	r3, [r2, #2]
c0de8e46:	78d2      	ldrb	r2, [r2, #3]
c0de8e48:	ea43 2202 	orr.w	r2, r3, r2, lsl #8
c0de8e4c:	ea40 4002 	orr.w	r0, r0, r2, lsl #16
c0de8e50:	900b      	str	r0, [sp, #44]	@ 0x2c
c0de8e52:	7948      	ldrb	r0, [r1, #5]
c0de8e54:	f811 2f04 	ldrb.w	r2, [r1, #4]!
c0de8e58:	f000 fb79 	bl	c0de954e <OUTLINED_FUNCTION_1>
c0de8e5c:	900a      	str	r0, [sp, #40]	@ 0x28
c0de8e5e:	a805      	add	r0, sp, #20
c0de8e60:	f7fc f83c 	bl	c0de4edc <nbgl_layoutGet>
c0de8e64:	2160      	movs	r1, #96	@ 0x60
c0de8e66:	4604      	mov	r4, r0
c0de8e68:	f000 f80e 	bl	c0de8e88 <addEmptyHeader>
c0de8e6c:	4669      	mov	r1, sp
c0de8e6e:	4620      	mov	r0, r4
c0de8e70:	f7fd ff3a 	bl	c0de6ce8 <nbgl_layoutAddCenteredInfo>
c0de8e74:	4620      	mov	r0, r4
c0de8e76:	f7ff fa2b 	bl	c0de82d0 <nbgl_layoutDraw>
c0de8e7a:	4620      	mov	r0, r4
c0de8e7c:	b00c      	add	sp, #48	@ 0x30
c0de8e7e:	bd10      	pop	{r4, pc}
c0de8e80:	00005e58 	.word	0x00005e58
c0de8e84:	000046fa 	.word	0x000046fa

c0de8e88 <addEmptyHeader>:
c0de8e88:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de8e8a:	f8ad 1004 	strh.w	r1, [sp, #4]
c0de8e8e:	2100      	movs	r1, #0
c0de8e90:	f8ad 1000 	strh.w	r1, [sp]
c0de8e94:	4669      	mov	r1, sp
c0de8e96:	f7fe fdb9 	bl	c0de7a0c <nbgl_layoutAddHeader>
c0de8e9a:	bd8f      	pop	{r0, r1, r2, r3, r7, pc}

c0de8e9c <nbgl_pageDrawInfo>:
c0de8e9c:	b570      	push	{r4, r5, r6, lr}
c0de8e9e:	b08c      	sub	sp, #48	@ 0x30
c0de8ea0:	460d      	mov	r5, r1
c0de8ea2:	4606      	mov	r6, r0
c0de8ea4:	a805      	add	r0, sp, #20
c0de8ea6:	211c      	movs	r1, #28
c0de8ea8:	4614      	mov	r4, r2
c0de8eaa:	f004 f931 	bl	c0ded110 <__aeabi_memclr>
c0de8eae:	2001      	movs	r0, #1
c0de8eb0:	9608      	str	r6, [sp, #32]
c0de8eb2:	f88d 0015 	strb.w	r0, [sp, #21]
c0de8eb6:	f894 0024 	ldrb.w	r0, [r4, #36]	@ 0x24
c0de8eba:	b948      	cbnz	r0, c0de8ed0 <nbgl_pageDrawInfo+0x34>
c0de8ebc:	6a20      	ldr	r0, [r4, #32]
c0de8ebe:	9006      	str	r0, [sp, #24]
c0de8ec0:	f894 0025 	ldrb.w	r0, [r4, #37]	@ 0x25
c0de8ec4:	f88d 001c 	strb.w	r0, [sp, #28]
c0de8ec8:	f894 0031 	ldrb.w	r0, [r4, #49]	@ 0x31
c0de8ecc:	f88d 001d 	strb.w	r0, [sp, #29]
c0de8ed0:	b1f5      	cbz	r5, c0de8f10 <nbgl_pageDrawInfo+0x74>
c0de8ed2:	4629      	mov	r1, r5
c0de8ed4:	7a68      	ldrb	r0, [r5, #9]
c0de8ed6:	78eb      	ldrb	r3, [r5, #3]
c0de8ed8:	f811 2f08 	ldrb.w	r2, [r1, #8]!
c0de8edc:	f000 fb37 	bl	c0de954e <OUTLINED_FUNCTION_1>
c0de8ee0:	4629      	mov	r1, r5
c0de8ee2:	900b      	str	r0, [sp, #44]	@ 0x2c
c0de8ee4:	7968      	ldrb	r0, [r5, #5]
c0de8ee6:	f811 2f04 	ldrb.w	r2, [r1, #4]!
c0de8eea:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de8eee:	788a      	ldrb	r2, [r1, #2]
c0de8ef0:	78c9      	ldrb	r1, [r1, #3]
c0de8ef2:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0de8ef6:	78aa      	ldrb	r2, [r5, #2]
c0de8ef8:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de8efc:	7869      	ldrb	r1, [r5, #1]
c0de8efe:	900a      	str	r0, [sp, #40]	@ 0x28
c0de8f00:	7828      	ldrb	r0, [r5, #0]
c0de8f02:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de8f06:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de8f0a:	ea40 4002 	orr.w	r0, r0, r2, lsl #16
c0de8f0e:	e000      	b.n	c0de8f12 <nbgl_pageDrawInfo+0x76>
c0de8f10:	2000      	movs	r0, #0
c0de8f12:	9009      	str	r0, [sp, #36]	@ 0x24
c0de8f14:	a805      	add	r0, sp, #20
c0de8f16:	f7fb ffe1 	bl	c0de4edc <nbgl_layoutGet>
c0de8f1a:	4605      	mov	r5, r0
c0de8f1c:	f894 0024 	ldrb.w	r0, [r4, #36]	@ 0x24
c0de8f20:	b150      	cbz	r0, c0de8f38 <nbgl_pageDrawInfo+0x9c>
c0de8f22:	f894 0031 	ldrb.w	r0, [r4, #49]	@ 0x31
c0de8f26:	f894 3025 	ldrb.w	r3, [r4, #37]	@ 0x25
c0de8f2a:	6a22      	ldr	r2, [r4, #32]
c0de8f2c:	f44f 61c0 	mov.w	r1, #1536	@ 0x600
c0de8f30:	9000      	str	r0, [sp, #0]
c0de8f32:	4628      	mov	r0, r5
c0de8f34:	f7fc fd40 	bl	c0de59b8 <nbgl_layoutAddSwipe>
c0de8f38:	7d20      	ldrb	r0, [r4, #20]
c0de8f3a:	b118      	cbz	r0, c0de8f44 <nbgl_pageDrawInfo+0xa8>
c0de8f3c:	4628      	mov	r0, r5
c0de8f3e:	2128      	movs	r1, #40	@ 0x28
c0de8f40:	f7ff ffa2 	bl	c0de8e88 <addEmptyHeader>
c0de8f44:	4628      	mov	r0, r5
c0de8f46:	4621      	mov	r1, r4
c0de8f48:	f7fd fece 	bl	c0de6ce8 <nbgl_layoutAddCenteredInfo>
c0de8f4c:	6aa0      	ldr	r0, [r4, #40]	@ 0x28
c0de8f4e:	b1b8      	cbz	r0, c0de8f80 <nbgl_pageDrawInfo+0xe4>
c0de8f50:	7d61      	ldrb	r1, [r4, #21]
c0de8f52:	2904      	cmp	r1, #4
c0de8f54:	d014      	beq.n	c0de8f80 <nbgl_pageDrawInfo+0xe4>
c0de8f56:	9001      	str	r0, [sp, #4]
c0de8f58:	2001      	movs	r0, #1
c0de8f5a:	f8ad 000e 	strh.w	r0, [sp, #14]
c0de8f5e:	6ae0      	ldr	r0, [r4, #44]	@ 0x2c
c0de8f60:	9002      	str	r0, [sp, #8]
c0de8f62:	7de0      	ldrb	r0, [r4, #23]
c0de8f64:	f88d 000c 	strb.w	r0, [sp, #12]
c0de8f68:	f894 0030 	ldrb.w	r0, [r4, #48]	@ 0x30
c0de8f6c:	f88d 000d 	strb.w	r0, [sp, #13]
c0de8f70:	f894 0031 	ldrb.w	r0, [r4, #49]	@ 0x31
c0de8f74:	f88d 0010 	strb.w	r0, [sp, #16]
c0de8f78:	a901      	add	r1, sp, #4
c0de8f7a:	4628      	mov	r0, r5
c0de8f7c:	f7fe fc2e 	bl	c0de77dc <nbgl_layoutAddButton>
c0de8f80:	69a0      	ldr	r0, [r4, #24]
c0de8f82:	b140      	cbz	r0, c0de8f96 <nbgl_pageDrawInfo+0xfa>
c0de8f84:	f003 fdbc 	bl	c0decb00 <pic>
c0de8f88:	7f22      	ldrb	r2, [r4, #28]
c0de8f8a:	f894 3031 	ldrb.w	r3, [r4, #49]	@ 0x31
c0de8f8e:	4601      	mov	r1, r0
c0de8f90:	4628      	mov	r0, r5
c0de8f92:	f7fe fd14 	bl	c0de79be <nbgl_layoutAddFooter>
c0de8f96:	7d20      	ldrb	r0, [r4, #20]
c0de8f98:	b1b0      	cbz	r0, c0de8fc8 <nbgl_pageDrawInfo+0x12c>
c0de8f9a:	2801      	cmp	r0, #1
c0de8f9c:	d006      	beq.n	c0de8fac <nbgl_pageDrawInfo+0x110>
c0de8f9e:	2802      	cmp	r0, #2
c0de8fa0:	d007      	beq.n	c0de8fb2 <nbgl_pageDrawInfo+0x116>
c0de8fa2:	2803      	cmp	r0, #3
c0de8fa4:	d136      	bne.n	c0de9014 <nbgl_pageDrawInfo+0x178>
c0de8fa6:	482e      	ldr	r0, [pc, #184]	@ (c0de9060 <nbgl_pageDrawInfo+0x1c4>)
c0de8fa8:	4478      	add	r0, pc
c0de8faa:	e004      	b.n	c0de8fb6 <nbgl_pageDrawInfo+0x11a>
c0de8fac:	482b      	ldr	r0, [pc, #172]	@ (c0de905c <nbgl_pageDrawInfo+0x1c0>)
c0de8fae:	4478      	add	r0, pc
c0de8fb0:	e001      	b.n	c0de8fb6 <nbgl_pageDrawInfo+0x11a>
c0de8fb2:	482c      	ldr	r0, [pc, #176]	@ (c0de9064 <nbgl_pageDrawInfo+0x1c8>)
c0de8fb4:	4478      	add	r0, pc
c0de8fb6:	f003 fda3 	bl	c0decb00 <pic>
c0de8fba:	7da2      	ldrb	r2, [r4, #22]
c0de8fbc:	f894 3031 	ldrb.w	r3, [r4, #49]	@ 0x31
c0de8fc0:	4601      	mov	r1, r0
c0de8fc2:	4628      	mov	r0, r5
c0de8fc4:	f7fc fd52 	bl	c0de5a6c <nbgl_layoutAddTopRightButton>
c0de8fc8:	7d60      	ldrb	r0, [r4, #21]
c0de8fca:	b3c0      	cbz	r0, c0de903e <nbgl_pageDrawInfo+0x1a2>
c0de8fcc:	2801      	cmp	r0, #1
c0de8fce:	d023      	beq.n	c0de9018 <nbgl_pageDrawInfo+0x17c>
c0de8fd0:	2802      	cmp	r0, #2
c0de8fd2:	d024      	beq.n	c0de901e <nbgl_pageDrawInfo+0x182>
c0de8fd4:	2803      	cmp	r0, #3
c0de8fd6:	d025      	beq.n	c0de9024 <nbgl_pageDrawInfo+0x188>
c0de8fd8:	2804      	cmp	r0, #4
c0de8fda:	d11b      	bne.n	c0de9014 <nbgl_pageDrawInfo+0x178>
c0de8fdc:	6aa0      	ldr	r0, [r4, #40]	@ 0x28
c0de8fde:	b3a0      	cbz	r0, c0de904a <nbgl_pageDrawInfo+0x1ae>
c0de8fe0:	4922      	ldr	r1, [pc, #136]	@ (c0de906c <nbgl_pageDrawInfo+0x1d0>)
c0de8fe2:	4479      	add	r1, pc
c0de8fe4:	e9cd 0101 	strd	r0, r1, [sp, #4]
c0de8fe8:	6ae0      	ldr	r0, [r4, #44]	@ 0x2c
c0de8fea:	2102      	movs	r1, #2
c0de8fec:	9003      	str	r0, [sp, #12]
c0de8fee:	7de0      	ldrb	r0, [r4, #23]
c0de8ff0:	f88d 0010 	strb.w	r0, [sp, #16]
c0de8ff4:	f894 0031 	ldrb.w	r0, [r4, #49]	@ 0x31
c0de8ff8:	f88d 0012 	strb.w	r0, [sp, #18]
c0de8ffc:	f894 0030 	ldrb.w	r0, [r4, #48]	@ 0x30
c0de9000:	2800      	cmp	r0, #0
c0de9002:	bf08      	it	eq
c0de9004:	2101      	moveq	r1, #1
c0de9006:	f88d 1011 	strb.w	r1, [sp, #17]
c0de900a:	4628      	mov	r0, r5
c0de900c:	a901      	add	r1, sp, #4
c0de900e:	f7fe fa15 	bl	c0de743c <nbgl_layoutAddChoiceButtons>
c0de9012:	e014      	b.n	c0de903e <nbgl_pageDrawInfo+0x1a2>
c0de9014:	2500      	movs	r5, #0
c0de9016:	e015      	b.n	c0de9044 <nbgl_pageDrawInfo+0x1a8>
c0de9018:	4813      	ldr	r0, [pc, #76]	@ (c0de9068 <nbgl_pageDrawInfo+0x1cc>)
c0de901a:	4478      	add	r0, pc
c0de901c:	e004      	b.n	c0de9028 <nbgl_pageDrawInfo+0x18c>
c0de901e:	4816      	ldr	r0, [pc, #88]	@ (c0de9078 <nbgl_pageDrawInfo+0x1dc>)
c0de9020:	4478      	add	r0, pc
c0de9022:	e001      	b.n	c0de9028 <nbgl_pageDrawInfo+0x18c>
c0de9024:	4813      	ldr	r0, [pc, #76]	@ (c0de9074 <nbgl_pageDrawInfo+0x1d8>)
c0de9026:	4478      	add	r0, pc
c0de9028:	f003 fd6a 	bl	c0decb00 <pic>
c0de902c:	4601      	mov	r1, r0
c0de902e:	f894 0031 	ldrb.w	r0, [r4, #49]	@ 0x31
c0de9032:	7de2      	ldrb	r2, [r4, #23]
c0de9034:	2300      	movs	r3, #0
c0de9036:	9000      	str	r0, [sp, #0]
c0de9038:	4628      	mov	r0, r5
c0de903a:	f7fd f8dd 	bl	c0de61f8 <nbgl_layoutAddBottomButton>
c0de903e:	4628      	mov	r0, r5
c0de9040:	f7ff f946 	bl	c0de82d0 <nbgl_layoutDraw>
c0de9044:	4628      	mov	r0, r5
c0de9046:	b00c      	add	sp, #48	@ 0x30
c0de9048:	bd70      	pop	{r4, r5, r6, pc}
c0de904a:	7de2      	ldrb	r2, [r4, #23]
c0de904c:	f894 3031 	ldrb.w	r3, [r4, #49]	@ 0x31
c0de9050:	4907      	ldr	r1, [pc, #28]	@ (c0de9070 <nbgl_pageDrawInfo+0x1d4>)
c0de9052:	4628      	mov	r0, r5
c0de9054:	4479      	add	r1, pc
c0de9056:	f7fe fcb2 	bl	c0de79be <nbgl_layoutAddFooter>
c0de905a:	e7f0      	b.n	c0de903e <nbgl_pageDrawInfo+0x1a2>
c0de905c:	00005370 	.word	0x00005370
c0de9060:	00004e88 	.word	0x00004e88
c0de9064:	00004e39 	.word	0x00004e39
c0de9068:	00005304 	.word	0x00005304
c0de906c:	00005d19 	.word	0x00005d19
c0de9070:	00005ca7 	.word	0x00005ca7
c0de9074:	00004e0a 	.word	0x00004e0a
c0de9078:	00004dcd 	.word	0x00004dcd

c0de907c <nbgl_pageDrawConfirmation>:
c0de907c:	b5b0      	push	{r4, r5, r7, lr}
c0de907e:	b08c      	sub	sp, #48	@ 0x30
c0de9080:	4605      	mov	r5, r0
c0de9082:	6948      	ldr	r0, [r1, #20]
c0de9084:	460c      	mov	r4, r1
c0de9086:	f003 fd3b 	bl	c0decb00 <pic>
c0de908a:	9001      	str	r0, [sp, #4]
c0de908c:	69a0      	ldr	r0, [r4, #24]
c0de908e:	b110      	cbz	r0, c0de9096 <nbgl_pageDrawConfirmation+0x1a>
c0de9090:	f003 fd36 	bl	c0decb00 <pic>
c0de9094:	e001      	b.n	c0de909a <nbgl_pageDrawConfirmation+0x1e>
c0de9096:	4815      	ldr	r0, [pc, #84]	@ (c0de90ec <nbgl_pageDrawConfirmation+0x70>)
c0de9098:	4478      	add	r0, pc
c0de909a:	2100      	movs	r1, #0
c0de909c:	7fe2      	ldrb	r2, [r4, #31]
c0de909e:	9508      	str	r5, [sp, #32]
c0de90a0:	e9cd 0102 	strd	r0, r1, [sp, #8]
c0de90a4:	2001      	movs	r0, #1
c0de90a6:	f88d 1011 	strb.w	r1, [sp, #17]
c0de90aa:	9109      	str	r1, [sp, #36]	@ 0x24
c0de90ac:	9106      	str	r1, [sp, #24]
c0de90ae:	7fa1      	ldrb	r1, [r4, #30]
c0de90b0:	f88d 0015 	strb.w	r0, [sp, #21]
c0de90b4:	7f20      	ldrb	r0, [r4, #28]
c0de90b6:	f88d 2014 	strb.w	r2, [sp, #20]
c0de90ba:	f88d 1012 	strb.w	r1, [sp, #18]
c0de90be:	f88d 0010 	strb.w	r0, [sp, #16]
c0de90c2:	a805      	add	r0, sp, #20
c0de90c4:	f7fb ff0a 	bl	c0de4edc <nbgl_layoutGet>
c0de90c8:	2140      	movs	r1, #64	@ 0x40
c0de90ca:	4605      	mov	r5, r0
c0de90cc:	f7ff fedc 	bl	c0de8e88 <addEmptyHeader>
c0de90d0:	a901      	add	r1, sp, #4
c0de90d2:	4628      	mov	r0, r5
c0de90d4:	f7fe f9b2 	bl	c0de743c <nbgl_layoutAddChoiceButtons>
c0de90d8:	4628      	mov	r0, r5
c0de90da:	4621      	mov	r1, r4
c0de90dc:	f7fd fe04 	bl	c0de6ce8 <nbgl_layoutAddCenteredInfo>
c0de90e0:	4628      	mov	r0, r5
c0de90e2:	f7ff f8f5 	bl	c0de82d0 <nbgl_layoutDraw>
c0de90e6:	4628      	mov	r0, r5
c0de90e8:	b00c      	add	sp, #48	@ 0x30
c0de90ea:	bdb0      	pop	{r4, r5, r7, pc}
c0de90ec:	000057b5 	.word	0x000057b5

c0de90f0 <nbgl_pageDrawGenericContentExt>:
c0de90f0:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de90f4:	b096      	sub	sp, #88	@ 0x58
c0de90f6:	460e      	mov	r6, r1
c0de90f8:	2100      	movs	r1, #0
c0de90fa:	4615      	mov	r5, r2
c0de90fc:	f88d 3008 	strb.w	r3, [sp, #8]
c0de9100:	e9cd 0105 	strd	r0, r1, [sp, #20]
c0de9104:	2001      	movs	r0, #1
c0de9106:	f88d 0009 	strb.w	r0, [sp, #9]
c0de910a:	b10e      	cbz	r6, c0de9110 <nbgl_pageDrawGenericContentExt+0x20>
c0de910c:	78f0      	ldrb	r0, [r6, #3]
c0de910e:	b108      	cbz	r0, c0de9114 <nbgl_pageDrawGenericContentExt+0x24>
c0de9110:	9103      	str	r1, [sp, #12]
c0de9112:	e007      	b.n	c0de9124 <nbgl_pageDrawGenericContentExt+0x34>
c0de9114:	6970      	ldr	r0, [r6, #20]
c0de9116:	7cb1      	ldrb	r1, [r6, #18]
c0de9118:	9003      	str	r0, [sp, #12]
c0de911a:	7970      	ldrb	r0, [r6, #5]
c0de911c:	f88d 1010 	strb.w	r1, [sp, #16]
c0de9120:	f88d 0011 	strb.w	r0, [sp, #17]
c0de9124:	a802      	add	r0, sp, #8
c0de9126:	f7fb fed9 	bl	c0de4edc <nbgl_layoutGet>
c0de912a:	4682      	mov	sl, r0
c0de912c:	b17e      	cbz	r6, c0de914e <nbgl_pageDrawGenericContentExt+0x5e>
c0de912e:	78f0      	ldrb	r0, [r6, #3]
c0de9130:	2801      	cmp	r0, #1
c0de9132:	d011      	beq.n	c0de9158 <nbgl_pageDrawGenericContentExt+0x68>
c0de9134:	b958      	cbnz	r0, c0de914e <nbgl_pageDrawGenericContentExt+0x5e>
c0de9136:	68b3      	ldr	r3, [r6, #8]
c0de9138:	78b2      	ldrb	r2, [r6, #2]
c0de913a:	69b1      	ldr	r1, [r6, #24]
c0de913c:	b323      	cbz	r3, c0de9188 <nbgl_pageDrawGenericContentExt+0x98>
c0de913e:	7970      	ldrb	r0, [r6, #5]
c0de9140:	7b34      	ldrb	r4, [r6, #12]
c0de9142:	e9cd 4000 	strd	r4, r0, [sp]
c0de9146:	4650      	mov	r0, sl
c0de9148:	f7fe fc4b 	bl	c0de79e2 <nbgl_layoutAddSplitFooter>
c0de914c:	e020      	b.n	c0de9190 <nbgl_pageDrawGenericContentExt+0xa0>
c0de914e:	f04f 0800 	mov.w	r8, #0
c0de9152:	f44f 7716 	mov.w	r7, #600	@ 0x258
c0de9156:	e07e      	b.n	c0de9256 <nbgl_pageDrawGenericContentExt+0x166>
c0de9158:	68b0      	ldr	r0, [r6, #8]
c0de915a:	2800      	cmp	r0, #0
c0de915c:	4680      	mov	r8, r0
c0de915e:	bf18      	it	ne
c0de9160:	f04f 0801 	movne.w	r8, #1
c0de9164:	d027      	beq.n	c0de91b6 <nbgl_pageDrawGenericContentExt+0xc6>
c0de9166:	900e      	str	r0, [sp, #56]	@ 0x38
c0de9168:	2006      	movs	r0, #6
c0de916a:	7b31      	ldrb	r1, [r6, #12]
c0de916c:	f8ad 0034 	strh.w	r0, [sp, #52]	@ 0x34
c0de9170:	7970      	ldrb	r0, [r6, #5]
c0de9172:	f88d 103c 	strb.w	r1, [sp, #60]	@ 0x3c
c0de9176:	f88d 003d 	strb.w	r0, [sp, #61]	@ 0x3d
c0de917a:	a90d      	add	r1, sp, #52	@ 0x34
c0de917c:	4650      	mov	r0, sl
c0de917e:	f7fe fc45 	bl	c0de7a0c <nbgl_layoutAddHeader>
c0de9182:	f5c0 7716 	rsb	r7, r0, #600	@ 0x258
c0de9186:	e018      	b.n	c0de91ba <nbgl_pageDrawGenericContentExt+0xca>
c0de9188:	7973      	ldrb	r3, [r6, #5]
c0de918a:	4650      	mov	r0, sl
c0de918c:	f7fe fc17 	bl	c0de79be <nbgl_layoutAddFooter>
c0de9190:	f5c0 7716 	rsb	r7, r0, #600	@ 0x258
c0de9194:	7930      	ldrb	r0, [r6, #4]
c0de9196:	2800      	cmp	r0, #0
c0de9198:	d042      	beq.n	c0de9220 <nbgl_pageDrawGenericContentExt+0x130>
c0de919a:	7c70      	ldrb	r0, [r6, #17]
c0de919c:	7974      	ldrb	r4, [r6, #5]
c0de919e:	7831      	ldrb	r1, [r6, #0]
c0de91a0:	7872      	ldrb	r2, [r6, #1]
c0de91a2:	7c33      	ldrb	r3, [r6, #16]
c0de91a4:	e9cd 0400 	strd	r0, r4, [sp]
c0de91a8:	4650      	mov	r0, sl
c0de91aa:	f7fe fe73 	bl	c0de7e94 <nbgl_layoutAddProgressIndicator>
c0de91ae:	1a3f      	subs	r7, r7, r0
c0de91b0:	f04f 0801 	mov.w	r8, #1
c0de91b4:	e04f      	b.n	c0de9256 <nbgl_pageDrawGenericContentExt+0x166>
c0de91b6:	f44f 7716 	mov.w	r7, #600	@ 0x258
c0de91ba:	2001      	movs	r0, #1
c0de91bc:	f88d 0035 	strb.w	r0, [sp, #53]	@ 0x35
c0de91c0:	7870      	ldrb	r0, [r6, #1]
c0de91c2:	2802      	cmp	r0, #2
c0de91c4:	d31c      	bcc.n	c0de9200 <nbgl_pageDrawGenericContentExt+0x110>
c0de91c6:	6971      	ldr	r1, [r6, #20]
c0de91c8:	b369      	cbz	r1, c0de9226 <nbgl_pageDrawGenericContentExt+0x136>
c0de91ca:	f88d 0039 	strb.w	r0, [sp, #57]	@ 0x39
c0de91ce:	2001      	movs	r0, #1
c0de91d0:	9111      	str	r1, [sp, #68]	@ 0x44
c0de91d2:	2103      	movs	r1, #3
c0de91d4:	7972      	ldrb	r2, [r6, #5]
c0de91d6:	f000 f9c9 	bl	c0de956c <OUTLINED_FUNCTION_3>
c0de91da:	2100      	movs	r1, #0
c0de91dc:	f88d 103b 	strb.w	r1, [sp, #59]	@ 0x3b
c0de91e0:	78b1      	ldrb	r1, [r6, #2]
c0de91e2:	f88d 2049 	strb.w	r2, [sp, #73]	@ 0x49
c0de91e6:	f88d 303c 	strb.w	r3, [sp, #60]	@ 0x3c
c0de91ea:	f88d 2040 	strb.w	r2, [sp, #64]	@ 0x40
c0de91ee:	f88d 003a 	strb.w	r0, [sp, #58]	@ 0x3a
c0de91f2:	7cb0      	ldrb	r0, [r6, #18]
c0de91f4:	f88d 1048 	strb.w	r1, [sp, #72]	@ 0x48
c0de91f8:	f88d 003f 	strb.w	r0, [sp, #63]	@ 0x3f
c0de91fc:	7cf0      	ldrb	r0, [r6, #19]
c0de91fe:	e023      	b.n	c0de9248 <nbgl_pageDrawGenericContentExt+0x158>
c0de9200:	6970      	ldr	r0, [r6, #20]
c0de9202:	b340      	cbz	r0, c0de9256 <nbgl_pageDrawGenericContentExt+0x166>
c0de9204:	2100      	movs	r1, #0
c0de9206:	900e      	str	r0, [sp, #56]	@ 0x38
c0de9208:	2001      	movs	r0, #1
c0de920a:	f88d 103c 	strb.w	r1, [sp, #60]	@ 0x3c
c0de920e:	f88d 0034 	strb.w	r0, [sp, #52]	@ 0x34
c0de9212:	78b0      	ldrb	r0, [r6, #2]
c0de9214:	7971      	ldrb	r1, [r6, #5]
c0de9216:	f88d 003d 	strb.w	r0, [sp, #61]	@ 0x3d
c0de921a:	f88d 103e 	strb.w	r1, [sp, #62]	@ 0x3e
c0de921e:	e015      	b.n	c0de924c <nbgl_pageDrawGenericContentExt+0x15c>
c0de9220:	f04f 0800 	mov.w	r8, #0
c0de9224:	e017      	b.n	c0de9256 <nbgl_pageDrawGenericContentExt+0x166>
c0de9226:	f88d 0039 	strb.w	r0, [sp, #57]	@ 0x39
c0de922a:	2000      	movs	r0, #0
c0de922c:	2104      	movs	r1, #4
c0de922e:	7c32      	ldrb	r2, [r6, #16]
c0de9230:	f000 f99c 	bl	c0de956c <OUTLINED_FUNCTION_3>
c0de9234:	7971      	ldrb	r1, [r6, #5]
c0de9236:	f88d 203b 	strb.w	r2, [sp, #59]	@ 0x3b
c0de923a:	f88d 303c 	strb.w	r3, [sp, #60]	@ 0x3c
c0de923e:	f88d 003a 	strb.w	r0, [sp, #58]	@ 0x3a
c0de9242:	7cf0      	ldrb	r0, [r6, #19]
c0de9244:	f88d 1040 	strb.w	r1, [sp, #64]	@ 0x40
c0de9248:	f88d 0038 	strb.w	r0, [sp, #56]	@ 0x38
c0de924c:	a90d      	add	r1, sp, #52	@ 0x34
c0de924e:	4650      	mov	r0, sl
c0de9250:	f7fc fc48 	bl	c0de5ae4 <nbgl_layoutAddExtendedFooter>
c0de9254:	1a3f      	subs	r7, r7, r0
c0de9256:	6828      	ldr	r0, [r5, #0]
c0de9258:	b190      	cbz	r0, c0de9280 <nbgl_pageDrawGenericContentExt+0x190>
c0de925a:	900f      	str	r0, [sp, #60]	@ 0x3c
c0de925c:	2000      	movs	r0, #0
c0de925e:	79a9      	ldrb	r1, [r5, #6]
c0de9260:	900e      	str	r0, [sp, #56]	@ 0x38
c0de9262:	f240 1001 	movw	r0, #257	@ 0x101
c0de9266:	f8ad 0034 	strh.w	r0, [sp, #52]	@ 0x34
c0de926a:	7968      	ldrb	r0, [r5, #5]
c0de926c:	f88d 1041 	strb.w	r1, [sp, #65]	@ 0x41
c0de9270:	f88d 0040 	strb.w	r0, [sp, #64]	@ 0x40
c0de9274:	a90d      	add	r1, sp, #52	@ 0x34
c0de9276:	4650      	mov	r0, sl
c0de9278:	f7fe fbc8 	bl	c0de7a0c <nbgl_layoutAddHeader>
c0de927c:	f04f 0801 	mov.w	r8, #1
c0de9280:	68a9      	ldr	r1, [r5, #8]
c0de9282:	b121      	cbz	r1, c0de928e <nbgl_pageDrawGenericContentExt+0x19e>
c0de9284:	79ab      	ldrb	r3, [r5, #6]
c0de9286:	79ea      	ldrb	r2, [r5, #7]
c0de9288:	4650      	mov	r0, sl
c0de928a:	f7fc fbef 	bl	c0de5a6c <nbgl_layoutAddTopRightButton>
c0de928e:	7b28      	ldrb	r0, [r5, #12]
c0de9290:	2800      	cmp	r0, #0
c0de9292:	d044      	beq.n	c0de931e <nbgl_pageDrawGenericContentExt+0x22e>
c0de9294:	2801      	cmp	r0, #1
c0de9296:	d04d      	beq.n	c0de9334 <nbgl_pageDrawGenericContentExt+0x244>
c0de9298:	2802      	cmp	r0, #2
c0de929a:	d067      	beq.n	c0de936c <nbgl_pageDrawGenericContentExt+0x27c>
c0de929c:	2803      	cmp	r0, #3
c0de929e:	d075      	beq.n	c0de938c <nbgl_pageDrawGenericContentExt+0x29c>
c0de92a0:	2804      	cmp	r0, #4
c0de92a2:	f000 8090 	beq.w	c0de93c6 <nbgl_pageDrawGenericContentExt+0x2d6>
c0de92a6:	2805      	cmp	r0, #5
c0de92a8:	f000 8095 	beq.w	c0de93d6 <nbgl_pageDrawGenericContentExt+0x2e6>
c0de92ac:	2806      	cmp	r0, #6
c0de92ae:	f000 80ab 	beq.w	c0de9408 <nbgl_pageDrawGenericContentExt+0x318>
c0de92b2:	2807      	cmp	r0, #7
c0de92b4:	f000 80db 	beq.w	c0de946e <nbgl_pageDrawGenericContentExt+0x37e>
c0de92b8:	2808      	cmp	r0, #8
c0de92ba:	f000 80ec 	beq.w	c0de9496 <nbgl_pageDrawGenericContentExt+0x3a6>
c0de92be:	2809      	cmp	r0, #9
c0de92c0:	f000 8114 	beq.w	c0de94ec <nbgl_pageDrawGenericContentExt+0x3fc>
c0de92c4:	280a      	cmp	r0, #10
c0de92c6:	f040 8116 	bne.w	c0de94f6 <nbgl_pageDrawGenericContentExt+0x406>
c0de92ca:	489b      	ldr	r0, [pc, #620]	@ (c0de9538 <nbgl_pageDrawGenericContentExt+0x448>)
c0de92cc:	2400      	movs	r4, #0
c0de92ce:	f10d 0834 	add.w	r8, sp, #52	@ 0x34
c0de92d2:	2600      	movs	r6, #0
c0de92d4:	4478      	add	r0, pc
c0de92d6:	4683      	mov	fp, r0
c0de92d8:	7e28      	ldrb	r0, [r5, #24]
c0de92da:	4286      	cmp	r6, r0
c0de92dc:	f080 810b 	bcs.w	c0de94f6 <nbgl_pageDrawGenericContentExt+0x406>
c0de92e0:	e9d5 0104 	ldrd	r0, r1, [r5, #16]
c0de92e4:	f850 0026 	ldr.w	r0, [r0, r6, lsl #2]
c0de92e8:	e9cd b40f 	strd	fp, r4, [sp, #60]	@ 0x3c
c0de92ec:	e9cd 400d 	strd	r4, r0, [sp, #52]	@ 0x34
c0de92f0:	5d88      	ldrb	r0, [r1, r6]
c0de92f2:	4641      	mov	r1, r8
c0de92f4:	f88d 4046 	strb.w	r4, [sp, #70]	@ 0x46
c0de92f8:	f88d 4044 	strb.w	r4, [sp, #68]	@ 0x44
c0de92fc:	f88d 0045 	strb.w	r0, [sp, #69]	@ 0x45
c0de9300:	7e68      	ldrb	r0, [r5, #25]
c0de9302:	f88d 0048 	strb.w	r0, [sp, #72]	@ 0x48
c0de9306:	4650      	mov	r0, sl
c0de9308:	f7fc ff95 	bl	c0de6236 <nbgl_layoutAddTouchableBar>
c0de930c:	1a3f      	subs	r7, r7, r0
c0de930e:	b2b8      	uxth	r0, r7
c0de9310:	280b      	cmp	r0, #11
c0de9312:	d302      	bcc.n	c0de931a <nbgl_pageDrawGenericContentExt+0x22a>
c0de9314:	4650      	mov	r0, sl
c0de9316:	f7fe fa4f 	bl	c0de77b8 <nbgl_layoutAddSeparationLine>
c0de931a:	3601      	adds	r6, #1
c0de931c:	e7dc      	b.n	c0de92d8 <nbgl_pageDrawGenericContentExt+0x1e8>
c0de931e:	f1b8 0f00 	cmp.w	r8, #0
c0de9322:	d101      	bne.n	c0de9328 <nbgl_pageDrawGenericContentExt+0x238>
c0de9324:	f000 f90f 	bl	c0de9546 <OUTLINED_FUNCTION_0>
c0de9328:	f105 0110 	add.w	r1, r5, #16
c0de932c:	4650      	mov	r0, sl
c0de932e:	f7fd fcdb 	bl	c0de6ce8 <nbgl_layoutAddCenteredInfo>
c0de9332:	e0e0      	b.n	c0de94f6 <nbgl_pageDrawGenericContentExt+0x406>
c0de9334:	f1b8 0f00 	cmp.w	r8, #0
c0de9338:	d101      	bne.n	c0de933e <nbgl_pageDrawGenericContentExt+0x24e>
c0de933a:	f000 f904 	bl	c0de9546 <OUTLINED_FUNCTION_0>
c0de933e:	f105 0110 	add.w	r1, r5, #16
c0de9342:	4650      	mov	r0, sl
c0de9344:	f7fd fefe 	bl	c0de7144 <nbgl_layoutAddContentCenter>
c0de9348:	6b68      	ldr	r0, [r5, #52]	@ 0x34
c0de934a:	2800      	cmp	r0, #0
c0de934c:	f000 80d3 	beq.w	c0de94f6 <nbgl_pageDrawGenericContentExt+0x406>
c0de9350:	900e      	str	r0, [sp, #56]	@ 0x38
c0de9352:	2003      	movs	r0, #3
c0de9354:	f88d 0034 	strb.w	r0, [sp, #52]	@ 0x34
c0de9358:	6ba8      	ldr	r0, [r5, #56]	@ 0x38
c0de935a:	900f      	str	r0, [sp, #60]	@ 0x3c
c0de935c:	8fa8      	ldrh	r0, [r5, #60]	@ 0x3c
c0de935e:	f8ad 0040 	strh.w	r0, [sp, #64]	@ 0x40
c0de9362:	a90d      	add	r1, sp, #52	@ 0x34
c0de9364:	4650      	mov	r0, sl
c0de9366:	f7fc f815 	bl	c0de5394 <nbgl_layoutAddUpFooter>
c0de936a:	e0c4      	b.n	c0de94f6 <nbgl_pageDrawGenericContentExt+0x406>
c0de936c:	ae0d      	add	r6, sp, #52	@ 0x34
c0de936e:	2124      	movs	r1, #36	@ 0x24
c0de9370:	4630      	mov	r0, r6
c0de9372:	f003 fecd 	bl	c0ded110 <__aeabi_memclr>
c0de9376:	e9d5 0104 	ldrd	r0, r1, [r5, #16]
c0de937a:	f000 f8f1 	bl	c0de9560 <OUTLINED_FUNCTION_2>
c0de937e:	69a9      	ldr	r1, [r5, #24]
c0de9380:	7f6b      	ldrb	r3, [r5, #29]
c0de9382:	7f2a      	ldrb	r2, [r5, #28]
c0de9384:	4650      	mov	r0, sl
c0de9386:	f7fe fb08 	bl	c0de799a <nbgl_layoutAddLongPressButton>
c0de938a:	e0b4      	b.n	c0de94f6 <nbgl_pageDrawGenericContentExt+0x406>
c0de938c:	ae0d      	add	r6, sp, #52	@ 0x34
c0de938e:	2124      	movs	r1, #36	@ 0x24
c0de9390:	4630      	mov	r0, r6
c0de9392:	f003 febd 	bl	c0ded110 <__aeabi_memclr>
c0de9396:	e9d5 0104 	ldrd	r0, r1, [r5, #16]
c0de939a:	2400      	movs	r4, #0
c0de939c:	f88d 4034 	strb.w	r4, [sp, #52]	@ 0x34
c0de93a0:	f000 f8de 	bl	c0de9560 <OUTLINED_FUNCTION_2>
c0de93a4:	f44f 7080 	mov.w	r0, #256	@ 0x100
c0de93a8:	940a      	str	r4, [sp, #40]	@ 0x28
c0de93aa:	f88d 402d 	strb.w	r4, [sp, #45]	@ 0x2d
c0de93ae:	f8ad 002e 	strh.w	r0, [sp, #46]	@ 0x2e
c0de93b2:	69a8      	ldr	r0, [r5, #24]
c0de93b4:	9009      	str	r0, [sp, #36]	@ 0x24
c0de93b6:	7f28      	ldrb	r0, [r5, #28]
c0de93b8:	f88d 002c 	strb.w	r0, [sp, #44]	@ 0x2c
c0de93bc:	7f68      	ldrb	r0, [r5, #29]
c0de93be:	f88d 0030 	strb.w	r0, [sp, #48]	@ 0x30
c0de93c2:	a909      	add	r1, sp, #36	@ 0x24
c0de93c4:	e04f      	b.n	c0de9466 <nbgl_pageDrawGenericContentExt+0x376>
c0de93c6:	f1b8 0f00 	cmp.w	r8, #0
c0de93ca:	d101      	bne.n	c0de93d0 <nbgl_pageDrawGenericContentExt+0x2e0>
c0de93cc:	f000 f8bb 	bl	c0de9546 <OUTLINED_FUNCTION_0>
c0de93d0:	f000 f8da 	bl	c0de9588 <OUTLINED_FUNCTION_5>
c0de93d4:	e08f      	b.n	c0de94f6 <nbgl_pageDrawGenericContentExt+0x406>
c0de93d6:	f1b8 0f00 	cmp.w	r8, #0
c0de93da:	d101      	bne.n	c0de93e0 <nbgl_pageDrawGenericContentExt+0x2f0>
c0de93dc:	f000 f8b3 	bl	c0de9546 <OUTLINED_FUNCTION_0>
c0de93e0:	7ea8      	ldrb	r0, [r5, #26]
c0de93e2:	f105 0110 	add.w	r1, r5, #16
c0de93e6:	3803      	subs	r0, #3
c0de93e8:	76a8      	strb	r0, [r5, #26]
c0de93ea:	4650      	mov	r0, sl
c0de93ec:	f7fe f850 	bl	c0de7490 <nbgl_layoutAddTagValueList>
c0de93f0:	2001      	movs	r0, #1
c0de93f2:	f88d 003d 	strb.w	r0, [sp, #61]	@ 0x3d
c0de93f6:	f8ad 003e 	strh.w	r0, [sp, #62]	@ 0x3e
c0de93fa:	e9d5 0109 	ldrd	r0, r1, [r5, #36]	@ 0x24
c0de93fe:	e9cd 100d 	strd	r1, r0, [sp, #52]	@ 0x34
c0de9402:	f000 f8ba 	bl	c0de957a <OUTLINED_FUNCTION_4>
c0de9406:	e02b      	b.n	c0de9460 <nbgl_pageDrawGenericContentExt+0x370>
c0de9408:	f1b8 0f00 	cmp.w	r8, #0
c0de940c:	d101      	bne.n	c0de9412 <nbgl_pageDrawGenericContentExt+0x322>
c0de940e:	f000 f89a 	bl	c0de9546 <OUTLINED_FUNCTION_0>
c0de9412:	f000 f8b9 	bl	c0de9588 <OUTLINED_FUNCTION_5>
c0de9416:	6aa8      	ldr	r0, [r5, #40]	@ 0x28
c0de9418:	2800      	cmp	r0, #0
c0de941a:	d073      	beq.n	c0de9504 <nbgl_pageDrawGenericContentExt+0x414>
c0de941c:	900d      	str	r0, [sp, #52]	@ 0x34
c0de941e:	6a68      	ldr	r0, [r5, #36]	@ 0x24
c0de9420:	2101      	movs	r1, #1
c0de9422:	f8ad 103e 	strh.w	r1, [sp, #62]	@ 0x3e
c0de9426:	f88d 103d 	strb.w	r1, [sp, #61]	@ 0x3d
c0de942a:	900e      	str	r0, [sp, #56]	@ 0x38
c0de942c:	f000 f8a5 	bl	c0de957a <OUTLINED_FUNCTION_4>
c0de9430:	f88d 0040 	strb.w	r0, [sp, #64]	@ 0x40
c0de9434:	a90d      	add	r1, sp, #52	@ 0x34
c0de9436:	4650      	mov	r0, sl
c0de9438:	f7fe f9d0 	bl	c0de77dc <nbgl_layoutAddButton>
c0de943c:	6b28      	ldr	r0, [r5, #48]	@ 0x30
c0de943e:	2800      	cmp	r0, #0
c0de9440:	d059      	beq.n	c0de94f6 <nbgl_pageDrawGenericContentExt+0x406>
c0de9442:	2100      	movs	r1, #0
c0de9444:	900d      	str	r0, [sp, #52]	@ 0x34
c0de9446:	f895 002d 	ldrb.w	r0, [r5, #45]	@ 0x2d
c0de944a:	f88d 103d 	strb.w	r1, [sp, #61]	@ 0x3d
c0de944e:	910e      	str	r1, [sp, #56]	@ 0x38
c0de9450:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de9454:	f8ad 103e 	strh.w	r1, [sp, #62]	@ 0x3e
c0de9458:	f895 1038 	ldrb.w	r1, [r5, #56]	@ 0x38
c0de945c:	f88d 103c 	strb.w	r1, [sp, #60]	@ 0x3c
c0de9460:	f88d 0040 	strb.w	r0, [sp, #64]	@ 0x40
c0de9464:	a90d      	add	r1, sp, #52	@ 0x34
c0de9466:	4650      	mov	r0, sl
c0de9468:	f7fe f9b8 	bl	c0de77dc <nbgl_layoutAddButton>
c0de946c:	e043      	b.n	c0de94f6 <nbgl_pageDrawGenericContentExt+0x406>
c0de946e:	2400      	movs	r4, #0
c0de9470:	2600      	movs	r6, #0
c0de9472:	7d28      	ldrb	r0, [r5, #20]
c0de9474:	4286      	cmp	r6, r0
c0de9476:	d23e      	bcs.n	c0de94f6 <nbgl_pageDrawGenericContentExt+0x406>
c0de9478:	6928      	ldr	r0, [r5, #16]
c0de947a:	1901      	adds	r1, r0, r4
c0de947c:	4650      	mov	r0, sl
c0de947e:	f7fd f8db 	bl	c0de6638 <nbgl_layoutAddSwitch>
c0de9482:	1a3f      	subs	r7, r7, r0
c0de9484:	b2b8      	uxth	r0, r7
c0de9486:	280b      	cmp	r0, #11
c0de9488:	d302      	bcc.n	c0de9490 <nbgl_pageDrawGenericContentExt+0x3a0>
c0de948a:	4650      	mov	r0, sl
c0de948c:	f7fe f994 	bl	c0de77b8 <nbgl_layoutAddSeparationLine>
c0de9490:	340c      	adds	r4, #12
c0de9492:	3601      	adds	r6, #1
c0de9494:	e7ed      	b.n	c0de9472 <nbgl_pageDrawGenericContentExt+0x382>
c0de9496:	2600      	movs	r6, #0
c0de9498:	2400      	movs	r4, #0
c0de949a:	7f28      	ldrb	r0, [r5, #28]
c0de949c:	4284      	cmp	r4, r0
c0de949e:	d22a      	bcs.n	c0de94f6 <nbgl_pageDrawGenericContentExt+0x406>
c0de94a0:	7fa8      	ldrb	r0, [r5, #30]
c0de94a2:	b180      	cbz	r0, c0de94c6 <nbgl_pageDrawGenericContentExt+0x3d6>
c0de94a4:	69a8      	ldr	r0, [r5, #24]
c0de94a6:	b170      	cbz	r0, c0de94c6 <nbgl_pageDrawGenericContentExt+0x3d6>
c0de94a8:	5980      	ldr	r0, [r0, r6]
c0de94aa:	b160      	cbz	r0, c0de94c6 <nbgl_pageDrawGenericContentExt+0x3d6>
c0de94ac:	e9d5 0104 	ldrd	r0, r1, [r5, #16]
c0de94b0:	7f6b      	ldrb	r3, [r5, #29]
c0de94b2:	f851 2024 	ldr.w	r2, [r1, r4, lsl #2]
c0de94b6:	f850 1024 	ldr.w	r1, [r0, r4, lsl #2]
c0de94ba:	b2e0      	uxtb	r0, r4
c0de94bc:	9000      	str	r0, [sp, #0]
c0de94be:	4650      	mov	r0, sl
c0de94c0:	f7fd fa24 	bl	c0de690c <nbgl_layoutAddTextWithAlias>
c0de94c4:	e008      	b.n	c0de94d8 <nbgl_pageDrawGenericContentExt+0x3e8>
c0de94c6:	e9d5 0104 	ldrd	r0, r1, [r5, #16]
c0de94ca:	f851 2024 	ldr.w	r2, [r1, r4, lsl #2]
c0de94ce:	f850 1024 	ldr.w	r1, [r0, r4, lsl #2]
c0de94d2:	4650      	mov	r0, sl
c0de94d4:	f7fd f8d2 	bl	c0de667c <nbgl_layoutAddText>
c0de94d8:	1a3f      	subs	r7, r7, r0
c0de94da:	b2b8      	uxth	r0, r7
c0de94dc:	280b      	cmp	r0, #11
c0de94de:	d302      	bcc.n	c0de94e6 <nbgl_pageDrawGenericContentExt+0x3f6>
c0de94e0:	4650      	mov	r0, sl
c0de94e2:	f7fe f969 	bl	c0de77b8 <nbgl_layoutAddSeparationLine>
c0de94e6:	3618      	adds	r6, #24
c0de94e8:	3401      	adds	r4, #1
c0de94ea:	e7d6      	b.n	c0de949a <nbgl_pageDrawGenericContentExt+0x3aa>
c0de94ec:	f105 0110 	add.w	r1, r5, #16
c0de94f0:	4650      	mov	r0, sl
c0de94f2:	f7fd fad3 	bl	c0de6a9c <nbgl_layoutAddRadioChoice>
c0de94f6:	4650      	mov	r0, sl
c0de94f8:	f7fe feea 	bl	c0de82d0 <nbgl_layoutDraw>
c0de94fc:	4650      	mov	r0, sl
c0de94fe:	b016      	add	sp, #88	@ 0x58
c0de9500:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de9504:	6a68      	ldr	r0, [r5, #36]	@ 0x24
c0de9506:	2800      	cmp	r0, #0
c0de9508:	d098      	beq.n	c0de943c <nbgl_pageDrawGenericContentExt+0x34c>
c0de950a:	6b29      	ldr	r1, [r5, #48]	@ 0x30
c0de950c:	2900      	cmp	r1, #0
c0de950e:	d095      	beq.n	c0de943c <nbgl_pageDrawGenericContentExt+0x34c>
c0de9510:	e9cd 010d 	strd	r0, r1, [sp, #52]	@ 0x34
c0de9514:	f895 002c 	ldrb.w	r0, [r5, #44]	@ 0x2c
c0de9518:	f895 102d 	ldrb.w	r1, [r5, #45]	@ 0x2d
c0de951c:	f895 2038 	ldrb.w	r2, [r5, #56]	@ 0x38
c0de9520:	f88d 003c 	strb.w	r0, [sp, #60]	@ 0x3c
c0de9524:	f88d 203d 	strb.w	r2, [sp, #61]	@ 0x3d
c0de9528:	f88d 103e 	strb.w	r1, [sp, #62]	@ 0x3e
c0de952c:	a90d      	add	r1, sp, #52	@ 0x34
c0de952e:	4650      	mov	r0, sl
c0de9530:	f7fd ff9a 	bl	c0de7468 <nbgl_layoutAddHorizontalButtons>
c0de9534:	e7df      	b.n	c0de94f6 <nbgl_pageDrawGenericContentExt+0x406>
c0de9536:	bf00      	nop
c0de9538:	00004977 	.word	0x00004977

c0de953c <nbgl_pageDrawGenericContent>:
c0de953c:	2300      	movs	r3, #0
c0de953e:	f7ff bdd7 	b.w	c0de90f0 <nbgl_pageDrawGenericContentExt>

c0de9542 <nbgl_pageRelease>:
c0de9542:	f7fe bef3 	b.w	c0de832c <nbgl_layoutRelease>

c0de9546 <OUTLINED_FUNCTION_0>:
c0de9546:	4650      	mov	r0, sl
c0de9548:	2128      	movs	r1, #40	@ 0x28
c0de954a:	f7ff bc9d 	b.w	c0de8e88 <addEmptyHeader>

c0de954e <OUTLINED_FUNCTION_1>:
c0de954e:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de9552:	788a      	ldrb	r2, [r1, #2]
c0de9554:	78c9      	ldrb	r1, [r1, #3]
c0de9556:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0de955a:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de955e:	4770      	bx	lr

c0de9560 <OUTLINED_FUNCTION_2>:
c0de9560:	910e      	str	r1, [sp, #56]	@ 0x38
c0de9562:	9011      	str	r0, [sp, #68]	@ 0x44
c0de9564:	4650      	mov	r0, sl
c0de9566:	4631      	mov	r1, r6
c0de9568:	f7fd bdec 	b.w	c0de7144 <nbgl_layoutAddContentCenter>

c0de956c <OUTLINED_FUNCTION_3>:
c0de956c:	7c73      	ldrb	r3, [r6, #17]
c0de956e:	f88d 003e 	strb.w	r0, [sp, #62]	@ 0x3e
c0de9572:	7830      	ldrb	r0, [r6, #0]
c0de9574:	f88d 1034 	strb.w	r1, [sp, #52]	@ 0x34
c0de9578:	4770      	bx	lr

c0de957a <OUTLINED_FUNCTION_4>:
c0de957a:	f895 002c 	ldrb.w	r0, [r5, #44]	@ 0x2c
c0de957e:	f88d 003c 	strb.w	r0, [sp, #60]	@ 0x3c
c0de9582:	f895 002d 	ldrb.w	r0, [r5, #45]	@ 0x2d
c0de9586:	4770      	bx	lr

c0de9588 <OUTLINED_FUNCTION_5>:
c0de9588:	f105 0110 	add.w	r1, r5, #16
c0de958c:	4650      	mov	r0, sl
c0de958e:	f7fd bf7f 	b.w	c0de7490 <nbgl_layoutAddTagValueList>

c0de9592 <getNbTagValuesInPage>:
c0de9592:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de9596:	4604      	mov	r4, r0
c0de9598:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0de959a:	f04f 0800 	mov.w	r8, #0
c0de959e:	2b00      	cmp	r3, #0
c0de95a0:	460e      	mov	r6, r1
c0de95a2:	f04f 0b00 	mov.w	fp, #0
c0de95a6:	f880 8000 	strb.w	r8, [r0]
c0de95aa:	f44f 70e8 	mov.w	r0, #464	@ 0x1d0
c0de95ae:	bf18      	it	ne
c0de95b0:	f44f 70cc 	movne.w	r0, #408	@ 0x198
c0de95b4:	0111      	lsls	r1, r2, #4
c0de95b6:	e9cd 2001 	strd	r2, r0, [sp, #4]
c0de95ba:	4544      	cmp	r4, r8
c0de95bc:	d052      	beq.n	c0de9664 <getNbTagValuesInPage+0xd2>
c0de95be:	465d      	mov	r5, fp
c0de95c0:	f10b 0a18 	add.w	sl, fp, #24
c0de95c4:	f1b8 0f00 	cmp.w	r8, #0
c0de95c8:	bf18      	it	ne
c0de95ca:	4655      	movne	r5, sl
c0de95cc:	6830      	ldr	r0, [r6, #0]
c0de95ce:	9103      	str	r1, [sp, #12]
c0de95d0:	b108      	cbz	r0, c0de95d6 <getNbTagValuesInPage+0x44>
c0de95d2:	4408      	add	r0, r1
c0de95d4:	e004      	b.n	c0de95e0 <getNbTagValuesInPage+0x4e>
c0de95d6:	9801      	ldr	r0, [sp, #4]
c0de95d8:	6871      	ldr	r1, [r6, #4]
c0de95da:	4440      	add	r0, r8
c0de95dc:	b2c0      	uxtb	r0, r0
c0de95de:	4788      	blx	r1
c0de95e0:	f003 fa8e 	bl	c0decb00 <pic>
c0de95e4:	4607      	mov	r7, r0
c0de95e6:	7b00      	ldrb	r0, [r0, #12]
c0de95e8:	07c1      	lsls	r1, r0, #31
c0de95ea:	bf18      	it	ne
c0de95ec:	f1b8 0f00 	cmpne.w	r8, #0
c0de95f0:	d13b      	bne.n	c0de966a <getNbTagValuesInPage+0xd8>
c0de95f2:	0780      	lsls	r0, r0, #30
c0de95f4:	d45d      	bmi.n	c0de96b2 <getNbTagValuesInPage+0x120>
c0de95f6:	7b73      	ldrb	r3, [r6, #13]
c0de95f8:	6839      	ldr	r1, [r7, #0]
c0de95fa:	200b      	movs	r0, #11
c0de95fc:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de9600:	46a2      	mov	sl, r4
c0de9602:	f003 f8b5 	bl	c0dec770 <nbgl_getTextHeightInWidth>
c0de9606:	182c      	adds	r4, r5, r0
c0de9608:	7b30      	ldrb	r0, [r6, #12]
c0de960a:	250b      	movs	r5, #11
c0de960c:	7b73      	ldrb	r3, [r6, #13]
c0de960e:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de9612:	2800      	cmp	r0, #0
c0de9614:	bf08      	it	eq
c0de9616:	250d      	moveq	r5, #13
c0de9618:	6879      	ldr	r1, [r7, #4]
c0de961a:	4628      	mov	r0, r5
c0de961c:	f003 f8a8 	bl	c0dec770 <nbgl_getTextHeightInWidth>
c0de9620:	4420      	add	r0, r4
c0de9622:	6879      	ldr	r1, [r7, #4]
c0de9624:	7b73      	ldrb	r3, [r6, #13]
c0de9626:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de962a:	f100 0b04 	add.w	fp, r0, #4
c0de962e:	4628      	mov	r0, r5
c0de9630:	fa1f f48b 	uxth.w	r4, fp
c0de9634:	f003 f8a1 	bl	c0dec77a <nbgl_getTextNbLinesInWidth>
c0de9638:	9902      	ldr	r1, [sp, #8]
c0de963a:	428c      	cmp	r4, r1
c0de963c:	bf38      	it	cc
c0de963e:	280a      	cmpcc	r0, #10
c0de9640:	d205      	bcs.n	c0de964e <getNbTagValuesInPage+0xbc>
c0de9642:	9903      	ldr	r1, [sp, #12]
c0de9644:	f108 0801 	add.w	r8, r8, #1
c0de9648:	4654      	mov	r4, sl
c0de964a:	3110      	adds	r1, #16
c0de964c:	e7b5      	b.n	c0de95ba <getNbTagValuesInPage+0x28>
c0de964e:	ea5f 6008 	movs.w	r0, r8, lsl #24
c0de9652:	d104      	bne.n	c0de965e <getNbTagValuesInPage+0xcc>
c0de9654:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0de9656:	f04f 0801 	mov.w	r8, #1
c0de965a:	f880 8000 	strb.w	r8, [r0]
c0de965e:	4654      	mov	r4, sl
c0de9660:	46da      	mov	sl, fp
c0de9662:	e003      	b.n	c0de966c <getNbTagValuesInPage+0xda>
c0de9664:	46da      	mov	sl, fp
c0de9666:	46a0      	mov	r8, r4
c0de9668:	e000      	b.n	c0de966c <getNbTagValuesInPage+0xda>
c0de966a:	46aa      	mov	sl, r5
c0de966c:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0de966e:	b170      	cbz	r0, c0de968e <getNbTagValuesInPage+0xfc>
c0de9670:	fa5f f088 	uxtb.w	r0, r8
c0de9674:	42a0      	cmp	r0, r4
c0de9676:	d10a      	bne.n	c0de968e <getNbTagValuesInPage+0xfc>
c0de9678:	9902      	ldr	r1, [sp, #8]
c0de967a:	fa1f f08a 	uxth.w	r0, sl
c0de967e:	f501 71bc 	add.w	r1, r1, #376	@ 0x178
c0de9682:	f401 71ac 	and.w	r1, r1, #344	@ 0x158
c0de9686:	4281      	cmp	r1, r0
c0de9688:	bf38      	it	cc
c0de968a:	3c01      	subcc	r4, #1
c0de968c:	e00d      	b.n	c0de96aa <getNbTagValuesInPage+0x118>
c0de968e:	980d      	ldr	r0, [sp, #52]	@ 0x34
c0de9690:	b150      	cbz	r0, c0de96a8 <getNbTagValuesInPage+0x116>
c0de9692:	9902      	ldr	r1, [sp, #8]
c0de9694:	fa1f f08a 	uxth.w	r0, sl
c0de9698:	f501 71e0 	add.w	r1, r1, #448	@ 0x1c0
c0de969c:	f401 71ec 	and.w	r1, r1, #472	@ 0x1d8
c0de96a0:	4281      	cmp	r1, r0
c0de96a2:	bf38      	it	cc
c0de96a4:	f1a8 0801 	subcc.w	r8, r8, #1
c0de96a8:	4644      	mov	r4, r8
c0de96aa:	b2e0      	uxtb	r0, r4
c0de96ac:	b004      	add	sp, #16
c0de96ae:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de96b2:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0de96b4:	f1b8 0f00 	cmp.w	r8, #0
c0de96b8:	d1d9      	bne.n	c0de966e <getNbTagValuesInPage+0xdc>
c0de96ba:	990e      	ldr	r1, [sp, #56]	@ 0x38
c0de96bc:	f04f 0801 	mov.w	r8, #1
c0de96c0:	46da      	mov	sl, fp
c0de96c2:	f881 8000 	strb.w	r8, [r1]
c0de96c6:	e7d2      	b.n	c0de966e <getNbTagValuesInPage+0xdc>

c0de96c8 <nbgl_useCaseGetNbInfosInPage>:
c0de96c8:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de96cc:	f44f 74fc 	mov.w	r4, #504	@ 0x1f8
c0de96d0:	9001      	str	r0, [sp, #4]
c0de96d2:	9300      	str	r3, [sp, #0]
c0de96d4:	2b00      	cmp	r3, #0
c0de96d6:	4616      	mov	r6, r2
c0de96d8:	460f      	mov	r7, r1
c0de96da:	bf18      	it	ne
c0de96dc:	f44f 74cc 	movne.w	r4, #408	@ 0x198
c0de96e0:	6808      	ldr	r0, [r1, #0]
c0de96e2:	f003 fa0d 	bl	c0decb00 <pic>
c0de96e6:	eb00 0b86 	add.w	fp, r0, r6, lsl #2
c0de96ea:	6878      	ldr	r0, [r7, #4]
c0de96ec:	f003 fa08 	bl	c0decb00 <pic>
c0de96f0:	eb00 0586 	add.w	r5, r0, r6, lsl #2
c0de96f4:	2700      	movs	r7, #0
c0de96f6:	f04f 0800 	mov.w	r8, #0
c0de96fa:	f04f 0a00 	mov.w	sl, #0
c0de96fe:	9801      	ldr	r0, [sp, #4]
c0de9700:	42b8      	cmp	r0, r7
c0de9702:	d01e      	beq.n	c0de9742 <nbgl_useCaseGetNbInfosInPage+0x7a>
c0de9704:	f85b 0027 	ldr.w	r0, [fp, r7, lsl #2]
c0de9708:	f003 f9fa 	bl	c0decb00 <pic>
c0de970c:	4601      	mov	r1, r0
c0de970e:	200c      	movs	r0, #12
c0de9710:	f002 fb2b 	bl	c0debd6a <OUTLINED_FUNCTION_2>
c0de9714:	4606      	mov	r6, r0
c0de9716:	f855 0027 	ldr.w	r0, [r5, r7, lsl #2]
c0de971a:	f003 f9f1 	bl	c0decb00 <pic>
c0de971e:	4601      	mov	r1, r0
c0de9720:	200b      	movs	r0, #11
c0de9722:	f002 fb22 	bl	c0debd6a <OUTLINED_FUNCTION_2>
c0de9726:	eb0a 0106 	add.w	r1, sl, r6
c0de972a:	4408      	add	r0, r1
c0de972c:	302a      	adds	r0, #42	@ 0x2a
c0de972e:	b280      	uxth	r0, r0
c0de9730:	f100 0a1a 	add.w	sl, r0, #26
c0de9734:	fa1f f08a 	uxth.w	r0, sl
c0de9738:	42a0      	cmp	r0, r4
c0de973a:	d204      	bcs.n	c0de9746 <nbgl_useCaseGetNbInfosInPage+0x7e>
c0de973c:	3701      	adds	r7, #1
c0de973e:	4680      	mov	r8, r0
c0de9740:	e7dd      	b.n	c0de96fe <nbgl_useCaseGetNbInfosInPage+0x36>
c0de9742:	9f01      	ldr	r7, [sp, #4]
c0de9744:	e006      	b.n	c0de9754 <nbgl_useCaseGetNbInfosInPage+0x8c>
c0de9746:	9800      	ldr	r0, [sp, #0]
c0de9748:	b920      	cbnz	r0, c0de9754 <nbgl_useCaseGetNbInfosInPage+0x8c>
c0de974a:	ea4f 00d8 	mov.w	r0, r8, lsr #3
c0de974e:	2832      	cmp	r0, #50	@ 0x32
c0de9750:	bf88      	it	hi
c0de9752:	3f01      	subhi	r7, #1
c0de9754:	b2f8      	uxtb	r0, r7
c0de9756:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}

c0de975a <nbgl_useCaseGetNbSwitchesInPage>:
c0de975a:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de975e:	f44f 77fc 	mov.w	r7, #504	@ 0x1f8
c0de9762:	2b00      	cmp	r3, #0
c0de9764:	4682      	mov	sl, r0
c0de9766:	4698      	mov	r8, r3
c0de9768:	4616      	mov	r6, r2
c0de976a:	bf18      	it	ne
c0de976c:	f44f 77cc 	movne.w	r7, #408	@ 0x198
c0de9770:	6808      	ldr	r0, [r1, #0]
c0de9772:	f003 f9c5 	bl	c0decb00 <pic>
c0de9776:	eb06 0146 	add.w	r1, r6, r6, lsl #1
c0de977a:	2600      	movs	r6, #0
c0de977c:	eb00 0081 	add.w	r0, r0, r1, lsl #2
c0de9780:	1d04      	adds	r4, r0, #4
c0de9782:	2000      	movs	r0, #0
c0de9784:	4605      	mov	r5, r0
c0de9786:	45b2      	cmp	sl, r6
c0de9788:	d010      	beq.n	c0de97ac <nbgl_useCaseGetNbSwitchesInPage+0x52>
c0de978a:	6821      	ldr	r1, [r4, #0]
c0de978c:	b129      	cbz	r1, c0de979a <nbgl_useCaseGetNbSwitchesInPage+0x40>
c0de978e:	200b      	movs	r0, #11
c0de9790:	f002 faeb 	bl	c0debd6a <OUTLINED_FUNCTION_2>
c0de9794:	4428      	add	r0, r5
c0de9796:	3068      	adds	r0, #104	@ 0x68
c0de9798:	e001      	b.n	c0de979e <nbgl_useCaseGetNbSwitchesInPage+0x44>
c0de979a:	f105 005c 	add.w	r0, r5, #92	@ 0x5c
c0de979e:	340c      	adds	r4, #12
c0de97a0:	3601      	adds	r6, #1
c0de97a2:	b281      	uxth	r1, r0
c0de97a4:	428f      	cmp	r7, r1
c0de97a6:	d8ed      	bhi.n	c0de9784 <nbgl_useCaseGetNbSwitchesInPage+0x2a>
c0de97a8:	f1a6 0a01 	sub.w	sl, r6, #1
c0de97ac:	b2a8      	uxth	r0, r5
c0de97ae:	2100      	movs	r1, #0
c0de97b0:	08c0      	lsrs	r0, r0, #3
c0de97b2:	2832      	cmp	r0, #50	@ 0x32
c0de97b4:	bf88      	it	hi
c0de97b6:	2101      	movhi	r1, #1
c0de97b8:	ea21 0008 	bic.w	r0, r1, r8
c0de97bc:	ebaa 0000 	sub.w	r0, sl, r0
c0de97c0:	b2c0      	uxtb	r0, r0
c0de97c2:	e8bd 85f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}

c0de97c6 <nbgl_useCaseGetNbBarsInPage>:
c0de97c6:	b570      	push	{r4, r5, r6, lr}
c0de97c8:	f44f 71fc 	mov.w	r1, #504	@ 0x1f8
c0de97cc:	2b00      	cmp	r3, #0
c0de97ce:	bf18      	it	ne
c0de97d0:	f44f 71cc 	movne.w	r1, #408	@ 0x198
c0de97d4:	2200      	movs	r2, #0
c0de97d6:	2400      	movs	r4, #0
c0de97d8:	2500      	movs	r5, #0
c0de97da:	b2ee      	uxtb	r6, r5
c0de97dc:	4286      	cmp	r6, r0
c0de97de:	d208      	bcs.n	c0de97f2 <nbgl_useCaseGetNbBarsInPage+0x2c>
c0de97e0:	b292      	uxth	r2, r2
c0de97e2:	325c      	adds	r2, #92	@ 0x5c
c0de97e4:	b296      	uxth	r6, r2
c0de97e6:	428e      	cmp	r6, r1
c0de97e8:	d202      	bcs.n	c0de97f0 <nbgl_useCaseGetNbBarsInPage+0x2a>
c0de97ea:	3501      	adds	r5, #1
c0de97ec:	4634      	mov	r4, r6
c0de97ee:	e7f4      	b.n	c0de97da <nbgl_useCaseGetNbBarsInPage+0x14>
c0de97f0:	4628      	mov	r0, r5
c0de97f2:	08e1      	lsrs	r1, r4, #3
c0de97f4:	2200      	movs	r2, #0
c0de97f6:	2932      	cmp	r1, #50	@ 0x32
c0de97f8:	bf88      	it	hi
c0de97fa:	2201      	movhi	r2, #1
c0de97fc:	ea22 0103 	bic.w	r1, r2, r3
c0de9800:	1a40      	subs	r0, r0, r1
c0de9802:	b2c0      	uxtb	r0, r0
c0de9804:	bd70      	pop	{r4, r5, r6, pc}

c0de9806 <nbgl_useCaseGetNbChoicesInPage>:
c0de9806:	b570      	push	{r4, r5, r6, lr}
c0de9808:	f44f 72fc 	mov.w	r2, #504	@ 0x1f8
c0de980c:	2b00      	cmp	r3, #0
c0de980e:	bf18      	it	ne
c0de9810:	f44f 72cc 	movne.w	r2, #408	@ 0x198
c0de9814:	2400      	movs	r4, #0
c0de9816:	2500      	movs	r5, #0
c0de9818:	2100      	movs	r1, #0
c0de981a:	b2ce      	uxtb	r6, r1
c0de981c:	4286      	cmp	r6, r0
c0de981e:	d207      	bcs.n	c0de9830 <nbgl_useCaseGetNbChoicesInPage+0x2a>
c0de9820:	b2a4      	uxth	r4, r4
c0de9822:	345c      	adds	r4, #92	@ 0x5c
c0de9824:	b2a6      	uxth	r6, r4
c0de9826:	4296      	cmp	r6, r2
c0de9828:	d204      	bcs.n	c0de9834 <nbgl_useCaseGetNbChoicesInPage+0x2e>
c0de982a:	3101      	adds	r1, #1
c0de982c:	4635      	mov	r5, r6
c0de982e:	e7f4      	b.n	c0de981a <nbgl_useCaseGetNbChoicesInPage+0x14>
c0de9830:	4601      	mov	r1, r0
c0de9832:	e004      	b.n	c0de983e <nbgl_useCaseGetNbChoicesInPage+0x38>
c0de9834:	b91b      	cbnz	r3, c0de983e <nbgl_useCaseGetNbChoicesInPage+0x38>
c0de9836:	08e8      	lsrs	r0, r5, #3
c0de9838:	2832      	cmp	r0, #50	@ 0x32
c0de983a:	bf88      	it	hi
c0de983c:	3901      	subhi	r1, #1
c0de983e:	b2c8      	uxtb	r0, r1
c0de9840:	bd70      	pop	{r4, r5, r6, pc}
	...

c0de9844 <useCaseHomeExt>:
c0de9844:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de9848:	b08f      	sub	sp, #60	@ 0x3c
c0de984a:	4604      	mov	r4, r0
c0de984c:	a802      	add	r0, sp, #8
c0de984e:	460f      	mov	r7, r1
c0de9850:	2130      	movs	r1, #48	@ 0x30
c0de9852:	461e      	mov	r6, r3
c0de9854:	4615      	mov	r5, r2
c0de9856:	3004      	adds	r0, #4
c0de9858:	f003 fc5a 	bl	c0ded110 <__aeabi_memclr>
c0de985c:	2009      	movs	r0, #9
c0de985e:	f88d 0039 	strb.w	r0, [sp, #57]	@ 0x39
c0de9862:	2006      	movs	r0, #6
c0de9864:	f88d 001e 	strb.w	r0, [sp, #30]
c0de9868:	2004      	movs	r0, #4
c0de986a:	f88d 001d 	strb.w	r0, [sp, #29]
c0de986e:	2003      	movs	r0, #3
c0de9870:	2e00      	cmp	r6, #0
c0de9872:	bf18      	it	ne
c0de9874:	2001      	movne	r0, #1
c0de9876:	f88d 001c 	strb.w	r0, [sp, #28]
c0de987a:	9705      	str	r7, [sp, #20]
c0de987c:	9402      	str	r4, [sp, #8]
c0de987e:	f000 f87b 	bl	c0de9978 <reset_callbacks_and_context>
c0de9882:	9816      	ldr	r0, [sp, #88]	@ 0x58
c0de9884:	e9d0 1200 	ldrd	r1, r2, [r0]
c0de9888:	b951      	cbnz	r1, c0de98a0 <useCaseHomeExt+0x5c>
c0de988a:	b94a      	cbnz	r2, c0de98a0 <useCaseHomeExt+0x5c>
c0de988c:	4831      	ldr	r0, [pc, #196]	@ (c0de9954 <useCaseHomeExt+0x110>)
c0de988e:	2100      	movs	r1, #0
c0de9890:	e9cd 110c 	strd	r1, r1, [sp, #48]	@ 0x30
c0de9894:	4448      	add	r0, r9
c0de9896:	6241      	str	r1, [r0, #36]	@ 0x24
c0de9898:	2002      	movs	r0, #2
c0de989a:	f88d 001f 	strb.w	r0, [sp, #31]
c0de989e:	e00e      	b.n	c0de98be <useCaseHomeExt+0x7a>
c0de98a0:	4b2c      	ldr	r3, [pc, #176]	@ (c0de9954 <useCaseHomeExt+0x110>)
c0de98a2:	6886      	ldr	r6, [r0, #8]
c0de98a4:	e9cd 120c 	strd	r1, r2, [sp, #48]	@ 0x30
c0de98a8:	444b      	add	r3, r9
c0de98aa:	625e      	str	r6, [r3, #36]	@ 0x24
c0de98ac:	2308      	movs	r3, #8
c0de98ae:	7b00      	ldrb	r0, [r0, #12]
c0de98b0:	f88d 301f 	strb.w	r3, [sp, #31]
c0de98b4:	2800      	cmp	r0, #0
c0de98b6:	bf18      	it	ne
c0de98b8:	2001      	movne	r0, #1
c0de98ba:	f88d 0038 	strb.w	r0, [sp, #56]	@ 0x38
c0de98be:	e9dd a817 	ldrd	sl, r8, [sp, #92]	@ 0x5c
c0de98c2:	bb8d      	cbnz	r5, c0de9928 <useCaseHomeExt+0xe4>
c0de98c4:	4620      	mov	r0, r4
c0de98c6:	f003 fc8f 	bl	c0ded1e8 <strlen>
c0de98ca:	4e24      	ldr	r6, [pc, #144]	@ (c0de995c <useCaseHomeExt+0x118>)
c0de98cc:	2814      	cmp	r0, #20
c0de98ce:	447e      	add	r6, pc
c0de98d0:	d307      	bcc.n	c0de98e2 <useCaseHomeExt+0x9e>
c0de98d2:	4821      	ldr	r0, [pc, #132]	@ (c0de9958 <useCaseHomeExt+0x114>)
c0de98d4:	4922      	ldr	r1, [pc, #136]	@ (c0de9960 <useCaseHomeExt+0x11c>)
c0de98d6:	2236      	movs	r2, #54	@ 0x36
c0de98d8:	4448      	add	r0, r9
c0de98da:	4479      	add	r1, pc
c0de98dc:	f003 fc0e 	bl	c0ded0fc <__aeabi_memcpy>
c0de98e0:	e00a      	b.n	c0de98f8 <useCaseHomeExt+0xb4>
c0de98e2:	e9cd 4600 	strd	r4, r6, [sp]
c0de98e6:	481c      	ldr	r0, [pc, #112]	@ (c0de9958 <useCaseHomeExt+0x114>)
c0de98e8:	214a      	movs	r1, #74	@ 0x4a
c0de98ea:	4a1e      	ldr	r2, [pc, #120]	@ (c0de9964 <useCaseHomeExt+0x120>)
c0de98ec:	4b1e      	ldr	r3, [pc, #120]	@ (c0de9968 <useCaseHomeExt+0x124>)
c0de98ee:	4448      	add	r0, r9
c0de98f0:	447a      	add	r2, pc
c0de98f2:	447b      	add	r3, pc
c0de98f4:	f002 ff72 	bl	c0dec7dc <snprintf>
c0de98f8:	4f17      	ldr	r7, [pc, #92]	@ (c0de9958 <useCaseHomeExt+0x114>)
c0de98fa:	200b      	movs	r0, #11
c0de98fc:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de9900:	2300      	movs	r3, #0
c0de9902:	eb09 0507 	add.w	r5, r9, r7
c0de9906:	4629      	mov	r1, r5
c0de9908:	f002 ff37 	bl	c0dec77a <nbgl_getTextNbLinesInWidth>
c0de990c:	2804      	cmp	r0, #4
c0de990e:	d30b      	bcc.n	c0de9928 <useCaseHomeExt+0xe4>
c0de9910:	e9cd 4600 	strd	r4, r6, [sp]
c0de9914:	eb09 0507 	add.w	r5, r9, r7
c0de9918:	214a      	movs	r1, #74	@ 0x4a
c0de991a:	4a14      	ldr	r2, [pc, #80]	@ (c0de996c <useCaseHomeExt+0x128>)
c0de991c:	4b14      	ldr	r3, [pc, #80]	@ (c0de9970 <useCaseHomeExt+0x12c>)
c0de991e:	4628      	mov	r0, r5
c0de9920:	447a      	add	r2, pc
c0de9922:	447b      	add	r3, pc
c0de9924:	f002 ff5a 	bl	c0dec7dc <snprintf>
c0de9928:	480a      	ldr	r0, [pc, #40]	@ (c0de9954 <useCaseHomeExt+0x110>)
c0de992a:	9503      	str	r5, [sp, #12]
c0de992c:	2100      	movs	r1, #0
c0de992e:	eb09 0400 	add.w	r4, r9, r0
c0de9932:	f8c4 a028 	str.w	sl, [r4, #40]	@ 0x28
c0de9936:	f8c4 8004 	str.w	r8, [r4, #4]
c0de993a:	480e      	ldr	r0, [pc, #56]	@ (c0de9974 <useCaseHomeExt+0x130>)
c0de993c:	aa02      	add	r2, sp, #8
c0de993e:	4478      	add	r0, pc
c0de9940:	f7ff faac 	bl	c0de8e9c <nbgl_pageDrawInfo>
c0de9944:	6160      	str	r0, [r4, #20]
c0de9946:	2002      	movs	r0, #2
c0de9948:	f002 fec2 	bl	c0dec6d0 <nbgl_refreshSpecial>
c0de994c:	b00f      	add	sp, #60	@ 0x3c
c0de994e:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}
c0de9952:	bf00      	nop
c0de9954:	00001bc8 	.word	0x00001bc8
c0de9958:	00001a48 	.word	0x00001a48
c0de995c:	000051b7 	.word	0x000051b7
c0de9960:	00006b8e 	.word	0x00006b8e
c0de9964:	00004cca 	.word	0x00004cca
c0de9968:	00005422 	.word	0x00005422
c0de996c:	00004d34 	.word	0x00004d34
c0de9970:	000053f2 	.word	0x000053f2
c0de9974:	000008fb 	.word	0x000008fb

c0de9978 <reset_callbacks_and_context>:
c0de9978:	b580      	push	{r7, lr}
c0de997a:	4808      	ldr	r0, [pc, #32]	@ (c0de999c <reset_callbacks_and_context+0x24>)
c0de997c:	2100      	movs	r1, #0
c0de997e:	4448      	add	r0, r9
c0de9980:	e9c0 1109 	strd	r1, r1, [r0, #36]	@ 0x24
c0de9984:	62c1      	str	r1, [r0, #44]	@ 0x2c
c0de9986:	e9c0 1101 	strd	r1, r1, [r0, #4]
c0de998a:	60c1      	str	r1, [r0, #12]
c0de998c:	6181      	str	r1, [r0, #24]
c0de998e:	4804      	ldr	r0, [pc, #16]	@ (c0de99a0 <reset_callbacks_and_context+0x28>)
c0de9990:	216c      	movs	r1, #108	@ 0x6c
c0de9992:	4448      	add	r0, r9
c0de9994:	f003 fbbc 	bl	c0ded110 <__aeabi_memclr>
c0de9998:	bd80      	pop	{r7, pc}
c0de999a:	bf00      	nop
c0de999c:	00001bc8 	.word	0x00001bc8
c0de99a0:	000018fc 	.word	0x000018fc

c0de99a4 <prepareNavInfo>:
c0de99a4:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de99a8:	4f1b      	ldr	r7, [pc, #108]	@ (c0de9a18 <prepareNavInfo+0x74>)
c0de99aa:	460c      	mov	r4, r1
c0de99ac:	4606      	mov	r6, r0
c0de99ae:	211c      	movs	r1, #28
c0de99b0:	4690      	mov	r8, r2
c0de99b2:	eb09 0507 	add.w	r5, r9, r7
c0de99b6:	f105 0060 	add.w	r0, r5, #96	@ 0x60
c0de99ba:	f003 fba9 	bl	c0ded110 <__aeabi_memclr>
c0de99be:	2009      	movs	r0, #9
c0de99c0:	f885 4061 	strb.w	r4, [r5, #97]	@ 0x61
c0de99c4:	f885 0065 	strb.w	r0, [r5, #101]	@ 0x65
c0de99c8:	2001      	movs	r0, #1
c0de99ca:	f885 0063 	strb.w	r0, [r5, #99]	@ 0x63
c0de99ce:	b1ce      	cbz	r6, c0de9a04 <prepareNavInfo+0x60>
c0de99d0:	eb09 0007 	add.w	r0, r9, r7
c0de99d4:	210c      	movs	r1, #12
c0de99d6:	f880 1062 	strb.w	r1, [r0, #98]	@ 0x62
c0de99da:	2103      	movs	r1, #3
c0de99dc:	f8c0 8074 	str.w	r8, [r0, #116]	@ 0x74
c0de99e0:	f880 1073 	strb.w	r1, [r0, #115]	@ 0x73
c0de99e4:	f819 1007 	ldrb.w	r1, [r9, r7]
c0de99e8:	3903      	subs	r1, #3
c0de99ea:	bf18      	it	ne
c0de99ec:	2101      	movne	r1, #1
c0de99ee:	2200      	movs	r2, #0
c0de99f0:	f880 1072 	strb.w	r1, [r0, #114]	@ 0x72
c0de99f4:	2c01      	cmp	r4, #1
c0de99f6:	bf88      	it	hi
c0de99f8:	2201      	movhi	r2, #1
c0de99fa:	4311      	orrs	r1, r2
c0de99fc:	f880 1071 	strb.w	r1, [r0, #113]	@ 0x71
c0de9a00:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de9a04:	eb09 0107 	add.w	r1, r9, r7
c0de9a08:	f881 0071 	strb.w	r0, [r1, #113]	@ 0x71
c0de9a0c:	2003      	movs	r0, #3
c0de9a0e:	f881 0073 	strb.w	r0, [r1, #115]	@ 0x73
c0de9a12:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de9a16:	bf00      	nop
c0de9a18:	00001bc8 	.word	0x00001bc8

c0de9a1c <displaySettingsPage>:
c0de9a1c:	b570      	push	{r4, r5, r6, lr}
c0de9a1e:	b090      	sub	sp, #64	@ 0x40
c0de9a20:	460c      	mov	r4, r1
c0de9a22:	4605      	mov	r5, r0
c0de9a24:	4668      	mov	r0, sp
c0de9a26:	2140      	movs	r1, #64	@ 0x40
c0de9a28:	f003 fb72 	bl	c0ded110 <__aeabi_memclr>
c0de9a2c:	4e12      	ldr	r6, [pc, #72]	@ (c0de9a78 <displaySettingsPage+0x5c>)
c0de9a2e:	eb09 0006 	add.w	r0, r9, r6
c0de9a32:	6882      	ldr	r2, [r0, #8]
c0de9a34:	b1f2      	cbz	r2, c0de9a74 <displaySettingsPage+0x58>
c0de9a36:	4669      	mov	r1, sp
c0de9a38:	4628      	mov	r0, r5
c0de9a3a:	4790      	blx	r2
c0de9a3c:	b1d0      	cbz	r0, c0de9a74 <displaySettingsPage+0x58>
c0de9a3e:	444e      	add	r6, r9
c0de9a40:	2009      	movs	r0, #9
c0de9a42:	466a      	mov	r2, sp
c0de9a44:	f88d 0006 	strb.w	r0, [sp, #6]
c0de9a48:	f240 2001 	movw	r0, #513	@ 0x201
c0de9a4c:	f806 5f60 	strb.w	r5, [r6, #96]!
c0de9a50:	f8ad 0004 	strh.w	r0, [sp, #4]
c0de9a54:	f856 0c50 	ldr.w	r0, [r6, #-80]
c0de9a58:	4631      	mov	r1, r6
c0de9a5a:	9000      	str	r0, [sp, #0]
c0de9a5c:	4807      	ldr	r0, [pc, #28]	@ (c0de9a7c <displaySettingsPage+0x60>)
c0de9a5e:	4478      	add	r0, pc
c0de9a60:	f7ff fd6c 	bl	c0de953c <nbgl_pageDrawGenericContent>
c0de9a64:	f846 0c4c 	str.w	r0, [r6, #-76]
c0de9a68:	2001      	movs	r0, #1
c0de9a6a:	2c00      	cmp	r4, #0
c0de9a6c:	bf18      	it	ne
c0de9a6e:	2002      	movne	r0, #2
c0de9a70:	f002 fe2e 	bl	c0dec6d0 <nbgl_refreshSpecial>
c0de9a74:	b010      	add	sp, #64	@ 0x40
c0de9a76:	bd70      	pop	{r4, r5, r6, pc}
c0de9a78:	00001bc8 	.word	0x00001bc8
c0de9a7c:	000007db 	.word	0x000007db

c0de9a80 <nbgl_useCaseGenericSettings>:
c0de9a80:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de9a84:	461d      	mov	r5, r3
c0de9a86:	4616      	mov	r6, r2
c0de9a88:	4688      	mov	r8, r1
c0de9a8a:	4607      	mov	r7, r0
c0de9a8c:	f7ff ff74 	bl	c0de9978 <reset_callbacks_and_context>
c0de9a90:	4c25      	ldr	r4, [pc, #148]	@ (c0de9b28 <nbgl_useCaseGenericSettings+0xa8>)
c0de9a92:	2002      	movs	r0, #2
c0de9a94:	f809 0004 	strb.w	r0, [r9, r4]
c0de9a98:	eb09 0004 	add.w	r0, r9, r4
c0de9a9c:	6107      	str	r7, [r0, #16]
c0de9a9e:	9906      	ldr	r1, [sp, #24]
c0de9aa0:	6041      	str	r1, [r0, #4]
c0de9aa2:	b12e      	cbz	r6, c0de9ab0 <nbgl_useCaseGenericSettings+0x30>
c0de9aa4:	4821      	ldr	r0, [pc, #132]	@ (c0de9b2c <nbgl_useCaseGenericSettings+0xac>)
c0de9aa6:	e896 000e 	ldmia.w	r6, {r1, r2, r3}
c0de9aaa:	4448      	add	r0, r9
c0de9aac:	3004      	adds	r0, #4
c0de9aae:	c00e      	stmia	r0!, {r1, r2, r3}
c0de9ab0:	b1a5      	cbz	r5, c0de9adc <nbgl_useCaseGenericSettings+0x5c>
c0de9ab2:	481e      	ldr	r0, [pc, #120]	@ (c0de9b2c <nbgl_useCaseGenericSettings+0xac>)
c0de9ab4:	2101      	movs	r1, #1
c0de9ab6:	4448      	add	r0, r9
c0de9ab8:	7501      	strb	r1, [r0, #20]
c0de9aba:	481d      	ldr	r0, [pc, #116]	@ (c0de9b30 <nbgl_useCaseGenericSettings+0xb0>)
c0de9abc:	2138      	movs	r1, #56	@ 0x38
c0de9abe:	eb09 0600 	add.w	r6, r9, r0
c0de9ac2:	f106 0038 	add.w	r0, r6, #56	@ 0x38
c0de9ac6:	f003 fb23 	bl	c0ded110 <__aeabi_memclr>
c0de9aca:	2008      	movs	r0, #8
c0de9acc:	4629      	mov	r1, r5
c0de9ace:	2230      	movs	r2, #48	@ 0x30
c0de9ad0:	f886 0038 	strb.w	r0, [r6, #56]	@ 0x38
c0de9ad4:	f106 003c 	add.w	r0, r6, #60	@ 0x3c
c0de9ad8:	f003 fb10 	bl	c0ded0fc <__aeabi_memcpy>
c0de9adc:	f002 f956 	bl	c0debd8c <OUTLINED_FUNCTION_5>
c0de9ae0:	4606      	mov	r6, r0
c0de9ae2:	b145      	cbz	r5, c0de9af6 <nbgl_useCaseGenericSettings+0x76>
c0de9ae4:	4812      	ldr	r0, [pc, #72]	@ (c0de9b30 <nbgl_useCaseGenericSettings+0xb0>)
c0de9ae6:	4631      	mov	r1, r6
c0de9ae8:	2201      	movs	r2, #1
c0de9aea:	2300      	movs	r3, #0
c0de9aec:	4448      	add	r0, r9
c0de9aee:	3038      	adds	r0, #56	@ 0x38
c0de9af0:	f000 f848 	bl	c0de9b84 <getNbPagesForContent>
c0de9af4:	4406      	add	r6, r0
c0de9af6:	444c      	add	r4, r9
c0de9af8:	211c      	movs	r1, #28
c0de9afa:	f104 0060 	add.w	r0, r4, #96	@ 0x60
c0de9afe:	f003 fb07 	bl	c0ded110 <__aeabi_memclr>
c0de9b02:	2009      	movs	r0, #9
c0de9b04:	f884 6061 	strb.w	r6, [r4, #97]	@ 0x61
c0de9b08:	2101      	movs	r1, #1
c0de9b0a:	f884 0065 	strb.w	r0, [r4, #101]	@ 0x65
c0de9b0e:	2003      	movs	r0, #3
c0de9b10:	f884 0073 	strb.w	r0, [r4, #115]	@ 0x73
c0de9b14:	2001      	movs	r0, #1
c0de9b16:	f884 0063 	strb.w	r0, [r4, #99]	@ 0x63
c0de9b1a:	f884 0071 	strb.w	r0, [r4, #113]	@ 0x71
c0de9b1e:	4640      	mov	r0, r8
c0de9b20:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de9b24:	f000 b8c0 	b.w	c0de9ca8 <displayGenericContextPage>
c0de9b28:	00001bc8 	.word	0x00001bc8
c0de9b2c:	000018fc 	.word	0x000018fc
c0de9b30:	00001968 	.word	0x00001968

c0de9b34 <getNbPagesForGenericContents>:
c0de9b34:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de9b38:	b08e      	sub	sp, #56	@ 0x38
c0de9b3a:	4f11      	ldr	r7, [pc, #68]	@ (c0de9b80 <getNbPagesForGenericContents+0x4c>)
c0de9b3c:	4604      	mov	r4, r0
c0de9b3e:	2600      	movs	r6, #0
c0de9b40:	46e8      	mov	r8, sp
c0de9b42:	2500      	movs	r5, #0
c0de9b44:	eb09 0007 	add.w	r0, r9, r7
c0de9b48:	7b00      	ldrb	r0, [r0, #12]
c0de9b4a:	4285      	cmp	r5, r0
c0de9b4c:	d214      	bcs.n	c0de9b78 <getNbPagesForGenericContents+0x44>
c0de9b4e:	b268      	sxtb	r0, r5
c0de9b50:	4641      	mov	r1, r8
c0de9b52:	f001 fabb 	bl	c0deb0cc <getContentAtIdx>
c0de9b56:	b170      	cbz	r0, c0de9b76 <getNbPagesForGenericContents+0x42>
c0de9b58:	eb09 0107 	add.w	r1, r9, r7
c0de9b5c:	4623      	mov	r3, r4
c0de9b5e:	7b09      	ldrb	r1, [r1, #12]
c0de9b60:	1a69      	subs	r1, r5, r1
c0de9b62:	3101      	adds	r1, #1
c0de9b64:	fab1 f181 	clz	r1, r1
c0de9b68:	094a      	lsrs	r2, r1, #5
c0de9b6a:	b2f1      	uxtb	r1, r6
c0de9b6c:	f000 f80a 	bl	c0de9b84 <getNbPagesForContent>
c0de9b70:	4406      	add	r6, r0
c0de9b72:	3501      	adds	r5, #1
c0de9b74:	e7e6      	b.n	c0de9b44 <getNbPagesForGenericContents+0x10>
c0de9b76:	2600      	movs	r6, #0
c0de9b78:	b2f0      	uxtb	r0, r6
c0de9b7a:	b00e      	add	sp, #56	@ 0x38
c0de9b7c:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de9b80:	000018fc 	.word	0x000018fc

c0de9b84 <getNbPagesForContent>:
c0de9b84:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9b88:	b08c      	sub	sp, #48	@ 0x30
c0de9b8a:	4606      	mov	r6, r0
c0de9b8c:	fab1 f081 	clz	r0, r1
c0de9b90:	9306      	str	r3, [sp, #24]
c0de9b92:	4614      	mov	r4, r2
c0de9b94:	9109      	str	r1, [sp, #36]	@ 0x24
c0de9b96:	0940      	lsrs	r0, r0, #5
c0de9b98:	4010      	ands	r0, r2
c0de9b9a:	900a      	str	r0, [sp, #40]	@ 0x28
c0de9b9c:	4630      	mov	r0, r6
c0de9b9e:	f001 fabf 	bl	c0deb120 <getContentNbElement>
c0de9ba2:	4605      	mov	r5, r0
c0de9ba4:	f084 0001 	eor.w	r0, r4, #1
c0de9ba8:	f04f 0800 	mov.w	r8, #0
c0de9bac:	f04f 0a00 	mov.w	sl, #0
c0de9bb0:	f04f 0b00 	mov.w	fp, #0
c0de9bb4:	270f      	movs	r7, #15
c0de9bb6:	9405      	str	r4, [sp, #20]
c0de9bb8:	9608      	str	r6, [sp, #32]
c0de9bba:	9004      	str	r0, [sp, #16]
c0de9bbc:	1d30      	adds	r0, r6, #4
c0de9bbe:	9007      	str	r0, [sp, #28]
c0de9bc0:	0628      	lsls	r0, r5, #24
c0de9bc2:	d068      	beq.n	c0de9c96 <getNbPagesForContent+0x112>
c0de9bc4:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de9bc6:	f88d 802f 	strb.w	r8, [sp, #47]	@ 0x2f
c0de9bca:	b128      	cbz	r0, c0de9bd8 <getNbPagesForContent+0x54>
c0de9bcc:	fa5f f38b 	uxtb.w	r3, fp
c0de9bd0:	2b00      	cmp	r3, #0
c0de9bd2:	bf18      	it	ne
c0de9bd4:	2301      	movne	r3, #1
c0de9bd6:	e000      	b.n	c0de9bda <getNbPagesForContent+0x56>
c0de9bd8:	2301      	movs	r3, #1
c0de9bda:	9808      	ldr	r0, [sp, #32]
c0de9bdc:	7800      	ldrb	r0, [r0, #0]
c0de9bde:	280a      	cmp	r0, #10
c0de9be0:	d00e      	beq.n	c0de9c00 <getNbPagesForContent+0x7c>
c0de9be2:	2806      	cmp	r0, #6
c0de9be4:	d011      	beq.n	c0de9c0a <getNbPagesForContent+0x86>
c0de9be6:	2807      	cmp	r0, #7
c0de9be8:	d01e      	beq.n	c0de9c28 <getNbPagesForContent+0xa4>
c0de9bea:	2808      	cmp	r0, #8
c0de9bec:	d023      	beq.n	c0de9c36 <getNbPagesForContent+0xb2>
c0de9bee:	2809      	cmp	r0, #9
c0de9bf0:	d028      	beq.n	c0de9c44 <getNbPagesForContent+0xc0>
c0de9bf2:	2804      	cmp	r0, #4
c0de9bf4:	d12b      	bne.n	c0de9c4e <getNbPagesForContent+0xca>
c0de9bf6:	2000      	movs	r0, #0
c0de9bf8:	f04f 0800 	mov.w	r8, #0
c0de9bfc:	9000      	str	r0, [sp, #0]
c0de9bfe:	e007      	b.n	c0de9c10 <getNbPagesForContent+0x8c>
c0de9c00:	b2e8      	uxtb	r0, r5
c0de9c02:	2200      	movs	r2, #0
c0de9c04:	f7ff fddf 	bl	c0de97c6 <nbgl_useCaseGetNbBarsInPage>
c0de9c08:	e028      	b.n	c0de9c5c <getNbPagesForContent+0xd8>
c0de9c0a:	9805      	ldr	r0, [sp, #20]
c0de9c0c:	9000      	str	r0, [sp, #0]
c0de9c0e:	9804      	ldr	r0, [sp, #16]
c0de9c10:	9001      	str	r0, [sp, #4]
c0de9c12:	f10d 002f 	add.w	r0, sp, #47	@ 0x2f
c0de9c16:	e9dd 3106 	ldrd	r3, r1, [sp, #24]
c0de9c1a:	fa5f f28b 	uxtb.w	r2, fp
c0de9c1e:	9002      	str	r0, [sp, #8]
c0de9c20:	b2e8      	uxtb	r0, r5
c0de9c22:	f7ff fcb6 	bl	c0de9592 <getNbTagValuesInPage>
c0de9c26:	e019      	b.n	c0de9c5c <getNbPagesForContent+0xd8>
c0de9c28:	9907      	ldr	r1, [sp, #28]
c0de9c2a:	b2e8      	uxtb	r0, r5
c0de9c2c:	fa5f f28b 	uxtb.w	r2, fp
c0de9c30:	f7ff fd93 	bl	c0de975a <nbgl_useCaseGetNbSwitchesInPage>
c0de9c34:	e012      	b.n	c0de9c5c <getNbPagesForContent+0xd8>
c0de9c36:	9907      	ldr	r1, [sp, #28]
c0de9c38:	b2e8      	uxtb	r0, r5
c0de9c3a:	fa5f f28b 	uxtb.w	r2, fp
c0de9c3e:	f7ff fd43 	bl	c0de96c8 <nbgl_useCaseGetNbInfosInPage>
c0de9c42:	e00b      	b.n	c0de9c5c <getNbPagesForContent+0xd8>
c0de9c44:	b2e8      	uxtb	r0, r5
c0de9c46:	2200      	movs	r2, #0
c0de9c48:	f7ff fddd 	bl	c0de9806 <nbgl_useCaseGetNbChoicesInPage>
c0de9c4c:	e006      	b.n	c0de9c5c <getNbPagesForContent+0xd8>
c0de9c4e:	4915      	ldr	r1, [pc, #84]	@ (c0de9ca4 <getNbPagesForContent+0x120>)
c0de9c50:	4479      	add	r1, pc
c0de9c52:	5c08      	ldrb	r0, [r1, r0]
c0de9c54:	b2e9      	uxtb	r1, r5
c0de9c56:	4288      	cmp	r0, r1
c0de9c58:	bf28      	it	cs
c0de9c5a:	4628      	movcs	r0, r5
c0de9c5c:	9909      	ldr	r1, [sp, #36]	@ 0x24
c0de9c5e:	f89d 402f 	ldrb.w	r4, [sp, #47]	@ 0x2f
c0de9c62:	f000 0307 	and.w	r3, r0, #7
c0de9c66:	2204      	movs	r2, #4
c0de9c68:	1a2d      	subs	r5, r5, r0
c0de9c6a:	4483      	add	fp, r0
c0de9c6c:	4451      	add	r1, sl
c0de9c6e:	ea43 03c4 	orr.w	r3, r3, r4, lsl #3
c0de9c72:	4c0b      	ldr	r4, [pc, #44]	@ (c0de9ca0 <getNbPagesForContent+0x11c>)
c0de9c74:	f10a 0a01 	add.w	sl, sl, #1
c0de9c78:	b2c9      	uxtb	r1, r1
c0de9c7a:	b2db      	uxtb	r3, r3
c0de9c7c:	ea02 0281 	and.w	r2, r2, r1, lsl #2
c0de9c80:	444c      	add	r4, r9
c0de9c82:	0849      	lsrs	r1, r1, #1
c0de9c84:	5c66      	ldrb	r6, [r4, r1]
c0de9c86:	4093      	lsls	r3, r2
c0de9c88:	fa07 f202 	lsl.w	r2, r7, r2
c0de9c8c:	ea26 0202 	bic.w	r2, r6, r2
c0de9c90:	431a      	orrs	r2, r3
c0de9c92:	5462      	strb	r2, [r4, r1]
c0de9c94:	e794      	b.n	c0de9bc0 <getNbPagesForContent+0x3c>
c0de9c96:	fa5f f08a 	uxtb.w	r0, sl
c0de9c9a:	b00c      	add	sp, #48	@ 0x30
c0de9c9c:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de9ca0:	00001ac8 	.word	0x00001ac8
c0de9ca4:	0000684e 	.word	0x0000684e

c0de9ca8 <displayGenericContextPage>:
c0de9ca8:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9cac:	b0a0      	sub	sp, #128	@ 0x80
c0de9cae:	f8df 23e0 	ldr.w	r2, [pc, #992]	@ c0dea090 <displayGenericContextPage+0x3e8>
c0de9cb2:	4683      	mov	fp, r0
c0de9cb4:	f819 0002 	ldrb.w	r0, [r9, r2]
c0de9cb8:	2803      	cmp	r0, #3
c0de9cba:	d10f      	bne.n	c0de9cdc <displayGenericContextPage+0x34>
c0de9cbc:	f8df 03d4 	ldr.w	r0, [pc, #980]	@ c0dea094 <displayGenericContextPage+0x3ec>
c0de9cc0:	f1bb 0fff 	cmp.w	fp, #255	@ 0xff
c0de9cc4:	4448      	add	r0, r9
c0de9cc6:	d05f      	beq.n	c0de9d88 <displayGenericContextPage+0xe0>
c0de9cc8:	f890 0030 	ldrb.w	r0, [r0, #48]	@ 0x30
c0de9ccc:	4558      	cmp	r0, fp
c0de9cce:	d80e      	bhi.n	c0de9cee <displayGenericContextPage+0x46>
c0de9cd0:	2001      	movs	r0, #1
c0de9cd2:	b020      	add	sp, #128	@ 0x80
c0de9cd4:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9cd8:	f001 b854 	b.w	c0dead84 <bundleNavReviewStreamingChoice>
c0de9cdc:	f1bb 0fff 	cmp.w	fp, #255	@ 0xff
c0de9ce0:	d105      	bne.n	c0de9cee <displayGenericContextPage+0x46>
c0de9ce2:	eb09 0002 	add.w	r0, r9, r2
c0de9ce6:	f890 0061 	ldrb.w	r0, [r0, #97]	@ 0x61
c0de9cea:	f1a0 0b01 	sub.w	fp, r0, #1
c0de9cee:	eb09 0002 	add.w	r0, r9, r2
c0de9cf2:	fa5f f78b 	uxtb.w	r7, fp
c0de9cf6:	9100      	str	r1, [sp, #0]
c0de9cf8:	f890 8060 	ldrb.w	r8, [r0, #96]	@ 0x60
c0de9cfc:	4547      	cmp	r7, r8
c0de9cfe:	d12e      	bne.n	c0de9d5e <displayGenericContextPage+0xb6>
c0de9d00:	a912      	add	r1, sp, #72	@ 0x48
c0de9d02:	f10d 0247 	add.w	r2, sp, #71	@ 0x47
c0de9d06:	f10d 0346 	add.w	r3, sp, #70	@ 0x46
c0de9d0a:	4638      	mov	r0, r7
c0de9d0c:	f001 fa20 	bl	c0deb150 <genericContextComputeNextPageParams>
c0de9d10:	4682      	mov	sl, r0
c0de9d12:	f1ba 0f00 	cmp.w	sl, #0
c0de9d16:	f000 8147 	beq.w	c0de9fa8 <displayGenericContextPage+0x300>
c0de9d1a:	f8df 8374 	ldr.w	r8, [pc, #884]	@ c0dea090 <displayGenericContextPage+0x3e8>
c0de9d1e:	f819 0008 	ldrb.w	r0, [r9, r8]
c0de9d22:	2803      	cmp	r0, #3
c0de9d24:	d041      	beq.n	c0de9daa <displayGenericContextPage+0x102>
c0de9d26:	48db      	ldr	r0, [pc, #876]	@ (c0dea094 <displayGenericContextPage+0x3ec>)
c0de9d28:	4448      	add	r0, r9
c0de9d2a:	f890 0020 	ldrb.w	r0, [r0, #32]
c0de9d2e:	06c0      	lsls	r0, r0, #27
c0de9d30:	d53b      	bpl.n	c0de9daa <displayGenericContextPage+0x102>
c0de9d32:	ea5f 600b 	movs.w	r0, fp, lsl #24
c0de9d36:	d034      	beq.n	c0de9da2 <displayGenericContextPage+0xfa>
c0de9d38:	eb09 0008 	add.w	r0, r9, r8
c0de9d3c:	f890 0061 	ldrb.w	r0, [r0, #97]	@ 0x61
c0de9d40:	3801      	subs	r0, #1
c0de9d42:	42b8      	cmp	r0, r7
c0de9d44:	dd2d      	ble.n	c0de9da2 <displayGenericContextPage+0xfa>
c0de9d46:	eb09 0008 	add.w	r0, r9, r8
c0de9d4a:	2105      	movs	r1, #5
c0de9d4c:	f880 106c 	strb.w	r1, [r0, #108]	@ 0x6c
c0de9d50:	49d2      	ldr	r1, [pc, #840]	@ (c0dea09c <displayGenericContextPage+0x3f4>)
c0de9d52:	4479      	add	r1, pc
c0de9d54:	6681      	str	r1, [r0, #104]	@ 0x68
c0de9d56:	2100      	movs	r1, #0
c0de9d58:	f880 1064 	strb.w	r1, [r0, #100]	@ 0x64
c0de9d5c:	e025      	b.n	c0de9daa <displayGenericContextPage+0x102>
c0de9d5e:	d91b      	bls.n	c0de9d98 <displayGenericContextPage+0xf0>
c0de9d60:	f04f 0a00 	mov.w	sl, #0
c0de9d64:	ac12      	add	r4, sp, #72	@ 0x48
c0de9d66:	f10d 0547 	add.w	r5, sp, #71	@ 0x47
c0de9d6a:	f10d 0646 	add.w	r6, sp, #70	@ 0x46
c0de9d6e:	4547      	cmp	r7, r8
c0de9d70:	d0cf      	beq.n	c0de9d12 <displayGenericContextPage+0x6a>
c0de9d72:	f108 0801 	add.w	r8, r8, #1
c0de9d76:	4621      	mov	r1, r4
c0de9d78:	462a      	mov	r2, r5
c0de9d7a:	4633      	mov	r3, r6
c0de9d7c:	fa5f f088 	uxtb.w	r0, r8
c0de9d80:	f001 f9e6 	bl	c0deb150 <genericContextComputeNextPageParams>
c0de9d84:	4682      	mov	sl, r0
c0de9d86:	e7f2      	b.n	c0de9d6e <displayGenericContextPage+0xc6>
c0de9d88:	6a80      	ldr	r0, [r0, #40]	@ 0x28
c0de9d8a:	2800      	cmp	r0, #0
c0de9d8c:	f000 810c 	beq.w	c0de9fa8 <displayGenericContextPage+0x300>
c0de9d90:	b020      	add	sp, #128	@ 0x80
c0de9d92:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9d96:	4700      	bx	r0
c0de9d98:	eba7 0008 	sub.w	r0, r7, r8
c0de9d9c:	2801      	cmp	r0, #1
c0de9d9e:	ddaf      	ble.n	c0de9d00 <displayGenericContextPage+0x58>
c0de9da0:	e102      	b.n	c0de9fa8 <displayGenericContextPage+0x300>
c0de9da2:	eb09 0008 	add.w	r0, r9, r8
c0de9da6:	2100      	movs	r1, #0
c0de9da8:	6681      	str	r1, [r0, #104]	@ 0x68
c0de9daa:	af01      	add	r7, sp, #4
c0de9dac:	213c      	movs	r1, #60	@ 0x3c
c0de9dae:	1d38      	adds	r0, r7, #4
c0de9db0:	f003 f9ae 	bl	c0ded110 <__aeabi_memclr>
c0de9db4:	2009      	movs	r0, #9
c0de9db6:	f8df b2e0 	ldr.w	fp, [pc, #736]	@ c0dea098 <displayGenericContextPage+0x3f0>
c0de9dba:	f89d 5047 	ldrb.w	r5, [sp, #71]	@ 0x47
c0de9dbe:	f88d 000a 	strb.w	r0, [sp, #10]
c0de9dc2:	2002      	movs	r0, #2
c0de9dc4:	f88d 0009 	strb.w	r0, [sp, #9]
c0de9dc8:	eb09 0008 	add.w	r0, r9, r8
c0de9dcc:	eb09 010b 	add.w	r1, r9, fp
c0de9dd0:	6900      	ldr	r0, [r0, #16]
c0de9dd2:	7c8e      	ldrb	r6, [r1, #18]
c0de9dd4:	9001      	str	r0, [sp, #4]
c0de9dd6:	f89a 0000 	ldrb.w	r0, [sl]
c0de9dda:	280a      	cmp	r0, #10
c0de9ddc:	f88d 0010 	strb.w	r0, [sp, #16]
c0de9de0:	d01e      	beq.n	c0de9e20 <displayGenericContextPage+0x178>
c0de9de2:	2801      	cmp	r0, #1
c0de9de4:	d02c      	beq.n	c0de9e40 <displayGenericContextPage+0x198>
c0de9de6:	2802      	cmp	r0, #2
c0de9de8:	d014      	beq.n	c0de9e14 <displayGenericContextPage+0x16c>
c0de9dea:	2803      	cmp	r0, #3
c0de9dec:	d012      	beq.n	c0de9e14 <displayGenericContextPage+0x16c>
c0de9dee:	2804      	cmp	r0, #4
c0de9df0:	d02e      	beq.n	c0de9e50 <displayGenericContextPage+0x1a8>
c0de9df2:	2806      	cmp	r0, #6
c0de9df4:	d042      	beq.n	c0de9e7c <displayGenericContextPage+0x1d4>
c0de9df6:	2807      	cmp	r0, #7
c0de9df8:	d04e      	beq.n	c0de9e98 <displayGenericContextPage+0x1f0>
c0de9dfa:	2808      	cmp	r0, #8
c0de9dfc:	d058      	beq.n	c0de9eb0 <displayGenericContextPage+0x208>
c0de9dfe:	2809      	cmp	r0, #9
c0de9e00:	d063      	beq.n	c0de9eca <displayGenericContextPage+0x222>
c0de9e02:	2800      	cmp	r0, #0
c0de9e04:	f040 80d0 	bne.w	c0de9fa8 <displayGenericContextPage+0x300>
c0de9e08:	f001 ffdd 	bl	c0debdc6 <OUTLINED_FUNCTION_14>
c0de9e0c:	e890 007c 	ldmia.w	r0, {r2, r3, r4, r5, r6}
c0de9e10:	c17c      	stmia	r1!, {r2, r3, r4, r5, r6}
c0de9e12:	e092      	b.n	c0de9f3a <displayGenericContextPage+0x292>
c0de9e14:	f001 ffd7 	bl	c0debdc6 <OUTLINED_FUNCTION_14>
c0de9e18:	e890 003c 	ldmia.w	r0, {r2, r3, r4, r5}
c0de9e1c:	c13c      	stmia	r1!, {r2, r3, r4, r5}
c0de9e1e:	e08c      	b.n	c0de9f3a <displayGenericContextPage+0x292>
c0de9e20:	f88d 501c 	strb.w	r5, [sp, #28]
c0de9e24:	f001 ff9b 	bl	c0debd5e <OUTLINED_FUNCTION_1>
c0de9e28:	9005      	str	r0, [sp, #20]
c0de9e2a:	f8da 0008 	ldr.w	r0, [sl, #8]
c0de9e2e:	4430      	add	r0, r6
c0de9e30:	f002 fe66 	bl	c0decb00 <pic>
c0de9e34:	9006      	str	r0, [sp, #24]
c0de9e36:	f89a 000d 	ldrb.w	r0, [sl, #13]
c0de9e3a:	f88d 001d 	strb.w	r0, [sp, #29]
c0de9e3e:	e07c      	b.n	c0de9f3a <displayGenericContextPage+0x292>
c0de9e40:	f107 0010 	add.w	r0, r7, #16
c0de9e44:	f10a 0104 	add.w	r1, sl, #4
c0de9e48:	2230      	movs	r2, #48	@ 0x30
c0de9e4a:	f003 f957 	bl	c0ded0fc <__aeabi_memcpy>
c0de9e4e:	e074      	b.n	c0de9f3a <displayGenericContextPage+0x292>
c0de9e50:	f8da 2004 	ldr.w	r2, [sl, #4]
c0de9e54:	eb09 010b 	add.w	r1, r9, fp
c0de9e58:	f89d 0046 	ldrb.w	r0, [sp, #70]	@ 0x46
c0de9e5c:	9f00      	ldr	r7, [sp, #0]
c0de9e5e:	624a      	str	r2, [r1, #36]	@ 0x24
c0de9e60:	2800      	cmp	r0, #0
c0de9e62:	f8da 2008 	ldr.w	r2, [sl, #8]
c0de9e66:	628a      	str	r2, [r1, #40]	@ 0x28
c0de9e68:	f000 80bf 	beq.w	c0de9fea <displayGenericContextPage+0x342>
c0de9e6c:	f8da 0004 	ldr.w	r0, [sl, #4]
c0de9e70:	2800      	cmp	r0, #0
c0de9e72:	f000 809c 	beq.w	c0de9fae <displayGenericContextPage+0x306>
c0de9e76:	eb00 1006 	add.w	r0, r0, r6, lsl #4
c0de9e7a:	e09c      	b.n	c0de9fb6 <displayGenericContextPage+0x30e>
c0de9e7c:	f89a 100c 	ldrb.w	r1, [sl, #12]
c0de9e80:	1970      	adds	r0, r6, r5
c0de9e82:	f10a 0404 	add.w	r4, sl, #4
c0de9e86:	4288      	cmp	r0, r1
c0de9e88:	d134      	bne.n	c0de9ef4 <displayGenericContextPage+0x24c>
c0de9e8a:	3710      	adds	r7, #16
c0de9e8c:	4621      	mov	r1, r4
c0de9e8e:	222c      	movs	r2, #44	@ 0x2c
c0de9e90:	4638      	mov	r0, r7
c0de9e92:	f003 f933 	bl	c0ded0fc <__aeabi_memcpy>
c0de9e96:	e031      	b.n	c0de9efc <displayGenericContextPage+0x254>
c0de9e98:	f88d 5018 	strb.w	r5, [sp, #24]
c0de9e9c:	eb06 0046 	add.w	r0, r6, r6, lsl #1
c0de9ea0:	f8da 1004 	ldr.w	r1, [sl, #4]
c0de9ea4:	eb01 0080 	add.w	r0, r1, r0, lsl #2
c0de9ea8:	f002 fe2a 	bl	c0decb00 <pic>
c0de9eac:	9005      	str	r0, [sp, #20]
c0de9eae:	e044      	b.n	c0de9f3a <displayGenericContextPage+0x292>
c0de9eb0:	f88d 5020 	strb.w	r5, [sp, #32]
c0de9eb4:	f001 ff53 	bl	c0debd5e <OUTLINED_FUNCTION_1>
c0de9eb8:	9005      	str	r0, [sp, #20]
c0de9eba:	f8da 0008 	ldr.w	r0, [sl, #8]
c0de9ebe:	eb00 0086 	add.w	r0, r0, r6, lsl #2
c0de9ec2:	f002 fe1d 	bl	c0decb00 <pic>
c0de9ec6:	9006      	str	r0, [sp, #24]
c0de9ec8:	e037      	b.n	c0de9f3a <displayGenericContextPage+0x292>
c0de9eca:	f001 ff7c 	bl	c0debdc6 <OUTLINED_FUNCTION_14>
c0de9ece:	e890 001c 	ldmia.w	r0, {r2, r3, r4}
c0de9ed2:	c11c      	stmia	r1!, {r2, r3, r4}
c0de9ed4:	f88d 5019 	strb.w	r5, [sp, #25]
c0de9ed8:	f001 ff41 	bl	c0debd5e <OUTLINED_FUNCTION_1>
c0de9edc:	9005      	str	r0, [sp, #20]
c0de9ede:	f89a 000a 	ldrb.w	r0, [sl, #10]
c0de9ee2:	42b0      	cmp	r0, r6
c0de9ee4:	d327      	bcc.n	c0de9f36 <displayGenericContextPage+0x28e>
c0de9ee6:	1971      	adds	r1, r6, r5
c0de9ee8:	4281      	cmp	r1, r0
c0de9eea:	d924      	bls.n	c0de9f36 <displayGenericContextPage+0x28e>
c0de9eec:	1b80      	subs	r0, r0, r6
c0de9eee:	f88d 001a 	strb.w	r0, [sp, #26]
c0de9ef2:	e022      	b.n	c0de9f3a <displayGenericContextPage+0x292>
c0de9ef4:	2004      	movs	r0, #4
c0de9ef6:	3710      	adds	r7, #16
c0de9ef8:	f88d 0010 	strb.w	r0, [sp, #16]
c0de9efc:	f88d 501c 	strb.w	r5, [sp, #28]
c0de9f00:	6820      	ldr	r0, [r4, #0]
c0de9f02:	eb00 1006 	add.w	r0, r0, r6, lsl #4
c0de9f06:	f002 fdfb 	bl	c0decb00 <pic>
c0de9f0a:	2110      	movs	r1, #16
c0de9f0c:	2200      	movs	r2, #0
c0de9f0e:	6038      	str	r0, [r7, #0]
c0de9f10:	eb01 1105 	add.w	r1, r1, r5, lsl #4
c0de9f14:	f102 0310 	add.w	r3, r2, #16
c0de9f18:	4299      	cmp	r1, r3
c0de9f1a:	d006      	beq.n	c0de9f2a <displayGenericContextPage+0x282>
c0de9f1c:	4402      	add	r2, r0
c0de9f1e:	7b12      	ldrb	r2, [r2, #12]
c0de9f20:	0752      	lsls	r2, r2, #29
c0de9f22:	461a      	mov	r2, r3
c0de9f24:	d5f6      	bpl.n	c0de9f14 <displayGenericContextPage+0x26c>
c0de9f26:	210d      	movs	r1, #13
c0de9f28:	72f9      	strb	r1, [r7, #11]
c0de9f2a:	9a06      	ldr	r2, [sp, #24]
c0de9f2c:	eb09 010b 	add.w	r1, r9, fp
c0de9f30:	e9c1 0209 	strd	r0, r2, [r1, #36]	@ 0x24
c0de9f34:	e001      	b.n	c0de9f3a <displayGenericContextPage+0x292>
c0de9f36:	f88d 501a 	strb.w	r5, [sp, #26]
c0de9f3a:	9f00      	ldr	r7, [sp, #0]
c0de9f3c:	f819 0008 	ldrb.w	r0, [r9, r8]
c0de9f40:	f000 01fe 	and.w	r1, r0, #254	@ 0xfe
c0de9f44:	4853      	ldr	r0, [pc, #332]	@ (c0dea094 <displayGenericContextPage+0x3ec>)
c0de9f46:	2902      	cmp	r1, #2
c0de9f48:	4448      	add	r0, r9
c0de9f4a:	6a00      	ldr	r0, [r0, #32]
c0de9f4c:	bf18      	it	ne
c0de9f4e:	2000      	movne	r0, #0
c0de9f50:	f89a 1000 	ldrb.w	r1, [sl]
c0de9f54:	2902      	cmp	r1, #2
c0de9f56:	d817      	bhi.n	c0de9f88 <displayGenericContextPage+0x2e0>
c0de9f58:	f010 0fe0 	tst.w	r0, #224	@ 0xe0
c0de9f5c:	d014      	beq.n	c0de9f88 <displayGenericContextPage+0x2e0>
c0de9f5e:	0601      	lsls	r1, r0, #24
c0de9f60:	d508      	bpl.n	c0de9f74 <displayGenericContextPage+0x2cc>
c0de9f62:	eb09 010b 	add.w	r1, r9, fp
c0de9f66:	6d89      	ldr	r1, [r1, #88]	@ 0x58
c0de9f68:	7809      	ldrb	r1, [r1, #0]
c0de9f6a:	06c9      	lsls	r1, r1, #27
c0de9f6c:	d402      	bmi.n	c0de9f74 <displayGenericContextPage+0x2cc>
c0de9f6e:	494d      	ldr	r1, [pc, #308]	@ (c0dea0a4 <displayGenericContextPage+0x3fc>)
c0de9f70:	4479      	add	r1, pc
c0de9f72:	e001      	b.n	c0de9f78 <displayGenericContextPage+0x2d0>
c0de9f74:	494c      	ldr	r1, [pc, #304]	@ (c0dea0a8 <displayGenericContextPage+0x400>)
c0de9f76:	4479      	add	r1, pc
c0de9f78:	0680      	lsls	r0, r0, #26
c0de9f7a:	9103      	str	r1, [sp, #12]
c0de9f7c:	f04f 0010 	mov.w	r0, #16
c0de9f80:	bf58      	it	pl
c0de9f82:	2011      	movpl	r0, #17
c0de9f84:	f88d 000b 	strb.w	r0, [sp, #11]
c0de9f88:	4848      	ldr	r0, [pc, #288]	@ (c0dea0ac <displayGenericContextPage+0x404>)
c0de9f8a:	eb09 0408 	add.w	r4, r9, r8
c0de9f8e:	aa01      	add	r2, sp, #4
c0de9f90:	f104 0160 	add.w	r1, r4, #96	@ 0x60
c0de9f94:	4478      	add	r0, pc
c0de9f96:	f7ff fad1 	bl	c0de953c <nbgl_pageDrawGenericContent>
c0de9f9a:	6160      	str	r0, [r4, #20]
c0de9f9c:	2001      	movs	r0, #1
c0de9f9e:	2f00      	cmp	r7, #0
c0de9fa0:	bf18      	it	ne
c0de9fa2:	2002      	movne	r0, #2
c0de9fa4:	f002 fb94 	bl	c0dec6d0 <nbgl_refreshSpecial>
c0de9fa8:	b020      	add	sp, #128	@ 0x80
c0de9faa:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de9fae:	f8da 1008 	ldr.w	r1, [sl, #8]
c0de9fb2:	4630      	mov	r0, r6
c0de9fb4:	4788      	blx	r1
c0de9fb6:	f002 fda3 	bl	c0decb00 <pic>
c0de9fba:	7b01      	ldrb	r1, [r0, #12]
c0de9fbc:	0789      	lsls	r1, r1, #30
c0de9fbe:	d42e      	bmi.n	c0dea01e <displayGenericContextPage+0x376>
c0de9fc0:	4937      	ldr	r1, [pc, #220]	@ (c0dea0a0 <displayGenericContextPage+0x3f8>)
c0de9fc2:	4479      	add	r1, pc
c0de9fc4:	910b      	str	r1, [sp, #44]	@ 0x2c
c0de9fc6:	210a      	movs	r1, #10
c0de9fc8:	f88d 1030 	strb.w	r1, [sp, #48]	@ 0x30
c0de9fcc:	2100      	movs	r1, #0
c0de9fce:	910a      	str	r1, [sp, #40]	@ 0x28
c0de9fd0:	eb09 010b 	add.w	r1, r9, fp
c0de9fd4:	e9d0 2000 	ldrd	r2, r0, [r0]
c0de9fd8:	e9c1 2006 	strd	r2, r0, [r1, #24]
c0de9fdc:	f89a 0011 	ldrb.w	r0, [sl, #17]
c0de9fe0:	f881 0020 	strb.w	r0, [r1, #32]
c0de9fe4:	2005      	movs	r0, #5
c0de9fe6:	f88d 0010 	strb.w	r0, [sp, #16]
c0de9fea:	f88d 501c 	strb.w	r5, [sp, #28]
c0de9fee:	f89a 000f 	ldrb.w	r0, [sl, #15]
c0de9ff2:	f88d 001f 	strb.w	r0, [sp, #31]
c0de9ff6:	f8da 0004 	ldr.w	r0, [sl, #4]
c0de9ffa:	b328      	cbz	r0, c0dea048 <displayGenericContextPage+0x3a0>
c0de9ffc:	eb00 1006 	add.w	r0, r0, r6, lsl #4
c0dea000:	f002 fd7e 	bl	c0decb00 <pic>
c0dea004:	9005      	str	r0, [sp, #20]
c0dea006:	f100 010c 	add.w	r1, r0, #12
c0dea00a:	1c68      	adds	r0, r5, #1
c0dea00c:	3801      	subs	r0, #1
c0dea00e:	d033      	beq.n	c0dea078 <displayGenericContextPage+0x3d0>
c0dea010:	f101 0210 	add.w	r2, r1, #16
c0dea014:	7809      	ldrb	r1, [r1, #0]
c0dea016:	0749      	lsls	r1, r1, #29
c0dea018:	4611      	mov	r1, r2
c0dea01a:	d5f7      	bpl.n	c0dea00c <displayGenericContextPage+0x364>
c0dea01c:	e029      	b.n	c0dea072 <displayGenericContextPage+0x3ca>
c0dea01e:	2101      	movs	r1, #1
c0dea020:	f88d 1010 	strb.w	r1, [sp, #16]
c0dea024:	6881      	ldr	r1, [r0, #8]
c0dea026:	4a22      	ldr	r2, [pc, #136]	@ (c0dea0b0 <displayGenericContextPage+0x408>)
c0dea028:	447a      	add	r2, pc
c0dea02a:	920c      	str	r2, [sp, #48]	@ 0x30
c0dea02c:	e9d0 2000 	ldrd	r2, r0, [r0]
c0dea030:	9106      	str	r1, [sp, #24]
c0dea032:	900b      	str	r0, [sp, #44]	@ 0x2c
c0dea034:	2000      	movs	r0, #0
c0dea036:	9209      	str	r2, [sp, #36]	@ 0x24
c0dea038:	f88d 0036 	strb.w	r0, [sp, #54]	@ 0x36
c0dea03c:	f8ad 0034 	strh.w	r0, [sp, #52]	@ 0x34
c0dea040:	900a      	str	r0, [sp, #40]	@ 0x28
c0dea042:	f88d 0014 	strb.w	r0, [sp, #20]
c0dea046:	e779      	b.n	c0de9f3c <displayGenericContextPage+0x294>
c0dea048:	2400      	movs	r4, #0
c0dea04a:	9405      	str	r4, [sp, #20]
c0dea04c:	f8da 0008 	ldr.w	r0, [sl, #8]
c0dea050:	f88d 601d 	strb.w	r6, [sp, #29]
c0dea054:	9006      	str	r0, [sp, #24]
c0dea056:	b2e0      	uxtb	r0, r4
c0dea058:	42a8      	cmp	r0, r5
c0dea05a:	d20d      	bcs.n	c0dea078 <displayGenericContextPage+0x3d0>
c0dea05c:	19a0      	adds	r0, r4, r6
c0dea05e:	f8da 1008 	ldr.w	r1, [sl, #8]
c0dea062:	b2c0      	uxtb	r0, r0
c0dea064:	4788      	blx	r1
c0dea066:	f002 fd4b 	bl	c0decb00 <pic>
c0dea06a:	7b00      	ldrb	r0, [r0, #12]
c0dea06c:	3401      	adds	r4, #1
c0dea06e:	0740      	lsls	r0, r0, #29
c0dea070:	d5f1      	bpl.n	c0dea056 <displayGenericContextPage+0x3ae>
c0dea072:	200d      	movs	r0, #13
c0dea074:	f88d 001f 	strb.w	r0, [sp, #31]
c0dea078:	2009      	movs	r0, #9
c0dea07a:	f88d 001e 	strb.w	r0, [sp, #30]
c0dea07e:	2000      	movs	r0, #0
c0dea080:	f88d 0020 	strb.w	r0, [sp, #32]
c0dea084:	f89a 0011 	ldrb.w	r0, [sl, #17]
c0dea088:	f88d 0021 	strb.w	r0, [sp, #33]	@ 0x21
c0dea08c:	e756      	b.n	c0de9f3c <displayGenericContextPage+0x294>
c0dea08e:	bf00      	nop
c0dea090:	00001bc8 	.word	0x00001bc8
c0dea094:	00001c44 	.word	0x00001c44
c0dea098:	000018fc 	.word	0x000018fc
c0dea09c:	00004f15 	.word	0x00004f15
c0dea0a0:	00004852 	.word	0x00004852
c0dea0a4:	0000415e 	.word	0x0000415e
c0dea0a8:	000044a1 	.word	0x000044a1
c0dea0ac:	000002a5 	.word	0x000002a5
c0dea0b0:	00004cdc 	.word	0x00004cdc

c0dea0b4 <nbgl_useCaseHomeAndSettings>:
c0dea0b4:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0dea0b8:	f8df 8060 	ldr.w	r8, [pc, #96]	@ c0dea11c <nbgl_useCaseHomeAndSettings+0x68>
c0dea0bc:	469a      	mov	sl, r3
c0dea0be:	4615      	mov	r5, r2
c0dea0c0:	460e      	mov	r6, r1
c0dea0c2:	4607      	mov	r7, r0
c0dea0c4:	eb09 0408 	add.w	r4, r9, r8
c0dea0c8:	f7ff fc56 	bl	c0de9978 <reset_callbacks_and_context>
c0dea0cc:	9809      	ldr	r0, [sp, #36]	@ 0x24
c0dea0ce:	6320      	str	r0, [r4, #48]	@ 0x30
c0dea0d0:	9808      	ldr	r0, [sp, #32]
c0dea0d2:	e9c4 7608 	strd	r7, r6, [r4, #32]
c0dea0d6:	e9c4 500a 	strd	r5, r0, [r4, #40]	@ 0x28
c0dea0da:	e9dd 100a 	ldrd	r1, r0, [sp, #40]	@ 0x28
c0dea0de:	b131      	cbz	r1, c0dea0ee <nbgl_useCaseHomeAndSettings+0x3a>
c0dea0e0:	eb09 0208 	add.w	r2, r9, r8
c0dea0e4:	e891 0078 	ldmia.w	r1, {r3, r4, r5, r6}
c0dea0e8:	3234      	adds	r2, #52	@ 0x34
c0dea0ea:	c278      	stmia	r2!, {r3, r4, r5, r6}
c0dea0ec:	e006      	b.n	c0dea0fc <nbgl_useCaseHomeAndSettings+0x48>
c0dea0ee:	eb09 0108 	add.w	r1, r9, r8
c0dea0f2:	2200      	movs	r2, #0
c0dea0f4:	e9c1 220d 	strd	r2, r2, [r1, #52]	@ 0x34
c0dea0f8:	e9c1 220f 	strd	r2, r2, [r1, #60]	@ 0x3c
c0dea0fc:	eb09 0108 	add.w	r1, r9, r8
c0dea100:	f1ba 0fff 	cmp.w	sl, #255	@ 0xff
c0dea104:	6448      	str	r0, [r1, #68]	@ 0x44
c0dea106:	d004      	beq.n	c0dea112 <nbgl_useCaseHomeAndSettings+0x5e>
c0dea108:	4650      	mov	r0, sl
c0dea10a:	e8bd 45f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0dea10e:	f000 b807 	b.w	c0dea120 <bundleNavStartSettingsAtPage>
c0dea112:	e8bd 45f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0dea116:	f000 b815 	b.w	c0dea144 <bundleNavStartHome>
c0dea11a:	bf00      	nop
c0dea11c:	00001c44 	.word	0x00001c44

c0dea120 <bundleNavStartSettingsAtPage>:
c0dea120:	b51c      	push	{r2, r3, r4, lr}
c0dea122:	4601      	mov	r1, r0
c0dea124:	4805      	ldr	r0, [pc, #20]	@ (c0dea13c <bundleNavStartSettingsAtPage+0x1c>)
c0dea126:	eb09 0300 	add.w	r3, r9, r0
c0dea12a:	6a18      	ldr	r0, [r3, #32]
c0dea12c:	e9d3 230b 	ldrd	r2, r3, [r3, #44]	@ 0x2c
c0dea130:	4c03      	ldr	r4, [pc, #12]	@ (c0dea140 <bundleNavStartSettingsAtPage+0x20>)
c0dea132:	447c      	add	r4, pc
c0dea134:	9400      	str	r4, [sp, #0]
c0dea136:	f7ff fca3 	bl	c0de9a80 <nbgl_useCaseGenericSettings>
c0dea13a:	bd1c      	pop	{r2, r3, r4, pc}
c0dea13c:	00001c44 	.word	0x00001c44
c0dea140:	0000000f 	.word	0x0000000f

c0dea144 <bundleNavStartHome>:
c0dea144:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
c0dea146:	4809      	ldr	r0, [pc, #36]	@ (c0dea16c <bundleNavStartHome+0x28>)
c0dea148:	eb09 0400 	add.w	r4, r9, r0
c0dea14c:	f104 0320 	add.w	r3, r4, #32
c0dea150:	6c65      	ldr	r5, [r4, #68]	@ 0x44
c0dea152:	3434      	adds	r4, #52	@ 0x34
c0dea154:	cb0f      	ldmia	r3, {r0, r1, r2, r3}
c0dea156:	4e06      	ldr	r6, [pc, #24]	@ (c0dea170 <bundleNavStartHome+0x2c>)
c0dea158:	2b00      	cmp	r3, #0
c0dea15a:	9502      	str	r5, [sp, #8]
c0dea15c:	447e      	add	r6, pc
c0dea15e:	e9cd 4600 	strd	r4, r6, [sp]
c0dea162:	bf18      	it	ne
c0dea164:	2301      	movne	r3, #1
c0dea166:	f7ff fb6d 	bl	c0de9844 <useCaseHomeExt>
c0dea16a:	bd7f      	pop	{r0, r1, r2, r3, r4, r5, r6, pc}
c0dea16c:	00001c44 	.word	0x00001c44
c0dea170:	0000113d 	.word	0x0000113d

c0dea174 <nbgl_useCaseStatus>:
c0dea174:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0dea178:	b090      	sub	sp, #64	@ 0x40
c0dea17a:	4604      	mov	r4, r0
c0dea17c:	4822      	ldr	r0, [pc, #136]	@ (c0dea208 <nbgl_useCaseStatus+0x94>)
c0dea17e:	460e      	mov	r6, r1
c0dea180:	4615      	mov	r5, r2
c0dea182:	a90d      	add	r1, sp, #52	@ 0x34
c0dea184:	f8df 807c 	ldr.w	r8, [pc, #124]	@ c0dea204 <nbgl_useCaseStatus+0x90>
c0dea188:	4478      	add	r0, pc
c0dea18a:	e890 008c 	ldmia.w	r0, {r2, r3, r7}
c0dea18e:	c18c      	stmia	r1!, {r2, r3, r7}
c0dea190:	eb09 0708 	add.w	r7, r9, r8
c0dea194:	f7ff fbf0 	bl	c0de9978 <reset_callbacks_and_context>
c0dea198:	607d      	str	r5, [r7, #4]
c0dea19a:	b156      	cbz	r6, c0dea1b2 <nbgl_useCaseStatus+0x3e>
c0dea19c:	2003      	movs	r0, #3
c0dea19e:	f7fa fc96 	bl	c0de4ace <os_io_seph_cmd_piezo_play_tune>
c0dea1a2:	481a      	ldr	r0, [pc, #104]	@ (c0dea20c <nbgl_useCaseStatus+0x98>)
c0dea1a4:	a90d      	add	r1, sp, #52	@ 0x34
c0dea1a6:	4622      	mov	r2, r4
c0dea1a8:	2302      	movs	r3, #2
c0dea1aa:	4478      	add	r0, pc
c0dea1ac:	f7fe fe22 	bl	c0de8df4 <nbgl_pageDrawLedgerInfo>
c0dea1b0:	e020      	b.n	c0dea1f4 <nbgl_useCaseStatus+0x80>
c0dea1b2:	2000      	movs	r0, #0
c0dea1b4:	f44f 1140 	mov.w	r1, #3145728	@ 0x300000
c0dea1b8:	466a      	mov	r2, sp
c0dea1ba:	9005      	str	r0, [sp, #20]
c0dea1bc:	9104      	str	r1, [sp, #16]
c0dea1be:	4914      	ldr	r1, [pc, #80]	@ (c0dea210 <nbgl_useCaseStatus+0x9c>)
c0dea1c0:	e9cd 4000 	strd	r4, r0, [sp]
c0dea1c4:	9006      	str	r0, [sp, #24]
c0dea1c6:	f88d 001c 	strb.w	r0, [sp, #28]
c0dea1ca:	e9cd 000a 	strd	r0, r0, [sp, #40]	@ 0x28
c0dea1ce:	4479      	add	r1, pc
c0dea1d0:	e9cd 0102 	strd	r0, r1, [sp, #8]
c0dea1d4:	f44f 6110 	mov.w	r1, #2304	@ 0x900
c0dea1d8:	f44f 7000 	mov.w	r0, #512	@ 0x200
c0dea1dc:	f8ad 1030 	strh.w	r1, [sp, #48]	@ 0x30
c0dea1e0:	f8ad 0024 	strh.w	r0, [sp, #36]	@ 0x24
c0dea1e4:	480b      	ldr	r0, [pc, #44]	@ (c0dea214 <nbgl_useCaseStatus+0xa0>)
c0dea1e6:	4478      	add	r0, pc
c0dea1e8:	9008      	str	r0, [sp, #32]
c0dea1ea:	480b      	ldr	r0, [pc, #44]	@ (c0dea218 <nbgl_useCaseStatus+0xa4>)
c0dea1ec:	a90d      	add	r1, sp, #52	@ 0x34
c0dea1ee:	4478      	add	r0, pc
c0dea1f0:	f7fe fe54 	bl	c0de8e9c <nbgl_pageDrawInfo>
c0dea1f4:	eb09 0108 	add.w	r1, r9, r8
c0dea1f8:	6148      	str	r0, [r1, #20]
c0dea1fa:	f001 fdbb 	bl	c0debd74 <OUTLINED_FUNCTION_3>
c0dea1fe:	b010      	add	sp, #64	@ 0x40
c0dea200:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0dea204:	00001bc8 	.word	0x00001bc8
c0dea208:	000062ac 	.word	0x000062ac
c0dea20c:	0000008f 	.word	0x0000008f
c0dea210:	0000358e 	.word	0x0000358e
c0dea214:	00004a80 	.word	0x00004a80
c0dea218:	0000004b 	.word	0x0000004b

c0dea21c <tickerCallback>:
c0dea21c:	b510      	push	{r4, lr}
c0dea21e:	4806      	ldr	r0, [pc, #24]	@ (c0dea238 <tickerCallback+0x1c>)
c0dea220:	eb09 0400 	add.w	r4, r9, r0
c0dea224:	6960      	ldr	r0, [r4, #20]
c0dea226:	f7ff f98c 	bl	c0de9542 <nbgl_pageRelease>
c0dea22a:	6860      	ldr	r0, [r4, #4]
c0dea22c:	b110      	cbz	r0, c0dea234 <tickerCallback+0x18>
c0dea22e:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0dea232:	4700      	bx	r0
c0dea234:	bd10      	pop	{r4, pc}
c0dea236:	bf00      	nop
c0dea238:	00001bc8 	.word	0x00001bc8

c0dea23c <pageCallback>:
c0dea23c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dea240:	b092      	sub	sp, #72	@ 0x48
c0dea242:	b350      	cbz	r0, c0dea29a <pageCallback+0x5e>
c0dea244:	4605      	mov	r5, r0
c0dea246:	2801      	cmp	r0, #1
c0dea248:	d034      	beq.n	c0dea2b4 <pageCallback+0x78>
c0dea24a:	2d12      	cmp	r5, #18
c0dea24c:	d043      	beq.n	c0dea2d6 <pageCallback+0x9a>
c0dea24e:	460c      	mov	r4, r1
c0dea250:	2d03      	cmp	r5, #3
c0dea252:	d055      	beq.n	c0dea300 <pageCallback+0xc4>
c0dea254:	2d05      	cmp	r5, #5
c0dea256:	d05f      	beq.n	c0dea318 <pageCallback+0xdc>
c0dea258:	2d06      	cmp	r5, #6
c0dea25a:	d075      	beq.n	c0dea348 <pageCallback+0x10c>
c0dea25c:	2d07      	cmp	r5, #7
c0dea25e:	d077      	beq.n	c0dea350 <pageCallback+0x114>
c0dea260:	2d08      	cmp	r5, #8
c0dea262:	f000 809e 	beq.w	c0dea3a2 <pageCallback+0x166>
c0dea266:	2d09      	cmp	r5, #9
c0dea268:	f000 80a9 	beq.w	c0dea3be <pageCallback+0x182>
c0dea26c:	2d0a      	cmp	r5, #10
c0dea26e:	f000 80b0 	beq.w	c0dea3d2 <pageCallback+0x196>
c0dea272:	2d0b      	cmp	r5, #11
c0dea274:	f000 80fa 	beq.w	c0dea46c <pageCallback+0x230>
c0dea278:	2d0c      	cmp	r5, #12
c0dea27a:	f000 80fe 	beq.w	c0dea47a <pageCallback+0x23e>
c0dea27e:	2d0d      	cmp	r5, #13
c0dea280:	f000 8105 	beq.w	c0dea48e <pageCallback+0x252>
c0dea284:	2d10      	cmp	r5, #16
c0dea286:	f000 810e 	beq.w	c0dea4a6 <pageCallback+0x26a>
c0dea28a:	2d11      	cmp	r5, #17
c0dea28c:	f000 8113 	beq.w	c0dea4b6 <pageCallback+0x27a>
c0dea290:	2d02      	cmp	r5, #2
c0dea292:	f040 8119 	bne.w	c0dea4c8 <pageCallback+0x28c>
c0dea296:	48cb      	ldr	r0, [pc, #812]	@ (c0dea5c4 <pageCallback+0x388>)
c0dea298:	e161      	b.n	c0dea55e <pageCallback+0x322>
c0dea29a:	48ca      	ldr	r0, [pc, #808]	@ (c0dea5c4 <pageCallback+0x388>)
c0dea29c:	eb09 0100 	add.w	r1, r9, r0
c0dea2a0:	f891 0060 	ldrb.w	r0, [r1, #96]	@ 0x60
c0dea2a4:	6889      	ldr	r1, [r1, #8]
c0dea2a6:	3801      	subs	r0, #1
c0dea2a8:	2900      	cmp	r1, #0
c0dea2aa:	f000 8124 	beq.w	c0dea4f6 <pageCallback+0x2ba>
c0dea2ae:	b2c0      	uxtb	r0, r0
c0dea2b0:	2101      	movs	r1, #1
c0dea2b2:	e00b      	b.n	c0dea2cc <pageCallback+0x90>
c0dea2b4:	48c3      	ldr	r0, [pc, #780]	@ (c0dea5c4 <pageCallback+0x388>)
c0dea2b6:	eb09 0100 	add.w	r1, r9, r0
c0dea2ba:	f891 0060 	ldrb.w	r0, [r1, #96]	@ 0x60
c0dea2be:	6889      	ldr	r1, [r1, #8]
c0dea2c0:	3001      	adds	r0, #1
c0dea2c2:	2900      	cmp	r1, #0
c0dea2c4:	f000 8117 	beq.w	c0dea4f6 <pageCallback+0x2ba>
c0dea2c8:	b2c0      	uxtb	r0, r0
c0dea2ca:	2100      	movs	r1, #0
c0dea2cc:	b012      	add	sp, #72	@ 0x48
c0dea2ce:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dea2d2:	f000 baa7 	b.w	c0dea824 <displayReviewPage>
c0dea2d6:	48b9      	ldr	r0, [pc, #740]	@ (c0dea5bc <pageCallback+0x380>)
c0dea2d8:	eb09 0100 	add.w	r1, r9, r0
c0dea2dc:	f891 1021 	ldrb.w	r1, [r1, #33]	@ 0x21
c0dea2e0:	2900      	cmp	r1, #0
c0dea2e2:	f000 810f 	beq.w	c0dea504 <pageCallback+0x2c8>
c0dea2e6:	eb09 0100 	add.w	r1, r9, r0
c0dea2ea:	6d89      	ldr	r1, [r1, #88]	@ 0x58
c0dea2ec:	680a      	ldr	r2, [r1, #0]
c0dea2ee:	2a00      	cmp	r2, #0
c0dea2f0:	f000 8108 	beq.w	c0dea504 <pageCallback+0x2c8>
c0dea2f4:	4448      	add	r0, r9
c0dea2f6:	2201      	movs	r2, #1
c0dea2f8:	f880 2068 	strb.w	r2, [r0, #104]	@ 0x68
c0dea2fc:	6808      	ldr	r0, [r1, #0]
c0dea2fe:	e0de      	b.n	c0dea4be <pageCallback+0x282>
c0dea300:	48b0      	ldr	r0, [pc, #704]	@ (c0dea5c4 <pageCallback+0x388>)
c0dea302:	2cff      	cmp	r4, #255	@ 0xff
c0dea304:	f000 812b 	beq.w	c0dea55e <pageCallback+0x322>
c0dea308:	f819 0000 	ldrb.w	r0, [r9, r0]
c0dea30c:	1e81      	subs	r1, r0, #2
c0dea30e:	2902      	cmp	r1, #2
c0dea310:	f080 8144 	bcs.w	c0dea59c <pageCallback+0x360>
c0dea314:	4620      	mov	r0, r4
c0dea316:	e0ef      	b.n	c0dea4f8 <pageCallback+0x2bc>
c0dea318:	a80a      	add	r0, sp, #40	@ 0x28
c0dea31a:	49b0      	ldr	r1, [pc, #704]	@ (c0dea5dc <pageCallback+0x3a0>)
c0dea31c:	2220      	movs	r2, #32
c0dea31e:	4479      	add	r1, pc
c0dea320:	f002 feec 	bl	c0ded0fc <__aeabi_memcpy>
c0dea324:	4ca7      	ldr	r4, [pc, #668]	@ (c0dea5c4 <pageCallback+0x388>)
c0dea326:	eb09 0004 	add.w	r0, r9, r4
c0dea32a:	6a00      	ldr	r0, [r0, #32]
c0dea32c:	b108      	cbz	r0, c0dea332 <pageCallback+0xf6>
c0dea32e:	f7ff f908 	bl	c0de9542 <nbgl_pageRelease>
c0dea332:	48ab      	ldr	r0, [pc, #684]	@ (c0dea5e0 <pageCallback+0x3a4>)
c0dea334:	a90a      	add	r1, sp, #40	@ 0x28
c0dea336:	4478      	add	r0, pc
c0dea338:	f7fe fea0 	bl	c0de907c <nbgl_pageDrawConfirmation>
c0dea33c:	eb09 0104 	add.w	r1, r9, r4
c0dea340:	6208      	str	r0, [r1, #32]
c0dea342:	f001 fd17 	bl	c0debd74 <OUTLINED_FUNCTION_3>
c0dea346:	e111      	b.n	c0dea56c <pageCallback+0x330>
c0dea348:	489e      	ldr	r0, [pc, #632]	@ (c0dea5c4 <pageCallback+0x388>)
c0dea34a:	4448      	add	r0, r9
c0dea34c:	6a80      	ldr	r0, [r0, #40]	@ 0x28
c0dea34e:	e108      	b.n	c0dea562 <pageCallback+0x326>
c0dea350:	ac0a      	add	r4, sp, #40	@ 0x28
c0dea352:	499f      	ldr	r1, [pc, #636]	@ (c0dea5d0 <pageCallback+0x394>)
c0dea354:	221c      	movs	r2, #28
c0dea356:	4620      	mov	r0, r4
c0dea358:	4479      	add	r1, pc
c0dea35a:	f002 fecf 	bl	c0ded0fc <__aeabi_memcpy>
c0dea35e:	489d      	ldr	r0, [pc, #628]	@ (c0dea5d4 <pageCallback+0x398>)
c0dea360:	ad06      	add	r5, sp, #24
c0dea362:	4629      	mov	r1, r5
c0dea364:	4478      	add	r0, pc
c0dea366:	e890 00cc 	ldmia.w	r0, {r2, r3, r6, r7}
c0dea36a:	f44f 3080 	mov.w	r0, #65536	@ 0x10000
c0dea36e:	c1cc      	stmia	r1!, {r2, r3, r6, r7}
c0dea370:	4e95      	ldr	r6, [pc, #596]	@ (c0dea5c8 <pageCallback+0x38c>)
c0dea372:	9005      	str	r0, [sp, #20]
c0dea374:	eb09 0706 	add.w	r7, r9, r6
c0dea378:	6878      	ldr	r0, [r7, #4]
c0dea37a:	9002      	str	r0, [sp, #8]
c0dea37c:	2000      	movs	r0, #0
c0dea37e:	9003      	str	r0, [sp, #12]
c0dea380:	4620      	mov	r0, r4
c0dea382:	f7fa fdab 	bl	c0de4edc <nbgl_layoutGet>
c0dea386:	4629      	mov	r1, r5
c0dea388:	6338      	str	r0, [r7, #48]	@ 0x30
c0dea38a:	f7fd fb3f 	bl	c0de7a0c <nbgl_layoutAddHeader>
c0dea38e:	6879      	ldr	r1, [r7, #4]
c0dea390:	200b      	movs	r0, #11
c0dea392:	f001 fd0b 	bl	c0debdac <OUTLINED_FUNCTION_11>
c0dea396:	6879      	ldr	r1, [r7, #4]
c0dea398:	2804      	cmp	r0, #4
c0dea39a:	f080 80be 	bcs.w	c0dea51a <pageCallback+0x2de>
c0dea39e:	460c      	mov	r4, r1
c0dea3a0:	e0c7      	b.n	c0dea532 <pageCallback+0x2f6>
c0dea3a2:	4888      	ldr	r0, [pc, #544]	@ (c0dea5c4 <pageCallback+0x388>)
c0dea3a4:	2c00      	cmp	r4, #0
c0dea3a6:	f040 80d8 	bne.w	c0dea55a <pageCallback+0x31e>
c0dea3aa:	eb09 0100 	add.w	r1, r9, r0
c0dea3ae:	6a49      	ldr	r1, [r1, #36]	@ 0x24
c0dea3b0:	2900      	cmp	r1, #0
c0dea3b2:	f000 80d2 	beq.w	c0dea55a <pageCallback+0x31e>
c0dea3b6:	b012      	add	sp, #72	@ 0x48
c0dea3b8:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dea3bc:	4708      	bx	r1
c0dea3be:	4881      	ldr	r0, [pc, #516]	@ (c0dea5c4 <pageCallback+0x388>)
c0dea3c0:	4448      	add	r0, r9
c0dea3c2:	6981      	ldr	r1, [r0, #24]
c0dea3c4:	2900      	cmp	r1, #0
c0dea3c6:	f000 80d1 	beq.w	c0dea56c <pageCallback+0x330>
c0dea3ca:	fab4 f084 	clz	r0, r4
c0dea3ce:	0940      	lsrs	r0, r0, #5
c0dea3d0:	e059      	b.n	c0dea486 <pageCallback+0x24a>
c0dea3d2:	487a      	ldr	r0, [pc, #488]	@ (c0dea5bc <pageCallback+0x380>)
c0dea3d4:	f8df 81ec 	ldr.w	r8, [pc, #492]	@ c0dea5c4 <pageCallback+0x388>
c0dea3d8:	2700      	movs	r7, #0
c0dea3da:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0dea3de:	f04f 0a0b 	mov.w	sl, #11
c0dea3e2:	4448      	add	r0, r9
c0dea3e4:	eb09 0608 	add.w	r6, r9, r8
c0dea3e8:	f890 4020 	ldrb.w	r4, [r0, #32]
c0dea3ec:	e9d0 b506 	ldrd	fp, r5, [r0, #24]
c0dea3f0:	200b      	movs	r0, #11
c0dea3f2:	e9c6 770c 	strd	r7, r7, [r6, #48]	@ 0x30
c0dea3f6:	e9c6 770e 	strd	r7, r7, [r6, #56]	@ 0x38
c0dea3fa:	4629      	mov	r1, r5
c0dea3fc:	4623      	mov	r3, r4
c0dea3fe:	f002 f9bc 	bl	c0dec77a <nbgl_getTextNbLinesInWidth>
c0dea402:	f100 010a 	add.w	r1, r0, #10
c0dea406:	e9c6 b50d 	strd	fp, r5, [r6, #52]	@ 0x34
c0dea40a:	f886 4033 	strb.w	r4, [r6, #51]	@ 0x33
c0dea40e:	f886 7031 	strb.w	r7, [r6, #49]	@ 0x31
c0dea412:	fbb1 f1fa 	udiv	r1, r1, sl
c0dea416:	b2ca      	uxtb	r2, r1
c0dea418:	f886 1030 	strb.w	r1, [r6, #48]	@ 0x30
c0dea41c:	2a02      	cmp	r2, #2
c0dea41e:	d31e      	bcc.n	c0dea45e <pageCallback+0x222>
c0dea420:	3a01      	subs	r2, #1
c0dea422:	241a      	movs	r4, #26
c0dea424:	eb02 0342 	add.w	r3, r2, r2, lsl #1
c0dea428:	3319      	adds	r3, #25
c0dea42a:	b29b      	uxth	r3, r3
c0dea42c:	fbb3 f4f4 	udiv	r4, r3, r4
c0dea430:	b2e4      	uxtb	r4, r4
c0dea432:	fbb4 f5fa 	udiv	r5, r4, sl
c0dea436:	fb05 441a 	mls	r4, r5, sl, r4
c0dea43a:	f06f 050a 	mvn.w	r5, #10
c0dea43e:	fb02 0005 	mla	r0, r2, r5, r0
c0dea442:	f44f 728f 	mov.w	r2, #286	@ 0x11e
c0dea446:	fbb3 f2f2 	udiv	r2, r3, r2
c0dea44a:	b2c0      	uxtb	r0, r0
c0dea44c:	4420      	add	r0, r4
c0dea44e:	4411      	add	r1, r2
c0dea450:	280b      	cmp	r0, #11
c0dea452:	eb09 0008 	add.w	r0, r9, r8
c0dea456:	bf88      	it	hi
c0dea458:	3101      	addhi	r1, #1
c0dea45a:	f880 1030 	strb.w	r1, [r0, #48]	@ 0x30
c0dea45e:	2000      	movs	r0, #0
c0dea460:	2101      	movs	r1, #1
c0dea462:	b012      	add	sp, #72	@ 0x48
c0dea464:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dea468:	f001 ba30 	b.w	c0deb8cc <displayDetailsPage>
c0dea46c:	4855      	ldr	r0, [pc, #340]	@ (c0dea5c4 <pageCallback+0x388>)
c0dea46e:	4448      	add	r0, r9
c0dea470:	6981      	ldr	r1, [r0, #24]
c0dea472:	2900      	cmp	r1, #0
c0dea474:	d07a      	beq.n	c0dea56c <pageCallback+0x330>
c0dea476:	2001      	movs	r0, #1
c0dea478:	e005      	b.n	c0dea486 <pageCallback+0x24a>
c0dea47a:	4852      	ldr	r0, [pc, #328]	@ (c0dea5c4 <pageCallback+0x388>)
c0dea47c:	4448      	add	r0, r9
c0dea47e:	6981      	ldr	r1, [r0, #24]
c0dea480:	2900      	cmp	r1, #0
c0dea482:	d073      	beq.n	c0dea56c <pageCallback+0x330>
c0dea484:	2000      	movs	r0, #0
c0dea486:	b012      	add	sp, #72	@ 0x48
c0dea488:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dea48c:	4708      	bx	r1
c0dea48e:	484b      	ldr	r0, [pc, #300]	@ (c0dea5bc <pageCallback+0x380>)
c0dea490:	eb09 0100 	add.w	r1, r9, r0
c0dea494:	4448      	add	r0, r9
c0dea496:	6a49      	ldr	r1, [r1, #36]	@ 0x24
c0dea498:	2900      	cmp	r1, #0
c0dea49a:	d06a      	beq.n	c0dea572 <pageCallback+0x336>
c0dea49c:	7c80      	ldrb	r0, [r0, #18]
c0dea49e:	4420      	add	r0, r4
c0dea4a0:	eb01 1000 	add.w	r0, r1, r0, lsl #4
c0dea4a4:	e06a      	b.n	c0dea57c <pageCallback+0x340>
c0dea4a6:	4845      	ldr	r0, [pc, #276]	@ (c0dea5bc <pageCallback+0x380>)
c0dea4a8:	2100      	movs	r1, #0
c0dea4aa:	4448      	add	r0, r9
c0dea4ac:	6581      	str	r1, [r0, #88]	@ 0x58
c0dea4ae:	f880 1069 	strb.w	r1, [r0, #105]	@ 0x69
c0dea4b2:	2010      	movs	r0, #16
c0dea4b4:	e003      	b.n	c0dea4be <pageCallback+0x282>
c0dea4b6:	4a41      	ldr	r2, [pc, #260]	@ (c0dea5bc <pageCallback+0x380>)
c0dea4b8:	f001 fc5f 	bl	c0debd7a <OUTLINED_FUNCTION_4>
c0dea4bc:	d067      	beq.n	c0dea58e <pageCallback+0x352>
c0dea4be:	b012      	add	sp, #72	@ 0x48
c0dea4c0:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dea4c4:	f000 bfcc 	b.w	c0deb460 <displaySecurityReport>
c0dea4c8:	4e3e      	ldr	r6, [pc, #248]	@ (c0dea5c4 <pageCallback+0x388>)
c0dea4ca:	eb09 0006 	add.w	r0, r9, r6
c0dea4ce:	6ac3      	ldr	r3, [r0, #44]	@ 0x2c
c0dea4d0:	b133      	cbz	r3, c0dea4e0 <pageCallback+0x2a4>
c0dea4d2:	eb09 0006 	add.w	r0, r9, r6
c0dea4d6:	4621      	mov	r1, r4
c0dea4d8:	f890 2060 	ldrb.w	r2, [r0, #96]	@ 0x60
c0dea4dc:	4628      	mov	r0, r5
c0dea4de:	4798      	blx	r3
c0dea4e0:	eb09 0006 	add.w	r0, r9, r6
c0dea4e4:	68c2      	ldr	r2, [r0, #12]
c0dea4e6:	2a00      	cmp	r2, #0
c0dea4e8:	d040      	beq.n	c0dea56c <pageCallback+0x330>
c0dea4ea:	4628      	mov	r0, r5
c0dea4ec:	4621      	mov	r1, r4
c0dea4ee:	b012      	add	sp, #72	@ 0x48
c0dea4f0:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dea4f4:	4710      	bx	r2
c0dea4f6:	b2c0      	uxtb	r0, r0
c0dea4f8:	2100      	movs	r1, #0
c0dea4fa:	b012      	add	sp, #72	@ 0x48
c0dea4fc:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dea500:	f7ff bbd2 	b.w	c0de9ca8 <displayGenericContextPage>
c0dea504:	482e      	ldr	r0, [pc, #184]	@ (c0dea5c0 <pageCallback+0x384>)
c0dea506:	2200      	movs	r2, #0
c0dea508:	eb09 0100 	add.w	r1, r9, r0
c0dea50c:	6888      	ldr	r0, [r1, #8]
c0dea50e:	3110      	adds	r1, #16
c0dea510:	b012      	add	sp, #72	@ 0x48
c0dea512:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dea516:	f001 b929 	b.w	c0deb76c <displayInfosListModal>
c0dea51a:	2080      	movs	r0, #128	@ 0x80
c0dea51c:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0dea520:	2303      	movs	r3, #3
c0dea522:	9001      	str	r0, [sp, #4]
c0dea524:	4829      	ldr	r0, [pc, #164]	@ (c0dea5cc <pageCallback+0x390>)
c0dea526:	eb09 0400 	add.w	r4, r9, r0
c0dea52a:	200b      	movs	r0, #11
c0dea52c:	9400      	str	r4, [sp, #0]
c0dea52e:	f002 f933 	bl	c0dec798 <nbgl_textReduceOnNbLines>
c0dea532:	9404      	str	r4, [sp, #16]
c0dea534:	eb09 0406 	add.w	r4, r9, r6
c0dea538:	6b20      	ldr	r0, [r4, #48]	@ 0x30
c0dea53a:	a902      	add	r1, sp, #8
c0dea53c:	f7fc fe0b 	bl	c0de7156 <nbgl_layoutAddQRCode>
c0dea540:	6b20      	ldr	r0, [r4, #48]	@ 0x30
c0dea542:	4925      	ldr	r1, [pc, #148]	@ (c0dea5d8 <pageCallback+0x39c>)
c0dea544:	2215      	movs	r2, #21
c0dea546:	2309      	movs	r3, #9
c0dea548:	4479      	add	r1, pc
c0dea54a:	f7fd fa38 	bl	c0de79be <nbgl_layoutAddFooter>
c0dea54e:	6b20      	ldr	r0, [r4, #48]	@ 0x30
c0dea550:	f7fd febe 	bl	c0de82d0 <nbgl_layoutDraw>
c0dea554:	f002 f8b7 	bl	c0dec6c6 <nbgl_refresh>
c0dea558:	e008      	b.n	c0dea56c <pageCallback+0x330>
c0dea55a:	2c01      	cmp	r4, #1
c0dea55c:	d106      	bne.n	c0dea56c <pageCallback+0x330>
c0dea55e:	4448      	add	r0, r9
c0dea560:	6840      	ldr	r0, [r0, #4]
c0dea562:	b118      	cbz	r0, c0dea56c <pageCallback+0x330>
c0dea564:	b012      	add	sp, #72	@ 0x48
c0dea566:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dea56a:	4700      	bx	r0
c0dea56c:	b012      	add	sp, #72	@ 0x48
c0dea56e:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0dea572:	6a81      	ldr	r1, [r0, #40]	@ 0x28
c0dea574:	7c80      	ldrb	r0, [r0, #18]
c0dea576:	4420      	add	r0, r4
c0dea578:	b2c0      	uxtb	r0, r0
c0dea57a:	4788      	blx	r1
c0dea57c:	e9d0 3100 	ldrd	r3, r1, [r0]
c0dea580:	6882      	ldr	r2, [r0, #8]
c0dea582:	4618      	mov	r0, r3
c0dea584:	b012      	add	sp, #72	@ 0x48
c0dea586:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dea58a:	f000 be8b 	b.w	c0deb2a4 <displayFullValuePage>
c0dea58e:	eb09 0002 	add.w	r0, r9, r2
c0dea592:	f890 0069 	ldrb.w	r0, [r0, #105]	@ 0x69
c0dea596:	b120      	cbz	r0, c0dea5a2 <pageCallback+0x366>
c0dea598:	6948      	ldr	r0, [r1, #20]
c0dea59a:	e003      	b.n	c0dea5a4 <pageCallback+0x368>
c0dea59c:	b938      	cbnz	r0, c0dea5ae <pageCallback+0x372>
c0dea59e:	4620      	mov	r0, r4
c0dea5a0:	e693      	b.n	c0dea2ca <pageCallback+0x8e>
c0dea5a2:	6988      	ldr	r0, [r1, #24]
c0dea5a4:	b012      	add	sp, #72	@ 0x48
c0dea5a6:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dea5aa:	f001 b863 	b.w	c0deb674 <displayCustomizedSecurityReport>
c0dea5ae:	4620      	mov	r0, r4
c0dea5b0:	2100      	movs	r1, #0
c0dea5b2:	b012      	add	sp, #72	@ 0x48
c0dea5b4:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dea5b8:	f7ff ba30 	b.w	c0de9a1c <displaySettingsPage>
c0dea5bc:	000018fc 	.word	0x000018fc
c0dea5c0:	00001c44 	.word	0x00001c44
c0dea5c4:	00001bc8 	.word	0x00001bc8
c0dea5c8:	00001a10 	.word	0x00001a10
c0dea5cc:	00001b48 	.word	0x00001b48
c0dea5d0:	00006200 	.word	0x00006200
c0dea5d4:	00006178 	.word	0x00006178
c0dea5d8:	000041a6 	.word	0x000041a6
c0dea5dc:	000061de 	.word	0x000061de
c0dea5e0:	00000407 	.word	0x00000407

c0dea5e4 <nbgl_useCaseReviewStatus>:
c0dea5e4:	460a      	mov	r2, r1
c0dea5e6:	b198      	cbz	r0, c0dea610 <nbgl_useCaseReviewStatus+0x2c>
c0dea5e8:	2801      	cmp	r0, #1
c0dea5ea:	d016      	beq.n	c0dea61a <nbgl_useCaseReviewStatus+0x36>
c0dea5ec:	2802      	cmp	r0, #2
c0dea5ee:	d019      	beq.n	c0dea624 <nbgl_useCaseReviewStatus+0x40>
c0dea5f0:	2803      	cmp	r0, #3
c0dea5f2:	d01c      	beq.n	c0dea62e <nbgl_useCaseReviewStatus+0x4a>
c0dea5f4:	2804      	cmp	r0, #4
c0dea5f6:	d01f      	beq.n	c0dea638 <nbgl_useCaseReviewStatus+0x54>
c0dea5f8:	2807      	cmp	r0, #7
c0dea5fa:	d022      	beq.n	c0dea642 <nbgl_useCaseReviewStatus+0x5e>
c0dea5fc:	2806      	cmp	r0, #6
c0dea5fe:	d025      	beq.n	c0dea64c <nbgl_useCaseReviewStatus+0x68>
c0dea600:	2805      	cmp	r0, #5
c0dea602:	bf18      	it	ne
c0dea604:	4770      	bxne	lr
c0dea606:	4815      	ldr	r0, [pc, #84]	@ (c0dea65c <nbgl_useCaseReviewStatus+0x78>)
c0dea608:	2100      	movs	r1, #0
c0dea60a:	4478      	add	r0, pc
c0dea60c:	f7ff bdb2 	b.w	c0dea174 <nbgl_useCaseStatus>
c0dea610:	4813      	ldr	r0, [pc, #76]	@ (c0dea660 <nbgl_useCaseReviewStatus+0x7c>)
c0dea612:	2101      	movs	r1, #1
c0dea614:	4478      	add	r0, pc
c0dea616:	f7ff bdad 	b.w	c0dea174 <nbgl_useCaseStatus>
c0dea61a:	4812      	ldr	r0, [pc, #72]	@ (c0dea664 <nbgl_useCaseReviewStatus+0x80>)
c0dea61c:	2100      	movs	r1, #0
c0dea61e:	4478      	add	r0, pc
c0dea620:	f7ff bda8 	b.w	c0dea174 <nbgl_useCaseStatus>
c0dea624:	4810      	ldr	r0, [pc, #64]	@ (c0dea668 <nbgl_useCaseReviewStatus+0x84>)
c0dea626:	2101      	movs	r1, #1
c0dea628:	4478      	add	r0, pc
c0dea62a:	f7ff bda3 	b.w	c0dea174 <nbgl_useCaseStatus>
c0dea62e:	480f      	ldr	r0, [pc, #60]	@ (c0dea66c <nbgl_useCaseReviewStatus+0x88>)
c0dea630:	2100      	movs	r1, #0
c0dea632:	4478      	add	r0, pc
c0dea634:	f7ff bd9e 	b.w	c0dea174 <nbgl_useCaseStatus>
c0dea638:	4807      	ldr	r0, [pc, #28]	@ (c0dea658 <nbgl_useCaseReviewStatus+0x74>)
c0dea63a:	2101      	movs	r1, #1
c0dea63c:	4478      	add	r0, pc
c0dea63e:	f7ff bd99 	b.w	c0dea174 <nbgl_useCaseStatus>
c0dea642:	480c      	ldr	r0, [pc, #48]	@ (c0dea674 <nbgl_useCaseReviewStatus+0x90>)
c0dea644:	2100      	movs	r1, #0
c0dea646:	4478      	add	r0, pc
c0dea648:	f7ff bd94 	b.w	c0dea174 <nbgl_useCaseStatus>
c0dea64c:	4808      	ldr	r0, [pc, #32]	@ (c0dea670 <nbgl_useCaseReviewStatus+0x8c>)
c0dea64e:	2101      	movs	r1, #1
c0dea650:	4478      	add	r0, pc
c0dea652:	f7ff bd8f 	b.w	c0dea174 <nbgl_useCaseStatus>
c0dea656:	bf00      	nop
c0dea658:	00003e0c 	.word	0x00003e0c
c0dea65c:	00003ebd 	.word	0x00003ebd
c0dea660:	00003fe9 	.word	0x00003fe9
c0dea664:	000045e9 	.word	0x000045e9
c0dea668:	000040b7 	.word	0x000040b7
c0dea66c:	0000441f 	.word	0x0000441f
c0dea670:	00003f47 	.word	0x00003f47
c0dea674:	00003e13 	.word	0x00003e13

c0dea678 <nbgl_useCaseChoice>:
c0dea678:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dea67c:	b088      	sub	sp, #32
c0dea67e:	4683      	mov	fp, r0
c0dea680:	4668      	mov	r0, sp
c0dea682:	460e      	mov	r6, r1
c0dea684:	2118      	movs	r1, #24
c0dea686:	461c      	mov	r4, r3
c0dea688:	4617      	mov	r7, r2
c0dea68a:	3008      	adds	r0, #8
c0dea68c:	f002 fd40 	bl	c0ded110 <__aeabi_memclr>
c0dea690:	b324      	cbz	r4, c0dea6dc <nbgl_useCaseChoice+0x64>
c0dea692:	f8dd 8040 	ldr.w	r8, [sp, #64]	@ 0x40
c0dea696:	f1b8 0f00 	cmp.w	r8, #0
c0dea69a:	d01f      	beq.n	c0dea6dc <nbgl_useCaseChoice+0x64>
c0dea69c:	4811      	ldr	r0, [pc, #68]	@ (c0dea6e4 <nbgl_useCaseChoice+0x6c>)
c0dea69e:	f8dd a044 	ldr.w	sl, [sp, #68]	@ 0x44
c0dea6a2:	eb09 0500 	add.w	r5, r9, r0
c0dea6a6:	f7ff f967 	bl	c0de9978 <reset_callbacks_and_context>
c0dea6aa:	2000      	movs	r0, #0
c0dea6ac:	f8c5 a018 	str.w	sl, [r5, #24]
c0dea6b0:	e9cd 6700 	strd	r6, r7, [sp]
c0dea6b4:	f8cd 8018 	str.w	r8, [sp, #24]
c0dea6b8:	9405      	str	r4, [sp, #20]
c0dea6ba:	f8cd b00c 	str.w	fp, [sp, #12]
c0dea6be:	4669      	mov	r1, sp
c0dea6c0:	f88d 0011 	strb.w	r0, [sp, #17]
c0dea6c4:	2009      	movs	r0, #9
c0dea6c6:	f88d 001e 	strb.w	r0, [sp, #30]
c0dea6ca:	f88d 001c 	strb.w	r0, [sp, #28]
c0dea6ce:	4806      	ldr	r0, [pc, #24]	@ (c0dea6e8 <nbgl_useCaseChoice+0x70>)
c0dea6d0:	4478      	add	r0, pc
c0dea6d2:	f7fe fcd3 	bl	c0de907c <nbgl_pageDrawConfirmation>
c0dea6d6:	6168      	str	r0, [r5, #20]
c0dea6d8:	f001 fb4c 	bl	c0debd74 <OUTLINED_FUNCTION_3>
c0dea6dc:	b008      	add	sp, #32
c0dea6de:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0dea6e2:	bf00      	nop
c0dea6e4:	00001bc8 	.word	0x00001bc8
c0dea6e8:	fffffb69 	.word	0xfffffb69

c0dea6ec <nbgl_useCaseConfirm>:
c0dea6ec:	b570      	push	{r4, r5, r6, lr}
c0dea6ee:	b088      	sub	sp, #32
c0dea6f0:	4c0f      	ldr	r4, [pc, #60]	@ (c0dea730 <nbgl_useCaseConfirm+0x44>)
c0dea6f2:	9e0c      	ldr	r6, [sp, #48]	@ 0x30
c0dea6f4:	f10d 0c14 	add.w	ip, sp, #20
c0dea6f8:	eb09 0504 	add.w	r5, r9, r4
c0dea6fc:	61ee      	str	r6, [r5, #28]
c0dea6fe:	4e0d      	ldr	r6, [pc, #52]	@ (c0dea734 <nbgl_useCaseConfirm+0x48>)
c0dea700:	e8ac 004c 	stmia.w	ip!, {r2, r3, r6}
c0dea704:	2200      	movs	r2, #0
c0dea706:	9204      	str	r2, [sp, #16]
c0dea708:	4b0b      	ldr	r3, [pc, #44]	@ (c0dea738 <nbgl_useCaseConfirm+0x4c>)
c0dea70a:	447b      	add	r3, pc
c0dea70c:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
c0dea710:	6a28      	ldr	r0, [r5, #32]
c0dea712:	b108      	cbz	r0, c0dea718 <nbgl_useCaseConfirm+0x2c>
c0dea714:	f7fe ff15 	bl	c0de9542 <nbgl_pageRelease>
c0dea718:	4808      	ldr	r0, [pc, #32]	@ (c0dea73c <nbgl_useCaseConfirm+0x50>)
c0dea71a:	4669      	mov	r1, sp
c0dea71c:	4478      	add	r0, pc
c0dea71e:	f7fe fcad 	bl	c0de907c <nbgl_pageDrawConfirmation>
c0dea722:	eb09 0104 	add.w	r1, r9, r4
c0dea726:	6208      	str	r0, [r1, #32]
c0dea728:	f001 fb24 	bl	c0debd74 <OUTLINED_FUNCTION_3>
c0dea72c:	b008      	add	sp, #32
c0dea72e:	bd70      	pop	{r4, r5, r6, pc}
c0dea730:	00001bc8 	.word	0x00001bc8
c0dea734:	01090009 	.word	0x01090009
c0dea738:	0000325e 	.word	0x0000325e
c0dea73c:	00000021 	.word	0x00000021

c0dea740 <pageModalCallback>:
c0dea740:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0dea742:	460c      	mov	r4, r1
c0dea744:	280e      	cmp	r0, #14
c0dea746:	d008      	beq.n	c0dea75a <pageModalCallback+0x1a>
c0dea748:	4605      	mov	r5, r0
c0dea74a:	280f      	cmp	r0, #15
c0dea74c:	d117      	bne.n	c0dea77e <pageModalCallback+0x3e>
c0dea74e:	4833      	ldr	r0, [pc, #204]	@ (c0dea81c <pageModalCallback+0xdc>)
c0dea750:	4448      	add	r0, r9
c0dea752:	e9d0 2104 	ldrd	r2, r1, [r0, #16]
c0dea756:	6983      	ldr	r3, [r0, #24]
c0dea758:	e005      	b.n	c0dea766 <pageModalCallback+0x26>
c0dea75a:	482f      	ldr	r0, [pc, #188]	@ (c0dea818 <pageModalCallback+0xd8>)
c0dea75c:	4448      	add	r0, r9
c0dea75e:	6b40      	ldr	r0, [r0, #52]	@ 0x34
c0dea760:	e9d0 2100 	ldrd	r2, r1, [r0]
c0dea764:	6883      	ldr	r3, [r0, #8]
c0dea766:	f852 0024 	ldr.w	r0, [r2, r4, lsl #2]
c0dea76a:	eb04 0244 	add.w	r2, r4, r4, lsl #1
c0dea76e:	f851 1024 	ldr.w	r1, [r1, r4, lsl #2]
c0dea772:	eb03 02c2 	add.w	r2, r3, r2, lsl #3
c0dea776:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0dea77a:	f000 bd93 	b.w	c0deb2a4 <displayFullValuePage>
c0dea77e:	4e28      	ldr	r6, [pc, #160]	@ (c0dea820 <pageModalCallback+0xe0>)
c0dea780:	eb09 0706 	add.w	r7, r9, r6
c0dea784:	6a38      	ldr	r0, [r7, #32]
c0dea786:	f7fe fedc 	bl	c0de9542 <nbgl_pageRelease>
c0dea78a:	2000      	movs	r0, #0
c0dea78c:	2d02      	cmp	r5, #2
c0dea78e:	6238      	str	r0, [r7, #32]
c0dea790:	d032      	beq.n	c0dea7f8 <pageModalCallback+0xb8>
c0dea792:	2d13      	cmp	r5, #19
c0dea794:	d00f      	beq.n	c0dea7b6 <pageModalCallback+0x76>
c0dea796:	2d04      	cmp	r5, #4
c0dea798:	d01e      	beq.n	c0dea7d8 <pageModalCallback+0x98>
c0dea79a:	2d05      	cmp	r5, #5
c0dea79c:	d024      	beq.n	c0dea7e8 <pageModalCallback+0xa8>
c0dea79e:	2d09      	cmp	r5, #9
c0dea7a0:	d029      	beq.n	c0dea7f6 <pageModalCallback+0xb6>
c0dea7a2:	2d03      	cmp	r5, #3
c0dea7a4:	d137      	bne.n	c0dea816 <pageModalCallback+0xd6>
c0dea7a6:	2cff      	cmp	r4, #255	@ 0xff
c0dea7a8:	d026      	beq.n	c0dea7f8 <pageModalCallback+0xb8>
c0dea7aa:	4620      	mov	r0, r4
c0dea7ac:	2100      	movs	r1, #0
c0dea7ae:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0dea7b2:	f001 b88b 	b.w	c0deb8cc <displayDetailsPage>
c0dea7b6:	4818      	ldr	r0, [pc, #96]	@ (c0dea818 <pageModalCallback+0xd8>)
c0dea7b8:	eb09 0100 	add.w	r1, r9, r0
c0dea7bc:	f891 1068 	ldrb.w	r1, [r1, #104]	@ 0x68
c0dea7c0:	2902      	cmp	r1, #2
c0dea7c2:	d119      	bne.n	c0dea7f8 <pageModalCallback+0xb8>
c0dea7c4:	4448      	add	r0, r9
c0dea7c6:	2101      	movs	r1, #1
c0dea7c8:	f880 1068 	strb.w	r1, [r0, #104]	@ 0x68
c0dea7cc:	6d80      	ldr	r0, [r0, #88]	@ 0x58
c0dea7ce:	6800      	ldr	r0, [r0, #0]
c0dea7d0:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0dea7d4:	f000 be44 	b.w	c0deb460 <displaySecurityReport>
c0dea7d8:	2cff      	cmp	r4, #255	@ 0xff
c0dea7da:	d00d      	beq.n	c0dea7f8 <pageModalCallback+0xb8>
c0dea7dc:	4620      	mov	r0, r4
c0dea7de:	2100      	movs	r1, #0
c0dea7e0:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0dea7e4:	f001 b92c 	b.w	c0deba40 <displayTagValueListModalPage>
c0dea7e8:	b934      	cbnz	r4, c0dea7f8 <pageModalCallback+0xb8>
c0dea7ea:	20ff      	movs	r0, #255	@ 0xff
c0dea7ec:	2101      	movs	r1, #1
c0dea7ee:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0dea7f2:	f7ff ba59 	b.w	c0de9ca8 <displayGenericContextPage>
c0dea7f6:	b12c      	cbz	r4, c0dea804 <pageModalCallback+0xc4>
c0dea7f8:	f001 ff8d 	bl	c0dec716 <nbgl_screenRedraw>
c0dea7fc:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0dea800:	f001 bf61 	b.w	c0dec6c6 <nbgl_refresh>
c0dea804:	eb09 0006 	add.w	r0, r9, r6
c0dea808:	69c0      	ldr	r0, [r0, #28]
c0dea80a:	b120      	cbz	r0, c0dea816 <pageModalCallback+0xd6>
c0dea80c:	4780      	blx	r0
c0dea80e:	eb09 0006 	add.w	r0, r9, r6
c0dea812:	2100      	movs	r1, #0
c0dea814:	61c1      	str	r1, [r0, #28]
c0dea816:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0dea818:	000018fc 	.word	0x000018fc
c0dea81c:	00001c44 	.word	0x00001c44
c0dea820:	00001bc8 	.word	0x00001bc8

c0dea824 <displayReviewPage>:
c0dea824:	b570      	push	{r4, r5, r6, lr}
c0dea826:	b090      	sub	sp, #64	@ 0x40
c0dea828:	460c      	mov	r4, r1
c0dea82a:	4605      	mov	r5, r0
c0dea82c:	4668      	mov	r0, sp
c0dea82e:	2140      	movs	r1, #64	@ 0x40
c0dea830:	f002 fc6e 	bl	c0ded110 <__aeabi_memclr>
c0dea834:	4e24      	ldr	r6, [pc, #144]	@ (c0dea8c8 <displayReviewPage+0xa4>)
c0dea836:	eb09 0006 	add.w	r0, r9, r6
c0dea83a:	f890 0061 	ldrb.w	r0, [r0, #97]	@ 0x61
c0dea83e:	b108      	cbz	r0, c0dea844 <displayReviewPage+0x20>
c0dea840:	42a8      	cmp	r0, r5
c0dea842:	d93f      	bls.n	c0dea8c4 <displayReviewPage+0xa0>
c0dea844:	eb09 0006 	add.w	r0, r9, r6
c0dea848:	6882      	ldr	r2, [r0, #8]
c0dea84a:	f880 5060 	strb.w	r5, [r0, #96]	@ 0x60
c0dea84e:	b3ca      	cbz	r2, c0dea8c4 <displayReviewPage+0xa0>
c0dea850:	4669      	mov	r1, sp
c0dea852:	4628      	mov	r0, r5
c0dea854:	4790      	blx	r2
c0dea856:	b3a8      	cbz	r0, c0dea8c4 <displayReviewPage+0xa0>
c0dea858:	2009      	movs	r0, #9
c0dea85a:	2100      	movs	r1, #0
c0dea85c:	f88d 0006 	strb.w	r0, [sp, #6]
c0dea860:	f89d 000c 	ldrb.w	r0, [sp, #12]
c0dea864:	f88d 1004 	strb.w	r1, [sp, #4]
c0dea868:	9100      	str	r1, [sp, #0]
c0dea86a:	2806      	cmp	r0, #6
c0dea86c:	d00e      	beq.n	c0dea88c <displayReviewPage+0x68>
c0dea86e:	2804      	cmp	r0, #4
c0dea870:	d015      	beq.n	c0dea89e <displayReviewPage+0x7a>
c0dea872:	2805      	cmp	r0, #5
c0dea874:	d010      	beq.n	c0dea898 <displayReviewPage+0x74>
c0dea876:	2802      	cmp	r0, #2
c0dea878:	d114      	bne.n	c0dea8a4 <displayReviewPage+0x80>
c0dea87a:	eb09 0006 	add.w	r0, r9, r6
c0dea87e:	f890 1060 	ldrb.w	r1, [r0, #96]	@ 0x60
c0dea882:	3101      	adds	r1, #1
c0dea884:	f880 1061 	strb.w	r1, [r0, #97]	@ 0x61
c0dea888:	200b      	movs	r0, #11
c0dea88a:	e009      	b.n	c0dea8a0 <displayReviewPage+0x7c>
c0dea88c:	200b      	movs	r0, #11
c0dea88e:	f88d 101c 	strb.w	r1, [sp, #28]
c0dea892:	f88d 0038 	strb.w	r0, [sp, #56]	@ 0x38
c0dea896:	e005      	b.n	c0dea8a4 <displayReviewPage+0x80>
c0dea898:	2009      	movs	r0, #9
c0dea89a:	f88d 001a 	strb.w	r0, [sp, #26]
c0dea89e:	2000      	movs	r0, #0
c0dea8a0:	f88d 001c 	strb.w	r0, [sp, #28]
c0dea8a4:	4809      	ldr	r0, [pc, #36]	@ (c0dea8cc <displayReviewPage+0xa8>)
c0dea8a6:	eb09 0506 	add.w	r5, r9, r6
c0dea8aa:	466a      	mov	r2, sp
c0dea8ac:	f105 0160 	add.w	r1, r5, #96	@ 0x60
c0dea8b0:	4478      	add	r0, pc
c0dea8b2:	f7fe fe43 	bl	c0de953c <nbgl_pageDrawGenericContent>
c0dea8b6:	6168      	str	r0, [r5, #20]
c0dea8b8:	2001      	movs	r0, #1
c0dea8ba:	2c00      	cmp	r4, #0
c0dea8bc:	bf18      	it	ne
c0dea8be:	2002      	movne	r0, #2
c0dea8c0:	f001 ff06 	bl	c0dec6d0 <nbgl_refreshSpecial>
c0dea8c4:	b010      	add	sp, #64	@ 0x40
c0dea8c6:	bd70      	pop	{r4, r5, r6, pc}
c0dea8c8:	00001bc8 	.word	0x00001bc8
c0dea8cc:	fffff989 	.word	0xfffff989

c0dea8d0 <nbgl_useCaseReview>:
c0dea8d0:	b5f0      	push	{r4, r5, r6, r7, lr}
c0dea8d2:	b087      	sub	sp, #28
c0dea8d4:	461c      	mov	r4, r3
c0dea8d6:	f001 fa3d 	bl	c0debd54 <OUTLINED_FUNCTION_0>
c0dea8da:	2001      	movs	r0, #1
c0dea8dc:	990e      	ldr	r1, [sp, #56]	@ 0x38
c0dea8de:	462a      	mov	r2, r5
c0dea8e0:	4623      	mov	r3, r4
c0dea8e2:	9005      	str	r0, [sp, #20]
c0dea8e4:	2000      	movs	r0, #0
c0dea8e6:	e9cd 0102 	strd	r0, r1, [sp, #8]
c0dea8ea:	9004      	str	r0, [sp, #16]
c0dea8ec:	980d      	ldr	r0, [sp, #52]	@ 0x34
c0dea8ee:	4631      	mov	r1, r6
c0dea8f0:	f001 fa52 	bl	c0debd98 <OUTLINED_FUNCTION_7>
c0dea8f4:	b007      	add	sp, #28
c0dea8f6:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0dea8f8 <useCaseReview>:
c0dea8f8:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0dea8fc:	4682      	mov	sl, r0
c0dea8fe:	4840      	ldr	r0, [pc, #256]	@ (c0deaa00 <useCaseReview+0x108>)
c0dea900:	4688      	mov	r8, r1
c0dea902:	2102      	movs	r1, #2
c0dea904:	4614      	mov	r4, r2
c0dea906:	f04f 0b00 	mov.w	fp, #0
c0dea90a:	4e40      	ldr	r6, [pc, #256]	@ (c0deaa0c <useCaseReview+0x114>)
c0dea90c:	461f      	mov	r7, r3
c0dea90e:	f809 1000 	strb.w	r1, [r9, r0]
c0dea912:	493c      	ldr	r1, [pc, #240]	@ (c0deaa04 <useCaseReview+0x10c>)
c0dea914:	4448      	add	r0, r9
c0dea916:	eb09 0506 	add.w	r5, r9, r6
c0dea91a:	9a0d      	ldr	r2, [sp, #52]	@ 0x34
c0dea91c:	4449      	add	r1, r9
c0dea91e:	e9c1 a208 	strd	sl, r2, [r1, #32]
c0dea922:	493b      	ldr	r1, [pc, #236]	@ (c0deaa10 <useCaseReview+0x118>)
c0dea924:	f8c0 b010 	str.w	fp, [r0, #16]
c0dea928:	4479      	add	r1, pc
c0dea92a:	6181      	str	r1, [r0, #24]
c0dea92c:	4836      	ldr	r0, [pc, #216]	@ (c0deaa08 <useCaseReview+0x110>)
c0dea92e:	2103      	movs	r1, #3
c0dea930:	4448      	add	r0, r9
c0dea932:	7301      	strb	r1, [r0, #12]
c0dea934:	6085      	str	r5, [r0, #8]
c0dea936:	4628      	mov	r0, r5
c0dea938:	21a8      	movs	r1, #168	@ 0xa8
c0dea93a:	f002 fbe9 	bl	c0ded110 <__aeabi_memclr>
c0dea93e:	2001      	movs	r0, #1
c0dea940:	f8a5 b024 	strh.w	fp, [r5, #36]	@ 0x24
c0dea944:	f809 0006 	strb.w	r0, [r9, r6]
c0dea948:	4832      	ldr	r0, [pc, #200]	@ (c0deaa14 <useCaseReview+0x11c>)
c0dea94a:	4478      	add	r0, pc
c0dea94c:	6228      	str	r0, [r5, #32]
c0dea94e:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0dea950:	616f      	str	r7, [r5, #20]
c0dea952:	9401      	str	r4, [sp, #4]
c0dea954:	60ac      	str	r4, [r5, #8]
c0dea956:	f885 b004 	strb.w	fp, [r5, #4]
c0dea95a:	61e8      	str	r0, [r5, #28]
c0dea95c:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0dea95e:	f001 f915 	bl	c0debb8c <initWarningTipBox>
c0dea962:	2004      	movs	r0, #4
c0dea964:	4641      	mov	r1, r8
c0dea966:	f885 0038 	strb.w	r0, [r5, #56]	@ 0x38
c0dea96a:	f105 003c 	add.w	r0, r5, #60	@ 0x3c
c0dea96e:	e891 00dc 	ldmia.w	r1, {r2, r3, r4, r6, r7}
c0dea972:	c0dc      	stmia	r0!, {r2, r3, r4, r6, r7}
c0dea974:	f8d8 0010 	ldr.w	r0, [r8, #16]
c0dea978:	66e8      	str	r0, [r5, #108]	@ 0x6c
c0dea97a:	e9dd 050e 	ldrd	r0, r5, [sp, #56]	@ 0x38
c0dea97e:	9b0b      	ldr	r3, [sp, #44]	@ 0x2c
c0dea980:	b190      	cbz	r0, c0dea9a8 <useCaseReview+0xb0>
c0dea982:	4922      	ldr	r1, [pc, #136]	@ (c0deaa0c <useCaseReview+0x114>)
c0dea984:	2203      	movs	r2, #3
c0dea986:	eb09 0001 	add.w	r0, r9, r1
c0dea98a:	f880 2070 	strb.w	r2, [r0, #112]	@ 0x70
c0dea98e:	9a01      	ldr	r2, [sp, #4]
c0dea990:	b343      	cbz	r3, c0dea9e4 <useCaseReview+0xec>
c0dea992:	eb09 0001 	add.w	r0, r9, r1
c0dea996:	210b      	movs	r1, #11
c0dea998:	f880 1080 	strb.w	r1, [r0, #128]	@ 0x80
c0dea99c:	4921      	ldr	r1, [pc, #132]	@ (c0deaa24 <useCaseReview+0x12c>)
c0dea99e:	e9c0 321d 	strd	r3, r2, [r0, #116]	@ 0x74
c0dea9a2:	4479      	add	r1, pc
c0dea9a4:	67c1      	str	r1, [r0, #124]	@ 0x7c
c0dea9a6:	e00a      	b.n	c0dea9be <useCaseReview+0xc6>
c0dea9a8:	4818      	ldr	r0, [pc, #96]	@ (c0deaa0c <useCaseReview+0x114>)
c0dea9aa:	2102      	movs	r1, #2
c0dea9ac:	9a01      	ldr	r2, [sp, #4]
c0dea9ae:	4448      	add	r0, r9
c0dea9b0:	f880 1070 	strb.w	r1, [r0, #112]	@ 0x70
c0dea9b4:	f100 0174 	add.w	r1, r0, #116	@ 0x74
c0dea9b8:	4650      	mov	r0, sl
c0dea9ba:	f000 fa07 	bl	c0deadcc <prepareReviewLastPage>
c0dea9be:	f3ca 1000 	ubfx	r0, sl, #4, #1
c0dea9c2:	f7ff f8b7 	bl	c0de9b34 <getNbPagesForGenericContents>
c0dea9c6:	4a18      	ldr	r2, [pc, #96]	@ (c0deaa28 <useCaseReview+0x130>)
c0dea9c8:	4601      	mov	r1, r0
c0dea9ca:	2001      	movs	r0, #1
c0dea9cc:	447a      	add	r2, pc
c0dea9ce:	f7fe ffe9 	bl	c0de99a4 <prepareNavInfo>
c0dea9d2:	b10d      	cbz	r5, c0dea9d8 <useCaseReview+0xe0>
c0dea9d4:	f001 f9dd 	bl	c0debd92 <OUTLINED_FUNCTION_6>
c0dea9d8:	2000      	movs	r0, #0
c0dea9da:	2101      	movs	r1, #1
c0dea9dc:	e8bd 4dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0dea9e0:	f7ff b962 	b.w	c0de9ca8 <displayGenericContextPage>
c0dea9e4:	f01a 0007 	ands.w	r0, sl, #7
c0dea9e8:	d004      	beq.n	c0dea9f4 <useCaseReview+0xfc>
c0dea9ea:	2801      	cmp	r0, #1
c0dea9ec:	d105      	bne.n	c0dea9fa <useCaseReview+0x102>
c0dea9ee:	4b0b      	ldr	r3, [pc, #44]	@ (c0deaa1c <useCaseReview+0x124>)
c0dea9f0:	447b      	add	r3, pc
c0dea9f2:	e7ce      	b.n	c0dea992 <useCaseReview+0x9a>
c0dea9f4:	4b08      	ldr	r3, [pc, #32]	@ (c0deaa18 <useCaseReview+0x120>)
c0dea9f6:	447b      	add	r3, pc
c0dea9f8:	e7cb      	b.n	c0dea992 <useCaseReview+0x9a>
c0dea9fa:	4b09      	ldr	r3, [pc, #36]	@ (c0deaa20 <useCaseReview+0x128>)
c0dea9fc:	447b      	add	r3, pc
c0dea9fe:	e7c8      	b.n	c0dea992 <useCaseReview+0x9a>
c0deaa00:	00001bc8 	.word	0x00001bc8
c0deaa04:	00001c44 	.word	0x00001c44
c0deaa08:	000018fc 	.word	0x000018fc
c0deaa0c:	00001968 	.word	0x00001968
c0deaa10:	0000123d 	.word	0x0000123d
c0deaa14:	000043ba 	.word	0x000043ba
c0deaa18:	00003cfe 	.word	0x00003cfe
c0deaa1c:	00003cd3 	.word	0x00003cd3
c0deaa20:	0000424c 	.word	0x0000424c
c0deaa24:	00003af4 	.word	0x00003af4
c0deaa28:	00003b0e 	.word	0x00003b0e

c0deaa2c <nbgl_useCaseReviewBlindSigning>:
c0deaa2c:	b510      	push	{r4, lr}
c0deaa2e:	b086      	sub	sp, #24
c0deaa30:	9c0b      	ldr	r4, [sp, #44]	@ 0x2c
c0deaa32:	9404      	str	r4, [sp, #16]
c0deaa34:	4c06      	ldr	r4, [pc, #24]	@ (c0deaa50 <nbgl_useCaseReviewBlindSigning+0x24>)
c0deaa36:	447c      	add	r4, pc
c0deaa38:	9403      	str	r4, [sp, #12]
c0deaa3a:	9c0a      	ldr	r4, [sp, #40]	@ 0x28
c0deaa3c:	9402      	str	r4, [sp, #8]
c0deaa3e:	9c09      	ldr	r4, [sp, #36]	@ 0x24
c0deaa40:	9401      	str	r4, [sp, #4]
c0deaa42:	9c08      	ldr	r4, [sp, #32]
c0deaa44:	9400      	str	r4, [sp, #0]
c0deaa46:	f000 f805 	bl	c0deaa54 <nbgl_useCaseAdvancedReview>
c0deaa4a:	b006      	add	sp, #24
c0deaa4c:	bd10      	pop	{r4, pc}
c0deaa4e:	bf00      	nop
c0deaa50:	00005a0a 	.word	0x00005a0a

c0deaa54 <nbgl_useCaseAdvancedReview>:
c0deaa54:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0deaa58:	b088      	sub	sp, #32
c0deaa5a:	e9cd 2306 	strd	r2, r3, [sp, #24]
c0deaa5e:	460e      	mov	r6, r1
c0deaa60:	4605      	mov	r5, r0
c0deaa62:	f7fe ff89 	bl	c0de9978 <reset_callbacks_and_context>
c0deaa66:	f10d 0b48 	add.w	fp, sp, #72	@ 0x48
c0deaa6a:	482b      	ldr	r0, [pc, #172]	@ (c0deab18 <nbgl_useCaseAdvancedReview+0xc4>)
c0deaa6c:	e9dd 4810 	ldrd	r4, r8, [sp, #64]	@ 0x40
c0deaa70:	e89b 0c80 	ldmia.w	fp, {r7, sl, fp}
c0deaa74:	4448      	add	r0, r9
c0deaa76:	b127      	cbz	r7, c0deaa82 <nbgl_useCaseAdvancedReview+0x2e>
c0deaa78:	4639      	mov	r1, r7
c0deaa7a:	2220      	movs	r2, #32
c0deaa7c:	f002 fb3e 	bl	c0ded0fc <__aeabi_memcpy>
c0deaa80:	e002      	b.n	c0deaa88 <nbgl_useCaseAdvancedReview+0x34>
c0deaa82:	2120      	movs	r1, #32
c0deaa84:	f002 fb44 	bl	c0ded110 <__aeabi_memclr>
c0deaa88:	f1ba 0f00 	cmp.w	sl, #0
c0deaa8c:	d028      	beq.n	c0deaae0 <nbgl_useCaseAdvancedReview+0x8c>
c0deaa8e:	f8da 0000 	ldr.w	r0, [sl]
c0deaa92:	b928      	cbnz	r0, c0deaaa0 <nbgl_useCaseAdvancedReview+0x4c>
c0deaa94:	f8da 1014 	ldr.w	r1, [sl, #20]
c0deaa98:	b911      	cbnz	r1, c0deaaa0 <nbgl_useCaseAdvancedReview+0x4c>
c0deaa9a:	f8da 1018 	ldr.w	r1, [sl, #24]
c0deaa9e:	b1f9      	cbz	r1, c0deaae0 <nbgl_useCaseAdvancedReview+0x8c>
c0deaaa0:	491e      	ldr	r1, [pc, #120]	@ (c0deab1c <nbgl_useCaseAdvancedReview+0xc8>)
c0deaaa2:	2200      	movs	r2, #0
c0deaaa4:	4449      	add	r1, r9
c0deaaa6:	f881 203c 	strb.w	r2, [r1, #60]	@ 0x3c
c0deaaaa:	2240      	movs	r2, #64	@ 0x40
c0deaaac:	2808      	cmp	r0, #8
c0deaaae:	bf08      	it	eq
c0deaab0:	2280      	moveq	r2, #128	@ 0x80
c0deaab2:	ea42 0005 	orr.w	r0, r2, r5
c0deaab6:	9d06      	ldr	r5, [sp, #24]
c0deaab8:	9b07      	ldr	r3, [sp, #28]
c0deaaba:	e9c1 0610 	strd	r0, r6, [r1, #64]	@ 0x40
c0deaabe:	648d      	str	r5, [r1, #72]	@ 0x48
c0deaac0:	314c      	adds	r1, #76	@ 0x4c
c0deaac2:	e881 0d18 	stmia.w	r1, {r3, r4, r8, sl, fp}
c0deaac6:	f89a 1000 	ldrb.w	r1, [sl]
c0deaaca:	f011 0f16 	tst.w	r1, #22
c0deaace:	d102      	bne.n	c0deaad6 <nbgl_useCaseAdvancedReview+0x82>
c0deaad0:	f8da 1014 	ldr.w	r1, [sl, #20]
c0deaad4:	b1a9      	cbz	r1, c0deab02 <nbgl_useCaseAdvancedReview+0xae>
c0deaad6:	b008      	add	sp, #32
c0deaad8:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0deaadc:	f000 b820 	b.w	c0deab20 <displayInitialWarning>
c0deaae0:	2001      	movs	r0, #1
c0deaae2:	2100      	movs	r1, #0
c0deaae4:	e9cd 4800 	strd	r4, r8, [sp]
c0deaae8:	e9cd 7b02 	strd	r7, fp, [sp, #8]
c0deaaec:	e9cd 1004 	strd	r1, r0, [sp, #16]
c0deaaf0:	4628      	mov	r0, r5
c0deaaf2:	4631      	mov	r1, r6
c0deaaf4:	e9dd 2306 	ldrd	r2, r3, [sp, #24]
c0deaaf8:	f7ff fefe 	bl	c0dea8f8 <useCaseReview>
c0deaafc:	b008      	add	sp, #32
c0deaafe:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0deab02:	2101      	movs	r1, #1
c0deab04:	2200      	movs	r2, #0
c0deab06:	e9cd 4800 	strd	r4, r8, [sp]
c0deab0a:	e9cd 7b02 	strd	r7, fp, [sp, #8]
c0deab0e:	e9cd 2104 	strd	r2, r1, [sp, #16]
c0deab12:	4631      	mov	r1, r6
c0deab14:	462a      	mov	r2, r5
c0deab16:	e7ef      	b.n	c0deaaf8 <nbgl_useCaseAdvancedReview+0xa4>
c0deab18:	00001c44 	.word	0x00001c44
c0deab1c:	000018fc 	.word	0x000018fc

c0deab20 <displayInitialWarning>:
c0deab20:	b5f0      	push	{r4, r5, r6, r7, lr}
c0deab22:	b099      	sub	sp, #100	@ 0x64
c0deab24:	4857      	ldr	r0, [pc, #348]	@ (c0deac84 <displayInitialWarning+0x164>)
c0deab26:	a90e      	add	r1, sp, #56	@ 0x38
c0deab28:	4478      	add	r0, pc
c0deab2a:	e890 003c 	ldmia.w	r0, {r2, r3, r4, r5}
c0deab2e:	c13c      	stmia	r1!, {r2, r3, r4, r5}
c0deab30:	4855      	ldr	r0, [pc, #340]	@ (c0deac88 <displayInitialWarning+0x168>)
c0deab32:	ac0a      	add	r4, sp, #40	@ 0x28
c0deab34:	4621      	mov	r1, r4
c0deab36:	4478      	add	r0, pc
c0deab38:	e890 006c 	ldmia.w	r0, {r2, r3, r5, r6}
c0deab3c:	c16c      	stmia	r1!, {r2, r3, r5, r6}
c0deab3e:	4d4f      	ldr	r5, [pc, #316]	@ (c0deac7c <displayInitialWarning+0x15c>)
c0deab40:	eb09 0705 	add.w	r7, r9, r5
c0deab44:	6db8      	ldr	r0, [r7, #88]	@ 0x58
c0deab46:	6806      	ldr	r6, [r0, #0]
c0deab48:	2001      	movs	r0, #1
c0deab4a:	f887 0069 	strb.w	r0, [r7, #105]	@ 0x69
c0deab4e:	484f      	ldr	r0, [pc, #316]	@ (c0deac8c <displayInitialWarning+0x16c>)
c0deab50:	4478      	add	r0, pc
c0deab52:	9015      	str	r0, [sp, #84]	@ 0x54
c0deab54:	f44f 7080 	mov.w	r0, #256	@ 0x100
c0deab58:	f8ad 0048 	strh.w	r0, [sp, #72]	@ 0x48
c0deab5c:	2000      	movs	r0, #0
c0deab5e:	9016      	str	r0, [sp, #88]	@ 0x58
c0deab60:	9013      	str	r0, [sp, #76]	@ 0x4c
c0deab62:	a812      	add	r0, sp, #72	@ 0x48
c0deab64:	f7fa f9ba 	bl	c0de4edc <nbgl_layoutGet>
c0deab68:	4621      	mov	r1, r4
c0deab6a:	6638      	str	r0, [r7, #96]	@ 0x60
c0deab6c:	f7fc ff4e 	bl	c0de7a0c <nbgl_layoutAddHeader>
c0deab70:	6db8      	ldr	r0, [r7, #88]	@ 0x58
c0deab72:	f026 0409 	bic.w	r4, r6, #9
c0deab76:	6801      	ldr	r1, [r0, #0]
c0deab78:	b139      	cbz	r1, c0deab8a <displayInitialWarning+0x6a>
c0deab7a:	4845      	ldr	r0, [pc, #276]	@ (c0deac90 <displayInitialWarning+0x170>)
c0deab7c:	4945      	ldr	r1, [pc, #276]	@ (c0deac94 <displayInitialWarning+0x174>)
c0deab7e:	2c10      	cmp	r4, #16
c0deab80:	4479      	add	r1, pc
c0deab82:	4478      	add	r0, pc
c0deab84:	bf08      	it	eq
c0deab86:	4601      	moveq	r1, r0
c0deab88:	e001      	b.n	c0deab8e <displayInitialWarning+0x6e>
c0deab8a:	6a01      	ldr	r1, [r0, #32]
c0deab8c:	b131      	cbz	r1, c0deab9c <displayInitialWarning+0x7c>
c0deab8e:	eb09 0005 	add.w	r0, r9, r5
c0deab92:	2211      	movs	r2, #17
c0deab94:	2309      	movs	r3, #9
c0deab96:	6e00      	ldr	r0, [r0, #96]	@ 0x60
c0deab98:	f7fa ff68 	bl	c0de5a6c <nbgl_layoutAddTopRightButton>
c0deab9c:	eb09 0005 	add.w	r0, r9, r5
c0deaba0:	6d87      	ldr	r7, [r0, #88]	@ 0x58
c0deaba2:	6838      	ldr	r0, [r7, #0]
c0deaba4:	b188      	cbz	r0, c0deabca <displayInitialWarning+0xaa>
c0deaba6:	a801      	add	r0, sp, #4
c0deaba8:	2124      	movs	r1, #36	@ 0x24
c0deabaa:	f002 fab1 	bl	c0ded110 <__aeabi_memclr>
c0deabae:	483a      	ldr	r0, [pc, #232]	@ (c0deac98 <displayInitialWarning+0x178>)
c0deabb0:	2c10      	cmp	r4, #16
c0deabb2:	4478      	add	r0, pc
c0deabb4:	9002      	str	r0, [sp, #8]
c0deabb6:	d111      	bne.n	c0deabdc <displayInitialWarning+0xbc>
c0deabb8:	4840      	ldr	r0, [pc, #256]	@ (c0deacbc <displayInitialWarning+0x19c>)
c0deabba:	2405      	movs	r4, #5
c0deabbc:	4478      	add	r0, pc
c0deabbe:	9005      	str	r0, [sp, #20]
c0deabc0:	493f      	ldr	r1, [pc, #252]	@ (c0deacc0 <displayInitialWarning+0x1a0>)
c0deabc2:	4840      	ldr	r0, [pc, #256]	@ (c0deacc4 <displayInitialWarning+0x1a4>)
c0deabc4:	4479      	add	r1, pc
c0deabc6:	4478      	add	r0, pc
c0deabc8:	e03d      	b.n	c0deac46 <displayInitialWarning+0x126>
c0deabca:	69f9      	ldr	r1, [r7, #28]
c0deabcc:	b351      	cbz	r1, c0deac24 <displayInitialWarning+0x104>
c0deabce:	eb09 0005 	add.w	r0, r9, r5
c0deabd2:	6e00      	ldr	r0, [r0, #96]	@ 0x60
c0deabd4:	f7fc fab6 	bl	c0de7144 <nbgl_layoutAddContentCenter>
c0deabd8:	2408      	movs	r4, #8
c0deabda:	e03c      	b.n	c0deac56 <displayInitialWarning+0x136>
c0deabdc:	4828      	ldr	r0, [pc, #160]	@ (c0deac80 <displayInitialWarning+0x160>)
c0deabde:	4448      	add	r0, r9
c0deabe0:	9006      	str	r0, [sp, #24]
c0deabe2:	68f9      	ldr	r1, [r7, #12]
c0deabe4:	4b2d      	ldr	r3, [pc, #180]	@ (c0deac9c <displayInitialWarning+0x17c>)
c0deabe6:	447b      	add	r3, pc
c0deabe8:	2900      	cmp	r1, #0
c0deabea:	bf18      	it	ne
c0deabec:	460b      	movne	r3, r1
c0deabee:	4a2c      	ldr	r2, [pc, #176]	@ (c0deaca0 <displayInitialWarning+0x180>)
c0deabf0:	2180      	movs	r1, #128	@ 0x80
c0deabf2:	447a      	add	r2, pc
c0deabf4:	f001 fdf2 	bl	c0dec7dc <snprintf>
c0deabf8:	07b0      	lsls	r0, r6, #30
c0deabfa:	d403      	bmi.n	c0deac04 <displayInitialWarning+0xe4>
c0deabfc:	0770      	lsls	r0, r6, #29
c0deabfe:	d413      	bmi.n	c0deac28 <displayInitialWarning+0x108>
c0deac00:	2400      	movs	r4, #0
c0deac02:	e022      	b.n	c0deac4a <displayInitialWarning+0x12a>
c0deac04:	4827      	ldr	r0, [pc, #156]	@ (c0deaca4 <displayInitialWarning+0x184>)
c0deac06:	4478      	add	r0, pc
c0deac08:	9005      	str	r0, [sp, #20]
c0deac0a:	eb09 0005 	add.w	r0, r9, r5
c0deac0e:	6d80      	ldr	r0, [r0, #88]	@ 0x58
c0deac10:	6901      	ldr	r1, [r0, #16]
c0deac12:	4825      	ldr	r0, [pc, #148]	@ (c0deaca8 <displayInitialWarning+0x188>)
c0deac14:	4478      	add	r0, pc
c0deac16:	2900      	cmp	r1, #0
c0deac18:	bf18      	it	ne
c0deac1a:	4608      	movne	r0, r1
c0deac1c:	4923      	ldr	r1, [pc, #140]	@ (c0deacac <displayInitialWarning+0x18c>)
c0deac1e:	2405      	movs	r4, #5
c0deac20:	4479      	add	r1, pc
c0deac22:	e010      	b.n	c0deac46 <displayInitialWarning+0x126>
c0deac24:	2400      	movs	r4, #0
c0deac26:	e016      	b.n	c0deac56 <displayInitialWarning+0x136>
c0deac28:	4821      	ldr	r0, [pc, #132]	@ (c0deacb0 <displayInitialWarning+0x190>)
c0deac2a:	4478      	add	r0, pc
c0deac2c:	9005      	str	r0, [sp, #20]
c0deac2e:	eb09 0005 	add.w	r0, r9, r5
c0deac32:	6d80      	ldr	r0, [r0, #88]	@ 0x58
c0deac34:	6901      	ldr	r1, [r0, #16]
c0deac36:	481f      	ldr	r0, [pc, #124]	@ (c0deacb4 <displayInitialWarning+0x194>)
c0deac38:	4478      	add	r0, pc
c0deac3a:	2900      	cmp	r1, #0
c0deac3c:	bf18      	it	ne
c0deac3e:	4608      	movne	r0, r1
c0deac40:	491d      	ldr	r1, [pc, #116]	@ (c0deacb8 <displayInitialWarning+0x198>)
c0deac42:	2404      	movs	r4, #4
c0deac44:	4479      	add	r1, pc
c0deac46:	910f      	str	r1, [sp, #60]	@ 0x3c
c0deac48:	9007      	str	r0, [sp, #28]
c0deac4a:	eb09 0005 	add.w	r0, r9, r5
c0deac4e:	6e00      	ldr	r0, [r0, #96]	@ 0x60
c0deac50:	a901      	add	r1, sp, #4
c0deac52:	f7fc fa77 	bl	c0de7144 <nbgl_layoutAddContentCenter>
c0deac56:	eb09 0005 	add.w	r0, r9, r5
c0deac5a:	6e00      	ldr	r0, [r0, #96]	@ 0x60
c0deac5c:	a90e      	add	r1, sp, #56	@ 0x38
c0deac5e:	f7fc fbed 	bl	c0de743c <nbgl_layoutAddChoiceButtons>
c0deac62:	b114      	cbz	r4, c0deac6a <displayInitialWarning+0x14a>
c0deac64:	4620      	mov	r0, r4
c0deac66:	f7f9 ff32 	bl	c0de4ace <os_io_seph_cmd_piezo_play_tune>
c0deac6a:	eb09 0005 	add.w	r0, r9, r5
c0deac6e:	6e00      	ldr	r0, [r0, #96]	@ 0x60
c0deac70:	f7fd fb2e 	bl	c0de82d0 <nbgl_layoutDraw>
c0deac74:	f001 fd27 	bl	c0dec6c6 <nbgl_refresh>
c0deac78:	b019      	add	sp, #100	@ 0x64
c0deac7a:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0deac7c:	000018fc 	.word	0x000018fc
c0deac80:	00001a48 	.word	0x00001a48
c0deac84:	00005a68 	.word	0x00005a68
c0deac88:	00005986 	.word	0x00005986
c0deac8c:	00001155 	.word	0x00001155
c0deac90:	000032ae 	.word	0x000032ae
c0deac94:	000035f9 	.word	0x000035f9
c0deac98:	00002f27 	.word	0x00002f27
c0deac9c:	00003cd5 	.word	0x00003cd5
c0deaca0:	00004065 	.word	0x00004065
c0deaca4:	000040c3 	.word	0x000040c3
c0deaca8:	00003913 	.word	0x00003913
c0deacac:	00003d2f 	.word	0x00003d2f
c0deacb0:	00003d15 	.word	0x00003d15
c0deacb4:	00003cb3 	.word	0x00003cb3
c0deacb8:	00003b8f 	.word	0x00003b8f
c0deacbc:	00003e81 	.word	0x00003e81
c0deacc0:	00004127 	.word	0x00004127
c0deacc4:	00003da2 	.word	0x00003da2

c0deacc8 <useCaseReviewStreamingStart>:
c0deacc8:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0deaccc:	4604      	mov	r4, r0
c0deacce:	4826      	ldr	r0, [pc, #152]	@ (c0dead68 <useCaseReviewStreamingStart+0xa0>)
c0deacd0:	460d      	mov	r5, r1
c0deacd2:	2103      	movs	r1, #3
c0deacd4:	e9cd 3200 	strd	r3, r2, [sp]
c0deacd8:	f8df b098 	ldr.w	fp, [pc, #152]	@ c0dead74 <useCaseReviewStreamingStart+0xac>
c0deacdc:	f04f 0a01 	mov.w	sl, #1
c0deace0:	f809 1000 	strb.w	r1, [r9, r0]
c0deace4:	4921      	ldr	r1, [pc, #132]	@ (c0dead6c <useCaseReviewStreamingStart+0xa4>)
c0deace6:	eb09 0700 	add.w	r7, r9, r0
c0deacea:	eb09 060b 	add.w	r6, r9, fp
c0deacee:	eb09 0801 	add.w	r8, r9, r1
c0deacf2:	f8c8 502c 	str.w	r5, [r8, #44]	@ 0x2c
c0deacf6:	990a      	ldr	r1, [sp, #40]	@ 0x28
c0deacf8:	e9c8 4108 	strd	r4, r1, [r8, #32]
c0deacfc:	2138      	movs	r1, #56	@ 0x38
c0deacfe:	481e      	ldr	r0, [pc, #120]	@ (c0dead78 <useCaseReviewStreamingStart+0xb0>)
c0dead00:	4478      	add	r0, pc
c0dead02:	61b8      	str	r0, [r7, #24]
c0dead04:	2000      	movs	r0, #0
c0dead06:	6138      	str	r0, [r7, #16]
c0dead08:	4819      	ldr	r0, [pc, #100]	@ (c0dead70 <useCaseReviewStreamingStart+0xa8>)
c0dead0a:	4448      	add	r0, r9
c0dead0c:	f880 a00c 	strb.w	sl, [r0, #12]
c0dead10:	6086      	str	r6, [r0, #8]
c0dead12:	f001 f855 	bl	c0debdc0 <OUTLINED_FUNCTION_13>
c0dead16:	2100      	movs	r1, #0
c0dead18:	f809 a00b 	strb.w	sl, [r9, fp]
c0dead1c:	84b1      	strh	r1, [r6, #36]	@ 0x24
c0dead1e:	4817      	ldr	r0, [pc, #92]	@ (c0dead7c <useCaseReviewStreamingStart+0xb4>)
c0dead20:	9a00      	ldr	r2, [sp, #0]
c0dead22:	60b5      	str	r5, [r6, #8]
c0dead24:	7131      	strb	r1, [r6, #4]
c0dead26:	2500      	movs	r5, #0
c0dead28:	4478      	add	r0, pc
c0dead2a:	e9c6 2007 	strd	r2, r0, [r6, #28]
c0dead2e:	9801      	ldr	r0, [sp, #4]
c0dead30:	6170      	str	r0, [r6, #20]
c0dead32:	2000      	movs	r0, #0
c0dead34:	f000 ff2a 	bl	c0debb8c <initWarningTipBox>
c0dead38:	f3c4 1000 	ubfx	r0, r4, #4, #1
c0dead3c:	f7fe fefa 	bl	c0de9b34 <getNbPagesForGenericContents>
c0dead40:	f888 0030 	strb.w	r0, [r8, #48]	@ 0x30
c0dead44:	2001      	movs	r0, #1
c0dead46:	21ff      	movs	r1, #255	@ 0xff
c0dead48:	4a0d      	ldr	r2, [pc, #52]	@ (c0dead80 <useCaseReviewStreamingStart+0xb8>)
c0dead4a:	447a      	add	r2, pc
c0dead4c:	f7fe fe2a 	bl	c0de99a4 <prepareNavInfo>
c0dead50:	f887 5071 	strb.w	r5, [r7, #113]	@ 0x71
c0dead54:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0dead56:	b108      	cbz	r0, c0dead5c <useCaseReviewStreamingStart+0x94>
c0dead58:	f001 f81b 	bl	c0debd92 <OUTLINED_FUNCTION_6>
c0dead5c:	2000      	movs	r0, #0
c0dead5e:	2101      	movs	r1, #1
c0dead60:	e8bd 4dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0dead64:	f7fe bfa0 	b.w	c0de9ca8 <displayGenericContextPage>
c0dead68:	00001bc8 	.word	0x00001bc8
c0dead6c:	00001c44 	.word	0x00001c44
c0dead70:	000018fc 	.word	0x000018fc
c0dead74:	00001968 	.word	0x00001968
c0dead78:	00000081 	.word	0x00000081
c0dead7c:	00003fdc 	.word	0x00003fdc
c0dead80:	00003790 	.word	0x00003790

c0dead84 <bundleNavReviewStreamingChoice>:
c0dead84:	b580      	push	{r7, lr}
c0dead86:	b178      	cbz	r0, c0deada8 <bundleNavReviewStreamingChoice+0x24>
c0dead88:	480d      	ldr	r0, [pc, #52]	@ (c0deadc0 <bundleNavReviewStreamingChoice+0x3c>)
c0dead8a:	f819 0000 	ldrb.w	r0, [r9, r0]
c0dead8e:	2802      	cmp	r0, #2
c0dead90:	d003      	beq.n	c0dead9a <bundleNavReviewStreamingChoice+0x16>
c0dead92:	480c      	ldr	r0, [pc, #48]	@ (c0deadc4 <bundleNavReviewStreamingChoice+0x40>)
c0dead94:	4478      	add	r0, pc
c0dead96:	f000 f955 	bl	c0deb044 <nbgl_useCaseSpinner>
c0dead9a:	4808      	ldr	r0, [pc, #32]	@ (c0deadbc <bundleNavReviewStreamingChoice+0x38>)
c0dead9c:	4448      	add	r0, r9
c0dead9e:	6a41      	ldr	r1, [r0, #36]	@ 0x24
c0deada0:	2001      	movs	r0, #1
c0deada2:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0deada6:	4708      	bx	r1
c0deada8:	4804      	ldr	r0, [pc, #16]	@ (c0deadbc <bundleNavReviewStreamingChoice+0x38>)
c0deadaa:	4448      	add	r0, r9
c0deadac:	6a00      	ldr	r0, [r0, #32]
c0deadae:	4906      	ldr	r1, [pc, #24]	@ (c0deadc8 <bundleNavReviewStreamingChoice+0x44>)
c0deadb0:	4479      	add	r1, pc
c0deadb2:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0deadb6:	f000 bf47 	b.w	c0debc48 <bundleNavReviewAskRejectionConfirmation>
c0deadba:	bf00      	nop
c0deadbc:	00001c44 	.word	0x00001c44
c0deadc0:	00001968 	.word	0x00001968
c0deadc4:	0000370a 	.word	0x0000370a
c0deadc8:	00000f95 	.word	0x00000f95

c0deadcc <prepareReviewLastPage>:
c0deadcc:	b13b      	cbz	r3, c0deadde <prepareReviewLastPage+0x12>
c0deadce:	200b      	movs	r0, #11
c0deadd0:	7308      	strb	r0, [r1, #12]
c0deadd2:	480d      	ldr	r0, [pc, #52]	@ (c0deae08 <prepareReviewLastPage+0x3c>)
c0deadd4:	e9c1 3200 	strd	r3, r2, [r1]
c0deadd8:	4478      	add	r0, pc
c0deadda:	6088      	str	r0, [r1, #8]
c0deaddc:	4770      	bx	lr
c0deadde:	f010 0007 	ands.w	r0, r0, #7
c0deade2:	d004      	beq.n	c0deadee <prepareReviewLastPage+0x22>
c0deade4:	2801      	cmp	r0, #1
c0deade6:	d105      	bne.n	c0deadf4 <prepareReviewLastPage+0x28>
c0deade8:	4b05      	ldr	r3, [pc, #20]	@ (c0deae00 <prepareReviewLastPage+0x34>)
c0deadea:	447b      	add	r3, pc
c0deadec:	e7ef      	b.n	c0deadce <prepareReviewLastPage+0x2>
c0deadee:	4b03      	ldr	r3, [pc, #12]	@ (c0deadfc <prepareReviewLastPage+0x30>)
c0deadf0:	447b      	add	r3, pc
c0deadf2:	e7ec      	b.n	c0deadce <prepareReviewLastPage+0x2>
c0deadf4:	4b03      	ldr	r3, [pc, #12]	@ (c0deae04 <prepareReviewLastPage+0x38>)
c0deadf6:	447b      	add	r3, pc
c0deadf8:	e7e9      	b.n	c0deadce <prepareReviewLastPage+0x2>
c0deadfa:	bf00      	nop
c0deadfc:	00003904 	.word	0x00003904
c0deae00:	000038d9 	.word	0x000038d9
c0deae04:	00003e52 	.word	0x00003e52
c0deae08:	000036e2 	.word	0x000036e2

c0deae0c <prepareAddressConfirmationPages>:
c0deae0c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0deae10:	b08a      	sub	sp, #40	@ 0x28
c0deae12:	4688      	mov	r8, r1
c0deae14:	4950      	ldr	r1, [pc, #320]	@ (c0deaf58 <prepareAddressConfirmationPages+0x14c>)
c0deae16:	f8df a13c 	ldr.w	sl, [pc, #316]	@ c0deaf54 <prepareAddressConfirmationPages+0x148>
c0deae1a:	4693      	mov	fp, r2
c0deae1c:	4479      	add	r1, pc
c0deae1e:	f849 100a 	str.w	r1, [r9, sl]
c0deae22:	494e      	ldr	r1, [pc, #312]	@ (c0deaf5c <prepareAddressConfirmationPages+0x150>)
c0deae24:	4479      	add	r1, pc
c0deae26:	6191      	str	r1, [r2, #24]
c0deae28:	2106      	movs	r1, #6
c0deae2a:	7011      	strb	r1, [r2, #0]
c0deae2c:	2201      	movs	r2, #1
c0deae2e:	eb09 010a 	add.w	r1, r9, sl
c0deae32:	f1b8 0f00 	cmp.w	r8, #0
c0deae36:	f881 2034 	strb.w	r2, [r1, #52]	@ 0x34
c0deae3a:	6048      	str	r0, [r1, #4]
c0deae3c:	d01f      	beq.n	c0deae7e <prepareAddressConfirmationPages+0x72>
c0deae3e:	f898 2008 	ldrb.w	r2, [r8, #8]
c0deae42:	2a02      	cmp	r2, #2
c0deae44:	d81b      	bhi.n	c0deae7e <prepareAddressConfirmationPages+0x72>
c0deae46:	2001      	movs	r0, #1
c0deae48:	2100      	movs	r1, #0
c0deae4a:	f04f 0c00 	mov.w	ip, #0
c0deae4e:	9303      	str	r3, [sp, #12]
c0deae50:	4594      	cmp	ip, r2
c0deae52:	d219      	bcs.n	c0deae88 <prepareAddressConfirmationPages+0x7c>
c0deae54:	f8d8 0000 	ldr.w	r0, [r8]
c0deae58:	eb09 030a 	add.w	r3, r9, sl
c0deae5c:	f10c 0c01 	add.w	ip, ip, #1
c0deae60:	185c      	adds	r4, r3, r1
c0deae62:	4408      	add	r0, r1
c0deae64:	3410      	adds	r4, #16
c0deae66:	3110      	adds	r1, #16
c0deae68:	e890 00e4 	ldmia.w	r0, {r2, r5, r6, r7}
c0deae6c:	c4e4      	stmia	r4!, {r2, r5, r6, r7}
c0deae6e:	f893 0034 	ldrb.w	r0, [r3, #52]	@ 0x34
c0deae72:	3001      	adds	r0, #1
c0deae74:	f883 0034 	strb.w	r0, [r3, #52]	@ 0x34
c0deae78:	f898 2008 	ldrb.w	r2, [r8, #8]
c0deae7c:	e7e8      	b.n	c0deae50 <prepareAddressConfirmationPages+0x44>
c0deae7e:	2000      	movs	r0, #0
c0deae80:	f8cb 001c 	str.w	r0, [fp, #28]
c0deae84:	2001      	movs	r0, #1
c0deae86:	e01c      	b.n	c0deaec2 <prepareAddressConfirmationPages+0xb6>
c0deae88:	46c4      	mov	ip, r8
c0deae8a:	a905      	add	r1, sp, #20
c0deae8c:	e89c 00f4 	ldmia.w	ip, {r2, r4, r5, r6, r7}
c0deae90:	460b      	mov	r3, r1
c0deae92:	c3f4      	stmia	r3!, {r2, r4, r5, r6, r7}
c0deae94:	f10d 0213 	add.w	r2, sp, #19
c0deae98:	b2c7      	uxtb	r7, r0
c0deae9a:	eb09 040a 	add.w	r4, r9, sl
c0deae9e:	f88d 001c 	strb.w	r0, [sp, #28]
c0deaea2:	2301      	movs	r3, #1
c0deaea4:	9202      	str	r2, [sp, #8]
c0deaea6:	4638      	mov	r0, r7
c0deaea8:	2200      	movs	r2, #0
c0deaeaa:	9405      	str	r4, [sp, #20]
c0deaeac:	e9cd 3300 	strd	r3, r3, [sp]
c0deaeb0:	2300      	movs	r3, #0
c0deaeb2:	f7fe fb6e 	bl	c0de9592 <getNbTagValuesInPage>
c0deaeb6:	4287      	cmp	r7, r0
c0deaeb8:	bf88      	it	hi
c0deaeba:	2001      	movhi	r0, #1
c0deaebc:	9b03      	ldr	r3, [sp, #12]
c0deaebe:	f884 0034 	strb.w	r0, [r4, #52]	@ 0x34
c0deaec2:	f640 1107 	movw	r1, #2311	@ 0x907
c0deaec6:	f88b 000c 	strb.w	r0, [fp, #12]
c0deaeca:	f8ab 1020 	strh.w	r1, [fp, #32]
c0deaece:	2100      	movs	r1, #0
c0deaed0:	f1b8 0f00 	cmp.w	r8, #0
c0deaed4:	f8ab 1010 	strh.w	r1, [fp, #16]
c0deaed8:	f88b 100e 	strb.w	r1, [fp, #14]
c0deaedc:	eb09 010a 	add.w	r1, r9, sl
c0deaee0:	f8cb 1004 	str.w	r1, [fp, #4]
c0deaee4:	d003      	beq.n	c0deaeee <prepareAddressConfirmationPages+0xe2>
c0deaee6:	f898 1008 	ldrb.w	r1, [r8, #8]
c0deaeea:	4288      	cmp	r0, r1
c0deaeec:	d907      	bls.n	c0deaefe <prepareAddressConfirmationPages+0xf2>
c0deaeee:	200b      	movs	r0, #11
c0deaef0:	f88b 002c 	strb.w	r0, [fp, #44]	@ 0x2c
c0deaef4:	481c      	ldr	r0, [pc, #112]	@ (c0deaf68 <prepareAddressConfirmationPages+0x15c>)
c0deaef6:	4478      	add	r0, pc
c0deaef8:	f8cb 0024 	str.w	r0, [fp, #36]	@ 0x24
c0deaefc:	e027      	b.n	c0deaf4e <prepareAddressConfirmationPages+0x142>
c0deaefe:	2000      	movs	r0, #0
c0deaf00:	f8cb 0024 	str.w	r0, [fp, #36]	@ 0x24
c0deaf04:	4916      	ldr	r1, [pc, #88]	@ (c0deaf60 <prepareAddressConfirmationPages+0x154>)
c0deaf06:	4479      	add	r1, pc
c0deaf08:	f8cb 101c 	str.w	r1, [fp, #28]
c0deaf0c:	210b      	movs	r1, #11
c0deaf0e:	f883 102c 	strb.w	r1, [r3, #44]	@ 0x2c
c0deaf12:	2106      	movs	r1, #6
c0deaf14:	7019      	strb	r1, [r3, #0]
c0deaf16:	2109      	movs	r1, #9
c0deaf18:	f883 1021 	strb.w	r1, [r3, #33]	@ 0x21
c0deaf1c:	4911      	ldr	r1, [pc, #68]	@ (c0deaf64 <prepareAddressConfirmationPages+0x158>)
c0deaf1e:	e9c3 0006 	strd	r0, r0, [r3, #24]
c0deaf22:	1d18      	adds	r0, r3, #4
c0deaf24:	4479      	add	r1, pc
c0deaf26:	6259      	str	r1, [r3, #36]	@ 0x24
c0deaf28:	4641      	mov	r1, r8
c0deaf2a:	e891 00f4 	ldmia.w	r1, {r2, r4, r5, r6, r7}
c0deaf2e:	c0f4      	stmia	r0!, {r2, r4, r5, r6, r7}
c0deaf30:	eb09 000a 	add.w	r0, r9, sl
c0deaf34:	f898 1008 	ldrb.w	r1, [r8, #8]
c0deaf38:	f890 0034 	ldrb.w	r0, [r0, #52]	@ 0x34
c0deaf3c:	1a09      	subs	r1, r1, r0
c0deaf3e:	3101      	adds	r1, #1
c0deaf40:	7319      	strb	r1, [r3, #12]
c0deaf42:	f8d8 1000 	ldr.w	r1, [r8]
c0deaf46:	eb01 1000 	add.w	r0, r1, r0, lsl #4
c0deaf4a:	3810      	subs	r0, #16
c0deaf4c:	6058      	str	r0, [r3, #4]
c0deaf4e:	b00a      	add	sp, #40	@ 0x28
c0deaf50:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0deaf54:	00001a10 	.word	0x00001a10
c0deaf58:	00003c7b 	.word	0x00003c7b
c0deaf5c:	00003355 	.word	0x00003355
c0deaf60:	00003633 	.word	0x00003633
c0deaf64:	00003e78 	.word	0x00003e78
c0deaf68:	00003ea6 	.word	0x00003ea6

c0deaf6c <nbgl_useCaseAddressReview>:
c0deaf6c:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0deaf70:	4e2d      	ldr	r6, [pc, #180]	@ (c0deb028 <nbgl_useCaseAddressReview+0xbc>)
c0deaf72:	9301      	str	r3, [sp, #4]
c0deaf74:	4617      	mov	r7, r2
c0deaf76:	e9cd 0102 	strd	r0, r1, [sp, #8]
c0deaf7a:	eb09 0406 	add.w	r4, r9, r6
c0deaf7e:	f7fe fcfb 	bl	c0de9978 <reset_callbacks_and_context>
c0deaf82:	6b20      	ldr	r0, [r4, #48]	@ 0x30
c0deaf84:	e9dd 540c 	ldrd	r5, r4, [sp, #48]	@ 0x30
c0deaf88:	b108      	cbz	r0, c0deaf8e <nbgl_useCaseAddressReview+0x22>
c0deaf8a:	f7fd f9cf 	bl	c0de832c <nbgl_layoutRelease>
c0deaf8e:	eb09 0006 	add.w	r0, r9, r6
c0deaf92:	2138      	movs	r1, #56	@ 0x38
c0deaf94:	f002 f8bc 	bl	c0ded110 <__aeabi_memclr>
c0deaf98:	4824      	ldr	r0, [pc, #144]	@ (c0deb02c <nbgl_useCaseAddressReview+0xc0>)
c0deaf9a:	2602      	movs	r6, #2
c0deaf9c:	f04f 0a00 	mov.w	sl, #0
c0deafa0:	f8df b094 	ldr.w	fp, [pc, #148]	@ c0deb038 <nbgl_useCaseAddressReview+0xcc>
c0deafa4:	21a8      	movs	r1, #168	@ 0xa8
c0deafa6:	f809 6000 	strb.w	r6, [r9, r0]
c0deafaa:	4448      	add	r0, r9
c0deafac:	6184      	str	r4, [r0, #24]
c0deafae:	f8c0 a010 	str.w	sl, [r0, #16]
c0deafb2:	481f      	ldr	r0, [pc, #124]	@ (c0deb030 <nbgl_useCaseAddressReview+0xc4>)
c0deafb4:	eb09 040b 	add.w	r4, r9, fp
c0deafb8:	4448      	add	r0, r9
c0deafba:	6206      	str	r6, [r0, #32]
c0deafbc:	481d      	ldr	r0, [pc, #116]	@ (c0deb034 <nbgl_useCaseAddressReview+0xc8>)
c0deafbe:	eb09 0800 	add.w	r8, r9, r0
c0deafc2:	4620      	mov	r0, r4
c0deafc4:	f8c8 4008 	str.w	r4, [r8, #8]
c0deafc8:	f002 f8a2 	bl	c0ded110 <__aeabi_memclr>
c0deafcc:	2001      	movs	r0, #1
c0deafce:	60a7      	str	r7, [r4, #8]
c0deafd0:	f884 a026 	strb.w	sl, [r4, #38]	@ 0x26
c0deafd4:	f104 0238 	add.w	r2, r4, #56	@ 0x38
c0deafd8:	f104 0370 	add.w	r3, r4, #112	@ 0x70
c0deafdc:	f809 000b 	strb.w	r0, [r9, fp]
c0deafe0:	4816      	ldr	r0, [pc, #88]	@ (c0deb03c <nbgl_useCaseAddressReview+0xd0>)
c0deafe2:	9901      	ldr	r1, [sp, #4]
c0deafe4:	4478      	add	r0, pc
c0deafe6:	e9c4 1a05 	strd	r1, sl, [r4, #20]
c0deafea:	e9c4 5007 	strd	r5, r0, [r4, #28]
c0deafee:	e9dd 0102 	ldrd	r0, r1, [sp, #8]
c0deaff2:	f7ff ff0b 	bl	c0deae0c <prepareAddressConfirmationPages>
c0deaff6:	f894 0070 	ldrb.w	r0, [r4, #112]	@ 0x70
c0deaffa:	2806      	cmp	r0, #6
c0deaffc:	bf08      	it	eq
c0deaffe:	2603      	moveq	r6, #3
c0deb000:	f888 600c 	strb.w	r6, [r8, #12]
c0deb004:	f000 fec2 	bl	c0debd8c <OUTLINED_FUNCTION_5>
c0deb008:	4a0d      	ldr	r2, [pc, #52]	@ (c0deb040 <nbgl_useCaseAddressReview+0xd4>)
c0deb00a:	4601      	mov	r1, r0
c0deb00c:	2001      	movs	r0, #1
c0deb00e:	447a      	add	r2, pc
c0deb010:	f7fe fcc8 	bl	c0de99a4 <prepareNavInfo>
c0deb014:	f000 febd 	bl	c0debd92 <OUTLINED_FUNCTION_6>
c0deb018:	2000      	movs	r0, #0
c0deb01a:	2101      	movs	r1, #1
c0deb01c:	b004      	add	sp, #16
c0deb01e:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0deb022:	f7fe be41 	b.w	c0de9ca8 <displayGenericContextPage>
c0deb026:	bf00      	nop
c0deb028:	00001a10 	.word	0x00001a10
c0deb02c:	00001bc8 	.word	0x00001bc8
c0deb030:	00001c44 	.word	0x00001c44
c0deb034:	000018fc 	.word	0x000018fc
c0deb038:	00001968 	.word	0x00001968
c0deb03c:	000035c4 	.word	0x000035c4
c0deb040:	0000383f 	.word	0x0000383f

c0deb044 <nbgl_useCaseSpinner>:
c0deb044:	b5f0      	push	{r4, r5, r6, r7, lr}
c0deb046:	b087      	sub	sp, #28
c0deb048:	4e1f      	ldr	r6, [pc, #124]	@ (c0deb0c8 <nbgl_useCaseSpinner+0x84>)
c0deb04a:	4604      	mov	r4, r0
c0deb04c:	f819 0006 	ldrb.w	r0, [r9, r6]
c0deb050:	2801      	cmp	r0, #1
c0deb052:	d114      	bne.n	c0deb07e <nbgl_useCaseSpinner+0x3a>
c0deb054:	eb09 0006 	add.w	r0, r9, r6
c0deb058:	7841      	ldrb	r1, [r0, #1]
c0deb05a:	3101      	adds	r1, #1
c0deb05c:	b2ca      	uxtb	r2, r1
c0deb05e:	3a04      	subs	r2, #4
c0deb060:	bf18      	it	ne
c0deb062:	460a      	movne	r2, r1
c0deb064:	7042      	strb	r2, [r0, #1]
c0deb066:	6b00      	ldr	r0, [r0, #48]	@ 0x30
c0deb068:	b2d3      	uxtb	r3, r2
c0deb06a:	4621      	mov	r1, r4
c0deb06c:	2200      	movs	r2, #0
c0deb06e:	f7fd f88b 	bl	c0de8188 <nbgl_layoutUpdateSpinner>
c0deb072:	2802      	cmp	r0, #2
c0deb074:	d022      	beq.n	c0deb0bc <nbgl_useCaseSpinner+0x78>
c0deb076:	2801      	cmp	r0, #1
c0deb078:	d11e      	bne.n	c0deb0b8 <nbgl_useCaseSpinner+0x74>
c0deb07a:	2004      	movs	r0, #4
c0deb07c:	e01f      	b.n	c0deb0be <nbgl_useCaseSpinner+0x7a>
c0deb07e:	eb09 0506 	add.w	r5, r9, r6
c0deb082:	216c      	movs	r1, #108	@ 0x6c
c0deb084:	4628      	mov	r0, r5
c0deb086:	f002 f843 	bl	c0ded110 <__aeabi_memclr>
c0deb08a:	2701      	movs	r7, #1
c0deb08c:	211c      	movs	r1, #28
c0deb08e:	f809 7006 	strb.w	r7, [r9, r6]
c0deb092:	466e      	mov	r6, sp
c0deb094:	f000 fe94 	bl	c0debdc0 <OUTLINED_FUNCTION_13>
c0deb098:	4630      	mov	r0, r6
c0deb09a:	f88d 7001 	strb.w	r7, [sp, #1]
c0deb09e:	f7f9 ff1d 	bl	c0de4edc <nbgl_layoutGet>
c0deb0a2:	786b      	ldrb	r3, [r5, #1]
c0deb0a4:	4621      	mov	r1, r4
c0deb0a6:	2200      	movs	r2, #0
c0deb0a8:	6328      	str	r0, [r5, #48]	@ 0x30
c0deb0aa:	f7fc ff0d 	bl	c0de7ec8 <nbgl_layoutAddSpinner>
c0deb0ae:	6b28      	ldr	r0, [r5, #48]	@ 0x30
c0deb0b0:	f7fd f90e 	bl	c0de82d0 <nbgl_layoutDraw>
c0deb0b4:	f000 fe5e 	bl	c0debd74 <OUTLINED_FUNCTION_3>
c0deb0b8:	b007      	add	sp, #28
c0deb0ba:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0deb0bc:	2001      	movs	r0, #1
c0deb0be:	b007      	add	sp, #28
c0deb0c0:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0deb0c4:	f001 bb04 	b.w	c0dec6d0 <nbgl_refreshSpecial>
c0deb0c8:	000018fc 	.word	0x000018fc

c0deb0cc <getContentAtIdx>:
c0deb0cc:	b570      	push	{r4, r5, r6, lr}
c0deb0ce:	4605      	mov	r5, r0
c0deb0d0:	2000      	movs	r0, #0
c0deb0d2:	2d00      	cmp	r5, #0
c0deb0d4:	d415      	bmi.n	c0deb102 <getContentAtIdx+0x36>
c0deb0d6:	4e11      	ldr	r6, [pc, #68]	@ (c0deb11c <getContentAtIdx+0x50>)
c0deb0d8:	460c      	mov	r4, r1
c0deb0da:	eb09 0106 	add.w	r1, r9, r6
c0deb0de:	7b09      	ldrb	r1, [r1, #12]
c0deb0e0:	428d      	cmp	r5, r1
c0deb0e2:	da0e      	bge.n	c0deb102 <getContentAtIdx+0x36>
c0deb0e4:	eb09 0006 	add.w	r0, r9, r6
c0deb0e8:	7900      	ldrb	r0, [r0, #4]
c0deb0ea:	b158      	cbz	r0, c0deb104 <getContentAtIdx+0x38>
c0deb0ec:	4620      	mov	r0, r4
c0deb0ee:	2138      	movs	r1, #56	@ 0x38
c0deb0f0:	f002 f80e 	bl	c0ded110 <__aeabi_memclr>
c0deb0f4:	eb09 0006 	add.w	r0, r9, r6
c0deb0f8:	4621      	mov	r1, r4
c0deb0fa:	6882      	ldr	r2, [r0, #8]
c0deb0fc:	b2e8      	uxtb	r0, r5
c0deb0fe:	4790      	blx	r2
c0deb100:	4620      	mov	r0, r4
c0deb102:	bd70      	pop	{r4, r5, r6, pc}
c0deb104:	eb09 0006 	add.w	r0, r9, r6
c0deb108:	ebc5 01c5 	rsb	r1, r5, r5, lsl #3
c0deb10c:	6880      	ldr	r0, [r0, #8]
c0deb10e:	eb00 00c1 	add.w	r0, r0, r1, lsl #3
c0deb112:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0deb116:	f001 bcf3 	b.w	c0decb00 <pic>
c0deb11a:	bf00      	nop
c0deb11c:	000018fc 	.word	0x000018fc

c0deb120 <getContentNbElement>:
c0deb120:	7801      	ldrb	r1, [r0, #0]
c0deb122:	290a      	cmp	r1, #10
c0deb124:	d00b      	beq.n	c0deb13e <getContentNbElement+0x1e>
c0deb126:	2906      	cmp	r1, #6
c0deb128:	d009      	beq.n	c0deb13e <getContentNbElement+0x1e>
c0deb12a:	2907      	cmp	r1, #7
c0deb12c:	d009      	beq.n	c0deb142 <getContentNbElement+0x22>
c0deb12e:	2908      	cmp	r1, #8
c0deb130:	d009      	beq.n	c0deb146 <getContentNbElement+0x26>
c0deb132:	2909      	cmp	r1, #9
c0deb134:	d009      	beq.n	c0deb14a <getContentNbElement+0x2a>
c0deb136:	2904      	cmp	r1, #4
c0deb138:	bf1c      	itt	ne
c0deb13a:	2001      	movne	r0, #1
c0deb13c:	4770      	bxne	lr
c0deb13e:	7b00      	ldrb	r0, [r0, #12]
c0deb140:	4770      	bx	lr
c0deb142:	7a00      	ldrb	r0, [r0, #8]
c0deb144:	4770      	bx	lr
c0deb146:	7c00      	ldrb	r0, [r0, #16]
c0deb148:	4770      	bx	lr
c0deb14a:	7a40      	ldrb	r0, [r0, #9]
c0deb14c:	4770      	bx	lr
	...

c0deb150 <genericContextComputeNextPageParams>:
c0deb150:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0deb154:	f8df 810c 	ldr.w	r8, [pc, #268]	@ c0deb264 <genericContextComputeNextPageParams+0x114>
c0deb158:	4682      	mov	sl, r0
c0deb15a:	4616      	mov	r6, r2
c0deb15c:	460d      	mov	r5, r1
c0deb15e:	f10d 0107 	add.w	r1, sp, #7
c0deb162:	461a      	mov	r2, r3
c0deb164:	eb09 0008 	add.w	r0, r9, r8
c0deb168:	7c04      	ldrb	r4, [r0, #16]
c0deb16a:	7c87      	ldrb	r7, [r0, #18]
c0deb16c:	4650      	mov	r0, sl
c0deb16e:	f000 f881 	bl	c0deb274 <genericContextGetPageInfo>
c0deb172:	f89d 0007 	ldrb.w	r0, [sp, #7]
c0deb176:	f8df b0f0 	ldr.w	fp, [pc, #240]	@ c0deb268 <genericContextComputeNextPageParams+0x118>
c0deb17a:	7030      	strb	r0, [r6, #0]
c0deb17c:	eb09 010b 	add.w	r1, r9, fp
c0deb180:	f891 1060 	ldrb.w	r1, [r1, #96]	@ 0x60
c0deb184:	4551      	cmp	r1, sl
c0deb186:	d219      	bcs.n	c0deb1bc <genericContextComputeNextPageParams+0x6c>
c0deb188:	4b38      	ldr	r3, [pc, #224]	@ (c0deb26c <genericContextComputeNextPageParams+0x11c>)
c0deb18a:	084e      	lsrs	r6, r1, #1
c0deb18c:	2204      	movs	r2, #4
c0deb18e:	ea02 0281 	and.w	r2, r2, r1, lsl #2
c0deb192:	444b      	add	r3, r9
c0deb194:	5d9b      	ldrb	r3, [r3, r6]
c0deb196:	fa23 f202 	lsr.w	r2, r3, r2
c0deb19a:	2300      	movs	r3, #0
c0deb19c:	f002 0207 	and.w	r2, r2, #7
c0deb1a0:	4417      	add	r7, r2
c0deb1a2:	eb09 0208 	add.w	r2, r9, r8
c0deb1a6:	7c52      	ldrb	r2, [r2, #17]
c0deb1a8:	4297      	cmp	r7, r2
c0deb1aa:	bf28      	it	cs
c0deb1ac:	2301      	movcs	r3, #1
c0deb1ae:	2a00      	cmp	r2, #0
c0deb1b0:	bf18      	it	ne
c0deb1b2:	2201      	movne	r2, #1
c0deb1b4:	401a      	ands	r2, r3
c0deb1b6:	bf18      	it	ne
c0deb1b8:	2700      	movne	r7, #0
c0deb1ba:	4414      	add	r4, r2
c0deb1bc:	4551      	cmp	r1, sl
c0deb1be:	d905      	bls.n	c0deb1cc <genericContextComputeNextPageParams+0x7c>
c0deb1c0:	1a3f      	subs	r7, r7, r0
c0deb1c2:	f1b7 3fff 	cmp.w	r7, #4294967295	@ 0xffffffff
c0deb1c6:	bfdc      	itt	le
c0deb1c8:	4247      	negle	r7, r0
c0deb1ca:	3c01      	suble	r4, #1
c0deb1cc:	b2e6      	uxtb	r6, r4
c0deb1ce:	2eff      	cmp	r6, #255	@ 0xff
c0deb1d0:	d014      	beq.n	c0deb1fc <genericContextComputeNextPageParams+0xac>
c0deb1d2:	eb09 0108 	add.w	r1, r9, r8
c0deb1d6:	b260      	sxtb	r0, r4
c0deb1d8:	7b09      	ldrb	r1, [r1, #12]
c0deb1da:	4288      	cmp	r0, r1
c0deb1dc:	d108      	bne.n	c0deb1f0 <genericContextComputeNextPageParams+0xa0>
c0deb1de:	eb09 0108 	add.w	r1, r9, r8
c0deb1e2:	7d09      	ldrb	r1, [r1, #20]
c0deb1e4:	b121      	cbz	r1, c0deb1f0 <genericContextComputeNextPageParams+0xa0>
c0deb1e6:	4822      	ldr	r0, [pc, #136]	@ (c0deb270 <genericContextComputeNextPageParams+0x120>)
c0deb1e8:	4448      	add	r0, r9
c0deb1ea:	f100 0538 	add.w	r5, r0, #56	@ 0x38
c0deb1ee:	e00d      	b.n	c0deb20c <genericContextComputeNextPageParams+0xbc>
c0deb1f0:	4629      	mov	r1, r5
c0deb1f2:	f7ff ff6b 	bl	c0deb0cc <getContentAtIdx>
c0deb1f6:	4605      	mov	r5, r0
c0deb1f8:	b940      	cbnz	r0, c0deb20c <genericContextComputeNextPageParams+0xbc>
c0deb1fa:	e02e      	b.n	c0deb25a <genericContextComputeNextPageParams+0x10a>
c0deb1fc:	eb09 0008 	add.w	r0, r9, r8
c0deb200:	7cc0      	ldrb	r0, [r0, #19]
c0deb202:	2800      	cmp	r0, #0
c0deb204:	d0e5      	beq.n	c0deb1d2 <genericContextComputeNextPageParams+0x82>
c0deb206:	481a      	ldr	r0, [pc, #104]	@ (c0deb270 <genericContextComputeNextPageParams+0x120>)
c0deb208:	eb09 0500 	add.w	r5, r9, r0
c0deb20c:	eb09 0008 	add.w	r0, r9, r8
c0deb210:	7c00      	ldrb	r0, [r0, #16]
c0deb212:	4286      	cmp	r6, r0
c0deb214:	d103      	bne.n	c0deb21e <genericContextComputeNextPageParams+0xce>
c0deb216:	eb09 0008 	add.w	r0, r9, r8
c0deb21a:	7c40      	ldrb	r0, [r0, #17]
c0deb21c:	b988      	cbnz	r0, c0deb242 <genericContextComputeNextPageParams+0xf2>
c0deb21e:	eb09 0608 	add.w	r6, r9, r8
c0deb222:	4628      	mov	r0, r5
c0deb224:	7434      	strb	r4, [r6, #16]
c0deb226:	f7ff ff7b 	bl	c0deb120 <getContentNbElement>
c0deb22a:	7470      	strb	r0, [r6, #17]
c0deb22c:	6b68      	ldr	r0, [r5, #52]	@ 0x34
c0deb22e:	eb09 040b 	add.w	r4, r9, fp
c0deb232:	f001 fc65 	bl	c0decb00 <pic>
c0deb236:	62e0      	str	r0, [r4, #44]	@ 0x2c
c0deb238:	7c70      	ldrb	r0, [r6, #17]
c0deb23a:	f1b7 3fff 	cmp.w	r7, #4294967295	@ 0xffffffff
c0deb23e:	dc02      	bgt.n	c0deb246 <genericContextComputeNextPageParams+0xf6>
c0deb240:	4407      	add	r7, r0
c0deb242:	2f00      	cmp	r7, #0
c0deb244:	d409      	bmi.n	c0deb25a <genericContextComputeNextPageParams+0x10a>
c0deb246:	4287      	cmp	r7, r0
c0deb248:	d207      	bcs.n	c0deb25a <genericContextComputeNextPageParams+0x10a>
c0deb24a:	eb09 000b 	add.w	r0, r9, fp
c0deb24e:	f880 a060 	strb.w	sl, [r0, #96]	@ 0x60
c0deb252:	eb09 0008 	add.w	r0, r9, r8
c0deb256:	7487      	strb	r7, [r0, #18]
c0deb258:	e000      	b.n	c0deb25c <genericContextComputeNextPageParams+0x10c>
c0deb25a:	2500      	movs	r5, #0
c0deb25c:	4628      	mov	r0, r5
c0deb25e:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0deb262:	bf00      	nop
c0deb264:	000018fc 	.word	0x000018fc
c0deb268:	00001bc8 	.word	0x00001bc8
c0deb26c:	00001ac8 	.word	0x00001ac8
c0deb270:	00001968 	.word	0x00001968

c0deb274 <genericContextGetPageInfo>:
c0deb274:	b510      	push	{r4, lr}
c0deb276:	4c08      	ldr	r4, [pc, #32]	@ (c0deb298 <genericContextGetPageInfo+0x24>)
c0deb278:	2304      	movs	r3, #4
c0deb27a:	ea03 0380 	and.w	r3, r3, r0, lsl #2
c0deb27e:	0840      	lsrs	r0, r0, #1
c0deb280:	444c      	add	r4, r9
c0deb282:	5c20      	ldrb	r0, [r4, r0]
c0deb284:	40d8      	lsrs	r0, r3
c0deb286:	b111      	cbz	r1, c0deb28e <genericContextGetPageInfo+0x1a>
c0deb288:	f000 0307 	and.w	r3, r0, #7
c0deb28c:	700b      	strb	r3, [r1, #0]
c0deb28e:	b112      	cbz	r2, c0deb296 <genericContextGetPageInfo+0x22>
c0deb290:	f3c0 00c0 	ubfx	r0, r0, #3, #1
c0deb294:	7010      	strb	r0, [r2, #0]
c0deb296:	bd10      	pop	{r4, pc}
c0deb298:	00001ac8 	.word	0x00001ac8

c0deb29c <bundleNavStartSettings>:
c0deb29c:	2000      	movs	r0, #0
c0deb29e:	f7fe bf3f 	b.w	c0dea120 <bundleNavStartSettingsAtPage>
	...

c0deb2a4 <displayFullValuePage>:
c0deb2a4:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0deb2a8:	b092      	sub	sp, #72	@ 0x48
c0deb2aa:	460d      	mov	r5, r1
c0deb2ac:	68d1      	ldr	r1, [r2, #12]
c0deb2ae:	4614      	mov	r4, r2
c0deb2b0:	b101      	cbz	r1, c0deb2b4 <displayFullValuePage+0x10>
c0deb2b2:	4608      	mov	r0, r1
c0deb2b4:	f001 fc24 	bl	c0decb00 <pic>
c0deb2b8:	4606      	mov	r6, r0
c0deb2ba:	7d20      	ldrb	r0, [r4, #20]
c0deb2bc:	2805      	cmp	r0, #5
c0deb2be:	d00d      	beq.n	c0deb2dc <displayFullValuePage+0x38>
c0deb2c0:	2804      	cmp	r0, #4
c0deb2c2:	d170      	bne.n	c0deb3a6 <displayFullValuePage+0x102>
c0deb2c4:	4861      	ldr	r0, [pc, #388]	@ (c0deb44c <displayFullValuePage+0x1a8>)
c0deb2c6:	6921      	ldr	r1, [r4, #16]
c0deb2c8:	2201      	movs	r2, #1
c0deb2ca:	4448      	add	r0, r9
c0deb2cc:	6341      	str	r1, [r0, #52]	@ 0x34
c0deb2ce:	4630      	mov	r0, r6
c0deb2d0:	6921      	ldr	r1, [r4, #16]
c0deb2d2:	b012      	add	sp, #72	@ 0x48
c0deb2d4:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0deb2d8:	f000 ba48 	b.w	c0deb76c <displayInfosListModal>
c0deb2dc:	485b      	ldr	r0, [pc, #364]	@ (c0deb44c <displayFullValuePage+0x1a8>)
c0deb2de:	6921      	ldr	r1, [r4, #16]
c0deb2e0:	2200      	movs	r2, #0
c0deb2e2:	4448      	add	r0, r9
c0deb2e4:	6381      	str	r1, [r0, #56]	@ 0x38
c0deb2e6:	485a      	ldr	r0, [pc, #360]	@ (c0deb450 <displayFullValuePage+0x1ac>)
c0deb2e8:	2100      	movs	r1, #0
c0deb2ea:	6927      	ldr	r7, [r4, #16]
c0deb2ec:	9102      	str	r1, [sp, #8]
c0deb2ee:	4448      	add	r0, r9
c0deb2f0:	e9c0 220c 	strd	r2, r2, [r0, #48]	@ 0x30
c0deb2f4:	6382      	str	r2, [r0, #56]	@ 0x38
c0deb2f6:	63c2      	str	r2, [r0, #60]	@ 0x3c
c0deb2f8:	7a3d      	ldrb	r5, [r7, #8]
c0deb2fa:	0628      	lsls	r0, r5, #24
c0deb2fc:	f000 8087 	beq.w	c0deb40e <displayFullValuePage+0x16a>
c0deb300:	9501      	str	r5, [sp, #4]
c0deb302:	fa5f fb85 	uxtb.w	fp, r5
c0deb306:	f04f 0800 	mov.w	r8, #0
c0deb30a:	2600      	movs	r6, #0
c0deb30c:	9802      	ldr	r0, [sp, #8]
c0deb30e:	b2c0      	uxtb	r0, r0
c0deb310:	ea4f 1a00 	mov.w	sl, r0, lsl #4
c0deb314:	45c3      	cmp	fp, r8
c0deb316:	d027      	beq.n	c0deb368 <displayFullValuePage+0xc4>
c0deb318:	f1b8 0f00 	cmp.w	r8, #0
c0deb31c:	bf18      	it	ne
c0deb31e:	3618      	addne	r6, #24
c0deb320:	6838      	ldr	r0, [r7, #0]
c0deb322:	b108      	cbz	r0, c0deb328 <displayFullValuePage+0x84>
c0deb324:	4450      	add	r0, sl
c0deb326:	e004      	b.n	c0deb332 <displayFullValuePage+0x8e>
c0deb328:	9802      	ldr	r0, [sp, #8]
c0deb32a:	6879      	ldr	r1, [r7, #4]
c0deb32c:	4440      	add	r0, r8
c0deb32e:	b2c0      	uxtb	r0, r0
c0deb330:	4788      	blx	r1
c0deb332:	f001 fbe5 	bl	c0decb00 <pic>
c0deb336:	7b7b      	ldrb	r3, [r7, #13]
c0deb338:	6801      	ldr	r1, [r0, #0]
c0deb33a:	4604      	mov	r4, r0
c0deb33c:	f000 fd3b 	bl	c0debdb6 <OUTLINED_FUNCTION_12>
c0deb340:	6861      	ldr	r1, [r4, #4]
c0deb342:	7b7b      	ldrb	r3, [r7, #13]
c0deb344:	4605      	mov	r5, r0
c0deb346:	f000 fd36 	bl	c0debdb6 <OUTLINED_FUNCTION_12>
c0deb34a:	1971      	adds	r1, r6, r5
c0deb34c:	f10a 0a10 	add.w	sl, sl, #16
c0deb350:	f108 0801 	add.w	r8, r8, #1
c0deb354:	4408      	add	r0, r1
c0deb356:	1d06      	adds	r6, r0, #4
c0deb358:	b2b0      	uxth	r0, r6
c0deb35a:	f5b0 7fe8 	cmp.w	r0, #464	@ 0x1d0
c0deb35e:	d3d9      	bcc.n	c0deb314 <displayFullValuePage+0x70>
c0deb360:	9d01      	ldr	r5, [sp, #4]
c0deb362:	f1a8 0001 	sub.w	r0, r8, #1
c0deb366:	e001      	b.n	c0deb36c <displayFullValuePage+0xc8>
c0deb368:	9d01      	ldr	r5, [sp, #4]
c0deb36a:	4628      	mov	r0, r5
c0deb36c:	4938      	ldr	r1, [pc, #224]	@ (c0deb450 <displayFullValuePage+0x1ac>)
c0deb36e:	2404      	movs	r4, #4
c0deb370:	1a2d      	subs	r5, r5, r0
c0deb372:	4449      	add	r1, r9
c0deb374:	f891 2030 	ldrb.w	r2, [r1, #48]	@ 0x30
c0deb378:	1c53      	adds	r3, r2, #1
c0deb37a:	f881 3030 	strb.w	r3, [r1, #48]	@ 0x30
c0deb37e:	eb01 0152 	add.w	r1, r1, r2, lsr #1
c0deb382:	ea04 0282 	and.w	r2, r4, r2, lsl #2
c0deb386:	240f      	movs	r4, #15
c0deb388:	f891 3050 	ldrb.w	r3, [r1, #80]	@ 0x50
c0deb38c:	4094      	lsls	r4, r2
c0deb38e:	43a3      	bics	r3, r4
c0deb390:	f000 0407 	and.w	r4, r0, #7
c0deb394:	fa04 f202 	lsl.w	r2, r4, r2
c0deb398:	431a      	orrs	r2, r3
c0deb39a:	f881 2050 	strb.w	r2, [r1, #80]	@ 0x50
c0deb39e:	9902      	ldr	r1, [sp, #8]
c0deb3a0:	4401      	add	r1, r0
c0deb3a2:	9102      	str	r1, [sp, #8]
c0deb3a4:	e7a9      	b.n	c0deb2fa <displayFullValuePage+0x56>
c0deb3a6:	af0b      	add	r7, sp, #44	@ 0x2c
c0deb3a8:	492a      	ldr	r1, [pc, #168]	@ (c0deb454 <displayFullValuePage+0x1b0>)
c0deb3aa:	221c      	movs	r2, #28
c0deb3ac:	4638      	mov	r0, r7
c0deb3ae:	4479      	add	r1, pc
c0deb3b0:	f001 fea4 	bl	c0ded0fc <__aeabi_memcpy>
c0deb3b4:	f44f 6010 	mov.w	r0, #2304	@ 0x900
c0deb3b8:	f8df 8090 	ldr.w	r8, [pc, #144]	@ c0deb44c <displayFullValuePage+0x1a8>
c0deb3bc:	9609      	str	r6, [sp, #36]	@ 0x24
c0deb3be:	f8ad 0028 	strh.w	r0, [sp, #40]	@ 0x28
c0deb3c2:	2000      	movs	r0, #0
c0deb3c4:	9008      	str	r0, [sp, #32]
c0deb3c6:	2001      	movs	r0, #1
c0deb3c8:	eb09 0608 	add.w	r6, r9, r8
c0deb3cc:	f8ad 001c 	strh.w	r0, [sp, #28]
c0deb3d0:	4638      	mov	r0, r7
c0deb3d2:	f7f9 fd83 	bl	c0de4edc <nbgl_layoutGet>
c0deb3d6:	62f0      	str	r0, [r6, #44]	@ 0x2c
c0deb3d8:	a907      	add	r1, sp, #28
c0deb3da:	f7fc fb17 	bl	c0de7a0c <nbgl_layoutAddHeader>
c0deb3de:	7d20      	ldrb	r0, [r4, #20]
c0deb3e0:	2801      	cmp	r0, #1
c0deb3e2:	d01b      	beq.n	c0deb41c <displayFullValuePage+0x178>
c0deb3e4:	2802      	cmp	r0, #2
c0deb3e6:	d01c      	beq.n	c0deb422 <displayFullValuePage+0x17e>
c0deb3e8:	2803      	cmp	r0, #3
c0deb3ea:	d11d      	bne.n	c0deb428 <displayFullValuePage+0x184>
c0deb3ec:	f44f 3080 	mov.w	r0, #65536	@ 0x10000
c0deb3f0:	9006      	str	r0, [sp, #24]
c0deb3f2:	cc07      	ldmia	r4!, {r0, r1, r2}
c0deb3f4:	9105      	str	r1, [sp, #20]
c0deb3f6:	2a00      	cmp	r2, #0
c0deb3f8:	9003      	str	r0, [sp, #12]
c0deb3fa:	bf08      	it	eq
c0deb3fc:	4602      	moveq	r2, r0
c0deb3fe:	eb09 0008 	add.w	r0, r9, r8
c0deb402:	9204      	str	r2, [sp, #16]
c0deb404:	6ac0      	ldr	r0, [r0, #44]	@ 0x2c
c0deb406:	a903      	add	r1, sp, #12
c0deb408:	f7fb fea5 	bl	c0de7156 <nbgl_layoutAddQRCode>
c0deb40c:	e014      	b.n	c0deb438 <displayFullValuePage+0x194>
c0deb40e:	2000      	movs	r0, #0
c0deb410:	2101      	movs	r1, #1
c0deb412:	b012      	add	sp, #72	@ 0x48
c0deb414:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0deb418:	f000 bb12 	b.w	c0deba40 <displayTagValueListModalPage>
c0deb41c:	4b0e      	ldr	r3, [pc, #56]	@ (c0deb458 <displayFullValuePage+0x1b4>)
c0deb41e:	447b      	add	r3, pc
c0deb420:	e003      	b.n	c0deb42a <displayFullValuePage+0x186>
c0deb422:	4b0e      	ldr	r3, [pc, #56]	@ (c0deb45c <displayFullValuePage+0x1b8>)
c0deb424:	447b      	add	r3, pc
c0deb426:	e000      	b.n	c0deb42a <displayFullValuePage+0x186>
c0deb428:	6863      	ldr	r3, [r4, #4]
c0deb42a:	eb09 0008 	add.w	r0, r9, r8
c0deb42e:	6822      	ldr	r2, [r4, #0]
c0deb430:	4629      	mov	r1, r5
c0deb432:	6ac0      	ldr	r0, [r0, #44]	@ 0x2c
c0deb434:	f7fb fa72 	bl	c0de691c <nbgl_layoutAddTextContent>
c0deb438:	eb09 0008 	add.w	r0, r9, r8
c0deb43c:	6ac0      	ldr	r0, [r0, #44]	@ 0x2c
c0deb43e:	f7fc ff47 	bl	c0de82d0 <nbgl_layoutDraw>
c0deb442:	f001 f940 	bl	c0dec6c6 <nbgl_refresh>
c0deb446:	b012      	add	sp, #72	@ 0x48
c0deb448:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0deb44c:	000018fc 	.word	0x000018fc
c0deb450:	00001bc8 	.word	0x00001bc8
c0deb454:	000051aa 	.word	0x000051aa
c0deb458:	000031f2 	.word	0x000031f2
c0deb45c:	000034db 	.word	0x000034db

c0deb460 <displaySecurityReport>:
c0deb460:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0deb464:	b09a      	sub	sp, #104	@ 0x68
c0deb466:	ac13      	add	r4, sp, #76	@ 0x4c
c0deb468:	4974      	ldr	r1, [pc, #464]	@ (c0deb63c <displaySecurityReport+0x1dc>)
c0deb46a:	4605      	mov	r5, r0
c0deb46c:	221c      	movs	r2, #28
c0deb46e:	4620      	mov	r0, r4
c0deb470:	4479      	add	r1, pc
c0deb472:	f001 fe43 	bl	c0ded0fc <__aeabi_memcpy>
c0deb476:	4872      	ldr	r0, [pc, #456]	@ (c0deb640 <displaySecurityReport+0x1e0>)
c0deb478:	a90f      	add	r1, sp, #60	@ 0x3c
c0deb47a:	4478      	add	r0, pc
c0deb47c:	e890 00cc 	ldmia.w	r0, {r2, r3, r6, r7}
c0deb480:	c1cc      	stmia	r1!, {r2, r3, r6, r7}
c0deb482:	a809      	add	r0, sp, #36	@ 0x24
c0deb484:	2118      	movs	r1, #24
c0deb486:	f001 fe43 	bl	c0ded110 <__aeabi_memclr>
c0deb48a:	f8df b1a8 	ldr.w	fp, [pc, #424]	@ c0deb634 <displaySecurityReport+0x1d4>
c0deb48e:	4620      	mov	r0, r4
c0deb490:	eb09 060b 	add.w	r6, r9, fp
c0deb494:	f7f9 fd22 	bl	c0de4edc <nbgl_layoutGet>
c0deb498:	4604      	mov	r4, r0
c0deb49a:	6670      	str	r0, [r6, #100]	@ 0x64
c0deb49c:	f896 0068 	ldrb.w	r0, [r6, #104]	@ 0x68
c0deb4a0:	2801      	cmp	r0, #1
c0deb4a2:	d14b      	bne.n	c0deb53c <displaySecurityReport+0xdc>
c0deb4a4:	f896 0069 	ldrb.w	r0, [r6, #105]	@ 0x69
c0deb4a8:	2800      	cmp	r0, #0
c0deb4aa:	d147      	bne.n	c0deb53c <displaySecurityReport+0xdc>
c0deb4ac:	4865      	ldr	r0, [pc, #404]	@ (c0deb644 <displaySecurityReport+0x1e4>)
c0deb4ae:	2600      	movs	r6, #0
c0deb4b0:	466c      	mov	r4, sp
c0deb4b2:	f04f 0800 	mov.w	r8, #0
c0deb4b6:	4478      	add	r0, pc
c0deb4b8:	1d05      	adds	r5, r0, #4
c0deb4ba:	2e05      	cmp	r6, #5
c0deb4bc:	d075      	beq.n	c0deb5aa <displaySecurityReport+0x14a>
c0deb4be:	eb09 000b 	add.w	r0, r9, fp
c0deb4c2:	f8d0 a058 	ldr.w	sl, [r0, #88]	@ 0x58
c0deb4c6:	f8da 0000 	ldr.w	r0, [sl]
c0deb4ca:	40f0      	lsrs	r0, r6
c0deb4cc:	07c0      	lsls	r0, r0, #31
c0deb4ce:	d02b      	beq.n	c0deb528 <displaySecurityReport+0xc8>
c0deb4d0:	4620      	mov	r0, r4
c0deb4d2:	2118      	movs	r1, #24
c0deb4d4:	f001 fe1c 	bl	c0ded110 <__aeabi_memclr>
c0deb4d8:	f008 007f 	and.w	r0, r8, #127	@ 0x7f
c0deb4dc:	2804      	cmp	r0, #4
c0deb4de:	d828      	bhi.n	c0deb532 <displaySecurityReport+0xd2>
c0deb4e0:	2101      	movs	r1, #1
c0deb4e2:	fa01 f000 	lsl.w	r0, r1, r0
c0deb4e6:	f010 0f19 	tst.w	r0, #25
c0deb4ea:	d022      	beq.n	c0deb532 <displaySecurityReport+0xd2>
c0deb4ec:	6868      	ldr	r0, [r5, #4]
c0deb4ee:	9003      	str	r0, [sp, #12]
c0deb4f0:	6828      	ldr	r0, [r5, #0]
c0deb4f2:	2e03      	cmp	r6, #3
c0deb4f4:	9001      	str	r0, [sp, #4]
c0deb4f6:	d101      	bne.n	c0deb4fc <displaySecurityReport+0x9c>
c0deb4f8:	20ff      	movs	r0, #255	@ 0xff
c0deb4fa:	e007      	b.n	c0deb50c <displaySecurityReport+0xac>
c0deb4fc:	2009      	movs	r0, #9
c0deb4fe:	f88d 0014 	strb.w	r0, [sp, #20]
c0deb502:	4851      	ldr	r0, [pc, #324]	@ (c0deb648 <displaySecurityReport+0x1e8>)
c0deb504:	4478      	add	r0, pc
c0deb506:	9002      	str	r0, [sp, #8]
c0deb508:	f106 0017 	add.w	r0, r6, #23
c0deb50c:	f88d 0011 	strb.w	r0, [sp, #17]
c0deb510:	f855 0c04 	ldr.w	r0, [r5, #-4]
c0deb514:	eb09 070b 	add.w	r7, r9, fp
c0deb518:	4621      	mov	r1, r4
c0deb51a:	9000      	str	r0, [sp, #0]
c0deb51c:	6e78      	ldr	r0, [r7, #100]	@ 0x64
c0deb51e:	f7fa fe8a 	bl	c0de6236 <nbgl_layoutAddTouchableBar>
c0deb522:	6e78      	ldr	r0, [r7, #100]	@ 0x64
c0deb524:	f7fc f948 	bl	c0de77b8 <nbgl_layoutAddSeparationLine>
c0deb528:	350c      	adds	r5, #12
c0deb52a:	f108 0801 	add.w	r8, r8, #1
c0deb52e:	3601      	adds	r6, #1
c0deb530:	e7c3      	b.n	c0deb4ba <displaySecurityReport+0x5a>
c0deb532:	f8da 0010 	ldr.w	r0, [sl, #16]
c0deb536:	2800      	cmp	r0, #0
c0deb538:	d1d9      	bne.n	c0deb4ee <displaySecurityReport+0x8e>
c0deb53a:	e7d7      	b.n	c0deb4ec <displaySecurityReport+0x8c>
c0deb53c:	eb09 000b 	add.w	r0, r9, fp
c0deb540:	6d80      	ldr	r0, [r0, #88]	@ 0x58
c0deb542:	b108      	cbz	r0, c0deb548 <displaySecurityReport+0xe8>
c0deb544:	68c6      	ldr	r6, [r0, #12]
c0deb546:	b90e      	cbnz	r6, c0deb54c <displaySecurityReport+0xec>
c0deb548:	4e40      	ldr	r6, [pc, #256]	@ (c0deb64c <displaySecurityReport+0x1ec>)
c0deb54a:	447e      	add	r6, pc
c0deb54c:	f015 0f06 	tst.w	r5, #6
c0deb550:	d035      	beq.n	c0deb5be <displaySecurityReport+0x15e>
c0deb552:	f44f 3180 	mov.w	r1, #65536	@ 0x10000
c0deb556:	9103      	str	r1, [sp, #12]
c0deb558:	493d      	ldr	r1, [pc, #244]	@ (c0deb650 <displaySecurityReport+0x1f0>)
c0deb55a:	4479      	add	r1, pc
c0deb55c:	9102      	str	r1, [sp, #8]
c0deb55e:	2140      	movs	r1, #64	@ 0x40
c0deb560:	6883      	ldr	r3, [r0, #8]
c0deb562:	4835      	ldr	r0, [pc, #212]	@ (c0deb638 <displaySecurityReport+0x1d8>)
c0deb564:	4448      	add	r0, r9
c0deb566:	9301      	str	r3, [sp, #4]
c0deb568:	f100 0440 	add.w	r4, r0, #64	@ 0x40
c0deb56c:	9400      	str	r4, [sp, #0]
c0deb56e:	4620      	mov	r0, r4
c0deb570:	4a38      	ldr	r2, [pc, #224]	@ (c0deb654 <displaySecurityReport+0x1f4>)
c0deb572:	447a      	add	r2, pc
c0deb574:	f001 f932 	bl	c0dec7dc <snprintf>
c0deb578:	4620      	mov	r0, r4
c0deb57a:	f001 fe35 	bl	c0ded1e8 <strlen>
c0deb57e:	4605      	mov	r5, r0
c0deb580:	eb09 000b 	add.w	r0, r9, fp
c0deb584:	4669      	mov	r1, sp
c0deb586:	6e40      	ldr	r0, [r0, #100]	@ 0x64
c0deb588:	f7fb fde5 	bl	c0de7156 <nbgl_layoutAddQRCode>
c0deb58c:	2018      	movs	r0, #24
c0deb58e:	f1c5 013f 	rsb	r1, r5, #63	@ 0x3f
c0deb592:	4633      	mov	r3, r6
c0deb594:	f8ad 0028 	strh.w	r0, [sp, #40]	@ 0x28
c0deb598:	1928      	adds	r0, r5, r4
c0deb59a:	4a2f      	ldr	r2, [pc, #188]	@ (c0deb658 <displaySecurityReport+0x1f8>)
c0deb59c:	1c44      	adds	r4, r0, #1
c0deb59e:	4620      	mov	r0, r4
c0deb5a0:	447a      	add	r2, pc
c0deb5a2:	f001 f91b 	bl	c0dec7dc <snprintf>
c0deb5a6:	9411      	str	r4, [sp, #68]	@ 0x44
c0deb5a8:	e030      	b.n	c0deb60c <displaySecurityReport+0x1ac>
c0deb5aa:	4831      	ldr	r0, [pc, #196]	@ (c0deb670 <displaySecurityReport+0x210>)
c0deb5ac:	4478      	add	r0, pc
c0deb5ae:	9011      	str	r0, [sp, #68]	@ 0x44
c0deb5b0:	eb09 000b 	add.w	r0, r9, fp
c0deb5b4:	6e40      	ldr	r0, [r0, #100]	@ 0x64
c0deb5b6:	a90f      	add	r1, sp, #60	@ 0x3c
c0deb5b8:	f7fc fa28 	bl	c0de7a0c <nbgl_layoutAddHeader>
c0deb5bc:	e030      	b.n	c0deb620 <displaySecurityReport+0x1c0>
c0deb5be:	06e8      	lsls	r0, r5, #27
c0deb5c0:	d40c      	bmi.n	c0deb5dc <displaySecurityReport+0x17c>
c0deb5c2:	07e8      	lsls	r0, r5, #31
c0deb5c4:	d0f4      	beq.n	c0deb5b0 <displaySecurityReport+0x150>
c0deb5c6:	466d      	mov	r5, sp
c0deb5c8:	2124      	movs	r1, #36	@ 0x24
c0deb5ca:	4628      	mov	r0, r5
c0deb5cc:	f001 fda0 	bl	c0ded110 <__aeabi_memclr>
c0deb5d0:	4825      	ldr	r0, [pc, #148]	@ (c0deb668 <displaySecurityReport+0x208>)
c0deb5d2:	4478      	add	r0, pc
c0deb5d4:	9006      	str	r0, [sp, #24]
c0deb5d6:	4825      	ldr	r0, [pc, #148]	@ (c0deb66c <displaySecurityReport+0x20c>)
c0deb5d8:	4478      	add	r0, pc
c0deb5da:	e009      	b.n	c0deb5f0 <displaySecurityReport+0x190>
c0deb5dc:	466d      	mov	r5, sp
c0deb5de:	2124      	movs	r1, #36	@ 0x24
c0deb5e0:	4628      	mov	r0, r5
c0deb5e2:	f001 fd95 	bl	c0ded110 <__aeabi_memclr>
c0deb5e6:	481d      	ldr	r0, [pc, #116]	@ (c0deb65c <displaySecurityReport+0x1fc>)
c0deb5e8:	4478      	add	r0, pc
c0deb5ea:	9006      	str	r0, [sp, #24]
c0deb5ec:	481c      	ldr	r0, [pc, #112]	@ (c0deb660 <displaySecurityReport+0x200>)
c0deb5ee:	4478      	add	r0, pc
c0deb5f0:	9004      	str	r0, [sp, #16]
c0deb5f2:	4629      	mov	r1, r5
c0deb5f4:	481b      	ldr	r0, [pc, #108]	@ (c0deb664 <displaySecurityReport+0x204>)
c0deb5f6:	4478      	add	r0, pc
c0deb5f8:	9001      	str	r0, [sp, #4]
c0deb5fa:	4620      	mov	r0, r4
c0deb5fc:	f7fb fda2 	bl	c0de7144 <nbgl_layoutAddContentCenter>
c0deb600:	2040      	movs	r0, #64	@ 0x40
c0deb602:	f8ad 0028 	strh.w	r0, [sp, #40]	@ 0x28
c0deb606:	2000      	movs	r0, #0
c0deb608:	f88d 003d 	strb.w	r0, [sp, #61]	@ 0x3d
c0deb60c:	eb09 040b 	add.w	r4, r9, fp
c0deb610:	6e60      	ldr	r0, [r4, #100]	@ 0x64
c0deb612:	a90f      	add	r1, sp, #60	@ 0x3c
c0deb614:	f7fc f9fa 	bl	c0de7a0c <nbgl_layoutAddHeader>
c0deb618:	6e60      	ldr	r0, [r4, #100]	@ 0x64
c0deb61a:	a909      	add	r1, sp, #36	@ 0x24
c0deb61c:	f7fa fa62 	bl	c0de5ae4 <nbgl_layoutAddExtendedFooter>
c0deb620:	eb09 000b 	add.w	r0, r9, fp
c0deb624:	6e40      	ldr	r0, [r0, #100]	@ 0x64
c0deb626:	f7fc fe53 	bl	c0de82d0 <nbgl_layoutDraw>
c0deb62a:	f001 f84c 	bl	c0dec6c6 <nbgl_refresh>
c0deb62e:	b01a      	add	sp, #104	@ 0x68
c0deb630:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0deb634:	000018fc 	.word	0x000018fc
c0deb638:	00001a48 	.word	0x00001a48
c0deb63c:	000050e8 	.word	0x000050e8
c0deb640:	00005052 	.word	0x00005052
c0deb644:	00005066 	.word	0x00005066
c0deb648:	00002747 	.word	0x00002747
c0deb64c:	00003371 	.word	0x00003371
c0deb650:	000031b2 	.word	0x000031b2
c0deb654:	00003051 	.word	0x00003051
c0deb658:	00003102 	.word	0x00003102
c0deb65c:	0000313d 	.word	0x0000313d
c0deb660:	0000322b 	.word	0x0000322b
c0deb664:	000024e3 	.word	0x000024e3
c0deb668:	00003523 	.word	0x00003523
c0deb66c:	00002ea0 	.word	0x00002ea0
c0deb670:	0000308e 	.word	0x0000308e

c0deb674 <displayCustomizedSecurityReport>:
c0deb674:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0deb678:	b092      	sub	sp, #72	@ 0x48
c0deb67a:	4939      	ldr	r1, [pc, #228]	@ (c0deb760 <displayCustomizedSecurityReport+0xec>)
c0deb67c:	f10d 0a2c 	add.w	sl, sp, #44	@ 0x2c
c0deb680:	4604      	mov	r4, r0
c0deb682:	221c      	movs	r2, #28
c0deb684:	4650      	mov	r0, sl
c0deb686:	4479      	add	r1, pc
c0deb688:	f001 fd38 	bl	c0ded0fc <__aeabi_memcpy>
c0deb68c:	4835      	ldr	r0, [pc, #212]	@ (c0deb764 <displayCustomizedSecurityReport+0xf0>)
c0deb68e:	ae07      	add	r6, sp, #28
c0deb690:	4631      	mov	r1, r6
c0deb692:	4478      	add	r0, pc
c0deb694:	e890 00ac 	ldmia.w	r0, {r2, r3, r5, r7}
c0deb698:	4830      	ldr	r0, [pc, #192]	@ (c0deb75c <displayCustomizedSecurityReport+0xe8>)
c0deb69a:	c1ac      	stmia	r1!, {r2, r3, r5, r7}
c0deb69c:	eb09 0500 	add.w	r5, r9, r0
c0deb6a0:	4650      	mov	r0, sl
c0deb6a2:	f7f9 fc1b 	bl	c0de4edc <nbgl_layoutGet>
c0deb6a6:	6668      	str	r0, [r5, #100]	@ 0x64
c0deb6a8:	6821      	ldr	r1, [r4, #0]
c0deb6aa:	9109      	str	r1, [sp, #36]	@ 0x24
c0deb6ac:	4631      	mov	r1, r6
c0deb6ae:	f7fc f9ad 	bl	c0de7a0c <nbgl_layoutAddHeader>
c0deb6b2:	7920      	ldrb	r0, [r4, #4]
c0deb6b4:	b398      	cbz	r0, c0deb71e <displayCustomizedSecurityReport+0xaa>
c0deb6b6:	2801      	cmp	r0, #1
c0deb6b8:	d03c      	beq.n	c0deb734 <displayCustomizedSecurityReport+0xc0>
c0deb6ba:	2802      	cmp	r0, #2
c0deb6bc:	d143      	bne.n	c0deb746 <displayCustomizedSecurityReport+0xd2>
c0deb6be:	4f2a      	ldr	r7, [pc, #168]	@ (c0deb768 <displayCustomizedSecurityReport+0xf4>)
c0deb6c0:	2600      	movs	r6, #0
c0deb6c2:	f04f 0a09 	mov.w	sl, #9
c0deb6c6:	f10d 0b04 	add.w	fp, sp, #4
c0deb6ca:	2500      	movs	r5, #0
c0deb6cc:	447f      	add	r7, pc
c0deb6ce:	7a20      	ldrb	r0, [r4, #8]
c0deb6d0:	4285      	cmp	r5, r0
c0deb6d2:	d238      	bcs.n	c0deb746 <displayCustomizedSecurityReport+0xd2>
c0deb6d4:	f104 020c 	add.w	r2, r4, #12
c0deb6d8:	ca07      	ldmia	r2, {r0, r1, r2}
c0deb6da:	f850 0025 	ldr.w	r0, [r0, r5, lsl #2]
c0deb6de:	9002      	str	r0, [sp, #8]
c0deb6e0:	f851 0025 	ldr.w	r0, [r1, r5, lsl #2]
c0deb6e4:	f88d a018 	strb.w	sl, [sp, #24]
c0deb6e8:	f88d 6016 	strb.w	r6, [sp, #22]
c0deb6ec:	f88d 6014 	strb.w	r6, [sp, #20]
c0deb6f0:	4659      	mov	r1, fp
c0deb6f2:	e9cd 7003 	strd	r7, r0, [sp, #12]
c0deb6f6:	f105 0017 	add.w	r0, r5, #23
c0deb6fa:	f88d 0015 	strb.w	r0, [sp, #21]
c0deb6fe:	f852 0025 	ldr.w	r0, [r2, r5, lsl #2]
c0deb702:	9001      	str	r0, [sp, #4]
c0deb704:	4815      	ldr	r0, [pc, #84]	@ (c0deb75c <displayCustomizedSecurityReport+0xe8>)
c0deb706:	eb09 0800 	add.w	r8, r9, r0
c0deb70a:	f8d8 0064 	ldr.w	r0, [r8, #100]	@ 0x64
c0deb70e:	f7fa fd92 	bl	c0de6236 <nbgl_layoutAddTouchableBar>
c0deb712:	f8d8 0064 	ldr.w	r0, [r8, #100]	@ 0x64
c0deb716:	f7fc f84f 	bl	c0de77b8 <nbgl_layoutAddSeparationLine>
c0deb71a:	3501      	adds	r5, #1
c0deb71c:	e7d7      	b.n	c0deb6ce <displayCustomizedSecurityReport+0x5a>
c0deb71e:	480f      	ldr	r0, [pc, #60]	@ (c0deb75c <displayCustomizedSecurityReport+0xe8>)
c0deb720:	f104 0108 	add.w	r1, r4, #8
c0deb724:	4448      	add	r0, r9
c0deb726:	6e40      	ldr	r0, [r0, #100]	@ 0x64
c0deb728:	f7fb fd0c 	bl	c0de7144 <nbgl_layoutAddContentCenter>
c0deb72c:	2000      	movs	r0, #0
c0deb72e:	f88d 001d 	strb.w	r0, [sp, #29]
c0deb732:	e008      	b.n	c0deb746 <displayCustomizedSecurityReport+0xd2>
c0deb734:	4809      	ldr	r0, [pc, #36]	@ (c0deb75c <displayCustomizedSecurityReport+0xe8>)
c0deb736:	f104 0108 	add.w	r1, r4, #8
c0deb73a:	4448      	add	r0, r9
c0deb73c:	6e40      	ldr	r0, [r0, #100]	@ 0x64
c0deb73e:	f7fb fd0a 	bl	c0de7156 <nbgl_layoutAddQRCode>
c0deb742:	6820      	ldr	r0, [r4, #0]
c0deb744:	9009      	str	r0, [sp, #36]	@ 0x24
c0deb746:	4805      	ldr	r0, [pc, #20]	@ (c0deb75c <displayCustomizedSecurityReport+0xe8>)
c0deb748:	4448      	add	r0, r9
c0deb74a:	6e40      	ldr	r0, [r0, #100]	@ 0x64
c0deb74c:	f7fc fdc0 	bl	c0de82d0 <nbgl_layoutDraw>
c0deb750:	f000 ffb9 	bl	c0dec6c6 <nbgl_refresh>
c0deb754:	b012      	add	sp, #72	@ 0x48
c0deb756:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0deb75a:	bf00      	nop
c0deb75c:	000018fc 	.word	0x000018fc
c0deb760:	00004ed2 	.word	0x00004ed2
c0deb764:	00004e3a 	.word	0x00004e3a
c0deb768:	0000257f 	.word	0x0000257f

c0deb76c <displayInfosListModal>:
c0deb76c:	b570      	push	{r4, r5, r6, lr}
c0deb76e:	b098      	sub	sp, #96	@ 0x60
c0deb770:	4606      	mov	r6, r0
c0deb772:	460c      	mov	r4, r1
c0deb774:	a811      	add	r0, sp, #68	@ 0x44
c0deb776:	491c      	ldr	r1, [pc, #112]	@ (c0deb7e8 <displayInfosListModal+0x7c>)
c0deb778:	4615      	mov	r5, r2
c0deb77a:	221c      	movs	r2, #28
c0deb77c:	4479      	add	r1, pc
c0deb77e:	f001 fcbd 	bl	c0ded0fc <__aeabi_memcpy>
c0deb782:	2008      	movs	r0, #8
c0deb784:	f88d 0010 	strb.w	r0, [sp, #16]
c0deb788:	2000      	movs	r0, #0
c0deb78a:	9003      	str	r0, [sp, #12]
c0deb78c:	4814      	ldr	r0, [pc, #80]	@ (c0deb7e0 <displayInfosListModal+0x74>)
c0deb78e:	e9cd 6001 	strd	r6, r0, [sp, #4]
c0deb792:	200f      	movs	r0, #15
c0deb794:	2d00      	cmp	r5, #0
c0deb796:	bf18      	it	ne
c0deb798:	200e      	movne	r0, #14
c0deb79a:	f88d 0021 	strb.w	r0, [sp, #33]	@ 0x21
c0deb79e:	e894 0007 	ldmia.w	r4, {r0, r1, r2}
c0deb7a2:	ab05      	add	r3, sp, #20
c0deb7a4:	c307      	stmia	r3!, {r0, r1, r2}
c0deb7a6:	7b20      	ldrb	r0, [r4, #12]
c0deb7a8:	f88d 0020 	strb.w	r0, [sp, #32]
c0deb7ac:	7ba0      	ldrb	r0, [r4, #14]
c0deb7ae:	4c0d      	ldr	r4, [pc, #52]	@ (c0deb7e4 <displayInfosListModal+0x78>)
c0deb7b0:	f88d 0022 	strb.w	r0, [sp, #34]	@ 0x22
c0deb7b4:	eb09 0004 	add.w	r0, r9, r4
c0deb7b8:	6a00      	ldr	r0, [r0, #32]
c0deb7ba:	b108      	cbz	r0, c0deb7c0 <displayInfosListModal+0x54>
c0deb7bc:	f7fd fec1 	bl	c0de9542 <nbgl_pageRelease>
c0deb7c0:	480a      	ldr	r0, [pc, #40]	@ (c0deb7ec <displayInfosListModal+0x80>)
c0deb7c2:	a911      	add	r1, sp, #68	@ 0x44
c0deb7c4:	aa01      	add	r2, sp, #4
c0deb7c6:	2301      	movs	r3, #1
c0deb7c8:	4478      	add	r0, pc
c0deb7ca:	f7fd fc91 	bl	c0de90f0 <nbgl_pageDrawGenericContentExt>
c0deb7ce:	eb09 0104 	add.w	r1, r9, r4
c0deb7d2:	6208      	str	r0, [r1, #32]
c0deb7d4:	2002      	movs	r0, #2
c0deb7d6:	f000 ff7b 	bl	c0dec6d0 <nbgl_refreshSpecial>
c0deb7da:	b018      	add	sp, #96	@ 0x60
c0deb7dc:	bd70      	pop	{r4, r5, r6, pc}
c0deb7de:	bf00      	nop
c0deb7e0:	00091300 	.word	0x00091300
c0deb7e4:	00001bc8 	.word	0x00001bc8
c0deb7e8:	00004df8 	.word	0x00004df8
c0deb7ec:	ffffef75 	.word	0xffffef75

c0deb7f0 <modalLayoutTouchCallback>:
c0deb7f0:	b570      	push	{r4, r5, r6, lr}
c0deb7f2:	2816      	cmp	r0, #22
c0deb7f4:	d00a      	beq.n	c0deb80c <modalLayoutTouchCallback+0x1c>
c0deb7f6:	2815      	cmp	r0, #21
c0deb7f8:	d117      	bne.n	c0deb82a <modalLayoutTouchCallback+0x3a>
c0deb7fa:	4833      	ldr	r0, [pc, #204]	@ (c0deb8c8 <modalLayoutTouchCallback+0xd8>)
c0deb7fc:	eb09 0400 	add.w	r4, r9, r0
c0deb800:	6b20      	ldr	r0, [r4, #48]	@ 0x30
c0deb802:	f7fc fd93 	bl	c0de832c <nbgl_layoutRelease>
c0deb806:	2000      	movs	r0, #0
c0deb808:	6320      	str	r0, [r4, #48]	@ 0x30
c0deb80a:	e035      	b.n	c0deb878 <modalLayoutTouchCallback+0x88>
c0deb80c:	4c2d      	ldr	r4, [pc, #180]	@ (c0deb8c4 <modalLayoutTouchCallback+0xd4>)
c0deb80e:	eb09 0504 	add.w	r5, r9, r4
c0deb812:	6e68      	ldr	r0, [r5, #100]	@ 0x64
c0deb814:	f7fc fd8a 	bl	c0de832c <nbgl_layoutRelease>
c0deb818:	f895 0068 	ldrb.w	r0, [r5, #104]	@ 0x68
c0deb81c:	2801      	cmp	r0, #1
c0deb81e:	d817      	bhi.n	c0deb850 <modalLayoutTouchCallback+0x60>
c0deb820:	eb09 0004 	add.w	r0, r9, r4
c0deb824:	2100      	movs	r1, #0
c0deb826:	6641      	str	r1, [r0, #100]	@ 0x64
c0deb828:	e026      	b.n	c0deb878 <modalLayoutTouchCallback+0x88>
c0deb82a:	f1a0 0417 	sub.w	r4, r0, #23
c0deb82e:	2c04      	cmp	r4, #4
c0deb830:	d81a      	bhi.n	c0deb868 <modalLayoutTouchCallback+0x78>
c0deb832:	4d24      	ldr	r5, [pc, #144]	@ (c0deb8c4 <modalLayoutTouchCallback+0xd4>)
c0deb834:	eb09 0605 	add.w	r6, r9, r5
c0deb838:	6e70      	ldr	r0, [r6, #100]	@ 0x64
c0deb83a:	f7fc fd77 	bl	c0de832c <nbgl_layoutRelease>
c0deb83e:	2002      	movs	r0, #2
c0deb840:	f886 0068 	strb.w	r0, [r6, #104]	@ 0x68
c0deb844:	6db0      	ldr	r0, [r6, #88]	@ 0x58
c0deb846:	6801      	ldr	r1, [r0, #0]
c0deb848:	b331      	cbz	r1, c0deb898 <modalLayoutTouchCallback+0xa8>
c0deb84a:	2001      	movs	r0, #1
c0deb84c:	40a0      	lsls	r0, r4
c0deb84e:	e007      	b.n	c0deb860 <modalLayoutTouchCallback+0x70>
c0deb850:	eb09 0004 	add.w	r0, r9, r4
c0deb854:	2101      	movs	r1, #1
c0deb856:	f880 1068 	strb.w	r1, [r0, #104]	@ 0x68
c0deb85a:	6d81      	ldr	r1, [r0, #88]	@ 0x58
c0deb85c:	6808      	ldr	r0, [r1, #0]
c0deb85e:	b188      	cbz	r0, c0deb884 <modalLayoutTouchCallback+0x94>
c0deb860:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0deb864:	f7ff bdfc 	b.w	c0deb460 <displaySecurityReport>
c0deb868:	4816      	ldr	r0, [pc, #88]	@ (c0deb8c4 <modalLayoutTouchCallback+0xd4>)
c0deb86a:	eb09 0400 	add.w	r4, r9, r0
c0deb86e:	6ae0      	ldr	r0, [r4, #44]	@ 0x2c
c0deb870:	f7fc fd5c 	bl	c0de832c <nbgl_layoutRelease>
c0deb874:	2000      	movs	r0, #0
c0deb876:	62e0      	str	r0, [r4, #44]	@ 0x2c
c0deb878:	f000 ff4d 	bl	c0dec716 <nbgl_screenRedraw>
c0deb87c:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0deb880:	f000 bf21 	b.w	c0dec6c6 <nbgl_refresh>
c0deb884:	eb09 0004 	add.w	r0, r9, r4
c0deb888:	2214      	movs	r2, #20
c0deb88a:	f890 0069 	ldrb.w	r0, [r0, #105]	@ 0x69
c0deb88e:	2800      	cmp	r0, #0
c0deb890:	bf08      	it	eq
c0deb892:	2218      	moveq	r2, #24
c0deb894:	5888      	ldr	r0, [r1, r2]
c0deb896:	e010      	b.n	c0deb8ba <modalLayoutTouchCallback+0xca>
c0deb898:	eb09 0105 	add.w	r1, r9, r5
c0deb89c:	2214      	movs	r2, #20
c0deb89e:	f891 1069 	ldrb.w	r1, [r1, #105]	@ 0x69
c0deb8a2:	2900      	cmp	r1, #0
c0deb8a4:	bf08      	it	eq
c0deb8a6:	2218      	moveq	r2, #24
c0deb8a8:	5880      	ldr	r0, [r0, r2]
c0deb8aa:	7901      	ldrb	r1, [r0, #4]
c0deb8ac:	2902      	cmp	r1, #2
c0deb8ae:	bf18      	it	ne
c0deb8b0:	bd70      	popne	{r4, r5, r6, pc}
c0deb8b2:	6980      	ldr	r0, [r0, #24]
c0deb8b4:	212c      	movs	r1, #44	@ 0x2c
c0deb8b6:	fb04 0001 	mla	r0, r4, r1, r0
c0deb8ba:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0deb8be:	f7ff bed9 	b.w	c0deb674 <displayCustomizedSecurityReport>
c0deb8c2:	bf00      	nop
c0deb8c4:	000018fc 	.word	0x000018fc
c0deb8c8:	00001a10 	.word	0x00001a10

c0deb8cc <displayDetailsPage>:
c0deb8cc:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0deb8d0:	b09b      	sub	sp, #108	@ 0x6c
c0deb8d2:	f8df a160 	ldr.w	sl, [pc, #352]	@ c0deba34 <displayDetailsPage+0x168>
c0deb8d6:	4604      	mov	r4, r0
c0deb8d8:	f88d 004c 	strb.w	r0, [sp, #76]	@ 0x4c
c0deb8dc:	2000      	movs	r0, #0
c0deb8de:	460e      	mov	r6, r1
c0deb8e0:	4953      	ldr	r1, [pc, #332]	@ (c0deba30 <displayDetailsPage+0x164>)
c0deb8e2:	9018      	str	r0, [sp, #96]	@ 0x60
c0deb8e4:	f88d 0058 	strb.w	r0, [sp, #88]	@ 0x58
c0deb8e8:	9015      	str	r0, [sp, #84]	@ 0x54
c0deb8ea:	f44f 6010 	mov.w	r0, #2304	@ 0x900
c0deb8ee:	eb09 050a 	add.w	r5, r9, sl
c0deb8f2:	f8ad 0050 	strh.w	r0, [sp, #80]	@ 0x50
c0deb8f6:	f44f 7081 	mov.w	r0, #258	@ 0x102
c0deb8fa:	9117      	str	r1, [sp, #92]	@ 0x5c
c0deb8fc:	2140      	movs	r1, #64	@ 0x40
c0deb8fe:	f895 8030 	ldrb.w	r8, [r5, #48]	@ 0x30
c0deb902:	f8ad 004e 	strh.w	r0, [sp, #78]	@ 0x4e
c0deb906:	f88d 804d 	strb.w	r8, [sp, #77]	@ 0x4d
c0deb90a:	a803      	add	r0, sp, #12
c0deb90c:	f001 fc00 	bl	c0ded110 <__aeabi_memclr>
c0deb910:	2001      	movs	r0, #1
c0deb912:	f88d 0028 	strb.w	r0, [sp, #40]	@ 0x28
c0deb916:	f88d 0024 	strb.w	r0, [sp, #36]	@ 0x24
c0deb91a:	f105 0040 	add.w	r0, r5, #64	@ 0x40
c0deb91e:	9007      	str	r0, [sp, #28]
c0deb920:	2004      	movs	r0, #4
c0deb922:	f88d 0018 	strb.w	r0, [sp, #24]
c0deb926:	f895 0033 	ldrb.w	r0, [r5, #51]	@ 0x33
c0deb92a:	f88d 0029 	strb.w	r0, [sp, #41]	@ 0x29
c0deb92e:	6a28      	ldr	r0, [r5, #32]
c0deb930:	b108      	cbz	r0, c0deb936 <displayDetailsPage+0x6a>
c0deb932:	f7fd fe06 	bl	c0de9542 <nbgl_pageRelease>
c0deb936:	eb09 000a 	add.w	r0, r9, sl
c0deb93a:	6b41      	ldr	r1, [r0, #52]	@ 0x34
c0deb93c:	6401      	str	r1, [r0, #64]	@ 0x40
c0deb93e:	f890 0031 	ldrb.w	r0, [r0, #49]	@ 0x31
c0deb942:	42a0      	cmp	r0, r4
c0deb944:	d207      	bcs.n	c0deb956 <displayDetailsPage+0x8a>
c0deb946:	2501      	movs	r5, #1
c0deb948:	eb09 000a 	add.w	r0, r9, sl
c0deb94c:	2e00      	cmp	r6, #0
c0deb94e:	bf18      	it	ne
c0deb950:	2502      	movne	r5, #2
c0deb952:	6bc6      	ldr	r6, [r0, #60]	@ 0x3c
c0deb954:	e022      	b.n	c0deb99c <displayDetailsPage+0xd0>
c0deb956:	eb09 000a 	add.w	r0, r9, sl
c0deb95a:	2500      	movs	r5, #0
c0deb95c:	f10d 076a 	add.w	r7, sp, #106	@ 0x6a
c0deb960:	6b86      	ldr	r6, [r0, #56]	@ 0x38
c0deb962:	42a5      	cmp	r5, r4
c0deb964:	d219      	bcs.n	c0deb99a <displayDetailsPage+0xce>
c0deb966:	200c      	movs	r0, #12
c0deb968:	4631      	mov	r1, r6
c0deb96a:	f000 fa1f 	bl	c0debdac <OUTLINED_FUNCTION_11>
c0deb96e:	280c      	cmp	r0, #12
c0deb970:	d311      	bcc.n	c0deb996 <displayDetailsPage+0xca>
c0deb972:	eb09 000a 	add.w	r0, r9, sl
c0deb976:	4631      	mov	r1, r6
c0deb978:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0deb97c:	230b      	movs	r3, #11
c0deb97e:	f890 0033 	ldrb.w	r0, [r0, #51]	@ 0x33
c0deb982:	e9cd 7000 	strd	r7, r0, [sp]
c0deb986:	200c      	movs	r0, #12
c0deb988:	f000 ff01 	bl	c0dec78e <nbgl_getTextMaxLenInNbLines>
c0deb98c:	f8bd 006a 	ldrh.w	r0, [sp, #106]	@ 0x6a
c0deb990:	3803      	subs	r0, #3
c0deb992:	b280      	uxth	r0, r0
c0deb994:	4406      	add	r6, r0
c0deb996:	3501      	adds	r5, #1
c0deb998:	e7e3      	b.n	c0deb962 <displayDetailsPage+0x96>
c0deb99a:	2502      	movs	r5, #2
c0deb99c:	eb09 000a 	add.w	r0, r9, sl
c0deb9a0:	4631      	mov	r1, r6
c0deb9a2:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0deb9a6:	f890 3033 	ldrb.w	r3, [r0, #51]	@ 0x33
c0deb9aa:	f880 4031 	strb.w	r4, [r0, #49]	@ 0x31
c0deb9ae:	6446      	str	r6, [r0, #68]	@ 0x44
c0deb9b0:	200c      	movs	r0, #12
c0deb9b2:	f000 fee2 	bl	c0dec77a <nbgl_getTextNbLinesInWidth>
c0deb9b6:	280c      	cmp	r0, #12
c0deb9b8:	d31e      	bcc.n	c0deb9f8 <displayDetailsPage+0x12c>
c0deb9ba:	eb09 040a 	add.w	r4, r9, sl
c0deb9be:	f10d 026a 	add.w	r2, sp, #106	@ 0x6a
c0deb9c2:	230b      	movs	r3, #11
c0deb9c4:	260b      	movs	r6, #11
c0deb9c6:	f894 0033 	ldrb.w	r0, [r4, #51]	@ 0x33
c0deb9ca:	6c61      	ldr	r1, [r4, #68]	@ 0x44
c0deb9cc:	e9cd 2000 	strd	r2, r0, [sp]
c0deb9d0:	200c      	movs	r0, #12
c0deb9d2:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0deb9d6:	f000 feda 	bl	c0dec78e <nbgl_getTextMaxLenInNbLines>
c0deb9da:	f8bd 106a 	ldrh.w	r1, [sp, #106]	@ 0x6a
c0deb9de:	6c60      	ldr	r0, [r4, #68]	@ 0x44
c0deb9e0:	1eca      	subs	r2, r1, #3
c0deb9e2:	4401      	add	r1, r0
c0deb9e4:	f811 3b01 	ldrb.w	r3, [r1], #1
c0deb9e8:	b292      	uxth	r2, r2
c0deb9ea:	2b0a      	cmp	r3, #10
c0deb9ec:	bf18      	it	ne
c0deb9ee:	1881      	addne	r1, r0, r2
c0deb9f0:	63e1      	str	r1, [r4, #60]	@ 0x3c
c0deb9f2:	f88d 6026 	strb.w	r6, [sp, #38]	@ 0x26
c0deb9f6:	e005      	b.n	c0deba04 <displayDetailsPage+0x138>
c0deb9f8:	2100      	movs	r1, #0
c0deb9fa:	eb09 000a 	add.w	r0, r9, sl
c0deb9fe:	63c1      	str	r1, [r0, #60]	@ 0x3c
c0deba00:	f88d 1026 	strb.w	r1, [sp, #38]	@ 0x26
c0deba04:	f1b8 0f01 	cmp.w	r8, #1
c0deba08:	d102      	bne.n	c0deba10 <displayDetailsPage+0x144>
c0deba0a:	480b      	ldr	r0, [pc, #44]	@ (c0deba38 <displayDetailsPage+0x16c>)
c0deba0c:	4478      	add	r0, pc
c0deba0e:	9018      	str	r0, [sp, #96]	@ 0x60
c0deba10:	480a      	ldr	r0, [pc, #40]	@ (c0deba3c <displayDetailsPage+0x170>)
c0deba12:	a913      	add	r1, sp, #76	@ 0x4c
c0deba14:	aa03      	add	r2, sp, #12
c0deba16:	2301      	movs	r3, #1
c0deba18:	4478      	add	r0, pc
c0deba1a:	f7fd fb69 	bl	c0de90f0 <nbgl_pageDrawGenericContentExt>
c0deba1e:	eb09 010a 	add.w	r1, r9, sl
c0deba22:	6208      	str	r0, [r1, #32]
c0deba24:	4628      	mov	r0, r5
c0deba26:	f000 fe53 	bl	c0dec6d0 <nbgl_refreshSpecial>
c0deba2a:	b01b      	add	sp, #108	@ 0x6c
c0deba2c:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}
c0deba30:	03000101 	.word	0x03000101
c0deba34:	00001bc8 	.word	0x00001bc8
c0deba38:	00002ce2 	.word	0x00002ce2
c0deba3c:	ffffed25 	.word	0xffffed25

c0deba40 <displayTagValueListModalPage>:
c0deba40:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0deba44:	b098      	sub	sp, #96	@ 0x60
c0deba46:	4e44      	ldr	r6, [pc, #272]	@ (c0debb58 <displayTagValueListModalPage+0x118>)
c0deba48:	4605      	mov	r5, r0
c0deba4a:	f88d 0044 	strb.w	r0, [sp, #68]	@ 0x44
c0deba4e:	2000      	movs	r0, #0
c0deba50:	4688      	mov	r8, r1
c0deba52:	4940      	ldr	r1, [pc, #256]	@ (c0debb54 <displayTagValueListModalPage+0x114>)
c0deba54:	9016      	str	r0, [sp, #88]	@ 0x58
c0deba56:	f88d 0050 	strb.w	r0, [sp, #80]	@ 0x50
c0deba5a:	9013      	str	r0, [sp, #76]	@ 0x4c
c0deba5c:	f44f 6010 	mov.w	r0, #2304	@ 0x900
c0deba60:	eb09 0406 	add.w	r4, r9, r6
c0deba64:	f8ad 0048 	strh.w	r0, [sp, #72]	@ 0x48
c0deba68:	f44f 7081 	mov.w	r0, #258	@ 0x102
c0deba6c:	9115      	str	r1, [sp, #84]	@ 0x54
c0deba6e:	2140      	movs	r1, #64	@ 0x40
c0deba70:	f894 7030 	ldrb.w	r7, [r4, #48]	@ 0x30
c0deba74:	f8ad 0046 	strh.w	r0, [sp, #70]	@ 0x46
c0deba78:	f88d 7045 	strb.w	r7, [sp, #69]	@ 0x45
c0deba7c:	a801      	add	r0, sp, #4
c0deba7e:	f001 fb47 	bl	c0ded110 <__aeabi_memclr>
c0deba82:	2001      	movs	r0, #1
c0deba84:	f894 1031 	ldrb.w	r1, [r4, #49]	@ 0x31
c0deba88:	f894 2033 	ldrb.w	r2, [r4, #51]	@ 0x33
c0deba8c:	f88d 0020 	strb.w	r0, [sp, #32]
c0deba90:	2004      	movs	r0, #4
c0deba92:	42a9      	cmp	r1, r5
c0deba94:	f88d 0010 	strb.w	r0, [sp, #16]
c0deba98:	f88d 2021 	strb.w	r2, [sp, #33]	@ 0x21
c0deba9c:	d91b      	bls.n	c0debad6 <displayTagValueListModalPage+0x96>
c0deba9e:	1c69      	adds	r1, r5, #1
c0debaa0:	eb09 0306 	add.w	r3, r9, r6
c0debaa4:	ea00 0281 	and.w	r2, r0, r1, lsl #2
c0debaa8:	b2c9      	uxtb	r1, r1
c0debaaa:	f103 0450 	add.w	r4, r3, #80	@ 0x50
c0debaae:	ea00 0085 	and.w	r0, r0, r5, lsl #2
c0debab2:	0849      	lsrs	r1, r1, #1
c0debab4:	5c61      	ldrb	r1, [r4, r1]
c0debab6:	40d1      	lsrs	r1, r2
c0debab8:	f893 2032 	ldrb.w	r2, [r3, #50]	@ 0x32
c0debabc:	f001 0107 	and.w	r1, r1, #7
c0debac0:	1a52      	subs	r2, r2, r1
c0debac2:	0869      	lsrs	r1, r5, #1
c0debac4:	5c61      	ldrb	r1, [r4, r1]
c0debac6:	f883 2032 	strb.w	r2, [r3, #50]	@ 0x32
c0debaca:	fa21 f000 	lsr.w	r0, r1, r0
c0debace:	f000 0107 	and.w	r1, r0, #7
c0debad2:	1a50      	subs	r0, r2, r1
c0debad4:	e00d      	b.n	c0debaf2 <displayTagValueListModalPage+0xb2>
c0debad6:	eb09 0206 	add.w	r2, r9, r6
c0debada:	ea00 0085 	and.w	r0, r0, r5, lsl #2
c0debade:	eb02 0155 	add.w	r1, r2, r5, lsr #1
c0debae2:	f891 1050 	ldrb.w	r1, [r1, #80]	@ 0x50
c0debae6:	fa21 f000 	lsr.w	r0, r1, r0
c0debaea:	f000 0107 	and.w	r1, r0, #7
c0debaee:	f892 0032 	ldrb.w	r0, [r2, #50]	@ 0x32
c0debaf2:	4b1a      	ldr	r3, [pc, #104]	@ (c0debb5c <displayTagValueListModalPage+0x11c>)
c0debaf4:	eb09 0206 	add.w	r2, r9, r6
c0debaf8:	2f01      	cmp	r7, #1
c0debafa:	f882 5031 	strb.w	r5, [r2, #49]	@ 0x31
c0debafe:	444b      	add	r3, r9
c0debb00:	6b9b      	ldr	r3, [r3, #56]	@ 0x38
c0debb02:	681b      	ldr	r3, [r3, #0]
c0debb04:	f88d 101c 	strb.w	r1, [sp, #28]
c0debb08:	4401      	add	r1, r0
c0debb0a:	b2c0      	uxtb	r0, r0
c0debb0c:	f882 1032 	strb.w	r1, [r2, #50]	@ 0x32
c0debb10:	eb03 1000 	add.w	r0, r3, r0, lsl #4
c0debb14:	9005      	str	r0, [sp, #20]
c0debb16:	d102      	bne.n	c0debb1e <displayTagValueListModalPage+0xde>
c0debb18:	4811      	ldr	r0, [pc, #68]	@ (c0debb60 <displayTagValueListModalPage+0x120>)
c0debb1a:	4478      	add	r0, pc
c0debb1c:	9016      	str	r0, [sp, #88]	@ 0x58
c0debb1e:	eb09 0006 	add.w	r0, r9, r6
c0debb22:	6a00      	ldr	r0, [r0, #32]
c0debb24:	b108      	cbz	r0, c0debb2a <displayTagValueListModalPage+0xea>
c0debb26:	f7fd fd0c 	bl	c0de9542 <nbgl_pageRelease>
c0debb2a:	480e      	ldr	r0, [pc, #56]	@ (c0debb64 <displayTagValueListModalPage+0x124>)
c0debb2c:	a911      	add	r1, sp, #68	@ 0x44
c0debb2e:	aa01      	add	r2, sp, #4
c0debb30:	2301      	movs	r3, #1
c0debb32:	2501      	movs	r5, #1
c0debb34:	4478      	add	r0, pc
c0debb36:	f7fd fadb 	bl	c0de90f0 <nbgl_pageDrawGenericContentExt>
c0debb3a:	eb09 0106 	add.w	r1, r9, r6
c0debb3e:	f1b8 0f00 	cmp.w	r8, #0
c0debb42:	6208      	str	r0, [r1, #32]
c0debb44:	bf18      	it	ne
c0debb46:	2502      	movne	r5, #2
c0debb48:	4628      	mov	r0, r5
c0debb4a:	f000 fdc1 	bl	c0dec6d0 <nbgl_refreshSpecial>
c0debb4e:	b018      	add	sp, #96	@ 0x60
c0debb50:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0debb54:	04000101 	.word	0x04000101
c0debb58:	00001bc8 	.word	0x00001bc8
c0debb5c:	000018fc 	.word	0x000018fc
c0debb60:	00002bd4 	.word	0x00002bd4
c0debb64:	ffffec09 	.word	0xffffec09

c0debb68 <bundleNavReviewChoice>:
c0debb68:	b120      	cbz	r0, c0debb74 <bundleNavReviewChoice+0xc>
c0debb6a:	4806      	ldr	r0, [pc, #24]	@ (c0debb84 <bundleNavReviewChoice+0x1c>)
c0debb6c:	4448      	add	r0, r9
c0debb6e:	6a41      	ldr	r1, [r0, #36]	@ 0x24
c0debb70:	2001      	movs	r0, #1
c0debb72:	4708      	bx	r1
c0debb74:	4803      	ldr	r0, [pc, #12]	@ (c0debb84 <bundleNavReviewChoice+0x1c>)
c0debb76:	4448      	add	r0, r9
c0debb78:	6a00      	ldr	r0, [r0, #32]
c0debb7a:	4903      	ldr	r1, [pc, #12]	@ (c0debb88 <bundleNavReviewChoice+0x20>)
c0debb7c:	4479      	add	r1, pc
c0debb7e:	f000 b863 	b.w	c0debc48 <bundleNavReviewAskRejectionConfirmation>
c0debb82:	bf00      	nop
c0debb84:	00001c44 	.word	0x00001c44
c0debb88:	0000011d 	.word	0x0000011d

c0debb8c <initWarningTipBox>:
c0debb8c:	4923      	ldr	r1, [pc, #140]	@ (c0debc1c <initWarningTipBox+0x90>)
c0debb8e:	eb09 0201 	add.w	r2, r9, r1
c0debb92:	6d92      	ldr	r2, [r2, #88]	@ 0x58
c0debb94:	b15a      	cbz	r2, c0debbae <initWarningTipBox+0x22>
c0debb96:	6812      	ldr	r2, [r2, #0]
c0debb98:	07d3      	lsls	r3, r2, #31
c0debb9a:	d111      	bne.n	c0debbc0 <initWarningTipBox+0x34>
c0debb9c:	0753      	lsls	r3, r2, #29
c0debb9e:	d415      	bmi.n	c0debbcc <initWarningTipBox+0x40>
c0debba0:	0793      	lsls	r3, r2, #30
c0debba2:	d419      	bmi.n	c0debbd8 <initWarningTipBox+0x4c>
c0debba4:	f002 0310 	and.w	r3, r2, #16
c0debba8:	0712      	lsls	r2, r2, #28
c0debbaa:	d42c      	bmi.n	c0debc06 <initWarningTipBox+0x7a>
c0debbac:	bb9b      	cbnz	r3, c0debc16 <initWarningTipBox+0x8a>
c0debbae:	b348      	cbz	r0, c0debc04 <initWarningTipBox+0x78>
c0debbb0:	491b      	ldr	r1, [pc, #108]	@ (c0debc20 <initWarningTipBox+0x94>)
c0debbb2:	2200      	movs	r2, #0
c0debbb4:	4449      	add	r1, r9
c0debbb6:	620a      	str	r2, [r1, #32]
c0debbb8:	6842      	ldr	r2, [r0, #4]
c0debbba:	62ca      	str	r2, [r1, #44]	@ 0x2c
c0debbbc:	6800      	ldr	r0, [r0, #0]
c0debbbe:	e01b      	b.n	c0debbf8 <initWarningTipBox+0x6c>
c0debbc0:	06d0      	lsls	r0, r2, #27
c0debbc2:	4a18      	ldr	r2, [pc, #96]	@ (c0debc24 <initWarningTipBox+0x98>)
c0debbc4:	4818      	ldr	r0, [pc, #96]	@ (c0debc28 <initWarningTipBox+0x9c>)
c0debbc6:	447a      	add	r2, pc
c0debbc8:	4478      	add	r0, pc
c0debbca:	e00a      	b.n	c0debbe2 <initWarningTipBox+0x56>
c0debbcc:	06d0      	lsls	r0, r2, #27
c0debbce:	4a17      	ldr	r2, [pc, #92]	@ (c0debc2c <initWarningTipBox+0xa0>)
c0debbd0:	4817      	ldr	r0, [pc, #92]	@ (c0debc30 <initWarningTipBox+0xa4>)
c0debbd2:	447a      	add	r2, pc
c0debbd4:	4478      	add	r0, pc
c0debbd6:	e004      	b.n	c0debbe2 <initWarningTipBox+0x56>
c0debbd8:	06d0      	lsls	r0, r2, #27
c0debbda:	4a16      	ldr	r2, [pc, #88]	@ (c0debc34 <initWarningTipBox+0xa8>)
c0debbdc:	4816      	ldr	r0, [pc, #88]	@ (c0debc38 <initWarningTipBox+0xac>)
c0debbde:	447a      	add	r2, pc
c0debbe0:	4478      	add	r0, pc
c0debbe2:	bf58      	it	pl
c0debbe4:	4610      	movpl	r0, r2
c0debbe6:	4449      	add	r1, r9
c0debbe8:	2201      	movs	r2, #1
c0debbea:	f881 2021 	strb.w	r2, [r1, #33]	@ 0x21
c0debbee:	490c      	ldr	r1, [pc, #48]	@ (c0debc20 <initWarningTipBox+0x94>)
c0debbf0:	2200      	movs	r2, #0
c0debbf2:	4449      	add	r1, r9
c0debbf4:	620a      	str	r2, [r1, #32]
c0debbf6:	62ca      	str	r2, [r1, #44]	@ 0x2c
c0debbf8:	4909      	ldr	r1, [pc, #36]	@ (c0debc20 <initWarningTipBox+0x94>)
c0debbfa:	f640 1212 	movw	r2, #2322	@ 0x912
c0debbfe:	4449      	add	r1, r9
c0debc00:	860a      	strh	r2, [r1, #48]	@ 0x30
c0debc02:	6288      	str	r0, [r1, #40]	@ 0x28
c0debc04:	4770      	bx	lr
c0debc06:	4a0d      	ldr	r2, [pc, #52]	@ (c0debc3c <initWarningTipBox+0xb0>)
c0debc08:	480d      	ldr	r0, [pc, #52]	@ (c0debc40 <initWarningTipBox+0xb4>)
c0debc0a:	2b00      	cmp	r3, #0
c0debc0c:	4478      	add	r0, pc
c0debc0e:	447a      	add	r2, pc
c0debc10:	bf08      	it	eq
c0debc12:	4610      	moveq	r0, r2
c0debc14:	e7e7      	b.n	c0debbe6 <initWarningTipBox+0x5a>
c0debc16:	480b      	ldr	r0, [pc, #44]	@ (c0debc44 <initWarningTipBox+0xb8>)
c0debc18:	4478      	add	r0, pc
c0debc1a:	e7e4      	b.n	c0debbe6 <initWarningTipBox+0x5a>
c0debc1c:	000018fc 	.word	0x000018fc
c0debc20:	00001968 	.word	0x00001968
c0debc24:	000028b2 	.word	0x000028b2
c0debc28:	00002998 	.word	0x00002998
c0debc2c:	0000305c 	.word	0x0000305c
c0debc30:	00002921 	.word	0x00002921
c0debc34:	0000308e 	.word	0x0000308e
c0debc38:	00002dfd 	.word	0x00002dfd
c0debc3c:	00002e06 	.word	0x00002e06
c0debc40:	00003079 	.word	0x00003079
c0debc44:	00002cbb 	.word	0x00002cbb

c0debc48 <bundleNavReviewAskRejectionConfirmation>:
c0debc48:	f020 00f0 	bic.w	r0, r0, #240	@ 0xf0
c0debc4c:	b130      	cbz	r0, c0debc5c <bundleNavReviewAskRejectionConfirmation+0x14>
c0debc4e:	2801      	cmp	r0, #1
c0debc50:	d109      	bne.n	c0debc66 <bundleNavReviewAskRejectionConfirmation+0x1e>
c0debc52:	4b0d      	ldr	r3, [pc, #52]	@ (c0debc88 <bundleNavReviewAskRejectionConfirmation+0x40>)
c0debc54:	480d      	ldr	r0, [pc, #52]	@ (c0debc8c <bundleNavReviewAskRejectionConfirmation+0x44>)
c0debc56:	447b      	add	r3, pc
c0debc58:	4478      	add	r0, pc
c0debc5a:	e008      	b.n	c0debc6e <bundleNavReviewAskRejectionConfirmation+0x26>
c0debc5c:	4b08      	ldr	r3, [pc, #32]	@ (c0debc80 <bundleNavReviewAskRejectionConfirmation+0x38>)
c0debc5e:	4809      	ldr	r0, [pc, #36]	@ (c0debc84 <bundleNavReviewAskRejectionConfirmation+0x3c>)
c0debc60:	447b      	add	r3, pc
c0debc62:	4478      	add	r0, pc
c0debc64:	e003      	b.n	c0debc6e <bundleNavReviewAskRejectionConfirmation+0x26>
c0debc66:	4b0a      	ldr	r3, [pc, #40]	@ (c0debc90 <bundleNavReviewAskRejectionConfirmation+0x48>)
c0debc68:	480a      	ldr	r0, [pc, #40]	@ (c0debc94 <bundleNavReviewAskRejectionConfirmation+0x4c>)
c0debc6a:	447b      	add	r3, pc
c0debc6c:	4478      	add	r0, pc
c0debc6e:	b5e0      	push	{r5, r6, r7, lr}
c0debc70:	9100      	str	r1, [sp, #0]
c0debc72:	2100      	movs	r1, #0
c0debc74:	4a08      	ldr	r2, [pc, #32]	@ (c0debc98 <bundleNavReviewAskRejectionConfirmation+0x50>)
c0debc76:	447a      	add	r2, pc
c0debc78:	f7fe fd38 	bl	c0dea6ec <nbgl_useCaseConfirm>
c0debc7c:	bd8c      	pop	{r2, r3, r7, pc}
c0debc7e:	bf00      	nop
c0debc80:	00002a4c 	.word	0x00002a4c
c0debc84:	0000287f 	.word	0x0000287f
c0debc88:	00002d74 	.word	0x00002d74
c0debc8c:	0000314c 	.word	0x0000314c
c0debc90:	000028e1 	.word	0x000028e1
c0debc94:	00002df6 	.word	0x00002df6
c0debc98:	00002bcb 	.word	0x00002bcb

c0debc9c <bundleNavReviewConfirmRejection>:
c0debc9c:	4801      	ldr	r0, [pc, #4]	@ (c0debca4 <bundleNavReviewConfirmRejection+0x8>)
c0debc9e:	f000 b881 	b.w	c0debda4 <OUTLINED_FUNCTION_9>
c0debca2:	bf00      	nop
c0debca4:	00001c44 	.word	0x00001c44

c0debca8 <layoutTouchCallback>:
c0debca8:	b5f0      	push	{r4, r5, r6, r7, lr}
c0debcaa:	b087      	sub	sp, #28
c0debcac:	2811      	cmp	r0, #17
c0debcae:	d017      	beq.n	c0debce0 <layoutTouchCallback+0x38>
c0debcb0:	2814      	cmp	r0, #20
c0debcb2:	d142      	bne.n	c0debd3a <layoutTouchCallback+0x92>
c0debcb4:	b1e9      	cbz	r1, c0debcf2 <layoutTouchCallback+0x4a>
c0debcb6:	4922      	ldr	r1, [pc, #136]	@ (c0debd40 <layoutTouchCallback+0x98>)
c0debcb8:	2400      	movs	r4, #0
c0debcba:	eb09 0201 	add.w	r2, r9, r1
c0debcbe:	eb09 0501 	add.w	r5, r9, r1
c0debcc2:	f882 4069 	strb.w	r4, [r2, #105]	@ 0x69
c0debcc6:	6c10      	ldr	r0, [r2, #64]	@ 0x40
c0debcc8:	f892 203c 	ldrb.w	r2, [r2, #60]	@ 0x3c
c0debccc:	b33a      	cbz	r2, c0debd1e <layoutTouchCallback+0x76>
c0debcce:	f105 0348 	add.w	r3, r5, #72	@ 0x48
c0debcd2:	6ded      	ldr	r5, [r5, #92]	@ 0x5c
c0debcd4:	cb0e      	ldmia	r3, {r1, r2, r3}
c0debcd6:	e9cd 5400 	strd	r5, r4, [sp]
c0debcda:	f7fe fff5 	bl	c0deacc8 <useCaseReviewStreamingStart>
c0debcde:	e02c      	b.n	c0debd3a <layoutTouchCallback+0x92>
c0debce0:	4a17      	ldr	r2, [pc, #92]	@ (c0debd40 <layoutTouchCallback+0x98>)
c0debce2:	f000 f84a 	bl	c0debd7a <OUTLINED_FUNCTION_4>
c0debce6:	d00c      	beq.n	c0debd02 <layoutTouchCallback+0x5a>
c0debce8:	b007      	add	sp, #28
c0debcea:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0debcee:	f7ff bbb7 	b.w	c0deb460 <displaySecurityReport>
c0debcf2:	4813      	ldr	r0, [pc, #76]	@ (c0debd40 <layoutTouchCallback+0x98>)
c0debcf4:	4448      	add	r0, r9
c0debcf6:	6dc1      	ldr	r1, [r0, #92]	@ 0x5c
c0debcf8:	2000      	movs	r0, #0
c0debcfa:	b007      	add	sp, #28
c0debcfc:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0debd00:	4708      	bx	r1
c0debd02:	eb09 0002 	add.w	r0, r9, r2
c0debd06:	2214      	movs	r2, #20
c0debd08:	f890 0069 	ldrb.w	r0, [r0, #105]	@ 0x69
c0debd0c:	2800      	cmp	r0, #0
c0debd0e:	bf08      	it	eq
c0debd10:	2218      	moveq	r2, #24
c0debd12:	5888      	ldr	r0, [r1, r2]
c0debd14:	b007      	add	sp, #28
c0debd16:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0debd1a:	f7ff bcab 	b.w	c0deb674 <displayCustomizedSecurityReport>
c0debd1e:	f105 0744 	add.w	r7, r5, #68	@ 0x44
c0debd22:	6ded      	ldr	r5, [r5, #92]	@ 0x5c
c0debd24:	cfce      	ldmia	r7, {r1, r2, r3, r6, r7}
c0debd26:	9405      	str	r4, [sp, #20]
c0debd28:	e9cd 6700 	strd	r6, r7, [sp]
c0debd2c:	e9cd 5403 	strd	r5, r4, [sp, #12]
c0debd30:	4c04      	ldr	r4, [pc, #16]	@ (c0debd44 <layoutTouchCallback+0x9c>)
c0debd32:	444c      	add	r4, r9
c0debd34:	9402      	str	r4, [sp, #8]
c0debd36:	f7fe fddf 	bl	c0dea8f8 <useCaseReview>
c0debd3a:	b007      	add	sp, #28
c0debd3c:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0debd3e:	bf00      	nop
c0debd40:	000018fc 	.word	0x000018fc
c0debd44:	00001c44 	.word	0x00001c44

c0debd48 <bundleNavReviewStreamingConfirmRejection>:
c0debd48:	4801      	ldr	r0, [pc, #4]	@ (c0debd50 <bundleNavReviewStreamingConfirmRejection+0x8>)
c0debd4a:	f000 b82b 	b.w	c0debda4 <OUTLINED_FUNCTION_9>
c0debd4e:	bf00      	nop
c0debd50:	00001c44 	.word	0x00001c44

c0debd54 <OUTLINED_FUNCTION_0>:
c0debd54:	4615      	mov	r5, r2
c0debd56:	460e      	mov	r6, r1
c0debd58:	4607      	mov	r7, r0
c0debd5a:	f7fd be0d 	b.w	c0de9978 <reset_callbacks_and_context>

c0debd5e <OUTLINED_FUNCTION_1>:
c0debd5e:	f8da 0004 	ldr.w	r0, [sl, #4]
c0debd62:	eb00 0086 	add.w	r0, r0, r6, lsl #2
c0debd66:	f000 becb 	b.w	c0decb00 <pic>

c0debd6a <OUTLINED_FUNCTION_2>:
c0debd6a:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0debd6e:	2301      	movs	r3, #1
c0debd70:	f000 bcfe 	b.w	c0dec770 <nbgl_getTextHeightInWidth>

c0debd74 <OUTLINED_FUNCTION_3>:
c0debd74:	2001      	movs	r0, #1
c0debd76:	f000 bcab 	b.w	c0dec6d0 <nbgl_refreshSpecial>

c0debd7a <OUTLINED_FUNCTION_4>:
c0debd7a:	2101      	movs	r1, #1
c0debd7c:	eb09 0002 	add.w	r0, r9, r2
c0debd80:	f880 1068 	strb.w	r1, [r0, #104]	@ 0x68
c0debd84:	6d81      	ldr	r1, [r0, #88]	@ 0x58
c0debd86:	6808      	ldr	r0, [r1, #0]
c0debd88:	2800      	cmp	r0, #0
c0debd8a:	4770      	bx	lr

c0debd8c <OUTLINED_FUNCTION_5>:
c0debd8c:	2000      	movs	r0, #0
c0debd8e:	f7fd bed1 	b.w	c0de9b34 <getNbPagesForGenericContents>

c0debd92 <OUTLINED_FUNCTION_6>:
c0debd92:	2008      	movs	r0, #8
c0debd94:	f7f8 be9b 	b.w	c0de4ace <os_io_seph_cmd_piezo_play_tune>

c0debd98 <OUTLINED_FUNCTION_7>:
c0debd98:	9001      	str	r0, [sp, #4]
c0debd9a:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0debd9c:	9000      	str	r0, [sp, #0]
c0debd9e:	4638      	mov	r0, r7
c0debda0:	f7fe bdaa 	b.w	c0dea8f8 <useCaseReview>

c0debda4 <OUTLINED_FUNCTION_9>:
c0debda4:	4448      	add	r0, r9
c0debda6:	6a41      	ldr	r1, [r0, #36]	@ 0x24
c0debda8:	2000      	movs	r0, #0
c0debdaa:	4708      	bx	r1

c0debdac <OUTLINED_FUNCTION_11>:
c0debdac:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0debdb0:	2300      	movs	r3, #0
c0debdb2:	f000 bce2 	b.w	c0dec77a <nbgl_getTextNbLinesInWidth>

c0debdb6 <OUTLINED_FUNCTION_12>:
c0debdb6:	200b      	movs	r0, #11
c0debdb8:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0debdbc:	f000 bcd8 	b.w	c0dec770 <nbgl_getTextHeightInWidth>

c0debdc0 <OUTLINED_FUNCTION_13>:
c0debdc0:	4630      	mov	r0, r6
c0debdc2:	f001 b9a5 	b.w	c0ded110 <__aeabi_memclr>

c0debdc6 <OUTLINED_FUNCTION_14>:
c0debdc6:	f10a 0004 	add.w	r0, sl, #4
c0debdca:	f107 0110 	add.w	r1, r7, #16
c0debdce:	4770      	bx	lr

c0debdd0 <bip32_path_read>:
c0debdd0:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0debdd4:	b10b      	cbz	r3, c0debdda <bip32_path_read+0xa>
c0debdd6:	2b0a      	cmp	r3, #10
c0debdd8:	d902      	bls.n	c0debde0 <bip32_path_read+0x10>
c0debdda:	2000      	movs	r0, #0
c0debddc:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0debde0:	4692      	mov	sl, r2
c0debde2:	460e      	mov	r6, r1
c0debde4:	4683      	mov	fp, r0
c0debde6:	425f      	negs	r7, r3
c0debde8:	2500      	movs	r5, #0
c0debdea:	f04f 0800 	mov.w	r8, #0
c0debdee:	9301      	str	r3, [sp, #4]
c0debdf0:	42af      	cmp	r7, r5
c0debdf2:	d00c      	beq.n	c0debe0e <bip32_path_read+0x3e>
c0debdf4:	f108 0404 	add.w	r4, r8, #4
c0debdf8:	42b4      	cmp	r4, r6
c0debdfa:	d808      	bhi.n	c0debe0e <bip32_path_read+0x3e>
c0debdfc:	4658      	mov	r0, fp
c0debdfe:	4641      	mov	r1, r8
c0debe00:	f000 faee 	bl	c0dec3e0 <read_u32_be>
c0debe04:	f84a 0008 	str.w	r0, [sl, r8]
c0debe08:	3d01      	subs	r5, #1
c0debe0a:	46a0      	mov	r8, r4
c0debe0c:	e7f0      	b.n	c0debdf0 <bip32_path_read+0x20>
c0debe0e:	9a01      	ldr	r2, [sp, #4]
c0debe10:	4269      	negs	r1, r5
c0debe12:	2000      	movs	r0, #0
c0debe14:	4291      	cmp	r1, r2
c0debe16:	bf28      	it	cs
c0debe18:	2001      	movcs	r0, #1
c0debe1a:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}

c0debe1e <buffer_seek_cur>:
c0debe1e:	6882      	ldr	r2, [r0, #8]
c0debe20:	1889      	adds	r1, r1, r2
c0debe22:	d205      	bcs.n	c0debe30 <buffer_seek_cur+0x12>
c0debe24:	6842      	ldr	r2, [r0, #4]
c0debe26:	4291      	cmp	r1, r2
c0debe28:	bf9e      	ittt	ls
c0debe2a:	6081      	strls	r1, [r0, #8]
c0debe2c:	2001      	movls	r0, #1
c0debe2e:	4770      	bxls	lr
c0debe30:	2000      	movs	r0, #0
c0debe32:	4770      	bx	lr

c0debe34 <buffer_read_u8>:
c0debe34:	b510      	push	{r4, lr}
c0debe36:	e9d0 2301 	ldrd	r2, r3, [r0, #4]
c0debe3a:	429a      	cmp	r2, r3
c0debe3c:	d00a      	beq.n	c0debe54 <buffer_read_u8+0x20>
c0debe3e:	6804      	ldr	r4, [r0, #0]
c0debe40:	5ce4      	ldrb	r4, [r4, r3]
c0debe42:	700c      	strb	r4, [r1, #0]
c0debe44:	6881      	ldr	r1, [r0, #8]
c0debe46:	3101      	adds	r1, #1
c0debe48:	d206      	bcs.n	c0debe58 <buffer_read_u8+0x24>
c0debe4a:	6844      	ldr	r4, [r0, #4]
c0debe4c:	42a1      	cmp	r1, r4
c0debe4e:	bf98      	it	ls
c0debe50:	6081      	strls	r1, [r0, #8]
c0debe52:	e001      	b.n	c0debe58 <buffer_read_u8+0x24>
c0debe54:	2000      	movs	r0, #0
c0debe56:	7008      	strb	r0, [r1, #0]
c0debe58:	1ad0      	subs	r0, r2, r3
c0debe5a:	bf18      	it	ne
c0debe5c:	2001      	movne	r0, #1
c0debe5e:	bd10      	pop	{r4, pc}

c0debe60 <buffer_read_u64>:
c0debe60:	b570      	push	{r4, r5, r6, lr}
c0debe62:	f000 f87d 	bl	c0debf60 <OUTLINED_FUNCTION_0>
c0debe66:	2e07      	cmp	r6, #7
c0debe68:	d904      	bls.n	c0debe74 <buffer_read_u64+0x14>
c0debe6a:	6820      	ldr	r0, [r4, #0]
c0debe6c:	b132      	cbz	r2, c0debe7c <buffer_read_u64+0x1c>
c0debe6e:	f000 faee 	bl	c0dec44e <read_u64_le>
c0debe72:	e005      	b.n	c0debe80 <buffer_read_u64+0x20>
c0debe74:	2000      	movs	r0, #0
c0debe76:	e9c5 0000 	strd	r0, r0, [r5]
c0debe7a:	e00c      	b.n	c0debe96 <buffer_read_u64+0x36>
c0debe7c:	f000 fabc 	bl	c0dec3f8 <read_u64_be>
c0debe80:	e9c5 0100 	strd	r0, r1, [r5]
c0debe84:	68a0      	ldr	r0, [r4, #8]
c0debe86:	f110 0f09 	cmn.w	r0, #9
c0debe8a:	d804      	bhi.n	c0debe96 <buffer_read_u64+0x36>
c0debe8c:	6861      	ldr	r1, [r4, #4]
c0debe8e:	3008      	adds	r0, #8
c0debe90:	4288      	cmp	r0, r1
c0debe92:	bf98      	it	ls
c0debe94:	60a0      	strls	r0, [r4, #8]
c0debe96:	2000      	movs	r0, #0
c0debe98:	2e07      	cmp	r6, #7
c0debe9a:	bf88      	it	hi
c0debe9c:	2001      	movhi	r0, #1
c0debe9e:	bd70      	pop	{r4, r5, r6, pc}

c0debea0 <buffer_read_varint>:
c0debea0:	b5b0      	push	{r4, r5, r7, lr}
c0debea2:	4604      	mov	r4, r0
c0debea4:	460d      	mov	r5, r1
c0debea6:	6800      	ldr	r0, [r0, #0]
c0debea8:	e9d4 1201 	ldrd	r1, r2, [r4, #4]
c0debeac:	4410      	add	r0, r2
c0debeae:	1a89      	subs	r1, r1, r2
c0debeb0:	462a      	mov	r2, r5
c0debeb2:	f000 fae3 	bl	c0dec47c <varint_read>
c0debeb6:	f1b0 3fff 	cmp.w	r0, #4294967295	@ 0xffffffff
c0debeba:	dd0a      	ble.n	c0debed2 <buffer_read_varint+0x32>
c0debebc:	68a1      	ldr	r1, [r4, #8]
c0debebe:	1840      	adds	r0, r0, r1
c0debec0:	d205      	bcs.n	c0debece <buffer_read_varint+0x2e>
c0debec2:	6861      	ldr	r1, [r4, #4]
c0debec4:	4288      	cmp	r0, r1
c0debec6:	bf9e      	ittt	ls
c0debec8:	60a0      	strls	r0, [r4, #8]
c0debeca:	2001      	movls	r0, #1
c0debecc:	bdb0      	popls	{r4, r5, r7, pc}
c0debece:	2000      	movs	r0, #0
c0debed0:	bdb0      	pop	{r4, r5, r7, pc}
c0debed2:	2000      	movs	r0, #0
c0debed4:	e9c5 0000 	strd	r0, r0, [r5]
c0debed8:	bdb0      	pop	{r4, r5, r7, pc}

c0debeda <buffer_read_bip32_path>:
c0debeda:	b5b0      	push	{r4, r5, r7, lr}
c0debedc:	4604      	mov	r4, r0
c0debede:	4615      	mov	r5, r2
c0debee0:	460a      	mov	r2, r1
c0debee2:	6800      	ldr	r0, [r0, #0]
c0debee4:	e9d4 1301 	ldrd	r1, r3, [r4, #4]
c0debee8:	4418      	add	r0, r3
c0debeea:	1ac9      	subs	r1, r1, r3
c0debeec:	462b      	mov	r3, r5
c0debeee:	f7ff ff6f 	bl	c0debdd0 <bip32_path_read>
c0debef2:	b140      	cbz	r0, c0debf06 <buffer_read_bip32_path+0x2c>
c0debef4:	68a2      	ldr	r2, [r4, #8]
c0debef6:	eb02 0185 	add.w	r1, r2, r5, lsl #2
c0debefa:	4291      	cmp	r1, r2
c0debefc:	d303      	bcc.n	c0debf06 <buffer_read_bip32_path+0x2c>
c0debefe:	6862      	ldr	r2, [r4, #4]
c0debf00:	4291      	cmp	r1, r2
c0debf02:	bf98      	it	ls
c0debf04:	60a1      	strls	r1, [r4, #8]
c0debf06:	bdb0      	pop	{r4, r5, r7, pc}

c0debf08 <buffer_copy>:
c0debf08:	b5b0      	push	{r4, r5, r7, lr}
c0debf0a:	4614      	mov	r4, r2
c0debf0c:	e9d0 3201 	ldrd	r3, r2, [r0, #4]
c0debf10:	1a9d      	subs	r5, r3, r2
c0debf12:	42a5      	cmp	r5, r4
c0debf14:	d806      	bhi.n	c0debf24 <buffer_copy+0x1c>
c0debf16:	6800      	ldr	r0, [r0, #0]
c0debf18:	4402      	add	r2, r0
c0debf1a:	4608      	mov	r0, r1
c0debf1c:	4611      	mov	r1, r2
c0debf1e:	462a      	mov	r2, r5
c0debf20:	f001 f8ee 	bl	c0ded100 <__aeabi_memmove>
c0debf24:	2000      	movs	r0, #0
c0debf26:	42a5      	cmp	r5, r4
c0debf28:	bf98      	it	ls
c0debf2a:	2001      	movls	r0, #1
c0debf2c:	bdb0      	pop	{r4, r5, r7, pc}

c0debf2e <buffer_move>:
c0debf2e:	b5b0      	push	{r4, r5, r7, lr}
c0debf30:	4615      	mov	r5, r2
c0debf32:	4604      	mov	r4, r0
c0debf34:	e9d0 2001 	ldrd	r2, r0, [r0, #4]
c0debf38:	1a12      	subs	r2, r2, r0
c0debf3a:	42aa      	cmp	r2, r5
c0debf3c:	bf84      	itt	hi
c0debf3e:	2000      	movhi	r0, #0
c0debf40:	bdb0      	pophi	{r4, r5, r7, pc}
c0debf42:	6823      	ldr	r3, [r4, #0]
c0debf44:	4403      	add	r3, r0
c0debf46:	4608      	mov	r0, r1
c0debf48:	4619      	mov	r1, r3
c0debf4a:	f001 f8d9 	bl	c0ded100 <__aeabi_memmove>
c0debf4e:	68a0      	ldr	r0, [r4, #8]
c0debf50:	1940      	adds	r0, r0, r5
c0debf52:	d203      	bcs.n	c0debf5c <buffer_move+0x2e>
c0debf54:	6861      	ldr	r1, [r4, #4]
c0debf56:	4288      	cmp	r0, r1
c0debf58:	bf98      	it	ls
c0debf5a:	60a0      	strls	r0, [r4, #8]
c0debf5c:	2001      	movs	r0, #1
c0debf5e:	bdb0      	pop	{r4, r5, r7, pc}

c0debf60 <OUTLINED_FUNCTION_0>:
c0debf60:	4604      	mov	r4, r0
c0debf62:	460d      	mov	r5, r1
c0debf64:	6840      	ldr	r0, [r0, #4]
c0debf66:	68a1      	ldr	r1, [r4, #8]
c0debf68:	1a46      	subs	r6, r0, r1
c0debf6a:	4770      	bx	lr

c0debf6c <bip32_derive_with_seed_init_privkey_256>:
c0debf6c:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0debf70:	b095      	sub	sp, #84	@ 0x54
c0debf72:	460d      	mov	r5, r1
c0debf74:	4607      	mov	r7, r0
c0debf76:	a904      	add	r1, sp, #16
c0debf78:	469a      	mov	sl, r3
c0debf7a:	4614      	mov	r4, r2
c0debf7c:	4628      	mov	r0, r5
c0debf7e:	f000 fee9 	bl	c0decd54 <cx_ecdomain_parameters_length>
c0debf82:	f8dd 8070 	ldr.w	r8, [sp, #112]	@ 0x70
c0debf86:	4606      	mov	r6, r0
c0debf88:	b9e0      	cbnz	r0, c0debfc4 <bip32_derive_with_seed_init_privkey_256+0x58>
c0debf8a:	9804      	ldr	r0, [sp, #16]
c0debf8c:	2820      	cmp	r0, #32
c0debf8e:	d117      	bne.n	c0debfc0 <bip32_derive_with_seed_init_privkey_256+0x54>
c0debf90:	981f      	ldr	r0, [sp, #124]	@ 0x7c
c0debf92:	e9dd 211d 	ldrd	r2, r1, [sp, #116]	@ 0x74
c0debf96:	ab05      	add	r3, sp, #20
c0debf98:	e9cd 3200 	strd	r3, r2, [sp]
c0debf9c:	e9cd 1002 	strd	r1, r0, [sp, #8]
c0debfa0:	4638      	mov	r0, r7
c0debfa2:	4629      	mov	r1, r5
c0debfa4:	4622      	mov	r2, r4
c0debfa6:	4653      	mov	r3, sl
c0debfa8:	f000 f818 	bl	c0debfdc <os_derive_bip32_with_seed_no_throw>
c0debfac:	4606      	mov	r6, r0
c0debfae:	b948      	cbnz	r0, c0debfc4 <bip32_derive_with_seed_init_privkey_256+0x58>
c0debfb0:	9a04      	ldr	r2, [sp, #16]
c0debfb2:	a905      	add	r1, sp, #20
c0debfb4:	4628      	mov	r0, r5
c0debfb6:	4643      	mov	r3, r8
c0debfb8:	f000 fb61 	bl	c0dec67e <cx_ecfp_init_private_key_no_throw>
c0debfbc:	4606      	mov	r6, r0
c0debfbe:	e001      	b.n	c0debfc4 <bip32_derive_with_seed_init_privkey_256+0x58>
c0debfc0:	f06f 065c 	mvn.w	r6, #92	@ 0x5c
c0debfc4:	a805      	add	r0, sp, #20
c0debfc6:	2140      	movs	r1, #64	@ 0x40
c0debfc8:	f001 f8b0 	bl	c0ded12c <explicit_bzero>
c0debfcc:	b116      	cbz	r6, c0debfd4 <bip32_derive_with_seed_init_privkey_256+0x68>
c0debfce:	4640      	mov	r0, r8
c0debfd0:	f000 f89f 	bl	c0dec112 <OUTLINED_FUNCTION_0>
c0debfd4:	4630      	mov	r0, r6
c0debfd6:	b015      	add	sp, #84	@ 0x54
c0debfd8:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}

c0debfdc <os_derive_bip32_with_seed_no_throw>:
c0debfdc:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0debfe0:	b090      	sub	sp, #64	@ 0x40
c0debfe2:	f10d 0810 	add.w	r8, sp, #16
c0debfe6:	4607      	mov	r7, r0
c0debfe8:	469b      	mov	fp, r3
c0debfea:	4616      	mov	r6, r2
c0debfec:	460c      	mov	r4, r1
c0debfee:	4640      	mov	r0, r8
c0debff0:	f001 f8e2 	bl	c0ded1b8 <setjmp>
c0debff4:	b285      	uxth	r5, r0
c0debff6:	f8dd a060 	ldr.w	sl, [sp, #96]	@ 0x60
c0debffa:	f8ad 003c 	strh.w	r0, [sp, #60]	@ 0x3c
c0debffe:	b155      	cbz	r5, c0dec016 <os_derive_bip32_with_seed_no_throw+0x3a>
c0dec000:	2000      	movs	r0, #0
c0dec002:	f8ad 003c 	strh.w	r0, [sp, #60]	@ 0x3c
c0dec006:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0dec008:	f000 ff4c 	bl	c0decea4 <try_context_set>
c0dec00c:	2140      	movs	r1, #64	@ 0x40
c0dec00e:	4650      	mov	r0, sl
c0dec010:	f001 f88c 	bl	c0ded12c <explicit_bzero>
c0dec014:	e012      	b.n	c0dec03c <os_derive_bip32_with_seed_no_throw+0x60>
c0dec016:	a804      	add	r0, sp, #16
c0dec018:	f000 ff44 	bl	c0decea4 <try_context_set>
c0dec01c:	9919      	ldr	r1, [sp, #100]	@ 0x64
c0dec01e:	900e      	str	r0, [sp, #56]	@ 0x38
c0dec020:	4668      	mov	r0, sp
c0dec022:	4632      	mov	r2, r6
c0dec024:	465b      	mov	r3, fp
c0dec026:	f8c0 a000 	str.w	sl, [r0]
c0dec02a:	6041      	str	r1, [r0, #4]
c0dec02c:	991a      	ldr	r1, [sp, #104]	@ 0x68
c0dec02e:	6081      	str	r1, [r0, #8]
c0dec030:	991b      	ldr	r1, [sp, #108]	@ 0x6c
c0dec032:	60c1      	str	r1, [r0, #12]
c0dec034:	4638      	mov	r0, r7
c0dec036:	4621      	mov	r1, r4
c0dec038:	f000 fe96 	bl	c0decd68 <os_perso_derive_node_with_seed_key>
c0dec03c:	f000 ff2a 	bl	c0dece94 <try_context_get>
c0dec040:	4540      	cmp	r0, r8
c0dec042:	d102      	bne.n	c0dec04a <os_derive_bip32_with_seed_no_throw+0x6e>
c0dec044:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0dec046:	f000 ff2d 	bl	c0decea4 <try_context_set>
c0dec04a:	f8bd 003c 	ldrh.w	r0, [sp, #60]	@ 0x3c
c0dec04e:	b918      	cbnz	r0, c0dec058 <os_derive_bip32_with_seed_no_throw+0x7c>
c0dec050:	4628      	mov	r0, r5
c0dec052:	b010      	add	sp, #64	@ 0x40
c0dec054:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0dec058:	f000 fbb9 	bl	c0dec7ce <os_longjmp>

c0dec05c <bip32_derive_with_seed_get_pubkey_256>:
c0dec05c:	b5f0      	push	{r4, r5, r6, r7, lr}
c0dec05e:	b0a1      	sub	sp, #132	@ 0x84
c0dec060:	460e      	mov	r6, r1
c0dec062:	992a      	ldr	r1, [sp, #168]	@ 0xa8
c0dec064:	9103      	str	r1, [sp, #12]
c0dec066:	9929      	ldr	r1, [sp, #164]	@ 0xa4
c0dec068:	9102      	str	r1, [sp, #8]
c0dec06a:	9927      	ldr	r1, [sp, #156]	@ 0x9c
c0dec06c:	9101      	str	r1, [sp, #4]
c0dec06e:	a917      	add	r1, sp, #92	@ 0x5c
c0dec070:	9100      	str	r1, [sp, #0]
c0dec072:	4631      	mov	r1, r6
c0dec074:	f7ff ff7a 	bl	c0debf6c <bip32_derive_with_seed_init_privkey_256>
c0dec078:	9c26      	ldr	r4, [sp, #152]	@ 0x98
c0dec07a:	4605      	mov	r5, r0
c0dec07c:	b9b8      	cbnz	r0, c0dec0ae <bip32_derive_with_seed_get_pubkey_256+0x52>
c0dec07e:	9828      	ldr	r0, [sp, #160]	@ 0xa0
c0dec080:	2301      	movs	r3, #1
c0dec082:	9000      	str	r0, [sp, #0]
c0dec084:	af04      	add	r7, sp, #16
c0dec086:	aa17      	add	r2, sp, #92	@ 0x5c
c0dec088:	4630      	mov	r0, r6
c0dec08a:	4639      	mov	r1, r7
c0dec08c:	f000 faf2 	bl	c0dec674 <cx_ecfp_generate_pair2_no_throw>
c0dec090:	4605      	mov	r5, r0
c0dec092:	b960      	cbnz	r0, c0dec0ae <bip32_derive_with_seed_get_pubkey_256+0x52>
c0dec094:	9805      	ldr	r0, [sp, #20]
c0dec096:	2841      	cmp	r0, #65	@ 0x41
c0dec098:	d107      	bne.n	c0dec0aa <bip32_derive_with_seed_get_pubkey_256+0x4e>
c0dec09a:	f107 0108 	add.w	r1, r7, #8
c0dec09e:	4620      	mov	r0, r4
c0dec0a0:	2241      	movs	r2, #65	@ 0x41
c0dec0a2:	f001 f82b 	bl	c0ded0fc <__aeabi_memcpy>
c0dec0a6:	2500      	movs	r5, #0
c0dec0a8:	e001      	b.n	c0dec0ae <bip32_derive_with_seed_get_pubkey_256+0x52>
c0dec0aa:	f06f 055c 	mvn.w	r5, #92	@ 0x5c
c0dec0ae:	a817      	add	r0, sp, #92	@ 0x5c
c0dec0b0:	f000 f82f 	bl	c0dec112 <OUTLINED_FUNCTION_0>
c0dec0b4:	b11d      	cbz	r5, c0dec0be <bip32_derive_with_seed_get_pubkey_256+0x62>
c0dec0b6:	4620      	mov	r0, r4
c0dec0b8:	2141      	movs	r1, #65	@ 0x41
c0dec0ba:	f001 f837 	bl	c0ded12c <explicit_bzero>
c0dec0be:	4628      	mov	r0, r5
c0dec0c0:	b021      	add	sp, #132	@ 0x84
c0dec0c2:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0dec0c4 <bip32_derive_with_seed_ecdsa_sign_hash_256>:
c0dec0c4:	b5f0      	push	{r4, r5, r6, r7, lr}
c0dec0c6:	b08f      	sub	sp, #60	@ 0x3c
c0dec0c8:	9f19      	ldr	r7, [sp, #100]	@ 0x64
c0dec0ca:	9d1c      	ldr	r5, [sp, #112]	@ 0x70
c0dec0cc:	683c      	ldr	r4, [r7, #0]
c0dec0ce:	9503      	str	r5, [sp, #12]
c0dec0d0:	9d1b      	ldr	r5, [sp, #108]	@ 0x6c
c0dec0d2:	9502      	str	r5, [sp, #8]
c0dec0d4:	2500      	movs	r5, #0
c0dec0d6:	9501      	str	r5, [sp, #4]
c0dec0d8:	ad05      	add	r5, sp, #20
c0dec0da:	9500      	str	r5, [sp, #0]
c0dec0dc:	f7ff ff46 	bl	c0debf6c <bip32_derive_with_seed_init_privkey_256>
c0dec0e0:	9d18      	ldr	r5, [sp, #96]	@ 0x60
c0dec0e2:	4606      	mov	r6, r0
c0dec0e4:	b950      	cbnz	r0, c0dec0fc <bip32_derive_with_seed_ecdsa_sign_hash_256+0x38>
c0dec0e6:	ae14      	add	r6, sp, #80	@ 0x50
c0dec0e8:	981a      	ldr	r0, [sp, #104]	@ 0x68
c0dec0ea:	ce4e      	ldmia	r6, {r1, r2, r3, r6}
c0dec0ec:	e9cd 6500 	strd	r6, r5, [sp]
c0dec0f0:	e9cd 7002 	strd	r7, r0, [sp, #8]
c0dec0f4:	a805      	add	r0, sp, #20
c0dec0f6:	f000 fab8 	bl	c0dec66a <cx_ecdsa_sign_no_throw>
c0dec0fa:	4606      	mov	r6, r0
c0dec0fc:	a805      	add	r0, sp, #20
c0dec0fe:	f000 f808 	bl	c0dec112 <OUTLINED_FUNCTION_0>
c0dec102:	b11e      	cbz	r6, c0dec10c <bip32_derive_with_seed_ecdsa_sign_hash_256+0x48>
c0dec104:	4628      	mov	r0, r5
c0dec106:	4621      	mov	r1, r4
c0dec108:	f001 f810 	bl	c0ded12c <explicit_bzero>
c0dec10c:	4630      	mov	r0, r6
c0dec10e:	b00f      	add	sp, #60	@ 0x3c
c0dec110:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0dec112 <OUTLINED_FUNCTION_0>:
c0dec112:	2128      	movs	r1, #40	@ 0x28
c0dec114:	f001 b80a 	b.w	c0ded12c <explicit_bzero>

c0dec118 <format_u64>:
c0dec118:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0dec11c:	b1f9      	cbz	r1, c0dec15e <format_u64+0x46>
c0dec11e:	4615      	mov	r5, r2
c0dec120:	4604      	mov	r4, r0
c0dec122:	f1a1 0801 	sub.w	r8, r1, #1
c0dec126:	2700      	movs	r7, #0
c0dec128:	2600      	movs	r6, #0
c0dec12a:	f1b5 000a 	subs.w	r0, r5, #10
c0dec12e:	f173 0000 	sbcs.w	r0, r3, #0
c0dec132:	d316      	bcc.n	c0dec162 <format_u64+0x4a>
c0dec134:	4619      	mov	r1, r3
c0dec136:	4628      	mov	r0, r5
c0dec138:	220a      	movs	r2, #10
c0dec13a:	2300      	movs	r3, #0
c0dec13c:	f000 ffec 	bl	c0ded118 <__aeabi_uldivmod>
c0dec140:	460b      	mov	r3, r1
c0dec142:	eb00 0180 	add.w	r1, r0, r0, lsl #2
c0dec146:	1cba      	adds	r2, r7, #2
c0dec148:	eba5 0141 	sub.w	r1, r5, r1, lsl #1
c0dec14c:	4605      	mov	r5, r0
c0dec14e:	f041 0130 	orr.w	r1, r1, #48	@ 0x30
c0dec152:	55e1      	strb	r1, [r4, r7]
c0dec154:	1c79      	adds	r1, r7, #1
c0dec156:	4542      	cmp	r2, r8
c0dec158:	460f      	mov	r7, r1
c0dec15a:	d9e6      	bls.n	c0dec12a <format_u64+0x12>
c0dec15c:	e012      	b.n	c0dec184 <format_u64+0x6c>
c0dec15e:	2600      	movs	r6, #0
c0dec160:	e010      	b.n	c0dec184 <format_u64+0x6c>
c0dec162:	f105 0030 	add.w	r0, r5, #48	@ 0x30
c0dec166:	19e1      	adds	r1, r4, r7
c0dec168:	55e0      	strb	r0, [r4, r7]
c0dec16a:	2000      	movs	r0, #0
c0dec16c:	7048      	strb	r0, [r1, #1]
c0dec16e:	b2c1      	uxtb	r1, r0
c0dec170:	428f      	cmp	r7, r1
c0dec172:	d906      	bls.n	c0dec182 <format_u64+0x6a>
c0dec174:	5c62      	ldrb	r2, [r4, r1]
c0dec176:	5de3      	ldrb	r3, [r4, r7]
c0dec178:	3001      	adds	r0, #1
c0dec17a:	5463      	strb	r3, [r4, r1]
c0dec17c:	55e2      	strb	r2, [r4, r7]
c0dec17e:	3f01      	subs	r7, #1
c0dec180:	e7f5      	b.n	c0dec16e <format_u64+0x56>
c0dec182:	2601      	movs	r6, #1
c0dec184:	4630      	mov	r0, r6
c0dec186:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

c0dec18a <format_fpu64>:
c0dec18a:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0dec18e:	b086      	sub	sp, #24
c0dec190:	466c      	mov	r4, sp
c0dec192:	4688      	mov	r8, r1
c0dec194:	4605      	mov	r5, r0
c0dec196:	2115      	movs	r1, #21
c0dec198:	461e      	mov	r6, r3
c0dec19a:	4617      	mov	r7, r2
c0dec19c:	4620      	mov	r0, r4
c0dec19e:	f000 ffb7 	bl	c0ded110 <__aeabi_memclr>
c0dec1a2:	4620      	mov	r0, r4
c0dec1a4:	2115      	movs	r1, #21
c0dec1a6:	463a      	mov	r2, r7
c0dec1a8:	4633      	mov	r3, r6
c0dec1aa:	f7ff ffb5 	bl	c0dec118 <format_u64>
c0dec1ae:	b340      	cbz	r0, c0dec202 <format_fpu64+0x78>
c0dec1b0:	466f      	mov	r7, sp
c0dec1b2:	9e0c      	ldr	r6, [sp, #48]	@ 0x30
c0dec1b4:	4638      	mov	r0, r7
c0dec1b6:	f001 f817 	bl	c0ded1e8 <strlen>
c0dec1ba:	42b0      	cmp	r0, r6
c0dec1bc:	d910      	bls.n	c0dec1e0 <format_fpu64+0x56>
c0dec1be:	1831      	adds	r1, r6, r0
c0dec1c0:	3101      	adds	r1, #1
c0dec1c2:	4541      	cmp	r1, r8
c0dec1c4:	d21d      	bcs.n	c0dec202 <format_fpu64+0x78>
c0dec1c6:	1b84      	subs	r4, r0, r6
c0dec1c8:	4628      	mov	r0, r5
c0dec1ca:	4639      	mov	r1, r7
c0dec1cc:	4622      	mov	r2, r4
c0dec1ce:	f000 ff95 	bl	c0ded0fc <__aeabi_memcpy>
c0dec1d2:	1928      	adds	r0, r5, r4
c0dec1d4:	212e      	movs	r1, #46	@ 0x2e
c0dec1d6:	4632      	mov	r2, r6
c0dec1d8:	f800 1b01 	strb.w	r1, [r0], #1
c0dec1dc:	1939      	adds	r1, r7, r4
c0dec1de:	e015      	b.n	c0dec20c <format_fpu64+0x82>
c0dec1e0:	1a32      	subs	r2, r6, r0
c0dec1e2:	1c91      	adds	r1, r2, #2
c0dec1e4:	4541      	cmp	r1, r8
c0dec1e6:	d20c      	bcs.n	c0dec202 <format_fpu64+0x78>
c0dec1e8:	202e      	movs	r0, #46	@ 0x2e
c0dec1ea:	2330      	movs	r3, #48	@ 0x30
c0dec1ec:	2400      	movs	r4, #0
c0dec1ee:	7068      	strb	r0, [r5, #1]
c0dec1f0:	1ca8      	adds	r0, r5, #2
c0dec1f2:	702b      	strb	r3, [r5, #0]
c0dec1f4:	b2a5      	uxth	r5, r4
c0dec1f6:	42aa      	cmp	r2, r5
c0dec1f8:	d905      	bls.n	c0dec206 <format_fpu64+0x7c>
c0dec1fa:	f800 3b01 	strb.w	r3, [r0], #1
c0dec1fe:	3401      	adds	r4, #1
c0dec200:	e7f8      	b.n	c0dec1f4 <format_fpu64+0x6a>
c0dec202:	2000      	movs	r0, #0
c0dec204:	e005      	b.n	c0dec212 <format_fpu64+0x88>
c0dec206:	eba8 0201 	sub.w	r2, r8, r1
c0dec20a:	4669      	mov	r1, sp
c0dec20c:	f000 fff4 	bl	c0ded1f8 <strncpy>
c0dec210:	2001      	movs	r0, #1
c0dec212:	b006      	add	sp, #24
c0dec214:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

c0dec218 <format_hex>:
c0dec218:	b5f0      	push	{r4, r5, r6, r7, lr}
c0dec21a:	4604      	mov	r4, r0
c0dec21c:	0048      	lsls	r0, r1, #1
c0dec21e:	f100 0c01 	add.w	ip, r0, #1
c0dec222:	459c      	cmp	ip, r3
c0dec224:	d902      	bls.n	c0dec22c <format_hex+0x14>
c0dec226:	f04f 3cff 	mov.w	ip, #4294967295	@ 0xffffffff
c0dec22a:	e018      	b.n	c0dec25e <format_hex+0x46>
c0dec22c:	480d      	ldr	r0, [pc, #52]	@ (c0dec264 <format_hex+0x4c>)
c0dec22e:	2500      	movs	r5, #0
c0dec230:	4478      	add	r0, pc
c0dec232:	b191      	cbz	r1, c0dec25a <format_hex+0x42>
c0dec234:	1cef      	adds	r7, r5, #3
c0dec236:	429f      	cmp	r7, r3
c0dec238:	d80d      	bhi.n	c0dec256 <format_hex+0x3e>
c0dec23a:	7827      	ldrb	r7, [r4, #0]
c0dec23c:	3901      	subs	r1, #1
c0dec23e:	093f      	lsrs	r7, r7, #4
c0dec240:	5dc7      	ldrb	r7, [r0, r7]
c0dec242:	5557      	strb	r7, [r2, r5]
c0dec244:	1957      	adds	r7, r2, r5
c0dec246:	3502      	adds	r5, #2
c0dec248:	f814 6b01 	ldrb.w	r6, [r4], #1
c0dec24c:	f006 060f 	and.w	r6, r6, #15
c0dec250:	5d86      	ldrb	r6, [r0, r6]
c0dec252:	707e      	strb	r6, [r7, #1]
c0dec254:	e7ed      	b.n	c0dec232 <format_hex+0x1a>
c0dec256:	f105 0c01 	add.w	ip, r5, #1
c0dec25a:	2000      	movs	r0, #0
c0dec25c:	5550      	strb	r0, [r2, r5]
c0dec25e:	4660      	mov	r0, ip
c0dec260:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0dec262:	bf00      	nop
c0dec264:	00002844 	.word	0x00002844

c0dec268 <app_ticker_event_callback>:
c0dec268:	4770      	bx	lr
	...

c0dec26c <io_event>:
c0dec26c:	b580      	push	{r7, lr}
c0dec26e:	480b      	ldr	r0, [pc, #44]	@ (c0dec29c <io_event+0x30>)
c0dec270:	f819 1000 	ldrb.w	r1, [r9, r0]
c0dec274:	2905      	cmp	r1, #5
c0dec276:	d00e      	beq.n	c0dec296 <io_event+0x2a>
c0dec278:	290e      	cmp	r1, #14
c0dec27a:	d005      	beq.n	c0dec288 <io_event+0x1c>
c0dec27c:	290c      	cmp	r1, #12
c0dec27e:	d108      	bne.n	c0dec292 <io_event+0x26>
c0dec280:	4448      	add	r0, r9
c0dec282:	f000 f92f 	bl	c0dec4e4 <ux_process_finger_event>
c0dec286:	e006      	b.n	c0dec296 <io_event+0x2a>
c0dec288:	f7ff ffee 	bl	c0dec268 <app_ticker_event_callback>
c0dec28c:	f000 f980 	bl	c0dec590 <ux_process_ticker_event>
c0dec290:	e001      	b.n	c0dec296 <io_event+0x2a>
c0dec292:	f000 f9b3 	bl	c0dec5fc <ux_process_default_event>
c0dec296:	2001      	movs	r0, #1
c0dec298:	bd80      	pop	{r7, pc}
c0dec29a:	bf00      	nop
c0dec29c:	00001c8c 	.word	0x00001c8c

c0dec2a0 <io_init>:
c0dec2a0:	4802      	ldr	r0, [pc, #8]	@ (c0dec2ac <io_init+0xc>)
c0dec2a2:	2101      	movs	r1, #1
c0dec2a4:	f809 1000 	strb.w	r1, [r9, r0]
c0dec2a8:	4770      	bx	lr
c0dec2aa:	bf00      	nop
c0dec2ac:	00001d9c 	.word	0x00001d9c

c0dec2b0 <io_recv_command>:
c0dec2b0:	b510      	push	{r4, lr}
c0dec2b2:	4c09      	ldr	r4, [pc, #36]	@ (c0dec2d8 <io_recv_command+0x28>)
c0dec2b4:	f819 0004 	ldrb.w	r0, [r9, r4]
c0dec2b8:	2801      	cmp	r0, #1
c0dec2ba:	d104      	bne.n	c0dec2c6 <io_recv_command+0x16>
c0dec2bc:	f000 fdc8 	bl	c0dece50 <os_io_start>
c0dec2c0:	2000      	movs	r0, #0
c0dec2c2:	f809 0004 	strb.w	r0, [r9, r4]
c0dec2c6:	2000      	movs	r0, #0
c0dec2c8:	2800      	cmp	r0, #0
c0dec2ca:	dc03      	bgt.n	c0dec2d4 <io_recv_command+0x24>
c0dec2cc:	2001      	movs	r0, #1
c0dec2ce:	f7f8 fc91 	bl	c0de4bf4 <io_legacy_apdu_rx>
c0dec2d2:	e7f9      	b.n	c0dec2c8 <io_recv_command+0x18>
c0dec2d4:	bd10      	pop	{r4, pc}
c0dec2d6:	bf00      	nop
c0dec2d8:	00001d9c 	.word	0x00001d9c

c0dec2dc <io_send_response_buffers>:
c0dec2dc:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0dec2e0:	f8df a060 	ldr.w	sl, [pc, #96]	@ c0dec344 <io_send_response_buffers+0x68>
c0dec2e4:	4690      	mov	r8, r2
c0dec2e6:	460f      	mov	r7, r1
c0dec2e8:	4605      	mov	r5, r0
c0dec2ea:	f240 140f 	movw	r4, #271	@ 0x10f
c0dec2ee:	2600      	movs	r6, #0
c0dec2f0:	b1b5      	cbz	r5, c0dec320 <io_send_response_buffers+0x44>
c0dec2f2:	b1af      	cbz	r7, c0dec320 <io_send_response_buffers+0x44>
c0dec2f4:	2600      	movs	r6, #0
c0dec2f6:	b19f      	cbz	r7, c0dec320 <io_send_response_buffers+0x44>
c0dec2f8:	eb09 000a 	add.w	r0, r9, sl
c0dec2fc:	1ba2      	subs	r2, r4, r6
c0dec2fe:	1981      	adds	r1, r0, r6
c0dec300:	4628      	mov	r0, r5
c0dec302:	f7ff fe01 	bl	c0debf08 <buffer_copy>
c0dec306:	b130      	cbz	r0, c0dec316 <io_send_response_buffers+0x3a>
c0dec308:	e9d5 0101 	ldrd	r0, r1, [r5, #4]
c0dec30c:	350c      	adds	r5, #12
c0dec30e:	3f01      	subs	r7, #1
c0dec310:	4430      	add	r0, r6
c0dec312:	1a46      	subs	r6, r0, r1
c0dec314:	e7ef      	b.n	c0dec2f6 <io_send_response_buffers+0x1a>
c0dec316:	f44f 4830 	mov.w	r8, #45056	@ 0xb000
c0dec31a:	2500      	movs	r5, #0
c0dec31c:	2700      	movs	r7, #0
c0dec31e:	e7e6      	b.n	c0dec2ee <io_send_response_buffers+0x12>
c0dec320:	eb09 050a 	add.w	r5, r9, sl
c0dec324:	fa1f f288 	uxth.w	r2, r8
c0dec328:	4631      	mov	r1, r6
c0dec32a:	4628      	mov	r0, r5
c0dec32c:	f000 f8d4 	bl	c0dec4d8 <write_u16_be>
c0dec330:	1cb0      	adds	r0, r6, #2
c0dec332:	b281      	uxth	r1, r0
c0dec334:	4628      	mov	r0, r5
c0dec336:	f7f8 fc43 	bl	c0de4bc0 <io_legacy_apdu_tx>
c0dec33a:	ea40 70e0 	orr.w	r0, r0, r0, asr #31
c0dec33e:	e8bd 85f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}
c0dec342:	bf00      	nop
c0dec344:	00001497 	.word	0x00001497

c0dec348 <app_exit>:
c0dec348:	20ff      	movs	r0, #255	@ 0xff
c0dec34a:	f000 fd6d 	bl	c0dece28 <os_sched_exit>

c0dec34e <common_app_init>:
c0dec34e:	b580      	push	{r7, lr}
c0dec350:	f000 f9c8 	bl	c0dec6e4 <nbgl_objInit>
c0dec354:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0dec358:	f7f8 bd78 	b.w	c0de4e4c <io_seproxyhal_init>

c0dec35c <standalone_app_main>:
c0dec35c:	b510      	push	{r4, lr}
c0dec35e:	b08c      	sub	sp, #48	@ 0x30
c0dec360:	466c      	mov	r4, sp
c0dec362:	4620      	mov	r0, r4
c0dec364:	f000 ff28 	bl	c0ded1b8 <setjmp>
c0dec368:	f8ad 002c 	strh.w	r0, [sp, #44]	@ 0x2c
c0dec36c:	0400      	lsls	r0, r0, #16
c0dec36e:	d108      	bne.n	c0dec382 <standalone_app_main+0x26>
c0dec370:	4668      	mov	r0, sp
c0dec372:	f000 fd97 	bl	c0decea4 <try_context_set>
c0dec376:	900a      	str	r0, [sp, #40]	@ 0x28
c0dec378:	f7ff ffe9 	bl	c0dec34e <common_app_init>
c0dec37c:	f7f3 ff92 	bl	c0de02a4 <app_main>
c0dec380:	e005      	b.n	c0dec38e <standalone_app_main+0x32>
c0dec382:	2000      	movs	r0, #0
c0dec384:	f8ad 002c 	strh.w	r0, [sp, #44]	@ 0x2c
c0dec388:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0dec38a:	f000 fd8b 	bl	c0decea4 <try_context_set>
c0dec38e:	f000 fd81 	bl	c0dece94 <try_context_get>
c0dec392:	42a0      	cmp	r0, r4
c0dec394:	d102      	bne.n	c0dec39c <standalone_app_main+0x40>
c0dec396:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0dec398:	f000 fd84 	bl	c0decea4 <try_context_set>
c0dec39c:	f8bd 002c 	ldrh.w	r0, [sp, #44]	@ 0x2c
c0dec3a0:	b908      	cbnz	r0, c0dec3a6 <standalone_app_main+0x4a>
c0dec3a2:	f7ff ffd1 	bl	c0dec348 <app_exit>
c0dec3a6:	f000 fa12 	bl	c0dec7ce <os_longjmp>

c0dec3aa <apdu_parser>:
c0dec3aa:	2a04      	cmp	r2, #4
c0dec3ac:	d316      	bcc.n	c0dec3dc <apdu_parser+0x32>
c0dec3ae:	d102      	bne.n	c0dec3b6 <apdu_parser+0xc>
c0dec3b0:	2300      	movs	r3, #0
c0dec3b2:	7103      	strb	r3, [r0, #4]
c0dec3b4:	e004      	b.n	c0dec3c0 <apdu_parser+0x16>
c0dec3b6:	790b      	ldrb	r3, [r1, #4]
c0dec3b8:	3a05      	subs	r2, #5
c0dec3ba:	429a      	cmp	r2, r3
c0dec3bc:	7103      	strb	r3, [r0, #4]
c0dec3be:	d10d      	bne.n	c0dec3dc <apdu_parser+0x32>
c0dec3c0:	780a      	ldrb	r2, [r1, #0]
c0dec3c2:	2b00      	cmp	r3, #0
c0dec3c4:	7002      	strb	r2, [r0, #0]
c0dec3c6:	784a      	ldrb	r2, [r1, #1]
c0dec3c8:	7042      	strb	r2, [r0, #1]
c0dec3ca:	788a      	ldrb	r2, [r1, #2]
c0dec3cc:	7082      	strb	r2, [r0, #2]
c0dec3ce:	bf18      	it	ne
c0dec3d0:	1d4b      	addne	r3, r1, #5
c0dec3d2:	78c9      	ldrb	r1, [r1, #3]
c0dec3d4:	6083      	str	r3, [r0, #8]
c0dec3d6:	70c1      	strb	r1, [r0, #3]
c0dec3d8:	2001      	movs	r0, #1
c0dec3da:	4770      	bx	lr
c0dec3dc:	2000      	movs	r0, #0
c0dec3de:	4770      	bx	lr

c0dec3e0 <read_u32_be>:
c0dec3e0:	5c42      	ldrb	r2, [r0, r1]
c0dec3e2:	4408      	add	r0, r1
c0dec3e4:	7841      	ldrb	r1, [r0, #1]
c0dec3e6:	7883      	ldrb	r3, [r0, #2]
c0dec3e8:	78c0      	ldrb	r0, [r0, #3]
c0dec3ea:	0409      	lsls	r1, r1, #16
c0dec3ec:	ea41 6102 	orr.w	r1, r1, r2, lsl #24
c0dec3f0:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0dec3f4:	4408      	add	r0, r1
c0dec3f6:	4770      	bx	lr

c0dec3f8 <read_u64_be>:
c0dec3f8:	b5f0      	push	{r4, r5, r6, r7, lr}
c0dec3fa:	1842      	adds	r2, r0, r1
c0dec3fc:	5c40      	ldrb	r0, [r0, r1]
c0dec3fe:	7917      	ldrb	r7, [r2, #4]
c0dec400:	7953      	ldrb	r3, [r2, #5]
c0dec402:	7854      	ldrb	r4, [r2, #1]
c0dec404:	7895      	ldrb	r5, [r2, #2]
c0dec406:	78d6      	ldrb	r6, [r2, #3]
c0dec408:	063f      	lsls	r7, r7, #24
c0dec40a:	0421      	lsls	r1, r4, #16
c0dec40c:	ea47 4303 	orr.w	r3, r7, r3, lsl #16
c0dec410:	7997      	ldrb	r7, [r2, #6]
c0dec412:	79d2      	ldrb	r2, [r2, #7]
c0dec414:	ea41 6000 	orr.w	r0, r1, r0, lsl #24
c0dec418:	ea40 2005 	orr.w	r0, r0, r5, lsl #8
c0dec41c:	ea43 2307 	orr.w	r3, r3, r7, lsl #8
c0dec420:	1981      	adds	r1, r0, r6
c0dec422:	441a      	add	r2, r3
c0dec424:	4610      	mov	r0, r2
c0dec426:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0dec428 <read_u16_le>:
c0dec428:	5c42      	ldrb	r2, [r0, r1]
c0dec42a:	4408      	add	r0, r1
c0dec42c:	7840      	ldrb	r0, [r0, #1]
c0dec42e:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0dec432:	b280      	uxth	r0, r0
c0dec434:	4770      	bx	lr

c0dec436 <read_u32_le>:
c0dec436:	5c42      	ldrb	r2, [r0, r1]
c0dec438:	4408      	add	r0, r1
c0dec43a:	7841      	ldrb	r1, [r0, #1]
c0dec43c:	7883      	ldrb	r3, [r0, #2]
c0dec43e:	78c0      	ldrb	r0, [r0, #3]
c0dec440:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0dec444:	ea41 4103 	orr.w	r1, r1, r3, lsl #16
c0dec448:	ea41 6000 	orr.w	r0, r1, r0, lsl #24
c0dec44c:	4770      	bx	lr

c0dec44e <read_u64_le>:
c0dec44e:	b5b0      	push	{r4, r5, r7, lr}
c0dec450:	5c42      	ldrb	r2, [r0, r1]
c0dec452:	4401      	add	r1, r0
c0dec454:	7848      	ldrb	r0, [r1, #1]
c0dec456:	788b      	ldrb	r3, [r1, #2]
c0dec458:	790d      	ldrb	r5, [r1, #4]
c0dec45a:	78cc      	ldrb	r4, [r1, #3]
c0dec45c:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0dec460:	794a      	ldrb	r2, [r1, #5]
c0dec462:	ea40 4003 	orr.w	r0, r0, r3, lsl #16
c0dec466:	798b      	ldrb	r3, [r1, #6]
c0dec468:	79c9      	ldrb	r1, [r1, #7]
c0dec46a:	ea45 2202 	orr.w	r2, r5, r2, lsl #8
c0dec46e:	ea40 6004 	orr.w	r0, r0, r4, lsl #24
c0dec472:	ea42 4203 	orr.w	r2, r2, r3, lsl #16
c0dec476:	ea42 6101 	orr.w	r1, r2, r1, lsl #24
c0dec47a:	bdb0      	pop	{r4, r5, r7, pc}

c0dec47c <varint_read>:
c0dec47c:	b510      	push	{r4, lr}
c0dec47e:	b1d9      	cbz	r1, c0dec4b8 <varint_read+0x3c>
c0dec480:	4614      	mov	r4, r2
c0dec482:	4602      	mov	r2, r0
c0dec484:	7800      	ldrb	r0, [r0, #0]
c0dec486:	28ff      	cmp	r0, #255	@ 0xff
c0dec488:	d00c      	beq.n	c0dec4a4 <varint_read+0x28>
c0dec48a:	28fe      	cmp	r0, #254	@ 0xfe
c0dec48c:	d012      	beq.n	c0dec4b4 <varint_read+0x38>
c0dec48e:	28fd      	cmp	r0, #253	@ 0xfd
c0dec490:	d115      	bne.n	c0dec4be <varint_read+0x42>
c0dec492:	2903      	cmp	r1, #3
c0dec494:	d310      	bcc.n	c0dec4b8 <varint_read+0x3c>
c0dec496:	4610      	mov	r0, r2
c0dec498:	2101      	movs	r1, #1
c0dec49a:	f7ff ffc5 	bl	c0dec428 <read_u16_le>
c0dec49e:	2100      	movs	r1, #0
c0dec4a0:	2203      	movs	r2, #3
c0dec4a2:	e015      	b.n	c0dec4d0 <varint_read+0x54>
c0dec4a4:	2909      	cmp	r1, #9
c0dec4a6:	d307      	bcc.n	c0dec4b8 <varint_read+0x3c>
c0dec4a8:	4610      	mov	r0, r2
c0dec4aa:	2101      	movs	r1, #1
c0dec4ac:	f7ff ffcf 	bl	c0dec44e <read_u64_le>
c0dec4b0:	2209      	movs	r2, #9
c0dec4b2:	e00d      	b.n	c0dec4d0 <varint_read+0x54>
c0dec4b4:	2905      	cmp	r1, #5
c0dec4b6:	d205      	bcs.n	c0dec4c4 <varint_read+0x48>
c0dec4b8:	f04f 32ff 	mov.w	r2, #4294967295	@ 0xffffffff
c0dec4bc:	e00a      	b.n	c0dec4d4 <varint_read+0x58>
c0dec4be:	2100      	movs	r1, #0
c0dec4c0:	2201      	movs	r2, #1
c0dec4c2:	e005      	b.n	c0dec4d0 <varint_read+0x54>
c0dec4c4:	4610      	mov	r0, r2
c0dec4c6:	2101      	movs	r1, #1
c0dec4c8:	f7ff ffb5 	bl	c0dec436 <read_u32_le>
c0dec4cc:	2100      	movs	r1, #0
c0dec4ce:	2205      	movs	r2, #5
c0dec4d0:	e9c4 0100 	strd	r0, r1, [r4]
c0dec4d4:	4610      	mov	r0, r2
c0dec4d6:	bd10      	pop	{r4, pc}

c0dec4d8 <write_u16_be>:
c0dec4d8:	0a13      	lsrs	r3, r2, #8
c0dec4da:	5443      	strb	r3, [r0, r1]
c0dec4dc:	4408      	add	r0, r1
c0dec4de:	7042      	strb	r2, [r0, #1]
c0dec4e0:	4770      	bx	lr
	...

c0dec4e4 <ux_process_finger_event>:
c0dec4e4:	b5b0      	push	{r4, r5, r7, lr}
c0dec4e6:	4604      	mov	r4, r0
c0dec4e8:	2001      	movs	r0, #1
c0dec4ea:	f000 f827 	bl	c0dec53c <ux_forward_event>
c0dec4ee:	4605      	mov	r5, r0
c0dec4f0:	f000 f902 	bl	c0dec6f8 <nbgl_objAllowDrawing>
c0dec4f4:	b1fd      	cbz	r5, c0dec536 <ux_process_finger_event+0x52>
c0dec4f6:	78e1      	ldrb	r1, [r4, #3]
c0dec4f8:	480f      	ldr	r0, [pc, #60]	@ (c0dec538 <ux_process_finger_event+0x54>)
c0dec4fa:	7963      	ldrb	r3, [r4, #5]
c0dec4fc:	3901      	subs	r1, #1
c0dec4fe:	eb09 0200 	add.w	r2, r9, r0
c0dec502:	f859 0000 	ldr.w	r0, [r9, r0]
c0dec506:	fab1 f181 	clz	r1, r1
c0dec50a:	094d      	lsrs	r5, r1, #5
c0dec50c:	4611      	mov	r1, r2
c0dec50e:	f801 5f04 	strb.w	r5, [r1, #4]!
c0dec512:	7925      	ldrb	r5, [r4, #4]
c0dec514:	ea43 2305 	orr.w	r3, r3, r5, lsl #8
c0dec518:	80d3      	strh	r3, [r2, #6]
c0dec51a:	79a3      	ldrb	r3, [r4, #6]
c0dec51c:	79e4      	ldrb	r4, [r4, #7]
c0dec51e:	ea44 2303 	orr.w	r3, r4, r3, lsl #8
c0dec522:	8113      	strh	r3, [r2, #8]
c0dec524:	2264      	movs	r2, #100	@ 0x64
c0dec526:	4342      	muls	r2, r0
c0dec528:	2000      	movs	r0, #0
c0dec52a:	f000 f93a 	bl	c0dec7a2 <nbgl_touchHandler>
c0dec52e:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
c0dec532:	f000 b8c8 	b.w	c0dec6c6 <nbgl_refresh>
c0dec536:	bdb0      	pop	{r4, r5, r7, pc}
c0dec538:	00001dc4 	.word	0x00001dc4

c0dec53c <ux_forward_event>:
c0dec53c:	b5b0      	push	{r4, r5, r7, lr}
c0dec53e:	4604      	mov	r4, r0
c0dec540:	4812      	ldr	r0, [pc, #72]	@ (c0dec58c <ux_forward_event+0x50>)
c0dec542:	2101      	movs	r1, #1
c0dec544:	f809 1000 	strb.w	r1, [r9, r0]
c0dec548:	eb09 0500 	add.w	r5, r9, r0
c0dec54c:	2000      	movs	r0, #0
c0dec54e:	6068      	str	r0, [r5, #4]
c0dec550:	4628      	mov	r0, r5
c0dec552:	f000 fc3f 	bl	c0decdd4 <os_ux>
c0dec556:	2004      	movs	r0, #4
c0dec558:	f000 fcae 	bl	c0deceb8 <os_sched_last_status>
c0dec55c:	2869      	cmp	r0, #105	@ 0x69
c0dec55e:	6068      	str	r0, [r5, #4]
c0dec560:	d108      	bne.n	c0dec574 <ux_forward_event+0x38>
c0dec562:	2001      	movs	r0, #1
c0dec564:	f000 f8c8 	bl	c0dec6f8 <nbgl_objAllowDrawing>
c0dec568:	f000 f8d5 	bl	c0dec716 <nbgl_screenRedraw>
c0dec56c:	f000 f8ab 	bl	c0dec6c6 <nbgl_refresh>
c0dec570:	2000      	movs	r0, #0
c0dec572:	bdb0      	pop	{r4, r5, r7, pc}
c0dec574:	b144      	cbz	r4, c0dec588 <ux_forward_event+0x4c>
c0dec576:	f1b0 0197 	subs.w	r1, r0, #151	@ 0x97
c0dec57a:	bf18      	it	ne
c0dec57c:	2101      	movne	r1, #1
c0dec57e:	2800      	cmp	r0, #0
c0dec580:	bf18      	it	ne
c0dec582:	2001      	movne	r0, #1
c0dec584:	4008      	ands	r0, r1
c0dec586:	bdb0      	pop	{r4, r5, r7, pc}
c0dec588:	2001      	movs	r0, #1
c0dec58a:	bdb0      	pop	{r4, r5, r7, pc}
c0dec58c:	00001da0 	.word	0x00001da0

c0dec590 <ux_process_ticker_event>:
c0dec590:	b5bc      	push	{r2, r3, r4, r5, r7, lr}
c0dec592:	4d19      	ldr	r5, [pc, #100]	@ (c0dec5f8 <ux_process_ticker_event+0x68>)
c0dec594:	f859 0005 	ldr.w	r0, [r9, r5]
c0dec598:	3001      	adds	r0, #1
c0dec59a:	f849 0005 	str.w	r0, [r9, r5]
c0dec59e:	2001      	movs	r0, #1
c0dec5a0:	f7ff ffcc 	bl	c0dec53c <ux_forward_event>
c0dec5a4:	4604      	mov	r4, r0
c0dec5a6:	f000 f8a7 	bl	c0dec6f8 <nbgl_objAllowDrawing>
c0dec5aa:	b324      	cbz	r4, c0dec5f6 <ux_process_ticker_event+0x66>
c0dec5ac:	2064      	movs	r0, #100	@ 0x64
c0dec5ae:	2464      	movs	r4, #100	@ 0x64
c0dec5b0:	f000 f8c0 	bl	c0dec734 <nbgl_screenHandler>
c0dec5b4:	eb09 0005 	add.w	r0, r9, r5
c0dec5b8:	7900      	ldrb	r0, [r0, #4]
c0dec5ba:	2801      	cmp	r0, #1
c0dec5bc:	d119      	bne.n	c0dec5f2 <ux_process_ticker_event+0x62>
c0dec5be:	4668      	mov	r0, sp
c0dec5c0:	f000 fc86 	bl	c0deced0 <touch_get_last_info>
c0dec5c4:	f8bd 0000 	ldrh.w	r0, [sp]
c0dec5c8:	eb09 0105 	add.w	r1, r9, r5
c0dec5cc:	80c8      	strh	r0, [r1, #6]
c0dec5ce:	f8bd 0002 	ldrh.w	r0, [sp, #2]
c0dec5d2:	8108      	strh	r0, [r1, #8]
c0dec5d4:	f89d 0004 	ldrb.w	r0, [sp, #4]
c0dec5d8:	3801      	subs	r0, #1
c0dec5da:	fab0 f080 	clz	r0, r0
c0dec5de:	0940      	lsrs	r0, r0, #5
c0dec5e0:	f801 0f04 	strb.w	r0, [r1, #4]!
c0dec5e4:	f859 0005 	ldr.w	r0, [r9, r5]
c0dec5e8:	fb00 f204 	mul.w	r2, r0, r4
c0dec5ec:	2000      	movs	r0, #0
c0dec5ee:	f000 f8d8 	bl	c0dec7a2 <nbgl_touchHandler>
c0dec5f2:	f000 f868 	bl	c0dec6c6 <nbgl_refresh>
c0dec5f6:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}
c0dec5f8:	00001dc4 	.word	0x00001dc4

c0dec5fc <ux_process_default_event>:
c0dec5fc:	2000      	movs	r0, #0
c0dec5fe:	f7ff bf9d 	b.w	c0dec53c <ux_forward_event>

c0dec602 <hash_iovec_ex>:
c0dec602:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0dec606:	468a      	mov	sl, r1
c0dec608:	4611      	mov	r1, r2
c0dec60a:	461a      	mov	r2, r3
c0dec60c:	4605      	mov	r5, r0
c0dec60e:	f000 f840 	bl	c0dec692 <cx_hash_init_ex>
c0dec612:	4607      	mov	r7, r0
c0dec614:	b9a8      	cbnz	r0, c0dec642 <hash_iovec_ex+0x40>
c0dec616:	f10d 0820 	add.w	r8, sp, #32
c0dec61a:	e898 0141 	ldmia.w	r8, {r0, r6, r8}
c0dec61e:	1d04      	adds	r4, r0, #4
c0dec620:	b156      	cbz	r6, c0dec638 <hash_iovec_ex+0x36>
c0dec622:	f854 1c04 	ldr.w	r1, [r4, #-4]
c0dec626:	f854 2b08 	ldr.w	r2, [r4], #8
c0dec62a:	4628      	mov	r0, r5
c0dec62c:	f000 f836 	bl	c0dec69c <cx_hash_update>
c0dec630:	3e01      	subs	r6, #1
c0dec632:	2800      	cmp	r0, #0
c0dec634:	d0f4      	beq.n	c0dec620 <hash_iovec_ex+0x1e>
c0dec636:	e003      	b.n	c0dec640 <hash_iovec_ex+0x3e>
c0dec638:	4628      	mov	r0, r5
c0dec63a:	4641      	mov	r1, r8
c0dec63c:	f000 f824 	bl	c0dec688 <cx_hash_final>
c0dec640:	4607      	mov	r7, r0
c0dec642:	4628      	mov	r0, r5
c0dec644:	4651      	mov	r1, sl
c0dec646:	f000 fd71 	bl	c0ded12c <explicit_bzero>
c0dec64a:	4638      	mov	r0, r7
c0dec64c:	e8bd 85f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}

c0dec650 <cx_keccak_256_hash_iovec>:
c0dec650:	b580      	push	{r7, lr}
c0dec652:	b0ee      	sub	sp, #440	@ 0x1b8
c0dec654:	e88d 0007 	stmia.w	sp, {r0, r1, r2}
c0dec658:	a804      	add	r0, sp, #16
c0dec65a:	f44f 71d4 	mov.w	r1, #424	@ 0x1a8
c0dec65e:	2206      	movs	r2, #6
c0dec660:	2320      	movs	r3, #32
c0dec662:	f7ff ffce 	bl	c0dec602 <hash_iovec_ex>
c0dec666:	b06e      	add	sp, #440	@ 0x1b8
c0dec668:	bd80      	pop	{r7, pc}

c0dec66a <cx_ecdsa_sign_no_throw>:
c0dec66a:	b403      	push	{r0, r1}
c0dec66c:	f04f 002c 	mov.w	r0, #44	@ 0x2c
c0dec670:	f000 b822 	b.w	c0dec6b8 <cx_trampoline_helper>

c0dec674 <cx_ecfp_generate_pair2_no_throw>:
c0dec674:	b403      	push	{r0, r1}
c0dec676:	f04f 0031 	mov.w	r0, #49	@ 0x31
c0dec67a:	f000 b81d 	b.w	c0dec6b8 <cx_trampoline_helper>

c0dec67e <cx_ecfp_init_private_key_no_throw>:
c0dec67e:	b403      	push	{r0, r1}
c0dec680:	f04f 0033 	mov.w	r0, #51	@ 0x33
c0dec684:	f000 b818 	b.w	c0dec6b8 <cx_trampoline_helper>

c0dec688 <cx_hash_final>:
c0dec688:	b403      	push	{r0, r1}
c0dec68a:	f04f 003f 	mov.w	r0, #63	@ 0x3f
c0dec68e:	f000 b813 	b.w	c0dec6b8 <cx_trampoline_helper>

c0dec692 <cx_hash_init_ex>:
c0dec692:	b403      	push	{r0, r1}
c0dec694:	f04f 0043 	mov.w	r0, #67	@ 0x43
c0dec698:	f000 b80e 	b.w	c0dec6b8 <cx_trampoline_helper>

c0dec69c <cx_hash_update>:
c0dec69c:	b403      	push	{r0, r1}
c0dec69e:	f04f 0048 	mov.w	r0, #72	@ 0x48
c0dec6a2:	f000 b809 	b.w	c0dec6b8 <cx_trampoline_helper>

c0dec6a6 <cx_rng_no_throw>:
c0dec6a6:	b403      	push	{r0, r1}
c0dec6a8:	f04f 006a 	mov.w	r0, #106	@ 0x6a
c0dec6ac:	f000 b804 	b.w	c0dec6b8 <cx_trampoline_helper>

c0dec6b0 <cx_aes_siv_reset>:
c0dec6b0:	b403      	push	{r0, r1}
c0dec6b2:	f04f 0090 	mov.w	r0, #144	@ 0x90
c0dec6b6:	e7ff      	b.n	c0dec6b8 <cx_trampoline_helper>

c0dec6b8 <cx_trampoline_helper>:
c0dec6b8:	4900      	ldr	r1, [pc, #0]	@ (c0dec6bc <cx_trampoline_helper+0x4>)
c0dec6ba:	4708      	bx	r1
c0dec6bc:	00808001 	.word	0x00808001

c0dec6c0 <assert_exit>:
c0dec6c0:	20ff      	movs	r0, #255	@ 0xff
c0dec6c2:	f000 fbb1 	bl	c0dece28 <os_sched_exit>

c0dec6c6 <nbgl_refresh>:
c0dec6c6:	b403      	push	{r0, r1}
c0dec6c8:	f04f 0091 	mov.w	r0, #145	@ 0x91
c0dec6cc:	f000 b878 	b.w	c0dec7c0 <nbgl_trampoline_helper>

c0dec6d0 <nbgl_refreshSpecial>:
c0dec6d0:	b403      	push	{r0, r1}
c0dec6d2:	f04f 0092 	mov.w	r0, #146	@ 0x92
c0dec6d6:	f000 b873 	b.w	c0dec7c0 <nbgl_trampoline_helper>

c0dec6da <nbgl_refreshSpecialWithPostRefresh>:
c0dec6da:	b403      	push	{r0, r1}
c0dec6dc:	f04f 0093 	mov.w	r0, #147	@ 0x93
c0dec6e0:	f000 b86e 	b.w	c0dec7c0 <nbgl_trampoline_helper>

c0dec6e4 <nbgl_objInit>:
c0dec6e4:	b403      	push	{r0, r1}
c0dec6e6:	f04f 0096 	mov.w	r0, #150	@ 0x96
c0dec6ea:	f000 b869 	b.w	c0dec7c0 <nbgl_trampoline_helper>

c0dec6ee <nbgl_objDraw>:
c0dec6ee:	b403      	push	{r0, r1}
c0dec6f0:	f04f 0097 	mov.w	r0, #151	@ 0x97
c0dec6f4:	f000 b864 	b.w	c0dec7c0 <nbgl_trampoline_helper>

c0dec6f8 <nbgl_objAllowDrawing>:
c0dec6f8:	b403      	push	{r0, r1}
c0dec6fa:	f04f 0098 	mov.w	r0, #152	@ 0x98
c0dec6fe:	f000 b85f 	b.w	c0dec7c0 <nbgl_trampoline_helper>

c0dec702 <nbgl_screenSet>:
c0dec702:	b403      	push	{r0, r1}
c0dec704:	f04f 009b 	mov.w	r0, #155	@ 0x9b
c0dec708:	f000 b85a 	b.w	c0dec7c0 <nbgl_trampoline_helper>

c0dec70c <nbgl_screenPush>:
c0dec70c:	b403      	push	{r0, r1}
c0dec70e:	f04f 009c 	mov.w	r0, #156	@ 0x9c
c0dec712:	f000 b855 	b.w	c0dec7c0 <nbgl_trampoline_helper>

c0dec716 <nbgl_screenRedraw>:
c0dec716:	b403      	push	{r0, r1}
c0dec718:	f04f 009d 	mov.w	r0, #157	@ 0x9d
c0dec71c:	f000 b850 	b.w	c0dec7c0 <nbgl_trampoline_helper>

c0dec720 <nbgl_screenPop>:
c0dec720:	b403      	push	{r0, r1}
c0dec722:	f04f 009e 	mov.w	r0, #158	@ 0x9e
c0dec726:	f000 b84b 	b.w	c0dec7c0 <nbgl_trampoline_helper>

c0dec72a <nbgl_screenUpdateTicker>:
c0dec72a:	b403      	push	{r0, r1}
c0dec72c:	f04f 00a4 	mov.w	r0, #164	@ 0xa4
c0dec730:	f000 b846 	b.w	c0dec7c0 <nbgl_trampoline_helper>

c0dec734 <nbgl_screenHandler>:
c0dec734:	b403      	push	{r0, r1}
c0dec736:	f04f 00a7 	mov.w	r0, #167	@ 0xa7
c0dec73a:	f000 b841 	b.w	c0dec7c0 <nbgl_trampoline_helper>

c0dec73e <nbgl_objPoolGet>:
c0dec73e:	b403      	push	{r0, r1}
c0dec740:	f04f 00a8 	mov.w	r0, #168	@ 0xa8
c0dec744:	f000 b83c 	b.w	c0dec7c0 <nbgl_trampoline_helper>

c0dec748 <nbgl_containerPoolGet>:
c0dec748:	b403      	push	{r0, r1}
c0dec74a:	f04f 00aa 	mov.w	r0, #170	@ 0xaa
c0dec74e:	f000 b837 	b.w	c0dec7c0 <nbgl_trampoline_helper>

c0dec752 <nbgl_getFont>:
c0dec752:	b403      	push	{r0, r1}
c0dec754:	f04f 00ac 	mov.w	r0, #172	@ 0xac
c0dec758:	f000 b832 	b.w	c0dec7c0 <nbgl_trampoline_helper>

c0dec75c <nbgl_getFontHeight>:
c0dec75c:	b403      	push	{r0, r1}
c0dec75e:	f04f 00ad 	mov.w	r0, #173	@ 0xad
c0dec762:	f000 b82d 	b.w	c0dec7c0 <nbgl_trampoline_helper>

c0dec766 <nbgl_getFontLineHeight>:
c0dec766:	b403      	push	{r0, r1}
c0dec768:	f04f 00ae 	mov.w	r0, #174	@ 0xae
c0dec76c:	f000 b828 	b.w	c0dec7c0 <nbgl_trampoline_helper>

c0dec770 <nbgl_getTextHeightInWidth>:
c0dec770:	b403      	push	{r0, r1}
c0dec772:	f04f 00b2 	mov.w	r0, #178	@ 0xb2
c0dec776:	f000 b823 	b.w	c0dec7c0 <nbgl_trampoline_helper>

c0dec77a <nbgl_getTextNbLinesInWidth>:
c0dec77a:	b403      	push	{r0, r1}
c0dec77c:	f04f 00b4 	mov.w	r0, #180	@ 0xb4
c0dec780:	f000 b81e 	b.w	c0dec7c0 <nbgl_trampoline_helper>

c0dec784 <nbgl_getTextWidth>:
c0dec784:	b403      	push	{r0, r1}
c0dec786:	f04f 00b6 	mov.w	r0, #182	@ 0xb6
c0dec78a:	f000 b819 	b.w	c0dec7c0 <nbgl_trampoline_helper>

c0dec78e <nbgl_getTextMaxLenInNbLines>:
c0dec78e:	b403      	push	{r0, r1}
c0dec790:	f04f 00b7 	mov.w	r0, #183	@ 0xb7
c0dec794:	f000 b814 	b.w	c0dec7c0 <nbgl_trampoline_helper>

c0dec798 <nbgl_textReduceOnNbLines>:
c0dec798:	b403      	push	{r0, r1}
c0dec79a:	f04f 00b8 	mov.w	r0, #184	@ 0xb8
c0dec79e:	f000 b80f 	b.w	c0dec7c0 <nbgl_trampoline_helper>

c0dec7a2 <nbgl_touchHandler>:
c0dec7a2:	b403      	push	{r0, r1}
c0dec7a4:	f04f 00bb 	mov.w	r0, #187	@ 0xbb
c0dec7a8:	f000 b80a 	b.w	c0dec7c0 <nbgl_trampoline_helper>

c0dec7ac <nbgl_touchGetTouchDuration>:
c0dec7ac:	b403      	push	{r0, r1}
c0dec7ae:	f04f 00bc 	mov.w	r0, #188	@ 0xbc
c0dec7b2:	f000 b805 	b.w	c0dec7c0 <nbgl_trampoline_helper>
	...

c0dec7b8 <pic_init>:
c0dec7b8:	b403      	push	{r0, r1}
c0dec7ba:	f04f 00c4 	mov.w	r0, #196	@ 0xc4
c0dec7be:	e7ff      	b.n	c0dec7c0 <nbgl_trampoline_helper>

c0dec7c0 <nbgl_trampoline_helper>:
c0dec7c0:	4900      	ldr	r1, [pc, #0]	@ (c0dec7c4 <nbgl_trampoline_helper+0x4>)
c0dec7c2:	4708      	bx	r1
c0dec7c4:	00808001 	.word	0x00808001

c0dec7c8 <os_boot>:
c0dec7c8:	2000      	movs	r0, #0
c0dec7ca:	f000 bb6b 	b.w	c0decea4 <try_context_set>

c0dec7ce <os_longjmp>:
c0dec7ce:	4604      	mov	r4, r0
c0dec7d0:	f000 fb60 	bl	c0dece94 <try_context_get>
c0dec7d4:	4621      	mov	r1, r4
c0dec7d6:	f000 fcf5 	bl	c0ded1c4 <longjmp>
	...

c0dec7dc <snprintf>:
c0dec7dc:	b081      	sub	sp, #4
c0dec7de:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dec7e2:	b087      	sub	sp, #28
c0dec7e4:	2800      	cmp	r0, #0
c0dec7e6:	930f      	str	r3, [sp, #60]	@ 0x3c
c0dec7e8:	f000 817a 	beq.w	c0decae0 <snprintf+0x304>
c0dec7ec:	460d      	mov	r5, r1
c0dec7ee:	2900      	cmp	r1, #0
c0dec7f0:	f000 8176 	beq.w	c0decae0 <snprintf+0x304>
c0dec7f4:	4629      	mov	r1, r5
c0dec7f6:	4616      	mov	r6, r2
c0dec7f8:	4604      	mov	r4, r0
c0dec7fa:	f000 fc89 	bl	c0ded110 <__aeabi_memclr>
c0dec7fe:	f1b5 0801 	subs.w	r8, r5, #1
c0dec802:	f000 816d 	beq.w	c0decae0 <snprintf+0x304>
c0dec806:	a80f      	add	r0, sp, #60	@ 0x3c
c0dec808:	9002      	str	r0, [sp, #8]
c0dec80a:	7830      	ldrb	r0, [r6, #0]
c0dec80c:	2800      	cmp	r0, #0
c0dec80e:	f000 8167 	beq.w	c0decae0 <snprintf+0x304>
c0dec812:	2700      	movs	r7, #0
c0dec814:	b128      	cbz	r0, c0dec822 <snprintf+0x46>
c0dec816:	2825      	cmp	r0, #37	@ 0x25
c0dec818:	d003      	beq.n	c0dec822 <snprintf+0x46>
c0dec81a:	19f0      	adds	r0, r6, r7
c0dec81c:	3701      	adds	r7, #1
c0dec81e:	7840      	ldrb	r0, [r0, #1]
c0dec820:	e7f8      	b.n	c0dec814 <snprintf+0x38>
c0dec822:	4547      	cmp	r7, r8
c0dec824:	bf28      	it	cs
c0dec826:	4647      	movcs	r7, r8
c0dec828:	4620      	mov	r0, r4
c0dec82a:	4631      	mov	r1, r6
c0dec82c:	463a      	mov	r2, r7
c0dec82e:	f000 fc67 	bl	c0ded100 <__aeabi_memmove>
c0dec832:	ebb8 0807 	subs.w	r8, r8, r7
c0dec836:	f000 8153 	beq.w	c0decae0 <snprintf+0x304>
c0dec83a:	5df1      	ldrb	r1, [r6, r7]
c0dec83c:	19f0      	adds	r0, r6, r7
c0dec83e:	443c      	add	r4, r7
c0dec840:	4606      	mov	r6, r0
c0dec842:	2925      	cmp	r1, #37	@ 0x25
c0dec844:	d1e1      	bne.n	c0dec80a <snprintf+0x2e>
c0dec846:	1c41      	adds	r1, r0, #1
c0dec848:	f04f 0b00 	mov.w	fp, #0
c0dec84c:	f04f 0e20 	mov.w	lr, #32
c0dec850:	2500      	movs	r5, #0
c0dec852:	2600      	movs	r6, #0
c0dec854:	3101      	adds	r1, #1
c0dec856:	f811 3c01 	ldrb.w	r3, [r1, #-1]
c0dec85a:	4632      	mov	r2, r6
c0dec85c:	3101      	adds	r1, #1
c0dec85e:	2600      	movs	r6, #0
c0dec860:	2b2d      	cmp	r3, #45	@ 0x2d
c0dec862:	d0f8      	beq.n	c0dec856 <snprintf+0x7a>
c0dec864:	f1a3 0630 	sub.w	r6, r3, #48	@ 0x30
c0dec868:	2e0a      	cmp	r6, #10
c0dec86a:	d313      	bcc.n	c0dec894 <snprintf+0xb8>
c0dec86c:	2b25      	cmp	r3, #37	@ 0x25
c0dec86e:	d046      	beq.n	c0dec8fe <snprintf+0x122>
c0dec870:	2b2a      	cmp	r3, #42	@ 0x2a
c0dec872:	d01f      	beq.n	c0dec8b4 <snprintf+0xd8>
c0dec874:	2b2e      	cmp	r3, #46	@ 0x2e
c0dec876:	d129      	bne.n	c0dec8cc <snprintf+0xf0>
c0dec878:	f811 2c01 	ldrb.w	r2, [r1, #-1]
c0dec87c:	2a2a      	cmp	r2, #42	@ 0x2a
c0dec87e:	d13c      	bne.n	c0dec8fa <snprintf+0x11e>
c0dec880:	780a      	ldrb	r2, [r1, #0]
c0dec882:	2a48      	cmp	r2, #72	@ 0x48
c0dec884:	d003      	beq.n	c0dec88e <snprintf+0xb2>
c0dec886:	2a73      	cmp	r2, #115	@ 0x73
c0dec888:	d001      	beq.n	c0dec88e <snprintf+0xb2>
c0dec88a:	2a68      	cmp	r2, #104	@ 0x68
c0dec88c:	d135      	bne.n	c0dec8fa <snprintf+0x11e>
c0dec88e:	9a02      	ldr	r2, [sp, #8]
c0dec890:	2601      	movs	r6, #1
c0dec892:	e017      	b.n	c0dec8c4 <snprintf+0xe8>
c0dec894:	f083 0630 	eor.w	r6, r3, #48	@ 0x30
c0dec898:	ea56 060b 	orrs.w	r6, r6, fp
c0dec89c:	bf08      	it	eq
c0dec89e:	f04f 0e30 	moveq.w	lr, #48	@ 0x30
c0dec8a2:	eb0b 068b 	add.w	r6, fp, fp, lsl #2
c0dec8a6:	3901      	subs	r1, #1
c0dec8a8:	eb03 0346 	add.w	r3, r3, r6, lsl #1
c0dec8ac:	4616      	mov	r6, r2
c0dec8ae:	f1a3 0b30 	sub.w	fp, r3, #48	@ 0x30
c0dec8b2:	e7cf      	b.n	c0dec854 <snprintf+0x78>
c0dec8b4:	460b      	mov	r3, r1
c0dec8b6:	f813 2d01 	ldrb.w	r2, [r3, #-1]!
c0dec8ba:	2a73      	cmp	r2, #115	@ 0x73
c0dec8bc:	d11d      	bne.n	c0dec8fa <snprintf+0x11e>
c0dec8be:	9a02      	ldr	r2, [sp, #8]
c0dec8c0:	2602      	movs	r6, #2
c0dec8c2:	4619      	mov	r1, r3
c0dec8c4:	1d13      	adds	r3, r2, #4
c0dec8c6:	9302      	str	r3, [sp, #8]
c0dec8c8:	6815      	ldr	r5, [r2, #0]
c0dec8ca:	e7c3      	b.n	c0dec854 <snprintf+0x78>
c0dec8cc:	2b48      	cmp	r3, #72	@ 0x48
c0dec8ce:	d018      	beq.n	c0dec902 <snprintf+0x126>
c0dec8d0:	2b58      	cmp	r3, #88	@ 0x58
c0dec8d2:	d019      	beq.n	c0dec908 <snprintf+0x12c>
c0dec8d4:	2b63      	cmp	r3, #99	@ 0x63
c0dec8d6:	d020      	beq.n	c0dec91a <snprintf+0x13e>
c0dec8d8:	2b64      	cmp	r3, #100	@ 0x64
c0dec8da:	d02a      	beq.n	c0dec932 <snprintf+0x156>
c0dec8dc:	2b68      	cmp	r3, #104	@ 0x68
c0dec8de:	d036      	beq.n	c0dec94e <snprintf+0x172>
c0dec8e0:	2b70      	cmp	r3, #112	@ 0x70
c0dec8e2:	d006      	beq.n	c0dec8f2 <snprintf+0x116>
c0dec8e4:	2b73      	cmp	r3, #115	@ 0x73
c0dec8e6:	d037      	beq.n	c0dec958 <snprintf+0x17c>
c0dec8e8:	2b75      	cmp	r3, #117	@ 0x75
c0dec8ea:	f000 8081 	beq.w	c0dec9f0 <snprintf+0x214>
c0dec8ee:	2b78      	cmp	r3, #120	@ 0x78
c0dec8f0:	d103      	bne.n	c0dec8fa <snprintf+0x11e>
c0dec8f2:	9400      	str	r4, [sp, #0]
c0dec8f4:	f04f 0c00 	mov.w	ip, #0
c0dec8f8:	e009      	b.n	c0dec90e <snprintf+0x132>
c0dec8fa:	1e4e      	subs	r6, r1, #1
c0dec8fc:	e785      	b.n	c0dec80a <snprintf+0x2e>
c0dec8fe:	2025      	movs	r0, #37	@ 0x25
c0dec900:	e00f      	b.n	c0dec922 <snprintf+0x146>
c0dec902:	487b      	ldr	r0, [pc, #492]	@ (c0decaf0 <snprintf+0x314>)
c0dec904:	4478      	add	r0, pc
c0dec906:	e024      	b.n	c0dec952 <snprintf+0x176>
c0dec908:	f04f 0c01 	mov.w	ip, #1
c0dec90c:	9400      	str	r4, [sp, #0]
c0dec90e:	9a02      	ldr	r2, [sp, #8]
c0dec910:	2400      	movs	r4, #0
c0dec912:	1d13      	adds	r3, r2, #4
c0dec914:	9302      	str	r3, [sp, #8]
c0dec916:	2310      	movs	r3, #16
c0dec918:	e072      	b.n	c0deca00 <snprintf+0x224>
c0dec91a:	9802      	ldr	r0, [sp, #8]
c0dec91c:	1d02      	adds	r2, r0, #4
c0dec91e:	9202      	str	r2, [sp, #8]
c0dec920:	6800      	ldr	r0, [r0, #0]
c0dec922:	1e4e      	subs	r6, r1, #1
c0dec924:	f804 0b01 	strb.w	r0, [r4], #1
c0dec928:	f1b8 0801 	subs.w	r8, r8, #1
c0dec92c:	f47f af6d 	bne.w	c0dec80a <snprintf+0x2e>
c0dec930:	e0d6      	b.n	c0decae0 <snprintf+0x304>
c0dec932:	9a02      	ldr	r2, [sp, #8]
c0dec934:	9400      	str	r4, [sp, #0]
c0dec936:	1d13      	adds	r3, r2, #4
c0dec938:	9302      	str	r3, [sp, #8]
c0dec93a:	6813      	ldr	r3, [r2, #0]
c0dec93c:	2b00      	cmp	r3, #0
c0dec93e:	461a      	mov	r2, r3
c0dec940:	d500      	bpl.n	c0dec944 <snprintf+0x168>
c0dec942:	425a      	negs	r2, r3
c0dec944:	0fdc      	lsrs	r4, r3, #31
c0dec946:	f04f 0c00 	mov.w	ip, #0
c0dec94a:	230a      	movs	r3, #10
c0dec94c:	e059      	b.n	c0deca02 <snprintf+0x226>
c0dec94e:	4869      	ldr	r0, [pc, #420]	@ (c0decaf4 <snprintf+0x318>)
c0dec950:	4478      	add	r0, pc
c0dec952:	f04f 0c01 	mov.w	ip, #1
c0dec956:	e003      	b.n	c0dec960 <snprintf+0x184>
c0dec958:	4864      	ldr	r0, [pc, #400]	@ (c0decaec <snprintf+0x310>)
c0dec95a:	f04f 0c00 	mov.w	ip, #0
c0dec95e:	4478      	add	r0, pc
c0dec960:	9b02      	ldr	r3, [sp, #8]
c0dec962:	b2d2      	uxtb	r2, r2
c0dec964:	1d1e      	adds	r6, r3, #4
c0dec966:	9602      	str	r6, [sp, #8]
c0dec968:	1e4e      	subs	r6, r1, #1
c0dec96a:	6819      	ldr	r1, [r3, #0]
c0dec96c:	2a02      	cmp	r2, #2
c0dec96e:	f000 80a7 	beq.w	c0decac0 <snprintf+0x2e4>
c0dec972:	2a01      	cmp	r2, #1
c0dec974:	d007      	beq.n	c0dec986 <snprintf+0x1aa>
c0dec976:	463d      	mov	r5, r7
c0dec978:	b92a      	cbnz	r2, c0dec986 <snprintf+0x1aa>
c0dec97a:	2200      	movs	r2, #0
c0dec97c:	5c8b      	ldrb	r3, [r1, r2]
c0dec97e:	3201      	adds	r2, #1
c0dec980:	2b00      	cmp	r3, #0
c0dec982:	d1fb      	bne.n	c0dec97c <snprintf+0x1a0>
c0dec984:	1e55      	subs	r5, r2, #1
c0dec986:	f1bc 0f00 	cmp.w	ip, #0
c0dec98a:	d016      	beq.n	c0dec9ba <snprintf+0x1de>
c0dec98c:	2d00      	cmp	r5, #0
c0dec98e:	f43f af3c 	beq.w	c0dec80a <snprintf+0x2e>
c0dec992:	f1b8 0f02 	cmp.w	r8, #2
c0dec996:	f0c0 80a3 	bcc.w	c0decae0 <snprintf+0x304>
c0dec99a:	780a      	ldrb	r2, [r1, #0]
c0dec99c:	0913      	lsrs	r3, r2, #4
c0dec99e:	f002 020f 	and.w	r2, r2, #15
c0dec9a2:	5cc3      	ldrb	r3, [r0, r3]
c0dec9a4:	f1b8 0802 	subs.w	r8, r8, #2
c0dec9a8:	7023      	strb	r3, [r4, #0]
c0dec9aa:	5c82      	ldrb	r2, [r0, r2]
c0dec9ac:	7062      	strb	r2, [r4, #1]
c0dec9ae:	f000 8097 	beq.w	c0decae0 <snprintf+0x304>
c0dec9b2:	3101      	adds	r1, #1
c0dec9b4:	3d01      	subs	r5, #1
c0dec9b6:	3402      	adds	r4, #2
c0dec9b8:	e7e8      	b.n	c0dec98c <snprintf+0x1b0>
c0dec9ba:	4545      	cmp	r5, r8
c0dec9bc:	bf28      	it	cs
c0dec9be:	4645      	movcs	r5, r8
c0dec9c0:	4620      	mov	r0, r4
c0dec9c2:	462a      	mov	r2, r5
c0dec9c4:	f000 fb9c 	bl	c0ded100 <__aeabi_memmove>
c0dec9c8:	ebb8 0805 	subs.w	r8, r8, r5
c0dec9cc:	f000 8088 	beq.w	c0decae0 <snprintf+0x304>
c0dec9d0:	462f      	mov	r7, r5
c0dec9d2:	442c      	add	r4, r5
c0dec9d4:	45bb      	cmp	fp, r7
c0dec9d6:	f67f af18 	bls.w	c0dec80a <snprintf+0x2e>
c0dec9da:	ebab 0507 	sub.w	r5, fp, r7
c0dec9de:	4620      	mov	r0, r4
c0dec9e0:	4545      	cmp	r5, r8
c0dec9e2:	bf28      	it	cs
c0dec9e4:	4645      	movcs	r5, r8
c0dec9e6:	4629      	mov	r1, r5
c0dec9e8:	2220      	movs	r2, #32
c0dec9ea:	f000 fb8b 	bl	c0ded104 <__aeabi_memset>
c0dec9ee:	e061      	b.n	c0decab4 <snprintf+0x2d8>
c0dec9f0:	9a02      	ldr	r2, [sp, #8]
c0dec9f2:	9400      	str	r4, [sp, #0]
c0dec9f4:	2400      	movs	r4, #0
c0dec9f6:	f04f 0c00 	mov.w	ip, #0
c0dec9fa:	1d13      	adds	r3, r2, #4
c0dec9fc:	9302      	str	r3, [sp, #8]
c0dec9fe:	230a      	movs	r3, #10
c0deca00:	6812      	ldr	r2, [r2, #0]
c0deca02:	483d      	ldr	r0, [pc, #244]	@ (c0decaf8 <snprintf+0x31c>)
c0deca04:	1e4e      	subs	r6, r1, #1
c0deca06:	f04f 0a01 	mov.w	sl, #1
c0deca0a:	4478      	add	r0, pc
c0deca0c:	9001      	str	r0, [sp, #4]
c0deca0e:	fba3 570a 	umull	r5, r7, r3, sl
c0deca12:	2f00      	cmp	r7, #0
c0deca14:	bf18      	it	ne
c0deca16:	2701      	movne	r7, #1
c0deca18:	4295      	cmp	r5, r2
c0deca1a:	d804      	bhi.n	c0deca26 <snprintf+0x24a>
c0deca1c:	b91f      	cbnz	r7, c0deca26 <snprintf+0x24a>
c0deca1e:	f1ab 0b01 	sub.w	fp, fp, #1
c0deca22:	46aa      	mov	sl, r5
c0deca24:	e7f3      	b.n	c0deca0e <snprintf+0x232>
c0deca26:	2c00      	cmp	r4, #0
c0deca28:	4627      	mov	r7, r4
c0deca2a:	f04f 0500 	mov.w	r5, #0
c0deca2e:	bf18      	it	ne
c0deca30:	f04f 37ff 	movne.w	r7, #4294967295	@ 0xffffffff
c0deca34:	d00d      	beq.n	c0deca52 <snprintf+0x276>
c0deca36:	4660      	mov	r0, ip
c0deca38:	fa5f fc8e 	uxtb.w	ip, lr
c0deca3c:	a903      	add	r1, sp, #12
c0deca3e:	f1bc 0f30 	cmp.w	ip, #48	@ 0x30
c0deca42:	4684      	mov	ip, r0
c0deca44:	d106      	bne.n	c0deca54 <snprintf+0x278>
c0deca46:	202d      	movs	r0, #45	@ 0x2d
c0deca48:	2400      	movs	r4, #0
c0deca4a:	2501      	movs	r5, #1
c0deca4c:	f88d 000c 	strb.w	r0, [sp, #12]
c0deca50:	e000      	b.n	c0deca54 <snprintf+0x278>
c0deca52:	a903      	add	r1, sp, #12
c0deca54:	eb07 000b 	add.w	r0, r7, fp
c0deca58:	3802      	subs	r0, #2
c0deca5a:	280d      	cmp	r0, #13
c0deca5c:	d808      	bhi.n	c0deca70 <snprintf+0x294>
c0deca5e:	f1c7 0701 	rsb	r7, r7, #1
c0deca62:	45bb      	cmp	fp, r7
c0deca64:	d004      	beq.n	c0deca70 <snprintf+0x294>
c0deca66:	f801 e005 	strb.w	lr, [r1, r5]
c0deca6a:	3701      	adds	r7, #1
c0deca6c:	3501      	adds	r5, #1
c0deca6e:	e7f8      	b.n	c0deca62 <snprintf+0x286>
c0deca70:	9f01      	ldr	r7, [sp, #4]
c0deca72:	b114      	cbz	r4, c0deca7a <snprintf+0x29e>
c0deca74:	202d      	movs	r0, #45	@ 0x2d
c0deca76:	5548      	strb	r0, [r1, r5]
c0deca78:	3501      	adds	r5, #1
c0deca7a:	4820      	ldr	r0, [pc, #128]	@ (c0decafc <snprintf+0x320>)
c0deca7c:	f1bc 0f00 	cmp.w	ip, #0
c0deca80:	4478      	add	r0, pc
c0deca82:	bf08      	it	eq
c0deca84:	4638      	moveq	r0, r7
c0deca86:	f1ba 0f00 	cmp.w	sl, #0
c0deca8a:	d00b      	beq.n	c0decaa4 <snprintf+0x2c8>
c0deca8c:	fbb2 f7fa 	udiv	r7, r2, sl
c0deca90:	fbba faf3 	udiv	sl, sl, r3
c0deca94:	fbb7 f4f3 	udiv	r4, r7, r3
c0deca98:	fb04 7413 	mls	r4, r4, r3, r7
c0deca9c:	5d04      	ldrb	r4, [r0, r4]
c0deca9e:	554c      	strb	r4, [r1, r5]
c0decaa0:	3501      	adds	r5, #1
c0decaa2:	e7f0      	b.n	c0deca86 <snprintf+0x2aa>
c0decaa4:	4545      	cmp	r5, r8
c0decaa6:	bf28      	it	cs
c0decaa8:	4645      	movcs	r5, r8
c0decaaa:	9c00      	ldr	r4, [sp, #0]
c0decaac:	462a      	mov	r2, r5
c0decaae:	4620      	mov	r0, r4
c0decab0:	f000 fb26 	bl	c0ded100 <__aeabi_memmove>
c0decab4:	ebb8 0805 	subs.w	r8, r8, r5
c0decab8:	442c      	add	r4, r5
c0decaba:	f47f aea6 	bne.w	c0dec80a <snprintf+0x2e>
c0decabe:	e00f      	b.n	c0decae0 <snprintf+0x304>
c0decac0:	7808      	ldrb	r0, [r1, #0]
c0decac2:	2800      	cmp	r0, #0
c0decac4:	f47f aea1 	bne.w	c0dec80a <snprintf+0x2e>
c0decac8:	4545      	cmp	r5, r8
c0decaca:	bf28      	it	cs
c0decacc:	4645      	movcs	r5, r8
c0decace:	4620      	mov	r0, r4
c0decad0:	4629      	mov	r1, r5
c0decad2:	2220      	movs	r2, #32
c0decad4:	f000 fb16 	bl	c0ded104 <__aeabi_memset>
c0decad8:	ebb8 0805 	subs.w	r8, r8, r5
c0decadc:	f47f af79 	bne.w	c0dec9d2 <snprintf+0x1f6>
c0decae0:	2000      	movs	r0, #0
c0decae2:	b007      	add	sp, #28
c0decae4:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0decae8:	b001      	add	sp, #4
c0decaea:	4770      	bx	lr
c0decaec:	00003b4e 	.word	0x00003b4e
c0decaf0:	00003be8 	.word	0x00003be8
c0decaf4:	00003b5c 	.word	0x00003b5c
c0decaf8:	00003aa2 	.word	0x00003aa2
c0decafc:	00003a6c 	.word	0x00003a6c

c0decb00 <pic>:
c0decb00:	4a0a      	ldr	r2, [pc, #40]	@ (c0decb2c <pic+0x2c>)
c0decb02:	4282      	cmp	r2, r0
c0decb04:	490a      	ldr	r1, [pc, #40]	@ (c0decb30 <pic+0x30>)
c0decb06:	d806      	bhi.n	c0decb16 <pic+0x16>
c0decb08:	4281      	cmp	r1, r0
c0decb0a:	d304      	bcc.n	c0decb16 <pic+0x16>
c0decb0c:	b580      	push	{r7, lr}
c0decb0e:	f000 f815 	bl	c0decb3c <pic_internal>
c0decb12:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0decb16:	4907      	ldr	r1, [pc, #28]	@ (c0decb34 <pic+0x34>)
c0decb18:	4288      	cmp	r0, r1
c0decb1a:	4a07      	ldr	r2, [pc, #28]	@ (c0decb38 <pic+0x38>)
c0decb1c:	d304      	bcc.n	c0decb28 <pic+0x28>
c0decb1e:	4290      	cmp	r0, r2
c0decb20:	d802      	bhi.n	c0decb28 <pic+0x28>
c0decb22:	1a40      	subs	r0, r0, r1
c0decb24:	4649      	mov	r1, r9
c0decb26:	4408      	add	r0, r1
c0decb28:	4770      	bx	lr
c0decb2a:	0000      	movs	r0, r0
c0decb2c:	c0de0000 	.word	0xc0de0000
c0decb30:	c0df0968 	.word	0xc0df0968
c0decb34:	da7a0000 	.word	0xda7a0000
c0decb38:	da7a9000 	.word	0xda7a9000

c0decb3c <pic_internal>:
c0decb3c:	467a      	mov	r2, pc
c0decb3e:	4902      	ldr	r1, [pc, #8]	@ (c0decb48 <pic_internal+0xc>)
c0decb40:	1cc9      	adds	r1, r1, #3
c0decb42:	1a89      	subs	r1, r1, r2
c0decb44:	1a40      	subs	r0, r0, r1
c0decb46:	4770      	bx	lr
c0decb48:	c0decb3d 	.word	0xc0decb3d

c0decb4c <SVC_Call>:
c0decb4c:	df01      	svc	1
c0decb4e:	2900      	cmp	r1, #0
c0decb50:	d100      	bne.n	c0decb54 <exception>
c0decb52:	4770      	bx	lr

c0decb54 <exception>:
c0decb54:	4608      	mov	r0, r1
c0decb56:	f7ff fe3a 	bl	c0dec7ce <os_longjmp>
	...

c0decb5c <SVC_cx_call>:
c0decb5c:	df01      	svc	1
c0decb5e:	4770      	bx	lr

c0decb60 <nbgl_wait_pipeline>:
c0decb60:	b5e0      	push	{r5, r6, r7, lr}
c0decb62:	2000      	movs	r0, #0
c0decb64:	9001      	str	r0, [sp, #4]
c0decb66:	4802      	ldr	r0, [pc, #8]	@ (c0decb70 <nbgl_wait_pipeline+0x10>)
c0decb68:	a901      	add	r1, sp, #4
c0decb6a:	f7ff ffef 	bl	c0decb4c <SVC_Call>
c0decb6e:	bd8c      	pop	{r2, r3, r7, pc}
c0decb70:	00fa0011 	.word	0x00fa0011

c0decb74 <nvm_write>:
c0decb74:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0decb76:	ab01      	add	r3, sp, #4
c0decb78:	c307      	stmia	r3!, {r0, r1, r2}
c0decb7a:	4802      	ldr	r0, [pc, #8]	@ (c0decb84 <nvm_write+0x10>)
c0decb7c:	a901      	add	r1, sp, #4
c0decb7e:	f7ff ffe5 	bl	c0decb4c <SVC_Call>
c0decb82:	bd8f      	pop	{r0, r1, r2, r3, r7, pc}
c0decb84:	03000003 	.word	0x03000003

c0decb88 <cx_bn_lock>:
c0decb88:	b5e0      	push	{r5, r6, r7, lr}
c0decb8a:	e9cd 0100 	strd	r0, r1, [sp]
c0decb8e:	4802      	ldr	r0, [pc, #8]	@ (c0decb98 <cx_bn_lock+0x10>)
c0decb90:	4669      	mov	r1, sp
c0decb92:	f7ff ffe3 	bl	c0decb5c <SVC_cx_call>
c0decb96:	bd8c      	pop	{r2, r3, r7, pc}
c0decb98:	02000112 	.word	0x02000112

c0decb9c <cx_bn_unlock>:
c0decb9c:	b5e0      	push	{r5, r6, r7, lr}
c0decb9e:	2000      	movs	r0, #0
c0decba0:	4669      	mov	r1, sp
c0decba2:	9001      	str	r0, [sp, #4]
c0decba4:	20b6      	movs	r0, #182	@ 0xb6
c0decba6:	f7ff ffd9 	bl	c0decb5c <SVC_cx_call>
c0decbaa:	bd8c      	pop	{r2, r3, r7, pc}

c0decbac <cx_bn_alloc>:
c0decbac:	b5e0      	push	{r5, r6, r7, lr}
c0decbae:	e9cd 0100 	strd	r0, r1, [sp]
c0decbb2:	4802      	ldr	r0, [pc, #8]	@ (c0decbbc <cx_bn_alloc+0x10>)
c0decbb4:	4669      	mov	r1, sp
c0decbb6:	f7ff ffd1 	bl	c0decb5c <SVC_cx_call>
c0decbba:	bd8c      	pop	{r2, r3, r7, pc}
c0decbbc:	02000113 	.word	0x02000113

c0decbc0 <cx_bn_alloc_init>:
c0decbc0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0decbc2:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
c0decbc6:	4803      	ldr	r0, [pc, #12]	@ (c0decbd4 <cx_bn_alloc_init+0x14>)
c0decbc8:	4669      	mov	r1, sp
c0decbca:	f7ff ffc7 	bl	c0decb5c <SVC_cx_call>
c0decbce:	b004      	add	sp, #16
c0decbd0:	bd80      	pop	{r7, pc}
c0decbd2:	bf00      	nop
c0decbd4:	04000114 	.word	0x04000114

c0decbd8 <cx_bn_destroy>:
c0decbd8:	b5e0      	push	{r5, r6, r7, lr}
c0decbda:	f000 f983 	bl	c0decee4 <OUTLINED_FUNCTION_0>
c0decbde:	4802      	ldr	r0, [pc, #8]	@ (c0decbe8 <cx_bn_destroy+0x10>)
c0decbe0:	4669      	mov	r1, sp
c0decbe2:	f7ff ffbb 	bl	c0decb5c <SVC_cx_call>
c0decbe6:	bd8c      	pop	{r2, r3, r7, pc}
c0decbe8:	010000bc 	.word	0x010000bc

c0decbec <cx_bn_nbytes>:
c0decbec:	b5e0      	push	{r5, r6, r7, lr}
c0decbee:	e9cd 0100 	strd	r0, r1, [sp]
c0decbf2:	4802      	ldr	r0, [pc, #8]	@ (c0decbfc <cx_bn_nbytes+0x10>)
c0decbf4:	4669      	mov	r1, sp
c0decbf6:	f7ff ffb1 	bl	c0decb5c <SVC_cx_call>
c0decbfa:	bd8c      	pop	{r2, r3, r7, pc}
c0decbfc:	0200010d 	.word	0x0200010d

c0decc00 <cx_bn_copy>:
c0decc00:	b5e0      	push	{r5, r6, r7, lr}
c0decc02:	e9cd 0100 	strd	r0, r1, [sp]
c0decc06:	4802      	ldr	r0, [pc, #8]	@ (c0decc10 <cx_bn_copy+0x10>)
c0decc08:	4669      	mov	r1, sp
c0decc0a:	f7ff ffa7 	bl	c0decb5c <SVC_cx_call>
c0decc0e:	bd8c      	pop	{r2, r3, r7, pc}
c0decc10:	020000c0 	.word	0x020000c0

c0decc14 <cx_bn_set_u32>:
c0decc14:	b5e0      	push	{r5, r6, r7, lr}
c0decc16:	e9cd 0100 	strd	r0, r1, [sp]
c0decc1a:	4802      	ldr	r0, [pc, #8]	@ (c0decc24 <cx_bn_set_u32+0x10>)
c0decc1c:	4669      	mov	r1, sp
c0decc1e:	f7ff ff9d 	bl	c0decb5c <SVC_cx_call>
c0decc22:	bd8c      	pop	{r2, r3, r7, pc}
c0decc24:	020000c1 	.word	0x020000c1

c0decc28 <cx_bn_export>:
c0decc28:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0decc2a:	ab01      	add	r3, sp, #4
c0decc2c:	c307      	stmia	r3!, {r0, r1, r2}
c0decc2e:	4803      	ldr	r0, [pc, #12]	@ (c0decc3c <cx_bn_export+0x14>)
c0decc30:	a901      	add	r1, sp, #4
c0decc32:	f7ff ff93 	bl	c0decb5c <SVC_cx_call>
c0decc36:	b004      	add	sp, #16
c0decc38:	bd80      	pop	{r7, pc}
c0decc3a:	bf00      	nop
c0decc3c:	030000c3 	.word	0x030000c3

c0decc40 <cx_bn_cmp>:
c0decc40:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0decc42:	ab01      	add	r3, sp, #4
c0decc44:	c307      	stmia	r3!, {r0, r1, r2}
c0decc46:	4803      	ldr	r0, [pc, #12]	@ (c0decc54 <cx_bn_cmp+0x14>)
c0decc48:	a901      	add	r1, sp, #4
c0decc4a:	f7ff ff87 	bl	c0decb5c <SVC_cx_call>
c0decc4e:	b004      	add	sp, #16
c0decc50:	bd80      	pop	{r7, pc}
c0decc52:	bf00      	nop
c0decc54:	030000c4 	.word	0x030000c4

c0decc58 <cx_bn_cmp_u32>:
c0decc58:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0decc5a:	ab01      	add	r3, sp, #4
c0decc5c:	c307      	stmia	r3!, {r0, r1, r2}
c0decc5e:	4803      	ldr	r0, [pc, #12]	@ (c0decc6c <cx_bn_cmp_u32+0x14>)
c0decc60:	a901      	add	r1, sp, #4
c0decc62:	f7ff ff7b 	bl	c0decb5c <SVC_cx_call>
c0decc66:	b004      	add	sp, #16
c0decc68:	bd80      	pop	{r7, pc}
c0decc6a:	bf00      	nop
c0decc6c:	030000c5 	.word	0x030000c5

c0decc70 <cx_bn_tst_bit>:
c0decc70:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0decc72:	ab01      	add	r3, sp, #4
c0decc74:	c307      	stmia	r3!, {r0, r1, r2}
c0decc76:	4803      	ldr	r0, [pc, #12]	@ (c0decc84 <cx_bn_tst_bit+0x14>)
c0decc78:	a901      	add	r1, sp, #4
c0decc7a:	f7ff ff6f 	bl	c0decb5c <SVC_cx_call>
c0decc7e:	b004      	add	sp, #16
c0decc80:	bd80      	pop	{r7, pc}
c0decc82:	bf00      	nop
c0decc84:	030000cb 	.word	0x030000cb

c0decc88 <cx_bn_mod_add>:
c0decc88:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0decc8a:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
c0decc8e:	4803      	ldr	r0, [pc, #12]	@ (c0decc9c <cx_bn_mod_add+0x14>)
c0decc90:	4669      	mov	r1, sp
c0decc92:	f7ff ff63 	bl	c0decb5c <SVC_cx_call>
c0decc96:	b004      	add	sp, #16
c0decc98:	bd80      	pop	{r7, pc}
c0decc9a:	bf00      	nop
c0decc9c:	040000d3 	.word	0x040000d3

c0decca0 <cx_bn_mod_sub>:
c0decca0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0decca2:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
c0decca6:	4803      	ldr	r0, [pc, #12]	@ (c0deccb4 <cx_bn_mod_sub+0x14>)
c0decca8:	4669      	mov	r1, sp
c0deccaa:	f7ff ff57 	bl	c0decb5c <SVC_cx_call>
c0deccae:	b004      	add	sp, #16
c0deccb0:	bd80      	pop	{r7, pc}
c0deccb2:	bf00      	nop
c0deccb4:	040000d4 	.word	0x040000d4

c0deccb8 <cx_bn_is_prime>:
c0deccb8:	b5e0      	push	{r5, r6, r7, lr}
c0deccba:	e9cd 0100 	strd	r0, r1, [sp]
c0deccbe:	4802      	ldr	r0, [pc, #8]	@ (c0deccc8 <cx_bn_is_prime+0x10>)
c0deccc0:	4669      	mov	r1, sp
c0deccc2:	f7ff ff4b 	bl	c0decb5c <SVC_cx_call>
c0deccc6:	bd8c      	pop	{r2, r3, r7, pc}
c0deccc8:	020000ef 	.word	0x020000ef

c0decccc <cx_mont_alloc>:
c0decccc:	b5e0      	push	{r5, r6, r7, lr}
c0deccce:	e9cd 0100 	strd	r0, r1, [sp]
c0deccd2:	4802      	ldr	r0, [pc, #8]	@ (c0deccdc <cx_mont_alloc+0x10>)
c0deccd4:	4669      	mov	r1, sp
c0deccd6:	f7ff ff41 	bl	c0decb5c <SVC_cx_call>
c0deccda:	bd8c      	pop	{r2, r3, r7, pc}
c0deccdc:	020000dc 	.word	0x020000dc

c0decce0 <cx_mont_init>:
c0decce0:	b5e0      	push	{r5, r6, r7, lr}
c0decce2:	e9cd 0100 	strd	r0, r1, [sp]
c0decce6:	4802      	ldr	r0, [pc, #8]	@ (c0deccf0 <cx_mont_init+0x10>)
c0decce8:	4669      	mov	r1, sp
c0deccea:	f7ff ff37 	bl	c0decb5c <SVC_cx_call>
c0deccee:	bd8c      	pop	{r2, r3, r7, pc}
c0deccf0:	020000dd 	.word	0x020000dd

c0deccf4 <cx_mont_to_montgomery>:
c0deccf4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0deccf6:	ab01      	add	r3, sp, #4
c0deccf8:	c307      	stmia	r3!, {r0, r1, r2}
c0deccfa:	4803      	ldr	r0, [pc, #12]	@ (c0decd08 <cx_mont_to_montgomery+0x14>)
c0deccfc:	a901      	add	r1, sp, #4
c0deccfe:	f7ff ff2d 	bl	c0decb5c <SVC_cx_call>
c0decd02:	b004      	add	sp, #16
c0decd04:	bd80      	pop	{r7, pc}
c0decd06:	bf00      	nop
c0decd08:	030000df 	.word	0x030000df

c0decd0c <cx_mont_from_montgomery>:
c0decd0c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0decd0e:	ab01      	add	r3, sp, #4
c0decd10:	c307      	stmia	r3!, {r0, r1, r2}
c0decd12:	4803      	ldr	r0, [pc, #12]	@ (c0decd20 <cx_mont_from_montgomery+0x14>)
c0decd14:	a901      	add	r1, sp, #4
c0decd16:	f7ff ff21 	bl	c0decb5c <SVC_cx_call>
c0decd1a:	b004      	add	sp, #16
c0decd1c:	bd80      	pop	{r7, pc}
c0decd1e:	bf00      	nop
c0decd20:	030000e0 	.word	0x030000e0

c0decd24 <cx_mont_mul>:
c0decd24:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0decd26:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
c0decd2a:	4803      	ldr	r0, [pc, #12]	@ (c0decd38 <cx_mont_mul+0x14>)
c0decd2c:	4669      	mov	r1, sp
c0decd2e:	f7ff ff15 	bl	c0decb5c <SVC_cx_call>
c0decd32:	b004      	add	sp, #16
c0decd34:	bd80      	pop	{r7, pc}
c0decd36:	bf00      	nop
c0decd38:	040000e1 	.word	0x040000e1

c0decd3c <cx_mont_invert_nprime>:
c0decd3c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0decd3e:	ab01      	add	r3, sp, #4
c0decd40:	c307      	stmia	r3!, {r0, r1, r2}
c0decd42:	4803      	ldr	r0, [pc, #12]	@ (c0decd50 <cx_mont_invert_nprime+0x14>)
c0decd44:	a901      	add	r1, sp, #4
c0decd46:	f7ff ff09 	bl	c0decb5c <SVC_cx_call>
c0decd4a:	b004      	add	sp, #16
c0decd4c:	bd80      	pop	{r7, pc}
c0decd4e:	bf00      	nop
c0decd50:	030000e4 	.word	0x030000e4

c0decd54 <cx_ecdomain_parameters_length>:
c0decd54:	b5e0      	push	{r5, r6, r7, lr}
c0decd56:	e9cd 0100 	strd	r0, r1, [sp]
c0decd5a:	4802      	ldr	r0, [pc, #8]	@ (c0decd64 <cx_ecdomain_parameters_length+0x10>)
c0decd5c:	4669      	mov	r1, sp
c0decd5e:	f7ff fefd 	bl	c0decb5c <SVC_cx_call>
c0decd62:	bd8c      	pop	{r2, r3, r7, pc}
c0decd64:	0200012f 	.word	0x0200012f

c0decd68 <os_perso_derive_node_with_seed_key>:
c0decd68:	b510      	push	{r4, lr}
c0decd6a:	b088      	sub	sp, #32
c0decd6c:	9c0d      	ldr	r4, [sp, #52]	@ 0x34
c0decd6e:	9407      	str	r4, [sp, #28]
c0decd70:	9c0c      	ldr	r4, [sp, #48]	@ 0x30
c0decd72:	9406      	str	r4, [sp, #24]
c0decd74:	9c0b      	ldr	r4, [sp, #44]	@ 0x2c
c0decd76:	9405      	str	r4, [sp, #20]
c0decd78:	9c0a      	ldr	r4, [sp, #40]	@ 0x28
c0decd7a:	e88d 001f 	stmia.w	sp, {r0, r1, r2, r3, r4}
c0decd7e:	4803      	ldr	r0, [pc, #12]	@ (c0decd8c <os_perso_derive_node_with_seed_key+0x24>)
c0decd80:	4669      	mov	r1, sp
c0decd82:	f7ff fee3 	bl	c0decb4c <SVC_Call>
c0decd86:	b008      	add	sp, #32
c0decd88:	bd10      	pop	{r4, pc}
c0decd8a:	bf00      	nop
c0decd8c:	080000a6 	.word	0x080000a6

c0decd90 <os_pki_load_certificate>:
c0decd90:	b510      	push	{r4, lr}
c0decd92:	b086      	sub	sp, #24
c0decd94:	9c09      	ldr	r4, [sp, #36]	@ 0x24
c0decd96:	9405      	str	r4, [sp, #20]
c0decd98:	9c08      	ldr	r4, [sp, #32]
c0decd9a:	e88d 001f 	stmia.w	sp, {r0, r1, r2, r3, r4}
c0decd9e:	4803      	ldr	r0, [pc, #12]	@ (c0decdac <os_pki_load_certificate+0x1c>)
c0decda0:	4669      	mov	r1, sp
c0decda2:	f7ff fed3 	bl	c0decb4c <SVC_Call>
c0decda6:	b006      	add	sp, #24
c0decda8:	bd10      	pop	{r4, pc}
c0decdaa:	bf00      	nop
c0decdac:	060000aa 	.word	0x060000aa

c0decdb0 <os_perso_is_pin_set>:
c0decdb0:	b5e0      	push	{r5, r6, r7, lr}
c0decdb2:	2000      	movs	r0, #0
c0decdb4:	4669      	mov	r1, sp
c0decdb6:	9001      	str	r0, [sp, #4]
c0decdb8:	209e      	movs	r0, #158	@ 0x9e
c0decdba:	f7ff fec7 	bl	c0decb4c <SVC_Call>
c0decdbe:	b2c0      	uxtb	r0, r0
c0decdc0:	bd8c      	pop	{r2, r3, r7, pc}

c0decdc2 <os_global_pin_is_validated>:
c0decdc2:	b5e0      	push	{r5, r6, r7, lr}
c0decdc4:	2000      	movs	r0, #0
c0decdc6:	4669      	mov	r1, sp
c0decdc8:	9001      	str	r0, [sp, #4]
c0decdca:	20a0      	movs	r0, #160	@ 0xa0
c0decdcc:	f7ff febe 	bl	c0decb4c <SVC_Call>
c0decdd0:	b2c0      	uxtb	r0, r0
c0decdd2:	bd8c      	pop	{r2, r3, r7, pc}

c0decdd4 <os_ux>:
c0decdd4:	b5e0      	push	{r5, r6, r7, lr}
c0decdd6:	f000 f885 	bl	c0decee4 <OUTLINED_FUNCTION_0>
c0decdda:	4802      	ldr	r0, [pc, #8]	@ (c0decde4 <os_ux+0x10>)
c0decddc:	4669      	mov	r1, sp
c0decdde:	f7ff feb5 	bl	c0decb4c <SVC_Call>
c0decde2:	bd8c      	pop	{r2, r3, r7, pc}
c0decde4:	01000064 	.word	0x01000064

c0decde8 <os_flags>:
c0decde8:	b5e0      	push	{r5, r6, r7, lr}
c0decdea:	2000      	movs	r0, #0
c0decdec:	4669      	mov	r1, sp
c0decdee:	9001      	str	r0, [sp, #4]
c0decdf0:	206a      	movs	r0, #106	@ 0x6a
c0decdf2:	f7ff feab 	bl	c0decb4c <SVC_Call>
c0decdf6:	bd8c      	pop	{r2, r3, r7, pc}

c0decdf8 <os_setting_get>:
c0decdf8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0decdfa:	ab01      	add	r3, sp, #4
c0decdfc:	c307      	stmia	r3!, {r0, r1, r2}
c0decdfe:	4803      	ldr	r0, [pc, #12]	@ (c0dece0c <os_setting_get+0x14>)
c0dece00:	a901      	add	r1, sp, #4
c0dece02:	f7ff fea3 	bl	c0decb4c <SVC_Call>
c0dece06:	b004      	add	sp, #16
c0dece08:	bd80      	pop	{r7, pc}
c0dece0a:	bf00      	nop
c0dece0c:	03000070 	.word	0x03000070

c0dece10 <os_registry_get_current_app_tag>:
c0dece10:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0dece12:	ab01      	add	r3, sp, #4
c0dece14:	c307      	stmia	r3!, {r0, r1, r2}
c0dece16:	4803      	ldr	r0, [pc, #12]	@ (c0dece24 <os_registry_get_current_app_tag+0x14>)
c0dece18:	a901      	add	r1, sp, #4
c0dece1a:	f7ff fe97 	bl	c0decb4c <SVC_Call>
c0dece1e:	b004      	add	sp, #16
c0dece20:	bd80      	pop	{r7, pc}
c0dece22:	bf00      	nop
c0dece24:	03000074 	.word	0x03000074

c0dece28 <os_sched_exit>:
c0dece28:	b082      	sub	sp, #8
c0dece2a:	f000 f85b 	bl	c0decee4 <OUTLINED_FUNCTION_0>
c0dece2e:	4802      	ldr	r0, [pc, #8]	@ (c0dece38 <os_sched_exit+0x10>)
c0dece30:	4669      	mov	r1, sp
c0dece32:	f7ff fe8b 	bl	c0decb4c <SVC_Call>
c0dece36:	deff      	udf	#255	@ 0xff
c0dece38:	0100009a 	.word	0x0100009a

c0dece3c <os_io_init>:
c0dece3c:	b5e0      	push	{r5, r6, r7, lr}
c0dece3e:	9001      	str	r0, [sp, #4]
c0dece40:	4802      	ldr	r0, [pc, #8]	@ (c0dece4c <os_io_init+0x10>)
c0dece42:	a901      	add	r1, sp, #4
c0dece44:	f7ff fe82 	bl	c0decb4c <SVC_Call>
c0dece48:	bd8c      	pop	{r2, r3, r7, pc}
c0dece4a:	bf00      	nop
c0dece4c:	01000084 	.word	0x01000084

c0dece50 <os_io_start>:
c0dece50:	b5e0      	push	{r5, r6, r7, lr}
c0dece52:	2000      	movs	r0, #0
c0dece54:	4669      	mov	r1, sp
c0dece56:	9001      	str	r0, [sp, #4]
c0dece58:	4801      	ldr	r0, [pc, #4]	@ (c0dece60 <os_io_start+0x10>)
c0dece5a:	f7ff fe77 	bl	c0decb4c <SVC_Call>
c0dece5e:	bd8c      	pop	{r2, r3, r7, pc}
c0dece60:	01000085 	.word	0x01000085

c0dece64 <os_io_tx_cmd>:
c0dece64:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0dece66:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
c0dece6a:	4803      	ldr	r0, [pc, #12]	@ (c0dece78 <os_io_tx_cmd+0x14>)
c0dece6c:	4669      	mov	r1, sp
c0dece6e:	f7ff fe6d 	bl	c0decb4c <SVC_Call>
c0dece72:	b004      	add	sp, #16
c0dece74:	bd80      	pop	{r7, pc}
c0dece76:	bf00      	nop
c0dece78:	04000088 	.word	0x04000088

c0dece7c <os_io_rx_evt>:
c0dece7c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0dece7e:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
c0dece82:	4803      	ldr	r0, [pc, #12]	@ (c0dece90 <os_io_rx_evt+0x14>)
c0dece84:	4669      	mov	r1, sp
c0dece86:	f7ff fe61 	bl	c0decb4c <SVC_Call>
c0dece8a:	b004      	add	sp, #16
c0dece8c:	bd80      	pop	{r7, pc}
c0dece8e:	bf00      	nop
c0dece90:	03000089 	.word	0x03000089

c0dece94 <try_context_get>:
c0dece94:	b5e0      	push	{r5, r6, r7, lr}
c0dece96:	2000      	movs	r0, #0
c0dece98:	4669      	mov	r1, sp
c0dece9a:	9001      	str	r0, [sp, #4]
c0dece9c:	2087      	movs	r0, #135	@ 0x87
c0dece9e:	f7ff fe55 	bl	c0decb4c <SVC_Call>
c0decea2:	bd8c      	pop	{r2, r3, r7, pc}

c0decea4 <try_context_set>:
c0decea4:	b5e0      	push	{r5, r6, r7, lr}
c0decea6:	f000 f81d 	bl	c0decee4 <OUTLINED_FUNCTION_0>
c0deceaa:	4802      	ldr	r0, [pc, #8]	@ (c0deceb4 <try_context_set+0x10>)
c0deceac:	4669      	mov	r1, sp
c0deceae:	f7ff fe4d 	bl	c0decb4c <SVC_Call>
c0deceb2:	bd8c      	pop	{r2, r3, r7, pc}
c0deceb4:	0100010b 	.word	0x0100010b

c0deceb8 <os_sched_last_status>:
c0deceb8:	b5e0      	push	{r5, r6, r7, lr}
c0deceba:	f000 f813 	bl	c0decee4 <OUTLINED_FUNCTION_0>
c0decebe:	4803      	ldr	r0, [pc, #12]	@ (c0dececc <os_sched_last_status+0x14>)
c0decec0:	4669      	mov	r1, sp
c0decec2:	f7ff fe43 	bl	c0decb4c <SVC_Call>
c0decec6:	b2c0      	uxtb	r0, r0
c0decec8:	bd8c      	pop	{r2, r3, r7, pc}
c0dececa:	bf00      	nop
c0dececc:	0100009c 	.word	0x0100009c

c0deced0 <touch_get_last_info>:
c0deced0:	b5e0      	push	{r5, r6, r7, lr}
c0deced2:	9001      	str	r0, [sp, #4]
c0deced4:	4802      	ldr	r0, [pc, #8]	@ (c0decee0 <touch_get_last_info+0x10>)
c0deced6:	a901      	add	r1, sp, #4
c0deced8:	f7ff fe38 	bl	c0decb4c <SVC_Call>
c0decedc:	bd8c      	pop	{r2, r3, r7, pc}
c0decede:	bf00      	nop
c0decee0:	01fa000b 	.word	0x01fa000b

c0decee4 <OUTLINED_FUNCTION_0>:
c0decee4:	2100      	movs	r1, #0
c0decee6:	e9cd 0100 	strd	r0, r1, [sp]
c0deceea:	4770      	bx	lr

c0deceec <__aeabi_llsl>:
c0deceec:	0693      	lsls	r3, r2, #26
c0deceee:	d408      	bmi.n	c0decf02 <__aeabi_llsl+0x16>
c0decef0:	b132      	cbz	r2, c0decf00 <__aeabi_llsl+0x14>
c0decef2:	f1c2 0320 	rsb	r3, r2, #32
c0decef6:	4091      	lsls	r1, r2
c0decef8:	fa20 f303 	lsr.w	r3, r0, r3
c0decefc:	4090      	lsls	r0, r2
c0decefe:	4319      	orrs	r1, r3
c0decf00:	4770      	bx	lr
c0decf02:	f1a2 0120 	sub.w	r1, r2, #32
c0decf06:	fa00 f101 	lsl.w	r1, r0, r1
c0decf0a:	2000      	movs	r0, #0
c0decf0c:	4770      	bx	lr
	...

c0decf10 <__aeabi_llsr>:
c0decf10:	0693      	lsls	r3, r2, #26
c0decf12:	d408      	bmi.n	c0decf26 <__aeabi_llsr+0x16>
c0decf14:	b132      	cbz	r2, c0decf24 <__aeabi_llsr+0x14>
c0decf16:	f1c2 0320 	rsb	r3, r2, #32
c0decf1a:	40d0      	lsrs	r0, r2
c0decf1c:	fa01 f303 	lsl.w	r3, r1, r3
c0decf20:	40d1      	lsrs	r1, r2
c0decf22:	4318      	orrs	r0, r3
c0decf24:	4770      	bx	lr
c0decf26:	f1a2 0020 	sub.w	r0, r2, #32
c0decf2a:	fa21 f000 	lsr.w	r0, r1, r0
c0decf2e:	2100      	movs	r1, #0
c0decf30:	4770      	bx	lr
	...

c0decf34 <__udivmoddi4>:
c0decf34:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0decf38:	f8dd c020 	ldr.w	ip, [sp, #32]
c0decf3c:	4604      	mov	r4, r0
c0decf3e:	b179      	cbz	r1, c0decf60 <__udivmoddi4+0x2c>
c0decf40:	b1ba      	cbz	r2, c0decf72 <__udivmoddi4+0x3e>
c0decf42:	b35b      	cbz	r3, c0decf9c <__udivmoddi4+0x68>
c0decf44:	fab1 f581 	clz	r5, r1
c0decf48:	fab3 f683 	clz	r6, r3
c0decf4c:	1b75      	subs	r5, r6, r5
c0decf4e:	2d20      	cmp	r5, #32
c0decf50:	d34a      	bcc.n	c0decfe8 <__udivmoddi4+0xb4>
c0decf52:	f1bc 0f00 	cmp.w	ip, #0
c0decf56:	bf18      	it	ne
c0decf58:	e9cc 4100 	strdne	r4, r1, [ip]
c0decf5c:	2400      	movs	r4, #0
c0decf5e:	e066      	b.n	c0ded02e <__udivmoddi4+0xfa>
c0decf60:	b3cb      	cbz	r3, c0decfd6 <__udivmoddi4+0xa2>
c0decf62:	2100      	movs	r1, #0
c0decf64:	f1bc 0f00 	cmp.w	ip, #0
c0decf68:	bf18      	it	ne
c0decf6a:	e9cc 4100 	strdne	r4, r1, [ip]
c0decf6e:	2400      	movs	r4, #0
c0decf70:	e0a6      	b.n	c0ded0c0 <__udivmoddi4+0x18c>
c0decf72:	2b00      	cmp	r3, #0
c0decf74:	d03e      	beq.n	c0decff4 <__udivmoddi4+0xc0>
c0decf76:	2800      	cmp	r0, #0
c0decf78:	d04f      	beq.n	c0ded01a <__udivmoddi4+0xe6>
c0decf7a:	1e5d      	subs	r5, r3, #1
c0decf7c:	422b      	tst	r3, r5
c0decf7e:	d158      	bne.n	c0ded032 <__udivmoddi4+0xfe>
c0decf80:	f1bc 0f00 	cmp.w	ip, #0
c0decf84:	bf1c      	itt	ne
c0decf86:	ea05 0001 	andne.w	r0, r5, r1
c0decf8a:	e9cc 4000 	strdne	r4, r0, [ip]
c0decf8e:	fa93 f0a3 	rbit	r0, r3
c0decf92:	fab0 f080 	clz	r0, r0
c0decf96:	fa21 f400 	lsr.w	r4, r1, r0
c0decf9a:	e048      	b.n	c0ded02e <__udivmoddi4+0xfa>
c0decf9c:	1e55      	subs	r5, r2, #1
c0decf9e:	422a      	tst	r2, r5
c0decfa0:	d129      	bne.n	c0decff6 <__udivmoddi4+0xc2>
c0decfa2:	f1bc 0f00 	cmp.w	ip, #0
c0decfa6:	bf1e      	ittt	ne
c0decfa8:	2300      	movne	r3, #0
c0decfaa:	4005      	andne	r5, r0
c0decfac:	e9cc 5300 	strdne	r5, r3, [ip]
c0decfb0:	2a01      	cmp	r2, #1
c0decfb2:	f000 8085 	beq.w	c0ded0c0 <__udivmoddi4+0x18c>
c0decfb6:	fa92 f2a2 	rbit	r2, r2
c0decfba:	004c      	lsls	r4, r1, #1
c0decfbc:	fab2 f282 	clz	r2, r2
c0decfc0:	f002 031f 	and.w	r3, r2, #31
c0decfc4:	40d1      	lsrs	r1, r2
c0decfc6:	40d8      	lsrs	r0, r3
c0decfc8:	231f      	movs	r3, #31
c0decfca:	4393      	bics	r3, r2
c0decfcc:	fa04 f303 	lsl.w	r3, r4, r3
c0decfd0:	ea43 0400 	orr.w	r4, r3, r0
c0decfd4:	e074      	b.n	c0ded0c0 <__udivmoddi4+0x18c>
c0decfd6:	fbb0 f4f2 	udiv	r4, r0, r2
c0decfda:	f1bc 0f00 	cmp.w	ip, #0
c0decfde:	d026      	beq.n	c0ded02e <__udivmoddi4+0xfa>
c0decfe0:	fb04 0012 	mls	r0, r4, r2, r0
c0decfe4:	2100      	movs	r1, #0
c0decfe6:	e020      	b.n	c0ded02a <__udivmoddi4+0xf6>
c0decfe8:	f105 0e01 	add.w	lr, r5, #1
c0decfec:	f1be 0f20 	cmp.w	lr, #32
c0decff0:	d00b      	beq.n	c0ded00a <__udivmoddi4+0xd6>
c0decff2:	e028      	b.n	c0ded046 <__udivmoddi4+0x112>
c0decff4:	e064      	b.n	c0ded0c0 <__udivmoddi4+0x18c>
c0decff6:	fab1 f481 	clz	r4, r1
c0decffa:	fab2 f582 	clz	r5, r2
c0decffe:	1b2c      	subs	r4, r5, r4
c0ded000:	f104 0e21 	add.w	lr, r4, #33	@ 0x21
c0ded004:	f1be 0f20 	cmp.w	lr, #32
c0ded008:	d15d      	bne.n	c0ded0c6 <__udivmoddi4+0x192>
c0ded00a:	f04f 0e20 	mov.w	lr, #32
c0ded00e:	f04f 0a00 	mov.w	sl, #0
c0ded012:	f04f 0b00 	mov.w	fp, #0
c0ded016:	460e      	mov	r6, r1
c0ded018:	e021      	b.n	c0ded05e <__udivmoddi4+0x12a>
c0ded01a:	fbb1 f4f3 	udiv	r4, r1, r3
c0ded01e:	f1bc 0f00 	cmp.w	ip, #0
c0ded022:	d004      	beq.n	c0ded02e <__udivmoddi4+0xfa>
c0ded024:	2000      	movs	r0, #0
c0ded026:	fb04 1113 	mls	r1, r4, r3, r1
c0ded02a:	e9cc 0100 	strd	r0, r1, [ip]
c0ded02e:	2100      	movs	r1, #0
c0ded030:	e046      	b.n	c0ded0c0 <__udivmoddi4+0x18c>
c0ded032:	fab1 f581 	clz	r5, r1
c0ded036:	fab3 f683 	clz	r6, r3
c0ded03a:	1b75      	subs	r5, r6, r5
c0ded03c:	2d1f      	cmp	r5, #31
c0ded03e:	f4bf af88 	bcs.w	c0decf52 <__udivmoddi4+0x1e>
c0ded042:	f105 0e01 	add.w	lr, r5, #1
c0ded046:	fa20 f40e 	lsr.w	r4, r0, lr
c0ded04a:	f1c5 051f 	rsb	r5, r5, #31
c0ded04e:	fa01 f605 	lsl.w	r6, r1, r5
c0ded052:	fa21 fb0e 	lsr.w	fp, r1, lr
c0ded056:	40a8      	lsls	r0, r5
c0ded058:	f04f 0a00 	mov.w	sl, #0
c0ded05c:	4326      	orrs	r6, r4
c0ded05e:	f04f 0800 	mov.w	r8, #0
c0ded062:	f1be 0f00 	cmp.w	lr, #0
c0ded066:	d01c      	beq.n	c0ded0a2 <__udivmoddi4+0x16e>
c0ded068:	ea4f 014b 	mov.w	r1, fp, lsl #1
c0ded06c:	f1ae 0e01 	sub.w	lr, lr, #1
c0ded070:	ea41 71d6 	orr.w	r1, r1, r6, lsr #31
c0ded074:	0076      	lsls	r6, r6, #1
c0ded076:	ea46 75d0 	orr.w	r5, r6, r0, lsr #31
c0ded07a:	1aae      	subs	r6, r5, r2
c0ded07c:	eb61 0b03 	sbc.w	fp, r1, r3
c0ded080:	43cf      	mvns	r7, r1
c0ded082:	43ec      	mvns	r4, r5
c0ded084:	18a4      	adds	r4, r4, r2
c0ded086:	eb57 0403 	adcs.w	r4, r7, r3
c0ded08a:	bf5c      	itt	pl
c0ded08c:	468b      	movpl	fp, r1
c0ded08e:	462e      	movpl	r6, r5
c0ded090:	0040      	lsls	r0, r0, #1
c0ded092:	0fe1      	lsrs	r1, r4, #31
c0ded094:	ea48 044a 	orr.w	r4, r8, sl, lsl #1
c0ded098:	ea40 70da 	orr.w	r0, r0, sl, lsr #31
c0ded09c:	46a2      	mov	sl, r4
c0ded09e:	4688      	mov	r8, r1
c0ded0a0:	e7df      	b.n	c0ded062 <__udivmoddi4+0x12e>
c0ded0a2:	ea4f 71da 	mov.w	r1, sl, lsr #31
c0ded0a6:	f1bc 0f00 	cmp.w	ip, #0
c0ded0aa:	bf18      	it	ne
c0ded0ac:	e9cc 6b00 	strdne	r6, fp, [ip]
c0ded0b0:	ea41 0140 	orr.w	r1, r1, r0, lsl #1
c0ded0b4:	ea4f 004a 	mov.w	r0, sl, lsl #1
c0ded0b8:	f020 0001 	bic.w	r0, r0, #1
c0ded0bc:	ea40 0408 	orr.w	r4, r0, r8
c0ded0c0:	4620      	mov	r0, r4
c0ded0c2:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0ded0c6:	f1be 0f1f 	cmp.w	lr, #31
c0ded0ca:	d804      	bhi.n	c0ded0d6 <__udivmoddi4+0x1a2>
c0ded0cc:	fa20 f40e 	lsr.w	r4, r0, lr
c0ded0d0:	f1ce 0520 	rsb	r5, lr, #32
c0ded0d4:	e7bb      	b.n	c0ded04e <__udivmoddi4+0x11a>
c0ded0d6:	f1ce 0740 	rsb	r7, lr, #64	@ 0x40
c0ded0da:	f1ae 0420 	sub.w	r4, lr, #32
c0ded0de:	f04f 0b00 	mov.w	fp, #0
c0ded0e2:	fa20 f504 	lsr.w	r5, r0, r4
c0ded0e6:	fa01 f607 	lsl.w	r6, r1, r7
c0ded0ea:	fa00 fa07 	lsl.w	sl, r0, r7
c0ded0ee:	ea46 0805 	orr.w	r8, r6, r5
c0ded0f2:	fa21 f604 	lsr.w	r6, r1, r4
c0ded0f6:	4640      	mov	r0, r8
c0ded0f8:	e7b1      	b.n	c0ded05e <__udivmoddi4+0x12a>
	...

c0ded0fc <__aeabi_memcpy>:
c0ded0fc:	f000 b82c 	b.w	c0ded158 <memcpy>

c0ded100 <__aeabi_memmove>:
c0ded100:	f000 b838 	b.w	c0ded174 <memmove>

c0ded104 <__aeabi_memset>:
c0ded104:	460b      	mov	r3, r1
c0ded106:	4611      	mov	r1, r2
c0ded108:	461a      	mov	r2, r3
c0ded10a:	f000 b84d 	b.w	c0ded1a8 <memset>
c0ded10e:	bf00      	nop

c0ded110 <__aeabi_memclr>:
c0ded110:	460a      	mov	r2, r1
c0ded112:	2100      	movs	r1, #0
c0ded114:	f000 b848 	b.w	c0ded1a8 <memset>

c0ded118 <__aeabi_uldivmod>:
c0ded118:	b540      	push	{r6, lr}
c0ded11a:	b084      	sub	sp, #16
c0ded11c:	ae02      	add	r6, sp, #8
c0ded11e:	9600      	str	r6, [sp, #0]
c0ded120:	f7ff ff08 	bl	c0decf34 <__udivmoddi4>
c0ded124:	9a02      	ldr	r2, [sp, #8]
c0ded126:	9b03      	ldr	r3, [sp, #12]
c0ded128:	b004      	add	sp, #16
c0ded12a:	bd40      	pop	{r6, pc}

c0ded12c <explicit_bzero>:
c0ded12c:	f000 b800 	b.w	c0ded130 <bzero>

c0ded130 <bzero>:
c0ded130:	460a      	mov	r2, r1
c0ded132:	2100      	movs	r1, #0
c0ded134:	f000 b838 	b.w	c0ded1a8 <memset>

c0ded138 <memcmp>:
c0ded138:	b510      	push	{r4, lr}
c0ded13a:	3901      	subs	r1, #1
c0ded13c:	4402      	add	r2, r0
c0ded13e:	4290      	cmp	r0, r2
c0ded140:	d101      	bne.n	c0ded146 <memcmp+0xe>
c0ded142:	2000      	movs	r0, #0
c0ded144:	e005      	b.n	c0ded152 <memcmp+0x1a>
c0ded146:	7803      	ldrb	r3, [r0, #0]
c0ded148:	f811 4f01 	ldrb.w	r4, [r1, #1]!
c0ded14c:	42a3      	cmp	r3, r4
c0ded14e:	d001      	beq.n	c0ded154 <memcmp+0x1c>
c0ded150:	1b18      	subs	r0, r3, r4
c0ded152:	bd10      	pop	{r4, pc}
c0ded154:	3001      	adds	r0, #1
c0ded156:	e7f2      	b.n	c0ded13e <memcmp+0x6>

c0ded158 <memcpy>:
c0ded158:	440a      	add	r2, r1
c0ded15a:	4291      	cmp	r1, r2
c0ded15c:	f100 33ff 	add.w	r3, r0, #4294967295	@ 0xffffffff
c0ded160:	d100      	bne.n	c0ded164 <memcpy+0xc>
c0ded162:	4770      	bx	lr
c0ded164:	b510      	push	{r4, lr}
c0ded166:	f811 4b01 	ldrb.w	r4, [r1], #1
c0ded16a:	4291      	cmp	r1, r2
c0ded16c:	f803 4f01 	strb.w	r4, [r3, #1]!
c0ded170:	d1f9      	bne.n	c0ded166 <memcpy+0xe>
c0ded172:	bd10      	pop	{r4, pc}

c0ded174 <memmove>:
c0ded174:	4288      	cmp	r0, r1
c0ded176:	b510      	push	{r4, lr}
c0ded178:	eb01 0402 	add.w	r4, r1, r2
c0ded17c:	d902      	bls.n	c0ded184 <memmove+0x10>
c0ded17e:	4284      	cmp	r4, r0
c0ded180:	4623      	mov	r3, r4
c0ded182:	d807      	bhi.n	c0ded194 <memmove+0x20>
c0ded184:	1e43      	subs	r3, r0, #1
c0ded186:	42a1      	cmp	r1, r4
c0ded188:	d008      	beq.n	c0ded19c <memmove+0x28>
c0ded18a:	f811 2b01 	ldrb.w	r2, [r1], #1
c0ded18e:	f803 2f01 	strb.w	r2, [r3, #1]!
c0ded192:	e7f8      	b.n	c0ded186 <memmove+0x12>
c0ded194:	4601      	mov	r1, r0
c0ded196:	4402      	add	r2, r0
c0ded198:	428a      	cmp	r2, r1
c0ded19a:	d100      	bne.n	c0ded19e <memmove+0x2a>
c0ded19c:	bd10      	pop	{r4, pc}
c0ded19e:	f813 4d01 	ldrb.w	r4, [r3, #-1]!
c0ded1a2:	f802 4d01 	strb.w	r4, [r2, #-1]!
c0ded1a6:	e7f7      	b.n	c0ded198 <memmove+0x24>

c0ded1a8 <memset>:
c0ded1a8:	4603      	mov	r3, r0
c0ded1aa:	4402      	add	r2, r0
c0ded1ac:	4293      	cmp	r3, r2
c0ded1ae:	d100      	bne.n	c0ded1b2 <memset+0xa>
c0ded1b0:	4770      	bx	lr
c0ded1b2:	f803 1b01 	strb.w	r1, [r3], #1
c0ded1b6:	e7f9      	b.n	c0ded1ac <memset+0x4>

c0ded1b8 <setjmp>:
c0ded1b8:	46ec      	mov	ip, sp
c0ded1ba:	e8a0 5ff0 	stmia.w	r0!, {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
c0ded1be:	f04f 0000 	mov.w	r0, #0
c0ded1c2:	4770      	bx	lr

c0ded1c4 <longjmp>:
c0ded1c4:	e8b0 5ff0 	ldmia.w	r0!, {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
c0ded1c8:	46e5      	mov	sp, ip
c0ded1ca:	0008      	movs	r0, r1
c0ded1cc:	bf08      	it	eq
c0ded1ce:	2001      	moveq	r0, #1
c0ded1d0:	4770      	bx	lr
c0ded1d2:	bf00      	nop

c0ded1d4 <strcmp>:
c0ded1d4:	f810 2b01 	ldrb.w	r2, [r0], #1
c0ded1d8:	f811 3b01 	ldrb.w	r3, [r1], #1
c0ded1dc:	2a01      	cmp	r2, #1
c0ded1de:	bf28      	it	cs
c0ded1e0:	429a      	cmpcs	r2, r3
c0ded1e2:	d0f7      	beq.n	c0ded1d4 <strcmp>
c0ded1e4:	1ad0      	subs	r0, r2, r3
c0ded1e6:	4770      	bx	lr

c0ded1e8 <strlen>:
c0ded1e8:	4603      	mov	r3, r0
c0ded1ea:	f813 2b01 	ldrb.w	r2, [r3], #1
c0ded1ee:	2a00      	cmp	r2, #0
c0ded1f0:	d1fb      	bne.n	c0ded1ea <strlen+0x2>
c0ded1f2:	1a18      	subs	r0, r3, r0
c0ded1f4:	3801      	subs	r0, #1
c0ded1f6:	4770      	bx	lr

c0ded1f8 <strncpy>:
c0ded1f8:	4603      	mov	r3, r0
c0ded1fa:	b510      	push	{r4, lr}
c0ded1fc:	3901      	subs	r1, #1
c0ded1fe:	b132      	cbz	r2, c0ded20e <strncpy+0x16>
c0ded200:	f811 4f01 	ldrb.w	r4, [r1, #1]!
c0ded204:	3a01      	subs	r2, #1
c0ded206:	f803 4b01 	strb.w	r4, [r3], #1
c0ded20a:	2c00      	cmp	r4, #0
c0ded20c:	d1f7      	bne.n	c0ded1fe <strncpy+0x6>
c0ded20e:	2100      	movs	r1, #0
c0ded210:	441a      	add	r2, r3
c0ded212:	4293      	cmp	r3, r2
c0ded214:	d100      	bne.n	c0ded218 <strncpy+0x20>
c0ded216:	bd10      	pop	{r4, pc}
c0ded218:	f803 1b01 	strb.w	r1, [r3], #1
c0ded21c:	e7f9      	b.n	c0ded212 <strncpy+0x1a>

c0ded21e <C_app_boilerplate_64px_bitmap>:
c0ded21e:	0040 0040 b301 0000 00b1 8b1f 0008 0000     @.@.............
c0ded22e:	0000 0302 d175 0dbb 2103 060c 9f60 8522     ....u....!..`.".
c0ded23e:	1192 856e 706c 1da3 79a3 a414 6914 2929     ..n.lp...y...i))
c0ded24e:	1c2c ff83 0444 dce5 127c 1b0f a21b b8ab     ,...D...|.......
c0ded25e:	f0c3 2d31 cc32 c0b0 f93a 8530 b368 d0bd     ..1-2...:.0.h...
c0ded26e:	a288 0d9d 744a f0f2 c3a6 6bb4 b2ea bf6a     ....Jt.....k..j.
c0ded27e:	2fa7 436d 2afd c2b0 b932 fd9b 8609 b3a7     ./mC.*..2.......
c0ded28e:	74b0 d747 ab2a d51b 8dd3 8165 eb15 7382     .tG.*.....e....s
c0ded29e:	dcbd a301 f3df 848d 460d bcdd 9658 c9f7     .........F..X...
c0ded2ae:	4f8f 91f4 ef4f a38f 9bf7 7f36 e5b0 69e6     .O..O.....6....i
c0ded2be:	0d3e 12f3 afcc f32e cb2d f9dc 7fe2 7f96     >.......-.......
c0ded2ce:	1ffc e56f a9d1 0021 0002                     ..o...!....

c0ded2d9 <C_app_boilerplate_64px>:
c0ded2d9:	0040 0040 0100 d21e c0de                    @.@.......

c0ded2e3 <C_Check_Circle_64px_bitmap>:
c0ded2e3:	0040 0040 3321 0002 0231 8b1f 0008 0000     @.@.!3..1.......
c0ded2f3:	0000 0302 55ad 4e39 3103 fd14 6124 4b5f     .....U9N.1..$a_K
c0ded303:	8028 a091 2401 b888 4640 2054 4121 3949     (....$..@FT !AI9
c0ded313:	152d 00dc a090 1166 05a2 0171 1710 0a48     -.....f...q...H.
c0ded323:	026a 6017 41ab 8961 2404 9f21 65ef be66     j..`.Aa..$!..ef.
c0ded333:	0e3d c48b 9914 9fb1 fcfd fcfc 8cf3 7ff8     =...............
c0ded343:	f54f 1a60 7460 d8a9 de00 fd04 95cc 681c     O.`.`t.........h
c0ded353:	87cd c9e8 bf14 0185 7952 ae0b 301b 8b40     ........Ry...0@.
c0ded363:	c4b5 9cae 7cb5 f88d e070 ef89 0371 137e     .....|..p...q.~.
c0ded373:	fd5d 4e7a 4f7d d6b4 9e38 8ea5 b8f9 4c79     ].zN}O..8.....yL
c0ded383:	34cd e15b da9e 7c13 18bc 1930 a38b 5b15     .4[....|..0....[
c0ded393:	b94d a901 5a89 34af d0fa fbd4 5d41 b0b9     M....Z.4....A]..
c0ded3a3:	0ab1 6830 71fb 5315 0056 6e9a fc6c 2fb3     ..0h.q.SV..nl../
c0ded3b3:	24e2 dd75 bf49 012f d486 1057 ac8e 0a5a     .$u.I./...W...Z.
c0ded3c3:	aa32 dc97 5d54 3947 803e c954 7a63 b709     2...T]G9>.T.cz..
c0ded3d3:	815a c734 7fa9 bc41 000b 6a27 db3a e292     Z.4...A...'j:...
c0ded3e3:	12ed 3f6f 8274 64b6 f810 4052 a01d de23     ..o?t..d..R@..#.
c0ded3f3:	2712 6220 73a5 9d0a cf04 db00 e588 5bd8     .' b.s.........[
c0ded403:	e08b 0a5d 027c a128 8093 ee56 ab15 0ca4     ..].|.(...V.....
c0ded413:	1953 0781 889d a1eb 493b 0082 11da c517     S.......;I......
c0ded423:	9b8f 4760 f54c 0b95 822e f14b 41ed 360f     ..`GL.....K..A.6
c0ded433:	b820 d215 48a4 c137 3093 c2c8 8139 e70b      ....H7..0..9...
c0ded443:	4e04 105c 30ac d4dc 08a7 9856 acbe 7c5d     .N\..0....V...]|
c0ded453:	5e31 0710 701c 347f 5aff 4fe8 36b3 adc9     1^...p.4.Z.O.6..
c0ded463:	802f c436 7653 d63e 3cfe 2d61 5f3f ba73     /.6.Sv>..<a-?_s.
c0ded473:	df3a acb2 d712 0ff4 1f59 2554 6ec3 5f7b     :.......Y.T%.n{_
c0ded483:	6554 3b01 e340 8e78 cad4 febe e91f 4c92     Te.;@.x........L
c0ded493:	f2b3 e8c9 ce32 92b3 a68c 3457 3971 702e     ....2.....W4q9.p
c0ded4a3:	b6aa 0f34 d91d e35f f2e1 639e a7d5 fd79     ..4..._....c..y.
c0ded4b3:	ba44 dde8 6369 1aef c3e5 3464 9dd2 272f     D...ic....d4../'
c0ded4c3:	cbbf 1fa7 8df3 b09c 9b03 5328 2325 8d5f     ..........(S%#_.
c0ded4d3:	3ec0 f233 eb15 7359 39c0 5158 f322 2c7d     .>3...Ys.9XQ".},
c0ded4e3:	f7cc 448d cbbe a6c0 e1fb f102 dd51 030f     ...D........Q...
c0ded4f3:	0898 fe6c ec64 ac2b 19ea f170 f7af 2d1b     ..l.d.+...p....-
c0ded503:	1fb1 b3c2 2e0d dad0 0cd6 c8c0 fe72 af1f     ............r...
c0ded513:	fc6c 2402 5a14 00c5 0008                     l..$.Z.....

c0ded51e <C_Check_Circle_64px>:
c0ded51e:	0040 0040 0102 d2e3 c0de                    @.@.......

c0ded528 <C_Denied_Circle_64px_bitmap>:
c0ded528:	0040 0040 3021 0002 022e 8b1f 0008 0000     @.@.!0..........
c0ded538:	0000 0302 55ad 2f4b 4104 2e10 bd6b 479f     .....UK/.A..k..G
c0ded548:	d80e 4884 ac90 3f8d e260 2244 e8e1 71b8     ...H...?`.D"...q
c0ded558:	e273 201f ece1 7111 fe25 f100 d607 d9c1     s.. ...q%.......
c0ded568:	07f2 e63c d64c e363 a6b9 f554 a663 67a7     ..<.L.c...T.c..g
c0ded578:	9766 1f44 b676 babb beaa eafe 6aeb ffc4     f.D.v........j..
c0ded588:	5f1b 13fb 4300 c50b f304 a806 5331 b18a     ._...C......1S..
c0ded598:	1c56 47f0 58ba 0cd5 2a90 6658 642f 6806     V..G.X...*Xf/d.h
c0ded5a8:	52b4 08ec a5af c46b fdfb ff0c 0d1f df99     .R....k.........
c0ded5b8:	a978 f947 bb78 5b3c ed35 5a39 0d98 47a6     x.G.x.<[5.9Z...G
c0ded5c8:	ad34 3237 34b8 331f f3f7 6c86 8e00 3632     4.72.4.3...l..26
c0ded5d8:	e185 09e6 3f8d a17b 07dd bc61 b41f a934     .....?{...a...4.
c0ded5e8:	2b27 7d00 1f36 4157 4fc8 ba80 db1b ddfe     '+.}6.WA.O......
c0ded5f8:	c7ed 7424 511d 2fbe fa01 bfe5 247c 42bb     ..$t.Q./....|$.B
c0ded608:	9690 2555 e336 49ca 44a8 9e99 a3cd 831a     ..U%6..I.D......
c0ded618:	e7d6 7bf8 7006 0f2c a96d a005 bf9d 668e     ...{.p,.m......f
c0ded628:	5162 3ff3 bf2c 008e 01e0 8ab4 abe9 e34e     bQ.?,.........N.
c0ded638:	32c2 c0aa e712 3ab8 aa46 d8a4 7896 009f     .2.....:F....x..
c0ded648:	10b6 facb 1974 9385 90e8 df1b c005 8047     ....t.........G.
c0ded658:	1a12 9eeb c7de bb99 4b38 a82a d662 e770     ........8K*.b.p.
c0ded668:	6d88 6b88 3b3e 12c2 33b8 16a2 79c4 09fe     .m.k>;...3...y..
c0ded678:	1802 b8ee aecd 648e 0741 dc30 44a9 9cf5     .......dA.0..D..
c0ded688:	d3a4 91d4 8ee1 0cb7 804d 7434 1468 91e3     ........M.4th...
c0ded698:	3209 1ced 7020 bbff 2e3d 2d7e b97c 7c40     .2.. p..=.~-|.@|
c0ded6a8:	f9f6 b8ce f9c0 fc6a 2834 9292 6df8 3c46     ......j.4(...mF<
c0ded6b8:	56a9 f69f f5da 0b2d 1895 aeeb 9abe 421f     .V....-........B
c0ded6c8:	a41f 8192 7d78 4b3d 2965 4719 79f5 3328     ....x}=Ke).G.y(3
c0ded6d8:	ea3b 451e 9df4 0691 b192 cdd5 fa4a 8b5a     ;..E........J.Z.
c0ded6e8:	65c0 702d b86b bd6a 3762 9f17 151d 49d7     .e-pk.j.b7.....I
c0ded6f8:	dfba d88a a4bb 90fe 77f5 f7c6 e397 f5df     .........w......
c0ded708:	9aa7 8dfd a6af b0d5 4257 7442 86ed 1a7d     ........WBBt..}.
c0ded718:	21d2 b97a 86f0 ee73 91cf 3efe f9a2 8f5f     .!z...s....>.._.
c0ded728:	77f4 b0d1 7de9 40b8 907c 43ef 462f b61a     .w...}.@|..C/F..
c0ded738:	d239 13f6 95f6 9909 7f8b df7d c528 369e     9.........}.(..6
c0ded748:	274f a03c cd95 8029 a5c1 3fc2 d93e 03f8     O'<...)....?>...
c0ded758:	a770 8485 0800 0000                         p.......

c0ded760 <C_Denied_Circle_64px>:
c0ded760:	0040 0040 0102 d528 c0de                    @.@...(...

c0ded76a <C_Important_Circle_64px_bitmap>:
c0ded76a:	0040 0040 fa21 0001 01f8 8b1f 0008 0000     @.@.!...........
c0ded77a:	0000 0302 55b5 4ecd 40c2 1e10 fea1 cfe3     .....U.N.@......
c0ded78a:	0f51 892a d45e 8904 602f 49e3 1313 7a3c     Q.*.^.../`.I..<z
c0ded79a:	cae4 37cd 1350 a33d 70c6 f8d5 1802 005f     ...7P.=..p...._.
c0ded7aa:	9e0f 5f05 1fc0 1ace 4910 c054 b38e b6ed     ..._.....IT.....
c0ded7ba:	db74 d059 e704 76d0 dbf6 7cee 76fd 2dfa     t.Y....v...|.v.-
c0ded7ca:	ef62 99a2 055b d858 6a29 43e0 b190 6159     b...[.X.)j.C..Ya
c0ded7da:	96d0 5e09 c518 308e a440 8010 052d 1806     ...^...0@...-...
c0ded7ea:	9408 b138 cadf 203c e4be e2e2 4979 3f81     ..8...< ....yI.?
c0ded7fa:	d0c4 7c94 3ac7 d915 1f9e d24f 56c0 bd3b     ...|.:....O..V;.
c0ded80a:	34a4 abea a650 d97c 5f3f 484c c9b4 c551     .4..P.|.?_LH..Q.
c0ded81a:	9541 9a6e 78d8 3bd9 3ecd f957 d17e 9ad0     A.n..x.;.>W.~...
c0ded82a:	ec9b cc02 f504 6fb8 d92f e800 0c7b dfe2     .......o/...{...
c0ded83a:	de93 c49a 2c6e 77ac 6009 79d6 874a 4baa     ....n,.w.`.yJ..K
c0ded84a:	8606 abb3 26a4 9db7 cac4 a6de ff9a 7d53     .....&........S}
c0ded85a:	e341 7129 01bf b3c8 02dd 1310 d377 84a7     A.)q........w...
c0ded86a:	a612 c04d 1802 71e1 d85a b9e1 e3c2 006f     ..M....qZ.....o.
c0ded87a:	c459 fb3a 2275 6d3e 5582 0a80 538f 09e5     Y.:.u">m.U...S..
c0ded88a:	2551 eba2 38f7 228c f3ee 38ea 0ec2 6e23     Q%...8."...8..#n
c0ded89a:	0b8b c71f 55e2 51d3 8b81 4412 9145 3b71     .....U.Q...DE.q;
c0ded8aa:	f769 20b6 159e 4f43 9a82 924d abc7 a042     i.. ..CO..M...B.
c0ded8ba:	c6ff f1bb 724b e7cd a06e 4521 e9d2 2fd3     ....Kr..n.!E.../
c0ded8ca:	d245 3be9 7884 69d5 627f f7dd 2eb7 b2c9     E..;.x.i.b......
c0ded8da:	407f eeca 3992 af1e 9d39 ba05 bc0d 2a70     .@...9..9.....p*
c0ded8ea:	f29b 623f 19e8 8db2 1c0b 90dc d70b 0d35     ..?b..........5.
c0ded8fa:	965e ade3 b9a0 ea78 75c8 dd4d 2dff 7d85     ^.....x..uM..-.}
c0ded90a:	f9d6 c243 c99b 4bfb 77fe d4fe dfd5 8948     ..C....K.w....H.
c0ded91a:	61a0 92d3 8a91 afe2 618a 2b5f 8afe 5256     .a.......a_+..VR
c0ded92a:	709d fc2b e439 8bef bfae 841f ddfc 6c36     .p+.9.........6l
c0ded93a:	1f3a 10ee 9d5f 61f3 431a ed86 230f 53d8     :..._..a.C...#.S
c0ded94a:	b8cd 1702 7aff 51be 3389 de17 f4d0 eb73     .....z.Q.3....s.
c0ded95a:	1d68 3e60 e853 91e1 3f8d c10e e439 0800     h.`>S....?..9...
	...

c0ded96c <C_Important_Circle_64px>:
c0ded96c:	0040 0040 0102 d76a c0de                    @.@...j...

c0ded976 <C_Warning_64px_bitmap>:
c0ded976:	0040 0040 5f21 0001 015d 8b1f 0008 0000     @.@.!_..].......
c0ded986:	0000 0302 d585 4e31 40c3 0510 8dd0 0885     ......1N.@......
c0ded996:	454a 9149 25c2 52b2 08e4 4039 19c4 8272     JEI..%.R..9@..r.
c0ded9a6:	815c 0384 b880 c441 7205 0a04 e7d2 6908     \.....A..r.....i
c0ded9b6:	a202 a50b a113 ec1d 5d99 f6b3 1fee fb6f     .........]....o.
c0ded9c6:	96c6 febc 4333 4f84 27b9 5ced ebf2 c293     ....3C.O.'.\....
c0ded9d6:	53bf 2663 cf0a 318c 9d23 5bb1 e866 5176     .Sc&...1#..[f.vQ
c0ded9e6:	60e1 7d06 3f5d b8fc ce41 24bc cce4 4273     .`.}]?..A..$..sB
c0ded9f6:	eafe f818 e79b efb4 966a 4b7b 7339 c841     ........j.{K9sA.
c0deda06:	ef99 f908 e431 bfd8 1c5a 7979 f15b 9090     ....1...Z.yy[...
c0deda16:	8733 6891 f33b 1855 96a9 239f f96e 8f25     3..h;.U....#n.%.
c0deda26:	7438 4b8e c9d6 bfeb 6f0b 3809 e0f3 8085     8t.K.....o.8....
c0deda36:	34db 977b c5b0 5dec 46c2 5dc8 90d8 9baf     .4{....].F.]....
c0deda46:	94b8 9fc6 fa1b 4631 36dc 7d8c ba4e 3d17     ......1F.6.}N..=
c0deda56:	bdae e25f c4bc 9f6e eff4 eb93 164b f784     .._...n.....K...
c0deda66:	2a9b fe68 5d4f 3d90 7743 5b05 7de8 70f9     .*h.O].=Cw.[.}.p
c0deda76:	ebf1 4416 ccf9 a1de 00bb a01f 39d3 b4ef     ...D.........9..
c0deda86:	b74f bebf fef5 ed72 141b fba4 787b 2e82     O.....r.....{x..
c0deda96:	f705 e9d8 1833 c93f f4f9 cfa1 9727 0297     ....3.?.....'...
c0dedaa6:	14bb b04c c14b 7603 89f2 6e43 fa57 f77c     ..L.K..v..CnW.|.
c0dedab6:	db89 fbe8 4cc5 fd95 50b4 93f7 605f 6523     .....L...P.._`#e
c0dedac6:	e63f 73ba c6a0 fb3d f499 5e05 cbcd e43f     ?..s..=....^..?.
c0dedad6:	7b2a 0024 0008                               *{$....

c0dedadd <C_Warning_64px>:
c0dedadd:	0040 0040 0102 d976 c0de                    @.@...v...

c0dedae7 <C_Back_40px_bitmap>:
c0dedae7:	0028 0028 8c21 0000 008a 8b1f 0008 0000     (.(.!...........
c0dedaf7:	0000 0302 d3ed 09cd 20c0 800c d0d1 0e53     ......... ....S.
c0dedb07:	a21d 39a3 364a 9570 d26e c46d c143 c7e6     ...9J6p.n.m.C...
c0dedb17:	a8d6 73d0 f50f e110 81e3 b010 9794 f843     ...s..........C.
c0dedb27:	efb7 c3b6 53b7 4667 28df dcca b621 6196     .....SgF.(..!..a
c0dedb37:	2b95 b601 0646 d04a 5b5b fa86 4192 376d     .+..F.J.[[...Am7
c0dedb47:	50ab c3da 942a 98d6 6e41 198e e6e4 4299     .P..*...An.....B
c0dedb57:	8ec2 2429 99ec 6dc0 6181 0933 c4f8 5561     ..)$...m.a3...aU
c0dedb67:	6001 605a 199a 7c43 01fb 02e5 04e6 e43a     .`Z`..C|......:.
c0dedb77:	0320 0000                                    ...

c0dedb7b <C_Back_40px>:
c0dedb7b:	0028 0028 0102 dae7 c0de                    (.(.......

c0dedb85 <C_Check_40px_bitmap>:
c0dedb85:	0028 0028 5401 0000 0052 8b1f 0008 0000     (.(..T..R.......
c0dedb95:	0000 0302 6063 05c0 4078 1c84 9088 1307     ....c`..x@......
c0dedba5:	400d ff82 9000 7f60 2400 3f98 0900 1fc6     .@....`..$.?....
c0dedbb5:	9920 203f 0ea2 d844 57e3 2608 602a b02c      .? ..D..W.&*`,.
c0dedbc5:	5818 ac16 ac0e ac03 1ed7 5e6e 5c0d 0183     .X........n^.\..
c0dedbd5:	0103 0000 8363 77dc 00c8 0000               ....c..w....

c0dedbe1 <C_Check_40px>:
c0dedbe1:	0028 0028 0100 db85 c0de                    (.(.......

c0dedbeb <C_Chevron_40px_bitmap>:
c0dedbeb:	0028 0028 5c22 0000 ffff ffff ffff ffff     (.(."\..........
c0dedbfb:	1cda 03e4 0310 03e2 0330 03e0 0350 03de     ........0...P...
c0dedc0b:	1820 0320 03dc 0820 08c1 0320 03da 0820      . ... ... ... .
c0dedc1b:	08c3 0320 03d8 0820 08c5 0320 03d6 0820     .. ... ... ... .
c0dedc2b:	08c7 0320 05d4 0820 08c9 0520 9ed3 8020     .. ... ... ... .
c0dedc3b:	98cb e002 0ed4 cd09 0e09 ffff ffff ffff     ................
c0dedc4b:	ffff e2ff                                   ....

c0dedc4f <C_Chevron_40px>:
c0dedc4f:	0028 0028 0102 dbeb c0de                    (.(.......

c0dedc59 <C_Chevron_Back_40px_bitmap>:
c0dedc59:	0028 0028 7621 0000 0074 8b1f 0008 0000     (.(.!v..t.......
c0dedc69:	0000 0302 d2ed 0dc1 3080 0508 8e50 383d     .........0..P.=8
c0dedc79:	a3a4 41b0 7157 6e93 3863 d498 1042 eb7e     ...AWq.nc8..B.~.
c0dedc89:	4606 340e bfe5 0b84 ffbd aa35 e7e1 2eb2     .F.4......5.....
c0dedc99:	6705 b55c 541f 2473 e9b4 1273 7640 27b0     .g\..Ts$..s.@v.'
c0dedca9:	2794 c807 0711 4c94 3203 73ac b828 21cd     .'.....L.2.s(..!
c0dedcb9:	8732 7313 3338 0b83 b833 8532 532b 62f8     2..s83..3.2.+S.b
c0dedcc9:	9603 1dcf 0dc6 8ef2 7343 0320 0000          ........Cs ...

c0dedcd7 <C_Chevron_Back_40px>:
c0dedcd7:	0028 0028 0102 dc59 c0de                    (.(...Y...

c0dedce1 <C_Chevron_Next_40px_bitmap>:
c0dedce1:	0028 0028 7121 0000 006f 8b1f 0008 0000     (.(.!q..o.......
c0dedcf1:	0000 0302 ceed 0dbb 3080 450c 5751 0a51     .........0.EQWQ.
c0dedd01:	cc86 ac06 0d90 0918 42a6 1448 c48f 8e44     .........BH...D.
c0dedd11:	1b3f 6e20 74f9 1964 58f8 8735 22e9 02da     ?. n.td..X5.."..
c0dedd21:	ca23 a581 61e2 f5a5 b074 c031 c6c1 0b00     #....a..t.1.....
c0dedd31:	3999 ccc8 c1c2 1c0c 434c 0a61 9b0a 3150     .9......LCa...P1
c0dedd41:	c781 1d64 ec2e fe92 bcbe 7707 ddbd ebf8     ..d........w....
c0dedd51:	383d be09 209b 0003                          =8... ...

c0dedd5a <C_Chevron_Next_40px>:
c0dedd5a:	0028 0028 0102 dce1 c0de                    (.(.......

c0dedd64 <C_Close_40px_bitmap>:
c0dedd64:	0028 0028 8521 0000 0083 8b1f 0008 0000     (.(.!...........
c0dedd74:	0000 0302 fffb c07f bfc0 08f9 cff6 10f7     ................
c0dedd84:	11fa 4207 41ac 420f 604f 87e8 fd09 e060     ...B.A.BO`....`.
c0dedd94:	3184 0ae0 e01b 70d2 9216 9c2c 5089 6706     .1.....p..,..P.g
c0dedda4:	2923 7383 9590 7941 ca28 5ca0 6554 3e60     #).s..Ay(..\Te`>
c0deddb4:	329a 42b0 6574 8520 cae8 0a40 9431 1561     .2.Bte ...@.1.a.
c0deddc4:	a2c3 9b17 581d 82dc cdcd fc58 2d86 b00c     .....X....X..-..
c0deddd4:	1584 30b6 12c5 d8f6 08e2 5c5b 8b62 6c73     ...0......[\b.sl
c0dedde4:	6369 0040 b400 b40b 2014 0003                ic@...... ...

c0deddf1 <C_Close_40px>:
c0deddf1:	0028 0028 0102 dd64 c0de                    (.(...d...

c0deddfb <C_Info_40px_bitmap>:
c0deddfb:	0028 0028 3121 0000 002f 8b1f 0008 0000     (.(.!1../.......
c0dede0b:	0000 0302 fffb 147f 0bd0 f030 67ff 0180     ..........0..g..
c0dede1b:	2a7e 7189 5a60 80d3 ec45 cf57 f068 0593     ~*.q`Z..E.W.h...
c0dede2b:	d900 c99e 2019 0003                          ..... ...

c0dede34 <C_Info_40px>:
c0dede34:	0028 0028 0102 ddfb c0de                    (.(.......

c0dede3e <C_Mini_Push_40px_bitmap>:
c0dede3e:	0028 0028 ce21 0000 00cc 8b1f 0008 0000     (.(.!...........
c0dede4e:	0000 0302 936d 0dcd 30c2 460c 2123 4ea4     ....m....0.F#!.N
c0dede5e:	ba83 2b01 5230 6037 4604 0762 b006 5c0f     ...+0R7`.Fb....\
c0dede6e:	4240 4936 2f9c f6bf c9a5 b3d3 3913 aaae     @B6I./.......9..
c0dede7e:	1085 0eb1 4911 1e0a 7710 829f 6ab0 5a90     .....I...w...j.Z
c0dede8e:	9606 3ac2 08a7 a7f5 a2d1 4761 b5e3 d168     ...:......aG..h.
c0dede9e:	2f6c 053a a92f f019 a4cc fb95 6b3d cac1     l/:./.......=k..
c0dedeae:	53f6 6563 0ef5 8ae1 c043 10f6 3220 db41     .Sce....C... 2A.
c0dedebe:	880e d044 1fee 8588 4d45 6215 5161 8553     ..D.....EM.baQS.
c0dedece:	2c68 556b 7634 5a4b cf12 e599 bcbb ab36     h,kU4vKZ......6.
c0dedede:	5c7e fdda 61e4 cbec d6c6 b81e ebcc db95     ~\...a..........
c0dedeee:	af53 def7 791b e96f f9be 9628 eac9 b147     S....yo...(...G.
c0dedefe:	3926 e6b3 a4ce bb37 8cee ff4f 1fc2 8764     &9....7...O...d.
c0dedf0e:	9d98 0320 0000                              .. ...

c0dedf14 <C_Mini_Push_40px>:
c0dedf14:	0028 0028 0102 de3e c0de                    (.(...>...

c0dedf1e <C_Privacy_40px_bitmap>:
c0dedf1e:	0028 0028 ac21 0001 01aa 8b1f 0008 0000     (.(.!...........
c0dedf2e:	0000 0302 927d 4bbf 50c3 c710 e9af 8b4f     ....}..K.P....O.
c0dedf3e:	1768 0741 b335 fe88 6609 1d28 2c44 1fe2     h.A.5....f(.D,..
c0dedf4e:	2ea0 cdd2 2e0a 6082 a45c b4b8 0ff8 4418     .......`\......D
c0dedf5e:	1c50 b3b4 dd28 60a5 8777 38a2 10e9 b56b     P...(..`w..8..k.
c0dedf6e:	dac6 bce6 97bb 2da6 378a 25e4 f79f f7de     .......-.7.%....
c0dedf7e:	77be c439 a3bf ba75 ca9e f75c 26a1 8448     .w9...u...\..&H.
c0dedf8e:	7a2e 23d8 b178 1f40 5e4e 6ad8 7320 7b7e     .z.#x.@.N^.j s~{
c0dedf9e:	4cb6 1a70 8cd1 7231 2e21 cf5b 8c06 03a3     .Lp...1r!.[.....
c0dedfae:	1ac2 a730 dc34 2ab5 4166 beee c941 6e97     ..0.4..*fA..A..n
c0dedfbe:	63a8 6968 74dd d859 d595 fb88 81c8 5288     .chi.tY........R
c0dedfce:	2181 90c9 a1bb 74a4 16cc 69c7 9e7a 9390     .!.....t...iz...
c0dedfde:	4e29 1eda d913 c423 f127 53ac 07d2 22a8     )N....#.'..S..."
c0dedfee:	e1d6 5d0e 461d 4b72 49c0 30eb f88b 880a     ...].FrK.I.0....
c0dedffe:	10ef 6125 8d93 09ba a8da c904 5c0e 328a     ..%a.........\.2
c0dee00e:	283b 1004 218b 5d44 cd39 2bd2 c9dd 15a3     ;(...!D]9..+....
c0dee01e:	36c1 084c 01ab 6919 24c1 e237 561b 7d84     .6L....i.$7..V.}
c0dee02e:	8488 c031 51cc 7b85 216b 9bf4 c259 fe9a     ..1..Q.{k!..Y...
c0dee03e:	92dd 9faa b872 cb24 3521 a8b4 62fe b698     ....r.$.!5...b..
c0dee04e:	c2a2 4d4c 6cbc 4560 f7eb 916c 5521 cc5b     ..LM.l`E..l.!U[.
c0dee05e:	86e6 8752 3d5c adc2 7bf7 d9a0 a6dc be99     ..R.\=...{......
c0dee06e:	2d5e 26b2 a8cb 1e9e 9a13 8b17 3a52 f30c     ^-.&........R:..
c0dee07e:	3ef3 a327 ca61 ae09 8fcf 084f 5aca f908     .>'.a.....O..Z..
c0dee08e:	35c8 ffbc a35f 5ec4 41ec f3b8 d353 3a1e     .5.._..^.A..S..:
c0dee09e:	f604 9120 5418 b993 8329 5e85 db99 f2e5     .. ..T..)..^....
c0dee0ae:	56d5 6002 57d4 75ae b266 f08b 114b a76d     .V.`.W.uf...K.m.
c0dee0be:	a077 f65f c993 81d4 ff8d 0fc5 af18 4ccb     w._............L
c0dee0ce:	0320 0000                                    ...

c0dee0d2 <C_Privacy_40px>:
c0dee0d2:	0028 0028 0102 df1e c0de                    (.(.......

c0dee0dc <C_QRCode_40px_bitmap>:
c0dee0dc:	0028 0028 9921 0000 0097 8b1f 0008 0000     (.(.!...........
c0dee0ec:	0000 0302 fffb da9f 11e0 0803 bd30 00ff     ............0...
c0dee0fc:	fea2 607f 8900 8029 18c5 91f4 20c5 0c42     ...`..)...... B.
c0dee10c:	28fc fc62 1230 c2c2 f62d a3a7 4307 07ec     .(b.0...-....C..
c0dee11c:	0703 ff84 6101 b11e 1062 c0f3 903c 9073     .....a..b...<.s.
c0dee12c:	25ec 8628 07f0 cc3f 4839 85fe 218b 0b85     .%(...?.9H...!..
c0dee13c:	923f 49b3 d30a 107f f583 ed90 04f8 99a1     ?..I............
c0dee14c:	c230 9b14 d19b 19c2 0c55 061e 3a27 a3ce     0.......U...':..
c0dee15c:	1586 d790 d0c0 aa4f 3618 88f3 0b74 7f16     ......O..6..t...
c0dee16c:	f360 b62f a170 002e 5b00 1eb2 20fb 0003     `./.p....[... ..
	...

c0dee17d <C_QRCode_40px>:
c0dee17d:	0028 0028 0102 e0dc c0de                    (.(.......

c0dee187 <C_Settings_40px_bitmap>:
c0dee187:	0028 0028 9321 0001 0191 8b1f 0008 0000     (.(.!...........
c0dee197:	0000 0302 5275 52b1 40c2 7d10 88c9 9841     ....uR.R.@.}..A.
c0dee1a7:	8c91 8e56 10ce 5e87 3e46 ec40 93b0 4e8e     ..V....^F>@....N
c0dee1b7:	03fd 4053 850d 1695 9d62 4a42 b03b 8a93     ..S@....b.BJ;...
c0dee1c7:	0bf1 04fc 1c1c 40eb a202 3920 2f77 1738     .......@.. 9w/8.
c0dee1d7:	d818 6f62 e5ef eef2 bbed 6215 8c7d ad4d     ..bo.......b}.M.
c0dee1e7:	8cba 81d5 25ad 8028 6b61 45dd 87ac 8fac     .....%(.ak.E....
c0dee1f7:	daac 764f 4e0b 7751 3303 aed6 761c ac42     ..Ov.NQw.3...vB.
c0dee207:	8a01 1084 f9ad 314a 12e5 74f7 2cb5 8c9a     ......J1...t.,..
c0dee217:	300d 976b 5c73 4ae5 8b8e 5734 5c1e 3dc5     .0k.s\.J..4W.\.=
c0dee227:	9e43 1197 0a3a e29b 765c 4780 fd85 1aa0     C...:...\v.G....
c0dee237:	9e59 5cee 6075 4b8a 57ca 26c0 c381 6890     Y..\u`.K.W.&...h
c0dee247:	fac4 2c7b 48e3 1f08 7c17 4593 0557 0a16     ..{,.H...|.EW...
c0dee257:	d037 8459 a74e 601f f108 0385 9e21 2d71     7.Y.N..`....!.q-
c0dee267:	8d44 19ec 2343 7786 f9a6 8a45 b79a 1d50     D...C#.w..E...P.
c0dee277:	84e0 5a08 cc1b 9a7c 0e90 fba5 ef06 716a     ...Z..|.......jq
c0dee287:	76ce 5398 2c73 25fa 6035 a205 fe11 a49b     .v.Ss,.%5`......
c0dee297:	81f4 18f4 b93a c7d3 8b1b a6df 5264 755b     ....:.......dR[u
c0dee2a7:	59c4 becb af10 c5ac 9ec6 b960 87d4 b385     .Y........`.....
c0dee2b7:	cb32 a1f5 4bf3 b27d ff65 79bd f9b2 b2d0     2....K}.e..y....
c0dee2c7:	3d80 6650 5e86 2f05 11b7 5733 3a79 f45c     .=Pf.^./..3Wy:\.
c0dee2d7:	f25e e8f9 6746 1b24 65be aed0 b864 14ca     ^...Fg$..e..d...
c0dee2e7:	6e9c 96f8 f913 44d4 2df3 8e8b 8d9a 9aa4     .n.....D.-......
c0dee2f7:	c911 53bb 8a72 1b9a b158 f976 a9b8 3db8     ...Sr...X.v....=
c0dee307:	3de4 50e9 6624 61a6 6747 dd64 aeec f19c     .=.P$f.aGgd.....
c0dee317:	fc68 4701 f51a 207f 0003                     h..G... ...

c0dee322 <C_Settings_40px>:
c0dee322:	0028 0028 0102 e187 c0de                    (.(.......

c0dee32c <C_Warning_40px_bitmap>:
c0dee32c:	0028 0028 e721 0000 00e5 8b1f 0008 0000     (.(.!...........
c0dee33c:	0000 0302 d36d 0db1 40c2 850c 47e1 2284     ....m....@...G."
c0dee34c:	283a d511 88d5 1182 0032 8662 904c 0815     :(......2.b.L...
c0dee35c:	3013 2c03 0ec0 9e88 1025 526d 8450 9d10     .0.,....%.mRP...
c0dee36c:	73b9 8842 b87d aafc 675f 911f 4b1c 34c1     .sB.}..._g...K.4
c0dee37c:	0b26 c128 5b44 c08a c0f6 d95a d811 d2e6     &.(.D[....Z.....
c0dee38c:	c0ae a486 81dd 4905 80ab 4939 66ab 4988     .......I..9I.f.I
c0dee39c:	635a be30 7349 11ad c0d3 8c52 240e b5cd     Zc0.Is....R..$..
c0dee3ac:	d476 6f9b 6925 2adc 6dad d615 0eb5 c5ed     v..o%i.*.m......
c0dee3bc:	25ad 4cfc b04b b93d b035 db42 20db 942e     .%.LK.=.5.B.. ..
c0dee3cc:	43d1 773e e2db a970 2e8d 4ac0 9d1b 4c80     .C>w..p....J...L
c0dee3dc:	e51b ec3f a6cd ce88 c8ca 5f26 bc1c 6d7d     ..?.......&_..}m
c0dee3ec:	5db8 a8ee 76e6 cbb5 5dae bcee 576d c1b7     .]...v...]..mW..
c0dee3fc:	caed 5db8 6f9b da37 9fec f49b 81ed ccb9     ...].o7.........
c0dee40c:	785d fef8 7c2f 1300 b8d8 2006 0003           ]x../|..... ...

c0dee41b <C_Warning_40px>:
c0dee41b:	0028 0028 0102 e32c c0de 7544 6d6d 2079     (.(...,...Dummy 
c0dee42b:	0032 6552 6976 7765 7420 6172 736e 6361     2.Review transac
c0dee43b:	6974 6e6f 740a 206f 6573 646e 4220 4c4f     tion.to send BOL
c0dee44b:	4f00 6570 6172 6974 6e6f 7320 6769 656e     .Operation signe
c0dee45b:	0064 6441 7264 7365 2073 6576 6972 6966     d.Address verifi
c0dee46b:	6163 6974 6e6f 630a 6e61 6563 6c6c 6465     cation.cancelled
c0dee47b:	5400 6172 736e 6361 6974 6e6f 4320 6568     .Transaction Che
c0dee48b:	6b63 7520 616e 6176 6c69 6261 656c 4100     ck unavailable.A
c0dee49b:	7070 6f72 6576 5000 6f72 6563 7373 6e69     pprove.Processin
c0dee4ab:	0067 6c42 6e69 2d64 6973 6e67 3000 302e     g.Blind-sign.0.0
c0dee4bb:	312e 4800 6c6f 2064 6f74 7320 6769 006e     .1.Hold to sign.
c0dee4cb:	704f 7265 7461 6f69 206e 6572 656a 7463     Operation reject
c0dee4db:	6465 5200 6a65 6365 0074 6552 656a 7463     ed.Reject.Reject
c0dee4eb:	7420 6172 736e 6361 6974 6e6f 003f 7243      transaction?.Cr
c0dee4fb:	7469 6369 6c61 7420 7268 6165 2074 6564     itical threat de
c0dee50b:	6574 7463 6465 0a2e 6c42 6e69 2064 6973     tected..Blind si
c0dee51b:	6e67 6e69 2067 6572 7571 7269 6465 002e     gning required..
c0dee52b:	6e55 6469 6e65 6974 6966 6465 7220 7369     Unidentified ris
c0dee53b:	006b 6853 776f 6120 2073 5251 4100 6f6d     k.Show as QR.Amo
c0dee54b:	6e75 0074 6f47 6220 6361 206b 6f74 6f20     unt.Go back to o
c0dee55b:	6570 6172 6974 6e6f 5400 6172 736e 6361     peration.Transac
c0dee56b:	6974 6e6f 4320 6568 6b63 7520 616e 6176     tion Check unava
c0dee57b:	6c69 6261 656c 0a2e 6c42 6e69 2064 6973     ilable..Blind si
c0dee58b:	6e67 6e69 2067 6572 7571 7269 6465 002e     gning required..
c0dee59b:	6441 7264 7365 2073 6576 6972 6966 6465     Address verified
c0dee5ab:	5300 6977 6570 7420 206f 6f63 746e 6e69     .Swipe to contin
c0dee5bb:	6575 2500 2073 7325 250a 0073 7468 7074     ue.%s %s.%s.http
c0dee5cb:	3a73 2f2f 7325 4100 6572 7920 756f 7320     s://%s.Are you s
c0dee5db:	7275 2065 6f74 610a 6c6c 776f 6420 6d75     ure to.allow dum
c0dee5eb:	796d 3220 690a 206e 7274 6e61 6173 7463     my 2.in transact
c0dee5fb:	6f69 736e 003f 7254 6e61 6173 7463 6f69     ions?.Transactio
c0dee60b:	206e 6973 6e67 6465 4500 534e 6e20 6d61     n signed.ENS nam
c0dee61b:	7365 6120 6572 7220 7365 6c6f 6576 2064     es are resolved 
c0dee62b:	7962 4c20 6465 6567 2072 6162 6b63 6e65     by Ledger backen
c0dee63b:	2e64 5300 6365 7275 7469 2079 6572 6f70     d..Security repo
c0dee64b:	7472 4400 7665 6c65 706f 7265 2500 0a73     rt.Developer.%s.
c0dee65b:	7325 2520 0073 6c41 6f6c 2077 7564 6d6d     %s %s.Allow dumm
c0dee66b:	2079 0a31 6e69 7420 6172 736e 6361 6974     y 1.in transacti
c0dee67b:	6e6f 0073 6953 6e67 7420 6172 736e 6361     ons.Sign transac
c0dee68b:	6974 6e6f 740a 206f 6573 646e 4220 4c4f     tion.to send BOL
c0dee69b:	5900 7365 202c 6b73 7069 2500 2073 6572     .Yes, skip.%s re
c0dee6ab:	6f70 7472 4700 206f 6162 6b63 7420 206f     port.Go back to 
c0dee6bb:	7274 6e61 6173 7463 6f69 006e 6953 6e67     transaction.Sign
c0dee6cb:	6d20 7365 6173 6567 4200 6361 206b 6f74      message.Back to
c0dee6db:	7320 6661 7465 0079 654d 7373 6761 2065      safety.Message 
c0dee6eb:	6973 6e67 6465 4300 6f6c 6573 5300 6769     signed.Close.Sig
c0dee6fb:	206e 7274 6e61 6173 7463 6f69 006e 654c     n transaction.Le
c0dee70b:	6764 7265 5300 6163 206e 6f74 7620 6569     dger.Scan to vie
c0dee71b:	2077 7566 6c6c 7220 7065 726f 0074 6854     w full report.Th
c0dee72b:	7369 7420 6172 736e 6361 6974 6e6f 6f20     is transaction o
c0dee73b:	2072 656d 7373 6761 2065 6163 6e6e 746f     r message cannot
c0dee74b:	6220 2065 6564 6f63 6564 2064 7566 6c6c      be decoded full
c0dee75b:	2e79 4920 2066 6f79 2075 6863 6f6f 6573     y. If you choose
c0dee76b:	7420 206f 6973 6e67 202c 6f79 2075 6f63      to sign, you co
c0dee77b:	6c75 2064 6562 6120 7475 6f68 6972 697a     uld be authorizi
c0dee78b:	676e 6d20 6c61 6369 6f69 7375 6120 7463     ng malicious act
c0dee79b:	6f69 736e 7420 6168 2074 6163 206e 7264     ions that can dr
c0dee7ab:	6961 206e 6f79 7275 7720 6c61 656c 2e74     ain your wallet.
c0dee7bb:	0a0a 654c 7261 206e 6f6d 6572 203a 656c     ..Learn more: le
c0dee7cb:	6764 7265 632e 6d6f 652f 0038 6341 6563     dger.com/e8.Acce
c0dee7db:	7470 7420 7268 6165 2074 6e61 2064 6f63     pt threat and co
c0dee7eb:	746e 6e69 6575 4100 6c6c 776f 6420 6d75     ntinue.Allow dum
c0dee7fb:	796d 3220 690a 206e 7274 6e61 6173 7463     my 2.in transact
c0dee80b:	6f69 736e 5600 7265 6973 6e6f 4d00 726f     ions.Version.Mor
c0dee81b:	0065 6854 7369 7420 6172 736e 6361 6974     e.This transacti
c0dee82b:	6e6f 6320 6e61 6f6e 2074 6562 4320 656c     on cannot be Cle
c0dee83b:	7261 5320 6769 656e 0064 6559 2c73 7220     ar Signed.Yes, r
c0dee84b:	6a65 6365 0074 6143 636e 6c65 5400 6968     eject.Cancel.Thi
c0dee85b:	2073 7274 6e61 6173 7463 6f69 206e 6177     s transaction wa
c0dee86b:	2073 6373 6e61 656e 2064 7361 6d20 6c61     s scanned as mal
c0dee87b:	6369 6f69 7375 6220 2079 6557 3362 4320     icious by Web3 C
c0dee88b:	6568 6b63 2e73 2500 2064 666f 2520 0064     hecks..%d of %d.
c0dee89b:	6b53 7069 7220 7665 6569 3f77 4200 696c     Skip review?.Bli
c0dee8ab:	646e 7320 6769 696e 676e 7220 7165 6975     nd signing requi
c0dee8bb:	6572 0064 755b 6b6e 6f6e 6e77 005d 6952     red.[unknown].Ri
c0dee8cb:	6b73 6420 7465 6365 6574 0064 6c42 6e69     sk detected.Blin
c0dee8db:	2064 6973 6e67 6e69 2067 6572 7571 7269     d signing requir
c0dee8eb:	6465 002e 6e55 6469 6e65 6974 6966 6465     ed..Unidentified
c0dee8fb:	7420 7268 6165 0074 6854 7369 6120 6363      threat.This acc
c0dee90b:	756f 746e 6c20 6261 6c65 6320 6d6f 7365     ount label comes
c0dee91b:	6620 6f72 206d 6f79 7275 4120 6464 6572      from your Addre
c0dee92b:	7373 4220 6f6f 206b 6e69 4c20 6465 6567     ss Book in Ledge
c0dee93b:	2072 694c 6576 002e 7243 7469 6369 6c61     r Live..Critical
c0dee94b:	7420 7268 6165 0074 6341 6563 7470 7220      threat.Accept r
c0dee95b:	7369 206b 6e61 2064 6f63 746e 6e69 6575     isk and continue
c0dee96b:	5400 6968 2073 7274 6e61 6173 7463 6f69     .This transactio
c0dee97b:	276e 2073 6564 6174 6c69 2073 7261 2065     n's details are 
c0dee98b:	6f6e 2074 7566 6c6c 2079 6576 6972 6966     not fully verifi
c0dee99b:	6261 656c 202e 6649 7920 756f 7320 6769     able. If you sig
c0dee9ab:	2c6e 7920 756f 6320 756f 646c 6c20 736f     n, you could los
c0dee9bb:	2065 6c61 206c 6f79 7275 6120 7373 7465     e all your asset
c0dee9cb:	2e73 4700 206f 6162 6b63 7420 206f 656d     s..Go back to me
c0dee9db:	7373 6761 0065 6f50 6574 746e 6169 206c     ssage.Potential 
c0dee9eb:	6972 6b73 6420 7465 6365 6574 2e64 420a     risk detected..B
c0dee9fb:	696c 646e 7320 6769 696e 676e 7220 7165     lind signing req
c0deea0b:	6975 6572 2e64 4d00 444c 4153 4e00 206f     uired..MLDSA.No 
c0deea1b:	6874 6572 7461 6420 7465 6365 6574 2064     threat detected 
c0deea2b:	7962 5420 6172 736e 6361 6974 6e6f 4320     by Transaction C
c0deea3b:	6568 6b63 002e 6c42 6e69 2064 6973 6e67     heck..Blind sign
c0deea4b:	6e69 2067 6861 6165 0064 654d 7373 6761     ing ahead.Messag
c0deea5b:	2065 6572 656a 7463 6465 5200 6a65 6365     e rejected.Rejec
c0deea6b:	2074 706f 7265 7461 6f69 3f6e 3000 3231     t operation?.012
c0deea7b:	3433 3635 3837 4139 4342 4544 0046 656e     3456789ABCDEF.ne
c0deea8b:	7774 726f 2e6b 4200 4c4f 2520 2a2e 0073     twork..BOL %.*s.
c0deea9b:	6441 7264 7365 0073 6649 7920 756f 7227     Address.If you'r
c0deeaab:	2065 7573 6572 7920 756f 6420 6e6f 7427     e sure you don't
c0deeabb:	6e20 6565 2064 6f74 7220 7665 6569 2077      need to review 
c0deeacb:	6c61 206c 6966 6c65 7364 202c 6f79 2075     all fields, you 
c0deeadb:	6163 206e 6b73 7069 7320 7274 6961 6867     can skip straigh
c0deeaeb:	2074 6f74 7320 6769 696e 676e 002e 6649     t to signing..If
c0deeafb:	7920 756f 7227 2065 6f6e 2074 7375 6e69      you're not usin
c0deeb0b:	2067 6874 0a65 654c 6764 7265 4c20 7669     g the.Ledger Liv
c0deeb1b:	2065 7061 2c70 5420 6172 736e 6361 6974     e app, Transacti
c0deeb2b:	6e6f 4320 6568 6b63 6d20 6769 7468 6e20     on Check might n
c0deeb3b:	746f 7720 726f 2e6b 4920 2066 6f79 2075     ot work. If you 
c0deeb4b:	7261 2065 7375 6e69 2067 654c 6764 7265     are using Ledger
c0deeb5b:	4c20 7669 2c65 7220 6a65 6365 2074 6874      Live, reject th
c0deeb6b:	2065 7274 6e61 6173 7463 6f69 206e 6e61     e transaction an
c0deeb7b:	2064 7274 2079 6761 6961 2e6e 0a0a 6547     d try again...Ge
c0deeb8b:	2074 6568 706c 6120 2074 656c 6764 7265     t help at ledger
c0deeb9b:	632e 6d6f 652f 3131 5400 6968 2073 7274     .com/e11.This tr
c0deebab:	6e61 6173 7463 6f69 206e 6177 2073 6373     ansaction was sc
c0deebbb:	6e61 656e 2064 7361 7220 7369 796b 6220     anned as risky b
c0deebcb:	2079 6557 3362 4320 6568 6b63 2e73 4400     y Web3 Checks..D
c0deebdb:	6d75 796d 3120 4900 7520 646e 7265 7473     ummy 1.I underst
c0deebeb:	6e61 2c64 6320 6e6f 6966 6d72 4e00 206f     and, confirm.No 
c0deebfb:	6874 6572 7461 6420 7465 6365 6574 0064     threat detected.
c0deec0b:	7254 6e61 6173 7463 6f69 206e 6572 656a     Transaction reje
c0deec1b:	7463 6465 4700 206f 6162 6b63 7420 206f     cted.Go back to 
c0deec2b:	6572 6976 7765 4300 6972 6974 6163 206c     review.Critical 
c0deec3b:	6874 6572 7461 6420 7465 6365 6574 2e64     threat detected.
c0deec4b:	5300 6769 206e 706f 7265 7461 6f69 006e     .Sign operation.
c0deec5b:	6544 6574 7463 6465 6220 2079 7325 0000     Detected by %s..
c0deec6b:	6b53 7069 5000 746f 6e65 6974 6c61 7220     Skip.Potential r
c0deec7b:	7369 206b 6564 6574 7463 6465 002e 6f4e     isk detected..No
c0deec8b:	7420 7268 6165 2074 6564 6574 7463 6465      threat detected
c0deec9b:	6220 2079 7254 6e61 6173 7463 6f69 206e      by Transaction 
c0deecab:	6843 6365 206b 7562 2074 6c62 6e69 2064     Check but blind 
c0deecbb:	6973 6e67 6e69 2067 6572 7571 7269 6465     signing required
c0deeccb:	002e 6f50 6574 746e 6169 206c 6972 6b73     ..Potential risk
c0deecdb:	5600 7265 6669 2079 4f42 204c 6461 7264     .Verify BOL addr
c0deeceb:	7365 0073 6f43 746e 6e69 6575 6120 796e     ess.Continue any
c0deecfb:	6177 0079 7551 7469 6120 7070 5300 6977     way.Quit app.Swi
c0deed0b:	6570 7420 206f 6572 6976 7765 5400 6968     pe to review.Thi
c0deed1b:	2073 7061 2070 6e65 6261 656c 2073 6973     s app enables si
c0deed2b:	6e67 6e69 0a67 7274 6e61 6173 7463 6f69     gning.transactio
c0deed3b:	736e 6f20 206e 6874 0065 7254 6e61 6173     ns on the.Transa
c0deed4b:	7463 6f69 206e 6843 6365 206b 6964 6e64     ction Check didn
c0deed5b:	7427 6620 6e69 2064 6e61 2079 6874 6572     't find any thre
c0deed6b:	7461 202c 7562 2074 6c61 6177 7379 7220     at, but always r
c0deed7b:	7665 6569 2077 7274 6e61 6173 7463 6f69     eview transactio
c0deed8b:	206e 6564 6174 6c69 2073 6163 6572 7566     n details carefu
c0deed9b:	6c6c 2e79 4300 6e6f 6966 6d72 5200 6a65     lly..Confirm.Rej
c0deedab:	6365 2074 656d 7373 6761 3f65 7300 a7ed     ect message?.s..
c0deedbb:	2953 7d9d 3348 d839 0908 d8a1 5305 a4bd     S).}H39......S..
c0deedcb:	ff02 5bfe fffe ffff 00ff 0000 0501 98ce     ...[............
c0deeddb:	1bc6 f405 e27f e9ea 42a5 99bd b2f6 82e7     .........B......
c0deedeb:	2346 4016 45b5 fe95 d5bf b81e 1c53 eec6     F#.@.E......S...
c0deedfb:	1338 1c9c 0211 5323 8c7a 9de7 7e06 cc58     8.....#Sz....~X.
c0deee0b:	6710 fbc6 d8b7 a1b3 8db0 8ffc 2708 bc4d     .g...........'M.
c0deee1b:	d1e8 7951 9b96 d4c0 a79f bd25 9ddf 55e5     ..Qy......%....U
c0deee2b:	bae0 696a 6a3c 52db 9efc a8e7 1c2c 69fb     ..ji<j.R....,..i
c0deee3b:	cad4 5f67 0c52 76ce 0202 7668 ff00 878f     ..g_R..v..hv....
c0deee4b:	7400 0419 7471 06fd 28b5 e776 06e1 890c     .t..qt...(v.....
c0deee5b:	5cce 3426 3705 080a d0b6 2b30 ab0b ed3e     .\&4.7....0+..>.
c0deee6b:	39b8 ee20 670a 9772 39dc 2621 70f1 89a5     .9 ..gr..9!&.p..
c0deee7b:	644a 5444 d038 ac15 ba32 0f36 2c09 44de     JdDT8...2.6..,.D
c0deee8b:	b1ba c21f d4b7 c0b5 16d2 8c22 a3ce c03b     .........."...;.
c0deee9b:	a0a7 138c d4c0 17c1 dd4d 6a88 4cac 6656     ........M..j.LVf
c0deeeab:	f4e1 1f83 6c00 1995 6bd3 e82c 0082 0000     .....l...k,.....
	...
c0deeed3:	0000 9202 63fc c189 3326 67c2 c6cb 3b6e     .....c..&3.g..n;
c0deeee3:	6bf8 b6e3 cbd8 6766 7771 4fe5 b392 f269     .k....fgqw.O..i.
c0deeef3:	18f5 588d 73e7 a7ed 2953 7d9d 3348 d839     ...X.s..S).}H39.
c0deef03:	0908 d8a1 5305 a4bd ff02 5bfe fffe ffff     .....S.....[....
c0deef13:	fffe ffff 00fc 0000 0000 0000 0000 0000     ................
	...
c0deef33:	0000 9202 30f8 4e64 e172 a031 b829 4550     .....0dNr.1.).PE
c0deef43:	81b6 5881 285d e833 7948 70b9 4391 f5e1     ...X](3.Hy.p.C..
c0deef53:	f093 0000                                    .....

c0deef58 <handler_cmd_verify_dilithium.sig>:
c0deef58:	7c23 887b 7320 2c3d 53f3 f845 51a8 6099     #|{. s=,.SE..Q.`
c0deef68:	6761 7055 42ce 3e92 cde2 7e43 b441 b3a9     agUp.B.>..C~A...
c0deef78:	4891 711f e9ec b6e0 584c 734a 0d71 688d     .H.q....LXJsq..h
c0deef88:	938a c00a 02bf f5ab 6e7c 0947 24e7 e4a9     ........|nG..$..
c0deef98:	8c17 9062 bc18 730b 7ab3 7d08 e7d3 8dea     ..b....s.z.}....
c0deefa8:	5ba6 4511 febc 1aed 127c 6023 af7e ef0a     .[.E....|.#`~...
c0deefb8:	ab04 602b 74d4 9460 625c 4f1a 5693 0b13     ..+`.t`.\b.O.V..
c0deefc8:	5ecb f094 710c 1c0d 99fe 5ec0 cfa0 079e     .^...q.....^....
c0deefd8:	5779 367f 5671 1603 24bf 9cec 57f2 132b     yW.6qV...$...W+.
c0deefe8:	a5e9 5f0d cabc dc4d 81e4 40f7 1ddb 207e     ..._..M....@..~ 
c0deeff8:	6802 9645 d629 b56e b5a0 3a60 46d6 4a8a     .hE.).n...`:.F.J
c0def008:	4904 848d 62df 39ee 6f4d a3c5 b1a7 9def     .I...b.9Mo......
c0def018:	cee0 88be 8e16 6f5d 1e77 1efc 15a3 8be7     ......]ow.......
c0def028:	cb83 0e2c 8ff8 7e16 70e1 fddf 9adb a5ca     ..,....~.p......
c0def038:	38df f10a 03f8 7453 6a6b 3055 fdc9 45e8     .8....StkjU0...E
c0def048:	ec8e b499 dc78 67c6 3632 77b2 1cc4 9ede     ....x..g26.w....
c0def058:	58ba 986b 1408 cf6c 6fae bed8 d0a1 4f65     .Xk...l..o....eO
c0def068:	ca65 58c7 b73a 0705 b111 22a3 dad8 6a6c     e..X:......"..lj
c0def078:	16ad 8a60 5390 55a6 0d58 0166 c96f face     ..`..S.UX.f.o...
c0def088:	7fa1 fee0 08d5 bd0d aa4d 9296 67f9 2494     ........M....g.$
c0def098:	283a 6713 d57a e142 64e1 a9ef 1b34 fdd0     :(.gz.B..d..4...
c0def0a8:	95ba 1b6a 594b 1a4f fb70 143c d1ae 7b21     ..j.KYO.p.<...!{
c0def0b8:	1d86 74cb 569a 81b2 5d20 f57d 72d4 8fa0     ...t.V.. ]}..r..
c0def0c8:	76b3 5595 dd24 01a1 cc7b e88b 6857 1d19     .v.U$...{...Wh..
c0def0d8:	180e 0f57 f2a8 bd63 2a59 538d cf58 6a7f     ..W...c.Y*.SX..j
c0def0e8:	8ec2 660c 7647 f5ac 681b f29c 66e9 cb03     ...fGv...h...f..
c0def0f8:	e17d 7849 56cc 08f0 a219 b517 5eae 083c     }.Ix.V.......^<.
c0def108:	483c 5a7f c023 3979 7c73 d69e a5b2 041e     <H.Z#.y9s|......
c0def118:	9df3 69dc 56da 889b 4f05 47c6 0969 5680     ...i.V...O.Gi..V
c0def128:	35d8 7539 0c9d 87c4 11a7 5b12 3df7 f6e1     .59u.......[.=..
c0def138:	1667 f595 3663 5345 6c4e d3b2 6474 3c5c     g...c6ESNl..td\<
c0def148:	d39f 539c c447 2fb8 a4b1 fb52 13b6 3c7f     ...SG../..R....<
c0def158:	0e47 fcb1 4072 c2a5 81a2 dda1 6745 0708     G...r@......Eg..
c0def168:	2b55 0dcc 0a16 7567 dfb6 bceb 5068 b70e     U+....gu....hP..
c0def178:	1e6e db96 a01c 14f3 c913 876f 4a35 07b7     n.........o.5J..
c0def188:	771c c986 7de6 640d 2876 d62b af76 fe23     .w...}.dv(+.v.#.
c0def198:	71eb b727 4d86 a7ac 992f 854a 10bd f6f1     .q'..M../.J.....
c0def1a8:	a16e 0824 f982 28b6 f195 0a9c d1aa 35cf     n.$....(.......5
c0def1b8:	a8cd 311b 9319 4d19 7397 d937 07a1 a728     ...1...M.s7...(.
c0def1c8:	d8f3 8d2c e37f d75c 7d04 3c23 fe8e 9b1d     ..,...\..}#<....
c0def1d8:	b266 8c82 589b c22d 60e4 8356 e6ac 76be     f....X-..`V....v
c0def1e8:	35ba 6d1b 1d7a 3ab2 8581 174d 60e9 7d1e     .5.mz..:..M..`.}
c0def1f8:	9bc6 aeea 2664 30ef 0073 8d50 4b20 3043     ....d&.0s.P. KC0
c0def208:	e026 4d53 f0d0 3b12 2506 2425 9f76 862f     &.SM...;.%%$v./.
c0def218:	1c77 f58c 82ee b3f0 01b3 2808 00a3 8857     w..........(..W.
c0def228:	af71 609b f331 4243 2dcb a45e 3c09 b650     q..`1.CB.-^..<P.
c0def238:	b121 4802 a3d0 1c2c 68d5 a54c 5f0b 8698     !..H..,..hL.._..
c0def248:	dfe2 ec6d 21a3 d53b 79cd 3bd6 c85d 6b26     ..m..!;..y.;].&k
c0def258:	4deb be80 d8ee 9e2c 01e8 35ed a9c6 99f6     .M....,....5....
c0def268:	e847 e706 1791 5b3b 3e88 1920 7325 5ee8     G.....;[.> .%s.^
c0def278:	0370 9cf9 b45a e717 032f 3e56 3bb9 3f16     p...Z.../.V>.;.?
c0def288:	234c 6700 8c5e b91a 0cf8 2cf6 b188 6f87     L#.g^......,...o
c0def298:	bdd0 5842 e0e0 da83 2e71 1f34 cebb 37ef     ..BX....q.4....7
c0def2a8:	9ed5 0f09 ca6e b30c e6e8 feb7 7f1c c335     ....n.........5.
c0def2b8:	dba9 8c95 73d2 c5fc b281 e385 3c0e 7135     .....s.......<5q
c0def2c8:	014f edd2 06a3 e6a6 966d d409 88ae 8b24     O.......m.....$.
c0def2d8:	6af7 1a99 8bcb 3283 aa55 cbaf 4927 008d     .j.....2U...'I..
c0def2e8:	ff9e a50a 4e26 7418 7eb1 46b6 cedf 0747     ....&N.t.~.F..G.
c0def2f8:	bfe8 46b9 bfba f7a4 feaf 8c38 5606 dcb9     ...F......8..V..
c0def308:	8b4a 67bc 640e 26d4 db76 3c5b 17d0 6dce     J..g.d.&v.[<...m
c0def318:	e252 7d54 7443 665e 9bed a21c 8522 5494     R.T}Ct^f...."..T
c0def328:	4c6b 632c 526f de4e 5dc6 de9a a960 3bfd     kL,coRN..]..`..;
c0def338:	8625 16af da9a 5764 854d 4c59 acba 385f     %.....dWM.YL.._8
c0def348:	d327 31c4 517e 2c72 7f49 dc09 4baa 4f7c     '..1~Qr,I....K|O
c0def358:	bd03 ef4f a83b d347 258d cc2f d7ec 07e2     ..O.;.G..%/.....
c0def368:	0f83 d6e4 3307 95b4 b527 9ed2 d271 36b7     .....3..'...q..6
c0def378:	7da9 349d 5f47 81b0 bcd0 1088 7f50 2a67     .}.4G_......P.g*
c0def388:	32e0 bc32 a332 713c 3f1a 8212 e16f 1f80     .22.2.<q.?..o...
c0def398:	9640 6120 d3e3 ebfd 6833 1ee9 89ab da2c     @. a....3h....,.
c0def3a8:	8fc1 060e 31a4 672e 45f4 8d57 afbe f554     .....1.g.EW...T.
c0def3b8:	cbc3 aedb b20a 84dd 5a52 2532 373b d820     ........RZ2%;7 .
c0def3c8:	9b3c 503e f0ec 4c55 d189 d35b b052 6b63     <.>P..UL..[.R.ck
c0def3d8:	b740 389d 5cfc 5eca 6c69 f01f 2fcd 3409     @..8.\.^il.../.4
c0def3e8:	3efb dcaa 1bcc 5f6d 55ac b644 5cfe 0a6e     .>....m_.UD..\n.
c0def3f8:	7c31 cf4f 2bff 701f 8b71 4e7e f37c 3bdb     1|O..+.pq.~N|..;
c0def408:	c0f1 0302 f51e 040c df9b 3bfc 3578 0b8e     ...........;x5..
c0def418:	0ee2 7eb5 1bd4 04ae d0cd 9190 efaf 57a4     ...~...........W
c0def428:	aea8 33bb 3776 e00e 7f4a d448 b744 17f1     ...3v7..J.H.D...
c0def438:	da0e 8eb6 970b 8f0e 85c2 7609 6c53 bbe3     ...........vSl..
c0def448:	5814 f06a ae6b 17ac 7812 e9a5 e049 f70a     .Xj.k....x..I...
c0def458:	b0cd b8d4 2441 cc4c 79cc f37f 41fd 0787     ....A$L..y...A..
c0def468:	4c7d 339d 3c87 0bab e6f6 5990 901b f821     }L.3.<.....Y..!.
c0def478:	520c 74d4 0594 c11a 75ff 4b55 196b 9007     .R.t.....uUKk...
c0def488:	c53d ec30 426b 25d0 23f7 d4d7 39e5 2e22     =.0.kB.%.#...9".
c0def498:	3e68 5347 4125 5ff2 b014 07c0 93b0 ccb7     h>GS%A._........
c0def4a8:	c0bf 2e17 e578 5143 637f 4921 42d8 1a82     ....x.CQ.c!I.B..
c0def4b8:	412b 0d4d aab9 39c1 5e8b c299 ef69 304e     +AM....9.^..i.N0
c0def4c8:	133e f973 dfbc 1182 5cb5 ec65 f919 043a     >.s......\e...:.
c0def4d8:	a722 8c14 d4ab 11c3 1af1 ef49 57c7 4d53     ".........I..WSM
c0def4e8:	ca00 c8e3 b84c e949 1975 4531 8953 f817     ....L.I.u.1ES...
c0def4f8:	2512 96cc 7b45 a2c1 8fab 2aa7 85fa dc63     .%..E{.....*..c.
c0def508:	4731 ff66 9ad1 db10 da92 9abf 5606 6706     1Gf..........V.g
c0def518:	d328 f584 2298 a99f 904e 8a6b 2232 dfb0     (...."..N.k.2"..
c0def528:	64e1 d9af 16c1 1cf3 5e31 3fe5 0bfb 580d     .d......1^.?...X
c0def538:	e02e faab 59d2 b4f1 5c09 a300 6747 d43f     .....Y...\..Gg?.
c0def548:	7ee1 d8a7 74f9 f2db 90ed 1c31 67b1 1ad6     .~...t....1..g..
c0def558:	eaeb 0b7b a317 5b4f 1f72 afec bccf ea3f     ..{...O[r.....?.
c0def568:	09c7 811b 1f85 5b8a 1a05 8edd 4a72 3350     .......[....rJP3
c0def578:	a586 703b 06d1 6ad8 8199 573d f79e 065a     ..;p...j..=W..Z.
c0def588:	f75c c10c 9dab c380 019a c5d3 6094 ef49     \............`I.
c0def598:	8ded 384e 5c3b 58a6 a927 e0ce ba8c 2a79     ..N8;\.X'.....y*
c0def5a8:	3390 f747 7a54 7464 8e5f d717 0d1a d740     .3G.Tzdt_.....@.
c0def5b8:	151d 4b48 689a c814 3062 05aa 9e53 7c90     ..HK.h..b0..S..|
c0def5c8:	dadd fb5e 6231 56c3 58f3 bc29 a232 c88b     ..^.1b.V.X).2...
c0def5d8:	c90e 4e45 fe5b 4ac2 d76d 7546 b9e3 6413     ..EN[..Jm.Fu...d
c0def5e8:	3d7f 6a17 7367 a0c1 0ee4 17dd d1ec ee3a     .=.jgs........:.
c0def5f8:	9334 0b71 5411 55f8 59f2 621e 70cc c673     4.q..T.U.Y.b.ps.
c0def608:	bb08 77aa 4e10 498d b693 f87c 651f 89af     ...w.N.I..|..e..
c0def618:	c9c8 691d 755f da60 8aa6 41d1 cb60 f47d     ...i_u`....A`.}.
c0def628:	a6e7 181b 2560 2053 b8db 6713 f16d 5c28     ....`%S ...gm.(\
c0def638:	5a01 99ec 7b4d cec0 7529 1614 1eb3 5bd1     .Z..M{..)u.....[
c0def648:	1769 6829 aadd 5651 b892 bcfe 4ecb 9832     i.)h..QV.....N2.
c0def658:	bfe8 9c16 b920 9065 803b 6ff2 a620 bda3     .... .e.;..o ...
c0def668:	ac5f bcd1 c638 17c8 3be2 51f3 ff87 f975     _...8....;.Q..u.
c0def678:	ae82 d69e 435a 19f6 619b 84ae 3e68 ef1b     ....ZC...a..h>..
c0def688:	9ccf 7801 eab8 9028 6af9 086e 3dd3 c344     ...x..(..jn..=D.
c0def698:	50ce ccd9 1cbd 96df 6bdf 5e2f 1c8f b06c     .P.......k/^..l.
c0def6a8:	0043 f6f7 83d4 8310 ae90 eda8 b031 327b     C...........1.{2
c0def6b8:	7cc8 2a54 75b4 6d94 5e52 c124 2d6b fb0a     .|T*.u.mR^$.k-..
c0def6c8:	6886 477e e7cc b5ab fcb7 d641 95a9 593a     .h~G......A...:Y
c0def6d8:	b2a8 d021 b757 8493 fa5c 14b4 6b72 5337     ..!.W...\...rk7S
c0def6e8:	7cd8 0202 fb53 7293 6322 eece a693 cf6a     .|..S..r"c....j.
c0def6f8:	3c16 eb86 d67b 3621 0ef7 14c4 56b5 6228     .<..{.!6.....V(b
c0def708:	20f1 ee2d feb9 79af 4181 e26b 9ca0 7c0e     . -....y.Ak....|
c0def718:	181f 95ee 4b31 d054 7b49 29ac d986 9e0e     ....1KT.I{.)....
c0def728:	99d3 2002 6ae9 62e1 112e eef2 c191 61b1     ... .j.b.......a
c0def738:	e728 4a38 fa87 67bc c731 b0b0 b70b fd07     (.8J...g1.......
c0def748:	be1a 9203 5ec9 434c 6054 7db4 9921 9b82     .....^LCT`.}!...
c0def758:	6b07 f64e 1ab1 28d3 ca25 57d8 a694 ee74     .kN....(%..W..t.
c0def768:	d6fd 3d17 39ca bfdc 7c39 951b 3831 720a     ...=.9..9|..18.r
c0def778:	42d1 d4b7 5d00 4f88 d5cb 1192 7882 fc20     .B...].O.....x .
c0def788:	2b5b 05c6 c7e5 c317 121e d14c 71f5 d480     [+........L..q..
c0def798:	59ba 3388 97f0 6f05 9b80 2171 be4f 5fe2     .Y.3...o..q!O.._
c0def7a8:	e77f 4ef1 f83d 6bcb 6cbf 3d3f 28e8 f785     ...N=..k.l?=.(..
c0def7b8:	fd1b 4e87 7a6b 1dd1 21b7 d70f 0c3c aacb     ...Nkz...!..<...
c0def7c8:	f060 a808 596a 86a9 0c0c 1685 da72 b017     `...jY......r...
c0def7d8:	d377 7759 2cc5 5bf3 6df0 0f45 c03e 9761     w.Yw.,.[.mE.>.a.
c0def7e8:	627f 2473 5ac5 a3ad c661 b3ab 77de 28e8     .bs$.Z..a....w.(
c0def7f8:	3aa6 6def 7cc3 0cdf 3baf c398 09a4 cde3     .:.m.|...;......
c0def808:	d2bd d0ed 4fdc 1aeb de6e f78d 2c25 58b6     .....O..n...%,.X
c0def818:	3f41 7222 4281 4d30 027d 6eb0 8b43 8110     A?"r.B0M}..nC...
c0def828:	774f a431 e789 6b9b 6b8a ca0f 636b 9afe     Ow1....k.k..kc..
c0def838:	ff61 9429 4b70 f9df e118 6aae df99 d307     a.).pK.....j....
c0def848:	8ae1 6821 4690 9753 edb6 f4a5 d27a 16f2     ..!h.FS.....z...
c0def858:	7581 b844 0c84 f16a 4d70 719a 2ca0 b673     .uD...j.pM.q.,s.
c0def868:	9fa2 fbb6 7817 977d 98a8 9047 47a3 0536     .....x}...G..G6.
c0def878:	0706 3d09 553f 9b7d afa5 ceb8 d4d3 e1de     ...=?U}.........
c0def888:	eee8 f8f1 01fc 4717 554f 968c b4b2 d6c2     .......GOU......
c0def898:	f8d9 9143 aa98 cac0 d3d2 edea 1a0d 3d24     ..C...........$=
c0def8a8:	4544 8664 dccf e6e4 00f1 0000 0000 0000     DEd.............
	...
c0def8c8:	2215 392c 1cd8 8d4d 4f73 fbcb deea 3f3d     .",9..M.sO....=?
c0def8d8:	038a aa9f 2c2a 5799 35e8 55ad 2eb2 bf75     ....*,.W.5.U..u.
c0def8e8:	bb57 6a55                                    W.Uj.

c0def8ed <handler_cmd_verify_dilithium.pk>:
c0def8ed:	7bdc a2c9 b6e0 66dc 3a82 fbe4 97de 0c1c     .{.....f.:......
c0def8fd:	46fc d9f9 bf6b ebbe 47b3 e00a a0a5 9f13     .F..k....G......
c0def90d:	6add e56c 76bc 4fe9 9eaa 5092 d4ab e0ce     .jl..v.O...P....
c0def91d:	f12c 46ee e9a8 e19c 732d 7895 a71f 9051     ,..F....-s.x..Q.
c0def92d:	2721 a33d 5536 7219 fb4e 79e2 d6ad 5fc3     !'=.6U.rN..y..._
c0def93d:	c992 2bd4 2803 f132 29bf beeb 3ecd 7ac8     ...+.(2..)...>.z
c0def94d:	f33a 33da 11c6 f3f7 a35f ca5a 74b1 4f02     :..3...._.Z..t.O
c0def95d:	8911 e279 f23b 06fe 6992 eca2 fb45 b9c1     ..y.;....i..E...
c0def96d:	fbc1 1f0e 4805 6a6a 3e83 8ab4 29dc 6460     .....Hjj.>...)`d
c0def97d:	9a1d ebf6 738b b181 55ec 89d8 6bf2 4d08     .....s...U...k.M
c0def98d:	a1df edc9 969b 342d 9426 dece 8283 0953     ......-4&.....S.
c0def99d:	dbd9 d66b 75ba 1382 3425 1e86 a044 8843     ..k..u..%4..D.C.
c0def9ad:	94a6 2424 7611 341d c0e7 d285 b782 c623     ..$$.v.4......#.
c0def9bd:	4859 aca2 4d76 0297 8ebd fed7 3199 d8d7     YH..vM.......1..
c0def9cd:	4a70 e639 8850 f344 48f8 c343 5905 e64f     pJ9.P.D..HC..YO.
c0def9dd:	40e5 084e 8ef1 39d0 65ac cb63 34aa cab0     .@N....9.ec..4..
c0def9ed:	3238 9902 25d6 c06e 8df7 1f42 8108 d459     82...%n...B...Y.
c0def9fd:	c49d cb39 39c5 58a5 a384 4eeb 9cfc 90f1     ..9..9.X...N....
c0defa0d:	2fb4 3471 cb41 0097 4542 14d4 a337 7b9b     ./q4A...BE..7..{
c0defa1d:	fc77 2f60 fdbb 9a61 3642 1437 65b2 3c17     w.`/..a.B67..e.<
c0defa2d:	68ae 8afd 3c1b bda2 ae30 c560 563e 5704     .h...<..0.`.>V.W
c0defa3d:	4a7a 1f3b 0615 97e6 74c3 db32 83d8 3a55     zJ;......t2...U:
c0defa4d:	8dac 2a38 253d f50c 9eb2 1b4d cbe2 53cd     ..8*=%....M....S
c0defa5d:	f01f 7ee0 c189 dbf7 d4c8 9a52 beee b555     ...~......R...U.
c0defa6d:	4dce 1402 debf 9ec6 0b08 efd3 cc36 a5a6     .M..........6...
c0defa7d:	3349 eff1 372f 7c86 380d 58fd b865 2979     I3../7.|.8.Xe.y)
c0defa8d:	5811 c708 59e2 5854 93e9 ccba 5a6c 9f3b     .X...YTX....lZ;.
c0defa9d:	2550 1e00 419b 7744 bf08 a0ba 2e46 63fa     P%...ADw....F..c
c0defaad:	6c87 f742 9069 438b 542f 5085 398a 2432     .lB.i..C/T.P.92$
c0defabd:	0596 d751 ad7e f4fa 1c41 49bc fffd f246     ..Q.~...A..I..F.
c0defacd:	55f1 d6dd 30ec 7986 b705 8809 a08c 0ff3     .U...0.y........
c0defadd:	5f93 d7b8 80f4 fc3c 5f7a 9077 18ca 991d     ._....<.z_w.....
c0defaed:	21ca 62f2 691d c6a5 9cd4 b476 9d96 27a6     .!.b.i....v....'
c0defafd:	a340 4778 3203 09b3 ab47 cc31 9bdb c7a0     @.xG.2..G.1.....
c0defb0d:	25b6 9e87 4bec 1fd8 0002 23ba 4a50 c37d     .%...K.....#PJ}.
c0defb1d:	18b1 2abc 14b1 f15d f33a ccc8 f539 8777     ...*..].:...9.w.
c0defb2d:	843b 1b91 853d bffb b14c 4d9e b136 930a     ;...=...L..M6...
c0defb3d:	eb8e b578 dc99 6186 d65f c6ce 7beb 7a8f     ..x....a_....{.z
c0defb4d:	5ffa 6b6d 9ee1 16a8 d330 cf6c f4b2 de87     ._mk....0.l.....
c0defb5d:	d050 46cf 8dda e33f 2851 0412 0e3c f23e     P..F..?.Q(..<.>.
c0defb6d:	23d7 b01f a3b0 0f5a 83b2 30be 24a1 8077     .#....Z....0.$w.
c0defb7d:	0af3 29e0 8b4e 586f 3897 db3e 5589 f595     ...)N.oX.8>..U..
c0defb8d:	5277 f54d 9345 f9cd b427 7696 ee16 1339     wRM.E...'..v..9.
c0defb9d:	d6e4 9bb2 bd0d 337c a4a2 4e5e b1f1 4e95     ......|3..^N...N
c0defbad:	d9a5 e31c fc7e 0213 cee7 a902 9573 5d56     ....~.......s.V]
c0defbbd:	a5a2 d3c5 b0fd 76d8 e984 c0b1 07ad 33ec     .......v.......3
c0defbcd:	2ddf d5fa e228 09ea d266 7da4 eed5 e788     .-..(...f..}....
c0defbdd:	657d 0d3c 4f00 01ab f065 7c75 a44d f30a     }e<..O..e.u|M...
c0defbed:	e727 2519 c736 4799 0aa8 7a82 10a2 ac7d     '..%6..G...z..}.
c0defbfd:	e3fa bfde fac8 d6d3 80e0 d976 c538 a210     ..........v.8...
c0defc0d:	bd76 72f6 1f1a 7c08 69b1 5051 ad28 e25c     v..r...|.iQP(.\.
c0defc1d:	107a ab47 28d9 9309 a64c 893b 713f a3f9     z.G..(..L.;.?q..
c0defc2d:	994a fdc0 3130 470c aae9 3937 0a4d 3bb7     J...01.G..79M..;
c0defc3d:	4d25 a63c 9c9d 4955 47c9 ae9a 2624 c54a     %M<...UI.G..$&J.
c0defc4d:	64ea fdd3 1c82 6239 77ec 09e7 d3f9 c70b     .d....9b.w......
c0defc5d:	5ab6 e452 168c 06e8 5503 ac8c 81a1 1114     .ZR......U......
c0defc6d:	15c3 1f5d 9f94 cfc9 a99a 5a38 9971 9be9     ..].......8Zq...
c0defc7d:	7ae7 fa66 eed7 12d9 de58 b255 c8c4 9a3f     .zf.....X.U...?.
c0defc8d:	0a05 bede f0a5 5897 0df4 4aac 391c e84e     .......X...J.9N.
c0defc9d:	87d6 9187 d250 2664 5a89 93b1 148e 11ae     ....P.d&.Z......
c0defcad:	76b3 4c25 fc91 3061 6943 f896 43ed 27bd     .v%L..a0Ci...C.'
c0defcbd:	20be 90ec 1167 111c c96e c24c 6cb0 1ac9     . ..g...n.L..l..
c0defccd:	c513 0bd1 7ebd eaec 9247 7bf1 772b 1e63     .....~..G..{+wc.
c0defcdd:	45f1 fbe9 a841 aa3e c211 2ab7 fb48 fd90     .E..A.>....*H...
c0defced:	88bd 4c64 df4e b28a ce0d 1831 4b36 6a27     ..dLN.....1.6K'j
c0defcfd:	23c1 367b 92c8 346e ab6a 115a a01a 34bf     .#{6..n4j.Z....4
c0defd0d:	511c 7b8b 9eff bb9d cb8b 2847 1b60 6037     .Q.{......G(`.7`
c0defd1d:	3e66 6567 3103 fbe6 ac54 fc82 4c41 ddb8     f>ge.1..T...AL..
c0defd2d:	16fc 250a 1e31 27c5 e42d 1762 f8fe 92b9     ...%1..'-.b.....
c0defd3d:	89ff 4f75 e3be f251 b91b 6c0b 0797 518b     ..uO..Q....l...Q
c0defd4d:	980c 5033 1268 c866 d1fe 58f0 513c e751     ..3Ph.f....X<QQ.
c0defd5d:	feb8 723b 3192 9996 7c68 b6c6 fd41 68bd     ..;r.1..h|..A..h
c0defd6d:	2894 3b54 fac0 ac1f 09c1 65de 27b6 c284     .(T;.......e.'..
c0defd7d:	85d9 15ab 7dd7 f13a f62a 3ed0 188d a559     .....}:.*..>..Y.
c0defd8d:	6853 8485 5ed7 73f6 dea1 0974 e13e c708     Sh...^.s..t.>...
c0defd9d:	ff61 2cf3 7c21 1b23 290e da53 21f5 9242     a..,!|#..)S..!B.
c0defdad:	c064 3b96 a5c8 edcd 61dc 727a b985 ea34     d..;.....azr..4.
c0defdbd:	dd51 cdb5 23ab edbc 6be8 6ee3 1b00 5cc6     Q....#...k.n...\
c0defdcd:	e965 c9a1 af4b faf4 ebb8 8e5f 2ed4 77c3     e...K....._....w
c0defddd:	3642 fe33 0400 4291 7c46 c547 8ad5 0272     B63....BF|G...r.
c0defded:	e9c8 4810 c141 f3f7 1480 6a5a 820a 578c     ...HA.....Zj...W
c0defdfd:	3502 07e5 58ae a668 2f06 2b72 8fb9 bef6     .5...Xh../r+....
c0defe0d:	0000                                         ...

c0defe10 <settingContents>:
c0defe10:	0000 0000 fe2c c0de 0001 0000               ....,.......

c0defe1c <infoList>:
c0defe1c:	fe64 c0de fe6c c0de 0000 0000 0002 0000     d...l...........

c0defe2c <contents>:
c0defe2c:	0007 0000 13d4 da7a 0002 0000 0000 0000     ......z.........
	...
c0defe60:	0cd5 c0de                                   ....

c0defe64 <INFO_TYPES>:
c0defe64:	e810 c0de e64e c0de                         ....N...

c0defe6c <INFO_CONTENTS>:
c0defe6c:	e4b8 c0de e709 c0de 0000 0000               ............

c0defe78 <pqcrystals_dilithium_fips202_ref_KeccakF_RoundConstants>:
c0defe78:	0001 0000 0000 0000 8082 0000 0000 0000     ................
c0defe88:	808a 0000 0000 8000 8000 8000 0000 8000     ................
c0defe98:	808b 0000 0000 0000 0001 8000 0000 0000     ................
c0defea8:	8081 8000 0000 8000 8009 0000 0000 8000     ................
c0defeb8:	008a 0000 0000 0000 0088 0000 0000 0000     ................
c0defec8:	8009 8000 0000 0000 000a 8000 0000 0000     ................
c0defed8:	808b 8000 0000 0000 008b 0000 0000 8000     ................
c0defee8:	8089 0000 0000 8000 8003 0000 0000 8000     ................
c0defef8:	8002 0000 0000 8000 0080 0000 0000 8000     ................
c0deff08:	800a 0000 0000 0000 000a 8000 0000 8000     ................
c0deff18:	8081 8000 0000 8000 8080 0000 0000 8000     ................
c0deff28:	0001 8000 0000 0000 8008 8000 0000 8000     ................

c0deff38 <zetas>:
c0deff38:	0000 0000 64f7 0000 3102 ffd8 1503 fff8     .....d...1......
c0deff48:	9e44 0003 2118 fff4 a128 fff2 1e24 0007     D....!..(...$...
c0deff58:	de2b 001b e92b 0023 84ad fffa 147f ffe0     +...+.#.........
c0deff68:	9a75 002f fb09 ffd3 7a49 002f e527 0028     u./.....Iz/.'.(.
c0deff78:	9658 0029 a070 000f 85a4 ffef b788 0036     X.).p.........6.
c0deff88:	9d90 fff7 eaa0 ffee f968 0027 d37b ffdf     ........h.'.{...
c0deff98:	add6 ffdf 1ae7 ffc5 a4f7 ffea fc98 ffcd     ................
c0deffa8:	d035 001a b422 ffff 3201 003d 45c5 0004     5..."....2=..E..
c0deffb8:	4a67 0029 7620 0001 f4cd 002e dec5 0035     gJ). v........5.
c0deffc8:	a503 ffe6 302c ffc9 47d4 ffd9 beaf 003b     ....,0...G....;.
c0deffd8:	1585 ffc5 8e7c ffd1 8a96 0036 3e41 ffd4     ....|.....6.A>..
c0deffe8:	0400 0036 6a4d fffb d69c 0023 c55d fff7     ..6.Mj....#.]...
c0defff8:	123d ffe6 ead6 ffe6 7e1e 0035 af59 ffc5     =........~5.Y...
c0df0008:	843f 0035 5617 ffdf 945c ffe7 738c 0038     ?.5..V..\....s8.
c0df0018:	63a8 000c 1b9a 0008 8f76 000e 3853 003b     .c......v...S8;.
c0df0028:	8534 003b fc30 ffd8 9d54 001f 4f2d ffd5     4.;.0...T...-O..
c0df0038:	06e5 ffc4 ac81 ffe8 e1cf ffc7 9819 ffd1     ................
c0df0048:	d65d ffe9 09ee 0035 35c7 0021 cfbb ffe7     ].....5..5!.....
c0df0058:	cf75 ffec 9772 001d b072 ffc1 bcf6 fff0     u...r...r.......
c0df0068:	5280 ffcf d2ae ffcf 90e0 ffc8 efca 0001     .R..............
c0df0078:	10f2 0034 fe85 fff0 c638 0020 6e9f 0029     ..4.....8. ..n).
c0df0088:	b7a3 ffd2 a44b ffc7 ba6d fff9 3409 ffda     ....K...m....4..
c0df0098:	c282 fff5 4113 ffed a63b ffff 09f7 ffec     .....A..;.......
c0df00a8:	2bdd fffa 95d4 0014 4563 001c 2c62 ffea     .+......cE..b,..
c0df00b8:	fbe9 ffcc 0af0 0004 c417 0007 4588 002f     .............E/.
c0df00c8:	ad00 0000 36be ffef cd44 000d 675a 003c     .....6..D...Zg<.
c0df00d8:	2bca ffc7 de7e ffff 3948 0019 69c0 ffce     .+..~...H9...i..
c0df00e8:	756c 0024 c7df fffc 98a1 000b e808 ffeb     lu$.............
c0df00f8:	e46c 0002 c808 ffc9 36c2 0030 bff6 ffe3     l........60.....
c0df0108:	3c93 ffdb 4ae0 fffd 1305 0014 7792 0014     .<...J.......w..
c0df0118:	9e25 0013 d0e0 ffe7 9944 fff3 0802 ffea     %.......D.......
c0df0128:	eea2 ffd1 c79c ffc4 a057 ffc8 97d9 003a     ........W.....:.
c0df0138:	ea93 001f ff5a 0033 58d4 0023 41f8 003a     ....Z.3..X#..A:.
c0df0148:	ff72 ffcc 3dfb 0022 ab9f ffda a422 ffc9     r....="....."...
c0df0158:	12f5 0004 2587 0025 24f0 ffed 9b5d 0035     .....%%..$..].5.
c0df0168:	48a0 ffca a2fc ffc6 bb56 ffed 45de ffcf     .H......V....E..
c0df0178:	be5e 000d 5e1a 001c e0e6 000d 7f5a 000c     ^....^......Z...
c0df0188:	8f83 0007 628a ffe7 5704 ffff 06fc fff8     .....b...W......
c0df0198:	0021 fff6 5af6 ffd0 0084 001f ef86 0030     !....Z........0.
c0df01a8:	b97d ffc9 fcd6 fff7 4592 fff4 21c2 ffc9     }........E...!..
c0df01b8:	3919 0005 610c 0004 cd41 ffda b01b 003e     .9...a..A.....>.
c0df01c8:	72e7 0034 003b ffcd 7cc7 001a 1924 0003     .r4.;....|..$...
c0df01d8:	5ee5 002b 1199 0029 7a3a ffd8 4d71 0013     .^+...).:z..qM..
c0df01e8:	e11c 003d 0984 0013 f051 0025 5a46 0018     ..=.....Q.%.FZ..
c0df01f8:	8518 ffc6 14be 0013 3891 0028 db90 ffc9     .........8(.....
c0df0208:	5089 ffd2 853f 001c 0b4b 001d f6a6 ffef     .P..?...K.......
c0df0218:	a8be ffeb e11b 0012 5e3e ffcd 2d2f ffea     ........>^../-..
c0df0228:	1de4 fff9 06c7 0014 7283 0032 0d6e ffe2     .........r2.n...
c0df0238:	7953 ffec 4099 001d 2578 ffd9 05ad ffeb     Sy...@..x%......
c0df0248:	e405 0016 dbe7 000b 1de8 0022 f8cf 0033     .........."...3.
c0df0258:	b934 fff7 ca0c ffd4 7ff8 ffe6 d157 ffe3     4...........W...
c0df0268:	911b ffd8 2c12 ffc7 10d8 0009 5e1f ffc6     .....,.......^..
c0df0278:	4658 ffe1 1d8b 0025 73b7 0025 7c8f fffd     XF....%..s%..|..
c0df0288:	dd98 001d 6898 0033 d4bb 0002 93a7 ffed     .....h3.........
c0df0298:	6cbe ffcf 7c1c 0002 aa08 0018 fd71 002d     .l...|......q.-.
c0df02a8:	5ca5 000c 379a 0019 a167 ffc7 8c3d ffe4     .\...7..g...=...
c0df02b8:	a13c ffd1 c539 0035 0115 003b 1dc0 0004     <...9.5...;.....
c0df02c8:	c4f7 0021 1bf4 fff1 35e7 001a 340e 0007     ..!......5...4..
c0df02d8:	7d45 fff9 4cd0 001a 7cae ffe4 2668 001d     E}...L...|..h&..
c0df02e8:	8e98 ffe6 2633 ffef 05da fffc 7fdb ffc5     ....3&..........
c0df02f8:	2764 ffd3 e1af ffdd 93dd fff9 1d09 ffdd     d'..............
c0df0308:	cc93 0002 1805 fff1 9c2a 0018 e5a9 ffc9     ........*.......
c0df0318:	8a50 fff7 cf2c 003b 434e ffff 36df ffeb     P...,.;.NC...6..
c0df0328:	15ca 003c 5e68 0015 16b6 fff3 29ce 001e     ..<.h^.......)..

c0df0338 <small_zetas>:
c0df0338:	fbec fd0a fe99 fa13 05d5 058e 011f 00ca     ................
c0df0348:	ff55 026e 0629 00b6 03c2 fb4e fa3e 05bc     U.n.).....N.>...
c0df0358:	023d fad3 0108 017f fcc3 05b2 f9be ff7e     =.............~.
c0df0368:	fd57 03f9 02dc 0260 f9fa 019b ff33 f9dd     W.....`.....3...
c0df0378:	04c7 028c fdd8 03f7 faf3 05d3 fee6 f9f8     ................
c0df0388:	0204 fff8 fec0 fd66 f9ae fb76 007e 05bd     ......f...v.~...
c0df0398:	fcab ffa6 fef1 033e 006b fa73 ff09 fc49     ......>.k.s...I.
c0df03a8:	fe72 03c1 fa1c fd2b 01c0 fbd7 02a5 fb05     r.....+.........
c0df03b8:	fbb1 01ae 022b 034b fb1d 0367 060e 0069     ....+.K...g...i.
c0df03c8:	01a6 024b 00b1 ff15 fedd fe34 0626 0675     ..K.......4.&.u.
c0df03d8:	ff0a 030a 0487 ff6d fcf7 05cb fda6 045f     ......m......._.
c0df03e8:	f9ca 0284 fc98 015d 01a2 0149 ff64 ffb5     ......]...I.d...
c0df03f8:	0331 0449 025b 0262 052a fafb fa47 0180     1.I.[.b.*...G...
c0df0408:	fb41 ff78 04c2 fac9 fc96 00dc fb5d f985     A.x.........]...
c0df0418:	fb5f fa06 fb02 031a fa1a fcaa fc9a 01de     _...............
c0df0428:	ff94 fecc 03e4 03df 03be fa4c 05f2 065c     ..........L...\.

c0df0438 <.L__const.nbgl_useCaseStatus.ticker>:
c0df0438:	a21d c0de 0bb8 0000 0000 0000               ............

c0df0444 <blindSigningWarning>:
c0df0444:	0010 0000 0000 0000 0000 0000 0000 0000     ................
	...
c0df046c:	6854 7369 6120 7070 6520 616e 6c62 7365     This app enables
c0df047c:	7320 6769 696e 676e 740a 6172 736e 6361      signing.transac
c0df048c:	6974 6e6f 2073 6e6f 6920 7374 6e20 7465     tions on its net
c0df049c:	6f77 6b72 002e                              work..

c0df04a2 <nbMaxElementsPerContentType>:
c0df04a2:	0101 0101 0101 0301 0503 0005 0000          ..............

c0df04b0 <g_pcHex>:
c0df04b0:	3130 3332 3534 3736 3938 6261 6463 6665     0123456789abcdef
c0df04c0:	0000 0000 0040 0000 0000 0000 0000 0000     ....@...........
c0df04d0:	0101 0000 0000 0000 0000 0000 0916 0000     ................
c0df04e0:	0000 0000 0028 0000 0000 0000 0000 0000     ....(...........

c0df04f0 <g_pcHex_cap>:
c0df04f0:	3130 3332 3534 3736 3938 4241 4443 4645     0123456789ABCDEF

c0df0500 <.L__const.displaySkipWarning.info>:
c0df0500:	e89b c0de eaa3 c0de 0000 0000 d96c c0de     ............l...
c0df0510:	0000 0000 e69c c0de ec20 c0de 0005 0109     ........ .......

c0df0520 <securityReportItems>:
c0df0520:	e41b c0de e47c c0de 0000 0000 e41b c0de     ....|...........
c0df0530:	e8c9 c0de eba4 c0de e41b c0de e943 c0de     ............C...
c0df0540:	e858 c0de 0000 0000 ebf8 c0de ed45 c0de     X...........E...
c0df0550:	e41b c0de e8a8 c0de e96c c0de               ........l...

c0df055c <.L__const.displayCustomizedSecurityReport.layoutDescription>:
c0df055c:	0101 0000 0000 0000 0000 0000 b7f1 c0de     ................
	...

c0df0578 <.L__const.displayInfosListModal.info>:
c0df0578:	0100 0113 0900 0000 0000 0000 0000 0000     ................
c0df0588:	0100 0300 0000 0000 0000 0000               ............

c0df0594 <.L__const.displayInitialWarning.buttonsInfo>:
c0df0594:	e6d4 c0de ecef c0de 0000 0000 0014 0009     ................

c0df05a4 <_etext>:
	...

c0df0600 <N_storage_real>:
	...

c0df0800 <install_parameters>:
c0df0800:	0501 4c4d 5344 0241 3005 302e 312e 8203     ..MLDSA..0.0.1..
c0df0810:	4a01 0028 0028 4222 0001 ffff ffff ccff     .J(.(."B........
c0df0820:	828c 9110 e05a 0bdc 1002 3011 8e81 07d9     ....Z......0....
c0df0830:	5201 2011 0c03 85d7 3334 0132 0a30 96d5     .R. ....432.0...
c0df0840:	4056 2243 2021 d30c 4689 3334 1122 0120     V@C"! ...F43". .
c0df0850:	d10d 379d 1450 1413 3213 2011 d105 0708     ...7P....2. ....
c0df0860:	0a16 0b1c 3308 1122 0c30 9ecf b047 0dc5     .....3".0...G...
c0df0870:	1305 1122 0630 2ec4 8bc7 c76c 538d 8822     ..".0.....l..S".
c0df0880:	3095 c20e 100b c703 0908 8ec3 c2ce 020b     .0..............
c0df0890:	bc13 d9dc 9100 8026 05c1 0210 05c7 c20d     ......&.........
c0df08a0:	bdac c19c 43be 309d bda1 1c67 1409 0223     .....C.0..g...#.
c0df08b0:	c60b c305 c10a 080e 06c2 1803 1792 3de0     ...............=
c0df08c0:	2b2c 3c8a 09c5 0ec2 c20a c208 0309 1117     ,+.<............
c0df08d0:	ed88 1d1c 2c1b 090a 08c6 aac3 cbdf bcc2     .....,..........
c0df08e0:	e827 1d70 06b3 b0a9 7aad c778 2e0a ecaf     '.p......zx.....
c0df08f0:	c3ad 729e 1e90 60bd c05a c10e a786 0dc8     ...r...`Z.......
c0df0900:	2e0b 0ec0 bec5 12d6 a130 c806 9ec2 508b     ........0......P
c0df0910:	07c9 5e7e 64ba d07b 0a0b 0ec2 1807 0bc9     ..~^.d{.........
c0df0920:	7e0c 0e7e 081d 07d2 7e7e 8d0e d2ac 090d     .~~.....~~......
c0df0930:	6e7e b98d 0bd4 7e0a 8d4e d6c9 090b 1e7e     ~n.....~N.....~.
c0df0940:	0b1d d809 7c8d 1d3e 8c1e db8d 899c 1cb0     .....|>.........
c0df0950:	a89b e0b0 cb9d ffd0 ffff c4ff 0a04 0201     ................
c0df0960:	0080 2c00 0080 0100                         ...,....
