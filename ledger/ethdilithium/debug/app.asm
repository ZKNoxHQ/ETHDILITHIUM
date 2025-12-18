
build/flex/bin/app.elf:     file format elf32-littlearm


Disassembly of section .text:

c0de0000 <main>:
c0de0000:	b510      	push	{r4, lr}
c0de0002:	4604      	mov	r4, r0
c0de0004:	b662      	cpsie	i
c0de0006:	f00a fbf9 	bl	c0dea7fc <os_boot>
c0de000a:	b90c      	cbnz	r4, c0de0010 <main+0x10>
c0de000c:	f00a f9c0 	bl	c0dea390 <standalone_app_main>
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
c0de0022:	f00a ffa9 	bl	c0deaf78 <__aeabi_memclr>
c0de0026:	b914      	cbnz	r4, c0de002e <address_from_pubkey+0x1a>
c0de0028:	2001      	movs	r0, #1
c0de002a:	f00a fb63 	bl	c0dea6f4 <assert_exit>
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
c0de0042:	f00a fb1f 	bl	c0dea684 <cx_keccak_256_hash_iovec>
c0de0046:	b108      	cbz	r0, c0de004c <address_from_pubkey+0x38>
c0de0048:	2000      	movs	r0, #0
c0de004a:	e006      	b.n	c0de005a <address_from_pubkey+0x46>
c0de004c:	f105 010c 	add.w	r1, r5, #12
c0de0050:	4620      	mov	r0, r4
c0de0052:	2214      	movs	r2, #20
c0de0054:	f00a ff86 	bl	c0deaf64 <__aeabi_memcpy>
c0de0058:	2001      	movs	r0, #1
c0de005a:	b00a      	add	sp, #40	@ 0x28
c0de005c:	bd70      	pop	{r4, r5, r6, pc}

c0de005e <apdu_dispatcher>:
c0de005e:	b51f      	push	{r0, r1, r2, r3, r4, lr}
c0de0060:	4604      	mov	r4, r0
c0de0062:	b910      	cbnz	r0, c0de006a <apdu_dispatcher+0xc>
c0de0064:	2001      	movs	r0, #1
c0de0066:	f00a fb45 	bl	c0dea6f4 <assert_exit>
c0de006a:	7820      	ldrb	r0, [r4, #0]
c0de006c:	28e0      	cmp	r0, #224	@ 0xe0
c0de006e:	d137      	bne.n	c0de00e0 <apdu_dispatcher+0x82>
c0de0070:	2000      	movs	r0, #0
c0de0072:	9003      	str	r0, [sp, #12]
c0de0074:	e9cd 0001 	strd	r0, r0, [sp, #4]
c0de0078:	7860      	ldrb	r0, [r4, #1]
c0de007a:	2814      	cmp	r0, #20
c0de007c:	d033      	beq.n	c0de00e6 <apdu_dispatcher+0x88>
c0de007e:	2804      	cmp	r0, #4
c0de0080:	d043      	beq.n	c0de010a <apdu_dispatcher+0xac>
c0de0082:	2805      	cmp	r0, #5
c0de0084:	d04d      	beq.n	c0de0122 <apdu_dispatcher+0xc4>
c0de0086:	2806      	cmp	r0, #6
c0de0088:	d061      	beq.n	c0de014e <apdu_dispatcher+0xf0>
c0de008a:	2807      	cmp	r0, #7
c0de008c:	d06b      	beq.n	c0de0166 <apdu_dispatcher+0x108>
c0de008e:	2809      	cmp	r0, #9
c0de0090:	d073      	beq.n	c0de017a <apdu_dispatcher+0x11c>
c0de0092:	280a      	cmp	r0, #10
c0de0094:	f000 8080 	beq.w	c0de0198 <apdu_dispatcher+0x13a>
c0de0098:	280b      	cmp	r0, #11
c0de009a:	f000 8086 	beq.w	c0de01aa <apdu_dispatcher+0x14c>
c0de009e:	280c      	cmp	r0, #12
c0de00a0:	f000 808c 	beq.w	c0de01bc <apdu_dispatcher+0x15e>
c0de00a4:	280f      	cmp	r0, #15
c0de00a6:	f000 8096 	beq.w	c0de01d6 <apdu_dispatcher+0x178>
c0de00aa:	2810      	cmp	r0, #16
c0de00ac:	f000 80a5 	beq.w	c0de01fa <apdu_dispatcher+0x19c>
c0de00b0:	2811      	cmp	r0, #17
c0de00b2:	f000 80ad 	beq.w	c0de0210 <apdu_dispatcher+0x1b2>
c0de00b6:	2812      	cmp	r0, #18
c0de00b8:	f000 80b5 	beq.w	c0de0226 <apdu_dispatcher+0x1c8>
c0de00bc:	2813      	cmp	r0, #19
c0de00be:	f000 80bb 	beq.w	c0de0238 <apdu_dispatcher+0x1da>
c0de00c2:	2803      	cmp	r0, #3
c0de00c4:	f040 80c2 	bne.w	c0de024c <apdu_dispatcher+0x1ee>
c0de00c8:	78a0      	ldrb	r0, [r4, #2]
c0de00ca:	2800      	cmp	r0, #0
c0de00cc:	f040 80cf 	bne.w	c0de026e <apdu_dispatcher+0x210>
c0de00d0:	78e0      	ldrb	r0, [r4, #3]
c0de00d2:	2800      	cmp	r0, #0
c0de00d4:	f040 80cb 	bne.w	c0de026e <apdu_dispatcher+0x210>
c0de00d8:	e8bd 401f 	ldmia.w	sp!, {r0, r1, r2, r3, r4, lr}
c0de00dc:	f000 b987 	b.w	c0de03ee <handler_get_version>
c0de00e0:	f44f 40dc 	mov.w	r0, #28160	@ 0x6e00
c0de00e4:	e0c5      	b.n	c0de0272 <apdu_dispatcher+0x214>
c0de00e6:	78a0      	ldrb	r0, [r4, #2]
c0de00e8:	2801      	cmp	r0, #1
c0de00ea:	f200 80c0 	bhi.w	c0de026e <apdu_dispatcher+0x210>
c0de00ee:	78e0      	ldrb	r0, [r4, #3]
c0de00f0:	2800      	cmp	r0, #0
c0de00f2:	f040 80bc 	bne.w	c0de026e <apdu_dispatcher+0x210>
c0de00f6:	68a0      	ldr	r0, [r4, #8]
c0de00f8:	2800      	cmp	r0, #0
c0de00fa:	f000 80bf 	beq.w	c0de027c <apdu_dispatcher+0x21e>
c0de00fe:	f000 f8c7 	bl	c0de0290 <OUTLINED_FUNCTION_0>
c0de0102:	a801      	add	r0, sp, #4
c0de0104:	f000 fb74 	bl	c0de07f0 <handler_get_mldsa_seed>
c0de0108:	e09e      	b.n	c0de0248 <apdu_dispatcher+0x1ea>
c0de010a:	78a0      	ldrb	r0, [r4, #2]
c0de010c:	2800      	cmp	r0, #0
c0de010e:	f040 80ae 	bne.w	c0de026e <apdu_dispatcher+0x210>
c0de0112:	78e0      	ldrb	r0, [r4, #3]
c0de0114:	2800      	cmp	r0, #0
c0de0116:	f040 80aa 	bne.w	c0de026e <apdu_dispatcher+0x210>
c0de011a:	e8bd 401f 	ldmia.w	sp!, {r0, r1, r2, r3, r4, lr}
c0de011e:	f000 b8ff 	b.w	c0de0320 <handler_get_app_name>
c0de0122:	78a1      	ldrb	r1, [r4, #2]
c0de0124:	2901      	cmp	r1, #1
c0de0126:	f200 80a2 	bhi.w	c0de026e <apdu_dispatcher+0x210>
c0de012a:	78e0      	ldrb	r0, [r4, #3]
c0de012c:	2800      	cmp	r0, #0
c0de012e:	f040 809e 	bne.w	c0de026e <apdu_dispatcher+0x210>
c0de0132:	68a0      	ldr	r0, [r4, #8]
c0de0134:	2800      	cmp	r0, #0
c0de0136:	f000 80a1 	beq.w	c0de027c <apdu_dispatcher+0x21e>
c0de013a:	9001      	str	r0, [sp, #4]
c0de013c:	7920      	ldrb	r0, [r4, #4]
c0de013e:	2900      	cmp	r1, #0
c0de0140:	9002      	str	r0, [sp, #8]
c0de0142:	bf18      	it	ne
c0de0144:	2101      	movne	r1, #1
c0de0146:	a801      	add	r0, sp, #4
c0de0148:	f000 f8fe 	bl	c0de0348 <handler_get_public_key>
c0de014c:	e07c      	b.n	c0de0248 <apdu_dispatcher+0x1ea>
c0de014e:	78a1      	ldrb	r1, [r4, #2]
c0de0150:	2900      	cmp	r1, #0
c0de0152:	d07e      	beq.n	c0de0252 <apdu_dispatcher+0x1f4>
c0de0154:	2903      	cmp	r1, #3
c0de0156:	f200 808a 	bhi.w	c0de026e <apdu_dispatcher+0x210>
c0de015a:	78e0      	ldrb	r0, [r4, #3]
c0de015c:	f040 0280 	orr.w	r2, r0, #128	@ 0x80
c0de0160:	2a80      	cmp	r2, #128	@ 0x80
c0de0162:	d07a      	beq.n	c0de025a <apdu_dispatcher+0x1fc>
c0de0164:	e083      	b.n	c0de026e <apdu_dispatcher+0x210>
c0de0166:	68a0      	ldr	r0, [r4, #8]
c0de0168:	2800      	cmp	r0, #0
c0de016a:	f000 8087 	beq.w	c0de027c <apdu_dispatcher+0x21e>
c0de016e:	f000 f88f 	bl	c0de0290 <OUTLINED_FUNCTION_0>
c0de0172:	a801      	add	r0, sp, #4
c0de0174:	f000 fa07 	bl	c0de0586 <handler_cmd_keccakH>
c0de0178:	e066      	b.n	c0de0248 <apdu_dispatcher+0x1ea>
c0de017a:	78e0      	ldrb	r0, [r4, #3]
c0de017c:	2800      	cmp	r0, #0
c0de017e:	d176      	bne.n	c0de026e <apdu_dispatcher+0x210>
c0de0180:	78a1      	ldrb	r1, [r4, #2]
c0de0182:	2902      	cmp	r1, #2
c0de0184:	d301      	bcc.n	c0de018a <apdu_dispatcher+0x12c>
c0de0186:	2980      	cmp	r1, #128	@ 0x80
c0de0188:	d171      	bne.n	c0de026e <apdu_dispatcher+0x210>
c0de018a:	68a0      	ldr	r0, [r4, #8]
c0de018c:	f000 f880 	bl	c0de0290 <OUTLINED_FUNCTION_0>
c0de0190:	a801      	add	r0, sp, #4
c0de0192:	f000 fa11 	bl	c0de05b8 <handler_cmd_keccak_prng>
c0de0196:	e057      	b.n	c0de0248 <apdu_dispatcher+0x1ea>
c0de0198:	68a0      	ldr	r0, [r4, #8]
c0de019a:	2800      	cmp	r0, #0
c0de019c:	d06e      	beq.n	c0de027c <apdu_dispatcher+0x21e>
c0de019e:	f000 f877 	bl	c0de0290 <OUTLINED_FUNCTION_0>
c0de01a2:	a801      	add	r0, sp, #4
c0de01a4:	f000 f9d5 	bl	c0de0552 <handler_cmd_dummy>
c0de01a8:	e04e      	b.n	c0de0248 <apdu_dispatcher+0x1ea>
c0de01aa:	68a0      	ldr	r0, [r4, #8]
c0de01ac:	2800      	cmp	r0, #0
c0de01ae:	d065      	beq.n	c0de027c <apdu_dispatcher+0x21e>
c0de01b0:	f000 f86e 	bl	c0de0290 <OUTLINED_FUNCTION_0>
c0de01b4:	a801      	add	r0, sp, #4
c0de01b6:	f000 fa37 	bl	c0de0628 <handler_cmd_sample_in_ball>
c0de01ba:	e045      	b.n	c0de0248 <apdu_dispatcher+0x1ea>
c0de01bc:	78a0      	ldrb	r0, [r4, #2]
c0de01be:	2800      	cmp	r0, #0
c0de01c0:	d155      	bne.n	c0de026e <apdu_dispatcher+0x210>
c0de01c2:	78e0      	ldrb	r0, [r4, #3]
c0de01c4:	2800      	cmp	r0, #0
c0de01c6:	d152      	bne.n	c0de026e <apdu_dispatcher+0x210>
c0de01c8:	68a0      	ldr	r0, [r4, #8]
c0de01ca:	f000 f861 	bl	c0de0290 <OUTLINED_FUNCTION_0>
c0de01ce:	a801      	add	r0, sp, #4
c0de01d0:	f000 fa3c 	bl	c0de064c <handler_cmd_keygen_core_dilithium>
c0de01d4:	e038      	b.n	c0de0248 <apdu_dispatcher+0x1ea>
c0de01d6:	78e0      	ldrb	r0, [r4, #3]
c0de01d8:	2800      	cmp	r0, #0
c0de01da:	d148      	bne.n	c0de026e <apdu_dispatcher+0x210>
c0de01dc:	78a1      	ldrb	r1, [r4, #2]
c0de01de:	2902      	cmp	r1, #2
c0de01e0:	d304      	bcc.n	c0de01ec <apdu_dispatcher+0x18e>
c0de01e2:	2980      	cmp	r1, #128	@ 0x80
c0de01e4:	d143      	bne.n	c0de026e <apdu_dispatcher+0x210>
c0de01e6:	7920      	ldrb	r0, [r4, #4]
c0de01e8:	2802      	cmp	r0, #2
c0de01ea:	d140      	bne.n	c0de026e <apdu_dispatcher+0x210>
c0de01ec:	68a0      	ldr	r0, [r4, #8]
c0de01ee:	f000 f84f 	bl	c0de0290 <OUTLINED_FUNCTION_0>
c0de01f2:	a801      	add	r0, sp, #4
c0de01f4:	f000 fa56 	bl	c0de06a4 <handler_cmd_sign_dilithium>
c0de01f8:	e026      	b.n	c0de0248 <apdu_dispatcher+0x1ea>
c0de01fa:	78a0      	ldrb	r0, [r4, #2]
c0de01fc:	bbb8      	cbnz	r0, c0de026e <apdu_dispatcher+0x210>
c0de01fe:	78e0      	ldrb	r0, [r4, #3]
c0de0200:	bba8      	cbnz	r0, c0de026e <apdu_dispatcher+0x210>
c0de0202:	68a0      	ldr	r0, [r4, #8]
c0de0204:	f000 f844 	bl	c0de0290 <OUTLINED_FUNCTION_0>
c0de0208:	a801      	add	r0, sp, #4
c0de020a:	f000 faaf 	bl	c0de076c <handler_cmd_verify_dilithium>
c0de020e:	e01b      	b.n	c0de0248 <apdu_dispatcher+0x1ea>
c0de0210:	78a0      	ldrb	r0, [r4, #2]
c0de0212:	bb60      	cbnz	r0, c0de026e <apdu_dispatcher+0x210>
c0de0214:	78e0      	ldrb	r0, [r4, #3]
c0de0216:	bb50      	cbnz	r0, c0de026e <apdu_dispatcher+0x210>
c0de0218:	68a0      	ldr	r0, [r4, #8]
c0de021a:	f000 f839 	bl	c0de0290 <OUTLINED_FUNCTION_0>
c0de021e:	a801      	add	r0, sp, #4
c0de0220:	f000 fa2e 	bl	c0de0680 <handler_cmd_keygen_dilithium>
c0de0224:	e010      	b.n	c0de0248 <apdu_dispatcher+0x1ea>
c0de0226:	68a0      	ldr	r0, [r4, #8]
c0de0228:	78a1      	ldrb	r1, [r4, #2]
c0de022a:	78e2      	ldrb	r2, [r4, #3]
c0de022c:	f000 f830 	bl	c0de0290 <OUTLINED_FUNCTION_0>
c0de0230:	a801      	add	r0, sp, #4
c0de0232:	f000 fabd 	bl	c0de07b0 <handler_cmd_get_sig_chunk>
c0de0236:	e007      	b.n	c0de0248 <apdu_dispatcher+0x1ea>
c0de0238:	68a0      	ldr	r0, [r4, #8]
c0de023a:	78a1      	ldrb	r1, [r4, #2]
c0de023c:	78e2      	ldrb	r2, [r4, #3]
c0de023e:	f000 f827 	bl	c0de0290 <OUTLINED_FUNCTION_0>
c0de0242:	a801      	add	r0, sp, #4
c0de0244:	f000 fac4 	bl	c0de07d0 <handler_cmd_get_pk_chunk>
c0de0248:	b004      	add	sp, #16
c0de024a:	bd10      	pop	{r4, pc}
c0de024c:	f44f 40da 	mov.w	r0, #27904	@ 0x6d00
c0de0250:	e00f      	b.n	c0de0272 <apdu_dispatcher+0x214>
c0de0252:	78e0      	ldrb	r0, [r4, #3]
c0de0254:	2880      	cmp	r0, #128	@ 0x80
c0de0256:	d10a      	bne.n	c0de026e <apdu_dispatcher+0x210>
c0de0258:	2080      	movs	r0, #128	@ 0x80
c0de025a:	68a2      	ldr	r2, [r4, #8]
c0de025c:	b172      	cbz	r2, c0de027c <apdu_dispatcher+0x21e>
c0de025e:	9201      	str	r2, [sp, #4]
c0de0260:	7922      	ldrb	r2, [r4, #4]
c0de0262:	9202      	str	r2, [sp, #8]
c0de0264:	09c2      	lsrs	r2, r0, #7
c0de0266:	a801      	add	r0, sp, #4
c0de0268:	f000 f8d8 	bl	c0de041c <handler_sign_tx>
c0de026c:	e7ec      	b.n	c0de0248 <apdu_dispatcher+0x1ea>
c0de026e:	f646 2086 	movw	r0, #27270	@ 0x6a86
c0de0272:	b004      	add	sp, #16
c0de0274:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de0278:	f000 b803 	b.w	c0de0282 <io_send_sw>
c0de027c:	f646 2087 	movw	r0, #27271	@ 0x6a87
c0de0280:	e7f7      	b.n	c0de0272 <apdu_dispatcher+0x214>

c0de0282 <io_send_sw>:
c0de0282:	b580      	push	{r7, lr}
c0de0284:	4602      	mov	r2, r0
c0de0286:	2000      	movs	r0, #0
c0de0288:	2100      	movs	r1, #0
c0de028a:	f00a f841 	bl	c0dea310 <io_send_response_buffers>
c0de028e:	bd80      	pop	{r7, pc}

c0de0290 <OUTLINED_FUNCTION_0>:
c0de0290:	9001      	str	r0, [sp, #4]
c0de0292:	7920      	ldrb	r0, [r4, #4]
c0de0294:	9002      	str	r0, [sp, #8]
c0de0296:	4770      	bx	lr

c0de0298 <app_main>:
c0de0298:	b5bf      	push	{r0, r1, r2, r3, r4, r5, r7, lr}
c0de029a:	f00a f81b 	bl	c0dea2d4 <io_init>
c0de029e:	f000 fc3f 	bl	c0de0b20 <ui_menu_main>
c0de02a2:	481b      	ldr	r0, [pc, #108]	@ (c0de0310 <app_main+0x78>)
c0de02a4:	f44f 7136 	mov.w	r1, #728	@ 0x2d8
c0de02a8:	4448      	add	r0, r9
c0de02aa:	f00a fe73 	bl	c0deaf94 <explicit_bzero>
c0de02ae:	481a      	ldr	r0, [pc, #104]	@ (c0de0318 <app_main+0x80>)
c0de02b0:	4478      	add	r0, pc
c0de02b2:	f00a fc3f 	bl	c0deab34 <pic>
c0de02b6:	7880      	ldrb	r0, [r0, #2]
c0de02b8:	2801      	cmp	r0, #1
c0de02ba:	d00d      	beq.n	c0de02d8 <app_main+0x40>
c0de02bc:	2001      	movs	r0, #1
c0de02be:	f88d 0002 	strb.w	r0, [sp, #2]
c0de02c2:	2000      	movs	r0, #0
c0de02c4:	f8ad 0000 	strh.w	r0, [sp]
c0de02c8:	4814      	ldr	r0, [pc, #80]	@ (c0de031c <app_main+0x84>)
c0de02ca:	4478      	add	r0, pc
c0de02cc:	f00a fc32 	bl	c0deab34 <pic>
c0de02d0:	4669      	mov	r1, sp
c0de02d2:	2203      	movs	r2, #3
c0de02d4:	f00a fc68 	bl	c0deaba8 <nvm_write>
c0de02d8:	4d0e      	ldr	r5, [pc, #56]	@ (c0de0314 <app_main+0x7c>)
c0de02da:	ac01      	add	r4, sp, #4
c0de02dc:	f00a f802 	bl	c0dea2e4 <io_recv_command>
c0de02e0:	2800      	cmp	r0, #0
c0de02e2:	d414      	bmi.n	c0de030e <app_main+0x76>
c0de02e4:	4602      	mov	r2, r0
c0de02e6:	eb09 0105 	add.w	r1, r9, r5
c0de02ea:	4620      	mov	r0, r4
c0de02ec:	f00a f877 	bl	c0dea3de <apdu_parser>
c0de02f0:	b130      	cbz	r0, c0de0300 <app_main+0x68>
c0de02f2:	4620      	mov	r0, r4
c0de02f4:	f7ff feb3 	bl	c0de005e <apdu_dispatcher>
c0de02f8:	f1b0 3fff 	cmp.w	r0, #4294967295	@ 0xffffffff
c0de02fc:	dcee      	bgt.n	c0de02dc <app_main+0x44>
c0de02fe:	e006      	b.n	c0de030e <app_main+0x76>
c0de0300:	2000      	movs	r0, #0
c0de0302:	2100      	movs	r1, #0
c0de0304:	f646 2287 	movw	r2, #27271	@ 0x6a87
c0de0308:	f00a f802 	bl	c0dea310 <io_send_response_buffers>
c0de030c:	e7e6      	b.n	c0de02dc <app_main+0x44>
c0de030e:	bdbf      	pop	{r0, r1, r2, r3, r4, r5, r7, pc}
c0de0310:	00000000 	.word	0x00000000
c0de0314:	00001517 	.word	0x00001517
c0de0318:	0000e34c 	.word	0x0000e34c
c0de031c:	0000e332 	.word	0x0000e332

c0de0320 <handler_get_app_name>:
c0de0320:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de0322:	4808      	ldr	r0, [pc, #32]	@ (c0de0344 <handler_get_app_name+0x24>)
c0de0324:	4478      	add	r0, pc
c0de0326:	f00a fc05 	bl	c0deab34 <pic>
c0de032a:	2100      	movs	r1, #0
c0de032c:	f44f 4210 	mov.w	r2, #36864	@ 0x9000
c0de0330:	9103      	str	r1, [sp, #12]
c0de0332:	2108      	movs	r1, #8
c0de0334:	e9cd 0101 	strd	r0, r1, [sp, #4]
c0de0338:	a801      	add	r0, sp, #4
c0de033a:	2101      	movs	r1, #1
c0de033c:	f009 ffe8 	bl	c0dea310 <io_send_response_buffers>
c0de0340:	b004      	add	sp, #16
c0de0342:	bd80      	pop	{r7, pc}
c0de0344:	0000ca7c 	.word	0x0000ca7c

c0de0348 <handler_get_public_key>:
c0de0348:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de034a:	b085      	sub	sp, #20
c0de034c:	4f23      	ldr	r7, [pc, #140]	@ (c0de03dc <handler_get_public_key+0x94>)
c0de034e:	460c      	mov	r4, r1
c0de0350:	4605      	mov	r5, r0
c0de0352:	f44f 7136 	mov.w	r1, #728	@ 0x2d8
c0de0356:	eb09 0607 	add.w	r6, r9, r7
c0de035a:	4630      	mov	r0, r6
c0de035c:	f00a fe1a 	bl	c0deaf94 <explicit_bzero>
c0de0360:	2000      	movs	r0, #0
c0de0362:	f506 7135 	add.w	r1, r6, #724	@ 0x2d4
c0de0366:	f809 0007 	strb.w	r0, [r9, r7]
c0de036a:	f886 02a8 	strb.w	r0, [r6, #680]	@ 0x2a8
c0de036e:	4628      	mov	r0, r5
c0de0370:	f009 fd7a 	bl	c0de9e68 <buffer_read_u8>
c0de0374:	b308      	cbz	r0, c0de03ba <handler_get_public_key+0x72>
c0de0376:	eb09 0007 	add.w	r0, r9, r7
c0de037a:	f890 22d4 	ldrb.w	r2, [r0, #724]	@ 0x2d4
c0de037e:	f500 712b 	add.w	r1, r0, #684	@ 0x2ac
c0de0382:	4628      	mov	r0, r5
c0de0384:	f009 fdc3 	bl	c0de9f0e <buffer_read_bip32_path>
c0de0388:	b1b8      	cbz	r0, c0de03ba <handler_get_public_key+0x72>
c0de038a:	eb09 0007 	add.w	r0, r9, r7
c0de038e:	2100      	movs	r1, #0
c0de0390:	2205      	movs	r2, #5
c0de0392:	f890 32d4 	ldrb.w	r3, [r0, #724]	@ 0x2d4
c0de0396:	e9cd 2102 	strd	r2, r1, [sp, #8]
c0de039a:	9104      	str	r1, [sp, #16]
c0de039c:	f100 0549 	add.w	r5, r0, #73	@ 0x49
c0de03a0:	f100 0608 	add.w	r6, r0, #8
c0de03a4:	f500 722b 	add.w	r2, r0, #684	@ 0x2ac
c0de03a8:	2000      	movs	r0, #0
c0de03aa:	2121      	movs	r1, #33	@ 0x21
c0de03ac:	e9cd 6500 	strd	r6, r5, [sp]
c0de03b0:	f009 fe6e 	bl	c0dea090 <bip32_derive_with_seed_get_pubkey_256>
c0de03b4:	b140      	cbz	r0, c0de03c8 <handler_get_public_key+0x80>
c0de03b6:	b280      	uxth	r0, r0
c0de03b8:	e001      	b.n	c0de03be <handler_get_public_key+0x76>
c0de03ba:	f646 2087 	movw	r0, #27271	@ 0x6a87
c0de03be:	b005      	add	sp, #20
c0de03c0:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de03c4:	f000 b80c 	b.w	c0de03e0 <io_send_sw>
c0de03c8:	2c00      	cmp	r4, #0
c0de03ca:	b005      	add	sp, #20
c0de03cc:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de03d0:	bf08      	it	eq
c0de03d2:	f000 ba75 	beq.w	c0de08c0 <helper_send_response_pubkey>
c0de03d6:	f000 bc8b 	b.w	c0de0cf0 <ui_display_address>
c0de03da:	bf00      	nop
c0de03dc:	00000000 	.word	0x00000000

c0de03e0 <io_send_sw>:
c0de03e0:	b580      	push	{r7, lr}
c0de03e2:	4602      	mov	r2, r0
c0de03e4:	2000      	movs	r0, #0
c0de03e6:	2100      	movs	r1, #0
c0de03e8:	f009 ff92 	bl	c0dea310 <io_send_response_buffers>
c0de03ec:	bd80      	pop	{r7, pc}

c0de03ee <handler_get_version>:
c0de03ee:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de03f0:	2000      	movs	r0, #0
c0de03f2:	2101      	movs	r1, #1
c0de03f4:	f44f 4210 	mov.w	r2, #36864	@ 0x9000
c0de03f8:	f88d 0002 	strb.w	r0, [sp, #2]
c0de03fc:	f88d 0001 	strb.w	r0, [sp, #1]
c0de0400:	9003      	str	r0, [sp, #12]
c0de0402:	2003      	movs	r0, #3
c0de0404:	f88d 1003 	strb.w	r1, [sp, #3]
c0de0408:	2101      	movs	r1, #1
c0de040a:	9002      	str	r0, [sp, #8]
c0de040c:	f10d 0001 	add.w	r0, sp, #1
c0de0410:	9001      	str	r0, [sp, #4]
c0de0412:	a801      	add	r0, sp, #4
c0de0414:	f009 ff7c 	bl	c0dea310 <io_send_response_buffers>
c0de0418:	b004      	add	sp, #16
c0de041a:	bd80      	pop	{r7, pc}

c0de041c <handler_sign_tx>:
c0de041c:	b570      	push	{r4, r5, r6, lr}
c0de041e:	b086      	sub	sp, #24
c0de0420:	4e46      	ldr	r6, [pc, #280]	@ (c0de053c <handler_sign_tx+0x120>)
c0de0422:	4604      	mov	r4, r0
c0de0424:	b191      	cbz	r1, c0de044c <handler_sign_tx+0x30>
c0de0426:	eb09 0006 	add.w	r0, r9, r6
c0de042a:	f890 02a8 	ldrb.w	r0, [r0, #680]	@ 0x2a8
c0de042e:	2801      	cmp	r0, #1
c0de0430:	d12c      	bne.n	c0de048c <handler_sign_tx+0x70>
c0de0432:	eb09 0006 	add.w	r0, r9, r6
c0de0436:	4615      	mov	r5, r2
c0de0438:	6862      	ldr	r2, [r4, #4]
c0de043a:	f8d0 0208 	ldr.w	r0, [r0, #520]	@ 0x208
c0de043e:	1811      	adds	r1, r2, r0
c0de0440:	f5b1 7fff 	cmp.w	r1, #510	@ 0x1fe
c0de0444:	d925      	bls.n	c0de0492 <handler_sign_tx+0x76>
c0de0446:	f24b 0004 	movw	r0, #45060	@ 0xb004
c0de044a:	e039      	b.n	c0de04c0 <handler_sign_tx+0xa4>
c0de044c:	eb09 0506 	add.w	r5, r9, r6
c0de0450:	f44f 7136 	mov.w	r1, #728	@ 0x2d8
c0de0454:	4628      	mov	r0, r5
c0de0456:	f00a fd9d 	bl	c0deaf94 <explicit_bzero>
c0de045a:	2000      	movs	r0, #0
c0de045c:	f505 7135 	add.w	r1, r5, #724	@ 0x2d4
c0de0460:	f809 0006 	strb.w	r0, [r9, r6]
c0de0464:	2001      	movs	r0, #1
c0de0466:	f885 02a8 	strb.w	r0, [r5, #680]	@ 0x2a8
c0de046a:	4620      	mov	r0, r4
c0de046c:	f009 fcfc 	bl	c0de9e68 <buffer_read_u8>
c0de0470:	b148      	cbz	r0, c0de0486 <handler_sign_tx+0x6a>
c0de0472:	eb09 0006 	add.w	r0, r9, r6
c0de0476:	f890 22d4 	ldrb.w	r2, [r0, #724]	@ 0x2d4
c0de047a:	f500 712b 	add.w	r1, r0, #684	@ 0x2ac
c0de047e:	4620      	mov	r0, r4
c0de0480:	f009 fd45 	bl	c0de9f0e <buffer_read_bip32_path>
c0de0484:	b9b8      	cbnz	r0, c0de04b6 <handler_sign_tx+0x9a>
c0de0486:	f646 2087 	movw	r0, #27271	@ 0x6a87
c0de048a:	e019      	b.n	c0de04c0 <handler_sign_tx+0xa4>
c0de048c:	f24b 0007 	movw	r0, #45063	@ 0xb007
c0de0490:	e016      	b.n	c0de04c0 <handler_sign_tx+0xa4>
c0de0492:	eb09 0106 	add.w	r1, r9, r6
c0de0496:	4408      	add	r0, r1
c0de0498:	f100 0108 	add.w	r1, r0, #8
c0de049c:	4620      	mov	r0, r4
c0de049e:	f009 fd60 	bl	c0de9f62 <buffer_move>
c0de04a2:	b158      	cbz	r0, c0de04bc <handler_sign_tx+0xa0>
c0de04a4:	eb09 0106 	add.w	r1, r9, r6
c0de04a8:	6862      	ldr	r2, [r4, #4]
c0de04aa:	f8d1 0208 	ldr.w	r0, [r1, #520]	@ 0x208
c0de04ae:	4410      	add	r0, r2
c0de04b0:	f8c1 0208 	str.w	r0, [r1, #520]	@ 0x208
c0de04b4:	b14d      	cbz	r5, c0de04ca <handler_sign_tx+0xae>
c0de04b6:	f44f 4010 	mov.w	r0, #36864	@ 0x9000
c0de04ba:	e001      	b.n	c0de04c0 <handler_sign_tx+0xa4>
c0de04bc:	f24b 0005 	movw	r0, #45061	@ 0xb005
c0de04c0:	b006      	add	sp, #24
c0de04c2:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de04c6:	f000 b83d 	b.w	c0de0544 <io_send_sw>
c0de04ca:	2100      	movs	r1, #0
c0de04cc:	e9cd 0102 	strd	r0, r1, [sp, #8]
c0de04d0:	eb09 0006 	add.w	r0, r9, r6
c0de04d4:	f100 0108 	add.w	r1, r0, #8
c0de04d8:	9101      	str	r1, [sp, #4]
c0de04da:	f500 7104 	add.w	r1, r0, #528	@ 0x210
c0de04de:	a801      	add	r0, sp, #4
c0de04e0:	f000 fa3e 	bl	c0de0960 <transaction_deserialize>
c0de04e4:	2801      	cmp	r0, #1
c0de04e6:	d114      	bne.n	c0de0512 <handler_sign_tx+0xf6>
c0de04e8:	2001      	movs	r0, #1
c0de04ea:	f809 0006 	strb.w	r0, [r9, r6]
c0de04ee:	eb09 0006 	add.w	r0, r9, r6
c0de04f2:	f8d0 1208 	ldr.w	r1, [r0, #520]	@ 0x208
c0de04f6:	f500 720e 	add.w	r2, r0, #568	@ 0x238
c0de04fa:	9105      	str	r1, [sp, #20]
c0de04fc:	f100 0108 	add.w	r1, r0, #8
c0de0500:	9104      	str	r1, [sp, #16]
c0de0502:	a804      	add	r0, sp, #16
c0de0504:	2101      	movs	r1, #1
c0de0506:	f00a f8bd 	bl	c0dea684 <cx_keccak_256_hash_iovec>
c0de050a:	b140      	cbz	r0, c0de051e <handler_sign_tx+0x102>
c0de050c:	f24b 0006 	movw	r0, #45062	@ 0xb006
c0de0510:	e001      	b.n	c0de0516 <handler_sign_tx+0xfa>
c0de0512:	f24b 0005 	movw	r0, #45061	@ 0xb005
c0de0516:	f000 f815 	bl	c0de0544 <io_send_sw>
c0de051a:	b006      	add	sp, #24
c0de051c:	bd70      	pop	{r4, r5, r6, pc}
c0de051e:	eb09 0006 	add.w	r0, r9, r6
c0de0522:	f8d0 022c 	ldr.w	r0, [r0, #556]	@ 0x22c
c0de0526:	4906      	ldr	r1, [pc, #24]	@ (c0de0540 <handler_sign_tx+0x124>)
c0de0528:	4479      	add	r1, pc
c0de052a:	f00a fd77 	bl	c0deb01c <strcmp>
c0de052e:	b110      	cbz	r0, c0de0536 <handler_sign_tx+0x11a>
c0de0530:	f000 fd03 	bl	c0de0f3a <ui_display_transaction>
c0de0534:	e7f1      	b.n	c0de051a <handler_sign_tx+0xfe>
c0de0536:	f000 fcfd 	bl	c0de0f34 <ui_display_blind_signed_transaction>
c0de053a:	e7ee      	b.n	c0de051a <handler_sign_tx+0xfe>
c0de053c:	00000000 	.word	0x00000000
c0de0540:	0000c0ca 	.word	0x0000c0ca

c0de0544 <io_send_sw>:
c0de0544:	b580      	push	{r7, lr}
c0de0546:	4602      	mov	r2, r0
c0de0548:	2000      	movs	r0, #0
c0de054a:	2100      	movs	r1, #0
c0de054c:	f009 fee0 	bl	c0dea310 <io_send_response_buffers>
c0de0550:	bd80      	pop	{r7, pc}

c0de0552 <handler_cmd_dummy>:
c0de0552:	b580      	push	{r7, lr}
c0de0554:	e9d0 2100 	ldrd	r2, r1, [r0]
c0de0558:	4610      	mov	r0, r2
c0de055a:	f000 f802 	bl	c0de0562 <io_send_response_pointer>
c0de055e:	2000      	movs	r0, #0
c0de0560:	bd80      	pop	{r7, pc}

c0de0562 <io_send_response_pointer>:
c0de0562:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de0564:	2200      	movs	r2, #0
c0de0566:	ab01      	add	r3, sp, #4
c0de0568:	c307      	stmia	r3!, {r0, r1, r2}
c0de056a:	a801      	add	r0, sp, #4
c0de056c:	2101      	movs	r1, #1
c0de056e:	f44f 4210 	mov.w	r2, #36864	@ 0x9000
c0de0572:	f009 fecd 	bl	c0dea310 <io_send_response_buffers>
c0de0576:	bd8f      	pop	{r0, r1, r2, r3, r7, pc}

c0de0578 <io_send_sw>:
c0de0578:	b580      	push	{r7, lr}
c0de057a:	4602      	mov	r2, r0
c0de057c:	2000      	movs	r0, #0
c0de057e:	2100      	movs	r1, #0
c0de0580:	f009 fec6 	bl	c0dea310 <io_send_response_buffers>
c0de0584:	bd80      	pop	{r7, pc}

c0de0586 <handler_cmd_keccakH>:
c0de0586:	b5b0      	push	{r4, r5, r7, lr}
c0de0588:	b0f2      	sub	sp, #456	@ 0x1c8
c0de058a:	466d      	mov	r5, sp
c0de058c:	4604      	mov	r4, r0
c0de058e:	4628      	mov	r0, r5
c0de0590:	f000 fcd6 	bl	c0de0f40 <keccak_init>
c0de0594:	88a2      	ldrh	r2, [r4, #4]
c0de0596:	6821      	ldr	r1, [r4, #0]
c0de0598:	4628      	mov	r0, r5
c0de059a:	f000 fcd5 	bl	c0de0f48 <keccak_update>
c0de059e:	ac6a      	add	r4, sp, #424	@ 0x1a8
c0de05a0:	4628      	mov	r0, r5
c0de05a2:	4621      	mov	r1, r4
c0de05a4:	f000 fcd2 	bl	c0de0f4c <keccak_final>
c0de05a8:	4620      	mov	r0, r4
c0de05aa:	2120      	movs	r1, #32
c0de05ac:	f7ff ffd9 	bl	c0de0562 <io_send_response_pointer>
c0de05b0:	2000      	movs	r0, #0
c0de05b2:	b072      	add	sp, #456	@ 0x1c8
c0de05b4:	bdb0      	pop	{r4, r5, r7, pc}
	...

c0de05b8 <handler_cmd_keccak_prng>:
c0de05b8:	b510      	push	{r4, lr}
c0de05ba:	b090      	sub	sp, #64	@ 0x40
c0de05bc:	2980      	cmp	r1, #128	@ 0x80
c0de05be:	d007      	beq.n	c0de05d0 <handler_cmd_keccak_prng+0x18>
c0de05c0:	2901      	cmp	r1, #1
c0de05c2:	d017      	beq.n	c0de05f4 <handler_cmd_keccak_prng+0x3c>
c0de05c4:	bb11      	cbnz	r1, c0de060c <handler_cmd_keccak_prng+0x54>
c0de05c6:	4817      	ldr	r0, [pc, #92]	@ (c0de0624 <handler_cmd_keccak_prng+0x6c>)
c0de05c8:	4448      	add	r0, r9
c0de05ca:	f000 fcc1 	bl	c0de0f50 <inner_keccak256_init>
c0de05ce:	e019      	b.n	c0de0604 <handler_cmd_keccak_prng+0x4c>
c0de05d0:	4c14      	ldr	r4, [pc, #80]	@ (c0de0624 <handler_cmd_keccak_prng+0x6c>)
c0de05d2:	eb09 0004 	add.w	r0, r9, r4
c0de05d6:	f000 fcde 	bl	c0de0f96 <inner_keccak256_flip>
c0de05da:	b9a0      	cbnz	r0, c0de0606 <handler_cmd_keccak_prng+0x4e>
c0de05dc:	eb09 0004 	add.w	r0, r9, r4
c0de05e0:	4669      	mov	r1, sp
c0de05e2:	2240      	movs	r2, #64	@ 0x40
c0de05e4:	f000 fced 	bl	c0de0fc2 <inner_keccak256_extract>
c0de05e8:	b968      	cbnz	r0, c0de0606 <handler_cmd_keccak_prng+0x4e>
c0de05ea:	4668      	mov	r0, sp
c0de05ec:	2140      	movs	r1, #64	@ 0x40
c0de05ee:	f7ff ffb8 	bl	c0de0562 <io_send_response_pointer>
c0de05f2:	e014      	b.n	c0de061e <handler_cmd_keccak_prng+0x66>
c0de05f4:	490b      	ldr	r1, [pc, #44]	@ (c0de0624 <handler_cmd_keccak_prng+0x6c>)
c0de05f6:	eb09 0301 	add.w	r3, r9, r1
c0de05fa:	e9d0 1200 	ldrd	r1, r2, [r0]
c0de05fe:	4618      	mov	r0, r3
c0de0600:	f000 fcb7 	bl	c0de0f72 <inner_keccak256_inject>
c0de0604:	b148      	cbz	r0, c0de061a <handler_cmd_keccak_prng+0x62>
c0de0606:	f000 f957 	bl	c0de08b8 <OUTLINED_FUNCTION_1>
c0de060a:	e009      	b.n	c0de0620 <handler_cmd_keccak_prng+0x68>
c0de060c:	f646 2086 	movw	r0, #27270	@ 0x6a86
c0de0610:	b010      	add	sp, #64	@ 0x40
c0de0612:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de0616:	f7ff bfaf 	b.w	c0de0578 <io_send_sw>
c0de061a:	f000 f949 	bl	c0de08b0 <OUTLINED_FUNCTION_0>
c0de061e:	2000      	movs	r0, #0
c0de0620:	b010      	add	sp, #64	@ 0x40
c0de0622:	bd10      	pop	{r4, pc}
c0de0624:	000002d8 	.word	0x000002d8

c0de0628 <handler_cmd_sample_in_ball>:
c0de0628:	b510      	push	{r4, lr}
c0de062a:	f5ad 6d80 	sub.w	sp, sp, #1024	@ 0x400
c0de062e:	6801      	ldr	r1, [r0, #0]
c0de0630:	466c      	mov	r4, sp
c0de0632:	4620      	mov	r0, r4
c0de0634:	f001 fc29 	bl	c0de1e8a <pqcrystals_dilithium2_lowram_poly_challenge_eth>
c0de0638:	4620      	mov	r0, r4
c0de063a:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de063e:	f7ff ff90 	bl	c0de0562 <io_send_response_pointer>
c0de0642:	2000      	movs	r0, #0
c0de0644:	f50d 6d80 	add.w	sp, sp, #1024	@ 0x400
c0de0648:	bd10      	pop	{r4, pc}
	...

c0de064c <handler_cmd_keygen_core_dilithium>:
c0de064c:	b580      	push	{r7, lr}
c0de064e:	f5ad 6d72 	sub.w	sp, sp, #3872	@ 0xf20
c0de0652:	480a      	ldr	r0, [pc, #40]	@ (c0de067c <handler_cmd_keygen_core_dilithium+0x30>)
c0de0654:	f241 1154 	movw	r1, #4436	@ 0x1154
c0de0658:	4448      	add	r0, r9
c0de065a:	1842      	adds	r2, r0, r1
c0de065c:	f50d 6020 	add.w	r0, sp, #2560	@ 0xa00
c0de0660:	4669      	mov	r1, sp
c0de0662:	f001 fdc5 	bl	c0de21f0 <crypto_sign_keypair_core>
c0de0666:	b110      	cbz	r0, c0de066e <handler_cmd_keygen_core_dilithium+0x22>
c0de0668:	f000 f926 	bl	c0de08b8 <OUTLINED_FUNCTION_1>
c0de066c:	e002      	b.n	c0de0674 <handler_cmd_keygen_core_dilithium+0x28>
c0de066e:	f000 f91f 	bl	c0de08b0 <OUTLINED_FUNCTION_0>
c0de0672:	2000      	movs	r0, #0
c0de0674:	f50d 6d72 	add.w	sp, sp, #3872	@ 0xf20
c0de0678:	bd80      	pop	{r7, pc}
c0de067a:	bf00      	nop
c0de067c:	000002d8 	.word	0x000002d8

c0de0680 <handler_cmd_keygen_dilithium>:
c0de0680:	b580      	push	{r7, lr}
c0de0682:	f5ad 6d72 	sub.w	sp, sp, #3872	@ 0xf20
c0de0686:	f50d 6020 	add.w	r0, sp, #2560	@ 0xa00
c0de068a:	4669      	mov	r1, sp
c0de068c:	f001 fd9f 	bl	c0de21ce <pqcrystals_dilithium2_lowram_keypair>
c0de0690:	b110      	cbz	r0, c0de0698 <handler_cmd_keygen_dilithium+0x18>
c0de0692:	f000 f911 	bl	c0de08b8 <OUTLINED_FUNCTION_1>
c0de0696:	e002      	b.n	c0de069e <handler_cmd_keygen_dilithium+0x1e>
c0de0698:	f000 f90a 	bl	c0de08b0 <OUTLINED_FUNCTION_0>
c0de069c:	2000      	movs	r0, #0
c0de069e:	f50d 6d72 	add.w	sp, sp, #3872	@ 0xf20
c0de06a2:	bd80      	pop	{r7, pc}

c0de06a4 <handler_cmd_sign_dilithium>:
c0de06a4:	b5b0      	push	{r4, r5, r7, lr}
c0de06a6:	f6ad 7d28 	subw	sp, sp, #3880	@ 0xf28
c0de06aa:	4604      	mov	r4, r0
c0de06ac:	2980      	cmp	r1, #128	@ 0x80
c0de06ae:	d016      	beq.n	c0de06de <handler_cmd_sign_dilithium+0x3a>
c0de06b0:	2901      	cmp	r1, #1
c0de06b2:	d026      	beq.n	c0de0702 <handler_cmd_sign_dilithium+0x5e>
c0de06b4:	bb69      	cbnz	r1, c0de0712 <handler_cmd_sign_dilithium+0x6e>
c0de06b6:	482c      	ldr	r0, [pc, #176]	@ (c0de0768 <handler_cmd_sign_dilithium+0xc4>)
c0de06b8:	f241 1154 	movw	r1, #4436	@ 0x1154
c0de06bc:	4448      	add	r0, r9
c0de06be:	1842      	adds	r2, r0, r1
c0de06c0:	f60d 2008 	addw	r0, sp, #2568	@ 0xa08
c0de06c4:	a902      	add	r1, sp, #8
c0de06c6:	f001 fd93 	bl	c0de21f0 <crypto_sign_keypair_core>
c0de06ca:	4604      	mov	r4, r0
c0de06cc:	2800      	cmp	r0, #0
c0de06ce:	d141      	bne.n	c0de0754 <handler_cmd_sign_dilithium+0xb0>
c0de06d0:	2000      	movs	r0, #0
c0de06d2:	2100      	movs	r1, #0
c0de06d4:	f001 fe6a 	bl	c0de23ac <crypto_sign_signature_init>
c0de06d8:	f000 f8ea 	bl	c0de08b0 <OUTLINED_FUNCTION_0>
c0de06dc:	e03a      	b.n	c0de0754 <handler_cmd_sign_dilithium+0xb0>
c0de06de:	4d22      	ldr	r5, [pc, #136]	@ (c0de0768 <handler_cmd_sign_dilithium+0xc4>)
c0de06e0:	f241 1154 	movw	r1, #4436	@ 0x1154
c0de06e4:	eb09 0005 	add.w	r0, r9, r5
c0de06e8:	1842      	adds	r2, r0, r1
c0de06ea:	f60d 2008 	addw	r0, sp, #2568	@ 0xa08
c0de06ee:	a902      	add	r1, sp, #8
c0de06f0:	f001 fd7e 	bl	c0de21f0 <crypto_sign_keypair_core>
c0de06f4:	bb78      	cbnz	r0, c0de0756 <handler_cmd_sign_dilithium+0xb2>
c0de06f6:	6860      	ldr	r0, [r4, #4]
c0de06f8:	2801      	cmp	r0, #1
c0de06fa:	d812      	bhi.n	c0de0722 <handler_cmd_sign_dilithium+0x7e>
c0de06fc:	f646 2087 	movw	r0, #27271	@ 0x6a87
c0de0700:	e02b      	b.n	c0de075a <handler_cmd_sign_dilithium+0xb6>
c0de0702:	e9d4 0100 	ldrd	r0, r1, [r4]
c0de0706:	f001 fe7d 	bl	c0de2404 <crypto_sign_signature_absorb>
c0de070a:	bb20      	cbnz	r0, c0de0756 <handler_cmd_sign_dilithium+0xb2>
c0de070c:	f000 f8d0 	bl	c0de08b0 <OUTLINED_FUNCTION_0>
c0de0710:	e026      	b.n	c0de0760 <handler_cmd_sign_dilithium+0xbc>
c0de0712:	f646 2086 	movw	r0, #27270	@ 0x6a86
c0de0716:	f60d 7d28 	addw	sp, sp, #3880	@ 0xf28
c0de071a:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
c0de071e:	f7ff bf2b 	b.w	c0de0578 <io_send_sw>
c0de0722:	3802      	subs	r0, #2
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
c0de073c:	f001 fe6a 	bl	c0de2414 <crypto_sign_signature_core>
c0de0740:	4604      	mov	r4, r0
c0de0742:	b938      	cbnz	r0, c0de0754 <handler_cmd_sign_dilithium+0xb0>
c0de0744:	eb09 0005 	add.w	r0, r9, r5
c0de0748:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de074c:	f500 60fc 	add.w	r0, r0, #2016	@ 0x7e0
c0de0750:	f7ff ff07 	bl	c0de0562 <io_send_response_pointer>
c0de0754:	b124      	cbz	r4, c0de0760 <handler_cmd_sign_dilithium+0xbc>
c0de0756:	f24b 0005 	movw	r0, #45061	@ 0xb005
c0de075a:	f7ff ff0d 	bl	c0de0578 <io_send_sw>
c0de075e:	e000      	b.n	c0de0762 <handler_cmd_sign_dilithium+0xbe>
c0de0760:	2000      	movs	r0, #0
c0de0762:	f60d 7d28 	addw	sp, sp, #3880	@ 0xf28
c0de0766:	bdb0      	pop	{r4, r5, r7, pc}
c0de0768:	000002d8 	.word	0x000002d8

c0de076c <handler_cmd_verify_dilithium>:
c0de076c:	b580      	push	{r7, lr}
c0de076e:	b08e      	sub	sp, #56	@ 0x38
c0de0770:	480d      	ldr	r0, [pc, #52]	@ (c0de07a8 <handler_cmd_verify_dilithium+0x3c>)
c0de0772:	2100      	movs	r1, #0
c0de0774:	f640 1395 	movw	r3, #2453	@ 0x995
c0de0778:	e9cd 1100 	strd	r1, r1, [sp]
c0de077c:	4478      	add	r0, pc
c0de077e:	9002      	str	r0, [sp, #8]
c0de0780:	a904      	add	r1, sp, #16
c0de0782:	4a0a      	ldr	r2, [pc, #40]	@ (c0de07ac <handler_cmd_verify_dilithium+0x40>)
c0de0784:	f10d 0017 	add.w	r0, sp, #23
c0de0788:	447a      	add	r2, pc
c0de078a:	f002 f8e9 	bl	c0de2960 <pqcrystals_dilithium2_lowram_open>
c0de078e:	b110      	cbz	r0, c0de0796 <handler_cmd_verify_dilithium+0x2a>
c0de0790:	f000 f892 	bl	c0de08b8 <OUTLINED_FUNCTION_1>
c0de0794:	e005      	b.n	c0de07a2 <handler_cmd_verify_dilithium+0x36>
c0de0796:	9904      	ldr	r1, [sp, #16]
c0de0798:	f10d 0017 	add.w	r0, sp, #23
c0de079c:	f7ff fee1 	bl	c0de0562 <io_send_response_pointer>
c0de07a0:	2000      	movs	r0, #0
c0de07a2:	b00e      	add	sp, #56	@ 0x38
c0de07a4:	bd80      	pop	{r7, pc}
c0de07a6:	bf00      	nop
c0de07a8:	0000d195 	.word	0x0000d195
c0de07ac:	0000c7f4 	.word	0x0000c7f4

c0de07b0 <handler_cmd_get_sig_chunk>:
c0de07b0:	b580      	push	{r7, lr}
c0de07b2:	4806      	ldr	r0, [pc, #24]	@ (c0de07cc <handler_cmd_get_sig_chunk+0x1c>)
c0de07b4:	ebc1 2101 	rsb	r1, r1, r1, lsl #8
c0de07b8:	4448      	add	r0, r9
c0de07ba:	4408      	add	r0, r1
c0de07bc:	4611      	mov	r1, r2
c0de07be:	f500 60fc 	add.w	r0, r0, #2016	@ 0x7e0
c0de07c2:	f7ff fece 	bl	c0de0562 <io_send_response_pointer>
c0de07c6:	2000      	movs	r0, #0
c0de07c8:	bd80      	pop	{r7, pc}
c0de07ca:	bf00      	nop
c0de07cc:	000002d8 	.word	0x000002d8

c0de07d0 <handler_cmd_get_pk_chunk>:
c0de07d0:	b580      	push	{r7, lr}
c0de07d2:	4806      	ldr	r0, [pc, #24]	@ (c0de07ec <handler_cmd_get_pk_chunk+0x1c>)
c0de07d4:	ebc1 2101 	rsb	r1, r1, r1, lsl #8
c0de07d8:	4448      	add	r0, r9
c0de07da:	4408      	add	r0, r1
c0de07dc:	4611      	mov	r1, r2
c0de07de:	f500 7030 	add.w	r0, r0, #704	@ 0x2c0
c0de07e2:	f7ff febe 	bl	c0de0562 <io_send_response_pointer>
c0de07e6:	2000      	movs	r0, #0
c0de07e8:	bd80      	pop	{r7, pc}
c0de07ea:	bf00      	nop
c0de07ec:	000002d8 	.word	0x000002d8

c0de07f0 <handler_get_mldsa_seed>:
c0de07f0:	b570      	push	{r4, r5, r6, lr}
c0de07f2:	b0f0      	sub	sp, #448	@ 0x1c0
c0de07f4:	4e2c      	ldr	r6, [pc, #176]	@ (c0de08a8 <handler_get_mldsa_seed+0xb8>)
c0de07f6:	4604      	mov	r4, r0
c0de07f8:	f44f 7136 	mov.w	r1, #728	@ 0x2d8
c0de07fc:	eb09 0506 	add.w	r5, r9, r6
c0de0800:	4628      	mov	r0, r5
c0de0802:	f00a fbc7 	bl	c0deaf94 <explicit_bzero>
c0de0806:	2000      	movs	r0, #0
c0de0808:	f505 7135 	add.w	r1, r5, #724	@ 0x2d4
c0de080c:	f809 0006 	strb.w	r0, [r9, r6]
c0de0810:	f885 02a8 	strb.w	r0, [r5, #680]	@ 0x2a8
c0de0814:	4620      	mov	r0, r4
c0de0816:	f009 fb27 	bl	c0de9e68 <buffer_read_u8>
c0de081a:	b308      	cbz	r0, c0de0860 <handler_get_mldsa_seed+0x70>
c0de081c:	eb09 0006 	add.w	r0, r9, r6
c0de0820:	f890 22d4 	ldrb.w	r2, [r0, #724]	@ 0x2d4
c0de0824:	f500 712b 	add.w	r1, r0, #684	@ 0x2ac
c0de0828:	4620      	mov	r0, r4
c0de082a:	f009 fb70 	bl	c0de9f0e <buffer_read_bip32_path>
c0de082e:	b1b8      	cbz	r0, c0de0860 <handler_get_mldsa_seed+0x70>
c0de0830:	eb09 0006 	add.w	r0, r9, r6
c0de0834:	2100      	movs	r1, #0
c0de0836:	2205      	movs	r2, #5
c0de0838:	f890 32d4 	ldrb.w	r3, [r0, #724]	@ 0x2d4
c0de083c:	e9cd 2102 	strd	r2, r1, [sp, #8]
c0de0840:	9104      	str	r1, [sp, #16]
c0de0842:	f100 0449 	add.w	r4, r0, #73	@ 0x49
c0de0846:	f100 0508 	add.w	r5, r0, #8
c0de084a:	f500 722b 	add.w	r2, r0, #684	@ 0x2ac
c0de084e:	2000      	movs	r0, #0
c0de0850:	2121      	movs	r1, #33	@ 0x21
c0de0852:	e9cd 5400 	strd	r5, r4, [sp]
c0de0856:	f009 fc1b 	bl	c0dea090 <bip32_derive_with_seed_get_pubkey_256>
c0de085a:	b140      	cbz	r0, c0de086e <handler_get_mldsa_seed+0x7e>
c0de085c:	b280      	uxth	r0, r0
c0de085e:	e001      	b.n	c0de0864 <handler_get_mldsa_seed+0x74>
c0de0860:	f646 2087 	movw	r0, #27271	@ 0x6a87
c0de0864:	b070      	add	sp, #448	@ 0x1c0
c0de0866:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de086a:	f7ff be85 	b.w	c0de0578 <io_send_sw>
c0de086e:	ac06      	add	r4, sp, #24
c0de0870:	4620      	mov	r0, r4
c0de0872:	f000 fb65 	bl	c0de0f40 <keccak_init>
c0de0876:	eb09 0006 	add.w	r0, r9, r6
c0de087a:	2241      	movs	r2, #65	@ 0x41
c0de087c:	f100 0108 	add.w	r1, r0, #8
c0de0880:	4620      	mov	r0, r4
c0de0882:	f000 fb61 	bl	c0de0f48 <keccak_update>
c0de0886:	4809      	ldr	r0, [pc, #36]	@ (c0de08ac <handler_get_mldsa_seed+0xbc>)
c0de0888:	f241 1154 	movw	r1, #4436	@ 0x1154
c0de088c:	4448      	add	r0, r9
c0de088e:	1845      	adds	r5, r0, r1
c0de0890:	4620      	mov	r0, r4
c0de0892:	4629      	mov	r1, r5
c0de0894:	f000 fb5a 	bl	c0de0f4c <keccak_final>
c0de0898:	4628      	mov	r0, r5
c0de089a:	2120      	movs	r1, #32
c0de089c:	f7ff fe61 	bl	c0de0562 <io_send_response_pointer>
c0de08a0:	2000      	movs	r0, #0
c0de08a2:	b070      	add	sp, #448	@ 0x1c0
c0de08a4:	bd70      	pop	{r4, r5, r6, pc}
c0de08a6:	bf00      	nop
c0de08a8:	00000000 	.word	0x00000000
c0de08ac:	000002d8 	.word	0x000002d8

c0de08b0 <OUTLINED_FUNCTION_0>:
c0de08b0:	f44f 4010 	mov.w	r0, #36864	@ 0x9000
c0de08b4:	f7ff be60 	b.w	c0de0578 <io_send_sw>

c0de08b8 <OUTLINED_FUNCTION_1>:
c0de08b8:	f24b 0005 	movw	r0, #45061	@ 0xb005
c0de08bc:	f7ff be5c 	b.w	c0de0578 <io_send_sw>

c0de08c0 <helper_send_response_pubkey>:
c0de08c0:	b5b0      	push	{r4, r5, r7, lr}
c0de08c2:	b09a      	sub	sp, #104	@ 0x68
c0de08c4:	2041      	movs	r0, #65	@ 0x41
c0de08c6:	f10d 0405 	add.w	r4, sp, #5
c0de08ca:	2241      	movs	r2, #65	@ 0x41
c0de08cc:	f88d 0005 	strb.w	r0, [sp, #5]
c0de08d0:	480b      	ldr	r0, [pc, #44]	@ (c0de0900 <helper_send_response_pubkey+0x40>)
c0de08d2:	eb09 0500 	add.w	r5, r9, r0
c0de08d6:	1c60      	adds	r0, r4, #1
c0de08d8:	f105 0108 	add.w	r1, r5, #8
c0de08dc:	f00a fb42 	bl	c0deaf64 <__aeabi_memcpy>
c0de08e0:	2020      	movs	r0, #32
c0de08e2:	f105 0149 	add.w	r1, r5, #73	@ 0x49
c0de08e6:	2220      	movs	r2, #32
c0de08e8:	f88d 0047 	strb.w	r0, [sp, #71]	@ 0x47
c0de08ec:	f104 0043 	add.w	r0, r4, #67	@ 0x43
c0de08f0:	f00a fb38 	bl	c0deaf64 <__aeabi_memcpy>
c0de08f4:	4620      	mov	r0, r4
c0de08f6:	2163      	movs	r1, #99	@ 0x63
c0de08f8:	f000 f804 	bl	c0de0904 <io_send_response_pointer>
c0de08fc:	b01a      	add	sp, #104	@ 0x68
c0de08fe:	bdb0      	pop	{r4, r5, r7, pc}
c0de0900:	00000000 	.word	0x00000000

c0de0904 <io_send_response_pointer>:
c0de0904:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de0906:	2200      	movs	r2, #0
c0de0908:	ab01      	add	r3, sp, #4
c0de090a:	c307      	stmia	r3!, {r0, r1, r2}
c0de090c:	a801      	add	r0, sp, #4
c0de090e:	2101      	movs	r1, #1
c0de0910:	f44f 4210 	mov.w	r2, #36864	@ 0x9000
c0de0914:	f009 fcfc 	bl	c0dea310 <io_send_response_buffers>
c0de0918:	b004      	add	sp, #16
c0de091a:	bd80      	pop	{r7, pc}

c0de091c <helper_send_response_sig>:
c0de091c:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de091e:	b093      	sub	sp, #76	@ 0x4c
c0de0920:	f10d 0402 	add.w	r4, sp, #2
c0de0924:	2149      	movs	r1, #73	@ 0x49
c0de0926:	1c65      	adds	r5, r4, #1
c0de0928:	4628      	mov	r0, r5
c0de092a:	f00a fb25 	bl	c0deaf78 <__aeabi_memclr>
c0de092e:	480b      	ldr	r0, [pc, #44]	@ (c0de095c <helper_send_response_sig+0x40>)
c0de0930:	eb09 0700 	add.w	r7, r9, r0
c0de0934:	4628      	mov	r0, r5
c0de0936:	f897 62a0 	ldrb.w	r6, [r7, #672]	@ 0x2a0
c0de093a:	f507 7116 	add.w	r1, r7, #600	@ 0x258
c0de093e:	4632      	mov	r2, r6
c0de0940:	f88d 6002 	strb.w	r6, [sp, #2]
c0de0944:	f00a fb0e 	bl	c0deaf64 <__aeabi_memcpy>
c0de0948:	f897 12a1 	ldrb.w	r1, [r7, #673]	@ 0x2a1
c0de094c:	1930      	adds	r0, r6, r4
c0de094e:	7041      	strb	r1, [r0, #1]
c0de0950:	1cb1      	adds	r1, r6, #2
c0de0952:	4620      	mov	r0, r4
c0de0954:	f7ff ffd6 	bl	c0de0904 <io_send_response_pointer>
c0de0958:	b013      	add	sp, #76	@ 0x4c
c0de095a:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de095c:	00000000 	.word	0x00000000

c0de0960 <transaction_deserialize>:
c0de0960:	b570      	push	{r4, r5, r6, lr}
c0de0962:	460d      	mov	r5, r1
c0de0964:	4604      	mov	r4, r0
c0de0966:	b910      	cbnz	r0, c0de096e <transaction_deserialize+0xe>
c0de0968:	2001      	movs	r0, #1
c0de096a:	f009 fec3 	bl	c0dea6f4 <assert_exit>
c0de096e:	b915      	cbnz	r5, c0de0976 <transaction_deserialize+0x16>
c0de0970:	2001      	movs	r0, #1
c0de0972:	f009 febf 	bl	c0dea6f4 <assert_exit>
c0de0976:	6860      	ldr	r0, [r4, #4]
c0de0978:	f5b0 7fff 	cmp.w	r0, #510	@ 0x1fe
c0de097c:	d901      	bls.n	c0de0982 <transaction_deserialize+0x22>
c0de097e:	20f9      	movs	r0, #249	@ 0xf9
c0de0980:	e04b      	b.n	c0de0a1a <transaction_deserialize+0xba>
c0de0982:	4620      	mov	r0, r4
c0de0984:	4629      	mov	r1, r5
c0de0986:	2200      	movs	r2, #0
c0de0988:	f009 fa84 	bl	c0de9e94 <buffer_read_u64>
c0de098c:	b330      	cbz	r0, c0de09dc <transaction_deserialize+0x7c>
c0de098e:	6820      	ldr	r0, [r4, #0]
c0de0990:	68a1      	ldr	r1, [r4, #8]
c0de0992:	4408      	add	r0, r1
c0de0994:	2114      	movs	r1, #20
c0de0996:	61a8      	str	r0, [r5, #24]
c0de0998:	4620      	mov	r0, r4
c0de099a:	f009 fa5a 	bl	c0de9e52 <buffer_seek_cur>
c0de099e:	b1f8      	cbz	r0, c0de09e0 <transaction_deserialize+0x80>
c0de09a0:	f105 0108 	add.w	r1, r5, #8
c0de09a4:	4620      	mov	r0, r4
c0de09a6:	2200      	movs	r2, #0
c0de09a8:	2600      	movs	r6, #0
c0de09aa:	f009 fa73 	bl	c0de9e94 <buffer_read_u64>
c0de09ae:	b1c8      	cbz	r0, c0de09e4 <transaction_deserialize+0x84>
c0de09b0:	f105 0120 	add.w	r1, r5, #32
c0de09b4:	4620      	mov	r0, r4
c0de09b6:	e9c5 6604 	strd	r6, r6, [r5, #16]
c0de09ba:	f009 fa8b 	bl	c0de9ed4 <buffer_read_varint>
c0de09be:	6a29      	ldr	r1, [r5, #32]
c0de09c0:	b990      	cbnz	r0, c0de09e8 <transaction_deserialize+0x88>
c0de09c2:	6a68      	ldr	r0, [r5, #36]	@ 0x24
c0de09c4:	ea5f 0050 	movs.w	r0, r0, lsr #1
c0de09c8:	ea4f 0231 	mov.w	r2, r1, rrx
c0de09cc:	2300      	movs	r3, #0
c0de09ce:	f1d2 02e8 	rsbs	r2, r2, #232	@ 0xe8
c0de09d2:	eb73 0000 	sbcs.w	r0, r3, r0
c0de09d6:	d207      	bcs.n	c0de09e8 <transaction_deserialize+0x88>
c0de09d8:	20fc      	movs	r0, #252	@ 0xfc
c0de09da:	e01e      	b.n	c0de0a1a <transaction_deserialize+0xba>
c0de09dc:	20ff      	movs	r0, #255	@ 0xff
c0de09de:	e01c      	b.n	c0de0a1a <transaction_deserialize+0xba>
c0de09e0:	20fe      	movs	r0, #254	@ 0xfe
c0de09e2:	e01a      	b.n	c0de0a1a <transaction_deserialize+0xba>
c0de09e4:	20fd      	movs	r0, #253	@ 0xfd
c0de09e6:	e018      	b.n	c0de0a1a <transaction_deserialize+0xba>
c0de09e8:	6820      	ldr	r0, [r4, #0]
c0de09ea:	68a2      	ldr	r2, [r4, #8]
c0de09ec:	4410      	add	r0, r2
c0de09ee:	61e8      	str	r0, [r5, #28]
c0de09f0:	4620      	mov	r0, r4
c0de09f2:	f009 fa2e 	bl	c0de9e52 <buffer_seek_cur>
c0de09f6:	b168      	cbz	r0, c0de0a14 <transaction_deserialize+0xb4>
c0de09f8:	f105 031c 	add.w	r3, r5, #28
c0de09fc:	cb0d      	ldmia	r3, {r0, r2, r3}
c0de09fe:	f000 f80e 	bl	c0de0a1e <transaction_utils_check_encoding>
c0de0a02:	b148      	cbz	r0, c0de0a18 <transaction_deserialize+0xb8>
c0de0a04:	e9d4 1201 	ldrd	r1, r2, [r4, #4]
c0de0a08:	f06f 0006 	mvn.w	r0, #6
c0de0a0c:	428a      	cmp	r2, r1
c0de0a0e:	bf08      	it	eq
c0de0a10:	2001      	moveq	r0, #1
c0de0a12:	e002      	b.n	c0de0a1a <transaction_deserialize+0xba>
c0de0a14:	20fb      	movs	r0, #251	@ 0xfb
c0de0a16:	e000      	b.n	c0de0a1a <transaction_deserialize+0xba>
c0de0a18:	20fa      	movs	r0, #250	@ 0xfa
c0de0a1a:	b240      	sxtb	r0, r0
c0de0a1c:	bd70      	pop	{r4, r5, r6, pc}

c0de0a1e <transaction_utils_check_encoding>:
c0de0a1e:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de0a20:	461c      	mov	r4, r3
c0de0a22:	4615      	mov	r5, r2
c0de0a24:	4606      	mov	r6, r0
c0de0a26:	b910      	cbnz	r0, c0de0a2e <transaction_utils_check_encoding+0x10>
c0de0a28:	2001      	movs	r0, #1
c0de0a2a:	f009 fe63 	bl	c0dea6f4 <assert_exit>
c0de0a2e:	2000      	movs	r0, #0
c0de0a30:	2300      	movs	r3, #0
c0de0a32:	4602      	mov	r2, r0
c0de0a34:	1b40      	subs	r0, r0, r5
c0de0a36:	4619      	mov	r1, r3
c0de0a38:	eb73 0004 	sbcs.w	r0, r3, r4
c0de0a3c:	d206      	bcs.n	c0de0a4c <transaction_utils_check_encoding+0x2e>
c0de0a3e:	56b7      	ldrsb	r7, [r6, r2]
c0de0a40:	1c50      	adds	r0, r2, #1
c0de0a42:	f141 0300 	adc.w	r3, r1, #0
c0de0a46:	f1b7 3fff 	cmp.w	r7, #4294967295	@ 0xffffffff
c0de0a4a:	dcf2      	bgt.n	c0de0a32 <transaction_utils_check_encoding+0x14>
c0de0a4c:	2000      	movs	r0, #0
c0de0a4e:	1b52      	subs	r2, r2, r5
c0de0a50:	41a1      	sbcs	r1, r4
c0de0a52:	bf28      	it	cs
c0de0a54:	2001      	movcs	r0, #1
c0de0a56:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}

c0de0a58 <validate_pubkey>:
c0de0a58:	b108      	cbz	r0, c0de0a5e <validate_pubkey+0x6>
c0de0a5a:	f7ff bf31 	b.w	c0de08c0 <helper_send_response_pubkey>
c0de0a5e:	f646 1085 	movw	r0, #27013	@ 0x6985
c0de0a62:	f000 b800 	b.w	c0de0a66 <io_send_sw>

c0de0a66 <io_send_sw>:
c0de0a66:	b580      	push	{r7, lr}
c0de0a68:	4602      	mov	r2, r0
c0de0a6a:	2000      	movs	r0, #0
c0de0a6c:	2100      	movs	r1, #0
c0de0a6e:	f009 fc4f 	bl	c0dea310 <io_send_response_buffers>
c0de0a72:	bd80      	pop	{r7, pc}

c0de0a74 <validate_transaction>:
c0de0a74:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de0a78:	b08c      	sub	sp, #48	@ 0x30
c0de0a7a:	b378      	cbz	r0, c0de0adc <validate_transaction+0x68>
c0de0a7c:	f8df 8094 	ldr.w	r8, [pc, #148]	@ c0de0b14 <validate_transaction+0xa0>
c0de0a80:	2002      	movs	r0, #2
c0de0a82:	2500      	movs	r5, #0
c0de0a84:	2720      	movs	r7, #32
c0de0a86:	2203      	movs	r2, #3
c0de0a88:	f240 6401 	movw	r4, #1537	@ 0x601
c0de0a8c:	f10d 0c2c 	add.w	ip, sp, #44	@ 0x2c
c0de0a90:	f10d 0e28 	add.w	lr, sp, #40	@ 0x28
c0de0a94:	950b      	str	r5, [sp, #44]	@ 0x2c
c0de0a96:	f809 0008 	strb.w	r0, [r9, r8]
c0de0a9a:	2048      	movs	r0, #72	@ 0x48
c0de0a9c:	900a      	str	r0, [sp, #40]	@ 0x28
c0de0a9e:	eb09 0008 	add.w	r0, r9, r8
c0de0aa2:	f890 32d4 	ldrb.w	r3, [r0, #724]	@ 0x2d4
c0de0aa6:	f500 710e 	add.w	r1, r0, #568	@ 0x238
c0de0aaa:	f500 7616 	add.w	r6, r0, #600	@ 0x258
c0de0aae:	e9cd 4200 	strd	r4, r2, [sp]
c0de0ab2:	f500 722b 	add.w	r2, r0, #684	@ 0x2ac
c0de0ab6:	2000      	movs	r0, #0
c0de0ab8:	9508      	str	r5, [sp, #32]
c0de0aba:	e9cd c506 	strd	ip, r5, [sp, #24]
c0de0abe:	e9cd 1702 	strd	r1, r7, [sp, #8]
c0de0ac2:	2121      	movs	r1, #33	@ 0x21
c0de0ac4:	e9cd 6e04 	strd	r6, lr, [sp, #16]
c0de0ac8:	f009 fb16 	bl	c0dea0f8 <bip32_derive_with_seed_ecdsa_sign_hash_256>
c0de0acc:	b188      	cbz	r0, c0de0af2 <validate_transaction+0x7e>
c0de0ace:	f24b 0008 	movw	r0, #45064	@ 0xb008
c0de0ad2:	f809 5008 	strb.w	r5, [r9, r8]
c0de0ad6:	f7ff ffc6 	bl	c0de0a66 <io_send_sw>
c0de0ada:	e017      	b.n	c0de0b0c <validate_transaction+0x98>
c0de0adc:	480d      	ldr	r0, [pc, #52]	@ (c0de0b14 <validate_transaction+0xa0>)
c0de0ade:	2100      	movs	r1, #0
c0de0ae0:	f809 1000 	strb.w	r1, [r9, r0]
c0de0ae4:	f646 1085 	movw	r0, #27013	@ 0x6985
c0de0ae8:	b00c      	add	sp, #48	@ 0x30
c0de0aea:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de0aee:	f7ff bfba 	b.w	c0de0a66 <io_send_sw>
c0de0af2:	990a      	ldr	r1, [sp, #40]	@ 0x28
c0de0af4:	eb09 0008 	add.w	r0, r9, r8
c0de0af8:	f880 12a0 	strb.w	r1, [r0, #672]	@ 0x2a0
c0de0afc:	f89d 102c 	ldrb.w	r1, [sp, #44]	@ 0x2c
c0de0b00:	f001 0101 	and.w	r1, r1, #1
c0de0b04:	f880 12a1 	strb.w	r1, [r0, #673]	@ 0x2a1
c0de0b08:	f7ff ff08 	bl	c0de091c <helper_send_response_sig>
c0de0b0c:	b00c      	add	sp, #48	@ 0x30
c0de0b0e:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de0b12:	bf00      	nop
c0de0b14:	00000000 	.word	0x00000000

c0de0b18 <app_quit>:
c0de0b18:	20ff      	movs	r0, #255	@ 0xff
c0de0b1a:	f00a f8b9 	bl	c0deac90 <os_sched_exit>
	...

c0de0b20 <ui_menu_main>:
c0de0b20:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
c0de0b22:	4c1b      	ldr	r4, [pc, #108]	@ (c0de0b90 <ui_menu_main+0x70>)
c0de0b24:	4819      	ldr	r0, [pc, #100]	@ (c0de0b8c <ui_menu_main+0x6c>)
c0de0b26:	447c      	add	r4, pc
c0de0b28:	eb09 0500 	add.w	r5, r9, r0
c0de0b2c:	f000 f8dc 	bl	c0de0ce8 <OUTLINED_FUNCTION_0>
c0de0b30:	2609      	movs	r6, #9
c0de0b32:	2114      	movs	r1, #20
c0de0b34:	73ae      	strb	r6, [r5, #14]
c0de0b36:	7369      	strb	r1, [r5, #13]
c0de0b38:	4916      	ldr	r1, [pc, #88]	@ (c0de0b94 <ui_menu_main+0x74>)
c0de0b3a:	4a17      	ldr	r2, [pc, #92]	@ (c0de0b98 <ui_menu_main+0x78>)
c0de0b3c:	4479      	add	r1, pc
c0de0b3e:	447a      	add	r2, pc
c0de0b40:	e9c5 2101 	strd	r2, r1, [r5, #4]
c0de0b44:	7800      	ldrb	r0, [r0, #0]
c0de0b46:	7328      	strb	r0, [r5, #12]
c0de0b48:	f000 f8ce 	bl	c0de0ce8 <OUTLINED_FUNCTION_0>
c0de0b4c:	2115      	movs	r1, #21
c0de0b4e:	76ae      	strb	r6, [r5, #26]
c0de0b50:	7669      	strb	r1, [r5, #25]
c0de0b52:	4912      	ldr	r1, [pc, #72]	@ (c0de0b9c <ui_menu_main+0x7c>)
c0de0b54:	4a12      	ldr	r2, [pc, #72]	@ (c0de0ba0 <ui_menu_main+0x80>)
c0de0b56:	4479      	add	r1, pc
c0de0b58:	447a      	add	r2, pc
c0de0b5a:	e9c5 2104 	strd	r2, r1, [r5, #16]
c0de0b5e:	2100      	movs	r1, #0
c0de0b60:	7840      	ldrb	r0, [r0, #1]
c0de0b62:	7628      	strb	r0, [r5, #24]
c0de0b64:	480f      	ldr	r0, [pc, #60]	@ (c0de0ba4 <ui_menu_main+0x84>)
c0de0b66:	4a10      	ldr	r2, [pc, #64]	@ (c0de0ba8 <ui_menu_main+0x88>)
c0de0b68:	4b10      	ldr	r3, [pc, #64]	@ (c0de0bac <ui_menu_main+0x8c>)
c0de0b6a:	4478      	add	r0, pc
c0de0b6c:	447a      	add	r2, pc
c0de0b6e:	447b      	add	r3, pc
c0de0b70:	e9cd 3200 	strd	r3, r2, [sp]
c0de0b74:	e9cd 1002 	strd	r1, r0, [sp, #8]
c0de0b78:	2200      	movs	r2, #0
c0de0b7a:	23ff      	movs	r3, #255	@ 0xff
c0de0b7c:	480c      	ldr	r0, [pc, #48]	@ (c0de0bb0 <ui_menu_main+0x90>)
c0de0b7e:	490d      	ldr	r1, [pc, #52]	@ (c0de0bb4 <ui_menu_main+0x94>)
c0de0b80:	4478      	add	r0, pc
c0de0b82:	4479      	add	r1, pc
c0de0b84:	f007 f9d8 	bl	c0de7f38 <nbgl_useCaseHomeAndSettings>
c0de0b88:	bd7f      	pop	{r0, r1, r2, r3, r4, r5, r6, pc}
c0de0b8a:	bf00      	nop
c0de0b8c:	00001450 	.word	0x00001450
c0de0b90:	0000dad6 	.word	0x0000dad6
c0de0b94:	0000bd19 	.word	0x0000bd19
c0de0b98:	0000c1e1 	.word	0x0000c1e1
c0de0b9c:	0000be90 	.word	0x0000be90
c0de0ba0:	0000ba1d 	.word	0x0000ba1d
c0de0ba4:	ffffffab 	.word	0xffffffab
c0de0ba8:	0000d2d4 	.word	0x0000d2d4
c0de0bac:	0000d2c6 	.word	0x0000d2c6
c0de0bb0:	0000c220 	.word	0x0000c220
c0de0bb4:	0000a771 	.word	0x0000a771

c0de0bb8 <controls_callback>:
c0de0bb8:	b5bf      	push	{r0, r1, r2, r3, r4, r5, r7, lr}
c0de0bba:	4c22      	ldr	r4, [pc, #136]	@ (c0de0c44 <controls_callback+0x8c>)
c0de0bbc:	2815      	cmp	r0, #21
c0de0bbe:	f809 2004 	strb.w	r2, [r9, r4]
c0de0bc2:	d011      	beq.n	c0de0be8 <controls_callback+0x30>
c0de0bc4:	2814      	cmp	r0, #20
c0de0bc6:	d12a      	bne.n	c0de0c1e <controls_callback+0x66>
c0de0bc8:	eb09 0504 	add.w	r5, r9, r4
c0de0bcc:	4c1e      	ldr	r4, [pc, #120]	@ (c0de0c48 <controls_callback+0x90>)
c0de0bce:	447c      	add	r4, pc
c0de0bd0:	f000 f88a 	bl	c0de0ce8 <OUTLINED_FUNCTION_0>
c0de0bd4:	7800      	ldrb	r0, [r0, #0]
c0de0bd6:	fab0 f080 	clz	r0, r0
c0de0bda:	0940      	lsrs	r0, r0, #5
c0de0bdc:	7328      	strb	r0, [r5, #12]
c0de0bde:	f88d 000f 	strb.w	r0, [sp, #15]
c0de0be2:	f000 f881 	bl	c0de0ce8 <OUTLINED_FUNCTION_0>
c0de0be6:	e015      	b.n	c0de0c14 <controls_callback+0x5c>
c0de0be8:	4818      	ldr	r0, [pc, #96]	@ (c0de0c4c <controls_callback+0x94>)
c0de0bea:	4478      	add	r0, pc
c0de0bec:	f009 ffa2 	bl	c0deab34 <pic>
c0de0bf0:	7840      	ldrb	r0, [r0, #1]
c0de0bf2:	b1a8      	cbz	r0, c0de0c20 <controls_callback+0x68>
c0de0bf4:	eb09 0504 	add.w	r5, r9, r4
c0de0bf8:	4c15      	ldr	r4, [pc, #84]	@ (c0de0c50 <controls_callback+0x98>)
c0de0bfa:	447c      	add	r4, pc
c0de0bfc:	f000 f874 	bl	c0de0ce8 <OUTLINED_FUNCTION_0>
c0de0c00:	7840      	ldrb	r0, [r0, #1]
c0de0c02:	fab0 f080 	clz	r0, r0
c0de0c06:	0940      	lsrs	r0, r0, #5
c0de0c08:	7628      	strb	r0, [r5, #24]
c0de0c0a:	f88d 000f 	strb.w	r0, [sp, #15]
c0de0c0e:	f000 f86b 	bl	c0de0ce8 <OUTLINED_FUNCTION_0>
c0de0c12:	3001      	adds	r0, #1
c0de0c14:	f10d 010f 	add.w	r1, sp, #15
c0de0c18:	2201      	movs	r2, #1
c0de0c1a:	f009 ffc5 	bl	c0deaba8 <nvm_write>
c0de0c1e:	bdbf      	pop	{r0, r1, r2, r3, r4, r5, r7, pc}
c0de0c20:	480c      	ldr	r0, [pc, #48]	@ (c0de0c54 <controls_callback+0x9c>)
c0de0c22:	490d      	ldr	r1, [pc, #52]	@ (c0de0c58 <controls_callback+0xa0>)
c0de0c24:	4478      	add	r0, pc
c0de0c26:	4479      	add	r1, pc
c0de0c28:	e9cd 1000 	strd	r1, r0, [sp]
c0de0c2c:	480b      	ldr	r0, [pc, #44]	@ (c0de0c5c <controls_callback+0xa4>)
c0de0c2e:	490c      	ldr	r1, [pc, #48]	@ (c0de0c60 <controls_callback+0xa8>)
c0de0c30:	4a0c      	ldr	r2, [pc, #48]	@ (c0de0c64 <controls_callback+0xac>)
c0de0c32:	4b0d      	ldr	r3, [pc, #52]	@ (c0de0c68 <controls_callback+0xb0>)
c0de0c34:	4478      	add	r0, pc
c0de0c36:	4479      	add	r1, pc
c0de0c38:	447a      	add	r2, pc
c0de0c3a:	447b      	add	r3, pc
c0de0c3c:	f007 fc58 	bl	c0de84f0 <nbgl_useCaseChoice>
c0de0c40:	bdbf      	pop	{r0, r1, r2, r3, r4, r5, r7, pc}
c0de0c42:	bf00      	nop
c0de0c44:	00001450 	.word	0x00001450
c0de0c48:	0000da2e 	.word	0x0000da2e
c0de0c4c:	0000da12 	.word	0x0000da12
c0de0c50:	0000da02 	.word	0x0000da02
c0de0c54:	00000045 	.word	0x00000045
c0de0c58:	0000be1f 	.word	0x0000be1f
c0de0c5c:	0000aff9 	.word	0x0000aff9
c0de0c60:	0000b93f 	.word	0x0000b93f
c0de0c64:	0000bb8e 	.word	0x0000bb8e
c0de0c68:	0000c0ed 	.word	0x0000c0ed

c0de0c6c <review_warning_choice>:
c0de0c6c:	b5b0      	push	{r4, r5, r7, lr}
c0de0c6e:	b086      	sub	sp, #24
c0de0c70:	b1a8      	cbz	r0, c0de0c9e <review_warning_choice+0x32>
c0de0c72:	4c17      	ldr	r4, [pc, #92]	@ (c0de0cd0 <review_warning_choice+0x64>)
c0de0c74:	4815      	ldr	r0, [pc, #84]	@ (c0de0ccc <review_warning_choice+0x60>)
c0de0c76:	447c      	add	r4, pc
c0de0c78:	eb09 0500 	add.w	r5, r9, r0
c0de0c7c:	f000 f834 	bl	c0de0ce8 <OUTLINED_FUNCTION_0>
c0de0c80:	7840      	ldrb	r0, [r0, #1]
c0de0c82:	fab0 f080 	clz	r0, r0
c0de0c86:	0940      	lsrs	r0, r0, #5
c0de0c88:	7628      	strb	r0, [r5, #24]
c0de0c8a:	f88d 0017 	strb.w	r0, [sp, #23]
c0de0c8e:	f000 f82b 	bl	c0de0ce8 <OUTLINED_FUNCTION_0>
c0de0c92:	3001      	adds	r0, #1
c0de0c94:	f10d 0117 	add.w	r1, sp, #23
c0de0c98:	2201      	movs	r2, #1
c0de0c9a:	f009 ff85 	bl	c0deaba8 <nvm_write>
c0de0c9e:	480b      	ldr	r0, [pc, #44]	@ (c0de0ccc <review_warning_choice+0x60>)
c0de0ca0:	2100      	movs	r1, #0
c0de0ca2:	f819 3000 	ldrb.w	r3, [r9, r0]
c0de0ca6:	480b      	ldr	r0, [pc, #44]	@ (c0de0cd4 <review_warning_choice+0x68>)
c0de0ca8:	4a0b      	ldr	r2, [pc, #44]	@ (c0de0cd8 <review_warning_choice+0x6c>)
c0de0caa:	4c0c      	ldr	r4, [pc, #48]	@ (c0de0cdc <review_warning_choice+0x70>)
c0de0cac:	4478      	add	r0, pc
c0de0cae:	447a      	add	r2, pc
c0de0cb0:	447c      	add	r4, pc
c0de0cb2:	e9cd 4200 	strd	r4, r2, [sp]
c0de0cb6:	e9cd 1002 	strd	r1, r0, [sp, #8]
c0de0cba:	2200      	movs	r2, #0
c0de0cbc:	4808      	ldr	r0, [pc, #32]	@ (c0de0ce0 <review_warning_choice+0x74>)
c0de0cbe:	4909      	ldr	r1, [pc, #36]	@ (c0de0ce4 <review_warning_choice+0x78>)
c0de0cc0:	4478      	add	r0, pc
c0de0cc2:	4479      	add	r1, pc
c0de0cc4:	f007 f938 	bl	c0de7f38 <nbgl_useCaseHomeAndSettings>
c0de0cc8:	b006      	add	sp, #24
c0de0cca:	bdb0      	pop	{r4, r5, r7, pc}
c0de0ccc:	00001450 	.word	0x00001450
c0de0cd0:	0000d986 	.word	0x0000d986
c0de0cd4:	fffffe69 	.word	0xfffffe69
c0de0cd8:	0000d192 	.word	0x0000d192
c0de0cdc:	0000d184 	.word	0x0000d184
c0de0ce0:	0000c0e0 	.word	0x0000c0e0
c0de0ce4:	0000a631 	.word	0x0000a631

c0de0ce8 <OUTLINED_FUNCTION_0>:
c0de0ce8:	4620      	mov	r0, r4
c0de0cea:	f009 bf23 	b.w	c0deab34 <pic>
	...

c0de0cf0 <ui_display_address>:
c0de0cf0:	b570      	push	{r4, r5, r6, lr}
c0de0cf2:	b088      	sub	sp, #32
c0de0cf4:	4e22      	ldr	r6, [pc, #136]	@ (c0de0d80 <ui_display_address+0x90>)
c0de0cf6:	eb09 0106 	add.w	r1, r9, r6
c0de0cfa:	f819 0006 	ldrb.w	r0, [r9, r6]
c0de0cfe:	f891 12a8 	ldrb.w	r1, [r1, #680]	@ 0x2a8
c0de0d02:	4308      	orrs	r0, r1
c0de0d04:	d12a      	bne.n	c0de0d5c <ui_display_address+0x6c>
c0de0d06:	4d1f      	ldr	r5, [pc, #124]	@ (c0de0d84 <ui_display_address+0x94>)
c0de0d08:	212b      	movs	r1, #43	@ 0x2b
c0de0d0a:	eb09 0005 	add.w	r0, r9, r5
c0de0d0e:	f00a f933 	bl	c0deaf78 <__aeabi_memclr>
c0de0d12:	ac03      	add	r4, sp, #12
c0de0d14:	2114      	movs	r1, #20
c0de0d16:	4620      	mov	r0, r4
c0de0d18:	f00a f92e 	bl	c0deaf78 <__aeabi_memclr>
c0de0d1c:	eb09 0006 	add.w	r0, r9, r6
c0de0d20:	4621      	mov	r1, r4
c0de0d22:	2214      	movs	r2, #20
c0de0d24:	3008      	adds	r0, #8
c0de0d26:	f7ff f975 	bl	c0de0014 <address_from_pubkey>
c0de0d2a:	b308      	cbz	r0, c0de0d70 <ui_display_address+0x80>
c0de0d2c:	eb09 0205 	add.w	r2, r9, r5
c0de0d30:	a803      	add	r0, sp, #12
c0de0d32:	2114      	movs	r1, #20
c0de0d34:	232b      	movs	r3, #43	@ 0x2b
c0de0d36:	f009 fa89 	bl	c0dea24c <format_hex>
c0de0d3a:	3001      	adds	r0, #1
c0de0d3c:	d018      	beq.n	c0de0d70 <ui_display_address+0x80>
c0de0d3e:	4812      	ldr	r0, [pc, #72]	@ (c0de0d88 <ui_display_address+0x98>)
c0de0d40:	2400      	movs	r4, #0
c0de0d42:	2100      	movs	r1, #0
c0de0d44:	4478      	add	r0, pc
c0de0d46:	e9cd 4000 	strd	r4, r0, [sp]
c0de0d4a:	eb09 0005 	add.w	r0, r9, r5
c0de0d4e:	4a0f      	ldr	r2, [pc, #60]	@ (c0de0d8c <ui_display_address+0x9c>)
c0de0d50:	4b0f      	ldr	r3, [pc, #60]	@ (c0de0d90 <ui_display_address+0xa0>)
c0de0d52:	447a      	add	r2, pc
c0de0d54:	447b      	add	r3, pc
c0de0d56:	f008 f941 	bl	c0de8fdc <nbgl_useCaseAddressReview>
c0de0d5a:	e00e      	b.n	c0de0d7a <ui_display_address+0x8a>
c0de0d5c:	2000      	movs	r0, #0
c0de0d5e:	f809 0006 	strb.w	r0, [r9, r6]
c0de0d62:	f24b 0007 	movw	r0, #45063	@ 0xb007
c0de0d66:	b008      	add	sp, #32
c0de0d68:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de0d6c:	f000 b812 	b.w	c0de0d94 <io_send_sw>
c0de0d70:	f24b 0002 	movw	r0, #45058	@ 0xb002
c0de0d74:	f000 f80e 	bl	c0de0d94 <io_send_sw>
c0de0d78:	4604      	mov	r4, r0
c0de0d7a:	4620      	mov	r0, r4
c0de0d7c:	b008      	add	sp, #32
c0de0d7e:	bd70      	pop	{r4, r5, r6, pc}
c0de0d80:	00000000 	.word	0x00000000
c0de0d84:	0000146c 	.word	0x0000146c
c0de0d88:	0000005d 	.word	0x0000005d
c0de0d8c:	0000a5a1 	.word	0x0000a5a1
c0de0d90:	0000c0d6 	.word	0x0000c0d6

c0de0d94 <io_send_sw>:
c0de0d94:	b580      	push	{r7, lr}
c0de0d96:	4602      	mov	r2, r0
c0de0d98:	2000      	movs	r0, #0
c0de0d9a:	2100      	movs	r1, #0
c0de0d9c:	f009 fab8 	bl	c0dea310 <io_send_response_buffers>
c0de0da0:	bd80      	pop	{r7, pc}
	...

c0de0da4 <review_choice>:
c0de0da4:	b510      	push	{r4, lr}
c0de0da6:	4604      	mov	r4, r0
c0de0da8:	f7ff fe56 	bl	c0de0a58 <validate_pubkey>
c0de0dac:	2007      	movs	r0, #7
c0de0dae:	2c00      	cmp	r4, #0
c0de0db0:	bf18      	it	ne
c0de0db2:	2006      	movne	r0, #6
c0de0db4:	4902      	ldr	r1, [pc, #8]	@ (c0de0dc0 <review_choice+0x1c>)
c0de0db6:	4479      	add	r1, pc
c0de0db8:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de0dbc:	f007 bb4e 	b.w	c0de845c <nbgl_useCaseReviewStatus>
c0de0dc0:	fffffd67 	.word	0xfffffd67

c0de0dc4 <ui_display_transaction_bs_choice>:
c0de0dc4:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de0dc6:	b08d      	sub	sp, #52	@ 0x34
c0de0dc8:	4f44      	ldr	r7, [pc, #272]	@ (c0de0edc <ui_display_transaction_bs_choice+0x118>)
c0de0dca:	4604      	mov	r4, r0
c0de0dcc:	eb09 0007 	add.w	r0, r9, r7
c0de0dd0:	f890 02a8 	ldrb.w	r0, [r0, #680]	@ 0x2a8
c0de0dd4:	2801      	cmp	r0, #1
c0de0dd6:	d15f      	bne.n	c0de0e98 <ui_display_transaction_bs_choice+0xd4>
c0de0dd8:	f819 0007 	ldrb.w	r0, [r9, r7]
c0de0ddc:	2801      	cmp	r0, #1
c0de0dde:	d15b      	bne.n	c0de0e98 <ui_display_transaction_bs_choice+0xd4>
c0de0de0:	4e3f      	ldr	r6, [pc, #252]	@ (c0de0ee0 <ui_display_transaction_bs_choice+0x11c>)
c0de0de2:	211e      	movs	r1, #30
c0de0de4:	eb09 0006 	add.w	r0, r9, r6
c0de0de8:	3014      	adds	r0, #20
c0de0dea:	f00a f8c5 	bl	c0deaf78 <__aeabi_memclr>
c0de0dee:	ad05      	add	r5, sp, #20
c0de0df0:	211e      	movs	r1, #30
c0de0df2:	4628      	mov	r0, r5
c0de0df4:	f00a f8c0 	bl	c0deaf78 <__aeabi_memclr>
c0de0df8:	eb09 0007 	add.w	r0, r9, r7
c0de0dfc:	211e      	movs	r1, #30
c0de0dfe:	e9d0 2386 	ldrd	r2, r3, [r0, #536]	@ 0x218
c0de0e02:	2003      	movs	r0, #3
c0de0e04:	9000      	str	r0, [sp, #0]
c0de0e06:	4628      	mov	r0, r5
c0de0e08:	f009 f9d9 	bl	c0dea1be <format_fpu64>
c0de0e0c:	2800      	cmp	r0, #0
c0de0e0e:	d04d      	beq.n	c0de0eac <ui_display_transaction_bs_choice+0xe8>
c0de0e10:	9500      	str	r5, [sp, #0]
c0de0e12:	eb09 0506 	add.w	r5, r9, r6
c0de0e16:	211e      	movs	r1, #30
c0de0e18:	231e      	movs	r3, #30
c0de0e1a:	4a32      	ldr	r2, [pc, #200]	@ (c0de0ee4 <ui_display_transaction_bs_choice+0x120>)
c0de0e1c:	f105 0014 	add.w	r0, r5, #20
c0de0e20:	447a      	add	r2, pc
c0de0e22:	f009 fcf5 	bl	c0dea810 <snprintf>
c0de0e26:	3554      	adds	r5, #84	@ 0x54
c0de0e28:	212b      	movs	r1, #43	@ 0x2b
c0de0e2a:	4628      	mov	r0, r5
c0de0e2c:	f00a f8a4 	bl	c0deaf78 <__aeabi_memclr>
c0de0e30:	eb09 0007 	add.w	r0, r9, r7
c0de0e34:	2114      	movs	r1, #20
c0de0e36:	462a      	mov	r2, r5
c0de0e38:	232b      	movs	r3, #43	@ 0x2b
c0de0e3a:	f8d0 0228 	ldr.w	r0, [r0, #552]	@ 0x228
c0de0e3e:	f009 fa05 	bl	c0dea24c <format_hex>
c0de0e42:	3001      	adds	r0, #1
c0de0e44:	d035      	beq.n	c0de0eb2 <ui_display_transaction_bs_choice+0xee>
c0de0e46:	4928      	ldr	r1, [pc, #160]	@ (c0de0ee8 <ui_display_transaction_bs_choice+0x124>)
c0de0e48:	eb09 0006 	add.w	r0, r9, r6
c0de0e4c:	2500      	movs	r5, #0
c0de0e4e:	4602      	mov	r2, r0
c0de0e50:	4479      	add	r1, pc
c0de0e52:	f842 1f34 	str.w	r1, [r2, #52]!
c0de0e56:	f849 2006 	str.w	r2, [r9, r6]
c0de0e5a:	2202      	movs	r2, #2
c0de0e5c:	4923      	ldr	r1, [pc, #140]	@ (c0de0eec <ui_display_transaction_bs_choice+0x128>)
c0de0e5e:	7202      	strb	r2, [r0, #8]
c0de0e60:	f100 0254 	add.w	r2, r0, #84	@ 0x54
c0de0e64:	72c5      	strb	r5, [r0, #11]
c0de0e66:	4479      	add	r1, pc
c0de0e68:	e9c0 1211 	strd	r1, r2, [r0, #68]	@ 0x44
c0de0e6c:	f100 0114 	add.w	r1, r0, #20
c0de0e70:	6381      	str	r1, [r0, #56]	@ 0x38
c0de0e72:	481f      	ldr	r0, [pc, #124]	@ (c0de0ef0 <ui_display_transaction_bs_choice+0x12c>)
c0de0e74:	491f      	ldr	r1, [pc, #124]	@ (c0de0ef4 <ui_display_transaction_bs_choice+0x130>)
c0de0e76:	4478      	add	r0, pc
c0de0e78:	4479      	add	r1, pc
c0de0e7a:	b314      	cbz	r4, c0de0ec2 <ui_display_transaction_bs_choice+0xfe>
c0de0e7c:	e9cd 5100 	strd	r5, r1, [sp]
c0de0e80:	e9cd 5002 	strd	r5, r0, [sp, #8]
c0de0e84:	eb09 0106 	add.w	r1, r9, r6
c0de0e88:	2000      	movs	r0, #0
c0de0e8a:	4a1b      	ldr	r2, [pc, #108]	@ (c0de0ef8 <ui_display_transaction_bs_choice+0x134>)
c0de0e8c:	4b1b      	ldr	r3, [pc, #108]	@ (c0de0efc <ui_display_transaction_bs_choice+0x138>)
c0de0e8e:	447a      	add	r2, pc
c0de0e90:	447b      	add	r3, pc
c0de0e92:	f007 fd9d 	bl	c0de89d0 <nbgl_useCaseReviewBlindSigning>
c0de0e96:	e011      	b.n	c0de0ebc <ui_display_transaction_bs_choice+0xf8>
c0de0e98:	2000      	movs	r0, #0
c0de0e9a:	f809 0007 	strb.w	r0, [r9, r7]
c0de0e9e:	f24b 0007 	movw	r0, #45063	@ 0xb007
c0de0ea2:	b00d      	add	sp, #52	@ 0x34
c0de0ea4:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de0ea8:	f000 b82e 	b.w	c0de0f08 <io_send_sw>
c0de0eac:	f24b 0003 	movw	r0, #45059	@ 0xb003
c0de0eb0:	e001      	b.n	c0de0eb6 <ui_display_transaction_bs_choice+0xf2>
c0de0eb2:	f24b 0002 	movw	r0, #45058	@ 0xb002
c0de0eb6:	f000 f827 	bl	c0de0f08 <io_send_sw>
c0de0eba:	4605      	mov	r5, r0
c0de0ebc:	4628      	mov	r0, r5
c0de0ebe:	b00d      	add	sp, #52	@ 0x34
c0de0ec0:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de0ec2:	e9cd 5100 	strd	r5, r1, [sp]
c0de0ec6:	9002      	str	r0, [sp, #8]
c0de0ec8:	eb09 0106 	add.w	r1, r9, r6
c0de0ecc:	2000      	movs	r0, #0
c0de0ece:	4a0c      	ldr	r2, [pc, #48]	@ (c0de0f00 <ui_display_transaction_bs_choice+0x13c>)
c0de0ed0:	4b0c      	ldr	r3, [pc, #48]	@ (c0de0f04 <ui_display_transaction_bs_choice+0x140>)
c0de0ed2:	447a      	add	r2, pc
c0de0ed4:	447b      	add	r3, pc
c0de0ed6:	f007 fccb 	bl	c0de8870 <nbgl_useCaseReview>
c0de0eda:	e7ef      	b.n	c0de0ebc <ui_display_transaction_bs_choice+0xf8>
c0de0edc:	00000000 	.word	0x00000000
c0de0ee0:	00001498 	.word	0x00001498
c0de0ee4:	0000be62 	.word	0x0000be62
c0de0ee8:	0000b8ec 	.word	0x0000b8ec
c0de0eec:	0000be25 	.word	0x0000be25
c0de0ef0:	0000009f 	.word	0x0000009f
c0de0ef4:	0000b9fb 	.word	0x0000b9fb
c0de0ef8:	0000a465 	.word	0x0000a465
c0de0efc:	0000b6ed 	.word	0x0000b6ed
c0de0f00:	0000a421 	.word	0x0000a421
c0de0f04:	0000b6a9 	.word	0x0000b6a9

c0de0f08 <io_send_sw>:
c0de0f08:	b580      	push	{r7, lr}
c0de0f0a:	4602      	mov	r2, r0
c0de0f0c:	2000      	movs	r0, #0
c0de0f0e:	2100      	movs	r1, #0
c0de0f10:	f009 f9fe 	bl	c0dea310 <io_send_response_buffers>
c0de0f14:	bd80      	pop	{r7, pc}
	...

c0de0f18 <review_choice>:
c0de0f18:	b510      	push	{r4, lr}
c0de0f1a:	4604      	mov	r4, r0
c0de0f1c:	f7ff fdaa 	bl	c0de0a74 <validate_transaction>
c0de0f20:	4903      	ldr	r1, [pc, #12]	@ (c0de0f30 <review_choice+0x18>)
c0de0f22:	f084 0001 	eor.w	r0, r4, #1
c0de0f26:	4479      	add	r1, pc
c0de0f28:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de0f2c:	f007 ba96 	b.w	c0de845c <nbgl_useCaseReviewStatus>
c0de0f30:	fffffbf7 	.word	0xfffffbf7

c0de0f34 <ui_display_blind_signed_transaction>:
c0de0f34:	2001      	movs	r0, #1
c0de0f36:	f7ff bf45 	b.w	c0de0dc4 <ui_display_transaction_bs_choice>

c0de0f3a <ui_display_transaction>:
c0de0f3a:	2000      	movs	r0, #0
c0de0f3c:	f7ff bf42 	b.w	c0de0dc4 <ui_display_transaction_bs_choice>

c0de0f40 <keccak_init>:
c0de0f40:	2106      	movs	r1, #6
c0de0f42:	2220      	movs	r2, #32
c0de0f44:	f009 bbbf 	b.w	c0dea6c6 <cx_hash_init_ex>

c0de0f48 <keccak_update>:
c0de0f48:	f009 bbc2 	b.w	c0dea6d0 <cx_hash_update>

c0de0f4c <keccak_final>:
c0de0f4c:	f009 bbb6 	b.w	c0dea6bc <cx_hash_final>

c0de0f50 <inner_keccak256_init>:
c0de0f50:	b160      	cbz	r0, c0de0f6c <inner_keccak256_init+0x1c>
c0de0f52:	b510      	push	{r4, lr}
c0de0f54:	212c      	movs	r1, #44	@ 0x2c
c0de0f56:	4604      	mov	r4, r0
c0de0f58:	f00a f80e 	bl	c0deaf78 <__aeabi_memclr>
c0de0f5c:	f104 0030 	add.w	r0, r4, #48	@ 0x30
c0de0f60:	f7ff ffee 	bl	c0de0f40 <keccak_init>
c0de0f64:	2000      	movs	r0, #0
c0de0f66:	e9c4 007e 	strd	r0, r0, [r4, #504]	@ 0x1f8
c0de0f6a:	bd10      	pop	{r4, pc}
c0de0f6c:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de0f70:	4770      	bx	lr

c0de0f72 <inner_keccak256_inject>:
c0de0f72:	b580      	push	{r7, lr}
c0de0f74:	4603      	mov	r3, r0
c0de0f76:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de0f7a:	b15b      	cbz	r3, c0de0f94 <inner_keccak256_inject+0x22>
c0de0f7c:	b151      	cbz	r1, c0de0f94 <inner_keccak256_inject+0x22>
c0de0f7e:	6a98      	ldr	r0, [r3, #40]	@ 0x28
c0de0f80:	b110      	cbz	r0, c0de0f88 <inner_keccak256_inject+0x16>
c0de0f82:	f06f 0001 	mvn.w	r0, #1
c0de0f86:	bd80      	pop	{r7, pc}
c0de0f88:	f103 0030 	add.w	r0, r3, #48	@ 0x30
c0de0f8c:	b292      	uxth	r2, r2
c0de0f8e:	f7ff ffdb 	bl	c0de0f48 <keccak_update>
c0de0f92:	2000      	movs	r0, #0
c0de0f94:	bd80      	pop	{r7, pc}

c0de0f96 <inner_keccak256_flip>:
c0de0f96:	b510      	push	{r4, lr}
c0de0f98:	b128      	cbz	r0, c0de0fa6 <inner_keccak256_flip+0x10>
c0de0f9a:	4604      	mov	r4, r0
c0de0f9c:	6a80      	ldr	r0, [r0, #40]	@ 0x28
c0de0f9e:	b128      	cbz	r0, c0de0fac <inner_keccak256_flip+0x16>
c0de0fa0:	f06f 0001 	mvn.w	r0, #1
c0de0fa4:	bd10      	pop	{r4, pc}
c0de0fa6:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de0faa:	bd10      	pop	{r4, pc}
c0de0fac:	f104 0030 	add.w	r0, r4, #48	@ 0x30
c0de0fb0:	4621      	mov	r1, r4
c0de0fb2:	f7ff ffcb 	bl	c0de0f4c <keccak_final>
c0de0fb6:	2000      	movs	r0, #0
c0de0fb8:	2101      	movs	r1, #1
c0de0fba:	e9c4 007e 	strd	r0, r0, [r4, #504]	@ 0x1f8
c0de0fbe:	62a1      	str	r1, [r4, #40]	@ 0x28
c0de0fc0:	bd10      	pop	{r4, pc}

c0de0fc2 <inner_keccak256_extract>:
c0de0fc2:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de0fc6:	b0f8      	sub	sp, #480	@ 0x1e0
c0de0fc8:	4682      	mov	sl, r0
c0de0fca:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de0fce:	f1ba 0f00 	cmp.w	sl, #0
c0de0fd2:	d020      	beq.n	c0de1016 <inner_keccak256_extract+0x54>
c0de0fd4:	460e      	mov	r6, r1
c0de0fd6:	b1f1      	cbz	r1, c0de1016 <inner_keccak256_extract+0x54>
c0de0fd8:	f8da 0028 	ldr.w	r0, [sl, #40]	@ 0x28
c0de0fdc:	b1c8      	cbz	r0, c0de1012 <inner_keccak256_extract+0x50>
c0de0fde:	e9da 017e 	ldrd	r0, r1, [sl, #504]	@ 0x1f8
c0de0fe2:	4615      	mov	r5, r2
c0de0fe4:	4281      	cmp	r1, r0
c0de0fe6:	d919      	bls.n	c0de101c <inner_keccak256_extract+0x5a>
c0de0fe8:	1a0c      	subs	r4, r1, r0
c0de0fea:	4450      	add	r0, sl
c0de0fec:	46a3      	mov	fp, r4
c0de0fee:	42ac      	cmp	r4, r5
c0de0ff0:	f500 71ec 	add.w	r1, r0, #472	@ 0x1d8
c0de0ff4:	4630      	mov	r0, r6
c0de0ff6:	bf88      	it	hi
c0de0ff8:	46ab      	movhi	fp, r5
c0de0ffa:	465a      	mov	r2, fp
c0de0ffc:	f009 ffb2 	bl	c0deaf64 <__aeabi_memcpy>
c0de1000:	f8da 01f8 	ldr.w	r0, [sl, #504]	@ 0x1f8
c0de1004:	42ac      	cmp	r4, r5
c0de1006:	4458      	add	r0, fp
c0de1008:	f8ca 01f8 	str.w	r0, [sl, #504]	@ 0x1f8
c0de100c:	d308      	bcc.n	c0de1020 <inner_keccak256_extract+0x5e>
c0de100e:	2000      	movs	r0, #0
c0de1010:	e001      	b.n	c0de1016 <inner_keccak256_extract+0x54>
c0de1012:	f06f 0001 	mvn.w	r0, #1
c0de1016:	b078      	add	sp, #480	@ 0x1e0
c0de1018:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de101c:	f04f 0b00 	mov.w	fp, #0
c0de1020:	ac6e      	add	r4, sp, #440	@ 0x1b8
c0de1022:	9503      	str	r5, [sp, #12]
c0de1024:	f104 0020 	add.w	r0, r4, #32
c0de1028:	9002      	str	r0, [sp, #8]
c0de102a:	f50a 70ec 	add.w	r0, sl, #472	@ 0x1d8
c0de102e:	e9cd 0600 	strd	r0, r6, [sp]
c0de1032:	45ab      	cmp	fp, r5
c0de1034:	d2eb      	bcs.n	c0de100e <inner_keccak256_extract+0x4c>
c0de1036:	4620      	mov	r0, r4
c0de1038:	4651      	mov	r1, sl
c0de103a:	2220      	movs	r2, #32
c0de103c:	46a0      	mov	r8, r4
c0de103e:	f009 ff91 	bl	c0deaf64 <__aeabi_memcpy>
c0de1042:	e9da 5408 	ldrd	r5, r4, [sl, #32]
c0de1046:	9f02      	ldr	r7, [sp, #8]
c0de1048:	2638      	movs	r6, #56	@ 0x38
c0de104a:	f116 0008 	adds.w	r0, r6, #8
c0de104e:	d008      	beq.n	c0de1062 <inner_keccak256_extract+0xa0>
c0de1050:	4628      	mov	r0, r5
c0de1052:	4621      	mov	r1, r4
c0de1054:	4632      	mov	r2, r6
c0de1056:	f009 fe8f 	bl	c0dead78 <__aeabi_llsr>
c0de105a:	f807 0b01 	strb.w	r0, [r7], #1
c0de105e:	3e08      	subs	r6, #8
c0de1060:	e7f3      	b.n	c0de104a <inner_keccak256_extract+0x88>
c0de1062:	af04      	add	r7, sp, #16
c0de1064:	4638      	mov	r0, r7
c0de1066:	f7ff ff6b 	bl	c0de0f40 <keccak_init>
c0de106a:	4638      	mov	r0, r7
c0de106c:	4641      	mov	r1, r8
c0de106e:	2228      	movs	r2, #40	@ 0x28
c0de1070:	4644      	mov	r4, r8
c0de1072:	f7ff ff69 	bl	c0de0f48 <keccak_update>
c0de1076:	9d03      	ldr	r5, [sp, #12]
c0de1078:	eba5 080b 	sub.w	r8, r5, fp
c0de107c:	f1b8 0f1f 	cmp.w	r8, #31
c0de1080:	d90b      	bls.n	c0de109a <inner_keccak256_extract+0xd8>
c0de1082:	9e01      	ldr	r6, [sp, #4]
c0de1084:	4638      	mov	r0, r7
c0de1086:	eb06 010b 	add.w	r1, r6, fp
c0de108a:	f7ff ff5f 	bl	c0de0f4c <keccak_final>
c0de108e:	f10b 0b20 	add.w	fp, fp, #32
c0de1092:	f04f 0800 	mov.w	r8, #0
c0de1096:	2000      	movs	r0, #0
c0de1098:	e00d      	b.n	c0de10b6 <inner_keccak256_extract+0xf4>
c0de109a:	4638      	mov	r0, r7
c0de109c:	9f00      	ldr	r7, [sp, #0]
c0de109e:	4639      	mov	r1, r7
c0de10a0:	f7ff ff54 	bl	c0de0f4c <keccak_final>
c0de10a4:	9e01      	ldr	r6, [sp, #4]
c0de10a6:	4639      	mov	r1, r7
c0de10a8:	4642      	mov	r2, r8
c0de10aa:	eb06 000b 	add.w	r0, r6, fp
c0de10ae:	f009 ff59 	bl	c0deaf64 <__aeabi_memcpy>
c0de10b2:	2020      	movs	r0, #32
c0de10b4:	46ab      	mov	fp, r5
c0de10b6:	e9ca 807e 	strd	r8, r0, [sl, #504]	@ 0x1f8
c0de10ba:	e9da 0108 	ldrd	r0, r1, [sl, #32]
c0de10be:	3001      	adds	r0, #1
c0de10c0:	f141 0100 	adc.w	r1, r1, #0
c0de10c4:	e9ca 0108 	strd	r0, r1, [sl, #32]
c0de10c8:	e7b3      	b.n	c0de1032 <inner_keccak256_extract+0x70>

c0de10ca <pqcrystals_dilithium2_lowram_pack_sig_h>:
c0de10ca:	b5b0      	push	{r4, r5, r7, lr}
c0de10cc:	f500 6012 	add.w	r0, r0, #2336	@ 0x920
c0de10d0:	2400      	movs	r4, #0
c0de10d2:	f5b4 7f80 	cmp.w	r4, #256	@ 0x100
c0de10d6:	d009      	beq.n	c0de10ec <pqcrystals_dilithium2_lowram_pack_sig_h+0x22>
c0de10d8:	f851 5024 	ldr.w	r5, [r1, r4, lsl #2]
c0de10dc:	b125      	cbz	r5, c0de10e8 <pqcrystals_dilithium2_lowram_pack_sig_h+0x1e>
c0de10de:	681d      	ldr	r5, [r3, #0]
c0de10e0:	5544      	strb	r4, [r0, r5]
c0de10e2:	681d      	ldr	r5, [r3, #0]
c0de10e4:	3501      	adds	r5, #1
c0de10e6:	601d      	str	r5, [r3, #0]
c0de10e8:	3401      	adds	r4, #1
c0de10ea:	e7f2      	b.n	c0de10d2 <pqcrystals_dilithium2_lowram_pack_sig_h+0x8>
c0de10ec:	6819      	ldr	r1, [r3, #0]
c0de10ee:	4410      	add	r0, r2
c0de10f0:	f880 1050 	strb.w	r1, [r0, #80]	@ 0x50
c0de10f4:	bdb0      	pop	{r4, r5, r7, pc}

c0de10f6 <pqcrystals_dilithium2_lowram_pack_sig_h_zero>:
c0de10f6:	680a      	ldr	r2, [r1, #0]
c0de10f8:	f500 6012 	add.w	r0, r0, #2336	@ 0x920
c0de10fc:	2300      	movs	r3, #0
c0de10fe:	2a4f      	cmp	r2, #79	@ 0x4f
c0de1100:	bf88      	it	hi
c0de1102:	4770      	bxhi	lr
c0de1104:	5483      	strb	r3, [r0, r2]
c0de1106:	680a      	ldr	r2, [r1, #0]
c0de1108:	3201      	adds	r2, #1
c0de110a:	600a      	str	r2, [r1, #0]
c0de110c:	e7f7      	b.n	c0de10fe <pqcrystals_dilithium2_lowram_pack_sig_h_zero+0x8>

c0de110e <poly_challenge_compress>:
c0de110e:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de1112:	2200      	movs	r2, #0
c0de1114:	2300      	movs	r3, #0
c0de1116:	2b44      	cmp	r3, #68	@ 0x44
c0de1118:	d002      	beq.n	c0de1120 <poly_challenge_compress+0x12>
c0de111a:	54c2      	strb	r2, [r0, r3]
c0de111c:	3301      	adds	r3, #1
c0de111e:	e7fa      	b.n	c0de1116 <poly_challenge_compress+0x8>
c0de1120:	2200      	movs	r2, #0
c0de1122:	2301      	movs	r3, #1
c0de1124:	2600      	movs	r6, #0
c0de1126:	f04f 0800 	mov.w	r8, #0
c0de112a:	2500      	movs	r5, #0
c0de112c:	2700      	movs	r7, #0
c0de112e:	f5b2 7f80 	cmp.w	r2, #256	@ 0x100
c0de1132:	d011      	beq.n	c0de1158 <poly_challenge_compress+0x4a>
c0de1134:	f851 4022 	ldr.w	r4, [r1, r2, lsl #2]
c0de1138:	b164      	cbz	r4, c0de1154 <poly_challenge_compress+0x46>
c0de113a:	5582      	strb	r2, [r0, r6]
c0de113c:	f851 4022 	ldr.w	r4, [r1, r2, lsl #2]
c0de1140:	3401      	adds	r4, #1
c0de1142:	bf04      	itt	eq
c0de1144:	433d      	orreq	r5, r7
c0de1146:	ea48 0803 	orreq.w	r8, r8, r3
c0de114a:	007c      	lsls	r4, r7, #1
c0de114c:	3601      	adds	r6, #1
c0de114e:	ea44 77d3 	orr.w	r7, r4, r3, lsr #31
c0de1152:	005b      	lsls	r3, r3, #1
c0de1154:	3201      	adds	r2, #1
c0de1156:	e7ea      	b.n	c0de112e <poly_challenge_compress+0x20>
c0de1158:	f100 073c 	add.w	r7, r0, #60	@ 0x3c
c0de115c:	2600      	movs	r6, #0
c0de115e:	2e40      	cmp	r6, #64	@ 0x40
c0de1160:	bf08      	it	eq
c0de1162:	e8bd 81f0 	ldmiaeq.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de1166:	4640      	mov	r0, r8
c0de1168:	4629      	mov	r1, r5
c0de116a:	4632      	mov	r2, r6
c0de116c:	f009 fe04 	bl	c0dead78 <__aeabi_llsr>
c0de1170:	f807 0b01 	strb.w	r0, [r7], #1
c0de1174:	3608      	adds	r6, #8
c0de1176:	e7f2      	b.n	c0de115e <poly_challenge_compress+0x50>

c0de1178 <poly_challenge_decompress>:
c0de1178:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de117c:	4688      	mov	r8, r1
c0de117e:	4682      	mov	sl, r0
c0de1180:	2000      	movs	r0, #0
c0de1182:	2100      	movs	r1, #0
c0de1184:	f5b1 7f80 	cmp.w	r1, #256	@ 0x100
c0de1188:	d003      	beq.n	c0de1192 <poly_challenge_decompress+0x1a>
c0de118a:	f84a 0021 	str.w	r0, [sl, r1, lsl #2]
c0de118e:	3101      	adds	r1, #1
c0de1190:	e7f8      	b.n	c0de1184 <poly_challenge_decompress+0xc>
c0de1192:	f108 053c 	add.w	r5, r8, #60	@ 0x3c
c0de1196:	2600      	movs	r6, #0
c0de1198:	2700      	movs	r7, #0
c0de119a:	2400      	movs	r4, #0
c0de119c:	2e40      	cmp	r6, #64	@ 0x40
c0de119e:	d009      	beq.n	c0de11b4 <poly_challenge_decompress+0x3c>
c0de11a0:	f815 0b01 	ldrb.w	r0, [r5], #1
c0de11a4:	2100      	movs	r1, #0
c0de11a6:	4632      	mov	r2, r6
c0de11a8:	f009 fdd4 	bl	c0dead54 <__aeabi_llsl>
c0de11ac:	430c      	orrs	r4, r1
c0de11ae:	4307      	orrs	r7, r0
c0de11b0:	3608      	adds	r6, #8
c0de11b2:	e7f3      	b.n	c0de119c <poly_challenge_decompress+0x24>
c0de11b4:	2000      	movs	r0, #0
c0de11b6:	2827      	cmp	r0, #39	@ 0x27
c0de11b8:	bf08      	it	eq
c0de11ba:	e8bd 85f8 	ldmiaeq.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}
c0de11be:	07fa      	lsls	r2, r7, #31
c0de11c0:	f818 1000 	ldrb.w	r1, [r8, r0]
c0de11c4:	f04f 32ff 	mov.w	r2, #4294967295	@ 0xffffffff
c0de11c8:	bf08      	it	eq
c0de11ca:	2201      	moveq	r2, #1
c0de11cc:	ea5f 0454 	movs.w	r4, r4, lsr #1
c0de11d0:	f84a 2021 	str.w	r2, [sl, r1, lsl #2]
c0de11d4:	ea4f 0737 	mov.w	r7, r7, rrx
c0de11d8:	3001      	adds	r0, #1
c0de11da:	e7ec      	b.n	c0de11b6 <poly_challenge_decompress+0x3e>

c0de11dc <poly_schoolbook>:
c0de11dc:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de11e0:	4614      	mov	r4, r2
c0de11e2:	468a      	mov	sl, r1
c0de11e4:	2200      	movs	r2, #0
c0de11e6:	2100      	movs	r1, #0
c0de11e8:	f5b1 7f80 	cmp.w	r1, #256	@ 0x100
c0de11ec:	d003      	beq.n	c0de11f6 <poly_schoolbook+0x1a>
c0de11ee:	f840 2021 	str.w	r2, [r0, r1, lsl #2]
c0de11f2:	3101      	adds	r1, #1
c0de11f4:	e7f8      	b.n	c0de11e8 <poly_schoolbook+0xc>
c0de11f6:	f10a 053c 	add.w	r5, sl, #60	@ 0x3c
c0de11fa:	2700      	movs	r7, #0
c0de11fc:	f04f 0b00 	mov.w	fp, #0
c0de1200:	2600      	movs	r6, #0
c0de1202:	9003      	str	r0, [sp, #12]
c0de1204:	2f40      	cmp	r7, #64	@ 0x40
c0de1206:	d006      	beq.n	c0de1216 <poly_schoolbook+0x3a>
c0de1208:	f000 fbf0 	bl	c0de19ec <OUTLINED_FUNCTION_2>
c0de120c:	430e      	orrs	r6, r1
c0de120e:	ea4b 0b00 	orr.w	fp, fp, r0
c0de1212:	3708      	adds	r7, #8
c0de1214:	e7f6      	b.n	c0de1204 <poly_schoolbook+0x28>
c0de1216:	f04f 0800 	mov.w	r8, #0
c0de121a:	f8cd a004 	str.w	sl, [sp, #4]
c0de121e:	f1b8 0f27 	cmp.w	r8, #39	@ 0x27
c0de1222:	bf08      	it	eq
c0de1224:	e8bd 8dff 	ldmiaeq.w	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de1228:	f81a 0008 	ldrb.w	r0, [sl, r8]
c0de122c:	ea5f 71cb 	movs.w	r1, fp, lsl #31
c0de1230:	f5c0 7780 	rsb	r7, r0, #256	@ 0x100
c0de1234:	d111      	bne.n	c0de125a <poly_schoolbook+0x7e>
c0de1236:	9903      	ldr	r1, [sp, #12]
c0de1238:	9602      	str	r6, [sp, #8]
c0de123a:	2500      	movs	r5, #0
c0de123c:	eb01 0680 	add.w	r6, r1, r0, lsl #2
c0de1240:	42af      	cmp	r7, r5
c0de1242:	d01b      	beq.n	c0de127c <poly_schoolbook+0xa0>
c0de1244:	4620      	mov	r0, r4
c0de1246:	4629      	mov	r1, r5
c0de1248:	f000 f842 	bl	c0de12d0 <polyt0_unpack_idx>
c0de124c:	f856 1025 	ldr.w	r1, [r6, r5, lsl #2]
c0de1250:	4408      	add	r0, r1
c0de1252:	f846 0025 	str.w	r0, [r6, r5, lsl #2]
c0de1256:	3501      	adds	r5, #1
c0de1258:	e7f2      	b.n	c0de1240 <poly_schoolbook+0x64>
c0de125a:	9903      	ldr	r1, [sp, #12]
c0de125c:	2500      	movs	r5, #0
c0de125e:	eb01 0a80 	add.w	sl, r1, r0, lsl #2
c0de1262:	42af      	cmp	r7, r5
c0de1264:	d01b      	beq.n	c0de129e <poly_schoolbook+0xc2>
c0de1266:	4620      	mov	r0, r4
c0de1268:	4629      	mov	r1, r5
c0de126a:	f000 f831 	bl	c0de12d0 <polyt0_unpack_idx>
c0de126e:	f85a 1025 	ldr.w	r1, [sl, r5, lsl #2]
c0de1272:	1a08      	subs	r0, r1, r0
c0de1274:	f84a 0025 	str.w	r0, [sl, r5, lsl #2]
c0de1278:	3501      	adds	r5, #1
c0de127a:	e7f2      	b.n	c0de1262 <poly_schoolbook+0x86>
c0de127c:	f5a6 6580 	sub.w	r5, r6, #1024	@ 0x400
c0de1280:	9e02      	ldr	r6, [sp, #8]
c0de1282:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de1286:	d01c      	beq.n	c0de12c2 <poly_schoolbook+0xe6>
c0de1288:	4620      	mov	r0, r4
c0de128a:	4639      	mov	r1, r7
c0de128c:	f000 f820 	bl	c0de12d0 <polyt0_unpack_idx>
c0de1290:	f855 1027 	ldr.w	r1, [r5, r7, lsl #2]
c0de1294:	1a08      	subs	r0, r1, r0
c0de1296:	f845 0027 	str.w	r0, [r5, r7, lsl #2]
c0de129a:	3701      	adds	r7, #1
c0de129c:	e7f1      	b.n	c0de1282 <poly_schoolbook+0xa6>
c0de129e:	f5aa 6580 	sub.w	r5, sl, #1024	@ 0x400
c0de12a2:	f8dd a004 	ldr.w	sl, [sp, #4]
c0de12a6:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de12aa:	d00a      	beq.n	c0de12c2 <poly_schoolbook+0xe6>
c0de12ac:	4620      	mov	r0, r4
c0de12ae:	4639      	mov	r1, r7
c0de12b0:	f000 f80e 	bl	c0de12d0 <polyt0_unpack_idx>
c0de12b4:	f855 1027 	ldr.w	r1, [r5, r7, lsl #2]
c0de12b8:	4408      	add	r0, r1
c0de12ba:	f845 0027 	str.w	r0, [r5, r7, lsl #2]
c0de12be:	3701      	adds	r7, #1
c0de12c0:	e7f1      	b.n	c0de12a6 <poly_schoolbook+0xca>
c0de12c2:	ea5f 0656 	movs.w	r6, r6, lsr #1
c0de12c6:	f108 0801 	add.w	r8, r8, #1
c0de12ca:	ea4f 0b3b 	mov.w	fp, fp, rrx
c0de12ce:	e7a6      	b.n	c0de121e <poly_schoolbook+0x42>

c0de12d0 <polyt0_unpack_idx>:
c0de12d0:	08ca      	lsrs	r2, r1, #3
c0de12d2:	230d      	movs	r3, #13
c0de12d4:	f001 0107 	and.w	r1, r1, #7
c0de12d8:	fb02 0003 	mla	r0, r2, r3, r0
c0de12dc:	2906      	cmp	r1, #6
c0de12de:	d00e      	beq.n	c0de12fe <polyt0_unpack_idx+0x2e>
c0de12e0:	2901      	cmp	r1, #1
c0de12e2:	d014      	beq.n	c0de130e <polyt0_unpack_idx+0x3e>
c0de12e4:	2902      	cmp	r1, #2
c0de12e6:	d01a      	beq.n	c0de131e <polyt0_unpack_idx+0x4e>
c0de12e8:	2903      	cmp	r1, #3
c0de12ea:	d01d      	beq.n	c0de1328 <polyt0_unpack_idx+0x58>
c0de12ec:	2904      	cmp	r1, #4
c0de12ee:	d023      	beq.n	c0de1338 <polyt0_unpack_idx+0x68>
c0de12f0:	2905      	cmp	r1, #5
c0de12f2:	d029      	beq.n	c0de1348 <polyt0_unpack_idx+0x78>
c0de12f4:	bb69      	cbnz	r1, c0de1352 <polyt0_unpack_idx+0x82>
c0de12f6:	7801      	ldrb	r1, [r0, #0]
c0de12f8:	7840      	ldrb	r0, [r0, #1]
c0de12fa:	0200      	lsls	r0, r0, #8
c0de12fc:	e02d      	b.n	c0de135a <polyt0_unpack_idx+0x8a>
c0de12fe:	7a82      	ldrb	r2, [r0, #10]
c0de1300:	7a41      	ldrb	r1, [r0, #9]
c0de1302:	7ac3      	ldrb	r3, [r0, #11]
c0de1304:	0090      	lsls	r0, r2, #2
c0de1306:	ea40 1091 	orr.w	r0, r0, r1, lsr #6
c0de130a:	0299      	lsls	r1, r3, #10
c0de130c:	e025      	b.n	c0de135a <polyt0_unpack_idx+0x8a>
c0de130e:	7882      	ldrb	r2, [r0, #2]
c0de1310:	7841      	ldrb	r1, [r0, #1]
c0de1312:	78c3      	ldrb	r3, [r0, #3]
c0de1314:	00d0      	lsls	r0, r2, #3
c0de1316:	ea40 1051 	orr.w	r0, r0, r1, lsr #5
c0de131a:	02d9      	lsls	r1, r3, #11
c0de131c:	e01d      	b.n	c0de135a <polyt0_unpack_idx+0x8a>
c0de131e:	78c1      	ldrb	r1, [r0, #3]
c0de1320:	7900      	ldrb	r0, [r0, #4]
c0de1322:	0180      	lsls	r0, r0, #6
c0de1324:	0889      	lsrs	r1, r1, #2
c0de1326:	e018      	b.n	c0de135a <polyt0_unpack_idx+0x8a>
c0de1328:	7942      	ldrb	r2, [r0, #5]
c0de132a:	7901      	ldrb	r1, [r0, #4]
c0de132c:	7983      	ldrb	r3, [r0, #6]
c0de132e:	0050      	lsls	r0, r2, #1
c0de1330:	ea40 10d1 	orr.w	r0, r0, r1, lsr #7
c0de1334:	0259      	lsls	r1, r3, #9
c0de1336:	e010      	b.n	c0de135a <polyt0_unpack_idx+0x8a>
c0de1338:	79c2      	ldrb	r2, [r0, #7]
c0de133a:	7981      	ldrb	r1, [r0, #6]
c0de133c:	7a03      	ldrb	r3, [r0, #8]
c0de133e:	0110      	lsls	r0, r2, #4
c0de1340:	ea40 1011 	orr.w	r0, r0, r1, lsr #4
c0de1344:	0319      	lsls	r1, r3, #12
c0de1346:	e008      	b.n	c0de135a <polyt0_unpack_idx+0x8a>
c0de1348:	7a01      	ldrb	r1, [r0, #8]
c0de134a:	7a40      	ldrb	r0, [r0, #9]
c0de134c:	01c0      	lsls	r0, r0, #7
c0de134e:	0849      	lsrs	r1, r1, #1
c0de1350:	e003      	b.n	c0de135a <polyt0_unpack_idx+0x8a>
c0de1352:	7ac1      	ldrb	r1, [r0, #11]
c0de1354:	7b00      	ldrb	r0, [r0, #12]
c0de1356:	0140      	lsls	r0, r0, #5
c0de1358:	08c9      	lsrs	r1, r1, #3
c0de135a:	4308      	orrs	r0, r1
c0de135c:	f36f 305f 	bfc	r0, #13, #19
c0de1360:	f5c0 5080 	rsb	r0, r0, #4096	@ 0x1000
c0de1364:	4770      	bx	lr
	...

c0de1368 <poly_schoolbook_t1>:
c0de1368:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de136c:	4614      	mov	r4, r2
c0de136e:	468b      	mov	fp, r1
c0de1370:	2200      	movs	r2, #0
c0de1372:	2100      	movs	r1, #0
c0de1374:	f5b1 7f80 	cmp.w	r1, #256	@ 0x100
c0de1378:	d003      	beq.n	c0de1382 <poly_schoolbook_t1+0x1a>
c0de137a:	f840 2021 	str.w	r2, [r0, r1, lsl #2]
c0de137e:	3101      	adds	r1, #1
c0de1380:	e7f8      	b.n	c0de1374 <poly_schoolbook_t1+0xc>
c0de1382:	f10b 053c 	add.w	r5, fp, #60	@ 0x3c
c0de1386:	2700      	movs	r7, #0
c0de1388:	f04f 0a00 	mov.w	sl, #0
c0de138c:	2600      	movs	r6, #0
c0de138e:	9002      	str	r0, [sp, #8]
c0de1390:	2f40      	cmp	r7, #64	@ 0x40
c0de1392:	d006      	beq.n	c0de13a2 <poly_schoolbook_t1+0x3a>
c0de1394:	f000 fb2a 	bl	c0de19ec <OUTLINED_FUNCTION_2>
c0de1398:	430e      	orrs	r6, r1
c0de139a:	ea4a 0a00 	orr.w	sl, sl, r0
c0de139e:	3708      	adds	r7, #8
c0de13a0:	e7f6      	b.n	c0de1390 <poly_schoolbook_t1+0x28>
c0de13a2:	4832      	ldr	r0, [pc, #200]	@ (c0de146c <poly_schoolbook_t1+0x104>)
c0de13a4:	2200      	movs	r2, #0
c0de13a6:	f8cd b000 	str.w	fp, [sp]
c0de13aa:	4680      	mov	r8, r0
c0de13ac:	2a27      	cmp	r2, #39	@ 0x27
c0de13ae:	bf08      	it	eq
c0de13b0:	e8bd 8dff 	ldmiaeq.w	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de13b4:	f81b 0002 	ldrb.w	r0, [fp, r2]
c0de13b8:	ea5f 71ca 	movs.w	r1, sl, lsl #31
c0de13bc:	9203      	str	r2, [sp, #12]
c0de13be:	f5c0 7780 	rsb	r7, r0, #256	@ 0x100
c0de13c2:	d112      	bne.n	c0de13ea <poly_schoolbook_t1+0x82>
c0de13c4:	9902      	ldr	r1, [sp, #8]
c0de13c6:	9601      	str	r6, [sp, #4]
c0de13c8:	2500      	movs	r5, #0
c0de13ca:	eb01 0680 	add.w	r6, r1, r0, lsl #2
c0de13ce:	42af      	cmp	r7, r5
c0de13d0:	d01e      	beq.n	c0de1410 <poly_schoolbook_t1+0xa8>
c0de13d2:	4620      	mov	r0, r4
c0de13d4:	4629      	mov	r1, r5
c0de13d6:	f000 f84b 	bl	c0de1470 <polyt1_unpack_idx>
c0de13da:	f856 1025 	ldr.w	r1, [r6, r5, lsl #2]
c0de13de:	eb01 3040 	add.w	r0, r1, r0, lsl #13
c0de13e2:	f846 0025 	str.w	r0, [r6, r5, lsl #2]
c0de13e6:	3501      	adds	r5, #1
c0de13e8:	e7f1      	b.n	c0de13ce <poly_schoolbook_t1+0x66>
c0de13ea:	9902      	ldr	r1, [sp, #8]
c0de13ec:	2500      	movs	r5, #0
c0de13ee:	eb01 0b80 	add.w	fp, r1, r0, lsl #2
c0de13f2:	42af      	cmp	r7, r5
c0de13f4:	d01f      	beq.n	c0de1436 <poly_schoolbook_t1+0xce>
c0de13f6:	4620      	mov	r0, r4
c0de13f8:	4629      	mov	r1, r5
c0de13fa:	f000 f839 	bl	c0de1470 <polyt1_unpack_idx>
c0de13fe:	f85b 1025 	ldr.w	r1, [fp, r5, lsl #2]
c0de1402:	4642      	mov	r2, r8
c0de1404:	fb00 1008 	mla	r0, r0, r8, r1
c0de1408:	f84b 0025 	str.w	r0, [fp, r5, lsl #2]
c0de140c:	3501      	adds	r5, #1
c0de140e:	e7f0      	b.n	c0de13f2 <poly_schoolbook_t1+0x8a>
c0de1410:	f5a6 6580 	sub.w	r5, r6, #1024	@ 0x400
c0de1414:	9e01      	ldr	r6, [sp, #4]
c0de1416:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de141a:	d01f      	beq.n	c0de145c <poly_schoolbook_t1+0xf4>
c0de141c:	4620      	mov	r0, r4
c0de141e:	4639      	mov	r1, r7
c0de1420:	f000 f826 	bl	c0de1470 <polyt1_unpack_idx>
c0de1424:	f855 1027 	ldr.w	r1, [r5, r7, lsl #2]
c0de1428:	4642      	mov	r2, r8
c0de142a:	fb00 1008 	mla	r0, r0, r8, r1
c0de142e:	f845 0027 	str.w	r0, [r5, r7, lsl #2]
c0de1432:	3701      	adds	r7, #1
c0de1434:	e7ef      	b.n	c0de1416 <poly_schoolbook_t1+0xae>
c0de1436:	f5ab 6580 	sub.w	r5, fp, #1024	@ 0x400
c0de143a:	f8dd b000 	ldr.w	fp, [sp]
c0de143e:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de1442:	d00b      	beq.n	c0de145c <poly_schoolbook_t1+0xf4>
c0de1444:	4620      	mov	r0, r4
c0de1446:	4639      	mov	r1, r7
c0de1448:	f000 f812 	bl	c0de1470 <polyt1_unpack_idx>
c0de144c:	f855 1027 	ldr.w	r1, [r5, r7, lsl #2]
c0de1450:	eb01 3040 	add.w	r0, r1, r0, lsl #13
c0de1454:	f845 0027 	str.w	r0, [r5, r7, lsl #2]
c0de1458:	3701      	adds	r7, #1
c0de145a:	e7f0      	b.n	c0de143e <poly_schoolbook_t1+0xd6>
c0de145c:	9a03      	ldr	r2, [sp, #12]
c0de145e:	ea5f 0656 	movs.w	r6, r6, lsr #1
c0de1462:	ea4f 0a3a 	mov.w	sl, sl, rrx
c0de1466:	3201      	adds	r2, #1
c0de1468:	e7a0      	b.n	c0de13ac <poly_schoolbook_t1+0x44>
c0de146a:	bf00      	nop
c0de146c:	ffffe000 	.word	0xffffe000

c0de1470 <polyt1_unpack_idx>:
c0de1470:	088a      	lsrs	r2, r1, #2
c0de1472:	f001 0103 	and.w	r1, r1, #3
c0de1476:	eb02 0282 	add.w	r2, r2, r2, lsl #2
c0de147a:	2902      	cmp	r1, #2
c0de147c:	4410      	add	r0, r2
c0de147e:	d006      	beq.n	c0de148e <polyt1_unpack_idx+0x1e>
c0de1480:	2901      	cmp	r1, #1
c0de1482:	d009      	beq.n	c0de1498 <polyt1_unpack_idx+0x28>
c0de1484:	b969      	cbnz	r1, c0de14a2 <polyt1_unpack_idx+0x32>
c0de1486:	7801      	ldrb	r1, [r0, #0]
c0de1488:	2208      	movs	r2, #8
c0de148a:	2301      	movs	r3, #1
c0de148c:	e00d      	b.n	c0de14aa <polyt1_unpack_idx+0x3a>
c0de148e:	7881      	ldrb	r1, [r0, #2]
c0de1490:	2204      	movs	r2, #4
c0de1492:	2303      	movs	r3, #3
c0de1494:	0909      	lsrs	r1, r1, #4
c0de1496:	e008      	b.n	c0de14aa <polyt1_unpack_idx+0x3a>
c0de1498:	7841      	ldrb	r1, [r0, #1]
c0de149a:	2206      	movs	r2, #6
c0de149c:	2302      	movs	r3, #2
c0de149e:	0889      	lsrs	r1, r1, #2
c0de14a0:	e003      	b.n	c0de14aa <polyt1_unpack_idx+0x3a>
c0de14a2:	78c1      	ldrb	r1, [r0, #3]
c0de14a4:	2202      	movs	r2, #2
c0de14a6:	2304      	movs	r3, #4
c0de14a8:	0989      	lsrs	r1, r1, #6
c0de14aa:	5cc0      	ldrb	r0, [r0, r3]
c0de14ac:	4090      	lsls	r0, r2
c0de14ae:	f400 707f 	and.w	r0, r0, #1020	@ 0x3fc
c0de14b2:	4308      	orrs	r0, r1
c0de14b4:	4770      	bx	lr

c0de14b6 <polyw_pack>:
c0de14b6:	b5b0      	push	{r4, r5, r7, lr}
c0de14b8:	4605      	mov	r5, r0
c0de14ba:	4608      	mov	r0, r1
c0de14bc:	460c      	mov	r4, r1
c0de14be:	f000 fb23 	bl	c0de1b08 <pqcrystals_dilithium2_lowram_poly_reduce>
c0de14c2:	4620      	mov	r0, r4
c0de14c4:	f000 fb2f 	bl	c0de1b26 <pqcrystals_dilithium2_lowram_poly_caddq>
c0de14c8:	2000      	movs	r0, #0
c0de14ca:	f5b0 7f80 	cmp.w	r0, #256	@ 0x100
c0de14ce:	bf08      	it	eq
c0de14d0:	bdb0      	popeq	{r4, r5, r7, pc}
c0de14d2:	f854 1020 	ldr.w	r1, [r4, r0, lsl #2]
c0de14d6:	eb00 0240 	add.w	r2, r0, r0, lsl #1
c0de14da:	54a9      	strb	r1, [r5, r2]
c0de14dc:	18a9      	adds	r1, r5, r2
c0de14de:	f854 2020 	ldr.w	r2, [r4, r0, lsl #2]
c0de14e2:	0a12      	lsrs	r2, r2, #8
c0de14e4:	704a      	strb	r2, [r1, #1]
c0de14e6:	eb04 0280 	add.w	r2, r4, r0, lsl #2
c0de14ea:	3001      	adds	r0, #1
c0de14ec:	8852      	ldrh	r2, [r2, #2]
c0de14ee:	708a      	strb	r2, [r1, #2]
c0de14f0:	e7eb      	b.n	c0de14ca <polyw_pack+0x14>

c0de14f2 <polyw_unpack>:
c0de14f2:	b5b0      	push	{r4, r5, r7, lr}
c0de14f4:	2200      	movs	r2, #0
c0de14f6:	f5b2 7f80 	cmp.w	r2, #256	@ 0x100
c0de14fa:	bf08      	it	eq
c0de14fc:	bdb0      	popeq	{r4, r5, r7, pc}
c0de14fe:	eb02 0342 	add.w	r3, r2, r2, lsl #1
c0de1502:	5ccc      	ldrb	r4, [r1, r3]
c0de1504:	440b      	add	r3, r1
c0de1506:	f840 4022 	str.w	r4, [r0, r2, lsl #2]
c0de150a:	785d      	ldrb	r5, [r3, #1]
c0de150c:	ea44 2405 	orr.w	r4, r4, r5, lsl #8
c0de1510:	f840 4022 	str.w	r4, [r0, r2, lsl #2]
c0de1514:	789b      	ldrb	r3, [r3, #2]
c0de1516:	ea44 4303 	orr.w	r3, r4, r3, lsl #16
c0de151a:	f840 3022 	str.w	r3, [r0, r2, lsl #2]
c0de151e:	3201      	adds	r2, #1
c0de1520:	e7e9      	b.n	c0de14f6 <polyw_unpack+0x4>

c0de1522 <polyw_sub>:
c0de1522:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de1524:	3102      	adds	r1, #2
c0de1526:	2300      	movs	r3, #0
c0de1528:	f5b3 7f80 	cmp.w	r3, #256	@ 0x100
c0de152c:	bf08      	it	eq
c0de152e:	bdf0      	popeq	{r4, r5, r6, r7, pc}
c0de1530:	f811 5c02 	ldrb.w	r5, [r1, #-2]
c0de1534:	f811 6c01 	ldrb.w	r6, [r1, #-1]
c0de1538:	f811 7b03 	ldrb.w	r7, [r1], #3
c0de153c:	f852 4023 	ldr.w	r4, [r2, r3, lsl #2]
c0de1540:	ea45 2506 	orr.w	r5, r5, r6, lsl #8
c0de1544:	ea45 4507 	orr.w	r5, r5, r7, lsl #16
c0de1548:	1b2c      	subs	r4, r5, r4
c0de154a:	f840 4023 	str.w	r4, [r0, r3, lsl #2]
c0de154e:	3301      	adds	r3, #1
c0de1550:	e7ea      	b.n	c0de1528 <polyw_sub+0x6>

c0de1552 <poly_highbits>:
c0de1552:	b5b0      	push	{r4, r5, r7, lr}
c0de1554:	2200      	movs	r2, #0
c0de1556:	f642 430b 	movw	r3, #11275	@ 0x2c0b
c0de155a:	f5b2 7f80 	cmp.w	r2, #256	@ 0x100
c0de155e:	bf08      	it	eq
c0de1560:	bdb0      	popeq	{r4, r5, r7, pc}
c0de1562:	f851 4022 	ldr.w	r4, [r1, r2, lsl #2]
c0de1566:	347f      	adds	r4, #127	@ 0x7f
c0de1568:	11e4      	asrs	r4, r4, #7
c0de156a:	435c      	muls	r4, r3
c0de156c:	f504 0500 	add.w	r5, r4, #8388608	@ 0x800000
c0de1570:	162d      	asrs	r5, r5, #24
c0de1572:	f1b4 5f2e 	cmp.w	r4, #729808896	@ 0x2b800000
c0de1576:	bfa8      	it	ge
c0de1578:	2500      	movge	r5, #0
c0de157a:	f840 5022 	str.w	r5, [r0, r2, lsl #2]
c0de157e:	3201      	adds	r2, #1
c0de1580:	e7eb      	b.n	c0de155a <poly_highbits+0x8>
	...

c0de1584 <poly_lowbits>:
c0de1584:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de1588:	4e13      	ldr	r6, [pc, #76]	@ (c0de15d8 <poly_lowbits+0x54>)
c0de158a:	4f15      	ldr	r7, [pc, #84]	@ (c0de15e0 <poly_lowbits+0x5c>)
c0de158c:	2200      	movs	r2, #0
c0de158e:	f642 4c0b 	movw	ip, #11275	@ 0x2c0b
c0de1592:	f06f 0e01 	mvn.w	lr, #1
c0de1596:	46b0      	mov	r8, r6
c0de1598:	4e10      	ldr	r6, [pc, #64]	@ (c0de15dc <poly_lowbits+0x58>)
c0de159a:	f5b2 7f80 	cmp.w	r2, #256	@ 0x100
c0de159e:	bf08      	it	eq
c0de15a0:	e8bd 81f0 	ldmiaeq.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de15a4:	f851 3022 	ldr.w	r3, [r1, r2, lsl #2]
c0de15a8:	f103 047f 	add.w	r4, r3, #127	@ 0x7f
c0de15ac:	11e4      	asrs	r4, r4, #7
c0de15ae:	fb04 f40c 	mul.w	r4, r4, ip
c0de15b2:	f504 0500 	add.w	r5, r4, #8388608	@ 0x800000
c0de15b6:	f1b4 5f2e 	cmp.w	r4, #729808896	@ 0x2b800000
c0de15ba:	4644      	mov	r4, r8
c0de15bc:	ea0e 55e5 	and.w	r5, lr, r5, asr #23
c0de15c0:	bfb8      	it	lt
c0de15c2:	fb05 3308 	mlalt	r3, r5, r8, r3
c0de15c6:	42bb      	cmp	r3, r7
c0de15c8:	4634      	mov	r4, r6
c0de15ca:	bfc8      	it	gt
c0de15cc:	4433      	addgt	r3, r6
c0de15ce:	f840 3022 	str.w	r3, [r0, r2, lsl #2]
c0de15d2:	3201      	adds	r2, #1
c0de15d4:	e7e1      	b.n	c0de159a <poly_lowbits+0x16>
c0de15d6:	bf00      	nop
c0de15d8:	fffe8c00 	.word	0xfffe8c00
c0de15dc:	ff801fff 	.word	0xff801fff
c0de15e0:	003ff000 	.word	0x003ff000

c0de15e4 <unpack_sk_s1>:
c0de15e4:	eb02 0242 	add.w	r2, r2, r2, lsl #1
c0de15e8:	eb01 1142 	add.w	r1, r1, r2, lsl #5
c0de15ec:	3180      	adds	r1, #128	@ 0x80
c0de15ee:	f001 bb1e 	b.w	c0de2c2e <small_polyeta_unpack>

c0de15f2 <unpack_sk_s2>:
c0de15f2:	eb02 0242 	add.w	r2, r2, r2, lsl #1
c0de15f6:	eb01 1142 	add.w	r1, r1, r2, lsl #5
c0de15fa:	f501 7100 	add.w	r1, r1, #512	@ 0x200
c0de15fe:	f001 bb16 	b.w	c0de2c2e <small_polyeta_unpack>

c0de1602 <polyw_add_idx>:
c0de1602:	b570      	push	{r4, r5, r6, lr}
c0de1604:	4604      	mov	r4, r0
c0de1606:	eb02 0542 	add.w	r5, r2, r2, lsl #1
c0de160a:	1966      	adds	r6, r4, r5
c0de160c:	5d40      	ldrb	r0, [r0, r5]
c0de160e:	7872      	ldrb	r2, [r6, #1]
c0de1610:	78b3      	ldrb	r3, [r6, #2]
c0de1612:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de1616:	ea40 4003 	orr.w	r0, r0, r3, lsl #16
c0de161a:	4408      	add	r0, r1
c0de161c:	f000 fd88 	bl	c0de2130 <pqcrystals_dilithium2_lowram_freeze>
c0de1620:	0c01      	lsrs	r1, r0, #16
c0de1622:	5560      	strb	r0, [r4, r5]
c0de1624:	0a00      	lsrs	r0, r0, #8
c0de1626:	70b1      	strb	r1, [r6, #2]
c0de1628:	7070      	strb	r0, [r6, #1]
c0de162a:	bd70      	pop	{r4, r5, r6, pc}

c0de162c <poly_uniform_pointwise_montgomery_polywadd_lowram_eth>:
c0de162c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de1630:	f5ad 7d06 	sub.w	sp, sp, #536	@ 0x218
c0de1634:	f10d 0808 	add.w	r8, sp, #8
c0de1638:	4683      	mov	fp, r0
c0de163a:	461e      	mov	r6, r3
c0de163c:	4617      	mov	r7, r2
c0de163e:	468a      	mov	sl, r1
c0de1640:	4640      	mov	r0, r8
c0de1642:	f7ff fc85 	bl	c0de0f50 <inner_keccak256_init>
c0de1646:	4640      	mov	r0, r8
c0de1648:	4639      	mov	r1, r7
c0de164a:	2220      	movs	r2, #32
c0de164c:	f7ff fc91 	bl	c0de0f72 <inner_keccak256_inject>
c0de1650:	0a30      	lsrs	r0, r6, #8
c0de1652:	f10d 0106 	add.w	r1, sp, #6
c0de1656:	2202      	movs	r2, #2
c0de1658:	f88d 6006 	strb.w	r6, [sp, #6]
c0de165c:	f88d 0007 	strb.w	r0, [sp, #7]
c0de1660:	4640      	mov	r0, r8
c0de1662:	f7ff fc86 	bl	c0de0f72 <inner_keccak256_inject>
c0de1666:	4640      	mov	r0, r8
c0de1668:	f7ff fc95 	bl	c0de0f96 <inner_keccak256_flip>
c0de166c:	4c10      	ldr	r4, [pc, #64]	@ (c0de16b0 <poly_uniform_pointwise_montgomery_polywadd_lowram_eth+0x84>)
c0de166e:	2700      	movs	r7, #0
c0de1670:	f20d 260f 	addw	r6, sp, #527	@ 0x20f
c0de1674:	4640      	mov	r0, r8
c0de1676:	4631      	mov	r1, r6
c0de1678:	2209      	movs	r2, #9
c0de167a:	f7ff fca2 	bl	c0de0fc2 <inner_keccak256_extract>
c0de167e:	2500      	movs	r5, #0
c0de1680:	2d06      	cmp	r5, #6
c0de1682:	bf98      	it	ls
c0de1684:	f5b7 7f80 	cmpls.w	r7, #256	@ 0x100
c0de1688:	d20b      	bcs.n	c0de16a2 <poly_uniform_pointwise_montgomery_polywadd_lowram_eth+0x76>
c0de168a:	f000 f99a 	bl	c0de19c2 <OUTLINED_FUNCTION_0>
c0de168e:	d806      	bhi.n	c0de169e <poly_uniform_pointwise_montgomery_polywadd_lowram_eth+0x72>
c0de1690:	f85a 1027 	ldr.w	r1, [sl, r7, lsl #2]
c0de1694:	f000 f9b0 	bl	c0de19f8 <OUTLINED_FUNCTION_3>
c0de1698:	f000 f9b2 	bl	c0de1a00 <OUTLINED_FUNCTION_4>
c0de169c:	3701      	adds	r7, #1
c0de169e:	3503      	adds	r5, #3
c0de16a0:	e7ee      	b.n	c0de1680 <poly_uniform_pointwise_montgomery_polywadd_lowram_eth+0x54>
c0de16a2:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de16a6:	d3e5      	bcc.n	c0de1674 <poly_uniform_pointwise_montgomery_polywadd_lowram_eth+0x48>
c0de16a8:	f50d 7d06 	add.w	sp, sp, #536	@ 0x218
c0de16ac:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de16b0:	007fe000 	.word	0x007fe000

c0de16b4 <polyz_unpack_inplace>:
c0de16b4:	b5b0      	push	{r4, r5, r7, lr}
c0de16b6:	7801      	ldrb	r1, [r0, #0]
c0de16b8:	7883      	ldrb	r3, [r0, #2]
c0de16ba:	7842      	ldrb	r2, [r0, #1]
c0de16bc:	78c4      	ldrb	r4, [r0, #3]
c0de16be:	7a05      	ldrb	r5, [r0, #8]
c0de16c0:	f363 4111 	bfi	r1, r3, #16, #2
c0de16c4:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de16c8:	79c2      	ldrb	r2, [r0, #7]
c0de16ca:	f5c1 3100 	rsb	r1, r1, #131072	@ 0x20000
c0de16ce:	6001      	str	r1, [r0, #0]
c0de16d0:	7981      	ldrb	r1, [r0, #6]
c0de16d2:	0092      	lsls	r2, r2, #2
c0de16d4:	ea42 1291 	orr.w	r2, r2, r1, lsr #6
c0de16d8:	f001 013f 	and.w	r1, r1, #63	@ 0x3f
c0de16dc:	ea42 2285 	orr.w	r2, r2, r5, lsl #10
c0de16e0:	7945      	ldrb	r5, [r0, #5]
c0de16e2:	f5c2 3200 	rsb	r2, r2, #131072	@ 0x20000
c0de16e6:	60c2      	str	r2, [r0, #12]
c0de16e8:	7902      	ldrb	r2, [r0, #4]
c0de16ea:	012d      	lsls	r5, r5, #4
c0de16ec:	ea45 1512 	orr.w	r5, r5, r2, lsr #4
c0de16f0:	ea45 3101 	orr.w	r1, r5, r1, lsl #12
c0de16f4:	f5c1 3100 	rsb	r1, r1, #131072	@ 0x20000
c0de16f8:	6081      	str	r1, [r0, #8]
c0de16fa:	0899      	lsrs	r1, r3, #2
c0de16fc:	f362 3191 	bfi	r1, r2, #14, #4
c0de1700:	ea41 1184 	orr.w	r1, r1, r4, lsl #6
c0de1704:	f5c1 3100 	rsb	r1, r1, #131072	@ 0x20000
c0de1708:	6041      	str	r1, [r0, #4]
c0de170a:	bdb0      	pop	{r4, r5, r7, pc}

c0de170c <poly_uniform_gamma1_lowram_eth>:
c0de170c:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de170e:	b085      	sub	sp, #20
c0de1710:	4605      	mov	r5, r0
c0de1712:	4618      	mov	r0, r3
c0de1714:	461c      	mov	r4, r3
c0de1716:	4616      	mov	r6, r2
c0de1718:	460f      	mov	r7, r1
c0de171a:	f7ff fc19 	bl	c0de0f50 <inner_keccak256_init>
c0de171e:	4620      	mov	r0, r4
c0de1720:	4639      	mov	r1, r7
c0de1722:	2240      	movs	r2, #64	@ 0x40
c0de1724:	f7ff fc25 	bl	c0de0f72 <inner_keccak256_inject>
c0de1728:	0a30      	lsrs	r0, r6, #8
c0de172a:	f10d 0102 	add.w	r1, sp, #2
c0de172e:	2202      	movs	r2, #2
c0de1730:	f88d 6002 	strb.w	r6, [sp, #2]
c0de1734:	f88d 0003 	strb.w	r0, [sp, #3]
c0de1738:	4620      	mov	r0, r4
c0de173a:	f7ff fc1a 	bl	c0de0f72 <inner_keccak256_inject>
c0de173e:	4620      	mov	r0, r4
c0de1740:	f7ff fc29 	bl	c0de0f96 <inner_keccak256_flip>
c0de1744:	2700      	movs	r7, #0
c0de1746:	ae01      	add	r6, sp, #4
c0de1748:	2f40      	cmp	r7, #64	@ 0x40
c0de174a:	bf04      	itt	eq
c0de174c:	b005      	addeq	sp, #20
c0de174e:	bdf0      	popeq	{r4, r5, r6, r7, pc}
c0de1750:	4620      	mov	r0, r4
c0de1752:	4631      	mov	r1, r6
c0de1754:	2209      	movs	r2, #9
c0de1756:	f7ff fc34 	bl	c0de0fc2 <inner_keccak256_extract>
c0de175a:	4630      	mov	r0, r6
c0de175c:	f7ff ffaa 	bl	c0de16b4 <polyz_unpack_inplace>
c0de1760:	2000      	movs	r0, #0
c0de1762:	2804      	cmp	r0, #4
c0de1764:	d005      	beq.n	c0de1772 <poly_uniform_gamma1_lowram_eth+0x66>
c0de1766:	f856 1020 	ldr.w	r1, [r6, r0, lsl #2]
c0de176a:	f845 1020 	str.w	r1, [r5, r0, lsl #2]
c0de176e:	3001      	adds	r0, #1
c0de1770:	e7f7      	b.n	c0de1762 <poly_uniform_gamma1_lowram_eth+0x56>
c0de1772:	3510      	adds	r5, #16
c0de1774:	3701      	adds	r7, #1
c0de1776:	e7e7      	b.n	c0de1748 <poly_uniform_gamma1_lowram_eth+0x3c>

c0de1778 <poly_uniform_gamma1_add_lowram_eth>:
c0de1778:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de177c:	b085      	sub	sp, #20
c0de177e:	f8dd a030 	ldr.w	sl, [sp, #48]	@ 0x30
c0de1782:	4605      	mov	r5, r0
c0de1784:	461f      	mov	r7, r3
c0de1786:	4690      	mov	r8, r2
c0de1788:	460c      	mov	r4, r1
c0de178a:	4650      	mov	r0, sl
c0de178c:	f7ff fbe0 	bl	c0de0f50 <inner_keccak256_init>
c0de1790:	4650      	mov	r0, sl
c0de1792:	4641      	mov	r1, r8
c0de1794:	2240      	movs	r2, #64	@ 0x40
c0de1796:	f7ff fbec 	bl	c0de0f72 <inner_keccak256_inject>
c0de179a:	0a38      	lsrs	r0, r7, #8
c0de179c:	f10d 0102 	add.w	r1, sp, #2
c0de17a0:	2202      	movs	r2, #2
c0de17a2:	f88d 7002 	strb.w	r7, [sp, #2]
c0de17a6:	f88d 0003 	strb.w	r0, [sp, #3]
c0de17aa:	4650      	mov	r0, sl
c0de17ac:	f7ff fbe1 	bl	c0de0f72 <inner_keccak256_inject>
c0de17b0:	4650      	mov	r0, sl
c0de17b2:	f7ff fbf0 	bl	c0de0f96 <inner_keccak256_flip>
c0de17b6:	2600      	movs	r6, #0
c0de17b8:	af01      	add	r7, sp, #4
c0de17ba:	2e40      	cmp	r6, #64	@ 0x40
c0de17bc:	d011      	beq.n	c0de17e2 <poly_uniform_gamma1_add_lowram_eth+0x6a>
c0de17be:	4650      	mov	r0, sl
c0de17c0:	4639      	mov	r1, r7
c0de17c2:	2209      	movs	r2, #9
c0de17c4:	f7ff fbfd 	bl	c0de0fc2 <inner_keccak256_extract>
c0de17c8:	4638      	mov	r0, r7
c0de17ca:	f7ff ff73 	bl	c0de16b4 <polyz_unpack_inplace>
c0de17ce:	2000      	movs	r0, #0
c0de17d0:	2804      	cmp	r0, #4
c0de17d2:	d002      	beq.n	c0de17da <poly_uniform_gamma1_add_lowram_eth+0x62>
c0de17d4:	f000 f901 	bl	c0de19da <OUTLINED_FUNCTION_1>
c0de17d8:	e7fa      	b.n	c0de17d0 <poly_uniform_gamma1_add_lowram_eth+0x58>
c0de17da:	3410      	adds	r4, #16
c0de17dc:	3510      	adds	r5, #16
c0de17de:	3601      	adds	r6, #1
c0de17e0:	e7eb      	b.n	c0de17ba <poly_uniform_gamma1_add_lowram_eth+0x42>
c0de17e2:	b005      	add	sp, #20
c0de17e4:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}

c0de17e8 <poly_make_hint_lowram>:
c0de17e8:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de17ec:	4686      	mov	lr, r0
c0de17ee:	481a      	ldr	r0, [pc, #104]	@ (c0de1858 <poly_make_hint_lowram+0x70>)
c0de17f0:	1c93      	adds	r3, r2, #2
c0de17f2:	468c      	mov	ip, r1
c0de17f4:	2200      	movs	r2, #0
c0de17f6:	f642 450b 	movw	r5, #11275	@ 0x2c0b
c0de17fa:	2600      	movs	r6, #0
c0de17fc:	4680      	mov	r8, r0
c0de17fe:	f5b6 7f80 	cmp.w	r6, #256	@ 0x100
c0de1802:	d026      	beq.n	c0de1852 <poly_make_hint_lowram+0x6a>
c0de1804:	f813 4c02 	ldrb.w	r4, [r3, #-2]
c0de1808:	f813 1c01 	ldrb.w	r1, [r3, #-1]
c0de180c:	f813 0b03 	ldrb.w	r0, [r3], #3
c0de1810:	f85c 7026 	ldr.w	r7, [ip, r6, lsl #2]
c0de1814:	ea44 2101 	orr.w	r1, r4, r1, lsl #8
c0de1818:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de181c:	307f      	adds	r0, #127	@ 0x7f
c0de181e:	19c1      	adds	r1, r0, r7
c0de1820:	4647      	mov	r7, r8
c0de1822:	11c9      	asrs	r1, r1, #7
c0de1824:	4369      	muls	r1, r5
c0de1826:	f501 0400 	add.w	r4, r1, #8388608	@ 0x800000
c0de182a:	1624      	asrs	r4, r4, #24
c0de182c:	4541      	cmp	r1, r8
c0de182e:	bfc8      	it	gt
c0de1830:	2400      	movgt	r4, #0
c0de1832:	09c0      	lsrs	r0, r0, #7
c0de1834:	4368      	muls	r0, r5
c0de1836:	f500 0100 	add.w	r1, r0, #8388608	@ 0x800000
c0de183a:	0e09      	lsrs	r1, r1, #24
c0de183c:	4540      	cmp	r0, r8
c0de183e:	bf88      	it	hi
c0de1840:	2100      	movhi	r1, #0
c0de1842:	1a60      	subs	r0, r4, r1
c0de1844:	bf18      	it	ne
c0de1846:	2001      	movne	r0, #1
c0de1848:	f84e 0026 	str.w	r0, [lr, r6, lsl #2]
c0de184c:	4402      	add	r2, r0
c0de184e:	3601      	adds	r6, #1
c0de1850:	e7d5      	b.n	c0de17fe <poly_make_hint_lowram+0x16>
c0de1852:	4610      	mov	r0, r2
c0de1854:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de1858:	2b7fffff 	.word	0x2b7fffff

c0de185c <unpack_sig_h_indices>:
c0de185c:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de1860:	f503 6c12 	add.w	ip, r3, #2336	@ 0x920
c0de1864:	b142      	cbz	r2, c0de1878 <unpack_sig_h_indices+0x1c>
c0de1866:	eb02 0e0c 	add.w	lr, r2, ip
c0de186a:	f81e 6f50 	ldrb.w	r6, [lr, #80]!
c0de186e:	f81e 5c01 	ldrb.w	r5, [lr, #-1]
c0de1872:	42b5      	cmp	r5, r6
c0de1874:	d905      	bls.n	c0de1882 <unpack_sig_h_indices+0x26>
c0de1876:	e006      	b.n	c0de1886 <unpack_sig_h_indices+0x2a>
c0de1878:	f893 6970 	ldrb.w	r6, [r3, #2416]	@ 0x970
c0de187c:	f503 6e17 	add.w	lr, r3, #2416	@ 0x970
c0de1880:	2500      	movs	r5, #0
c0de1882:	2e50      	cmp	r6, #80	@ 0x50
c0de1884:	d902      	bls.n	c0de188c <unpack_sig_h_indices+0x30>
c0de1886:	2001      	movs	r0, #1
c0de1888:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de188c:	eb03 0805 	add.w	r8, r3, r5
c0de1890:	2700      	movs	r7, #0
c0de1892:	19ea      	adds	r2, r5, r7
c0de1894:	42b2      	cmp	r2, r6
c0de1896:	d20e      	bcs.n	c0de18b6 <unpack_sig_h_indices+0x5a>
c0de1898:	eb08 0407 	add.w	r4, r8, r7
c0de189c:	42aa      	cmp	r2, r5
c0de189e:	f894 6920 	ldrb.w	r6, [r4, #2336]	@ 0x920
c0de18a2:	d903      	bls.n	c0de18ac <unpack_sig_h_indices+0x50>
c0de18a4:	f894 291f 	ldrb.w	r2, [r4, #2335]	@ 0x91f
c0de18a8:	4296      	cmp	r6, r2
c0de18aa:	d9ec      	bls.n	c0de1886 <unpack_sig_h_indices+0x2a>
c0de18ac:	55c6      	strb	r6, [r0, r7]
c0de18ae:	3701      	adds	r7, #1
c0de18b0:	f89e 6000 	ldrb.w	r6, [lr]
c0de18b4:	e7ed      	b.n	c0de1892 <unpack_sig_h_indices+0x36>
c0de18b6:	600f      	str	r7, [r1, #0]
c0de18b8:	f893 0973 	ldrb.w	r0, [r3, #2419]	@ 0x973
c0de18bc:	4601      	mov	r1, r0
c0de18be:	284f      	cmp	r0, #79	@ 0x4f
c0de18c0:	d804      	bhi.n	c0de18cc <unpack_sig_h_indices+0x70>
c0de18c2:	f81c 2001 	ldrb.w	r2, [ip, r1]
c0de18c6:	1c48      	adds	r0, r1, #1
c0de18c8:	2a00      	cmp	r2, #0
c0de18ca:	d0f7      	beq.n	c0de18bc <unpack_sig_h_indices+0x60>
c0de18cc:	2000      	movs	r0, #0
c0de18ce:	2950      	cmp	r1, #80	@ 0x50
c0de18d0:	bf38      	it	cc
c0de18d2:	2001      	movcc	r0, #1
c0de18d4:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

c0de18d8 <poly_use_hint_lowram>:
c0de18d8:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de18dc:	4698      	mov	r8, r3
c0de18de:	4615      	mov	r5, r2
c0de18e0:	460e      	mov	r6, r1
c0de18e2:	4607      	mov	r7, r0
c0de18e4:	2400      	movs	r4, #0
c0de18e6:	f5b4 7f80 	cmp.w	r4, #256	@ 0x100
c0de18ea:	bf08      	it	eq
c0de18ec:	e8bd 81f0 	ldmiaeq.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de18f0:	4628      	mov	r0, r5
c0de18f2:	4641      	mov	r1, r8
c0de18f4:	b131      	cbz	r1, c0de1904 <poly_use_hint_lowram+0x2c>
c0de18f6:	f810 2b01 	ldrb.w	r2, [r0], #1
c0de18fa:	3901      	subs	r1, #1
c0de18fc:	4294      	cmp	r4, r2
c0de18fe:	d1f9      	bne.n	c0de18f4 <poly_use_hint_lowram+0x1c>
c0de1900:	2101      	movs	r1, #1
c0de1902:	e000      	b.n	c0de1906 <poly_use_hint_lowram+0x2e>
c0de1904:	2100      	movs	r1, #0
c0de1906:	f856 0024 	ldr.w	r0, [r6, r4, lsl #2]
c0de190a:	f000 fc4b 	bl	c0de21a4 <pqcrystals_dilithium2_lowram_use_hint>
c0de190e:	f847 0024 	str.w	r0, [r7, r4, lsl #2]
c0de1912:	3401      	adds	r4, #1
c0de1914:	e7e7      	b.n	c0de18e6 <poly_use_hint_lowram+0xe>

c0de1916 <pack_pk_rho>:
c0de1916:	2200      	movs	r2, #0
c0de1918:	2a20      	cmp	r2, #32
c0de191a:	bf08      	it	eq
c0de191c:	4770      	bxeq	lr
c0de191e:	5c8b      	ldrb	r3, [r1, r2]
c0de1920:	5483      	strb	r3, [r0, r2]
c0de1922:	3201      	adds	r2, #1
c0de1924:	e7f8      	b.n	c0de1918 <pack_pk_rho+0x2>

c0de1926 <pack_pk_t1>:
c0de1926:	eb02 0282 	add.w	r2, r2, r2, lsl #2
c0de192a:	eb00 1082 	add.w	r0, r0, r2, lsl #6
c0de192e:	3020      	adds	r0, #32
c0de1930:	f000 bb06 	b.w	c0de1f40 <pqcrystals_dilithium2_lowram_polyt1_pack>

c0de1934 <pack_sk_s1>:
c0de1934:	eb02 0242 	add.w	r2, r2, r2, lsl #1
c0de1938:	eb00 1042 	add.w	r0, r0, r2, lsl #5
c0de193c:	3080      	adds	r0, #128	@ 0x80
c0de193e:	f000 ba66 	b.w	c0de1e0e <pqcrystals_dilithium2_lowram_polyeta_pack>

c0de1942 <pack_sk_s2>:
c0de1942:	eb02 0242 	add.w	r2, r2, r2, lsl #1
c0de1946:	eb00 1042 	add.w	r0, r0, r2, lsl #5
c0de194a:	f500 7000 	add.w	r0, r0, #512	@ 0x200
c0de194e:	f000 ba5e 	b.w	c0de1e0e <pqcrystals_dilithium2_lowram_polyeta_pack>

c0de1952 <pack_sk_t0>:
c0de1952:	f44f 73d0 	mov.w	r3, #416	@ 0x1a0
c0de1956:	fb02 0003 	mla	r0, r2, r3, r0
c0de195a:	f500 7060 	add.w	r0, r0, #896	@ 0x380
c0de195e:	f000 bb13 	b.w	c0de1f88 <pqcrystals_dilithium2_lowram_polyt0_pack>

c0de1962 <pack_sk_rho>:
c0de1962:	2200      	movs	r2, #0
c0de1964:	2a20      	cmp	r2, #32
c0de1966:	bf08      	it	eq
c0de1968:	4770      	bxeq	lr
c0de196a:	5c8b      	ldrb	r3, [r1, r2]
c0de196c:	5483      	strb	r3, [r0, r2]
c0de196e:	3201      	adds	r2, #1
c0de1970:	e7f8      	b.n	c0de1964 <pack_sk_rho+0x2>

c0de1972 <pack_sk_key>:
c0de1972:	3020      	adds	r0, #32
c0de1974:	2200      	movs	r2, #0
c0de1976:	2a20      	cmp	r2, #32
c0de1978:	bf08      	it	eq
c0de197a:	4770      	bxeq	lr
c0de197c:	5c8b      	ldrb	r3, [r1, r2]
c0de197e:	5483      	strb	r3, [r0, r2]
c0de1980:	3201      	adds	r2, #1
c0de1982:	e7f8      	b.n	c0de1976 <pack_sk_key+0x4>

c0de1984 <pack_sk_tr>:
c0de1984:	3040      	adds	r0, #64	@ 0x40
c0de1986:	2200      	movs	r2, #0
c0de1988:	2a40      	cmp	r2, #64	@ 0x40
c0de198a:	bf08      	it	eq
c0de198c:	4770      	bxeq	lr
c0de198e:	5c8b      	ldrb	r3, [r1, r2]
c0de1990:	5483      	strb	r3, [r0, r2]
c0de1992:	3201      	adds	r2, #1
c0de1994:	e7f8      	b.n	c0de1988 <pack_sk_tr+0x4>

c0de1996 <pqcrystals_dilithium2_lowram_poly_pointwise_acc_montgomery>:
c0de1996:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de1998:	4614      	mov	r4, r2
c0de199a:	460d      	mov	r5, r1
c0de199c:	4606      	mov	r6, r0
c0de199e:	2700      	movs	r7, #0
c0de19a0:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de19a4:	bf08      	it	eq
c0de19a6:	bdf8      	popeq	{r3, r4, r5, r6, r7, pc}
c0de19a8:	f855 0027 	ldr.w	r0, [r5, r7, lsl #2]
c0de19ac:	f854 1027 	ldr.w	r1, [r4, r7, lsl #2]
c0de19b0:	f000 f822 	bl	c0de19f8 <OUTLINED_FUNCTION_3>
c0de19b4:	f856 1027 	ldr.w	r1, [r6, r7, lsl #2]
c0de19b8:	4408      	add	r0, r1
c0de19ba:	f846 0027 	str.w	r0, [r6, r7, lsl #2]
c0de19be:	3701      	adds	r7, #1
c0de19c0:	e7ee      	b.n	c0de19a0 <pqcrystals_dilithium2_lowram_poly_pointwise_acc_montgomery+0xa>

c0de19c2 <OUTLINED_FUNCTION_0>:
c0de19c2:	1971      	adds	r1, r6, r5
c0de19c4:	5d70      	ldrb	r0, [r6, r5]
c0de19c6:	784a      	ldrb	r2, [r1, #1]
c0de19c8:	7889      	ldrb	r1, [r1, #2]
c0de19ca:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de19ce:	f001 017f 	and.w	r1, r1, #127	@ 0x7f
c0de19d2:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de19d6:	42a0      	cmp	r0, r4
c0de19d8:	4770      	bx	lr

c0de19da <OUTLINED_FUNCTION_1>:
c0de19da:	f857 1020 	ldr.w	r1, [r7, r0, lsl #2]
c0de19de:	f854 2020 	ldr.w	r2, [r4, r0, lsl #2]
c0de19e2:	4411      	add	r1, r2
c0de19e4:	f845 1020 	str.w	r1, [r5, r0, lsl #2]
c0de19e8:	3001      	adds	r0, #1
c0de19ea:	4770      	bx	lr

c0de19ec <OUTLINED_FUNCTION_2>:
c0de19ec:	f815 0b01 	ldrb.w	r0, [r5], #1
c0de19f0:	2100      	movs	r1, #0
c0de19f2:	463a      	mov	r2, r7
c0de19f4:	f009 b9ae 	b.w	c0dead54 <__aeabi_llsl>

c0de19f8 <OUTLINED_FUNCTION_3>:
c0de19f8:	fb81 0100 	smull	r0, r1, r1, r0
c0de19fc:	f000 bb7a 	b.w	c0de20f4 <pqcrystals_dilithium2_lowram_montgomery_reduce>

c0de1a00 <OUTLINED_FUNCTION_4>:
c0de1a00:	4601      	mov	r1, r0
c0de1a02:	4658      	mov	r0, fp
c0de1a04:	463a      	mov	r2, r7
c0de1a06:	f7ff bdfc 	b.w	c0de1602 <polyw_add_idx>
	...

c0de1a0c <pqcrystals_dilithium2_lowram_ntt>:
c0de1a0c:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de1a10:	4604      	mov	r4, r0
c0de1a12:	4817      	ldr	r0, [pc, #92]	@ (c0de1a70 <pqcrystals_dilithium2_lowram_ntt+0x64>)
c0de1a14:	f04f 0880 	mov.w	r8, #128	@ 0x80
c0de1a18:	f04f 0a00 	mov.w	sl, #0
c0de1a1c:	4478      	add	r0, pc
c0de1a1e:	9001      	str	r0, [sp, #4]
c0de1a20:	f1b8 0f00 	cmp.w	r8, #0
c0de1a24:	bf08      	it	eq
c0de1a26:	e8bd 8dfc 	ldmiaeq.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de1a2a:	2700      	movs	r7, #0
c0de1a2c:	2fff      	cmp	r7, #255	@ 0xff
c0de1a2e:	d81c      	bhi.n	c0de1a6a <pqcrystals_dilithium2_lowram_ntt+0x5e>
c0de1a30:	9801      	ldr	r0, [sp, #4]
c0de1a32:	f10a 0a01 	add.w	sl, sl, #1
c0de1a36:	eb07 0608 	add.w	r6, r7, r8
c0de1a3a:	4635      	mov	r5, r6
c0de1a3c:	f850 b02a 	ldr.w	fp, [r0, sl, lsl #2]
c0de1a40:	42b7      	cmp	r7, r6
c0de1a42:	d210      	bcs.n	c0de1a66 <pqcrystals_dilithium2_lowram_ntt+0x5a>
c0de1a44:	f854 0025 	ldr.w	r0, [r4, r5, lsl #2]
c0de1a48:	fb80 010b 	smull	r0, r1, r0, fp
c0de1a4c:	f000 fb52 	bl	c0de20f4 <pqcrystals_dilithium2_lowram_montgomery_reduce>
c0de1a50:	f854 1027 	ldr.w	r1, [r4, r7, lsl #2]
c0de1a54:	180a      	adds	r2, r1, r0
c0de1a56:	1a08      	subs	r0, r1, r0
c0de1a58:	f844 2027 	str.w	r2, [r4, r7, lsl #2]
c0de1a5c:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de1a60:	3501      	adds	r5, #1
c0de1a62:	3701      	adds	r7, #1
c0de1a64:	e7ec      	b.n	c0de1a40 <pqcrystals_dilithium2_lowram_ntt+0x34>
c0de1a66:	462f      	mov	r7, r5
c0de1a68:	e7e0      	b.n	c0de1a2c <pqcrystals_dilithium2_lowram_ntt+0x20>
c0de1a6a:	ea4f 0858 	mov.w	r8, r8, lsr #1
c0de1a6e:	e7d7      	b.n	c0de1a20 <pqcrystals_dilithium2_lowram_ntt+0x14>
c0de1a70:	0000c47c 	.word	0x0000c47c

c0de1a74 <pqcrystals_dilithium2_lowram_invntt_tomont>:
c0de1a74:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de1a78:	4604      	mov	r4, r0
c0de1a7a:	4822      	ldr	r0, [pc, #136]	@ (c0de1b04 <pqcrystals_dilithium2_lowram_invntt_tomont+0x90>)
c0de1a7c:	f04f 0801 	mov.w	r8, #1
c0de1a80:	f44f 7a80 	mov.w	sl, #256	@ 0x100
c0de1a84:	4478      	add	r0, pc
c0de1a86:	9001      	str	r0, [sp, #4]
c0de1a88:	f1b8 0fff 	cmp.w	r8, #255	@ 0xff
c0de1a8c:	d828      	bhi.n	c0de1ae0 <pqcrystals_dilithium2_lowram_invntt_tomont+0x6c>
c0de1a8e:	2700      	movs	r7, #0
c0de1a90:	2fff      	cmp	r7, #255	@ 0xff
c0de1a92:	d822      	bhi.n	c0de1ada <pqcrystals_dilithium2_lowram_invntt_tomont+0x66>
c0de1a94:	9801      	ldr	r0, [sp, #4]
c0de1a96:	f1aa 0a01 	sub.w	sl, sl, #1
c0de1a9a:	eb07 0608 	add.w	r6, r7, r8
c0de1a9e:	4635      	mov	r5, r6
c0de1aa0:	f850 002a 	ldr.w	r0, [r0, sl, lsl #2]
c0de1aa4:	f1c0 0b00 	rsb	fp, r0, #0
c0de1aa8:	42b7      	cmp	r7, r6
c0de1aaa:	d214      	bcs.n	c0de1ad6 <pqcrystals_dilithium2_lowram_invntt_tomont+0x62>
c0de1aac:	f854 0027 	ldr.w	r0, [r4, r7, lsl #2]
c0de1ab0:	f854 1025 	ldr.w	r1, [r4, r5, lsl #2]
c0de1ab4:	4401      	add	r1, r0
c0de1ab6:	f844 1027 	str.w	r1, [r4, r7, lsl #2]
c0de1aba:	f854 1025 	ldr.w	r1, [r4, r5, lsl #2]
c0de1abe:	1a40      	subs	r0, r0, r1
c0de1ac0:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de1ac4:	fb80 010b 	smull	r0, r1, r0, fp
c0de1ac8:	f000 fb14 	bl	c0de20f4 <pqcrystals_dilithium2_lowram_montgomery_reduce>
c0de1acc:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de1ad0:	3501      	adds	r5, #1
c0de1ad2:	3701      	adds	r7, #1
c0de1ad4:	e7e8      	b.n	c0de1aa8 <pqcrystals_dilithium2_lowram_invntt_tomont+0x34>
c0de1ad6:	462f      	mov	r7, r5
c0de1ad8:	e7da      	b.n	c0de1a90 <pqcrystals_dilithium2_lowram_invntt_tomont+0x1c>
c0de1ada:	ea4f 0848 	mov.w	r8, r8, lsl #1
c0de1ade:	e7d3      	b.n	c0de1a88 <pqcrystals_dilithium2_lowram_invntt_tomont+0x14>
c0de1ae0:	2500      	movs	r5, #0
c0de1ae2:	f24a 36fa 	movw	r6, #41978	@ 0xa3fa
c0de1ae6:	f5b5 7f80 	cmp.w	r5, #256	@ 0x100
c0de1aea:	bf08      	it	eq
c0de1aec:	e8bd 8dfc 	ldmiaeq.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de1af0:	f854 0025 	ldr.w	r0, [r4, r5, lsl #2]
c0de1af4:	fb80 0106 	smull	r0, r1, r0, r6
c0de1af8:	f000 fafc 	bl	c0de20f4 <pqcrystals_dilithium2_lowram_montgomery_reduce>
c0de1afc:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de1b00:	3501      	adds	r5, #1
c0de1b02:	e7f0      	b.n	c0de1ae6 <pqcrystals_dilithium2_lowram_invntt_tomont+0x72>
c0de1b04:	0000c414 	.word	0x0000c414

c0de1b08 <pqcrystals_dilithium2_lowram_poly_reduce>:
c0de1b08:	b5b0      	push	{r4, r5, r7, lr}
c0de1b0a:	4604      	mov	r4, r0
c0de1b0c:	2500      	movs	r5, #0
c0de1b0e:	f5b5 7f80 	cmp.w	r5, #256	@ 0x100
c0de1b12:	bf08      	it	eq
c0de1b14:	bdb0      	popeq	{r4, r5, r7, pc}
c0de1b16:	f854 0025 	ldr.w	r0, [r4, r5, lsl #2]
c0de1b1a:	f000 faf7 	bl	c0de210c <pqcrystals_dilithium2_lowram_reduce32>
c0de1b1e:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de1b22:	3501      	adds	r5, #1
c0de1b24:	e7f3      	b.n	c0de1b0e <pqcrystals_dilithium2_lowram_poly_reduce+0x6>

c0de1b26 <pqcrystals_dilithium2_lowram_poly_caddq>:
c0de1b26:	b5b0      	push	{r4, r5, r7, lr}
c0de1b28:	4604      	mov	r4, r0
c0de1b2a:	2500      	movs	r5, #0
c0de1b2c:	f5b5 7f80 	cmp.w	r5, #256	@ 0x100
c0de1b30:	bf08      	it	eq
c0de1b32:	bdb0      	popeq	{r4, r5, r7, pc}
c0de1b34:	f854 0025 	ldr.w	r0, [r4, r5, lsl #2]
c0de1b38:	f000 faf2 	bl	c0de2120 <pqcrystals_dilithium2_lowram_caddq>
c0de1b3c:	f844 0025 	str.w	r0, [r4, r5, lsl #2]
c0de1b40:	3501      	adds	r5, #1
c0de1b42:	e7f3      	b.n	c0de1b2c <pqcrystals_dilithium2_lowram_poly_caddq+0x6>

c0de1b44 <pqcrystals_dilithium2_lowram_poly_add>:
c0de1b44:	b5b0      	push	{r4, r5, r7, lr}
c0de1b46:	2300      	movs	r3, #0
c0de1b48:	f5b3 7f80 	cmp.w	r3, #256	@ 0x100
c0de1b4c:	bf08      	it	eq
c0de1b4e:	bdb0      	popeq	{r4, r5, r7, pc}
c0de1b50:	f851 4023 	ldr.w	r4, [r1, r3, lsl #2]
c0de1b54:	f852 5023 	ldr.w	r5, [r2, r3, lsl #2]
c0de1b58:	442c      	add	r4, r5
c0de1b5a:	f840 4023 	str.w	r4, [r0, r3, lsl #2]
c0de1b5e:	3301      	adds	r3, #1
c0de1b60:	e7f2      	b.n	c0de1b48 <pqcrystals_dilithium2_lowram_poly_add+0x4>

c0de1b62 <pqcrystals_dilithium2_lowram_poly_ntt>:
c0de1b62:	f7ff bf53 	b.w	c0de1a0c <pqcrystals_dilithium2_lowram_ntt>

c0de1b66 <pqcrystals_dilithium2_lowram_poly_invntt_tomont>:
c0de1b66:	f7ff bf85 	b.w	c0de1a74 <pqcrystals_dilithium2_lowram_invntt_tomont>

c0de1b6a <pqcrystals_dilithium2_lowram_poly_pointwise_montgomery>:
c0de1b6a:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de1b6c:	f000 fab5 	bl	c0de20da <OUTLINED_FUNCTION_0>
c0de1b70:	f5b7 7f80 	cmp.w	r7, #256	@ 0x100
c0de1b74:	bf08      	it	eq
c0de1b76:	bdf8      	popeq	{r3, r4, r5, r6, r7, pc}
c0de1b78:	f855 0027 	ldr.w	r0, [r5, r7, lsl #2]
c0de1b7c:	f854 1027 	ldr.w	r1, [r4, r7, lsl #2]
c0de1b80:	fb81 0100 	smull	r0, r1, r1, r0
c0de1b84:	f000 fab6 	bl	c0de20f4 <pqcrystals_dilithium2_lowram_montgomery_reduce>
c0de1b88:	f846 0027 	str.w	r0, [r6, r7, lsl #2]
c0de1b8c:	3701      	adds	r7, #1
c0de1b8e:	e7ef      	b.n	c0de1b70 <pqcrystals_dilithium2_lowram_poly_pointwise_montgomery+0x6>

c0de1b90 <pqcrystals_dilithium2_lowram_poly_power2round>:
c0de1b90:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de1b92:	f000 faa2 	bl	c0de20da <OUTLINED_FUNCTION_0>
c0de1b96:	f5b7 6f80 	cmp.w	r7, #1024	@ 0x400
c0de1b9a:	bf08      	it	eq
c0de1b9c:	bdf8      	popeq	{r3, r4, r5, r6, r7, pc}
c0de1b9e:	59e1      	ldr	r1, [r4, r7]
c0de1ba0:	19e8      	adds	r0, r5, r7
c0de1ba2:	f000 fad5 	bl	c0de2150 <pqcrystals_dilithium2_lowram_power2round>
c0de1ba6:	51f0      	str	r0, [r6, r7]
c0de1ba8:	3704      	adds	r7, #4
c0de1baa:	e7f4      	b.n	c0de1b96 <pqcrystals_dilithium2_lowram_poly_power2round+0x6>

c0de1bac <pqcrystals_dilithium2_lowram_poly_chknorm>:
c0de1bac:	4a09      	ldr	r2, [pc, #36]	@ (c0de1bd4 <pqcrystals_dilithium2_lowram_poly_chknorm+0x28>)
c0de1bae:	4291      	cmp	r1, r2
c0de1bb0:	dc0e      	bgt.n	c0de1bd0 <pqcrystals_dilithium2_lowram_poly_chknorm+0x24>
c0de1bb2:	2200      	movs	r2, #0
c0de1bb4:	f5b2 7f80 	cmp.w	r2, #256	@ 0x100
c0de1bb8:	bf04      	itt	eq
c0de1bba:	2000      	moveq	r0, #0
c0de1bbc:	4770      	bxeq	lr
c0de1bbe:	f850 3022 	ldr.w	r3, [r0, r2, lsl #2]
c0de1bc2:	2b00      	cmp	r3, #0
c0de1bc4:	bf48      	it	mi
c0de1bc6:	eba3 0343 	submi.w	r3, r3, r3, lsl #1
c0de1bca:	3201      	adds	r2, #1
c0de1bcc:	428b      	cmp	r3, r1
c0de1bce:	dbf1      	blt.n	c0de1bb4 <pqcrystals_dilithium2_lowram_poly_chknorm+0x8>
c0de1bd0:	2001      	movs	r0, #1
c0de1bd2:	4770      	bx	lr
c0de1bd4:	000ffc00 	.word	0x000ffc00

c0de1bd8 <pqcrystals_dilithium2_lowram_poly_uniform>:
c0de1bd8:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de1bdc:	f5ad 6daa 	sub.w	sp, sp, #1360	@ 0x550
c0de1be0:	46e8      	mov	r8, sp
c0de1be2:	4683      	mov	fp, r0
c0de1be4:	460d      	mov	r5, r1
c0de1be6:	f8ad 254e 	strh.w	r2, [sp, #1358]	@ 0x54e
c0de1bea:	4640      	mov	r0, r8
c0de1bec:	f7ff f9b0 	bl	c0de0f50 <inner_keccak256_init>
c0de1bf0:	4640      	mov	r0, r8
c0de1bf2:	4629      	mov	r1, r5
c0de1bf4:	2220      	movs	r2, #32
c0de1bf6:	f7ff f9bc 	bl	c0de0f72 <inner_keccak256_inject>
c0de1bfa:	f20d 514e 	addw	r1, sp, #1358	@ 0x54e
c0de1bfe:	4640      	mov	r0, r8
c0de1c00:	2202      	movs	r2, #2
c0de1c02:	f7ff f9b6 	bl	c0de0f72 <inner_keccak256_inject>
c0de1c06:	4640      	mov	r0, r8
c0de1c08:	f7ff f9c5 	bl	c0de0f96 <inner_keccak256_flip>
c0de1c0c:	ae81      	add	r6, sp, #516	@ 0x204
c0de1c0e:	4640      	mov	r0, r8
c0de1c10:	f44f 7252 	mov.w	r2, #840	@ 0x348
c0de1c14:	f44f 7752 	mov.w	r7, #840	@ 0x348
c0de1c18:	4631      	mov	r1, r6
c0de1c1a:	f7ff f9d2 	bl	c0de0fc2 <inner_keccak256_extract>
c0de1c1e:	4658      	mov	r0, fp
c0de1c20:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de1c24:	4632      	mov	r2, r6
c0de1c26:	f44f 7352 	mov.w	r3, #840	@ 0x348
c0de1c2a:	f000 f827 	bl	c0de1c7c <rej_uniform>
c0de1c2e:	4605      	mov	r5, r0
c0de1c30:	f04f 0a03 	mov.w	sl, #3
c0de1c34:	2dff      	cmp	r5, #255	@ 0xff
c0de1c36:	d81d      	bhi.n	c0de1c74 <pqcrystals_dilithium2_lowram_poly_uniform+0x9c>
c0de1c38:	fbb7 f0fa 	udiv	r0, r7, sl
c0de1c3c:	4631      	mov	r1, r6
c0de1c3e:	eb00 0040 	add.w	r0, r0, r0, lsl #1
c0de1c42:	1a3c      	subs	r4, r7, r0
c0de1c44:	42b8      	cmp	r0, r7
c0de1c46:	d004      	beq.n	c0de1c52 <pqcrystals_dilithium2_lowram_poly_uniform+0x7a>
c0de1c48:	5c0a      	ldrb	r2, [r1, r0]
c0de1c4a:	3f01      	subs	r7, #1
c0de1c4c:	700a      	strb	r2, [r1, #0]
c0de1c4e:	3101      	adds	r1, #1
c0de1c50:	e7f8      	b.n	c0de1c44 <pqcrystals_dilithium2_lowram_poly_uniform+0x6c>
c0de1c52:	1931      	adds	r1, r6, r4
c0de1c54:	4640      	mov	r0, r8
c0de1c56:	22a8      	movs	r2, #168	@ 0xa8
c0de1c58:	f7ff f9b3 	bl	c0de0fc2 <inner_keccak256_extract>
c0de1c5c:	f044 07a8 	orr.w	r7, r4, #168	@ 0xa8
c0de1c60:	eb0b 0085 	add.w	r0, fp, r5, lsl #2
c0de1c64:	f5c5 7180 	rsb	r1, r5, #256	@ 0x100
c0de1c68:	4632      	mov	r2, r6
c0de1c6a:	463b      	mov	r3, r7
c0de1c6c:	f000 f806 	bl	c0de1c7c <rej_uniform>
c0de1c70:	4405      	add	r5, r0
c0de1c72:	e7df      	b.n	c0de1c34 <pqcrystals_dilithium2_lowram_poly_uniform+0x5c>
c0de1c74:	f50d 6daa 	add.w	sp, sp, #1360	@ 0x550
c0de1c78:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de1c7c <rej_uniform>:
c0de1c7c:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de1c7e:	4c0f      	ldr	r4, [pc, #60]	@ (c0de1cbc <rej_uniform+0x40>)
c0de1c80:	4684      	mov	ip, r0
c0de1c82:	2000      	movs	r0, #0
c0de1c84:	2700      	movs	r7, #0
c0de1c86:	46a6      	mov	lr, r4
c0de1c88:	4288      	cmp	r0, r1
c0de1c8a:	d215      	bcs.n	c0de1cb8 <rej_uniform+0x3c>
c0de1c8c:	1cfe      	adds	r6, r7, #3
c0de1c8e:	429e      	cmp	r6, r3
c0de1c90:	d812      	bhi.n	c0de1cb8 <rej_uniform+0x3c>
c0de1c92:	5dd4      	ldrb	r4, [r2, r7]
c0de1c94:	4417      	add	r7, r2
c0de1c96:	787d      	ldrb	r5, [r7, #1]
c0de1c98:	78bf      	ldrb	r7, [r7, #2]
c0de1c9a:	ea44 2405 	orr.w	r4, r4, r5, lsl #8
c0de1c9e:	f007 057f 	and.w	r5, r7, #127	@ 0x7f
c0de1ca2:	4637      	mov	r7, r6
c0de1ca4:	ea44 4405 	orr.w	r4, r4, r5, lsl #16
c0de1ca8:	4675      	mov	r5, lr
c0de1caa:	4574      	cmp	r4, lr
c0de1cac:	d8ec      	bhi.n	c0de1c88 <rej_uniform+0xc>
c0de1cae:	f84c 4020 	str.w	r4, [ip, r0, lsl #2]
c0de1cb2:	3001      	adds	r0, #1
c0de1cb4:	4637      	mov	r7, r6
c0de1cb6:	e7e7      	b.n	c0de1c88 <rej_uniform+0xc>
c0de1cb8:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de1cba:	bf00      	nop
c0de1cbc:	007fe000 	.word	0x007fe000

c0de1cc0 <pqcrystals_dilithium2_lowram_poly_uniform_eta>:
c0de1cc0:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de1cc4:	f5ad 7d0a 	sub.w	sp, sp, #552	@ 0x228
c0de1cc8:	f8ad 2226 	strh.w	r2, [sp, #550]	@ 0x226
c0de1ccc:	ac08      	add	r4, sp, #32
c0de1cce:	4682      	mov	sl, r0
c0de1cd0:	460e      	mov	r6, r1
c0de1cd2:	4620      	mov	r0, r4
c0de1cd4:	f7ff f93c 	bl	c0de0f50 <inner_keccak256_init>
c0de1cd8:	4620      	mov	r0, r4
c0de1cda:	4631      	mov	r1, r6
c0de1cdc:	2240      	movs	r2, #64	@ 0x40
c0de1cde:	f7ff f948 	bl	c0de0f72 <inner_keccak256_inject>
c0de1ce2:	f20d 2126 	addw	r1, sp, #550	@ 0x226
c0de1ce6:	4620      	mov	r0, r4
c0de1ce8:	2202      	movs	r2, #2
c0de1cea:	f7ff f942 	bl	c0de0f72 <inner_keccak256_inject>
c0de1cee:	4620      	mov	r0, r4
c0de1cf0:	f7ff f951 	bl	c0de0f96 <inner_keccak256_flip>
c0de1cf4:	f04f 0b00 	mov.w	fp, #0
c0de1cf8:	466e      	mov	r6, sp
c0de1cfa:	f04f 08cd 	mov.w	r8, #205	@ 0xcd
c0de1cfe:	f1bb 0fff 	cmp.w	fp, #255	@ 0xff
c0de1d02:	d830      	bhi.n	c0de1d66 <pqcrystals_dilithium2_lowram_poly_uniform_eta+0xa6>
c0de1d04:	a808      	add	r0, sp, #32
c0de1d06:	4631      	mov	r1, r6
c0de1d08:	2220      	movs	r2, #32
c0de1d0a:	f7ff f95a 	bl	c0de0fc2 <inner_keccak256_extract>
c0de1d0e:	eb0a 008b 	add.w	r0, sl, fp, lsl #2
c0de1d12:	f5cb 7280 	rsb	r2, fp, #256	@ 0x100
c0de1d16:	2100      	movs	r1, #0
c0de1d18:	2300      	movs	r3, #0
c0de1d1a:	4291      	cmp	r1, r2
c0de1d1c:	d221      	bcs.n	c0de1d62 <pqcrystals_dilithium2_lowram_poly_uniform_eta+0xa2>
c0de1d1e:	2b1f      	cmp	r3, #31
c0de1d20:	d81f      	bhi.n	c0de1d62 <pqcrystals_dilithium2_lowram_poly_uniform_eta+0xa2>
c0de1d22:	5cf4      	ldrb	r4, [r6, r3]
c0de1d24:	f004 070f 	and.w	r7, r4, #15
c0de1d28:	2f0f      	cmp	r7, #15
c0de1d2a:	d009      	beq.n	c0de1d40 <pqcrystals_dilithium2_lowram_poly_uniform_eta+0x80>
c0de1d2c:	fb07 f508 	mul.w	r5, r7, r8
c0de1d30:	0aad      	lsrs	r5, r5, #10
c0de1d32:	eb05 0585 	add.w	r5, r5, r5, lsl #2
c0de1d36:	1bed      	subs	r5, r5, r7
c0de1d38:	3502      	adds	r5, #2
c0de1d3a:	f840 5021 	str.w	r5, [r0, r1, lsl #2]
c0de1d3e:	3101      	adds	r1, #1
c0de1d40:	0924      	lsrs	r4, r4, #4
c0de1d42:	2c0f      	cmp	r4, #15
c0de1d44:	d00b      	beq.n	c0de1d5e <pqcrystals_dilithium2_lowram_poly_uniform_eta+0x9e>
c0de1d46:	4291      	cmp	r1, r2
c0de1d48:	d209      	bcs.n	c0de1d5e <pqcrystals_dilithium2_lowram_poly_uniform_eta+0x9e>
c0de1d4a:	fb04 f508 	mul.w	r5, r4, r8
c0de1d4e:	0aad      	lsrs	r5, r5, #10
c0de1d50:	eb05 0585 	add.w	r5, r5, r5, lsl #2
c0de1d54:	1b2c      	subs	r4, r5, r4
c0de1d56:	3402      	adds	r4, #2
c0de1d58:	f840 4021 	str.w	r4, [r0, r1, lsl #2]
c0de1d5c:	3101      	adds	r1, #1
c0de1d5e:	3301      	adds	r3, #1
c0de1d60:	e7db      	b.n	c0de1d1a <pqcrystals_dilithium2_lowram_poly_uniform_eta+0x5a>
c0de1d62:	448b      	add	fp, r1
c0de1d64:	e7cb      	b.n	c0de1cfe <pqcrystals_dilithium2_lowram_poly_uniform_eta+0x3e>
c0de1d66:	f50d 7d0a 	add.w	sp, sp, #552	@ 0x228
c0de1d6a:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de1d6e <pqcrystals_dilithium2_lowram_polyz_unpack>:
c0de1d6e:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de1d70:	3008      	adds	r0, #8
c0de1d72:	f04f 0c00 	mov.w	ip, #0
c0de1d76:	f5bc 7f10 	cmp.w	ip, #576	@ 0x240
c0de1d7a:	bf08      	it	eq
c0de1d7c:	bdf0      	popeq	{r4, r5, r6, r7, pc}
c0de1d7e:	f811 300c 	ldrb.w	r3, [r1, ip]
c0de1d82:	eb01 040c 	add.w	r4, r1, ip
c0de1d86:	f10c 0c09 	add.w	ip, ip, #9
c0de1d8a:	f840 3c08 	str.w	r3, [r0, #-8]
c0de1d8e:	7865      	ldrb	r5, [r4, #1]
c0de1d90:	ea43 2305 	orr.w	r3, r3, r5, lsl #8
c0de1d94:	f840 3c08 	str.w	r3, [r0, #-8]
c0de1d98:	78a5      	ldrb	r5, [r4, #2]
c0de1d9a:	f365 4311 	bfi	r3, r5, #16, #2
c0de1d9e:	f840 3c08 	str.w	r3, [r0, #-8]
c0de1da2:	f5c3 3300 	rsb	r3, r3, #131072	@ 0x20000
c0de1da6:	78a5      	ldrb	r5, [r4, #2]
c0de1da8:	08ae      	lsrs	r6, r5, #2
c0de1daa:	f840 6c04 	str.w	r6, [r0, #-4]
c0de1dae:	78e6      	ldrb	r6, [r4, #3]
c0de1db0:	01b6      	lsls	r6, r6, #6
c0de1db2:	ea46 0595 	orr.w	r5, r6, r5, lsr #2
c0de1db6:	f840 5c04 	str.w	r5, [r0, #-4]
c0de1dba:	7926      	ldrb	r6, [r4, #4]
c0de1dbc:	f366 3591 	bfi	r5, r6, #14, #4
c0de1dc0:	f840 5c04 	str.w	r5, [r0, #-4]
c0de1dc4:	f5c5 3500 	rsb	r5, r5, #131072	@ 0x20000
c0de1dc8:	7926      	ldrb	r6, [r4, #4]
c0de1dca:	0937      	lsrs	r7, r6, #4
c0de1dcc:	6007      	str	r7, [r0, #0]
c0de1dce:	7967      	ldrb	r7, [r4, #5]
c0de1dd0:	013f      	lsls	r7, r7, #4
c0de1dd2:	ea47 1616 	orr.w	r6, r7, r6, lsr #4
c0de1dd6:	6006      	str	r6, [r0, #0]
c0de1dd8:	79a7      	ldrb	r7, [r4, #6]
c0de1dda:	f367 3611 	bfi	r6, r7, #12, #6
c0de1dde:	6006      	str	r6, [r0, #0]
c0de1de0:	f5c6 3600 	rsb	r6, r6, #131072	@ 0x20000
c0de1de4:	79a7      	ldrb	r7, [r4, #6]
c0de1de6:	09ba      	lsrs	r2, r7, #6
c0de1de8:	6042      	str	r2, [r0, #4]
c0de1dea:	79e2      	ldrb	r2, [r4, #7]
c0de1dec:	0092      	lsls	r2, r2, #2
c0de1dee:	ea42 1297 	orr.w	r2, r2, r7, lsr #6
c0de1df2:	6042      	str	r2, [r0, #4]
c0de1df4:	7a24      	ldrb	r4, [r4, #8]
c0de1df6:	6006      	str	r6, [r0, #0]
c0de1df8:	f840 5c04 	str.w	r5, [r0, #-4]
c0de1dfc:	f840 3c08 	str.w	r3, [r0, #-8]
c0de1e00:	ea42 2284 	orr.w	r2, r2, r4, lsl #10
c0de1e04:	f5c2 3200 	rsb	r2, r2, #131072	@ 0x20000
c0de1e08:	6042      	str	r2, [r0, #4]
c0de1e0a:	3010      	adds	r0, #16
c0de1e0c:	e7b3      	b.n	c0de1d76 <pqcrystals_dilithium2_lowram_polyz_unpack+0x8>

c0de1e0e <pqcrystals_dilithium2_lowram_polyeta_pack>:
c0de1e0e:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de1e12:	3001      	adds	r0, #1
c0de1e14:	2200      	movs	r2, #0
c0de1e16:	2640      	movs	r6, #64	@ 0x40
c0de1e18:	f5b2 6f80 	cmp.w	r2, #1024	@ 0x400
c0de1e1c:	bf08      	it	eq
c0de1e1e:	e8bd 8df0 	ldmiaeq.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de1e22:	188b      	adds	r3, r1, r2
c0de1e24:	f851 8002 	ldr.w	r8, [r1, r2]
c0de1e28:	2710      	movs	r7, #16
c0de1e2a:	3220      	adds	r2, #32
c0de1e2c:	f103 0b04 	add.w	fp, r3, #4
c0de1e30:	f103 0e10 	add.w	lr, r3, #16
c0de1e34:	69db      	ldr	r3, [r3, #28]
c0de1e36:	e89b 0830 	ldmia.w	fp, {r4, r5, fp}
c0de1e3a:	e89e 5400 	ldmia.w	lr, {sl, ip, lr}
c0de1e3e:	f1c5 0502 	rsb	r5, r5, #2
c0de1e42:	eba6 1343 	sub.w	r3, r6, r3, lsl #5
c0de1e46:	eba7 04c4 	sub.w	r4, r7, r4, lsl #3
c0de1e4a:	f1c8 0702 	rsb	r7, r8, #2
c0de1e4e:	b2ed      	uxtb	r5, r5
c0de1e50:	433c      	orrs	r4, r7
c0de1e52:	f1cc 0702 	rsb	r7, ip, #2
c0de1e56:	ea44 1485 	orr.w	r4, r4, r5, lsl #6
c0de1e5a:	b2ff      	uxtb	r7, r7
c0de1e5c:	f800 4c01 	strb.w	r4, [r0, #-1]
c0de1e60:	2408      	movs	r4, #8
c0de1e62:	eba4 048e 	sub.w	r4, r4, lr, lsl #2
c0de1e66:	ea44 0457 	orr.w	r4, r4, r7, lsr #1
c0de1e6a:	4323      	orrs	r3, r4
c0de1e6c:	2420      	movs	r4, #32
c0de1e6e:	7043      	strb	r3, [r0, #1]
c0de1e70:	2304      	movs	r3, #4
c0de1e72:	eba4 140a 	sub.w	r4, r4, sl, lsl #4
c0de1e76:	eba3 034b 	sub.w	r3, r3, fp, lsl #1
c0de1e7a:	ea43 0395 	orr.w	r3, r3, r5, lsr #2
c0de1e7e:	4323      	orrs	r3, r4
c0de1e80:	ea43 13c7 	orr.w	r3, r3, r7, lsl #7
c0de1e84:	f800 3b03 	strb.w	r3, [r0], #3
c0de1e88:	e7c6      	b.n	c0de1e18 <pqcrystals_dilithium2_lowram_polyeta_pack+0xa>

c0de1e8a <pqcrystals_dilithium2_lowram_poly_challenge_eth>:
c0de1e8a:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de1e8e:	f5ad 7d10 	sub.w	sp, sp, #576	@ 0x240
c0de1e92:	466e      	mov	r6, sp
c0de1e94:	4680      	mov	r8, r0
c0de1e96:	460d      	mov	r5, r1
c0de1e98:	4630      	mov	r0, r6
c0de1e9a:	f7ff f859 	bl	c0de0f50 <inner_keccak256_init>
c0de1e9e:	4630      	mov	r0, r6
c0de1ea0:	4629      	mov	r1, r5
c0de1ea2:	2220      	movs	r2, #32
c0de1ea4:	f7ff f865 	bl	c0de0f72 <inner_keccak256_inject>
c0de1ea8:	4630      	mov	r0, r6
c0de1eaa:	f7ff f874 	bl	c0de0f96 <inner_keccak256_flip>
c0de1eae:	ad80      	add	r5, sp, #512	@ 0x200
c0de1eb0:	4630      	mov	r0, r6
c0de1eb2:	2208      	movs	r2, #8
c0de1eb4:	4629      	mov	r1, r5
c0de1eb6:	f7ff f884 	bl	c0de0fc2 <inner_keccak256_extract>
c0de1eba:	2600      	movs	r6, #0
c0de1ebc:	462c      	mov	r4, r5
c0de1ebe:	f04f 0b00 	mov.w	fp, #0
c0de1ec2:	f04f 0a00 	mov.w	sl, #0
c0de1ec6:	2e40      	cmp	r6, #64	@ 0x40
c0de1ec8:	d007      	beq.n	c0de1eda <pqcrystals_dilithium2_lowram_poly_challenge_eth+0x50>
c0de1eca:	f000 f90b 	bl	c0de20e4 <OUTLINED_FUNCTION_1>
c0de1ece:	ea4a 0a01 	orr.w	sl, sl, r1
c0de1ed2:	ea4b 0b00 	orr.w	fp, fp, r0
c0de1ed6:	3608      	adds	r6, #8
c0de1ed8:	e7f5      	b.n	c0de1ec6 <pqcrystals_dilithium2_lowram_poly_challenge_eth+0x3c>
c0de1eda:	2000      	movs	r0, #0
c0de1edc:	2100      	movs	r1, #0
c0de1ede:	f5b1 7f80 	cmp.w	r1, #256	@ 0x100
c0de1ee2:	d003      	beq.n	c0de1eec <pqcrystals_dilithium2_lowram_poly_challenge_eth+0x62>
c0de1ee4:	f848 0021 	str.w	r0, [r8, r1, lsl #2]
c0de1ee8:	3101      	adds	r1, #1
c0de1eea:	e7f8      	b.n	c0de1ede <pqcrystals_dilithium2_lowram_poly_challenge_eth+0x54>
c0de1eec:	2000      	movs	r0, #0
c0de1eee:	24d9      	movs	r4, #217	@ 0xd9
c0de1ef0:	466e      	mov	r6, sp
c0de1ef2:	2700      	movs	r7, #0
c0de1ef4:	f5b4 7f80 	cmp.w	r4, #256	@ 0x100
c0de1ef8:	d01e      	beq.n	c0de1f38 <pqcrystals_dilithium2_lowram_poly_challenge_eth+0xae>
c0de1efa:	42b8      	cmp	r0, r7
c0de1efc:	d306      	bcc.n	c0de1f0c <pqcrystals_dilithium2_lowram_poly_challenge_eth+0x82>
c0de1efe:	4630      	mov	r0, r6
c0de1f00:	4629      	mov	r1, r5
c0de1f02:	2240      	movs	r2, #64	@ 0x40
c0de1f04:	2740      	movs	r7, #64	@ 0x40
c0de1f06:	f7ff f85c 	bl	c0de0fc2 <inner_keccak256_extract>
c0de1f0a:	2000      	movs	r0, #0
c0de1f0c:	5c29      	ldrb	r1, [r5, r0]
c0de1f0e:	3001      	adds	r0, #1
c0de1f10:	428c      	cmp	r4, r1
c0de1f12:	d3f2      	bcc.n	c0de1efa <pqcrystals_dilithium2_lowram_poly_challenge_eth+0x70>
c0de1f14:	f858 2021 	ldr.w	r2, [r8, r1, lsl #2]
c0de1f18:	f848 2024 	str.w	r2, [r8, r4, lsl #2]
c0de1f1c:	ea5f 72cb 	movs.w	r2, fp, lsl #31
c0de1f20:	f04f 32ff 	mov.w	r2, #4294967295	@ 0xffffffff
c0de1f24:	bf08      	it	eq
c0de1f26:	2201      	moveq	r2, #1
c0de1f28:	ea5f 0a5a 	movs.w	sl, sl, lsr #1
c0de1f2c:	f848 2021 	str.w	r2, [r8, r1, lsl #2]
c0de1f30:	ea4f 0b3b 	mov.w	fp, fp, rrx
c0de1f34:	3401      	adds	r4, #1
c0de1f36:	e7dd      	b.n	c0de1ef4 <pqcrystals_dilithium2_lowram_poly_challenge_eth+0x6a>
c0de1f38:	f50d 7d10 	add.w	sp, sp, #576	@ 0x240
c0de1f3c:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de1f40 <pqcrystals_dilithium2_lowram_polyt1_pack>:
c0de1f40:	b5b0      	push	{r4, r5, r7, lr}
c0de1f42:	3108      	adds	r1, #8
c0de1f44:	2200      	movs	r2, #0
c0de1f46:	f5b2 7fa0 	cmp.w	r2, #320	@ 0x140
c0de1f4a:	bf08      	it	eq
c0de1f4c:	bdb0      	popeq	{r4, r5, r7, pc}
c0de1f4e:	f851 3c08 	ldr.w	r3, [r1, #-8]
c0de1f52:	5483      	strb	r3, [r0, r2]
c0de1f54:	1883      	adds	r3, r0, r2
c0de1f56:	3205      	adds	r2, #5
c0de1f58:	e951 4502 	ldrd	r4, r5, [r1, #-8]
c0de1f5c:	00ad      	lsls	r5, r5, #2
c0de1f5e:	ea45 2414 	orr.w	r4, r5, r4, lsr #8
c0de1f62:	705c      	strb	r4, [r3, #1]
c0de1f64:	680d      	ldr	r5, [r1, #0]
c0de1f66:	f851 4c04 	ldr.w	r4, [r1, #-4]
c0de1f6a:	012d      	lsls	r5, r5, #4
c0de1f6c:	ea45 1494 	orr.w	r4, r5, r4, lsr #6
c0de1f70:	709c      	strb	r4, [r3, #2]
c0de1f72:	e9d1 4500 	ldrd	r4, r5, [r1]
c0de1f76:	01ad      	lsls	r5, r5, #6
c0de1f78:	ea45 1414 	orr.w	r4, r5, r4, lsr #4
c0de1f7c:	70dc      	strb	r4, [r3, #3]
c0de1f7e:	684c      	ldr	r4, [r1, #4]
c0de1f80:	3110      	adds	r1, #16
c0de1f82:	08a4      	lsrs	r4, r4, #2
c0de1f84:	711c      	strb	r4, [r3, #4]
c0de1f86:	e7de      	b.n	c0de1f46 <pqcrystals_dilithium2_lowram_polyt1_pack+0x6>

c0de1f88 <pqcrystals_dilithium2_lowram_polyt0_pack>:
c0de1f88:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de1f8c:	311c      	adds	r1, #28
c0de1f8e:	f04f 0c00 	mov.w	ip, #0
c0de1f92:	9000      	str	r0, [sp, #0]
c0de1f94:	f5bc 7fd0 	cmp.w	ip, #416	@ 0x1a0
c0de1f98:	bf08      	it	eq
c0de1f9a:	e8bd 8dfc 	ldmiaeq.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de1f9e:	f851 0c14 	ldr.w	r0, [r1, #-20]
c0de1fa2:	e951 a504 	ldrd	sl, r5, [r1, #-16]
c0de1fa6:	e951 3807 	ldrd	r3, r8, [r1, #-28]
c0de1faa:	e951 e602 	ldrd	lr, r6, [r1, #-8]
c0de1fae:	f851 7b20 	ldr.w	r7, [r1], #32
c0de1fb2:	9001      	str	r0, [sp, #4]
c0de1fb4:	9800      	ldr	r0, [sp, #0]
c0de1fb6:	f5c7 5780 	rsb	r7, r7, #4096	@ 0x1000
c0de1fba:	f5c3 5b80 	rsb	fp, r3, #4096	@ 0x1000
c0de1fbe:	f5c5 5580 	rsb	r5, r5, #4096	@ 0x1000
c0de1fc2:	097b      	lsrs	r3, r7, #5
c0de1fc4:	eb00 040c 	add.w	r4, r0, ip
c0de1fc8:	f800 b00c 	strb.w	fp, [r0, ip]
c0de1fcc:	f10c 0c0d 	add.w	ip, ip, #13
c0de1fd0:	7323      	strb	r3, [r4, #12]
c0de1fd2:	f5c6 5380 	rsb	r3, r6, #4096	@ 0x1000
c0de1fd6:	089e      	lsrs	r6, r3, #2
c0de1fd8:	72a6      	strb	r6, [r4, #10]
c0de1fda:	092e      	lsrs	r6, r5, #4
c0de1fdc:	71e6      	strb	r6, [r4, #7]
c0de1fde:	f5ca 5680 	rsb	r6, sl, #4096	@ 0x1000
c0de1fe2:	0872      	lsrs	r2, r6, #1
c0de1fe4:	7162      	strb	r2, [r4, #5]
c0de1fe6:	f5c8 5280 	rsb	r2, r8, #4096	@ 0x1000
c0de1fea:	08d0      	lsrs	r0, r2, #3
c0de1fec:	70a0      	strb	r0, [r4, #2]
c0de1fee:	00f8      	lsls	r0, r7, #3
c0de1ff0:	ea40 2093 	orr.w	r0, r0, r3, lsr #10
c0de1ff4:	019b      	lsls	r3, r3, #6
c0de1ff6:	72e0      	strb	r0, [r4, #11]
c0de1ff8:	f5ce 5080 	rsb	r0, lr, #4096	@ 0x1000
c0de1ffc:	ea43 13d0 	orr.w	r3, r3, r0, lsr #7
c0de2000:	0040      	lsls	r0, r0, #1
c0de2002:	ea40 3015 	orr.w	r0, r0, r5, lsr #12
c0de2006:	7263      	strb	r3, [r4, #9]
c0de2008:	01f3      	lsls	r3, r6, #7
c0de200a:	7220      	strb	r0, [r4, #8]
c0de200c:	0128      	lsls	r0, r5, #4
c0de200e:	ea40 2056 	orr.w	r0, r0, r6, lsr #9
c0de2012:	71a0      	strb	r0, [r4, #6]
c0de2014:	9801      	ldr	r0, [sp, #4]
c0de2016:	f5c0 5080 	rsb	r0, r0, #4096	@ 0x1000
c0de201a:	ea43 1390 	orr.w	r3, r3, r0, lsr #6
c0de201e:	0080      	lsls	r0, r0, #2
c0de2020:	ea40 20d2 	orr.w	r0, r0, r2, lsr #11
c0de2024:	7123      	strb	r3, [r4, #4]
c0de2026:	70e0      	strb	r0, [r4, #3]
c0de2028:	0150      	lsls	r0, r2, #5
c0de202a:	ea40 201b 	orr.w	r0, r0, fp, lsr #8
c0de202e:	7060      	strb	r0, [r4, #1]
c0de2030:	e7b0      	b.n	c0de1f94 <pqcrystals_dilithium2_lowram_polyt0_pack+0xc>

c0de2032 <pqcrystals_dilithium2_lowram_polyz_pack>:
c0de2032:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de2034:	3108      	adds	r1, #8
c0de2036:	f04f 0e00 	mov.w	lr, #0
c0de203a:	f5be 7f10 	cmp.w	lr, #576	@ 0x240
c0de203e:	bf08      	it	eq
c0de2040:	bdf0      	popeq	{r4, r5, r6, r7, pc}
c0de2042:	e951 3c02 	ldrd	r3, ip, [r1, #-8]
c0de2046:	e8f1 5604 	ldrd	r5, r6, [r1], #16
c0de204a:	eb00 070e 	add.w	r7, r0, lr
c0de204e:	f5c6 3600 	rsb	r6, r6, #131072	@ 0x20000
c0de2052:	f5c3 3300 	rsb	r3, r3, #131072	@ 0x20000
c0de2056:	0ab4      	lsrs	r4, r6, #10
c0de2058:	f800 300e 	strb.w	r3, [r0, lr]
c0de205c:	f10e 0e09 	add.w	lr, lr, #9
c0de2060:	723c      	strb	r4, [r7, #8]
c0de2062:	08b4      	lsrs	r4, r6, #2
c0de2064:	71fc      	strb	r4, [r7, #7]
c0de2066:	f5c5 3400 	rsb	r4, r5, #131072	@ 0x20000
c0de206a:	0925      	lsrs	r5, r4, #4
c0de206c:	717d      	strb	r5, [r7, #5]
c0de206e:	f5cc 3500 	rsb	r5, ip, #131072	@ 0x20000
c0de2072:	09aa      	lsrs	r2, r5, #6
c0de2074:	70fa      	strb	r2, [r7, #3]
c0de2076:	0a1a      	lsrs	r2, r3, #8
c0de2078:	707a      	strb	r2, [r7, #1]
c0de207a:	01b2      	lsls	r2, r6, #6
c0de207c:	ea42 3214 	orr.w	r2, r2, r4, lsr #12
c0de2080:	71ba      	strb	r2, [r7, #6]
c0de2082:	0122      	lsls	r2, r4, #4
c0de2084:	ea42 3295 	orr.w	r2, r2, r5, lsr #14
c0de2088:	713a      	strb	r2, [r7, #4]
c0de208a:	00aa      	lsls	r2, r5, #2
c0de208c:	ea42 4213 	orr.w	r2, r2, r3, lsr #16
c0de2090:	70ba      	strb	r2, [r7, #2]
c0de2092:	e7d2      	b.n	c0de203a <pqcrystals_dilithium2_lowram_polyz_pack+0x8>

c0de2094 <pqcrystals_dilithium2_lowram_polyw1_pack>:
c0de2094:	b5b0      	push	{r4, r5, r7, lr}
c0de2096:	3001      	adds	r0, #1
c0de2098:	2200      	movs	r2, #0
c0de209a:	f5b2 6f80 	cmp.w	r2, #1024	@ 0x400
c0de209e:	bf08      	it	eq
c0de20a0:	bdb0      	popeq	{r4, r5, r7, pc}
c0de20a2:	588b      	ldr	r3, [r1, r2]
c0de20a4:	188c      	adds	r4, r1, r2
c0de20a6:	3210      	adds	r2, #16
c0de20a8:	f800 3c01 	strb.w	r3, [r0, #-1]
c0de20ac:	6865      	ldr	r5, [r4, #4]
c0de20ae:	ea43 1385 	orr.w	r3, r3, r5, lsl #6
c0de20b2:	f800 3c01 	strb.w	r3, [r0, #-1]
c0de20b6:	6863      	ldr	r3, [r4, #4]
c0de20b8:	089d      	lsrs	r5, r3, #2
c0de20ba:	7005      	strb	r5, [r0, #0]
c0de20bc:	68a5      	ldr	r5, [r4, #8]
c0de20be:	012d      	lsls	r5, r5, #4
c0de20c0:	ea45 0393 	orr.w	r3, r5, r3, lsr #2
c0de20c4:	7003      	strb	r3, [r0, #0]
c0de20c6:	68a3      	ldr	r3, [r4, #8]
c0de20c8:	091d      	lsrs	r5, r3, #4
c0de20ca:	7045      	strb	r5, [r0, #1]
c0de20cc:	68e4      	ldr	r4, [r4, #12]
c0de20ce:	00a4      	lsls	r4, r4, #2
c0de20d0:	ea44 1313 	orr.w	r3, r4, r3, lsr #4
c0de20d4:	7043      	strb	r3, [r0, #1]
c0de20d6:	3003      	adds	r0, #3
c0de20d8:	e7df      	b.n	c0de209a <pqcrystals_dilithium2_lowram_polyw1_pack+0x6>

c0de20da <OUTLINED_FUNCTION_0>:
c0de20da:	4614      	mov	r4, r2
c0de20dc:	460d      	mov	r5, r1
c0de20de:	4606      	mov	r6, r0
c0de20e0:	2700      	movs	r7, #0
c0de20e2:	4770      	bx	lr

c0de20e4 <OUTLINED_FUNCTION_1>:
c0de20e4:	f814 0b01 	ldrb.w	r0, [r4], #1
c0de20e8:	2100      	movs	r1, #0
c0de20ea:	4632      	mov	r2, r6
c0de20ec:	f008 be32 	b.w	c0dead54 <__aeabi_llsl>

c0de20f0 <randombytes>:
c0de20f0:	f008 baf3 	b.w	c0dea6da <cx_rng_no_throw>

c0de20f4 <pqcrystals_dilithium2_lowram_montgomery_reduce>:
c0de20f4:	4a03      	ldr	r2, [pc, #12]	@ (c0de2104 <pqcrystals_dilithium2_lowram_montgomery_reduce+0x10>)
c0de20f6:	4b04      	ldr	r3, [pc, #16]	@ (c0de2108 <pqcrystals_dilithium2_lowram_montgomery_reduce+0x14>)
c0de20f8:	4342      	muls	r2, r0
c0de20fa:	fbc2 0103 	smlal	r0, r1, r2, r3
c0de20fe:	4608      	mov	r0, r1
c0de2100:	4770      	bx	lr
c0de2102:	bf00      	nop
c0de2104:	03802001 	.word	0x03802001
c0de2108:	ff801fff 	.word	0xff801fff

c0de210c <pqcrystals_dilithium2_lowram_reduce32>:
c0de210c:	f500 0180 	add.w	r1, r0, #4194304	@ 0x400000
c0de2110:	4a02      	ldr	r2, [pc, #8]	@ (c0de211c <pqcrystals_dilithium2_lowram_reduce32+0x10>)
c0de2112:	15c9      	asrs	r1, r1, #23
c0de2114:	fb01 0002 	mla	r0, r1, r2, r0
c0de2118:	4770      	bx	lr
c0de211a:	bf00      	nop
c0de211c:	ff801fff 	.word	0xff801fff

c0de2120 <pqcrystals_dilithium2_lowram_caddq>:
c0de2120:	4902      	ldr	r1, [pc, #8]	@ (c0de212c <pqcrystals_dilithium2_lowram_caddq+0xc>)
c0de2122:	2800      	cmp	r0, #0
c0de2124:	bf48      	it	mi
c0de2126:	4408      	addmi	r0, r1
c0de2128:	4770      	bx	lr
c0de212a:	bf00      	nop
c0de212c:	007fe001 	.word	0x007fe001

c0de2130 <pqcrystals_dilithium2_lowram_freeze>:
c0de2130:	f500 0180 	add.w	r1, r0, #4194304	@ 0x400000
c0de2134:	4a04      	ldr	r2, [pc, #16]	@ (c0de2148 <pqcrystals_dilithium2_lowram_freeze+0x18>)
c0de2136:	15c9      	asrs	r1, r1, #23
c0de2138:	fb01 0002 	mla	r0, r1, r2, r0
c0de213c:	4903      	ldr	r1, [pc, #12]	@ (c0de214c <pqcrystals_dilithium2_lowram_freeze+0x1c>)
c0de213e:	2800      	cmp	r0, #0
c0de2140:	bf48      	it	mi
c0de2142:	4408      	addmi	r0, r1
c0de2144:	4770      	bx	lr
c0de2146:	bf00      	nop
c0de2148:	ff801fff 	.word	0xff801fff
c0de214c:	007fe001 	.word	0x007fe001

c0de2150 <pqcrystals_dilithium2_lowram_power2round>:
c0de2150:	f601 72ff 	addw	r2, r1, #4095	@ 0xfff
c0de2154:	f641 73ff 	movw	r3, #8191	@ 0x1fff
c0de2158:	ea22 0303 	bic.w	r3, r2, r3
c0de215c:	1ac9      	subs	r1, r1, r3
c0de215e:	6001      	str	r1, [r0, #0]
c0de2160:	1350      	asrs	r0, r2, #13
c0de2162:	4770      	bx	lr

c0de2164 <pqcrystals_dilithium2_lowram_decompose>:
c0de2164:	b510      	push	{r4, lr}
c0de2166:	f101 027f 	add.w	r2, r1, #127	@ 0x7f
c0de216a:	f642 430b 	movw	r3, #11275	@ 0x2c0b
c0de216e:	4c0c      	ldr	r4, [pc, #48]	@ (c0de21a0 <pqcrystals_dilithium2_lowram_decompose+0x3c>)
c0de2170:	11d2      	asrs	r2, r2, #7
c0de2172:	4353      	muls	r3, r2
c0de2174:	f503 0200 	add.w	r2, r3, #8388608	@ 0x800000
c0de2178:	1612      	asrs	r2, r2, #24
c0de217a:	f1b3 5f2e 	cmp.w	r3, #729808896	@ 0x2b800000
c0de217e:	4b06      	ldr	r3, [pc, #24]	@ (c0de2198 <pqcrystals_dilithium2_lowram_decompose+0x34>)
c0de2180:	bfa8      	it	ge
c0de2182:	2200      	movge	r2, #0
c0de2184:	fb02 1103 	mla	r1, r2, r3, r1
c0de2188:	4b04      	ldr	r3, [pc, #16]	@ (c0de219c <pqcrystals_dilithium2_lowram_decompose+0x38>)
c0de218a:	42a1      	cmp	r1, r4
c0de218c:	bfc8      	it	gt
c0de218e:	4419      	addgt	r1, r3
c0de2190:	6001      	str	r1, [r0, #0]
c0de2192:	4610      	mov	r0, r2
c0de2194:	bd10      	pop	{r4, pc}
c0de2196:	bf00      	nop
c0de2198:	fffd1800 	.word	0xfffd1800
c0de219c:	ff801fff 	.word	0xff801fff
c0de21a0:	003ff000 	.word	0x003ff000

c0de21a4 <pqcrystals_dilithium2_lowram_use_hint>:
c0de21a4:	b51c      	push	{r2, r3, r4, lr}
c0de21a6:	460c      	mov	r4, r1
c0de21a8:	4601      	mov	r1, r0
c0de21aa:	a801      	add	r0, sp, #4
c0de21ac:	f7ff ffda 	bl	c0de2164 <pqcrystals_dilithium2_lowram_decompose>
c0de21b0:	b164      	cbz	r4, c0de21cc <pqcrystals_dilithium2_lowram_use_hint+0x28>
c0de21b2:	9901      	ldr	r1, [sp, #4]
c0de21b4:	2901      	cmp	r1, #1
c0de21b6:	db04      	blt.n	c0de21c2 <pqcrystals_dilithium2_lowram_use_hint+0x1e>
c0de21b8:	f1b0 012b 	subs.w	r1, r0, #43	@ 0x2b
c0de21bc:	bf18      	it	ne
c0de21be:	1c41      	addne	r1, r0, #1
c0de21c0:	e003      	b.n	c0de21ca <pqcrystals_dilithium2_lowram_use_hint+0x26>
c0de21c2:	1e41      	subs	r1, r0, #1
c0de21c4:	2800      	cmp	r0, #0
c0de21c6:	bf08      	it	eq
c0de21c8:	212b      	moveq	r1, #43	@ 0x2b
c0de21ca:	4608      	mov	r0, r1
c0de21cc:	bd1c      	pop	{r2, r3, r4, pc}

c0de21ce <pqcrystals_dilithium2_lowram_keypair>:
c0de21ce:	b570      	push	{r4, r5, r6, lr}
c0de21d0:	b088      	sub	sp, #32
c0de21d2:	466e      	mov	r6, sp
c0de21d4:	460c      	mov	r4, r1
c0de21d6:	4605      	mov	r5, r0
c0de21d8:	2120      	movs	r1, #32
c0de21da:	4630      	mov	r0, r6
c0de21dc:	f7ff ff88 	bl	c0de20f0 <randombytes>
c0de21e0:	4628      	mov	r0, r5
c0de21e2:	4621      	mov	r1, r4
c0de21e4:	4632      	mov	r2, r6
c0de21e6:	f000 f803 	bl	c0de21f0 <crypto_sign_keypair_core>
c0de21ea:	2000      	movs	r0, #0
c0de21ec:	b008      	add	sp, #32
c0de21ee:	bd70      	pop	{r4, r5, r6, pc}

c0de21f0 <crypto_sign_keypair_core>:
c0de21f0:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de21f4:	f6ad 6d88 	subw	sp, sp, #3720	@ 0xe88
c0de21f8:	f60d 6708 	addw	r7, sp, #3592	@ 0xe08
c0de21fc:	460d      	mov	r5, r1
c0de21fe:	4606      	mov	r6, r0
c0de2200:	4611      	mov	r1, r2
c0de2202:	2220      	movs	r2, #32
c0de2204:	4638      	mov	r0, r7
c0de2206:	f008 fead 	bl	c0deaf64 <__aeabi_memcpy>
c0de220a:	f240 4004 	movw	r0, #1028	@ 0x404
c0de220e:	f8ad 0e28 	strh.w	r0, [sp, #3624]	@ 0xe28
c0de2212:	ac02      	add	r4, sp, #8
c0de2214:	4620      	mov	r0, r4
c0de2216:	f7fe fe9b 	bl	c0de0f50 <inner_keccak256_init>
c0de221a:	4620      	mov	r0, r4
c0de221c:	4639      	mov	r1, r7
c0de221e:	2222      	movs	r2, #34	@ 0x22
c0de2220:	f7fe fea7 	bl	c0de0f72 <inner_keccak256_inject>
c0de2224:	f000 fbca 	bl	c0de29bc <OUTLINED_FUNCTION_0>
c0de2228:	4620      	mov	r0, r4
c0de222a:	4639      	mov	r1, r7
c0de222c:	2280      	movs	r2, #128	@ 0x80
c0de222e:	f7fe fec8 	bl	c0de0fc2 <inner_keccak256_extract>
c0de2232:	4628      	mov	r0, r5
c0de2234:	4639      	mov	r1, r7
c0de2236:	f7ff fb94 	bl	c0de1962 <pack_sk_rho>
c0de223a:	f107 0160 	add.w	r1, r7, #96	@ 0x60
c0de223e:	4628      	mov	r0, r5
c0de2240:	9501      	str	r5, [sp, #4]
c0de2242:	f7ff fb96 	bl	c0de1972 <pack_sk_key>
c0de2246:	4630      	mov	r0, r6
c0de2248:	4639      	mov	r1, r7
c0de224a:	9600      	str	r6, [sp, #0]
c0de224c:	f7ff fb63 	bl	c0de1916 <pack_pk_rho>
c0de2250:	3720      	adds	r7, #32
c0de2252:	f04f 0b00 	mov.w	fp, #0
c0de2256:	ad82      	add	r5, sp, #520	@ 0x208
c0de2258:	f50d 64c1 	add.w	r4, sp, #1544	@ 0x608
c0de225c:	f60d 2608 	addw	r6, sp, #2568	@ 0xa08
c0de2260:	f04f 0800 	mov.w	r8, #0
c0de2264:	f1b8 0f04 	cmp.w	r8, #4
c0de2268:	d072      	beq.n	c0de2350 <crypto_sign_keypair_core+0x160>
c0de226a:	4628      	mov	r0, r5
c0de226c:	4639      	mov	r1, r7
c0de226e:	2200      	movs	r2, #0
c0de2270:	f7ff fd26 	bl	c0de1cc0 <pqcrystals_dilithium2_lowram_poly_uniform_eta>
c0de2274:	f1b8 0f00 	cmp.w	r8, #0
c0de2278:	d104      	bne.n	c0de2284 <crypto_sign_keypair_core+0x94>
c0de227a:	9801      	ldr	r0, [sp, #4]
c0de227c:	4629      	mov	r1, r5
c0de227e:	2200      	movs	r2, #0
c0de2280:	f7ff fb58 	bl	c0de1934 <pack_sk_s1>
c0de2284:	4628      	mov	r0, r5
c0de2286:	f7ff fc6c 	bl	c0de1b62 <pqcrystals_dilithium2_lowram_poly_ntt>
c0de228a:	ea4f 2008 	mov.w	r0, r8, lsl #8
c0de228e:	f60d 6108 	addw	r1, sp, #3592	@ 0xe08
c0de2292:	b282      	uxth	r2, r0
c0de2294:	4620      	mov	r0, r4
c0de2296:	f7ff fc9f 	bl	c0de1bd8 <pqcrystals_dilithium2_lowram_poly_uniform>
c0de229a:	4630      	mov	r0, r6
c0de229c:	4621      	mov	r1, r4
c0de229e:	462a      	mov	r2, r5
c0de22a0:	f7ff fc63 	bl	c0de1b6a <pqcrystals_dilithium2_lowram_poly_pointwise_montgomery>
c0de22a4:	f04f 0a01 	mov.w	sl, #1
c0de22a8:	f1ba 0f04 	cmp.w	sl, #4
c0de22ac:	d020      	beq.n	c0de22f0 <crypto_sign_keypair_core+0x100>
c0de22ae:	fa1f f28a 	uxth.w	r2, sl
c0de22b2:	4628      	mov	r0, r5
c0de22b4:	4639      	mov	r1, r7
c0de22b6:	f7ff fd03 	bl	c0de1cc0 <pqcrystals_dilithium2_lowram_poly_uniform_eta>
c0de22ba:	f1b8 0f00 	cmp.w	r8, #0
c0de22be:	d104      	bne.n	c0de22ca <crypto_sign_keypair_core+0xda>
c0de22c0:	9801      	ldr	r0, [sp, #4]
c0de22c2:	4629      	mov	r1, r5
c0de22c4:	4652      	mov	r2, sl
c0de22c6:	f7ff fb35 	bl	c0de1934 <pack_sk_s1>
c0de22ca:	4628      	mov	r0, r5
c0de22cc:	f7ff fc49 	bl	c0de1b62 <pqcrystals_dilithium2_lowram_poly_ntt>
c0de22d0:	eb0b 000a 	add.w	r0, fp, sl
c0de22d4:	f60d 6108 	addw	r1, sp, #3592	@ 0xe08
c0de22d8:	b282      	uxth	r2, r0
c0de22da:	4620      	mov	r0, r4
c0de22dc:	f7ff fc7c 	bl	c0de1bd8 <pqcrystals_dilithium2_lowram_poly_uniform>
c0de22e0:	4630      	mov	r0, r6
c0de22e2:	4621      	mov	r1, r4
c0de22e4:	462a      	mov	r2, r5
c0de22e6:	f7ff fb56 	bl	c0de1996 <pqcrystals_dilithium2_lowram_poly_pointwise_acc_montgomery>
c0de22ea:	f10a 0a01 	add.w	sl, sl, #1
c0de22ee:	e7db      	b.n	c0de22a8 <crypto_sign_keypair_core+0xb8>
c0de22f0:	4630      	mov	r0, r6
c0de22f2:	f7ff fc09 	bl	c0de1b08 <pqcrystals_dilithium2_lowram_poly_reduce>
c0de22f6:	4630      	mov	r0, r6
c0de22f8:	f7ff fc35 	bl	c0de1b66 <pqcrystals_dilithium2_lowram_poly_invntt_tomont>
c0de22fc:	f108 0004 	add.w	r0, r8, #4
c0de2300:	4639      	mov	r1, r7
c0de2302:	b282      	uxth	r2, r0
c0de2304:	4620      	mov	r0, r4
c0de2306:	f7ff fcdb 	bl	c0de1cc0 <pqcrystals_dilithium2_lowram_poly_uniform_eta>
c0de230a:	f8dd a004 	ldr.w	sl, [sp, #4]
c0de230e:	4621      	mov	r1, r4
c0de2310:	4642      	mov	r2, r8
c0de2312:	4650      	mov	r0, sl
c0de2314:	f7ff fb15 	bl	c0de1942 <pack_sk_s2>
c0de2318:	4630      	mov	r0, r6
c0de231a:	4631      	mov	r1, r6
c0de231c:	4622      	mov	r2, r4
c0de231e:	f7ff fc11 	bl	c0de1b44 <pqcrystals_dilithium2_lowram_poly_add>
c0de2322:	4630      	mov	r0, r6
c0de2324:	f7ff fbff 	bl	c0de1b26 <pqcrystals_dilithium2_lowram_poly_caddq>
c0de2328:	4628      	mov	r0, r5
c0de232a:	4621      	mov	r1, r4
c0de232c:	4632      	mov	r2, r6
c0de232e:	f7ff fc2f 	bl	c0de1b90 <pqcrystals_dilithium2_lowram_poly_power2round>
c0de2332:	4650      	mov	r0, sl
c0de2334:	4621      	mov	r1, r4
c0de2336:	4642      	mov	r2, r8
c0de2338:	f7ff fb0b 	bl	c0de1952 <pack_sk_t0>
c0de233c:	9800      	ldr	r0, [sp, #0]
c0de233e:	4629      	mov	r1, r5
c0de2340:	4642      	mov	r2, r8
c0de2342:	f7ff faf0 	bl	c0de1926 <pack_pk_t1>
c0de2346:	f50b 7b80 	add.w	fp, fp, #256	@ 0x100
c0de234a:	f108 0801 	add.w	r8, r8, #1
c0de234e:	e789      	b.n	c0de2264 <crypto_sign_keypair_core+0x74>
c0de2350:	ac02      	add	r4, sp, #8
c0de2352:	4620      	mov	r0, r4
c0de2354:	f7fe fdfc 	bl	c0de0f50 <inner_keccak256_init>
c0de2358:	9e00      	ldr	r6, [sp, #0]
c0de235a:	4620      	mov	r0, r4
c0de235c:	f44f 62a4 	mov.w	r2, #1312	@ 0x520
c0de2360:	4631      	mov	r1, r6
c0de2362:	f7fe fe06 	bl	c0de0f72 <inner_keccak256_inject>
c0de2366:	f000 fb29 	bl	c0de29bc <OUTLINED_FUNCTION_0>
c0de236a:	ad82      	add	r5, sp, #520	@ 0x208
c0de236c:	4620      	mov	r0, r4
c0de236e:	2240      	movs	r2, #64	@ 0x40
c0de2370:	4629      	mov	r1, r5
c0de2372:	f7fe fe26 	bl	c0de0fc2 <inner_keccak256_extract>
c0de2376:	480c      	ldr	r0, [pc, #48]	@ (c0de23a8 <crypto_sign_keypair_core+0x1b8>)
c0de2378:	4629      	mov	r1, r5
c0de237a:	2240      	movs	r2, #64	@ 0x40
c0de237c:	eb09 0400 	add.w	r4, r9, r0
c0de2380:	f504 7020 	add.w	r0, r4, #640	@ 0x280
c0de2384:	f008 fdee 	bl	c0deaf64 <__aeabi_memcpy>
c0de2388:	f504 7030 	add.w	r0, r4, #704	@ 0x2c0
c0de238c:	4631      	mov	r1, r6
c0de238e:	f44f 62a4 	mov.w	r2, #1312	@ 0x520
c0de2392:	f008 fde7 	bl	c0deaf64 <__aeabi_memcpy>
c0de2396:	9801      	ldr	r0, [sp, #4]
c0de2398:	4629      	mov	r1, r5
c0de239a:	f7ff faf3 	bl	c0de1984 <pack_sk_tr>
c0de239e:	2000      	movs	r0, #0
c0de23a0:	f60d 6d88 	addw	sp, sp, #3720	@ 0xe88
c0de23a4:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de23a8:	000002d8 	.word	0x000002d8

c0de23ac <crypto_sign_signature_init>:
c0de23ac:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de23b0:	29ff      	cmp	r1, #255	@ 0xff
c0de23b2:	d902      	bls.n	c0de23ba <crypto_sign_signature_init+0xe>
c0de23b4:	f04f 34ff 	mov.w	r4, #4294967295	@ 0xffffffff
c0de23b8:	e01c      	b.n	c0de23f4 <crypto_sign_signature_init+0x48>
c0de23ba:	4680      	mov	r8, r0
c0de23bc:	480f      	ldr	r0, [pc, #60]	@ (c0de23fc <crypto_sign_signature_init+0x50>)
c0de23be:	2400      	movs	r4, #0
c0de23c0:	460d      	mov	r5, r1
c0de23c2:	eb09 0700 	add.w	r7, r9, r0
c0de23c6:	4638      	mov	r0, r7
c0de23c8:	f887 1201 	strb.w	r1, [r7, #513]	@ 0x201
c0de23cc:	f887 4200 	strb.w	r4, [r7, #512]	@ 0x200
c0de23d0:	f7fe fdbe 	bl	c0de0f50 <inner_keccak256_init>
c0de23d4:	4e0a      	ldr	r6, [pc, #40]	@ (c0de2400 <crypto_sign_signature_init+0x54>)
c0de23d6:	f507 7120 	add.w	r1, r7, #640	@ 0x280
c0de23da:	4638      	mov	r0, r7
c0de23dc:	2240      	movs	r2, #64	@ 0x40
c0de23de:	447e      	add	r6, pc
c0de23e0:	47b0      	blx	r6
c0de23e2:	f507 7100 	add.w	r1, r7, #512	@ 0x200
c0de23e6:	4638      	mov	r0, r7
c0de23e8:	2202      	movs	r2, #2
c0de23ea:	47b0      	blx	r6
c0de23ec:	4638      	mov	r0, r7
c0de23ee:	4641      	mov	r1, r8
c0de23f0:	462a      	mov	r2, r5
c0de23f2:	47b0      	blx	r6
c0de23f4:	4620      	mov	r0, r4
c0de23f6:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de23fa:	bf00      	nop
c0de23fc:	000002d8 	.word	0x000002d8
c0de2400:	ffffeb91 	.word	0xffffeb91

c0de2404 <crypto_sign_signature_absorb>:
c0de2404:	460a      	mov	r2, r1
c0de2406:	4601      	mov	r1, r0
c0de2408:	4801      	ldr	r0, [pc, #4]	@ (c0de2410 <crypto_sign_signature_absorb+0xc>)
c0de240a:	4448      	add	r0, r9
c0de240c:	f7fe bdb1 	b.w	c0de0f72 <inner_keccak256_inject>
c0de2410:	000002d8 	.word	0x000002d8

c0de2414 <crypto_sign_signature_core>:
c0de2414:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de2418:	f5ad 5d83 	sub.w	sp, sp, #4192	@ 0x1060
c0de241c:	b086      	sub	sp, #24
c0de241e:	900b      	str	r0, [sp, #44]	@ 0x2c
c0de2420:	48bf      	ldr	r0, [pc, #764]	@ (c0de2720 <crypto_sign_signature_core+0x30c>)
c0de2422:	4616      	mov	r6, r2
c0de2424:	9103      	str	r1, [sp, #12]
c0de2426:	eb09 0400 	add.w	r4, r9, r0
c0de242a:	f000 fac7 	bl	c0de29bc <OUTLINED_FUNCTION_0>
c0de242e:	f504 7100 	add.w	r1, r4, #512	@ 0x200
c0de2432:	4620      	mov	r0, r4
c0de2434:	2240      	movs	r2, #64	@ 0x40
c0de2436:	f7fe fdc4 	bl	c0de0fc2 <inner_keccak256_extract>
c0de243a:	a80d      	add	r0, sp, #52	@ 0x34
c0de243c:	2100      	movs	r1, #0
c0de243e:	f500 7000 	add.w	r0, r0, #512	@ 0x200
c0de2442:	900a      	str	r0, [sp, #40]	@ 0x28
c0de2444:	2000      	movs	r0, #0
c0de2446:	2920      	cmp	r1, #32
c0de2448:	d006      	beq.n	c0de2458 <crypto_sign_signature_core+0x44>
c0de244a:	4ab5      	ldr	r2, [pc, #724]	@ (c0de2720 <crypto_sign_signature_core+0x30c>)
c0de244c:	444a      	add	r2, r9
c0de244e:	440a      	add	r2, r1
c0de2450:	3101      	adds	r1, #1
c0de2452:	f882 0240 	strb.w	r0, [r2, #576]	@ 0x240
c0de2456:	e7f6      	b.n	c0de2446 <crypto_sign_signature_core+0x32>
c0de2458:	48b1      	ldr	r0, [pc, #708]	@ (c0de2720 <crypto_sign_signature_core+0x30c>)
c0de245a:	eb09 0400 	add.w	r4, r9, r0
c0de245e:	4620      	mov	r0, r4
c0de2460:	f7fe fd76 	bl	c0de0f50 <inner_keccak256_init>
c0de2464:	4fb0      	ldr	r7, [pc, #704]	@ (c0de2728 <crypto_sign_signature_core+0x314>)
c0de2466:	f106 0120 	add.w	r1, r6, #32
c0de246a:	4620      	mov	r0, r4
c0de246c:	2220      	movs	r2, #32
c0de246e:	447f      	add	r7, pc
c0de2470:	47b8      	blx	r7
c0de2472:	f504 7510 	add.w	r5, r4, #576	@ 0x240
c0de2476:	4620      	mov	r0, r4
c0de2478:	2220      	movs	r2, #32
c0de247a:	4629      	mov	r1, r5
c0de247c:	47b8      	blx	r7
c0de247e:	f504 7100 	add.w	r1, r4, #512	@ 0x200
c0de2482:	4620      	mov	r0, r4
c0de2484:	2240      	movs	r2, #64	@ 0x40
c0de2486:	47b8      	blx	r7
c0de2488:	f000 fa98 	bl	c0de29bc <OUTLINED_FUNCTION_0>
c0de248c:	4620      	mov	r0, r4
c0de248e:	4629      	mov	r1, r5
c0de2490:	2240      	movs	r2, #64	@ 0x40
c0de2492:	f7fe fd96 	bl	c0de0fc2 <inner_keccak256_extract>
c0de2496:	f506 7060 	add.w	r0, r6, #896	@ 0x380
c0de249a:	2100      	movs	r1, #0
c0de249c:	f04f 0800 	mov.w	r8, #0
c0de24a0:	9004      	str	r0, [sp, #16]
c0de24a2:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de24a4:	3020      	adds	r0, #32
c0de24a6:	9005      	str	r0, [sp, #20]
c0de24a8:	ac0d      	add	r4, sp, #52	@ 0x34
c0de24aa:	2001      	movs	r0, #1
c0de24ac:	9107      	str	r1, [sp, #28]
c0de24ae:	9006      	str	r0, [sp, #24]
c0de24b0:	b280      	uxth	r0, r0
c0de24b2:	f64f 71fc 	movw	r1, #65532	@ 0xfffc
c0de24b6:	eb01 0380 	add.w	r3, r1, r0, lsl #2
c0de24ba:	2000      	movs	r0, #0
c0de24bc:	f50d 618f 	add.w	r1, sp, #1144	@ 0x478
c0de24c0:	2804      	cmp	r0, #4
c0de24c2:	d00b      	beq.n	c0de24dc <crypto_sign_signature_core+0xc8>
c0de24c4:	2200      	movs	r2, #0
c0de24c6:	f5b2 7f40 	cmp.w	r2, #768	@ 0x300
c0de24ca:	d003      	beq.n	c0de24d4 <crypto_sign_signature_core+0xc0>
c0de24cc:	f801 8002 	strb.w	r8, [r1, r2]
c0de24d0:	3201      	adds	r2, #1
c0de24d2:	e7f8      	b.n	c0de24c6 <crypto_sign_signature_core+0xb2>
c0de24d4:	f501 7140 	add.w	r1, r1, #768	@ 0x300
c0de24d8:	3001      	adds	r0, #1
c0de24da:	e7f1      	b.n	c0de24c0 <crypto_sign_signature_core+0xac>
c0de24dc:	9807      	ldr	r0, [sp, #28]
c0de24de:	2700      	movs	r7, #0
c0de24e0:	9309      	str	r3, [sp, #36]	@ 0x24
c0de24e2:	b280      	uxth	r0, r0
c0de24e4:	ea4f 0b80 	mov.w	fp, r0, lsl #2
c0de24e8:	2f04      	cmp	r7, #4
c0de24ea:	d023      	beq.n	c0de2534 <crypto_sign_signature_core+0x120>
c0de24ec:	488c      	ldr	r0, [pc, #560]	@ (c0de2720 <crypto_sign_signature_core+0x30c>)
c0de24ee:	eb09 0300 	add.w	r3, r9, r0
c0de24f2:	eb07 000b 	add.w	r0, r7, fp
c0de24f6:	b282      	uxth	r2, r0
c0de24f8:	f503 7110 	add.w	r1, r3, #576	@ 0x240
c0de24fc:	4620      	mov	r0, r4
c0de24fe:	f7ff f905 	bl	c0de170c <poly_uniform_gamma1_lowram_eth>
c0de2502:	4620      	mov	r0, r4
c0de2504:	f7ff fb2d 	bl	c0de1b62 <pqcrystals_dilithium2_lowram_poly_ntt>
c0de2508:	f04f 0a00 	mov.w	sl, #0
c0de250c:	f50d 658f 	add.w	r5, sp, #1144	@ 0x478
c0de2510:	f5ba 6f80 	cmp.w	sl, #1024	@ 0x400
c0de2514:	d00c      	beq.n	c0de2530 <crypto_sign_signature_core+0x11c>
c0de2516:	eb07 000a 	add.w	r0, r7, sl
c0de251a:	4621      	mov	r1, r4
c0de251c:	4632      	mov	r2, r6
c0de251e:	b283      	uxth	r3, r0
c0de2520:	4628      	mov	r0, r5
c0de2522:	f7ff f883 	bl	c0de162c <poly_uniform_pointwise_montgomery_polywadd_lowram_eth>
c0de2526:	f505 7540 	add.w	r5, r5, #768	@ 0x300
c0de252a:	f50a 7a80 	add.w	sl, sl, #256	@ 0x100
c0de252e:	e7ef      	b.n	c0de2510 <crypto_sign_signature_core+0xfc>
c0de2530:	3701      	adds	r7, #1
c0de2532:	e7d9      	b.n	c0de24e8 <crypto_sign_signature_core+0xd4>
c0de2534:	f8dd b024 	ldr.w	fp, [sp, #36]	@ 0x24
c0de2538:	2700      	movs	r7, #0
c0de253a:	f50d 658f 	add.w	r5, sp, #1144	@ 0x478
c0de253e:	f5b7 7f40 	cmp.w	r7, #768	@ 0x300
c0de2542:	d01a      	beq.n	c0de257a <crypto_sign_signature_core+0x166>
c0de2544:	4620      	mov	r0, r4
c0de2546:	4629      	mov	r1, r5
c0de2548:	f7fe ffd3 	bl	c0de14f2 <polyw_unpack>
c0de254c:	4620      	mov	r0, r4
c0de254e:	f7ff fb0a 	bl	c0de1b66 <pqcrystals_dilithium2_lowram_poly_invntt_tomont>
c0de2552:	4620      	mov	r0, r4
c0de2554:	f7ff fae7 	bl	c0de1b26 <pqcrystals_dilithium2_lowram_poly_caddq>
c0de2558:	4628      	mov	r0, r5
c0de255a:	4621      	mov	r1, r4
c0de255c:	f7fe ffab 	bl	c0de14b6 <polyw_pack>
c0de2560:	4620      	mov	r0, r4
c0de2562:	4621      	mov	r1, r4
c0de2564:	f7fe fff5 	bl	c0de1552 <poly_highbits>
c0de2568:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de256a:	4621      	mov	r1, r4
c0de256c:	4438      	add	r0, r7
c0de256e:	f7ff fd91 	bl	c0de2094 <pqcrystals_dilithium2_lowram_polyw1_pack>
c0de2572:	f505 7540 	add.w	r5, r5, #768	@ 0x300
c0de2576:	37c0      	adds	r7, #192	@ 0xc0
c0de2578:	e7e1      	b.n	c0de253e <crypto_sign_signature_core+0x12a>
c0de257a:	4869      	ldr	r0, [pc, #420]	@ (c0de2720 <crypto_sign_signature_core+0x30c>)
c0de257c:	eb09 0500 	add.w	r5, r9, r0
c0de2580:	4628      	mov	r0, r5
c0de2582:	f7fe fce5 	bl	c0de0f50 <inner_keccak256_init>
c0de2586:	f505 7100 	add.w	r1, r5, #512	@ 0x200
c0de258a:	4628      	mov	r0, r5
c0de258c:	2240      	movs	r2, #64	@ 0x40
c0de258e:	f7fe fcf0 	bl	c0de0f72 <inner_keccak256_inject>
c0de2592:	9f0b      	ldr	r7, [sp, #44]	@ 0x2c
c0de2594:	4628      	mov	r0, r5
c0de2596:	f44f 7240 	mov.w	r2, #768	@ 0x300
c0de259a:	4639      	mov	r1, r7
c0de259c:	f7fe fce9 	bl	c0de0f72 <inner_keccak256_inject>
c0de25a0:	4628      	mov	r0, r5
c0de25a2:	f7fe fcf8 	bl	c0de0f96 <inner_keccak256_flip>
c0de25a6:	4628      	mov	r0, r5
c0de25a8:	4639      	mov	r1, r7
c0de25aa:	2220      	movs	r2, #32
c0de25ac:	f7fe fd09 	bl	c0de0fc2 <inner_keccak256_extract>
c0de25b0:	4620      	mov	r0, r4
c0de25b2:	4639      	mov	r1, r7
c0de25b4:	f7ff fc69 	bl	c0de1e8a <pqcrystals_dilithium2_lowram_poly_challenge_eth>
c0de25b8:	f20d 4034 	addw	r0, sp, #1076	@ 0x434
c0de25bc:	4621      	mov	r1, r4
c0de25be:	f7fe fda6 	bl	c0de110e <poly_challenge_compress>
c0de25c2:	9807      	ldr	r0, [sp, #28]
c0de25c4:	f8dd a014 	ldr.w	sl, [sp, #20]
c0de25c8:	2500      	movs	r5, #0
c0de25ca:	3001      	adds	r0, #1
c0de25cc:	9007      	str	r0, [sp, #28]
c0de25ce:	b135      	cbz	r5, c0de25de <crypto_sign_signature_core+0x1ca>
c0de25d0:	2d04      	cmp	r5, #4
c0de25d2:	d035      	beq.n	c0de2640 <crypto_sign_signature_core+0x22c>
c0de25d4:	4620      	mov	r0, r4
c0de25d6:	f20d 4134 	addw	r1, sp, #1076	@ 0x434
c0de25da:	f7fe fdcd 	bl	c0de1178 <poly_challenge_decompress>
c0de25de:	9f0a      	ldr	r7, [sp, #40]	@ 0x28
c0de25e0:	4621      	mov	r1, r4
c0de25e2:	4638      	mov	r0, r7
c0de25e4:	f000 fada 	bl	c0de2b9c <poly_small_ntt_copy>
c0de25e8:	4620      	mov	r0, r4
c0de25ea:	4631      	mov	r1, r6
c0de25ec:	462a      	mov	r2, r5
c0de25ee:	f7fe fff9 	bl	c0de15e4 <unpack_sk_s1>
c0de25f2:	4620      	mov	r0, r4
c0de25f4:	f000 f9e6 	bl	c0de29c4 <small_ntt>
c0de25f8:	4620      	mov	r0, r4
c0de25fa:	4639      	mov	r1, r7
c0de25fc:	4622      	mov	r2, r4
c0de25fe:	f000 fb05 	bl	c0de2c0c <poly_small_basemul_invntt>
c0de2602:	4847      	ldr	r0, [pc, #284]	@ (c0de2720 <crypto_sign_signature_core+0x30c>)
c0de2604:	4621      	mov	r1, r4
c0de2606:	4448      	add	r0, r9
c0de2608:	9000      	str	r0, [sp, #0]
c0de260a:	f500 7210 	add.w	r2, r0, #576	@ 0x240
c0de260e:	eb0b 0005 	add.w	r0, fp, r5
c0de2612:	b283      	uxth	r3, r0
c0de2614:	4620      	mov	r0, r4
c0de2616:	f7ff f8af 	bl	c0de1778 <poly_uniform_gamma1_add_lowram_eth>
c0de261a:	4620      	mov	r0, r4
c0de261c:	f7ff fa74 	bl	c0de1b08 <pqcrystals_dilithium2_lowram_poly_reduce>
c0de2620:	4840      	ldr	r0, [pc, #256]	@ (c0de2724 <crypto_sign_signature_core+0x310>)
c0de2622:	f500 410c 	add.w	r1, r0, #35840	@ 0x8c00
c0de2626:	4620      	mov	r0, r4
c0de2628:	f7ff fac0 	bl	c0de1bac <pqcrystals_dilithium2_lowram_poly_chknorm>
c0de262c:	2800      	cmp	r0, #0
c0de262e:	d166      	bne.n	c0de26fe <crypto_sign_signature_core+0x2ea>
c0de2630:	4650      	mov	r0, sl
c0de2632:	4621      	mov	r1, r4
c0de2634:	f7ff fcfd 	bl	c0de2032 <pqcrystals_dilithium2_lowram_polyz_pack>
c0de2638:	f50a 7a10 	add.w	sl, sl, #576	@ 0x240
c0de263c:	3501      	adds	r5, #1
c0de263e:	e7c6      	b.n	c0de25ce <crypto_sign_signature_core+0x1ba>
c0de2640:	9d04      	ldr	r5, [sp, #16]
c0de2642:	2100      	movs	r1, #0
c0de2644:	2000      	movs	r0, #0
c0de2646:	f50d 6a8f 	add.w	sl, sp, #1144	@ 0x478
c0de264a:	2700      	movs	r7, #0
c0de264c:	9009      	str	r0, [sp, #36]	@ 0x24
c0de264e:	910c      	str	r1, [sp, #48]	@ 0x30
c0de2650:	2f04      	cmp	r7, #4
c0de2652:	d057      	beq.n	c0de2704 <crypto_sign_signature_core+0x2f0>
c0de2654:	4620      	mov	r0, r4
c0de2656:	f20d 4134 	addw	r1, sp, #1076	@ 0x434
c0de265a:	f7fe fd8d 	bl	c0de1178 <poly_challenge_decompress>
c0de265e:	46ab      	mov	fp, r5
c0de2660:	9d0a      	ldr	r5, [sp, #40]	@ 0x28
c0de2662:	4621      	mov	r1, r4
c0de2664:	4628      	mov	r0, r5
c0de2666:	f000 fa99 	bl	c0de2b9c <poly_small_ntt_copy>
c0de266a:	4620      	mov	r0, r4
c0de266c:	4631      	mov	r1, r6
c0de266e:	463a      	mov	r2, r7
c0de2670:	9708      	str	r7, [sp, #32]
c0de2672:	f7fe ffbe 	bl	c0de15f2 <unpack_sk_s2>
c0de2676:	4620      	mov	r0, r4
c0de2678:	f000 f9a4 	bl	c0de29c4 <small_ntt>
c0de267c:	4629      	mov	r1, r5
c0de267e:	4620      	mov	r0, r4
c0de2680:	4622      	mov	r2, r4
c0de2682:	465d      	mov	r5, fp
c0de2684:	f000 fac2 	bl	c0de2c0c <poly_small_basemul_invntt>
c0de2688:	4620      	mov	r0, r4
c0de268a:	4651      	mov	r1, sl
c0de268c:	4622      	mov	r2, r4
c0de268e:	f7fe ff48 	bl	c0de1522 <polyw_sub>
c0de2692:	4620      	mov	r0, r4
c0de2694:	f7ff fa38 	bl	c0de1b08 <pqcrystals_dilithium2_lowram_poly_reduce>
c0de2698:	4650      	mov	r0, sl
c0de269a:	4621      	mov	r1, r4
c0de269c:	f7fe ff0b 	bl	c0de14b6 <polyw_pack>
c0de26a0:	4620      	mov	r0, r4
c0de26a2:	4621      	mov	r1, r4
c0de26a4:	f7fe ff6e 	bl	c0de1584 <poly_lowbits>
c0de26a8:	4620      	mov	r0, r4
c0de26aa:	f7ff fa2d 	bl	c0de1b08 <pqcrystals_dilithium2_lowram_poly_reduce>
c0de26ae:	491d      	ldr	r1, [pc, #116]	@ (c0de2724 <crypto_sign_signature_core+0x310>)
c0de26b0:	4620      	mov	r0, r4
c0de26b2:	f7ff fa7b 	bl	c0de1bac <pqcrystals_dilithium2_lowram_poly_chknorm>
c0de26b6:	bb10      	cbnz	r0, c0de26fe <crypto_sign_signature_core+0x2ea>
c0de26b8:	4620      	mov	r0, r4
c0de26ba:	f20d 4134 	addw	r1, sp, #1076	@ 0x434
c0de26be:	462a      	mov	r2, r5
c0de26c0:	f7fe fd8c 	bl	c0de11dc <poly_schoolbook>
c0de26c4:	4620      	mov	r0, r4
c0de26c6:	f44f 31ba 	mov.w	r1, #95232	@ 0x17400
c0de26ca:	f7ff fa6f 	bl	c0de1bac <pqcrystals_dilithium2_lowram_poly_chknorm>
c0de26ce:	b9b0      	cbnz	r0, c0de26fe <crypto_sign_signature_core+0x2ea>
c0de26d0:	4620      	mov	r0, r4
c0de26d2:	4621      	mov	r1, r4
c0de26d4:	4652      	mov	r2, sl
c0de26d6:	f7ff f887 	bl	c0de17e8 <poly_make_hint_lowram>
c0de26da:	9909      	ldr	r1, [sp, #36]	@ 0x24
c0de26dc:	4401      	add	r1, r0
c0de26de:	2950      	cmp	r1, #80	@ 0x50
c0de26e0:	9109      	str	r1, [sp, #36]	@ 0x24
c0de26e2:	d80c      	bhi.n	c0de26fe <crypto_sign_signature_core+0x2ea>
c0de26e4:	9f08      	ldr	r7, [sp, #32]
c0de26e6:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de26e8:	4621      	mov	r1, r4
c0de26ea:	ab0c      	add	r3, sp, #48	@ 0x30
c0de26ec:	463a      	mov	r2, r7
c0de26ee:	f7fe fcec 	bl	c0de10ca <pqcrystals_dilithium2_lowram_pack_sig_h>
c0de26f2:	f505 75d0 	add.w	r5, r5, #416	@ 0x1a0
c0de26f6:	f50a 7a40 	add.w	sl, sl, #768	@ 0x300
c0de26fa:	3701      	adds	r7, #1
c0de26fc:	e7a8      	b.n	c0de2650 <crypto_sign_signature_core+0x23c>
c0de26fe:	9806      	ldr	r0, [sp, #24]
c0de2700:	3001      	adds	r0, #1
c0de2702:	e6d4      	b.n	c0de24ae <crypto_sign_signature_core+0x9a>
c0de2704:	a90c      	add	r1, sp, #48	@ 0x30
c0de2706:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de2708:	f7fe fcf5 	bl	c0de10f6 <pqcrystals_dilithium2_lowram_pack_sig_h_zero>
c0de270c:	9903      	ldr	r1, [sp, #12]
c0de270e:	f640 1074 	movw	r0, #2420	@ 0x974
c0de2712:	6008      	str	r0, [r1, #0]
c0de2714:	2000      	movs	r0, #0
c0de2716:	f50d 5d83 	add.w	sp, sp, #4192	@ 0x1060
c0de271a:	b006      	add	sp, #24
c0de271c:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de2720:	000002d8 	.word	0x000002d8
c0de2724:	000173b2 	.word	0x000173b2
c0de2728:	ffffeb01 	.word	0xffffeb01

c0de272c <pqcrystals_dilithium2_lowram_verify>:
c0de272c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de2730:	f6ad 3d58 	subw	sp, sp, #2904	@ 0xb58
c0de2734:	4692      	mov	sl, r2
c0de2736:	f640 1274 	movw	r2, #2420	@ 0x974
c0de273a:	4604      	mov	r4, r0
c0de273c:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de2740:	4291      	cmp	r1, r2
c0de2742:	f040 80eb 	bne.w	c0de291c <pqcrystals_dilithium2_lowram_verify+0x1f0>
c0de2746:	f8dd 1b7c 	ldr.w	r1, [sp, #2940]	@ 0xb7c
c0de274a:	29ff      	cmp	r1, #255	@ 0xff
c0de274c:	f200 80e6 	bhi.w	c0de291c <pqcrystals_dilithium2_lowram_verify+0x1f0>
c0de2750:	ad84      	add	r5, sp, #528	@ 0x210
c0de2752:	4e81      	ldr	r6, [pc, #516]	@ (c0de2958 <pqcrystals_dilithium2_lowram_verify+0x22c>)
c0de2754:	f8dd 8b80 	ldr.w	r8, [sp, #2944]	@ 0xb80
c0de2758:	9303      	str	r3, [sp, #12]
c0de275a:	4628      	mov	r0, r5
c0de275c:	447e      	add	r6, pc
c0de275e:	47b0      	blx	r6
c0de2760:	4f7e      	ldr	r7, [pc, #504]	@ (c0de295c <pqcrystals_dilithium2_lowram_verify+0x230>)
c0de2762:	4628      	mov	r0, r5
c0de2764:	4641      	mov	r1, r8
c0de2766:	f44f 62a4 	mov.w	r2, #1312	@ 0x520
c0de276a:	447f      	add	r7, pc
c0de276c:	47b8      	blx	r7
c0de276e:	4628      	mov	r0, r5
c0de2770:	f7fe fc11 	bl	c0de0f96 <inner_keccak256_flip>
c0de2774:	f50d 6b82 	add.w	fp, sp, #1040	@ 0x410
c0de2778:	4628      	mov	r0, r5
c0de277a:	2240      	movs	r2, #64	@ 0x40
c0de277c:	4659      	mov	r1, fp
c0de277e:	f7fe fc20 	bl	c0de0fc2 <inner_keccak256_extract>
c0de2782:	4628      	mov	r0, r5
c0de2784:	47b0      	blx	r6
c0de2786:	4628      	mov	r0, r5
c0de2788:	4659      	mov	r1, fp
c0de278a:	2240      	movs	r2, #64	@ 0x40
c0de278c:	47b8      	blx	r7
c0de278e:	f8dd 0b7c 	ldr.w	r0, [sp, #2940]	@ 0xb7c
c0de2792:	f04f 0800 	mov.w	r8, #0
c0de2796:	4659      	mov	r1, fp
c0de2798:	2202      	movs	r2, #2
c0de279a:	f88d 8410 	strb.w	r8, [sp, #1040]	@ 0x410
c0de279e:	f88d 0411 	strb.w	r0, [sp, #1041]	@ 0x411
c0de27a2:	4628      	mov	r0, r5
c0de27a4:	47b8      	blx	r7
c0de27a6:	f8dd 1b78 	ldr.w	r1, [sp, #2936]	@ 0xb78
c0de27aa:	f8dd 2b7c 	ldr.w	r2, [sp, #2940]	@ 0xb7c
c0de27ae:	4628      	mov	r0, r5
c0de27b0:	47b8      	blx	r7
c0de27b2:	9a03      	ldr	r2, [sp, #12]
c0de27b4:	4628      	mov	r0, r5
c0de27b6:	4651      	mov	r1, sl
c0de27b8:	47b8      	blx	r7
c0de27ba:	4628      	mov	r0, r5
c0de27bc:	f7fe fbeb 	bl	c0de0f96 <inner_keccak256_flip>
c0de27c0:	4628      	mov	r0, r5
c0de27c2:	4659      	mov	r1, fp
c0de27c4:	2240      	movs	r2, #64	@ 0x40
c0de27c6:	f7fe fbfc 	bl	c0de0fc2 <inner_keccak256_extract>
c0de27ca:	4628      	mov	r0, r5
c0de27cc:	47b0      	blx	r6
c0de27ce:	4628      	mov	r0, r5
c0de27d0:	4659      	mov	r1, fp
c0de27d2:	2240      	movs	r2, #64	@ 0x40
c0de27d4:	47b8      	blx	r7
c0de27d6:	f20d 7754 	addw	r7, sp, #1876	@ 0x754
c0de27da:	4621      	mov	r1, r4
c0de27dc:	4638      	mov	r0, r7
c0de27de:	f7ff fb54 	bl	c0de1e8a <pqcrystals_dilithium2_lowram_poly_challenge_eth>
c0de27e2:	4658      	mov	r0, fp
c0de27e4:	4639      	mov	r1, r7
c0de27e6:	f7fe fc92 	bl	c0de110e <poly_challenge_compress>
c0de27ea:	f8dd 0b80 	ldr.w	r0, [sp, #2944]	@ 0xb80
c0de27ee:	4e59      	ldr	r6, [pc, #356]	@ (c0de2954 <pqcrystals_dilithium2_lowram_verify+0x228>)
c0de27f0:	f104 0520 	add.w	r5, r4, #32
c0de27f4:	f20d 4b54 	addw	fp, sp, #1108	@ 0x454
c0de27f8:	f04f 0a00 	mov.w	sl, #0
c0de27fc:	9500      	str	r5, [sp, #0]
c0de27fe:	3020      	adds	r0, #32
c0de2800:	9001      	str	r0, [sp, #4]
c0de2802:	2001      	movs	r0, #1
c0de2804:	9003      	str	r0, [sp, #12]
c0de2806:	f1ba 0f04 	cmp.w	sl, #4
c0de280a:	f000 808b 	beq.w	c0de2924 <pqcrystals_dilithium2_lowram_verify+0x1f8>
c0de280e:	2000      	movs	r0, #0
c0de2810:	f5b0 7f40 	cmp.w	r0, #768	@ 0x300
c0de2814:	d003      	beq.n	c0de281e <pqcrystals_dilithium2_lowram_verify+0xf2>
c0de2816:	f80b 8000 	strb.w	r8, [fp, r0]
c0de281a:	3001      	adds	r0, #1
c0de281c:	e7f8      	b.n	c0de2810 <pqcrystals_dilithium2_lowram_verify+0xe4>
c0de281e:	4638      	mov	r0, r7
c0de2820:	4629      	mov	r1, r5
c0de2822:	f8cd a008 	str.w	sl, [sp, #8]
c0de2826:	f7ff faa2 	bl	c0de1d6e <pqcrystals_dilithium2_lowram_polyz_unpack>
c0de282a:	4638      	mov	r0, r7
c0de282c:	4631      	mov	r1, r6
c0de282e:	f7ff f9bd 	bl	c0de1bac <pqcrystals_dilithium2_lowram_poly_chknorm>
c0de2832:	2800      	cmp	r0, #0
c0de2834:	d170      	bne.n	c0de2918 <pqcrystals_dilithium2_lowram_verify+0x1ec>
c0de2836:	4638      	mov	r0, r7
c0de2838:	f7ff f993 	bl	c0de1b62 <pqcrystals_dilithium2_lowram_poly_ntt>
c0de283c:	9802      	ldr	r0, [sp, #8]
c0de283e:	f8dd 2b80 	ldr.w	r2, [sp, #2944]	@ 0xb80
c0de2842:	4639      	mov	r1, r7
c0de2844:	0200      	lsls	r0, r0, #8
c0de2846:	b283      	uxth	r3, r0
c0de2848:	4658      	mov	r0, fp
c0de284a:	f7fe feef 	bl	c0de162c <poly_uniform_pointwise_montgomery_polywadd_lowram_eth>
c0de284e:	9d03      	ldr	r5, [sp, #12]
c0de2850:	f44f 7a18 	mov.w	sl, #608	@ 0x260
c0de2854:	f5ba 6f12 	cmp.w	sl, #2336	@ 0x920
c0de2858:	d018      	beq.n	c0de288c <pqcrystals_dilithium2_lowram_verify+0x160>
c0de285a:	eb04 010a 	add.w	r1, r4, sl
c0de285e:	4638      	mov	r0, r7
c0de2860:	f7ff fa85 	bl	c0de1d6e <pqcrystals_dilithium2_lowram_polyz_unpack>
c0de2864:	4638      	mov	r0, r7
c0de2866:	4631      	mov	r1, r6
c0de2868:	f7ff f9a0 	bl	c0de1bac <pqcrystals_dilithium2_lowram_poly_chknorm>
c0de286c:	2800      	cmp	r0, #0
c0de286e:	d153      	bne.n	c0de2918 <pqcrystals_dilithium2_lowram_verify+0x1ec>
c0de2870:	4638      	mov	r0, r7
c0de2872:	f7ff f976 	bl	c0de1b62 <pqcrystals_dilithium2_lowram_poly_ntt>
c0de2876:	f8dd 2b80 	ldr.w	r2, [sp, #2944]	@ 0xb80
c0de287a:	b2ab      	uxth	r3, r5
c0de287c:	4658      	mov	r0, fp
c0de287e:	4639      	mov	r1, r7
c0de2880:	f7fe fed4 	bl	c0de162c <poly_uniform_pointwise_montgomery_polywadd_lowram_eth>
c0de2884:	3501      	adds	r5, #1
c0de2886:	f50a 7a10 	add.w	sl, sl, #576	@ 0x240
c0de288a:	e7e3      	b.n	c0de2854 <pqcrystals_dilithium2_lowram_verify+0x128>
c0de288c:	4638      	mov	r0, r7
c0de288e:	4659      	mov	r1, fp
c0de2890:	f7fe fe2f 	bl	c0de14f2 <polyw_unpack>
c0de2894:	4638      	mov	r0, r7
c0de2896:	f7ff f937 	bl	c0de1b08 <pqcrystals_dilithium2_lowram_poly_reduce>
c0de289a:	4638      	mov	r0, r7
c0de289c:	f7ff f963 	bl	c0de1b66 <pqcrystals_dilithium2_lowram_poly_invntt_tomont>
c0de28a0:	4658      	mov	r0, fp
c0de28a2:	4639      	mov	r1, r7
c0de28a4:	f7fe fe07 	bl	c0de14b6 <polyw_pack>
c0de28a8:	f8dd a008 	ldr.w	sl, [sp, #8]
c0de28ac:	9901      	ldr	r1, [sp, #4]
c0de28ae:	eb0a 008a 	add.w	r0, sl, sl, lsl #2
c0de28b2:	eb01 1280 	add.w	r2, r1, r0, lsl #6
c0de28b6:	4638      	mov	r0, r7
c0de28b8:	f50d 6182 	add.w	r1, sp, #1040	@ 0x410
c0de28bc:	f7fe fd54 	bl	c0de1368 <poly_schoolbook_t1>
c0de28c0:	4638      	mov	r0, r7
c0de28c2:	4659      	mov	r1, fp
c0de28c4:	463a      	mov	r2, r7
c0de28c6:	f7fe fe2c 	bl	c0de1522 <polyw_sub>
c0de28ca:	4638      	mov	r0, r7
c0de28cc:	f7ff f91c 	bl	c0de1b08 <pqcrystals_dilithium2_lowram_poly_reduce>
c0de28d0:	4638      	mov	r0, r7
c0de28d2:	f7ff f928 	bl	c0de1b26 <pqcrystals_dilithium2_lowram_poly_caddq>
c0de28d6:	ad04      	add	r5, sp, #16
c0de28d8:	f60d 3154 	addw	r1, sp, #2900	@ 0xb54
c0de28dc:	4652      	mov	r2, sl
c0de28de:	4623      	mov	r3, r4
c0de28e0:	4628      	mov	r0, r5
c0de28e2:	f7fe ffbb 	bl	c0de185c <unpack_sig_h_indices>
c0de28e6:	b9b8      	cbnz	r0, c0de2918 <pqcrystals_dilithium2_lowram_verify+0x1ec>
c0de28e8:	f8dd 3b54 	ldr.w	r3, [sp, #2900]	@ 0xb54
c0de28ec:	4638      	mov	r0, r7
c0de28ee:	4639      	mov	r1, r7
c0de28f0:	462a      	mov	r2, r5
c0de28f2:	f7fe fff1 	bl	c0de18d8 <poly_use_hint_lowram>
c0de28f6:	4658      	mov	r0, fp
c0de28f8:	4639      	mov	r1, r7
c0de28fa:	f7ff fbcb 	bl	c0de2094 <pqcrystals_dilithium2_lowram_polyw1_pack>
c0de28fe:	a884      	add	r0, sp, #528	@ 0x210
c0de2900:	4659      	mov	r1, fp
c0de2902:	22c0      	movs	r2, #192	@ 0xc0
c0de2904:	f7fe fb35 	bl	c0de0f72 <inner_keccak256_inject>
c0de2908:	9803      	ldr	r0, [sp, #12]
c0de290a:	9d00      	ldr	r5, [sp, #0]
c0de290c:	f10a 0a01 	add.w	sl, sl, #1
c0de2910:	f500 7080 	add.w	r0, r0, #256	@ 0x100
c0de2914:	9003      	str	r0, [sp, #12]
c0de2916:	e776      	b.n	c0de2806 <pqcrystals_dilithium2_lowram_verify+0xda>
c0de2918:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de291c:	f60d 3d58 	addw	sp, sp, #2904	@ 0xb58
c0de2920:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de2924:	ae84      	add	r6, sp, #528	@ 0x210
c0de2926:	4630      	mov	r0, r6
c0de2928:	f7fe fb35 	bl	c0de0f96 <inner_keccak256_flip>
c0de292c:	ad04      	add	r5, sp, #16
c0de292e:	4630      	mov	r0, r6
c0de2930:	2220      	movs	r2, #32
c0de2932:	4629      	mov	r1, r5
c0de2934:	f7fe fb45 	bl	c0de0fc2 <inner_keccak256_extract>
c0de2938:	2100      	movs	r1, #0
c0de293a:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de293e:	2920      	cmp	r1, #32
c0de2940:	d005      	beq.n	c0de294e <pqcrystals_dilithium2_lowram_verify+0x222>
c0de2942:	5c6a      	ldrb	r2, [r5, r1]
c0de2944:	5c63      	ldrb	r3, [r4, r1]
c0de2946:	3101      	adds	r1, #1
c0de2948:	4293      	cmp	r3, r2
c0de294a:	d0f8      	beq.n	c0de293e <pqcrystals_dilithium2_lowram_verify+0x212>
c0de294c:	e7e6      	b.n	c0de291c <pqcrystals_dilithium2_lowram_verify+0x1f0>
c0de294e:	2000      	movs	r0, #0
c0de2950:	e7e4      	b.n	c0de291c <pqcrystals_dilithium2_lowram_verify+0x1f0>
c0de2952:	bf00      	nop
c0de2954:	0001ffb2 	.word	0x0001ffb2
c0de2958:	ffffe7f1 	.word	0xffffe7f1
c0de295c:	ffffe805 	.word	0xffffe805

c0de2960 <pqcrystals_dilithium2_lowram_open>:
c0de2960:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de2962:	4604      	mov	r4, r0
c0de2964:	f640 1074 	movw	r0, #2420	@ 0x974
c0de2968:	461d      	mov	r5, r3
c0de296a:	460e      	mov	r6, r1
c0de296c:	4283      	cmp	r3, r0
c0de296e:	d311      	bcc.n	c0de2994 <pqcrystals_dilithium2_lowram_open+0x34>
c0de2970:	e9dd 7108 	ldrd	r7, r1, [sp, #32]
c0de2974:	f6a5 1374 	subw	r3, r5, #2420	@ 0x974
c0de2978:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de297a:	6033      	str	r3, [r6, #0]
c0de297c:	e9cd 7100 	strd	r7, r1, [sp]
c0de2980:	f602 1774 	addw	r7, r2, #2420	@ 0x974
c0de2984:	9002      	str	r0, [sp, #8]
c0de2986:	4610      	mov	r0, r2
c0de2988:	f640 1174 	movw	r1, #2420	@ 0x974
c0de298c:	463a      	mov	r2, r7
c0de298e:	f7ff fecd 	bl	c0de272c <pqcrystals_dilithium2_lowram_verify>
c0de2992:	b148      	cbz	r0, c0de29a8 <pqcrystals_dilithium2_lowram_open+0x48>
c0de2994:	2000      	movs	r0, #0
c0de2996:	6030      	str	r0, [r6, #0]
c0de2998:	b11d      	cbz	r5, c0de29a2 <pqcrystals_dilithium2_lowram_open+0x42>
c0de299a:	f804 0b01 	strb.w	r0, [r4], #1
c0de299e:	3d01      	subs	r5, #1
c0de29a0:	e7fa      	b.n	c0de2998 <pqcrystals_dilithium2_lowram_open+0x38>
c0de29a2:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de29a6:	bdfe      	pop	{r1, r2, r3, r4, r5, r6, r7, pc}
c0de29a8:	2000      	movs	r0, #0
c0de29aa:	6831      	ldr	r1, [r6, #0]
c0de29ac:	4288      	cmp	r0, r1
c0de29ae:	bf24      	itt	cs
c0de29b0:	2000      	movcs	r0, #0
c0de29b2:	bdfe      	popcs	{r1, r2, r3, r4, r5, r6, r7, pc}
c0de29b4:	5c39      	ldrb	r1, [r7, r0]
c0de29b6:	5421      	strb	r1, [r4, r0]
c0de29b8:	3001      	adds	r0, #1
c0de29ba:	e7f6      	b.n	c0de29aa <pqcrystals_dilithium2_lowram_open+0x4a>

c0de29bc <OUTLINED_FUNCTION_0>:
c0de29bc:	4620      	mov	r0, r4
c0de29be:	f7fe baea 	b.w	c0de0f96 <inner_keccak256_flip>
	...

c0de29c4 <small_ntt>:
c0de29c4:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de29c8:	491c      	ldr	r1, [pc, #112]	@ (c0de2a3c <small_ntt+0x78>)
c0de29ca:	f04f 0c80 	mov.w	ip, #128	@ 0x80
c0de29ce:	f04f 0e01 	mov.w	lr, #1
c0de29d2:	f46f 6850 	mvn.w	r8, #3328	@ 0xd00
c0de29d6:	4479      	add	r1, pc
c0de29d8:	468a      	mov	sl, r1
c0de29da:	4917      	ldr	r1, [pc, #92]	@ (c0de2a38 <small_ntt+0x74>)
c0de29dc:	468b      	mov	fp, r1
c0de29de:	f1bc 0f02 	cmp.w	ip, #2
c0de29e2:	bf38      	it	cc
c0de29e4:	e8bd 8df0 	ldmiacc.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de29e8:	2600      	movs	r6, #0
c0de29ea:	2eff      	cmp	r6, #255	@ 0xff
c0de29ec:	d821      	bhi.n	c0de2a32 <small_ntt+0x6e>
c0de29ee:	4651      	mov	r1, sl
c0de29f0:	f93a 301e 	ldrsh.w	r3, [sl, lr, lsl #1]
c0de29f4:	eb06 010c 	add.w	r1, r6, ip
c0de29f8:	460f      	mov	r7, r1
c0de29fa:	428e      	cmp	r6, r1
c0de29fc:	d215      	bcs.n	c0de2a2a <small_ntt+0x66>
c0de29fe:	f930 2017 	ldrsh.w	r2, [r0, r7, lsl #1]
c0de2a02:	465c      	mov	r4, fp
c0de2a04:	435a      	muls	r2, r3
c0de2a06:	fb02 f40b 	mul.w	r4, r2, fp
c0de2a0a:	1424      	asrs	r4, r4, #16
c0de2a0c:	fb04 2208 	mla	r2, r4, r8, r2
c0de2a10:	f830 4016 	ldrh.w	r4, [r0, r6, lsl #1]
c0de2a14:	eba4 4512 	sub.w	r5, r4, r2, lsr #16
c0de2a18:	eb04 4212 	add.w	r2, r4, r2, lsr #16
c0de2a1c:	f820 5017 	strh.w	r5, [r0, r7, lsl #1]
c0de2a20:	f820 2016 	strh.w	r2, [r0, r6, lsl #1]
c0de2a24:	3701      	adds	r7, #1
c0de2a26:	3601      	adds	r6, #1
c0de2a28:	e7e7      	b.n	c0de29fa <small_ntt+0x36>
c0de2a2a:	f10e 0e01 	add.w	lr, lr, #1
c0de2a2e:	463e      	mov	r6, r7
c0de2a30:	e7db      	b.n	c0de29ea <small_ntt+0x26>
c0de2a32:	ea4f 0c5c 	mov.w	ip, ip, lsr #1
c0de2a36:	e7d2      	b.n	c0de29de <small_ntt+0x1a>
c0de2a38:	f3010000 	.word	0xf3010000
c0de2a3c:	0000b8c2 	.word	0x0000b8c2

c0de2a40 <small_invntt_tomont>:
c0de2a40:	e92d 4dfe 	stmdb	sp!, {r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de2a44:	4934      	ldr	r1, [pc, #208]	@ (c0de2b18 <small_invntt_tomont+0xd8>)
c0de2a46:	4b36      	ldr	r3, [pc, #216]	@ (c0de2b20 <small_invntt_tomont+0xe0>)
c0de2a48:	2202      	movs	r2, #2
c0de2a4a:	247f      	movs	r4, #127	@ 0x7f
c0de2a4c:	f644 68bf 	movw	r8, #20159	@ 0x4ebf
c0de2a50:	f46f 6a50 	mvn.w	sl, #3328	@ 0xd00
c0de2a54:	468e      	mov	lr, r1
c0de2a56:	4931      	ldr	r1, [pc, #196]	@ (c0de2b1c <small_invntt_tomont+0xdc>)
c0de2a58:	447b      	add	r3, pc
c0de2a5a:	9300      	str	r3, [sp, #0]
c0de2a5c:	f101 5bd3 	add.w	fp, r1, #442499072	@ 0x1a600000
c0de2a60:	2a80      	cmp	r2, #128	@ 0x80
c0de2a62:	d834      	bhi.n	c0de2ace <small_invntt_tomont+0x8e>
c0de2a64:	2300      	movs	r3, #0
c0de2a66:	9201      	str	r2, [sp, #4]
c0de2a68:	2bff      	cmp	r3, #255	@ 0xff
c0de2a6a:	d82e      	bhi.n	c0de2aca <small_invntt_tomont+0x8a>
c0de2a6c:	9900      	ldr	r1, [sp, #0]
c0de2a6e:	9402      	str	r4, [sp, #8]
c0de2a70:	f931 4014 	ldrsh.w	r4, [r1, r4, lsl #1]
c0de2a74:	1899      	adds	r1, r3, r2
c0de2a76:	460d      	mov	r5, r1
c0de2a78:	428b      	cmp	r3, r1
c0de2a7a:	d221      	bcs.n	c0de2ac0 <small_invntt_tomont+0x80>
c0de2a7c:	f830 6013 	ldrh.w	r6, [r0, r3, lsl #1]
c0de2a80:	f830 2015 	ldrh.w	r2, [r0, r5, lsl #1]
c0de2a84:	46f4      	mov	ip, lr
c0de2a86:	4432      	add	r2, r6
c0de2a88:	b217      	sxth	r7, r2
c0de2a8a:	fb07 f708 	mul.w	r7, r7, r8
c0de2a8e:	f107 7700 	add.w	r7, r7, #33554432	@ 0x2000000
c0de2a92:	16bf      	asrs	r7, r7, #26
c0de2a94:	fb07 f70e 	mul.w	r7, r7, lr
c0de2a98:	eba2 4217 	sub.w	r2, r2, r7, lsr #16
c0de2a9c:	f820 2013 	strh.w	r2, [r0, r3, lsl #1]
c0de2aa0:	3301      	adds	r3, #1
c0de2aa2:	f830 2015 	ldrh.w	r2, [r0, r5, lsl #1]
c0de2aa6:	1b92      	subs	r2, r2, r6
c0de2aa8:	b212      	sxth	r2, r2
c0de2aaa:	4362      	muls	r2, r4
c0de2aac:	fb02 f60b 	mul.w	r6, r2, fp
c0de2ab0:	1436      	asrs	r6, r6, #16
c0de2ab2:	fb06 220a 	mla	r2, r6, sl, r2
c0de2ab6:	0c12      	lsrs	r2, r2, #16
c0de2ab8:	f820 2015 	strh.w	r2, [r0, r5, lsl #1]
c0de2abc:	3501      	adds	r5, #1
c0de2abe:	e7db      	b.n	c0de2a78 <small_invntt_tomont+0x38>
c0de2ac0:	9c02      	ldr	r4, [sp, #8]
c0de2ac2:	9a01      	ldr	r2, [sp, #4]
c0de2ac4:	462b      	mov	r3, r5
c0de2ac6:	3c01      	subs	r4, #1
c0de2ac8:	e7ce      	b.n	c0de2a68 <small_invntt_tomont+0x28>
c0de2aca:	0052      	lsls	r2, r2, #1
c0de2acc:	e7c8      	b.n	c0de2a60 <small_invntt_tomont+0x20>
c0de2ace:	2100      	movs	r1, #0
c0de2ad0:	f240 52a1 	movw	r2, #1441	@ 0x5a1
c0de2ad4:	f46f 6350 	mvn.w	r3, #3328	@ 0xd00
c0de2ad8:	f644 64bf 	movw	r4, #20159	@ 0x4ebf
c0de2adc:	f5b1 7f80 	cmp.w	r1, #256	@ 0x100
c0de2ae0:	bf08      	it	eq
c0de2ae2:	e8bd 8dfe 	ldmiaeq.w	sp!, {r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de2ae6:	f930 5011 	ldrsh.w	r5, [r0, r1, lsl #1]
c0de2aea:	4f0c      	ldr	r7, [pc, #48]	@ (c0de2b1c <small_invntt_tomont+0xdc>)
c0de2aec:	fb05 f602 	mul.w	r6, r5, r2
c0de2af0:	437d      	muls	r5, r7
c0de2af2:	4677      	mov	r7, lr
c0de2af4:	142d      	asrs	r5, r5, #16
c0de2af6:	fb05 6503 	mla	r5, r5, r3, r6
c0de2afa:	142e      	asrs	r6, r5, #16
c0de2afc:	0c2d      	lsrs	r5, r5, #16
c0de2afe:	4366      	muls	r6, r4
c0de2b00:	f106 7600 	add.w	r6, r6, #33554432	@ 0x2000000
c0de2b04:	16b6      	asrs	r6, r6, #26
c0de2b06:	fb06 f60e 	mul.w	r6, r6, lr
c0de2b0a:	eba5 4516 	sub.w	r5, r5, r6, lsr #16
c0de2b0e:	f820 5011 	strh.w	r5, [r0, r1, lsl #1]
c0de2b12:	3101      	adds	r1, #1
c0de2b14:	e7e2      	b.n	c0de2adc <small_invntt_tomont+0x9c>
c0de2b16:	bf00      	nop
c0de2b18:	0d010000 	.word	0x0d010000
c0de2b1c:	d8a10000 	.word	0xd8a10000
c0de2b20:	0000b840 	.word	0x0000b840

c0de2b24 <small_basemul>:
c0de2b24:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de2b26:	f9b1 c000 	ldrsh.w	ip, [r1]
c0de2b2a:	f9b1 5002 	ldrsh.w	r5, [r1, #2]
c0de2b2e:	f9b2 1002 	ldrsh.w	r1, [r2, #2]
c0de2b32:	f46f 6e50 	mvn.w	lr, #3328	@ 0xd00
c0de2b36:	f9b2 6000 	ldrsh.w	r6, [r2]
c0de2b3a:	fb01 f705 	mul.w	r7, r1, r5
c0de2b3e:	4916      	ldr	r1, [pc, #88]	@ (c0de2b98 <small_basemul+0x74>)
c0de2b40:	fb07 f401 	mul.w	r4, r7, r1
c0de2b44:	1424      	asrs	r4, r4, #16
c0de2b46:	fb04 740e 	mla	r4, r4, lr, r7
c0de2b4a:	1424      	asrs	r4, r4, #16
c0de2b4c:	4363      	muls	r3, r4
c0de2b4e:	fb03 f401 	mul.w	r4, r3, r1
c0de2b52:	1424      	asrs	r4, r4, #16
c0de2b54:	fb04 330e 	mla	r3, r4, lr, r3
c0de2b58:	fb06 f40c 	mul.w	r4, r6, ip
c0de2b5c:	fb04 f701 	mul.w	r7, r4, r1
c0de2b60:	143f      	asrs	r7, r7, #16
c0de2b62:	0c1b      	lsrs	r3, r3, #16
c0de2b64:	fb07 440e 	mla	r4, r7, lr, r4
c0de2b68:	eb03 4314 	add.w	r3, r3, r4, lsr #16
c0de2b6c:	8003      	strh	r3, [r0, #0]
c0de2b6e:	fb06 f305 	mul.w	r3, r6, r5
c0de2b72:	f9b2 2002 	ldrsh.w	r2, [r2, #2]
c0de2b76:	fb03 f401 	mul.w	r4, r3, r1
c0de2b7a:	1424      	asrs	r4, r4, #16
c0de2b7c:	fb02 f20c 	mul.w	r2, r2, ip
c0de2b80:	fb04 330e 	mla	r3, r4, lr, r3
c0de2b84:	4351      	muls	r1, r2
c0de2b86:	1409      	asrs	r1, r1, #16
c0de2b88:	fb01 210e 	mla	r1, r1, lr, r2
c0de2b8c:	0c09      	lsrs	r1, r1, #16
c0de2b8e:	eb01 4113 	add.w	r1, r1, r3, lsr #16
c0de2b92:	8041      	strh	r1, [r0, #2]
c0de2b94:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de2b96:	bf00      	nop
c0de2b98:	f3010000 	.word	0xf3010000

c0de2b9c <poly_small_ntt_copy>:
c0de2b9c:	22ff      	movs	r2, #255	@ 0xff
c0de2b9e:	f1b2 3fff 	cmp.w	r2, #4294967295	@ 0xffffffff
c0de2ba2:	bfd8      	it	le
c0de2ba4:	f7ff bf0e 	ble.w	c0de29c4 <small_ntt>
c0de2ba8:	f851 3022 	ldr.w	r3, [r1, r2, lsl #2]
c0de2bac:	f820 3012 	strh.w	r3, [r0, r2, lsl #1]
c0de2bb0:	3a01      	subs	r2, #1
c0de2bb2:	e7f4      	b.n	c0de2b9e <poly_small_ntt_copy+0x2>

c0de2bb4 <poly_small_basemul>:
c0de2bb4:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de2bb8:	e9cd 1200 	strd	r1, r2, [sp]
c0de2bbc:	4683      	mov	fp, r0
c0de2bbe:	f04f 0a00 	mov.w	sl, #0
c0de2bc2:	4811      	ldr	r0, [pc, #68]	@ (c0de2c08 <poly_small_basemul+0x54>)
c0de2bc4:	4478      	add	r0, pc
c0de2bc6:	f100 0880 	add.w	r8, r0, #128	@ 0x80
c0de2bca:	f5ba 7f00 	cmp.w	sl, #512	@ 0x200
c0de2bce:	bf08      	it	eq
c0de2bd0:	e8bd 8dfc 	ldmiaeq.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de2bd4:	9800      	ldr	r0, [sp, #0]
c0de2bd6:	f938 6b02 	ldrsh.w	r6, [r8], #2
c0de2bda:	eb0b 070a 	add.w	r7, fp, sl
c0de2bde:	eb00 040a 	add.w	r4, r0, sl
c0de2be2:	9801      	ldr	r0, [sp, #4]
c0de2be4:	4633      	mov	r3, r6
c0de2be6:	4621      	mov	r1, r4
c0de2be8:	eb00 050a 	add.w	r5, r0, sl
c0de2bec:	4638      	mov	r0, r7
c0de2bee:	462a      	mov	r2, r5
c0de2bf0:	f7ff ff98 	bl	c0de2b24 <small_basemul>
c0de2bf4:	4273      	negs	r3, r6
c0de2bf6:	1d38      	adds	r0, r7, #4
c0de2bf8:	1d21      	adds	r1, r4, #4
c0de2bfa:	1d2a      	adds	r2, r5, #4
c0de2bfc:	b21b      	sxth	r3, r3
c0de2bfe:	f7ff ff91 	bl	c0de2b24 <small_basemul>
c0de2c02:	f10a 0a08 	add.w	sl, sl, #8
c0de2c06:	e7e0      	b.n	c0de2bca <poly_small_basemul+0x16>
c0de2c08:	0000b6d4 	.word	0x0000b6d4

c0de2c0c <poly_small_basemul_invntt>:
c0de2c0c:	b510      	push	{r4, lr}
c0de2c0e:	4604      	mov	r4, r0
c0de2c10:	f7ff ffd0 	bl	c0de2bb4 <poly_small_basemul>
c0de2c14:	4620      	mov	r0, r4
c0de2c16:	f7ff ff13 	bl	c0de2a40 <small_invntt_tomont>
c0de2c1a:	20ff      	movs	r0, #255	@ 0xff
c0de2c1c:	2800      	cmp	r0, #0
c0de2c1e:	d405      	bmi.n	c0de2c2c <poly_small_basemul_invntt+0x20>
c0de2c20:	f934 1010 	ldrsh.w	r1, [r4, r0, lsl #1]
c0de2c24:	f844 1020 	str.w	r1, [r4, r0, lsl #2]
c0de2c28:	3801      	subs	r0, #1
c0de2c2a:	e7f7      	b.n	c0de2c1c <poly_small_basemul_invntt+0x10>
c0de2c2c:	bd10      	pop	{r4, pc}

c0de2c2e <small_polyeta_unpack>:
c0de2c2e:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de2c32:	3101      	adds	r1, #1
c0de2c34:	f04f 0c00 	mov.w	ip, #0
c0de2c38:	f5bc 7f00 	cmp.w	ip, #512	@ 0x200
c0de2c3c:	bf08      	it	eq
c0de2c3e:	e8bd 8df0 	ldmiaeq.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de2c42:	f811 4c01 	ldrb.w	r4, [r1, #-1]
c0de2c46:	f004 0807 	and.w	r8, r4, #7
c0de2c4a:	eb00 040c 	add.w	r4, r0, ip
c0de2c4e:	f820 800c 	strh.w	r8, [r0, ip]
c0de2c52:	f1c8 0202 	rsb	r2, r8, #2
c0de2c56:	f811 5c01 	ldrb.w	r5, [r1, #-1]
c0de2c5a:	f3c5 0ec2 	ubfx	lr, r5, #3, #3
c0de2c5e:	f8a4 e002 	strh.w	lr, [r4, #2]
c0de2c62:	f811 6c01 	ldrb.w	r6, [r1, #-1]
c0de2c66:	780b      	ldrb	r3, [r1, #0]
c0de2c68:	09b6      	lsrs	r6, r6, #6
c0de2c6a:	f363 0682 	bfi	r6, r3, #2, #1
c0de2c6e:	80a6      	strh	r6, [r4, #4]
c0de2c70:	780b      	ldrb	r3, [r1, #0]
c0de2c72:	f3c3 0a42 	ubfx	sl, r3, #1, #3
c0de2c76:	f8a4 a006 	strh.w	sl, [r4, #6]
c0de2c7a:	780d      	ldrb	r5, [r1, #0]
c0de2c7c:	f3c5 1502 	ubfx	r5, r5, #4, #3
c0de2c80:	8125      	strh	r5, [r4, #8]
c0de2c82:	780f      	ldrb	r7, [r1, #0]
c0de2c84:	784b      	ldrb	r3, [r1, #1]
c0de2c86:	09ff      	lsrs	r7, r7, #7
c0de2c88:	f363 0742 	bfi	r7, r3, #1, #2
c0de2c8c:	8167      	strh	r7, [r4, #10]
c0de2c8e:	784b      	ldrb	r3, [r1, #1]
c0de2c90:	f3c3 0382 	ubfx	r3, r3, #2, #3
c0de2c94:	81a3      	strh	r3, [r4, #12]
c0de2c96:	f891 b001 	ldrb.w	fp, [r1, #1]
c0de2c9a:	f820 200c 	strh.w	r2, [r0, ip]
c0de2c9e:	f1c3 0202 	rsb	r2, r3, #2
c0de2ca2:	3103      	adds	r1, #3
c0de2ca4:	f10c 0c10 	add.w	ip, ip, #16
c0de2ca8:	81a2      	strh	r2, [r4, #12]
c0de2caa:	f1c7 0202 	rsb	r2, r7, #2
c0de2cae:	8162      	strh	r2, [r4, #10]
c0de2cb0:	f1c5 0202 	rsb	r2, r5, #2
c0de2cb4:	8122      	strh	r2, [r4, #8]
c0de2cb6:	f1ca 0202 	rsb	r2, sl, #2
c0de2cba:	80e2      	strh	r2, [r4, #6]
c0de2cbc:	f1c6 0202 	rsb	r2, r6, #2
c0de2cc0:	80a2      	strh	r2, [r4, #4]
c0de2cc2:	f1ce 0202 	rsb	r2, lr, #2
c0de2cc6:	8062      	strh	r2, [r4, #2]
c0de2cc8:	2202      	movs	r2, #2
c0de2cca:	eba2 125b 	sub.w	r2, r2, fp, lsr #5
c0de2cce:	81e2      	strh	r2, [r4, #14]
c0de2cd0:	e7b2      	b.n	c0de2c38 <small_polyeta_unpack+0xa>

c0de2cd2 <os_io_handle_default_apdu>:
c0de2cd2:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de2cd4:	b09d      	sub	sp, #116	@ 0x74
c0de2cd6:	4615      	mov	r5, r2
c0de2cd8:	9a22      	ldr	r2, [sp, #136]	@ 0x88
c0de2cda:	b3c8      	cbz	r0, c0de2d50 <os_io_handle_default_apdu+0x7e>
c0de2cdc:	b3c1      	cbz	r1, c0de2d50 <os_io_handle_default_apdu+0x7e>
c0de2cde:	b3bd      	cbz	r5, c0de2d50 <os_io_handle_default_apdu+0x7e>
c0de2ce0:	461c      	mov	r4, r3
c0de2ce2:	b3ab      	cbz	r3, c0de2d50 <os_io_handle_default_apdu+0x7e>
c0de2ce4:	b10a      	cbz	r2, c0de2cea <os_io_handle_default_apdu+0x18>
c0de2ce6:	2100      	movs	r1, #0
c0de2ce8:	7011      	strb	r1, [r2, #0]
c0de2cea:	7801      	ldrb	r1, [r0, #0]
c0de2cec:	29b0      	cmp	r1, #176	@ 0xb0
c0de2cee:	d131      	bne.n	c0de2d54 <os_io_handle_default_apdu+0x82>
c0de2cf0:	7841      	ldrb	r1, [r0, #1]
c0de2cf2:	29a7      	cmp	r1, #167	@ 0xa7
c0de2cf4:	d031      	beq.n	c0de2d5a <os_io_handle_default_apdu+0x88>
c0de2cf6:	2906      	cmp	r1, #6
c0de2cf8:	d036      	beq.n	c0de2d68 <os_io_handle_default_apdu+0x96>
c0de2cfa:	2901      	cmp	r1, #1
c0de2cfc:	d131      	bne.n	c0de2d62 <os_io_handle_default_apdu+0x90>
c0de2cfe:	7881      	ldrb	r1, [r0, #2]
c0de2d00:	bb79      	cbnz	r1, c0de2d62 <os_io_handle_default_apdu+0x90>
c0de2d02:	78c0      	ldrb	r0, [r0, #3]
c0de2d04:	bb68      	cbnz	r0, c0de2d62 <os_io_handle_default_apdu+0x90>
c0de2d06:	6820      	ldr	r0, [r4, #0]
c0de2d08:	2100      	movs	r1, #0
c0de2d0a:	6021      	str	r1, [r4, #0]
c0de2d0c:	2803      	cmp	r0, #3
c0de2d0e:	d321      	bcc.n	c0de2d54 <os_io_handle_default_apdu+0x82>
c0de2d10:	2601      	movs	r6, #1
c0de2d12:	1ec7      	subs	r7, r0, #3
c0de2d14:	6026      	str	r6, [r4, #0]
c0de2d16:	702e      	strb	r6, [r5, #0]
c0de2d18:	6820      	ldr	r0, [r4, #0]
c0de2d1a:	1a3a      	subs	r2, r7, r0
c0de2d1c:	4428      	add	r0, r5
c0de2d1e:	1c41      	adds	r1, r0, #1
c0de2d20:	2001      	movs	r0, #1
c0de2d22:	f007 ffa9 	bl	c0deac78 <os_registry_get_current_app_tag>
c0de2d26:	f000 f83f 	bl	c0de2da8 <OUTLINED_FUNCTION_0>
c0de2d2a:	6020      	str	r0, [r4, #0]
c0de2d2c:	1a3a      	subs	r2, r7, r0
c0de2d2e:	4428      	add	r0, r5
c0de2d30:	1c41      	adds	r1, r0, #1
c0de2d32:	2002      	movs	r0, #2
c0de2d34:	f007 ffa0 	bl	c0deac78 <os_registry_get_current_app_tag>
c0de2d38:	f000 f836 	bl	c0de2da8 <OUTLINED_FUNCTION_0>
c0de2d3c:	1c41      	adds	r1, r0, #1
c0de2d3e:	6021      	str	r1, [r4, #0]
c0de2d40:	542e      	strb	r6, [r5, r0]
c0de2d42:	f007 ff85 	bl	c0deac50 <os_flags>
c0de2d46:	6821      	ldr	r1, [r4, #0]
c0de2d48:	1c4a      	adds	r2, r1, #1
c0de2d4a:	6022      	str	r2, [r4, #0]
c0de2d4c:	5468      	strb	r0, [r5, r1]
c0de2d4e:	e028      	b.n	c0de2da2 <os_io_handle_default_apdu+0xd0>
c0de2d50:	7814      	ldrb	r4, [r2, #0]
c0de2d52:	e01e      	b.n	c0de2d92 <os_io_handle_default_apdu+0xc0>
c0de2d54:	f646 1485 	movw	r4, #27013	@ 0x6985
c0de2d58:	e01b      	b.n	c0de2d92 <os_io_handle_default_apdu+0xc0>
c0de2d5a:	7881      	ldrb	r1, [r0, #2]
c0de2d5c:	b909      	cbnz	r1, c0de2d62 <os_io_handle_default_apdu+0x90>
c0de2d5e:	78c0      	ldrb	r0, [r0, #3]
c0de2d60:	b1d0      	cbz	r0, c0de2d98 <os_io_handle_default_apdu+0xc6>
c0de2d62:	f44f 44dc 	mov.w	r4, #28160	@ 0x6e00
c0de2d66:	e014      	b.n	c0de2d92 <os_io_handle_default_apdu+0xc0>
c0de2d68:	2100      	movs	r1, #0
c0de2d6a:	6021      	str	r1, [r4, #0]
c0de2d6c:	7883      	ldrb	r3, [r0, #2]
c0de2d6e:	7902      	ldrb	r2, [r0, #4]
c0de2d70:	ad02      	add	r5, sp, #8
c0de2d72:	e9cd 1500 	strd	r1, r5, [sp]
c0de2d76:	1d41      	adds	r1, r0, #5
c0de2d78:	4618      	mov	r0, r3
c0de2d7a:	2300      	movs	r3, #0
c0de2d7c:	f007 ff3c 	bl	c0deabf8 <os_pki_load_certificate>
c0de2d80:	4604      	mov	r4, r0
c0de2d82:	4628      	mov	r0, r5
c0de2d84:	216c      	movs	r1, #108	@ 0x6c
c0de2d86:	f008 f905 	bl	c0deaf94 <explicit_bzero>
c0de2d8a:	2c00      	cmp	r4, #0
c0de2d8c:	bf08      	it	eq
c0de2d8e:	f44f 4410 	moveq.w	r4, #36864	@ 0x9000
c0de2d92:	4620      	mov	r0, r4
c0de2d94:	b01d      	add	sp, #116	@ 0x74
c0de2d96:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de2d98:	2000      	movs	r0, #0
c0de2d9a:	6020      	str	r0, [r4, #0]
c0de2d9c:	b10a      	cbz	r2, c0de2da2 <os_io_handle_default_apdu+0xd0>
c0de2d9e:	2001      	movs	r0, #1
c0de2da0:	7010      	strb	r0, [r2, #0]
c0de2da2:	f44f 4410 	mov.w	r4, #36864	@ 0x9000
c0de2da6:	e7f4      	b.n	c0de2d92 <os_io_handle_default_apdu+0xc0>

c0de2da8 <OUTLINED_FUNCTION_0>:
c0de2da8:	6821      	ldr	r1, [r4, #0]
c0de2daa:	1c4a      	adds	r2, r1, #1
c0de2dac:	6022      	str	r2, [r4, #0]
c0de2dae:	5468      	strb	r0, [r5, r1]
c0de2db0:	6821      	ldr	r1, [r4, #0]
c0de2db2:	4408      	add	r0, r1
c0de2db4:	4770      	bx	lr

c0de2db6 <os_io_seph_cmd_piezo_play_tune>:
c0de2db6:	b5bc      	push	{r2, r3, r4, r5, r7, lr}
c0de2db8:	280b      	cmp	r0, #11
c0de2dba:	d902      	bls.n	c0de2dc2 <os_io_seph_cmd_piezo_play_tune+0xc>
c0de2dbc:	f06f 0415 	mvn.w	r4, #21
c0de2dc0:	e021      	b.n	c0de2e06 <os_io_seph_cmd_piezo_play_tune+0x50>
c0de2dc2:	4605      	mov	r5, r0
c0de2dc4:	2009      	movs	r0, #9
c0de2dc6:	2100      	movs	r1, #0
c0de2dc8:	2200      	movs	r2, #0
c0de2dca:	2400      	movs	r4, #0
c0de2dcc:	f007 ff48 	bl	c0deac60 <os_setting_get>
c0de2dd0:	2d08      	cmp	r5, #8
c0de2dd2:	d802      	bhi.n	c0de2dda <os_io_seph_cmd_piezo_play_tune+0x24>
c0de2dd4:	f010 0102 	ands.w	r1, r0, #2
c0de2dd8:	d115      	bne.n	c0de2e06 <os_io_seph_cmd_piezo_play_tune+0x50>
c0de2dda:	2400      	movs	r4, #0
c0de2ddc:	2d09      	cmp	r5, #9
c0de2dde:	d302      	bcc.n	c0de2de6 <os_io_seph_cmd_piezo_play_tune+0x30>
c0de2de0:	f010 0001 	ands.w	r0, r0, #1
c0de2de4:	d10f      	bne.n	c0de2e06 <os_io_seph_cmd_piezo_play_tune+0x50>
c0de2de6:	2056      	movs	r0, #86	@ 0x56
c0de2de8:	f88d 5007 	strb.w	r5, [sp, #7]
c0de2dec:	f88d 4005 	strb.w	r4, [sp, #5]
c0de2df0:	2204      	movs	r2, #4
c0de2df2:	2300      	movs	r3, #0
c0de2df4:	f88d 0004 	strb.w	r0, [sp, #4]
c0de2df8:	2001      	movs	r0, #1
c0de2dfa:	f88d 0006 	strb.w	r0, [sp, #6]
c0de2dfe:	a901      	add	r1, sp, #4
c0de2e00:	f000 f803 	bl	c0de2e0a <OUTLINED_FUNCTION_1>
c0de2e04:	4604      	mov	r4, r0
c0de2e06:	4620      	mov	r0, r4
c0de2e08:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}

c0de2e0a <OUTLINED_FUNCTION_1>:
c0de2e0a:	2001      	movs	r0, #1
c0de2e0c:	f007 bf5e 	b.w	c0deaccc <os_io_tx_cmd>

c0de2e10 <io_process_itc_ux_event>:
c0de2e10:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de2e12:	4605      	mov	r5, r0
c0de2e14:	78c0      	ldrb	r0, [r0, #3]
c0de2e16:	2820      	cmp	r0, #32
c0de2e18:	d023      	beq.n	c0de2e62 <io_process_itc_ux_event+0x52>
c0de2e1a:	2823      	cmp	r0, #35	@ 0x23
c0de2e1c:	d029      	beq.n	c0de2e72 <io_process_itc_ux_event+0x62>
c0de2e1e:	460c      	mov	r4, r1
c0de2e20:	2822      	cmp	r0, #34	@ 0x22
c0de2e22:	d132      	bne.n	c0de2e8a <io_process_itc_ux_event+0x7a>
c0de2e24:	4e1f      	ldr	r6, [pc, #124]	@ (c0de2ea4 <io_process_itc_ux_event+0x94>)
c0de2e26:	2006      	movs	r0, #6
c0de2e28:	2118      	movs	r1, #24
c0de2e2a:	f809 0006 	strb.w	r0, [r9, r6]
c0de2e2e:	eb09 0706 	add.w	r7, r9, r6
c0de2e32:	2018      	movs	r0, #24
c0de2e34:	6078      	str	r0, [r7, #4]
c0de2e36:	f107 0008 	add.w	r0, r7, #8
c0de2e3a:	f008 f89d 	bl	c0deaf78 <__aeabi_memclr>
c0de2e3e:	7928      	ldrb	r0, [r5, #4]
c0de2e40:	7238      	strb	r0, [r7, #8]
c0de2e42:	7868      	ldrb	r0, [r5, #1]
c0de2e44:	78a9      	ldrb	r1, [r5, #2]
c0de2e46:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de2e4a:	3802      	subs	r0, #2
c0de2e4c:	0401      	lsls	r1, r0, #16
c0de2e4e:	d005      	beq.n	c0de2e5c <io_process_itc_ux_event+0x4c>
c0de2e50:	b282      	uxth	r2, r0
c0de2e52:	2a10      	cmp	r2, #16
c0de2e54:	d802      	bhi.n	c0de2e5c <io_process_itc_ux_event+0x4c>
c0de2e56:	1f60      	subs	r0, r4, #5
c0de2e58:	4290      	cmp	r0, r2
c0de2e5a:	d218      	bcs.n	c0de2e8e <io_process_itc_ux_event+0x7e>
c0de2e5c:	f06f 0415 	mvn.w	r4, #21
c0de2e60:	e013      	b.n	c0de2e8a <io_process_itc_ux_event+0x7a>
c0de2e62:	2001      	movs	r0, #1
c0de2e64:	f007 fc62 	bl	c0dea72c <nbgl_objAllowDrawing>
c0de2e68:	f007 fc6f 	bl	c0dea74a <nbgl_screenRedraw>
c0de2e6c:	f007 fc45 	bl	c0dea6fa <nbgl_refresh>
c0de2e70:	e00a      	b.n	c0de2e88 <io_process_itc_ux_event+0x78>
c0de2e72:	480c      	ldr	r0, [pc, #48]	@ (c0de2ea4 <io_process_itc_ux_event+0x94>)
c0de2e74:	2107      	movs	r1, #7
c0de2e76:	f809 1000 	strb.w	r1, [r9, r0]
c0de2e7a:	4448      	add	r0, r9
c0de2e7c:	2101      	movs	r1, #1
c0de2e7e:	6041      	str	r1, [r0, #4]
c0de2e80:	7929      	ldrb	r1, [r5, #4]
c0de2e82:	7201      	strb	r1, [r0, #8]
c0de2e84:	f007 feda 	bl	c0deac3c <os_ux>
c0de2e88:	2400      	movs	r4, #0
c0de2e8a:	4620      	mov	r0, r4
c0de2e8c:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0de2e8e:	eb09 0406 	add.w	r4, r9, r6
c0de2e92:	1d69      	adds	r1, r5, #5
c0de2e94:	f104 0010 	add.w	r0, r4, #16
c0de2e98:	60e2      	str	r2, [r4, #12]
c0de2e9a:	f008 f863 	bl	c0deaf64 <__aeabi_memcpy>
c0de2e9e:	4620      	mov	r0, r4
c0de2ea0:	e7f0      	b.n	c0de2e84 <io_process_itc_ux_event+0x74>
c0de2ea2:	bf00      	nop
c0de2ea4:	00001e24 	.word	0x00001e24

c0de2ea8 <io_legacy_apdu_tx>:
c0de2ea8:	b5b0      	push	{r4, r5, r7, lr}
c0de2eaa:	460a      	mov	r2, r1
c0de2eac:	4601      	mov	r1, r0
c0de2eae:	4808      	ldr	r0, [pc, #32]	@ (c0de2ed0 <io_legacy_apdu_tx+0x28>)
c0de2eb0:	2300      	movs	r3, #0
c0de2eb2:	2500      	movs	r5, #0
c0de2eb4:	eb09 0400 	add.w	r4, r9, r0
c0de2eb8:	7860      	ldrb	r0, [r4, #1]
c0de2eba:	f007 ff07 	bl	c0deaccc <os_io_tx_cmd>
c0de2ebe:	4905      	ldr	r1, [pc, #20]	@ (c0de2ed4 <io_legacy_apdu_tx+0x2c>)
c0de2ec0:	7065      	strb	r5, [r4, #1]
c0de2ec2:	f809 5001 	strb.w	r5, [r9, r1]
c0de2ec6:	4904      	ldr	r1, [pc, #16]	@ (c0de2ed8 <io_legacy_apdu_tx+0x30>)
c0de2ec8:	4449      	add	r1, r9
c0de2eca:	718d      	strb	r5, [r1, #6]
c0de2ecc:	bdb0      	pop	{r4, r5, r7, pc}
c0de2ece:	bf00      	nop
c0de2ed0:	00001748 	.word	0x00001748
c0de2ed4:	00001e44 	.word	0x00001e44
c0de2ed8:	0000173c 	.word	0x0000173c

c0de2edc <io_legacy_apdu_rx>:
c0de2edc:	e92d 41ff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, lr}
c0de2ee0:	4e8c      	ldr	r6, [pc, #560]	@ (c0de3114 <io_legacy_apdu_rx+0x238>)
c0de2ee2:	2100      	movs	r1, #0
c0de2ee4:	4605      	mov	r5, r0
c0de2ee6:	2200      	movs	r2, #0
c0de2ee8:	2301      	movs	r3, #1
c0de2eea:	f88d 100f 	strb.w	r1, [sp, #15]
c0de2eee:	f240 1111 	movw	r1, #273	@ 0x111
c0de2ef2:	eb09 0006 	add.w	r0, r9, r6
c0de2ef6:	f007 fef5 	bl	c0deace4 <os_io_rx_evt>
c0de2efa:	4604      	mov	r4, r0
c0de2efc:	2801      	cmp	r0, #1
c0de2efe:	f2c0 80f9 	blt.w	c0de30f4 <io_legacy_apdu_rx+0x218>
c0de2f02:	f819 0006 	ldrb.w	r0, [r9, r6]
c0de2f06:	f1a0 0110 	sub.w	r1, r0, #16
c0de2f0a:	2916      	cmp	r1, #22
c0de2f0c:	d805      	bhi.n	c0de2f1a <io_legacy_apdu_rx+0x3e>
c0de2f0e:	2201      	movs	r2, #1
c0de2f10:	fa02 f101 	lsl.w	r1, r2, r1
c0de2f14:	4a80      	ldr	r2, [pc, #512]	@ (c0de3118 <io_legacy_apdu_rx+0x23c>)
c0de2f16:	4211      	tst	r1, r2
c0de2f18:	d107      	bne.n	c0de2f2a <io_legacy_apdu_rx+0x4e>
c0de2f1a:	1e41      	subs	r1, r0, #1
c0de2f1c:	2902      	cmp	r1, #2
c0de2f1e:	d379      	bcc.n	c0de3014 <io_legacy_apdu_rx+0x138>
c0de2f20:	2830      	cmp	r0, #48	@ 0x30
c0de2f22:	bf18      	it	ne
c0de2f24:	2840      	cmpne	r0, #64	@ 0x40
c0de2f26:	f040 8089 	bne.w	c0de303c <io_legacy_apdu_rx+0x160>
c0de2f2a:	4f7c      	ldr	r7, [pc, #496]	@ (c0de311c <io_legacy_apdu_rx+0x240>)
c0de2f2c:	eb09 0107 	add.w	r1, r9, r7
c0de2f30:	7048      	strb	r0, [r1, #1]
c0de2f32:	f007 fe71 	bl	c0deac18 <os_perso_is_pin_set>
c0de2f36:	28aa      	cmp	r0, #170	@ 0xaa
c0de2f38:	d103      	bne.n	c0de2f42 <io_legacy_apdu_rx+0x66>
c0de2f3a:	f007 fe76 	bl	c0deac2a <os_global_pin_is_validated>
c0de2f3e:	28aa      	cmp	r0, #170	@ 0xaa
c0de2f40:	d156      	bne.n	c0de2ff0 <io_legacy_apdu_rx+0x114>
c0de2f42:	eb09 0006 	add.w	r0, r9, r6
c0de2f46:	7840      	ldrb	r0, [r0, #1]
c0de2f48:	28b0      	cmp	r0, #176	@ 0xb0
c0de2f4a:	d12d      	bne.n	c0de2fa8 <io_legacy_apdu_rx+0xcc>
c0de2f4c:	f240 1011 	movw	r0, #273	@ 0x111
c0de2f50:	1e61      	subs	r1, r4, #1
c0de2f52:	9002      	str	r0, [sp, #8]
c0de2f54:	f10d 000f 	add.w	r0, sp, #15
c0de2f58:	9000      	str	r0, [sp, #0]
c0de2f5a:	4871      	ldr	r0, [pc, #452]	@ (c0de3120 <io_legacy_apdu_rx+0x244>)
c0de2f5c:	ab02      	add	r3, sp, #8
c0de2f5e:	eb09 0500 	add.w	r5, r9, r0
c0de2f62:	eb09 0006 	add.w	r0, r9, r6
c0de2f66:	3001      	adds	r0, #1
c0de2f68:	462a      	mov	r2, r5
c0de2f6a:	f7ff feb2 	bl	c0de2cd2 <os_io_handle_default_apdu>
c0de2f6e:	2400      	movs	r4, #0
c0de2f70:	9902      	ldr	r1, [sp, #8]
c0de2f72:	eb09 0607 	add.w	r6, r9, r7
c0de2f76:	f5b0 4f10 	cmp.w	r0, #36864	@ 0x9000
c0de2f7a:	bf18      	it	ne
c0de2f7c:	4621      	movne	r1, r4
c0de2f7e:	0a02      	lsrs	r2, r0, #8
c0de2f80:	2300      	movs	r3, #0
c0de2f82:	546a      	strb	r2, [r5, r1]
c0de2f84:	186a      	adds	r2, r5, r1
c0de2f86:	7050      	strb	r0, [r2, #1]
c0de2f88:	1c88      	adds	r0, r1, #2
c0de2f8a:	4629      	mov	r1, r5
c0de2f8c:	9002      	str	r0, [sp, #8]
c0de2f8e:	b282      	uxth	r2, r0
c0de2f90:	7870      	ldrb	r0, [r6, #1]
c0de2f92:	f007 fe9b 	bl	c0deaccc <os_io_tx_cmd>
c0de2f96:	f89d 100f 	ldrb.w	r1, [sp, #15]
c0de2f9a:	7074      	strb	r4, [r6, #1]
c0de2f9c:	2901      	cmp	r1, #1
c0de2f9e:	f000 80b5 	beq.w	c0de310c <io_legacy_apdu_rx+0x230>
c0de2fa2:	ea00 74e0 	and.w	r4, r0, r0, asr #31
c0de2fa6:	e0a5      	b.n	c0de30f4 <io_legacy_apdu_rx+0x218>
c0de2fa8:	eb09 0007 	add.w	r0, r9, r7
c0de2fac:	7847      	ldrb	r7, [r0, #1]
c0de2fae:	2f10      	cmp	r7, #16
c0de2fb0:	d05f      	beq.n	c0de3072 <io_legacy_apdu_rx+0x196>
c0de2fb2:	2f40      	cmp	r7, #64	@ 0x40
c0de2fb4:	d05f      	beq.n	c0de3076 <io_legacy_apdu_rx+0x19a>
c0de2fb6:	2f21      	cmp	r7, #33	@ 0x21
c0de2fb8:	d06f      	beq.n	c0de309a <io_legacy_apdu_rx+0x1be>
c0de2fba:	2f22      	cmp	r7, #34	@ 0x22
c0de2fbc:	d048      	beq.n	c0de3050 <io_legacy_apdu_rx+0x174>
c0de2fbe:	2f23      	cmp	r7, #35	@ 0x23
c0de2fc0:	d048      	beq.n	c0de3054 <io_legacy_apdu_rx+0x178>
c0de2fc2:	2f30      	cmp	r7, #48	@ 0x30
c0de2fc4:	d053      	beq.n	c0de306e <io_legacy_apdu_rx+0x192>
c0de2fc6:	2f20      	cmp	r7, #32
c0de2fc8:	d171      	bne.n	c0de30ae <io_legacy_apdu_rx+0x1d2>
c0de2fca:	4d56      	ldr	r5, [pc, #344]	@ (c0de3124 <io_legacy_apdu_rx+0x248>)
c0de2fcc:	2701      	movs	r7, #1
c0de2fce:	eb09 0106 	add.w	r1, r9, r6
c0de2fd2:	3c01      	subs	r4, #1
c0de2fd4:	3101      	adds	r1, #1
c0de2fd6:	4622      	mov	r2, r4
c0de2fd8:	eb09 0005 	add.w	r0, r9, r5
c0de2fdc:	7187      	strb	r7, [r0, #6]
c0de2fde:	4850      	ldr	r0, [pc, #320]	@ (c0de3120 <io_legacy_apdu_rx+0x244>)
c0de2fe0:	4448      	add	r0, r9
c0de2fe2:	f007 ffbf 	bl	c0deaf64 <__aeabi_memcpy>
c0de2fe6:	4850      	ldr	r0, [pc, #320]	@ (c0de3128 <io_legacy_apdu_rx+0x24c>)
c0de2fe8:	f809 7000 	strb.w	r7, [r9, r0]
c0de2fec:	2008      	movs	r0, #8
c0de2fee:	e051      	b.n	c0de3094 <io_legacy_apdu_rx+0x1b8>
c0de2ff0:	484b      	ldr	r0, [pc, #300]	@ (c0de3120 <io_legacy_apdu_rx+0x244>)
c0de2ff2:	2155      	movs	r1, #85	@ 0x55
c0de2ff4:	2202      	movs	r2, #2
c0de2ff6:	2300      	movs	r3, #0
c0de2ff8:	f809 1000 	strb.w	r1, [r9, r0]
c0de2ffc:	eb09 0100 	add.w	r1, r9, r0
c0de3000:	2015      	movs	r0, #21
c0de3002:	7048      	strb	r0, [r1, #1]
c0de3004:	eb09 0007 	add.w	r0, r9, r7
c0de3008:	7840      	ldrb	r0, [r0, #1]
c0de300a:	b004      	add	sp, #16
c0de300c:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de3010:	f007 be5c 	b.w	c0deaccc <os_io_tx_cmd>
c0de3014:	4f45      	ldr	r7, [pc, #276]	@ (c0de312c <io_legacy_apdu_rx+0x250>)
c0de3016:	444e      	add	r6, r9
c0de3018:	3c01      	subs	r4, #1
c0de301a:	1c71      	adds	r1, r6, #1
c0de301c:	4622      	mov	r2, r4
c0de301e:	eb09 0007 	add.w	r0, r9, r7
c0de3022:	f007 ff9f 	bl	c0deaf64 <__aeabi_memcpy>
c0de3026:	7870      	ldrb	r0, [r6, #1]
c0de3028:	281a      	cmp	r0, #26
c0de302a:	d10a      	bne.n	c0de3042 <io_legacy_apdu_rx+0x166>
c0de302c:	eb09 0007 	add.w	r0, r9, r7
c0de3030:	4621      	mov	r1, r4
c0de3032:	b004      	add	sp, #16
c0de3034:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de3038:	f7ff beea 	b.w	c0de2e10 <io_process_itc_ux_event>
c0de303c:	2842      	cmp	r0, #66	@ 0x42
c0de303e:	d158      	bne.n	c0de30f2 <io_legacy_apdu_rx+0x216>
c0de3040:	e058      	b.n	c0de30f4 <io_legacy_apdu_rx+0x218>
c0de3042:	2d00      	cmp	r5, #0
c0de3044:	d04b      	beq.n	c0de30de <io_legacy_apdu_rx+0x202>
c0de3046:	2000      	movs	r0, #0
c0de3048:	2400      	movs	r4, #0
c0de304a:	f007 f929 	bl	c0dea2a0 <io_event>
c0de304e:	e051      	b.n	c0de30f4 <io_legacy_apdu_rx+0x218>
c0de3050:	2004      	movs	r0, #4
c0de3052:	e023      	b.n	c0de309c <io_legacy_apdu_rx+0x1c0>
c0de3054:	4d33      	ldr	r5, [pc, #204]	@ (c0de3124 <io_legacy_apdu_rx+0x248>)
c0de3056:	2107      	movs	r1, #7
c0de3058:	3c01      	subs	r4, #1
c0de305a:	4622      	mov	r2, r4
c0de305c:	eb09 0005 	add.w	r0, r9, r5
c0de3060:	7181      	strb	r1, [r0, #6]
c0de3062:	482f      	ldr	r0, [pc, #188]	@ (c0de3120 <io_legacy_apdu_rx+0x244>)
c0de3064:	f000 f886 	bl	c0de3174 <OUTLINED_FUNCTION_0>
c0de3068:	482f      	ldr	r0, [pc, #188]	@ (c0de3128 <io_legacy_apdu_rx+0x24c>)
c0de306a:	2101      	movs	r1, #1
c0de306c:	e00f      	b.n	c0de308e <io_legacy_apdu_rx+0x1b2>
c0de306e:	2002      	movs	r0, #2
c0de3070:	e014      	b.n	c0de309c <io_legacy_apdu_rx+0x1c0>
c0de3072:	2006      	movs	r0, #6
c0de3074:	e012      	b.n	c0de309c <io_legacy_apdu_rx+0x1c0>
c0de3076:	4d2b      	ldr	r5, [pc, #172]	@ (c0de3124 <io_legacy_apdu_rx+0x248>)
c0de3078:	2103      	movs	r1, #3
c0de307a:	3c01      	subs	r4, #1
c0de307c:	4622      	mov	r2, r4
c0de307e:	eb09 0005 	add.w	r0, r9, r5
c0de3082:	7181      	strb	r1, [r0, #6]
c0de3084:	4826      	ldr	r0, [pc, #152]	@ (c0de3120 <io_legacy_apdu_rx+0x244>)
c0de3086:	f000 f875 	bl	c0de3174 <OUTLINED_FUNCTION_0>
c0de308a:	4827      	ldr	r0, [pc, #156]	@ (c0de3128 <io_legacy_apdu_rx+0x24c>)
c0de308c:	2102      	movs	r1, #2
c0de308e:	f809 1000 	strb.w	r1, [r9, r0]
c0de3092:	200a      	movs	r0, #10
c0de3094:	f809 0005 	strb.w	r0, [r9, r5]
c0de3098:	e02c      	b.n	c0de30f4 <io_legacy_apdu_rx+0x218>
c0de309a:	2005      	movs	r0, #5
c0de309c:	4921      	ldr	r1, [pc, #132]	@ (c0de3124 <io_legacy_apdu_rx+0x248>)
c0de309e:	3c01      	subs	r4, #1
c0de30a0:	4622      	mov	r2, r4
c0de30a2:	4449      	add	r1, r9
c0de30a4:	7188      	strb	r0, [r1, #6]
c0de30a6:	481e      	ldr	r0, [pc, #120]	@ (c0de3120 <io_legacy_apdu_rx+0x244>)
c0de30a8:	f000 f864 	bl	c0de3174 <OUTLINED_FUNCTION_0>
c0de30ac:	e022      	b.n	c0de30f4 <io_legacy_apdu_rx+0x218>
c0de30ae:	f8df 8074 	ldr.w	r8, [pc, #116]	@ c0de3124 <io_legacy_apdu_rx+0x248>
c0de30b2:	2100      	movs	r1, #0
c0de30b4:	1e65      	subs	r5, r4, #1
c0de30b6:	462a      	mov	r2, r5
c0de30b8:	eb09 0008 	add.w	r0, r9, r8
c0de30bc:	7181      	strb	r1, [r0, #6]
c0de30be:	4818      	ldr	r0, [pc, #96]	@ (c0de3120 <io_legacy_apdu_rx+0x244>)
c0de30c0:	f000 f858 	bl	c0de3174 <OUTLINED_FUNCTION_0>
c0de30c4:	2f25      	cmp	r7, #37	@ 0x25
c0de30c6:	d019      	beq.n	c0de30fc <io_legacy_apdu_rx+0x220>
c0de30c8:	2f24      	cmp	r7, #36	@ 0x24
c0de30ca:	d106      	bne.n	c0de30da <io_legacy_apdu_rx+0x1fe>
c0de30cc:	200b      	movs	r0, #11
c0de30ce:	2101      	movs	r1, #1
c0de30d0:	f809 0008 	strb.w	r0, [r9, r8]
c0de30d4:	4814      	ldr	r0, [pc, #80]	@ (c0de3128 <io_legacy_apdu_rx+0x24c>)
c0de30d6:	f809 1000 	strb.w	r1, [r9, r0]
c0de30da:	462c      	mov	r4, r5
c0de30dc:	e00a      	b.n	c0de30f4 <io_legacy_apdu_rx+0x218>
c0de30de:	f819 0007 	ldrb.w	r0, [r9, r7]
c0de30e2:	2815      	cmp	r0, #21
c0de30e4:	d8af      	bhi.n	c0de3046 <io_legacy_apdu_rx+0x16a>
c0de30e6:	2101      	movs	r1, #1
c0de30e8:	fa01 f000 	lsl.w	r0, r1, r0
c0de30ec:	4910      	ldr	r1, [pc, #64]	@ (c0de3130 <io_legacy_apdu_rx+0x254>)
c0de30ee:	4208      	tst	r0, r1
c0de30f0:	d0a9      	beq.n	c0de3046 <io_legacy_apdu_rx+0x16a>
c0de30f2:	2400      	movs	r4, #0
c0de30f4:	4620      	mov	r0, r4
c0de30f6:	b004      	add	sp, #16
c0de30f8:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de30fc:	200c      	movs	r0, #12
c0de30fe:	2101      	movs	r1, #1
c0de3100:	f809 0008 	strb.w	r0, [r9, r8]
c0de3104:	4808      	ldr	r0, [pc, #32]	@ (c0de3128 <io_legacy_apdu_rx+0x24c>)
c0de3106:	f809 1000 	strb.w	r1, [r9, r0]
c0de310a:	e7f3      	b.n	c0de30f4 <io_legacy_apdu_rx+0x218>
c0de310c:	20ff      	movs	r0, #255	@ 0xff
c0de310e:	f007 fdbf 	bl	c0deac90 <os_sched_exit>
c0de3112:	bf00      	nop
c0de3114:	00001628 	.word	0x00001628
c0de3118:	007f0001 	.word	0x007f0001
c0de311c:	00001748 	.word	0x00001748
c0de3120:	00001517 	.word	0x00001517
c0de3124:	0000173c 	.word	0x0000173c
c0de3128:	00001e44 	.word	0x00001e44
c0de312c:	00001d10 	.word	0x00001d10
c0de3130:	00205020 	.word	0x00205020

c0de3134 <io_seproxyhal_init>:
c0de3134:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de3136:	b089      	sub	sp, #36	@ 0x24
c0de3138:	4d0c      	ldr	r5, [pc, #48]	@ (c0de316c <io_seproxyhal_init+0x38>)
c0de313a:	2600      	movs	r6, #0
c0de313c:	466c      	mov	r4, sp
c0de313e:	2118      	movs	r1, #24
c0de3140:	eb09 0005 	add.w	r0, r9, r5
c0de3144:	7046      	strb	r6, [r0, #1]
c0de3146:	4620      	mov	r0, r4
c0de3148:	f007 ff16 	bl	c0deaf78 <__aeabi_memclr>
c0de314c:	4808      	ldr	r0, [pc, #32]	@ (c0de3170 <io_seproxyhal_init+0x3c>)
c0de314e:	2701      	movs	r7, #1
c0de3150:	f88d 601e 	strb.w	r6, [sp, #30]
c0de3154:	f8ad 7020 	strh.w	r7, [sp, #32]
c0de3158:	f8ad 701c 	strh.w	r7, [sp, #28]
c0de315c:	9006      	str	r0, [sp, #24]
c0de315e:	4620      	mov	r0, r4
c0de3160:	f007 fda0 	bl	c0deaca4 <os_io_init>
c0de3164:	f809 7005 	strb.w	r7, [r9, r5]
c0de3168:	b009      	add	sp, #36	@ 0x24
c0de316a:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de316c:	00001748 	.word	0x00001748
c0de3170:	00020015 	.word	0x00020015

c0de3174 <OUTLINED_FUNCTION_0>:
c0de3174:	eb09 0106 	add.w	r1, r9, r6
c0de3178:	3101      	adds	r1, #1
c0de317a:	4448      	add	r0, r9
c0de317c:	f007 bef2 	b.w	c0deaf64 <__aeabi_memcpy>

c0de3180 <layoutAddCallbackObj>:
c0de3180:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de3182:	f890 40ad 	ldrb.w	r4, [r0, #173]	@ 0xad
c0de3186:	f890 50ae 	ldrb.w	r5, [r0, #174]	@ 0xae
c0de318a:	ea44 2405 	orr.w	r4, r4, r5, lsl #8
c0de318e:	f3c4 2505 	ubfx	r5, r4, #8, #6
c0de3192:	2d0e      	cmp	r5, #14
c0de3194:	bf84      	itt	hi
c0de3196:	2000      	movhi	r0, #0
c0de3198:	bdf0      	pophi	{r4, r5, r6, r7, pc}
c0de319a:	0a26      	lsrs	r6, r4, #8
c0de319c:	f404 4740 	and.w	r7, r4, #49152	@ 0xc000
c0de31a0:	f880 40ad 	strb.w	r4, [r0, #173]	@ 0xad
c0de31a4:	3601      	adds	r6, #1
c0de31a6:	f006 063f 	and.w	r6, r6, #63	@ 0x3f
c0de31aa:	ea47 2606 	orr.w	r6, r7, r6, lsl #8
c0de31ae:	0a36      	lsrs	r6, r6, #8
c0de31b0:	f880 60ae 	strb.w	r6, [r0, #174]	@ 0xae
c0de31b4:	eb00 00c5 	add.w	r0, r0, r5, lsl #3
c0de31b8:	f840 1f20 	str.w	r1, [r0, #32]!
c0de31bc:	7102      	strb	r2, [r0, #4]
c0de31be:	7183      	strb	r3, [r0, #6]
c0de31c0:	bdf0      	pop	{r4, r5, r6, r7, pc}
	...

c0de31c4 <nbgl_layoutGet>:
c0de31c4:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de31c8:	b085      	sub	sp, #20
c0de31ca:	4605      	mov	r5, r0
c0de31cc:	7800      	ldrb	r0, [r0, #0]
c0de31ce:	b190      	cbz	r0, c0de31f6 <nbgl_layoutGet+0x32>
c0de31d0:	486c      	ldr	r0, [pc, #432]	@ (c0de3384 <nbgl_layoutGet+0x1c0>)
c0de31d2:	496d      	ldr	r1, [pc, #436]	@ (c0de3388 <nbgl_layoutGet+0x1c4>)
c0de31d4:	2400      	movs	r4, #0
c0de31d6:	b158      	cbz	r0, c0de31f0 <nbgl_layoutGet+0x2c>
c0de31d8:	eb09 0201 	add.w	r2, r9, r1
c0de31dc:	4402      	add	r2, r0
c0de31de:	f892 32ca 	ldrb.w	r3, [r2, #714]	@ 0x2ca
c0de31e2:	021b      	lsls	r3, r3, #8
c0de31e4:	045b      	lsls	r3, r3, #17
c0de31e6:	bf58      	it	pl
c0de31e8:	f502 7407 	addpl.w	r4, r2, #540	@ 0x21c
c0de31ec:	30b4      	adds	r0, #180	@ 0xb4
c0de31ee:	e7f2      	b.n	c0de31d6 <nbgl_layoutGet+0x12>
c0de31f0:	b974      	cbnz	r4, c0de3210 <nbgl_layoutGet+0x4c>
c0de31f2:	2400      	movs	r4, #0
c0de31f4:	e0c2      	b.n	c0de337c <nbgl_layoutGet+0x1b8>
c0de31f6:	4965      	ldr	r1, [pc, #404]	@ (c0de338c <nbgl_layoutGet+0x1c8>)
c0de31f8:	4863      	ldr	r0, [pc, #396]	@ (c0de3388 <nbgl_layoutGet+0x1c4>)
c0de31fa:	eb09 0201 	add.w	r2, r9, r1
c0de31fe:	6852      	ldr	r2, [r2, #4]
c0de3200:	b112      	cbz	r2, c0de3208 <nbgl_layoutGet+0x44>
c0de3202:	eb09 0400 	add.w	r4, r9, r0
c0de3206:	e003      	b.n	c0de3210 <nbgl_layoutGet+0x4c>
c0de3208:	eb09 0400 	add.w	r4, r9, r0
c0de320c:	4449      	add	r1, r9
c0de320e:	604c      	str	r4, [r1, #4]
c0de3210:	4e5d      	ldr	r6, [pc, #372]	@ (c0de3388 <nbgl_layoutGet+0x1c4>)
c0de3212:	4620      	mov	r0, r4
c0de3214:	21b4      	movs	r1, #180	@ 0xb4
c0de3216:	f859 7006 	ldr.w	r7, [r9, r6]
c0de321a:	f007 fead 	bl	c0deaf78 <__aeabi_memclr>
c0de321e:	7828      	ldrb	r0, [r5, #0]
c0de3220:	b150      	cbz	r0, c0de3238 <nbgl_layoutGet+0x74>
c0de3222:	485a      	ldr	r0, [pc, #360]	@ (c0de338c <nbgl_layoutGet+0x1c8>)
c0de3224:	4448      	add	r0, r9
c0de3226:	6841      	ldr	r1, [r0, #4]
c0de3228:	2900      	cmp	r1, #0
c0de322a:	bf08      	it	eq
c0de322c:	eb09 0106 	addeq.w	r1, r9, r6
c0de3230:	600c      	str	r4, [r1, #0]
c0de3232:	6061      	str	r1, [r4, #4]
c0de3234:	6044      	str	r4, [r0, #4]
c0de3236:	e001      	b.n	c0de323c <nbgl_layoutGet+0x78>
c0de3238:	f849 7006 	str.w	r7, [r9, r6]
c0de323c:	4853      	ldr	r0, [pc, #332]	@ (c0de338c <nbgl_layoutGet+0x1c8>)
c0de323e:	2100      	movs	r1, #0
c0de3240:	f809 1000 	strb.w	r1, [r9, r0]
c0de3244:	68e8      	ldr	r0, [r5, #12]
c0de3246:	f007 fc75 	bl	c0deab34 <pic>
c0de324a:	4621      	mov	r1, r4
c0de324c:	782e      	ldrb	r6, [r5, #0]
c0de324e:	f811 2fad 	ldrb.w	r2, [r1, #173]!
c0de3252:	784b      	ldrb	r3, [r1, #1]
c0de3254:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de3258:	f022 0201 	bic.w	r2, r2, #1
c0de325c:	4332      	orrs	r2, r6
c0de325e:	700a      	strb	r2, [r1, #0]
c0de3260:	f002 02fd 	and.w	r2, r2, #253	@ 0xfd
c0de3264:	786e      	ldrb	r6, [r5, #1]
c0de3266:	f841 0c91 	str.w	r0, [r1, #-145]
c0de326a:	704b      	strb	r3, [r1, #1]
c0de326c:	f1a1 00a5 	sub.w	r0, r1, #165	@ 0xa5
c0de3270:	ea42 0246 	orr.w	r2, r2, r6, lsl #1
c0de3274:	700a      	strb	r2, [r1, #0]
c0de3276:	f105 0210 	add.w	r2, r5, #16
c0de327a:	7829      	ldrb	r1, [r5, #0]
c0de327c:	4b44      	ldr	r3, [pc, #272]	@ (c0de3390 <nbgl_layoutGet+0x1cc>)
c0de327e:	447b      	add	r3, pc
c0de3280:	b159      	cbz	r1, c0de329a <nbgl_layoutGet+0xd6>
c0de3282:	2106      	movs	r1, #6
c0de3284:	f007 fa5c 	bl	c0dea740 <nbgl_screenPush>
c0de3288:	f894 10ad 	ldrb.w	r1, [r4, #173]	@ 0xad
c0de328c:	f894 20ae 	ldrb.w	r2, [r4, #174]	@ 0xae
c0de3290:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de3294:	f360 01c7 	bfi	r1, r0, #3, #5
c0de3298:	e00a      	b.n	c0de32b0 <nbgl_layoutGet+0xec>
c0de329a:	2106      	movs	r1, #6
c0de329c:	f007 fa4b 	bl	c0dea736 <nbgl_screenSet>
c0de32a0:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de32a4:	f894 10ae 	ldrb.w	r1, [r4, #174]	@ 0xae
c0de32a8:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de32ac:	f020 01f8 	bic.w	r1, r0, #248	@ 0xf8
c0de32b0:	4627      	mov	r7, r4
c0de32b2:	0a08      	lsrs	r0, r1, #8
c0de32b4:	f04f 0a01 	mov.w	sl, #1
c0de32b8:	f807 1fad 	strb.w	r1, [r7, #173]!
c0de32bc:	7078      	strb	r0, [r7, #1]
c0de32be:	b2c8      	uxtb	r0, r1
c0de32c0:	f003 f9f0 	bl	c0de66a4 <OUTLINED_FUNCTION_19>
c0de32c4:	2102      	movs	r1, #2
c0de32c6:	f04f 0800 	mov.w	r8, #0
c0de32ca:	f880 a005 	strb.w	sl, [r0, #5]
c0de32ce:	71c1      	strb	r1, [r0, #7]
c0de32d0:	2158      	movs	r1, #88	@ 0x58
c0de32d2:	f880 801f 	strb.w	r8, [r0, #31]
c0de32d6:	7181      	strb	r1, [r0, #6]
c0de32d8:	21e0      	movs	r1, #224	@ 0xe0
c0de32da:	7101      	strb	r1, [r0, #4]
c0de32dc:	f847 0c0d 	str.w	r0, [r7, #-13]
c0de32e0:	7838      	ldrb	r0, [r7, #0]
c0de32e2:	08c1      	lsrs	r1, r0, #3
c0de32e4:	2014      	movs	r0, #20
c0de32e6:	f007 fa49 	bl	c0dea77c <nbgl_containerPoolGet>
c0de32ea:	f857 2c0d 	ldr.w	r2, [r7, #-13]
c0de32ee:	0a03      	lsrs	r3, r0, #8
c0de32f0:	f857 1ca5 	ldr.w	r1, [r7, #-165]
c0de32f4:	0e06      	lsrs	r6, r0, #24
c0de32f6:	f882 3023 	strb.w	r3, [r2, #35]	@ 0x23
c0de32fa:	4613      	mov	r3, r2
c0de32fc:	f882 a016 	strb.w	sl, [r2, #22]
c0de3300:	f803 0f22 	strb.w	r0, [r3, #34]!
c0de3304:	0c00      	lsrs	r0, r0, #16
c0de3306:	70de      	strb	r6, [r3, #3]
c0de3308:	7098      	strb	r0, [r3, #2]
c0de330a:	604a      	str	r2, [r1, #4]
c0de330c:	7878      	ldrb	r0, [r7, #1]
c0de330e:	f040 0040 	orr.w	r0, r0, #64	@ 0x40
c0de3312:	7078      	strb	r0, [r7, #1]
c0de3314:	6868      	ldr	r0, [r5, #4]
c0de3316:	b388      	cbz	r0, c0de337c <nbgl_layoutGet+0x1b8>
c0de3318:	f007 fc0c 	bl	c0deab34 <pic>
c0de331c:	4621      	mov	r1, r4
c0de331e:	f44f 4640 	mov.w	r6, #49152	@ 0xc000
c0de3322:	f811 2fad 	ldrb.w	r2, [r1, #173]!
c0de3326:	784b      	ldrb	r3, [r1, #1]
c0de3328:	700a      	strb	r2, [r1, #0]
c0de332a:	1c5f      	adds	r7, r3, #1
c0de332c:	ea06 2603 	and.w	r6, r6, r3, lsl #8
c0de3330:	f003 023f 	and.w	r2, r3, #63	@ 0x3f
c0de3334:	f007 073f 	and.w	r7, r7, #63	@ 0x3f
c0de3338:	ea46 2607 	orr.w	r6, r6, r7, lsl #8
c0de333c:	eb04 07c2 	add.w	r7, r4, r2, lsl #3
c0de3340:	0a36      	lsrs	r6, r6, #8
c0de3342:	704e      	strb	r6, [r1, #1]
c0de3344:	f8d4 60a0 	ldr.w	r6, [r4, #160]	@ 0xa0
c0de3348:	2104      	movs	r1, #4
c0de334a:	77b1      	strb	r1, [r6, #30]
c0de334c:	7a2a      	ldrb	r2, [r5, #8]
c0de334e:	7a6b      	ldrb	r3, [r5, #9]
c0de3350:	623e      	str	r6, [r7, #32]
c0de3352:	f887 3026 	strb.w	r3, [r7, #38]	@ 0x26
c0de3356:	f886 a01c 	strb.w	sl, [r6, #28]
c0de335a:	f886 801d 	strb.w	r8, [r6, #29]
c0de335e:	f887 2024 	strb.w	r2, [r7, #36]	@ 0x24
c0de3362:	7805      	ldrb	r5, [r0, #0]
c0de3364:	b155      	cbz	r5, c0de337c <nbgl_layoutGet+0x1b8>
c0de3366:	9001      	str	r0, [sp, #4]
c0de3368:	f88d 1000 	strb.w	r1, [sp]
c0de336c:	4669      	mov	r1, sp
c0de336e:	4620      	mov	r0, r4
c0de3370:	f88d 3009 	strb.w	r3, [sp, #9]
c0de3374:	f88d 2008 	strb.w	r2, [sp, #8]
c0de3378:	f000 f992 	bl	c0de36a0 <nbgl_layoutAddUpFooter>
c0de337c:	4620      	mov	r0, r4
c0de337e:	b005      	add	sp, #20
c0de3380:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}
c0de3384:	fffffe98 	.word	0xfffffe98
c0de3388:	0000174c 	.word	0x0000174c
c0de338c:	00001968 	.word	0x00001968
c0de3390:	00000113 	.word	0x00000113

c0de3394 <touchCallback>:
c0de3394:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de3398:	2800      	cmp	r0, #0
c0de339a:	f000 817e 	beq.w	c0de369a <touchCallback+0x306>
c0de339e:	460d      	mov	r5, r1
c0de33a0:	a901      	add	r1, sp, #4
c0de33a2:	466a      	mov	r2, sp
c0de33a4:	4604      	mov	r4, r0
c0de33a6:	f002 ffcd 	bl	c0de6344 <getLayoutAndLayoutObj>
c0de33aa:	b968      	cbnz	r0, c0de33c8 <touchCallback+0x34>
c0de33ac:	4620      	mov	r0, r4
c0de33ae:	f810 1f0e 	ldrb.w	r1, [r0, #14]!
c0de33b2:	f003 f997 	bl	c0de66e4 <OUTLINED_FUNCTION_23>
c0de33b6:	466a      	mov	r2, sp
c0de33b8:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de33bc:	a901      	add	r1, sp, #4
c0de33be:	f002 ffc1 	bl	c0de6344 <getLayoutAndLayoutObj>
c0de33c2:	2800      	cmp	r0, #0
c0de33c4:	f000 8169 	beq.w	c0de369a <touchCallback+0x306>
c0de33c8:	1fe8      	subs	r0, r5, #7
c0de33ca:	b2c0      	uxtb	r0, r0
c0de33cc:	2803      	cmp	r0, #3
c0de33ce:	d833      	bhi.n	c0de3438 <touchCallback+0xa4>
c0de33d0:	7ee0      	ldrb	r0, [r4, #27]
c0de33d2:	2801      	cmp	r0, #1
c0de33d4:	d130      	bne.n	c0de3438 <touchCallback+0xa4>
c0de33d6:	9901      	ldr	r1, [sp, #4]
c0de33d8:	4628      	mov	r0, r5
c0de33da:	f891 20b0 	ldrb.w	r2, [r1, #176]	@ 0xb0
c0de33de:	2a01      	cmp	r2, #1
c0de33e0:	d028      	beq.n	c0de3434 <touchCallback+0xa0>
c0de33e2:	bb4a      	cbnz	r2, c0de3438 <touchCallback+0xa4>
c0de33e4:	f8d1 00a0 	ldr.w	r0, [r1, #160]	@ 0xa0
c0de33e8:	42a0      	cmp	r0, r4
c0de33ea:	d125      	bne.n	c0de3438 <touchCallback+0xa4>
c0de33ec:	f891 00ab 	ldrb.w	r0, [r1, #171]	@ 0xab
c0de33f0:	2803      	cmp	r0, #3
c0de33f2:	d005      	beq.n	c0de3400 <touchCallback+0x6c>
c0de33f4:	2804      	cmp	r0, #4
c0de33f6:	f040 8150 	bne.w	c0de369a <touchCallback+0x306>
c0de33fa:	f101 0010 	add.w	r0, r1, #16
c0de33fe:	e00c      	b.n	c0de341a <touchCallback+0x86>
c0de3400:	6908      	ldr	r0, [r1, #16]
c0de3402:	f810 2f22 	ldrb.w	r2, [r0, #34]!
c0de3406:	7843      	ldrb	r3, [r0, #1]
c0de3408:	7886      	ldrb	r6, [r0, #2]
c0de340a:	78c0      	ldrb	r0, [r0, #3]
c0de340c:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de3410:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
c0de3414:	ea42 4000 	orr.w	r0, r2, r0, lsl #16
c0de3418:	3004      	adds	r0, #4
c0de341a:	f101 06a9 	add.w	r6, r1, #169	@ 0xa9
c0de341e:	f891 20a8 	ldrb.w	r2, [r1, #168]	@ 0xa8
c0de3422:	6800      	ldr	r0, [r0, #0]
c0de3424:	4629      	mov	r1, r5
c0de3426:	4633      	mov	r3, r6
c0de3428:	f003 fadc 	bl	c0de69e4 <layoutNavigationCallback>
c0de342c:	2800      	cmp	r0, #0
c0de342e:	f000 8134 	beq.w	c0de369a <touchCallback+0x306>
c0de3432:	7830      	ldrb	r0, [r6, #0]
c0de3434:	9900      	ldr	r1, [sp, #0]
c0de3436:	7148      	strb	r0, [r1, #5]
c0de3438:	4620      	mov	r0, r4
c0de343a:	9f01      	ldr	r7, [sp, #4]
c0de343c:	f810 1f0e 	ldrb.w	r1, [r0, #14]!
c0de3440:	f003 fa1c 	bl	c0de687c <OUTLINED_FUNCTION_45>
c0de3444:	6938      	ldr	r0, [r7, #16]
c0de3446:	4281      	cmp	r1, r0
c0de3448:	d103      	bne.n	c0de3452 <touchCallback+0xbe>
c0de344a:	f897 20ab 	ldrb.w	r2, [r7, #171]	@ 0xab
c0de344e:	2a04      	cmp	r2, #4
c0de3450:	d00c      	beq.n	c0de346c <touchCallback+0xd8>
c0de3452:	7eca      	ldrb	r2, [r1, #27]
c0de3454:	2a01      	cmp	r2, #1
c0de3456:	d118      	bne.n	c0de348a <touchCallback+0xf6>
c0de3458:	f811 2f0e 	ldrb.w	r2, [r1, #14]!
c0de345c:	f003 f89e 	bl	c0de659c <OUTLINED_FUNCTION_9>
c0de3460:	4281      	cmp	r1, r0
c0de3462:	d112      	bne.n	c0de348a <touchCallback+0xf6>
c0de3464:	f897 00ab 	ldrb.w	r0, [r7, #171]	@ 0xab
c0de3468:	2803      	cmp	r0, #3
c0de346a:	d10e      	bne.n	c0de348a <touchCallback+0xf6>
c0de346c:	f107 06a9 	add.w	r6, r7, #169	@ 0xa9
c0de3470:	f897 20a8 	ldrb.w	r2, [r7, #168]	@ 0xa8
c0de3474:	4620      	mov	r0, r4
c0de3476:	4629      	mov	r1, r5
c0de3478:	4633      	mov	r3, r6
c0de347a:	f003 fab3 	bl	c0de69e4 <layoutNavigationCallback>
c0de347e:	2800      	cmp	r0, #0
c0de3480:	f000 810b 	beq.w	c0de369a <touchCallback+0x306>
c0de3484:	7830      	ldrb	r0, [r6, #0]
c0de3486:	9900      	ldr	r1, [sp, #0]
c0de3488:	7148      	strb	r0, [r1, #5]
c0de348a:	7ee0      	ldrb	r0, [r4, #27]
c0de348c:	2801      	cmp	r0, #1
c0de348e:	f040 80ac 	bne.w	c0de35ea <touchCallback+0x256>
c0de3492:	f894 0020 	ldrb.w	r0, [r4, #32]
c0de3496:	2802      	cmp	r0, #2
c0de3498:	f0c0 80a7 	bcc.w	c0de35ea <touchCallback+0x256>
c0de349c:	4621      	mov	r1, r4
c0de349e:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de34a2:	f003 f87b 	bl	c0de659c <OUTLINED_FUNCTION_9>
c0de34a6:	684e      	ldr	r6, [r1, #4]
c0de34a8:	b196      	cbz	r6, c0de34d0 <touchCallback+0x13c>
c0de34aa:	7ef1      	ldrb	r1, [r6, #27]
c0de34ac:	2906      	cmp	r1, #6
c0de34ae:	d10f      	bne.n	c0de34d0 <touchCallback+0x13c>
c0de34b0:	f896 0021 	ldrb.w	r0, [r6, #33]	@ 0x21
c0de34b4:	3801      	subs	r0, #1
c0de34b6:	bf18      	it	ne
c0de34b8:	2001      	movne	r0, #1
c0de34ba:	f886 0021 	strb.w	r0, [r6, #33]	@ 0x21
c0de34be:	4630      	mov	r0, r6
c0de34c0:	f007 f92f 	bl	c0dea722 <nbgl_objDraw>
c0de34c4:	f896 0021 	ldrb.w	r0, [r6, #33]	@ 0x21
c0de34c8:	9900      	ldr	r1, [sp, #0]
c0de34ca:	2401      	movs	r4, #1
c0de34cc:	7148      	strb	r0, [r1, #5]
c0de34ce:	e08d      	b.n	c0de35ec <touchCallback+0x258>
c0de34d0:	2804      	cmp	r0, #4
c0de34d2:	d064      	beq.n	c0de359e <touchCallback+0x20a>
c0de34d4:	2802      	cmp	r0, #2
c0de34d6:	f040 8088 	bne.w	c0de35ea <touchCallback+0x256>
c0de34da:	4620      	mov	r0, r4
c0de34dc:	f003 f8d6 	bl	c0de668c <OUTLINED_FUNCTION_18>
c0de34e0:	6840      	ldr	r0, [r0, #4]
c0de34e2:	2800      	cmp	r0, #0
c0de34e4:	f000 8081 	beq.w	c0de35ea <touchCallback+0x256>
c0de34e8:	7ec0      	ldrb	r0, [r0, #27]
c0de34ea:	2809      	cmp	r0, #9
c0de34ec:	d17d      	bne.n	c0de35ea <touchCallback+0x256>
c0de34ee:	2d00      	cmp	r5, #0
c0de34f0:	f040 80d3 	bne.w	c0de369a <touchCallback+0x306>
c0de34f4:	f04f 0aff 	mov.w	sl, #255	@ 0xff
c0de34f8:	2500      	movs	r5, #0
c0de34fa:	f04f 0800 	mov.w	r8, #0
c0de34fe:	f897 10ae 	ldrb.w	r1, [r7, #174]	@ 0xae
c0de3502:	fa5f f088 	uxtb.w	r0, r8
c0de3506:	f001 013f 	and.w	r1, r1, #63	@ 0x3f
c0de350a:	4281      	cmp	r1, r0
c0de350c:	f240 8085 	bls.w	c0de361a <touchCallback+0x286>
c0de3510:	eb07 00c0 	add.w	r0, r7, r0, lsl #3
c0de3514:	6a00      	ldr	r0, [r0, #32]
c0de3516:	42a0      	cmp	r0, r4
c0de3518:	d117      	bne.n	c0de354a <touchCallback+0x1b6>
c0de351a:	7ee1      	ldrb	r1, [r4, #27]
c0de351c:	2901      	cmp	r1, #1
c0de351e:	d114      	bne.n	c0de354a <touchCallback+0x1b6>
c0de3520:	4620      	mov	r0, r4
c0de3522:	46ab      	mov	fp, r5
c0de3524:	46c2      	mov	sl, r8
c0de3526:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de352a:	f003 f8db 	bl	c0de66e4 <OUTLINED_FUNCTION_23>
c0de352e:	220c      	movs	r2, #12
c0de3530:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de3534:	e9d0 1000 	ldrd	r1, r0, [r0]
c0de3538:	f881 2022 	strb.w	r2, [r1, #34]	@ 0x22
c0de353c:	2200      	movs	r2, #0
c0de353e:	77ca      	strb	r2, [r1, #31]
c0de3540:	2101      	movs	r1, #1
c0de3542:	f880 1021 	strb.w	r1, [r0, #33]	@ 0x21
c0de3546:	4620      	mov	r0, r4
c0de3548:	e024      	b.n	c0de3594 <touchCallback+0x200>
c0de354a:	7ec1      	ldrb	r1, [r0, #27]
c0de354c:	2901      	cmp	r1, #1
c0de354e:	d123      	bne.n	c0de3598 <touchCallback+0x204>
c0de3550:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de3554:	2902      	cmp	r1, #2
c0de3556:	d11f      	bne.n	c0de3598 <touchCallback+0x204>
c0de3558:	4601      	mov	r1, r0
c0de355a:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de355e:	784b      	ldrb	r3, [r1, #1]
c0de3560:	788e      	ldrb	r6, [r1, #2]
c0de3562:	78c9      	ldrb	r1, [r1, #3]
c0de3564:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de3568:	ea46 2101 	orr.w	r1, r6, r1, lsl #8
c0de356c:	ea42 4201 	orr.w	r2, r2, r1, lsl #16
c0de3570:	6851      	ldr	r1, [r2, #4]
c0de3572:	7ecb      	ldrb	r3, [r1, #27]
c0de3574:	2b09      	cmp	r3, #9
c0de3576:	d10f      	bne.n	c0de3598 <touchCallback+0x204>
c0de3578:	f891 3021 	ldrb.w	r3, [r1, #33]	@ 0x21
c0de357c:	3501      	adds	r5, #1
c0de357e:	2b01      	cmp	r3, #1
c0de3580:	d10a      	bne.n	c0de3598 <touchCallback+0x204>
c0de3582:	6812      	ldr	r2, [r2, #0]
c0de3584:	230b      	movs	r3, #11
c0de3586:	f882 3022 	strb.w	r3, [r2, #34]	@ 0x22
c0de358a:	2301      	movs	r3, #1
c0de358c:	77d3      	strb	r3, [r2, #31]
c0de358e:	2200      	movs	r2, #0
c0de3590:	f881 2021 	strb.w	r2, [r1, #33]	@ 0x21
c0de3594:	f007 f8c5 	bl	c0dea722 <nbgl_objDraw>
c0de3598:	f108 0801 	add.w	r8, r8, #1
c0de359c:	e7af      	b.n	c0de34fe <touchCallback+0x16a>
c0de359e:	4620      	mov	r0, r4
c0de35a0:	f003 f874 	bl	c0de668c <OUTLINED_FUNCTION_18>
c0de35a4:	68c6      	ldr	r6, [r0, #12]
c0de35a6:	b306      	cbz	r6, c0de35ea <touchCallback+0x256>
c0de35a8:	7ef0      	ldrb	r0, [r6, #27]
c0de35aa:	2808      	cmp	r0, #8
c0de35ac:	d11d      	bne.n	c0de35ea <touchCallback+0x256>
c0de35ae:	2d0a      	cmp	r5, #10
c0de35b0:	d873      	bhi.n	c0de369a <touchCallback+0x306>
c0de35b2:	2001      	movs	r0, #1
c0de35b4:	40a8      	lsls	r0, r5
c0de35b6:	f410 6fc5 	tst.w	r0, #1576	@ 0x628
c0de35ba:	d045      	beq.n	c0de3648 <touchCallback+0x2b4>
c0de35bc:	f007 faea 	bl	c0deab94 <nbgl_wait_pipeline>
c0de35c0:	2000      	movs	r0, #0
c0de35c2:	f003 f916 	bl	c0de67f2 <OUTLINED_FUNCTION_35>
c0de35c6:	f814 0f22 	ldrb.w	r0, [r4, #34]!
c0de35ca:	7861      	ldrb	r1, [r4, #1]
c0de35cc:	78a2      	ldrb	r2, [r4, #2]
c0de35ce:	78e3      	ldrb	r3, [r4, #3]
c0de35d0:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de35d4:	f003 f91d 	bl	c0de6812 <OUTLINED_FUNCTION_37>
c0de35d8:	6880      	ldr	r0, [r0, #8]
c0de35da:	f007 f8a2 	bl	c0dea722 <nbgl_objDraw>
c0de35de:	2003      	movs	r0, #3
c0de35e0:	2100      	movs	r1, #0
c0de35e2:	e8bd 4dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de35e6:	f007 b892 	b.w	c0dea70e <nbgl_refreshSpecialWithPostRefresh>
c0de35ea:	2400      	movs	r4, #0
c0de35ec:	69f8      	ldr	r0, [r7, #28]
c0de35ee:	2800      	cmp	r0, #0
c0de35f0:	d053      	beq.n	c0de369a <touchCallback+0x306>
c0de35f2:	9d00      	ldr	r5, [sp, #0]
c0de35f4:	7928      	ldrb	r0, [r5, #4]
c0de35f6:	28ff      	cmp	r0, #255	@ 0xff
c0de35f8:	d04f      	beq.n	c0de369a <touchCallback+0x306>
c0de35fa:	79a8      	ldrb	r0, [r5, #6]
c0de35fc:	280b      	cmp	r0, #11
c0de35fe:	bf98      	it	ls
c0de3600:	f7ff fbd9 	blls	c0de2db6 <os_io_seph_cmd_piezo_play_tune>
c0de3604:	b114      	cbz	r4, c0de360c <touchCallback+0x278>
c0de3606:	2001      	movs	r0, #1
c0de3608:	f007 f87c 	bl	c0dea704 <nbgl_refreshSpecial>
c0de360c:	7928      	ldrb	r0, [r5, #4]
c0de360e:	7969      	ldrb	r1, [r5, #5]
c0de3610:	69fa      	ldr	r2, [r7, #28]
c0de3612:	b002      	add	sp, #8
c0de3614:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de3618:	4710      	bx	r2
c0de361a:	fa5f f08a 	uxtb.w	r0, sl
c0de361e:	28ff      	cmp	r0, #255	@ 0xff
c0de3620:	d03b      	beq.n	c0de369a <touchCallback+0x306>
c0de3622:	69f9      	ldr	r1, [r7, #28]
c0de3624:	b3c9      	cbz	r1, c0de369a <touchCallback+0x306>
c0de3626:	eb07 04c0 	add.w	r4, r7, r0, lsl #3
c0de362a:	f894 0026 	ldrb.w	r0, [r4, #38]	@ 0x26
c0de362e:	280b      	cmp	r0, #11
c0de3630:	bf98      	it	ls
c0de3632:	f7ff fbc0 	blls	c0de2db6 <os_io_seph_cmd_piezo_play_tune>
c0de3636:	2001      	movs	r0, #1
c0de3638:	f007 f864 	bl	c0dea704 <nbgl_refreshSpecial>
c0de363c:	f894 0024 	ldrb.w	r0, [r4, #36]	@ 0x24
c0de3640:	69fa      	ldr	r2, [r7, #28]
c0de3642:	fa5f f18b 	uxtb.w	r1, fp
c0de3646:	e7e4      	b.n	c0de3612 <touchCallback+0x27e>
c0de3648:	2d02      	cmp	r5, #2
c0de364a:	d126      	bne.n	c0de369a <touchCallback+0x306>
c0de364c:	9d00      	ldr	r5, [sp, #0]
c0de364e:	4620      	mov	r0, r4
c0de3650:	f007 f8c6 	bl	c0dea7e0 <nbgl_touchGetTouchDuration>
c0de3654:	f896 1021 	ldrb.w	r1, [r6, #33]	@ 0x21
c0de3658:	2200      	movs	r2, #0
c0de365a:	2300      	movs	r3, #0
c0de365c:	2964      	cmp	r1, #100	@ 0x64
c0de365e:	bf38      	it	cc
c0de3660:	2301      	movcc	r3, #1
c0de3662:	2464      	movs	r4, #100	@ 0x64
c0de3664:	fbb0 f0f4 	udiv	r0, r0, r4
c0de3668:	ebc0 00c0 	rsb	r0, r0, r0, lsl #3
c0de366c:	b2c4      	uxtb	r4, r0
c0de366e:	2c63      	cmp	r4, #99	@ 0x63
c0de3670:	bf88      	it	hi
c0de3672:	2201      	movhi	r2, #1
c0de3674:	ea02 0403 	and.w	r4, r2, r3
c0de3678:	bf88      	it	hi
c0de367a:	2064      	movhi	r0, #100	@ 0x64
c0de367c:	b2c2      	uxtb	r2, r0
c0de367e:	428a      	cmp	r2, r1
c0de3680:	d005      	beq.n	c0de368e <touchCallback+0x2fa>
c0de3682:	f003 f8b6 	bl	c0de67f2 <OUTLINED_FUNCTION_35>
c0de3686:	2004      	movs	r0, #4
c0de3688:	2102      	movs	r1, #2
c0de368a:	f007 f840 	bl	c0dea70e <nbgl_refreshSpecialWithPostRefresh>
c0de368e:	b124      	cbz	r4, c0de369a <touchCallback+0x306>
c0de3690:	69fa      	ldr	r2, [r7, #28]
c0de3692:	b112      	cbz	r2, c0de369a <touchCallback+0x306>
c0de3694:	7928      	ldrb	r0, [r5, #4]
c0de3696:	7969      	ldrb	r1, [r5, #5]
c0de3698:	e7bb      	b.n	c0de3612 <touchCallback+0x27e>
c0de369a:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
	...

c0de36a0 <nbgl_layoutAddUpFooter>:
c0de36a0:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de36a4:	2800      	cmp	r0, #0
c0de36a6:	f000 826c 	beq.w	c0de3b82 <nbgl_layoutAddUpFooter+0x4e2>
c0de36aa:	460d      	mov	r5, r1
c0de36ac:	b119      	cbz	r1, c0de36b6 <nbgl_layoutAddUpFooter+0x16>
c0de36ae:	4604      	mov	r4, r0
c0de36b0:	7828      	ldrb	r0, [r5, #0]
c0de36b2:	2804      	cmp	r0, #4
c0de36b4:	d903      	bls.n	c0de36be <nbgl_layoutAddUpFooter+0x1e>
c0de36b6:	f06f 0001 	mvn.w	r0, #1
c0de36ba:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de36be:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de36c2:	2601      	movs	r6, #1
c0de36c4:	f002 ffee 	bl	c0de66a4 <OUTLINED_FUNCTION_19>
c0de36c8:	f003 f8fd 	bl	c0de68c6 <OUTLINED_FUNCTION_51>
c0de36cc:	6160      	str	r0, [r4, #20]
c0de36ce:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de36d2:	f003 f915 	bl	c0de6900 <OUTLINED_FUNCTION_56>
c0de36d6:	6961      	ldr	r1, [r4, #20]
c0de36d8:	0a02      	lsrs	r2, r0, #8
c0de36da:	f8d4 30a0 	ldr.w	r3, [r4, #160]	@ 0xa0
c0de36de:	0e06      	lsrs	r6, r0, #24
c0de36e0:	f881 2023 	strb.w	r2, [r1, #35]	@ 0x23
c0de36e4:	2208      	movs	r2, #8
c0de36e6:	f003 f936 	bl	c0de6956 <OUTLINED_FUNCTION_65>
c0de36ea:	4608      	mov	r0, r1
c0de36ec:	70d6      	strb	r6, [r2, #3]
c0de36ee:	0e1a      	lsrs	r2, r3, #24
c0de36f0:	f800 3f12 	strb.w	r3, [r0, #18]!
c0de36f4:	70c2      	strb	r2, [r0, #3]
c0de36f6:	0c1a      	lsrs	r2, r3, #16
c0de36f8:	7082      	strb	r2, [r0, #2]
c0de36fa:	0a18      	lsrs	r0, r3, #8
c0de36fc:	74c8      	strb	r0, [r1, #19]
c0de36fe:	7828      	ldrb	r0, [r5, #0]
c0de3700:	2804      	cmp	r0, #4
c0de3702:	f000 80ba 	beq.w	c0de387a <nbgl_layoutAddUpFooter+0x1da>
c0de3706:	2801      	cmp	r0, #1
c0de3708:	f000 80e9 	beq.w	c0de38de <nbgl_layoutAddUpFooter+0x23e>
c0de370c:	2802      	cmp	r0, #2
c0de370e:	f000 814b 	beq.w	c0de39a8 <nbgl_layoutAddUpFooter+0x308>
c0de3712:	2803      	cmp	r0, #3
c0de3714:	f000 81d2 	beq.w	c0de3abc <nbgl_layoutAddUpFooter+0x41c>
c0de3718:	2800      	cmp	r0, #0
c0de371a:	d1cc      	bne.n	c0de36b6 <nbgl_layoutAddUpFooter+0x16>
c0de371c:	f003 f956 	bl	c0de69cc <OUTLINED_FUNCTION_74>
c0de3720:	2800      	cmp	r0, #0
c0de3722:	f000 822e 	beq.w	c0de3b82 <nbgl_layoutAddUpFooter+0x4e2>
c0de3726:	6960      	ldr	r0, [r4, #20]
c0de3728:	2112      	movs	r1, #18
c0de372a:	f04f 0804 	mov.w	r8, #4
c0de372e:	f04f 0a00 	mov.w	sl, #0
c0de3732:	2706      	movs	r7, #6
c0de3734:	7781      	strb	r1, [r0, #30]
c0de3736:	2198      	movs	r1, #152	@ 0x98
c0de3738:	f880 8020 	strb.w	r8, [r0, #32]
c0de373c:	f880 a007 	strb.w	sl, [r0, #7]
c0de3740:	7747      	strb	r7, [r0, #29]
c0de3742:	7181      	strb	r1, [r0, #6]
c0de3744:	212c      	movs	r1, #44	@ 0x2c
c0de3746:	7701      	strb	r1, [r0, #28]
c0de3748:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de374c:	4ed9      	ldr	r6, [pc, #868]	@ (c0de3ab4 <nbgl_layoutAddUpFooter+0x414>)
c0de374e:	08c1      	lsrs	r1, r0, #3
c0de3750:	447e      	add	r6, pc
c0de3752:	2005      	movs	r0, #5
c0de3754:	47b0      	blx	r6
c0de3756:	46b3      	mov	fp, r6
c0de3758:	4606      	mov	r6, r0
c0de375a:	f880 a018 	strb.w	sl, [r0, #24]
c0de375e:	2020      	movs	r0, #32
c0de3760:	2103      	movs	r1, #3
c0de3762:	75f0      	strb	r0, [r6, #23]
c0de3764:	2058      	movs	r0, #88	@ 0x58
c0de3766:	75b7      	strb	r7, [r6, #22]
c0de3768:	4637      	mov	r7, r6
c0de376a:	f886 a007 	strb.w	sl, [r6, #7]
c0de376e:	f886 1021 	strb.w	r1, [r6, #33]	@ 0x21
c0de3772:	f886 a01f 	strb.w	sl, [r6, #31]
c0de3776:	f886 a020 	strb.w	sl, [r6, #32]
c0de377a:	f886 8022 	strb.w	r8, [r6, #34]	@ 0x22
c0de377e:	f807 0f04 	strb.w	r0, [r7, #4]!
c0de3782:	71b0      	strb	r0, [r6, #6]
c0de3784:	f887 a001 	strb.w	sl, [r7, #1]
c0de3788:	48cb      	ldr	r0, [pc, #812]	@ (c0de3ab8 <nbgl_layoutAddUpFooter+0x418>)
c0de378a:	4478      	add	r0, pc
c0de378c:	f007 f9d2 	bl	c0deab34 <pic>
c0de3790:	4631      	mov	r1, r6
c0de3792:	0e02      	lsrs	r2, r0, #24
c0de3794:	f002 ffea 	bl	c0de676c <OUTLINED_FUNCTION_29>
c0de3798:	6960      	ldr	r0, [r4, #20]
c0de379a:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de379e:	7842      	ldrb	r2, [r0, #1]
c0de37a0:	7883      	ldrb	r3, [r0, #2]
c0de37a2:	78c0      	ldrb	r0, [r0, #3]
c0de37a4:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de37a8:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de37ac:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de37b0:	6006      	str	r6, [r0, #0]
c0de37b2:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de37b6:	08c1      	lsrs	r1, r0, #3
c0de37b8:	2004      	movs	r0, #4
c0de37ba:	47d8      	blx	fp
c0de37bc:	f880 a01f 	strb.w	sl, [r0, #31]
c0de37c0:	4606      	mov	r6, r0
c0de37c2:	f002 ff8c 	bl	c0de66de <OUTLINED_FUNCTION_22>
c0de37c6:	4601      	mov	r1, r0
c0de37c8:	f896 0024 	ldrb.w	r0, [r6, #36]	@ 0x24
c0de37cc:	2301      	movs	r3, #1
c0de37ce:	f886 8020 	strb.w	r8, [r6, #32]
c0de37d2:	0e0a      	lsrs	r2, r1, #24
c0de37d4:	f040 0001 	orr.w	r0, r0, #1
c0de37d8:	f886 0024 	strb.w	r0, [r6, #36]	@ 0x24
c0de37dc:	200d      	movs	r0, #13
c0de37de:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de37e2:	f003 f837 	bl	c0de6854 <OUTLINED_FUNCTION_43>
c0de37e6:	7838      	ldrb	r0, [r7, #0]
c0de37e8:	787a      	ldrb	r2, [r7, #1]
c0de37ea:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de37ee:	f5c0 70c0 	rsb	r0, r0, #384	@ 0x180
c0de37f2:	0a02      	lsrs	r2, r0, #8
c0de37f4:	7130      	strb	r0, [r6, #4]
c0de37f6:	7172      	strb	r2, [r6, #5]
c0de37f8:	b282      	uxth	r2, r0
c0de37fa:	f003 f8a5 	bl	c0de6948 <OUTLINED_FUNCTION_62>
c0de37fe:	2120      	movs	r1, #32
c0de3800:	71b0      	strb	r0, [r6, #6]
c0de3802:	0a00      	lsrs	r0, r0, #8
c0de3804:	f886 a021 	strb.w	sl, [r6, #33]	@ 0x21
c0de3808:	f003 f8cd 	bl	c0de69a6 <OUTLINED_FUNCTION_71>
c0de380c:	75f1      	strb	r1, [r6, #23]
c0de380e:	71f0      	strb	r0, [r6, #7]
c0de3810:	6960      	ldr	r0, [r4, #20]
c0de3812:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de3816:	7842      	ldrb	r2, [r0, #1]
c0de3818:	7883      	ldrb	r3, [r0, #2]
c0de381a:	78c0      	ldrb	r0, [r0, #3]
c0de381c:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de3820:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de3824:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de3828:	6046      	str	r6, [r0, #4]
c0de382a:	f002 ff53 	bl	c0de66d4 <OUTLINED_FUNCTION_21>
c0de382e:	6961      	ldr	r1, [r4, #20]
c0de3830:	2602      	movs	r6, #2
c0de3832:	7586      	strb	r6, [r0, #22]
c0de3834:	f003 f818 	bl	c0de6868 <OUTLINED_FUNCTION_44>
c0de3838:	2708      	movs	r7, #8
c0de383a:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de383e:	6088      	str	r0, [r1, #8]
c0de3840:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de3844:	08c1      	lsrs	r1, r0, #3
c0de3846:	2008      	movs	r0, #8
c0de3848:	47d8      	blx	fp
c0de384a:	f890 1022 	ldrb.w	r1, [r0, #34]	@ 0x22
c0de384e:	7187      	strb	r7, [r0, #6]
c0de3850:	7586      	strb	r6, [r0, #22]
c0de3852:	f880 a01a 	strb.w	sl, [r0, #26]
c0de3856:	f880 a007 	strb.w	sl, [r0, #7]
c0de385a:	f041 0105 	orr.w	r1, r1, #5
c0de385e:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de3862:	2101      	movs	r1, #1
c0de3864:	7641      	strb	r1, [r0, #25]
c0de3866:	7141      	strb	r1, [r0, #5]
c0de3868:	21e0      	movs	r1, #224	@ 0xe0
c0de386a:	7101      	strb	r1, [r0, #4]
c0de386c:	6961      	ldr	r1, [r4, #20]
c0de386e:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de3872:	f002 fe93 	bl	c0de659c <OUTLINED_FUNCTION_9>
c0de3876:	60c8      	str	r0, [r1, #12]
c0de3878:	e1f0      	b.n	c0de3c5c <nbgl_layoutAddUpFooter+0x5bc>
c0de387a:	f003 f8a7 	bl	c0de69cc <OUTLINED_FUNCTION_74>
c0de387e:	2800      	cmp	r0, #0
c0de3880:	f000 817f 	beq.w	c0de3b82 <nbgl_layoutAddUpFooter+0x4e2>
c0de3884:	6960      	ldr	r0, [r4, #20]
c0de3886:	2104      	movs	r1, #4
c0de3888:	2701      	movs	r7, #1
c0de388a:	2260      	movs	r2, #96	@ 0x60
c0de388c:	7781      	strb	r1, [r0, #30]
c0de388e:	2100      	movs	r1, #0
c0de3890:	f880 7020 	strb.w	r7, [r0, #32]
c0de3894:	7182      	strb	r2, [r0, #6]
c0de3896:	7707      	strb	r7, [r0, #28]
c0de3898:	71c1      	strb	r1, [r0, #7]
c0de389a:	7741      	strb	r1, [r0, #29]
c0de389c:	f002 ff1f 	bl	c0de66de <OUTLINED_FUNCTION_22>
c0de38a0:	7800      	ldrb	r0, [r0, #0]
c0de38a2:	2800      	cmp	r0, #0
c0de38a4:	f000 81da 	beq.w	c0de3c5c <nbgl_layoutAddUpFooter+0x5bc>
c0de38a8:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de38ac:	f002 fdf8 	bl	c0de64a0 <OUTLINED_FUNCTION_1>
c0de38b0:	77c7      	strb	r7, [r0, #31]
c0de38b2:	4606      	mov	r6, r0
c0de38b4:	f002 ff13 	bl	c0de66de <OUTLINED_FUNCTION_22>
c0de38b8:	4601      	mov	r1, r0
c0de38ba:	20a0      	movs	r0, #160	@ 0xa0
c0de38bc:	7177      	strb	r7, [r6, #5]
c0de38be:	2705      	movs	r7, #5
c0de38c0:	2301      	movs	r3, #1
c0de38c2:	7130      	strb	r0, [r6, #4]
c0de38c4:	200b      	movs	r0, #11
c0de38c6:	0e0a      	lsrs	r2, r1, #24
c0de38c8:	f886 7020 	strb.w	r7, [r6, #32]
c0de38cc:	f002 fec4 	bl	c0de6658 <OUTLINED_FUNCTION_16>
c0de38d0:	f006 ff68 	bl	c0dea7a4 <nbgl_getTextHeightInWidth>
c0de38d4:	71b0      	strb	r0, [r6, #6]
c0de38d6:	0a00      	lsrs	r0, r0, #8
c0de38d8:	75b7      	strb	r7, [r6, #22]
c0de38da:	71f0      	strb	r0, [r6, #7]
c0de38dc:	e056      	b.n	c0de398c <nbgl_layoutAddUpFooter+0x2ec>
c0de38de:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de38e2:	2705      	movs	r7, #5
c0de38e4:	f002 fe9a 	bl	c0de661c <OUTLINED_FUNCTION_13>
c0de38e8:	4606      	mov	r6, r0
c0de38ea:	7b2a      	ldrb	r2, [r5, #12]
c0de38ec:	7c2b      	ldrb	r3, [r5, #16]
c0de38ee:	f002 feaf 	bl	c0de6650 <OUTLINED_FUNCTION_15>
c0de38f2:	2800      	cmp	r0, #0
c0de38f4:	f000 8145 	beq.w	c0de3b82 <nbgl_layoutAddUpFooter+0x4e2>
c0de38f8:	6960      	ldr	r0, [r4, #20]
c0de38fa:	75b7      	strb	r7, [r6, #22]
c0de38fc:	f04f 0801 	mov.w	r8, #1
c0de3900:	2700      	movs	r7, #0
c0de3902:	2188      	movs	r1, #136	@ 0x88
c0de3904:	f880 8020 	strb.w	r8, [r0, #32]
c0de3908:	71c7      	strb	r7, [r0, #7]
c0de390a:	7181      	strb	r1, [r0, #6]
c0de390c:	7b68      	ldrb	r0, [r5, #13]
c0de390e:	2800      	cmp	r0, #0
c0de3910:	bf18      	it	ne
c0de3912:	2003      	movne	r0, #3
c0de3914:	77f0      	strb	r0, [r6, #31]
c0de3916:	f04f 0000 	mov.w	r0, #0
c0de391a:	bf08      	it	eq
c0de391c:	2003      	moveq	r0, #3
c0de391e:	f886 0021 	strb.w	r0, [r6, #33]	@ 0x21
c0de3922:	7b68      	ldrb	r0, [r5, #13]
c0de3924:	4601      	mov	r1, r0
c0de3926:	2800      	cmp	r0, #0
c0de3928:	bf18      	it	ne
c0de392a:	2101      	movne	r1, #1
c0de392c:	0049      	lsls	r1, r1, #1
c0de392e:	2802      	cmp	r0, #2
c0de3930:	bf08      	it	eq
c0de3932:	2103      	moveq	r1, #3
c0de3934:	f886 1020 	strb.w	r1, [r6, #32]
c0de3938:	f002 fed1 	bl	c0de66de <OUTLINED_FUNCTION_22>
c0de393c:	210c      	movs	r1, #12
c0de393e:	0e02      	lsrs	r2, r0, #24
c0de3940:	f886 1023 	strb.w	r1, [r6, #35]	@ 0x23
c0de3944:	4631      	mov	r1, r6
c0de3946:	f002 ff23 	bl	c0de6790 <OUTLINED_FUNCTION_31>
c0de394a:	f002 ffa1 	bl	c0de6890 <OUTLINED_FUNCTION_46>
c0de394e:	4631      	mov	r1, r6
c0de3950:	0e02      	lsrs	r2, r0, #24
c0de3952:	74f7      	strb	r7, [r6, #19]
c0de3954:	71f7      	strb	r7, [r6, #7]
c0de3956:	f886 8005 	strb.w	r8, [r6, #5]
c0de395a:	7777      	strb	r7, [r6, #29]
c0de395c:	f886 801c 	strb.w	r8, [r6, #28]
c0de3960:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de3964:	70ca      	strb	r2, [r1, #3]
c0de3966:	0c02      	lsrs	r2, r0, #16
c0de3968:	0a00      	lsrs	r0, r0, #8
c0de396a:	f886 002f 	strb.w	r0, [r6, #47]	@ 0x2f
c0de396e:	4630      	mov	r0, r6
c0de3970:	708a      	strb	r2, [r1, #2]
c0de3972:	f800 7f12 	strb.w	r7, [r0, #18]!
c0de3976:	70c7      	strb	r7, [r0, #3]
c0de3978:	7087      	strb	r7, [r0, #2]
c0de397a:	2058      	movs	r0, #88	@ 0x58
c0de397c:	71b0      	strb	r0, [r6, #6]
c0de397e:	20a0      	movs	r0, #160	@ 0xa0
c0de3980:	7130      	strb	r0, [r6, #4]
c0de3982:	2004      	movs	r0, #4
c0de3984:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de3988:	2007      	movs	r0, #7
c0de398a:	77b0      	strb	r0, [r6, #30]
c0de398c:	6960      	ldr	r0, [r4, #20]
c0de398e:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de3992:	7842      	ldrb	r2, [r0, #1]
c0de3994:	7883      	ldrb	r3, [r0, #2]
c0de3996:	78c0      	ldrb	r0, [r0, #3]
c0de3998:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de399c:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de39a0:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de39a4:	6006      	str	r6, [r0, #0]
c0de39a6:	e159      	b.n	c0de3c5c <nbgl_layoutAddUpFooter+0x5bc>
c0de39a8:	6868      	ldr	r0, [r5, #4]
c0de39aa:	2800      	cmp	r0, #0
c0de39ac:	f000 80e9 	beq.w	c0de3b82 <nbgl_layoutAddUpFooter+0x4e2>
c0de39b0:	68a8      	ldr	r0, [r5, #8]
c0de39b2:	2800      	cmp	r0, #0
c0de39b4:	f000 80e5 	beq.w	c0de3b82 <nbgl_layoutAddUpFooter+0x4e2>
c0de39b8:	f04f 0b00 	mov.w	fp, #0
c0de39bc:	2088      	movs	r0, #136	@ 0x88
c0de39be:	2702      	movs	r7, #2
c0de39c0:	f881 b007 	strb.w	fp, [r1, #7]
c0de39c4:	7188      	strb	r0, [r1, #6]
c0de39c6:	f881 7020 	strb.w	r7, [r1, #32]
c0de39ca:	f002 fde1 	bl	c0de6590 <OUTLINED_FUNCTION_8>
c0de39ce:	4606      	mov	r6, r0
c0de39d0:	7b2a      	ldrb	r2, [r5, #12]
c0de39d2:	7bab      	ldrb	r3, [r5, #14]
c0de39d4:	f002 fe3c 	bl	c0de6650 <OUTLINED_FUNCTION_15>
c0de39d8:	2800      	cmp	r0, #0
c0de39da:	f000 80d2 	beq.w	c0de3b82 <nbgl_layoutAddUpFooter+0x4e2>
c0de39de:	2120      	movs	r1, #32
c0de39e0:	f04f 0804 	mov.w	r8, #4
c0de39e4:	f886 7020 	strb.w	r7, [r6, #32]
c0de39e8:	2703      	movs	r7, #3
c0de39ea:	f04f 0a58 	mov.w	sl, #88	@ 0x58
c0de39ee:	f886 b018 	strb.w	fp, [r6, #24]
c0de39f2:	f886 b021 	strb.w	fp, [r6, #33]	@ 0x21
c0de39f6:	f886 b007 	strb.w	fp, [r6, #7]
c0de39fa:	f886 b005 	strb.w	fp, [r6, #5]
c0de39fe:	75f1      	strb	r1, [r6, #23]
c0de3a00:	2101      	movs	r1, #1
c0de3a02:	f886 8016 	strb.w	r8, [r6, #22]
c0de3a06:	77f7      	strb	r7, [r6, #31]
c0de3a08:	f886 8022 	strb.w	r8, [r6, #34]	@ 0x22
c0de3a0c:	7141      	strb	r1, [r0, #5]
c0de3a0e:	f886 a006 	strb.w	sl, [r6, #6]
c0de3a12:	f886 a004 	strb.w	sl, [r6, #4]
c0de3a16:	f002 fe62 	bl	c0de66de <OUTLINED_FUNCTION_22>
c0de3a1a:	4631      	mov	r1, r6
c0de3a1c:	0e02      	lsrs	r2, r0, #24
c0de3a1e:	f886 b01d 	strb.w	fp, [r6, #29]
c0de3a22:	f04f 0b01 	mov.w	fp, #1
c0de3a26:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de3a2a:	f886 b01c 	strb.w	fp, [r6, #28]
c0de3a2e:	70ca      	strb	r2, [r1, #3]
c0de3a30:	0c02      	lsrs	r2, r0, #16
c0de3a32:	0a00      	lsrs	r0, r0, #8
c0de3a34:	f886 002f 	strb.w	r0, [r6, #47]	@ 0x2f
c0de3a38:	200c      	movs	r0, #12
c0de3a3a:	708a      	strb	r2, [r1, #2]
c0de3a3c:	f886 0023 	strb.w	r0, [r6, #35]	@ 0x23
c0de3a40:	200a      	movs	r0, #10
c0de3a42:	f002 feba 	bl	c0de67ba <OUTLINED_FUNCTION_33>
c0de3a46:	6006      	str	r6, [r0, #0]
c0de3a48:	f002 fda2 	bl	c0de6590 <OUTLINED_FUNCTION_8>
c0de3a4c:	4606      	mov	r6, r0
c0de3a4e:	7b6a      	ldrb	r2, [r5, #13]
c0de3a50:	7bab      	ldrb	r3, [r5, #14]
c0de3a52:	f002 fdfd 	bl	c0de6650 <OUTLINED_FUNCTION_15>
c0de3a56:	2800      	cmp	r0, #0
c0de3a58:	f000 8093 	beq.w	c0de3b82 <nbgl_layoutAddUpFooter+0x4e2>
c0de3a5c:	f886 7021 	strb.w	r7, [r6, #33]	@ 0x21
c0de3a60:	2700      	movs	r7, #0
c0de3a62:	2120      	movs	r1, #32
c0de3a64:	f886 8022 	strb.w	r8, [r6, #34]	@ 0x22
c0de3a68:	f886 b005 	strb.w	fp, [r6, #5]
c0de3a6c:	75f1      	strb	r1, [r6, #23]
c0de3a6e:	7147      	strb	r7, [r0, #5]
c0de3a70:	2106      	movs	r1, #6
c0de3a72:	2038      	movs	r0, #56	@ 0x38
c0de3a74:	f886 7020 	strb.w	r7, [r6, #32]
c0de3a78:	77f7      	strb	r7, [r6, #31]
c0de3a7a:	7637      	strb	r7, [r6, #24]
c0de3a7c:	71f7      	strb	r7, [r6, #7]
c0de3a7e:	f886 a006 	strb.w	sl, [r6, #6]
c0de3a82:	75b1      	strb	r1, [r6, #22]
c0de3a84:	7130      	strb	r0, [r6, #4]
c0de3a86:	f002 ff03 	bl	c0de6890 <OUTLINED_FUNCTION_46>
c0de3a8a:	4631      	mov	r1, r6
c0de3a8c:	0e02      	lsrs	r2, r0, #24
c0de3a8e:	f886 b01c 	strb.w	fp, [r6, #28]
c0de3a92:	7777      	strb	r7, [r6, #29]
c0de3a94:	f801 0f25 	strb.w	r0, [r1, #37]!
c0de3a98:	70ca      	strb	r2, [r1, #3]
c0de3a9a:	0c02      	lsrs	r2, r0, #16
c0de3a9c:	0a00      	lsrs	r0, r0, #8
c0de3a9e:	f886 0026 	strb.w	r0, [r6, #38]	@ 0x26
c0de3aa2:	200c      	movs	r0, #12
c0de3aa4:	708a      	strb	r2, [r1, #2]
c0de3aa6:	f886 0023 	strb.w	r0, [r6, #35]	@ 0x23
c0de3aaa:	2009      	movs	r0, #9
c0de3aac:	f002 fe85 	bl	c0de67ba <OUTLINED_FUNCTION_33>
c0de3ab0:	6046      	str	r6, [r0, #4]
c0de3ab2:	e0d3      	b.n	c0de3c5c <nbgl_layoutAddUpFooter+0x5bc>
c0de3ab4:	0000701f 	.word	0x0000701f
c0de3ab8:	000085a7 	.word	0x000085a7
c0de3abc:	6868      	ldr	r0, [r5, #4]
c0de3abe:	2800      	cmp	r0, #0
c0de3ac0:	d05f      	beq.n	c0de3b82 <nbgl_layoutAddUpFooter+0x4e2>
c0de3ac2:	7b2a      	ldrb	r2, [r5, #12]
c0de3ac4:	7b6b      	ldrb	r3, [r5, #13]
c0de3ac6:	4620      	mov	r0, r4
c0de3ac8:	f7ff fb5a 	bl	c0de3180 <layoutAddCallbackObj>
c0de3acc:	2800      	cmp	r0, #0
c0de3ace:	d058      	beq.n	c0de3b82 <nbgl_layoutAddUpFooter+0x4e2>
c0de3ad0:	6960      	ldr	r0, [r4, #20]
c0de3ad2:	2103      	movs	r1, #3
c0de3ad4:	f04f 0a00 	mov.w	sl, #0
c0de3ad8:	2701      	movs	r7, #1
c0de3ada:	f04f 0804 	mov.w	r8, #4
c0de3ade:	f880 1020 	strb.w	r1, [r0, #32]
c0de3ae2:	2113      	movs	r1, #19
c0de3ae4:	f880 a01d 	strb.w	sl, [r0, #29]
c0de3ae8:	7707      	strb	r7, [r0, #28]
c0de3aea:	7781      	strb	r1, [r0, #30]
c0de3aec:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de3af0:	f002 fcd6 	bl	c0de64a0 <OUTLINED_FUNCTION_1>
c0de3af4:	f880 a01f 	strb.w	sl, [r0, #31]
c0de3af8:	4606      	mov	r6, r0
c0de3afa:	f002 fdf0 	bl	c0de66de <OUTLINED_FUNCTION_22>
c0de3afe:	22a0      	movs	r2, #160	@ 0xa0
c0de3b00:	4601      	mov	r1, r0
c0de3b02:	200b      	movs	r0, #11
c0de3b04:	f886 8020 	strb.w	r8, [r6, #32]
c0de3b08:	7177      	strb	r7, [r6, #5]
c0de3b0a:	7132      	strb	r2, [r6, #4]
c0de3b0c:	4632      	mov	r2, r6
c0de3b0e:	0e0b      	lsrs	r3, r1, #24
c0de3b10:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de3b14:	f802 1f26 	strb.w	r1, [r2, #38]!
c0de3b18:	70d3      	strb	r3, [r2, #3]
c0de3b1a:	0c0b      	lsrs	r3, r1, #16
c0de3b1c:	7093      	strb	r3, [r2, #2]
c0de3b1e:	0a0a      	lsrs	r2, r1, #8
c0de3b20:	f886 2027 	strb.w	r2, [r6, #39]	@ 0x27
c0de3b24:	f896 2024 	ldrb.w	r2, [r6, #36]	@ 0x24
c0de3b28:	f042 0301 	orr.w	r3, r2, #1
c0de3b2c:	f886 3024 	strb.w	r3, [r6, #36]	@ 0x24
c0de3b30:	68aa      	ldr	r2, [r5, #8]
c0de3b32:	b352      	cbz	r2, c0de3b8a <nbgl_layoutAddUpFooter+0x4ea>
c0de3b34:	4610      	mov	r0, r2
c0de3b36:	f006 fffd 	bl	c0deab34 <pic>
c0de3b3a:	4637      	mov	r7, r6
c0de3b3c:	4601      	mov	r1, r0
c0de3b3e:	f817 cf26 	ldrb.w	ip, [r7, #38]!
c0de3b42:	f817 ed22 	ldrb.w	lr, [r7, #-34]!
c0de3b46:	787a      	ldrb	r2, [r7, #1]
c0de3b48:	7fb8      	ldrb	r0, [r7, #30]
c0de3b4a:	f897 3020 	ldrb.w	r3, [r7, #32]
c0de3b4e:	f897 b023 	ldrb.w	fp, [r7, #35]	@ 0x23
c0de3b52:	ea4e 2e02 	orr.w	lr, lr, r2, lsl #8
c0de3b56:	780a      	ldrb	r2, [r1, #0]
c0de3b58:	7849      	ldrb	r1, [r1, #1]
c0de3b5a:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0de3b5e:	ebae 0101 	sub.w	r1, lr, r1
c0de3b62:	f1a1 0220 	sub.w	r2, r1, #32
c0de3b66:	0a11      	lsrs	r1, r2, #8
c0de3b68:	703a      	strb	r2, [r7, #0]
c0de3b6a:	7079      	strb	r1, [r7, #1]
c0de3b6c:	f897 1025 	ldrb.w	r1, [r7, #37]	@ 0x25
c0de3b70:	f897 7024 	ldrb.w	r7, [r7, #36]	@ 0x24
c0de3b74:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de3b78:	ea4c 270b 	orr.w	r7, ip, fp, lsl #8
c0de3b7c:	ea47 4101 	orr.w	r1, r7, r1, lsl #16
c0de3b80:	e005      	b.n	c0de3b8e <nbgl_layoutAddUpFooter+0x4ee>
c0de3b82:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de3b86:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de3b8a:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de3b8e:	b292      	uxth	r2, r2
c0de3b90:	f003 0301 	and.w	r3, r3, #1
c0de3b94:	f006 fe06 	bl	c0dea7a4 <nbgl_getTextHeightInWidth>
c0de3b98:	6961      	ldr	r1, [r4, #20]
c0de3b9a:	f002 ff04 	bl	c0de69a6 <OUTLINED_FUNCTION_71>
c0de3b9e:	f002 fe63 	bl	c0de6868 <OUTLINED_FUNCTION_44>
c0de3ba2:	2720      	movs	r7, #32
c0de3ba4:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de3ba8:	600e      	str	r6, [r1, #0]
c0de3baa:	75f7      	strb	r7, [r6, #23]
c0de3bac:	71b0      	strb	r0, [r6, #6]
c0de3bae:	0a01      	lsrs	r1, r0, #8
c0de3bb0:	6962      	ldr	r2, [r4, #20]
c0de3bb2:	71f1      	strb	r1, [r6, #7]
c0de3bb4:	71d1      	strb	r1, [r2, #7]
c0de3bb6:	7190      	strb	r0, [r2, #6]
c0de3bb8:	f002 fd8c 	bl	c0de66d4 <OUTLINED_FUNCTION_21>
c0de3bbc:	2102      	movs	r1, #2
c0de3bbe:	7581      	strb	r1, [r0, #22]
c0de3bc0:	6961      	ldr	r1, [r4, #20]
c0de3bc2:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de3bc6:	f002 fce9 	bl	c0de659c <OUTLINED_FUNCTION_9>
c0de3bca:	6048      	str	r0, [r1, #4]
c0de3bcc:	68a8      	ldr	r0, [r5, #8]
c0de3bce:	b3e0      	cbz	r0, c0de3c4a <nbgl_layoutAddUpFooter+0x5aa>
c0de3bd0:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de3bd4:	f002 fda8 	bl	c0de6728 <OUTLINED_FUNCTION_26>
c0de3bd8:	4606      	mov	r6, r0
c0de3bda:	2000      	movs	r0, #0
c0de3bdc:	7630      	strb	r0, [r6, #24]
c0de3bde:	77f0      	strb	r0, [r6, #31]
c0de3be0:	2006      	movs	r0, #6
c0de3be2:	75f7      	strb	r7, [r6, #23]
c0de3be4:	75b0      	strb	r0, [r6, #22]
c0de3be6:	f002 fe53 	bl	c0de6890 <OUTLINED_FUNCTION_46>
c0de3bea:	4631      	mov	r1, r6
c0de3bec:	0e02      	lsrs	r2, r0, #24
c0de3bee:	f801 0f21 	strb.w	r0, [r1, #33]!
c0de3bf2:	f002 fd46 	bl	c0de6682 <OUTLINED_FUNCTION_17>
c0de3bf6:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de3bfa:	6960      	ldr	r0, [r4, #20]
c0de3bfc:	f810 2f22 	ldrb.w	r2, [r0, #34]!
c0de3c00:	7843      	ldrb	r3, [r0, #1]
c0de3c02:	7887      	ldrb	r7, [r0, #2]
c0de3c04:	78c0      	ldrb	r0, [r0, #3]
c0de3c06:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de3c0a:	ea47 2000 	orr.w	r0, r7, r0, lsl #8
c0de3c0e:	ea42 4000 	orr.w	r0, r2, r0, lsl #16
c0de3c12:	6086      	str	r6, [r0, #8]
c0de3c14:	f896 0022 	ldrb.w	r0, [r6, #34]	@ 0x22
c0de3c18:	780a      	ldrb	r2, [r1, #0]
c0de3c1a:	788b      	ldrb	r3, [r1, #2]
c0de3c1c:	78c9      	ldrb	r1, [r1, #3]
c0de3c1e:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de3c22:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de3c26:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de3c2a:	7881      	ldrb	r1, [r0, #2]
c0de3c2c:	78c0      	ldrb	r0, [r0, #3]
c0de3c2e:	ea41 2100 	orr.w	r1, r1, r0, lsl #8
c0de3c32:	6960      	ldr	r0, [r4, #20]
c0de3c34:	7982      	ldrb	r2, [r0, #6]
c0de3c36:	79c3      	ldrb	r3, [r0, #7]
c0de3c38:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de3c3c:	428a      	cmp	r2, r1
c0de3c3e:	bf2f      	iteee	cs
c0de3c40:	4611      	movcs	r1, r2
c0de3c42:	7181      	strbcc	r1, [r0, #6]
c0de3c44:	0a0a      	lsrcc	r2, r1, #8
c0de3c46:	71c2      	strbcc	r2, [r0, #7]
c0de3c48:	e004      	b.n	c0de3c54 <nbgl_layoutAddUpFooter+0x5b4>
c0de3c4a:	6960      	ldr	r0, [r4, #20]
c0de3c4c:	7981      	ldrb	r1, [r0, #6]
c0de3c4e:	79c2      	ldrb	r2, [r0, #7]
c0de3c50:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de3c54:	3130      	adds	r1, #48	@ 0x30
c0de3c56:	7181      	strb	r1, [r0, #6]
c0de3c58:	0a09      	lsrs	r1, r1, #8
c0de3c5a:	71c1      	strb	r1, [r0, #7]
c0de3c5c:	f8d4 20a0 	ldr.w	r2, [r4, #160]	@ 0xa0
c0de3c60:	6961      	ldr	r1, [r4, #20]
c0de3c62:	68a0      	ldr	r0, [r4, #8]
c0de3c64:	f812 3f06 	ldrb.w	r3, [r2, #6]!
c0de3c68:	79cf      	ldrb	r7, [r1, #7]
c0de3c6a:	7856      	ldrb	r6, [r2, #1]
c0de3c6c:	ea43 2306 	orr.w	r3, r3, r6, lsl #8
c0de3c70:	798e      	ldrb	r6, [r1, #6]
c0de3c72:	ea46 2607 	orr.w	r6, r6, r7, lsl #8
c0de3c76:	1b9b      	subs	r3, r3, r6
c0de3c78:	7013      	strb	r3, [r2, #0]
c0de3c7a:	6101      	str	r1, [r0, #16]
c0de3c7c:	0a1b      	lsrs	r3, r3, #8
c0de3c7e:	6960      	ldr	r0, [r4, #20]
c0de3c80:	7053      	strb	r3, [r2, #1]
c0de3c82:	782a      	ldrb	r2, [r5, #0]
c0de3c84:	7981      	ldrb	r1, [r0, #6]
c0de3c86:	79c0      	ldrb	r0, [r0, #7]
c0de3c88:	f884 20ac 	strb.w	r2, [r4, #172]	@ 0xac
c0de3c8c:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de3c90:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de3c94 <nbgl_layoutAddSwipe>:
c0de3c94:	b3e8      	cbz	r0, c0de3d12 <nbgl_layoutAddSwipe+0x7e>
c0de3c96:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de3c9a:	f8dd 8020 	ldr.w	r8, [sp, #32]
c0de3c9e:	461c      	mov	r4, r3
c0de3ca0:	4617      	mov	r7, r2
c0de3ca2:	460d      	mov	r5, r1
c0de3ca4:	4606      	mov	r6, r0
c0de3ca6:	b352      	cbz	r2, c0de3cfe <nbgl_layoutAddSwipe+0x6a>
c0de3ca8:	2004      	movs	r0, #4
c0de3caa:	2100      	movs	r1, #0
c0de3cac:	f04f 0a00 	mov.w	sl, #0
c0de3cb0:	f006 fd5f 	bl	c0dea772 <nbgl_objPoolGet>
c0de3cb4:	61b0      	str	r0, [r6, #24]
c0de3cb6:	4638      	mov	r0, r7
c0de3cb8:	f006 ff3c 	bl	c0deab34 <pic>
c0de3cbc:	69b1      	ldr	r1, [r6, #24]
c0de3cbe:	0e02      	lsrs	r2, r0, #24
c0de3cc0:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de3cc4:	f002 fe0b 	bl	c0de68de <OUTLINED_FUNCTION_53>
c0de3cc8:	2001      	movs	r0, #1
c0de3cca:	22a0      	movs	r2, #160	@ 0xa0
c0de3ccc:	f801 2c22 	strb.w	r2, [r1, #-34]
c0de3cd0:	220b      	movs	r2, #11
c0de3cd2:	f801 0c21 	strb.w	r0, [r1, #-33]
c0de3cd6:	f801 0c07 	strb.w	r0, [r1, #-7]
c0de3cda:	200b      	movs	r0, #11
c0de3cdc:	f801 2c04 	strb.w	r2, [r1, #-4]
c0de3ce0:	f006 fd5b 	bl	c0dea79a <nbgl_getFontLineHeight>
c0de3ce4:	69b1      	ldr	r1, [r6, #24]
c0de3ce6:	7188      	strb	r0, [r1, #6]
c0de3ce8:	201e      	movs	r0, #30
c0de3cea:	f881 a007 	strb.w	sl, [r1, #7]
c0de3cee:	f881 a01a 	strb.w	sl, [r1, #26]
c0de3cf2:	7648      	strb	r0, [r1, #25]
c0de3cf4:	2005      	movs	r0, #5
c0de3cf6:	f881 0020 	strb.w	r0, [r1, #32]
c0de3cfa:	2008      	movs	r0, #8
c0de3cfc:	7588      	strb	r0, [r1, #22]
c0de3cfe:	4630      	mov	r0, r6
c0de3d00:	4629      	mov	r1, r5
c0de3d02:	2201      	movs	r2, #1
c0de3d04:	4623      	mov	r3, r4
c0de3d06:	f8cd 8000 	str.w	r8, [sp]
c0de3d0a:	f000 f804 	bl	c0de3d16 <addSwipeInternal>
c0de3d0e:	e8bd 85f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}
c0de3d12:	f002 bd8a 	b.w	c0de682a <OUTLINED_FUNCTION_40>

c0de3d16 <addSwipeInternal>:
c0de3d16:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de3d18:	f411 6ff0 	tst.w	r1, #1920	@ 0x780
c0de3d1c:	d013      	beq.n	c0de3d46 <addSwipeInternal+0x30>
c0de3d1e:	9f06      	ldr	r7, [sp, #24]
c0de3d20:	460c      	mov	r4, r1
c0de3d22:	f8d0 10a0 	ldr.w	r1, [r0, #160]	@ 0xa0
c0de3d26:	4615      	mov	r5, r2
c0de3d28:	461a      	mov	r2, r3
c0de3d2a:	4606      	mov	r6, r0
c0de3d2c:	463b      	mov	r3, r7
c0de3d2e:	f7ff fa27 	bl	c0de3180 <layoutAddCallbackObj>
c0de3d32:	b140      	cbz	r0, c0de3d46 <addSwipeInternal+0x30>
c0de3d34:	f8d6 00a0 	ldr.w	r0, [r6, #160]	@ 0xa0
c0de3d38:	0a21      	lsrs	r1, r4, #8
c0de3d3a:	f886 50b0 	strb.w	r5, [r6, #176]	@ 0xb0
c0de3d3e:	7741      	strb	r1, [r0, #29]
c0de3d40:	7704      	strb	r4, [r0, #28]
c0de3d42:	2000      	movs	r0, #0
c0de3d44:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0de3d46:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de3d4a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}

c0de3d4c <nbgl_layoutAddTopRightButton>:
c0de3d4c:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de3d50:	b3a8      	cbz	r0, c0de3dbe <nbgl_layoutAddTopRightButton+0x72>
c0de3d52:	f002 fdfc 	bl	c0de694e <OUTLINED_FUNCTION_64>
c0de3d56:	4688      	mov	r8, r1
c0de3d58:	461f      	mov	r7, r3
c0de3d5a:	4615      	mov	r5, r2
c0de3d5c:	f04f 0a05 	mov.w	sl, #5
c0de3d60:	f002 fc5c 	bl	c0de661c <OUTLINED_FUNCTION_13>
c0de3d64:	4606      	mov	r6, r0
c0de3d66:	4620      	mov	r0, r4
c0de3d68:	462a      	mov	r2, r5
c0de3d6a:	463b      	mov	r3, r7
c0de3d6c:	4631      	mov	r1, r6
c0de3d6e:	f7ff fa07 	bl	c0de3180 <layoutAddCallbackObj>
c0de3d72:	b320      	cbz	r0, c0de3dbe <nbgl_layoutAddTopRightButton+0x72>
c0de3d74:	2058      	movs	r0, #88	@ 0x58
c0de3d76:	2700      	movs	r7, #0
c0de3d78:	2503      	movs	r5, #3
c0de3d7a:	f886 a01e 	strb.w	sl, [r6, #30]
c0de3d7e:	71b0      	strb	r0, [r6, #6]
c0de3d80:	7130      	strb	r0, [r6, #4]
c0de3d82:	2020      	movs	r0, #32
c0de3d84:	71f7      	strb	r7, [r6, #7]
c0de3d86:	7177      	strb	r7, [r6, #5]
c0de3d88:	76b7      	strb	r7, [r6, #26]
c0de3d8a:	7637      	strb	r7, [r6, #24]
c0de3d8c:	7777      	strb	r7, [r6, #29]
c0de3d8e:	f886 7021 	strb.w	r7, [r6, #33]	@ 0x21
c0de3d92:	77f5      	strb	r5, [r6, #31]
c0de3d94:	7670      	strb	r0, [r6, #25]
c0de3d96:	75f0      	strb	r0, [r6, #23]
c0de3d98:	2001      	movs	r0, #1
c0de3d9a:	7730      	strb	r0, [r6, #28]
c0de3d9c:	2004      	movs	r0, #4
c0de3d9e:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de3da2:	2002      	movs	r0, #2
c0de3da4:	f886 0020 	strb.w	r0, [r6, #32]
c0de3da8:	4640      	mov	r0, r8
c0de3daa:	f006 fec3 	bl	c0deab34 <pic>
c0de3dae:	4631      	mov	r1, r6
c0de3db0:	0e02      	lsrs	r2, r0, #24
c0de3db2:	75b5      	strb	r5, [r6, #22]
c0de3db4:	f002 fcda 	bl	c0de676c <OUTLINED_FUNCTION_29>
c0de3db8:	68a0      	ldr	r0, [r4, #8]
c0de3dba:	6086      	str	r6, [r0, #8]
c0de3dbc:	e001      	b.n	c0de3dc2 <nbgl_layoutAddTopRightButton+0x76>
c0de3dbe:	f04f 37ff 	mov.w	r7, #4294967295	@ 0xffffffff
c0de3dc2:	4638      	mov	r0, r7
c0de3dc4:	e8bd 85f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}

c0de3dc8 <nbgl_layoutAddExtendedFooter>:
c0de3dc8:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de3dcc:	2800      	cmp	r0, #0
c0de3dce:	f000 834d 	beq.w	c0de446c <nbgl_layoutAddExtendedFooter+0x6a4>
c0de3dd2:	460d      	mov	r5, r1
c0de3dd4:	b119      	cbz	r1, c0de3dde <nbgl_layoutAddExtendedFooter+0x16>
c0de3dd6:	4604      	mov	r4, r0
c0de3dd8:	7828      	ldrb	r0, [r5, #0]
c0de3dda:	2806      	cmp	r0, #6
c0de3ddc:	d902      	bls.n	c0de3de4 <nbgl_layoutAddExtendedFooter+0x1c>
c0de3dde:	f06f 0701 	mvn.w	r7, #1
c0de3de2:	e345      	b.n	c0de4470 <nbgl_layoutAddExtendedFooter+0x6a8>
c0de3de4:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de3de8:	2601      	movs	r6, #1
c0de3dea:	f002 fc5b 	bl	c0de66a4 <OUTLINED_FUNCTION_19>
c0de3dee:	f002 fd6a 	bl	c0de68c6 <OUTLINED_FUNCTION_51>
c0de3df2:	6120      	str	r0, [r4, #16]
c0de3df4:	f002 fd88 	bl	c0de6908 <OUTLINED_FUNCTION_57>
c0de3df8:	4601      	mov	r1, r0
c0de3dfa:	0a02      	lsrs	r2, r0, #8
c0de3dfc:	6920      	ldr	r0, [r4, #16]
c0de3dfe:	0e0b      	lsrs	r3, r1, #24
c0de3e00:	f880 2023 	strb.w	r2, [r0, #35]	@ 0x23
c0de3e04:	2208      	movs	r2, #8
c0de3e06:	7582      	strb	r2, [r0, #22]
c0de3e08:	4602      	mov	r2, r0
c0de3e0a:	f802 1f22 	strb.w	r1, [r2, #34]!
c0de3e0e:	0c09      	lsrs	r1, r1, #16
c0de3e10:	7091      	strb	r1, [r2, #2]
c0de3e12:	70d3      	strb	r3, [r2, #3]
c0de3e14:	7829      	ldrb	r1, [r5, #0]
c0de3e16:	2906      	cmp	r1, #6
c0de3e18:	d017      	beq.n	c0de3e4a <nbgl_layoutAddExtendedFooter+0x82>
c0de3e1a:	2901      	cmp	r1, #1
c0de3e1c:	f000 80bd 	beq.w	c0de3f9a <nbgl_layoutAddExtendedFooter+0x1d2>
c0de3e20:	2902      	cmp	r1, #2
c0de3e22:	f000 80f6 	beq.w	c0de4012 <nbgl_layoutAddExtendedFooter+0x24a>
c0de3e26:	2903      	cmp	r1, #3
c0de3e28:	f000 8188 	beq.w	c0de413c <nbgl_layoutAddExtendedFooter+0x374>
c0de3e2c:	2904      	cmp	r1, #4
c0de3e2e:	f000 824c 	beq.w	c0de42ca <nbgl_layoutAddExtendedFooter+0x502>
c0de3e32:	2905      	cmp	r1, #5
c0de3e34:	f000 8268 	beq.w	c0de4308 <nbgl_layoutAddExtendedFooter+0x540>
c0de3e38:	2900      	cmp	r1, #0
c0de3e3a:	d1d0      	bne.n	c0de3dde <nbgl_layoutAddExtendedFooter+0x16>
c0de3e3c:	88a9      	ldrh	r1, [r5, #4]
c0de3e3e:	f04f 0800 	mov.w	r8, #0
c0de3e42:	7181      	strb	r1, [r0, #6]
c0de3e44:	0a09      	lsrs	r1, r1, #8
c0de3e46:	71c1      	strb	r1, [r0, #7]
c0de3e48:	e2de      	b.n	c0de4408 <nbgl_layoutAddExtendedFooter+0x640>
c0de3e4a:	68a8      	ldr	r0, [r5, #8]
c0de3e4c:	2800      	cmp	r0, #0
c0de3e4e:	f000 830d 	beq.w	c0de446c <nbgl_layoutAddExtendedFooter+0x6a4>
c0de3e52:	6868      	ldr	r0, [r5, #4]
c0de3e54:	2800      	cmp	r0, #0
c0de3e56:	f000 8309 	beq.w	c0de446c <nbgl_layoutAddExtendedFooter+0x6a4>
c0de3e5a:	f002 fb99 	bl	c0de6590 <OUTLINED_FUNCTION_8>
c0de3e5e:	4606      	mov	r6, r0
c0de3e60:	7c2a      	ldrb	r2, [r5, #16]
c0de3e62:	7cab      	ldrb	r3, [r5, #18]
c0de3e64:	f002 fbf4 	bl	c0de6650 <OUTLINED_FUNCTION_15>
c0de3e68:	2800      	cmp	r0, #0
c0de3e6a:	f000 82ff 	beq.w	c0de446c <nbgl_layoutAddExtendedFooter+0x6a4>
c0de3e6e:	2103      	movs	r1, #3
c0de3e70:	2208      	movs	r2, #8
c0de3e72:	f04f 0801 	mov.w	r8, #1
c0de3e76:	f04f 0a00 	mov.w	sl, #0
c0de3e7a:	23a0      	movs	r3, #160	@ 0xa0
c0de3e7c:	75b2      	strb	r2, [r6, #22]
c0de3e7e:	77f1      	strb	r1, [r6, #31]
c0de3e80:	f880 8005 	strb.w	r8, [r0, #5]
c0de3e84:	2258      	movs	r2, #88	@ 0x58
c0de3e86:	7c68      	ldrb	r0, [r5, #17]
c0de3e88:	71b2      	strb	r2, [r6, #6]
c0de3e8a:	2204      	movs	r2, #4
c0de3e8c:	f886 a01a 	strb.w	sl, [r6, #26]
c0de3e90:	f886 a021 	strb.w	sl, [r6, #33]	@ 0x21
c0de3e94:	f886 a007 	strb.w	sl, [r6, #7]
c0de3e98:	f886 8005 	strb.w	r8, [r6, #5]
c0de3e9c:	7133      	strb	r3, [r6, #4]
c0de3e9e:	f886 2022 	strb.w	r2, [r6, #34]	@ 0x22
c0de3ea2:	2803      	cmp	r0, #3
c0de3ea4:	bf08      	it	eq
c0de3ea6:	2102      	moveq	r1, #2
c0de3ea8:	f886 1020 	strb.w	r1, [r6, #32]
c0de3eac:	bf08      	it	eq
c0de3eae:	2218      	moveq	r2, #24
c0de3eb0:	7672      	strb	r2, [r6, #25]
c0de3eb2:	f002 fced 	bl	c0de6890 <OUTLINED_FUNCTION_46>
c0de3eb6:	f002 fd18 	bl	c0de68ea <OUTLINED_FUNCTION_54>
c0de3eba:	f002 fc69 	bl	c0de6790 <OUTLINED_FUNCTION_31>
c0de3ebe:	f002 fbb1 	bl	c0de6624 <OUTLINED_FUNCTION_14>
c0de3ec2:	200a      	movs	r0, #10
c0de3ec4:	77b0      	strb	r0, [r6, #30]
c0de3ec6:	6920      	ldr	r0, [r4, #16]
c0de3ec8:	f002 fae4 	bl	c0de6494 <OUTLINED_FUNCTION_0>
c0de3ecc:	7c68      	ldrb	r0, [r5, #17]
c0de3ece:	b308      	cbz	r0, c0de3f14 <nbgl_layoutAddExtendedFooter+0x14c>
c0de3ed0:	2803      	cmp	r0, #3
c0de3ed2:	d01f      	beq.n	c0de3f14 <nbgl_layoutAddExtendedFooter+0x14c>
c0de3ed4:	f002 fbfe 	bl	c0de66d4 <OUTLINED_FUNCTION_21>
c0de3ed8:	0a31      	lsrs	r1, r6, #8
c0de3eda:	0e32      	lsrs	r2, r6, #24
c0de3edc:	74c1      	strb	r1, [r0, #19]
c0de3ede:	4601      	mov	r1, r0
c0de3ee0:	f801 6f12 	strb.w	r6, [r1, #18]!
c0de3ee4:	70ca      	strb	r2, [r1, #3]
c0de3ee6:	0c32      	lsrs	r2, r6, #16
c0de3ee8:	708a      	strb	r2, [r1, #2]
c0de3eea:	6921      	ldr	r1, [r4, #16]
c0de3eec:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de3ef0:	784e      	ldrb	r6, [r1, #1]
c0de3ef2:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de3ef6:	788f      	ldrb	r7, [r1, #2]
c0de3ef8:	78c9      	ldrb	r1, [r1, #3]
c0de3efa:	ea42 2206 	orr.w	r2, r2, r6, lsl #8
c0de3efe:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de3f02:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de3f06:	f841 0023 	str.w	r0, [r1, r3, lsl #2]
c0de3f0a:	2102      	movs	r1, #2
c0de3f0c:	7581      	strb	r1, [r0, #22]
c0de3f0e:	6920      	ldr	r0, [r4, #16]
c0de3f10:	f002 fac0 	bl	c0de6494 <OUTLINED_FUNCTION_0>
c0de3f14:	f002 fb3c 	bl	c0de6590 <OUTLINED_FUNCTION_8>
c0de3f18:	4606      	mov	r6, r0
c0de3f1a:	7c2a      	ldrb	r2, [r5, #16]
c0de3f1c:	7cab      	ldrb	r3, [r5, #18]
c0de3f1e:	f002 fb97 	bl	c0de6650 <OUTLINED_FUNCTION_15>
c0de3f22:	2800      	cmp	r0, #0
c0de3f24:	f000 82a2 	beq.w	c0de446c <nbgl_layoutAddExtendedFooter+0x6a4>
c0de3f28:	2118      	movs	r1, #24
c0de3f2a:	f04f 0a00 	mov.w	sl, #0
c0de3f2e:	f04f 0801 	mov.w	r8, #1
c0de3f32:	7671      	strb	r1, [r6, #25]
c0de3f34:	2102      	movs	r1, #2
c0de3f36:	f886 a01a 	strb.w	sl, [r6, #26]
c0de3f3a:	f880 a005 	strb.w	sl, [r0, #5]
c0de3f3e:	75b1      	strb	r1, [r6, #22]
c0de3f40:	2104      	movs	r1, #4
c0de3f42:	7c68      	ldrb	r0, [r5, #17]
c0de3f44:	f886 1022 	strb.w	r1, [r6, #34]	@ 0x22
c0de3f48:	2158      	movs	r1, #88	@ 0x58
c0de3f4a:	f886 8005 	strb.w	r8, [r6, #5]
c0de3f4e:	f886 a007 	strb.w	sl, [r6, #7]
c0de3f52:	71b1      	strb	r1, [r6, #6]
c0de3f54:	21a0      	movs	r1, #160	@ 0xa0
c0de3f56:	7131      	strb	r1, [r6, #4]
c0de3f58:	2100      	movs	r1, #0
c0de3f5a:	2802      	cmp	r0, #2
c0de3f5c:	bf08      	it	eq
c0de3f5e:	2103      	moveq	r1, #3
c0de3f60:	77f1      	strb	r1, [r6, #31]
c0de3f62:	1e81      	subs	r1, r0, #2
c0de3f64:	bf18      	it	ne
c0de3f66:	2103      	movne	r1, #3
c0de3f68:	3802      	subs	r0, #2
c0de3f6a:	f886 1021 	strb.w	r1, [r6, #33]	@ 0x21
c0de3f6e:	fab0 f080 	clz	r0, r0
c0de3f72:	0940      	lsrs	r0, r0, #5
c0de3f74:	0040      	lsls	r0, r0, #1
c0de3f76:	f886 0020 	strb.w	r0, [r6, #32]
c0de3f7a:	f002 fbb0 	bl	c0de66de <OUTLINED_FUNCTION_22>
c0de3f7e:	4631      	mov	r1, r6
c0de3f80:	0e02      	lsrs	r2, r0, #24
c0de3f82:	f801 0f25 	strb.w	r0, [r1, #37]!
c0de3f86:	f002 fcaa 	bl	c0de68de <OUTLINED_FUNCTION_53>
c0de3f8a:	7c68      	ldrb	r0, [r5, #17]
c0de3f8c:	2800      	cmp	r0, #0
c0de3f8e:	f000 828e 	beq.w	c0de44ae <nbgl_layoutAddExtendedFooter+0x6e6>
c0de3f92:	68e8      	ldr	r0, [r5, #12]
c0de3f94:	f006 fdce 	bl	c0deab34 <pic>
c0de3f98:	e28a      	b.n	c0de44b0 <nbgl_layoutAddExtendedFooter+0x6e8>
c0de3f9a:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de3f9e:	f002 fa7f 	bl	c0de64a0 <OUTLINED_FUNCTION_1>
c0de3fa2:	4606      	mov	r6, r0
c0de3fa4:	7a6a      	ldrb	r2, [r5, #9]
c0de3fa6:	7aab      	ldrb	r3, [r5, #10]
c0de3fa8:	f002 fb52 	bl	c0de6650 <OUTLINED_FUNCTION_15>
c0de3fac:	2800      	cmp	r0, #0
c0de3fae:	f000 825d 	beq.w	c0de446c <nbgl_layoutAddExtendedFooter+0x6a4>
c0de3fb2:	2008      	movs	r0, #8
c0de3fb4:	4637      	mov	r7, r6
c0de3fb6:	f04f 0a01 	mov.w	sl, #1
c0de3fba:	21a0      	movs	r1, #160	@ 0xa0
c0de3fbc:	f04f 0800 	mov.w	r8, #0
c0de3fc0:	75b0      	strb	r0, [r6, #22]
c0de3fc2:	7a28      	ldrb	r0, [r5, #8]
c0de3fc4:	f886 a005 	strb.w	sl, [r6, #5]
c0de3fc8:	7131      	strb	r1, [r6, #4]
c0de3fca:	77f0      	strb	r0, [r6, #31]
c0de3fcc:	2060      	movs	r0, #96	@ 0x60
c0de3fce:	f807 0f06 	strb.w	r0, [r7, #6]!
c0de3fd2:	f887 8001 	strb.w	r8, [r7, #1]
c0de3fd6:	f002 fb82 	bl	c0de66de <OUTLINED_FUNCTION_22>
c0de3fda:	4631      	mov	r1, r6
c0de3fdc:	0e02      	lsrs	r2, r0, #24
c0de3fde:	f002 fb06 	bl	c0de65ee <OUTLINED_FUNCTION_12>
c0de3fe2:	7a29      	ldrb	r1, [r5, #8]
c0de3fe4:	f886 801d 	strb.w	r8, [r6, #29]
c0de3fe8:	f886 a01e 	strb.w	sl, [r6, #30]
c0de3fec:	f840 602c 	str.w	r6, [r0, ip, lsl #2]
c0de3ff0:	2005      	movs	r0, #5
c0de3ff2:	f886 a01c 	strb.w	sl, [r6, #28]
c0de3ff6:	f886 0020 	strb.w	r0, [r6, #32]
c0de3ffa:	200b      	movs	r0, #11
c0de3ffc:	2900      	cmp	r1, #0
c0de3ffe:	bf08      	it	eq
c0de4000:	200c      	moveq	r0, #12
c0de4002:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de4006:	6922      	ldr	r2, [r4, #16]
c0de4008:	7879      	ldrb	r1, [r7, #1]
c0de400a:	7838      	ldrb	r0, [r7, #0]
c0de400c:	f002 fc88 	bl	c0de6920 <OUTLINED_FUNCTION_59>
c0de4010:	e1fa      	b.n	c0de4408 <nbgl_layoutAddExtendedFooter+0x640>
c0de4012:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4016:	f002 fa43 	bl	c0de64a0 <OUTLINED_FUNCTION_1>
c0de401a:	4606      	mov	r6, r0
c0de401c:	7b2a      	ldrb	r2, [r5, #12]
c0de401e:	7bab      	ldrb	r3, [r5, #14]
c0de4020:	f002 fb16 	bl	c0de6650 <OUTLINED_FUNCTION_15>
c0de4024:	2800      	cmp	r0, #0
c0de4026:	f000 8221 	beq.w	c0de446c <nbgl_layoutAddExtendedFooter+0x6a4>
c0de402a:	2007      	movs	r0, #7
c0de402c:	f04f 0a00 	mov.w	sl, #0
c0de4030:	f04f 08d0 	mov.w	r8, #208	@ 0xd0
c0de4034:	75b0      	strb	r0, [r6, #22]
c0de4036:	2060      	movs	r0, #96	@ 0x60
c0de4038:	f886 a01f 	strb.w	sl, [r6, #31]
c0de403c:	f886 a007 	strb.w	sl, [r6, #7]
c0de4040:	f886 a005 	strb.w	sl, [r6, #5]
c0de4044:	f886 8004 	strb.w	r8, [r6, #4]
c0de4048:	71b0      	strb	r0, [r6, #6]
c0de404a:	f002 fb48 	bl	c0de66de <OUTLINED_FUNCTION_22>
c0de404e:	4631      	mov	r1, r6
c0de4050:	0e02      	lsrs	r2, r0, #24
c0de4052:	f04f 0b01 	mov.w	fp, #1
c0de4056:	f886 a01d 	strb.w	sl, [r6, #29]
c0de405a:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de405e:	f886 b01e 	strb.w	fp, [r6, #30]
c0de4062:	f002 fb74 	bl	c0de674e <OUTLINED_FUNCTION_28>
c0de4066:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de406a:	ea47 2000 	orr.w	r0, r7, r0, lsl #8
c0de406e:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de4072:	f840 6022 	str.w	r6, [r0, r2, lsl #2]
c0de4076:	f002 fbdb 	bl	c0de6830 <OUTLINED_FUNCTION_41>
c0de407a:	f886 0020 	strb.w	r0, [r6, #32]
c0de407e:	6920      	ldr	r0, [r4, #16]
c0de4080:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de4084:	3101      	adds	r1, #1
c0de4086:	f880 1020 	strb.w	r1, [r0, #32]
c0de408a:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de408e:	f002 fa07 	bl	c0de64a0 <OUTLINED_FUNCTION_1>
c0de4092:	4606      	mov	r6, r0
c0de4094:	7b6a      	ldrb	r2, [r5, #13]
c0de4096:	7bab      	ldrb	r3, [r5, #14]
c0de4098:	f002 fada 	bl	c0de6650 <OUTLINED_FUNCTION_15>
c0de409c:	f04f 37ff 	mov.w	r7, #4294967295	@ 0xffffffff
c0de40a0:	2800      	cmp	r0, #0
c0de40a2:	f000 81e5 	beq.w	c0de4470 <nbgl_layoutAddExtendedFooter+0x6a8>
c0de40a6:	2009      	movs	r0, #9
c0de40a8:	f886 8004 	strb.w	r8, [r6, #4]
c0de40ac:	46b0      	mov	r8, r6
c0de40ae:	f886 a01f 	strb.w	sl, [r6, #31]
c0de40b2:	f886 a005 	strb.w	sl, [r6, #5]
c0de40b6:	75b0      	strb	r0, [r6, #22]
c0de40b8:	2060      	movs	r0, #96	@ 0x60
c0de40ba:	f808 0f06 	strb.w	r0, [r8, #6]!
c0de40be:	f888 a001 	strb.w	sl, [r8, #1]
c0de40c2:	f002 fbe5 	bl	c0de6890 <OUTLINED_FUNCTION_46>
c0de40c6:	f002 fc10 	bl	c0de68ea <OUTLINED_FUNCTION_54>
c0de40ca:	f002 fa90 	bl	c0de65ee <OUTLINED_FUNCTION_12>
c0de40ce:	f898 1001 	ldrb.w	r1, [r8, #1]
c0de40d2:	f840 602c 	str.w	r6, [r0, ip, lsl #2]
c0de40d6:	f002 fbab 	bl	c0de6830 <OUTLINED_FUNCTION_41>
c0de40da:	6922      	ldr	r2, [r4, #16]
c0de40dc:	f886 0020 	strb.w	r0, [r6, #32]
c0de40e0:	2003      	movs	r0, #3
c0de40e2:	77b0      	strb	r0, [r6, #30]
c0de40e4:	f898 0000 	ldrb.w	r0, [r8]
c0de40e8:	f002 fc1a 	bl	c0de6920 <OUTLINED_FUNCTION_59>
c0de40ec:	f002 fc12 	bl	c0de6914 <OUTLINED_FUNCTION_58>
c0de40f0:	4680      	mov	r8, r0
c0de40f2:	f880 a005 	strb.w	sl, [r0, #5]
c0de40f6:	f880 b004 	strb.w	fp, [r0, #4]
c0de40fa:	20ff      	movs	r0, #255	@ 0xff
c0de40fc:	0e31      	lsrs	r1, r6, #24
c0de40fe:	f888 0018 	strb.w	r0, [r8, #24]
c0de4102:	0a30      	lsrs	r0, r6, #8
c0de4104:	f888 7017 	strb.w	r7, [r8, #23]
c0de4108:	f888 b021 	strb.w	fp, [r8, #33]	@ 0x21
c0de410c:	f888 a01f 	strb.w	sl, [r8, #31]
c0de4110:	f888 0013 	strb.w	r0, [r8, #19]
c0de4114:	2002      	movs	r0, #2
c0de4116:	f888 0020 	strb.w	r0, [r8, #32]
c0de411a:	2004      	movs	r0, #4
c0de411c:	f888 0016 	strb.w	r0, [r8, #22]
c0de4120:	4640      	mov	r0, r8
c0de4122:	f800 6f12 	strb.w	r6, [r0, #18]!
c0de4126:	70c1      	strb	r1, [r0, #3]
c0de4128:	0c31      	lsrs	r1, r6, #16
c0de412a:	7081      	strb	r1, [r0, #2]
c0de412c:	6920      	ldr	r0, [r4, #16]
c0de412e:	7981      	ldrb	r1, [r0, #6]
c0de4130:	79c0      	ldrb	r0, [r0, #7]
c0de4132:	f888 0007 	strb.w	r0, [r8, #7]
c0de4136:	f888 1006 	strb.w	r1, [r8, #6]
c0de413a:	e165      	b.n	c0de4408 <nbgl_layoutAddExtendedFooter+0x640>
c0de413c:	f04f 0b00 	mov.w	fp, #0
c0de4140:	2760      	movs	r7, #96	@ 0x60
c0de4142:	f880 b007 	strb.w	fp, [r0, #7]
c0de4146:	7187      	strb	r7, [r0, #6]
c0de4148:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de414c:	f002 f9a8 	bl	c0de64a0 <OUTLINED_FUNCTION_1>
c0de4150:	4606      	mov	r6, r0
c0de4152:	7d2a      	ldrb	r2, [r5, #20]
c0de4154:	7d6b      	ldrb	r3, [r5, #21]
c0de4156:	f002 fa7b 	bl	c0de6650 <OUTLINED_FUNCTION_15>
c0de415a:	2800      	cmp	r0, #0
c0de415c:	f000 8186 	beq.w	c0de446c <nbgl_layoutAddExtendedFooter+0x6a4>
c0de4160:	1d28      	adds	r0, r5, #4
c0de4162:	46b0      	mov	r8, r6
c0de4164:	f886 b01f 	strb.w	fp, [r6, #31]
c0de4168:	f886 b007 	strb.w	fp, [r6, #7]
c0de416c:	71b7      	strb	r7, [r6, #6]
c0de416e:	9001      	str	r0, [sp, #4]
c0de4170:	2007      	movs	r0, #7
c0de4172:	75b0      	strb	r0, [r6, #22]
c0de4174:	20c0      	movs	r0, #192	@ 0xc0
c0de4176:	f808 0f04 	strb.w	r0, [r8, #4]!
c0de417a:	f888 b001 	strb.w	fp, [r8, #1]
c0de417e:	6928      	ldr	r0, [r5, #16]
c0de4180:	f006 fcd8 	bl	c0deab34 <pic>
c0de4184:	4631      	mov	r1, r6
c0de4186:	0e02      	lsrs	r2, r0, #24
c0de4188:	f886 b01d 	strb.w	fp, [r6, #29]
c0de418c:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de4190:	f002 fadd 	bl	c0de674e <OUTLINED_FUNCTION_28>
c0de4194:	ea47 2000 	orr.w	r0, r7, r0, lsl #8
c0de4198:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de419c:	2701      	movs	r7, #1
c0de419e:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de41a2:	77b7      	strb	r7, [r6, #30]
c0de41a4:	f840 6022 	str.w	r6, [r0, r2, lsl #2]
c0de41a8:	200c      	movs	r0, #12
c0de41aa:	7737      	strb	r7, [r6, #28]
c0de41ac:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de41b0:	2005      	movs	r0, #5
c0de41b2:	f886 0020 	strb.w	r0, [r6, #32]
c0de41b6:	6920      	ldr	r0, [r4, #16]
c0de41b8:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de41bc:	3101      	adds	r1, #1
c0de41be:	f880 1020 	strb.w	r1, [r0, #32]
c0de41c2:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de41c6:	f002 fa6d 	bl	c0de66a4 <OUTLINED_FUNCTION_19>
c0de41ca:	4682      	mov	sl, r0
c0de41cc:	2004      	movs	r0, #4
c0de41ce:	f88a 0020 	strb.w	r0, [sl, #32]
c0de41d2:	20a0      	movs	r0, #160	@ 0xa0
c0de41d4:	4656      	mov	r6, sl
c0de41d6:	f88a b01f 	strb.w	fp, [sl, #31]
c0de41da:	f806 0f04 	strb.w	r0, [r6, #4]!
c0de41de:	7077      	strb	r7, [r6, #1]
c0de41e0:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de41e4:	f002 fb8c 	bl	c0de6900 <OUTLINED_FUNCTION_56>
c0de41e8:	2109      	movs	r1, #9
c0de41ea:	0e02      	lsrs	r2, r0, #24
c0de41ec:	f88a b007 	strb.w	fp, [sl, #7]
c0de41f0:	f88a 1016 	strb.w	r1, [sl, #22]
c0de41f4:	2160      	movs	r1, #96	@ 0x60
c0de41f6:	f88a 1006 	strb.w	r1, [sl, #6]
c0de41fa:	4651      	mov	r1, sl
c0de41fc:	f801 0f22 	strb.w	r0, [r1, #34]!
c0de4200:	f002 fa3f 	bl	c0de6682 <OUTLINED_FUNCTION_17>
c0de4204:	f88a 0023 	strb.w	r0, [sl, #35]	@ 0x23
c0de4208:	f898 0000 	ldrb.w	r0, [r8]
c0de420c:	f898 1001 	ldrb.w	r1, [r8, #1]
c0de4210:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de4214:	9901      	ldr	r1, [sp, #4]
c0de4216:	f5c0 70f0 	rsb	r0, r0, #480	@ 0x1e0
c0de421a:	7030      	strb	r0, [r6, #0]
c0de421c:	0a00      	lsrs	r0, r0, #8
c0de421e:	7070      	strb	r0, [r6, #1]
c0de4220:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de4224:	08c2      	lsrs	r2, r0, #3
c0de4226:	4650      	mov	r0, sl
c0de4228:	f002 fc50 	bl	c0de6acc <layoutNavigationPopulate>
c0de422c:	792a      	ldrb	r2, [r5, #4]
c0de422e:	7b2b      	ldrb	r3, [r5, #12]
c0de4230:	4620      	mov	r0, r4
c0de4232:	4651      	mov	r1, sl
c0de4234:	f7fe ffa4 	bl	c0de3180 <layoutAddCallbackObj>
c0de4238:	f04f 37ff 	mov.w	r7, #4294967295	@ 0xffffffff
c0de423c:	2800      	cmp	r0, #0
c0de423e:	f000 8117 	beq.w	c0de4470 <nbgl_layoutAddExtendedFooter+0x6a8>
c0de4242:	f002 fb67 	bl	c0de6914 <OUTLINED_FUNCTION_58>
c0de4246:	4680      	mov	r8, r0
c0de4248:	2002      	movs	r0, #2
c0de424a:	2101      	movs	r1, #1
c0de424c:	f888 0020 	strb.w	r0, [r8, #32]
c0de4250:	2000      	movs	r0, #0
c0de4252:	f888 1004 	strb.w	r1, [r8, #4]
c0de4256:	f888 1021 	strb.w	r1, [r8, #33]	@ 0x21
c0de425a:	ea4f 611a 	mov.w	r1, sl, lsr #24
c0de425e:	f888 7017 	strb.w	r7, [r8, #23]
c0de4262:	f888 0005 	strb.w	r0, [r8, #5]
c0de4266:	f888 001f 	strb.w	r0, [r8, #31]
c0de426a:	2004      	movs	r0, #4
c0de426c:	f888 0016 	strb.w	r0, [r8, #22]
c0de4270:	20ff      	movs	r0, #255	@ 0xff
c0de4272:	f888 0018 	strb.w	r0, [r8, #24]
c0de4276:	ea4f 201a 	mov.w	r0, sl, lsr #8
c0de427a:	f888 0013 	strb.w	r0, [r8, #19]
c0de427e:	4640      	mov	r0, r8
c0de4280:	f800 af12 	strb.w	sl, [r0, #18]!
c0de4284:	70c1      	strb	r1, [r0, #3]
c0de4286:	ea4f 411a 	mov.w	r1, sl, lsr #16
c0de428a:	7081      	strb	r1, [r0, #2]
c0de428c:	6920      	ldr	r0, [r4, #16]
c0de428e:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de4292:	f810 3c1b 	ldrb.w	r3, [r0, #-27]
c0de4296:	f810 2c1c 	ldrb.w	r2, [r0, #-28]
c0de429a:	7847      	ldrb	r7, [r0, #1]
c0de429c:	f810 6c02 	ldrb.w	r6, [r0, #-2]
c0de42a0:	f888 3007 	strb.w	r3, [r8, #7]
c0de42a4:	f888 2006 	strb.w	r2, [r8, #6]
c0de42a8:	ea41 2107 	orr.w	r1, r1, r7, lsl #8
c0de42ac:	79aa      	ldrb	r2, [r5, #6]
c0de42ae:	f884 20a9 	strb.w	r2, [r4, #169]	@ 0xa9
c0de42b2:	78c2      	ldrb	r2, [r0, #3]
c0de42b4:	7880      	ldrb	r0, [r0, #2]
c0de42b6:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de42ba:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de42be:	7969      	ldrb	r1, [r5, #5]
c0de42c0:	f840 a026 	str.w	sl, [r0, r6, lsl #2]
c0de42c4:	f884 10a8 	strb.w	r1, [r4, #168]	@ 0xa8
c0de42c8:	e09b      	b.n	c0de4402 <nbgl_layoutAddExtendedFooter+0x63a>
c0de42ca:	2100      	movs	r1, #0
c0de42cc:	71c1      	strb	r1, [r0, #7]
c0de42ce:	2160      	movs	r1, #96	@ 0x60
c0de42d0:	7181      	strb	r1, [r0, #6]
c0de42d2:	1d29      	adds	r1, r5, #4
c0de42d4:	f894 20ad 	ldrb.w	r2, [r4, #173]	@ 0xad
c0de42d8:	08d2      	lsrs	r2, r2, #3
c0de42da:	f002 fbf7 	bl	c0de6acc <layoutNavigationPopulate>
c0de42de:	6921      	ldr	r1, [r4, #16]
c0de42e0:	2004      	movs	r0, #4
c0de42e2:	f881 0020 	strb.w	r0, [r1, #32]
c0de42e6:	4620      	mov	r0, r4
c0de42e8:	792a      	ldrb	r2, [r5, #4]
c0de42ea:	7b2b      	ldrb	r3, [r5, #12]
c0de42ec:	f7fe ff48 	bl	c0de3180 <layoutAddCallbackObj>
c0de42f0:	2800      	cmp	r0, #0
c0de42f2:	f000 80bb 	beq.w	c0de446c <nbgl_layoutAddExtendedFooter+0x6a4>
c0de42f6:	79a8      	ldrb	r0, [r5, #6]
c0de42f8:	f04f 0800 	mov.w	r8, #0
c0de42fc:	f884 00a9 	strb.w	r0, [r4, #169]	@ 0xa9
c0de4300:	7968      	ldrb	r0, [r5, #5]
c0de4302:	f884 00a8 	strb.w	r0, [r4, #168]	@ 0xa8
c0de4306:	e07f      	b.n	c0de4408 <nbgl_layoutAddExtendedFooter+0x640>
c0de4308:	f002 f942 	bl	c0de6590 <OUTLINED_FUNCTION_8>
c0de430c:	4607      	mov	r7, r0
c0de430e:	7b2a      	ldrb	r2, [r5, #12]
c0de4310:	7c2b      	ldrb	r3, [r5, #16]
c0de4312:	4620      	mov	r0, r4
c0de4314:	4639      	mov	r1, r7
c0de4316:	f7fe ff33 	bl	c0de3180 <layoutAddCallbackObj>
c0de431a:	2800      	cmp	r0, #0
c0de431c:	f000 80a6 	beq.w	c0de446c <nbgl_layoutAddExtendedFooter+0x6a4>
c0de4320:	2018      	movs	r0, #24
c0de4322:	f04f 0800 	mov.w	r8, #0
c0de4326:	2100      	movs	r1, #0
c0de4328:	7678      	strb	r0, [r7, #25]
c0de432a:	2008      	movs	r0, #8
c0de432c:	f887 801a 	strb.w	r8, [r7, #26]
c0de4330:	75b8      	strb	r0, [r7, #22]
c0de4332:	7b68      	ldrb	r0, [r5, #13]
c0de4334:	2800      	cmp	r0, #0
c0de4336:	bf08      	it	eq
c0de4338:	2103      	moveq	r1, #3
c0de433a:	f887 1021 	strb.w	r1, [r7, #33]	@ 0x21
c0de433e:	bf18      	it	ne
c0de4340:	2003      	movne	r0, #3
c0de4342:	77f8      	strb	r0, [r7, #31]
c0de4344:	7b68      	ldrb	r0, [r5, #13]
c0de4346:	4601      	mov	r1, r0
c0de4348:	2800      	cmp	r0, #0
c0de434a:	bf18      	it	ne
c0de434c:	2101      	movne	r1, #1
c0de434e:	0049      	lsls	r1, r1, #1
c0de4350:	2802      	cmp	r0, #2
c0de4352:	bf08      	it	eq
c0de4354:	2103      	moveq	r1, #3
c0de4356:	f887 1020 	strb.w	r1, [r7, #32]
c0de435a:	f002 f9c0 	bl	c0de66de <OUTLINED_FUNCTION_22>
c0de435e:	463e      	mov	r6, r7
c0de4360:	210c      	movs	r1, #12
c0de4362:	f887 1023 	strb.w	r1, [r7, #35]	@ 0x23
c0de4366:	f806 0f25 	strb.w	r0, [r6, #37]!
c0de436a:	0e01      	lsrs	r1, r0, #24
c0de436c:	70f1      	strb	r1, [r6, #3]
c0de436e:	0c01      	lsrs	r1, r0, #16
c0de4370:	0a00      	lsrs	r0, r0, #8
c0de4372:	70b1      	strb	r1, [r6, #2]
c0de4374:	f887 0026 	strb.w	r0, [r7, #38]	@ 0x26
c0de4378:	f002 fa8a 	bl	c0de6890 <OUTLINED_FUNCTION_46>
c0de437c:	2104      	movs	r1, #4
c0de437e:	0e02      	lsrs	r2, r0, #24
c0de4380:	f887 8007 	strb.w	r8, [r7, #7]
c0de4384:	f887 1022 	strb.w	r1, [r7, #34]	@ 0x22
c0de4388:	2158      	movs	r1, #88	@ 0x58
c0de438a:	71b9      	strb	r1, [r7, #6]
c0de438c:	4639      	mov	r1, r7
c0de438e:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de4392:	f002 f976 	bl	c0de6682 <OUTLINED_FUNCTION_17>
c0de4396:	f887 002f 	strb.w	r0, [r7, #47]	@ 0x2f
c0de439a:	2188      	movs	r1, #136	@ 0x88
c0de439c:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de43a0:	6920      	ldr	r0, [r4, #16]
c0de43a2:	f880 8007 	strb.w	r8, [r0, #7]
c0de43a6:	7181      	strb	r1, [r0, #6]
c0de43a8:	6869      	ldr	r1, [r5, #4]
c0de43aa:	2900      	cmp	r1, #0
c0de43ac:	bf08      	it	eq
c0de43ae:	2258      	moveq	r2, #88	@ 0x58
c0de43b0:	713a      	strb	r2, [r7, #4]
c0de43b2:	f896 c000 	ldrb.w	ip, [r6]
c0de43b6:	f896 e002 	ldrb.w	lr, [r6, #2]
c0de43ba:	f896 a003 	ldrb.w	sl, [r6, #3]
c0de43be:	f887 801d 	strb.w	r8, [r7, #29]
c0de43c2:	0a11      	lsrs	r1, r2, #8
c0de43c4:	7179      	strb	r1, [r7, #5]
c0de43c6:	f810 6f22 	ldrb.w	r6, [r0, #34]!
c0de43ca:	7842      	ldrb	r2, [r0, #1]
c0de43cc:	f810 1c02 	ldrb.w	r1, [r0, #-2]
c0de43d0:	7883      	ldrb	r3, [r0, #2]
c0de43d2:	78c0      	ldrb	r0, [r0, #3]
c0de43d4:	ea46 2202 	orr.w	r2, r6, r2, lsl #8
c0de43d8:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de43dc:	ea42 4000 	orr.w	r0, r2, r0, lsl #16
c0de43e0:	f897 2026 	ldrb.w	r2, [r7, #38]	@ 0x26
c0de43e4:	f840 7021 	str.w	r7, [r0, r1, lsl #2]
c0de43e8:	2001      	movs	r0, #1
c0de43ea:	ea4e 210a 	orr.w	r1, lr, sl, lsl #8
c0de43ee:	7738      	strb	r0, [r7, #28]
c0de43f0:	ea4c 2002 	orr.w	r0, ip, r2, lsl #8
c0de43f4:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de43f8:	2107      	movs	r1, #7
c0de43fa:	2800      	cmp	r0, #0
c0de43fc:	bf08      	it	eq
c0de43fe:	2101      	moveq	r1, #1
c0de4400:	77b9      	strb	r1, [r7, #30]
c0de4402:	6920      	ldr	r0, [r4, #16]
c0de4404:	f002 f846 	bl	c0de6494 <OUTLINED_FUNCTION_0>
c0de4408:	7828      	ldrb	r0, [r5, #0]
c0de440a:	3803      	subs	r0, #3
c0de440c:	2801      	cmp	r0, #1
c0de440e:	d808      	bhi.n	c0de4422 <nbgl_layoutAddExtendedFooter+0x65a>
c0de4410:	7b28      	ldrb	r0, [r5, #12]
c0de4412:	792b      	ldrb	r3, [r5, #4]
c0de4414:	f44f 61c0 	mov.w	r1, #1536	@ 0x600
c0de4418:	2200      	movs	r2, #0
c0de441a:	9000      	str	r0, [sp, #0]
c0de441c:	4620      	mov	r0, r4
c0de441e:	f7ff fc7a 	bl	c0de3d16 <addSwipeInternal>
c0de4422:	7868      	ldrb	r0, [r5, #1]
c0de4424:	b1b0      	cbz	r0, c0de4454 <nbgl_layoutAddExtendedFooter+0x68c>
c0de4426:	f002 f955 	bl	c0de66d4 <OUTLINED_FUNCTION_21>
c0de442a:	6921      	ldr	r1, [r4, #16]
c0de442c:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de4430:	784e      	ldrb	r6, [r1, #1]
c0de4432:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de4436:	788f      	ldrb	r7, [r1, #2]
c0de4438:	78c9      	ldrb	r1, [r1, #3]
c0de443a:	ea42 2206 	orr.w	r2, r2, r6, lsl #8
c0de443e:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de4442:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de4446:	f841 0023 	str.w	r0, [r1, r3, lsl #2]
c0de444a:	2102      	movs	r1, #2
c0de444c:	7581      	strb	r1, [r0, #22]
c0de444e:	6920      	ldr	r0, [r4, #16]
c0de4450:	f002 f820 	bl	c0de6494 <OUTLINED_FUNCTION_0>
c0de4454:	f1b8 0f00 	cmp.w	r8, #0
c0de4458:	d00d      	beq.n	c0de4476 <nbgl_layoutAddExtendedFooter+0x6ae>
c0de445a:	6920      	ldr	r0, [r4, #16]
c0de445c:	f002 f874 	bl	c0de6548 <OUTLINED_FUNCTION_6>
c0de4460:	f840 8022 	str.w	r8, [r0, r2, lsl #2]
c0de4464:	6920      	ldr	r0, [r4, #16]
c0de4466:	f002 f815 	bl	c0de6494 <OUTLINED_FUNCTION_0>
c0de446a:	e005      	b.n	c0de4478 <nbgl_layoutAddExtendedFooter+0x6b0>
c0de446c:	f04f 37ff 	mov.w	r7, #4294967295	@ 0xffffffff
c0de4470:	4638      	mov	r0, r7
c0de4472:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de4476:	6920      	ldr	r0, [r4, #16]
c0de4478:	68a1      	ldr	r1, [r4, #8]
c0de447a:	60c8      	str	r0, [r1, #12]
c0de447c:	6920      	ldr	r0, [r4, #16]
c0de447e:	f8d4 10a0 	ldr.w	r1, [r4, #160]	@ 0xa0
c0de4482:	f810 2f06 	ldrb.w	r2, [r0, #6]!
c0de4486:	7843      	ldrb	r3, [r0, #1]
c0de4488:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de448c:	f811 3f06 	ldrb.w	r3, [r1, #6]!
c0de4490:	784e      	ldrb	r6, [r1, #1]
c0de4492:	ea43 2306 	orr.w	r3, r3, r6, lsl #8
c0de4496:	1a9a      	subs	r2, r3, r2
c0de4498:	700a      	strb	r2, [r1, #0]
c0de449a:	0a12      	lsrs	r2, r2, #8
c0de449c:	704a      	strb	r2, [r1, #1]
c0de449e:	7829      	ldrb	r1, [r5, #0]
c0de44a0:	f884 10ab 	strb.w	r1, [r4, #171]	@ 0xab
c0de44a4:	7801      	ldrb	r1, [r0, #0]
c0de44a6:	7840      	ldrb	r0, [r0, #1]
c0de44a8:	ea41 2700 	orr.w	r7, r1, r0, lsl #8
c0de44ac:	e7e0      	b.n	c0de4470 <nbgl_layoutAddExtendedFooter+0x6a8>
c0de44ae:	2000      	movs	r0, #0
c0de44b0:	f002 fa1b 	bl	c0de68ea <OUTLINED_FUNCTION_54>
c0de44b4:	f002 f95a 	bl	c0de676c <OUTLINED_FUNCTION_29>
c0de44b8:	f002 f8b4 	bl	c0de6624 <OUTLINED_FUNCTION_14>
c0de44bc:	2009      	movs	r0, #9
c0de44be:	77b0      	strb	r0, [r6, #30]
c0de44c0:	6920      	ldr	r0, [r4, #16]
c0de44c2:	f001 ffe7 	bl	c0de6494 <OUTLINED_FUNCTION_0>
c0de44c6:	7c69      	ldrb	r1, [r5, #17]
c0de44c8:	2903      	cmp	r1, #3
c0de44ca:	d004      	beq.n	c0de44d6 <nbgl_layoutAddExtendedFooter+0x70e>
c0de44cc:	b919      	cbnz	r1, c0de44d6 <nbgl_layoutAddExtendedFooter+0x70e>
c0de44ce:	f04f 0800 	mov.w	r8, #0
c0de44d2:	21d0      	movs	r1, #208	@ 0xd0
c0de44d4:	e002      	b.n	c0de44dc <nbgl_layoutAddExtendedFooter+0x714>
c0de44d6:	f04f 0800 	mov.w	r8, #0
c0de44da:	21e8      	movs	r1, #232	@ 0xe8
c0de44dc:	f880 8007 	strb.w	r8, [r0, #7]
c0de44e0:	7181      	strb	r1, [r0, #6]
c0de44e2:	e791      	b.n	c0de4408 <nbgl_layoutAddExtendedFooter+0x640>

c0de44e4 <nbgl_layoutAddBottomButton>:
c0de44e4:	b570      	push	{r4, r5, r6, lr}
c0de44e6:	b086      	sub	sp, #24
c0de44e8:	4605      	mov	r5, r0
c0de44ea:	2005      	movs	r0, #5
c0de44ec:	2600      	movs	r6, #0
c0de44ee:	4614      	mov	r4, r2
c0de44f0:	f88d 3001 	strb.w	r3, [sp, #1]
c0de44f4:	f88d 0000 	strb.w	r0, [sp]
c0de44f8:	4608      	mov	r0, r1
c0de44fa:	f88d 600e 	strb.w	r6, [sp, #14]
c0de44fe:	f006 fb19 	bl	c0deab34 <pic>
c0de4502:	9002      	str	r0, [sp, #8]
c0de4504:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de4506:	4669      	mov	r1, sp
c0de4508:	f88d 400c 	strb.w	r4, [sp, #12]
c0de450c:	9601      	str	r6, [sp, #4]
c0de450e:	f88d 0010 	strb.w	r0, [sp, #16]
c0de4512:	2001      	movs	r0, #1
c0de4514:	f88d 000d 	strb.w	r0, [sp, #13]
c0de4518:	4628      	mov	r0, r5
c0de451a:	f7ff fc55 	bl	c0de3dc8 <nbgl_layoutAddExtendedFooter>
c0de451e:	b006      	add	sp, #24
c0de4520:	bd70      	pop	{r4, r5, r6, pc}

c0de4522 <nbgl_layoutAddTouchableBar>:
c0de4522:	b5b0      	push	{r4, r5, r7, lr}
c0de4524:	b088      	sub	sp, #32
c0de4526:	460d      	mov	r5, r1
c0de4528:	4604      	mov	r4, r0
c0de452a:	a801      	add	r0, sp, #4
c0de452c:	211c      	movs	r1, #28
c0de452e:	f006 fd23 	bl	c0deaf78 <__aeabi_memclr>
c0de4532:	b1dc      	cbz	r4, c0de456c <nbgl_layoutAddTouchableBar+0x4a>
c0de4534:	e895 000f 	ldmia.w	r5, {r0, r1, r2, r3}
c0de4538:	e9cd 1304 	strd	r1, r3, [sp, #16]
c0de453c:	e9cd 0202 	strd	r0, r2, [sp, #8]
c0de4540:	7c68      	ldrb	r0, [r5, #17]
c0de4542:	f88d 0018 	strb.w	r0, [sp, #24]
c0de4546:	7d28      	ldrb	r0, [r5, #20]
c0de4548:	f88d 001c 	strb.w	r0, [sp, #28]
c0de454c:	7c28      	ldrb	r0, [r5, #16]
c0de454e:	f88d 001a 	strb.w	r0, [sp, #26]
c0de4552:	7ca8      	ldrb	r0, [r5, #18]
c0de4554:	f080 0001 	eor.w	r0, r0, #1
c0de4558:	f88d 0019 	strb.w	r0, [sp, #25]
c0de455c:	a901      	add	r1, sp, #4
c0de455e:	4620      	mov	r0, r4
c0de4560:	f000 f808 	bl	c0de4574 <addListItem>
c0de4564:	b110      	cbz	r0, c0de456c <nbgl_layoutAddTouchableBar+0x4a>
c0de4566:	f002 f94f 	bl	c0de6808 <OUTLINED_FUNCTION_36>
c0de456a:	e001      	b.n	c0de4570 <nbgl_layoutAddTouchableBar+0x4e>
c0de456c:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de4570:	b008      	add	sp, #32
c0de4572:	bdb0      	pop	{r4, r5, r7, pc}

c0de4574 <addListItem>:
c0de4574:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de4578:	4680      	mov	r8, r0
c0de457a:	7808      	ldrb	r0, [r1, #0]
c0de457c:	468a      	mov	sl, r1
c0de457e:	b108      	cbz	r0, c0de4584 <addListItem+0x10>
c0de4580:	2600      	movs	r6, #0
c0de4582:	e005      	b.n	c0de4590 <addListItem+0x1c>
c0de4584:	f89a 0015 	ldrb.w	r0, [sl, #21]
c0de4588:	fab0 f080 	clz	r0, r0
c0de458c:	0940      	lsrs	r0, r0, #5
c0de458e:	0046      	lsls	r6, r0, #1
c0de4590:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de4594:	2401      	movs	r4, #1
c0de4596:	f002 f885 	bl	c0de66a4 <OUTLINED_FUNCTION_19>
c0de459a:	4683      	mov	fp, r0
c0de459c:	f89a 2014 	ldrb.w	r2, [sl, #20]
c0de45a0:	f89a 3018 	ldrb.w	r3, [sl, #24]
c0de45a4:	4640      	mov	r0, r8
c0de45a6:	4659      	mov	r1, fp
c0de45a8:	f7fe fdea 	bl	c0de3180 <layoutAddCallbackObj>
c0de45ac:	2700      	movs	r7, #0
c0de45ae:	2800      	cmp	r0, #0
c0de45b0:	f000 8088 	beq.w	c0de46c4 <addListItem+0x150>
c0de45b4:	f89a 1017 	ldrb.w	r1, [sl, #23]
c0de45b8:	7141      	strb	r1, [r0, #5]
c0de45ba:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de45be:	f002 f99f 	bl	c0de6900 <OUTLINED_FUNCTION_56>
c0de45c2:	4659      	mov	r1, fp
c0de45c4:	0e02      	lsrs	r2, r0, #24
c0de45c6:	2364      	movs	r3, #100	@ 0x64
c0de45c8:	f801 0f22 	strb.w	r0, [r1, #34]!
c0de45cc:	f801 7d10 	strb.w	r7, [r1, #-16]!
c0de45d0:	74ca      	strb	r2, [r1, #19]
c0de45d2:	0c02      	lsrs	r2, r0, #16
c0de45d4:	0a00      	lsrs	r0, r0, #8
c0de45d6:	f801 4c0d 	strb.w	r4, [r1, #-13]
c0de45da:	f801 7c0b 	strb.w	r7, [r1, #-11]
c0de45de:	7448      	strb	r0, [r1, #17]
c0de45e0:	20a0      	movs	r0, #160	@ 0xa0
c0de45e2:	748a      	strb	r2, [r1, #18]
c0de45e4:	f801 0c0e 	strb.w	r0, [r1, #-14]
c0de45e8:	f89a 2016 	ldrb.w	r2, [sl, #22]
c0de45ec:	f89a 0000 	ldrb.w	r0, [sl]
c0de45f0:	2a00      	cmp	r2, #0
c0de45f2:	bf08      	it	eq
c0de45f4:	235c      	moveq	r3, #92	@ 0x5c
c0de45f6:	f801 3c0c 	strb.w	r3, [r1, #-12]
c0de45fa:	718f      	strb	r7, [r1, #6]
c0de45fc:	70cf      	strb	r7, [r1, #3]
c0de45fe:	708f      	strb	r7, [r1, #2]
c0de4600:	704f      	strb	r7, [r1, #1]
c0de4602:	738f      	strb	r7, [r1, #14]
c0de4604:	734c      	strb	r4, [r1, #13]
c0de4606:	710f      	strb	r7, [r1, #4]
c0de4608:	2220      	movs	r2, #32
c0de460a:	2801      	cmp	r0, #1
c0de460c:	714a      	strb	r2, [r1, #5]
c0de460e:	d004      	beq.n	c0de461a <addListItem+0xa6>
c0de4610:	b9a0      	cbnz	r0, c0de463c <addListItem+0xc8>
c0de4612:	f89a 0015 	ldrb.w	r0, [sl, #21]
c0de4616:	2801      	cmp	r0, #1
c0de4618:	d110      	bne.n	c0de463c <addListItem+0xc8>
c0de461a:	f8df 040c 	ldr.w	r0, [pc, #1036]	@ c0de4a28 <addListItem+0x4b4>
c0de461e:	f819 1000 	ldrb.w	r1, [r9, r0]
c0de4622:	1c4a      	adds	r2, r1, #1
c0de4624:	f809 2000 	strb.w	r2, [r9, r0]
c0de4628:	2000      	movs	r0, #0
c0de462a:	f88b 001d 	strb.w	r0, [fp, #29]
c0de462e:	2001      	movs	r0, #1
c0de4630:	f88b 001c 	strb.w	r0, [fp, #28]
c0de4634:	f101 0014 	add.w	r0, r1, #20
c0de4638:	f88b 001e 	strb.w	r0, [fp, #30]
c0de463c:	f8da 000c 	ldr.w	r0, [sl, #12]
c0de4640:	2400      	movs	r4, #0
c0de4642:	2800      	cmp	r0, #0
c0de4644:	d041      	beq.n	c0de46ca <addListItem+0x156>
c0de4646:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de464a:	f001 ff29 	bl	c0de64a0 <OUTLINED_FUNCTION_1>
c0de464e:	4607      	mov	r7, r0
c0de4650:	77c6      	strb	r6, [r0, #31]
c0de4652:	f8da 000c 	ldr.w	r0, [sl, #12]
c0de4656:	f006 fa6d 	bl	c0deab34 <pic>
c0de465a:	f897 1024 	ldrb.w	r1, [r7, #36]	@ 0x24
c0de465e:	0e02      	lsrs	r2, r0, #24
c0de4660:	f887 402d 	strb.w	r4, [r7, #45]	@ 0x2d
c0de4664:	f041 0101 	orr.w	r1, r1, #1
c0de4668:	f887 1024 	strb.w	r1, [r7, #36]	@ 0x24
c0de466c:	210c      	movs	r1, #12
c0de466e:	f887 1022 	strb.w	r1, [r7, #34]	@ 0x22
c0de4672:	4639      	mov	r1, r7
c0de4674:	f801 4f2c 	strb.w	r4, [r1, #44]!
c0de4678:	70cc      	strb	r4, [r1, #3]
c0de467a:	708c      	strb	r4, [r1, #2]
c0de467c:	4639      	mov	r1, r7
c0de467e:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de4682:	f001 fffe 	bl	c0de6682 <OUTLINED_FUNCTION_17>
c0de4686:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de468a:	f89b 1004 	ldrb.w	r1, [fp, #4]
c0de468e:	f89b 2005 	ldrb.w	r2, [fp, #5]
c0de4692:	7139      	strb	r1, [r7, #4]
c0de4694:	717a      	strb	r2, [r7, #5]
c0de4696:	f8da 0004 	ldr.w	r0, [sl, #4]
c0de469a:	b1c0      	cbz	r0, c0de46ce <addListItem+0x15a>
c0de469c:	f006 fa4a 	bl	c0deab34 <pic>
c0de46a0:	4639      	mov	r1, r7
c0de46a2:	f811 2f04 	ldrb.w	r2, [r1, #4]!
c0de46a6:	784b      	ldrb	r3, [r1, #1]
c0de46a8:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de46ac:	7803      	ldrb	r3, [r0, #0]
c0de46ae:	7840      	ldrb	r0, [r0, #1]
c0de46b0:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de46b4:	f64f 73f0 	movw	r3, #65520	@ 0xfff0
c0de46b8:	1a18      	subs	r0, r3, r0
c0de46ba:	4402      	add	r2, r0
c0de46bc:	0a10      	lsrs	r0, r2, #8
c0de46be:	700a      	strb	r2, [r1, #0]
c0de46c0:	7048      	strb	r0, [r1, #1]
c0de46c2:	e006      	b.n	c0de46d2 <addListItem+0x15e>
c0de46c4:	f04f 0b00 	mov.w	fp, #0
c0de46c8:	e1ab      	b.n	c0de4a22 <addListItem+0x4ae>
c0de46ca:	2700      	movs	r7, #0
c0de46cc:	e074      	b.n	c0de47b8 <addListItem+0x244>
c0de46ce:	ea41 2202 	orr.w	r2, r1, r2, lsl #8
c0de46d2:	f8da 0008 	ldr.w	r0, [sl, #8]
c0de46d6:	9601      	str	r6, [sp, #4]
c0de46d8:	b130      	cbz	r0, c0de46e8 <addListItem+0x174>
c0de46da:	f006 fa2b 	bl	c0deab34 <pic>
c0de46de:	7939      	ldrb	r1, [r7, #4]
c0de46e0:	797a      	ldrb	r2, [r7, #5]
c0de46e2:	ea41 2202 	orr.w	r2, r1, r2, lsl #8
c0de46e6:	e005      	b.n	c0de46f4 <addListItem+0x180>
c0de46e8:	f89a 0000 	ldrb.w	r0, [sl]
c0de46ec:	2801      	cmp	r0, #1
c0de46ee:	d107      	bne.n	c0de4700 <addListItem+0x18c>
c0de46f0:	48ce      	ldr	r0, [pc, #824]	@ (c0de4a2c <addListItem+0x4b8>)
c0de46f2:	4478      	add	r0, pc
c0de46f4:	f002 f91c 	bl	c0de6930 <OUTLINED_FUNCTION_60>
c0de46f8:	4402      	add	r2, r0
c0de46fa:	0a10      	lsrs	r0, r2, #8
c0de46fc:	713a      	strb	r2, [r7, #4]
c0de46fe:	7178      	strb	r0, [r7, #5]
c0de4700:	4639      	mov	r1, r7
c0de4702:	b292      	uxth	r2, r2
c0de4704:	f811 3f26 	ldrb.w	r3, [r1, #38]!
c0de4708:	784e      	ldrb	r6, [r1, #1]
c0de470a:	78cc      	ldrb	r4, [r1, #3]
c0de470c:	f811 0c04 	ldrb.w	r0, [r1, #-4]
c0de4710:	f811 5c02 	ldrb.w	r5, [r1, #-2]
c0de4714:	7889      	ldrb	r1, [r1, #2]
c0de4716:	ea41 2104 	orr.w	r1, r1, r4, lsl #8
c0de471a:	ea43 2306 	orr.w	r3, r3, r6, lsl #8
c0de471e:	ea43 4101 	orr.w	r1, r3, r1, lsl #16
c0de4722:	f002 f90d 	bl	c0de6940 <OUTLINED_FUNCTION_61>
c0de4726:	2828      	cmp	r0, #40	@ 0x28
c0de4728:	d201      	bcs.n	c0de472e <addListItem+0x1ba>
c0de472a:	2028      	movs	r0, #40	@ 0x28
c0de472c:	e017      	b.n	c0de475e <addListItem+0x1ea>
c0de472e:	463a      	mov	r2, r7
c0de4730:	f812 0f26 	ldrb.w	r0, [r2, #38]!
c0de4734:	78d1      	ldrb	r1, [r2, #3]
c0de4736:	7893      	ldrb	r3, [r2, #2]
c0de4738:	f812 4c21 	ldrb.w	r4, [r2, #-33]
c0de473c:	f812 5c02 	ldrb.w	r5, [r2, #-2]
c0de4740:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de4744:	7853      	ldrb	r3, [r2, #1]
c0de4746:	ea40 2003 	orr.w	r0, r0, r3, lsl #8
c0de474a:	f812 3c22 	ldrb.w	r3, [r2, #-34]
c0de474e:	ea40 4101 	orr.w	r1, r0, r1, lsl #16
c0de4752:	f812 0c04 	ldrb.w	r0, [r2, #-4]
c0de4756:	ea43 2204 	orr.w	r2, r3, r4, lsl #8
c0de475a:	f002 f8f1 	bl	c0de6940 <OUTLINED_FUNCTION_61>
c0de475e:	4659      	mov	r1, fp
c0de4760:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de4764:	784c      	ldrb	r4, [r1, #1]
c0de4766:	788d      	ldrb	r5, [r1, #2]
c0de4768:	78ce      	ldrb	r6, [r1, #3]
c0de476a:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de476e:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de4772:	ea45 2406 	orr.w	r4, r5, r6, lsl #8
c0de4776:	ea42 4204 	orr.w	r2, r2, r4, lsl #16
c0de477a:	f842 7023 	str.w	r7, [r2, r3, lsl #2]
c0de477e:	2200      	movs	r2, #0
c0de4780:	71b8      	strb	r0, [r7, #6]
c0de4782:	f887 2021 	strb.w	r2, [r7, #33]	@ 0x21
c0de4786:	2201      	movs	r2, #1
c0de4788:	75ba      	strb	r2, [r7, #22]
c0de478a:	2204      	movs	r2, #4
c0de478c:	f887 2020 	strb.w	r2, [r7, #32]
c0de4790:	0a02      	lsrs	r2, r0, #8
c0de4792:	71fa      	strb	r2, [r7, #7]
c0de4794:	1c5a      	adds	r2, r3, #1
c0de4796:	f801 2c02 	strb.w	r2, [r1, #-2]
c0de479a:	f89a 1016 	ldrb.w	r1, [sl, #22]
c0de479e:	221e      	movs	r2, #30
c0de47a0:	2900      	cmp	r1, #0
c0de47a2:	bf08      	it	eq
c0de47a4:	221a      	moveq	r2, #26
c0de47a6:	3828      	subs	r0, #40	@ 0x28
c0de47a8:	b280      	uxth	r0, r0
c0de47aa:	bf88      	it	hi
c0de47ac:	eba2 0250 	subhi.w	r2, r2, r0, lsr #1
c0de47b0:	9e01      	ldr	r6, [sp, #4]
c0de47b2:	767a      	strb	r2, [r7, #25]
c0de47b4:	0a10      	lsrs	r0, r2, #8
c0de47b6:	76b8      	strb	r0, [r7, #26]
c0de47b8:	f8da 0004 	ldr.w	r0, [sl, #4]
c0de47bc:	2800      	cmp	r0, #0
c0de47be:	d046      	beq.n	c0de484e <addListItem+0x2da>
c0de47c0:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de47c4:	f001 ffb0 	bl	c0de6728 <OUTLINED_FUNCTION_26>
c0de47c8:	4604      	mov	r4, r0
c0de47ca:	77c6      	strb	r6, [r0, #31]
c0de47cc:	f8da 0004 	ldr.w	r0, [sl, #4]
c0de47d0:	f006 f9b0 	bl	c0deab34 <pic>
c0de47d4:	0a39      	lsrs	r1, r7, #8
c0de47d6:	0e02      	lsrs	r2, r0, #24
c0de47d8:	4635      	mov	r5, r6
c0de47da:	74e1      	strb	r1, [r4, #19]
c0de47dc:	4621      	mov	r1, r4
c0de47de:	f801 0f21 	strb.w	r0, [r1, #33]!
c0de47e2:	70ca      	strb	r2, [r1, #3]
c0de47e4:	0c02      	lsrs	r2, r0, #16
c0de47e6:	0a00      	lsrs	r0, r0, #8
c0de47e8:	f884 0022 	strb.w	r0, [r4, #34]	@ 0x22
c0de47ec:	4620      	mov	r0, r4
c0de47ee:	708a      	strb	r2, [r1, #2]
c0de47f0:	0e39      	lsrs	r1, r7, #24
c0de47f2:	f800 7f12 	strb.w	r7, [r0, #18]!
c0de47f6:	70c1      	strb	r1, [r0, #3]
c0de47f8:	0c39      	lsrs	r1, r7, #16
c0de47fa:	7081      	strb	r1, [r0, #2]
c0de47fc:	4658      	mov	r0, fp
c0de47fe:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de4802:	7843      	ldrb	r3, [r0, #1]
c0de4804:	f890 c002 	ldrb.w	ip, [r0, #2]
c0de4808:	78c6      	ldrb	r6, [r0, #3]
c0de480a:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de480e:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de4812:	ea4c 2306 	orr.w	r3, ip, r6, lsl #8
c0de4816:	462e      	mov	r6, r5
c0de4818:	ea41 4103 	orr.w	r1, r1, r3, lsl #16
c0de481c:	f002 f8db 	bl	c0de69d6 <OUTLINED_FUNCTION_75>
c0de4820:	2104      	movs	r1, #4
c0de4822:	75a1      	strb	r1, [r4, #22]
c0de4824:	1c51      	adds	r1, r2, #1
c0de4826:	f800 1c02 	strb.w	r1, [r0, #-2]
c0de482a:	b187      	cbz	r7, c0de484e <addListItem+0x2da>
c0de482c:	f814 0f21 	ldrb.w	r0, [r4, #33]!
c0de4830:	7861      	ldrb	r1, [r4, #1]
c0de4832:	78a2      	ldrb	r2, [r4, #2]
c0de4834:	78e3      	ldrb	r3, [r4, #3]
c0de4836:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de483a:	f001 ffea 	bl	c0de6812 <OUTLINED_FUNCTION_37>
c0de483e:	7801      	ldrb	r1, [r0, #0]
c0de4840:	7840      	ldrb	r0, [r0, #1]
c0de4842:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de4846:	3010      	adds	r0, #16
c0de4848:	75f8      	strb	r0, [r7, #23]
c0de484a:	0a00      	lsrs	r0, r0, #8
c0de484c:	7638      	strb	r0, [r7, #24]
c0de484e:	f8da 0008 	ldr.w	r0, [sl, #8]
c0de4852:	b190      	cbz	r0, c0de487a <addListItem+0x306>
c0de4854:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de4858:	f001 ff66 	bl	c0de6728 <OUTLINED_FUNCTION_26>
c0de485c:	4604      	mov	r4, r0
c0de485e:	77c6      	strb	r6, [r0, #31]
c0de4860:	f8da 0008 	ldr.w	r0, [sl, #8]
c0de4864:	f006 f966 	bl	c0deab34 <pic>
c0de4868:	4621      	mov	r1, r4
c0de486a:	0e02      	lsrs	r2, r0, #24
c0de486c:	f801 0f21 	strb.w	r0, [r1, #33]!
c0de4870:	f001 ff07 	bl	c0de6682 <OUTLINED_FUNCTION_17>
c0de4874:	f884 0022 	strb.w	r0, [r4, #34]	@ 0x22
c0de4878:	e013      	b.n	c0de48a2 <addListItem+0x32e>
c0de487a:	f89a 0000 	ldrb.w	r0, [sl]
c0de487e:	2801      	cmp	r0, #1
c0de4880:	d12d      	bne.n	c0de48de <addListItem+0x36a>
c0de4882:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de4886:	08c1      	lsrs	r1, r0, #3
c0de4888:	2006      	movs	r0, #6
c0de488a:	f005 ff72 	bl	c0dea772 <nbgl_objPoolGet>
c0de488e:	4604      	mov	r4, r0
c0de4890:	2002      	movs	r0, #2
c0de4892:	f884 0020 	strb.w	r0, [r4, #32]
c0de4896:	2000      	movs	r0, #0
c0de4898:	77e0      	strb	r0, [r4, #31]
c0de489a:	f89a 0015 	ldrb.w	r0, [sl, #21]
c0de489e:	f884 0021 	strb.w	r0, [r4, #33]	@ 0x21
c0de48a2:	2006      	movs	r0, #6
c0de48a4:	0e39      	lsrs	r1, r7, #24
c0de48a6:	75a0      	strb	r0, [r4, #22]
c0de48a8:	4620      	mov	r0, r4
c0de48aa:	f800 7f12 	strb.w	r7, [r0, #18]!
c0de48ae:	70c1      	strb	r1, [r0, #3]
c0de48b0:	0c39      	lsrs	r1, r7, #16
c0de48b2:	7081      	strb	r1, [r0, #2]
c0de48b4:	0a38      	lsrs	r0, r7, #8
c0de48b6:	74e0      	strb	r0, [r4, #19]
c0de48b8:	4658      	mov	r0, fp
c0de48ba:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de48be:	7842      	ldrb	r2, [r0, #1]
c0de48c0:	7883      	ldrb	r3, [r0, #2]
c0de48c2:	78c5      	ldrb	r5, [r0, #3]
c0de48c4:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de48c8:	ea43 2205 	orr.w	r2, r3, r5, lsl #8
c0de48cc:	ea41 4102 	orr.w	r1, r1, r2, lsl #16
c0de48d0:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de48d4:	f002 f87f 	bl	c0de69d6 <OUTLINED_FUNCTION_75>
c0de48d8:	1c51      	adds	r1, r2, #1
c0de48da:	f800 1c02 	strb.w	r1, [r0, #-2]
c0de48de:	f8da 0010 	ldr.w	r0, [sl, #16]
c0de48e2:	2800      	cmp	r0, #0
c0de48e4:	f000 8088 	beq.w	c0de49f8 <addListItem+0x484>
c0de48e8:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de48ec:	2504      	movs	r5, #4
c0de48ee:	f001 fdd7 	bl	c0de64a0 <OUTLINED_FUNCTION_1>
c0de48f2:	4604      	mov	r4, r0
c0de48f4:	77c6      	strb	r6, [r0, #31]
c0de48f6:	f8da 0010 	ldr.w	r0, [sl, #16]
c0de48fa:	f006 f91b 	bl	c0deab34 <pic>
c0de48fe:	4601      	mov	r1, r0
c0de4900:	4622      	mov	r2, r4
c0de4902:	f894 0024 	ldrb.w	r0, [r4, #36]	@ 0x24
c0de4906:	f884 5020 	strb.w	r5, [r4, #32]
c0de490a:	f802 1f26 	strb.w	r1, [r2, #38]!
c0de490e:	0e0b      	lsrs	r3, r1, #24
c0de4910:	70d3      	strb	r3, [r2, #3]
c0de4912:	0c0b      	lsrs	r3, r1, #16
c0de4914:	f040 0001 	orr.w	r0, r0, #1
c0de4918:	7093      	strb	r3, [r2, #2]
c0de491a:	0a0a      	lsrs	r2, r1, #8
c0de491c:	f884 0024 	strb.w	r0, [r4, #36]	@ 0x24
c0de4920:	200b      	movs	r0, #11
c0de4922:	f884 2027 	strb.w	r2, [r4, #39]	@ 0x27
c0de4926:	f884 0022 	strb.w	r0, [r4, #34]	@ 0x22
c0de492a:	2000      	movs	r0, #0
c0de492c:	f8da 200c 	ldr.w	r2, [sl, #12]
c0de4930:	f884 0021 	strb.w	r0, [r4, #33]	@ 0x21
c0de4934:	b15a      	cbz	r2, c0de494e <addListItem+0x3da>
c0de4936:	4620      	mov	r0, r4
c0de4938:	0e3a      	lsrs	r2, r7, #24
c0de493a:	f800 7f12 	strb.w	r7, [r0, #18]!
c0de493e:	70c2      	strb	r2, [r0, #3]
c0de4940:	0c3a      	lsrs	r2, r7, #16
c0de4942:	7082      	strb	r2, [r0, #2]
c0de4944:	0a3a      	lsrs	r2, r7, #8
c0de4946:	7042      	strb	r2, [r0, #1]
c0de4948:	200c      	movs	r0, #12
c0de494a:	2207      	movs	r2, #7
c0de494c:	e005      	b.n	c0de495a <addListItem+0x3e6>
c0de494e:	f88b 0007 	strb.w	r0, [fp, #7]
c0de4952:	201c      	movs	r0, #28
c0de4954:	2201      	movs	r2, #1
c0de4956:	f88b 0006 	strb.w	r0, [fp, #6]
c0de495a:	2300      	movs	r3, #0
c0de495c:	7660      	strb	r0, [r4, #25]
c0de495e:	75a2      	strb	r2, [r4, #22]
c0de4960:	76a3      	strb	r3, [r4, #26]
c0de4962:	f8da 0004 	ldr.w	r0, [sl, #4]
c0de4966:	b1b8      	cbz	r0, c0de4998 <addListItem+0x424>
c0de4968:	f006 f8e4 	bl	c0deab34 <pic>
c0de496c:	f001 ffe0 	bl	c0de6930 <OUTLINED_FUNCTION_60>
c0de4970:	4621      	mov	r1, r4
c0de4972:	f811 2f26 	ldrb.w	r2, [r1, #38]!
c0de4976:	f801 0c0f 	strb.w	r0, [r1, #-15]
c0de497a:	0a00      	lsrs	r0, r0, #8
c0de497c:	784b      	ldrb	r3, [r1, #1]
c0de497e:	788d      	ldrb	r5, [r1, #2]
c0de4980:	f801 0c0e 	strb.w	r0, [r1, #-14]
c0de4984:	f811 0c04 	ldrb.w	r0, [r1, #-4]
c0de4988:	78c9      	ldrb	r1, [r1, #3]
c0de498a:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de498e:	ea45 2101 	orr.w	r1, r5, r1, lsl #8
c0de4992:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de4996:	e000      	b.n	c0de499a <addListItem+0x426>
c0de4998:	200b      	movs	r0, #11
c0de499a:	f89b 3005 	ldrb.w	r3, [fp, #5]
c0de499e:	f89b 2004 	ldrb.w	r2, [fp, #4]
c0de49a2:	f894 5024 	ldrb.w	r5, [r4, #36]	@ 0x24
c0de49a6:	7122      	strb	r2, [r4, #4]
c0de49a8:	7163      	strb	r3, [r4, #5]
c0de49aa:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de49ae:	f001 ffc7 	bl	c0de6940 <OUTLINED_FUNCTION_61>
c0de49b2:	4659      	mov	r1, fp
c0de49b4:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de49b8:	f811 cd1c 	ldrb.w	ip, [r1, #-28]!
c0de49bc:	7f4b      	ldrb	r3, [r1, #29]
c0de49be:	7fcd      	ldrb	r5, [r1, #31]
c0de49c0:	7f8e      	ldrb	r6, [r1, #30]
c0de49c2:	7e8f      	ldrb	r7, [r1, #26]
c0de49c4:	f891 e001 	ldrb.w	lr, [r1, #1]
c0de49c8:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de49cc:	ea46 2505 	orr.w	r5, r6, r5, lsl #8
c0de49d0:	7ea3      	ldrb	r3, [r4, #26]
c0de49d2:	ea42 4205 	orr.w	r2, r2, r5, lsl #16
c0de49d6:	f842 4027 	str.w	r4, [r2, r7, lsl #2]
c0de49da:	0a02      	lsrs	r2, r0, #8
c0de49dc:	71a0      	strb	r0, [r4, #6]
c0de49de:	71e2      	strb	r2, [r4, #7]
c0de49e0:	1c7a      	adds	r2, r7, #1
c0de49e2:	768a      	strb	r2, [r1, #26]
c0de49e4:	7e62      	ldrb	r2, [r4, #25]
c0de49e6:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de49ea:	4410      	add	r0, r2
c0de49ec:	ea4c 220e 	orr.w	r2, ip, lr, lsl #8
c0de49f0:	4410      	add	r0, r2
c0de49f2:	7008      	strb	r0, [r1, #0]
c0de49f4:	0a00      	lsrs	r0, r0, #8
c0de49f6:	7048      	strb	r0, [r1, #1]
c0de49f8:	f8d8 00a0 	ldr.w	r0, [r8, #160]	@ 0xa0
c0de49fc:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de4a00:	7843      	ldrb	r3, [r0, #1]
c0de4a02:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de4a06:	7884      	ldrb	r4, [r0, #2]
c0de4a08:	78c0      	ldrb	r0, [r0, #3]
c0de4a0a:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de4a0e:	ea44 2000 	orr.w	r0, r4, r0, lsl #8
c0de4a12:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de4a16:	f840 b022 	str.w	fp, [r0, r2, lsl #2]
c0de4a1a:	f8d8 00a0 	ldr.w	r0, [r8, #160]	@ 0xa0
c0de4a1e:	f001 fd39 	bl	c0de6494 <OUTLINED_FUNCTION_0>
c0de4a22:	4658      	mov	r0, fp
c0de4a24:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de4a28:	00001968 	.word	0x00001968
c0de4a2c:	00006d37 	.word	0x00006d37

c0de4a30 <nbgl_layoutAddSwitch>:
c0de4a30:	b5b0      	push	{r4, r5, r7, lr}
c0de4a32:	b088      	sub	sp, #32
c0de4a34:	460d      	mov	r5, r1
c0de4a36:	4604      	mov	r4, r0
c0de4a38:	a801      	add	r0, sp, #4
c0de4a3a:	211c      	movs	r1, #28
c0de4a3c:	f006 fa9c 	bl	c0deaf78 <__aeabi_memclr>
c0de4a40:	b1bc      	cbz	r4, c0de4a72 <nbgl_layoutAddSwitch+0x42>
c0de4a42:	2001      	movs	r0, #1
c0de4a44:	f88d 0004 	strb.w	r0, [sp, #4]
c0de4a48:	e9d5 0100 	ldrd	r0, r1, [r5]
c0de4a4c:	e9cd 0104 	strd	r0, r1, [sp, #16]
c0de4a50:	7a68      	ldrb	r0, [r5, #9]
c0de4a52:	f88d 0018 	strb.w	r0, [sp, #24]
c0de4a56:	7aa8      	ldrb	r0, [r5, #10]
c0de4a58:	f88d 001c 	strb.w	r0, [sp, #28]
c0de4a5c:	7a28      	ldrb	r0, [r5, #8]
c0de4a5e:	f88d 0019 	strb.w	r0, [sp, #25]
c0de4a62:	a901      	add	r1, sp, #4
c0de4a64:	4620      	mov	r0, r4
c0de4a66:	f7ff fd85 	bl	c0de4574 <addListItem>
c0de4a6a:	b110      	cbz	r0, c0de4a72 <nbgl_layoutAddSwitch+0x42>
c0de4a6c:	f001 fecc 	bl	c0de6808 <OUTLINED_FUNCTION_36>
c0de4a70:	e001      	b.n	c0de4a76 <nbgl_layoutAddSwitch+0x46>
c0de4a72:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de4a76:	b008      	add	sp, #32
c0de4a78:	bdb0      	pop	{r4, r5, r7, pc}

c0de4a7a <nbgl_layoutAddText>:
c0de4a7a:	b570      	push	{r4, r5, r6, lr}
c0de4a7c:	b088      	sub	sp, #32
c0de4a7e:	460d      	mov	r5, r1
c0de4a80:	4604      	mov	r4, r0
c0de4a82:	a801      	add	r0, sp, #4
c0de4a84:	211c      	movs	r1, #28
c0de4a86:	4616      	mov	r6, r2
c0de4a88:	f006 fa76 	bl	c0deaf78 <__aeabi_memclr>
c0de4a8c:	b194      	cbz	r4, c0de4ab4 <nbgl_layoutAddText+0x3a>
c0de4a8e:	200c      	movs	r0, #12
c0de4a90:	e9cd 5604 	strd	r5, r6, [sp, #16]
c0de4a94:	f88d 001c 	strb.w	r0, [sp, #28]
c0de4a98:	20ff      	movs	r0, #255	@ 0xff
c0de4a9a:	f88d 0018 	strb.w	r0, [sp, #24]
c0de4a9e:	2002      	movs	r0, #2
c0de4aa0:	f88d 0004 	strb.w	r0, [sp, #4]
c0de4aa4:	a901      	add	r1, sp, #4
c0de4aa6:	4620      	mov	r0, r4
c0de4aa8:	f7ff fd64 	bl	c0de4574 <addListItem>
c0de4aac:	b110      	cbz	r0, c0de4ab4 <nbgl_layoutAddText+0x3a>
c0de4aae:	f001 feab 	bl	c0de6808 <OUTLINED_FUNCTION_36>
c0de4ab2:	e001      	b.n	c0de4ab8 <nbgl_layoutAddText+0x3e>
c0de4ab4:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de4ab8:	b008      	add	sp, #32
c0de4aba:	bd70      	pop	{r4, r5, r6, pc}

c0de4abc <nbgl_layoutAddTextWithAlias>:
c0de4abc:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de4abe:	b087      	sub	sp, #28
c0de4ac0:	460e      	mov	r6, r1
c0de4ac2:	4604      	mov	r4, r0
c0de4ac4:	4668      	mov	r0, sp
c0de4ac6:	211c      	movs	r1, #28
c0de4ac8:	461d      	mov	r5, r3
c0de4aca:	4617      	mov	r7, r2
c0de4acc:	f006 fa54 	bl	c0deaf78 <__aeabi_memclr>
c0de4ad0:	b1bc      	cbz	r4, c0de4b02 <nbgl_layoutAddTextWithAlias+0x46>
c0de4ad2:	210c      	movs	r1, #12
c0de4ad4:	e9cd 6703 	strd	r6, r7, [sp, #12]
c0de4ad8:	f88d 5014 	strb.w	r5, [sp, #20]
c0de4adc:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0de4ade:	f88d 1018 	strb.w	r1, [sp, #24]
c0de4ae2:	490a      	ldr	r1, [pc, #40]	@ (c0de4b0c <nbgl_layoutAddTextWithAlias+0x50>)
c0de4ae4:	f88d 0017 	strb.w	r0, [sp, #23]
c0de4ae8:	2001      	movs	r0, #1
c0de4aea:	f88d 0015 	strb.w	r0, [sp, #21]
c0de4aee:	4620      	mov	r0, r4
c0de4af0:	4479      	add	r1, pc
c0de4af2:	9102      	str	r1, [sp, #8]
c0de4af4:	4669      	mov	r1, sp
c0de4af6:	f7ff fd3d 	bl	c0de4574 <addListItem>
c0de4afa:	b110      	cbz	r0, c0de4b02 <nbgl_layoutAddTextWithAlias+0x46>
c0de4afc:	f001 fe84 	bl	c0de6808 <OUTLINED_FUNCTION_36>
c0de4b00:	e001      	b.n	c0de4b06 <nbgl_layoutAddTextWithAlias+0x4a>
c0de4b02:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de4b06:	b007      	add	sp, #28
c0de4b08:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de4b0a:	bf00      	nop
c0de4b0c:	00007574 	.word	0x00007574

c0de4b10 <nbgl_layoutAddTextContent>:
c0de4b10:	2800      	cmp	r0, #0
c0de4b12:	f000 80ab 	beq.w	c0de4c6c <nbgl_layoutAddTextContent+0x15c>
c0de4b16:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de4b1a:	4680      	mov	r8, r0
c0de4b1c:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de4b20:	4e53      	ldr	r6, [pc, #332]	@ (c0de4c70 <nbgl_layoutAddTextContent+0x160>)
c0de4b22:	460d      	mov	r5, r1
c0de4b24:	e9cd 2300 	strd	r2, r3, [sp]
c0de4b28:	08c1      	lsrs	r1, r0, #3
c0de4b2a:	447e      	add	r6, pc
c0de4b2c:	2004      	movs	r0, #4
c0de4b2e:	47b0      	blx	r6
c0de4b30:	f04f 0b00 	mov.w	fp, #0
c0de4b34:	4607      	mov	r7, r0
c0de4b36:	f880 b01f 	strb.w	fp, [r0, #31]
c0de4b3a:	4628      	mov	r0, r5
c0de4b3c:	4c4d      	ldr	r4, [pc, #308]	@ (c0de4c74 <nbgl_layoutAddTextContent+0x164>)
c0de4b3e:	447c      	add	r4, pc
c0de4b40:	47a0      	blx	r4
c0de4b42:	4601      	mov	r1, r0
c0de4b44:	2010      	movs	r0, #16
c0de4b46:	f887 b01a 	strb.w	fp, [r7, #26]
c0de4b4a:	f887 b018 	strb.w	fp, [r7, #24]
c0de4b4e:	f887 b021 	strb.w	fp, [r7, #33]	@ 0x21
c0de4b52:	f887 b016 	strb.w	fp, [r7, #22]
c0de4b56:	2301      	movs	r3, #1
c0de4b58:	46a2      	mov	sl, r4
c0de4b5a:	7678      	strb	r0, [r7, #25]
c0de4b5c:	2020      	movs	r0, #32
c0de4b5e:	0e0a      	lsrs	r2, r1, #24
c0de4b60:	75f8      	strb	r0, [r7, #23]
c0de4b62:	2001      	movs	r0, #1
c0de4b64:	7178      	strb	r0, [r7, #5]
c0de4b66:	20a0      	movs	r0, #160	@ 0xa0
c0de4b68:	7138      	strb	r0, [r7, #4]
c0de4b6a:	200d      	movs	r0, #13
c0de4b6c:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de4b70:	2004      	movs	r0, #4
c0de4b72:	f001 fd9b 	bl	c0de66ac <OUTLINED_FUNCTION_20>
c0de4b76:	200d      	movs	r0, #13
c0de4b78:	4d3f      	ldr	r5, [pc, #252]	@ (c0de4c78 <nbgl_layoutAddTextContent+0x168>)
c0de4b7a:	447d      	add	r5, pc
c0de4b7c:	47a8      	blx	r5
c0de4b7e:	f8d8 10a0 	ldr.w	r1, [r8, #160]	@ 0xa0
c0de4b82:	f001 fdc1 	bl	c0de6708 <OUTLINED_FUNCTION_25>
c0de4b86:	71b8      	strb	r0, [r7, #6]
c0de4b88:	0a00      	lsrs	r0, r0, #8
c0de4b8a:	71f8      	strb	r0, [r7, #7]
c0de4b8c:	f001 fe09 	bl	c0de67a2 <OUTLINED_FUNCTION_32>
c0de4b90:	4607      	mov	r7, r0
c0de4b92:	f880 b01f 	strb.w	fp, [r0, #31]
c0de4b96:	9800      	ldr	r0, [sp, #0]
c0de4b98:	47d0      	blx	sl
c0de4b9a:	4601      	mov	r1, r0
c0de4b9c:	2001      	movs	r0, #1
c0de4b9e:	2301      	movs	r3, #1
c0de4ba0:	f887 b021 	strb.w	fp, [r7, #33]	@ 0x21
c0de4ba4:	7178      	strb	r0, [r7, #5]
c0de4ba6:	20a0      	movs	r0, #160	@ 0xa0
c0de4ba8:	0e0a      	lsrs	r2, r1, #24
c0de4baa:	7138      	strb	r0, [r7, #4]
c0de4bac:	200b      	movs	r0, #11
c0de4bae:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de4bb2:	4638      	mov	r0, r7
c0de4bb4:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de4bb8:	70c2      	strb	r2, [r0, #3]
c0de4bba:	0c0a      	lsrs	r2, r1, #16
c0de4bbc:	7082      	strb	r2, [r0, #2]
c0de4bbe:	0a08      	lsrs	r0, r1, #8
c0de4bc0:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de4bc4:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de4bc8:	f897 0024 	ldrb.w	r0, [r7, #36]	@ 0x24
c0de4bcc:	f040 0001 	orr.w	r0, r0, #1
c0de4bd0:	f887 0024 	strb.w	r0, [r7, #36]	@ 0x24
c0de4bd4:	200b      	movs	r0, #11
c0de4bd6:	47a8      	blx	r5
c0de4bd8:	f8d8 10a0 	ldr.w	r1, [r8, #160]	@ 0xa0
c0de4bdc:	f887 b01a 	strb.w	fp, [r7, #26]
c0de4be0:	f887 b018 	strb.w	fp, [r7, #24]
c0de4be4:	f887 b016 	strb.w	fp, [r7, #22]
c0de4be8:	f001 fd8e 	bl	c0de6708 <OUTLINED_FUNCTION_25>
c0de4bec:	2104      	movs	r1, #4
c0de4bee:	71b8      	strb	r0, [r7, #6]
c0de4bf0:	0a00      	lsrs	r0, r0, #8
c0de4bf2:	f887 1020 	strb.w	r1, [r7, #32]
c0de4bf6:	2118      	movs	r1, #24
c0de4bf8:	71f8      	strb	r0, [r7, #7]
c0de4bfa:	7679      	strb	r1, [r7, #25]
c0de4bfc:	2120      	movs	r1, #32
c0de4bfe:	75f9      	strb	r1, [r7, #23]
c0de4c00:	f001 fdcf 	bl	c0de67a2 <OUTLINED_FUNCTION_32>
c0de4c04:	2401      	movs	r4, #1
c0de4c06:	4606      	mov	r6, r0
c0de4c08:	77c4      	strb	r4, [r0, #31]
c0de4c0a:	9801      	ldr	r0, [sp, #4]
c0de4c0c:	47d0      	blx	sl
c0de4c0e:	4601      	mov	r1, r0
c0de4c10:	20a0      	movs	r0, #160	@ 0xa0
c0de4c12:	2301      	movs	r3, #1
c0de4c14:	7174      	strb	r4, [r6, #5]
c0de4c16:	f886 b021 	strb.w	fp, [r6, #33]	@ 0x21
c0de4c1a:	7130      	strb	r0, [r6, #4]
c0de4c1c:	200b      	movs	r0, #11
c0de4c1e:	0e0a      	lsrs	r2, r1, #24
c0de4c20:	f001 fd1a 	bl	c0de6658 <OUTLINED_FUNCTION_16>
c0de4c24:	47a8      	blx	r5
c0de4c26:	f8d8 10a0 	ldr.w	r1, [r8, #160]	@ 0xa0
c0de4c2a:	f886 b01a 	strb.w	fp, [r6, #26]
c0de4c2e:	f886 b018 	strb.w	fp, [r6, #24]
c0de4c32:	f001 fc61 	bl	c0de64f8 <OUTLINED_FUNCTION_4>
c0de4c36:	f841 6023 	str.w	r6, [r1, r3, lsl #2]
c0de4c3a:	2128      	movs	r1, #40	@ 0x28
c0de4c3c:	71b0      	strb	r0, [r6, #6]
c0de4c3e:	0a00      	lsrs	r0, r0, #8
c0de4c40:	7671      	strb	r1, [r6, #25]
c0de4c42:	2120      	movs	r1, #32
c0de4c44:	71f0      	strb	r0, [r6, #7]
c0de4c46:	75f1      	strb	r1, [r6, #23]
c0de4c48:	2104      	movs	r1, #4
c0de4c4a:	f8d8 00a0 	ldr.w	r0, [r8, #160]	@ 0xa0
c0de4c4e:	f886 1020 	strb.w	r1, [r6, #32]
c0de4c52:	2107      	movs	r1, #7
c0de4c54:	75b1      	strb	r1, [r6, #22]
c0de4c56:	f890 3020 	ldrb.w	r3, [r0, #32]
c0de4c5a:	7981      	ldrb	r1, [r0, #6]
c0de4c5c:	79c2      	ldrb	r2, [r0, #7]
c0de4c5e:	3301      	adds	r3, #1
c0de4c60:	f880 3020 	strb.w	r3, [r0, #32]
c0de4c64:	ea41 2002 	orr.w	r0, r1, r2, lsl #8
c0de4c68:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de4c6c:	f001 bddd 	b.w	c0de682a <OUTLINED_FUNCTION_40>
c0de4c70:	00005c45 	.word	0x00005c45
c0de4c74:	00005ff3 	.word	0x00005ff3
c0de4c78:	00005c27 	.word	0x00005c27

c0de4c7c <nbgl_layoutAddRadioChoice>:
c0de4c7c:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de4c80:	2800      	cmp	r0, #0
c0de4c82:	f000 80ff 	beq.w	c0de4e84 <nbgl_layoutAddRadioChoice+0x208>
c0de4c86:	4605      	mov	r5, r0
c0de4c88:	4883      	ldr	r0, [pc, #524]	@ (c0de4e98 <nbgl_layoutAddRadioChoice+0x21c>)
c0de4c8a:	468a      	mov	sl, r1
c0de4c8c:	f04f 0800 	mov.w	r8, #0
c0de4c90:	e9cd 1501 	strd	r1, r5, [sp, #4]
c0de4c94:	4478      	add	r0, pc
c0de4c96:	9003      	str	r0, [sp, #12]
c0de4c98:	f89a 0005 	ldrb.w	r0, [sl, #5]
c0de4c9c:	4580      	cmp	r8, r0
c0de4c9e:	f080 80f4 	bcs.w	c0de4e8a <nbgl_layoutAddRadioChoice+0x20e>
c0de4ca2:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de4ca6:	9c03      	ldr	r4, [sp, #12]
c0de4ca8:	08c1      	lsrs	r1, r0, #3
c0de4caa:	2001      	movs	r0, #1
c0de4cac:	47a0      	blx	r4
c0de4cae:	4606      	mov	r6, r0
c0de4cb0:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de4cb4:	08c1      	lsrs	r1, r0, #3
c0de4cb6:	2004      	movs	r0, #4
c0de4cb8:	47a0      	blx	r4
c0de4cba:	4607      	mov	r7, r0
c0de4cbc:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de4cc0:	08c1      	lsrs	r1, r0, #3
c0de4cc2:	2009      	movs	r0, #9
c0de4cc4:	47a0      	blx	r4
c0de4cc6:	f89a 2007 	ldrb.w	r2, [sl, #7]
c0de4cca:	f89a 3008 	ldrb.w	r3, [sl, #8]
c0de4cce:	4604      	mov	r4, r0
c0de4cd0:	4628      	mov	r0, r5
c0de4cd2:	4631      	mov	r1, r6
c0de4cd4:	f7fe fa54 	bl	c0de3180 <layoutAddCallbackObj>
c0de4cd8:	2800      	cmp	r0, #0
c0de4cda:	f000 80d3 	beq.w	c0de4e84 <nbgl_layoutAddRadioChoice+0x208>
c0de4cde:	2002      	movs	r0, #2
c0de4ce0:	f886 0020 	strb.w	r0, [r6, #32]
c0de4ce4:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de4ce8:	08c1      	lsrs	r1, r0, #3
c0de4cea:	2002      	movs	r0, #2
c0de4cec:	f005 fd46 	bl	c0dea77c <nbgl_containerPoolGet>
c0de4cf0:	2300      	movs	r3, #0
c0de4cf2:	ea4f 2c16 	mov.w	ip, r6, lsr #8
c0de4cf6:	4631      	mov	r1, r6
c0de4cf8:	0e02      	lsrs	r2, r0, #24
c0de4cfa:	4655      	mov	r5, sl
c0de4cfc:	ea4f 6a16 	mov.w	sl, r6, lsr #24
c0de4d00:	ea4f 4b16 	mov.w	fp, r6, lsr #16
c0de4d04:	74f3      	strb	r3, [r6, #19]
c0de4d06:	f884 c013 	strb.w	ip, [r4, #19]
c0de4d0a:	f801 0f22 	strb.w	r0, [r1, #34]!
c0de4d0e:	70ca      	strb	r2, [r1, #3]
c0de4d10:	0c02      	lsrs	r2, r0, #16
c0de4d12:	708a      	strb	r2, [r1, #2]
c0de4d14:	0a01      	lsrs	r1, r0, #8
c0de4d16:	f886 1023 	strb.w	r1, [r6, #35]	@ 0x23
c0de4d1a:	4631      	mov	r1, r6
c0de4d1c:	f801 3f12 	strb.w	r3, [r1, #18]!
c0de4d20:	70cb      	strb	r3, [r1, #3]
c0de4d22:	708b      	strb	r3, [r1, #2]
c0de4d24:	4621      	mov	r1, r4
c0de4d26:	f801 6f12 	strb.w	r6, [r1, #18]!
c0de4d2a:	f881 b002 	strb.w	fp, [r1, #2]
c0de4d2e:	f881 a003 	strb.w	sl, [r1, #3]
c0de4d32:	2120      	movs	r1, #32
c0de4d34:	7633      	strb	r3, [r6, #24]
c0de4d36:	71f3      	strb	r3, [r6, #7]
c0de4d38:	75b3      	strb	r3, [r6, #22]
c0de4d3a:	75f1      	strb	r1, [r6, #23]
c0de4d3c:	215c      	movs	r1, #92	@ 0x5c
c0de4d3e:	71b1      	strb	r1, [r6, #6]
c0de4d40:	2101      	movs	r1, #1
c0de4d42:	7171      	strb	r1, [r6, #5]
c0de4d44:	21a0      	movs	r1, #160	@ 0xa0
c0de4d46:	7131      	strb	r1, [r6, #4]
c0de4d48:	2102      	movs	r1, #2
c0de4d4a:	6044      	str	r4, [r0, #4]
c0de4d4c:	77e3      	strb	r3, [r4, #31]
c0de4d4e:	f884 3021 	strb.w	r3, [r4, #33]	@ 0x21
c0de4d52:	7928      	ldrb	r0, [r5, #4]
c0de4d54:	f884 1020 	strb.w	r1, [r4, #32]
c0de4d58:	2106      	movs	r1, #6
c0de4d5a:	75a1      	strb	r1, [r4, #22]
c0de4d5c:	b110      	cbz	r0, c0de4d64 <nbgl_layoutAddRadioChoice+0xe8>
c0de4d5e:	f44f 70d0 	mov.w	r0, #416	@ 0x1a0
c0de4d62:	e014      	b.n	c0de4d8e <nbgl_layoutAddRadioChoice+0x112>
c0de4d64:	6828      	ldr	r0, [r5, #0]
c0de4d66:	4665      	mov	r5, ip
c0de4d68:	f850 0028 	ldr.w	r0, [r0, r8, lsl #2]
c0de4d6c:	f005 fee2 	bl	c0deab34 <pic>
c0de4d70:	4639      	mov	r1, r7
c0de4d72:	0e02      	lsrs	r2, r0, #24
c0de4d74:	46ac      	mov	ip, r5
c0de4d76:	9d01      	ldr	r5, [sp, #4]
c0de4d78:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de4d7c:	70ca      	strb	r2, [r1, #3]
c0de4d7e:	0c02      	lsrs	r2, r0, #16
c0de4d80:	0a00      	lsrs	r0, r0, #8
c0de4d82:	708a      	strb	r2, [r1, #2]
c0de4d84:	7048      	strb	r0, [r1, #1]
c0de4d86:	7930      	ldrb	r0, [r6, #4]
c0de4d88:	7971      	ldrb	r1, [r6, #5]
c0de4d8a:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de4d8e:	4639      	mov	r1, r7
c0de4d90:	f887 c013 	strb.w	ip, [r7, #19]
c0de4d94:	4632      	mov	r2, r6
c0de4d96:	3828      	subs	r0, #40	@ 0x28
c0de4d98:	f801 6f12 	strb.w	r6, [r1, #18]!
c0de4d9c:	f881 b002 	strb.w	fp, [r1, #2]
c0de4da0:	f881 a003 	strb.w	sl, [r1, #3]
c0de4da4:	f04f 0b00 	mov.w	fp, #0
c0de4da8:	46aa      	mov	sl, r5
c0de4daa:	f896 1023 	ldrb.w	r1, [r6, #35]	@ 0x23
c0de4dae:	f812 3f22 	ldrb.w	r3, [r2, #34]!
c0de4db2:	f886 b01d 	strb.w	fp, [r6, #29]
c0de4db6:	f001 fdd5 	bl	c0de6964 <OUTLINED_FUNCTION_66>
c0de4dba:	4b36      	ldr	r3, [pc, #216]	@ (c0de4e94 <nbgl_layoutAddRadioChoice+0x218>)
c0de4dbc:	ea41 4102 	orr.w	r1, r1, r2, lsl #16
c0de4dc0:	600f      	str	r7, [r1, #0]
c0de4dc2:	f819 1003 	ldrb.w	r1, [r9, r3]
c0de4dc6:	1c4a      	adds	r2, r1, #1
c0de4dc8:	3114      	adds	r1, #20
c0de4dca:	f809 2003 	strb.w	r2, [r9, r3]
c0de4dce:	2201      	movs	r2, #1
c0de4dd0:	77b1      	strb	r1, [r6, #30]
c0de4dd2:	2104      	movs	r1, #4
c0de4dd4:	7732      	strb	r2, [r6, #28]
c0de4dd6:	f887 b021 	strb.w	fp, [r7, #33]	@ 0x21
c0de4dda:	f887 1020 	strb.w	r1, [r7, #32]
c0de4dde:	75b9      	strb	r1, [r7, #22]
c0de4de0:	79aa      	ldrb	r2, [r5, #6]
c0de4de2:	eba8 0302 	sub.w	r3, r8, r2
c0de4de6:	fab3 f383 	clz	r3, r3
c0de4dea:	095b      	lsrs	r3, r3, #5
c0de4dec:	f884 3021 	strb.w	r3, [r4, #33]	@ 0x21
c0de4df0:	7138      	strb	r0, [r7, #4]
c0de4df2:	0a00      	lsrs	r0, r0, #8
c0de4df4:	7178      	strb	r0, [r7, #5]
c0de4df6:	ebb8 0002 	subs.w	r0, r8, r2
c0de4dfa:	bf18      	it	ne
c0de4dfc:	2001      	movne	r0, #1
c0de4dfe:	77f8      	strb	r0, [r7, #31]
c0de4e00:	4590      	cmp	r8, r2
c0de4e02:	f04f 000b 	mov.w	r0, #11
c0de4e06:	bf08      	it	eq
c0de4e08:	200c      	moveq	r0, #12
c0de4e0a:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de4e0e:	f005 fcbf 	bl	c0dea790 <nbgl_getFontHeight>
c0de4e12:	9d02      	ldr	r5, [sp, #8]
c0de4e14:	f887 b007 	strb.w	fp, [r7, #7]
c0de4e18:	71b8      	strb	r0, [r7, #6]
c0de4e1a:	f895 00ad 	ldrb.w	r0, [r5, #173]	@ 0xad
c0de4e1e:	08c0      	lsrs	r0, r0, #3
c0de4e20:	f000 f83c 	bl	c0de4e9c <createHorizontalLine>
c0de4e24:	f8d5 10a0 	ldr.w	r1, [r5, #160]	@ 0xa0
c0de4e28:	f108 0801 	add.w	r8, r8, #1
c0de4e2c:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de4e30:	784c      	ldrb	r4, [r1, #1]
c0de4e32:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de4e36:	788f      	ldrb	r7, [r1, #2]
c0de4e38:	78c9      	ldrb	r1, [r1, #3]
c0de4e3a:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de4e3e:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de4e42:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de4e46:	f841 6023 	str.w	r6, [r1, r3, lsl #2]
c0de4e4a:	f8d5 10a0 	ldr.w	r1, [r5, #160]	@ 0xa0
c0de4e4e:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de4e52:	784b      	ldrb	r3, [r1, #1]
c0de4e54:	788c      	ldrb	r4, [r1, #2]
c0de4e56:	78ce      	ldrb	r6, [r1, #3]
c0de4e58:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de4e5c:	ea44 2306 	orr.w	r3, r4, r6, lsl #8
c0de4e60:	ea42 4203 	orr.w	r2, r2, r3, lsl #16
c0de4e64:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de4e68:	3301      	adds	r3, #1
c0de4e6a:	b2dc      	uxtb	r4, r3
c0de4e6c:	f801 3c02 	strb.w	r3, [r1, #-2]
c0de4e70:	21ff      	movs	r1, #255	@ 0xff
c0de4e72:	f842 0024 	str.w	r0, [r2, r4, lsl #2]
c0de4e76:	7641      	strb	r1, [r0, #25]
c0de4e78:	7681      	strb	r1, [r0, #26]
c0de4e7a:	f8d5 00a0 	ldr.w	r0, [r5, #160]	@ 0xa0
c0de4e7e:	f001 fb09 	bl	c0de6494 <OUTLINED_FUNCTION_0>
c0de4e82:	e709      	b.n	c0de4c98 <nbgl_layoutAddRadioChoice+0x1c>
c0de4e84:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de4e88:	e000      	b.n	c0de4e8c <nbgl_layoutAddRadioChoice+0x210>
c0de4e8a:	2000      	movs	r0, #0
c0de4e8c:	b004      	add	sp, #16
c0de4e8e:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de4e92:	bf00      	nop
c0de4e94:	00001968 	.word	0x00001968
c0de4e98:	00005adb 	.word	0x00005adb

c0de4e9c <createHorizontalLine>:
c0de4e9c:	b580      	push	{r7, lr}
c0de4e9e:	4601      	mov	r1, r0
c0de4ea0:	2003      	movs	r0, #3
c0de4ea2:	f005 fc66 	bl	c0dea772 <nbgl_objPoolGet>
c0de4ea6:	2100      	movs	r1, #0
c0de4ea8:	22e0      	movs	r2, #224	@ 0xe0
c0de4eaa:	71c1      	strb	r1, [r0, #7]
c0de4eac:	2101      	movs	r1, #1
c0de4eae:	7102      	strb	r2, [r0, #4]
c0de4eb0:	2202      	movs	r2, #2
c0de4eb2:	7181      	strb	r1, [r0, #6]
c0de4eb4:	7141      	strb	r1, [r0, #5]
c0de4eb6:	f880 2020 	strb.w	r2, [r0, #32]
c0de4eba:	f880 1021 	strb.w	r1, [r0, #33]	@ 0x21
c0de4ebe:	77c1      	strb	r1, [r0, #31]
c0de4ec0:	bd80      	pop	{r7, pc}

c0de4ec2 <nbgl_layoutAddCenteredInfo>:
c0de4ec2:	b570      	push	{r4, r5, r6, lr}
c0de4ec4:	b08a      	sub	sp, #40	@ 0x28
c0de4ec6:	ae01      	add	r6, sp, #4
c0de4ec8:	460c      	mov	r4, r1
c0de4eca:	4605      	mov	r5, r0
c0de4ecc:	2124      	movs	r1, #36	@ 0x24
c0de4ece:	4630      	mov	r0, r6
c0de4ed0:	f006 f852 	bl	c0deaf78 <__aeabi_memclr>
c0de4ed4:	b33d      	cbz	r5, c0de4f26 <nbgl_layoutAddCenteredInfo+0x64>
c0de4ed6:	6820      	ldr	r0, [r4, #0]
c0de4ed8:	68e1      	ldr	r1, [r4, #12]
c0de4eda:	9102      	str	r1, [sp, #8]
c0de4edc:	b128      	cbz	r0, c0de4eea <nbgl_layoutAddCenteredInfo+0x28>
c0de4ede:	7c61      	ldrb	r1, [r4, #17]
c0de4ee0:	2210      	movs	r2, #16
c0de4ee2:	2903      	cmp	r1, #3
c0de4ee4:	bf08      	it	eq
c0de4ee6:	2214      	moveq	r2, #20
c0de4ee8:	50b0      	str	r0, [r6, r2]
c0de4eea:	6860      	ldr	r0, [r4, #4]
c0de4eec:	b128      	cbz	r0, c0de4efa <nbgl_layoutAddCenteredInfo+0x38>
c0de4eee:	7c61      	ldrb	r1, [r4, #17]
c0de4ef0:	2218      	movs	r2, #24
c0de4ef2:	2901      	cmp	r1, #1
c0de4ef4:	bf08      	it	eq
c0de4ef6:	2214      	moveq	r2, #20
c0de4ef8:	50b0      	str	r0, [r6, r2]
c0de4efa:	68a0      	ldr	r0, [r4, #8]
c0de4efc:	b128      	cbz	r0, c0de4f0a <nbgl_layoutAddCenteredInfo+0x48>
c0de4efe:	7c61      	ldrb	r1, [r4, #17]
c0de4f00:	2218      	movs	r2, #24
c0de4f02:	2902      	cmp	r1, #2
c0de4f04:	bf08      	it	eq
c0de4f06:	221c      	moveq	r2, #28
c0de4f08:	50b0      	str	r0, [r6, r2]
c0de4f0a:	a901      	add	r1, sp, #4
c0de4f0c:	4628      	mov	r0, r5
c0de4f0e:	f000 f815 	bl	c0de4f3c <addContentCenter>
c0de4f12:	7c21      	ldrb	r1, [r4, #16]
c0de4f14:	b151      	cbz	r1, c0de4f2c <nbgl_layoutAddCenteredInfo+0x6a>
c0de4f16:	2100      	movs	r1, #0
c0de4f18:	2220      	movs	r2, #32
c0de4f1a:	7601      	strb	r1, [r0, #24]
c0de4f1c:	75c2      	strb	r2, [r0, #23]
c0de4f1e:	7581      	strb	r1, [r0, #22]
c0de4f20:	8a61      	ldrh	r1, [r4, #18]
c0de4f22:	3120      	adds	r1, #32
c0de4f24:	e003      	b.n	c0de4f2e <nbgl_layoutAddCenteredInfo+0x6c>
c0de4f26:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de4f2a:	e005      	b.n	c0de4f38 <nbgl_layoutAddCenteredInfo+0x76>
c0de4f2c:	8a61      	ldrh	r1, [r4, #18]
c0de4f2e:	7641      	strb	r1, [r0, #25]
c0de4f30:	0a09      	lsrs	r1, r1, #8
c0de4f32:	7681      	strb	r1, [r0, #26]
c0de4f34:	f001 fc68 	bl	c0de6808 <OUTLINED_FUNCTION_36>
c0de4f38:	b00a      	add	sp, #40	@ 0x28
c0de4f3a:	bd70      	pop	{r4, r5, r6, pc}

c0de4f3c <addContentCenter>:
c0de4f3c:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de4f40:	4682      	mov	sl, r0
c0de4f42:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de4f46:	4688      	mov	r8, r1
c0de4f48:	f001 fbac 	bl	c0de66a4 <OUTLINED_FUNCTION_19>
c0de4f4c:	2700      	movs	r7, #0
c0de4f4e:	4683      	mov	fp, r0
c0de4f50:	f880 7020 	strb.w	r7, [r0, #32]
c0de4f54:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de4f58:	08c1      	lsrs	r1, r0, #3
c0de4f5a:	2006      	movs	r0, #6
c0de4f5c:	f005 fc0e 	bl	c0dea77c <nbgl_containerPoolGet>
c0de4f60:	4659      	mov	r1, fp
c0de4f62:	0e02      	lsrs	r2, r0, #24
c0de4f64:	f801 0f22 	strb.w	r0, [r1, #34]!
c0de4f68:	f001 fb8b 	bl	c0de6682 <OUTLINED_FUNCTION_17>
c0de4f6c:	f88b 0023 	strb.w	r0, [fp, #35]	@ 0x23
c0de4f70:	f8d8 0004 	ldr.w	r0, [r8, #4]
c0de4f74:	2800      	cmp	r0, #0
c0de4f76:	f000 8093 	beq.w	c0de50a0 <addContentCenter+0x164>
c0de4f7a:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de4f7e:	f001 fbd3 	bl	c0de6728 <OUTLINED_FUNCTION_26>
c0de4f82:	4607      	mov	r7, r0
c0de4f84:	f001 fc5b 	bl	c0de683e <OUTLINED_FUNCTION_42>
c0de4f88:	bfc8      	it	gt
c0de4f8a:	2000      	movgt	r0, #0
c0de4f8c:	77f8      	strb	r0, [r7, #31]
c0de4f8e:	f8d8 0004 	ldr.w	r0, [r8, #4]
c0de4f92:	f005 fdcf 	bl	c0deab34 <pic>
c0de4f96:	4639      	mov	r1, r7
c0de4f98:	0e02      	lsrs	r2, r0, #24
c0de4f9a:	f801 0f21 	strb.w	r0, [r1, #33]!
c0de4f9e:	70ca      	strb	r2, [r1, #3]
c0de4fa0:	0c02      	lsrs	r2, r0, #16
c0de4fa2:	708a      	strb	r2, [r1, #2]
c0de4fa4:	0a01      	lsrs	r1, r0, #8
c0de4fa6:	f887 1022 	strb.w	r1, [r7, #34]	@ 0x22
c0de4faa:	4659      	mov	r1, fp
c0de4fac:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de4fb0:	784e      	ldrb	r6, [r1, #1]
c0de4fb2:	788c      	ldrb	r4, [r1, #2]
c0de4fb4:	78cd      	ldrb	r5, [r1, #3]
c0de4fb6:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de4fba:	ea42 2206 	orr.w	r2, r2, r6, lsl #8
c0de4fbe:	ea44 2405 	orr.w	r4, r4, r5, lsl #8
c0de4fc2:	ea42 4204 	orr.w	r2, r2, r4, lsl #16
c0de4fc6:	f842 7023 	str.w	r7, [r2, r3, lsl #2]
c0de4fca:	2202      	movs	r2, #2
c0de4fcc:	3301      	adds	r3, #1
c0de4fce:	75ba      	strb	r2, [r7, #22]
c0de4fd0:	f8b8 2020 	ldrh.w	r2, [r8, #32]
c0de4fd4:	767a      	strb	r2, [r7, #25]
c0de4fd6:	f801 3c02 	strb.w	r3, [r1, #-2]
c0de4fda:	0a14      	lsrs	r4, r2, #8
c0de4fdc:	7881      	ldrb	r1, [r0, #2]
c0de4fde:	78c0      	ldrb	r0, [r0, #3]
c0de4fe0:	76bc      	strb	r4, [r7, #26]
c0de4fe2:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de4fe6:	1881      	adds	r1, r0, r2
c0de4fe8:	f898 0000 	ldrb.w	r0, [r8]
c0de4fec:	2801      	cmp	r0, #1
c0de4fee:	d158      	bne.n	c0de50a2 <addContentCenter+0x166>
c0de4ff0:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de4ff4:	9100      	str	r1, [sp, #0]
c0de4ff6:	f001 fb97 	bl	c0de6728 <OUTLINED_FUNCTION_26>
c0de4ffa:	4606      	mov	r6, r0
c0de4ffc:	f001 fc1f 	bl	c0de683e <OUTLINED_FUNCTION_42>
c0de5000:	bfc8      	it	gt
c0de5002:	2000      	movgt	r0, #0
c0de5004:	77f0      	strb	r0, [r6, #31]
c0de5006:	f8d8 0008 	ldr.w	r0, [r8, #8]
c0de500a:	6800      	ldr	r0, [r0, #0]
c0de500c:	6800      	ldr	r0, [r0, #0]
c0de500e:	f005 fd91 	bl	c0deab34 <pic>
c0de5012:	4631      	mov	r1, r6
c0de5014:	0e02      	lsrs	r2, r0, #24
c0de5016:	f801 0f21 	strb.w	r0, [r1, #33]!
c0de501a:	70ca      	strb	r2, [r1, #3]
c0de501c:	0c02      	lsrs	r2, r0, #16
c0de501e:	0a00      	lsrs	r0, r0, #8
c0de5020:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de5024:	708a      	strb	r2, [r1, #2]
c0de5026:	4658      	mov	r0, fp
c0de5028:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de502c:	7843      	ldrb	r3, [r0, #1]
c0de502e:	7885      	ldrb	r5, [r0, #2]
c0de5030:	78c4      	ldrb	r4, [r0, #3]
c0de5032:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de5036:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de503a:	ea45 2304 	orr.w	r3, r5, r4, lsl #8
c0de503e:	ea41 4103 	orr.w	r1, r1, r3, lsl #16
c0de5042:	f841 6022 	str.w	r6, [r1, r2, lsl #2]
c0de5046:	2102      	movs	r1, #2
c0de5048:	75b1      	strb	r1, [r6, #22]
c0de504a:	f8b8 100c 	ldrh.w	r1, [r8, #12]
c0de504e:	75f1      	strb	r1, [r6, #23]
c0de5050:	0a09      	lsrs	r1, r1, #8
c0de5052:	f8b8 3020 	ldrh.w	r3, [r8, #32]
c0de5056:	f8b8 400e 	ldrh.w	r4, [r8, #14]
c0de505a:	7631      	strb	r1, [r6, #24]
c0de505c:	1c51      	adds	r1, r2, #1
c0de505e:	4423      	add	r3, r4
c0de5060:	7673      	strb	r3, [r6, #25]
c0de5062:	f800 1c02 	strb.w	r1, [r0, #-2]
c0de5066:	0a18      	lsrs	r0, r3, #8
c0de5068:	76b0      	strb	r0, [r6, #26]
c0de506a:	2000      	movs	r0, #0
c0de506c:	f88a 00af 	strb.w	r0, [sl, #175]	@ 0xaf
c0de5070:	f8d8 0008 	ldr.w	r0, [r8, #8]
c0de5074:	f8ca 00a4 	str.w	r0, [sl, #164]	@ 0xa4
c0de5078:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de507c:	f040 0104 	orr.w	r1, r0, #4
c0de5080:	08c0      	lsrs	r0, r0, #3
c0de5082:	f88a 10ad 	strb.w	r1, [sl, #173]	@ 0xad
c0de5086:	49bb      	ldr	r1, [pc, #748]	@ (c0de5374 <addContentCenter+0x438>)
c0de5088:	4479      	add	r1, pc
c0de508a:	9101      	str	r1, [sp, #4]
c0de508c:	f8d8 1008 	ldr.w	r1, [r8, #8]
c0de5090:	88c9      	ldrh	r1, [r1, #6]
c0de5092:	e9cd 1102 	strd	r1, r1, [sp, #8]
c0de5096:	a901      	add	r1, sp, #4
c0de5098:	f005 fb61 	bl	c0dea75e <nbgl_screenUpdateTicker>
c0de509c:	9900      	ldr	r1, [sp, #0]
c0de509e:	e000      	b.n	c0de50a2 <addContentCenter+0x166>
c0de50a0:	2100      	movs	r1, #0
c0de50a2:	f8d8 0010 	ldr.w	r0, [r8, #16]
c0de50a6:	2800      	cmp	r0, #0
c0de50a8:	d05f      	beq.n	c0de516a <addContentCenter+0x22e>
c0de50aa:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de50ae:	9100      	str	r1, [sp, #0]
c0de50b0:	f001 f9f6 	bl	c0de64a0 <OUTLINED_FUNCTION_1>
c0de50b4:	4606      	mov	r6, r0
c0de50b6:	f001 fb1d 	bl	c0de66f4 <OUTLINED_FUNCTION_24>
c0de50ba:	bfc8      	it	gt
c0de50bc:	2100      	movgt	r1, #0
c0de50be:	f8d8 0010 	ldr.w	r0, [r8, #16]
c0de50c2:	77f1      	strb	r1, [r6, #31]
c0de50c4:	f005 fd36 	bl	c0deab34 <pic>
c0de50c8:	4601      	mov	r1, r0
c0de50ca:	2001      	movs	r0, #1
c0de50cc:	2301      	movs	r3, #1
c0de50ce:	7170      	strb	r0, [r6, #5]
c0de50d0:	20a0      	movs	r0, #160	@ 0xa0
c0de50d2:	0e0a      	lsrs	r2, r1, #24
c0de50d4:	7130      	strb	r0, [r6, #4]
c0de50d6:	200d      	movs	r0, #13
c0de50d8:	f001 fbfb 	bl	c0de68d2 <OUTLINED_FUNCTION_52>
c0de50dc:	4630      	mov	r0, r6
c0de50de:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de50e2:	70c2      	strb	r2, [r0, #3]
c0de50e4:	0c0a      	lsrs	r2, r1, #16
c0de50e6:	7082      	strb	r2, [r0, #2]
c0de50e8:	0a08      	lsrs	r0, r1, #8
c0de50ea:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de50ee:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de50f2:	f896 0024 	ldrb.w	r0, [r6, #36]	@ 0x24
c0de50f6:	f040 0001 	orr.w	r0, r0, #1
c0de50fa:	f886 0024 	strb.w	r0, [r6, #36]	@ 0x24
c0de50fe:	f001 fc23 	bl	c0de6948 <OUTLINED_FUNCTION_62>
c0de5102:	71b0      	strb	r0, [r6, #6]
c0de5104:	0a01      	lsrs	r1, r0, #8
c0de5106:	f89b c020 	ldrb.w	ip, [fp, #32]
c0de510a:	71f1      	strb	r1, [r6, #7]
c0de510c:	f1bc 0f00 	cmp.w	ip, #0
c0de5110:	d010      	beq.n	c0de5134 <addContentCenter+0x1f8>
c0de5112:	4633      	mov	r3, r6
c0de5114:	0e3a      	lsrs	r2, r7, #24
c0de5116:	f803 7f12 	strb.w	r7, [r3, #18]!
c0de511a:	70da      	strb	r2, [r3, #3]
c0de511c:	0c3a      	lsrs	r2, r7, #16
c0de511e:	709a      	strb	r2, [r3, #2]
c0de5120:	0a3a      	lsrs	r2, r7, #8
c0de5122:	705a      	strb	r2, [r3, #1]
c0de5124:	f8b8 2020 	ldrh.w	r2, [r8, #32]
c0de5128:	3218      	adds	r2, #24
c0de512a:	0a14      	lsrs	r4, r2, #8
c0de512c:	71da      	strb	r2, [r3, #7]
c0de512e:	721c      	strb	r4, [r3, #8]
c0de5130:	2308      	movs	r3, #8
c0de5132:	e004      	b.n	c0de513e <addContentCenter+0x202>
c0de5134:	7e72      	ldrb	r2, [r6, #25]
c0de5136:	7eb3      	ldrb	r3, [r6, #26]
c0de5138:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de513c:	2302      	movs	r3, #2
c0de513e:	75b3      	strb	r3, [r6, #22]
c0de5140:	465b      	mov	r3, fp
c0de5142:	f813 4f22 	ldrb.w	r4, [r3, #34]!
c0de5146:	785d      	ldrb	r5, [r3, #1]
c0de5148:	789f      	ldrb	r7, [r3, #2]
c0de514a:	78d9      	ldrb	r1, [r3, #3]
c0de514c:	ea44 2405 	orr.w	r4, r4, r5, lsl #8
c0de5150:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de5154:	ea44 4101 	orr.w	r1, r4, r1, lsl #16
c0de5158:	f841 602c 	str.w	r6, [r1, ip, lsl #2]
c0de515c:	f10c 0101 	add.w	r1, ip, #1
c0de5160:	f803 1c02 	strb.w	r1, [r3, #-2]
c0de5164:	9900      	ldr	r1, [sp, #0]
c0de5166:	4408      	add	r0, r1
c0de5168:	1881      	adds	r1, r0, r2
c0de516a:	f8d8 0014 	ldr.w	r0, [r8, #20]
c0de516e:	b3e8      	cbz	r0, c0de51ec <addContentCenter+0x2b0>
c0de5170:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de5174:	9100      	str	r1, [sp, #0]
c0de5176:	f001 f993 	bl	c0de64a0 <OUTLINED_FUNCTION_1>
c0de517a:	4607      	mov	r7, r0
c0de517c:	f001 faba 	bl	c0de66f4 <OUTLINED_FUNCTION_24>
c0de5180:	bfc8      	it	gt
c0de5182:	2100      	movgt	r1, #0
c0de5184:	f8d8 0014 	ldr.w	r0, [r8, #20]
c0de5188:	77f9      	strb	r1, [r7, #31]
c0de518a:	f005 fcd3 	bl	c0deab34 <pic>
c0de518e:	4601      	mov	r1, r0
c0de5190:	2001      	movs	r0, #1
c0de5192:	f001 fbaf 	bl	c0de68f4 <OUTLINED_FUNCTION_55>
c0de5196:	200c      	movs	r0, #12
c0de5198:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de519c:	2005      	movs	r0, #5
c0de519e:	f001 fa85 	bl	c0de66ac <OUTLINED_FUNCTION_20>
c0de51a2:	200c      	movs	r0, #12
c0de51a4:	f005 fafe 	bl	c0dea7a4 <nbgl_getTextHeightInWidth>
c0de51a8:	f001 fb38 	bl	c0de681c <OUTLINED_FUNCTION_39>
c0de51ac:	d01a      	beq.n	c0de51e4 <addContentCenter+0x2a8>
c0de51ae:	f001 f9ff 	bl	c0de65b0 <OUTLINED_FUNCTION_10>
c0de51b2:	70ae      	strb	r6, [r5, #2]
c0de51b4:	2618      	movs	r6, #24
c0de51b6:	706b      	strb	r3, [r5, #1]
c0de51b8:	2300      	movs	r3, #0
c0de51ba:	71ee      	strb	r6, [r5, #7]
c0de51bc:	2608      	movs	r6, #8
c0de51be:	722b      	strb	r3, [r5, #8]
c0de51c0:	f854 4c04 	ldr.w	r4, [r4, #-4]
c0de51c4:	712e      	strb	r6, [r5, #4]
c0de51c6:	460e      	mov	r6, r1
c0de51c8:	7ee4      	ldrb	r4, [r4, #27]
c0de51ca:	2c02      	cmp	r4, #2
c0de51cc:	bf1d      	ittte	ne
c0de51ce:	76bb      	strbne	r3, [r7, #26]
c0de51d0:	2310      	movne	r3, #16
c0de51d2:	767b      	strbne	r3, [r7, #25]
c0de51d4:	f8b8 3020 	ldrheq.w	r3, [r8, #32]
c0de51d8:	bf01      	itttt	eq
c0de51da:	3318      	addeq	r3, #24
c0de51dc:	767b      	strbeq	r3, [r7, #25]
c0de51de:	0a1c      	lsreq	r4, r3, #8
c0de51e0:	76bc      	strbeq	r4, [r7, #26]
c0de51e2:	e001      	b.n	c0de51e8 <addContentCenter+0x2ac>
c0de51e4:	f001 f974 	bl	c0de64d0 <OUTLINED_FUNCTION_3>
c0de51e8:	f001 fac9 	bl	c0de677e <OUTLINED_FUNCTION_30>
c0de51ec:	f8d8 0018 	ldr.w	r0, [r8, #24]
c0de51f0:	2800      	cmp	r0, #0
c0de51f2:	d04f      	beq.n	c0de5294 <addContentCenter+0x358>
c0de51f4:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de51f8:	9100      	str	r1, [sp, #0]
c0de51fa:	f001 f951 	bl	c0de64a0 <OUTLINED_FUNCTION_1>
c0de51fe:	4607      	mov	r7, r0
c0de5200:	f001 fa78 	bl	c0de66f4 <OUTLINED_FUNCTION_24>
c0de5204:	bfc8      	it	gt
c0de5206:	2100      	movgt	r1, #0
c0de5208:	f8d8 0018 	ldr.w	r0, [r8, #24]
c0de520c:	77f9      	strb	r1, [r7, #31]
c0de520e:	f005 fc91 	bl	c0deab34 <pic>
c0de5212:	4601      	mov	r1, r0
c0de5214:	2001      	movs	r0, #1
c0de5216:	f001 fb6d 	bl	c0de68f4 <OUTLINED_FUNCTION_55>
c0de521a:	200b      	movs	r0, #11
c0de521c:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de5220:	2005      	movs	r0, #5
c0de5222:	f887 0020 	strb.w	r0, [r7, #32]
c0de5226:	f001 f93f 	bl	c0de64a8 <OUTLINED_FUNCTION_2>
c0de522a:	f001 faf7 	bl	c0de681c <OUTLINED_FUNCTION_39>
c0de522e:	d02d      	beq.n	c0de528c <addContentCenter+0x350>
c0de5230:	465a      	mov	r2, fp
c0de5232:	f812 3f22 	ldrb.w	r3, [r2, #34]!
c0de5236:	7854      	ldrb	r4, [r2, #1]
c0de5238:	7895      	ldrb	r5, [r2, #2]
c0de523a:	78d2      	ldrb	r2, [r2, #3]
c0de523c:	ea45 2202 	orr.w	r2, r5, r2, lsl #8
c0de5240:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de5244:	463d      	mov	r5, r7
c0de5246:	ea43 4202 	orr.w	r2, r3, r2, lsl #16
c0de524a:	eb02 0381 	add.w	r3, r2, r1, lsl #2
c0de524e:	f853 4c04 	ldr.w	r4, [r3, #-4]
c0de5252:	f805 4f12 	strb.w	r4, [r5, #18]!
c0de5256:	0e26      	lsrs	r6, r4, #24
c0de5258:	70ee      	strb	r6, [r5, #3]
c0de525a:	0c26      	lsrs	r6, r4, #16
c0de525c:	0a24      	lsrs	r4, r4, #8
c0de525e:	70ae      	strb	r6, [r5, #2]
c0de5260:	706c      	strb	r4, [r5, #1]
c0de5262:	2408      	movs	r4, #8
c0de5264:	460e      	mov	r6, r1
c0de5266:	f853 3c04 	ldr.w	r3, [r3, #-4]
c0de526a:	712c      	strb	r4, [r5, #4]
c0de526c:	7edb      	ldrb	r3, [r3, #27]
c0de526e:	2b04      	cmp	r3, #4
c0de5270:	bf01      	itttt	eq
c0de5272:	2300      	moveq	r3, #0
c0de5274:	76bb      	strbeq	r3, [r7, #26]
c0de5276:	2310      	moveq	r3, #16
c0de5278:	767b      	strbeq	r3, [r7, #25]
c0de527a:	bf1f      	itttt	ne
c0de527c:	f8b8 3020 	ldrhne.w	r3, [r8, #32]
c0de5280:	3318      	addne	r3, #24
c0de5282:	767b      	strbne	r3, [r7, #25]
c0de5284:	0a1c      	lsrne	r4, r3, #8
c0de5286:	bf18      	it	ne
c0de5288:	76bc      	strbne	r4, [r7, #26]
c0de528a:	e001      	b.n	c0de5290 <addContentCenter+0x354>
c0de528c:	f001 f920 	bl	c0de64d0 <OUTLINED_FUNCTION_3>
c0de5290:	f001 fa75 	bl	c0de677e <OUTLINED_FUNCTION_30>
c0de5294:	f8d8 001c 	ldr.w	r0, [r8, #28]
c0de5298:	b3c0      	cbz	r0, c0de530c <addContentCenter+0x3d0>
c0de529a:	f89a 00ad 	ldrb.w	r0, [sl, #173]	@ 0xad
c0de529e:	9100      	str	r1, [sp, #0]
c0de52a0:	f001 f8fe 	bl	c0de64a0 <OUTLINED_FUNCTION_1>
c0de52a4:	2401      	movs	r4, #1
c0de52a6:	4607      	mov	r7, r0
c0de52a8:	77c4      	strb	r4, [r0, #31]
c0de52aa:	f8d8 001c 	ldr.w	r0, [r8, #28]
c0de52ae:	f005 fc41 	bl	c0deab34 <pic>
c0de52b2:	4601      	mov	r1, r0
c0de52b4:	20a0      	movs	r0, #160	@ 0xa0
c0de52b6:	2301      	movs	r3, #1
c0de52b8:	717c      	strb	r4, [r7, #5]
c0de52ba:	7138      	strb	r0, [r7, #4]
c0de52bc:	200b      	movs	r0, #11
c0de52be:	0e0a      	lsrs	r2, r1, #24
c0de52c0:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de52c4:	2005      	movs	r0, #5
c0de52c6:	f887 0020 	strb.w	r0, [r7, #32]
c0de52ca:	f001 f8ed 	bl	c0de64a8 <OUTLINED_FUNCTION_2>
c0de52ce:	3010      	adds	r0, #16
c0de52d0:	f001 faa4 	bl	c0de681c <OUTLINED_FUNCTION_39>
c0de52d4:	d016      	beq.n	c0de5304 <addContentCenter+0x3c8>
c0de52d6:	f001 f96b 	bl	c0de65b0 <OUTLINED_FUNCTION_10>
c0de52da:	706b      	strb	r3, [r5, #1]
c0de52dc:	2300      	movs	r3, #0
c0de52de:	70ae      	strb	r6, [r5, #2]
c0de52e0:	2608      	movs	r6, #8
c0de52e2:	722b      	strb	r3, [r5, #8]
c0de52e4:	2310      	movs	r3, #16
c0de52e6:	712e      	strb	r6, [r5, #4]
c0de52e8:	71eb      	strb	r3, [r5, #7]
c0de52ea:	f854 4c04 	ldr.w	r4, [r4, #-4]
c0de52ee:	7ee4      	ldrb	r4, [r4, #27]
c0de52f0:	2c02      	cmp	r4, #2
c0de52f2:	d105      	bne.n	c0de5300 <addContentCenter+0x3c4>
c0de52f4:	f8b8 3020 	ldrh.w	r3, [r8, #32]
c0de52f8:	3310      	adds	r3, #16
c0de52fa:	0a1c      	lsrs	r4, r3, #8
c0de52fc:	767b      	strb	r3, [r7, #25]
c0de52fe:	76bc      	strb	r4, [r7, #26]
c0de5300:	460e      	mov	r6, r1
c0de5302:	e001      	b.n	c0de5308 <addContentCenter+0x3cc>
c0de5304:	f001 f8e4 	bl	c0de64d0 <OUTLINED_FUNCTION_3>
c0de5308:	f001 fa39 	bl	c0de677e <OUTLINED_FUNCTION_30>
c0de530c:	2001      	movs	r0, #1
c0de530e:	f88b 1006 	strb.w	r1, [fp, #6]
c0de5312:	f88b 0005 	strb.w	r0, [fp, #5]
c0de5316:	20a0      	movs	r0, #160	@ 0xa0
c0de5318:	f88b 0004 	strb.w	r0, [fp, #4]
c0de531c:	2005      	movs	r0, #5
c0de531e:	f88b 0016 	strb.w	r0, [fp, #22]
c0de5322:	2000      	movs	r0, #0
c0de5324:	f88b 001f 	strb.w	r0, [fp, #31]
c0de5328:	0a08      	lsrs	r0, r1, #8
c0de532a:	f88b 0007 	strb.w	r0, [fp, #7]
c0de532e:	f898 0022 	ldrb.w	r0, [r8, #34]	@ 0x22
c0de5332:	b130      	cbz	r0, c0de5342 <addContentCenter+0x406>
c0de5334:	f101 0028 	add.w	r0, r1, #40	@ 0x28
c0de5338:	f88b 0006 	strb.w	r0, [fp, #6]
c0de533c:	0a00      	lsrs	r0, r0, #8
c0de533e:	f88b 0007 	strb.w	r0, [fp, #7]
c0de5342:	f8da 00a0 	ldr.w	r0, [sl, #160]	@ 0xa0
c0de5346:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de534a:	7843      	ldrb	r3, [r0, #1]
c0de534c:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de5350:	7884      	ldrb	r4, [r0, #2]
c0de5352:	78c0      	ldrb	r0, [r0, #3]
c0de5354:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de5358:	ea44 2000 	orr.w	r0, r4, r0, lsl #8
c0de535c:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de5360:	f840 b022 	str.w	fp, [r0, r2, lsl #2]
c0de5364:	f8da 00a0 	ldr.w	r0, [sl, #160]	@ 0xa0
c0de5368:	f001 f894 	bl	c0de6494 <OUTLINED_FUNCTION_0>
c0de536c:	4658      	mov	r0, fp
c0de536e:	b004      	add	sp, #16
c0de5370:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de5374:	00001305 	.word	0x00001305

c0de5378 <nbgl_layoutAddContentCenter>:
c0de5378:	b128      	cbz	r0, c0de5386 <nbgl_layoutAddContentCenter+0xe>
c0de537a:	b580      	push	{r7, lr}
c0de537c:	f7ff fdde 	bl	c0de4f3c <addContentCenter>
c0de5380:	f001 fa42 	bl	c0de6808 <OUTLINED_FUNCTION_36>
c0de5384:	bd80      	pop	{r7, pc}
c0de5386:	f001 ba50 	b.w	c0de682a <OUTLINED_FUNCTION_40>

c0de538a <nbgl_layoutAddQRCode>:
c0de538a:	2800      	cmp	r0, #0
c0de538c:	f000 810a 	beq.w	c0de55a4 <nbgl_layoutAddQRCode+0x21a>
c0de5390:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de5394:	4680      	mov	r8, r0
c0de5396:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de539a:	460e      	mov	r6, r1
c0de539c:	f001 f982 	bl	c0de66a4 <OUTLINED_FUNCTION_19>
c0de53a0:	4682      	mov	sl, r0
c0de53a2:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de53a6:	08c1      	lsrs	r1, r0, #3
c0de53a8:	2003      	movs	r0, #3
c0de53aa:	f005 f9e7 	bl	c0dea77c <nbgl_containerPoolGet>
c0de53ae:	4655      	mov	r5, sl
c0de53b0:	0e01      	lsrs	r1, r0, #24
c0de53b2:	2400      	movs	r4, #0
c0de53b4:	f805 0f22 	strb.w	r0, [r5, #34]!
c0de53b8:	f88a 4020 	strb.w	r4, [sl, #32]
c0de53bc:	f001 fae5 	bl	c0de698a <OUTLINED_FUNCTION_69>
c0de53c0:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de53c4:	08c1      	lsrs	r1, r0, #3
c0de53c6:	200a      	movs	r0, #10
c0de53c8:	f005 f9d3 	bl	c0dea772 <nbgl_objPoolGet>
c0de53cc:	4683      	mov	fp, r0
c0de53ce:	6830      	ldr	r0, [r6, #0]
c0de53d0:	f005 fbb0 	bl	c0deab34 <pic>
c0de53d4:	f005 fe2c 	bl	c0deb030 <strlen>
c0de53d8:	283e      	cmp	r0, #62	@ 0x3e
c0de53da:	f04f 0000 	mov.w	r0, #0
c0de53de:	465f      	mov	r7, fp
c0de53e0:	bf88      	it	hi
c0de53e2:	2001      	movhi	r0, #1
c0de53e4:	f88b 0020 	strb.w	r0, [fp, #32]
c0de53e8:	f88b 401f 	strb.w	r4, [fp, #31]
c0de53ec:	f44f 7084 	mov.w	r0, #264	@ 0x108
c0de53f0:	bf88      	it	hi
c0de53f2:	20e4      	movhi	r0, #228	@ 0xe4
c0de53f4:	f88b 0004 	strb.w	r0, [fp, #4]
c0de53f8:	f807 0f06 	strb.w	r0, [r7, #6]!
c0de53fc:	0a00      	lsrs	r0, r0, #8
c0de53fe:	7078      	strb	r0, [r7, #1]
c0de5400:	f88b 0005 	strb.w	r0, [fp, #5]
c0de5404:	6830      	ldr	r0, [r6, #0]
c0de5406:	f005 fb95 	bl	c0deab34 <pic>
c0de540a:	4659      	mov	r1, fp
c0de540c:	0e02      	lsrs	r2, r0, #24
c0de540e:	f88b 4009 	strb.w	r4, [fp, #9]
c0de5412:	f801 0f21 	strb.w	r0, [r1, #33]!
c0de5416:	f001 f934 	bl	c0de6682 <OUTLINED_FUNCTION_17>
c0de541a:	f88b 0022 	strb.w	r0, [fp, #34]	@ 0x22
c0de541e:	7828      	ldrb	r0, [r5, #0]
c0de5420:	78a9      	ldrb	r1, [r5, #2]
c0de5422:	78ea      	ldrb	r2, [r5, #3]
c0de5424:	f89a 5023 	ldrb.w	r5, [sl, #35]	@ 0x23
c0de5428:	f89a 3020 	ldrb.w	r3, [sl, #32]
c0de542c:	ea40 2005 	orr.w	r0, r0, r5, lsl #8
c0de5430:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de5434:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de5438:	7879      	ldrb	r1, [r7, #1]
c0de543a:	f840 b023 	str.w	fp, [r0, r3, lsl #2]
c0de543e:	2002      	movs	r0, #2
c0de5440:	f88b 0016 	strb.w	r0, [fp, #22]
c0de5444:	1c58      	adds	r0, r3, #1
c0de5446:	f88a 0020 	strb.w	r0, [sl, #32]
c0de544a:	7838      	ldrb	r0, [r7, #0]
c0de544c:	ea40 2701 	orr.w	r7, r0, r1, lsl #8
c0de5450:	6870      	ldr	r0, [r6, #4]
c0de5452:	2800      	cmp	r0, #0
c0de5454:	d057      	beq.n	c0de5506 <nbgl_layoutAddQRCode+0x17c>
c0de5456:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de545a:	f001 f821 	bl	c0de64a0 <OUTLINED_FUNCTION_1>
c0de545e:	4605      	mov	r5, r0
c0de5460:	77c4      	strb	r4, [r0, #31]
c0de5462:	6870      	ldr	r0, [r6, #4]
c0de5464:	f005 fb66 	bl	c0deab34 <pic>
c0de5468:	4601      	mov	r1, r0
c0de546a:	2001      	movs	r0, #1
c0de546c:	7168      	strb	r0, [r5, #5]
c0de546e:	20a0      	movs	r0, #160	@ 0xa0
c0de5470:	0e0a      	lsrs	r2, r1, #24
c0de5472:	7128      	strb	r0, [r5, #4]
c0de5474:	2005      	movs	r0, #5
c0de5476:	f885 0020 	strb.w	r0, [r5, #32]
c0de547a:	4628      	mov	r0, r5
c0de547c:	f001 f8b0 	bl	c0de65e0 <OUTLINED_FUNCTION_11>
c0de5480:	f885 0027 	strb.w	r0, [r5, #39]	@ 0x27
c0de5484:	f895 0024 	ldrb.w	r0, [r5, #36]	@ 0x24
c0de5488:	7bf2      	ldrb	r2, [r6, #15]
c0de548a:	f040 0001 	orr.w	r0, r0, #1
c0de548e:	f885 0024 	strb.w	r0, [r5, #36]	@ 0x24
c0de5492:	200d      	movs	r0, #13
c0de5494:	2a00      	cmp	r2, #0
c0de5496:	bf08      	it	eq
c0de5498:	200b      	moveq	r0, #11
c0de549a:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de549e:	f885 0022 	strb.w	r0, [r5, #34]	@ 0x22
c0de54a2:	2301      	movs	r3, #1
c0de54a4:	f005 f97e 	bl	c0dea7a4 <nbgl_getTextHeightInWidth>
c0de54a8:	4651      	mov	r1, sl
c0de54aa:	46be      	mov	lr, r7
c0de54ac:	f811 cf22 	ldrb.w	ip, [r1, #34]!
c0de54b0:	784f      	ldrb	r7, [r1, #1]
c0de54b2:	788c      	ldrb	r4, [r1, #2]
c0de54b4:	78ca      	ldrb	r2, [r1, #3]
c0de54b6:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de54ba:	ea4c 2707 	orr.w	r7, ip, r7, lsl #8
c0de54be:	ea44 2202 	orr.w	r2, r4, r2, lsl #8
c0de54c2:	46b4      	mov	ip, r6
c0de54c4:	ea47 4202 	orr.w	r2, r7, r2, lsl #16
c0de54c8:	462f      	mov	r7, r5
c0de54ca:	eb02 0483 	add.w	r4, r2, r3, lsl #2
c0de54ce:	f854 4c04 	ldr.w	r4, [r4, #-4]
c0de54d2:	f807 4f12 	strb.w	r4, [r7, #18]!
c0de54d6:	0e26      	lsrs	r6, r4, #24
c0de54d8:	70fe      	strb	r6, [r7, #3]
c0de54da:	0c26      	lsrs	r6, r4, #16
c0de54dc:	0a24      	lsrs	r4, r4, #8
c0de54de:	70be      	strb	r6, [r7, #2]
c0de54e0:	74ec      	strb	r4, [r5, #19]
c0de54e2:	f842 5023 	str.w	r5, [r2, r3, lsl #2]
c0de54e6:	2200      	movs	r2, #0
c0de54e8:	71a8      	strb	r0, [r5, #6]
c0de54ea:	4666      	mov	r6, ip
c0de54ec:	76aa      	strb	r2, [r5, #26]
c0de54ee:	2218      	movs	r2, #24
c0de54f0:	766a      	strb	r2, [r5, #25]
c0de54f2:	2208      	movs	r2, #8
c0de54f4:	75aa      	strb	r2, [r5, #22]
c0de54f6:	0a02      	lsrs	r2, r0, #8
c0de54f8:	4470      	add	r0, lr
c0de54fa:	71ea      	strb	r2, [r5, #7]
c0de54fc:	1c5a      	adds	r2, r3, #1
c0de54fe:	f100 0718 	add.w	r7, r0, #24
c0de5502:	f801 2c02 	strb.w	r2, [r1, #-2]
c0de5506:	68b0      	ldr	r0, [r6, #8]
c0de5508:	2800      	cmp	r0, #0
c0de550a:	d04d      	beq.n	c0de55a8 <nbgl_layoutAddQRCode+0x21e>
c0de550c:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de5510:	f000 ffc6 	bl	c0de64a0 <OUTLINED_FUNCTION_1>
c0de5514:	2401      	movs	r4, #1
c0de5516:	4605      	mov	r5, r0
c0de5518:	77c4      	strb	r4, [r0, #31]
c0de551a:	68b0      	ldr	r0, [r6, #8]
c0de551c:	f005 fb0a 	bl	c0deab34 <pic>
c0de5520:	4601      	mov	r1, r0
c0de5522:	20a0      	movs	r0, #160	@ 0xa0
c0de5524:	2301      	movs	r3, #1
c0de5526:	716c      	strb	r4, [r5, #5]
c0de5528:	7128      	strb	r0, [r5, #4]
c0de552a:	200b      	movs	r0, #11
c0de552c:	0e0a      	lsrs	r2, r1, #24
c0de552e:	f885 0022 	strb.w	r0, [r5, #34]	@ 0x22
c0de5532:	2005      	movs	r0, #5
c0de5534:	f001 f816 	bl	c0de6564 <OUTLINED_FUNCTION_7>
c0de5538:	4651      	mov	r1, sl
c0de553a:	9701      	str	r7, [sp, #4]
c0de553c:	46b6      	mov	lr, r6
c0de553e:	6876      	ldr	r6, [r6, #4]
c0de5540:	f811 3f22 	ldrb.w	r3, [r1, #34]!
c0de5544:	784c      	ldrb	r4, [r1, #1]
c0de5546:	f891 c002 	ldrb.w	ip, [r1, #2]
c0de554a:	78cf      	ldrb	r7, [r1, #3]
c0de554c:	f811 2c02 	ldrb.w	r2, [r1, #-2]
c0de5550:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de5554:	ea4c 2407 	orr.w	r4, ip, r7, lsl #8
c0de5558:	2700      	movs	r7, #0
c0de555a:	ea43 4c04 	orr.w	ip, r3, r4, lsl #16
c0de555e:	eb0c 0482 	add.w	r4, ip, r2, lsl #2
c0de5562:	f854 4c04 	ldr.w	r4, [r4, #-4]
c0de5566:	76af      	strb	r7, [r5, #26]
c0de5568:	271c      	movs	r7, #28
c0de556a:	2e00      	cmp	r6, #0
c0de556c:	462e      	mov	r6, r5
c0de556e:	bf08      	it	eq
c0de5570:	2720      	moveq	r7, #32
c0de5572:	766f      	strb	r7, [r5, #25]
c0de5574:	f806 4f12 	strb.w	r4, [r6, #18]!
c0de5578:	0e23      	lsrs	r3, r4, #24
c0de557a:	70f3      	strb	r3, [r6, #3]
c0de557c:	0c23      	lsrs	r3, r4, #16
c0de557e:	70b3      	strb	r3, [r6, #2]
c0de5580:	0a23      	lsrs	r3, r4, #8
c0de5582:	74eb      	strb	r3, [r5, #19]
c0de5584:	f84c 5022 	str.w	r5, [ip, r2, lsl #2]
c0de5588:	3201      	adds	r2, #1
c0de558a:	71a8      	strb	r0, [r5, #6]
c0de558c:	2308      	movs	r3, #8
c0de558e:	f801 2c02 	strb.w	r2, [r1, #-2]
c0de5592:	9901      	ldr	r1, [sp, #4]
c0de5594:	75ab      	strb	r3, [r5, #22]
c0de5596:	0a03      	lsrs	r3, r0, #8
c0de5598:	71eb      	strb	r3, [r5, #7]
c0de559a:	4408      	add	r0, r1
c0de559c:	4438      	add	r0, r7
c0de559e:	f100 0708 	add.w	r7, r0, #8
c0de55a2:	e002      	b.n	c0de55aa <nbgl_layoutAddQRCode+0x220>
c0de55a4:	f001 b941 	b.w	c0de682a <OUTLINED_FUNCTION_40>
c0de55a8:	46b6      	mov	lr, r6
c0de55aa:	f8d8 00a0 	ldr.w	r0, [r8, #160]	@ 0xa0
c0de55ae:	b2b9      	uxth	r1, r7
c0de55b0:	7982      	ldrb	r2, [r0, #6]
c0de55b2:	79c3      	ldrb	r3, [r0, #7]
c0de55b4:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de55b8:	3a10      	subs	r2, #16
c0de55ba:	428a      	cmp	r2, r1
c0de55bc:	dd01      	ble.n	c0de55c2 <nbgl_layoutAddQRCode+0x238>
c0de55be:	4675      	mov	r5, lr
c0de55c0:	e011      	b.n	c0de55e6 <nbgl_layoutAddQRCode+0x25c>
c0de55c2:	f89b 1020 	ldrb.w	r1, [fp, #32]
c0de55c6:	4675      	mov	r5, lr
c0de55c8:	b969      	cbnz	r1, c0de55e6 <nbgl_layoutAddQRCode+0x25c>
c0de55ca:	2100      	movs	r1, #0
c0de55cc:	2284      	movs	r2, #132	@ 0x84
c0de55ce:	3f84      	subs	r7, #132	@ 0x84
c0de55d0:	f88b 1007 	strb.w	r1, [fp, #7]
c0de55d4:	f88b 1005 	strb.w	r1, [fp, #5]
c0de55d8:	2102      	movs	r1, #2
c0de55da:	f88b 2006 	strb.w	r2, [fp, #6]
c0de55de:	f88b 2004 	strb.w	r2, [fp, #4]
c0de55e2:	f88b 1020 	strb.w	r1, [fp, #32]
c0de55e6:	2100      	movs	r1, #0
c0de55e8:	f88a 7006 	strb.w	r7, [sl, #6]
c0de55ec:	f88a 101f 	strb.w	r1, [sl, #31]
c0de55f0:	0a39      	lsrs	r1, r7, #8
c0de55f2:	f88a 1007 	strb.w	r1, [sl, #7]
c0de55f6:	7ba9      	ldrb	r1, [r5, #14]
c0de55f8:	b109      	cbz	r1, c0de55fe <nbgl_layoutAddQRCode+0x274>
c0de55fa:	2005      	movs	r0, #5
c0de55fc:	e00f      	b.n	c0de561e <nbgl_layoutAddQRCode+0x294>
c0de55fe:	f001 f8ea 	bl	c0de67d6 <OUTLINED_FUNCTION_34>
c0de5602:	4651      	mov	r1, sl
c0de5604:	eb00 0082 	add.w	r0, r0, r2, lsl #2
c0de5608:	f850 0c04 	ldr.w	r0, [r0, #-4]
c0de560c:	f801 0f12 	strb.w	r0, [r1, #18]!
c0de5610:	0e02      	lsrs	r2, r0, #24
c0de5612:	70ca      	strb	r2, [r1, #3]
c0de5614:	0c02      	lsrs	r2, r0, #16
c0de5616:	0a00      	lsrs	r0, r0, #8
c0de5618:	7048      	strb	r0, [r1, #1]
c0de561a:	2008      	movs	r0, #8
c0de561c:	708a      	strb	r2, [r1, #2]
c0de561e:	f88a 0016 	strb.w	r0, [sl, #22]
c0de5622:	f8d8 00a0 	ldr.w	r0, [r8, #160]	@ 0xa0
c0de5626:	f001 f8d6 	bl	c0de67d6 <OUTLINED_FUNCTION_34>
c0de562a:	f840 a022 	str.w	sl, [r0, r2, lsl #2]
c0de562e:	2001      	movs	r0, #1
c0de5630:	f88a 0005 	strb.w	r0, [sl, #5]
c0de5634:	20a0      	movs	r0, #160	@ 0xa0
c0de5636:	f88a 0004 	strb.w	r0, [sl, #4]
c0de563a:	89a8      	ldrh	r0, [r5, #12]
c0de563c:	f88a 0019 	strb.w	r0, [sl, #25]
c0de5640:	0a00      	lsrs	r0, r0, #8
c0de5642:	f88a 001a 	strb.w	r0, [sl, #26]
c0de5646:	f8d8 00a0 	ldr.w	r0, [r8, #160]	@ 0xa0
c0de564a:	f000 ff23 	bl	c0de6494 <OUTLINED_FUNCTION_0>
c0de564e:	b2b8      	uxth	r0, r7
c0de5650:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}

c0de5654 <nbgl_layoutAddChoiceButtons>:
c0de5654:	b510      	push	{r4, lr}
c0de5656:	b086      	sub	sp, #24
c0de5658:	2206      	movs	r2, #6
c0de565a:	f10d 0c04 	add.w	ip, sp, #4
c0de565e:	f8ad 2000 	strh.w	r2, [sp]
c0de5662:	e891 001c 	ldmia.w	r1, {r2, r3, r4}
c0de5666:	e8ac 001c 	stmia.w	ip!, {r2, r3, r4}
c0de566a:	898a      	ldrh	r2, [r1, #12]
c0de566c:	7b89      	ldrb	r1, [r1, #14]
c0de566e:	f88d 1012 	strb.w	r1, [sp, #18]
c0de5672:	4669      	mov	r1, sp
c0de5674:	f8ad 2010 	strh.w	r2, [sp, #16]
c0de5678:	f7fe fba6 	bl	c0de3dc8 <nbgl_layoutAddExtendedFooter>
c0de567c:	b006      	add	sp, #24
c0de567e:	bd10      	pop	{r4, pc}

c0de5680 <nbgl_layoutAddHorizontalButtons>:
c0de5680:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de5682:	2202      	movs	r2, #2
c0de5684:	f88d 2004 	strb.w	r2, [sp, #4]
c0de5688:	e9d1 2300 	ldrd	r2, r3, [r1]
c0de568c:	e9cd 2302 	strd	r2, r3, [sp, #8]
c0de5690:	890a      	ldrh	r2, [r1, #8]
c0de5692:	7a89      	ldrb	r1, [r1, #10]
c0de5694:	f8ad 2010 	strh.w	r2, [sp, #16]
c0de5698:	f88d 1012 	strb.w	r1, [sp, #18]
c0de569c:	a901      	add	r1, sp, #4
c0de569e:	f7fd ffff 	bl	c0de36a0 <nbgl_layoutAddUpFooter>
c0de56a2:	b006      	add	sp, #24
c0de56a4:	bd80      	pop	{r7, pc}
	...

c0de56a8 <nbgl_layoutAddTagValueList>:
c0de56a8:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de56ac:	b088      	sub	sp, #32
c0de56ae:	2800      	cmp	r0, #0
c0de56b0:	9007      	str	r0, [sp, #28]
c0de56b2:	f000 819f 	beq.w	c0de59f4 <nbgl_layoutAddTagValueList+0x34c>
c0de56b6:	48d2      	ldr	r0, [pc, #840]	@ (c0de5a00 <nbgl_layoutAddTagValueList+0x358>)
c0de56b8:	4688      	mov	r8, r1
c0de56ba:	2100      	movs	r1, #0
c0de56bc:	2700      	movs	r7, #0
c0de56be:	f8cd 8000 	str.w	r8, [sp]
c0de56c2:	4478      	add	r0, pc
c0de56c4:	9001      	str	r0, [sp, #4]
c0de56c6:	f898 0008 	ldrb.w	r0, [r8, #8]
c0de56ca:	4287      	cmp	r7, r0
c0de56cc:	f080 8190 	bcs.w	c0de59f0 <nbgl_layoutAddTagValueList+0x348>
c0de56d0:	f8d8 0000 	ldr.w	r0, [r8]
c0de56d4:	e9cd 7104 	strd	r7, r1, [sp, #16]
c0de56d8:	b110      	cbz	r0, c0de56e0 <nbgl_layoutAddTagValueList+0x38>
c0de56da:	eb00 0a01 	add.w	sl, r0, r1
c0de56de:	e007      	b.n	c0de56f0 <nbgl_layoutAddTagValueList+0x48>
c0de56e0:	f898 0009 	ldrb.w	r0, [r8, #9]
c0de56e4:	f8d8 1004 	ldr.w	r1, [r8, #4]
c0de56e8:	4438      	add	r0, r7
c0de56ea:	b2c0      	uxtb	r0, r0
c0de56ec:	4788      	blx	r1
c0de56ee:	4682      	mov	sl, r0
c0de56f0:	9f07      	ldr	r7, [sp, #28]
c0de56f2:	9c01      	ldr	r4, [sp, #4]
c0de56f4:	f897 00ad 	ldrb.w	r0, [r7, #173]	@ 0xad
c0de56f8:	08c1      	lsrs	r1, r0, #3
c0de56fa:	2001      	movs	r0, #1
c0de56fc:	47a0      	blx	r4
c0de56fe:	4683      	mov	fp, r0
c0de5700:	f8da 0008 	ldr.w	r0, [sl, #8]
c0de5704:	2800      	cmp	r0, #0
c0de5706:	f04f 0003 	mov.w	r0, #3
c0de570a:	bf08      	it	eq
c0de570c:	2002      	moveq	r0, #2
c0de570e:	f897 10ad 	ldrb.w	r1, [r7, #173]	@ 0xad
c0de5712:	08c9      	lsrs	r1, r1, #3
c0de5714:	f005 f832 	bl	c0dea77c <nbgl_containerPoolGet>
c0de5718:	465e      	mov	r6, fp
c0de571a:	0e01      	lsrs	r1, r0, #24
c0de571c:	f806 0f22 	strb.w	r0, [r6, #34]!
c0de5720:	f001 f94d 	bl	c0de69be <OUTLINED_FUNCTION_73>
c0de5724:	f001 f92c 	bl	c0de6980 <OUTLINED_FUNCTION_68>
c0de5728:	4605      	mov	r5, r0
c0de572a:	f001 f929 	bl	c0de6980 <OUTLINED_FUNCTION_68>
c0de572e:	4607      	mov	r7, r0
c0de5730:	f8da 0000 	ldr.w	r0, [sl]
c0de5734:	f04f 0801 	mov.w	r8, #1
c0de5738:	f885 801f 	strb.w	r8, [r5, #31]
c0de573c:	f005 f9fa 	bl	c0deab34 <pic>
c0de5740:	4601      	mov	r1, r0
c0de5742:	20a0      	movs	r0, #160	@ 0xa0
c0de5744:	2301      	movs	r3, #1
c0de5746:	f885 8005 	strb.w	r8, [r5, #5]
c0de574a:	7128      	strb	r0, [r5, #4]
c0de574c:	200b      	movs	r0, #11
c0de574e:	0e0a      	lsrs	r2, r1, #24
c0de5750:	f885 0022 	strb.w	r0, [r5, #34]	@ 0x22
c0de5754:	2004      	movs	r0, #4
c0de5756:	f000 ff05 	bl	c0de6564 <OUTLINED_FUNCTION_7>
c0de575a:	4680      	mov	r8, r0
c0de575c:	71a8      	strb	r0, [r5, #6]
c0de575e:	0a00      	lsrs	r0, r0, #8
c0de5760:	2400      	movs	r4, #0
c0de5762:	2109      	movs	r1, #9
c0de5764:	71e8      	strb	r0, [r5, #7]
c0de5766:	f105 0012 	add.w	r0, r5, #18
c0de576a:	f885 4021 	strb.w	r4, [r5, #33]	@ 0x21
c0de576e:	f005 fc03 	bl	c0deaf78 <__aeabi_memclr>
c0de5772:	f89b 1023 	ldrb.w	r1, [fp, #35]	@ 0x23
c0de5776:	7832      	ldrb	r2, [r6, #0]
c0de5778:	78b3      	ldrb	r3, [r6, #2]
c0de577a:	78f6      	ldrb	r6, [r6, #3]
c0de577c:	f89b 0020 	ldrb.w	r0, [fp, #32]
c0de5780:	77fc      	strb	r4, [r7, #31]
c0de5782:	f001 f909 	bl	c0de6998 <OUTLINED_FUNCTION_70>
c0de5786:	f841 5020 	str.w	r5, [r1, r0, lsl #2]
c0de578a:	3001      	adds	r0, #1
c0de578c:	f88b 0020 	strb.w	r0, [fp, #32]
c0de5790:	f8da 0004 	ldr.w	r0, [sl, #4]
c0de5794:	f005 f9ce 	bl	c0deab34 <pic>
c0de5798:	4601      	mov	r1, r0
c0de579a:	2004      	movs	r0, #4
c0de579c:	9e00      	ldr	r6, [sp, #0]
c0de579e:	f887 0020 	strb.w	r0, [r7, #32]
c0de57a2:	4638      	mov	r0, r7
c0de57a4:	0e0a      	lsrs	r2, r1, #24
c0de57a6:	f000 ff1b 	bl	c0de65e0 <OUTLINED_FUNCTION_11>
c0de57aa:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de57ae:	7b70      	ldrb	r0, [r6, #13]
c0de57b0:	2800      	cmp	r0, #0
c0de57b2:	f04f 000c 	mov.w	r0, #12
c0de57b6:	bf08      	it	eq
c0de57b8:	200d      	moveq	r0, #13
c0de57ba:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de57be:	f89a 200c 	ldrb.w	r2, [sl, #12]
c0de57c2:	0752      	lsls	r2, r2, #29
c0de57c4:	d418      	bmi.n	c0de57f8 <nbgl_layoutAddTagValueList+0x150>
c0de57c6:	f8da 2008 	ldr.w	r2, [sl, #8]
c0de57ca:	2a00      	cmp	r2, #0
c0de57cc:	f000 810c 	beq.w	c0de59e8 <nbgl_layoutAddTagValueList+0x340>
c0de57d0:	4610      	mov	r0, r2
c0de57d2:	f005 f9af 	bl	c0deab34 <pic>
c0de57d6:	4639      	mov	r1, r7
c0de57d8:	4604      	mov	r4, r0
c0de57da:	f811 2f26 	ldrb.w	r2, [r1, #38]!
c0de57de:	784b      	ldrb	r3, [r1, #1]
c0de57e0:	f811 0c04 	ldrb.w	r0, [r1, #-4]
c0de57e4:	f891 c002 	ldrb.w	ip, [r1, #2]
c0de57e8:	78c9      	ldrb	r1, [r1, #3]
c0de57ea:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de57ee:	ea4c 2101 	orr.w	r1, ip, r1, lsl #8
c0de57f2:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de57f6:	e001      	b.n	c0de57fc <nbgl_layoutAddTagValueList+0x154>
c0de57f8:	4c82      	ldr	r4, [pc, #520]	@ (c0de5a04 <nbgl_layoutAddTagValueList+0x35c>)
c0de57fa:	447c      	add	r4, pc
c0de57fc:	7822      	ldrb	r2, [r4, #0]
c0de57fe:	7863      	ldrb	r3, [r4, #1]
c0de5800:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de5804:	f5c2 72ca 	rsb	r2, r2, #404	@ 0x194
c0de5808:	0a13      	lsrs	r3, r2, #8
c0de580a:	713a      	strb	r2, [r7, #4]
c0de580c:	b292      	uxth	r2, r2
c0de580e:	717b      	strb	r3, [r7, #5]
c0de5810:	7bb3      	ldrb	r3, [r6, #14]
c0de5812:	f004 ffcc 	bl	c0dea7ae <nbgl_getTextNbLinesInWidth>
c0de5816:	7af3      	ldrb	r3, [r6, #11]
c0de5818:	f8cd 800c 	str.w	r8, [sp, #12]
c0de581c:	b16b      	cbz	r3, c0de583a <nbgl_layoutAddTagValueList+0x192>
c0de581e:	4298      	cmp	r0, r3
c0de5820:	d90b      	bls.n	c0de583a <nbgl_layoutAddTagValueList+0x192>
c0de5822:	f897 2024 	ldrb.w	r2, [r7, #36]	@ 0x24
c0de5826:	7ab1      	ldrb	r1, [r6, #10]
c0de5828:	4618      	mov	r0, r3
c0de582a:	f887 3025 	strb.w	r3, [r7, #37]	@ 0x25
c0de582e:	f002 02fd 	and.w	r2, r2, #253	@ 0xfd
c0de5832:	ea42 0141 	orr.w	r1, r2, r1, lsl #1
c0de5836:	f887 1024 	strb.w	r1, [r7, #36]	@ 0x24
c0de583a:	9006      	str	r0, [sp, #24]
c0de583c:	f897 0022 	ldrb.w	r0, [r7, #34]	@ 0x22
c0de5840:	f004 ffa1 	bl	c0dea786 <nbgl_getFont>
c0de5844:	f897 2024 	ldrb.w	r2, [r7, #36]	@ 0x24
c0de5848:	7bb1      	ldrb	r1, [r6, #14]
c0de584a:	f890 c007 	ldrb.w	ip, [r0, #7]
c0de584e:	0a28      	lsrs	r0, r5, #8
c0de5850:	46b2      	mov	sl, r6
c0de5852:	f8dd 8010 	ldr.w	r8, [sp, #16]
c0de5856:	74f8      	strb	r0, [r7, #19]
c0de5858:	4638      	mov	r0, r7
c0de585a:	f002 02fe 	and.w	r2, r2, #254	@ 0xfe
c0de585e:	f800 5f12 	strb.w	r5, [r0, #18]!
c0de5862:	4311      	orrs	r1, r2
c0de5864:	f887 1024 	strb.w	r1, [r7, #36]	@ 0x24
c0de5868:	0e29      	lsrs	r1, r5, #24
c0de586a:	70c1      	strb	r1, [r0, #3]
c0de586c:	0c29      	lsrs	r1, r5, #16
c0de586e:	7081      	strb	r1, [r0, #2]
c0de5870:	4658      	mov	r0, fp
c0de5872:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de5876:	7843      	ldrb	r3, [r0, #1]
c0de5878:	7885      	ldrb	r5, [r0, #2]
c0de587a:	78c6      	ldrb	r6, [r0, #3]
c0de587c:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de5880:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de5884:	ea45 2306 	orr.w	r3, r5, r6, lsl #8
c0de5888:	2600      	movs	r6, #0
c0de588a:	ea41 4103 	orr.w	r1, r1, r3, lsl #16
c0de588e:	9b06      	ldr	r3, [sp, #24]
c0de5890:	76be      	strb	r6, [r7, #26]
c0de5892:	f887 6021 	strb.w	r6, [r7, #33]	@ 0x21
c0de5896:	f841 7022 	str.w	r7, [r1, r2, lsl #2]
c0de589a:	2104      	movs	r1, #4
c0de589c:	7679      	strb	r1, [r7, #25]
c0de589e:	2107      	movs	r1, #7
c0de58a0:	75b9      	strb	r1, [r7, #22]
c0de58a2:	fb03 f10c 	mul.w	r1, r3, ip
c0de58a6:	71b9      	strb	r1, [r7, #6]
c0de58a8:	0a09      	lsrs	r1, r1, #8
c0de58aa:	71f9      	strb	r1, [r7, #7]
c0de58ac:	1c51      	adds	r1, r2, #1
c0de58ae:	2201      	movs	r2, #1
c0de58b0:	2c00      	cmp	r4, #0
c0de58b2:	f800 1c02 	strb.w	r1, [r0, #-2]
c0de58b6:	d048      	beq.n	c0de594a <nbgl_layoutAddTagValueList+0x2a2>
c0de58b8:	9e07      	ldr	r6, [sp, #28]
c0de58ba:	f8cd c008 	str.w	ip, [sp, #8]
c0de58be:	f896 00ad 	ldrb.w	r0, [r6, #173]	@ 0xad
c0de58c2:	f000 ff31 	bl	c0de6728 <OUTLINED_FUNCTION_26>
c0de58c6:	f89a 200c 	ldrb.w	r2, [sl, #12]
c0de58ca:	4605      	mov	r5, r0
c0de58cc:	4630      	mov	r0, r6
c0de58ce:	4659      	mov	r1, fp
c0de58d0:	2309      	movs	r3, #9
c0de58d2:	f7fd fc55 	bl	c0de3180 <layoutAddCallbackObj>
c0de58d6:	0a21      	lsrs	r1, r4, #8
c0de58d8:	0e22      	lsrs	r2, r4, #24
c0de58da:	f8dd c008 	ldr.w	ip, [sp, #8]
c0de58de:	f885 1022 	strb.w	r1, [r5, #34]	@ 0x22
c0de58e2:	0a39      	lsrs	r1, r7, #8
c0de58e4:	74e9      	strb	r1, [r5, #19]
c0de58e6:	4629      	mov	r1, r5
c0de58e8:	f801 4f21 	strb.w	r4, [r1, #33]!
c0de58ec:	70ca      	strb	r2, [r1, #3]
c0de58ee:	0c22      	lsrs	r2, r4, #16
c0de58f0:	708a      	strb	r2, [r1, #2]
c0de58f2:	4629      	mov	r1, r5
c0de58f4:	0e3a      	lsrs	r2, r7, #24
c0de58f6:	f801 7f12 	strb.w	r7, [r1, #18]!
c0de58fa:	70ca      	strb	r2, [r1, #3]
c0de58fc:	0c3a      	lsrs	r2, r7, #16
c0de58fe:	708a      	strb	r2, [r1, #2]
c0de5900:	4659      	mov	r1, fp
c0de5902:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de5906:	784c      	ldrb	r4, [r1, #1]
c0de5908:	788e      	ldrb	r6, [r1, #2]
c0de590a:	78cf      	ldrb	r7, [r1, #3]
c0de590c:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de5910:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de5914:	ea46 2407 	orr.w	r4, r6, r7, lsl #8
c0de5918:	2600      	movs	r6, #0
c0de591a:	ea42 4204 	orr.w	r2, r2, r4, lsl #16
c0de591e:	762e      	strb	r6, [r5, #24]
c0de5920:	77ee      	strb	r6, [r5, #31]
c0de5922:	f842 5023 	str.w	r5, [r2, r3, lsl #2]
c0de5926:	220c      	movs	r2, #12
c0de5928:	75ea      	strb	r2, [r5, #23]
c0de592a:	f880 8005 	strb.w	r8, [r0, #5]
c0de592e:	f108 000f 	add.w	r0, r8, #15
c0de5932:	75aa      	strb	r2, [r5, #22]
c0de5934:	2201      	movs	r2, #1
c0de5936:	f801 6c05 	strb.w	r6, [r1, #-5]
c0de593a:	f801 0c04 	strb.w	r0, [r1, #-4]
c0de593e:	1c58      	adds	r0, r3, #1
c0de5940:	9b06      	ldr	r3, [sp, #24]
c0de5942:	f801 2c06 	strb.w	r2, [r1, #-6]
c0de5946:	f801 0c02 	strb.w	r0, [r1, #-2]
c0de594a:	9803      	ldr	r0, [sp, #12]
c0de594c:	f88b 2005 	strb.w	r2, [fp, #5]
c0de5950:	22a0      	movs	r2, #160	@ 0xa0
c0de5952:	4647      	mov	r7, r8
c0de5954:	f88b 6018 	strb.w	r6, [fp, #24]
c0de5958:	f88b 601f 	strb.w	r6, [fp, #31]
c0de595c:	f88b 2004 	strb.w	r2, [fp, #4]
c0de5960:	2220      	movs	r2, #32
c0de5962:	fb03 000c 	mla	r0, r3, ip, r0
c0de5966:	f04f 0c00 	mov.w	ip, #0
c0de596a:	f88b 2017 	strb.w	r2, [fp, #23]
c0de596e:	3004      	adds	r0, #4
c0de5970:	f88b 0006 	strb.w	r0, [fp, #6]
c0de5974:	0a00      	lsrs	r0, r0, #8
c0de5976:	f1b8 0f00 	cmp.w	r8, #0
c0de597a:	f88b 0007 	strb.w	r0, [fp, #7]
c0de597e:	d002      	beq.n	c0de5986 <nbgl_layoutAddTagValueList+0x2de>
c0de5980:	2018      	movs	r0, #24
c0de5982:	46d0      	mov	r8, sl
c0de5984:	e01b      	b.n	c0de59be <nbgl_layoutAddTagValueList+0x316>
c0de5986:	9807      	ldr	r0, [sp, #28]
c0de5988:	46d0      	mov	r8, sl
c0de598a:	68c0      	ldr	r0, [r0, #12]
c0de598c:	b1b0      	cbz	r0, c0de59bc <nbgl_layoutAddTagValueList+0x314>
c0de598e:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de5992:	b199      	cbz	r1, c0de59bc <nbgl_layoutAddTagValueList+0x314>
c0de5994:	f810 2f22 	ldrb.w	r2, [r0, #34]!
c0de5998:	7843      	ldrb	r3, [r0, #1]
c0de599a:	7884      	ldrb	r4, [r0, #2]
c0de599c:	78c0      	ldrb	r0, [r0, #3]
c0de599e:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de59a2:	ea44 2000 	orr.w	r0, r4, r0, lsl #8
c0de59a6:	ea42 4000 	orr.w	r0, r2, r0, lsl #16
c0de59aa:	eb00 0081 	add.w	r0, r0, r1, lsl #2
c0de59ae:	f850 0c04 	ldr.w	r0, [r0, #-4]
c0de59b2:	7ec0      	ldrb	r0, [r0, #27]
c0de59b4:	2803      	cmp	r0, #3
c0de59b6:	d101      	bne.n	c0de59bc <nbgl_layoutAddTagValueList+0x314>
c0de59b8:	2018      	movs	r0, #24
c0de59ba:	e000      	b.n	c0de59be <nbgl_layoutAddTagValueList+0x316>
c0de59bc:	2000      	movs	r0, #0
c0de59be:	9e07      	ldr	r6, [sp, #28]
c0de59c0:	f88b c01a 	strb.w	ip, [fp, #26]
c0de59c4:	f88b c016 	strb.w	ip, [fp, #22]
c0de59c8:	3701      	adds	r7, #1
c0de59ca:	f8d6 10a0 	ldr.w	r1, [r6, #160]	@ 0xa0
c0de59ce:	f000 fd93 	bl	c0de64f8 <OUTLINED_FUNCTION_4>
c0de59d2:	f841 b023 	str.w	fp, [r1, r3, lsl #2]
c0de59d6:	f88b 0019 	strb.w	r0, [fp, #25]
c0de59da:	f8d6 00a0 	ldr.w	r0, [r6, #160]	@ 0xa0
c0de59de:	f000 fd59 	bl	c0de6494 <OUTLINED_FUNCTION_0>
c0de59e2:	9905      	ldr	r1, [sp, #20]
c0de59e4:	3110      	adds	r1, #16
c0de59e6:	e66e      	b.n	c0de56c6 <nbgl_layoutAddTagValueList+0x1e>
c0de59e8:	2400      	movs	r4, #0
c0de59ea:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de59ee:	e70b      	b.n	c0de5808 <nbgl_layoutAddTagValueList+0x160>
c0de59f0:	2000      	movs	r0, #0
c0de59f2:	e001      	b.n	c0de59f8 <nbgl_layoutAddTagValueList+0x350>
c0de59f4:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de59f8:	b008      	add	sp, #32
c0de59fa:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de59fe:	bf00      	nop
c0de5a00:	000050ad 	.word	0x000050ad
c0de5a04:	0000686a 	.word	0x0000686a

c0de5a08 <nbgl_layoutAddSeparationLine>:
c0de5a08:	b570      	push	{r4, r5, r6, lr}
c0de5a0a:	f000 ffa0 	bl	c0de694e <OUTLINED_FUNCTION_64>
c0de5a0e:	08c0      	lsrs	r0, r0, #3
c0de5a10:	f7ff fa44 	bl	c0de4e9c <createHorizontalLine>
c0de5a14:	f8d4 10a0 	ldr.w	r1, [r4, #160]	@ 0xa0
c0de5a18:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de5a1c:	784d      	ldrb	r5, [r1, #1]
c0de5a1e:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de5a22:	788e      	ldrb	r6, [r1, #2]
c0de5a24:	78c9      	ldrb	r1, [r1, #3]
c0de5a26:	ea42 2205 	orr.w	r2, r2, r5, lsl #8
c0de5a2a:	ea46 2101 	orr.w	r1, r6, r1, lsl #8
c0de5a2e:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de5a32:	f841 0023 	str.w	r0, [r1, r3, lsl #2]
c0de5a36:	21ff      	movs	r1, #255	@ 0xff
c0de5a38:	7641      	strb	r1, [r0, #25]
c0de5a3a:	7681      	strb	r1, [r0, #26]
c0de5a3c:	f000 ff2b 	bl	c0de6896 <OUTLINED_FUNCTION_48>
c0de5a40:	bd70      	pop	{r4, r5, r6, pc}

c0de5a42 <nbgl_layoutAddButton>:
c0de5a42:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de5a46:	b086      	sub	sp, #24
c0de5a48:	b318      	cbz	r0, c0de5a92 <nbgl_layoutAddButton+0x50>
c0de5a4a:	4680      	mov	r8, r0
c0de5a4c:	7ac8      	ldrb	r0, [r1, #11]
c0de5a4e:	460d      	mov	r5, r1
c0de5a50:	b108      	cbz	r0, c0de5a56 <nbgl_layoutAddButton+0x14>
c0de5a52:	7aa8      	ldrb	r0, [r5, #10]
c0de5a54:	b300      	cbz	r0, c0de5a98 <nbgl_layoutAddButton+0x56>
c0de5a56:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de5a5a:	f000 fddf 	bl	c0de661c <OUTLINED_FUNCTION_13>
c0de5a5e:	4606      	mov	r6, r0
c0de5a60:	7a2a      	ldrb	r2, [r5, #8]
c0de5a62:	7b2b      	ldrb	r3, [r5, #12]
c0de5a64:	4640      	mov	r0, r8
c0de5a66:	4631      	mov	r1, r6
c0de5a68:	f7fd fb8a 	bl	c0de3180 <layoutAddCallbackObj>
c0de5a6c:	b188      	cbz	r0, c0de5a92 <nbgl_layoutAddButton+0x50>
c0de5a6e:	210c      	movs	r1, #12
c0de5a70:	2000      	movs	r0, #0
c0de5a72:	7671      	strb	r1, [r6, #25]
c0de5a74:	2120      	movs	r1, #32
c0de5a76:	76b0      	strb	r0, [r6, #26]
c0de5a78:	7630      	strb	r0, [r6, #24]
c0de5a7a:	75b0      	strb	r0, [r6, #22]
c0de5a7c:	75f1      	strb	r1, [r6, #23]
c0de5a7e:	7a69      	ldrb	r1, [r5, #9]
c0de5a80:	b1e9      	cbz	r1, c0de5abe <nbgl_layoutAddButton+0x7c>
c0de5a82:	f886 0021 	strb.w	r0, [r6, #33]	@ 0x21
c0de5a86:	2003      	movs	r0, #3
c0de5a88:	77f0      	strb	r0, [r6, #31]
c0de5a8a:	2902      	cmp	r1, #2
c0de5a8c:	bf18      	it	ne
c0de5a8e:	2002      	movne	r0, #2
c0de5a90:	e019      	b.n	c0de5ac6 <nbgl_layoutAddButton+0x84>
c0de5a92:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de5a96:	e09f      	b.n	c0de5bd8 <nbgl_layoutAddButton+0x196>
c0de5a98:	f8d8 0010 	ldr.w	r0, [r8, #16]
c0de5a9c:	2800      	cmp	r0, #0
c0de5a9e:	f000 809e 	beq.w	c0de5bde <nbgl_layoutAddButton+0x19c>
c0de5aa2:	2001      	movs	r0, #1
c0de5aa4:	f88d 0000 	strb.w	r0, [sp]
c0de5aa8:	e9d5 0100 	ldrd	r0, r1, [r5]
c0de5aac:	9001      	str	r0, [sp, #4]
c0de5aae:	7b28      	ldrb	r0, [r5, #12]
c0de5ab0:	9102      	str	r1, [sp, #8]
c0de5ab2:	4669      	mov	r1, sp
c0de5ab4:	f000 ff5d 	bl	c0de6972 <OUTLINED_FUNCTION_67>
c0de5ab8:	f7fd fdf2 	bl	c0de36a0 <nbgl_layoutAddUpFooter>
c0de5abc:	e08c      	b.n	c0de5bd8 <nbgl_layoutAddButton+0x196>
c0de5abe:	2103      	movs	r1, #3
c0de5ac0:	77f0      	strb	r0, [r6, #31]
c0de5ac2:	f886 1021 	strb.w	r1, [r6, #33]	@ 0x21
c0de5ac6:	f886 0020 	strb.w	r0, [r6, #32]
c0de5aca:	6828      	ldr	r0, [r5, #0]
c0de5acc:	f005 f832 	bl	c0deab34 <pic>
c0de5ad0:	210c      	movs	r1, #12
c0de5ad2:	0e02      	lsrs	r2, r0, #24
c0de5ad4:	f886 1023 	strb.w	r1, [r6, #35]	@ 0x23
c0de5ad8:	4631      	mov	r1, r6
c0de5ada:	f000 fe59 	bl	c0de6790 <OUTLINED_FUNCTION_31>
c0de5ade:	f000 fdfe 	bl	c0de66de <OUTLINED_FUNCTION_22>
c0de5ae2:	4631      	mov	r1, r6
c0de5ae4:	0e02      	lsrs	r2, r0, #24
c0de5ae6:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de5aea:	f000 fef8 	bl	c0de68de <OUTLINED_FUNCTION_53>
c0de5aee:	7aa8      	ldrb	r0, [r5, #10]
c0de5af0:	b308      	cbz	r0, c0de5b36 <nbgl_layoutAddButton+0xf4>
c0de5af2:	4632      	mov	r2, r6
c0de5af4:	f896 1026 	ldrb.w	r1, [r6, #38]	@ 0x26
c0de5af8:	f896 0023 	ldrb.w	r0, [r6, #35]	@ 0x23
c0de5afc:	f812 3f25 	ldrb.w	r3, [r2, #37]!
c0de5b00:	f000 ff30 	bl	c0de6964 <OUTLINED_FUNCTION_66>
c0de5b04:	ea41 4102 	orr.w	r1, r1, r2, lsl #16
c0de5b08:	f004 fe56 	bl	c0dea7b8 <nbgl_getTextWidth>
c0de5b0c:	4631      	mov	r1, r6
c0de5b0e:	3040      	adds	r0, #64	@ 0x40
c0de5b10:	f811 2f2e 	ldrb.w	r2, [r1, #46]!
c0de5b14:	784b      	ldrb	r3, [r1, #1]
c0de5b16:	788f      	ldrb	r7, [r1, #2]
c0de5b18:	78c9      	ldrb	r1, [r1, #3]
c0de5b1a:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de5b1e:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de5b22:	ea42 4201 	orr.w	r2, r2, r1, lsl #16
c0de5b26:	2100      	movs	r1, #0
c0de5b28:	b18a      	cbz	r2, c0de5b4e <nbgl_layoutAddButton+0x10c>
c0de5b2a:	7813      	ldrb	r3, [r2, #0]
c0de5b2c:	7852      	ldrb	r2, [r2, #1]
c0de5b2e:	ea43 2202 	orr.w	r2, r3, r2, lsl #8
c0de5b32:	320c      	adds	r2, #12
c0de5b34:	e00c      	b.n	c0de5b50 <nbgl_layoutAddButton+0x10e>
c0de5b36:	2000      	movs	r0, #0
c0de5b38:	71f0      	strb	r0, [r6, #7]
c0de5b3a:	2058      	movs	r0, #88	@ 0x58
c0de5b3c:	71b0      	strb	r0, [r6, #6]
c0de5b3e:	2001      	movs	r0, #1
c0de5b40:	7170      	strb	r0, [r6, #5]
c0de5b42:	20a0      	movs	r0, #160	@ 0xa0
c0de5b44:	7130      	strb	r0, [r6, #4]
c0de5b46:	2004      	movs	r0, #4
c0de5b48:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de5b4c:	e01c      	b.n	c0de5b88 <nbgl_layoutAddButton+0x146>
c0de5b4e:	2200      	movs	r2, #0
c0de5b50:	4410      	add	r0, r2
c0de5b52:	71f1      	strb	r1, [r6, #7]
c0de5b54:	2140      	movs	r1, #64	@ 0x40
c0de5b56:	71b1      	strb	r1, [r6, #6]
c0de5b58:	2102      	movs	r1, #2
c0de5b5a:	0a02      	lsrs	r2, r0, #8
c0de5b5c:	7130      	strb	r0, [r6, #4]
c0de5b5e:	f886 1022 	strb.w	r1, [r6, #34]	@ 0x22
c0de5b62:	7172      	strb	r2, [r6, #5]
c0de5b64:	7aea      	ldrb	r2, [r5, #11]
c0de5b66:	2a01      	cmp	r2, #1
c0de5b68:	d00e      	beq.n	c0de5b88 <nbgl_layoutAddButton+0x146>
c0de5b6a:	b280      	uxth	r0, r0
c0de5b6c:	f5c0 70d0 	rsb	r0, r0, #416	@ 0x1a0
c0de5b70:	fb90 f0f1 	sdiv	r0, r0, r1
c0de5b74:	4631      	mov	r1, r6
c0de5b76:	f811 2f17 	ldrb.w	r2, [r1, #23]!
c0de5b7a:	784b      	ldrb	r3, [r1, #1]
c0de5b7c:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de5b80:	4410      	add	r0, r2
c0de5b82:	7008      	strb	r0, [r1, #0]
c0de5b84:	0a00      	lsrs	r0, r0, #8
c0de5b86:	7048      	strb	r0, [r1, #1]
c0de5b88:	2000      	movs	r0, #0
c0de5b8a:	4631      	mov	r1, r6
c0de5b8c:	f801 0f12 	strb.w	r0, [r1, #18]!
c0de5b90:	74f0      	strb	r0, [r6, #19]
c0de5b92:	70c8      	strb	r0, [r1, #3]
c0de5b94:	7088      	strb	r0, [r1, #2]
c0de5b96:	f8d8 10a0 	ldr.w	r1, [r8, #160]	@ 0xa0
c0de5b9a:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de5b9e:	784f      	ldrb	r7, [r1, #1]
c0de5ba0:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de5ba4:	788c      	ldrb	r4, [r1, #2]
c0de5ba6:	78c9      	ldrb	r1, [r1, #3]
c0de5ba8:	ea42 2207 	orr.w	r2, r2, r7, lsl #8
c0de5bac:	ea44 2101 	orr.w	r1, r4, r1, lsl #8
c0de5bb0:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de5bb4:	2208      	movs	r2, #8
c0de5bb6:	f841 6023 	str.w	r6, [r1, r3, lsl #2]
c0de5bba:	2101      	movs	r1, #1
c0de5bbc:	7770      	strb	r0, [r6, #29]
c0de5bbe:	7731      	strb	r1, [r6, #28]
c0de5bc0:	7aa9      	ldrb	r1, [r5, #10]
c0de5bc2:	2900      	cmp	r1, #0
c0de5bc4:	bf08      	it	eq
c0de5bc6:	2207      	moveq	r2, #7
c0de5bc8:	77b2      	strb	r2, [r6, #30]
c0de5bca:	f8d8 10a0 	ldr.w	r1, [r8, #160]	@ 0xa0
c0de5bce:	f891 2020 	ldrb.w	r2, [r1, #32]
c0de5bd2:	3201      	adds	r2, #1
c0de5bd4:	f881 2020 	strb.w	r2, [r1, #32]
c0de5bd8:	b006      	add	sp, #24
c0de5bda:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de5bde:	2005      	movs	r0, #5
c0de5be0:	f8ad 0000 	strh.w	r0, [sp]
c0de5be4:	e9d5 0100 	ldrd	r0, r1, [r5]
c0de5be8:	9001      	str	r0, [sp, #4]
c0de5bea:	7b28      	ldrb	r0, [r5, #12]
c0de5bec:	9102      	str	r1, [sp, #8]
c0de5bee:	4669      	mov	r1, sp
c0de5bf0:	f000 febf 	bl	c0de6972 <OUTLINED_FUNCTION_67>
c0de5bf4:	f7fe f8e8 	bl	c0de3dc8 <nbgl_layoutAddExtendedFooter>
c0de5bf8:	e7ee      	b.n	c0de5bd8 <nbgl_layoutAddButton+0x196>

c0de5bfa <nbgl_layoutAddLongPressButton>:
c0de5bfa:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de5bfc:	9102      	str	r1, [sp, #8]
c0de5bfe:	2100      	movs	r1, #0
c0de5c00:	f88d 300d 	strb.w	r3, [sp, #13]
c0de5c04:	f88d 200c 	strb.w	r2, [sp, #12]
c0de5c08:	f88d 1004 	strb.w	r1, [sp, #4]
c0de5c0c:	b118      	cbz	r0, c0de5c16 <nbgl_layoutAddLongPressButton+0x1c>
c0de5c0e:	a901      	add	r1, sp, #4
c0de5c10:	f7fd fd46 	bl	c0de36a0 <nbgl_layoutAddUpFooter>
c0de5c14:	e001      	b.n	c0de5c1a <nbgl_layoutAddLongPressButton+0x20>
c0de5c16:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de5c1a:	b006      	add	sp, #24
c0de5c1c:	bd80      	pop	{r7, pc}

c0de5c1e <nbgl_layoutAddFooter>:
c0de5c1e:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de5c20:	9101      	str	r1, [sp, #4]
c0de5c22:	f240 1101 	movw	r1, #257	@ 0x101
c0de5c26:	f88d 2009 	strb.w	r2, [sp, #9]
c0de5c2a:	2200      	movs	r2, #0
c0de5c2c:	f88d 300a 	strb.w	r3, [sp, #10]
c0de5c30:	f8ad 1000 	strh.w	r1, [sp]
c0de5c34:	4669      	mov	r1, sp
c0de5c36:	f88d 2008 	strb.w	r2, [sp, #8]
c0de5c3a:	f7fe f8c5 	bl	c0de3dc8 <nbgl_layoutAddExtendedFooter>
c0de5c3e:	b006      	add	sp, #24
c0de5c40:	bd80      	pop	{r7, pc}

c0de5c42 <nbgl_layoutAddSplitFooter>:
c0de5c42:	b5fe      	push	{r1, r2, r3, r4, r5, r6, r7, lr}
c0de5c44:	9101      	str	r1, [sp, #4]
c0de5c46:	f44f 7181 	mov.w	r1, #258	@ 0x102
c0de5c4a:	f88d 200c 	strb.w	r2, [sp, #12]
c0de5c4e:	9302      	str	r3, [sp, #8]
c0de5c50:	f8ad 1000 	strh.w	r1, [sp]
c0de5c54:	9909      	ldr	r1, [sp, #36]	@ 0x24
c0de5c56:	f88d 100e 	strb.w	r1, [sp, #14]
c0de5c5a:	9908      	ldr	r1, [sp, #32]
c0de5c5c:	f88d 100d 	strb.w	r1, [sp, #13]
c0de5c60:	4669      	mov	r1, sp
c0de5c62:	f7fe f8b1 	bl	c0de3dc8 <nbgl_layoutAddExtendedFooter>
c0de5c66:	b006      	add	sp, #24
c0de5c68:	bd80      	pop	{r7, pc}
	...

c0de5c6c <nbgl_layoutAddHeader>:
c0de5c6c:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de5c70:	2800      	cmp	r0, #0
c0de5c72:	f000 822c 	beq.w	c0de60ce <nbgl_layoutAddHeader+0x462>
c0de5c76:	460d      	mov	r5, r1
c0de5c78:	b119      	cbz	r1, c0de5c82 <nbgl_layoutAddHeader+0x16>
c0de5c7a:	4604      	mov	r4, r0
c0de5c7c:	7828      	ldrb	r0, [r5, #0]
c0de5c7e:	2806      	cmp	r0, #6
c0de5c80:	d903      	bls.n	c0de5c8a <nbgl_layoutAddHeader+0x1e>
c0de5c82:	f06f 0001 	mvn.w	r0, #1
c0de5c86:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de5c8a:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5c8e:	2601      	movs	r6, #1
c0de5c90:	f000 fd08 	bl	c0de66a4 <OUTLINED_FUNCTION_19>
c0de5c94:	f000 fe17 	bl	c0de68c6 <OUTLINED_FUNCTION_51>
c0de5c98:	60e0      	str	r0, [r4, #12]
c0de5c9a:	f000 fe35 	bl	c0de6908 <OUTLINED_FUNCTION_57>
c0de5c9e:	68e1      	ldr	r1, [r4, #12]
c0de5ca0:	0a02      	lsrs	r2, r0, #8
c0de5ca2:	0e03      	lsrs	r3, r0, #24
c0de5ca4:	f881 2023 	strb.w	r2, [r1, #35]	@ 0x23
c0de5ca8:	2202      	movs	r2, #2
c0de5caa:	f000 fe54 	bl	c0de6956 <OUTLINED_FUNCTION_65>
c0de5cae:	70d3      	strb	r3, [r2, #3]
c0de5cb0:	7828      	ldrb	r0, [r5, #0]
c0de5cb2:	1e42      	subs	r2, r0, #1
c0de5cb4:	2a02      	cmp	r2, #2
c0de5cb6:	d311      	bcc.n	c0de5cdc <nbgl_layoutAddHeader+0x70>
c0de5cb8:	2806      	cmp	r0, #6
c0de5cba:	f000 80b9 	beq.w	c0de5e30 <nbgl_layoutAddHeader+0x1c4>
c0de5cbe:	2803      	cmp	r0, #3
c0de5cc0:	f000 8210 	beq.w	c0de60e4 <nbgl_layoutAddHeader+0x478>
c0de5cc4:	2804      	cmp	r0, #4
c0de5cc6:	f000 80e4 	beq.w	c0de5e92 <nbgl_layoutAddHeader+0x226>
c0de5cca:	2805      	cmp	r0, #5
c0de5ccc:	d006      	beq.n	c0de5cdc <nbgl_layoutAddHeader+0x70>
c0de5cce:	2800      	cmp	r0, #0
c0de5cd0:	d1d7      	bne.n	c0de5c82 <nbgl_layoutAddHeader+0x16>
c0de5cd2:	88a8      	ldrh	r0, [r5, #4]
c0de5cd4:	7188      	strb	r0, [r1, #6]
c0de5cd6:	0a00      	lsrs	r0, r0, #8
c0de5cd8:	71c8      	strb	r0, [r1, #7]
c0de5cda:	e203      	b.n	c0de60e4 <nbgl_layoutAddHeader+0x478>
c0de5cdc:	f000 fdd8 	bl	c0de6890 <OUTLINED_FUNCTION_46>
c0de5ce0:	9001      	str	r0, [sp, #4]
c0de5ce2:	7828      	ldrb	r0, [r5, #0]
c0de5ce4:	210c      	movs	r1, #12
c0de5ce6:	2805      	cmp	r0, #5
c0de5ce8:	bf08      	it	eq
c0de5cea:	2111      	moveq	r1, #17
c0de5cec:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5cf0:	f815 a001 	ldrb.w	sl, [r5, r1]
c0de5cf4:	f000 fc92 	bl	c0de661c <OUTLINED_FUNCTION_13>
c0de5cf8:	4683      	mov	fp, r0
c0de5cfa:	f04f 0803 	mov.w	r8, #3
c0de5cfe:	f1ba 0fff 	cmp.w	sl, #255	@ 0xff
c0de5d02:	d00f      	beq.n	c0de5d24 <nbgl_layoutAddHeader+0xb8>
c0de5d04:	7828      	ldrb	r0, [r5, #0]
c0de5d06:	210d      	movs	r1, #13
c0de5d08:	4652      	mov	r2, sl
c0de5d0a:	2805      	cmp	r0, #5
c0de5d0c:	bf08      	it	eq
c0de5d0e:	2113      	moveq	r1, #19
c0de5d10:	5c6b      	ldrb	r3, [r5, r1]
c0de5d12:	4620      	mov	r0, r4
c0de5d14:	4659      	mov	r1, fp
c0de5d16:	f7fd fa33 	bl	c0de3180 <layoutAddCallbackObj>
c0de5d1a:	2800      	cmp	r0, #0
c0de5d1c:	f000 81d7 	beq.w	c0de60ce <nbgl_layoutAddHeader+0x462>
c0de5d20:	2000      	movs	r0, #0
c0de5d22:	e000      	b.n	c0de5d26 <nbgl_layoutAddHeader+0xba>
c0de5d24:	2003      	movs	r0, #3
c0de5d26:	f88b 0021 	strb.w	r0, [fp, #33]	@ 0x21
c0de5d2a:	2004      	movs	r0, #4
c0de5d2c:	2600      	movs	r6, #0
c0de5d2e:	2160      	movs	r1, #96	@ 0x60
c0de5d30:	f88b 801f 	strb.w	r8, [fp, #31]
c0de5d34:	f88b 8020 	strb.w	r8, [fp, #32]
c0de5d38:	f88b 0016 	strb.w	r0, [fp, #22]
c0de5d3c:	4658      	mov	r0, fp
c0de5d3e:	f88b 1006 	strb.w	r1, [fp, #6]
c0de5d42:	2168      	movs	r1, #104	@ 0x68
c0de5d44:	f88b 6026 	strb.w	r6, [fp, #38]	@ 0x26
c0de5d48:	f88b 6007 	strb.w	r6, [fp, #7]
c0de5d4c:	f88b 6005 	strb.w	r6, [fp, #5]
c0de5d50:	f800 6f25 	strb.w	r6, [r0, #37]!
c0de5d54:	f88b 1004 	strb.w	r1, [fp, #4]
c0de5d58:	70c6      	strb	r6, [r0, #3]
c0de5d5a:	7086      	strb	r6, [r0, #2]
c0de5d5c:	48de      	ldr	r0, [pc, #888]	@ (c0de60d8 <nbgl_layoutAddHeader+0x46c>)
c0de5d5e:	4478      	add	r0, pc
c0de5d60:	f004 fee8 	bl	c0deab34 <pic>
c0de5d64:	4659      	mov	r1, fp
c0de5d66:	0e02      	lsrs	r2, r0, #24
c0de5d68:	f88b 601d 	strb.w	r6, [fp, #29]
c0de5d6c:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de5d70:	f000 fc87 	bl	c0de6682 <OUTLINED_FUNCTION_17>
c0de5d74:	f88b 002f 	strb.w	r0, [fp, #47]	@ 0x2f
c0de5d78:	68e0      	ldr	r0, [r4, #12]
c0de5d7a:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de5d7e:	7843      	ldrb	r3, [r0, #1]
c0de5d80:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de5d84:	7887      	ldrb	r7, [r0, #2]
c0de5d86:	78c0      	ldrb	r0, [r0, #3]
c0de5d88:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de5d8c:	ea47 2000 	orr.w	r0, r7, r0, lsl #8
c0de5d90:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de5d94:	f840 b022 	str.w	fp, [r0, r2, lsl #2]
c0de5d98:	f1ba 00ff 	subs.w	r0, sl, #255	@ 0xff
c0de5d9c:	bf18      	it	ne
c0de5d9e:	2001      	movne	r0, #1
c0de5da0:	f88b 001c 	strb.w	r0, [fp, #28]
c0de5da4:	68e1      	ldr	r1, [r4, #12]
c0de5da6:	2006      	movs	r0, #6
c0de5da8:	f88b 001e 	strb.w	r0, [fp, #30]
c0de5dac:	f000 fd85 	bl	c0de68ba <OUTLINED_FUNCTION_50>
c0de5db0:	9801      	ldr	r0, [sp, #4]
c0de5db2:	2800      	cmp	r0, #0
c0de5db4:	f000 8093 	beq.w	c0de5ede <nbgl_layoutAddHeader+0x272>
c0de5db8:	7828      	ldrb	r0, [r5, #0]
c0de5dba:	f04f 0a00 	mov.w	sl, #0
c0de5dbe:	2802      	cmp	r0, #2
c0de5dc0:	d11b      	bne.n	c0de5dfa <nbgl_layoutAddHeader+0x18e>
c0de5dc2:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5dc6:	f000 fcaf 	bl	c0de6728 <OUTLINED_FUNCTION_26>
c0de5dca:	4607      	mov	r7, r0
c0de5dcc:	f000 fc87 	bl	c0de66de <OUTLINED_FUNCTION_22>
c0de5dd0:	4639      	mov	r1, r7
c0de5dd2:	0e02      	lsrs	r2, r0, #24
c0de5dd4:	f887 a01f 	strb.w	sl, [r7, #31]
c0de5dd8:	46ba      	mov	sl, r7
c0de5dda:	f801 0f21 	strb.w	r0, [r1, #33]!
c0de5dde:	f000 fc50 	bl	c0de6682 <OUTLINED_FUNCTION_17>
c0de5de2:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de5de6:	68e0      	ldr	r0, [r4, #12]
c0de5de8:	f000 fbae 	bl	c0de6548 <OUTLINED_FUNCTION_6>
c0de5dec:	f840 7022 	str.w	r7, [r0, r2, lsl #2]
c0de5df0:	2005      	movs	r0, #5
c0de5df2:	75b8      	strb	r0, [r7, #22]
c0de5df4:	68e0      	ldr	r0, [r4, #12]
c0de5df6:	f000 fb4d 	bl	c0de6494 <OUTLINED_FUNCTION_0>
c0de5dfa:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5dfe:	f000 fb4f 	bl	c0de64a0 <OUTLINED_FUNCTION_1>
c0de5e02:	782b      	ldrb	r3, [r5, #0]
c0de5e04:	4680      	mov	r8, r0
c0de5e06:	2b05      	cmp	r3, #5
c0de5e08:	d16e      	bne.n	c0de5ee8 <nbgl_layoutAddHeader+0x27c>
c0de5e0a:	7c2a      	ldrb	r2, [r5, #16]
c0de5e0c:	2aff      	cmp	r2, #255	@ 0xff
c0de5e0e:	d06a      	beq.n	c0de5ee6 <nbgl_layoutAddHeader+0x27a>
c0de5e10:	7ceb      	ldrb	r3, [r5, #19]
c0de5e12:	4620      	mov	r0, r4
c0de5e14:	4641      	mov	r1, r8
c0de5e16:	f7fd f9b3 	bl	c0de3180 <layoutAddCallbackObj>
c0de5e1a:	2800      	cmp	r0, #0
c0de5e1c:	f000 8157 	beq.w	c0de60ce <nbgl_layoutAddHeader+0x462>
c0de5e20:	2000      	movs	r0, #0
c0de5e22:	f888 001d 	strb.w	r0, [r8, #29]
c0de5e26:	2001      	movs	r0, #1
c0de5e28:	f888 001c 	strb.w	r0, [r8, #28]
c0de5e2c:	782b      	ldrb	r3, [r5, #0]
c0de5e2e:	e05b      	b.n	c0de5ee8 <nbgl_layoutAddHeader+0x27c>
c0de5e30:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5e34:	f000 fb34 	bl	c0de64a0 <OUTLINED_FUNCTION_1>
c0de5e38:	4606      	mov	r6, r0
c0de5e3a:	7a2a      	ldrb	r2, [r5, #8]
c0de5e3c:	7a6b      	ldrb	r3, [r5, #9]
c0de5e3e:	f000 fc07 	bl	c0de6650 <OUTLINED_FUNCTION_15>
c0de5e42:	2800      	cmp	r0, #0
c0de5e44:	f000 8143 	beq.w	c0de60ce <nbgl_layoutAddHeader+0x462>
c0de5e48:	2020      	movs	r0, #32
c0de5e4a:	4637      	mov	r7, r6
c0de5e4c:	f04f 0a00 	mov.w	sl, #0
c0de5e50:	f04f 0806 	mov.w	r8, #6
c0de5e54:	f04f 0b01 	mov.w	fp, #1
c0de5e58:	75f0      	strb	r0, [r6, #23]
c0de5e5a:	20a0      	movs	r0, #160	@ 0xa0
c0de5e5c:	f886 a01f 	strb.w	sl, [r6, #31]
c0de5e60:	f000 fda1 	bl	c0de69a6 <OUTLINED_FUNCTION_71>
c0de5e64:	f886 b005 	strb.w	fp, [r6, #5]
c0de5e68:	7130      	strb	r0, [r6, #4]
c0de5e6a:	2060      	movs	r0, #96	@ 0x60
c0de5e6c:	f807 0f06 	strb.w	r0, [r7, #6]!
c0de5e70:	f887 a001 	strb.w	sl, [r7, #1]
c0de5e74:	f000 fc33 	bl	c0de66de <OUTLINED_FUNCTION_22>
c0de5e78:	f000 fd37 	bl	c0de68ea <OUTLINED_FUNCTION_54>
c0de5e7c:	f886 8020 	strb.w	r8, [r6, #32]
c0de5e80:	f000 fb48 	bl	c0de6514 <OUTLINED_FUNCTION_5>
c0de5e84:	f886 b01c 	strb.w	fp, [r6, #28]
c0de5e88:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de5e8c:	2005      	movs	r0, #5
c0de5e8e:	77b0      	strb	r0, [r6, #30]
c0de5e90:	e01d      	b.n	c0de5ece <nbgl_layoutAddHeader+0x262>
c0de5e92:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de5e96:	f000 fb03 	bl	c0de64a0 <OUTLINED_FUNCTION_1>
c0de5e9a:	4606      	mov	r6, r0
c0de5e9c:	2101      	movs	r1, #1
c0de5e9e:	2000      	movs	r0, #0
c0de5ea0:	7171      	strb	r1, [r6, #5]
c0de5ea2:	21a0      	movs	r1, #160	@ 0xa0
c0de5ea4:	4637      	mov	r7, r6
c0de5ea6:	77f0      	strb	r0, [r6, #31]
c0de5ea8:	7131      	strb	r1, [r6, #4]
c0de5eaa:	2160      	movs	r1, #96	@ 0x60
c0de5eac:	f807 1f06 	strb.w	r1, [r7, #6]!
c0de5eb0:	7078      	strb	r0, [r7, #1]
c0de5eb2:	f000 fc14 	bl	c0de66de <OUTLINED_FUNCTION_22>
c0de5eb6:	f896 1024 	ldrb.w	r1, [r6, #36]	@ 0x24
c0de5eba:	0e02      	lsrs	r2, r0, #24
c0de5ebc:	f041 0101 	orr.w	r1, r1, #1
c0de5ec0:	f886 1024 	strb.w	r1, [r6, #36]	@ 0x24
c0de5ec4:	4631      	mov	r1, r6
c0de5ec6:	f000 fb25 	bl	c0de6514 <OUTLINED_FUNCTION_5>
c0de5eca:	f000 fd02 	bl	c0de68d2 <OUTLINED_FUNCTION_52>
c0de5ece:	68e1      	ldr	r1, [r4, #12]
c0de5ed0:	787a      	ldrb	r2, [r7, #1]
c0de5ed2:	7838      	ldrb	r0, [r7, #0]
c0de5ed4:	71ca      	strb	r2, [r1, #7]
c0de5ed6:	7188      	strb	r0, [r1, #6]
c0de5ed8:	f000 fcef 	bl	c0de68ba <OUTLINED_FUNCTION_50>
c0de5edc:	e102      	b.n	c0de60e4 <nbgl_layoutAddHeader+0x478>
c0de5ede:	7828      	ldrb	r0, [r5, #0]
c0de5ee0:	f04f 0800 	mov.w	r8, #0
c0de5ee4:	e098      	b.n	c0de6018 <nbgl_layoutAddHeader+0x3ac>
c0de5ee6:	2305      	movs	r3, #5
c0de5ee8:	68e2      	ldr	r2, [r4, #12]
c0de5eea:	f04f 0e00 	mov.w	lr, #0
c0de5eee:	f04f 0c05 	mov.w	ip, #5
c0de5ef2:	f888 e01f 	strb.w	lr, [r8, #31]
c0de5ef6:	f888 c016 	strb.w	ip, [r8, #22]
c0de5efa:	7916      	ldrb	r6, [r2, #4]
c0de5efc:	7952      	ldrb	r2, [r2, #5]
c0de5efe:	ea46 2702 	orr.w	r7, r6, r2, lsl #8
c0de5f02:	f1a7 02d0 	sub.w	r2, r7, #208	@ 0xd0
c0de5f06:	0a16      	lsrs	r6, r2, #8
c0de5f08:	f888 2004 	strb.w	r2, [r8, #4]
c0de5f0c:	2b02      	cmp	r3, #2
c0de5f0e:	f888 6005 	strb.w	r6, [r8, #5]
c0de5f12:	d117      	bne.n	c0de5f44 <nbgl_layoutAddHeader+0x2d8>
c0de5f14:	4652      	mov	r2, sl
c0de5f16:	f812 3f21 	ldrb.w	r3, [r2, #33]!
c0de5f1a:	7856      	ldrb	r6, [r2, #1]
c0de5f1c:	7890      	ldrb	r0, [r2, #2]
c0de5f1e:	78d2      	ldrb	r2, [r2, #3]
c0de5f20:	ea43 2306 	orr.w	r3, r3, r6, lsl #8
c0de5f24:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de5f28:	ea43 4000 	orr.w	r0, r3, r0, lsl #16
c0de5f2c:	7802      	ldrb	r2, [r0, #0]
c0de5f2e:	7840      	ldrb	r0, [r0, #1]
c0de5f30:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de5f34:	1a38      	subs	r0, r7, r0
c0de5f36:	f1a0 02e0 	sub.w	r2, r0, #224	@ 0xe0
c0de5f3a:	0a10      	lsrs	r0, r2, #8
c0de5f3c:	f888 2004 	strb.w	r2, [r8, #4]
c0de5f40:	f888 0005 	strb.w	r0, [r8, #5]
c0de5f44:	9901      	ldr	r1, [sp, #4]
c0de5f46:	4640      	mov	r0, r8
c0de5f48:	b292      	uxth	r2, r2
c0de5f4a:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de5f4e:	0e0b      	lsrs	r3, r1, #24
c0de5f50:	70c3      	strb	r3, [r0, #3]
c0de5f52:	0c0b      	lsrs	r3, r1, #16
c0de5f54:	f800 ec1f 	strb.w	lr, [r0, #-31]
c0de5f58:	f800 cc06 	strb.w	ip, [r0, #-6]
c0de5f5c:	7083      	strb	r3, [r0, #2]
c0de5f5e:	0a0b      	lsrs	r3, r1, #8
c0de5f60:	7043      	strb	r3, [r0, #1]
c0de5f62:	2360      	movs	r3, #96	@ 0x60
c0de5f64:	f800 3c20 	strb.w	r3, [r0, #-32]
c0de5f68:	230c      	movs	r3, #12
c0de5f6a:	f800 3c04 	strb.w	r3, [r0, #-4]
c0de5f6e:	f810 3c02 	ldrb.w	r3, [r0, #-2]
c0de5f72:	f043 0301 	orr.w	r3, r3, #1
c0de5f76:	f800 3c02 	strb.w	r3, [r0, #-2]
c0de5f7a:	200c      	movs	r0, #12
c0de5f7c:	2301      	movs	r3, #1
c0de5f7e:	f004 fc16 	bl	c0dea7ae <nbgl_getTextNbLinesInWidth>
c0de5f82:	7828      	ldrb	r0, [r5, #0]
c0de5f84:	2802      	cmp	r0, #2
c0de5f86:	d115      	bne.n	c0de5fb4 <nbgl_layoutAddHeader+0x348>
c0de5f88:	4646      	mov	r6, r8
c0de5f8a:	f816 1f26 	ldrb.w	r1, [r6, #38]!
c0de5f8e:	7872      	ldrb	r2, [r6, #1]
c0de5f90:	78b3      	ldrb	r3, [r6, #2]
c0de5f92:	78f7      	ldrb	r7, [r6, #3]
c0de5f94:	f816 0c04 	ldrb.w	r0, [r6, #-4]
c0de5f98:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de5f9c:	ea43 2207 	orr.w	r2, r3, r7, lsl #8
c0de5fa0:	ea41 4102 	orr.w	r1, r1, r2, lsl #16
c0de5fa4:	f004 fc08 	bl	c0dea7b8 <nbgl_getTextWidth>
c0de5fa8:	f806 0c22 	strb.w	r0, [r6, #-34]
c0de5fac:	0a00      	lsrs	r0, r0, #8
c0de5fae:	f806 0c21 	strb.w	r0, [r6, #-33]
c0de5fb2:	7828      	ldrb	r0, [r5, #0]
c0de5fb4:	f000 fbbc 	bl	c0de6730 <OUTLINED_FUNCTION_27>
c0de5fb8:	f841 8023 	str.w	r8, [r1, r3, lsl #2]
c0de5fbc:	68e1      	ldr	r1, [r4, #12]
c0de5fbe:	f891 2020 	ldrb.w	r2, [r1, #32]
c0de5fc2:	3201      	adds	r2, #1
c0de5fc4:	2802      	cmp	r0, #2
c0de5fc6:	f881 2020 	strb.w	r2, [r1, #32]
c0de5fca:	d125      	bne.n	c0de6018 <nbgl_layoutAddHeader+0x3ac>
c0de5fcc:	f898 0004 	ldrb.w	r0, [r8, #4]
c0de5fd0:	f898 2005 	ldrb.w	r2, [r8, #5]
c0de5fd4:	ea40 2002 	orr.w	r0, r0, r2, lsl #8
c0de5fd8:	f06f 0207 	mvn.w	r2, #7
c0de5fdc:	eba2 0050 	sub.w	r0, r2, r0, lsr #1
c0de5fe0:	f81a 2f21 	ldrb.w	r2, [sl, #33]!
c0de5fe4:	f80a 0c0a 	strb.w	r0, [sl, #-10]
c0de5fe8:	0a00      	lsrs	r0, r0, #8
c0de5fea:	f89a 3002 	ldrb.w	r3, [sl, #2]
c0de5fee:	f89a 6003 	ldrb.w	r6, [sl, #3]
c0de5ff2:	f80a 0c09 	strb.w	r0, [sl, #-9]
c0de5ff6:	f89a 0001 	ldrb.w	r0, [sl, #1]
c0de5ffa:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de5ffe:	ea43 2206 	orr.w	r2, r3, r6, lsl #8
c0de6002:	f000 fcd5 	bl	c0de69b0 <OUTLINED_FUNCTION_72>
c0de6006:	2208      	movs	r2, #8
c0de6008:	eb02 0050 	add.w	r0, r2, r0, lsr #1
c0de600c:	f888 0017 	strb.w	r0, [r8, #23]
c0de6010:	0a00      	lsrs	r0, r0, #8
c0de6012:	f888 0018 	strb.w	r0, [r8, #24]
c0de6016:	e061      	b.n	c0de60dc <nbgl_layoutAddHeader+0x470>
c0de6018:	2805      	cmp	r0, #5
c0de601a:	d15f      	bne.n	c0de60dc <nbgl_layoutAddHeader+0x470>
c0de601c:	6868      	ldr	r0, [r5, #4]
c0de601e:	2800      	cmp	r0, #0
c0de6020:	f000 8094 	beq.w	c0de614c <nbgl_layoutAddHeader+0x4e0>
c0de6024:	f000 fab4 	bl	c0de6590 <OUTLINED_FUNCTION_8>
c0de6028:	7caa      	ldrb	r2, [r5, #18]
c0de602a:	4682      	mov	sl, r0
c0de602c:	2aff      	cmp	r2, #255	@ 0xff
c0de602e:	d00c      	beq.n	c0de604a <nbgl_layoutAddHeader+0x3de>
c0de6030:	7ceb      	ldrb	r3, [r5, #19]
c0de6032:	4620      	mov	r0, r4
c0de6034:	4651      	mov	r1, sl
c0de6036:	f7fd f8a3 	bl	c0de3180 <layoutAddCallbackObj>
c0de603a:	2800      	cmp	r0, #0
c0de603c:	d047      	beq.n	c0de60ce <nbgl_layoutAddHeader+0x462>
c0de603e:	2000      	movs	r0, #0
c0de6040:	f88a 001d 	strb.w	r0, [sl, #29]
c0de6044:	2001      	movs	r0, #1
c0de6046:	f88a 001c 	strb.w	r0, [sl, #28]
c0de604a:	2003      	movs	r0, #3
c0de604c:	2106      	movs	r1, #6
c0de604e:	2700      	movs	r7, #0
c0de6050:	f88a 001f 	strb.w	r0, [sl, #31]
c0de6054:	f88a 1016 	strb.w	r1, [sl, #22]
c0de6058:	7ca9      	ldrb	r1, [r5, #18]
c0de605a:	f88a 0020 	strb.w	r0, [sl, #32]
c0de605e:	2060      	movs	r0, #96	@ 0x60
c0de6060:	f88a 7026 	strb.w	r7, [sl, #38]	@ 0x26
c0de6064:	f88a 7007 	strb.w	r7, [sl, #7]
c0de6068:	f88a 7005 	strb.w	r7, [sl, #5]
c0de606c:	f88a 0006 	strb.w	r0, [sl, #6]
c0de6070:	2068      	movs	r0, #104	@ 0x68
c0de6072:	f88a 0004 	strb.w	r0, [sl, #4]
c0de6076:	4650      	mov	r0, sl
c0de6078:	f800 7f25 	strb.w	r7, [r0, #37]!
c0de607c:	70c7      	strb	r7, [r0, #3]
c0de607e:	7087      	strb	r7, [r0, #2]
c0de6080:	f1a1 00ff 	sub.w	r0, r1, #255	@ 0xff
c0de6084:	fab0 f080 	clz	r0, r0
c0de6088:	0940      	lsrs	r0, r0, #5
c0de608a:	0040      	lsls	r0, r0, #1
c0de608c:	f88b 0021 	strb.w	r0, [fp, #33]	@ 0x21
c0de6090:	f000 fb25 	bl	c0de66de <OUTLINED_FUNCTION_22>
c0de6094:	4651      	mov	r1, sl
c0de6096:	0e02      	lsrs	r2, r0, #24
c0de6098:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de609c:	f000 faf1 	bl	c0de6682 <OUTLINED_FUNCTION_17>
c0de60a0:	f88a 002f 	strb.w	r0, [sl, #47]	@ 0x2f
c0de60a4:	68e0      	ldr	r0, [r4, #12]
c0de60a6:	f000 fa4f 	bl	c0de6548 <OUTLINED_FUNCTION_6>
c0de60aa:	f840 a022 	str.w	sl, [r0, r2, lsl #2]
c0de60ae:	2008      	movs	r0, #8
c0de60b0:	68e1      	ldr	r1, [r4, #12]
c0de60b2:	f88a 001e 	strb.w	r0, [sl, #30]
c0de60b6:	2060      	movs	r0, #96	@ 0x60
c0de60b8:	7188      	strb	r0, [r1, #6]
c0de60ba:	f891 0020 	ldrb.w	r0, [r1, #32]
c0de60be:	71cf      	strb	r7, [r1, #7]
c0de60c0:	3001      	adds	r0, #1
c0de60c2:	f881 0020 	strb.w	r0, [r1, #32]
c0de60c6:	7828      	ldrb	r0, [r5, #0]
c0de60c8:	2805      	cmp	r0, #5
c0de60ca:	d10b      	bne.n	c0de60e4 <nbgl_layoutAddHeader+0x478>
c0de60cc:	e044      	b.n	c0de6158 <nbgl_layoutAddHeader+0x4ec>
c0de60ce:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de60d2:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de60d6:	bf00      	nop
c0de60d8:	00005f6d 	.word	0x00005f6d
c0de60dc:	2000      	movs	r0, #0
c0de60de:	71c8      	strb	r0, [r1, #7]
c0de60e0:	2060      	movs	r0, #96	@ 0x60
c0de60e2:	7188      	strb	r0, [r1, #6]
c0de60e4:	7868      	ldrb	r0, [r5, #1]
c0de60e6:	b150      	cbz	r0, c0de60fe <nbgl_layoutAddHeader+0x492>
c0de60e8:	f000 faf4 	bl	c0de66d4 <OUTLINED_FUNCTION_21>
c0de60ec:	f000 fb20 	bl	c0de6730 <OUTLINED_FUNCTION_27>
c0de60f0:	f841 0023 	str.w	r0, [r1, r3, lsl #2]
c0de60f4:	2108      	movs	r1, #8
c0de60f6:	7581      	strb	r1, [r0, #22]
c0de60f8:	68e1      	ldr	r1, [r4, #12]
c0de60fa:	f000 fbde 	bl	c0de68ba <OUTLINED_FUNCTION_50>
c0de60fe:	68a0      	ldr	r0, [r4, #8]
c0de6100:	6001      	str	r1, [r0, #0]
c0de6102:	68e0      	ldr	r0, [r4, #12]
c0de6104:	f8d4 10a0 	ldr.w	r1, [r4, #160]	@ 0xa0
c0de6108:	4602      	mov	r2, r0
c0de610a:	f812 3f06 	ldrb.w	r3, [r2, #6]!
c0de610e:	7856      	ldrb	r6, [r2, #1]
c0de6110:	f801 0f12 	strb.w	r0, [r1, #18]!
c0de6114:	ea43 2306 	orr.w	r3, r3, r6, lsl #8
c0de6118:	f811 6d0c 	ldrb.w	r6, [r1, #-12]!
c0de611c:	784f      	ldrb	r7, [r1, #1]
c0de611e:	ea46 2607 	orr.w	r6, r6, r7, lsl #8
c0de6122:	1af3      	subs	r3, r6, r3
c0de6124:	700b      	strb	r3, [r1, #0]
c0de6126:	0a1b      	lsrs	r3, r3, #8
c0de6128:	704b      	strb	r3, [r1, #1]
c0de612a:	782b      	ldrb	r3, [r5, #0]
c0de612c:	f884 30aa 	strb.w	r3, [r4, #170]	@ 0xaa
c0de6130:	0e03      	lsrs	r3, r0, #24
c0de6132:	73cb      	strb	r3, [r1, #15]
c0de6134:	0c03      	lsrs	r3, r0, #16
c0de6136:	0a00      	lsrs	r0, r0, #8
c0de6138:	7348      	strb	r0, [r1, #13]
c0de613a:	2007      	movs	r0, #7
c0de613c:	738b      	strb	r3, [r1, #14]
c0de613e:	7408      	strb	r0, [r1, #16]
c0de6140:	7810      	ldrb	r0, [r2, #0]
c0de6142:	7851      	ldrb	r1, [r2, #1]
c0de6144:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de6148:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de614c:	f04f 0a00 	mov.w	sl, #0
c0de6150:	2060      	movs	r0, #96	@ 0x60
c0de6152:	f881 a007 	strb.w	sl, [r1, #7]
c0de6156:	7188      	strb	r0, [r1, #6]
c0de6158:	68e8      	ldr	r0, [r5, #12]
c0de615a:	2800      	cmp	r0, #0
c0de615c:	d0c2      	beq.n	c0de60e4 <nbgl_layoutAddHeader+0x478>
c0de615e:	f000 fab9 	bl	c0de66d4 <OUTLINED_FUNCTION_21>
c0de6162:	68e1      	ldr	r1, [r4, #12]
c0de6164:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de6168:	784e      	ldrb	r6, [r1, #1]
c0de616a:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de616e:	788f      	ldrb	r7, [r1, #2]
c0de6170:	78c9      	ldrb	r1, [r1, #3]
c0de6172:	ea42 2206 	orr.w	r2, r2, r6, lsl #8
c0de6176:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de617a:	2600      	movs	r6, #0
c0de617c:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de6180:	7686      	strb	r6, [r0, #26]
c0de6182:	f841 0023 	str.w	r0, [r1, r3, lsl #2]
c0de6186:	2160      	movs	r1, #96	@ 0x60
c0de6188:	7641      	strb	r1, [r0, #25]
c0de618a:	2102      	movs	r1, #2
c0de618c:	7581      	strb	r1, [r0, #22]
c0de618e:	68e0      	ldr	r0, [r4, #12]
c0de6190:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de6194:	3101      	adds	r1, #1
c0de6196:	f880 1020 	strb.w	r1, [r0, #32]
c0de619a:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de619e:	f000 f97f 	bl	c0de64a0 <OUTLINED_FUNCTION_1>
c0de61a2:	77c6      	strb	r6, [r0, #31]
c0de61a4:	4607      	mov	r7, r0
c0de61a6:	68e8      	ldr	r0, [r5, #12]
c0de61a8:	f004 fcc4 	bl	c0deab34 <pic>
c0de61ac:	4601      	mov	r1, r0
c0de61ae:	201c      	movs	r0, #28
c0de61b0:	2301      	movs	r3, #1
c0de61b2:	76be      	strb	r6, [r7, #26]
c0de61b4:	7678      	strb	r0, [r7, #25]
c0de61b6:	f000 fb77 	bl	c0de68a8 <OUTLINED_FUNCTION_49>
c0de61ba:	2004      	movs	r0, #4
c0de61bc:	f887 0020 	strb.w	r0, [r7, #32]
c0de61c0:	2008      	movs	r0, #8
c0de61c2:	75b8      	strb	r0, [r7, #22]
c0de61c4:	f000 f970 	bl	c0de64a8 <OUTLINED_FUNCTION_2>
c0de61c8:	68e1      	ldr	r1, [r4, #12]
c0de61ca:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de61ce:	784e      	ldrb	r6, [r1, #1]
c0de61d0:	f811 cc02 	ldrb.w	ip, [r1, #-2]
c0de61d4:	788b      	ldrb	r3, [r1, #2]
c0de61d6:	78c9      	ldrb	r1, [r1, #3]
c0de61d8:	ea42 2206 	orr.w	r2, r2, r6, lsl #8
c0de61dc:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de61e0:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de61e4:	f100 0238 	add.w	r2, r0, #56	@ 0x38
c0de61e8:	f841 702c 	str.w	r7, [r1, ip, lsl #2]
c0de61ec:	0a01      	lsrs	r1, r0, #8
c0de61ee:	71b8      	strb	r0, [r7, #6]
c0de61f0:	71f9      	strb	r1, [r7, #7]
c0de61f2:	f81b 1f19 	ldrb.w	r1, [fp, #25]!
c0de61f6:	f89b 3001 	ldrb.w	r3, [fp, #1]
c0de61fa:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de61fe:	eba1 0152 	sub.w	r1, r1, r2, lsr #1
c0de6202:	f88b 1000 	strb.w	r1, [fp]
c0de6206:	0a09      	lsrs	r1, r1, #8
c0de6208:	f88b 1001 	strb.w	r1, [fp, #1]
c0de620c:	68e1      	ldr	r1, [r4, #12]
c0de620e:	f891 3020 	ldrb.w	r3, [r1, #32]
c0de6212:	3301      	adds	r3, #1
c0de6214:	f881 3020 	strb.w	r3, [r1, #32]
c0de6218:	460b      	mov	r3, r1
c0de621a:	f813 6f06 	ldrb.w	r6, [r3, #6]!
c0de621e:	785f      	ldrb	r7, [r3, #1]
c0de6220:	ea46 2607 	orr.w	r6, r6, r7, lsl #8
c0de6224:	4430      	add	r0, r6
c0de6226:	3038      	adds	r0, #56	@ 0x38
c0de6228:	7018      	strb	r0, [r3, #0]
c0de622a:	0a00      	lsrs	r0, r0, #8
c0de622c:	7058      	strb	r0, [r3, #1]
c0de622e:	0850      	lsrs	r0, r2, #1
c0de6230:	f1b8 0f00 	cmp.w	r8, #0
c0de6234:	d00b      	beq.n	c0de624e <nbgl_layoutAddHeader+0x5e2>
c0de6236:	f818 2f19 	ldrb.w	r2, [r8, #25]!
c0de623a:	f898 3001 	ldrb.w	r3, [r8, #1]
c0de623e:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de6242:	1a12      	subs	r2, r2, r0
c0de6244:	f888 2000 	strb.w	r2, [r8]
c0de6248:	0a12      	lsrs	r2, r2, #8
c0de624a:	f888 2001 	strb.w	r2, [r8, #1]
c0de624e:	f1ba 0f00 	cmp.w	sl, #0
c0de6252:	f43f af47 	beq.w	c0de60e4 <nbgl_layoutAddHeader+0x478>
c0de6256:	f81a 2f19 	ldrb.w	r2, [sl, #25]!
c0de625a:	f89a 3001 	ldrb.w	r3, [sl, #1]
c0de625e:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de6262:	1a10      	subs	r0, r2, r0
c0de6264:	f88a 0000 	strb.w	r0, [sl]
c0de6268:	0a00      	lsrs	r0, r0, #8
c0de626a:	f88a 0001 	strb.w	r0, [sl, #1]
c0de626e:	e739      	b.n	c0de60e4 <nbgl_layoutAddHeader+0x478>

c0de6270 <nbgl_layoutAddProgressIndicator>:
c0de6270:	b510      	push	{r4, lr}
c0de6272:	b086      	sub	sp, #24
c0de6274:	9c09      	ldr	r4, [sp, #36]	@ 0x24
c0de6276:	f88d 100c 	strb.w	r1, [sp, #12]
c0de627a:	2100      	movs	r1, #0
c0de627c:	f88d 300e 	strb.w	r3, [sp, #14]
c0de6280:	f88d 200d 	strb.w	r2, [sp, #13]
c0de6284:	9102      	str	r1, [sp, #8]
c0de6286:	2103      	movs	r1, #3
c0de6288:	f88d 4011 	strb.w	r4, [sp, #17]
c0de628c:	24ff      	movs	r4, #255	@ 0xff
c0de628e:	f8ad 1004 	strh.w	r1, [sp, #4]
c0de6292:	f88d 4010 	strb.w	r4, [sp, #16]
c0de6296:	9c08      	ldr	r4, [sp, #32]
c0de6298:	f88d 400f 	strb.w	r4, [sp, #15]
c0de629c:	a901      	add	r1, sp, #4
c0de629e:	f7ff fce5 	bl	c0de5c6c <nbgl_layoutAddHeader>
c0de62a2:	b006      	add	sp, #24
c0de62a4:	bd10      	pop	{r4, pc}

c0de62a6 <nbgl_layoutDraw>:
c0de62a6:	b1d8      	cbz	r0, c0de62e0 <nbgl_layoutDraw+0x3a>
c0de62a8:	b570      	push	{r4, r5, r6, lr}
c0de62aa:	6981      	ldr	r1, [r0, #24]
c0de62ac:	b1a1      	cbz	r1, c0de62d8 <nbgl_layoutDraw+0x32>
c0de62ae:	f8d0 20a0 	ldr.w	r2, [r0, #160]	@ 0xa0
c0de62b2:	f812 3f22 	ldrb.w	r3, [r2, #34]!
c0de62b6:	7855      	ldrb	r5, [r2, #1]
c0de62b8:	f812 4c02 	ldrb.w	r4, [r2, #-2]
c0de62bc:	7896      	ldrb	r6, [r2, #2]
c0de62be:	78d2      	ldrb	r2, [r2, #3]
c0de62c0:	ea43 2305 	orr.w	r3, r3, r5, lsl #8
c0de62c4:	ea46 2202 	orr.w	r2, r6, r2, lsl #8
c0de62c8:	ea43 4202 	orr.w	r2, r3, r2, lsl #16
c0de62cc:	f842 1024 	str.w	r1, [r2, r4, lsl #2]
c0de62d0:	f8d0 00a0 	ldr.w	r0, [r0, #160]	@ 0xa0
c0de62d4:	f000 f8de 	bl	c0de6494 <OUTLINED_FUNCTION_0>
c0de62d8:	f004 fa37 	bl	c0dea74a <nbgl_screenRedraw>
c0de62dc:	2000      	movs	r0, #0
c0de62de:	bd70      	pop	{r4, r5, r6, pc}
c0de62e0:	f000 baa3 	b.w	c0de682a <OUTLINED_FUNCTION_40>

c0de62e4 <nbgl_layoutRelease>:
c0de62e4:	b510      	push	{r4, lr}
c0de62e6:	b138      	cbz	r0, c0de62f8 <nbgl_layoutRelease+0x14>
c0de62e8:	f000 fb31 	bl	c0de694e <OUTLINED_FUNCTION_64>
c0de62ec:	f894 10ae 	ldrb.w	r1, [r4, #174]	@ 0xae
c0de62f0:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de62f4:	0441      	lsls	r1, r0, #17
c0de62f6:	d402      	bmi.n	c0de62fe <nbgl_layoutRelease+0x1a>
c0de62f8:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de62fc:	bd10      	pop	{r4, pc}
c0de62fe:	07c1      	lsls	r1, r0, #31
c0de6300:	d014      	beq.n	c0de632c <nbgl_layoutRelease+0x48>
c0de6302:	b2c0      	uxtb	r0, r0
c0de6304:	08c0      	lsrs	r0, r0, #3
c0de6306:	f004 fa25 	bl	c0dea754 <nbgl_screenPop>
c0de630a:	480d      	ldr	r0, [pc, #52]	@ (c0de6340 <nbgl_layoutRelease+0x5c>)
c0de630c:	eb09 0100 	add.w	r1, r9, r0
c0de6310:	6849      	ldr	r1, [r1, #4]
c0de6312:	42a1      	cmp	r1, r4
c0de6314:	d005      	beq.n	c0de6322 <nbgl_layoutRelease+0x3e>
c0de6316:	e9d4 0100 	ldrd	r0, r1, [r4]
c0de631a:	6008      	str	r0, [r1, #0]
c0de631c:	6820      	ldr	r0, [r4, #0]
c0de631e:	6041      	str	r1, [r0, #4]
c0de6320:	e004      	b.n	c0de632c <nbgl_layoutRelease+0x48>
c0de6322:	6861      	ldr	r1, [r4, #4]
c0de6324:	4448      	add	r0, r9
c0de6326:	6041      	str	r1, [r0, #4]
c0de6328:	2000      	movs	r0, #0
c0de632a:	6008      	str	r0, [r1, #0]
c0de632c:	f814 0fad 	ldrb.w	r0, [r4, #173]!
c0de6330:	7861      	ldrb	r1, [r4, #1]
c0de6332:	7020      	strb	r0, [r4, #0]
c0de6334:	2000      	movs	r0, #0
c0de6336:	f001 01bf 	and.w	r1, r1, #191	@ 0xbf
c0de633a:	7061      	strb	r1, [r4, #1]
c0de633c:	bd10      	pop	{r4, pc}
c0de633e:	bf00      	nop
c0de6340:	00001968 	.word	0x00001968

c0de6344 <getLayoutAndLayoutObj>:
c0de6344:	b570      	push	{r4, r5, r6, lr}
c0de6346:	4c11      	ldr	r4, [pc, #68]	@ (c0de638c <getLayoutAndLayoutObj+0x48>)
c0de6348:	2300      	movs	r3, #0
c0de634a:	600b      	str	r3, [r1, #0]
c0de634c:	444c      	add	r4, r9
c0de634e:	6864      	ldr	r4, [r4, #4]
c0de6350:	b1d4      	cbz	r4, c0de6388 <getLayoutAndLayoutObj+0x44>
c0de6352:	f894 30ad 	ldrb.w	r3, [r4, #173]	@ 0xad
c0de6356:	f894 50ae 	ldrb.w	r5, [r4, #174]	@ 0xae
c0de635a:	ea43 2305 	orr.w	r3, r3, r5, lsl #8
c0de635e:	045d      	lsls	r5, r3, #17
c0de6360:	d401      	bmi.n	c0de6366 <getLayoutAndLayoutObj+0x22>
c0de6362:	2300      	movs	r3, #0
c0de6364:	e010      	b.n	c0de6388 <getLayoutAndLayoutObj+0x44>
c0de6366:	f44f 75fc 	mov.w	r5, #504	@ 0x1f8
c0de636a:	ea05 1553 	and.w	r5, r5, r3, lsr #5
c0de636e:	2300      	movs	r3, #0
c0de6370:	429d      	cmp	r5, r3
c0de6372:	d0f6      	beq.n	c0de6362 <getLayoutAndLayoutObj+0x1e>
c0de6374:	18e6      	adds	r6, r4, r3
c0de6376:	3308      	adds	r3, #8
c0de6378:	6a36      	ldr	r6, [r6, #32]
c0de637a:	4286      	cmp	r6, r0
c0de637c:	d1f8      	bne.n	c0de6370 <getLayoutAndLayoutObj+0x2c>
c0de637e:	18e0      	adds	r0, r4, r3
c0de6380:	2301      	movs	r3, #1
c0de6382:	600c      	str	r4, [r1, #0]
c0de6384:	3018      	adds	r0, #24
c0de6386:	6010      	str	r0, [r2, #0]
c0de6388:	4618      	mov	r0, r3
c0de638a:	bd70      	pop	{r4, r5, r6, pc}
c0de638c:	00001968 	.word	0x00001968

c0de6390 <animTickerCallback>:
c0de6390:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de6392:	483f      	ldr	r0, [pc, #252]	@ (c0de6490 <animTickerCallback+0x100>)
c0de6394:	4448      	add	r0, r9
c0de6396:	6842      	ldr	r2, [r0, #4]
c0de6398:	b3b2      	cbz	r2, c0de6408 <animTickerCallback+0x78>
c0de639a:	f892 00ad 	ldrb.w	r0, [r2, #173]	@ 0xad
c0de639e:	f892 10ae 	ldrb.w	r1, [r2, #174]	@ 0xae
c0de63a2:	ea40 2e01 	orr.w	lr, r0, r1, lsl #8
c0de63a6:	ea5f 404e 	movs.w	r0, lr, lsl #17
c0de63aa:	d52d      	bpl.n	c0de6408 <animTickerCallback+0x78>
c0de63ac:	f8d2 c0a4 	ldr.w	ip, [r2, #164]	@ 0xa4
c0de63b0:	f1bc 0f00 	cmp.w	ip, #0
c0de63b4:	d028      	beq.n	c0de6408 <animTickerCallback+0x78>
c0de63b6:	f8d2 40a0 	ldr.w	r4, [r2, #160]	@ 0xa0
c0de63ba:	2600      	movs	r6, #0
c0de63bc:	f894 5020 	ldrb.w	r5, [r4, #32]
c0de63c0:	42b5      	cmp	r5, r6
c0de63c2:	d021      	beq.n	c0de6408 <animTickerCallback+0x78>
c0de63c4:	4620      	mov	r0, r4
c0de63c6:	f810 7f22 	ldrb.w	r7, [r0, #34]!
c0de63ca:	7841      	ldrb	r1, [r0, #1]
c0de63cc:	7883      	ldrb	r3, [r0, #2]
c0de63ce:	78c0      	ldrb	r0, [r0, #3]
c0de63d0:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de63d4:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de63d8:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de63dc:	f850 0026 	ldr.w	r0, [r0, r6, lsl #2]
c0de63e0:	7ec1      	ldrb	r1, [r0, #27]
c0de63e2:	2901      	cmp	r1, #1
c0de63e4:	d10e      	bne.n	c0de6404 <animTickerCallback+0x74>
c0de63e6:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de63ea:	7843      	ldrb	r3, [r0, #1]
c0de63ec:	7887      	ldrb	r7, [r0, #2]
c0de63ee:	78c0      	ldrb	r0, [r0, #3]
c0de63f0:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de63f4:	ea47 2000 	orr.w	r0, r7, r0, lsl #8
c0de63f8:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de63fc:	6840      	ldr	r0, [r0, #4]
c0de63fe:	7ec1      	ldrb	r1, [r0, #27]
c0de6400:	2902      	cmp	r1, #2
c0de6402:	d002      	beq.n	c0de640a <animTickerCallback+0x7a>
c0de6404:	3601      	adds	r6, #1
c0de6406:	e7db      	b.n	c0de63c0 <animTickerCallback+0x30>
c0de6408:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0de640a:	f89c 1005 	ldrb.w	r1, [ip, #5]
c0de640e:	b171      	cbz	r1, c0de642e <animTickerCallback+0x9e>
c0de6410:	f892 40af 	ldrb.w	r4, [r2, #175]	@ 0xaf
c0de6414:	ea5f 714e 	movs.w	r1, lr, lsl #29
c0de6418:	d504      	bpl.n	c0de6424 <animTickerCallback+0x94>
c0de641a:	f89c 1004 	ldrb.w	r1, [ip, #4]
c0de641e:	3901      	subs	r1, #1
c0de6420:	42a1      	cmp	r1, r4
c0de6422:	dd0e      	ble.n	c0de6442 <animTickerCallback+0xb2>
c0de6424:	b9ac      	cbnz	r4, c0de6452 <animTickerCallback+0xc2>
c0de6426:	f04e 0e04 	orr.w	lr, lr, #4
c0de642a:	2400      	movs	r4, #0
c0de642c:	e00b      	b.n	c0de6446 <animTickerCallback+0xb6>
c0de642e:	f89c 1004 	ldrb.w	r1, [ip, #4]
c0de6432:	f892 30af 	ldrb.w	r3, [r2, #175]	@ 0xaf
c0de6436:	3901      	subs	r1, #1
c0de6438:	4299      	cmp	r1, r3
c0de643a:	bf14      	ite	ne
c0de643c:	3301      	addne	r3, #1
c0de643e:	2300      	moveq	r3, #0
c0de6440:	e00c      	b.n	c0de645c <animTickerCallback+0xcc>
c0de6442:	f02e 0e04 	bic.w	lr, lr, #4
c0de6446:	ea4f 211e 	mov.w	r1, lr, lsr #8
c0de644a:	f882 e0ad 	strb.w	lr, [r2, #173]	@ 0xad
c0de644e:	f882 10ae 	strb.w	r1, [r2, #174]	@ 0xae
c0de6452:	ea5f 714e 	movs.w	r1, lr, lsl #29
c0de6456:	bf54      	ite	pl
c0de6458:	1e63      	subpl	r3, r4, #1
c0de645a:	1c63      	addmi	r3, r4, #1
c0de645c:	f882 30af 	strb.w	r3, [r2, #175]	@ 0xaf
c0de6460:	f8dc 2000 	ldr.w	r2, [ip]
c0de6464:	b2d9      	uxtb	r1, r3
c0de6466:	f852 1021 	ldr.w	r1, [r2, r1, lsl #2]
c0de646a:	4602      	mov	r2, r0
c0de646c:	f802 1f21 	strb.w	r1, [r2, #33]!
c0de6470:	0e0b      	lsrs	r3, r1, #24
c0de6472:	70d3      	strb	r3, [r2, #3]
c0de6474:	0c0b      	lsrs	r3, r1, #16
c0de6476:	0a09      	lsrs	r1, r1, #8
c0de6478:	7093      	strb	r3, [r2, #2]
c0de647a:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de647e:	f004 f950 	bl	c0dea722 <nbgl_objDraw>
c0de6482:	2004      	movs	r0, #4
c0de6484:	2101      	movs	r1, #1
c0de6486:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de648a:	f004 b940 	b.w	c0dea70e <nbgl_refreshSpecialWithPostRefresh>
c0de648e:	bf00      	nop
c0de6490:	00001968 	.word	0x00001968

c0de6494 <OUTLINED_FUNCTION_0>:
c0de6494:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de6498:	3101      	adds	r1, #1
c0de649a:	f880 1020 	strb.w	r1, [r0, #32]
c0de649e:	4770      	bx	lr

c0de64a0 <OUTLINED_FUNCTION_1>:
c0de64a0:	08c1      	lsrs	r1, r0, #3
c0de64a2:	2004      	movs	r0, #4
c0de64a4:	f004 b965 	b.w	c0dea772 <nbgl_objPoolGet>

c0de64a8 <OUTLINED_FUNCTION_2>:
c0de64a8:	4638      	mov	r0, r7
c0de64aa:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de64ae:	70c2      	strb	r2, [r0, #3]
c0de64b0:	0c0a      	lsrs	r2, r1, #16
c0de64b2:	7082      	strb	r2, [r0, #2]
c0de64b4:	0a08      	lsrs	r0, r1, #8
c0de64b6:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de64ba:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de64be:	f897 0024 	ldrb.w	r0, [r7, #36]	@ 0x24
c0de64c2:	f040 0001 	orr.w	r0, r0, #1
c0de64c6:	f887 0024 	strb.w	r0, [r7, #36]	@ 0x24
c0de64ca:	200b      	movs	r0, #11
c0de64cc:	f004 b96a 	b.w	c0dea7a4 <nbgl_getTextHeightInWidth>

c0de64d0 <OUTLINED_FUNCTION_3>:
c0de64d0:	2202      	movs	r2, #2
c0de64d2:	2600      	movs	r6, #0
c0de64d4:	75ba      	strb	r2, [r7, #22]
c0de64d6:	465a      	mov	r2, fp
c0de64d8:	f812 3f22 	ldrb.w	r3, [r2, #34]!
c0de64dc:	7854      	ldrb	r4, [r2, #1]
c0de64de:	7895      	ldrb	r5, [r2, #2]
c0de64e0:	78d2      	ldrb	r2, [r2, #3]
c0de64e2:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de64e6:	ea45 2202 	orr.w	r2, r5, r2, lsl #8
c0de64ea:	7ebc      	ldrb	r4, [r7, #26]
c0de64ec:	ea43 4202 	orr.w	r2, r3, r2, lsl #16
c0de64f0:	7e7b      	ldrb	r3, [r7, #25]
c0de64f2:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de64f6:	4770      	bx	lr

c0de64f8 <OUTLINED_FUNCTION_4>:
c0de64f8:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de64fc:	784c      	ldrb	r4, [r1, #1]
c0de64fe:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de6502:	788d      	ldrb	r5, [r1, #2]
c0de6504:	78c9      	ldrb	r1, [r1, #3]
c0de6506:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de650a:	ea45 2101 	orr.w	r1, r5, r1, lsl #8
c0de650e:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de6512:	4770      	bx	lr

c0de6514 <OUTLINED_FUNCTION_5>:
c0de6514:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de6518:	70ca      	strb	r2, [r1, #3]
c0de651a:	0c02      	lsrs	r2, r0, #16
c0de651c:	0a00      	lsrs	r0, r0, #8
c0de651e:	708a      	strb	r2, [r1, #2]
c0de6520:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de6524:	68e0      	ldr	r0, [r4, #12]
c0de6526:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de652a:	7843      	ldrb	r3, [r0, #1]
c0de652c:	f810 cc02 	ldrb.w	ip, [r0, #-2]
c0de6530:	7882      	ldrb	r2, [r0, #2]
c0de6532:	78c0      	ldrb	r0, [r0, #3]
c0de6534:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de6538:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de653c:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de6540:	f840 602c 	str.w	r6, [r0, ip, lsl #2]
c0de6544:	200c      	movs	r0, #12
c0de6546:	4770      	bx	lr

c0de6548 <OUTLINED_FUNCTION_6>:
c0de6548:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de654c:	7843      	ldrb	r3, [r0, #1]
c0de654e:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de6552:	7886      	ldrb	r6, [r0, #2]
c0de6554:	78c0      	ldrb	r0, [r0, #3]
c0de6556:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de655a:	ea46 2000 	orr.w	r0, r6, r0, lsl #8
c0de655e:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de6562:	4770      	bx	lr

c0de6564 <OUTLINED_FUNCTION_7>:
c0de6564:	f885 0020 	strb.w	r0, [r5, #32]
c0de6568:	4628      	mov	r0, r5
c0de656a:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de656e:	70c2      	strb	r2, [r0, #3]
c0de6570:	0c0a      	lsrs	r2, r1, #16
c0de6572:	7082      	strb	r2, [r0, #2]
c0de6574:	0a08      	lsrs	r0, r1, #8
c0de6576:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de657a:	f885 0027 	strb.w	r0, [r5, #39]	@ 0x27
c0de657e:	f895 0024 	ldrb.w	r0, [r5, #36]	@ 0x24
c0de6582:	f040 0001 	orr.w	r0, r0, #1
c0de6586:	f885 0024 	strb.w	r0, [r5, #36]	@ 0x24
c0de658a:	200b      	movs	r0, #11
c0de658c:	f004 b90a 	b.w	c0dea7a4 <nbgl_getTextHeightInWidth>

c0de6590 <OUTLINED_FUNCTION_8>:
c0de6590:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de6594:	08c1      	lsrs	r1, r0, #3
c0de6596:	2005      	movs	r0, #5
c0de6598:	f004 b8eb 	b.w	c0dea772 <nbgl_objPoolGet>

c0de659c <OUTLINED_FUNCTION_9>:
c0de659c:	784b      	ldrb	r3, [r1, #1]
c0de659e:	788e      	ldrb	r6, [r1, #2]
c0de65a0:	78c9      	ldrb	r1, [r1, #3]
c0de65a2:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de65a6:	ea46 2101 	orr.w	r1, r6, r1, lsl #8
c0de65aa:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de65ae:	4770      	bx	lr

c0de65b0 <OUTLINED_FUNCTION_10>:
c0de65b0:	465a      	mov	r2, fp
c0de65b2:	f812 3f22 	ldrb.w	r3, [r2, #34]!
c0de65b6:	7854      	ldrb	r4, [r2, #1]
c0de65b8:	7895      	ldrb	r5, [r2, #2]
c0de65ba:	78d2      	ldrb	r2, [r2, #3]
c0de65bc:	ea45 2202 	orr.w	r2, r5, r2, lsl #8
c0de65c0:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de65c4:	463d      	mov	r5, r7
c0de65c6:	ea43 4202 	orr.w	r2, r3, r2, lsl #16
c0de65ca:	eb02 0481 	add.w	r4, r2, r1, lsl #2
c0de65ce:	f854 3c04 	ldr.w	r3, [r4, #-4]
c0de65d2:	f805 3f12 	strb.w	r3, [r5, #18]!
c0de65d6:	0e1e      	lsrs	r6, r3, #24
c0de65d8:	70ee      	strb	r6, [r5, #3]
c0de65da:	0c1e      	lsrs	r6, r3, #16
c0de65dc:	0a1b      	lsrs	r3, r3, #8
c0de65de:	4770      	bx	lr

c0de65e0 <OUTLINED_FUNCTION_11>:
c0de65e0:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de65e4:	70c2      	strb	r2, [r0, #3]
c0de65e6:	0c0a      	lsrs	r2, r1, #16
c0de65e8:	7082      	strb	r2, [r0, #2]
c0de65ea:	0a08      	lsrs	r0, r1, #8
c0de65ec:	4770      	bx	lr

c0de65ee <OUTLINED_FUNCTION_12>:
c0de65ee:	f801 0f26 	strb.w	r0, [r1, #38]!
c0de65f2:	70ca      	strb	r2, [r1, #3]
c0de65f4:	0c02      	lsrs	r2, r0, #16
c0de65f6:	0a00      	lsrs	r0, r0, #8
c0de65f8:	708a      	strb	r2, [r1, #2]
c0de65fa:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de65fe:	6920      	ldr	r0, [r4, #16]
c0de6600:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de6604:	7843      	ldrb	r3, [r0, #1]
c0de6606:	f810 cc02 	ldrb.w	ip, [r0, #-2]
c0de660a:	7882      	ldrb	r2, [r0, #2]
c0de660c:	78c0      	ldrb	r0, [r0, #3]
c0de660e:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de6612:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de6616:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de661a:	4770      	bx	lr

c0de661c <OUTLINED_FUNCTION_13>:
c0de661c:	08c1      	lsrs	r1, r0, #3
c0de661e:	2005      	movs	r0, #5
c0de6620:	f004 b8a7 	b.w	c0dea772 <nbgl_objPoolGet>

c0de6624 <OUTLINED_FUNCTION_14>:
c0de6624:	6920      	ldr	r0, [r4, #16]
c0de6626:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de662a:	7843      	ldrb	r3, [r0, #1]
c0de662c:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de6630:	7887      	ldrb	r7, [r0, #2]
c0de6632:	78c0      	ldrb	r0, [r0, #3]
c0de6634:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de6638:	ea47 2000 	orr.w	r0, r7, r0, lsl #8
c0de663c:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de6640:	f840 6022 	str.w	r6, [r0, r2, lsl #2]
c0de6644:	200c      	movs	r0, #12
c0de6646:	f886 801c 	strb.w	r8, [r6, #28]
c0de664a:	f886 0023 	strb.w	r0, [r6, #35]	@ 0x23
c0de664e:	4770      	bx	lr

c0de6650 <OUTLINED_FUNCTION_15>:
c0de6650:	4620      	mov	r0, r4
c0de6652:	4631      	mov	r1, r6
c0de6654:	f7fc bd94 	b.w	c0de3180 <layoutAddCallbackObj>

c0de6658 <OUTLINED_FUNCTION_16>:
c0de6658:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de665c:	4630      	mov	r0, r6
c0de665e:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de6662:	70c2      	strb	r2, [r0, #3]
c0de6664:	0c0a      	lsrs	r2, r1, #16
c0de6666:	7082      	strb	r2, [r0, #2]
c0de6668:	0a08      	lsrs	r0, r1, #8
c0de666a:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de666e:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de6672:	f896 0024 	ldrb.w	r0, [r6, #36]	@ 0x24
c0de6676:	f040 0001 	orr.w	r0, r0, #1
c0de667a:	f886 0024 	strb.w	r0, [r6, #36]	@ 0x24
c0de667e:	200b      	movs	r0, #11
c0de6680:	4770      	bx	lr

c0de6682 <OUTLINED_FUNCTION_17>:
c0de6682:	70ca      	strb	r2, [r1, #3]
c0de6684:	0c02      	lsrs	r2, r0, #16
c0de6686:	0a00      	lsrs	r0, r0, #8
c0de6688:	708a      	strb	r2, [r1, #2]
c0de668a:	4770      	bx	lr

c0de668c <OUTLINED_FUNCTION_18>:
c0de668c:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de6690:	7842      	ldrb	r2, [r0, #1]
c0de6692:	7883      	ldrb	r3, [r0, #2]
c0de6694:	78c0      	ldrb	r0, [r0, #3]
c0de6696:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de669a:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de669e:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de66a2:	4770      	bx	lr

c0de66a4 <OUTLINED_FUNCTION_19>:
c0de66a4:	08c1      	lsrs	r1, r0, #3
c0de66a6:	2001      	movs	r0, #1
c0de66a8:	f004 b863 	b.w	c0dea772 <nbgl_objPoolGet>

c0de66ac <OUTLINED_FUNCTION_20>:
c0de66ac:	f887 0020 	strb.w	r0, [r7, #32]
c0de66b0:	4638      	mov	r0, r7
c0de66b2:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de66b6:	70c2      	strb	r2, [r0, #3]
c0de66b8:	0c0a      	lsrs	r2, r1, #16
c0de66ba:	7082      	strb	r2, [r0, #2]
c0de66bc:	0a08      	lsrs	r0, r1, #8
c0de66be:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de66c2:	f887 0027 	strb.w	r0, [r7, #39]	@ 0x27
c0de66c6:	f897 0024 	ldrb.w	r0, [r7, #36]	@ 0x24
c0de66ca:	f040 0001 	orr.w	r0, r0, #1
c0de66ce:	f887 0024 	strb.w	r0, [r7, #36]	@ 0x24
c0de66d2:	4770      	bx	lr

c0de66d4 <OUTLINED_FUNCTION_21>:
c0de66d4:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de66d8:	08c0      	lsrs	r0, r0, #3
c0de66da:	f7fe bbdf 	b.w	c0de4e9c <createHorizontalLine>

c0de66de <OUTLINED_FUNCTION_22>:
c0de66de:	6868      	ldr	r0, [r5, #4]
c0de66e0:	f004 ba28 	b.w	c0deab34 <pic>

c0de66e4 <OUTLINED_FUNCTION_23>:
c0de66e4:	7842      	ldrb	r2, [r0, #1]
c0de66e6:	7883      	ldrb	r3, [r0, #2]
c0de66e8:	78c0      	ldrb	r0, [r0, #3]
c0de66ea:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de66ee:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de66f2:	4770      	bx	lr

c0de66f4 <OUTLINED_FUNCTION_24>:
c0de66f4:	f99a 00ae 	ldrsb.w	r0, [sl, #174]	@ 0xae
c0de66f8:	f89a 10ad 	ldrb.w	r1, [sl, #173]	@ 0xad
c0de66fc:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de6700:	2103      	movs	r1, #3
c0de6702:	f1b0 3fff 	cmp.w	r0, #4294967295	@ 0xffffffff
c0de6706:	4770      	bx	lr

c0de6708 <OUTLINED_FUNCTION_25>:
c0de6708:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de670c:	784c      	ldrb	r4, [r1, #1]
c0de670e:	f811 cc02 	ldrb.w	ip, [r1, #-2]
c0de6712:	788b      	ldrb	r3, [r1, #2]
c0de6714:	78c9      	ldrb	r1, [r1, #3]
c0de6716:	ea42 2204 	orr.w	r2, r2, r4, lsl #8
c0de671a:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de671e:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de6722:	f841 702c 	str.w	r7, [r1, ip, lsl #2]
c0de6726:	4770      	bx	lr

c0de6728 <OUTLINED_FUNCTION_26>:
c0de6728:	08c1      	lsrs	r1, r0, #3
c0de672a:	2002      	movs	r0, #2
c0de672c:	f004 b821 	b.w	c0dea772 <nbgl_objPoolGet>

c0de6730 <OUTLINED_FUNCTION_27>:
c0de6730:	68e1      	ldr	r1, [r4, #12]
c0de6732:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de6736:	784e      	ldrb	r6, [r1, #1]
c0de6738:	f811 3c02 	ldrb.w	r3, [r1, #-2]
c0de673c:	788f      	ldrb	r7, [r1, #2]
c0de673e:	78c9      	ldrb	r1, [r1, #3]
c0de6740:	ea42 2206 	orr.w	r2, r2, r6, lsl #8
c0de6744:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de6748:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de674c:	4770      	bx	lr

c0de674e <OUTLINED_FUNCTION_28>:
c0de674e:	70ca      	strb	r2, [r1, #3]
c0de6750:	0c02      	lsrs	r2, r0, #16
c0de6752:	0a00      	lsrs	r0, r0, #8
c0de6754:	708a      	strb	r2, [r1, #2]
c0de6756:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de675a:	6920      	ldr	r0, [r4, #16]
c0de675c:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de6760:	7843      	ldrb	r3, [r0, #1]
c0de6762:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de6766:	7887      	ldrb	r7, [r0, #2]
c0de6768:	78c0      	ldrb	r0, [r0, #3]
c0de676a:	4770      	bx	lr

c0de676c <OUTLINED_FUNCTION_29>:
c0de676c:	f801 0f2e 	strb.w	r0, [r1, #46]!
c0de6770:	70ca      	strb	r2, [r1, #3]
c0de6772:	0c02      	lsrs	r2, r0, #16
c0de6774:	0a00      	lsrs	r0, r0, #8
c0de6776:	708a      	strb	r2, [r1, #2]
c0de6778:	f886 002f 	strb.w	r0, [r6, #47]	@ 0x2f
c0de677c:	4770      	bx	lr

c0de677e <OUTLINED_FUNCTION_30>:
c0de677e:	3101      	adds	r1, #1
c0de6780:	f842 7026 	str.w	r7, [r2, r6, lsl #2]
c0de6784:	f88b 1020 	strb.w	r1, [fp, #32]
c0de6788:	9900      	ldr	r1, [sp, #0]
c0de678a:	4408      	add	r0, r1
c0de678c:	18c1      	adds	r1, r0, r3
c0de678e:	4770      	bx	lr

c0de6790 <OUTLINED_FUNCTION_31>:
c0de6790:	f801 0f25 	strb.w	r0, [r1, #37]!
c0de6794:	70ca      	strb	r2, [r1, #3]
c0de6796:	0c02      	lsrs	r2, r0, #16
c0de6798:	0a00      	lsrs	r0, r0, #8
c0de679a:	708a      	strb	r2, [r1, #2]
c0de679c:	f886 0026 	strb.w	r0, [r6, #38]	@ 0x26
c0de67a0:	4770      	bx	lr

c0de67a2 <OUTLINED_FUNCTION_32>:
c0de67a2:	f8d8 00a0 	ldr.w	r0, [r8, #160]	@ 0xa0
c0de67a6:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de67aa:	3101      	adds	r1, #1
c0de67ac:	f880 1020 	strb.w	r1, [r0, #32]
c0de67b0:	f898 00ad 	ldrb.w	r0, [r8, #173]	@ 0xad
c0de67b4:	08c1      	lsrs	r1, r0, #3
c0de67b6:	2004      	movs	r0, #4
c0de67b8:	4730      	bx	r6

c0de67ba <OUTLINED_FUNCTION_33>:
c0de67ba:	77b0      	strb	r0, [r6, #30]
c0de67bc:	6960      	ldr	r0, [r4, #20]
c0de67be:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de67c2:	7842      	ldrb	r2, [r0, #1]
c0de67c4:	7883      	ldrb	r3, [r0, #2]
c0de67c6:	78c0      	ldrb	r0, [r0, #3]
c0de67c8:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de67cc:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de67d0:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de67d4:	4770      	bx	lr

c0de67d6 <OUTLINED_FUNCTION_34>:
c0de67d6:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de67da:	7843      	ldrb	r3, [r0, #1]
c0de67dc:	f810 2c02 	ldrb.w	r2, [r0, #-2]
c0de67e0:	7884      	ldrb	r4, [r0, #2]
c0de67e2:	78c0      	ldrb	r0, [r0, #3]
c0de67e4:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0de67e8:	ea44 2000 	orr.w	r0, r4, r0, lsl #8
c0de67ec:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de67f0:	4770      	bx	lr

c0de67f2 <OUTLINED_FUNCTION_35>:
c0de67f2:	f886 0021 	strb.w	r0, [r6, #33]	@ 0x21
c0de67f6:	f896 0022 	ldrb.w	r0, [r6, #34]	@ 0x22
c0de67fa:	f040 0001 	orr.w	r0, r0, #1
c0de67fe:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de6802:	4630      	mov	r0, r6
c0de6804:	f003 bf8d 	b.w	c0dea722 <nbgl_objDraw>

c0de6808 <OUTLINED_FUNCTION_36>:
c0de6808:	7981      	ldrb	r1, [r0, #6]
c0de680a:	79c0      	ldrb	r0, [r0, #7]
c0de680c:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de6810:	4770      	bx	lr

c0de6812 <OUTLINED_FUNCTION_37>:
c0de6812:	ea42 2103 	orr.w	r1, r2, r3, lsl #8
c0de6816:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de681a:	4770      	bx	lr

c0de681c <OUTLINED_FUNCTION_39>:
c0de681c:	0a01      	lsrs	r1, r0, #8
c0de681e:	71b8      	strb	r0, [r7, #6]
c0de6820:	71f9      	strb	r1, [r7, #7]
c0de6822:	f89b 1020 	ldrb.w	r1, [fp, #32]
c0de6826:	2900      	cmp	r1, #0
c0de6828:	4770      	bx	lr

c0de682a <OUTLINED_FUNCTION_40>:
c0de682a:	f04f 30ff 	mov.w	r0, #4294967295	@ 0xffffffff
c0de682e:	4770      	bx	lr

c0de6830 <OUTLINED_FUNCTION_41>:
c0de6830:	200c      	movs	r0, #12
c0de6832:	f886 b01c 	strb.w	fp, [r6, #28]
c0de6836:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de683a:	2005      	movs	r0, #5
c0de683c:	4770      	bx	lr

c0de683e <OUTLINED_FUNCTION_42>:
c0de683e:	f99a 00ae 	ldrsb.w	r0, [sl, #174]	@ 0xae
c0de6842:	f89a 10ad 	ldrb.w	r1, [sl, #173]	@ 0xad
c0de6846:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de684a:	f1b0 3fff 	cmp.w	r0, #4294967295	@ 0xffffffff
c0de684e:	f04f 0003 	mov.w	r0, #3
c0de6852:	4770      	bx	lr

c0de6854 <OUTLINED_FUNCTION_43>:
c0de6854:	4630      	mov	r0, r6
c0de6856:	f800 1f26 	strb.w	r1, [r0, #38]!
c0de685a:	70c2      	strb	r2, [r0, #3]
c0de685c:	0c0a      	lsrs	r2, r1, #16
c0de685e:	7082      	strb	r2, [r0, #2]
c0de6860:	0a08      	lsrs	r0, r1, #8
c0de6862:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de6866:	4770      	bx	lr

c0de6868 <OUTLINED_FUNCTION_44>:
c0de6868:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de686c:	784b      	ldrb	r3, [r1, #1]
c0de686e:	788f      	ldrb	r7, [r1, #2]
c0de6870:	78c9      	ldrb	r1, [r1, #3]
c0de6872:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de6876:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de687a:	4770      	bx	lr

c0de687c <OUTLINED_FUNCTION_45>:
c0de687c:	7842      	ldrb	r2, [r0, #1]
c0de687e:	7883      	ldrb	r3, [r0, #2]
c0de6880:	78c0      	ldrb	r0, [r0, #3]
c0de6882:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de6886:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de688a:	ea41 4100 	orr.w	r1, r1, r0, lsl #16
c0de688e:	4770      	bx	lr

c0de6890 <OUTLINED_FUNCTION_46>:
c0de6890:	68a8      	ldr	r0, [r5, #8]
c0de6892:	f004 b94f 	b.w	c0deab34 <pic>

c0de6896 <OUTLINED_FUNCTION_48>:
c0de6896:	f8d4 00a0 	ldr.w	r0, [r4, #160]	@ 0xa0
c0de689a:	f890 1020 	ldrb.w	r1, [r0, #32]
c0de689e:	3101      	adds	r1, #1
c0de68a0:	f880 1020 	strb.w	r1, [r0, #32]
c0de68a4:	2000      	movs	r0, #0
c0de68a6:	4770      	bx	lr

c0de68a8 <OUTLINED_FUNCTION_49>:
c0de68a8:	2001      	movs	r0, #1
c0de68aa:	0e0a      	lsrs	r2, r1, #24
c0de68ac:	7178      	strb	r0, [r7, #5]
c0de68ae:	20a0      	movs	r0, #160	@ 0xa0
c0de68b0:	7138      	strb	r0, [r7, #4]
c0de68b2:	200b      	movs	r0, #11
c0de68b4:	f887 0022 	strb.w	r0, [r7, #34]	@ 0x22
c0de68b8:	4770      	bx	lr

c0de68ba <OUTLINED_FUNCTION_50>:
c0de68ba:	f891 0020 	ldrb.w	r0, [r1, #32]
c0de68be:	3001      	adds	r0, #1
c0de68c0:	f881 0020 	strb.w	r0, [r1, #32]
c0de68c4:	4770      	bx	lr

c0de68c6 <OUTLINED_FUNCTION_51>:
c0de68c6:	2100      	movs	r1, #0
c0de68c8:	7146      	strb	r6, [r0, #5]
c0de68ca:	77c1      	strb	r1, [r0, #31]
c0de68cc:	21e0      	movs	r1, #224	@ 0xe0
c0de68ce:	7101      	strb	r1, [r0, #4]
c0de68d0:	4770      	bx	lr

c0de68d2 <OUTLINED_FUNCTION_52>:
c0de68d2:	f886 0022 	strb.w	r0, [r6, #34]	@ 0x22
c0de68d6:	2005      	movs	r0, #5
c0de68d8:	f886 0020 	strb.w	r0, [r6, #32]
c0de68dc:	4770      	bx	lr

c0de68de <OUTLINED_FUNCTION_53>:
c0de68de:	70ca      	strb	r2, [r1, #3]
c0de68e0:	0c02      	lsrs	r2, r0, #16
c0de68e2:	0a00      	lsrs	r0, r0, #8
c0de68e4:	708a      	strb	r2, [r1, #2]
c0de68e6:	7048      	strb	r0, [r1, #1]
c0de68e8:	4770      	bx	lr

c0de68ea <OUTLINED_FUNCTION_54>:
c0de68ea:	4631      	mov	r1, r6
c0de68ec:	0e02      	lsrs	r2, r0, #24
c0de68ee:	f886 a01d 	strb.w	sl, [r6, #29]
c0de68f2:	4770      	bx	lr

c0de68f4 <OUTLINED_FUNCTION_55>:
c0de68f4:	2301      	movs	r3, #1
c0de68f6:	7178      	strb	r0, [r7, #5]
c0de68f8:	20a0      	movs	r0, #160	@ 0xa0
c0de68fa:	0e0a      	lsrs	r2, r1, #24
c0de68fc:	7138      	strb	r0, [r7, #4]
c0de68fe:	4770      	bx	lr

c0de6900 <OUTLINED_FUNCTION_56>:
c0de6900:	08c1      	lsrs	r1, r0, #3
c0de6902:	2004      	movs	r0, #4
c0de6904:	f003 bf3a 	b.w	c0dea77c <nbgl_containerPoolGet>

c0de6908 <OUTLINED_FUNCTION_57>:
c0de6908:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de690c:	08c1      	lsrs	r1, r0, #3
c0de690e:	2005      	movs	r0, #5
c0de6910:	f003 bf34 	b.w	c0dea77c <nbgl_containerPoolGet>

c0de6914 <OUTLINED_FUNCTION_58>:
c0de6914:	f894 00ad 	ldrb.w	r0, [r4, #173]	@ 0xad
c0de6918:	08c1      	lsrs	r1, r0, #3
c0de691a:	2003      	movs	r0, #3
c0de691c:	f003 bf29 	b.w	c0dea772 <nbgl_objPoolGet>

c0de6920 <OUTLINED_FUNCTION_59>:
c0de6920:	71d1      	strb	r1, [r2, #7]
c0de6922:	7190      	strb	r0, [r2, #6]
c0de6924:	f892 0020 	ldrb.w	r0, [r2, #32]
c0de6928:	3001      	adds	r0, #1
c0de692a:	f882 0020 	strb.w	r0, [r2, #32]
c0de692e:	4770      	bx	lr

c0de6930 <OUTLINED_FUNCTION_60>:
c0de6930:	7801      	ldrb	r1, [r0, #0]
c0de6932:	7840      	ldrb	r0, [r0, #1]
c0de6934:	ea41 2000 	orr.w	r0, r1, r0, lsl #8
c0de6938:	f64f 71f0 	movw	r1, #65520	@ 0xfff0
c0de693c:	1a08      	subs	r0, r1, r0
c0de693e:	4770      	bx	lr

c0de6940 <OUTLINED_FUNCTION_61>:
c0de6940:	f005 0301 	and.w	r3, r5, #1
c0de6944:	f003 bf2e 	b.w	c0dea7a4 <nbgl_getTextHeightInWidth>

c0de6948 <OUTLINED_FUNCTION_62>:
c0de6948:	200d      	movs	r0, #13
c0de694a:	f003 bf2b 	b.w	c0dea7a4 <nbgl_getTextHeightInWidth>

c0de694e <OUTLINED_FUNCTION_64>:
c0de694e:	4604      	mov	r4, r0
c0de6950:	f890 00ad 	ldrb.w	r0, [r0, #173]	@ 0xad
c0de6954:	4770      	bx	lr

c0de6956 <OUTLINED_FUNCTION_65>:
c0de6956:	758a      	strb	r2, [r1, #22]
c0de6958:	460a      	mov	r2, r1
c0de695a:	f802 0f22 	strb.w	r0, [r2, #34]!
c0de695e:	0c00      	lsrs	r0, r0, #16
c0de6960:	7090      	strb	r0, [r2, #2]
c0de6962:	4770      	bx	lr

c0de6964 <OUTLINED_FUNCTION_66>:
c0de6964:	ea43 2101 	orr.w	r1, r3, r1, lsl #8
c0de6968:	7893      	ldrb	r3, [r2, #2]
c0de696a:	78d2      	ldrb	r2, [r2, #3]
c0de696c:	ea43 2202 	orr.w	r2, r3, r2, lsl #8
c0de6970:	4770      	bx	lr

c0de6972 <OUTLINED_FUNCTION_67>:
c0de6972:	f88d 0010 	strb.w	r0, [sp, #16]
c0de6976:	8928      	ldrh	r0, [r5, #8]
c0de6978:	f8ad 000c 	strh.w	r0, [sp, #12]
c0de697c:	4640      	mov	r0, r8
c0de697e:	4770      	bx	lr

c0de6980 <OUTLINED_FUNCTION_68>:
c0de6980:	f897 00ad 	ldrb.w	r0, [r7, #173]	@ 0xad
c0de6984:	08c1      	lsrs	r1, r0, #3
c0de6986:	2004      	movs	r0, #4
c0de6988:	4720      	bx	r4

c0de698a <OUTLINED_FUNCTION_69>:
c0de698a:	70e9      	strb	r1, [r5, #3]
c0de698c:	0c01      	lsrs	r1, r0, #16
c0de698e:	0a00      	lsrs	r0, r0, #8
c0de6990:	70a9      	strb	r1, [r5, #2]
c0de6992:	f88a 0023 	strb.w	r0, [sl, #35]	@ 0x23
c0de6996:	4770      	bx	lr

c0de6998 <OUTLINED_FUNCTION_70>:
c0de6998:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0de699c:	ea43 2206 	orr.w	r2, r3, r6, lsl #8
c0de69a0:	ea41 4102 	orr.w	r1, r1, r2, lsl #16
c0de69a4:	4770      	bx	lr

c0de69a6 <OUTLINED_FUNCTION_71>:
c0de69a6:	f886 a018 	strb.w	sl, [r6, #24]
c0de69aa:	f886 8016 	strb.w	r8, [r6, #22]
c0de69ae:	4770      	bx	lr

c0de69b0 <OUTLINED_FUNCTION_72>:
c0de69b0:	ea40 4002 	orr.w	r0, r0, r2, lsl #16
c0de69b4:	7802      	ldrb	r2, [r0, #0]
c0de69b6:	7840      	ldrb	r0, [r0, #1]
c0de69b8:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de69bc:	4770      	bx	lr

c0de69be <OUTLINED_FUNCTION_73>:
c0de69be:	70f1      	strb	r1, [r6, #3]
c0de69c0:	0c01      	lsrs	r1, r0, #16
c0de69c2:	0a00      	lsrs	r0, r0, #8
c0de69c4:	70b1      	strb	r1, [r6, #2]
c0de69c6:	f88b 0023 	strb.w	r0, [fp, #35]	@ 0x23
c0de69ca:	4770      	bx	lr

c0de69cc <OUTLINED_FUNCTION_74>:
c0de69cc:	7a2a      	ldrb	r2, [r5, #8]
c0de69ce:	7a6b      	ldrb	r3, [r5, #9]
c0de69d0:	4620      	mov	r0, r4
c0de69d2:	f7fc bbd5 	b.w	c0de3180 <layoutAddCallbackObj>

c0de69d6 <OUTLINED_FUNCTION_75>:
c0de69d6:	f841 4022 	str.w	r4, [r1, r2, lsl #2]
c0de69da:	2100      	movs	r1, #0
c0de69dc:	7621      	strb	r1, [r4, #24]
c0de69de:	2110      	movs	r1, #16
c0de69e0:	75e1      	strb	r1, [r4, #23]
c0de69e2:	4770      	bx	lr

c0de69e4 <layoutNavigationCallback>:
c0de69e4:	b570      	push	{r4, r5, r6, lr}
c0de69e6:	290a      	cmp	r1, #10
c0de69e8:	d029      	beq.n	c0de6a3e <layoutNavigationCallback+0x5a>
c0de69ea:	2909      	cmp	r1, #9
c0de69ec:	d02b      	beq.n	c0de6a46 <layoutNavigationCallback+0x62>
c0de69ee:	2900      	cmp	r1, #0
c0de69f0:	d14a      	bne.n	c0de6a88 <layoutNavigationCallback+0xa4>
c0de69f2:	4604      	mov	r4, r0
c0de69f4:	7bc1      	ldrb	r1, [r0, #15]
c0de69f6:	f814 5f0e 	ldrb.w	r5, [r4, #14]!
c0de69fa:	ea45 2101 	orr.w	r1, r5, r1, lsl #8
c0de69fe:	78a5      	ldrb	r5, [r4, #2]
c0de6a00:	78e4      	ldrb	r4, [r4, #3]
c0de6a02:	ea45 2404 	orr.w	r4, r5, r4, lsl #8
c0de6a06:	ea41 4104 	orr.w	r1, r1, r4, lsl #16
c0de6a0a:	460d      	mov	r5, r1
c0de6a0c:	f891 4023 	ldrb.w	r4, [r1, #35]	@ 0x23
c0de6a10:	f815 6f22 	ldrb.w	r6, [r5, #34]!
c0de6a14:	ea46 2404 	orr.w	r4, r6, r4, lsl #8
c0de6a18:	78ae      	ldrb	r6, [r5, #2]
c0de6a1a:	78ed      	ldrb	r5, [r5, #3]
c0de6a1c:	ea46 2505 	orr.w	r5, r6, r5, lsl #8
c0de6a20:	ea44 4405 	orr.w	r4, r4, r5, lsl #16
c0de6a24:	6825      	ldr	r5, [r4, #0]
c0de6a26:	4285      	cmp	r5, r0
c0de6a28:	d01e      	beq.n	c0de6a68 <layoutNavigationCallback+0x84>
c0de6a2a:	6865      	ldr	r5, [r4, #4]
c0de6a2c:	4285      	cmp	r5, r0
c0de6a2e:	d01e      	beq.n	c0de6a6e <layoutNavigationCallback+0x8a>
c0de6a30:	68a4      	ldr	r4, [r4, #8]
c0de6a32:	4284      	cmp	r4, r0
c0de6a34:	d128      	bne.n	c0de6a88 <layoutNavigationCallback+0xa4>
c0de6a36:	2a01      	cmp	r2, #1
c0de6a38:	d81d      	bhi.n	c0de6a76 <layoutNavigationCallback+0x92>
c0de6a3a:	7818      	ldrb	r0, [r3, #0]
c0de6a3c:	e01f      	b.n	c0de6a7e <layoutNavigationCallback+0x9a>
c0de6a3e:	2a01      	cmp	r2, #1
c0de6a40:	d805      	bhi.n	c0de6a4e <layoutNavigationCallback+0x6a>
c0de6a42:	7819      	ldrb	r1, [r3, #0]
c0de6a44:	e007      	b.n	c0de6a56 <layoutNavigationCallback+0x72>
c0de6a46:	7819      	ldrb	r1, [r3, #0]
c0de6a48:	b1f1      	cbz	r1, c0de6a88 <layoutNavigationCallback+0xa4>
c0de6a4a:	3901      	subs	r1, #1
c0de6a4c:	e004      	b.n	c0de6a58 <layoutNavigationCallback+0x74>
c0de6a4e:	7819      	ldrb	r1, [r3, #0]
c0de6a50:	1e54      	subs	r4, r2, #1
c0de6a52:	428c      	cmp	r4, r1
c0de6a54:	d918      	bls.n	c0de6a88 <layoutNavigationCallback+0xa4>
c0de6a56:	3101      	adds	r1, #1
c0de6a58:	7019      	strb	r1, [r3, #0]
c0de6a5a:	b2cb      	uxtb	r3, r1
c0de6a5c:	4611      	mov	r1, r2
c0de6a5e:	461a      	mov	r2, r3
c0de6a60:	f000 f814 	bl	c0de6a8c <configButtons>
c0de6a64:	2001      	movs	r0, #1
c0de6a66:	bd70      	pop	{r4, r5, r6, pc}
c0de6a68:	20ff      	movs	r0, #255	@ 0xff
c0de6a6a:	7018      	strb	r0, [r3, #0]
c0de6a6c:	e7fa      	b.n	c0de6a64 <layoutNavigationCallback+0x80>
c0de6a6e:	7818      	ldrb	r0, [r3, #0]
c0de6a70:	b150      	cbz	r0, c0de6a88 <layoutNavigationCallback+0xa4>
c0de6a72:	3801      	subs	r0, #1
c0de6a74:	e004      	b.n	c0de6a80 <layoutNavigationCallback+0x9c>
c0de6a76:	7818      	ldrb	r0, [r3, #0]
c0de6a78:	1e54      	subs	r4, r2, #1
c0de6a7a:	4284      	cmp	r4, r0
c0de6a7c:	d904      	bls.n	c0de6a88 <layoutNavigationCallback+0xa4>
c0de6a7e:	3001      	adds	r0, #1
c0de6a80:	7018      	strb	r0, [r3, #0]
c0de6a82:	b2c3      	uxtb	r3, r0
c0de6a84:	4608      	mov	r0, r1
c0de6a86:	e7e9      	b.n	c0de6a5c <layoutNavigationCallback+0x78>
c0de6a88:	2000      	movs	r0, #0
c0de6a8a:	bd70      	pop	{r4, r5, r6, pc}

c0de6a8c <configButtons>:
c0de6a8c:	b5b0      	push	{r4, r5, r7, lr}
c0de6a8e:	f810 3f22 	ldrb.w	r3, [r0, #34]!
c0de6a92:	7844      	ldrb	r4, [r0, #1]
c0de6a94:	7885      	ldrb	r5, [r0, #2]
c0de6a96:	78c0      	ldrb	r0, [r0, #3]
c0de6a98:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de6a9c:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
c0de6aa0:	ea43 4000 	orr.w	r0, r3, r0, lsl #16
c0de6aa4:	e9d0 3001 	ldrd	r3, r0, [r0, #4]
c0de6aa8:	b12b      	cbz	r3, c0de6ab6 <configButtons+0x2a>
c0de6aaa:	fab2 f482 	clz	r4, r2
c0de6aae:	0964      	lsrs	r4, r4, #5
c0de6ab0:	0064      	lsls	r4, r4, #1
c0de6ab2:	f883 4021 	strb.w	r4, [r3, #33]	@ 0x21
c0de6ab6:	2902      	cmp	r1, #2
c0de6ab8:	d307      	bcc.n	c0de6aca <configButtons+0x3e>
c0de6aba:	43d2      	mvns	r2, r2
c0de6abc:	4411      	add	r1, r2
c0de6abe:	fab1 f181 	clz	r1, r1
c0de6ac2:	0949      	lsrs	r1, r1, #5
c0de6ac4:	0049      	lsls	r1, r1, #1
c0de6ac6:	f880 1021 	strb.w	r1, [r0, #33]	@ 0x21
c0de6aca:	bdb0      	pop	{r4, r5, r7, pc}

c0de6acc <layoutNavigationPopulate>:
c0de6acc:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de6ad0:	4680      	mov	r8, r0
c0de6ad2:	78c8      	ldrb	r0, [r1, #3]
c0de6ad4:	4616      	mov	r6, r2
c0de6ad6:	460d      	mov	r5, r1
c0de6ad8:	b340      	cbz	r0, c0de6b2c <layoutNavigationPopulate+0x60>
c0de6ada:	2005      	movs	r0, #5
c0de6adc:	4631      	mov	r1, r6
c0de6ade:	2405      	movs	r4, #5
c0de6ae0:	f003 fe47 	bl	c0dea772 <nbgl_objPoolGet>
c0de6ae4:	4978      	ldr	r1, [pc, #480]	@ (c0de6cc8 <layoutNavigationPopulate+0x1fc>)
c0de6ae6:	4479      	add	r1, pc
c0de6ae8:	f000 f903 	bl	c0de6cf2 <OUTLINED_FUNCTION_1>
c0de6aec:	70d3      	strb	r3, [r2, #3]
c0de6aee:	7091      	strb	r1, [r2, #2]
c0de6af0:	2258      	movs	r2, #88	@ 0x58
c0de6af2:	2303      	movs	r3, #3
c0de6af4:	2100      	movs	r1, #0
c0de6af6:	7182      	strb	r2, [r0, #6]
c0de6af8:	7102      	strb	r2, [r0, #4]
c0de6afa:	2201      	movs	r2, #1
c0de6afc:	f880 3020 	strb.w	r3, [r0, #32]
c0de6b00:	77c3      	strb	r3, [r0, #31]
c0de6b02:	2304      	movs	r3, #4
c0de6b04:	71c1      	strb	r1, [r0, #7]
c0de6b06:	7141      	strb	r1, [r0, #5]
c0de6b08:	7601      	strb	r1, [r0, #24]
c0de6b0a:	7741      	strb	r1, [r0, #29]
c0de6b0c:	7702      	strb	r2, [r0, #28]
c0de6b0e:	7782      	strb	r2, [r0, #30]
c0de6b10:	f880 3022 	strb.w	r3, [r0, #34]	@ 0x22
c0de6b14:	786a      	ldrb	r2, [r5, #1]
c0de6b16:	2a01      	cmp	r2, #1
c0de6b18:	bf88      	it	hi
c0de6b1a:	2404      	movhi	r4, #4
c0de6b1c:	7584      	strb	r4, [r0, #22]
c0de6b1e:	bf88      	it	hi
c0de6b20:	2101      	movhi	r1, #1
c0de6b22:	00c9      	lsls	r1, r1, #3
c0de6b24:	75c1      	strb	r1, [r0, #23]
c0de6b26:	f000 f8d7 	bl	c0de6cd8 <OUTLINED_FUNCTION_0>
c0de6b2a:	6008      	str	r0, [r1, #0]
c0de6b2c:	7928      	ldrb	r0, [r5, #4]
c0de6b2e:	b318      	cbz	r0, c0de6b78 <layoutNavigationPopulate+0xac>
c0de6b30:	2005      	movs	r0, #5
c0de6b32:	4631      	mov	r1, r6
c0de6b34:	f003 fe1d 	bl	c0dea772 <nbgl_objPoolGet>
c0de6b38:	4964      	ldr	r1, [pc, #400]	@ (c0de6ccc <layoutNavigationPopulate+0x200>)
c0de6b3a:	4479      	add	r1, pc
c0de6b3c:	f000 f8d9 	bl	c0de6cf2 <OUTLINED_FUNCTION_1>
c0de6b40:	7091      	strb	r1, [r2, #2]
c0de6b42:	2100      	movs	r1, #0
c0de6b44:	70d3      	strb	r3, [r2, #3]
c0de6b46:	2260      	movs	r2, #96	@ 0x60
c0de6b48:	2301      	movs	r3, #1
c0de6b4a:	71c1      	strb	r1, [r0, #7]
c0de6b4c:	7141      	strb	r1, [r0, #5]
c0de6b4e:	7741      	strb	r1, [r0, #29]
c0de6b50:	7601      	strb	r1, [r0, #24]
c0de6b52:	2103      	movs	r1, #3
c0de6b54:	7182      	strb	r2, [r0, #6]
c0de6b56:	2268      	movs	r2, #104	@ 0x68
c0de6b58:	7703      	strb	r3, [r0, #28]
c0de6b5a:	f880 1020 	strb.w	r1, [r0, #32]
c0de6b5e:	77c1      	strb	r1, [r0, #31]
c0de6b60:	2104      	movs	r1, #4
c0de6b62:	7102      	strb	r2, [r0, #4]
c0de6b64:	75c2      	strb	r2, [r0, #23]
c0de6b66:	f880 1022 	strb.w	r1, [r0, #34]	@ 0x22
c0de6b6a:	2102      	movs	r1, #2
c0de6b6c:	7781      	strb	r1, [r0, #30]
c0de6b6e:	2106      	movs	r1, #6
c0de6b70:	7581      	strb	r1, [r0, #22]
c0de6b72:	f000 f8b1 	bl	c0de6cd8 <OUTLINED_FUNCTION_0>
c0de6b76:	6048      	str	r0, [r1, #4]
c0de6b78:	2005      	movs	r0, #5
c0de6b7a:	4631      	mov	r1, r6
c0de6b7c:	f003 fdf9 	bl	c0dea772 <nbgl_objPoolGet>
c0de6b80:	4c53      	ldr	r4, [pc, #332]	@ (c0de6cd0 <layoutNavigationPopulate+0x204>)
c0de6b82:	447c      	add	r4, pc
c0de6b84:	0a21      	lsrs	r1, r4, #8
c0de6b86:	0e22      	lsrs	r2, r4, #24
c0de6b88:	f880 102f 	strb.w	r1, [r0, #47]	@ 0x2f
c0de6b8c:	4601      	mov	r1, r0
c0de6b8e:	f801 4f2e 	strb.w	r4, [r1, #46]!
c0de6b92:	70ca      	strb	r2, [r1, #3]
c0de6b94:	0c22      	lsrs	r2, r4, #16
c0de6b96:	708a      	strb	r2, [r1, #2]
c0de6b98:	2100      	movs	r1, #0
c0de6b9a:	2260      	movs	r2, #96	@ 0x60
c0de6b9c:	7182      	strb	r2, [r0, #6]
c0de6b9e:	2268      	movs	r2, #104	@ 0x68
c0de6ba0:	71c1      	strb	r1, [r0, #7]
c0de6ba2:	7141      	strb	r1, [r0, #5]
c0de6ba4:	7741      	strb	r1, [r0, #29]
c0de6ba6:	f880 1021 	strb.w	r1, [r0, #33]	@ 0x21
c0de6baa:	2103      	movs	r1, #3
c0de6bac:	7102      	strb	r2, [r0, #4]
c0de6bae:	2201      	movs	r2, #1
c0de6bb0:	f880 1020 	strb.w	r1, [r0, #32]
c0de6bb4:	77c1      	strb	r1, [r0, #31]
c0de6bb6:	7781      	strb	r1, [r0, #30]
c0de6bb8:	2106      	movs	r1, #6
c0de6bba:	7702      	strb	r2, [r0, #28]
c0de6bbc:	2204      	movs	r2, #4
c0de6bbe:	7581      	strb	r1, [r0, #22]
c0de6bc0:	4641      	mov	r1, r8
c0de6bc2:	f880 2022 	strb.w	r2, [r0, #34]	@ 0x22
c0de6bc6:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de6bca:	784b      	ldrb	r3, [r1, #1]
c0de6bcc:	788f      	ldrb	r7, [r1, #2]
c0de6bce:	78c9      	ldrb	r1, [r1, #3]
c0de6bd0:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de6bd4:	ea47 2101 	orr.w	r1, r7, r1, lsl #8
c0de6bd8:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de6bdc:	6088      	str	r0, [r1, #8]
c0de6bde:	79a8      	ldrb	r0, [r5, #6]
c0de6be0:	2800      	cmp	r0, #0
c0de6be2:	d067      	beq.n	c0de6cb4 <layoutNavigationPopulate+0x1e8>
c0de6be4:	79e8      	ldrb	r0, [r5, #7]
c0de6be6:	2800      	cmp	r0, #0
c0de6be8:	d04c      	beq.n	c0de6c84 <layoutNavigationPopulate+0x1b8>
c0de6bea:	2004      	movs	r0, #4
c0de6bec:	4631      	mov	r1, r6
c0de6bee:	f003 fdc0 	bl	c0dea772 <nbgl_objPoolGet>
c0de6bf2:	4606      	mov	r6, r0
c0de6bf4:	7868      	ldrb	r0, [r5, #1]
c0de6bf6:	78a9      	ldrb	r1, [r5, #2]
c0de6bf8:	f04f 0a0b 	mov.w	sl, #11
c0de6bfc:	9000      	str	r0, [sp, #0]
c0de6bfe:	4831      	ldr	r0, [pc, #196]	@ (c0de6cc4 <layoutNavigationPopulate+0x1f8>)
c0de6c00:	1c4b      	adds	r3, r1, #1
c0de6c02:	210b      	movs	r1, #11
c0de6c04:	4a33      	ldr	r2, [pc, #204]	@ (c0de6cd4 <layoutNavigationPopulate+0x208>)
c0de6c06:	eb09 0700 	add.w	r7, r9, r0
c0de6c0a:	447a      	add	r2, pc
c0de6c0c:	4638      	mov	r0, r7
c0de6c0e:	f003 fdff 	bl	c0dea810 <snprintf>
c0de6c12:	0a38      	lsrs	r0, r7, #8
c0de6c14:	0e39      	lsrs	r1, r7, #24
c0de6c16:	f06f 0201 	mvn.w	r2, #1
c0de6c1a:	f886 a022 	strb.w	sl, [r6, #34]	@ 0x22
c0de6c1e:	f886 0027 	strb.w	r0, [r6, #39]	@ 0x27
c0de6c22:	4630      	mov	r0, r6
c0de6c24:	f800 7f26 	strb.w	r7, [r0, #38]!
c0de6c28:	70c1      	strb	r1, [r0, #3]
c0de6c2a:	0c39      	lsrs	r1, r7, #16
c0de6c2c:	7081      	strb	r1, [r0, #2]
c0de6c2e:	2000      	movs	r0, #0
c0de6c30:	7861      	ldrb	r1, [r4, #1]
c0de6c32:	71f0      	strb	r0, [r6, #7]
c0de6c34:	2060      	movs	r0, #96	@ 0x60
c0de6c36:	71b0      	strb	r0, [r6, #6]
c0de6c38:	2001      	movs	r0, #1
c0de6c3a:	77f0      	strb	r0, [r6, #31]
c0de6c3c:	2005      	movs	r0, #5
c0de6c3e:	f886 0020 	strb.w	r0, [r6, #32]
c0de6c42:	75b0      	strb	r0, [r6, #22]
c0de6c44:	7820      	ldrb	r0, [r4, #0]
c0de6c46:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de6c4a:	f1c0 0168 	rsb	r1, r0, #104	@ 0x68
c0de6c4e:	fb91 f1f2 	sdiv	r1, r1, r2
c0de6c52:	1a08      	subs	r0, r1, r0
c0de6c54:	4641      	mov	r1, r8
c0de6c56:	f811 cf22 	ldrb.w	ip, [r1, #34]!
c0de6c5a:	f811 3c1e 	ldrb.w	r3, [r1, #-30]
c0de6c5e:	f811 4c1d 	ldrb.w	r4, [r1, #-29]
c0de6c62:	784f      	ldrb	r7, [r1, #1]
c0de6c64:	788a      	ldrb	r2, [r1, #2]
c0de6c66:	ea43 2304 	orr.w	r3, r3, r4, lsl #8
c0de6c6a:	eb03 0040 	add.w	r0, r3, r0, lsl #1
c0de6c6e:	7130      	strb	r0, [r6, #4]
c0de6c70:	0a00      	lsrs	r0, r0, #8
c0de6c72:	78c9      	ldrb	r1, [r1, #3]
c0de6c74:	7170      	strb	r0, [r6, #5]
c0de6c76:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0de6c7a:	ea4c 2207 	orr.w	r2, ip, r7, lsl #8
c0de6c7e:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de6c82:	60ce      	str	r6, [r1, #12]
c0de6c84:	7928      	ldrb	r0, [r5, #4]
c0de6c86:	b1a8      	cbz	r0, c0de6cb4 <layoutNavigationPopulate+0x1e8>
c0de6c88:	4640      	mov	r0, r8
c0de6c8a:	f810 1f22 	ldrb.w	r1, [r0, #34]!
c0de6c8e:	7842      	ldrb	r2, [r0, #1]
c0de6c90:	7883      	ldrb	r3, [r0, #2]
c0de6c92:	78c0      	ldrb	r0, [r0, #3]
c0de6c94:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de6c98:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
c0de6c9c:	ea41 4000 	orr.w	r0, r1, r0, lsl #16
c0de6ca0:	6840      	ldr	r0, [r0, #4]
c0de6ca2:	f810 1f17 	ldrb.w	r1, [r0, #23]!
c0de6ca6:	7842      	ldrb	r2, [r0, #1]
c0de6ca8:	ea41 2102 	orr.w	r1, r1, r2, lsl #8
c0de6cac:	314f      	adds	r1, #79	@ 0x4f
c0de6cae:	7001      	strb	r1, [r0, #0]
c0de6cb0:	0a09      	lsrs	r1, r1, #8
c0de6cb2:	7041      	strb	r1, [r0, #1]
c0de6cb4:	7869      	ldrb	r1, [r5, #1]
c0de6cb6:	78aa      	ldrb	r2, [r5, #2]
c0de6cb8:	4640      	mov	r0, r8
c0de6cba:	e8bd 45f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0de6cbe:	f7ff bee5 	b.w	c0de6a8c <configButtons>
c0de6cc2:	bf00      	nop
c0de6cc4:	00001970 	.word	0x00001970
c0de6cc8:	0000545b 	.word	0x0000545b
c0de6ccc:	000052ed 	.word	0x000052ed
c0de6cd0:	00005328 	.word	0x00005328
c0de6cd4:	00005e7c 	.word	0x00005e7c

c0de6cd8 <OUTLINED_FUNCTION_0>:
c0de6cd8:	4641      	mov	r1, r8
c0de6cda:	f811 2f22 	ldrb.w	r2, [r1, #34]!
c0de6cde:	784b      	ldrb	r3, [r1, #1]
c0de6ce0:	788c      	ldrb	r4, [r1, #2]
c0de6ce2:	78c9      	ldrb	r1, [r1, #3]
c0de6ce4:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de6ce8:	ea44 2101 	orr.w	r1, r4, r1, lsl #8
c0de6cec:	ea42 4101 	orr.w	r1, r2, r1, lsl #16
c0de6cf0:	4770      	bx	lr

c0de6cf2 <OUTLINED_FUNCTION_1>:
c0de6cf2:	0a0a      	lsrs	r2, r1, #8
c0de6cf4:	0e0b      	lsrs	r3, r1, #24
c0de6cf6:	f880 202f 	strb.w	r2, [r0, #47]	@ 0x2f
c0de6cfa:	4602      	mov	r2, r0
c0de6cfc:	f802 1f2e 	strb.w	r1, [r2, #46]!
c0de6d00:	0c09      	lsrs	r1, r1, #16
c0de6d02:	4770      	bx	lr

c0de6d04 <nbgl_pageDrawInfo>:
c0de6d04:	b570      	push	{r4, r5, r6, lr}
c0de6d06:	b08c      	sub	sp, #48	@ 0x30
c0de6d08:	460d      	mov	r5, r1
c0de6d0a:	4606      	mov	r6, r0
c0de6d0c:	a805      	add	r0, sp, #20
c0de6d0e:	211c      	movs	r1, #28
c0de6d10:	4614      	mov	r4, r2
c0de6d12:	f004 f931 	bl	c0deaf78 <__aeabi_memclr>
c0de6d16:	2001      	movs	r0, #1
c0de6d18:	9608      	str	r6, [sp, #32]
c0de6d1a:	f88d 0015 	strb.w	r0, [sp, #21]
c0de6d1e:	f894 0024 	ldrb.w	r0, [r4, #36]	@ 0x24
c0de6d22:	b948      	cbnz	r0, c0de6d38 <nbgl_pageDrawInfo+0x34>
c0de6d24:	6a20      	ldr	r0, [r4, #32]
c0de6d26:	9006      	str	r0, [sp, #24]
c0de6d28:	f894 0025 	ldrb.w	r0, [r4, #37]	@ 0x25
c0de6d2c:	f88d 001c 	strb.w	r0, [sp, #28]
c0de6d30:	f894 0031 	ldrb.w	r0, [r4, #49]	@ 0x31
c0de6d34:	f88d 001d 	strb.w	r0, [sp, #29]
c0de6d38:	b1f5      	cbz	r5, c0de6d78 <nbgl_pageDrawInfo+0x74>
c0de6d3a:	4629      	mov	r1, r5
c0de6d3c:	7a68      	ldrb	r0, [r5, #9]
c0de6d3e:	78eb      	ldrb	r3, [r5, #3]
c0de6d40:	f811 2f08 	ldrb.w	r2, [r1, #8]!
c0de6d44:	f000 fb4f 	bl	c0de73e6 <OUTLINED_FUNCTION_1>
c0de6d48:	4629      	mov	r1, r5
c0de6d4a:	900b      	str	r0, [sp, #44]	@ 0x2c
c0de6d4c:	7968      	ldrb	r0, [r5, #5]
c0de6d4e:	f811 2f04 	ldrb.w	r2, [r1, #4]!
c0de6d52:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de6d56:	788a      	ldrb	r2, [r1, #2]
c0de6d58:	78c9      	ldrb	r1, [r1, #3]
c0de6d5a:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0de6d5e:	78aa      	ldrb	r2, [r5, #2]
c0de6d60:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de6d64:	7869      	ldrb	r1, [r5, #1]
c0de6d66:	900a      	str	r0, [sp, #40]	@ 0x28
c0de6d68:	7828      	ldrb	r0, [r5, #0]
c0de6d6a:	ea42 2203 	orr.w	r2, r2, r3, lsl #8
c0de6d6e:	ea40 2001 	orr.w	r0, r0, r1, lsl #8
c0de6d72:	ea40 4002 	orr.w	r0, r0, r2, lsl #16
c0de6d76:	e000      	b.n	c0de6d7a <nbgl_pageDrawInfo+0x76>
c0de6d78:	2000      	movs	r0, #0
c0de6d7a:	9009      	str	r0, [sp, #36]	@ 0x24
c0de6d7c:	a805      	add	r0, sp, #20
c0de6d7e:	f7fc fa21 	bl	c0de31c4 <nbgl_layoutGet>
c0de6d82:	4605      	mov	r5, r0
c0de6d84:	f894 0024 	ldrb.w	r0, [r4, #36]	@ 0x24
c0de6d88:	b150      	cbz	r0, c0de6da0 <nbgl_pageDrawInfo+0x9c>
c0de6d8a:	f894 0031 	ldrb.w	r0, [r4, #49]	@ 0x31
c0de6d8e:	f894 3025 	ldrb.w	r3, [r4, #37]	@ 0x25
c0de6d92:	6a22      	ldr	r2, [r4, #32]
c0de6d94:	f44f 61c0 	mov.w	r1, #1536	@ 0x600
c0de6d98:	9000      	str	r0, [sp, #0]
c0de6d9a:	4628      	mov	r0, r5
c0de6d9c:	f7fc ff7a 	bl	c0de3c94 <nbgl_layoutAddSwipe>
c0de6da0:	7d20      	ldrb	r0, [r4, #20]
c0de6da2:	b3b8      	cbz	r0, c0de6e14 <nbgl_pageDrawInfo+0x110>
c0de6da4:	4628      	mov	r0, r5
c0de6da6:	2128      	movs	r1, #40	@ 0x28
c0de6da8:	f000 f8a6 	bl	c0de6ef8 <addEmptyHeader>
c0de6dac:	4628      	mov	r0, r5
c0de6dae:	4621      	mov	r1, r4
c0de6db0:	f7fe f887 	bl	c0de4ec2 <nbgl_layoutAddCenteredInfo>
c0de6db4:	6aa0      	ldr	r0, [r4, #40]	@ 0x28
c0de6db6:	b1b8      	cbz	r0, c0de6de8 <nbgl_pageDrawInfo+0xe4>
c0de6db8:	7d61      	ldrb	r1, [r4, #21]
c0de6dba:	2904      	cmp	r1, #4
c0de6dbc:	d014      	beq.n	c0de6de8 <nbgl_pageDrawInfo+0xe4>
c0de6dbe:	9001      	str	r0, [sp, #4]
c0de6dc0:	2001      	movs	r0, #1
c0de6dc2:	f8ad 000e 	strh.w	r0, [sp, #14]
c0de6dc6:	6ae0      	ldr	r0, [r4, #44]	@ 0x2c
c0de6dc8:	9002      	str	r0, [sp, #8]
c0de6dca:	7de0      	ldrb	r0, [r4, #23]
c0de6dcc:	f88d 000c 	strb.w	r0, [sp, #12]
c0de6dd0:	f894 0030 	ldrb.w	r0, [r4, #48]	@ 0x30
c0de6dd4:	f88d 000d 	strb.w	r0, [sp, #13]
c0de6dd8:	f894 0031 	ldrb.w	r0, [r4, #49]	@ 0x31
c0de6ddc:	f88d 0010 	strb.w	r0, [sp, #16]
c0de6de0:	a901      	add	r1, sp, #4
c0de6de2:	4628      	mov	r0, r5
c0de6de4:	f7fe fe2d 	bl	c0de5a42 <nbgl_layoutAddButton>
c0de6de8:	69a0      	ldr	r0, [r4, #24]
c0de6dea:	b140      	cbz	r0, c0de6dfe <nbgl_pageDrawInfo+0xfa>
c0de6dec:	f003 fea2 	bl	c0deab34 <pic>
c0de6df0:	7f22      	ldrb	r2, [r4, #28]
c0de6df2:	f894 3031 	ldrb.w	r3, [r4, #49]	@ 0x31
c0de6df6:	4601      	mov	r1, r0
c0de6df8:	4628      	mov	r0, r5
c0de6dfa:	f7fe ff10 	bl	c0de5c1e <nbgl_layoutAddFooter>
c0de6dfe:	7d20      	ldrb	r0, [r4, #20]
c0de6e00:	b1f8      	cbz	r0, c0de6e42 <nbgl_pageDrawInfo+0x13e>
c0de6e02:	2801      	cmp	r0, #1
c0de6e04:	d00f      	beq.n	c0de6e26 <nbgl_pageDrawInfo+0x122>
c0de6e06:	2802      	cmp	r0, #2
c0de6e08:	d010      	beq.n	c0de6e2c <nbgl_pageDrawInfo+0x128>
c0de6e0a:	2803      	cmp	r0, #3
c0de6e0c:	d13f      	bne.n	c0de6e8e <nbgl_pageDrawInfo+0x18a>
c0de6e0e:	4833      	ldr	r0, [pc, #204]	@ (c0de6edc <nbgl_pageDrawInfo+0x1d8>)
c0de6e10:	4478      	add	r0, pc
c0de6e12:	e00d      	b.n	c0de6e30 <nbgl_pageDrawInfo+0x12c>
c0de6e14:	6a20      	ldr	r0, [r4, #32]
c0de6e16:	2800      	cmp	r0, #0
c0de6e18:	d0c8      	beq.n	c0de6dac <nbgl_pageDrawInfo+0xa8>
c0de6e1a:	f003 fe8b 	bl	c0deab34 <pic>
c0de6e1e:	7800      	ldrb	r0, [r0, #0]
c0de6e20:	2800      	cmp	r0, #0
c0de6e22:	d1bf      	bne.n	c0de6da4 <nbgl_pageDrawInfo+0xa0>
c0de6e24:	e7c2      	b.n	c0de6dac <nbgl_pageDrawInfo+0xa8>
c0de6e26:	482c      	ldr	r0, [pc, #176]	@ (c0de6ed8 <nbgl_pageDrawInfo+0x1d4>)
c0de6e28:	4478      	add	r0, pc
c0de6e2a:	e001      	b.n	c0de6e30 <nbgl_pageDrawInfo+0x12c>
c0de6e2c:	482c      	ldr	r0, [pc, #176]	@ (c0de6ee0 <nbgl_pageDrawInfo+0x1dc>)
c0de6e2e:	4478      	add	r0, pc
c0de6e30:	f003 fe80 	bl	c0deab34 <pic>
c0de6e34:	7da2      	ldrb	r2, [r4, #22]
c0de6e36:	f894 3031 	ldrb.w	r3, [r4, #49]	@ 0x31
c0de6e3a:	4601      	mov	r1, r0
c0de6e3c:	4628      	mov	r0, r5
c0de6e3e:	f7fc ff85 	bl	c0de3d4c <nbgl_layoutAddTopRightButton>
c0de6e42:	7d60      	ldrb	r0, [r4, #21]
c0de6e44:	b3c0      	cbz	r0, c0de6eb8 <nbgl_pageDrawInfo+0x1b4>
c0de6e46:	2801      	cmp	r0, #1
c0de6e48:	d023      	beq.n	c0de6e92 <nbgl_pageDrawInfo+0x18e>
c0de6e4a:	2802      	cmp	r0, #2
c0de6e4c:	d024      	beq.n	c0de6e98 <nbgl_pageDrawInfo+0x194>
c0de6e4e:	2803      	cmp	r0, #3
c0de6e50:	d025      	beq.n	c0de6e9e <nbgl_pageDrawInfo+0x19a>
c0de6e52:	2804      	cmp	r0, #4
c0de6e54:	d11b      	bne.n	c0de6e8e <nbgl_pageDrawInfo+0x18a>
c0de6e56:	6aa0      	ldr	r0, [r4, #40]	@ 0x28
c0de6e58:	b3a0      	cbz	r0, c0de6ec4 <nbgl_pageDrawInfo+0x1c0>
c0de6e5a:	4923      	ldr	r1, [pc, #140]	@ (c0de6ee8 <nbgl_pageDrawInfo+0x1e4>)
c0de6e5c:	4479      	add	r1, pc
c0de6e5e:	e9cd 0101 	strd	r0, r1, [sp, #4]
c0de6e62:	6ae0      	ldr	r0, [r4, #44]	@ 0x2c
c0de6e64:	2102      	movs	r1, #2
c0de6e66:	9003      	str	r0, [sp, #12]
c0de6e68:	7de0      	ldrb	r0, [r4, #23]
c0de6e6a:	f88d 0010 	strb.w	r0, [sp, #16]
c0de6e6e:	f894 0031 	ldrb.w	r0, [r4, #49]	@ 0x31
c0de6e72:	f88d 0012 	strb.w	r0, [sp, #18]
c0de6e76:	f894 0030 	ldrb.w	r0, [r4, #48]	@ 0x30
c0de6e7a:	2800      	cmp	r0, #0
c0de6e7c:	bf08      	it	eq
c0de6e7e:	2101      	moveq	r1, #1
c0de6e80:	f88d 1011 	strb.w	r1, [sp, #17]
c0de6e84:	4628      	mov	r0, r5
c0de6e86:	a901      	add	r1, sp, #4
c0de6e88:	f7fe fbe4 	bl	c0de5654 <nbgl_layoutAddChoiceButtons>
c0de6e8c:	e014      	b.n	c0de6eb8 <nbgl_pageDrawInfo+0x1b4>
c0de6e8e:	2500      	movs	r5, #0
c0de6e90:	e015      	b.n	c0de6ebe <nbgl_pageDrawInfo+0x1ba>
c0de6e92:	4814      	ldr	r0, [pc, #80]	@ (c0de6ee4 <nbgl_pageDrawInfo+0x1e0>)
c0de6e94:	4478      	add	r0, pc
c0de6e96:	e004      	b.n	c0de6ea2 <nbgl_pageDrawInfo+0x19e>
c0de6e98:	4816      	ldr	r0, [pc, #88]	@ (c0de6ef4 <nbgl_pageDrawInfo+0x1f0>)
c0de6e9a:	4478      	add	r0, pc
c0de6e9c:	e001      	b.n	c0de6ea2 <nbgl_pageDrawInfo+0x19e>
c0de6e9e:	4814      	ldr	r0, [pc, #80]	@ (c0de6ef0 <nbgl_pageDrawInfo+0x1ec>)
c0de6ea0:	4478      	add	r0, pc
c0de6ea2:	f003 fe47 	bl	c0deab34 <pic>
c0de6ea6:	4601      	mov	r1, r0
c0de6ea8:	f894 0031 	ldrb.w	r0, [r4, #49]	@ 0x31
c0de6eac:	7de2      	ldrb	r2, [r4, #23]
c0de6eae:	2300      	movs	r3, #0
c0de6eb0:	9000      	str	r0, [sp, #0]
c0de6eb2:	4628      	mov	r0, r5
c0de6eb4:	f7fd fb16 	bl	c0de44e4 <nbgl_layoutAddBottomButton>
c0de6eb8:	4628      	mov	r0, r5
c0de6eba:	f7ff f9f4 	bl	c0de62a6 <nbgl_layoutDraw>
c0de6ebe:	4628      	mov	r0, r5
c0de6ec0:	b00c      	add	sp, #48	@ 0x30
c0de6ec2:	bd70      	pop	{r4, r5, r6, pc}
c0de6ec4:	7de2      	ldrb	r2, [r4, #23]
c0de6ec6:	f894 3031 	ldrb.w	r3, [r4, #49]	@ 0x31
c0de6eca:	4908      	ldr	r1, [pc, #32]	@ (c0de6eec <nbgl_pageDrawInfo+0x1e8>)
c0de6ecc:	4628      	mov	r0, r5
c0de6ece:	4479      	add	r1, pc
c0de6ed0:	f7fe fea5 	bl	c0de5c1e <nbgl_layoutAddFooter>
c0de6ed4:	e7f0      	b.n	c0de6eb8 <nbgl_pageDrawInfo+0x1b4>
c0de6ed6:	bf00      	nop
c0de6ed8:	0000564a 	.word	0x0000564a
c0de6edc:	00005174 	.word	0x00005174
c0de6ee0:	00005113 	.word	0x00005113
c0de6ee4:	000055de 	.word	0x000055de
c0de6ee8:	00005ff1 	.word	0x00005ff1
c0de6eec:	00005f7f 	.word	0x00005f7f
c0de6ef0:	000050e4 	.word	0x000050e4
c0de6ef4:	000050a7 	.word	0x000050a7

c0de6ef8 <addEmptyHeader>:
c0de6ef8:	b570      	push	{r4, r5, r6, lr}
c0de6efa:	b086      	sub	sp, #24
c0de6efc:	ae01      	add	r6, sp, #4
c0de6efe:	460c      	mov	r4, r1
c0de6f00:	4605      	mov	r5, r0
c0de6f02:	2114      	movs	r1, #20
c0de6f04:	f000 fa85 	bl	c0de7412 <OUTLINED_FUNCTION_4>
c0de6f08:	4628      	mov	r0, r5
c0de6f0a:	4631      	mov	r1, r6
c0de6f0c:	f8ad 4008 	strh.w	r4, [sp, #8]
c0de6f10:	f7fe feac 	bl	c0de5c6c <nbgl_layoutAddHeader>
c0de6f14:	b006      	add	sp, #24
c0de6f16:	bd70      	pop	{r4, r5, r6, pc}

c0de6f18 <nbgl_pageDrawConfirmation>:
c0de6f18:	b5b0      	push	{r4, r5, r7, lr}
c0de6f1a:	b08c      	sub	sp, #48	@ 0x30
c0de6f1c:	4605      	mov	r5, r0
c0de6f1e:	6948      	ldr	r0, [r1, #20]
c0de6f20:	460c      	mov	r4, r1
c0de6f22:	f003 fe07 	bl	c0deab34 <pic>
c0de6f26:	9001      	str	r0, [sp, #4]
c0de6f28:	69a0      	ldr	r0, [r4, #24]
c0de6f2a:	b110      	cbz	r0, c0de6f32 <nbgl_pageDrawConfirmation+0x1a>
c0de6f2c:	f003 fe02 	bl	c0deab34 <pic>
c0de6f30:	e001      	b.n	c0de6f36 <nbgl_pageDrawConfirmation+0x1e>
c0de6f32:	4815      	ldr	r0, [pc, #84]	@ (c0de6f88 <nbgl_pageDrawConfirmation+0x70>)
c0de6f34:	4478      	add	r0, pc
c0de6f36:	2100      	movs	r1, #0
c0de6f38:	7fe2      	ldrb	r2, [r4, #31]
c0de6f3a:	9508      	str	r5, [sp, #32]
c0de6f3c:	e9cd 0102 	strd	r0, r1, [sp, #8]
c0de6f40:	2001      	movs	r0, #1
c0de6f42:	f88d 1011 	strb.w	r1, [sp, #17]
c0de6f46:	9109      	str	r1, [sp, #36]	@ 0x24
c0de6f48:	9106      	str	r1, [sp, #24]
c0de6f4a:	7fa1      	ldrb	r1, [r4, #30]
c0de6f4c:	f88d 0015 	strb.w	r0, [sp, #21]
c0de6f50:	7f20      	ldrb	r0, [r4, #28]
c0de6f52:	f88d 2014 	strb.w	r2, [sp, #20]
c0de6f56:	f88d 1012 	strb.w	r1, [sp, #18]
c0de6f5a:	f88d 0010 	strb.w	r0, [sp, #16]
c0de6f5e:	a805      	add	r0, sp, #20
c0de6f60:	f7fc f930 	bl	c0de31c4 <nbgl_layoutGet>
c0de6f64:	2140      	movs	r1, #64	@ 0x40
c0de6f66:	4605      	mov	r5, r0
c0de6f68:	f7ff ffc6 	bl	c0de6ef8 <addEmptyHeader>
c0de6f6c:	a901      	add	r1, sp, #4
c0de6f6e:	4628      	mov	r0, r5
c0de6f70:	f7fe fb70 	bl	c0de5654 <nbgl_layoutAddChoiceButtons>
c0de6f74:	4628      	mov	r0, r5
c0de6f76:	4621      	mov	r1, r4
c0de6f78:	f7fd ffa3 	bl	c0de4ec2 <nbgl_layoutAddCenteredInfo>
c0de6f7c:	4628      	mov	r0, r5
c0de6f7e:	f7ff f992 	bl	c0de62a6 <nbgl_layoutDraw>
c0de6f82:	4628      	mov	r0, r5
c0de6f84:	b00c      	add	sp, #48	@ 0x30
c0de6f86:	bdb0      	pop	{r4, r5, r7, pc}
c0de6f88:	00005b11 	.word	0x00005b11

c0de6f8c <nbgl_pageDrawGenericContentExt>:
c0de6f8c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de6f90:	b096      	sub	sp, #88	@ 0x58
c0de6f92:	460e      	mov	r6, r1
c0de6f94:	2100      	movs	r1, #0
c0de6f96:	4615      	mov	r5, r2
c0de6f98:	f88d 3008 	strb.w	r3, [sp, #8]
c0de6f9c:	e9cd 0105 	strd	r0, r1, [sp, #20]
c0de6fa0:	2001      	movs	r0, #1
c0de6fa2:	f88d 0009 	strb.w	r0, [sp, #9]
c0de6fa6:	b10e      	cbz	r6, c0de6fac <nbgl_pageDrawGenericContentExt+0x20>
c0de6fa8:	78f0      	ldrb	r0, [r6, #3]
c0de6faa:	b108      	cbz	r0, c0de6fb0 <nbgl_pageDrawGenericContentExt+0x24>
c0de6fac:	9103      	str	r1, [sp, #12]
c0de6fae:	e007      	b.n	c0de6fc0 <nbgl_pageDrawGenericContentExt+0x34>
c0de6fb0:	6970      	ldr	r0, [r6, #20]
c0de6fb2:	7cb1      	ldrb	r1, [r6, #18]
c0de6fb4:	9003      	str	r0, [sp, #12]
c0de6fb6:	7970      	ldrb	r0, [r6, #5]
c0de6fb8:	f88d 1010 	strb.w	r1, [sp, #16]
c0de6fbc:	f88d 0011 	strb.w	r0, [sp, #17]
c0de6fc0:	a802      	add	r0, sp, #8
c0de6fc2:	f7fc f8ff 	bl	c0de31c4 <nbgl_layoutGet>
c0de6fc6:	4682      	mov	sl, r0
c0de6fc8:	b17e      	cbz	r6, c0de6fea <nbgl_pageDrawGenericContentExt+0x5e>
c0de6fca:	78f0      	ldrb	r0, [r6, #3]
c0de6fcc:	2801      	cmp	r0, #1
c0de6fce:	d011      	beq.n	c0de6ff4 <nbgl_pageDrawGenericContentExt+0x68>
c0de6fd0:	b958      	cbnz	r0, c0de6fea <nbgl_pageDrawGenericContentExt+0x5e>
c0de6fd2:	68b3      	ldr	r3, [r6, #8]
c0de6fd4:	78b2      	ldrb	r2, [r6, #2]
c0de6fd6:	69b1      	ldr	r1, [r6, #24]
c0de6fd8:	b323      	cbz	r3, c0de7024 <nbgl_pageDrawGenericContentExt+0x98>
c0de6fda:	7970      	ldrb	r0, [r6, #5]
c0de6fdc:	7b34      	ldrb	r4, [r6, #12]
c0de6fde:	e9cd 4000 	strd	r4, r0, [sp]
c0de6fe2:	4650      	mov	r0, sl
c0de6fe4:	f7fe fe2d 	bl	c0de5c42 <nbgl_layoutAddSplitFooter>
c0de6fe8:	e020      	b.n	c0de702c <nbgl_pageDrawGenericContentExt+0xa0>
c0de6fea:	f04f 0800 	mov.w	r8, #0
c0de6fee:	f44f 7716 	mov.w	r7, #600	@ 0x258
c0de6ff2:	e07e      	b.n	c0de70f2 <nbgl_pageDrawGenericContentExt+0x166>
c0de6ff4:	68b0      	ldr	r0, [r6, #8]
c0de6ff6:	2800      	cmp	r0, #0
c0de6ff8:	4680      	mov	r8, r0
c0de6ffa:	bf18      	it	ne
c0de6ffc:	f04f 0801 	movne.w	r8, #1
c0de7000:	d027      	beq.n	c0de7052 <nbgl_pageDrawGenericContentExt+0xc6>
c0de7002:	900e      	str	r0, [sp, #56]	@ 0x38
c0de7004:	2006      	movs	r0, #6
c0de7006:	7b31      	ldrb	r1, [r6, #12]
c0de7008:	f8ad 0034 	strh.w	r0, [sp, #52]	@ 0x34
c0de700c:	7970      	ldrb	r0, [r6, #5]
c0de700e:	f88d 103c 	strb.w	r1, [sp, #60]	@ 0x3c
c0de7012:	f88d 003d 	strb.w	r0, [sp, #61]	@ 0x3d
c0de7016:	a90d      	add	r1, sp, #52	@ 0x34
c0de7018:	4650      	mov	r0, sl
c0de701a:	f7fe fe27 	bl	c0de5c6c <nbgl_layoutAddHeader>
c0de701e:	f5c0 7716 	rsb	r7, r0, #600	@ 0x258
c0de7022:	e018      	b.n	c0de7056 <nbgl_pageDrawGenericContentExt+0xca>
c0de7024:	7973      	ldrb	r3, [r6, #5]
c0de7026:	4650      	mov	r0, sl
c0de7028:	f7fe fdf9 	bl	c0de5c1e <nbgl_layoutAddFooter>
c0de702c:	f5c0 7716 	rsb	r7, r0, #600	@ 0x258
c0de7030:	7930      	ldrb	r0, [r6, #4]
c0de7032:	2800      	cmp	r0, #0
c0de7034:	d042      	beq.n	c0de70bc <nbgl_pageDrawGenericContentExt+0x130>
c0de7036:	7c70      	ldrb	r0, [r6, #17]
c0de7038:	7974      	ldrb	r4, [r6, #5]
c0de703a:	7831      	ldrb	r1, [r6, #0]
c0de703c:	7872      	ldrb	r2, [r6, #1]
c0de703e:	7c33      	ldrb	r3, [r6, #16]
c0de7040:	e9cd 0400 	strd	r0, r4, [sp]
c0de7044:	4650      	mov	r0, sl
c0de7046:	f7ff f913 	bl	c0de6270 <nbgl_layoutAddProgressIndicator>
c0de704a:	1a3f      	subs	r7, r7, r0
c0de704c:	f04f 0801 	mov.w	r8, #1
c0de7050:	e04f      	b.n	c0de70f2 <nbgl_pageDrawGenericContentExt+0x166>
c0de7052:	f44f 7716 	mov.w	r7, #600	@ 0x258
c0de7056:	2001      	movs	r0, #1
c0de7058:	f88d 0035 	strb.w	r0, [sp, #53]	@ 0x35
c0de705c:	7870      	ldrb	r0, [r6, #1]
c0de705e:	2802      	cmp	r0, #2
c0de7060:	d31c      	bcc.n	c0de709c <nbgl_pageDrawGenericContentExt+0x110>
c0de7062:	6971      	ldr	r1, [r6, #20]
c0de7064:	b369      	cbz	r1, c0de70c2 <nbgl_pageDrawGenericContentExt+0x136>
c0de7066:	f88d 0039 	strb.w	r0, [sp, #57]	@ 0x39
c0de706a:	2001      	movs	r0, #1
c0de706c:	9111      	str	r1, [sp, #68]	@ 0x44
c0de706e:	2103      	movs	r1, #3
c0de7070:	7972      	ldrb	r2, [r6, #5]
c0de7072:	f000 f9c7 	bl	c0de7404 <OUTLINED_FUNCTION_3>
c0de7076:	2100      	movs	r1, #0
c0de7078:	f88d 103b 	strb.w	r1, [sp, #59]	@ 0x3b
c0de707c:	78b1      	ldrb	r1, [r6, #2]
c0de707e:	f88d 2049 	strb.w	r2, [sp, #73]	@ 0x49
c0de7082:	f88d 303c 	strb.w	r3, [sp, #60]	@ 0x3c
c0de7086:	f88d 2040 	strb.w	r2, [sp, #64]	@ 0x40
c0de708a:	f88d 003a 	strb.w	r0, [sp, #58]	@ 0x3a
c0de708e:	7cb0      	ldrb	r0, [r6, #18]
c0de7090:	f88d 1048 	strb.w	r1, [sp, #72]	@ 0x48
c0de7094:	f88d 003f 	strb.w	r0, [sp, #63]	@ 0x3f
c0de7098:	7cf0      	ldrb	r0, [r6, #19]
c0de709a:	e023      	b.n	c0de70e4 <nbgl_pageDrawGenericContentExt+0x158>
c0de709c:	6970      	ldr	r0, [r6, #20]
c0de709e:	b340      	cbz	r0, c0de70f2 <nbgl_pageDrawGenericContentExt+0x166>
c0de70a0:	2100      	movs	r1, #0
c0de70a2:	900e      	str	r0, [sp, #56]	@ 0x38
c0de70a4:	2001      	movs	r0, #1
c0de70a6:	f88d 103c 	strb.w	r1, [sp, #60]	@ 0x3c
c0de70aa:	f88d 0034 	strb.w	r0, [sp, #52]	@ 0x34
c0de70ae:	78b0      	ldrb	r0, [r6, #2]
c0de70b0:	7971      	ldrb	r1, [r6, #5]
c0de70b2:	f88d 003d 	strb.w	r0, [sp, #61]	@ 0x3d
c0de70b6:	f88d 103e 	strb.w	r1, [sp, #62]	@ 0x3e
c0de70ba:	e015      	b.n	c0de70e8 <nbgl_pageDrawGenericContentExt+0x15c>
c0de70bc:	f04f 0800 	mov.w	r8, #0
c0de70c0:	e017      	b.n	c0de70f2 <nbgl_pageDrawGenericContentExt+0x166>
c0de70c2:	f88d 0039 	strb.w	r0, [sp, #57]	@ 0x39
c0de70c6:	2000      	movs	r0, #0
c0de70c8:	2104      	movs	r1, #4
c0de70ca:	7c32      	ldrb	r2, [r6, #16]
c0de70cc:	f000 f99a 	bl	c0de7404 <OUTLINED_FUNCTION_3>
c0de70d0:	7971      	ldrb	r1, [r6, #5]
c0de70d2:	f88d 203b 	strb.w	r2, [sp, #59]	@ 0x3b
c0de70d6:	f88d 303c 	strb.w	r3, [sp, #60]	@ 0x3c
c0de70da:	f88d 003a 	strb.w	r0, [sp, #58]	@ 0x3a
c0de70de:	7cf0      	ldrb	r0, [r6, #19]
c0de70e0:	f88d 1040 	strb.w	r1, [sp, #64]	@ 0x40
c0de70e4:	f88d 0038 	strb.w	r0, [sp, #56]	@ 0x38
c0de70e8:	a90d      	add	r1, sp, #52	@ 0x34
c0de70ea:	4650      	mov	r0, sl
c0de70ec:	f7fc fe6c 	bl	c0de3dc8 <nbgl_layoutAddExtendedFooter>
c0de70f0:	1a3f      	subs	r7, r7, r0
c0de70f2:	6828      	ldr	r0, [r5, #0]
c0de70f4:	b190      	cbz	r0, c0de711c <nbgl_pageDrawGenericContentExt+0x190>
c0de70f6:	900f      	str	r0, [sp, #60]	@ 0x3c
c0de70f8:	2000      	movs	r0, #0
c0de70fa:	79a9      	ldrb	r1, [r5, #6]
c0de70fc:	900e      	str	r0, [sp, #56]	@ 0x38
c0de70fe:	f240 1001 	movw	r0, #257	@ 0x101
c0de7102:	f8ad 0034 	strh.w	r0, [sp, #52]	@ 0x34
c0de7106:	7968      	ldrb	r0, [r5, #5]
c0de7108:	f88d 1041 	strb.w	r1, [sp, #65]	@ 0x41
c0de710c:	f88d 0040 	strb.w	r0, [sp, #64]	@ 0x40
c0de7110:	a90d      	add	r1, sp, #52	@ 0x34
c0de7112:	4650      	mov	r0, sl
c0de7114:	f7fe fdaa 	bl	c0de5c6c <nbgl_layoutAddHeader>
c0de7118:	f04f 0801 	mov.w	r8, #1
c0de711c:	68a9      	ldr	r1, [r5, #8]
c0de711e:	b121      	cbz	r1, c0de712a <nbgl_pageDrawGenericContentExt+0x19e>
c0de7120:	79ab      	ldrb	r3, [r5, #6]
c0de7122:	79ea      	ldrb	r2, [r5, #7]
c0de7124:	4650      	mov	r0, sl
c0de7126:	f7fc fe11 	bl	c0de3d4c <nbgl_layoutAddTopRightButton>
c0de712a:	7b28      	ldrb	r0, [r5, #12]
c0de712c:	2800      	cmp	r0, #0
c0de712e:	d044      	beq.n	c0de71ba <nbgl_pageDrawGenericContentExt+0x22e>
c0de7130:	2801      	cmp	r0, #1
c0de7132:	d04d      	beq.n	c0de71d0 <nbgl_pageDrawGenericContentExt+0x244>
c0de7134:	2802      	cmp	r0, #2
c0de7136:	d067      	beq.n	c0de7208 <nbgl_pageDrawGenericContentExt+0x27c>
c0de7138:	2803      	cmp	r0, #3
c0de713a:	d074      	beq.n	c0de7226 <nbgl_pageDrawGenericContentExt+0x29a>
c0de713c:	2804      	cmp	r0, #4
c0de713e:	f000 808e 	beq.w	c0de725e <nbgl_pageDrawGenericContentExt+0x2d2>
c0de7142:	2805      	cmp	r0, #5
c0de7144:	f000 8093 	beq.w	c0de726e <nbgl_pageDrawGenericContentExt+0x2e2>
c0de7148:	2806      	cmp	r0, #6
c0de714a:	f000 80a9 	beq.w	c0de72a0 <nbgl_pageDrawGenericContentExt+0x314>
c0de714e:	2807      	cmp	r0, #7
c0de7150:	f000 80d9 	beq.w	c0de7306 <nbgl_pageDrawGenericContentExt+0x37a>
c0de7154:	2808      	cmp	r0, #8
c0de7156:	f000 80ea 	beq.w	c0de732e <nbgl_pageDrawGenericContentExt+0x3a2>
c0de715a:	2809      	cmp	r0, #9
c0de715c:	f000 8112 	beq.w	c0de7384 <nbgl_pageDrawGenericContentExt+0x3f8>
c0de7160:	280a      	cmp	r0, #10
c0de7162:	f040 8114 	bne.w	c0de738e <nbgl_pageDrawGenericContentExt+0x402>
c0de7166:	489a      	ldr	r0, [pc, #616]	@ (c0de73d0 <nbgl_pageDrawGenericContentExt+0x444>)
c0de7168:	2400      	movs	r4, #0
c0de716a:	f10d 0834 	add.w	r8, sp, #52	@ 0x34
c0de716e:	2600      	movs	r6, #0
c0de7170:	4478      	add	r0, pc
c0de7172:	4683      	mov	fp, r0
c0de7174:	7e28      	ldrb	r0, [r5, #24]
c0de7176:	4286      	cmp	r6, r0
c0de7178:	f080 8109 	bcs.w	c0de738e <nbgl_pageDrawGenericContentExt+0x402>
c0de717c:	e9d5 0104 	ldrd	r0, r1, [r5, #16]
c0de7180:	f850 0026 	ldr.w	r0, [r0, r6, lsl #2]
c0de7184:	e9cd b40f 	strd	fp, r4, [sp, #60]	@ 0x3c
c0de7188:	e9cd 400d 	strd	r4, r0, [sp, #52]	@ 0x34
c0de718c:	5d88      	ldrb	r0, [r1, r6]
c0de718e:	4641      	mov	r1, r8
c0de7190:	f88d 4046 	strb.w	r4, [sp, #70]	@ 0x46
c0de7194:	f88d 4044 	strb.w	r4, [sp, #68]	@ 0x44
c0de7198:	f88d 0045 	strb.w	r0, [sp, #69]	@ 0x45
c0de719c:	7e68      	ldrb	r0, [r5, #25]
c0de719e:	f88d 0048 	strb.w	r0, [sp, #72]	@ 0x48
c0de71a2:	4650      	mov	r0, sl
c0de71a4:	f7fd f9bd 	bl	c0de4522 <nbgl_layoutAddTouchableBar>
c0de71a8:	1a3f      	subs	r7, r7, r0
c0de71aa:	b2b8      	uxth	r0, r7
c0de71ac:	280b      	cmp	r0, #11
c0de71ae:	d302      	bcc.n	c0de71b6 <nbgl_pageDrawGenericContentExt+0x22a>
c0de71b0:	4650      	mov	r0, sl
c0de71b2:	f7fe fc29 	bl	c0de5a08 <nbgl_layoutAddSeparationLine>
c0de71b6:	3601      	adds	r6, #1
c0de71b8:	e7dc      	b.n	c0de7174 <nbgl_pageDrawGenericContentExt+0x1e8>
c0de71ba:	f1b8 0f00 	cmp.w	r8, #0
c0de71be:	d101      	bne.n	c0de71c4 <nbgl_pageDrawGenericContentExt+0x238>
c0de71c0:	f000 f90d 	bl	c0de73de <OUTLINED_FUNCTION_0>
c0de71c4:	f105 0110 	add.w	r1, r5, #16
c0de71c8:	4650      	mov	r0, sl
c0de71ca:	f7fd fe7a 	bl	c0de4ec2 <nbgl_layoutAddCenteredInfo>
c0de71ce:	e0de      	b.n	c0de738e <nbgl_pageDrawGenericContentExt+0x402>
c0de71d0:	f1b8 0f00 	cmp.w	r8, #0
c0de71d4:	d101      	bne.n	c0de71da <nbgl_pageDrawGenericContentExt+0x24e>
c0de71d6:	f000 f902 	bl	c0de73de <OUTLINED_FUNCTION_0>
c0de71da:	f105 0110 	add.w	r1, r5, #16
c0de71de:	4650      	mov	r0, sl
c0de71e0:	f7fe f8ca 	bl	c0de5378 <nbgl_layoutAddContentCenter>
c0de71e4:	6b68      	ldr	r0, [r5, #52]	@ 0x34
c0de71e6:	2800      	cmp	r0, #0
c0de71e8:	f000 80d1 	beq.w	c0de738e <nbgl_pageDrawGenericContentExt+0x402>
c0de71ec:	900e      	str	r0, [sp, #56]	@ 0x38
c0de71ee:	2003      	movs	r0, #3
c0de71f0:	f88d 0034 	strb.w	r0, [sp, #52]	@ 0x34
c0de71f4:	6ba8      	ldr	r0, [r5, #56]	@ 0x38
c0de71f6:	900f      	str	r0, [sp, #60]	@ 0x3c
c0de71f8:	8fa8      	ldrh	r0, [r5, #60]	@ 0x3c
c0de71fa:	f8ad 0040 	strh.w	r0, [sp, #64]	@ 0x40
c0de71fe:	a90d      	add	r1, sp, #52	@ 0x34
c0de7200:	4650      	mov	r0, sl
c0de7202:	f7fc fa4d 	bl	c0de36a0 <nbgl_layoutAddUpFooter>
c0de7206:	e0c2      	b.n	c0de738e <nbgl_pageDrawGenericContentExt+0x402>
c0de7208:	ae0d      	add	r6, sp, #52	@ 0x34
c0de720a:	2124      	movs	r1, #36	@ 0x24
c0de720c:	f000 f901 	bl	c0de7412 <OUTLINED_FUNCTION_4>
c0de7210:	e9d5 0104 	ldrd	r0, r1, [r5, #16]
c0de7214:	f000 f8f0 	bl	c0de73f8 <OUTLINED_FUNCTION_2>
c0de7218:	69a9      	ldr	r1, [r5, #24]
c0de721a:	7f6b      	ldrb	r3, [r5, #29]
c0de721c:	7f2a      	ldrb	r2, [r5, #28]
c0de721e:	4650      	mov	r0, sl
c0de7220:	f7fe fceb 	bl	c0de5bfa <nbgl_layoutAddLongPressButton>
c0de7224:	e0b3      	b.n	c0de738e <nbgl_pageDrawGenericContentExt+0x402>
c0de7226:	ae0d      	add	r6, sp, #52	@ 0x34
c0de7228:	2124      	movs	r1, #36	@ 0x24
c0de722a:	f000 f8f2 	bl	c0de7412 <OUTLINED_FUNCTION_4>
c0de722e:	e9d5 0104 	ldrd	r0, r1, [r5, #16]
c0de7232:	2400      	movs	r4, #0
c0de7234:	f88d 4034 	strb.w	r4, [sp, #52]	@ 0x34
c0de7238:	f000 f8de 	bl	c0de73f8 <OUTLINED_FUNCTION_2>
c0de723c:	f44f 7080 	mov.w	r0, #256	@ 0x100
c0de7240:	940a      	str	r4, [sp, #40]	@ 0x28
c0de7242:	f88d 402d 	strb.w	r4, [sp, #45]	@ 0x2d
c0de7246:	f8ad 002e 	strh.w	r0, [sp, #46]	@ 0x2e
c0de724a:	69a8      	ldr	r0, [r5, #24]
c0de724c:	9009      	str	r0, [sp, #36]	@ 0x24
c0de724e:	7f28      	ldrb	r0, [r5, #28]
c0de7250:	f88d 002c 	strb.w	r0, [sp, #44]	@ 0x2c
c0de7254:	7f68      	ldrb	r0, [r5, #29]
c0de7256:	f88d 0030 	strb.w	r0, [sp, #48]	@ 0x30
c0de725a:	a909      	add	r1, sp, #36	@ 0x24
c0de725c:	e04f      	b.n	c0de72fe <nbgl_pageDrawGenericContentExt+0x372>
c0de725e:	f1b8 0f00 	cmp.w	r8, #0
c0de7262:	d101      	bne.n	c0de7268 <nbgl_pageDrawGenericContentExt+0x2dc>
c0de7264:	f000 f8bb 	bl	c0de73de <OUTLINED_FUNCTION_0>
c0de7268:	f000 f8dd 	bl	c0de7426 <OUTLINED_FUNCTION_6>
c0de726c:	e08f      	b.n	c0de738e <nbgl_pageDrawGenericContentExt+0x402>
c0de726e:	f1b8 0f00 	cmp.w	r8, #0
c0de7272:	d101      	bne.n	c0de7278 <nbgl_pageDrawGenericContentExt+0x2ec>
c0de7274:	f000 f8b3 	bl	c0de73de <OUTLINED_FUNCTION_0>
c0de7278:	7ee8      	ldrb	r0, [r5, #27]
c0de727a:	f105 0110 	add.w	r1, r5, #16
c0de727e:	3803      	subs	r0, #3
c0de7280:	76e8      	strb	r0, [r5, #27]
c0de7282:	4650      	mov	r0, sl
c0de7284:	f7fe fa10 	bl	c0de56a8 <nbgl_layoutAddTagValueList>
c0de7288:	2001      	movs	r0, #1
c0de728a:	f88d 003d 	strb.w	r0, [sp, #61]	@ 0x3d
c0de728e:	f8ad 003e 	strh.w	r0, [sp, #62]	@ 0x3e
c0de7292:	e9d5 0109 	ldrd	r0, r1, [r5, #36]	@ 0x24
c0de7296:	e9cd 100d 	strd	r1, r0, [sp, #52]	@ 0x34
c0de729a:	f000 f8bd 	bl	c0de7418 <OUTLINED_FUNCTION_5>
c0de729e:	e02b      	b.n	c0de72f8 <nbgl_pageDrawGenericContentExt+0x36c>
c0de72a0:	f1b8 0f00 	cmp.w	r8, #0
c0de72a4:	d101      	bne.n	c0de72aa <nbgl_pageDrawGenericContentExt+0x31e>
c0de72a6:	f000 f89a 	bl	c0de73de <OUTLINED_FUNCTION_0>
c0de72aa:	f000 f8bc 	bl	c0de7426 <OUTLINED_FUNCTION_6>
c0de72ae:	6aa8      	ldr	r0, [r5, #40]	@ 0x28
c0de72b0:	2800      	cmp	r0, #0
c0de72b2:	d073      	beq.n	c0de739c <nbgl_pageDrawGenericContentExt+0x410>
c0de72b4:	900d      	str	r0, [sp, #52]	@ 0x34
c0de72b6:	6a68      	ldr	r0, [r5, #36]	@ 0x24
c0de72b8:	2101      	movs	r1, #1
c0de72ba:	f8ad 103e 	strh.w	r1, [sp, #62]	@ 0x3e
c0de72be:	f88d 103d 	strb.w	r1, [sp, #61]	@ 0x3d
c0de72c2:	900e      	str	r0, [sp, #56]	@ 0x38
c0de72c4:	f000 f8a8 	bl	c0de7418 <OUTLINED_FUNCTION_5>
c0de72c8:	f88d 0040 	strb.w	r0, [sp, #64]	@ 0x40
c0de72cc:	a90d      	add	r1, sp, #52	@ 0x34
c0de72ce:	4650      	mov	r0, sl
c0de72d0:	f7fe fbb7 	bl	c0de5a42 <nbgl_layoutAddButton>
c0de72d4:	6b28      	ldr	r0, [r5, #48]	@ 0x30
c0de72d6:	2800      	cmp	r0, #0
c0de72d8:	d059      	beq.n	c0de738e <nbgl_pageDrawGenericContentExt+0x402>
c0de72da:	2100      	movs	r1, #0
c0de72dc:	900d      	str	r0, [sp, #52]	@ 0x34
c0de72de:	f895 002d 	ldrb.w	r0, [r5, #45]	@ 0x2d
c0de72e2:	f88d 103d 	strb.w	r1, [sp, #61]	@ 0x3d
c0de72e6:	910e      	str	r1, [sp, #56]	@ 0x38
c0de72e8:	f44f 7180 	mov.w	r1, #256	@ 0x100
c0de72ec:	f8ad 103e 	strh.w	r1, [sp, #62]	@ 0x3e
c0de72f0:	f895 1038 	ldrb.w	r1, [r5, #56]	@ 0x38
c0de72f4:	f88d 103c 	strb.w	r1, [sp, #60]	@ 0x3c
c0de72f8:	f88d 0040 	strb.w	r0, [sp, #64]	@ 0x40
c0de72fc:	a90d      	add	r1, sp, #52	@ 0x34
c0de72fe:	4650      	mov	r0, sl
c0de7300:	f7fe fb9f 	bl	c0de5a42 <nbgl_layoutAddButton>
c0de7304:	e043      	b.n	c0de738e <nbgl_pageDrawGenericContentExt+0x402>
c0de7306:	2400      	movs	r4, #0
c0de7308:	2600      	movs	r6, #0
c0de730a:	7d28      	ldrb	r0, [r5, #20]
c0de730c:	4286      	cmp	r6, r0
c0de730e:	d23e      	bcs.n	c0de738e <nbgl_pageDrawGenericContentExt+0x402>
c0de7310:	6928      	ldr	r0, [r5, #16]
c0de7312:	1901      	adds	r1, r0, r4
c0de7314:	4650      	mov	r0, sl
c0de7316:	f7fd fb8b 	bl	c0de4a30 <nbgl_layoutAddSwitch>
c0de731a:	1a3f      	subs	r7, r7, r0
c0de731c:	b2b8      	uxth	r0, r7
c0de731e:	280b      	cmp	r0, #11
c0de7320:	d302      	bcc.n	c0de7328 <nbgl_pageDrawGenericContentExt+0x39c>
c0de7322:	4650      	mov	r0, sl
c0de7324:	f7fe fb70 	bl	c0de5a08 <nbgl_layoutAddSeparationLine>
c0de7328:	340c      	adds	r4, #12
c0de732a:	3601      	adds	r6, #1
c0de732c:	e7ed      	b.n	c0de730a <nbgl_pageDrawGenericContentExt+0x37e>
c0de732e:	2600      	movs	r6, #0
c0de7330:	2400      	movs	r4, #0
c0de7332:	7f28      	ldrb	r0, [r5, #28]
c0de7334:	4284      	cmp	r4, r0
c0de7336:	d22a      	bcs.n	c0de738e <nbgl_pageDrawGenericContentExt+0x402>
c0de7338:	7fa8      	ldrb	r0, [r5, #30]
c0de733a:	b180      	cbz	r0, c0de735e <nbgl_pageDrawGenericContentExt+0x3d2>
c0de733c:	69a8      	ldr	r0, [r5, #24]
c0de733e:	b170      	cbz	r0, c0de735e <nbgl_pageDrawGenericContentExt+0x3d2>
c0de7340:	5980      	ldr	r0, [r0, r6]
c0de7342:	b160      	cbz	r0, c0de735e <nbgl_pageDrawGenericContentExt+0x3d2>
c0de7344:	e9d5 0104 	ldrd	r0, r1, [r5, #16]
c0de7348:	7f6b      	ldrb	r3, [r5, #29]
c0de734a:	f851 2024 	ldr.w	r2, [r1, r4, lsl #2]
c0de734e:	f850 1024 	ldr.w	r1, [r0, r4, lsl #2]
c0de7352:	b2e0      	uxtb	r0, r4
c0de7354:	9000      	str	r0, [sp, #0]
c0de7356:	4650      	mov	r0, sl
c0de7358:	f7fd fbb0 	bl	c0de4abc <nbgl_layoutAddTextWithAlias>
c0de735c:	e008      	b.n	c0de7370 <nbgl_pageDrawGenericContentExt+0x3e4>
c0de735e:	e9d5 0104 	ldrd	r0, r1, [r5, #16]
c0de7362:	f851 2024 	ldr.w	r2, [r1, r4, lsl #2]
c0de7366:	f850 1024 	ldr.w	r1, [r0, r4, lsl #2]
c0de736a:	4650      	mov	r0, sl
c0de736c:	f7fd fb85 	bl	c0de4a7a <nbgl_layoutAddText>
c0de7370:	1a3f      	subs	r7, r7, r0
c0de7372:	b2b8      	uxth	r0, r7
c0de7374:	280b      	cmp	r0, #11
c0de7376:	d302      	bcc.n	c0de737e <nbgl_pageDrawGenericContentExt+0x3f2>
c0de7378:	4650      	mov	r0, sl
c0de737a:	f7fe fb45 	bl	c0de5a08 <nbgl_layoutAddSeparationLine>
c0de737e:	3618      	adds	r6, #24
c0de7380:	3401      	adds	r4, #1
c0de7382:	e7d6      	b.n	c0de7332 <nbgl_pageDrawGenericContentExt+0x3a6>
c0de7384:	f105 0110 	add.w	r1, r5, #16
c0de7388:	4650      	mov	r0, sl
c0de738a:	f7fd fc77 	bl	c0de4c7c <nbgl_layoutAddRadioChoice>
c0de738e:	4650      	mov	r0, sl
c0de7390:	f7fe ff89 	bl	c0de62a6 <nbgl_layoutDraw>
c0de7394:	4650      	mov	r0, sl
c0de7396:	b016      	add	sp, #88	@ 0x58
c0de7398:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de739c:	6a68      	ldr	r0, [r5, #36]	@ 0x24
c0de739e:	2800      	cmp	r0, #0
c0de73a0:	d098      	beq.n	c0de72d4 <nbgl_pageDrawGenericContentExt+0x348>
c0de73a2:	6b29      	ldr	r1, [r5, #48]	@ 0x30
c0de73a4:	2900      	cmp	r1, #0
c0de73a6:	d095      	beq.n	c0de72d4 <nbgl_pageDrawGenericContentExt+0x348>
c0de73a8:	e9cd 010d 	strd	r0, r1, [sp, #52]	@ 0x34
c0de73ac:	f895 002c 	ldrb.w	r0, [r5, #44]	@ 0x2c
c0de73b0:	f895 102d 	ldrb.w	r1, [r5, #45]	@ 0x2d
c0de73b4:	f895 2038 	ldrb.w	r2, [r5, #56]	@ 0x38
c0de73b8:	f88d 003c 	strb.w	r0, [sp, #60]	@ 0x3c
c0de73bc:	f88d 203d 	strb.w	r2, [sp, #61]	@ 0x3d
c0de73c0:	f88d 103e 	strb.w	r1, [sp, #62]	@ 0x3e
c0de73c4:	a90d      	add	r1, sp, #52	@ 0x34
c0de73c6:	4650      	mov	r0, sl
c0de73c8:	f7fe f95a 	bl	c0de5680 <nbgl_layoutAddHorizontalButtons>
c0de73cc:	e7df      	b.n	c0de738e <nbgl_pageDrawGenericContentExt+0x402>
c0de73ce:	bf00      	nop
c0de73d0:	00004c2f 	.word	0x00004c2f

c0de73d4 <nbgl_pageDrawGenericContent>:
c0de73d4:	2300      	movs	r3, #0
c0de73d6:	f7ff bdd9 	b.w	c0de6f8c <nbgl_pageDrawGenericContentExt>

c0de73da <nbgl_pageRelease>:
c0de73da:	f7fe bf83 	b.w	c0de62e4 <nbgl_layoutRelease>

c0de73de <OUTLINED_FUNCTION_0>:
c0de73de:	4650      	mov	r0, sl
c0de73e0:	2128      	movs	r1, #40	@ 0x28
c0de73e2:	f7ff bd89 	b.w	c0de6ef8 <addEmptyHeader>

c0de73e6 <OUTLINED_FUNCTION_1>:
c0de73e6:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0de73ea:	788a      	ldrb	r2, [r1, #2]
c0de73ec:	78c9      	ldrb	r1, [r1, #3]
c0de73ee:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0de73f2:	ea40 4001 	orr.w	r0, r0, r1, lsl #16
c0de73f6:	4770      	bx	lr

c0de73f8 <OUTLINED_FUNCTION_2>:
c0de73f8:	910e      	str	r1, [sp, #56]	@ 0x38
c0de73fa:	9011      	str	r0, [sp, #68]	@ 0x44
c0de73fc:	4650      	mov	r0, sl
c0de73fe:	4631      	mov	r1, r6
c0de7400:	f7fd bfba 	b.w	c0de5378 <nbgl_layoutAddContentCenter>

c0de7404 <OUTLINED_FUNCTION_3>:
c0de7404:	7c73      	ldrb	r3, [r6, #17]
c0de7406:	f88d 003e 	strb.w	r0, [sp, #62]	@ 0x3e
c0de740a:	7830      	ldrb	r0, [r6, #0]
c0de740c:	f88d 1034 	strb.w	r1, [sp, #52]	@ 0x34
c0de7410:	4770      	bx	lr

c0de7412 <OUTLINED_FUNCTION_4>:
c0de7412:	4630      	mov	r0, r6
c0de7414:	f003 bdb0 	b.w	c0deaf78 <__aeabi_memclr>

c0de7418 <OUTLINED_FUNCTION_5>:
c0de7418:	f895 002c 	ldrb.w	r0, [r5, #44]	@ 0x2c
c0de741c:	f88d 003c 	strb.w	r0, [sp, #60]	@ 0x3c
c0de7420:	f895 002d 	ldrb.w	r0, [r5, #45]	@ 0x2d
c0de7424:	4770      	bx	lr

c0de7426 <OUTLINED_FUNCTION_6>:
c0de7426:	f105 0110 	add.w	r1, r5, #16
c0de742a:	4650      	mov	r0, sl
c0de742c:	f7fe b93c 	b.w	c0de56a8 <nbgl_layoutAddTagValueList>

c0de7430 <getNbTagValuesInPage>:
c0de7430:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de7434:	4604      	mov	r4, r0
c0de7436:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0de7438:	f04f 0800 	mov.w	r8, #0
c0de743c:	2b00      	cmp	r3, #0
c0de743e:	460e      	mov	r6, r1
c0de7440:	f04f 0b00 	mov.w	fp, #0
c0de7444:	f880 8000 	strb.w	r8, [r0]
c0de7448:	f44f 70e8 	mov.w	r0, #464	@ 0x1d0
c0de744c:	bf18      	it	ne
c0de744e:	f44f 70cc 	movne.w	r0, #408	@ 0x198
c0de7452:	0111      	lsls	r1, r2, #4
c0de7454:	e9cd 2001 	strd	r2, r0, [sp, #4]
c0de7458:	4544      	cmp	r4, r8
c0de745a:	d052      	beq.n	c0de7502 <getNbTagValuesInPage+0xd2>
c0de745c:	465d      	mov	r5, fp
c0de745e:	f10b 0a18 	add.w	sl, fp, #24
c0de7462:	f1b8 0f00 	cmp.w	r8, #0
c0de7466:	bf18      	it	ne
c0de7468:	4655      	movne	r5, sl
c0de746a:	6830      	ldr	r0, [r6, #0]
c0de746c:	9103      	str	r1, [sp, #12]
c0de746e:	b108      	cbz	r0, c0de7474 <getNbTagValuesInPage+0x44>
c0de7470:	4408      	add	r0, r1
c0de7472:	e004      	b.n	c0de747e <getNbTagValuesInPage+0x4e>
c0de7474:	9801      	ldr	r0, [sp, #4]
c0de7476:	6871      	ldr	r1, [r6, #4]
c0de7478:	4440      	add	r0, r8
c0de747a:	b2c0      	uxtb	r0, r0
c0de747c:	4788      	blx	r1
c0de747e:	f003 fb59 	bl	c0deab34 <pic>
c0de7482:	4607      	mov	r7, r0
c0de7484:	7b00      	ldrb	r0, [r0, #12]
c0de7486:	07c1      	lsls	r1, r0, #31
c0de7488:	bf18      	it	ne
c0de748a:	f1b8 0f00 	cmpne.w	r8, #0
c0de748e:	d13b      	bne.n	c0de7508 <getNbTagValuesInPage+0xd8>
c0de7490:	0780      	lsls	r0, r0, #30
c0de7492:	d45d      	bmi.n	c0de7550 <getNbTagValuesInPage+0x120>
c0de7494:	7bb3      	ldrb	r3, [r6, #14]
c0de7496:	6839      	ldr	r1, [r7, #0]
c0de7498:	200b      	movs	r0, #11
c0de749a:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de749e:	46a2      	mov	sl, r4
c0de74a0:	f003 f980 	bl	c0dea7a4 <nbgl_getTextHeightInWidth>
c0de74a4:	182c      	adds	r4, r5, r0
c0de74a6:	7b70      	ldrb	r0, [r6, #13]
c0de74a8:	250b      	movs	r5, #11
c0de74aa:	7bb3      	ldrb	r3, [r6, #14]
c0de74ac:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de74b0:	2800      	cmp	r0, #0
c0de74b2:	bf08      	it	eq
c0de74b4:	250d      	moveq	r5, #13
c0de74b6:	6879      	ldr	r1, [r7, #4]
c0de74b8:	4628      	mov	r0, r5
c0de74ba:	f003 f973 	bl	c0dea7a4 <nbgl_getTextHeightInWidth>
c0de74be:	4420      	add	r0, r4
c0de74c0:	6879      	ldr	r1, [r7, #4]
c0de74c2:	7bb3      	ldrb	r3, [r6, #14]
c0de74c4:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de74c8:	f100 0b04 	add.w	fp, r0, #4
c0de74cc:	4628      	mov	r0, r5
c0de74ce:	fa1f f48b 	uxth.w	r4, fp
c0de74d2:	f003 f96c 	bl	c0dea7ae <nbgl_getTextNbLinesInWidth>
c0de74d6:	9902      	ldr	r1, [sp, #8]
c0de74d8:	428c      	cmp	r4, r1
c0de74da:	bf38      	it	cc
c0de74dc:	280a      	cmpcc	r0, #10
c0de74de:	d205      	bcs.n	c0de74ec <getNbTagValuesInPage+0xbc>
c0de74e0:	9903      	ldr	r1, [sp, #12]
c0de74e2:	f108 0801 	add.w	r8, r8, #1
c0de74e6:	4654      	mov	r4, sl
c0de74e8:	3110      	adds	r1, #16
c0de74ea:	e7b5      	b.n	c0de7458 <getNbTagValuesInPage+0x28>
c0de74ec:	ea5f 6008 	movs.w	r0, r8, lsl #24
c0de74f0:	d104      	bne.n	c0de74fc <getNbTagValuesInPage+0xcc>
c0de74f2:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0de74f4:	f04f 0801 	mov.w	r8, #1
c0de74f8:	f880 8000 	strb.w	r8, [r0]
c0de74fc:	4654      	mov	r4, sl
c0de74fe:	46da      	mov	sl, fp
c0de7500:	e003      	b.n	c0de750a <getNbTagValuesInPage+0xda>
c0de7502:	46da      	mov	sl, fp
c0de7504:	46a0      	mov	r8, r4
c0de7506:	e000      	b.n	c0de750a <getNbTagValuesInPage+0xda>
c0de7508:	46aa      	mov	sl, r5
c0de750a:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0de750c:	b170      	cbz	r0, c0de752c <getNbTagValuesInPage+0xfc>
c0de750e:	fa5f f088 	uxtb.w	r0, r8
c0de7512:	42a0      	cmp	r0, r4
c0de7514:	d10a      	bne.n	c0de752c <getNbTagValuesInPage+0xfc>
c0de7516:	9902      	ldr	r1, [sp, #8]
c0de7518:	fa1f f08a 	uxth.w	r0, sl
c0de751c:	f501 71bc 	add.w	r1, r1, #376	@ 0x178
c0de7520:	f401 71ac 	and.w	r1, r1, #344	@ 0x158
c0de7524:	4281      	cmp	r1, r0
c0de7526:	bf38      	it	cc
c0de7528:	3c01      	subcc	r4, #1
c0de752a:	e00d      	b.n	c0de7548 <getNbTagValuesInPage+0x118>
c0de752c:	980d      	ldr	r0, [sp, #52]	@ 0x34
c0de752e:	b150      	cbz	r0, c0de7546 <getNbTagValuesInPage+0x116>
c0de7530:	9902      	ldr	r1, [sp, #8]
c0de7532:	fa1f f08a 	uxth.w	r0, sl
c0de7536:	f501 71e0 	add.w	r1, r1, #448	@ 0x1c0
c0de753a:	f401 71ec 	and.w	r1, r1, #472	@ 0x1d8
c0de753e:	4281      	cmp	r1, r0
c0de7540:	bf38      	it	cc
c0de7542:	f1a8 0801 	subcc.w	r8, r8, #1
c0de7546:	4644      	mov	r4, r8
c0de7548:	b2e0      	uxtb	r0, r4
c0de754a:	b004      	add	sp, #16
c0de754c:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de7550:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0de7552:	f1b8 0f00 	cmp.w	r8, #0
c0de7556:	d1d9      	bne.n	c0de750c <getNbTagValuesInPage+0xdc>
c0de7558:	990e      	ldr	r1, [sp, #56]	@ 0x38
c0de755a:	f04f 0801 	mov.w	r8, #1
c0de755e:	46da      	mov	sl, fp
c0de7560:	f881 8000 	strb.w	r8, [r1]
c0de7564:	e7d2      	b.n	c0de750c <getNbTagValuesInPage+0xdc>

c0de7566 <nbgl_useCaseGetNbInfosInPage>:
c0de7566:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de756a:	f002 fc25 	bl	c0de9db8 <OUTLINED_FUNCTION_11>
c0de756e:	bf18      	it	ne
c0de7570:	f44f 7bcc 	movne.w	fp, #408	@ 0x198
c0de7574:	6848      	ldr	r0, [r1, #4]
c0de7576:	f003 fadd 	bl	c0deab34 <pic>
c0de757a:	eb00 0486 	add.w	r4, r0, r6, lsl #2
c0de757e:	2600      	movs	r6, #0
c0de7580:	2500      	movs	r5, #0
c0de7582:	2700      	movs	r7, #0
c0de7584:	45b2      	cmp	sl, r6
c0de7586:	d011      	beq.n	c0de75ac <nbgl_useCaseGetNbInfosInPage+0x46>
c0de7588:	f854 0026 	ldr.w	r0, [r4, r6, lsl #2]
c0de758c:	f003 fad2 	bl	c0deab34 <pic>
c0de7590:	4601      	mov	r1, r0
c0de7592:	200b      	movs	r0, #11
c0de7594:	f002 fbe6 	bl	c0de9d64 <OUTLINED_FUNCTION_1>
c0de7598:	f107 0168 	add.w	r1, r7, #104	@ 0x68
c0de759c:	b289      	uxth	r1, r1
c0de759e:	180f      	adds	r7, r1, r0
c0de75a0:	b2b8      	uxth	r0, r7
c0de75a2:	4558      	cmp	r0, fp
c0de75a4:	d204      	bcs.n	c0de75b0 <nbgl_useCaseGetNbInfosInPage+0x4a>
c0de75a6:	3601      	adds	r6, #1
c0de75a8:	4605      	mov	r5, r0
c0de75aa:	e7eb      	b.n	c0de7584 <nbgl_useCaseGetNbInfosInPage+0x1e>
c0de75ac:	4656      	mov	r6, sl
c0de75ae:	e006      	b.n	c0de75be <nbgl_useCaseGetNbInfosInPage+0x58>
c0de75b0:	f1b8 0f00 	cmp.w	r8, #0
c0de75b4:	d103      	bne.n	c0de75be <nbgl_useCaseGetNbInfosInPage+0x58>
c0de75b6:	08e8      	lsrs	r0, r5, #3
c0de75b8:	2832      	cmp	r0, #50	@ 0x32
c0de75ba:	bf88      	it	hi
c0de75bc:	3e01      	subhi	r6, #1
c0de75be:	b2f0      	uxtb	r0, r6
c0de75c0:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de75c4 <nbgl_useCaseGetNbSwitchesInPage>:
c0de75c4:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de75c8:	f002 fbf6 	bl	c0de9db8 <OUTLINED_FUNCTION_11>
c0de75cc:	bf18      	it	ne
c0de75ce:	f44f 7bcc 	movne.w	fp, #408	@ 0x198
c0de75d2:	6808      	ldr	r0, [r1, #0]
c0de75d4:	f003 faae 	bl	c0deab34 <pic>
c0de75d8:	eb06 0146 	add.w	r1, r6, r6, lsl #1
c0de75dc:	2600      	movs	r6, #0
c0de75de:	2500      	movs	r5, #0
c0de75e0:	eb00 0081 	add.w	r0, r0, r1, lsl #2
c0de75e4:	1d04      	adds	r4, r0, #4
c0de75e6:	462f      	mov	r7, r5
c0de75e8:	45b2      	cmp	sl, r6
c0de75ea:	d01f      	beq.n	c0de762c <nbgl_useCaseGetNbSwitchesInPage+0x68>
c0de75ec:	f854 1c04 	ldr.w	r1, [r4, #-4]
c0de75f0:	200c      	movs	r0, #12
c0de75f2:	f002 fbb7 	bl	c0de9d64 <OUTLINED_FUNCTION_1>
c0de75f6:	2828      	cmp	r0, #40	@ 0x28
c0de75f8:	d201      	bcs.n	c0de75fe <nbgl_useCaseGetNbSwitchesInPage+0x3a>
c0de75fa:	2028      	movs	r0, #40	@ 0x28
c0de75fc:	e004      	b.n	c0de7608 <nbgl_useCaseGetNbSwitchesInPage+0x44>
c0de75fe:	f854 1c04 	ldr.w	r1, [r4, #-4]
c0de7602:	200c      	movs	r0, #12
c0de7604:	f002 fbae 	bl	c0de9d64 <OUTLINED_FUNCTION_1>
c0de7608:	6821      	ldr	r1, [r4, #0]
c0de760a:	4438      	add	r0, r7
c0de760c:	f100 0534 	add.w	r5, r0, #52	@ 0x34
c0de7610:	b129      	cbz	r1, c0de761e <nbgl_useCaseGetNbSwitchesInPage+0x5a>
c0de7612:	200b      	movs	r0, #11
c0de7614:	f002 fba6 	bl	c0de9d64 <OUTLINED_FUNCTION_1>
c0de7618:	4428      	add	r0, r5
c0de761a:	f100 050c 	add.w	r5, r0, #12
c0de761e:	340c      	adds	r4, #12
c0de7620:	3601      	adds	r6, #1
c0de7622:	b2a8      	uxth	r0, r5
c0de7624:	4583      	cmp	fp, r0
c0de7626:	d8de      	bhi.n	c0de75e6 <nbgl_useCaseGetNbSwitchesInPage+0x22>
c0de7628:	f1a6 0a01 	sub.w	sl, r6, #1
c0de762c:	b2b8      	uxth	r0, r7
c0de762e:	2100      	movs	r1, #0
c0de7630:	08c0      	lsrs	r0, r0, #3
c0de7632:	2832      	cmp	r0, #50	@ 0x32
c0de7634:	bf88      	it	hi
c0de7636:	2101      	movhi	r1, #1
c0de7638:	ea21 0008 	bic.w	r0, r1, r8
c0de763c:	ebaa 0000 	sub.w	r0, sl, r0
c0de7640:	b2c0      	uxtb	r0, r0
c0de7642:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}

c0de7646 <nbgl_useCaseGetNbBarsInPage>:
c0de7646:	b570      	push	{r4, r5, r6, lr}
c0de7648:	f44f 71fc 	mov.w	r1, #504	@ 0x1f8
c0de764c:	2b00      	cmp	r3, #0
c0de764e:	bf18      	it	ne
c0de7650:	f44f 71cc 	movne.w	r1, #408	@ 0x198
c0de7654:	2200      	movs	r2, #0
c0de7656:	2400      	movs	r4, #0
c0de7658:	2500      	movs	r5, #0
c0de765a:	b2ee      	uxtb	r6, r5
c0de765c:	4286      	cmp	r6, r0
c0de765e:	d208      	bcs.n	c0de7672 <nbgl_useCaseGetNbBarsInPage+0x2c>
c0de7660:	b292      	uxth	r2, r2
c0de7662:	325c      	adds	r2, #92	@ 0x5c
c0de7664:	b296      	uxth	r6, r2
c0de7666:	428e      	cmp	r6, r1
c0de7668:	d202      	bcs.n	c0de7670 <nbgl_useCaseGetNbBarsInPage+0x2a>
c0de766a:	3501      	adds	r5, #1
c0de766c:	4634      	mov	r4, r6
c0de766e:	e7f4      	b.n	c0de765a <nbgl_useCaseGetNbBarsInPage+0x14>
c0de7670:	4628      	mov	r0, r5
c0de7672:	08e1      	lsrs	r1, r4, #3
c0de7674:	2200      	movs	r2, #0
c0de7676:	2932      	cmp	r1, #50	@ 0x32
c0de7678:	bf88      	it	hi
c0de767a:	2201      	movhi	r2, #1
c0de767c:	ea22 0103 	bic.w	r1, r2, r3
c0de7680:	1a40      	subs	r0, r0, r1
c0de7682:	b2c0      	uxtb	r0, r0
c0de7684:	bd70      	pop	{r4, r5, r6, pc}

c0de7686 <nbgl_useCaseGetNbChoicesInPage>:
c0de7686:	b570      	push	{r4, r5, r6, lr}
c0de7688:	f44f 72fc 	mov.w	r2, #504	@ 0x1f8
c0de768c:	2b00      	cmp	r3, #0
c0de768e:	bf18      	it	ne
c0de7690:	f44f 72cc 	movne.w	r2, #408	@ 0x198
c0de7694:	2400      	movs	r4, #0
c0de7696:	2500      	movs	r5, #0
c0de7698:	2100      	movs	r1, #0
c0de769a:	b2ce      	uxtb	r6, r1
c0de769c:	4286      	cmp	r6, r0
c0de769e:	d207      	bcs.n	c0de76b0 <nbgl_useCaseGetNbChoicesInPage+0x2a>
c0de76a0:	b2a4      	uxth	r4, r4
c0de76a2:	345c      	adds	r4, #92	@ 0x5c
c0de76a4:	b2a6      	uxth	r6, r4
c0de76a6:	4296      	cmp	r6, r2
c0de76a8:	d204      	bcs.n	c0de76b4 <nbgl_useCaseGetNbChoicesInPage+0x2e>
c0de76aa:	3101      	adds	r1, #1
c0de76ac:	4635      	mov	r5, r6
c0de76ae:	e7f4      	b.n	c0de769a <nbgl_useCaseGetNbChoicesInPage+0x14>
c0de76b0:	4601      	mov	r1, r0
c0de76b2:	e004      	b.n	c0de76be <nbgl_useCaseGetNbChoicesInPage+0x38>
c0de76b4:	b91b      	cbnz	r3, c0de76be <nbgl_useCaseGetNbChoicesInPage+0x38>
c0de76b6:	08e8      	lsrs	r0, r5, #3
c0de76b8:	2832      	cmp	r0, #50	@ 0x32
c0de76ba:	bf88      	it	hi
c0de76bc:	3901      	subhi	r1, #1
c0de76be:	b2c8      	uxtb	r0, r1
c0de76c0:	bd70      	pop	{r4, r5, r6, pc}
	...

c0de76c4 <useCaseHomeExt>:
c0de76c4:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de76c8:	b08f      	sub	sp, #60	@ 0x3c
c0de76ca:	4604      	mov	r4, r0
c0de76cc:	a802      	add	r0, sp, #8
c0de76ce:	460f      	mov	r7, r1
c0de76d0:	2130      	movs	r1, #48	@ 0x30
c0de76d2:	461e      	mov	r6, r3
c0de76d4:	4615      	mov	r5, r2
c0de76d6:	3004      	adds	r0, #4
c0de76d8:	f003 fc4e 	bl	c0deaf78 <__aeabi_memclr>
c0de76dc:	2009      	movs	r0, #9
c0de76de:	f88d 0039 	strb.w	r0, [sp, #57]	@ 0x39
c0de76e2:	2006      	movs	r0, #6
c0de76e4:	f88d 001e 	strb.w	r0, [sp, #30]
c0de76e8:	2004      	movs	r0, #4
c0de76ea:	f88d 001d 	strb.w	r0, [sp, #29]
c0de76ee:	2003      	movs	r0, #3
c0de76f0:	2e00      	cmp	r6, #0
c0de76f2:	bf18      	it	ne
c0de76f4:	2001      	movne	r0, #1
c0de76f6:	f88d 001c 	strb.w	r0, [sp, #28]
c0de76fa:	9705      	str	r7, [sp, #20]
c0de76fc:	9402      	str	r4, [sp, #8]
c0de76fe:	f000 f87b 	bl	c0de77f8 <reset_callbacks_and_context>
c0de7702:	9816      	ldr	r0, [sp, #88]	@ 0x58
c0de7704:	e9d0 1200 	ldrd	r1, r2, [r0]
c0de7708:	b951      	cbnz	r1, c0de7720 <useCaseHomeExt+0x5c>
c0de770a:	b94a      	cbnz	r2, c0de7720 <useCaseHomeExt+0x5c>
c0de770c:	4831      	ldr	r0, [pc, #196]	@ (c0de77d4 <useCaseHomeExt+0x110>)
c0de770e:	2100      	movs	r1, #0
c0de7710:	e9cd 110c 	strd	r1, r1, [sp, #48]	@ 0x30
c0de7714:	4448      	add	r0, r9
c0de7716:	6241      	str	r1, [r0, #36]	@ 0x24
c0de7718:	2002      	movs	r0, #2
c0de771a:	f88d 001f 	strb.w	r0, [sp, #31]
c0de771e:	e00e      	b.n	c0de773e <useCaseHomeExt+0x7a>
c0de7720:	4b2c      	ldr	r3, [pc, #176]	@ (c0de77d4 <useCaseHomeExt+0x110>)
c0de7722:	6886      	ldr	r6, [r0, #8]
c0de7724:	e9cd 120c 	strd	r1, r2, [sp, #48]	@ 0x30
c0de7728:	444b      	add	r3, r9
c0de772a:	625e      	str	r6, [r3, #36]	@ 0x24
c0de772c:	2308      	movs	r3, #8
c0de772e:	7b00      	ldrb	r0, [r0, #12]
c0de7730:	f88d 301f 	strb.w	r3, [sp, #31]
c0de7734:	2800      	cmp	r0, #0
c0de7736:	bf18      	it	ne
c0de7738:	2001      	movne	r0, #1
c0de773a:	f88d 0038 	strb.w	r0, [sp, #56]	@ 0x38
c0de773e:	e9dd a817 	ldrd	sl, r8, [sp, #92]	@ 0x5c
c0de7742:	bb8d      	cbnz	r5, c0de77a8 <useCaseHomeExt+0xe4>
c0de7744:	4620      	mov	r0, r4
c0de7746:	f003 fc73 	bl	c0deb030 <strlen>
c0de774a:	4e24      	ldr	r6, [pc, #144]	@ (c0de77dc <useCaseHomeExt+0x118>)
c0de774c:	2814      	cmp	r0, #20
c0de774e:	447e      	add	r6, pc
c0de7750:	d307      	bcc.n	c0de7762 <useCaseHomeExt+0x9e>
c0de7752:	4821      	ldr	r0, [pc, #132]	@ (c0de77d8 <useCaseHomeExt+0x114>)
c0de7754:	4922      	ldr	r1, [pc, #136]	@ (c0de77e0 <useCaseHomeExt+0x11c>)
c0de7756:	2236      	movs	r2, #54	@ 0x36
c0de7758:	4448      	add	r0, r9
c0de775a:	4479      	add	r1, pc
c0de775c:	f003 fc02 	bl	c0deaf64 <__aeabi_memcpy>
c0de7760:	e00a      	b.n	c0de7778 <useCaseHomeExt+0xb4>
c0de7762:	e9cd 4600 	strd	r4, r6, [sp]
c0de7766:	481c      	ldr	r0, [pc, #112]	@ (c0de77d8 <useCaseHomeExt+0x114>)
c0de7768:	214a      	movs	r1, #74	@ 0x4a
c0de776a:	4a1e      	ldr	r2, [pc, #120]	@ (c0de77e4 <useCaseHomeExt+0x120>)
c0de776c:	4b1e      	ldr	r3, [pc, #120]	@ (c0de77e8 <useCaseHomeExt+0x124>)
c0de776e:	4448      	add	r0, r9
c0de7770:	447a      	add	r2, pc
c0de7772:	447b      	add	r3, pc
c0de7774:	f003 f84c 	bl	c0dea810 <snprintf>
c0de7778:	4f17      	ldr	r7, [pc, #92]	@ (c0de77d8 <useCaseHomeExt+0x114>)
c0de777a:	200b      	movs	r0, #11
c0de777c:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de7780:	2300      	movs	r3, #0
c0de7782:	eb09 0507 	add.w	r5, r9, r7
c0de7786:	4629      	mov	r1, r5
c0de7788:	f003 f811 	bl	c0dea7ae <nbgl_getTextNbLinesInWidth>
c0de778c:	2804      	cmp	r0, #4
c0de778e:	d30b      	bcc.n	c0de77a8 <useCaseHomeExt+0xe4>
c0de7790:	e9cd 4600 	strd	r4, r6, [sp]
c0de7794:	eb09 0507 	add.w	r5, r9, r7
c0de7798:	214a      	movs	r1, #74	@ 0x4a
c0de779a:	4a14      	ldr	r2, [pc, #80]	@ (c0de77ec <useCaseHomeExt+0x128>)
c0de779c:	4b14      	ldr	r3, [pc, #80]	@ (c0de77f0 <useCaseHomeExt+0x12c>)
c0de779e:	4628      	mov	r0, r5
c0de77a0:	447a      	add	r2, pc
c0de77a2:	447b      	add	r3, pc
c0de77a4:	f003 f834 	bl	c0dea810 <snprintf>
c0de77a8:	480a      	ldr	r0, [pc, #40]	@ (c0de77d4 <useCaseHomeExt+0x110>)
c0de77aa:	9503      	str	r5, [sp, #12]
c0de77ac:	2100      	movs	r1, #0
c0de77ae:	eb09 0400 	add.w	r4, r9, r0
c0de77b2:	f8c4 a028 	str.w	sl, [r4, #40]	@ 0x28
c0de77b6:	f8c4 8004 	str.w	r8, [r4, #4]
c0de77ba:	480e      	ldr	r0, [pc, #56]	@ (c0de77f4 <useCaseHomeExt+0x130>)
c0de77bc:	aa02      	add	r2, sp, #8
c0de77be:	4478      	add	r0, pc
c0de77c0:	f7ff faa0 	bl	c0de6d04 <nbgl_pageDrawInfo>
c0de77c4:	6160      	str	r0, [r4, #20]
c0de77c6:	2002      	movs	r0, #2
c0de77c8:	f002 ff9c 	bl	c0dea704 <nbgl_refreshSpecial>
c0de77cc:	b00f      	add	sp, #60	@ 0x3c
c0de77ce:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}
c0de77d2:	bf00      	nop
c0de77d4:	00001c34 	.word	0x00001c34
c0de77d8:	00001ab4 	.word	0x00001ab4
c0de77dc:	0000552b 	.word	0x0000552b
c0de77e0:	00006c76 	.word	0x00006c76
c0de77e4:	00005042 	.word	0x00005042
c0de77e8:	000056f4 	.word	0x000056f4
c0de77ec:	000050ac 	.word	0x000050ac
c0de77f0:	000056c4 	.word	0x000056c4
c0de77f4:	000008ef 	.word	0x000008ef

c0de77f8 <reset_callbacks_and_context>:
c0de77f8:	b580      	push	{r7, lr}
c0de77fa:	4808      	ldr	r0, [pc, #32]	@ (c0de781c <reset_callbacks_and_context+0x24>)
c0de77fc:	2100      	movs	r1, #0
c0de77fe:	4448      	add	r0, r9
c0de7800:	e9c0 1109 	strd	r1, r1, [r0, #36]	@ 0x24
c0de7804:	62c1      	str	r1, [r0, #44]	@ 0x2c
c0de7806:	e9c0 1101 	strd	r1, r1, [r0, #4]
c0de780a:	60c1      	str	r1, [r0, #12]
c0de780c:	6181      	str	r1, [r0, #24]
c0de780e:	4804      	ldr	r0, [pc, #16]	@ (c0de7820 <reset_callbacks_and_context+0x28>)
c0de7810:	2190      	movs	r1, #144	@ 0x90
c0de7812:	4448      	add	r0, r9
c0de7814:	f003 fbb0 	bl	c0deaf78 <__aeabi_memclr>
c0de7818:	bd80      	pop	{r7, pc}
c0de781a:	bf00      	nop
c0de781c:	00001c34 	.word	0x00001c34
c0de7820:	0000197c 	.word	0x0000197c

c0de7824 <prepareNavInfo>:
c0de7824:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de7828:	4f1b      	ldr	r7, [pc, #108]	@ (c0de7898 <prepareNavInfo+0x74>)
c0de782a:	460c      	mov	r4, r1
c0de782c:	4606      	mov	r6, r0
c0de782e:	211c      	movs	r1, #28
c0de7830:	4690      	mov	r8, r2
c0de7832:	eb09 0507 	add.w	r5, r9, r7
c0de7836:	f105 0060 	add.w	r0, r5, #96	@ 0x60
c0de783a:	f003 fb9d 	bl	c0deaf78 <__aeabi_memclr>
c0de783e:	2009      	movs	r0, #9
c0de7840:	f885 4061 	strb.w	r4, [r5, #97]	@ 0x61
c0de7844:	f885 0065 	strb.w	r0, [r5, #101]	@ 0x65
c0de7848:	2001      	movs	r0, #1
c0de784a:	f885 0063 	strb.w	r0, [r5, #99]	@ 0x63
c0de784e:	b1ce      	cbz	r6, c0de7884 <prepareNavInfo+0x60>
c0de7850:	eb09 0007 	add.w	r0, r9, r7
c0de7854:	210c      	movs	r1, #12
c0de7856:	f880 1062 	strb.w	r1, [r0, #98]	@ 0x62
c0de785a:	2103      	movs	r1, #3
c0de785c:	f8c0 8074 	str.w	r8, [r0, #116]	@ 0x74
c0de7860:	f880 1073 	strb.w	r1, [r0, #115]	@ 0x73
c0de7864:	f819 1007 	ldrb.w	r1, [r9, r7]
c0de7868:	3903      	subs	r1, #3
c0de786a:	bf18      	it	ne
c0de786c:	2101      	movne	r1, #1
c0de786e:	2200      	movs	r2, #0
c0de7870:	f880 1072 	strb.w	r1, [r0, #114]	@ 0x72
c0de7874:	2c01      	cmp	r4, #1
c0de7876:	bf88      	it	hi
c0de7878:	2201      	movhi	r2, #1
c0de787a:	4311      	orrs	r1, r2
c0de787c:	f880 1071 	strb.w	r1, [r0, #113]	@ 0x71
c0de7880:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de7884:	eb09 0107 	add.w	r1, r9, r7
c0de7888:	f881 0071 	strb.w	r0, [r1, #113]	@ 0x71
c0de788c:	2003      	movs	r0, #3
c0de788e:	f881 0073 	strb.w	r0, [r1, #115]	@ 0x73
c0de7892:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de7896:	bf00      	nop
c0de7898:	00001c34 	.word	0x00001c34

c0de789c <displaySettingsPage>:
c0de789c:	b570      	push	{r4, r5, r6, lr}
c0de789e:	b090      	sub	sp, #64	@ 0x40
c0de78a0:	460c      	mov	r4, r1
c0de78a2:	4605      	mov	r5, r0
c0de78a4:	4668      	mov	r0, sp
c0de78a6:	2140      	movs	r1, #64	@ 0x40
c0de78a8:	f003 fb66 	bl	c0deaf78 <__aeabi_memclr>
c0de78ac:	4e12      	ldr	r6, [pc, #72]	@ (c0de78f8 <displaySettingsPage+0x5c>)
c0de78ae:	eb09 0006 	add.w	r0, r9, r6
c0de78b2:	6882      	ldr	r2, [r0, #8]
c0de78b4:	b1f2      	cbz	r2, c0de78f4 <displaySettingsPage+0x58>
c0de78b6:	4669      	mov	r1, sp
c0de78b8:	4628      	mov	r0, r5
c0de78ba:	4790      	blx	r2
c0de78bc:	b1d0      	cbz	r0, c0de78f4 <displaySettingsPage+0x58>
c0de78be:	444e      	add	r6, r9
c0de78c0:	2009      	movs	r0, #9
c0de78c2:	466a      	mov	r2, sp
c0de78c4:	f88d 0006 	strb.w	r0, [sp, #6]
c0de78c8:	f240 2001 	movw	r0, #513	@ 0x201
c0de78cc:	f806 5f60 	strb.w	r5, [r6, #96]!
c0de78d0:	f8ad 0004 	strh.w	r0, [sp, #4]
c0de78d4:	f856 0c50 	ldr.w	r0, [r6, #-80]
c0de78d8:	4631      	mov	r1, r6
c0de78da:	9000      	str	r0, [sp, #0]
c0de78dc:	4807      	ldr	r0, [pc, #28]	@ (c0de78fc <displaySettingsPage+0x60>)
c0de78de:	4478      	add	r0, pc
c0de78e0:	f7ff fd78 	bl	c0de73d4 <nbgl_pageDrawGenericContent>
c0de78e4:	f846 0c4c 	str.w	r0, [r6, #-76]
c0de78e8:	2001      	movs	r0, #1
c0de78ea:	2c00      	cmp	r4, #0
c0de78ec:	bf18      	it	ne
c0de78ee:	2002      	movne	r0, #2
c0de78f0:	f002 ff08 	bl	c0dea704 <nbgl_refreshSpecial>
c0de78f4:	b010      	add	sp, #64	@ 0x40
c0de78f6:	bd70      	pop	{r4, r5, r6, pc}
c0de78f8:	00001c34 	.word	0x00001c34
c0de78fc:	000007cf 	.word	0x000007cf

c0de7900 <nbgl_useCaseGenericSettings>:
c0de7900:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de7904:	461d      	mov	r5, r3
c0de7906:	4616      	mov	r6, r2
c0de7908:	4688      	mov	r8, r1
c0de790a:	4607      	mov	r7, r0
c0de790c:	f7ff ff74 	bl	c0de77f8 <reset_callbacks_and_context>
c0de7910:	4c25      	ldr	r4, [pc, #148]	@ (c0de79a8 <nbgl_useCaseGenericSettings+0xa8>)
c0de7912:	2002      	movs	r0, #2
c0de7914:	f809 0004 	strb.w	r0, [r9, r4]
c0de7918:	eb09 0004 	add.w	r0, r9, r4
c0de791c:	6107      	str	r7, [r0, #16]
c0de791e:	9906      	ldr	r1, [sp, #24]
c0de7920:	6041      	str	r1, [r0, #4]
c0de7922:	b12e      	cbz	r6, c0de7930 <nbgl_useCaseGenericSettings+0x30>
c0de7924:	4821      	ldr	r0, [pc, #132]	@ (c0de79ac <nbgl_useCaseGenericSettings+0xac>)
c0de7926:	e896 000e 	ldmia.w	r6, {r1, r2, r3}
c0de792a:	4448      	add	r0, r9
c0de792c:	3004      	adds	r0, #4
c0de792e:	c00e      	stmia	r0!, {r1, r2, r3}
c0de7930:	b1a5      	cbz	r5, c0de795c <nbgl_useCaseGenericSettings+0x5c>
c0de7932:	481e      	ldr	r0, [pc, #120]	@ (c0de79ac <nbgl_useCaseGenericSettings+0xac>)
c0de7934:	2101      	movs	r1, #1
c0de7936:	4448      	add	r0, r9
c0de7938:	7501      	strb	r1, [r0, #20]
c0de793a:	481d      	ldr	r0, [pc, #116]	@ (c0de79b0 <nbgl_useCaseGenericSettings+0xb0>)
c0de793c:	2138      	movs	r1, #56	@ 0x38
c0de793e:	eb09 0600 	add.w	r6, r9, r0
c0de7942:	f106 0038 	add.w	r0, r6, #56	@ 0x38
c0de7946:	f003 fb17 	bl	c0deaf78 <__aeabi_memclr>
c0de794a:	2008      	movs	r0, #8
c0de794c:	4629      	mov	r1, r5
c0de794e:	2230      	movs	r2, #48	@ 0x30
c0de7950:	f886 0038 	strb.w	r0, [r6, #56]	@ 0x38
c0de7954:	f106 003c 	add.w	r0, r6, #60	@ 0x3c
c0de7958:	f003 fb04 	bl	c0deaf64 <__aeabi_memcpy>
c0de795c:	f002 fa10 	bl	c0de9d80 <OUTLINED_FUNCTION_4>
c0de7960:	4606      	mov	r6, r0
c0de7962:	b145      	cbz	r5, c0de7976 <nbgl_useCaseGenericSettings+0x76>
c0de7964:	4812      	ldr	r0, [pc, #72]	@ (c0de79b0 <nbgl_useCaseGenericSettings+0xb0>)
c0de7966:	4631      	mov	r1, r6
c0de7968:	2201      	movs	r2, #1
c0de796a:	2300      	movs	r3, #0
c0de796c:	4448      	add	r0, r9
c0de796e:	3038      	adds	r0, #56	@ 0x38
c0de7970:	f000 f848 	bl	c0de7a04 <getNbPagesForContent>
c0de7974:	4406      	add	r6, r0
c0de7976:	444c      	add	r4, r9
c0de7978:	211c      	movs	r1, #28
c0de797a:	f104 0060 	add.w	r0, r4, #96	@ 0x60
c0de797e:	f003 fafb 	bl	c0deaf78 <__aeabi_memclr>
c0de7982:	2009      	movs	r0, #9
c0de7984:	f884 6061 	strb.w	r6, [r4, #97]	@ 0x61
c0de7988:	2101      	movs	r1, #1
c0de798a:	f884 0065 	strb.w	r0, [r4, #101]	@ 0x65
c0de798e:	2003      	movs	r0, #3
c0de7990:	f884 0073 	strb.w	r0, [r4, #115]	@ 0x73
c0de7994:	2001      	movs	r0, #1
c0de7996:	f884 0063 	strb.w	r0, [r4, #99]	@ 0x63
c0de799a:	f884 0071 	strb.w	r0, [r4, #113]	@ 0x71
c0de799e:	4640      	mov	r0, r8
c0de79a0:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de79a4:	f000 b8c0 	b.w	c0de7b28 <displayGenericContextPage>
c0de79a8:	00001c34 	.word	0x00001c34
c0de79ac:	0000197c 	.word	0x0000197c
c0de79b0:	00001a0c 	.word	0x00001a0c

c0de79b4 <getNbPagesForGenericContents>:
c0de79b4:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de79b8:	b08e      	sub	sp, #56	@ 0x38
c0de79ba:	4f11      	ldr	r7, [pc, #68]	@ (c0de7a00 <getNbPagesForGenericContents+0x4c>)
c0de79bc:	4604      	mov	r4, r0
c0de79be:	2600      	movs	r6, #0
c0de79c0:	46e8      	mov	r8, sp
c0de79c2:	2500      	movs	r5, #0
c0de79c4:	eb09 0007 	add.w	r0, r9, r7
c0de79c8:	7b00      	ldrb	r0, [r0, #12]
c0de79ca:	4285      	cmp	r5, r0
c0de79cc:	d214      	bcs.n	c0de79f8 <getNbPagesForGenericContents+0x44>
c0de79ce:	b268      	sxtb	r0, r5
c0de79d0:	4641      	mov	r1, r8
c0de79d2:	f001 fb6d 	bl	c0de90b0 <getContentAtIdx>
c0de79d6:	b170      	cbz	r0, c0de79f6 <getNbPagesForGenericContents+0x42>
c0de79d8:	eb09 0107 	add.w	r1, r9, r7
c0de79dc:	4623      	mov	r3, r4
c0de79de:	7b09      	ldrb	r1, [r1, #12]
c0de79e0:	1a69      	subs	r1, r5, r1
c0de79e2:	3101      	adds	r1, #1
c0de79e4:	fab1 f181 	clz	r1, r1
c0de79e8:	094a      	lsrs	r2, r1, #5
c0de79ea:	b2f1      	uxtb	r1, r6
c0de79ec:	f000 f80a 	bl	c0de7a04 <getNbPagesForContent>
c0de79f0:	4406      	add	r6, r0
c0de79f2:	3501      	adds	r5, #1
c0de79f4:	e7e6      	b.n	c0de79c4 <getNbPagesForGenericContents+0x10>
c0de79f6:	2600      	movs	r6, #0
c0de79f8:	b2f0      	uxtb	r0, r6
c0de79fa:	b00e      	add	sp, #56	@ 0x38
c0de79fc:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de7a00:	0000197c 	.word	0x0000197c

c0de7a04 <getNbPagesForContent>:
c0de7a04:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de7a08:	b08c      	sub	sp, #48	@ 0x30
c0de7a0a:	4606      	mov	r6, r0
c0de7a0c:	fab1 f081 	clz	r0, r1
c0de7a10:	9306      	str	r3, [sp, #24]
c0de7a12:	4614      	mov	r4, r2
c0de7a14:	9109      	str	r1, [sp, #36]	@ 0x24
c0de7a16:	0940      	lsrs	r0, r0, #5
c0de7a18:	4010      	ands	r0, r2
c0de7a1a:	900a      	str	r0, [sp, #40]	@ 0x28
c0de7a1c:	4630      	mov	r0, r6
c0de7a1e:	f001 fb71 	bl	c0de9104 <getContentNbElement>
c0de7a22:	4605      	mov	r5, r0
c0de7a24:	f084 0001 	eor.w	r0, r4, #1
c0de7a28:	f04f 0800 	mov.w	r8, #0
c0de7a2c:	f04f 0a00 	mov.w	sl, #0
c0de7a30:	f04f 0b00 	mov.w	fp, #0
c0de7a34:	270f      	movs	r7, #15
c0de7a36:	9405      	str	r4, [sp, #20]
c0de7a38:	9608      	str	r6, [sp, #32]
c0de7a3a:	9004      	str	r0, [sp, #16]
c0de7a3c:	1d30      	adds	r0, r6, #4
c0de7a3e:	9007      	str	r0, [sp, #28]
c0de7a40:	0628      	lsls	r0, r5, #24
c0de7a42:	d068      	beq.n	c0de7b16 <getNbPagesForContent+0x112>
c0de7a44:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de7a46:	f88d 802f 	strb.w	r8, [sp, #47]	@ 0x2f
c0de7a4a:	b128      	cbz	r0, c0de7a58 <getNbPagesForContent+0x54>
c0de7a4c:	fa5f f38b 	uxtb.w	r3, fp
c0de7a50:	2b00      	cmp	r3, #0
c0de7a52:	bf18      	it	ne
c0de7a54:	2301      	movne	r3, #1
c0de7a56:	e000      	b.n	c0de7a5a <getNbPagesForContent+0x56>
c0de7a58:	2301      	movs	r3, #1
c0de7a5a:	9808      	ldr	r0, [sp, #32]
c0de7a5c:	7800      	ldrb	r0, [r0, #0]
c0de7a5e:	280a      	cmp	r0, #10
c0de7a60:	d00e      	beq.n	c0de7a80 <getNbPagesForContent+0x7c>
c0de7a62:	2806      	cmp	r0, #6
c0de7a64:	d011      	beq.n	c0de7a8a <getNbPagesForContent+0x86>
c0de7a66:	2807      	cmp	r0, #7
c0de7a68:	d01e      	beq.n	c0de7aa8 <getNbPagesForContent+0xa4>
c0de7a6a:	2808      	cmp	r0, #8
c0de7a6c:	d023      	beq.n	c0de7ab6 <getNbPagesForContent+0xb2>
c0de7a6e:	2809      	cmp	r0, #9
c0de7a70:	d028      	beq.n	c0de7ac4 <getNbPagesForContent+0xc0>
c0de7a72:	2804      	cmp	r0, #4
c0de7a74:	d12b      	bne.n	c0de7ace <getNbPagesForContent+0xca>
c0de7a76:	2000      	movs	r0, #0
c0de7a78:	f04f 0800 	mov.w	r8, #0
c0de7a7c:	9000      	str	r0, [sp, #0]
c0de7a7e:	e007      	b.n	c0de7a90 <getNbPagesForContent+0x8c>
c0de7a80:	b2e8      	uxtb	r0, r5
c0de7a82:	2200      	movs	r2, #0
c0de7a84:	f7ff fddf 	bl	c0de7646 <nbgl_useCaseGetNbBarsInPage>
c0de7a88:	e028      	b.n	c0de7adc <getNbPagesForContent+0xd8>
c0de7a8a:	9805      	ldr	r0, [sp, #20]
c0de7a8c:	9000      	str	r0, [sp, #0]
c0de7a8e:	9804      	ldr	r0, [sp, #16]
c0de7a90:	9001      	str	r0, [sp, #4]
c0de7a92:	f10d 002f 	add.w	r0, sp, #47	@ 0x2f
c0de7a96:	e9dd 3106 	ldrd	r3, r1, [sp, #24]
c0de7a9a:	fa5f f28b 	uxtb.w	r2, fp
c0de7a9e:	9002      	str	r0, [sp, #8]
c0de7aa0:	b2e8      	uxtb	r0, r5
c0de7aa2:	f7ff fcc5 	bl	c0de7430 <getNbTagValuesInPage>
c0de7aa6:	e019      	b.n	c0de7adc <getNbPagesForContent+0xd8>
c0de7aa8:	9907      	ldr	r1, [sp, #28]
c0de7aaa:	b2e8      	uxtb	r0, r5
c0de7aac:	fa5f f28b 	uxtb.w	r2, fp
c0de7ab0:	f7ff fd88 	bl	c0de75c4 <nbgl_useCaseGetNbSwitchesInPage>
c0de7ab4:	e012      	b.n	c0de7adc <getNbPagesForContent+0xd8>
c0de7ab6:	9907      	ldr	r1, [sp, #28]
c0de7ab8:	b2e8      	uxtb	r0, r5
c0de7aba:	fa5f f28b 	uxtb.w	r2, fp
c0de7abe:	f7ff fd52 	bl	c0de7566 <nbgl_useCaseGetNbInfosInPage>
c0de7ac2:	e00b      	b.n	c0de7adc <getNbPagesForContent+0xd8>
c0de7ac4:	b2e8      	uxtb	r0, r5
c0de7ac6:	2200      	movs	r2, #0
c0de7ac8:	f7ff fddd 	bl	c0de7686 <nbgl_useCaseGetNbChoicesInPage>
c0de7acc:	e006      	b.n	c0de7adc <getNbPagesForContent+0xd8>
c0de7ace:	4915      	ldr	r1, [pc, #84]	@ (c0de7b24 <getNbPagesForContent+0x120>)
c0de7ad0:	4479      	add	r1, pc
c0de7ad2:	5c08      	ldrb	r0, [r1, r0]
c0de7ad4:	b2e9      	uxtb	r1, r5
c0de7ad6:	4288      	cmp	r0, r1
c0de7ad8:	bf28      	it	cs
c0de7ada:	4628      	movcs	r0, r5
c0de7adc:	9909      	ldr	r1, [sp, #36]	@ 0x24
c0de7ade:	f89d 402f 	ldrb.w	r4, [sp, #47]	@ 0x2f
c0de7ae2:	f000 0307 	and.w	r3, r0, #7
c0de7ae6:	2204      	movs	r2, #4
c0de7ae8:	1a2d      	subs	r5, r5, r0
c0de7aea:	4483      	add	fp, r0
c0de7aec:	4451      	add	r1, sl
c0de7aee:	ea43 03c4 	orr.w	r3, r3, r4, lsl #3
c0de7af2:	4c0b      	ldr	r4, [pc, #44]	@ (c0de7b20 <getNbPagesForContent+0x11c>)
c0de7af4:	f10a 0a01 	add.w	sl, sl, #1
c0de7af8:	b2c9      	uxtb	r1, r1
c0de7afa:	b2db      	uxtb	r3, r3
c0de7afc:	ea02 0281 	and.w	r2, r2, r1, lsl #2
c0de7b00:	444c      	add	r4, r9
c0de7b02:	0849      	lsrs	r1, r1, #1
c0de7b04:	5c66      	ldrb	r6, [r4, r1]
c0de7b06:	4093      	lsls	r3, r2
c0de7b08:	fa07 f202 	lsl.w	r2, r7, r2
c0de7b0c:	ea26 0202 	bic.w	r2, r6, r2
c0de7b10:	431a      	orrs	r2, r3
c0de7b12:	5462      	strb	r2, [r4, r1]
c0de7b14:	e794      	b.n	c0de7a40 <getNbPagesForContent+0x3c>
c0de7b16:	fa5f f08a 	uxtb.w	r0, sl
c0de7b1a:	b00c      	add	sp, #48	@ 0x30
c0de7b1c:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de7b20:	00001b34 	.word	0x00001b34
c0de7b24:	00006936 	.word	0x00006936

c0de7b28 <displayGenericContextPage>:
c0de7b28:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de7b2c:	b0a0      	sub	sp, #128	@ 0x80
c0de7b2e:	f8df 33e4 	ldr.w	r3, [pc, #996]	@ c0de7f14 <displayGenericContextPage+0x3ec>
c0de7b32:	4683      	mov	fp, r0
c0de7b34:	f819 0003 	ldrb.w	r0, [r9, r3]
c0de7b38:	2803      	cmp	r0, #3
c0de7b3a:	d110      	bne.n	c0de7b5e <displayGenericContextPage+0x36>
c0de7b3c:	f8df 03d8 	ldr.w	r0, [pc, #984]	@ c0de7f18 <displayGenericContextPage+0x3f0>
c0de7b40:	f1bb 0fff 	cmp.w	fp, #255	@ 0xff
c0de7b44:	d060      	beq.n	c0de7c08 <displayGenericContextPage+0xe0>
c0de7b46:	eb09 0200 	add.w	r2, r9, r0
c0de7b4a:	7c12      	ldrb	r2, [r2, #16]
c0de7b4c:	455a      	cmp	r2, fp
c0de7b4e:	d80f      	bhi.n	c0de7b70 <displayGenericContextPage+0x48>
c0de7b50:	4448      	add	r0, r9
c0de7b52:	6841      	ldr	r1, [r0, #4]
c0de7b54:	2001      	movs	r0, #1
c0de7b56:	b020      	add	sp, #128	@ 0x80
c0de7b58:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de7b5c:	4708      	bx	r1
c0de7b5e:	f1bb 0fff 	cmp.w	fp, #255	@ 0xff
c0de7b62:	d105      	bne.n	c0de7b70 <displayGenericContextPage+0x48>
c0de7b64:	eb09 0003 	add.w	r0, r9, r3
c0de7b68:	f890 0061 	ldrb.w	r0, [r0, #97]	@ 0x61
c0de7b6c:	f1a0 0b01 	sub.w	fp, r0, #1
c0de7b70:	eb09 0003 	add.w	r0, r9, r3
c0de7b74:	fa5f f78b 	uxtb.w	r7, fp
c0de7b78:	9100      	str	r1, [sp, #0]
c0de7b7a:	f890 8060 	ldrb.w	r8, [r0, #96]	@ 0x60
c0de7b7e:	4547      	cmp	r7, r8
c0de7b80:	d12d      	bne.n	c0de7bde <displayGenericContextPage+0xb6>
c0de7b82:	a912      	add	r1, sp, #72	@ 0x48
c0de7b84:	f10d 0247 	add.w	r2, sp, #71	@ 0x47
c0de7b88:	f10d 0346 	add.w	r3, sp, #70	@ 0x46
c0de7b8c:	4638      	mov	r0, r7
c0de7b8e:	f001 fad1 	bl	c0de9134 <genericContextComputeNextPageParams>
c0de7b92:	4682      	mov	sl, r0
c0de7b94:	f1ba 0f00 	cmp.w	sl, #0
c0de7b98:	f000 81b8 	beq.w	c0de7f0c <displayGenericContextPage+0x3e4>
c0de7b9c:	f8df 8374 	ldr.w	r8, [pc, #884]	@ c0de7f14 <displayGenericContextPage+0x3ec>
c0de7ba0:	f819 0008 	ldrb.w	r0, [r9, r8]
c0de7ba4:	2803      	cmp	r0, #3
c0de7ba6:	d041      	beq.n	c0de7c2c <displayGenericContextPage+0x104>
c0de7ba8:	48db      	ldr	r0, [pc, #876]	@ (c0de7f18 <displayGenericContextPage+0x3f0>)
c0de7baa:	f819 0000 	ldrb.w	r0, [r9, r0]
c0de7bae:	06c0      	lsls	r0, r0, #27
c0de7bb0:	d53c      	bpl.n	c0de7c2c <displayGenericContextPage+0x104>
c0de7bb2:	ea5f 600b 	movs.w	r0, fp, lsl #24
c0de7bb6:	d035      	beq.n	c0de7c24 <displayGenericContextPage+0xfc>
c0de7bb8:	eb09 0008 	add.w	r0, r9, r8
c0de7bbc:	f890 0061 	ldrb.w	r0, [r0, #97]	@ 0x61
c0de7bc0:	3801      	subs	r0, #1
c0de7bc2:	42b8      	cmp	r0, r7
c0de7bc4:	dd2e      	ble.n	c0de7c24 <displayGenericContextPage+0xfc>
c0de7bc6:	eb09 0008 	add.w	r0, r9, r8
c0de7bca:	2105      	movs	r1, #5
c0de7bcc:	f880 106c 	strb.w	r1, [r0, #108]	@ 0x6c
c0de7bd0:	49d3      	ldr	r1, [pc, #844]	@ (c0de7f20 <displayGenericContextPage+0x3f8>)
c0de7bd2:	4479      	add	r1, pc
c0de7bd4:	6681      	str	r1, [r0, #104]	@ 0x68
c0de7bd6:	2100      	movs	r1, #0
c0de7bd8:	f880 1064 	strb.w	r1, [r0, #100]	@ 0x64
c0de7bdc:	e026      	b.n	c0de7c2c <displayGenericContextPage+0x104>
c0de7bde:	d91c      	bls.n	c0de7c1a <displayGenericContextPage+0xf2>
c0de7be0:	f04f 0a00 	mov.w	sl, #0
c0de7be4:	ac12      	add	r4, sp, #72	@ 0x48
c0de7be6:	f10d 0547 	add.w	r5, sp, #71	@ 0x47
c0de7bea:	f10d 0646 	add.w	r6, sp, #70	@ 0x46
c0de7bee:	4547      	cmp	r7, r8
c0de7bf0:	d0d0      	beq.n	c0de7b94 <displayGenericContextPage+0x6c>
c0de7bf2:	f108 0801 	add.w	r8, r8, #1
c0de7bf6:	4621      	mov	r1, r4
c0de7bf8:	462a      	mov	r2, r5
c0de7bfa:	4633      	mov	r3, r6
c0de7bfc:	fa5f f088 	uxtb.w	r0, r8
c0de7c00:	f001 fa98 	bl	c0de9134 <genericContextComputeNextPageParams>
c0de7c04:	4682      	mov	sl, r0
c0de7c06:	e7f2      	b.n	c0de7bee <displayGenericContextPage+0xc6>
c0de7c08:	4448      	add	r0, r9
c0de7c0a:	6880      	ldr	r0, [r0, #8]
c0de7c0c:	2800      	cmp	r0, #0
c0de7c0e:	f000 817d 	beq.w	c0de7f0c <displayGenericContextPage+0x3e4>
c0de7c12:	b020      	add	sp, #128	@ 0x80
c0de7c14:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de7c18:	4700      	bx	r0
c0de7c1a:	eba7 0008 	sub.w	r0, r7, r8
c0de7c1e:	2801      	cmp	r0, #1
c0de7c20:	ddaf      	ble.n	c0de7b82 <displayGenericContextPage+0x5a>
c0de7c22:	e173      	b.n	c0de7f0c <displayGenericContextPage+0x3e4>
c0de7c24:	eb09 0008 	add.w	r0, r9, r8
c0de7c28:	2100      	movs	r1, #0
c0de7c2a:	6681      	str	r1, [r0, #104]	@ 0x68
c0de7c2c:	ad01      	add	r5, sp, #4
c0de7c2e:	213c      	movs	r1, #60	@ 0x3c
c0de7c30:	1d28      	adds	r0, r5, #4
c0de7c32:	f003 f9a1 	bl	c0deaf78 <__aeabi_memclr>
c0de7c36:	2009      	movs	r0, #9
c0de7c38:	f8df b2e0 	ldr.w	fp, [pc, #736]	@ c0de7f1c <displayGenericContextPage+0x3f4>
c0de7c3c:	f89d 7047 	ldrb.w	r7, [sp, #71]	@ 0x47
c0de7c40:	f88d 000a 	strb.w	r0, [sp, #10]
c0de7c44:	2002      	movs	r0, #2
c0de7c46:	f88d 0009 	strb.w	r0, [sp, #9]
c0de7c4a:	eb09 0008 	add.w	r0, r9, r8
c0de7c4e:	eb09 010b 	add.w	r1, r9, fp
c0de7c52:	6900      	ldr	r0, [r0, #16]
c0de7c54:	7c8e      	ldrb	r6, [r1, #18]
c0de7c56:	9001      	str	r0, [sp, #4]
c0de7c58:	f89a 0000 	ldrb.w	r0, [sl]
c0de7c5c:	280a      	cmp	r0, #10
c0de7c5e:	f88d 0010 	strb.w	r0, [sp, #16]
c0de7c62:	d01e      	beq.n	c0de7ca2 <displayGenericContextPage+0x17a>
c0de7c64:	2801      	cmp	r0, #1
c0de7c66:	d02c      	beq.n	c0de7cc2 <displayGenericContextPage+0x19a>
c0de7c68:	2802      	cmp	r0, #2
c0de7c6a:	d014      	beq.n	c0de7c96 <displayGenericContextPage+0x16e>
c0de7c6c:	2803      	cmp	r0, #3
c0de7c6e:	d012      	beq.n	c0de7c96 <displayGenericContextPage+0x16e>
c0de7c70:	2804      	cmp	r0, #4
c0de7c72:	d02e      	beq.n	c0de7cd2 <displayGenericContextPage+0x1aa>
c0de7c74:	2806      	cmp	r0, #6
c0de7c76:	d040      	beq.n	c0de7cfa <displayGenericContextPage+0x1d2>
c0de7c78:	2807      	cmp	r0, #7
c0de7c7a:	d04c      	beq.n	c0de7d16 <displayGenericContextPage+0x1ee>
c0de7c7c:	2808      	cmp	r0, #8
c0de7c7e:	d056      	beq.n	c0de7d2e <displayGenericContextPage+0x206>
c0de7c80:	2809      	cmp	r0, #9
c0de7c82:	d061      	beq.n	c0de7d48 <displayGenericContextPage+0x220>
c0de7c84:	2800      	cmp	r0, #0
c0de7c86:	f040 8141 	bne.w	c0de7f0c <displayGenericContextPage+0x3e4>
c0de7c8a:	f002 f8b1 	bl	c0de9df0 <OUTLINED_FUNCTION_18>
c0de7c8e:	e890 007c 	ldmia.w	r0, {r2, r3, r4, r5, r6}
c0de7c92:	c17c      	stmia	r1!, {r2, r3, r4, r5, r6}
c0de7c94:	e103      	b.n	c0de7e9e <displayGenericContextPage+0x376>
c0de7c96:	f002 f8ab 	bl	c0de9df0 <OUTLINED_FUNCTION_18>
c0de7c9a:	e890 003c 	ldmia.w	r0, {r2, r3, r4, r5}
c0de7c9e:	c13c      	stmia	r1!, {r2, r3, r4, r5}
c0de7ca0:	e0fd      	b.n	c0de7e9e <displayGenericContextPage+0x376>
c0de7ca2:	f88d 701c 	strb.w	r7, [sp, #28]
c0de7ca6:	f002 f862 	bl	c0de9d6e <OUTLINED_FUNCTION_2>
c0de7caa:	9005      	str	r0, [sp, #20]
c0de7cac:	f8da 0008 	ldr.w	r0, [sl, #8]
c0de7cb0:	4430      	add	r0, r6
c0de7cb2:	f002 ff3f 	bl	c0deab34 <pic>
c0de7cb6:	9006      	str	r0, [sp, #24]
c0de7cb8:	f89a 000d 	ldrb.w	r0, [sl, #13]
c0de7cbc:	f88d 001d 	strb.w	r0, [sp, #29]
c0de7cc0:	e0ed      	b.n	c0de7e9e <displayGenericContextPage+0x376>
c0de7cc2:	f105 0010 	add.w	r0, r5, #16
c0de7cc6:	f10a 0104 	add.w	r1, sl, #4
c0de7cca:	2230      	movs	r2, #48	@ 0x30
c0de7ccc:	f003 f94a 	bl	c0deaf64 <__aeabi_memcpy>
c0de7cd0:	e0e5      	b.n	c0de7e9e <displayGenericContextPage+0x376>
c0de7cd2:	f8da 2004 	ldr.w	r2, [sl, #4]
c0de7cd6:	eb09 010b 	add.w	r1, r9, fp
c0de7cda:	f89d 0046 	ldrb.w	r0, [sp, #70]	@ 0x46
c0de7cde:	624a      	str	r2, [r1, #36]	@ 0x24
c0de7ce0:	2800      	cmp	r0, #0
c0de7ce2:	f8da 2008 	ldr.w	r2, [sl, #8]
c0de7ce6:	628a      	str	r2, [r1, #40]	@ 0x28
c0de7ce8:	f000 8087 	beq.w	c0de7dfa <displayGenericContextPage+0x2d2>
c0de7cec:	f8da 0004 	ldr.w	r0, [sl, #4]
c0de7cf0:	2800      	cmp	r0, #0
c0de7cf2:	d064      	beq.n	c0de7dbe <displayGenericContextPage+0x296>
c0de7cf4:	eb00 1006 	add.w	r0, r0, r6, lsl #4
c0de7cf8:	e065      	b.n	c0de7dc6 <displayGenericContextPage+0x29e>
c0de7cfa:	f89a 100c 	ldrb.w	r1, [sl, #12]
c0de7cfe:	19f0      	adds	r0, r6, r7
c0de7d00:	f10a 0404 	add.w	r4, sl, #4
c0de7d04:	4288      	cmp	r0, r1
c0de7d06:	d134      	bne.n	c0de7d72 <displayGenericContextPage+0x24a>
c0de7d08:	3510      	adds	r5, #16
c0de7d0a:	4621      	mov	r1, r4
c0de7d0c:	222c      	movs	r2, #44	@ 0x2c
c0de7d0e:	4628      	mov	r0, r5
c0de7d10:	f003 f928 	bl	c0deaf64 <__aeabi_memcpy>
c0de7d14:	e031      	b.n	c0de7d7a <displayGenericContextPage+0x252>
c0de7d16:	f88d 7018 	strb.w	r7, [sp, #24]
c0de7d1a:	eb06 0046 	add.w	r0, r6, r6, lsl #1
c0de7d1e:	f8da 1004 	ldr.w	r1, [sl, #4]
c0de7d22:	eb01 0080 	add.w	r0, r1, r0, lsl #2
c0de7d26:	f002 ff05 	bl	c0deab34 <pic>
c0de7d2a:	9005      	str	r0, [sp, #20]
c0de7d2c:	e0b7      	b.n	c0de7e9e <displayGenericContextPage+0x376>
c0de7d2e:	f88d 7020 	strb.w	r7, [sp, #32]
c0de7d32:	f002 f81c 	bl	c0de9d6e <OUTLINED_FUNCTION_2>
c0de7d36:	9005      	str	r0, [sp, #20]
c0de7d38:	f8da 0008 	ldr.w	r0, [sl, #8]
c0de7d3c:	eb00 0086 	add.w	r0, r0, r6, lsl #2
c0de7d40:	f002 fef8 	bl	c0deab34 <pic>
c0de7d44:	9006      	str	r0, [sp, #24]
c0de7d46:	e0aa      	b.n	c0de7e9e <displayGenericContextPage+0x376>
c0de7d48:	f002 f852 	bl	c0de9df0 <OUTLINED_FUNCTION_18>
c0de7d4c:	e890 001c 	ldmia.w	r0, {r2, r3, r4}
c0de7d50:	c11c      	stmia	r1!, {r2, r3, r4}
c0de7d52:	f88d 7019 	strb.w	r7, [sp, #25]
c0de7d56:	f002 f80a 	bl	c0de9d6e <OUTLINED_FUNCTION_2>
c0de7d5a:	9005      	str	r0, [sp, #20]
c0de7d5c:	f89a 000a 	ldrb.w	r0, [sl, #10]
c0de7d60:	42b0      	cmp	r0, r6
c0de7d62:	d329      	bcc.n	c0de7db8 <displayGenericContextPage+0x290>
c0de7d64:	19f1      	adds	r1, r6, r7
c0de7d66:	4281      	cmp	r1, r0
c0de7d68:	d926      	bls.n	c0de7db8 <displayGenericContextPage+0x290>
c0de7d6a:	1b80      	subs	r0, r0, r6
c0de7d6c:	f88d 001a 	strb.w	r0, [sp, #26]
c0de7d70:	e095      	b.n	c0de7e9e <displayGenericContextPage+0x376>
c0de7d72:	2004      	movs	r0, #4
c0de7d74:	3510      	adds	r5, #16
c0de7d76:	f88d 0010 	strb.w	r0, [sp, #16]
c0de7d7a:	f88d 701c 	strb.w	r7, [sp, #28]
c0de7d7e:	6820      	ldr	r0, [r4, #0]
c0de7d80:	eb00 1006 	add.w	r0, r0, r6, lsl #4
c0de7d84:	f002 fed6 	bl	c0deab34 <pic>
c0de7d88:	2110      	movs	r1, #16
c0de7d8a:	6028      	str	r0, [r5, #0]
c0de7d8c:	9d00      	ldr	r5, [sp, #0]
c0de7d8e:	2200      	movs	r2, #0
c0de7d90:	eb01 1107 	add.w	r1, r1, r7, lsl #4
c0de7d94:	f102 0310 	add.w	r3, r2, #16
c0de7d98:	4299      	cmp	r1, r3
c0de7d9a:	d007      	beq.n	c0de7dac <displayGenericContextPage+0x284>
c0de7d9c:	4402      	add	r2, r0
c0de7d9e:	7b12      	ldrb	r2, [r2, #12]
c0de7da0:	0752      	lsls	r2, r2, #29
c0de7da2:	461a      	mov	r2, r3
c0de7da4:	d5f6      	bpl.n	c0de7d94 <displayGenericContextPage+0x26c>
c0de7da6:	210d      	movs	r1, #13
c0de7da8:	f88d 1020 	strb.w	r1, [sp, #32]
c0de7dac:	9a06      	ldr	r2, [sp, #24]
c0de7dae:	eb09 010b 	add.w	r1, r9, fp
c0de7db2:	e9c1 0209 	strd	r0, r2, [r1, #36]	@ 0x24
c0de7db6:	e073      	b.n	c0de7ea0 <displayGenericContextPage+0x378>
c0de7db8:	f88d 701a 	strb.w	r7, [sp, #26]
c0de7dbc:	e06f      	b.n	c0de7e9e <displayGenericContextPage+0x376>
c0de7dbe:	f8da 1008 	ldr.w	r1, [sl, #8]
c0de7dc2:	4630      	mov	r0, r6
c0de7dc4:	4788      	blx	r1
c0de7dc6:	f002 feb5 	bl	c0deab34 <pic>
c0de7dca:	7b01      	ldrb	r1, [r0, #12]
c0de7dcc:	0789      	lsls	r1, r1, #30
c0de7dce:	d42e      	bmi.n	c0de7e2e <displayGenericContextPage+0x306>
c0de7dd0:	4954      	ldr	r1, [pc, #336]	@ (c0de7f24 <displayGenericContextPage+0x3fc>)
c0de7dd2:	4479      	add	r1, pc
c0de7dd4:	910b      	str	r1, [sp, #44]	@ 0x2c
c0de7dd6:	210a      	movs	r1, #10
c0de7dd8:	f88d 1030 	strb.w	r1, [sp, #48]	@ 0x30
c0de7ddc:	2100      	movs	r1, #0
c0de7dde:	910a      	str	r1, [sp, #40]	@ 0x28
c0de7de0:	eb09 010b 	add.w	r1, r9, fp
c0de7de4:	e9d0 2000 	ldrd	r2, r0, [r0]
c0de7de8:	e9c1 2006 	strd	r2, r0, [r1, #24]
c0de7dec:	f89a 0012 	ldrb.w	r0, [sl, #18]
c0de7df0:	f881 0020 	strb.w	r0, [r1, #32]
c0de7df4:	2005      	movs	r0, #5
c0de7df6:	f88d 0010 	strb.w	r0, [sp, #16]
c0de7dfa:	f88d 701c 	strb.w	r7, [sp, #28]
c0de7dfe:	f89a 0010 	ldrb.w	r0, [sl, #16]
c0de7e02:	f88d 0020 	strb.w	r0, [sp, #32]
c0de7e06:	f8da 0004 	ldr.w	r0, [sl, #4]
c0de7e0a:	b328      	cbz	r0, c0de7e58 <displayGenericContextPage+0x330>
c0de7e0c:	eb00 1006 	add.w	r0, r0, r6, lsl #4
c0de7e10:	f002 fe90 	bl	c0deab34 <pic>
c0de7e14:	9005      	str	r0, [sp, #20]
c0de7e16:	f100 010c 	add.w	r1, r0, #12
c0de7e1a:	1c78      	adds	r0, r7, #1
c0de7e1c:	3801      	subs	r0, #1
c0de7e1e:	d033      	beq.n	c0de7e88 <displayGenericContextPage+0x360>
c0de7e20:	f101 0210 	add.w	r2, r1, #16
c0de7e24:	7809      	ldrb	r1, [r1, #0]
c0de7e26:	0749      	lsls	r1, r1, #29
c0de7e28:	4611      	mov	r1, r2
c0de7e2a:	d5f7      	bpl.n	c0de7e1c <displayGenericContextPage+0x2f4>
c0de7e2c:	e029      	b.n	c0de7e82 <displayGenericContextPage+0x35a>
c0de7e2e:	2101      	movs	r1, #1
c0de7e30:	f88d 1010 	strb.w	r1, [sp, #16]
c0de7e34:	6881      	ldr	r1, [r0, #8]
c0de7e36:	4a3f      	ldr	r2, [pc, #252]	@ (c0de7f34 <displayGenericContextPage+0x40c>)
c0de7e38:	447a      	add	r2, pc
c0de7e3a:	920c      	str	r2, [sp, #48]	@ 0x30
c0de7e3c:	e9d0 2000 	ldrd	r2, r0, [r0]
c0de7e40:	9106      	str	r1, [sp, #24]
c0de7e42:	900b      	str	r0, [sp, #44]	@ 0x2c
c0de7e44:	2000      	movs	r0, #0
c0de7e46:	9209      	str	r2, [sp, #36]	@ 0x24
c0de7e48:	f88d 0036 	strb.w	r0, [sp, #54]	@ 0x36
c0de7e4c:	f8ad 0034 	strh.w	r0, [sp, #52]	@ 0x34
c0de7e50:	900a      	str	r0, [sp, #40]	@ 0x28
c0de7e52:	f88d 0014 	strb.w	r0, [sp, #20]
c0de7e56:	e022      	b.n	c0de7e9e <displayGenericContextPage+0x376>
c0de7e58:	2400      	movs	r4, #0
c0de7e5a:	9405      	str	r4, [sp, #20]
c0de7e5c:	f8da 0008 	ldr.w	r0, [sl, #8]
c0de7e60:	f88d 601d 	strb.w	r6, [sp, #29]
c0de7e64:	9006      	str	r0, [sp, #24]
c0de7e66:	b2e0      	uxtb	r0, r4
c0de7e68:	42b8      	cmp	r0, r7
c0de7e6a:	d20d      	bcs.n	c0de7e88 <displayGenericContextPage+0x360>
c0de7e6c:	19a0      	adds	r0, r4, r6
c0de7e6e:	f8da 1008 	ldr.w	r1, [sl, #8]
c0de7e72:	b2c0      	uxtb	r0, r0
c0de7e74:	4788      	blx	r1
c0de7e76:	f002 fe5d 	bl	c0deab34 <pic>
c0de7e7a:	7b00      	ldrb	r0, [r0, #12]
c0de7e7c:	3401      	adds	r4, #1
c0de7e7e:	0740      	lsls	r0, r0, #29
c0de7e80:	d5f1      	bpl.n	c0de7e66 <displayGenericContextPage+0x33e>
c0de7e82:	200d      	movs	r0, #13
c0de7e84:	f88d 0020 	strb.w	r0, [sp, #32]
c0de7e88:	2000      	movs	r0, #0
c0de7e8a:	f88d 0021 	strb.w	r0, [sp, #33]	@ 0x21
c0de7e8e:	f640 1001 	movw	r0, #2305	@ 0x901
c0de7e92:	f8ad 001e 	strh.w	r0, [sp, #30]
c0de7e96:	f89a 0012 	ldrb.w	r0, [sl, #18]
c0de7e9a:	f88d 0022 	strb.w	r0, [sp, #34]	@ 0x22
c0de7e9e:	9d00      	ldr	r5, [sp, #0]
c0de7ea0:	481d      	ldr	r0, [pc, #116]	@ (c0de7f18 <displayGenericContextPage+0x3f0>)
c0de7ea2:	f819 1008 	ldrb.w	r1, [r9, r8]
c0de7ea6:	f001 01fe 	and.w	r1, r1, #254	@ 0xfe
c0de7eaa:	f859 0000 	ldr.w	r0, [r9, r0]
c0de7eae:	2902      	cmp	r1, #2
c0de7eb0:	bf18      	it	ne
c0de7eb2:	2000      	movne	r0, #0
c0de7eb4:	f89a 1000 	ldrb.w	r1, [sl]
c0de7eb8:	2902      	cmp	r1, #2
c0de7eba:	d817      	bhi.n	c0de7eec <displayGenericContextPage+0x3c4>
c0de7ebc:	f010 0fe0 	tst.w	r0, #224	@ 0xe0
c0de7ec0:	d014      	beq.n	c0de7eec <displayGenericContextPage+0x3c4>
c0de7ec2:	0601      	lsls	r1, r0, #24
c0de7ec4:	d508      	bpl.n	c0de7ed8 <displayGenericContextPage+0x3b0>
c0de7ec6:	eb09 010b 	add.w	r1, r9, fp
c0de7eca:	6f89      	ldr	r1, [r1, #120]	@ 0x78
c0de7ecc:	7809      	ldrb	r1, [r1, #0]
c0de7ece:	06c9      	lsls	r1, r1, #27
c0de7ed0:	d402      	bmi.n	c0de7ed8 <displayGenericContextPage+0x3b0>
c0de7ed2:	4915      	ldr	r1, [pc, #84]	@ (c0de7f28 <displayGenericContextPage+0x400>)
c0de7ed4:	4479      	add	r1, pc
c0de7ed6:	e001      	b.n	c0de7edc <displayGenericContextPage+0x3b4>
c0de7ed8:	4914      	ldr	r1, [pc, #80]	@ (c0de7f2c <displayGenericContextPage+0x404>)
c0de7eda:	4479      	add	r1, pc
c0de7edc:	0680      	lsls	r0, r0, #26
c0de7ede:	9103      	str	r1, [sp, #12]
c0de7ee0:	f04f 0010 	mov.w	r0, #16
c0de7ee4:	bf58      	it	pl
c0de7ee6:	2011      	movpl	r0, #17
c0de7ee8:	f88d 000b 	strb.w	r0, [sp, #11]
c0de7eec:	4810      	ldr	r0, [pc, #64]	@ (c0de7f30 <displayGenericContextPage+0x408>)
c0de7eee:	eb09 0408 	add.w	r4, r9, r8
c0de7ef2:	aa01      	add	r2, sp, #4
c0de7ef4:	f104 0160 	add.w	r1, r4, #96	@ 0x60
c0de7ef8:	4478      	add	r0, pc
c0de7efa:	f7ff fa6b 	bl	c0de73d4 <nbgl_pageDrawGenericContent>
c0de7efe:	6160      	str	r0, [r4, #20]
c0de7f00:	2001      	movs	r0, #1
c0de7f02:	2d00      	cmp	r5, #0
c0de7f04:	bf18      	it	ne
c0de7f06:	2002      	movne	r0, #2
c0de7f08:	f002 fbfc 	bl	c0dea704 <nbgl_refreshSpecial>
c0de7f0c:	b020      	add	sp, #128	@ 0x80
c0de7f0e:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de7f12:	bf00      	nop
c0de7f14:	00001c34 	.word	0x00001c34
c0de7f18:	00001cb0 	.word	0x00001cb0
c0de7f1c:	0000197c 	.word	0x0000197c
c0de7f20:	000051e7 	.word	0x000051e7
c0de7f24:	00004c3a 	.word	0x00004c3a
c0de7f28:	0000434e 	.word	0x0000434e
c0de7f2c:	00004691 	.word	0x00004691
c0de7f30:	000001b5 	.word	0x000001b5
c0de7f34:	0000501e 	.word	0x0000501e

c0de7f38 <nbgl_useCaseHomeAndSettings>:
c0de7f38:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de7f3c:	4698      	mov	r8, r3
c0de7f3e:	4615      	mov	r5, r2
c0de7f40:	460e      	mov	r6, r1
c0de7f42:	4607      	mov	r7, r0
c0de7f44:	f7ff fc58 	bl	c0de77f8 <reset_callbacks_and_context>
c0de7f48:	4814      	ldr	r0, [pc, #80]	@ (c0de7f9c <nbgl_useCaseHomeAndSettings+0x64>)
c0de7f4a:	f849 7000 	str.w	r7, [r9, r0]
c0de7f4e:	eb09 0100 	add.w	r1, r9, r0
c0de7f52:	9a07      	ldr	r2, [sp, #28]
c0de7f54:	610a      	str	r2, [r1, #16]
c0de7f56:	9a06      	ldr	r2, [sp, #24]
c0de7f58:	e9c1 6501 	strd	r6, r5, [r1, #4]
c0de7f5c:	60ca      	str	r2, [r1, #12]
c0de7f5e:	e9dd 2108 	ldrd	r2, r1, [sp, #32]
c0de7f62:	b132      	cbz	r2, c0de7f72 <nbgl_useCaseHomeAndSettings+0x3a>
c0de7f64:	eb09 0300 	add.w	r3, r9, r0
c0de7f68:	e892 00f0 	ldmia.w	r2, {r4, r5, r6, r7}
c0de7f6c:	3314      	adds	r3, #20
c0de7f6e:	c3f0      	stmia	r3!, {r4, r5, r6, r7}
c0de7f70:	e006      	b.n	c0de7f80 <nbgl_useCaseHomeAndSettings+0x48>
c0de7f72:	eb09 0200 	add.w	r2, r9, r0
c0de7f76:	2300      	movs	r3, #0
c0de7f78:	e9c2 3305 	strd	r3, r3, [r2, #20]
c0de7f7c:	e9c2 3307 	strd	r3, r3, [r2, #28]
c0de7f80:	4448      	add	r0, r9
c0de7f82:	f1b8 0fff 	cmp.w	r8, #255	@ 0xff
c0de7f86:	6241      	str	r1, [r0, #36]	@ 0x24
c0de7f88:	d004      	beq.n	c0de7f94 <nbgl_useCaseHomeAndSettings+0x5c>
c0de7f8a:	4640      	mov	r0, r8
c0de7f8c:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de7f90:	f000 b806 	b.w	c0de7fa0 <bundleNavStartSettingsAtPage>
c0de7f94:	e8bd 41f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, lr}
c0de7f98:	f000 b816 	b.w	c0de7fc8 <bundleNavStartHome>
c0de7f9c:	00001cb0 	.word	0x00001cb0

c0de7fa0 <bundleNavStartSettingsAtPage>:
c0de7fa0:	b51c      	push	{r2, r3, r4, lr}
c0de7fa2:	4a07      	ldr	r2, [pc, #28]	@ (c0de7fc0 <bundleNavStartSettingsAtPage+0x20>)
c0de7fa4:	4601      	mov	r1, r0
c0de7fa6:	eb09 0302 	add.w	r3, r9, r2
c0de7faa:	f859 0002 	ldr.w	r0, [r9, r2]
c0de7fae:	e9d3 2303 	ldrd	r2, r3, [r3, #12]
c0de7fb2:	4c04      	ldr	r4, [pc, #16]	@ (c0de7fc4 <bundleNavStartSettingsAtPage+0x24>)
c0de7fb4:	447c      	add	r4, pc
c0de7fb6:	9400      	str	r4, [sp, #0]
c0de7fb8:	f7ff fca2 	bl	c0de7900 <nbgl_useCaseGenericSettings>
c0de7fbc:	bd1c      	pop	{r2, r3, r4, pc}
c0de7fbe:	bf00      	nop
c0de7fc0:	00001cb0 	.word	0x00001cb0
c0de7fc4:	00000011 	.word	0x00000011

c0de7fc8 <bundleNavStartHome>:
c0de7fc8:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
c0de7fca:	490a      	ldr	r1, [pc, #40]	@ (c0de7ff4 <bundleNavStartHome+0x2c>)
c0de7fcc:	eb09 0401 	add.w	r4, r9, r1
c0de7fd0:	f859 0001 	ldr.w	r0, [r9, r1]
c0de7fd4:	1d23      	adds	r3, r4, #4
c0de7fd6:	6a65      	ldr	r5, [r4, #36]	@ 0x24
c0de7fd8:	3414      	adds	r4, #20
c0de7fda:	cb0e      	ldmia	r3, {r1, r2, r3}
c0de7fdc:	4e06      	ldr	r6, [pc, #24]	@ (c0de7ff8 <bundleNavStartHome+0x30>)
c0de7fde:	2b00      	cmp	r3, #0
c0de7fe0:	9502      	str	r5, [sp, #8]
c0de7fe2:	447e      	add	r6, pc
c0de7fe4:	e9cd 4600 	strd	r4, r6, [sp]
c0de7fe8:	bf18      	it	ne
c0de7fea:	2301      	movne	r3, #1
c0de7fec:	f7ff fb6a 	bl	c0de76c4 <useCaseHomeExt>
c0de7ff0:	bd7f      	pop	{r0, r1, r2, r3, r4, r5, r6, pc}
c0de7ff2:	bf00      	nop
c0de7ff4:	00001cb0 	.word	0x00001cb0
c0de7ff8:	0000129b 	.word	0x0000129b

c0de7ffc <nbgl_useCaseStatus>:
c0de7ffc:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de8000:	b090      	sub	sp, #64	@ 0x40
c0de8002:	4604      	mov	r4, r0
c0de8004:	481d      	ldr	r0, [pc, #116]	@ (c0de807c <nbgl_useCaseStatus+0x80>)
c0de8006:	460e      	mov	r6, r1
c0de8008:	4615      	mov	r5, r2
c0de800a:	a90d      	add	r1, sp, #52	@ 0x34
c0de800c:	4478      	add	r0, pc
c0de800e:	e890 008c 	ldmia.w	r0, {r2, r3, r7}
c0de8012:	4668      	mov	r0, sp
c0de8014:	3004      	adds	r0, #4
c0de8016:	c18c      	stmia	r1!, {r2, r3, r7}
c0de8018:	2130      	movs	r1, #48	@ 0x30
c0de801a:	f002 ffad 	bl	c0deaf78 <__aeabi_memclr>
c0de801e:	f8df 8058 	ldr.w	r8, [pc, #88]	@ c0de8078 <nbgl_useCaseStatus+0x7c>
c0de8022:	eb09 0708 	add.w	r7, r9, r8
c0de8026:	f7ff fbe7 	bl	c0de77f8 <reset_callbacks_and_context>
c0de802a:	607d      	str	r5, [r7, #4]
c0de802c:	b12e      	cbz	r6, c0de803a <nbgl_useCaseStatus+0x3e>
c0de802e:	2003      	movs	r0, #3
c0de8030:	f7fa fec1 	bl	c0de2db6 <os_io_seph_cmd_piezo_play_tune>
c0de8034:	4813      	ldr	r0, [pc, #76]	@ (c0de8084 <nbgl_useCaseStatus+0x88>)
c0de8036:	4478      	add	r0, pc
c0de8038:	e001      	b.n	c0de803e <nbgl_useCaseStatus+0x42>
c0de803a:	4811      	ldr	r0, [pc, #68]	@ (c0de8080 <nbgl_useCaseStatus+0x84>)
c0de803c:	4478      	add	r0, pc
c0de803e:	9003      	str	r0, [sp, #12]
c0de8040:	2009      	movs	r0, #9
c0de8042:	2100      	movs	r1, #0
c0de8044:	466a      	mov	r2, sp
c0de8046:	f88d 0031 	strb.w	r0, [sp, #49]	@ 0x31
c0de804a:	2002      	movs	r0, #2
c0de804c:	f88d 1011 	strb.w	r1, [sp, #17]
c0de8050:	f88d 0025 	strb.w	r0, [sp, #37]	@ 0x25
c0de8054:	480c      	ldr	r0, [pc, #48]	@ (c0de8088 <nbgl_useCaseStatus+0x8c>)
c0de8056:	9400      	str	r4, [sp, #0]
c0de8058:	4478      	add	r0, pc
c0de805a:	9008      	str	r0, [sp, #32]
c0de805c:	480b      	ldr	r0, [pc, #44]	@ (c0de808c <nbgl_useCaseStatus+0x90>)
c0de805e:	a90d      	add	r1, sp, #52	@ 0x34
c0de8060:	4478      	add	r0, pc
c0de8062:	f7fe fe4f 	bl	c0de6d04 <nbgl_pageDrawInfo>
c0de8066:	eb09 0108 	add.w	r1, r9, r8
c0de806a:	6148      	str	r0, [r1, #20]
c0de806c:	f001 fe85 	bl	c0de9d7a <OUTLINED_FUNCTION_3>
c0de8070:	b010      	add	sp, #64	@ 0x40
c0de8072:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de8076:	bf00      	nop
c0de8078:	00001c34 	.word	0x00001c34
c0de807c:	0000638c 	.word	0x0000638c
c0de8080:	00003874 	.word	0x00003874
c0de8084:	00003638 	.word	0x00003638
c0de8088:	00004d60 	.word	0x00004d60
c0de808c:	0000004d 	.word	0x0000004d

c0de8090 <tickerCallback>:
c0de8090:	b510      	push	{r4, lr}
c0de8092:	4806      	ldr	r0, [pc, #24]	@ (c0de80ac <tickerCallback+0x1c>)
c0de8094:	eb09 0400 	add.w	r4, r9, r0
c0de8098:	6960      	ldr	r0, [r4, #20]
c0de809a:	f7ff f99e 	bl	c0de73da <nbgl_pageRelease>
c0de809e:	6860      	ldr	r0, [r4, #4]
c0de80a0:	b110      	cbz	r0, c0de80a8 <tickerCallback+0x18>
c0de80a2:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
c0de80a6:	4700      	bx	r0
c0de80a8:	bd10      	pop	{r4, pc}
c0de80aa:	bf00      	nop
c0de80ac:	00001c34 	.word	0x00001c34

c0de80b0 <pageCallback>:
c0de80b0:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de80b4:	b094      	sub	sp, #80	@ 0x50
c0de80b6:	b350      	cbz	r0, c0de810e <pageCallback+0x5e>
c0de80b8:	4605      	mov	r5, r0
c0de80ba:	2801      	cmp	r0, #1
c0de80bc:	d034      	beq.n	c0de8128 <pageCallback+0x78>
c0de80be:	2d13      	cmp	r5, #19
c0de80c0:	d043      	beq.n	c0de814a <pageCallback+0x9a>
c0de80c2:	460c      	mov	r4, r1
c0de80c4:	2d03      	cmp	r5, #3
c0de80c6:	d055      	beq.n	c0de8174 <pageCallback+0xc4>
c0de80c8:	2d05      	cmp	r5, #5
c0de80ca:	d05f      	beq.n	c0de818c <pageCallback+0xdc>
c0de80cc:	2d06      	cmp	r5, #6
c0de80ce:	d075      	beq.n	c0de81bc <pageCallback+0x10c>
c0de80d0:	2d07      	cmp	r5, #7
c0de80d2:	d077      	beq.n	c0de81c4 <pageCallback+0x114>
c0de80d4:	2d08      	cmp	r5, #8
c0de80d6:	f000 809f 	beq.w	c0de8218 <pageCallback+0x168>
c0de80da:	2d09      	cmp	r5, #9
c0de80dc:	f000 80aa 	beq.w	c0de8234 <pageCallback+0x184>
c0de80e0:	2d0a      	cmp	r5, #10
c0de80e2:	f000 80b1 	beq.w	c0de8248 <pageCallback+0x198>
c0de80e6:	2d0b      	cmp	r5, #11
c0de80e8:	f000 80fb 	beq.w	c0de82e2 <pageCallback+0x232>
c0de80ec:	2d0c      	cmp	r5, #12
c0de80ee:	f000 8100 	beq.w	c0de82f2 <pageCallback+0x242>
c0de80f2:	2d0d      	cmp	r5, #13
c0de80f4:	f000 8107 	beq.w	c0de8306 <pageCallback+0x256>
c0de80f8:	2d10      	cmp	r5, #16
c0de80fa:	f000 8110 	beq.w	c0de831e <pageCallback+0x26e>
c0de80fe:	2d11      	cmp	r5, #17
c0de8100:	f000 8115 	beq.w	c0de832e <pageCallback+0x27e>
c0de8104:	2d02      	cmp	r5, #2
c0de8106:	f040 811e 	bne.w	c0de8346 <pageCallback+0x296>
c0de810a:	48cc      	ldr	r0, [pc, #816]	@ (c0de843c <pageCallback+0x38c>)
c0de810c:	e165      	b.n	c0de83da <pageCallback+0x32a>
c0de810e:	48cb      	ldr	r0, [pc, #812]	@ (c0de843c <pageCallback+0x38c>)
c0de8110:	eb09 0100 	add.w	r1, r9, r0
c0de8114:	f891 0060 	ldrb.w	r0, [r1, #96]	@ 0x60
c0de8118:	6889      	ldr	r1, [r1, #8]
c0de811a:	3801      	subs	r0, #1
c0de811c:	2900      	cmp	r1, #0
c0de811e:	f000 8129 	beq.w	c0de8374 <pageCallback+0x2c4>
c0de8122:	b2c0      	uxtb	r0, r0
c0de8124:	2101      	movs	r1, #1
c0de8126:	e00b      	b.n	c0de8140 <pageCallback+0x90>
c0de8128:	48c4      	ldr	r0, [pc, #784]	@ (c0de843c <pageCallback+0x38c>)
c0de812a:	eb09 0100 	add.w	r1, r9, r0
c0de812e:	f891 0060 	ldrb.w	r0, [r1, #96]	@ 0x60
c0de8132:	6889      	ldr	r1, [r1, #8]
c0de8134:	3001      	adds	r0, #1
c0de8136:	2900      	cmp	r1, #0
c0de8138:	f000 811c 	beq.w	c0de8374 <pageCallback+0x2c4>
c0de813c:	b2c0      	uxtb	r0, r0
c0de813e:	2100      	movs	r1, #0
c0de8140:	b014      	add	sp, #80	@ 0x50
c0de8142:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de8146:	f000 bb35 	b.w	c0de87b4 <displayReviewPage>
c0de814a:	48bb      	ldr	r0, [pc, #748]	@ (c0de8438 <pageCallback+0x388>)
c0de814c:	eb09 0100 	add.w	r1, r9, r0
c0de8150:	f891 1021 	ldrb.w	r1, [r1, #33]	@ 0x21
c0de8154:	2900      	cmp	r1, #0
c0de8156:	f000 8114 	beq.w	c0de8382 <pageCallback+0x2d2>
c0de815a:	eb09 0100 	add.w	r1, r9, r0
c0de815e:	6f89      	ldr	r1, [r1, #120]	@ 0x78
c0de8160:	680a      	ldr	r2, [r1, #0]
c0de8162:	2a00      	cmp	r2, #0
c0de8164:	f000 810d 	beq.w	c0de8382 <pageCallback+0x2d2>
c0de8168:	4448      	add	r0, r9
c0de816a:	2201      	movs	r2, #1
c0de816c:	f880 2088 	strb.w	r2, [r0, #136]	@ 0x88
c0de8170:	6808      	ldr	r0, [r1, #0]
c0de8172:	e0e3      	b.n	c0de833c <pageCallback+0x28c>
c0de8174:	48b1      	ldr	r0, [pc, #708]	@ (c0de843c <pageCallback+0x38c>)
c0de8176:	2cff      	cmp	r4, #255	@ 0xff
c0de8178:	f000 812f 	beq.w	c0de83da <pageCallback+0x32a>
c0de817c:	f819 0000 	ldrb.w	r0, [r9, r0]
c0de8180:	1e81      	subs	r1, r0, #2
c0de8182:	2902      	cmp	r1, #2
c0de8184:	f080 8148 	bcs.w	c0de8418 <pageCallback+0x368>
c0de8188:	4620      	mov	r0, r4
c0de818a:	e0f4      	b.n	c0de8376 <pageCallback+0x2c6>
c0de818c:	a80c      	add	r0, sp, #48	@ 0x30
c0de818e:	49b1      	ldr	r1, [pc, #708]	@ (c0de8454 <pageCallback+0x3a4>)
c0de8190:	2220      	movs	r2, #32
c0de8192:	4479      	add	r1, pc
c0de8194:	f002 fee6 	bl	c0deaf64 <__aeabi_memcpy>
c0de8198:	4ca8      	ldr	r4, [pc, #672]	@ (c0de843c <pageCallback+0x38c>)
c0de819a:	eb09 0004 	add.w	r0, r9, r4
c0de819e:	6a00      	ldr	r0, [r0, #32]
c0de81a0:	b108      	cbz	r0, c0de81a6 <pageCallback+0xf6>
c0de81a2:	f7ff f91a 	bl	c0de73da <nbgl_pageRelease>
c0de81a6:	48ac      	ldr	r0, [pc, #688]	@ (c0de8458 <pageCallback+0x3a8>)
c0de81a8:	a90c      	add	r1, sp, #48	@ 0x30
c0de81aa:	4478      	add	r0, pc
c0de81ac:	f7fe feb4 	bl	c0de6f18 <nbgl_pageDrawConfirmation>
c0de81b0:	eb09 0104 	add.w	r1, r9, r4
c0de81b4:	6208      	str	r0, [r1, #32]
c0de81b6:	f001 fde0 	bl	c0de9d7a <OUTLINED_FUNCTION_3>
c0de81ba:	e115      	b.n	c0de83e8 <pageCallback+0x338>
c0de81bc:	489f      	ldr	r0, [pc, #636]	@ (c0de843c <pageCallback+0x38c>)
c0de81be:	4448      	add	r0, r9
c0de81c0:	6a80      	ldr	r0, [r0, #40]	@ 0x28
c0de81c2:	e10c      	b.n	c0de83de <pageCallback+0x32e>
c0de81c4:	49a0      	ldr	r1, [pc, #640]	@ (c0de8448 <pageCallback+0x398>)
c0de81c6:	f10d 0830 	add.w	r8, sp, #48	@ 0x30
c0de81ca:	221c      	movs	r2, #28
c0de81cc:	4640      	mov	r0, r8
c0de81ce:	4479      	add	r1, pc
c0de81d0:	f002 fec8 	bl	c0deaf64 <__aeabi_memcpy>
c0de81d4:	489d      	ldr	r0, [pc, #628]	@ (c0de844c <pageCallback+0x39c>)
c0de81d6:	ad07      	add	r5, sp, #28
c0de81d8:	4629      	mov	r1, r5
c0de81da:	4478      	add	r0, pc
c0de81dc:	e890 00dc 	ldmia.w	r0, {r2, r3, r4, r6, r7}
c0de81e0:	f44f 3080 	mov.w	r0, #65536	@ 0x10000
c0de81e4:	c1dc      	stmia	r1!, {r2, r3, r4, r6, r7}
c0de81e6:	4e96      	ldr	r6, [pc, #600]	@ (c0de8440 <pageCallback+0x390>)
c0de81e8:	9006      	str	r0, [sp, #24]
c0de81ea:	eb09 0706 	add.w	r7, r9, r6
c0de81ee:	6af8      	ldr	r0, [r7, #44]	@ 0x2c
c0de81f0:	9003      	str	r0, [sp, #12]
c0de81f2:	2000      	movs	r0, #0
c0de81f4:	9004      	str	r0, [sp, #16]
c0de81f6:	4640      	mov	r0, r8
c0de81f8:	f7fa ffe4 	bl	c0de31c4 <nbgl_layoutGet>
c0de81fc:	4629      	mov	r1, r5
c0de81fe:	65b8      	str	r0, [r7, #88]	@ 0x58
c0de8200:	f7fd fd34 	bl	c0de5c6c <nbgl_layoutAddHeader>
c0de8204:	6af9      	ldr	r1, [r7, #44]	@ 0x2c
c0de8206:	200b      	movs	r0, #11
c0de8208:	f001 fde5 	bl	c0de9dd6 <OUTLINED_FUNCTION_15>
c0de820c:	6af9      	ldr	r1, [r7, #44]	@ 0x2c
c0de820e:	2804      	cmp	r0, #4
c0de8210:	f080 80c1 	bcs.w	c0de8396 <pageCallback+0x2e6>
c0de8214:	460c      	mov	r4, r1
c0de8216:	e0ca      	b.n	c0de83ae <pageCallback+0x2fe>
c0de8218:	4888      	ldr	r0, [pc, #544]	@ (c0de843c <pageCallback+0x38c>)
c0de821a:	2c00      	cmp	r4, #0
c0de821c:	f040 80db 	bne.w	c0de83d6 <pageCallback+0x326>
c0de8220:	eb09 0100 	add.w	r1, r9, r0
c0de8224:	6a49      	ldr	r1, [r1, #36]	@ 0x24
c0de8226:	2900      	cmp	r1, #0
c0de8228:	f000 80d5 	beq.w	c0de83d6 <pageCallback+0x326>
c0de822c:	b014      	add	sp, #80	@ 0x50
c0de822e:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de8232:	4708      	bx	r1
c0de8234:	4881      	ldr	r0, [pc, #516]	@ (c0de843c <pageCallback+0x38c>)
c0de8236:	4448      	add	r0, r9
c0de8238:	6981      	ldr	r1, [r0, #24]
c0de823a:	2900      	cmp	r1, #0
c0de823c:	f000 80d4 	beq.w	c0de83e8 <pageCallback+0x338>
c0de8240:	fab4 f084 	clz	r0, r4
c0de8244:	0940      	lsrs	r0, r0, #5
c0de8246:	e05a      	b.n	c0de82fe <pageCallback+0x24e>
c0de8248:	487b      	ldr	r0, [pc, #492]	@ (c0de8438 <pageCallback+0x388>)
c0de824a:	f8df 81f0 	ldr.w	r8, [pc, #496]	@ c0de843c <pageCallback+0x38c>
c0de824e:	2700      	movs	r7, #0
c0de8250:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de8254:	f04f 0a0b 	mov.w	sl, #11
c0de8258:	4448      	add	r0, r9
c0de825a:	eb09 0608 	add.w	r6, r9, r8
c0de825e:	f890 4020 	ldrb.w	r4, [r0, #32]
c0de8262:	e9d0 b506 	ldrd	fp, r5, [r0, #24]
c0de8266:	200b      	movs	r0, #11
c0de8268:	e9c6 770c 	strd	r7, r7, [r6, #48]	@ 0x30
c0de826c:	e9c6 770e 	strd	r7, r7, [r6, #56]	@ 0x38
c0de8270:	4629      	mov	r1, r5
c0de8272:	4623      	mov	r3, r4
c0de8274:	f002 fa9b 	bl	c0dea7ae <nbgl_getTextNbLinesInWidth>
c0de8278:	f100 010a 	add.w	r1, r0, #10
c0de827c:	e9c6 b50d 	strd	fp, r5, [r6, #52]	@ 0x34
c0de8280:	f886 4033 	strb.w	r4, [r6, #51]	@ 0x33
c0de8284:	f886 7031 	strb.w	r7, [r6, #49]	@ 0x31
c0de8288:	fbb1 f1fa 	udiv	r1, r1, sl
c0de828c:	b2ca      	uxtb	r2, r1
c0de828e:	f886 1030 	strb.w	r1, [r6, #48]	@ 0x30
c0de8292:	2a02      	cmp	r2, #2
c0de8294:	d31e      	bcc.n	c0de82d4 <pageCallback+0x224>
c0de8296:	3a01      	subs	r2, #1
c0de8298:	241a      	movs	r4, #26
c0de829a:	eb02 0342 	add.w	r3, r2, r2, lsl #1
c0de829e:	3319      	adds	r3, #25
c0de82a0:	b29b      	uxth	r3, r3
c0de82a2:	fbb3 f4f4 	udiv	r4, r3, r4
c0de82a6:	b2e4      	uxtb	r4, r4
c0de82a8:	fbb4 f5fa 	udiv	r5, r4, sl
c0de82ac:	fb05 441a 	mls	r4, r5, sl, r4
c0de82b0:	f06f 050a 	mvn.w	r5, #10
c0de82b4:	fb02 0005 	mla	r0, r2, r5, r0
c0de82b8:	f44f 728f 	mov.w	r2, #286	@ 0x11e
c0de82bc:	fbb3 f2f2 	udiv	r2, r3, r2
c0de82c0:	b2c0      	uxtb	r0, r0
c0de82c2:	4420      	add	r0, r4
c0de82c4:	4411      	add	r1, r2
c0de82c6:	280b      	cmp	r0, #11
c0de82c8:	eb09 0008 	add.w	r0, r9, r8
c0de82cc:	bf88      	it	hi
c0de82ce:	3101      	addhi	r1, #1
c0de82d0:	f880 1030 	strb.w	r1, [r0, #48]	@ 0x30
c0de82d4:	2000      	movs	r0, #0
c0de82d6:	2101      	movs	r1, #1
c0de82d8:	b014      	add	sp, #80	@ 0x50
c0de82da:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de82de:	f001 bb31 	b.w	c0de9944 <displayDetailsPage>
c0de82e2:	4856      	ldr	r0, [pc, #344]	@ (c0de843c <pageCallback+0x38c>)
c0de82e4:	4448      	add	r0, r9
c0de82e6:	6981      	ldr	r1, [r0, #24]
c0de82e8:	2900      	cmp	r1, #0
c0de82ea:	f000 807d 	beq.w	c0de83e8 <pageCallback+0x338>
c0de82ee:	2001      	movs	r0, #1
c0de82f0:	e005      	b.n	c0de82fe <pageCallback+0x24e>
c0de82f2:	4852      	ldr	r0, [pc, #328]	@ (c0de843c <pageCallback+0x38c>)
c0de82f4:	4448      	add	r0, r9
c0de82f6:	6981      	ldr	r1, [r0, #24]
c0de82f8:	2900      	cmp	r1, #0
c0de82fa:	d075      	beq.n	c0de83e8 <pageCallback+0x338>
c0de82fc:	2000      	movs	r0, #0
c0de82fe:	b014      	add	sp, #80	@ 0x50
c0de8300:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de8304:	4708      	bx	r1
c0de8306:	484c      	ldr	r0, [pc, #304]	@ (c0de8438 <pageCallback+0x388>)
c0de8308:	eb09 0100 	add.w	r1, r9, r0
c0de830c:	4448      	add	r0, r9
c0de830e:	6a49      	ldr	r1, [r1, #36]	@ 0x24
c0de8310:	2900      	cmp	r1, #0
c0de8312:	d06c      	beq.n	c0de83ee <pageCallback+0x33e>
c0de8314:	7c80      	ldrb	r0, [r0, #18]
c0de8316:	4420      	add	r0, r4
c0de8318:	eb01 1000 	add.w	r0, r1, r0, lsl #4
c0de831c:	e06c      	b.n	c0de83f8 <pageCallback+0x348>
c0de831e:	4846      	ldr	r0, [pc, #280]	@ (c0de8438 <pageCallback+0x388>)
c0de8320:	2100      	movs	r1, #0
c0de8322:	4448      	add	r0, r9
c0de8324:	6781      	str	r1, [r0, #120]	@ 0x78
c0de8326:	f880 1089 	strb.w	r1, [r0, #137]	@ 0x89
c0de832a:	2010      	movs	r0, #16
c0de832c:	e006      	b.n	c0de833c <pageCallback+0x28c>
c0de832e:	4a42      	ldr	r2, [pc, #264]	@ (c0de8438 <pageCallback+0x388>)
c0de8330:	2101      	movs	r1, #1
c0de8332:	eb09 0002 	add.w	r0, r9, r2
c0de8336:	f001 fd29 	bl	c0de9d8c <OUTLINED_FUNCTION_6>
c0de833a:	d066      	beq.n	c0de840a <pageCallback+0x35a>
c0de833c:	b014      	add	sp, #80	@ 0x50
c0de833e:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de8342:	f001 b87f 	b.w	c0de9444 <displaySecurityReport>
c0de8346:	4e3d      	ldr	r6, [pc, #244]	@ (c0de843c <pageCallback+0x38c>)
c0de8348:	eb09 0006 	add.w	r0, r9, r6
c0de834c:	6ac3      	ldr	r3, [r0, #44]	@ 0x2c
c0de834e:	b133      	cbz	r3, c0de835e <pageCallback+0x2ae>
c0de8350:	eb09 0006 	add.w	r0, r9, r6
c0de8354:	4621      	mov	r1, r4
c0de8356:	f890 2060 	ldrb.w	r2, [r0, #96]	@ 0x60
c0de835a:	4628      	mov	r0, r5
c0de835c:	4798      	blx	r3
c0de835e:	eb09 0006 	add.w	r0, r9, r6
c0de8362:	68c2      	ldr	r2, [r0, #12]
c0de8364:	2a00      	cmp	r2, #0
c0de8366:	d03f      	beq.n	c0de83e8 <pageCallback+0x338>
c0de8368:	4628      	mov	r0, r5
c0de836a:	4621      	mov	r1, r4
c0de836c:	b014      	add	sp, #80	@ 0x50
c0de836e:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de8372:	4710      	bx	r2
c0de8374:	b2c0      	uxtb	r0, r0
c0de8376:	2100      	movs	r1, #0
c0de8378:	b014      	add	sp, #80	@ 0x50
c0de837a:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de837e:	f7ff bbd3 	b.w	c0de7b28 <displayGenericContextPage>
c0de8382:	eb09 0100 	add.w	r1, r9, r0
c0de8386:	2200      	movs	r2, #0
c0de8388:	6c48      	ldr	r0, [r1, #68]	@ 0x44
c0de838a:	314c      	adds	r1, #76	@ 0x4c
c0de838c:	b014      	add	sp, #80	@ 0x50
c0de838e:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de8392:	f001 b973 	b.w	c0de967c <displayInfosListModal>
c0de8396:	2080      	movs	r0, #128	@ 0x80
c0de8398:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de839c:	2303      	movs	r3, #3
c0de839e:	9001      	str	r0, [sp, #4]
c0de83a0:	4828      	ldr	r0, [pc, #160]	@ (c0de8444 <pageCallback+0x394>)
c0de83a2:	eb09 0400 	add.w	r4, r9, r0
c0de83a6:	200b      	movs	r0, #11
c0de83a8:	9400      	str	r4, [sp, #0]
c0de83aa:	f002 fa0f 	bl	c0dea7cc <nbgl_textReduceOnNbLines>
c0de83ae:	9405      	str	r4, [sp, #20]
c0de83b0:	eb09 0406 	add.w	r4, r9, r6
c0de83b4:	6da0      	ldr	r0, [r4, #88]	@ 0x58
c0de83b6:	a903      	add	r1, sp, #12
c0de83b8:	f7fc ffe7 	bl	c0de538a <nbgl_layoutAddQRCode>
c0de83bc:	6da0      	ldr	r0, [r4, #88]	@ 0x58
c0de83be:	4924      	ldr	r1, [pc, #144]	@ (c0de8450 <pageCallback+0x3a0>)
c0de83c0:	2216      	movs	r2, #22
c0de83c2:	2309      	movs	r3, #9
c0de83c4:	4479      	add	r1, pc
c0de83c6:	f7fd fc2a 	bl	c0de5c1e <nbgl_layoutAddFooter>
c0de83ca:	6da0      	ldr	r0, [r4, #88]	@ 0x58
c0de83cc:	f7fd ff6b 	bl	c0de62a6 <nbgl_layoutDraw>
c0de83d0:	f002 f993 	bl	c0dea6fa <nbgl_refresh>
c0de83d4:	e008      	b.n	c0de83e8 <pageCallback+0x338>
c0de83d6:	2c01      	cmp	r4, #1
c0de83d8:	d106      	bne.n	c0de83e8 <pageCallback+0x338>
c0de83da:	4448      	add	r0, r9
c0de83dc:	6840      	ldr	r0, [r0, #4]
c0de83de:	b118      	cbz	r0, c0de83e8 <pageCallback+0x338>
c0de83e0:	b014      	add	sp, #80	@ 0x50
c0de83e2:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de83e6:	4700      	bx	r0
c0de83e8:	b014      	add	sp, #80	@ 0x50
c0de83ea:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de83ee:	6a81      	ldr	r1, [r0, #40]	@ 0x28
c0de83f0:	7c80      	ldrb	r0, [r0, #18]
c0de83f2:	4420      	add	r0, r4
c0de83f4:	b2c0      	uxtb	r0, r0
c0de83f6:	4788      	blx	r1
c0de83f8:	e9d0 3100 	ldrd	r3, r1, [r0]
c0de83fc:	6882      	ldr	r2, [r0, #8]
c0de83fe:	4618      	mov	r0, r3
c0de8400:	b014      	add	sp, #80	@ 0x50
c0de8402:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de8406:	f000 bf3f 	b.w	c0de9288 <displayFullValuePage>
c0de840a:	eb09 0002 	add.w	r0, r9, r2
c0de840e:	f890 0089 	ldrb.w	r0, [r0, #137]	@ 0x89
c0de8412:	b120      	cbz	r0, c0de841e <pageCallback+0x36e>
c0de8414:	6948      	ldr	r0, [r1, #20]
c0de8416:	e003      	b.n	c0de8420 <pageCallback+0x370>
c0de8418:	b938      	cbnz	r0, c0de842a <pageCallback+0x37a>
c0de841a:	4620      	mov	r0, r4
c0de841c:	e68f      	b.n	c0de813e <pageCallback+0x8e>
c0de841e:	6988      	ldr	r0, [r1, #24]
c0de8420:	b014      	add	sp, #80	@ 0x50
c0de8422:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de8426:	f001 b91d 	b.w	c0de9664 <displayCustomizedSecurityReport>
c0de842a:	4620      	mov	r0, r4
c0de842c:	2100      	movs	r1, #0
c0de842e:	b014      	add	sp, #80	@ 0x50
c0de8430:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de8434:	f7ff ba32 	b.w	c0de789c <displaySettingsPage>
c0de8438:	0000197c 	.word	0x0000197c
c0de843c:	00001c34 	.word	0x00001c34
c0de8440:	00001cb0 	.word	0x00001cb0
c0de8444:	00001bb4 	.word	0x00001bb4
c0de8448:	0000627a 	.word	0x0000627a
c0de844c:	0000623a 	.word	0x0000623a
c0de8450:	00004522 	.word	0x00004522
c0de8454:	00006296 	.word	0x00006296
c0de8458:	00000527 	.word	0x00000527

c0de845c <nbgl_useCaseReviewStatus>:
c0de845c:	460a      	mov	r2, r1
c0de845e:	b198      	cbz	r0, c0de8488 <nbgl_useCaseReviewStatus+0x2c>
c0de8460:	2801      	cmp	r0, #1
c0de8462:	d016      	beq.n	c0de8492 <nbgl_useCaseReviewStatus+0x36>
c0de8464:	2802      	cmp	r0, #2
c0de8466:	d019      	beq.n	c0de849c <nbgl_useCaseReviewStatus+0x40>
c0de8468:	2803      	cmp	r0, #3
c0de846a:	d01c      	beq.n	c0de84a6 <nbgl_useCaseReviewStatus+0x4a>
c0de846c:	2804      	cmp	r0, #4
c0de846e:	d01f      	beq.n	c0de84b0 <nbgl_useCaseReviewStatus+0x54>
c0de8470:	2807      	cmp	r0, #7
c0de8472:	d022      	beq.n	c0de84ba <nbgl_useCaseReviewStatus+0x5e>
c0de8474:	2806      	cmp	r0, #6
c0de8476:	d025      	beq.n	c0de84c4 <nbgl_useCaseReviewStatus+0x68>
c0de8478:	2805      	cmp	r0, #5
c0de847a:	bf18      	it	ne
c0de847c:	4770      	bxne	lr
c0de847e:	4815      	ldr	r0, [pc, #84]	@ (c0de84d4 <nbgl_useCaseReviewStatus+0x78>)
c0de8480:	2100      	movs	r1, #0
c0de8482:	4478      	add	r0, pc
c0de8484:	f7ff bdba 	b.w	c0de7ffc <nbgl_useCaseStatus>
c0de8488:	4813      	ldr	r0, [pc, #76]	@ (c0de84d8 <nbgl_useCaseReviewStatus+0x7c>)
c0de848a:	2101      	movs	r1, #1
c0de848c:	4478      	add	r0, pc
c0de848e:	f7ff bdb5 	b.w	c0de7ffc <nbgl_useCaseStatus>
c0de8492:	4812      	ldr	r0, [pc, #72]	@ (c0de84dc <nbgl_useCaseReviewStatus+0x80>)
c0de8494:	2100      	movs	r1, #0
c0de8496:	4478      	add	r0, pc
c0de8498:	f7ff bdb0 	b.w	c0de7ffc <nbgl_useCaseStatus>
c0de849c:	4810      	ldr	r0, [pc, #64]	@ (c0de84e0 <nbgl_useCaseReviewStatus+0x84>)
c0de849e:	2101      	movs	r1, #1
c0de84a0:	4478      	add	r0, pc
c0de84a2:	f7ff bdab 	b.w	c0de7ffc <nbgl_useCaseStatus>
c0de84a6:	480f      	ldr	r0, [pc, #60]	@ (c0de84e4 <nbgl_useCaseReviewStatus+0x88>)
c0de84a8:	2100      	movs	r1, #0
c0de84aa:	4478      	add	r0, pc
c0de84ac:	f7ff bda6 	b.w	c0de7ffc <nbgl_useCaseStatus>
c0de84b0:	4807      	ldr	r0, [pc, #28]	@ (c0de84d0 <nbgl_useCaseReviewStatus+0x74>)
c0de84b2:	2101      	movs	r1, #1
c0de84b4:	4478      	add	r0, pc
c0de84b6:	f7ff bda1 	b.w	c0de7ffc <nbgl_useCaseStatus>
c0de84ba:	480c      	ldr	r0, [pc, #48]	@ (c0de84ec <nbgl_useCaseReviewStatus+0x90>)
c0de84bc:	2100      	movs	r1, #0
c0de84be:	4478      	add	r0, pc
c0de84c0:	f7ff bd9c 	b.w	c0de7ffc <nbgl_useCaseStatus>
c0de84c4:	4808      	ldr	r0, [pc, #32]	@ (c0de84e8 <nbgl_useCaseReviewStatus+0x8c>)
c0de84c6:	2101      	movs	r1, #1
c0de84c8:	4478      	add	r0, pc
c0de84ca:	f7ff bd97 	b.w	c0de7ffc <nbgl_useCaseStatus>
c0de84ce:	bf00      	nop
c0de84d0:	000040e8 	.word	0x000040e8
c0de84d4:	0000418e 	.word	0x0000418e
c0de84d8:	00004369 	.word	0x00004369
c0de84dc:	000048ba 	.word	0x000048ba
c0de84e0:	00004437 	.word	0x00004437
c0de84e4:	0000479b 	.word	0x0000479b
c0de84e8:	000042c7 	.word	0x000042c7
c0de84ec:	000040ef 	.word	0x000040ef

c0de84f0 <nbgl_useCaseChoice>:
c0de84f0:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de84f4:	b088      	sub	sp, #32
c0de84f6:	4683      	mov	fp, r0
c0de84f8:	4668      	mov	r0, sp
c0de84fa:	460e      	mov	r6, r1
c0de84fc:	2118      	movs	r1, #24
c0de84fe:	461c      	mov	r4, r3
c0de8500:	4617      	mov	r7, r2
c0de8502:	3008      	adds	r0, #8
c0de8504:	f002 fd38 	bl	c0deaf78 <__aeabi_memclr>
c0de8508:	b324      	cbz	r4, c0de8554 <nbgl_useCaseChoice+0x64>
c0de850a:	f8dd 8040 	ldr.w	r8, [sp, #64]	@ 0x40
c0de850e:	f1b8 0f00 	cmp.w	r8, #0
c0de8512:	d01f      	beq.n	c0de8554 <nbgl_useCaseChoice+0x64>
c0de8514:	4811      	ldr	r0, [pc, #68]	@ (c0de855c <nbgl_useCaseChoice+0x6c>)
c0de8516:	f8dd a044 	ldr.w	sl, [sp, #68]	@ 0x44
c0de851a:	eb09 0500 	add.w	r5, r9, r0
c0de851e:	f7ff f96b 	bl	c0de77f8 <reset_callbacks_and_context>
c0de8522:	2000      	movs	r0, #0
c0de8524:	f8c5 a018 	str.w	sl, [r5, #24]
c0de8528:	e9cd 6700 	strd	r6, r7, [sp]
c0de852c:	f8cd 8018 	str.w	r8, [sp, #24]
c0de8530:	9405      	str	r4, [sp, #20]
c0de8532:	f8cd b00c 	str.w	fp, [sp, #12]
c0de8536:	4669      	mov	r1, sp
c0de8538:	f88d 0011 	strb.w	r0, [sp, #17]
c0de853c:	2009      	movs	r0, #9
c0de853e:	f88d 001e 	strb.w	r0, [sp, #30]
c0de8542:	f88d 001c 	strb.w	r0, [sp, #28]
c0de8546:	4806      	ldr	r0, [pc, #24]	@ (c0de8560 <nbgl_useCaseChoice+0x70>)
c0de8548:	4478      	add	r0, pc
c0de854a:	f7fe fce5 	bl	c0de6f18 <nbgl_pageDrawConfirmation>
c0de854e:	6168      	str	r0, [r5, #20]
c0de8550:	f001 fc13 	bl	c0de9d7a <OUTLINED_FUNCTION_3>
c0de8554:	b008      	add	sp, #32
c0de8556:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de855a:	bf00      	nop
c0de855c:	00001c34 	.word	0x00001c34
c0de8560:	fffffb65 	.word	0xfffffb65

c0de8564 <layoutTouchCallback>:
c0de8564:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de8566:	b087      	sub	sp, #28
c0de8568:	2811      	cmp	r0, #17
c0de856a:	d01d      	beq.n	c0de85a8 <layoutTouchCallback+0x44>
c0de856c:	2812      	cmp	r0, #18
c0de856e:	d027      	beq.n	c0de85c0 <layoutTouchCallback+0x5c>
c0de8570:	2819      	cmp	r0, #25
c0de8572:	d02e      	beq.n	c0de85d2 <layoutTouchCallback+0x6e>
c0de8574:	2815      	cmp	r0, #21
c0de8576:	d13c      	bne.n	c0de85f2 <layoutTouchCallback+0x8e>
c0de8578:	2900      	cmp	r1, #0
c0de857a:	d047      	beq.n	c0de860c <layoutTouchCallback+0xa8>
c0de857c:	493e      	ldr	r1, [pc, #248]	@ (c0de8678 <layoutTouchCallback+0x114>)
c0de857e:	2400      	movs	r4, #0
c0de8580:	eb09 0201 	add.w	r2, r9, r1
c0de8584:	eb09 0501 	add.w	r5, r9, r1
c0de8588:	f882 4089 	strb.w	r4, [r2, #137]	@ 0x89
c0de858c:	6e10      	ldr	r0, [r2, #96]	@ 0x60
c0de858e:	f892 205c 	ldrb.w	r2, [r2, #92]	@ 0x5c
c0de8592:	2a00      	cmp	r2, #0
c0de8594:	d05f      	beq.n	c0de8656 <layoutTouchCallback+0xf2>
c0de8596:	f105 0368 	add.w	r3, r5, #104	@ 0x68
c0de859a:	6fed      	ldr	r5, [r5, #124]	@ 0x7c
c0de859c:	cb0e      	ldmia	r3, {r1, r2, r3}
c0de859e:	e9cd 5400 	strd	r5, r4, [sp]
c0de85a2:	f000 fbd7 	bl	c0de8d54 <useCaseReviewStreamingStart>
c0de85a6:	e064      	b.n	c0de8672 <layoutTouchCallback+0x10e>
c0de85a8:	4a33      	ldr	r2, [pc, #204]	@ (c0de8678 <layoutTouchCallback+0x114>)
c0de85aa:	2101      	movs	r1, #1
c0de85ac:	eb09 0002 	add.w	r0, r9, r2
c0de85b0:	f001 fbec 	bl	c0de9d8c <OUTLINED_FUNCTION_6>
c0de85b4:	d032      	beq.n	c0de861c <layoutTouchCallback+0xb8>
c0de85b6:	b007      	add	sp, #28
c0de85b8:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de85bc:	f000 bf42 	b.w	c0de9444 <displaySecurityReport>
c0de85c0:	482d      	ldr	r0, [pc, #180]	@ (c0de8678 <layoutTouchCallback+0x114>)
c0de85c2:	2118      	movs	r1, #24
c0de85c4:	eb09 0400 	add.w	r4, r9, r0
c0de85c8:	2001      	movs	r0, #1
c0de85ca:	f001 fc16 	bl	c0de9dfa <OUTLINED_FUNCTION_19>
c0de85ce:	6660      	str	r0, [r4, #100]	@ 0x64
c0de85d0:	e04f      	b.n	c0de8672 <layoutTouchCallback+0x10e>
c0de85d2:	4a29      	ldr	r2, [pc, #164]	@ (c0de8678 <layoutTouchCallback+0x114>)
c0de85d4:	eb09 0002 	add.w	r0, r9, r2
c0de85d8:	6f80      	ldr	r0, [r0, #120]	@ 0x78
c0de85da:	b349      	cbz	r1, c0de8630 <layoutTouchCallback+0xcc>
c0de85dc:	7801      	ldrb	r1, [r0, #0]
c0de85de:	f011 0f16 	tst.w	r1, #22
c0de85e2:	d101      	bne.n	c0de85e8 <layoutTouchCallback+0x84>
c0de85e4:	6940      	ldr	r0, [r0, #20]
c0de85e6:	b350      	cbz	r0, c0de863e <layoutTouchCallback+0xda>
c0de85e8:	b007      	add	sp, #28
c0de85ea:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de85ee:	f000 bac9 	b.w	c0de8b84 <displayInitialWarning>
c0de85f2:	2809      	cmp	r0, #9
c0de85f4:	d13d      	bne.n	c0de8672 <layoutTouchCallback+0x10e>
c0de85f6:	4821      	ldr	r0, [pc, #132]	@ (c0de867c <layoutTouchCallback+0x118>)
c0de85f8:	4448      	add	r0, r9
c0de85fa:	6982      	ldr	r2, [r0, #24]
c0de85fc:	b3ca      	cbz	r2, c0de8672 <layoutTouchCallback+0x10e>
c0de85fe:	fab1 f081 	clz	r0, r1
c0de8602:	0940      	lsrs	r0, r0, #5
c0de8604:	b007      	add	sp, #28
c0de8606:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de860a:	4710      	bx	r2
c0de860c:	481a      	ldr	r0, [pc, #104]	@ (c0de8678 <layoutTouchCallback+0x114>)
c0de860e:	4448      	add	r0, r9
c0de8610:	6fc1      	ldr	r1, [r0, #124]	@ 0x7c
c0de8612:	2000      	movs	r0, #0
c0de8614:	b007      	add	sp, #28
c0de8616:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de861a:	4708      	bx	r1
c0de861c:	eb09 0002 	add.w	r0, r9, r2
c0de8620:	2214      	movs	r2, #20
c0de8622:	f890 0089 	ldrb.w	r0, [r0, #137]	@ 0x89
c0de8626:	2800      	cmp	r0, #0
c0de8628:	bf08      	it	eq
c0de862a:	2218      	moveq	r2, #24
c0de862c:	5888      	ldr	r0, [r1, r2]
c0de862e:	e001      	b.n	c0de8634 <layoutTouchCallback+0xd0>
c0de8630:	6a80      	ldr	r0, [r0, #40]	@ 0x28
c0de8632:	6940      	ldr	r0, [r0, #20]
c0de8634:	b007      	add	sp, #28
c0de8636:	e8bd 40f0 	ldmia.w	sp!, {r4, r5, r6, r7, lr}
c0de863a:	f001 b813 	b.w	c0de9664 <displayCustomizedSecurityReport>
c0de863e:	eb09 0102 	add.w	r1, r9, r2
c0de8642:	2400      	movs	r4, #0
c0de8644:	eb09 0502 	add.w	r5, r9, r2
c0de8648:	f881 4089 	strb.w	r4, [r1, #137]	@ 0x89
c0de864c:	6e08      	ldr	r0, [r1, #96]	@ 0x60
c0de864e:	f891 105c 	ldrb.w	r1, [r1, #92]	@ 0x5c
c0de8652:	2900      	cmp	r1, #0
c0de8654:	d19f      	bne.n	c0de8596 <layoutTouchCallback+0x32>
c0de8656:	f105 0764 	add.w	r7, r5, #100	@ 0x64
c0de865a:	f8d5 c07c 	ldr.w	ip, [r5, #124]	@ 0x7c
c0de865e:	353c      	adds	r5, #60	@ 0x3c
c0de8660:	cfce      	ldmia	r7, {r1, r2, r3, r6, r7}
c0de8662:	e9cd 6700 	strd	r6, r7, [sp]
c0de8666:	e9cd 4404 	strd	r4, r4, [sp, #16]
c0de866a:	e9cd 5c02 	strd	r5, ip, [sp, #8]
c0de866e:	f000 f913 	bl	c0de8898 <useCaseReview>
c0de8672:	b007      	add	sp, #28
c0de8674:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de8676:	bf00      	nop
c0de8678:	0000197c 	.word	0x0000197c
c0de867c:	00001c34 	.word	0x00001c34

c0de8680 <nbgl_useCaseConfirm>:
c0de8680:	b570      	push	{r4, r5, r6, lr}
c0de8682:	b088      	sub	sp, #32
c0de8684:	4c0f      	ldr	r4, [pc, #60]	@ (c0de86c4 <nbgl_useCaseConfirm+0x44>)
c0de8686:	9e0c      	ldr	r6, [sp, #48]	@ 0x30
c0de8688:	f10d 0c14 	add.w	ip, sp, #20
c0de868c:	eb09 0504 	add.w	r5, r9, r4
c0de8690:	61ee      	str	r6, [r5, #28]
c0de8692:	4e0d      	ldr	r6, [pc, #52]	@ (c0de86c8 <nbgl_useCaseConfirm+0x48>)
c0de8694:	e8ac 004c 	stmia.w	ip!, {r2, r3, r6}
c0de8698:	2200      	movs	r2, #0
c0de869a:	9204      	str	r2, [sp, #16]
c0de869c:	4b0b      	ldr	r3, [pc, #44]	@ (c0de86cc <nbgl_useCaseConfirm+0x4c>)
c0de869e:	447b      	add	r3, pc
c0de86a0:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
c0de86a4:	6a28      	ldr	r0, [r5, #32]
c0de86a6:	b108      	cbz	r0, c0de86ac <nbgl_useCaseConfirm+0x2c>
c0de86a8:	f7fe fe97 	bl	c0de73da <nbgl_pageRelease>
c0de86ac:	4808      	ldr	r0, [pc, #32]	@ (c0de86d0 <nbgl_useCaseConfirm+0x50>)
c0de86ae:	4669      	mov	r1, sp
c0de86b0:	4478      	add	r0, pc
c0de86b2:	f7fe fc31 	bl	c0de6f18 <nbgl_pageDrawConfirmation>
c0de86b6:	eb09 0104 	add.w	r1, r9, r4
c0de86ba:	6208      	str	r0, [r1, #32]
c0de86bc:	f001 fb5d 	bl	c0de9d7a <OUTLINED_FUNCTION_3>
c0de86c0:	b008      	add	sp, #32
c0de86c2:	bd70      	pop	{r4, r5, r6, pc}
c0de86c4:	00001c34 	.word	0x00001c34
c0de86c8:	01090009 	.word	0x01090009
c0de86cc:	0000341e 	.word	0x0000341e
c0de86d0:	00000021 	.word	0x00000021

c0de86d4 <pageModalCallback>:
c0de86d4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0de86d6:	460c      	mov	r4, r1
c0de86d8:	280e      	cmp	r0, #14
c0de86da:	d008      	beq.n	c0de86ee <pageModalCallback+0x1a>
c0de86dc:	4605      	mov	r5, r0
c0de86de:	280f      	cmp	r0, #15
c0de86e0:	d117      	bne.n	c0de8712 <pageModalCallback+0x3e>
c0de86e2:	4832      	ldr	r0, [pc, #200]	@ (c0de87ac <pageModalCallback+0xd8>)
c0de86e4:	4448      	add	r0, r9
c0de86e6:	e9d0 2113 	ldrd	r2, r1, [r0, #76]	@ 0x4c
c0de86ea:	6d43      	ldr	r3, [r0, #84]	@ 0x54
c0de86ec:	e005      	b.n	c0de86fa <pageModalCallback+0x26>
c0de86ee:	482f      	ldr	r0, [pc, #188]	@ (c0de87ac <pageModalCallback+0xd8>)
c0de86f0:	4448      	add	r0, r9
c0de86f2:	6b40      	ldr	r0, [r0, #52]	@ 0x34
c0de86f4:	e9d0 2100 	ldrd	r2, r1, [r0]
c0de86f8:	6883      	ldr	r3, [r0, #8]
c0de86fa:	f852 0024 	ldr.w	r0, [r2, r4, lsl #2]
c0de86fe:	eb04 0244 	add.w	r2, r4, r4, lsl #1
c0de8702:	f851 1024 	ldr.w	r1, [r1, r4, lsl #2]
c0de8706:	eb03 02c2 	add.w	r2, r3, r2, lsl #3
c0de870a:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de870e:	f000 bdbb 	b.w	c0de9288 <displayFullValuePage>
c0de8712:	4e27      	ldr	r6, [pc, #156]	@ (c0de87b0 <pageModalCallback+0xdc>)
c0de8714:	eb09 0706 	add.w	r7, r9, r6
c0de8718:	6a38      	ldr	r0, [r7, #32]
c0de871a:	f7fe fe5e 	bl	c0de73da <nbgl_pageRelease>
c0de871e:	2000      	movs	r0, #0
c0de8720:	2d02      	cmp	r5, #2
c0de8722:	6238      	str	r0, [r7, #32]
c0de8724:	d032      	beq.n	c0de878c <pageModalCallback+0xb8>
c0de8726:	2d14      	cmp	r5, #20
c0de8728:	d00f      	beq.n	c0de874a <pageModalCallback+0x76>
c0de872a:	2d04      	cmp	r5, #4
c0de872c:	d01e      	beq.n	c0de876c <pageModalCallback+0x98>
c0de872e:	2d05      	cmp	r5, #5
c0de8730:	d024      	beq.n	c0de877c <pageModalCallback+0xa8>
c0de8732:	2d09      	cmp	r5, #9
c0de8734:	d029      	beq.n	c0de878a <pageModalCallback+0xb6>
c0de8736:	2d03      	cmp	r5, #3
c0de8738:	d137      	bne.n	c0de87aa <pageModalCallback+0xd6>
c0de873a:	2cff      	cmp	r4, #255	@ 0xff
c0de873c:	d026      	beq.n	c0de878c <pageModalCallback+0xb8>
c0de873e:	4620      	mov	r0, r4
c0de8740:	2100      	movs	r1, #0
c0de8742:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de8746:	f001 b8fd 	b.w	c0de9944 <displayDetailsPage>
c0de874a:	4818      	ldr	r0, [pc, #96]	@ (c0de87ac <pageModalCallback+0xd8>)
c0de874c:	eb09 0100 	add.w	r1, r9, r0
c0de8750:	f891 1088 	ldrb.w	r1, [r1, #136]	@ 0x88
c0de8754:	2902      	cmp	r1, #2
c0de8756:	d119      	bne.n	c0de878c <pageModalCallback+0xb8>
c0de8758:	4448      	add	r0, r9
c0de875a:	2101      	movs	r1, #1
c0de875c:	f880 1088 	strb.w	r1, [r0, #136]	@ 0x88
c0de8760:	6f80      	ldr	r0, [r0, #120]	@ 0x78
c0de8762:	6800      	ldr	r0, [r0, #0]
c0de8764:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de8768:	f000 be6c 	b.w	c0de9444 <displaySecurityReport>
c0de876c:	2cff      	cmp	r4, #255	@ 0xff
c0de876e:	d00d      	beq.n	c0de878c <pageModalCallback+0xb8>
c0de8770:	4620      	mov	r0, r4
c0de8772:	2100      	movs	r1, #0
c0de8774:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de8778:	f001 b9b6 	b.w	c0de9ae8 <displayTagValueListModalPage>
c0de877c:	b934      	cbnz	r4, c0de878c <pageModalCallback+0xb8>
c0de877e:	20ff      	movs	r0, #255	@ 0xff
c0de8780:	2101      	movs	r1, #1
c0de8782:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de8786:	f7ff b9cf 	b.w	c0de7b28 <displayGenericContextPage>
c0de878a:	b12c      	cbz	r4, c0de8798 <pageModalCallback+0xc4>
c0de878c:	f001 ffdd 	bl	c0dea74a <nbgl_screenRedraw>
c0de8790:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
c0de8794:	f001 bfb1 	b.w	c0dea6fa <nbgl_refresh>
c0de8798:	eb09 0006 	add.w	r0, r9, r6
c0de879c:	69c0      	ldr	r0, [r0, #28]
c0de879e:	b120      	cbz	r0, c0de87aa <pageModalCallback+0xd6>
c0de87a0:	4780      	blx	r0
c0de87a2:	eb09 0006 	add.w	r0, r9, r6
c0de87a6:	2100      	movs	r1, #0
c0de87a8:	61c1      	str	r1, [r0, #28]
c0de87aa:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
c0de87ac:	0000197c 	.word	0x0000197c
c0de87b0:	00001c34 	.word	0x00001c34

c0de87b4 <displayReviewPage>:
c0de87b4:	b570      	push	{r4, r5, r6, lr}
c0de87b6:	b090      	sub	sp, #64	@ 0x40
c0de87b8:	460c      	mov	r4, r1
c0de87ba:	4605      	mov	r5, r0
c0de87bc:	4668      	mov	r0, sp
c0de87be:	2140      	movs	r1, #64	@ 0x40
c0de87c0:	f002 fbda 	bl	c0deaf78 <__aeabi_memclr>
c0de87c4:	4e28      	ldr	r6, [pc, #160]	@ (c0de8868 <displayReviewPage+0xb4>)
c0de87c6:	eb09 0006 	add.w	r0, r9, r6
c0de87ca:	f890 0061 	ldrb.w	r0, [r0, #97]	@ 0x61
c0de87ce:	b108      	cbz	r0, c0de87d4 <displayReviewPage+0x20>
c0de87d0:	42a8      	cmp	r0, r5
c0de87d2:	d947      	bls.n	c0de8864 <displayReviewPage+0xb0>
c0de87d4:	eb09 0006 	add.w	r0, r9, r6
c0de87d8:	6882      	ldr	r2, [r0, #8]
c0de87da:	f880 5060 	strb.w	r5, [r0, #96]	@ 0x60
c0de87de:	2a00      	cmp	r2, #0
c0de87e0:	d040      	beq.n	c0de8864 <displayReviewPage+0xb0>
c0de87e2:	4669      	mov	r1, sp
c0de87e4:	4628      	mov	r0, r5
c0de87e6:	4790      	blx	r2
c0de87e8:	b3e0      	cbz	r0, c0de8864 <displayReviewPage+0xb0>
c0de87ea:	2009      	movs	r0, #9
c0de87ec:	2100      	movs	r1, #0
c0de87ee:	f88d 0006 	strb.w	r0, [sp, #6]
c0de87f2:	f89d 000c 	ldrb.w	r0, [sp, #12]
c0de87f6:	f88d 1004 	strb.w	r1, [sp, #4]
c0de87fa:	9100      	str	r1, [sp, #0]
c0de87fc:	2806      	cmp	r0, #6
c0de87fe:	d010      	beq.n	c0de8822 <displayReviewPage+0x6e>
c0de8800:	2804      	cmp	r0, #4
c0de8802:	d014      	beq.n	c0de882e <displayReviewPage+0x7a>
c0de8804:	2805      	cmp	r0, #5
c0de8806:	d016      	beq.n	c0de8836 <displayReviewPage+0x82>
c0de8808:	2802      	cmp	r0, #2
c0de880a:	d11b      	bne.n	c0de8844 <displayReviewPage+0x90>
c0de880c:	eb09 0006 	add.w	r0, r9, r6
c0de8810:	f890 1060 	ldrb.w	r1, [r0, #96]	@ 0x60
c0de8814:	3101      	adds	r1, #1
c0de8816:	f880 1061 	strb.w	r1, [r0, #97]	@ 0x61
c0de881a:	200b      	movs	r0, #11
c0de881c:	f88d 001c 	strb.w	r0, [sp, #28]
c0de8820:	e010      	b.n	c0de8844 <displayReviewPage+0x90>
c0de8822:	200b      	movs	r0, #11
c0de8824:	f88d 101d 	strb.w	r1, [sp, #29]
c0de8828:	f88d 0038 	strb.w	r0, [sp, #56]	@ 0x38
c0de882c:	e00a      	b.n	c0de8844 <displayReviewPage+0x90>
c0de882e:	2000      	movs	r0, #0
c0de8830:	f88d 001d 	strb.w	r0, [sp, #29]
c0de8834:	e006      	b.n	c0de8844 <displayReviewPage+0x90>
c0de8836:	2000      	movs	r0, #0
c0de8838:	f88d 001d 	strb.w	r0, [sp, #29]
c0de883c:	f640 1001 	movw	r0, #2305	@ 0x901
c0de8840:	f8ad 001a 	strh.w	r0, [sp, #26]
c0de8844:	4809      	ldr	r0, [pc, #36]	@ (c0de886c <displayReviewPage+0xb8>)
c0de8846:	eb09 0506 	add.w	r5, r9, r6
c0de884a:	466a      	mov	r2, sp
c0de884c:	f105 0160 	add.w	r1, r5, #96	@ 0x60
c0de8850:	4478      	add	r0, pc
c0de8852:	f7fe fdbf 	bl	c0de73d4 <nbgl_pageDrawGenericContent>
c0de8856:	6168      	str	r0, [r5, #20]
c0de8858:	2001      	movs	r0, #1
c0de885a:	2c00      	cmp	r4, #0
c0de885c:	bf18      	it	ne
c0de885e:	2002      	movne	r0, #2
c0de8860:	f001 ff50 	bl	c0dea704 <nbgl_refreshSpecial>
c0de8864:	b010      	add	sp, #64	@ 0x40
c0de8866:	bd70      	pop	{r4, r5, r6, pc}
c0de8868:	00001c34 	.word	0x00001c34
c0de886c:	fffff85d 	.word	0xfffff85d

c0de8870 <nbgl_useCaseReview>:
c0de8870:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de8872:	b087      	sub	sp, #28
c0de8874:	f001 fa70 	bl	c0de9d58 <OUTLINED_FUNCTION_0>
c0de8878:	2001      	movs	r0, #1
c0de887a:	990e      	ldr	r1, [sp, #56]	@ 0x38
c0de887c:	462a      	mov	r2, r5
c0de887e:	4623      	mov	r3, r4
c0de8880:	9005      	str	r0, [sp, #20]
c0de8882:	2000      	movs	r0, #0
c0de8884:	e9cd 0102 	strd	r0, r1, [sp, #8]
c0de8888:	9004      	str	r0, [sp, #16]
c0de888a:	980d      	ldr	r0, [sp, #52]	@ 0x34
c0de888c:	4631      	mov	r1, r6
c0de888e:	f001 fa83 	bl	c0de9d98 <OUTLINED_FUNCTION_8>
c0de8892:	b007      	add	sp, #28
c0de8894:	bdf0      	pop	{r4, r5, r6, r7, pc}
	...

c0de8898 <useCaseReview>:
c0de8898:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de889c:	4688      	mov	r8, r1
c0de889e:	4682      	mov	sl, r0
c0de88a0:	4840      	ldr	r0, [pc, #256]	@ (c0de89a4 <useCaseReview+0x10c>)
c0de88a2:	4941      	ldr	r1, [pc, #260]	@ (c0de89a8 <useCaseReview+0x110>)
c0de88a4:	4614      	mov	r4, r2
c0de88a6:	2202      	movs	r2, #2
c0de88a8:	f04f 0b00 	mov.w	fp, #0
c0de88ac:	4e40      	ldr	r6, [pc, #256]	@ (c0de89b0 <useCaseReview+0x118>)
c0de88ae:	461f      	mov	r7, r3
c0de88b0:	f849 a000 	str.w	sl, [r9, r0]
c0de88b4:	f809 2001 	strb.w	r2, [r9, r1]
c0de88b8:	4448      	add	r0, r9
c0de88ba:	eb09 0506 	add.w	r5, r9, r6
c0de88be:	9a0d      	ldr	r2, [sp, #52]	@ 0x34
c0de88c0:	6042      	str	r2, [r0, #4]
c0de88c2:	eb09 0001 	add.w	r0, r9, r1
c0de88c6:	493b      	ldr	r1, [pc, #236]	@ (c0de89b4 <useCaseReview+0x11c>)
c0de88c8:	f8c0 b010 	str.w	fp, [r0, #16]
c0de88cc:	4479      	add	r1, pc
c0de88ce:	6181      	str	r1, [r0, #24]
c0de88d0:	4836      	ldr	r0, [pc, #216]	@ (c0de89ac <useCaseReview+0x114>)
c0de88d2:	2103      	movs	r1, #3
c0de88d4:	4448      	add	r0, r9
c0de88d6:	7301      	strb	r1, [r0, #12]
c0de88d8:	6085      	str	r5, [r0, #8]
c0de88da:	4628      	mov	r0, r5
c0de88dc:	21a8      	movs	r1, #168	@ 0xa8
c0de88de:	f002 fb4b 	bl	c0deaf78 <__aeabi_memclr>
c0de88e2:	2001      	movs	r0, #1
c0de88e4:	f8a5 b024 	strh.w	fp, [r5, #36]	@ 0x24
c0de88e8:	f809 0006 	strb.w	r0, [r9, r6]
c0de88ec:	4832      	ldr	r0, [pc, #200]	@ (c0de89b8 <useCaseReview+0x120>)
c0de88ee:	4478      	add	r0, pc
c0de88f0:	6228      	str	r0, [r5, #32]
c0de88f2:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de88f4:	616f      	str	r7, [r5, #20]
c0de88f6:	9401      	str	r4, [sp, #4]
c0de88f8:	60ac      	str	r4, [r5, #8]
c0de88fa:	f885 b004 	strb.w	fp, [r5, #4]
c0de88fe:	61e8      	str	r0, [r5, #28]
c0de8900:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0de8902:	f001 f995 	bl	c0de9c30 <initWarningTipBox>
c0de8906:	2004      	movs	r0, #4
c0de8908:	4641      	mov	r1, r8
c0de890a:	f885 0038 	strb.w	r0, [r5, #56]	@ 0x38
c0de890e:	f105 003c 	add.w	r0, r5, #60	@ 0x3c
c0de8912:	e891 00dc 	ldmia.w	r1, {r2, r3, r4, r6, r7}
c0de8916:	c0dc      	stmia	r0!, {r2, r3, r4, r6, r7}
c0de8918:	f8d8 0010 	ldr.w	r0, [r8, #16]
c0de891c:	66e8      	str	r0, [r5, #108]	@ 0x6c
c0de891e:	e9dd 050e 	ldrd	r0, r5, [sp, #56]	@ 0x38
c0de8922:	9b0b      	ldr	r3, [sp, #44]	@ 0x2c
c0de8924:	b190      	cbz	r0, c0de894c <useCaseReview+0xb4>
c0de8926:	4922      	ldr	r1, [pc, #136]	@ (c0de89b0 <useCaseReview+0x118>)
c0de8928:	2203      	movs	r2, #3
c0de892a:	eb09 0001 	add.w	r0, r9, r1
c0de892e:	f880 2070 	strb.w	r2, [r0, #112]	@ 0x70
c0de8932:	9a01      	ldr	r2, [sp, #4]
c0de8934:	b343      	cbz	r3, c0de8988 <useCaseReview+0xf0>
c0de8936:	eb09 0001 	add.w	r0, r9, r1
c0de893a:	210b      	movs	r1, #11
c0de893c:	f880 1080 	strb.w	r1, [r0, #128]	@ 0x80
c0de8940:	4921      	ldr	r1, [pc, #132]	@ (c0de89c8 <useCaseReview+0x130>)
c0de8942:	e9c0 321d 	strd	r3, r2, [r0, #116]	@ 0x74
c0de8946:	4479      	add	r1, pc
c0de8948:	67c1      	str	r1, [r0, #124]	@ 0x7c
c0de894a:	e00a      	b.n	c0de8962 <useCaseReview+0xca>
c0de894c:	4818      	ldr	r0, [pc, #96]	@ (c0de89b0 <useCaseReview+0x118>)
c0de894e:	2102      	movs	r1, #2
c0de8950:	9a01      	ldr	r2, [sp, #4]
c0de8952:	4448      	add	r0, r9
c0de8954:	f880 1070 	strb.w	r1, [r0, #112]	@ 0x70
c0de8958:	f100 0174 	add.w	r1, r0, #116	@ 0x74
c0de895c:	4650      	mov	r0, sl
c0de895e:	f000 fa69 	bl	c0de8e34 <prepareReviewLastPage>
c0de8962:	f3ca 1000 	ubfx	r0, sl, #4, #1
c0de8966:	f7ff f825 	bl	c0de79b4 <getNbPagesForGenericContents>
c0de896a:	4a18      	ldr	r2, [pc, #96]	@ (c0de89cc <useCaseReview+0x134>)
c0de896c:	4601      	mov	r1, r0
c0de896e:	2001      	movs	r0, #1
c0de8970:	447a      	add	r2, pc
c0de8972:	f7fe ff57 	bl	c0de7824 <prepareNavInfo>
c0de8976:	b10d      	cbz	r5, c0de897c <useCaseReview+0xe4>
c0de8978:	f001 fa05 	bl	c0de9d86 <OUTLINED_FUNCTION_5>
c0de897c:	2000      	movs	r0, #0
c0de897e:	2101      	movs	r1, #1
c0de8980:	e8bd 4dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de8984:	f7ff b8d0 	b.w	c0de7b28 <displayGenericContextPage>
c0de8988:	f01a 0007 	ands.w	r0, sl, #7
c0de898c:	d004      	beq.n	c0de8998 <useCaseReview+0x100>
c0de898e:	2801      	cmp	r0, #1
c0de8990:	d105      	bne.n	c0de899e <useCaseReview+0x106>
c0de8992:	4b0b      	ldr	r3, [pc, #44]	@ (c0de89c0 <useCaseReview+0x128>)
c0de8994:	447b      	add	r3, pc
c0de8996:	e7ce      	b.n	c0de8936 <useCaseReview+0x9e>
c0de8998:	4b08      	ldr	r3, [pc, #32]	@ (c0de89bc <useCaseReview+0x124>)
c0de899a:	447b      	add	r3, pc
c0de899c:	e7cb      	b.n	c0de8936 <useCaseReview+0x9e>
c0de899e:	4b09      	ldr	r3, [pc, #36]	@ (c0de89c4 <useCaseReview+0x12c>)
c0de89a0:	447b      	add	r3, pc
c0de89a2:	e7c8      	b.n	c0de8936 <useCaseReview+0x9e>
c0de89a4:	00001cb0 	.word	0x00001cb0
c0de89a8:	00001c34 	.word	0x00001c34
c0de89ac:	0000197c 	.word	0x0000197c
c0de89b0:	00001a0c 	.word	0x00001a0c
c0de89b4:	00001341 	.word	0x00001341
c0de89b8:	00004568 	.word	0x00004568
c0de89bc:	00003f52 	.word	0x00003f52
c0de89c0:	00003f27 	.word	0x00003f27
c0de89c4:	000043f1 	.word	0x000043f1
c0de89c8:	00003ca4 	.word	0x00003ca4
c0de89cc:	00003cb3 	.word	0x00003cb3

c0de89d0 <nbgl_useCaseReviewBlindSigning>:
c0de89d0:	b510      	push	{r4, lr}
c0de89d2:	b086      	sub	sp, #24
c0de89d4:	9c0b      	ldr	r4, [sp, #44]	@ 0x2c
c0de89d6:	9404      	str	r4, [sp, #16]
c0de89d8:	4c06      	ldr	r4, [pc, #24]	@ (c0de89f4 <nbgl_useCaseReviewBlindSigning+0x24>)
c0de89da:	447c      	add	r4, pc
c0de89dc:	9403      	str	r4, [sp, #12]
c0de89de:	9c0a      	ldr	r4, [sp, #40]	@ 0x28
c0de89e0:	9402      	str	r4, [sp, #8]
c0de89e2:	9c09      	ldr	r4, [sp, #36]	@ 0x24
c0de89e4:	9401      	str	r4, [sp, #4]
c0de89e6:	9c08      	ldr	r4, [sp, #32]
c0de89e8:	9400      	str	r4, [sp, #0]
c0de89ea:	f000 f805 	bl	c0de89f8 <nbgl_useCaseAdvancedReview>
c0de89ee:	b006      	add	sp, #24
c0de89f0:	bd10      	pop	{r4, pc}
c0de89f2:	bf00      	nop
c0de89f4:	000059ca 	.word	0x000059ca

c0de89f8 <nbgl_useCaseAdvancedReview>:
c0de89f8:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de89fc:	b088      	sub	sp, #32
c0de89fe:	e9cd 2306 	strd	r2, r3, [sp, #24]
c0de8a02:	4688      	mov	r8, r1
c0de8a04:	4606      	mov	r6, r0
c0de8a06:	f7fe fef7 	bl	c0de77f8 <reset_callbacks_and_context>
c0de8a0a:	e9dd ba12 	ldrd	fp, sl, [sp, #72]	@ 0x48
c0de8a0e:	9f14      	ldr	r7, [sp, #80]	@ 0x50
c0de8a10:	e9dd e410 	ldrd	lr, r4, [sp, #64]	@ 0x40
c0de8a14:	f1bb 0f00 	cmp.w	fp, #0
c0de8a18:	d008      	beq.n	c0de8a2c <nbgl_useCaseAdvancedReview+0x34>
c0de8a1a:	482b      	ldr	r0, [pc, #172]	@ (c0de8ac8 <nbgl_useCaseAdvancedReview+0xd0>)
c0de8a1c:	4659      	mov	r1, fp
c0de8a1e:	2220      	movs	r2, #32
c0de8a20:	4675      	mov	r5, lr
c0de8a22:	4448      	add	r0, r9
c0de8a24:	303c      	adds	r0, #60	@ 0x3c
c0de8a26:	f002 fa9d 	bl	c0deaf64 <__aeabi_memcpy>
c0de8a2a:	46ae      	mov	lr, r5
c0de8a2c:	e9dd 2306 	ldrd	r2, r3, [sp, #24]
c0de8a30:	f1ba 0f00 	cmp.w	sl, #0
c0de8a34:	d039      	beq.n	c0de8aaa <nbgl_useCaseAdvancedReview+0xb2>
c0de8a36:	f8da 0000 	ldr.w	r0, [sl]
c0de8a3a:	2808      	cmp	r0, #8
c0de8a3c:	d00a      	beq.n	c0de8a54 <nbgl_useCaseAdvancedReview+0x5c>
c0de8a3e:	b960      	cbnz	r0, c0de8a5a <nbgl_useCaseAdvancedReview+0x62>
c0de8a40:	f8da 0014 	ldr.w	r0, [sl, #20]
c0de8a44:	b958      	cbnz	r0, c0de8a5e <nbgl_useCaseAdvancedReview+0x66>
c0de8a46:	f8da 0018 	ldr.w	r0, [sl, #24]
c0de8a4a:	b940      	cbnz	r0, c0de8a5e <nbgl_useCaseAdvancedReview+0x66>
c0de8a4c:	f8da 0028 	ldr.w	r0, [sl, #40]	@ 0x28
c0de8a50:	b928      	cbnz	r0, c0de8a5e <nbgl_useCaseAdvancedReview+0x66>
c0de8a52:	e02a      	b.n	c0de8aaa <nbgl_useCaseAdvancedReview+0xb2>
c0de8a54:	f046 0680 	orr.w	r6, r6, #128	@ 0x80
c0de8a58:	e001      	b.n	c0de8a5e <nbgl_useCaseAdvancedReview+0x66>
c0de8a5a:	f046 0640 	orr.w	r6, r6, #64	@ 0x40
c0de8a5e:	481a      	ldr	r0, [pc, #104]	@ (c0de8ac8 <nbgl_useCaseAdvancedReview+0xd0>)
c0de8a60:	2500      	movs	r5, #0
c0de8a62:	4448      	add	r0, r9
c0de8a64:	f100 0168 	add.w	r1, r0, #104	@ 0x68
c0de8a68:	f880 505c 	strb.w	r5, [r0, #92]	@ 0x5c
c0de8a6c:	2501      	movs	r5, #1
c0de8a6e:	e9c0 6818 	strd	r6, r8, [r0, #96]	@ 0x60
c0de8a72:	e9c0 4a1d 	strd	r4, sl, [r0, #116]	@ 0x74
c0de8a76:	67c7      	str	r7, [r0, #124]	@ 0x7c
c0de8a78:	e8a1 400c 	stmia.w	r1!, {r2, r3, lr}
c0de8a7c:	f880 508c 	strb.w	r5, [r0, #140]	@ 0x8c
c0de8a80:	f8da 0028 	ldr.w	r0, [sl, #40]	@ 0x28
c0de8a84:	b120      	cbz	r0, c0de8a90 <nbgl_useCaseAdvancedReview+0x98>
c0de8a86:	b008      	add	sp, #32
c0de8a88:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de8a8c:	f000 b81e 	b.w	c0de8acc <displayPrelude>
c0de8a90:	f89a 0000 	ldrb.w	r0, [sl]
c0de8a94:	f010 0f16 	tst.w	r0, #22
c0de8a98:	d102      	bne.n	c0de8aa0 <nbgl_useCaseAdvancedReview+0xa8>
c0de8a9a:	f8da 0014 	ldr.w	r0, [sl, #20]
c0de8a9e:	b120      	cbz	r0, c0de8aaa <nbgl_useCaseAdvancedReview+0xb2>
c0de8aa0:	b008      	add	sp, #32
c0de8aa2:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de8aa6:	f000 b86d 	b.w	c0de8b84 <displayInitialWarning>
c0de8aaa:	2001      	movs	r0, #1
c0de8aac:	2500      	movs	r5, #0
c0de8aae:	4641      	mov	r1, r8
c0de8ab0:	e9cd e400 	strd	lr, r4, [sp]
c0de8ab4:	e9cd b702 	strd	fp, r7, [sp, #8]
c0de8ab8:	e9cd 5004 	strd	r5, r0, [sp, #16]
c0de8abc:	4630      	mov	r0, r6
c0de8abe:	f7ff feeb 	bl	c0de8898 <useCaseReview>
c0de8ac2:	b008      	add	sp, #32
c0de8ac4:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de8ac8:	0000197c 	.word	0x0000197c

c0de8acc <displayPrelude>:
c0de8acc:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de8ad0:	b09a      	sub	sp, #104	@ 0x68
c0de8ad2:	4929      	ldr	r1, [pc, #164]	@ (c0de8b78 <displayPrelude+0xac>)
c0de8ad4:	2009      	movs	r0, #9
c0de8ad6:	f04f 0c00 	mov.w	ip, #0
c0de8ada:	f10d 0828 	add.w	r8, sp, #40	@ 0x28
c0de8ade:	f88d 004a 	strb.w	r0, [sp, #74]	@ 0x4a
c0de8ae2:	2019      	movs	r0, #25
c0de8ae4:	f8cd c044 	str.w	ip, [sp, #68]	@ 0x44
c0de8ae8:	eb09 0501 	add.w	r5, r9, r1
c0de8aec:	f8ad 0048 	strh.w	r0, [sp, #72]	@ 0x48
c0de8af0:	6fa9      	ldr	r1, [r5, #120]	@ 0x78
c0de8af2:	6a89      	ldr	r1, [r1, #40]	@ 0x28
c0de8af4:	e9d1 2103 	ldrd	r2, r1, [r1, #12]
c0de8af8:	e9cd 210f 	strd	r2, r1, [sp, #60]	@ 0x3c
c0de8afc:	4642      	mov	r2, r8
c0de8afe:	491f      	ldr	r1, [pc, #124]	@ (c0de8b7c <displayPrelude+0xb0>)
c0de8b00:	4479      	add	r1, pc
c0de8b02:	e891 00d9 	ldmia.w	r1, {r0, r3, r4, r6, r7}
c0de8b06:	c2d9      	stmia	r2!, {r0, r3, r4, r6, r7}
c0de8b08:	2001      	movs	r0, #1
c0de8b0a:	f885 0089 	strb.w	r0, [r5, #137]	@ 0x89
c0de8b0e:	481c      	ldr	r0, [pc, #112]	@ (c0de8b80 <displayPrelude+0xb4>)
c0de8b10:	f8cd c05c 	str.w	ip, [sp, #92]	@ 0x5c
c0de8b14:	f8cd c050 	str.w	ip, [sp, #80]	@ 0x50
c0de8b18:	4478      	add	r0, pc
c0de8b1a:	9016      	str	r0, [sp, #88]	@ 0x58
c0de8b1c:	f44f 7080 	mov.w	r0, #256	@ 0x100
c0de8b20:	f8ad 004c 	strh.w	r0, [sp, #76]	@ 0x4c
c0de8b24:	a813      	add	r0, sp, #76	@ 0x4c
c0de8b26:	f7fa fb4d 	bl	c0de31c4 <nbgl_layoutGet>
c0de8b2a:	4641      	mov	r1, r8
c0de8b2c:	f8c5 0080 	str.w	r0, [r5, #128]	@ 0x80
c0de8b30:	f7fd f89c 	bl	c0de5c6c <nbgl_layoutAddHeader>
c0de8b34:	ac01      	add	r4, sp, #4
c0de8b36:	2124      	movs	r1, #36	@ 0x24
c0de8b38:	4620      	mov	r0, r4
c0de8b3a:	f002 fa1d 	bl	c0deaf78 <__aeabi_memclr>
c0de8b3e:	6fa9      	ldr	r1, [r5, #120]	@ 0x78
c0de8b40:	f8d5 0080 	ldr.w	r0, [r5, #128]	@ 0x80
c0de8b44:	6a89      	ldr	r1, [r1, #40]	@ 0x28
c0de8b46:	e9d1 2300 	ldrd	r2, r3, [r1]
c0de8b4a:	6889      	ldr	r1, [r1, #8]
c0de8b4c:	9107      	str	r1, [sp, #28]
c0de8b4e:	4621      	mov	r1, r4
c0de8b50:	9202      	str	r2, [sp, #8]
c0de8b52:	9305      	str	r3, [sp, #20]
c0de8b54:	f7fc fc10 	bl	c0de5378 <nbgl_layoutAddContentCenter>
c0de8b58:	f8d5 0080 	ldr.w	r0, [r5, #128]	@ 0x80
c0de8b5c:	a90f      	add	r1, sp, #60	@ 0x3c
c0de8b5e:	f7fc fd79 	bl	c0de5654 <nbgl_layoutAddChoiceButtons>
c0de8b62:	f001 f910 	bl	c0de9d86 <OUTLINED_FUNCTION_5>
c0de8b66:	f8d5 0080 	ldr.w	r0, [r5, #128]	@ 0x80
c0de8b6a:	f7fd fb9c 	bl	c0de62a6 <nbgl_layoutDraw>
c0de8b6e:	f001 fdc4 	bl	c0dea6fa <nbgl_refresh>
c0de8b72:	b01a      	add	sp, #104	@ 0x68
c0de8b74:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de8b78:	0000197c 	.word	0x0000197c
c0de8b7c:	000059ec 	.word	0x000059ec
c0de8b80:	fffffa49 	.word	0xfffffa49

c0de8b84 <displayInitialWarning>:
c0de8b84:	b5f0      	push	{r4, r5, r6, r7, lr}
c0de8b86:	b099      	sub	sp, #100	@ 0x64
c0de8b88:	4860      	ldr	r0, [pc, #384]	@ (c0de8d0c <displayInitialWarning+0x188>)
c0de8b8a:	a90e      	add	r1, sp, #56	@ 0x38
c0de8b8c:	4478      	add	r0, pc
c0de8b8e:	e890 003c 	ldmia.w	r0, {r2, r3, r4, r5}
c0de8b92:	c13c      	stmia	r1!, {r2, r3, r4, r5}
c0de8b94:	485e      	ldr	r0, [pc, #376]	@ (c0de8d10 <displayInitialWarning+0x18c>)
c0de8b96:	ac09      	add	r4, sp, #36	@ 0x24
c0de8b98:	4621      	mov	r1, r4
c0de8b9a:	4478      	add	r0, pc
c0de8b9c:	e890 00ec 	ldmia.w	r0, {r2, r3, r5, r6, r7}
c0de8ba0:	c1ec      	stmia	r1!, {r2, r3, r5, r6, r7}
c0de8ba2:	4d58      	ldr	r5, [pc, #352]	@ (c0de8d04 <displayInitialWarning+0x180>)
c0de8ba4:	eb09 0705 	add.w	r7, r9, r5
c0de8ba8:	6fb8      	ldr	r0, [r7, #120]	@ 0x78
c0de8baa:	6806      	ldr	r6, [r0, #0]
c0de8bac:	2001      	movs	r0, #1
c0de8bae:	f887 0089 	strb.w	r0, [r7, #137]	@ 0x89
c0de8bb2:	4858      	ldr	r0, [pc, #352]	@ (c0de8d14 <displayInitialWarning+0x190>)
c0de8bb4:	4478      	add	r0, pc
c0de8bb6:	9015      	str	r0, [sp, #84]	@ 0x54
c0de8bb8:	f44f 7080 	mov.w	r0, #256	@ 0x100
c0de8bbc:	f8ad 0048 	strh.w	r0, [sp, #72]	@ 0x48
c0de8bc0:	2000      	movs	r0, #0
c0de8bc2:	9016      	str	r0, [sp, #88]	@ 0x58
c0de8bc4:	9013      	str	r0, [sp, #76]	@ 0x4c
c0de8bc6:	a812      	add	r0, sp, #72	@ 0x48
c0de8bc8:	f7fa fafc 	bl	c0de31c4 <nbgl_layoutGet>
c0de8bcc:	4621      	mov	r1, r4
c0de8bce:	f8c7 0080 	str.w	r0, [r7, #128]	@ 0x80
c0de8bd2:	f7fd f84b 	bl	c0de5c6c <nbgl_layoutAddHeader>
c0de8bd6:	f026 0139 	bic.w	r1, r6, #57	@ 0x39
c0de8bda:	f026 0009 	bic.w	r0, r6, #9
c0de8bde:	2800      	cmp	r0, #0
c0de8be0:	fab1 f181 	clz	r1, r1
c0de8be4:	bf18      	it	ne
c0de8be6:	2001      	movne	r0, #1
c0de8be8:	0949      	lsrs	r1, r1, #5
c0de8bea:	ea00 0401 	and.w	r4, r0, r1
c0de8bee:	6fb8      	ldr	r0, [r7, #120]	@ 0x78
c0de8bf0:	6801      	ldr	r1, [r0, #0]
c0de8bf2:	b139      	cbz	r1, c0de8c04 <displayInitialWarning+0x80>
c0de8bf4:	4848      	ldr	r0, [pc, #288]	@ (c0de8d18 <displayInitialWarning+0x194>)
c0de8bf6:	4949      	ldr	r1, [pc, #292]	@ (c0de8d1c <displayInitialWarning+0x198>)
c0de8bf8:	2c00      	cmp	r4, #0
c0de8bfa:	4479      	add	r1, pc
c0de8bfc:	4478      	add	r0, pc
c0de8bfe:	bf18      	it	ne
c0de8c00:	4601      	movne	r1, r0
c0de8c02:	e001      	b.n	c0de8c08 <displayInitialWarning+0x84>
c0de8c04:	6a01      	ldr	r1, [r0, #32]
c0de8c06:	b139      	cbz	r1, c0de8c18 <displayInitialWarning+0x94>
c0de8c08:	eb09 0005 	add.w	r0, r9, r5
c0de8c0c:	2211      	movs	r2, #17
c0de8c0e:	2309      	movs	r3, #9
c0de8c10:	f8d0 0080 	ldr.w	r0, [r0, #128]	@ 0x80
c0de8c14:	f7fb f89a 	bl	c0de3d4c <nbgl_layoutAddTopRightButton>
c0de8c18:	eb09 0005 	add.w	r0, r9, r5
c0de8c1c:	6f87      	ldr	r7, [r0, #120]	@ 0x78
c0de8c1e:	6838      	ldr	r0, [r7, #0]
c0de8c20:	b198      	cbz	r0, c0de8c4a <displayInitialWarning+0xc6>
c0de8c22:	4668      	mov	r0, sp
c0de8c24:	2124      	movs	r1, #36	@ 0x24
c0de8c26:	f002 f9a7 	bl	c0deaf78 <__aeabi_memclr>
c0de8c2a:	483d      	ldr	r0, [pc, #244]	@ (c0de8d20 <displayInitialWarning+0x19c>)
c0de8c2c:	4478      	add	r0, pc
c0de8c2e:	9001      	str	r0, [sp, #4]
c0de8c30:	b19c      	cbz	r4, c0de8c5a <displayInitialWarning+0xd6>
c0de8c32:	483c      	ldr	r0, [pc, #240]	@ (c0de8d24 <displayInitialWarning+0x1a0>)
c0de8c34:	4478      	add	r0, pc
c0de8c36:	9004      	str	r0, [sp, #16]
c0de8c38:	06b0      	lsls	r0, r6, #26
c0de8c3a:	d422      	bmi.n	c0de8c82 <displayInitialWarning+0xfe>
c0de8c3c:	483c      	ldr	r0, [pc, #240]	@ (c0de8d30 <displayInitialWarning+0x1ac>)
c0de8c3e:	2405      	movs	r4, #5
c0de8c40:	4478      	add	r0, pc
c0de8c42:	9006      	str	r0, [sp, #24]
c0de8c44:	483b      	ldr	r0, [pc, #236]	@ (c0de8d34 <displayInitialWarning+0x1b0>)
c0de8c46:	4478      	add	r0, pc
c0de8c48:	e042      	b.n	c0de8cd0 <displayInitialWarning+0x14c>
c0de8c4a:	69f9      	ldr	r1, [r7, #28]
c0de8c4c:	b371      	cbz	r1, c0de8cac <displayInitialWarning+0x128>
c0de8c4e:	f001 f8ae 	bl	c0de9dae <OUTLINED_FUNCTION_10>
c0de8c52:	f7fc fb91 	bl	c0de5378 <nbgl_layoutAddContentCenter>
c0de8c56:	2408      	movs	r4, #8
c0de8c58:	e042      	b.n	c0de8ce0 <displayInitialWarning+0x15c>
c0de8c5a:	482b      	ldr	r0, [pc, #172]	@ (c0de8d08 <displayInitialWarning+0x184>)
c0de8c5c:	4448      	add	r0, r9
c0de8c5e:	9005      	str	r0, [sp, #20]
c0de8c60:	68f9      	ldr	r1, [r7, #12]
c0de8c62:	4b35      	ldr	r3, [pc, #212]	@ (c0de8d38 <displayInitialWarning+0x1b4>)
c0de8c64:	447b      	add	r3, pc
c0de8c66:	2900      	cmp	r1, #0
c0de8c68:	bf18      	it	ne
c0de8c6a:	460b      	movne	r3, r1
c0de8c6c:	4a33      	ldr	r2, [pc, #204]	@ (c0de8d3c <displayInitialWarning+0x1b8>)
c0de8c6e:	2180      	movs	r1, #128	@ 0x80
c0de8c70:	447a      	add	r2, pc
c0de8c72:	f001 fdcd 	bl	c0dea810 <snprintf>
c0de8c76:	07b0      	lsls	r0, r6, #30
c0de8c78:	d407      	bmi.n	c0de8c8a <displayInitialWarning+0x106>
c0de8c7a:	0770      	lsls	r0, r6, #29
c0de8c7c:	d418      	bmi.n	c0de8cb0 <displayInitialWarning+0x12c>
c0de8c7e:	2400      	movs	r4, #0
c0de8c80:	e027      	b.n	c0de8cd2 <displayInitialWarning+0x14e>
c0de8c82:	4829      	ldr	r0, [pc, #164]	@ (c0de8d28 <displayInitialWarning+0x1a4>)
c0de8c84:	4478      	add	r0, pc
c0de8c86:	9006      	str	r0, [sp, #24]
c0de8c88:	e00c      	b.n	c0de8ca4 <displayInitialWarning+0x120>
c0de8c8a:	482d      	ldr	r0, [pc, #180]	@ (c0de8d40 <displayInitialWarning+0x1bc>)
c0de8c8c:	4478      	add	r0, pc
c0de8c8e:	9004      	str	r0, [sp, #16]
c0de8c90:	eb09 0005 	add.w	r0, r9, r5
c0de8c94:	6f80      	ldr	r0, [r0, #120]	@ 0x78
c0de8c96:	6900      	ldr	r0, [r0, #16]
c0de8c98:	492a      	ldr	r1, [pc, #168]	@ (c0de8d44 <displayInitialWarning+0x1c0>)
c0de8c9a:	4479      	add	r1, pc
c0de8c9c:	2800      	cmp	r0, #0
c0de8c9e:	bf18      	it	ne
c0de8ca0:	4601      	movne	r1, r0
c0de8ca2:	9106      	str	r1, [sp, #24]
c0de8ca4:	4821      	ldr	r0, [pc, #132]	@ (c0de8d2c <displayInitialWarning+0x1a8>)
c0de8ca6:	2405      	movs	r4, #5
c0de8ca8:	4478      	add	r0, pc
c0de8caa:	e011      	b.n	c0de8cd0 <displayInitialWarning+0x14c>
c0de8cac:	2400      	movs	r4, #0
c0de8cae:	e017      	b.n	c0de8ce0 <displayInitialWarning+0x15c>
c0de8cb0:	4825      	ldr	r0, [pc, #148]	@ (c0de8d48 <displayInitialWarning+0x1c4>)
c0de8cb2:	4478      	add	r0, pc
c0de8cb4:	9004      	str	r0, [sp, #16]
c0de8cb6:	eb09 0005 	add.w	r0, r9, r5
c0de8cba:	6f80      	ldr	r0, [r0, #120]	@ 0x78
c0de8cbc:	6900      	ldr	r0, [r0, #16]
c0de8cbe:	4923      	ldr	r1, [pc, #140]	@ (c0de8d4c <displayInitialWarning+0x1c8>)
c0de8cc0:	4479      	add	r1, pc
c0de8cc2:	2800      	cmp	r0, #0
c0de8cc4:	bf18      	it	ne
c0de8cc6:	4601      	movne	r1, r0
c0de8cc8:	9106      	str	r1, [sp, #24]
c0de8cca:	2404      	movs	r4, #4
c0de8ccc:	4820      	ldr	r0, [pc, #128]	@ (c0de8d50 <displayInitialWarning+0x1cc>)
c0de8cce:	4478      	add	r0, pc
c0de8cd0:	900f      	str	r0, [sp, #60]	@ 0x3c
c0de8cd2:	eb09 0005 	add.w	r0, r9, r5
c0de8cd6:	4669      	mov	r1, sp
c0de8cd8:	f8d0 0080 	ldr.w	r0, [r0, #128]	@ 0x80
c0de8cdc:	f7fc fb4c 	bl	c0de5378 <nbgl_layoutAddContentCenter>
c0de8ce0:	f001 f865 	bl	c0de9dae <OUTLINED_FUNCTION_10>
c0de8ce4:	a90e      	add	r1, sp, #56	@ 0x38
c0de8ce6:	f7fc fcb5 	bl	c0de5654 <nbgl_layoutAddChoiceButtons>
c0de8cea:	b114      	cbz	r4, c0de8cf2 <displayInitialWarning+0x16e>
c0de8cec:	4620      	mov	r0, r4
c0de8cee:	f7fa f862 	bl	c0de2db6 <os_io_seph_cmd_piezo_play_tune>
c0de8cf2:	f001 f85c 	bl	c0de9dae <OUTLINED_FUNCTION_10>
c0de8cf6:	f7fd fad6 	bl	c0de62a6 <nbgl_layoutDraw>
c0de8cfa:	f001 fcfe 	bl	c0dea6fa <nbgl_refresh>
c0de8cfe:	b019      	add	sp, #100	@ 0x64
c0de8d00:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0de8d02:	bf00      	nop
c0de8d04:	0000197c 	.word	0x0000197c
c0de8d08:	00001ab4 	.word	0x00001ab4
c0de8d0c:	00005950 	.word	0x00005950
c0de8d10:	00005952 	.word	0x00005952
c0de8d14:	fffff9ad 	.word	0xfffff9ad
c0de8d18:	00003388 	.word	0x00003388
c0de8d1c:	000036d3 	.word	0x000036d3
c0de8d20:	00003001 	.word	0x00003001
c0de8d24:	00003ffd 	.word	0x00003ffd
c0de8d28:	00004282 	.word	0x00004282
c0de8d2c:	00003e5f 	.word	0x00003e5f
c0de8d30:	00003ee0 	.word	0x00003ee0
c0de8d34:	000041f7 	.word	0x000041f7
c0de8d38:	00003e4f 	.word	0x00003e4f
c0de8d3c:	00004139 	.word	0x00004139
c0de8d40:	0000418f 	.word	0x0000418f
c0de8d44:	00003a85 	.word	0x00003a85
c0de8d48:	00003e45 	.word	0x00003e45
c0de8d4c:	00003e23 	.word	0x00003e23
c0de8d50:	00003cfd 	.word	0x00003cfd

c0de8d54 <useCaseReviewStreamingStart>:
c0de8d54:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de8d58:	4604      	mov	r4, r0
c0de8d5a:	4827      	ldr	r0, [pc, #156]	@ (c0de8df8 <useCaseReviewStreamingStart+0xa4>)
c0de8d5c:	460d      	mov	r5, r1
c0de8d5e:	4927      	ldr	r1, [pc, #156]	@ (c0de8dfc <useCaseReviewStreamingStart+0xa8>)
c0de8d60:	e9cd 3200 	strd	r3, r2, [sp]
c0de8d64:	2203      	movs	r2, #3
c0de8d66:	f8df b09c 	ldr.w	fp, [pc, #156]	@ c0de8e04 <useCaseReviewStreamingStart+0xb0>
c0de8d6a:	f04f 0a01 	mov.w	sl, #1
c0de8d6e:	eb09 0800 	add.w	r8, r9, r0
c0de8d72:	f849 4000 	str.w	r4, [r9, r0]
c0de8d76:	f809 2001 	strb.w	r2, [r9, r1]
c0de8d7a:	eb09 0701 	add.w	r7, r9, r1
c0de8d7e:	eb09 060b 	add.w	r6, r9, fp
c0de8d82:	2138      	movs	r1, #56	@ 0x38
c0de8d84:	f8c8 500c 	str.w	r5, [r8, #12]
c0de8d88:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0de8d8a:	f8c8 0004 	str.w	r0, [r8, #4]
c0de8d8e:	481e      	ldr	r0, [pc, #120]	@ (c0de8e08 <useCaseReviewStreamingStart+0xb4>)
c0de8d90:	4478      	add	r0, pc
c0de8d92:	61b8      	str	r0, [r7, #24]
c0de8d94:	2000      	movs	r0, #0
c0de8d96:	6138      	str	r0, [r7, #16]
c0de8d98:	4819      	ldr	r0, [pc, #100]	@ (c0de8e00 <useCaseReviewStreamingStart+0xac>)
c0de8d9a:	4448      	add	r0, r9
c0de8d9c:	f880 a00c 	strb.w	sl, [r0, #12]
c0de8da0:	6086      	str	r6, [r0, #8]
c0de8da2:	f001 f822 	bl	c0de9dea <OUTLINED_FUNCTION_17>
c0de8da6:	2100      	movs	r1, #0
c0de8da8:	f809 a00b 	strb.w	sl, [r9, fp]
c0de8dac:	84b1      	strh	r1, [r6, #36]	@ 0x24
c0de8dae:	4817      	ldr	r0, [pc, #92]	@ (c0de8e0c <useCaseReviewStreamingStart+0xb8>)
c0de8db0:	9a00      	ldr	r2, [sp, #0]
c0de8db2:	60b5      	str	r5, [r6, #8]
c0de8db4:	7131      	strb	r1, [r6, #4]
c0de8db6:	2500      	movs	r5, #0
c0de8db8:	4478      	add	r0, pc
c0de8dba:	e9c6 2007 	strd	r2, r0, [r6, #28]
c0de8dbe:	9801      	ldr	r0, [sp, #4]
c0de8dc0:	6170      	str	r0, [r6, #20]
c0de8dc2:	2000      	movs	r0, #0
c0de8dc4:	f000 ff34 	bl	c0de9c30 <initWarningTipBox>
c0de8dc8:	f3c4 1000 	ubfx	r0, r4, #4, #1
c0de8dcc:	f7fe fdf2 	bl	c0de79b4 <getNbPagesForGenericContents>
c0de8dd0:	f888 0010 	strb.w	r0, [r8, #16]
c0de8dd4:	2001      	movs	r0, #1
c0de8dd6:	21ff      	movs	r1, #255	@ 0xff
c0de8dd8:	4a0d      	ldr	r2, [pc, #52]	@ (c0de8e10 <useCaseReviewStreamingStart+0xbc>)
c0de8dda:	447a      	add	r2, pc
c0de8ddc:	f7fe fd22 	bl	c0de7824 <prepareNavInfo>
c0de8de0:	f887 5071 	strb.w	r5, [r7, #113]	@ 0x71
c0de8de4:	980b      	ldr	r0, [sp, #44]	@ 0x2c
c0de8de6:	b108      	cbz	r0, c0de8dec <useCaseReviewStreamingStart+0x98>
c0de8de8:	f000 ffcd 	bl	c0de9d86 <OUTLINED_FUNCTION_5>
c0de8dec:	2000      	movs	r0, #0
c0de8dee:	2101      	movs	r1, #1
c0de8df0:	e8bd 4dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de8df4:	f7fe be98 	b.w	c0de7b28 <displayGenericContextPage>
c0de8df8:	00001cb0 	.word	0x00001cb0
c0de8dfc:	00001c34 	.word	0x00001c34
c0de8e00:	0000197c 	.word	0x0000197c
c0de8e04:	00001a0c 	.word	0x00001a0c
c0de8e08:	00000081 	.word	0x00000081
c0de8e0c:	0000409e 	.word	0x0000409e
c0de8e10:	00003849 	.word	0x00003849

c0de8e14 <bundleNavReviewStreamingChoice>:
c0de8e14:	b110      	cbz	r0, c0de8e1c <bundleNavReviewStreamingChoice+0x8>
c0de8e16:	4805      	ldr	r0, [pc, #20]	@ (c0de8e2c <bundleNavReviewStreamingChoice+0x18>)
c0de8e18:	f000 bfd9 	b.w	c0de9dce <OUTLINED_FUNCTION_13>
c0de8e1c:	4803      	ldr	r0, [pc, #12]	@ (c0de8e2c <bundleNavReviewStreamingChoice+0x18>)
c0de8e1e:	f859 0000 	ldr.w	r0, [r9, r0]
c0de8e22:	4903      	ldr	r1, [pc, #12]	@ (c0de8e30 <bundleNavReviewStreamingChoice+0x1c>)
c0de8e24:	4479      	add	r1, pc
c0de8e26:	f000 bf61 	b.w	c0de9cec <bundleNavReviewAskRejectionConfirmation>
c0de8e2a:	bf00      	nop
c0de8e2c:	00001cb0 	.word	0x00001cb0
c0de8e30:	00000f25 	.word	0x00000f25

c0de8e34 <prepareReviewLastPage>:
c0de8e34:	b13b      	cbz	r3, c0de8e46 <prepareReviewLastPage+0x12>
c0de8e36:	200b      	movs	r0, #11
c0de8e38:	7308      	strb	r0, [r1, #12]
c0de8e3a:	480d      	ldr	r0, [pc, #52]	@ (c0de8e70 <prepareReviewLastPage+0x3c>)
c0de8e3c:	e9c1 3200 	strd	r3, r2, [r1]
c0de8e40:	4478      	add	r0, pc
c0de8e42:	6088      	str	r0, [r1, #8]
c0de8e44:	4770      	bx	lr
c0de8e46:	f010 0007 	ands.w	r0, r0, #7
c0de8e4a:	d004      	beq.n	c0de8e56 <prepareReviewLastPage+0x22>
c0de8e4c:	2801      	cmp	r0, #1
c0de8e4e:	d105      	bne.n	c0de8e5c <prepareReviewLastPage+0x28>
c0de8e50:	4b05      	ldr	r3, [pc, #20]	@ (c0de8e68 <prepareReviewLastPage+0x34>)
c0de8e52:	447b      	add	r3, pc
c0de8e54:	e7ef      	b.n	c0de8e36 <prepareReviewLastPage+0x2>
c0de8e56:	4b03      	ldr	r3, [pc, #12]	@ (c0de8e64 <prepareReviewLastPage+0x30>)
c0de8e58:	447b      	add	r3, pc
c0de8e5a:	e7ec      	b.n	c0de8e36 <prepareReviewLastPage+0x2>
c0de8e5c:	4b03      	ldr	r3, [pc, #12]	@ (c0de8e6c <prepareReviewLastPage+0x38>)
c0de8e5e:	447b      	add	r3, pc
c0de8e60:	e7e9      	b.n	c0de8e36 <prepareReviewLastPage+0x2>
c0de8e62:	bf00      	nop
c0de8e64:	00003a94 	.word	0x00003a94
c0de8e68:	00003a69 	.word	0x00003a69
c0de8e6c:	00003f33 	.word	0x00003f33
c0de8e70:	000037c3 	.word	0x000037c3

c0de8e74 <prepareAddressConfirmationPages>:
c0de8e74:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de8e78:	b08a      	sub	sp, #40	@ 0x28
c0de8e7a:	4688      	mov	r8, r1
c0de8e7c:	4952      	ldr	r1, [pc, #328]	@ (c0de8fc8 <prepareAddressConfirmationPages+0x154>)
c0de8e7e:	f8df a144 	ldr.w	sl, [pc, #324]	@ c0de8fc4 <prepareAddressConfirmationPages+0x150>
c0de8e82:	4693      	mov	fp, r2
c0de8e84:	4479      	add	r1, pc
c0de8e86:	6191      	str	r1, [r2, #24]
c0de8e88:	2106      	movs	r1, #6
c0de8e8a:	7011      	strb	r1, [r2, #0]
c0de8e8c:	2201      	movs	r2, #1
c0de8e8e:	eb09 010a 	add.w	r1, r9, sl
c0de8e92:	f881 205c 	strb.w	r2, [r1, #92]	@ 0x5c
c0de8e96:	f1b8 0f00 	cmp.w	r8, #0
c0de8e9a:	4a4c      	ldr	r2, [pc, #304]	@ (c0de8fcc <prepareAddressConfirmationPages+0x158>)
c0de8e9c:	447a      	add	r2, pc
c0de8e9e:	e9c1 200a 	strd	r2, r0, [r1, #40]	@ 0x28
c0de8ea2:	d01f      	beq.n	c0de8ee4 <prepareAddressConfirmationPages+0x70>
c0de8ea4:	f898 2008 	ldrb.w	r2, [r8, #8]
c0de8ea8:	2a02      	cmp	r2, #2
c0de8eaa:	d81b      	bhi.n	c0de8ee4 <prepareAddressConfirmationPages+0x70>
c0de8eac:	2001      	movs	r0, #1
c0de8eae:	2100      	movs	r1, #0
c0de8eb0:	f04f 0c00 	mov.w	ip, #0
c0de8eb4:	9303      	str	r3, [sp, #12]
c0de8eb6:	4594      	cmp	ip, r2
c0de8eb8:	d219      	bcs.n	c0de8eee <prepareAddressConfirmationPages+0x7a>
c0de8eba:	f8d8 0000 	ldr.w	r0, [r8]
c0de8ebe:	eb09 030a 	add.w	r3, r9, sl
c0de8ec2:	f10c 0c01 	add.w	ip, ip, #1
c0de8ec6:	185c      	adds	r4, r3, r1
c0de8ec8:	4408      	add	r0, r1
c0de8eca:	3438      	adds	r4, #56	@ 0x38
c0de8ecc:	3110      	adds	r1, #16
c0de8ece:	e890 00e4 	ldmia.w	r0, {r2, r5, r6, r7}
c0de8ed2:	c4e4      	stmia	r4!, {r2, r5, r6, r7}
c0de8ed4:	f893 005c 	ldrb.w	r0, [r3, #92]	@ 0x5c
c0de8ed8:	3001      	adds	r0, #1
c0de8eda:	f883 005c 	strb.w	r0, [r3, #92]	@ 0x5c
c0de8ede:	f898 2008 	ldrb.w	r2, [r8, #8]
c0de8ee2:	e7e8      	b.n	c0de8eb6 <prepareAddressConfirmationPages+0x42>
c0de8ee4:	2000      	movs	r0, #0
c0de8ee6:	f8cb 001c 	str.w	r0, [fp, #28]
c0de8eea:	2001      	movs	r0, #1
c0de8eec:	e01e      	b.n	c0de8f2c <prepareAddressConfirmationPages+0xb8>
c0de8eee:	46c4      	mov	ip, r8
c0de8ef0:	a905      	add	r1, sp, #20
c0de8ef2:	e89c 00f4 	ldmia.w	ip, {r2, r4, r5, r6, r7}
c0de8ef6:	460b      	mov	r3, r1
c0de8ef8:	c3f4      	stmia	r3!, {r2, r4, r5, r6, r7}
c0de8efa:	eb09 040a 	add.w	r4, r9, sl
c0de8efe:	b2c7      	uxtb	r7, r0
c0de8f00:	f88d 001c 	strb.w	r0, [sp, #28]
c0de8f04:	f104 0228 	add.w	r2, r4, #40	@ 0x28
c0de8f08:	2301      	movs	r3, #1
c0de8f0a:	4638      	mov	r0, r7
c0de8f0c:	9205      	str	r2, [sp, #20]
c0de8f0e:	f10d 0213 	add.w	r2, sp, #19
c0de8f12:	e9cd 3300 	strd	r3, r3, [sp]
c0de8f16:	2300      	movs	r3, #0
c0de8f18:	9202      	str	r2, [sp, #8]
c0de8f1a:	2200      	movs	r2, #0
c0de8f1c:	f7fe fa88 	bl	c0de7430 <getNbTagValuesInPage>
c0de8f20:	4287      	cmp	r7, r0
c0de8f22:	bf88      	it	hi
c0de8f24:	2001      	movhi	r0, #1
c0de8f26:	9b03      	ldr	r3, [sp, #12]
c0de8f28:	f884 005c 	strb.w	r0, [r4, #92]	@ 0x5c
c0de8f2c:	f640 1107 	movw	r1, #2311	@ 0x907
c0de8f30:	f88b 000c 	strb.w	r0, [fp, #12]
c0de8f34:	f8ab 1020 	strh.w	r1, [fp, #32]
c0de8f38:	2100      	movs	r1, #0
c0de8f3a:	f88b 1011 	strb.w	r1, [fp, #17]
c0de8f3e:	f88b 1012 	strb.w	r1, [fp, #18]
c0de8f42:	f88b 100f 	strb.w	r1, [fp, #15]
c0de8f46:	eb09 010a 	add.w	r1, r9, sl
c0de8f4a:	3128      	adds	r1, #40	@ 0x28
c0de8f4c:	f1b8 0f00 	cmp.w	r8, #0
c0de8f50:	f8cb 1004 	str.w	r1, [fp, #4]
c0de8f54:	d003      	beq.n	c0de8f5e <prepareAddressConfirmationPages+0xea>
c0de8f56:	f898 1008 	ldrb.w	r1, [r8, #8]
c0de8f5a:	4288      	cmp	r0, r1
c0de8f5c:	d907      	bls.n	c0de8f6e <prepareAddressConfirmationPages+0xfa>
c0de8f5e:	200b      	movs	r0, #11
c0de8f60:	f88b 002c 	strb.w	r0, [fp, #44]	@ 0x2c
c0de8f64:	481c      	ldr	r0, [pc, #112]	@ (c0de8fd8 <prepareAddressConfirmationPages+0x164>)
c0de8f66:	4478      	add	r0, pc
c0de8f68:	f8cb 0024 	str.w	r0, [fp, #36]	@ 0x24
c0de8f6c:	e027      	b.n	c0de8fbe <prepareAddressConfirmationPages+0x14a>
c0de8f6e:	2000      	movs	r0, #0
c0de8f70:	f8cb 0024 	str.w	r0, [fp, #36]	@ 0x24
c0de8f74:	4916      	ldr	r1, [pc, #88]	@ (c0de8fd0 <prepareAddressConfirmationPages+0x15c>)
c0de8f76:	4479      	add	r1, pc
c0de8f78:	f8cb 101c 	str.w	r1, [fp, #28]
c0de8f7c:	210b      	movs	r1, #11
c0de8f7e:	f883 102c 	strb.w	r1, [r3, #44]	@ 0x2c
c0de8f82:	2106      	movs	r1, #6
c0de8f84:	7019      	strb	r1, [r3, #0]
c0de8f86:	2109      	movs	r1, #9
c0de8f88:	f883 1021 	strb.w	r1, [r3, #33]	@ 0x21
c0de8f8c:	4911      	ldr	r1, [pc, #68]	@ (c0de8fd4 <prepareAddressConfirmationPages+0x160>)
c0de8f8e:	e9c3 0006 	strd	r0, r0, [r3, #24]
c0de8f92:	1d18      	adds	r0, r3, #4
c0de8f94:	4479      	add	r1, pc
c0de8f96:	6259      	str	r1, [r3, #36]	@ 0x24
c0de8f98:	4641      	mov	r1, r8
c0de8f9a:	e891 00f4 	ldmia.w	r1, {r2, r4, r5, r6, r7}
c0de8f9e:	c0f4      	stmia	r0!, {r2, r4, r5, r6, r7}
c0de8fa0:	eb09 000a 	add.w	r0, r9, sl
c0de8fa4:	f898 1008 	ldrb.w	r1, [r8, #8]
c0de8fa8:	f890 005c 	ldrb.w	r0, [r0, #92]	@ 0x5c
c0de8fac:	1a09      	subs	r1, r1, r0
c0de8fae:	3101      	adds	r1, #1
c0de8fb0:	7319      	strb	r1, [r3, #12]
c0de8fb2:	f8d8 1000 	ldr.w	r1, [r8]
c0de8fb6:	eb01 1000 	add.w	r0, r1, r0, lsl #4
c0de8fba:	3810      	subs	r0, #16
c0de8fbc:	6058      	str	r0, [r3, #4]
c0de8fbe:	b00a      	add	sp, #40	@ 0x28
c0de8fc0:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de8fc4:	00001cb0 	.word	0x00001cb0
c0de8fc8:	00003449 	.word	0x00003449
c0de8fcc:	00003def 	.word	0x00003def
c0de8fd0:	000037bb 	.word	0x000037bb
c0de8fd4:	00003f5a 	.word	0x00003f5a
c0de8fd8:	00003f88 	.word	0x00003f88

c0de8fdc <nbgl_useCaseAddressReview>:
c0de8fdc:	e92d 4dff 	stmdb	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de8fe0:	4c2d      	ldr	r4, [pc, #180]	@ (c0de9098 <nbgl_useCaseAddressReview+0xbc>)
c0de8fe2:	9301      	str	r3, [sp, #4]
c0de8fe4:	4692      	mov	sl, r2
c0de8fe6:	e9cd 0102 	strd	r0, r1, [sp, #8]
c0de8fea:	eb09 0504 	add.w	r5, r9, r4
c0de8fee:	f7fe fc03 	bl	c0de77f8 <reset_callbacks_and_context>
c0de8ff2:	6da8      	ldr	r0, [r5, #88]	@ 0x58
c0de8ff4:	e9dd 570c 	ldrd	r5, r7, [sp, #48]	@ 0x30
c0de8ff8:	b108      	cbz	r0, c0de8ffe <nbgl_useCaseAddressReview+0x22>
c0de8ffa:	f7fd f973 	bl	c0de62e4 <nbgl_layoutRelease>
c0de8ffe:	eb09 0004 	add.w	r0, r9, r4
c0de9002:	2138      	movs	r1, #56	@ 0x38
c0de9004:	3028      	adds	r0, #40	@ 0x28
c0de9006:	f001 ffb7 	bl	c0deaf78 <__aeabi_memclr>
c0de900a:	4824      	ldr	r0, [pc, #144]	@ (c0de909c <nbgl_useCaseAddressReview+0xc0>)
c0de900c:	2602      	movs	r6, #2
c0de900e:	f04f 0b00 	mov.w	fp, #0
c0de9012:	21a8      	movs	r1, #168	@ 0xa8
c0de9014:	f849 6004 	str.w	r6, [r9, r4]
c0de9018:	f809 6000 	strb.w	r6, [r9, r0]
c0de901c:	4448      	add	r0, r9
c0de901e:	6187      	str	r7, [r0, #24]
c0de9020:	4f20      	ldr	r7, [pc, #128]	@ (c0de90a4 <nbgl_useCaseAddressReview+0xc8>)
c0de9022:	f8c0 b010 	str.w	fp, [r0, #16]
c0de9026:	481e      	ldr	r0, [pc, #120]	@ (c0de90a0 <nbgl_useCaseAddressReview+0xc4>)
c0de9028:	eb09 0407 	add.w	r4, r9, r7
c0de902c:	eb09 0800 	add.w	r8, r9, r0
c0de9030:	4620      	mov	r0, r4
c0de9032:	f8c8 4008 	str.w	r4, [r8, #8]
c0de9036:	f001 ff9f 	bl	c0deaf78 <__aeabi_memclr>
c0de903a:	2001      	movs	r0, #1
c0de903c:	f8c4 a008 	str.w	sl, [r4, #8]
c0de9040:	f884 b026 	strb.w	fp, [r4, #38]	@ 0x26
c0de9044:	f104 0238 	add.w	r2, r4, #56	@ 0x38
c0de9048:	f104 0370 	add.w	r3, r4, #112	@ 0x70
c0de904c:	f809 0007 	strb.w	r0, [r9, r7]
c0de9050:	4815      	ldr	r0, [pc, #84]	@ (c0de90a8 <nbgl_useCaseAddressReview+0xcc>)
c0de9052:	9901      	ldr	r1, [sp, #4]
c0de9054:	4478      	add	r0, pc
c0de9056:	e9c4 1b05 	strd	r1, fp, [r4, #20]
c0de905a:	e9c4 5007 	strd	r5, r0, [r4, #28]
c0de905e:	e9dd 0102 	ldrd	r0, r1, [sp, #8]
c0de9062:	f7ff ff07 	bl	c0de8e74 <prepareAddressConfirmationPages>
c0de9066:	f894 0070 	ldrb.w	r0, [r4, #112]	@ 0x70
c0de906a:	2806      	cmp	r0, #6
c0de906c:	bf08      	it	eq
c0de906e:	2603      	moveq	r6, #3
c0de9070:	f888 600c 	strb.w	r6, [r8, #12]
c0de9074:	f000 fe84 	bl	c0de9d80 <OUTLINED_FUNCTION_4>
c0de9078:	4a0c      	ldr	r2, [pc, #48]	@ (c0de90ac <nbgl_useCaseAddressReview+0xd0>)
c0de907a:	4601      	mov	r1, r0
c0de907c:	2001      	movs	r0, #1
c0de907e:	447a      	add	r2, pc
c0de9080:	f7fe fbd0 	bl	c0de7824 <prepareNavInfo>
c0de9084:	f000 fe7f 	bl	c0de9d86 <OUTLINED_FUNCTION_5>
c0de9088:	2000      	movs	r0, #0
c0de908a:	2101      	movs	r1, #1
c0de908c:	b004      	add	sp, #16
c0de908e:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9092:	f7fe bd49 	b.w	c0de7b28 <displayGenericContextPage>
c0de9096:	bf00      	nop
c0de9098:	00001cb0 	.word	0x00001cb0
c0de909c:	00001c34 	.word	0x00001c34
c0de90a0:	0000197c 	.word	0x0000197c
c0de90a4:	00001a0c 	.word	0x00001a0c
c0de90a8:	0000374c 	.word	0x0000374c
c0de90ac:	000039c7 	.word	0x000039c7

c0de90b0 <getContentAtIdx>:
c0de90b0:	b570      	push	{r4, r5, r6, lr}
c0de90b2:	4605      	mov	r5, r0
c0de90b4:	2000      	movs	r0, #0
c0de90b6:	2d00      	cmp	r5, #0
c0de90b8:	d415      	bmi.n	c0de90e6 <getContentAtIdx+0x36>
c0de90ba:	4e11      	ldr	r6, [pc, #68]	@ (c0de9100 <getContentAtIdx+0x50>)
c0de90bc:	460c      	mov	r4, r1
c0de90be:	eb09 0106 	add.w	r1, r9, r6
c0de90c2:	7b09      	ldrb	r1, [r1, #12]
c0de90c4:	428d      	cmp	r5, r1
c0de90c6:	da0e      	bge.n	c0de90e6 <getContentAtIdx+0x36>
c0de90c8:	eb09 0006 	add.w	r0, r9, r6
c0de90cc:	7900      	ldrb	r0, [r0, #4]
c0de90ce:	b158      	cbz	r0, c0de90e8 <getContentAtIdx+0x38>
c0de90d0:	4620      	mov	r0, r4
c0de90d2:	2138      	movs	r1, #56	@ 0x38
c0de90d4:	f001 ff50 	bl	c0deaf78 <__aeabi_memclr>
c0de90d8:	eb09 0006 	add.w	r0, r9, r6
c0de90dc:	4621      	mov	r1, r4
c0de90de:	6882      	ldr	r2, [r0, #8]
c0de90e0:	b2e8      	uxtb	r0, r5
c0de90e2:	4790      	blx	r2
c0de90e4:	4620      	mov	r0, r4
c0de90e6:	bd70      	pop	{r4, r5, r6, pc}
c0de90e8:	eb09 0006 	add.w	r0, r9, r6
c0de90ec:	ebc5 01c5 	rsb	r1, r5, r5, lsl #3
c0de90f0:	6880      	ldr	r0, [r0, #8]
c0de90f2:	eb00 00c1 	add.w	r0, r0, r1, lsl #3
c0de90f6:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de90fa:	f001 bd1b 	b.w	c0deab34 <pic>
c0de90fe:	bf00      	nop
c0de9100:	0000197c 	.word	0x0000197c

c0de9104 <getContentNbElement>:
c0de9104:	7801      	ldrb	r1, [r0, #0]
c0de9106:	290a      	cmp	r1, #10
c0de9108:	d00b      	beq.n	c0de9122 <getContentNbElement+0x1e>
c0de910a:	2906      	cmp	r1, #6
c0de910c:	d009      	beq.n	c0de9122 <getContentNbElement+0x1e>
c0de910e:	2907      	cmp	r1, #7
c0de9110:	d009      	beq.n	c0de9126 <getContentNbElement+0x22>
c0de9112:	2908      	cmp	r1, #8
c0de9114:	d009      	beq.n	c0de912a <getContentNbElement+0x26>
c0de9116:	2909      	cmp	r1, #9
c0de9118:	d009      	beq.n	c0de912e <getContentNbElement+0x2a>
c0de911a:	2904      	cmp	r1, #4
c0de911c:	bf1c      	itt	ne
c0de911e:	2001      	movne	r0, #1
c0de9120:	4770      	bxne	lr
c0de9122:	7b00      	ldrb	r0, [r0, #12]
c0de9124:	4770      	bx	lr
c0de9126:	7a00      	ldrb	r0, [r0, #8]
c0de9128:	4770      	bx	lr
c0de912a:	7c00      	ldrb	r0, [r0, #16]
c0de912c:	4770      	bx	lr
c0de912e:	7a40      	ldrb	r0, [r0, #9]
c0de9130:	4770      	bx	lr
	...

c0de9134 <genericContextComputeNextPageParams>:
c0de9134:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de9138:	f8df 810c 	ldr.w	r8, [pc, #268]	@ c0de9248 <genericContextComputeNextPageParams+0x114>
c0de913c:	4682      	mov	sl, r0
c0de913e:	4616      	mov	r6, r2
c0de9140:	460d      	mov	r5, r1
c0de9142:	f10d 0107 	add.w	r1, sp, #7
c0de9146:	461a      	mov	r2, r3
c0de9148:	eb09 0008 	add.w	r0, r9, r8
c0de914c:	7c04      	ldrb	r4, [r0, #16]
c0de914e:	7c87      	ldrb	r7, [r0, #18]
c0de9150:	4650      	mov	r0, sl
c0de9152:	f000 f881 	bl	c0de9258 <genericContextGetPageInfo>
c0de9156:	f89d 0007 	ldrb.w	r0, [sp, #7]
c0de915a:	f8df b0f0 	ldr.w	fp, [pc, #240]	@ c0de924c <genericContextComputeNextPageParams+0x118>
c0de915e:	7030      	strb	r0, [r6, #0]
c0de9160:	eb09 010b 	add.w	r1, r9, fp
c0de9164:	f891 1060 	ldrb.w	r1, [r1, #96]	@ 0x60
c0de9168:	4551      	cmp	r1, sl
c0de916a:	d219      	bcs.n	c0de91a0 <genericContextComputeNextPageParams+0x6c>
c0de916c:	4b38      	ldr	r3, [pc, #224]	@ (c0de9250 <genericContextComputeNextPageParams+0x11c>)
c0de916e:	084e      	lsrs	r6, r1, #1
c0de9170:	2204      	movs	r2, #4
c0de9172:	ea02 0281 	and.w	r2, r2, r1, lsl #2
c0de9176:	444b      	add	r3, r9
c0de9178:	5d9b      	ldrb	r3, [r3, r6]
c0de917a:	fa23 f202 	lsr.w	r2, r3, r2
c0de917e:	2300      	movs	r3, #0
c0de9180:	f002 0207 	and.w	r2, r2, #7
c0de9184:	4417      	add	r7, r2
c0de9186:	eb09 0208 	add.w	r2, r9, r8
c0de918a:	7c52      	ldrb	r2, [r2, #17]
c0de918c:	4297      	cmp	r7, r2
c0de918e:	bf28      	it	cs
c0de9190:	2301      	movcs	r3, #1
c0de9192:	2a00      	cmp	r2, #0
c0de9194:	bf18      	it	ne
c0de9196:	2201      	movne	r2, #1
c0de9198:	401a      	ands	r2, r3
c0de919a:	bf18      	it	ne
c0de919c:	2700      	movne	r7, #0
c0de919e:	4414      	add	r4, r2
c0de91a0:	4551      	cmp	r1, sl
c0de91a2:	d905      	bls.n	c0de91b0 <genericContextComputeNextPageParams+0x7c>
c0de91a4:	1a3f      	subs	r7, r7, r0
c0de91a6:	f1b7 3fff 	cmp.w	r7, #4294967295	@ 0xffffffff
c0de91aa:	bfdc      	itt	le
c0de91ac:	4247      	negle	r7, r0
c0de91ae:	3c01      	suble	r4, #1
c0de91b0:	b2e6      	uxtb	r6, r4
c0de91b2:	2eff      	cmp	r6, #255	@ 0xff
c0de91b4:	d014      	beq.n	c0de91e0 <genericContextComputeNextPageParams+0xac>
c0de91b6:	eb09 0108 	add.w	r1, r9, r8
c0de91ba:	b260      	sxtb	r0, r4
c0de91bc:	7b09      	ldrb	r1, [r1, #12]
c0de91be:	4288      	cmp	r0, r1
c0de91c0:	d108      	bne.n	c0de91d4 <genericContextComputeNextPageParams+0xa0>
c0de91c2:	eb09 0108 	add.w	r1, r9, r8
c0de91c6:	7d09      	ldrb	r1, [r1, #20]
c0de91c8:	b121      	cbz	r1, c0de91d4 <genericContextComputeNextPageParams+0xa0>
c0de91ca:	4822      	ldr	r0, [pc, #136]	@ (c0de9254 <genericContextComputeNextPageParams+0x120>)
c0de91cc:	4448      	add	r0, r9
c0de91ce:	f100 0538 	add.w	r5, r0, #56	@ 0x38
c0de91d2:	e00d      	b.n	c0de91f0 <genericContextComputeNextPageParams+0xbc>
c0de91d4:	4629      	mov	r1, r5
c0de91d6:	f7ff ff6b 	bl	c0de90b0 <getContentAtIdx>
c0de91da:	4605      	mov	r5, r0
c0de91dc:	b940      	cbnz	r0, c0de91f0 <genericContextComputeNextPageParams+0xbc>
c0de91de:	e02e      	b.n	c0de923e <genericContextComputeNextPageParams+0x10a>
c0de91e0:	eb09 0008 	add.w	r0, r9, r8
c0de91e4:	7cc0      	ldrb	r0, [r0, #19]
c0de91e6:	2800      	cmp	r0, #0
c0de91e8:	d0e5      	beq.n	c0de91b6 <genericContextComputeNextPageParams+0x82>
c0de91ea:	481a      	ldr	r0, [pc, #104]	@ (c0de9254 <genericContextComputeNextPageParams+0x120>)
c0de91ec:	eb09 0500 	add.w	r5, r9, r0
c0de91f0:	eb09 0008 	add.w	r0, r9, r8
c0de91f4:	7c00      	ldrb	r0, [r0, #16]
c0de91f6:	4286      	cmp	r6, r0
c0de91f8:	d103      	bne.n	c0de9202 <genericContextComputeNextPageParams+0xce>
c0de91fa:	eb09 0008 	add.w	r0, r9, r8
c0de91fe:	7c40      	ldrb	r0, [r0, #17]
c0de9200:	b988      	cbnz	r0, c0de9226 <genericContextComputeNextPageParams+0xf2>
c0de9202:	eb09 0608 	add.w	r6, r9, r8
c0de9206:	4628      	mov	r0, r5
c0de9208:	7434      	strb	r4, [r6, #16]
c0de920a:	f7ff ff7b 	bl	c0de9104 <getContentNbElement>
c0de920e:	7470      	strb	r0, [r6, #17]
c0de9210:	6b68      	ldr	r0, [r5, #52]	@ 0x34
c0de9212:	eb09 040b 	add.w	r4, r9, fp
c0de9216:	f001 fc8d 	bl	c0deab34 <pic>
c0de921a:	62e0      	str	r0, [r4, #44]	@ 0x2c
c0de921c:	7c70      	ldrb	r0, [r6, #17]
c0de921e:	f1b7 3fff 	cmp.w	r7, #4294967295	@ 0xffffffff
c0de9222:	dc02      	bgt.n	c0de922a <genericContextComputeNextPageParams+0xf6>
c0de9224:	4407      	add	r7, r0
c0de9226:	2f00      	cmp	r7, #0
c0de9228:	d409      	bmi.n	c0de923e <genericContextComputeNextPageParams+0x10a>
c0de922a:	4287      	cmp	r7, r0
c0de922c:	d207      	bcs.n	c0de923e <genericContextComputeNextPageParams+0x10a>
c0de922e:	eb09 000b 	add.w	r0, r9, fp
c0de9232:	f880 a060 	strb.w	sl, [r0, #96]	@ 0x60
c0de9236:	eb09 0008 	add.w	r0, r9, r8
c0de923a:	7487      	strb	r7, [r0, #18]
c0de923c:	e000      	b.n	c0de9240 <genericContextComputeNextPageParams+0x10c>
c0de923e:	2500      	movs	r5, #0
c0de9240:	4628      	mov	r0, r5
c0de9242:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de9246:	bf00      	nop
c0de9248:	0000197c 	.word	0x0000197c
c0de924c:	00001c34 	.word	0x00001c34
c0de9250:	00001b34 	.word	0x00001b34
c0de9254:	00001a0c 	.word	0x00001a0c

c0de9258 <genericContextGetPageInfo>:
c0de9258:	b510      	push	{r4, lr}
c0de925a:	4c08      	ldr	r4, [pc, #32]	@ (c0de927c <genericContextGetPageInfo+0x24>)
c0de925c:	2304      	movs	r3, #4
c0de925e:	ea03 0380 	and.w	r3, r3, r0, lsl #2
c0de9262:	0840      	lsrs	r0, r0, #1
c0de9264:	444c      	add	r4, r9
c0de9266:	5c20      	ldrb	r0, [r4, r0]
c0de9268:	40d8      	lsrs	r0, r3
c0de926a:	b111      	cbz	r1, c0de9272 <genericContextGetPageInfo+0x1a>
c0de926c:	f000 0307 	and.w	r3, r0, #7
c0de9270:	700b      	strb	r3, [r1, #0]
c0de9272:	b112      	cbz	r2, c0de927a <genericContextGetPageInfo+0x22>
c0de9274:	f3c0 00c0 	ubfx	r0, r0, #3, #1
c0de9278:	7010      	strb	r0, [r2, #0]
c0de927a:	bd10      	pop	{r4, pc}
c0de927c:	00001b34 	.word	0x00001b34

c0de9280 <bundleNavStartSettings>:
c0de9280:	2000      	movs	r0, #0
c0de9282:	f7fe be8d 	b.w	c0de7fa0 <bundleNavStartSettingsAtPage>
	...

c0de9288 <displayFullValuePage>:
c0de9288:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de928c:	b092      	sub	sp, #72	@ 0x48
c0de928e:	460d      	mov	r5, r1
c0de9290:	68d1      	ldr	r1, [r2, #12]
c0de9292:	4614      	mov	r4, r2
c0de9294:	b101      	cbz	r1, c0de9298 <displayFullValuePage+0x10>
c0de9296:	4608      	mov	r0, r1
c0de9298:	f001 fc4c 	bl	c0deab34 <pic>
c0de929c:	4606      	mov	r6, r0
c0de929e:	7d20      	ldrb	r0, [r4, #20]
c0de92a0:	2805      	cmp	r0, #5
c0de92a2:	d00d      	beq.n	c0de92c0 <displayFullValuePage+0x38>
c0de92a4:	2804      	cmp	r0, #4
c0de92a6:	d170      	bne.n	c0de938a <displayFullValuePage+0x102>
c0de92a8:	4861      	ldr	r0, [pc, #388]	@ (c0de9430 <displayFullValuePage+0x1a8>)
c0de92aa:	6921      	ldr	r1, [r4, #16]
c0de92ac:	2201      	movs	r2, #1
c0de92ae:	4448      	add	r0, r9
c0de92b0:	6341      	str	r1, [r0, #52]	@ 0x34
c0de92b2:	4630      	mov	r0, r6
c0de92b4:	6921      	ldr	r1, [r4, #16]
c0de92b6:	b012      	add	sp, #72	@ 0x48
c0de92b8:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de92bc:	f000 b9de 	b.w	c0de967c <displayInfosListModal>
c0de92c0:	485b      	ldr	r0, [pc, #364]	@ (c0de9430 <displayFullValuePage+0x1a8>)
c0de92c2:	6921      	ldr	r1, [r4, #16]
c0de92c4:	2200      	movs	r2, #0
c0de92c6:	4448      	add	r0, r9
c0de92c8:	6381      	str	r1, [r0, #56]	@ 0x38
c0de92ca:	485a      	ldr	r0, [pc, #360]	@ (c0de9434 <displayFullValuePage+0x1ac>)
c0de92cc:	2100      	movs	r1, #0
c0de92ce:	6927      	ldr	r7, [r4, #16]
c0de92d0:	9101      	str	r1, [sp, #4]
c0de92d2:	4448      	add	r0, r9
c0de92d4:	e9c0 220c 	strd	r2, r2, [r0, #48]	@ 0x30
c0de92d8:	6382      	str	r2, [r0, #56]	@ 0x38
c0de92da:	63c2      	str	r2, [r0, #60]	@ 0x3c
c0de92dc:	7a3d      	ldrb	r5, [r7, #8]
c0de92de:	0628      	lsls	r0, r5, #24
c0de92e0:	f000 8087 	beq.w	c0de93f2 <displayFullValuePage+0x16a>
c0de92e4:	9500      	str	r5, [sp, #0]
c0de92e6:	fa5f fb85 	uxtb.w	fp, r5
c0de92ea:	f04f 0800 	mov.w	r8, #0
c0de92ee:	2600      	movs	r6, #0
c0de92f0:	9801      	ldr	r0, [sp, #4]
c0de92f2:	b2c0      	uxtb	r0, r0
c0de92f4:	ea4f 1a00 	mov.w	sl, r0, lsl #4
c0de92f8:	45c3      	cmp	fp, r8
c0de92fa:	d027      	beq.n	c0de934c <displayFullValuePage+0xc4>
c0de92fc:	f1b8 0f00 	cmp.w	r8, #0
c0de9300:	bf18      	it	ne
c0de9302:	3618      	addne	r6, #24
c0de9304:	6838      	ldr	r0, [r7, #0]
c0de9306:	b108      	cbz	r0, c0de930c <displayFullValuePage+0x84>
c0de9308:	4450      	add	r0, sl
c0de930a:	e004      	b.n	c0de9316 <displayFullValuePage+0x8e>
c0de930c:	9801      	ldr	r0, [sp, #4]
c0de930e:	6879      	ldr	r1, [r7, #4]
c0de9310:	4440      	add	r0, r8
c0de9312:	b2c0      	uxtb	r0, r0
c0de9314:	4788      	blx	r1
c0de9316:	f001 fc0d 	bl	c0deab34 <pic>
c0de931a:	7bbb      	ldrb	r3, [r7, #14]
c0de931c:	6801      	ldr	r1, [r0, #0]
c0de931e:	4604      	mov	r4, r0
c0de9320:	f000 fd5e 	bl	c0de9de0 <OUTLINED_FUNCTION_16>
c0de9324:	6861      	ldr	r1, [r4, #4]
c0de9326:	7bbb      	ldrb	r3, [r7, #14]
c0de9328:	4605      	mov	r5, r0
c0de932a:	f000 fd59 	bl	c0de9de0 <OUTLINED_FUNCTION_16>
c0de932e:	1971      	adds	r1, r6, r5
c0de9330:	f10a 0a10 	add.w	sl, sl, #16
c0de9334:	f108 0801 	add.w	r8, r8, #1
c0de9338:	4408      	add	r0, r1
c0de933a:	1d06      	adds	r6, r0, #4
c0de933c:	b2b0      	uxth	r0, r6
c0de933e:	f5b0 7fe8 	cmp.w	r0, #464	@ 0x1d0
c0de9342:	d3d9      	bcc.n	c0de92f8 <displayFullValuePage+0x70>
c0de9344:	9d00      	ldr	r5, [sp, #0]
c0de9346:	f1a8 0001 	sub.w	r0, r8, #1
c0de934a:	e001      	b.n	c0de9350 <displayFullValuePage+0xc8>
c0de934c:	9d00      	ldr	r5, [sp, #0]
c0de934e:	4628      	mov	r0, r5
c0de9350:	4938      	ldr	r1, [pc, #224]	@ (c0de9434 <displayFullValuePage+0x1ac>)
c0de9352:	2404      	movs	r4, #4
c0de9354:	1a2d      	subs	r5, r5, r0
c0de9356:	4449      	add	r1, r9
c0de9358:	f891 2030 	ldrb.w	r2, [r1, #48]	@ 0x30
c0de935c:	1c53      	adds	r3, r2, #1
c0de935e:	f881 3030 	strb.w	r3, [r1, #48]	@ 0x30
c0de9362:	eb01 0152 	add.w	r1, r1, r2, lsr #1
c0de9366:	ea04 0282 	and.w	r2, r4, r2, lsl #2
c0de936a:	240f      	movs	r4, #15
c0de936c:	f891 3050 	ldrb.w	r3, [r1, #80]	@ 0x50
c0de9370:	4094      	lsls	r4, r2
c0de9372:	43a3      	bics	r3, r4
c0de9374:	f000 0407 	and.w	r4, r0, #7
c0de9378:	fa04 f202 	lsl.w	r2, r4, r2
c0de937c:	431a      	orrs	r2, r3
c0de937e:	f881 2050 	strb.w	r2, [r1, #80]	@ 0x50
c0de9382:	9901      	ldr	r1, [sp, #4]
c0de9384:	4401      	add	r1, r0
c0de9386:	9101      	str	r1, [sp, #4]
c0de9388:	e7a9      	b.n	c0de92de <displayFullValuePage+0x56>
c0de938a:	af0b      	add	r7, sp, #44	@ 0x2c
c0de938c:	492a      	ldr	r1, [pc, #168]	@ (c0de9438 <displayFullValuePage+0x1b0>)
c0de938e:	221c      	movs	r2, #28
c0de9390:	4638      	mov	r0, r7
c0de9392:	4479      	add	r1, pc
c0de9394:	f001 fde6 	bl	c0deaf64 <__aeabi_memcpy>
c0de9398:	f44f 6010 	mov.w	r0, #2304	@ 0x900
c0de939c:	f8df 8090 	ldr.w	r8, [pc, #144]	@ c0de9430 <displayFullValuePage+0x1a8>
c0de93a0:	9608      	str	r6, [sp, #32]
c0de93a2:	f8ad 0024 	strh.w	r0, [sp, #36]	@ 0x24
c0de93a6:	2000      	movs	r0, #0
c0de93a8:	9007      	str	r0, [sp, #28]
c0de93aa:	2001      	movs	r0, #1
c0de93ac:	eb09 0608 	add.w	r6, r9, r8
c0de93b0:	f8ad 0018 	strh.w	r0, [sp, #24]
c0de93b4:	4638      	mov	r0, r7
c0de93b6:	f7f9 ff05 	bl	c0de31c4 <nbgl_layoutGet>
c0de93ba:	62f0      	str	r0, [r6, #44]	@ 0x2c
c0de93bc:	a906      	add	r1, sp, #24
c0de93be:	f7fc fc55 	bl	c0de5c6c <nbgl_layoutAddHeader>
c0de93c2:	7d20      	ldrb	r0, [r4, #20]
c0de93c4:	2801      	cmp	r0, #1
c0de93c6:	d01b      	beq.n	c0de9400 <displayFullValuePage+0x178>
c0de93c8:	2802      	cmp	r0, #2
c0de93ca:	d01c      	beq.n	c0de9406 <displayFullValuePage+0x17e>
c0de93cc:	2803      	cmp	r0, #3
c0de93ce:	d11d      	bne.n	c0de940c <displayFullValuePage+0x184>
c0de93d0:	f44f 3080 	mov.w	r0, #65536	@ 0x10000
c0de93d4:	9005      	str	r0, [sp, #20]
c0de93d6:	cc07      	ldmia	r4!, {r0, r1, r2}
c0de93d8:	9104      	str	r1, [sp, #16]
c0de93da:	2a00      	cmp	r2, #0
c0de93dc:	9002      	str	r0, [sp, #8]
c0de93de:	bf08      	it	eq
c0de93e0:	4602      	moveq	r2, r0
c0de93e2:	eb09 0008 	add.w	r0, r9, r8
c0de93e6:	9203      	str	r2, [sp, #12]
c0de93e8:	6ac0      	ldr	r0, [r0, #44]	@ 0x2c
c0de93ea:	a902      	add	r1, sp, #8
c0de93ec:	f7fb ffcd 	bl	c0de538a <nbgl_layoutAddQRCode>
c0de93f0:	e014      	b.n	c0de941c <displayFullValuePage+0x194>
c0de93f2:	2000      	movs	r0, #0
c0de93f4:	2101      	movs	r1, #1
c0de93f6:	b012      	add	sp, #72	@ 0x48
c0de93f8:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de93fc:	f000 bb74 	b.w	c0de9ae8 <displayTagValueListModalPage>
c0de9400:	4b0e      	ldr	r3, [pc, #56]	@ (c0de943c <displayFullValuePage+0x1b4>)
c0de9402:	447b      	add	r3, pc
c0de9404:	e003      	b.n	c0de940e <displayFullValuePage+0x186>
c0de9406:	4b0e      	ldr	r3, [pc, #56]	@ (c0de9440 <displayFullValuePage+0x1b8>)
c0de9408:	447b      	add	r3, pc
c0de940a:	e000      	b.n	c0de940e <displayFullValuePage+0x186>
c0de940c:	6863      	ldr	r3, [r4, #4]
c0de940e:	eb09 0008 	add.w	r0, r9, r8
c0de9412:	6822      	ldr	r2, [r4, #0]
c0de9414:	4629      	mov	r1, r5
c0de9416:	6ac0      	ldr	r0, [r0, #44]	@ 0x2c
c0de9418:	f7fb fb7a 	bl	c0de4b10 <nbgl_layoutAddTextContent>
c0de941c:	eb09 0008 	add.w	r0, r9, r8
c0de9420:	6ac0      	ldr	r0, [r0, #44]	@ 0x2c
c0de9422:	f7fc ff40 	bl	c0de62a6 <nbgl_layoutDraw>
c0de9426:	f001 f968 	bl	c0dea6fa <nbgl_refresh>
c0de942a:	b012      	add	sp, #72	@ 0x48
c0de942c:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de9430:	0000197c 	.word	0x0000197c
c0de9434:	00001c34 	.word	0x00001c34
c0de9438:	000050b6 	.word	0x000050b6
c0de943c:	00003406 	.word	0x00003406
c0de9440:	000037be 	.word	0x000037be

c0de9444 <displaySecurityReport>:
c0de9444:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9448:	b09c      	sub	sp, #112	@ 0x70
c0de944a:	ac15      	add	r4, sp, #84	@ 0x54
c0de944c:	4977      	ldr	r1, [pc, #476]	@ (c0de962c <displaySecurityReport+0x1e8>)
c0de944e:	4680      	mov	r8, r0
c0de9450:	221c      	movs	r2, #28
c0de9452:	4620      	mov	r0, r4
c0de9454:	4479      	add	r1, pc
c0de9456:	f001 fd85 	bl	c0deaf64 <__aeabi_memcpy>
c0de945a:	4875      	ldr	r0, [pc, #468]	@ (c0de9630 <displaySecurityReport+0x1ec>)
c0de945c:	a910      	add	r1, sp, #64	@ 0x40
c0de945e:	4478      	add	r0, pc
c0de9460:	e890 00ec 	ldmia.w	r0, {r2, r3, r5, r6, r7}
c0de9464:	c1ec      	stmia	r1!, {r2, r3, r5, r6, r7}
c0de9466:	a80a      	add	r0, sp, #40	@ 0x28
c0de9468:	2118      	movs	r1, #24
c0de946a:	f001 fd85 	bl	c0deaf78 <__aeabi_memclr>
c0de946e:	f8df b1b4 	ldr.w	fp, [pc, #436]	@ c0de9624 <displaySecurityReport+0x1e0>
c0de9472:	4620      	mov	r0, r4
c0de9474:	eb09 060b 	add.w	r6, r9, fp
c0de9478:	f7f9 fea4 	bl	c0de31c4 <nbgl_layoutGet>
c0de947c:	4604      	mov	r4, r0
c0de947e:	f8c6 0084 	str.w	r0, [r6, #132]	@ 0x84
c0de9482:	f896 0088 	ldrb.w	r0, [r6, #136]	@ 0x88
c0de9486:	2801      	cmp	r0, #1
c0de9488:	d14f      	bne.n	c0de952a <displaySecurityReport+0xe6>
c0de948a:	f896 0089 	ldrb.w	r0, [r6, #137]	@ 0x89
c0de948e:	2800      	cmp	r0, #0
c0de9490:	d14b      	bne.n	c0de952a <displaySecurityReport+0xe6>
c0de9492:	4868      	ldr	r0, [pc, #416]	@ (c0de9634 <displaySecurityReport+0x1f0>)
c0de9494:	2600      	movs	r6, #0
c0de9496:	ac01      	add	r4, sp, #4
c0de9498:	f04f 0800 	mov.w	r8, #0
c0de949c:	4478      	add	r0, pc
c0de949e:	1d05      	adds	r5, r0, #4
c0de94a0:	2e05      	cmp	r6, #5
c0de94a2:	d038      	beq.n	c0de9516 <displaySecurityReport+0xd2>
c0de94a4:	2e06      	cmp	r6, #6
c0de94a6:	d076      	beq.n	c0de9596 <displaySecurityReport+0x152>
c0de94a8:	eb09 000b 	add.w	r0, r9, fp
c0de94ac:	f8d0 a078 	ldr.w	sl, [r0, #120]	@ 0x78
c0de94b0:	f8da 0000 	ldr.w	r0, [sl]
c0de94b4:	40f0      	lsrs	r0, r6
c0de94b6:	07c0      	lsls	r0, r0, #31
c0de94b8:	d02d      	beq.n	c0de9516 <displaySecurityReport+0xd2>
c0de94ba:	4620      	mov	r0, r4
c0de94bc:	2118      	movs	r1, #24
c0de94be:	f001 fd5b 	bl	c0deaf78 <__aeabi_memclr>
c0de94c2:	f008 007f 	and.w	r0, r8, #127	@ 0x7f
c0de94c6:	2804      	cmp	r0, #4
c0de94c8:	d82a      	bhi.n	c0de9520 <displaySecurityReport+0xdc>
c0de94ca:	2101      	movs	r1, #1
c0de94cc:	fa01 f000 	lsl.w	r0, r1, r0
c0de94d0:	f010 0f19 	tst.w	r0, #25
c0de94d4:	d024      	beq.n	c0de9520 <displaySecurityReport+0xdc>
c0de94d6:	6868      	ldr	r0, [r5, #4]
c0de94d8:	9004      	str	r0, [sp, #16]
c0de94da:	6828      	ldr	r0, [r5, #0]
c0de94dc:	2e03      	cmp	r6, #3
c0de94de:	9002      	str	r0, [sp, #8]
c0de94e0:	d101      	bne.n	c0de94e6 <displaySecurityReport+0xa2>
c0de94e2:	20ff      	movs	r0, #255	@ 0xff
c0de94e4:	e007      	b.n	c0de94f6 <displaySecurityReport+0xb2>
c0de94e6:	2009      	movs	r0, #9
c0de94e8:	f88d 0018 	strb.w	r0, [sp, #24]
c0de94ec:	4852      	ldr	r0, [pc, #328]	@ (c0de9638 <displaySecurityReport+0x1f4>)
c0de94ee:	4478      	add	r0, pc
c0de94f0:	9003      	str	r0, [sp, #12]
c0de94f2:	f106 001a 	add.w	r0, r6, #26
c0de94f6:	f88d 0015 	strb.w	r0, [sp, #21]
c0de94fa:	f855 0c04 	ldr.w	r0, [r5, #-4]
c0de94fe:	eb09 070b 	add.w	r7, r9, fp
c0de9502:	4621      	mov	r1, r4
c0de9504:	9001      	str	r0, [sp, #4]
c0de9506:	f8d7 0084 	ldr.w	r0, [r7, #132]	@ 0x84
c0de950a:	f7fb f80a 	bl	c0de4522 <nbgl_layoutAddTouchableBar>
c0de950e:	f8d7 0084 	ldr.w	r0, [r7, #132]	@ 0x84
c0de9512:	f7fc fa79 	bl	c0de5a08 <nbgl_layoutAddSeparationLine>
c0de9516:	350c      	adds	r5, #12
c0de9518:	f108 0801 	add.w	r8, r8, #1
c0de951c:	3601      	adds	r6, #1
c0de951e:	e7bf      	b.n	c0de94a0 <displaySecurityReport+0x5c>
c0de9520:	f8da 0010 	ldr.w	r0, [sl, #16]
c0de9524:	2800      	cmp	r0, #0
c0de9526:	d1d7      	bne.n	c0de94d8 <displaySecurityReport+0x94>
c0de9528:	e7d5      	b.n	c0de94d6 <displaySecurityReport+0x92>
c0de952a:	eb09 000b 	add.w	r0, r9, fp
c0de952e:	6f80      	ldr	r0, [r0, #120]	@ 0x78
c0de9530:	b108      	cbz	r0, c0de9536 <displaySecurityReport+0xf2>
c0de9532:	68c6      	ldr	r6, [r0, #12]
c0de9534:	b90e      	cbnz	r6, c0de953a <displaySecurityReport+0xf6>
c0de9536:	4e41      	ldr	r6, [pc, #260]	@ (c0de963c <displaySecurityReport+0x1f8>)
c0de9538:	447e      	add	r6, pc
c0de953a:	f018 0f06 	tst.w	r8, #6
c0de953e:	d033      	beq.n	c0de95a8 <displaySecurityReport+0x164>
c0de9540:	f44f 3180 	mov.w	r1, #65536	@ 0x10000
c0de9544:	9104      	str	r1, [sp, #16]
c0de9546:	493e      	ldr	r1, [pc, #248]	@ (c0de9640 <displaySecurityReport+0x1fc>)
c0de9548:	4479      	add	r1, pc
c0de954a:	9103      	str	r1, [sp, #12]
c0de954c:	2140      	movs	r1, #64	@ 0x40
c0de954e:	6883      	ldr	r3, [r0, #8]
c0de9550:	4835      	ldr	r0, [pc, #212]	@ (c0de9628 <displaySecurityReport+0x1e4>)
c0de9552:	4448      	add	r0, r9
c0de9554:	9302      	str	r3, [sp, #8]
c0de9556:	f100 0440 	add.w	r4, r0, #64	@ 0x40
c0de955a:	9401      	str	r4, [sp, #4]
c0de955c:	4620      	mov	r0, r4
c0de955e:	4a39      	ldr	r2, [pc, #228]	@ (c0de9644 <displaySecurityReport+0x200>)
c0de9560:	447a      	add	r2, pc
c0de9562:	f001 f955 	bl	c0dea810 <snprintf>
c0de9566:	4620      	mov	r0, r4
c0de9568:	f001 fd62 	bl	c0deb030 <strlen>
c0de956c:	4605      	mov	r5, r0
c0de956e:	f000 fc19 	bl	c0de9da4 <OUTLINED_FUNCTION_9>
c0de9572:	a901      	add	r1, sp, #4
c0de9574:	f7fb ff09 	bl	c0de538a <nbgl_layoutAddQRCode>
c0de9578:	2018      	movs	r0, #24
c0de957a:	f1c5 013f 	rsb	r1, r5, #63	@ 0x3f
c0de957e:	4633      	mov	r3, r6
c0de9580:	f8ad 002c 	strh.w	r0, [sp, #44]	@ 0x2c
c0de9584:	1928      	adds	r0, r5, r4
c0de9586:	4a30      	ldr	r2, [pc, #192]	@ (c0de9648 <displaySecurityReport+0x204>)
c0de9588:	1c44      	adds	r4, r0, #1
c0de958a:	4620      	mov	r0, r4
c0de958c:	447a      	add	r2, pc
c0de958e:	f001 f93f 	bl	c0dea810 <snprintf>
c0de9592:	9412      	str	r4, [sp, #72]	@ 0x48
c0de9594:	e031      	b.n	c0de95fa <displaySecurityReport+0x1b6>
c0de9596:	4832      	ldr	r0, [pc, #200]	@ (c0de9660 <displaySecurityReport+0x21c>)
c0de9598:	4478      	add	r0, pc
c0de959a:	9012      	str	r0, [sp, #72]	@ 0x48
c0de959c:	f000 fc02 	bl	c0de9da4 <OUTLINED_FUNCTION_9>
c0de95a0:	a910      	add	r1, sp, #64	@ 0x40
c0de95a2:	f7fc fb63 	bl	c0de5c6c <nbgl_layoutAddHeader>
c0de95a6:	e034      	b.n	c0de9612 <displaySecurityReport+0x1ce>
c0de95a8:	ea5f 60c8 	movs.w	r0, r8, lsl #27
c0de95ac:	d40d      	bmi.n	c0de95ca <displaySecurityReport+0x186>
c0de95ae:	ea5f 70c8 	movs.w	r0, r8, lsl #31
c0de95b2:	d0f3      	beq.n	c0de959c <displaySecurityReport+0x158>
c0de95b4:	ad01      	add	r5, sp, #4
c0de95b6:	2124      	movs	r1, #36	@ 0x24
c0de95b8:	4628      	mov	r0, r5
c0de95ba:	f001 fcdd 	bl	c0deaf78 <__aeabi_memclr>
c0de95be:	4826      	ldr	r0, [pc, #152]	@ (c0de9658 <displaySecurityReport+0x214>)
c0de95c0:	4478      	add	r0, pc
c0de95c2:	9007      	str	r0, [sp, #28]
c0de95c4:	4825      	ldr	r0, [pc, #148]	@ (c0de965c <displaySecurityReport+0x218>)
c0de95c6:	4478      	add	r0, pc
c0de95c8:	e009      	b.n	c0de95de <displaySecurityReport+0x19a>
c0de95ca:	ad01      	add	r5, sp, #4
c0de95cc:	2124      	movs	r1, #36	@ 0x24
c0de95ce:	4628      	mov	r0, r5
c0de95d0:	f001 fcd2 	bl	c0deaf78 <__aeabi_memclr>
c0de95d4:	481d      	ldr	r0, [pc, #116]	@ (c0de964c <displaySecurityReport+0x208>)
c0de95d6:	4478      	add	r0, pc
c0de95d8:	9007      	str	r0, [sp, #28]
c0de95da:	481d      	ldr	r0, [pc, #116]	@ (c0de9650 <displaySecurityReport+0x20c>)
c0de95dc:	4478      	add	r0, pc
c0de95de:	9005      	str	r0, [sp, #20]
c0de95e0:	4629      	mov	r1, r5
c0de95e2:	481c      	ldr	r0, [pc, #112]	@ (c0de9654 <displaySecurityReport+0x210>)
c0de95e4:	4478      	add	r0, pc
c0de95e6:	9002      	str	r0, [sp, #8]
c0de95e8:	4620      	mov	r0, r4
c0de95ea:	f7fb fec5 	bl	c0de5378 <nbgl_layoutAddContentCenter>
c0de95ee:	2028      	movs	r0, #40	@ 0x28
c0de95f0:	f8ad 002c 	strh.w	r0, [sp, #44]	@ 0x2c
c0de95f4:	2000      	movs	r0, #0
c0de95f6:	f88d 0041 	strb.w	r0, [sp, #65]	@ 0x41
c0de95fa:	eb09 040b 	add.w	r4, r9, fp
c0de95fe:	f8d4 0084 	ldr.w	r0, [r4, #132]	@ 0x84
c0de9602:	a910      	add	r1, sp, #64	@ 0x40
c0de9604:	f7fc fb32 	bl	c0de5c6c <nbgl_layoutAddHeader>
c0de9608:	f8d4 0084 	ldr.w	r0, [r4, #132]	@ 0x84
c0de960c:	a90a      	add	r1, sp, #40	@ 0x28
c0de960e:	f7fa fbdb 	bl	c0de3dc8 <nbgl_layoutAddExtendedFooter>
c0de9612:	f000 fbc7 	bl	c0de9da4 <OUTLINED_FUNCTION_9>
c0de9616:	f7fc fe46 	bl	c0de62a6 <nbgl_layoutDraw>
c0de961a:	f001 f86e 	bl	c0dea6fa <nbgl_refresh>
c0de961e:	b01c      	add	sp, #112	@ 0x70
c0de9620:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de9624:	0000197c 	.word	0x0000197c
c0de9628:	00001ab4 	.word	0x00001ab4
c0de962c:	00004ff4 	.word	0x00004ff4
c0de9630:	00005006 	.word	0x00005006
c0de9634:	00004fdc 	.word	0x00004fdc
c0de9638:	000028b1 	.word	0x000028b1
c0de963c:	0000357b 	.word	0x0000357b
c0de9640:	000033bc 	.word	0x000033bc
c0de9644:	0000325b 	.word	0x0000325b
c0de9648:	0000330e 	.word	0x0000330e
c0de964c:	00003347 	.word	0x00003347
c0de9650:	00003435 	.word	0x00003435
c0de9654:	00002649 	.word	0x00002649
c0de9658:	0000306a 	.word	0x0000306a
c0de965c:	00003006 	.word	0x00003006
c0de9660:	0000329a 	.word	0x0000329a

c0de9664 <displayCustomizedSecurityReport>:
c0de9664:	b580      	push	{r7, lr}
c0de9666:	2117      	movs	r1, #23
c0de9668:	f000 f8f2 	bl	c0de9850 <displayModalDetails>
c0de966c:	4902      	ldr	r1, [pc, #8]	@ (c0de9678 <displayCustomizedSecurityReport+0x14>)
c0de966e:	4449      	add	r1, r9
c0de9670:	f8c1 0084 	str.w	r0, [r1, #132]	@ 0x84
c0de9674:	bd80      	pop	{r7, pc}
c0de9676:	bf00      	nop
c0de9678:	0000197c 	.word	0x0000197c

c0de967c <displayInfosListModal>:
c0de967c:	b570      	push	{r4, r5, r6, lr}
c0de967e:	b098      	sub	sp, #96	@ 0x60
c0de9680:	4606      	mov	r6, r0
c0de9682:	460c      	mov	r4, r1
c0de9684:	a811      	add	r0, sp, #68	@ 0x44
c0de9686:	491c      	ldr	r1, [pc, #112]	@ (c0de96f8 <displayInfosListModal+0x7c>)
c0de9688:	4615      	mov	r5, r2
c0de968a:	221c      	movs	r2, #28
c0de968c:	4479      	add	r1, pc
c0de968e:	f001 fc69 	bl	c0deaf64 <__aeabi_memcpy>
c0de9692:	2008      	movs	r0, #8
c0de9694:	f88d 0010 	strb.w	r0, [sp, #16]
c0de9698:	2000      	movs	r0, #0
c0de969a:	9003      	str	r0, [sp, #12]
c0de969c:	4814      	ldr	r0, [pc, #80]	@ (c0de96f0 <displayInfosListModal+0x74>)
c0de969e:	e9cd 6001 	strd	r6, r0, [sp, #4]
c0de96a2:	200f      	movs	r0, #15
c0de96a4:	2d00      	cmp	r5, #0
c0de96a6:	bf18      	it	ne
c0de96a8:	200e      	movne	r0, #14
c0de96aa:	f88d 0021 	strb.w	r0, [sp, #33]	@ 0x21
c0de96ae:	e894 0007 	ldmia.w	r4, {r0, r1, r2}
c0de96b2:	ab05      	add	r3, sp, #20
c0de96b4:	c307      	stmia	r3!, {r0, r1, r2}
c0de96b6:	7b20      	ldrb	r0, [r4, #12]
c0de96b8:	f88d 0020 	strb.w	r0, [sp, #32]
c0de96bc:	7ba0      	ldrb	r0, [r4, #14]
c0de96be:	4c0d      	ldr	r4, [pc, #52]	@ (c0de96f4 <displayInfosListModal+0x78>)
c0de96c0:	f88d 0022 	strb.w	r0, [sp, #34]	@ 0x22
c0de96c4:	eb09 0004 	add.w	r0, r9, r4
c0de96c8:	6a00      	ldr	r0, [r0, #32]
c0de96ca:	b108      	cbz	r0, c0de96d0 <displayInfosListModal+0x54>
c0de96cc:	f7fd fe85 	bl	c0de73da <nbgl_pageRelease>
c0de96d0:	480a      	ldr	r0, [pc, #40]	@ (c0de96fc <displayInfosListModal+0x80>)
c0de96d2:	a911      	add	r1, sp, #68	@ 0x44
c0de96d4:	aa01      	add	r2, sp, #4
c0de96d6:	2301      	movs	r3, #1
c0de96d8:	4478      	add	r0, pc
c0de96da:	f7fd fc57 	bl	c0de6f8c <nbgl_pageDrawGenericContentExt>
c0de96de:	eb09 0104 	add.w	r1, r9, r4
c0de96e2:	6208      	str	r0, [r1, #32]
c0de96e4:	2002      	movs	r0, #2
c0de96e6:	f001 f80d 	bl	c0dea704 <nbgl_refreshSpecial>
c0de96ea:	b018      	add	sp, #96	@ 0x60
c0de96ec:	bd70      	pop	{r4, r5, r6, pc}
c0de96ee:	bf00      	nop
c0de96f0:	00091400 	.word	0x00091400
c0de96f4:	00001c34 	.word	0x00001c34
c0de96f8:	00004e34 	.word	0x00004e34
c0de96fc:	ffffeff9 	.word	0xffffeff9

c0de9700 <modalLayoutTouchCallback>:
c0de9700:	b570      	push	{r4, r5, r6, lr}
c0de9702:	2818      	cmp	r0, #24
c0de9704:	d00c      	beq.n	c0de9720 <modalLayoutTouchCallback+0x20>
c0de9706:	2817      	cmp	r0, #23
c0de9708:	d019      	beq.n	c0de973e <modalLayoutTouchCallback+0x3e>
c0de970a:	2816      	cmp	r0, #22
c0de970c:	d128      	bne.n	c0de9760 <modalLayoutTouchCallback+0x60>
c0de970e:	484f      	ldr	r0, [pc, #316]	@ (c0de984c <modalLayoutTouchCallback+0x14c>)
c0de9710:	eb09 0400 	add.w	r4, r9, r0
c0de9714:	6da0      	ldr	r0, [r4, #88]	@ 0x58
c0de9716:	f7fc fde5 	bl	c0de62e4 <nbgl_layoutRelease>
c0de971a:	2000      	movs	r0, #0
c0de971c:	65a0      	str	r0, [r4, #88]	@ 0x58
c0de971e:	e055      	b.n	c0de97cc <modalLayoutTouchCallback+0xcc>
c0de9720:	4c49      	ldr	r4, [pc, #292]	@ (c0de9848 <modalLayoutTouchCallback+0x148>)
c0de9722:	eb09 0504 	add.w	r5, r9, r4
c0de9726:	6e68      	ldr	r0, [r5, #100]	@ 0x64
c0de9728:	f7fc fddc 	bl	c0de62e4 <nbgl_layoutRelease>
c0de972c:	f895 0068 	ldrb.w	r0, [r5, #104]	@ 0x68
c0de9730:	2801      	cmp	r0, #1
c0de9732:	d832      	bhi.n	c0de979a <modalLayoutTouchCallback+0x9a>
c0de9734:	eb09 0004 	add.w	r0, r9, r4
c0de9738:	2100      	movs	r1, #0
c0de973a:	6641      	str	r1, [r0, #100]	@ 0x64
c0de973c:	e046      	b.n	c0de97cc <modalLayoutTouchCallback+0xcc>
c0de973e:	4c42      	ldr	r4, [pc, #264]	@ (c0de9848 <modalLayoutTouchCallback+0x148>)
c0de9740:	eb09 0504 	add.w	r5, r9, r4
c0de9744:	f8d5 0084 	ldr.w	r0, [r5, #132]	@ 0x84
c0de9748:	f7fc fdcc 	bl	c0de62e4 <nbgl_layoutRelease>
c0de974c:	f895 0088 	ldrb.w	r0, [r5, #136]	@ 0x88
c0de9750:	2801      	cmp	r0, #1
c0de9752:	d829      	bhi.n	c0de97a8 <modalLayoutTouchCallback+0xa8>
c0de9754:	eb09 0004 	add.w	r0, r9, r4
c0de9758:	2100      	movs	r1, #0
c0de975a:	f8c0 1084 	str.w	r1, [r0, #132]	@ 0x84
c0de975e:	e035      	b.n	c0de97cc <modalLayoutTouchCallback+0xcc>
c0de9760:	f1a0 041a 	sub.w	r4, r0, #26
c0de9764:	2c05      	cmp	r4, #5
c0de9766:	d829      	bhi.n	c0de97bc <modalLayoutTouchCallback+0xbc>
c0de9768:	4d37      	ldr	r5, [pc, #220]	@ (c0de9848 <modalLayoutTouchCallback+0x148>)
c0de976a:	eb09 0005 	add.w	r0, r9, r5
c0de976e:	f890 008c 	ldrb.w	r0, [r0, #140]	@ 0x8c
c0de9772:	2802      	cmp	r0, #2
c0de9774:	d03d      	beq.n	c0de97f2 <modalLayoutTouchCallback+0xf2>
c0de9776:	2801      	cmp	r0, #1
c0de9778:	d164      	bne.n	c0de9844 <modalLayoutTouchCallback+0x144>
c0de977a:	eb09 0605 	add.w	r6, r9, r5
c0de977e:	f8d6 0084 	ldr.w	r0, [r6, #132]	@ 0x84
c0de9782:	f7fc fdaf 	bl	c0de62e4 <nbgl_layoutRelease>
c0de9786:	2002      	movs	r0, #2
c0de9788:	f886 0088 	strb.w	r0, [r6, #136]	@ 0x88
c0de978c:	6fb0      	ldr	r0, [r6, #120]	@ 0x78
c0de978e:	6801      	ldr	r1, [r0, #0]
c0de9790:	2900      	cmp	r1, #0
c0de9792:	d046      	beq.n	c0de9822 <modalLayoutTouchCallback+0x122>
c0de9794:	2001      	movs	r0, #1
c0de9796:	40a0      	lsls	r0, r4
c0de9798:	e00c      	b.n	c0de97b4 <modalLayoutTouchCallback+0xb4>
c0de979a:	444c      	add	r4, r9
c0de979c:	2001      	movs	r0, #1
c0de979e:	2118      	movs	r1, #24
c0de97a0:	f000 fb2b 	bl	c0de9dfa <OUTLINED_FUNCTION_19>
c0de97a4:	6660      	str	r0, [r4, #100]	@ 0x64
c0de97a6:	e013      	b.n	c0de97d0 <modalLayoutTouchCallback+0xd0>
c0de97a8:	eb09 0004 	add.w	r0, r9, r4
c0de97ac:	2101      	movs	r1, #1
c0de97ae:	f000 faed 	bl	c0de9d8c <OUTLINED_FUNCTION_6>
c0de97b2:	d011      	beq.n	c0de97d8 <modalLayoutTouchCallback+0xd8>
c0de97b4:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de97b8:	f7ff be44 	b.w	c0de9444 <displaySecurityReport>
c0de97bc:	4822      	ldr	r0, [pc, #136]	@ (c0de9848 <modalLayoutTouchCallback+0x148>)
c0de97be:	eb09 0400 	add.w	r4, r9, r0
c0de97c2:	6ae0      	ldr	r0, [r4, #44]	@ 0x2c
c0de97c4:	f7fc fd8e 	bl	c0de62e4 <nbgl_layoutRelease>
c0de97c8:	2000      	movs	r0, #0
c0de97ca:	62e0      	str	r0, [r4, #44]	@ 0x2c
c0de97cc:	f000 ffbd 	bl	c0dea74a <nbgl_screenRedraw>
c0de97d0:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de97d4:	f000 bf91 	b.w	c0dea6fa <nbgl_refresh>
c0de97d8:	eb09 0004 	add.w	r0, r9, r4
c0de97dc:	2214      	movs	r2, #20
c0de97de:	f890 0089 	ldrb.w	r0, [r0, #137]	@ 0x89
c0de97e2:	2800      	cmp	r0, #0
c0de97e4:	bf08      	it	eq
c0de97e6:	2218      	moveq	r2, #24
c0de97e8:	5888      	ldr	r0, [r1, r2]
c0de97ea:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
c0de97ee:	f7ff bf39 	b.w	c0de9664 <displayCustomizedSecurityReport>
c0de97f2:	eb09 0105 	add.w	r1, r9, r5
c0de97f6:	202c      	movs	r0, #44	@ 0x2c
c0de97f8:	6dc9      	ldr	r1, [r1, #92]	@ 0x5c
c0de97fa:	fb04 f200 	mul.w	r2, r4, r0
c0de97fe:	6989      	ldr	r1, [r1, #24]
c0de9800:	588a      	ldr	r2, [r1, r2]
c0de9802:	b1fa      	cbz	r2, c0de9844 <modalLayoutTouchCallback+0x144>
c0de9804:	444d      	add	r5, r9
c0de9806:	fb04 1400 	mla	r4, r4, r0, r1
c0de980a:	6e68      	ldr	r0, [r5, #100]	@ 0x64
c0de980c:	f7fc fd6a 	bl	c0de62e4 <nbgl_layoutRelease>
c0de9810:	2002      	movs	r0, #2
c0de9812:	2118      	movs	r1, #24
c0de9814:	f885 0068 	strb.w	r0, [r5, #104]	@ 0x68
c0de9818:	4620      	mov	r0, r4
c0de981a:	f000 f819 	bl	c0de9850 <displayModalDetails>
c0de981e:	6668      	str	r0, [r5, #100]	@ 0x64
c0de9820:	e010      	b.n	c0de9844 <modalLayoutTouchCallback+0x144>
c0de9822:	eb09 0105 	add.w	r1, r9, r5
c0de9826:	2214      	movs	r2, #20
c0de9828:	f891 1089 	ldrb.w	r1, [r1, #137]	@ 0x89
c0de982c:	2900      	cmp	r1, #0
c0de982e:	bf08      	it	eq
c0de9830:	2218      	moveq	r2, #24
c0de9832:	5880      	ldr	r0, [r0, r2]
c0de9834:	7901      	ldrb	r1, [r0, #4]
c0de9836:	2903      	cmp	r1, #3
c0de9838:	d104      	bne.n	c0de9844 <modalLayoutTouchCallback+0x144>
c0de983a:	6980      	ldr	r0, [r0, #24]
c0de983c:	212c      	movs	r1, #44	@ 0x2c
c0de983e:	fb04 0001 	mla	r0, r4, r1, r0
c0de9842:	e7d2      	b.n	c0de97ea <modalLayoutTouchCallback+0xea>
c0de9844:	bd70      	pop	{r4, r5, r6, pc}
c0de9846:	bf00      	nop
c0de9848:	0000197c 	.word	0x0000197c
c0de984c:	00001cb0 	.word	0x00001cb0

c0de9850 <displayModalDetails>:
c0de9850:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0de9854:	b092      	sub	sp, #72	@ 0x48
c0de9856:	460d      	mov	r5, r1
c0de9858:	ae0b      	add	r6, sp, #44	@ 0x2c
c0de985a:	4938      	ldr	r1, [pc, #224]	@ (c0de993c <displayModalDetails+0xec>)
c0de985c:	4604      	mov	r4, r0
c0de985e:	221c      	movs	r2, #28
c0de9860:	4630      	mov	r0, r6
c0de9862:	4479      	add	r1, pc
c0de9864:	f001 fb7e 	bl	c0deaf64 <__aeabi_memcpy>
c0de9868:	af06      	add	r7, sp, #24
c0de986a:	2114      	movs	r1, #20
c0de986c:	4638      	mov	r0, r7
c0de986e:	f001 fb83 	bl	c0deaf78 <__aeabi_memclr>
c0de9872:	2009      	movs	r0, #9
c0de9874:	f88d 5024 	strb.w	r5, [sp, #36]	@ 0x24
c0de9878:	f88d 0025 	strb.w	r0, [sp, #37]	@ 0x25
c0de987c:	f240 1001 	movw	r0, #257	@ 0x101
c0de9880:	f8ad 0018 	strh.w	r0, [sp, #24]
c0de9884:	4630      	mov	r0, r6
c0de9886:	f7f9 fc9d 	bl	c0de31c4 <nbgl_layoutGet>
c0de988a:	4605      	mov	r5, r0
c0de988c:	6820      	ldr	r0, [r4, #0]
c0de988e:	4639      	mov	r1, r7
c0de9890:	9008      	str	r0, [sp, #32]
c0de9892:	4628      	mov	r0, r5
c0de9894:	f7fc f9ea 	bl	c0de5c6c <nbgl_layoutAddHeader>
c0de9898:	7920      	ldrb	r0, [r4, #4]
c0de989a:	2801      	cmp	r0, #1
c0de989c:	d035      	beq.n	c0de990a <displayModalDetails+0xba>
c0de989e:	2802      	cmp	r0, #2
c0de98a0:	d03c      	beq.n	c0de991c <displayModalDetails+0xcc>
c0de98a2:	2803      	cmp	r0, #3
c0de98a4:	d141      	bne.n	c0de992a <displayModalDetails+0xda>
c0de98a6:	4f26      	ldr	r7, [pc, #152]	@ (c0de9940 <displayModalDetails+0xf0>)
c0de98a8:	f04f 0a00 	mov.w	sl, #0
c0de98ac:	2604      	movs	r6, #4
c0de98ae:	46e8      	mov	r8, sp
c0de98b0:	f04f 0b00 	mov.w	fp, #0
c0de98b4:	447f      	add	r7, pc
c0de98b6:	7a20      	ldrb	r0, [r4, #8]
c0de98b8:	4583      	cmp	fp, r0
c0de98ba:	d236      	bcs.n	c0de992a <displayModalDetails+0xda>
c0de98bc:	f104 030c 	add.w	r3, r4, #12
c0de98c0:	cb0f      	ldmia	r3, {r0, r1, r2, r3}
c0de98c2:	f850 002b 	ldr.w	r0, [r0, fp, lsl #2]
c0de98c6:	9001      	str	r0, [sp, #4]
c0de98c8:	f851 002b 	ldr.w	r0, [r1, fp, lsl #2]
c0de98cc:	4641      	mov	r1, r8
c0de98ce:	9003      	str	r0, [sp, #12]
c0de98d0:	5d98      	ldrb	r0, [r3, r6]
c0de98d2:	2800      	cmp	r0, #0
c0de98d4:	bf18      	it	ne
c0de98d6:	4638      	movne	r0, r7
c0de98d8:	9002      	str	r0, [sp, #8]
c0de98da:	f88d a012 	strb.w	sl, [sp, #18]
c0de98de:	f88d a010 	strb.w	sl, [sp, #16]
c0de98e2:	2009      	movs	r0, #9
c0de98e4:	f88d 0014 	strb.w	r0, [sp, #20]
c0de98e8:	f10b 001a 	add.w	r0, fp, #26
c0de98ec:	f88d 0011 	strb.w	r0, [sp, #17]
c0de98f0:	f852 002b 	ldr.w	r0, [r2, fp, lsl #2]
c0de98f4:	9000      	str	r0, [sp, #0]
c0de98f6:	4628      	mov	r0, r5
c0de98f8:	f7fa fe13 	bl	c0de4522 <nbgl_layoutAddTouchableBar>
c0de98fc:	4628      	mov	r0, r5
c0de98fe:	f7fc f883 	bl	c0de5a08 <nbgl_layoutAddSeparationLine>
c0de9902:	362c      	adds	r6, #44	@ 0x2c
c0de9904:	f10b 0b01 	add.w	fp, fp, #1
c0de9908:	e7d5      	b.n	c0de98b6 <displayModalDetails+0x66>
c0de990a:	f104 0108 	add.w	r1, r4, #8
c0de990e:	4628      	mov	r0, r5
c0de9910:	f7fb fd32 	bl	c0de5378 <nbgl_layoutAddContentCenter>
c0de9914:	2000      	movs	r0, #0
c0de9916:	f88d 0019 	strb.w	r0, [sp, #25]
c0de991a:	e006      	b.n	c0de992a <displayModalDetails+0xda>
c0de991c:	f104 0108 	add.w	r1, r4, #8
c0de9920:	4628      	mov	r0, r5
c0de9922:	f7fb fd32 	bl	c0de538a <nbgl_layoutAddQRCode>
c0de9926:	6820      	ldr	r0, [r4, #0]
c0de9928:	9008      	str	r0, [sp, #32]
c0de992a:	4628      	mov	r0, r5
c0de992c:	f7fc fcbb 	bl	c0de62a6 <nbgl_layoutDraw>
c0de9930:	f000 fee3 	bl	c0dea6fa <nbgl_refresh>
c0de9934:	4628      	mov	r0, r5
c0de9936:	b012      	add	sp, #72	@ 0x48
c0de9938:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0de993c:	00004be6 	.word	0x00004be6
c0de9940:	000024eb 	.word	0x000024eb

c0de9944 <displayDetailsPage>:
c0de9944:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de9948:	b09b      	sub	sp, #108	@ 0x6c
c0de994a:	f8df a190 	ldr.w	sl, [pc, #400]	@ c0de9adc <displayDetailsPage+0x198>
c0de994e:	4604      	mov	r4, r0
c0de9950:	f88d 004c 	strb.w	r0, [sp, #76]	@ 0x4c
c0de9954:	2000      	movs	r0, #0
c0de9956:	460e      	mov	r6, r1
c0de9958:	495f      	ldr	r1, [pc, #380]	@ (c0de9ad8 <displayDetailsPage+0x194>)
c0de995a:	9018      	str	r0, [sp, #96]	@ 0x60
c0de995c:	f88d 0058 	strb.w	r0, [sp, #88]	@ 0x58
c0de9960:	9015      	str	r0, [sp, #84]	@ 0x54
c0de9962:	f44f 6010 	mov.w	r0, #2304	@ 0x900
c0de9966:	eb09 050a 	add.w	r5, r9, sl
c0de996a:	f8ad 0050 	strh.w	r0, [sp, #80]	@ 0x50
c0de996e:	f44f 7081 	mov.w	r0, #258	@ 0x102
c0de9972:	9117      	str	r1, [sp, #92]	@ 0x5c
c0de9974:	2140      	movs	r1, #64	@ 0x40
c0de9976:	f895 8030 	ldrb.w	r8, [r5, #48]	@ 0x30
c0de997a:	f8ad 004e 	strh.w	r0, [sp, #78]	@ 0x4e
c0de997e:	f88d 804d 	strb.w	r8, [sp, #77]	@ 0x4d
c0de9982:	a803      	add	r0, sp, #12
c0de9984:	f001 faf8 	bl	c0deaf78 <__aeabi_memclr>
c0de9988:	2001      	movs	r0, #1
c0de998a:	f88d 0029 	strb.w	r0, [sp, #41]	@ 0x29
c0de998e:	f88d 0024 	strb.w	r0, [sp, #36]	@ 0x24
c0de9992:	f105 0040 	add.w	r0, r5, #64	@ 0x40
c0de9996:	9007      	str	r0, [sp, #28]
c0de9998:	2004      	movs	r0, #4
c0de999a:	f88d 0018 	strb.w	r0, [sp, #24]
c0de999e:	f895 0033 	ldrb.w	r0, [r5, #51]	@ 0x33
c0de99a2:	f88d 002a 	strb.w	r0, [sp, #42]	@ 0x2a
c0de99a6:	6a28      	ldr	r0, [r5, #32]
c0de99a8:	b108      	cbz	r0, c0de99ae <displayDetailsPage+0x6a>
c0de99aa:	f7fd fd16 	bl	c0de73da <nbgl_pageRelease>
c0de99ae:	eb09 000a 	add.w	r0, r9, sl
c0de99b2:	6b41      	ldr	r1, [r0, #52]	@ 0x34
c0de99b4:	6401      	str	r1, [r0, #64]	@ 0x40
c0de99b6:	f890 0031 	ldrb.w	r0, [r0, #49]	@ 0x31
c0de99ba:	42a0      	cmp	r0, r4
c0de99bc:	d207      	bcs.n	c0de99ce <displayDetailsPage+0x8a>
c0de99be:	2501      	movs	r5, #1
c0de99c0:	eb09 000a 	add.w	r0, r9, sl
c0de99c4:	2e00      	cmp	r6, #0
c0de99c6:	bf18      	it	ne
c0de99c8:	2502      	movne	r5, #2
c0de99ca:	6bc6      	ldr	r6, [r0, #60]	@ 0x3c
c0de99cc:	e02d      	b.n	c0de9a2a <displayDetailsPage+0xe6>
c0de99ce:	eb09 000a 	add.w	r0, r9, sl
c0de99d2:	2500      	movs	r5, #0
c0de99d4:	f10d 076a 	add.w	r7, sp, #106	@ 0x6a
c0de99d8:	6b86      	ldr	r6, [r0, #56]	@ 0x38
c0de99da:	42a5      	cmp	r5, r4
c0de99dc:	d224      	bcs.n	c0de9a28 <displayDetailsPage+0xe4>
c0de99de:	200c      	movs	r0, #12
c0de99e0:	4631      	mov	r1, r6
c0de99e2:	f000 f9f8 	bl	c0de9dd6 <OUTLINED_FUNCTION_15>
c0de99e6:	280c      	cmp	r0, #12
c0de99e8:	d31c      	bcc.n	c0de9a24 <displayDetailsPage+0xe0>
c0de99ea:	eb09 000a 	add.w	r0, r9, sl
c0de99ee:	4631      	mov	r1, r6
c0de99f0:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de99f4:	230b      	movs	r3, #11
c0de99f6:	f890 0033 	ldrb.w	r0, [r0, #51]	@ 0x33
c0de99fa:	e9cd 7000 	strd	r7, r0, [sp]
c0de99fe:	200c      	movs	r0, #12
c0de9a00:	f000 fedf 	bl	c0dea7c2 <nbgl_getTextMaxLenInNbLines>
c0de9a04:	f8bd 006a 	ldrh.w	r0, [sp, #106]	@ 0x6a
c0de9a08:	5c31      	ldrb	r1, [r6, r0]
c0de9a0a:	290a      	cmp	r1, #10
c0de9a0c:	d101      	bne.n	c0de9a12 <displayDetailsPage+0xce>
c0de9a0e:	3001      	adds	r0, #1
c0de9a10:	e006      	b.n	c0de9a20 <displayDetailsPage+0xdc>
c0de9a12:	eb09 010a 	add.w	r1, r9, sl
c0de9a16:	f891 1033 	ldrb.w	r1, [r1, #51]	@ 0x33
c0de9a1a:	2900      	cmp	r1, #0
c0de9a1c:	bf08      	it	eq
c0de9a1e:	3803      	subeq	r0, #3
c0de9a20:	b280      	uxth	r0, r0
c0de9a22:	4406      	add	r6, r0
c0de9a24:	3501      	adds	r5, #1
c0de9a26:	e7d8      	b.n	c0de99da <displayDetailsPage+0x96>
c0de9a28:	2502      	movs	r5, #2
c0de9a2a:	eb09 000a 	add.w	r0, r9, sl
c0de9a2e:	4631      	mov	r1, r6
c0de9a30:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de9a34:	f890 3033 	ldrb.w	r3, [r0, #51]	@ 0x33
c0de9a38:	f880 4031 	strb.w	r4, [r0, #49]	@ 0x31
c0de9a3c:	6446      	str	r6, [r0, #68]	@ 0x44
c0de9a3e:	200c      	movs	r0, #12
c0de9a40:	f000 feb5 	bl	c0dea7ae <nbgl_getTextNbLinesInWidth>
c0de9a44:	280c      	cmp	r0, #12
c0de9a46:	d319      	bcc.n	c0de9a7c <displayDetailsPage+0x138>
c0de9a48:	eb09 040a 	add.w	r4, r9, sl
c0de9a4c:	f10d 026a 	add.w	r2, sp, #106	@ 0x6a
c0de9a50:	230b      	movs	r3, #11
c0de9a52:	f894 0033 	ldrb.w	r0, [r4, #51]	@ 0x33
c0de9a56:	6c61      	ldr	r1, [r4, #68]	@ 0x44
c0de9a58:	e9cd 2000 	strd	r2, r0, [sp]
c0de9a5c:	200c      	movs	r0, #12
c0de9a5e:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de9a62:	f000 feae 	bl	c0dea7c2 <nbgl_getTextMaxLenInNbLines>
c0de9a66:	2000      	movs	r0, #0
c0de9a68:	f8bd 106a 	ldrh.w	r1, [sp, #106]	@ 0x6a
c0de9a6c:	f88d 0026 	strb.w	r0, [sp, #38]	@ 0x26
c0de9a70:	6c60      	ldr	r0, [r4, #68]	@ 0x44
c0de9a72:	5c42      	ldrb	r2, [r0, r1]
c0de9a74:	2a0a      	cmp	r2, #10
c0de9a76:	d108      	bne.n	c0de9a8a <displayDetailsPage+0x146>
c0de9a78:	3101      	adds	r1, #1
c0de9a7a:	e00f      	b.n	c0de9a9c <displayDetailsPage+0x158>
c0de9a7c:	2100      	movs	r1, #0
c0de9a7e:	eb09 000a 	add.w	r0, r9, sl
c0de9a82:	63c1      	str	r1, [r0, #60]	@ 0x3c
c0de9a84:	f88d 1027 	strb.w	r1, [sp, #39]	@ 0x27
c0de9a88:	e010      	b.n	c0de9aac <displayDetailsPage+0x168>
c0de9a8a:	eb09 020a 	add.w	r2, r9, sl
c0de9a8e:	f892 2033 	ldrb.w	r2, [r2, #51]	@ 0x33
c0de9a92:	b91a      	cbnz	r2, c0de9a9c <displayDetailsPage+0x158>
c0de9a94:	2201      	movs	r2, #1
c0de9a96:	3903      	subs	r1, #3
c0de9a98:	f88d 2026 	strb.w	r2, [sp, #38]	@ 0x26
c0de9a9c:	b289      	uxth	r1, r1
c0de9a9e:	eb09 020a 	add.w	r2, r9, sl
c0de9aa2:	4408      	add	r0, r1
c0de9aa4:	63d0      	str	r0, [r2, #60]	@ 0x3c
c0de9aa6:	200b      	movs	r0, #11
c0de9aa8:	f88d 0027 	strb.w	r0, [sp, #39]	@ 0x27
c0de9aac:	f1b8 0f01 	cmp.w	r8, #1
c0de9ab0:	d102      	bne.n	c0de9ab8 <displayDetailsPage+0x174>
c0de9ab2:	480b      	ldr	r0, [pc, #44]	@ (c0de9ae0 <displayDetailsPage+0x19c>)
c0de9ab4:	4478      	add	r0, pc
c0de9ab6:	9018      	str	r0, [sp, #96]	@ 0x60
c0de9ab8:	480a      	ldr	r0, [pc, #40]	@ (c0de9ae4 <displayDetailsPage+0x1a0>)
c0de9aba:	a913      	add	r1, sp, #76	@ 0x4c
c0de9abc:	aa03      	add	r2, sp, #12
c0de9abe:	2301      	movs	r3, #1
c0de9ac0:	4478      	add	r0, pc
c0de9ac2:	f7fd fa63 	bl	c0de6f8c <nbgl_pageDrawGenericContentExt>
c0de9ac6:	eb09 010a 	add.w	r1, r9, sl
c0de9aca:	6208      	str	r0, [r1, #32]
c0de9acc:	4628      	mov	r0, r5
c0de9ace:	f000 fe19 	bl	c0dea704 <nbgl_refreshSpecial>
c0de9ad2:	b01b      	add	sp, #108	@ 0x6c
c0de9ad4:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}
c0de9ad8:	03000101 	.word	0x03000101
c0de9adc:	00001c34 	.word	0x00001c34
c0de9ae0:	00002e32 	.word	0x00002e32
c0de9ae4:	ffffec11 	.word	0xffffec11

c0de9ae8 <displayTagValueListModalPage>:
c0de9ae8:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0de9aec:	b098      	sub	sp, #96	@ 0x60
c0de9aee:	4e44      	ldr	r6, [pc, #272]	@ (c0de9c00 <displayTagValueListModalPage+0x118>)
c0de9af0:	4605      	mov	r5, r0
c0de9af2:	f88d 0044 	strb.w	r0, [sp, #68]	@ 0x44
c0de9af6:	2000      	movs	r0, #0
c0de9af8:	4688      	mov	r8, r1
c0de9afa:	4940      	ldr	r1, [pc, #256]	@ (c0de9bfc <displayTagValueListModalPage+0x114>)
c0de9afc:	9016      	str	r0, [sp, #88]	@ 0x58
c0de9afe:	f88d 0050 	strb.w	r0, [sp, #80]	@ 0x50
c0de9b02:	9013      	str	r0, [sp, #76]	@ 0x4c
c0de9b04:	f44f 6010 	mov.w	r0, #2304	@ 0x900
c0de9b08:	eb09 0406 	add.w	r4, r9, r6
c0de9b0c:	f8ad 0048 	strh.w	r0, [sp, #72]	@ 0x48
c0de9b10:	f44f 7081 	mov.w	r0, #258	@ 0x102
c0de9b14:	9115      	str	r1, [sp, #84]	@ 0x54
c0de9b16:	2140      	movs	r1, #64	@ 0x40
c0de9b18:	f894 7030 	ldrb.w	r7, [r4, #48]	@ 0x30
c0de9b1c:	f8ad 0046 	strh.w	r0, [sp, #70]	@ 0x46
c0de9b20:	f88d 7045 	strb.w	r7, [sp, #69]	@ 0x45
c0de9b24:	a801      	add	r0, sp, #4
c0de9b26:	f001 fa27 	bl	c0deaf78 <__aeabi_memclr>
c0de9b2a:	2001      	movs	r0, #1
c0de9b2c:	f894 1031 	ldrb.w	r1, [r4, #49]	@ 0x31
c0de9b30:	f894 2033 	ldrb.w	r2, [r4, #51]	@ 0x33
c0de9b34:	f88d 0021 	strb.w	r0, [sp, #33]	@ 0x21
c0de9b38:	2004      	movs	r0, #4
c0de9b3a:	42a9      	cmp	r1, r5
c0de9b3c:	f88d 0010 	strb.w	r0, [sp, #16]
c0de9b40:	f88d 2022 	strb.w	r2, [sp, #34]	@ 0x22
c0de9b44:	d91b      	bls.n	c0de9b7e <displayTagValueListModalPage+0x96>
c0de9b46:	1c69      	adds	r1, r5, #1
c0de9b48:	eb09 0306 	add.w	r3, r9, r6
c0de9b4c:	ea00 0281 	and.w	r2, r0, r1, lsl #2
c0de9b50:	b2c9      	uxtb	r1, r1
c0de9b52:	f103 0450 	add.w	r4, r3, #80	@ 0x50
c0de9b56:	ea00 0085 	and.w	r0, r0, r5, lsl #2
c0de9b5a:	0849      	lsrs	r1, r1, #1
c0de9b5c:	5c61      	ldrb	r1, [r4, r1]
c0de9b5e:	40d1      	lsrs	r1, r2
c0de9b60:	f893 2032 	ldrb.w	r2, [r3, #50]	@ 0x32
c0de9b64:	f001 0107 	and.w	r1, r1, #7
c0de9b68:	1a52      	subs	r2, r2, r1
c0de9b6a:	0869      	lsrs	r1, r5, #1
c0de9b6c:	5c61      	ldrb	r1, [r4, r1]
c0de9b6e:	f883 2032 	strb.w	r2, [r3, #50]	@ 0x32
c0de9b72:	fa21 f000 	lsr.w	r0, r1, r0
c0de9b76:	f000 0107 	and.w	r1, r0, #7
c0de9b7a:	1a50      	subs	r0, r2, r1
c0de9b7c:	e00d      	b.n	c0de9b9a <displayTagValueListModalPage+0xb2>
c0de9b7e:	eb09 0206 	add.w	r2, r9, r6
c0de9b82:	ea00 0085 	and.w	r0, r0, r5, lsl #2
c0de9b86:	eb02 0155 	add.w	r1, r2, r5, lsr #1
c0de9b8a:	f891 1050 	ldrb.w	r1, [r1, #80]	@ 0x50
c0de9b8e:	fa21 f000 	lsr.w	r0, r1, r0
c0de9b92:	f000 0107 	and.w	r1, r0, #7
c0de9b96:	f892 0032 	ldrb.w	r0, [r2, #50]	@ 0x32
c0de9b9a:	4b1a      	ldr	r3, [pc, #104]	@ (c0de9c04 <displayTagValueListModalPage+0x11c>)
c0de9b9c:	eb09 0206 	add.w	r2, r9, r6
c0de9ba0:	2f01      	cmp	r7, #1
c0de9ba2:	f882 5031 	strb.w	r5, [r2, #49]	@ 0x31
c0de9ba6:	444b      	add	r3, r9
c0de9ba8:	6b9b      	ldr	r3, [r3, #56]	@ 0x38
c0de9baa:	681b      	ldr	r3, [r3, #0]
c0de9bac:	f88d 101c 	strb.w	r1, [sp, #28]
c0de9bb0:	4401      	add	r1, r0
c0de9bb2:	b2c0      	uxtb	r0, r0
c0de9bb4:	f882 1032 	strb.w	r1, [r2, #50]	@ 0x32
c0de9bb8:	eb03 1000 	add.w	r0, r3, r0, lsl #4
c0de9bbc:	9005      	str	r0, [sp, #20]
c0de9bbe:	d102      	bne.n	c0de9bc6 <displayTagValueListModalPage+0xde>
c0de9bc0:	4811      	ldr	r0, [pc, #68]	@ (c0de9c08 <displayTagValueListModalPage+0x120>)
c0de9bc2:	4478      	add	r0, pc
c0de9bc4:	9016      	str	r0, [sp, #88]	@ 0x58
c0de9bc6:	eb09 0006 	add.w	r0, r9, r6
c0de9bca:	6a00      	ldr	r0, [r0, #32]
c0de9bcc:	b108      	cbz	r0, c0de9bd2 <displayTagValueListModalPage+0xea>
c0de9bce:	f7fd fc04 	bl	c0de73da <nbgl_pageRelease>
c0de9bd2:	480e      	ldr	r0, [pc, #56]	@ (c0de9c0c <displayTagValueListModalPage+0x124>)
c0de9bd4:	a911      	add	r1, sp, #68	@ 0x44
c0de9bd6:	aa01      	add	r2, sp, #4
c0de9bd8:	2301      	movs	r3, #1
c0de9bda:	2501      	movs	r5, #1
c0de9bdc:	4478      	add	r0, pc
c0de9bde:	f7fd f9d5 	bl	c0de6f8c <nbgl_pageDrawGenericContentExt>
c0de9be2:	eb09 0106 	add.w	r1, r9, r6
c0de9be6:	f1b8 0f00 	cmp.w	r8, #0
c0de9bea:	6208      	str	r0, [r1, #32]
c0de9bec:	bf18      	it	ne
c0de9bee:	2502      	movne	r5, #2
c0de9bf0:	4628      	mov	r0, r5
c0de9bf2:	f000 fd87 	bl	c0dea704 <nbgl_refreshSpecial>
c0de9bf6:	b018      	add	sp, #96	@ 0x60
c0de9bf8:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
c0de9bfc:	04000101 	.word	0x04000101
c0de9c00:	00001c34 	.word	0x00001c34
c0de9c04:	0000197c 	.word	0x0000197c
c0de9c08:	00002d24 	.word	0x00002d24
c0de9c0c:	ffffeaf5 	.word	0xffffeaf5

c0de9c10 <bundleNavReviewChoice>:
c0de9c10:	b110      	cbz	r0, c0de9c18 <bundleNavReviewChoice+0x8>
c0de9c12:	4805      	ldr	r0, [pc, #20]	@ (c0de9c28 <bundleNavReviewChoice+0x18>)
c0de9c14:	f000 b8db 	b.w	c0de9dce <OUTLINED_FUNCTION_13>
c0de9c18:	4803      	ldr	r0, [pc, #12]	@ (c0de9c28 <bundleNavReviewChoice+0x18>)
c0de9c1a:	f859 0000 	ldr.w	r0, [r9, r0]
c0de9c1e:	4903      	ldr	r1, [pc, #12]	@ (c0de9c2c <bundleNavReviewChoice+0x1c>)
c0de9c20:	4479      	add	r1, pc
c0de9c22:	f000 b863 	b.w	c0de9cec <bundleNavReviewAskRejectionConfirmation>
c0de9c26:	bf00      	nop
c0de9c28:	00001cb0 	.word	0x00001cb0
c0de9c2c:	0000011d 	.word	0x0000011d

c0de9c30 <initWarningTipBox>:
c0de9c30:	4923      	ldr	r1, [pc, #140]	@ (c0de9cc0 <initWarningTipBox+0x90>)
c0de9c32:	eb09 0201 	add.w	r2, r9, r1
c0de9c36:	6f92      	ldr	r2, [r2, #120]	@ 0x78
c0de9c38:	b15a      	cbz	r2, c0de9c52 <initWarningTipBox+0x22>
c0de9c3a:	6812      	ldr	r2, [r2, #0]
c0de9c3c:	07d3      	lsls	r3, r2, #31
c0de9c3e:	d111      	bne.n	c0de9c64 <initWarningTipBox+0x34>
c0de9c40:	0753      	lsls	r3, r2, #29
c0de9c42:	d415      	bmi.n	c0de9c70 <initWarningTipBox+0x40>
c0de9c44:	0793      	lsls	r3, r2, #30
c0de9c46:	d419      	bmi.n	c0de9c7c <initWarningTipBox+0x4c>
c0de9c48:	f002 0310 	and.w	r3, r2, #16
c0de9c4c:	0712      	lsls	r2, r2, #28
c0de9c4e:	d42c      	bmi.n	c0de9caa <initWarningTipBox+0x7a>
c0de9c50:	bb9b      	cbnz	r3, c0de9cba <initWarningTipBox+0x8a>
c0de9c52:	b348      	cbz	r0, c0de9ca8 <initWarningTipBox+0x78>
c0de9c54:	491b      	ldr	r1, [pc, #108]	@ (c0de9cc4 <initWarningTipBox+0x94>)
c0de9c56:	2200      	movs	r2, #0
c0de9c58:	4449      	add	r1, r9
c0de9c5a:	620a      	str	r2, [r1, #32]
c0de9c5c:	6842      	ldr	r2, [r0, #4]
c0de9c5e:	62ca      	str	r2, [r1, #44]	@ 0x2c
c0de9c60:	6800      	ldr	r0, [r0, #0]
c0de9c62:	e01b      	b.n	c0de9c9c <initWarningTipBox+0x6c>
c0de9c64:	06d0      	lsls	r0, r2, #27
c0de9c66:	4a18      	ldr	r2, [pc, #96]	@ (c0de9cc8 <initWarningTipBox+0x98>)
c0de9c68:	4818      	ldr	r0, [pc, #96]	@ (c0de9ccc <initWarningTipBox+0x9c>)
c0de9c6a:	447a      	add	r2, pc
c0de9c6c:	4478      	add	r0, pc
c0de9c6e:	e00a      	b.n	c0de9c86 <initWarningTipBox+0x56>
c0de9c70:	06d0      	lsls	r0, r2, #27
c0de9c72:	4a17      	ldr	r2, [pc, #92]	@ (c0de9cd0 <initWarningTipBox+0xa0>)
c0de9c74:	4817      	ldr	r0, [pc, #92]	@ (c0de9cd4 <initWarningTipBox+0xa4>)
c0de9c76:	447a      	add	r2, pc
c0de9c78:	4478      	add	r0, pc
c0de9c7a:	e004      	b.n	c0de9c86 <initWarningTipBox+0x56>
c0de9c7c:	06d0      	lsls	r0, r2, #27
c0de9c7e:	4a16      	ldr	r2, [pc, #88]	@ (c0de9cd8 <initWarningTipBox+0xa8>)
c0de9c80:	4816      	ldr	r0, [pc, #88]	@ (c0de9cdc <initWarningTipBox+0xac>)
c0de9c82:	447a      	add	r2, pc
c0de9c84:	4478      	add	r0, pc
c0de9c86:	bf58      	it	pl
c0de9c88:	4610      	movpl	r0, r2
c0de9c8a:	4449      	add	r1, r9
c0de9c8c:	2201      	movs	r2, #1
c0de9c8e:	f881 2021 	strb.w	r2, [r1, #33]	@ 0x21
c0de9c92:	490c      	ldr	r1, [pc, #48]	@ (c0de9cc4 <initWarningTipBox+0x94>)
c0de9c94:	2200      	movs	r2, #0
c0de9c96:	4449      	add	r1, r9
c0de9c98:	620a      	str	r2, [r1, #32]
c0de9c9a:	62ca      	str	r2, [r1, #44]	@ 0x2c
c0de9c9c:	4909      	ldr	r1, [pc, #36]	@ (c0de9cc4 <initWarningTipBox+0x94>)
c0de9c9e:	f640 1213 	movw	r2, #2323	@ 0x913
c0de9ca2:	4449      	add	r1, r9
c0de9ca4:	860a      	strh	r2, [r1, #48]	@ 0x30
c0de9ca6:	6288      	str	r0, [r1, #40]	@ 0x28
c0de9ca8:	4770      	bx	lr
c0de9caa:	4a0d      	ldr	r2, [pc, #52]	@ (c0de9ce0 <initWarningTipBox+0xb0>)
c0de9cac:	480d      	ldr	r0, [pc, #52]	@ (c0de9ce4 <initWarningTipBox+0xb4>)
c0de9cae:	2b00      	cmp	r3, #0
c0de9cb0:	4478      	add	r0, pc
c0de9cb2:	447a      	add	r2, pc
c0de9cb4:	bf08      	it	eq
c0de9cb6:	4610      	moveq	r0, r2
c0de9cb8:	e7e7      	b.n	c0de9c8a <initWarningTipBox+0x5a>
c0de9cba:	480b      	ldr	r0, [pc, #44]	@ (c0de9ce8 <initWarningTipBox+0xb8>)
c0de9cbc:	4478      	add	r0, pc
c0de9cbe:	e7e4      	b.n	c0de9c8a <initWarningTipBox+0x5a>
c0de9cc0:	0000197c 	.word	0x0000197c
c0de9cc4:	00001a0c 	.word	0x00001a0c
c0de9cc8:	00002962 	.word	0x00002962
c0de9ccc:	00002aec 	.word	0x00002aec
c0de9cd0:	00003101 	.word	0x00003101
c0de9cd4:	00002a75 	.word	0x00002a75
c0de9cd8:	0000313c 	.word	0x0000313c
c0de9cdc:	00002f11 	.word	0x00002f11
c0de9ce0:	00002f56 	.word	0x00002f56
c0de9ce4:	00003127 	.word	0x00003127
c0de9ce8:	00002e0f 	.word	0x00002e0f

c0de9cec <bundleNavReviewAskRejectionConfirmation>:
c0de9cec:	f020 00f0 	bic.w	r0, r0, #240	@ 0xf0
c0de9cf0:	b130      	cbz	r0, c0de9d00 <bundleNavReviewAskRejectionConfirmation+0x14>
c0de9cf2:	2801      	cmp	r0, #1
c0de9cf4:	d109      	bne.n	c0de9d0a <bundleNavReviewAskRejectionConfirmation+0x1e>
c0de9cf6:	4b0d      	ldr	r3, [pc, #52]	@ (c0de9d2c <bundleNavReviewAskRejectionConfirmation+0x40>)
c0de9cf8:	480d      	ldr	r0, [pc, #52]	@ (c0de9d30 <bundleNavReviewAskRejectionConfirmation+0x44>)
c0de9cfa:	447b      	add	r3, pc
c0de9cfc:	4478      	add	r0, pc
c0de9cfe:	e008      	b.n	c0de9d12 <bundleNavReviewAskRejectionConfirmation+0x26>
c0de9d00:	4b08      	ldr	r3, [pc, #32]	@ (c0de9d24 <bundleNavReviewAskRejectionConfirmation+0x38>)
c0de9d02:	4809      	ldr	r0, [pc, #36]	@ (c0de9d28 <bundleNavReviewAskRejectionConfirmation+0x3c>)
c0de9d04:	447b      	add	r3, pc
c0de9d06:	4478      	add	r0, pc
c0de9d08:	e003      	b.n	c0de9d12 <bundleNavReviewAskRejectionConfirmation+0x26>
c0de9d0a:	4b0a      	ldr	r3, [pc, #40]	@ (c0de9d34 <bundleNavReviewAskRejectionConfirmation+0x48>)
c0de9d0c:	480a      	ldr	r0, [pc, #40]	@ (c0de9d38 <bundleNavReviewAskRejectionConfirmation+0x4c>)
c0de9d0e:	447b      	add	r3, pc
c0de9d10:	4478      	add	r0, pc
c0de9d12:	b5e0      	push	{r5, r6, r7, lr}
c0de9d14:	9100      	str	r1, [sp, #0]
c0de9d16:	2100      	movs	r1, #0
c0de9d18:	4a08      	ldr	r2, [pc, #32]	@ (c0de9d3c <bundleNavReviewAskRejectionConfirmation+0x50>)
c0de9d1a:	447a      	add	r2, pc
c0de9d1c:	f7fe fcb0 	bl	c0de8680 <nbgl_useCaseConfirm>
c0de9d20:	bd8c      	pop	{r2, r3, r7, pc}
c0de9d22:	bf00      	nop
c0de9d24:	00002ba0 	.word	0x00002ba0
c0de9d28:	000029d3 	.word	0x000029d3
c0de9d2c:	00002e88 	.word	0x00002e88
c0de9d30:	000031fa 	.word	0x000031fa
c0de9d34:	00002a35 	.word	0x00002a35
c0de9d38:	00002f46 	.word	0x00002f46
c0de9d3c:	00002d1f 	.word	0x00002d1f

c0de9d40 <bundleNavReviewConfirmRejection>:
c0de9d40:	4801      	ldr	r0, [pc, #4]	@ (c0de9d48 <bundleNavReviewConfirmRejection+0x8>)
c0de9d42:	f000 b840 	b.w	c0de9dc6 <OUTLINED_FUNCTION_12>
c0de9d46:	bf00      	nop
c0de9d48:	00001cb0 	.word	0x00001cb0

c0de9d4c <bundleNavReviewStreamingConfirmRejection>:
c0de9d4c:	4801      	ldr	r0, [pc, #4]	@ (c0de9d54 <bundleNavReviewStreamingConfirmRejection+0x8>)
c0de9d4e:	f000 b83a 	b.w	c0de9dc6 <OUTLINED_FUNCTION_12>
c0de9d52:	bf00      	nop
c0de9d54:	00001cb0 	.word	0x00001cb0

c0de9d58 <OUTLINED_FUNCTION_0>:
c0de9d58:	461c      	mov	r4, r3
c0de9d5a:	4615      	mov	r5, r2
c0de9d5c:	460e      	mov	r6, r1
c0de9d5e:	4607      	mov	r7, r0
c0de9d60:	f7fd bd4a 	b.w	c0de77f8 <reset_callbacks_and_context>

c0de9d64 <OUTLINED_FUNCTION_1>:
c0de9d64:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de9d68:	2301      	movs	r3, #1
c0de9d6a:	f000 bd1b 	b.w	c0dea7a4 <nbgl_getTextHeightInWidth>

c0de9d6e <OUTLINED_FUNCTION_2>:
c0de9d6e:	f8da 0004 	ldr.w	r0, [sl, #4]
c0de9d72:	eb00 0086 	add.w	r0, r0, r6, lsl #2
c0de9d76:	f000 bedd 	b.w	c0deab34 <pic>

c0de9d7a <OUTLINED_FUNCTION_3>:
c0de9d7a:	2001      	movs	r0, #1
c0de9d7c:	f000 bcc2 	b.w	c0dea704 <nbgl_refreshSpecial>

c0de9d80 <OUTLINED_FUNCTION_4>:
c0de9d80:	2000      	movs	r0, #0
c0de9d82:	f7fd be17 	b.w	c0de79b4 <getNbPagesForGenericContents>

c0de9d86 <OUTLINED_FUNCTION_5>:
c0de9d86:	2008      	movs	r0, #8
c0de9d88:	f7f9 b815 	b.w	c0de2db6 <os_io_seph_cmd_piezo_play_tune>

c0de9d8c <OUTLINED_FUNCTION_6>:
c0de9d8c:	f880 1088 	strb.w	r1, [r0, #136]	@ 0x88
c0de9d90:	6f81      	ldr	r1, [r0, #120]	@ 0x78
c0de9d92:	6808      	ldr	r0, [r1, #0]
c0de9d94:	2800      	cmp	r0, #0
c0de9d96:	4770      	bx	lr

c0de9d98 <OUTLINED_FUNCTION_8>:
c0de9d98:	9001      	str	r0, [sp, #4]
c0de9d9a:	980c      	ldr	r0, [sp, #48]	@ 0x30
c0de9d9c:	9000      	str	r0, [sp, #0]
c0de9d9e:	4638      	mov	r0, r7
c0de9da0:	f7fe bd7a 	b.w	c0de8898 <useCaseReview>

c0de9da4 <OUTLINED_FUNCTION_9>:
c0de9da4:	eb09 000b 	add.w	r0, r9, fp
c0de9da8:	f8d0 0084 	ldr.w	r0, [r0, #132]	@ 0x84
c0de9dac:	4770      	bx	lr

c0de9dae <OUTLINED_FUNCTION_10>:
c0de9dae:	eb09 0005 	add.w	r0, r9, r5
c0de9db2:	f8d0 0080 	ldr.w	r0, [r0, #128]	@ 0x80
c0de9db6:	4770      	bx	lr

c0de9db8 <OUTLINED_FUNCTION_11>:
c0de9db8:	f44f 7bfc 	mov.w	fp, #504	@ 0x1f8
c0de9dbc:	2b00      	cmp	r3, #0
c0de9dbe:	4682      	mov	sl, r0
c0de9dc0:	4698      	mov	r8, r3
c0de9dc2:	4616      	mov	r6, r2
c0de9dc4:	4770      	bx	lr

c0de9dc6 <OUTLINED_FUNCTION_12>:
c0de9dc6:	4448      	add	r0, r9
c0de9dc8:	6841      	ldr	r1, [r0, #4]
c0de9dca:	2000      	movs	r0, #0
c0de9dcc:	4708      	bx	r1

c0de9dce <OUTLINED_FUNCTION_13>:
c0de9dce:	4448      	add	r0, r9
c0de9dd0:	6841      	ldr	r1, [r0, #4]
c0de9dd2:	2001      	movs	r0, #1
c0de9dd4:	4708      	bx	r1

c0de9dd6 <OUTLINED_FUNCTION_15>:
c0de9dd6:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de9dda:	2300      	movs	r3, #0
c0de9ddc:	f000 bce7 	b.w	c0dea7ae <nbgl_getTextNbLinesInWidth>

c0de9de0 <OUTLINED_FUNCTION_16>:
c0de9de0:	200b      	movs	r0, #11
c0de9de2:	f44f 72d0 	mov.w	r2, #416	@ 0x1a0
c0de9de6:	f000 bcdd 	b.w	c0dea7a4 <nbgl_getTextHeightInWidth>

c0de9dea <OUTLINED_FUNCTION_17>:
c0de9dea:	4630      	mov	r0, r6
c0de9dec:	f001 b8c4 	b.w	c0deaf78 <__aeabi_memclr>

c0de9df0 <OUTLINED_FUNCTION_18>:
c0de9df0:	f10a 0004 	add.w	r0, sl, #4
c0de9df4:	f105 0110 	add.w	r1, r5, #16
c0de9df8:	4770      	bx	lr

c0de9dfa <OUTLINED_FUNCTION_19>:
c0de9dfa:	f884 0068 	strb.w	r0, [r4, #104]	@ 0x68
c0de9dfe:	6de0      	ldr	r0, [r4, #92]	@ 0x5c
c0de9e00:	f7ff bd26 	b.w	c0de9850 <displayModalDetails>

c0de9e04 <bip32_path_read>:
c0de9e04:	e92d 4dfc 	stmdb	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, lr}
c0de9e08:	b10b      	cbz	r3, c0de9e0e <bip32_path_read+0xa>
c0de9e0a:	2b0a      	cmp	r3, #10
c0de9e0c:	d902      	bls.n	c0de9e14 <bip32_path_read+0x10>
c0de9e0e:	2000      	movs	r0, #0
c0de9e10:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}
c0de9e14:	4692      	mov	sl, r2
c0de9e16:	460e      	mov	r6, r1
c0de9e18:	4683      	mov	fp, r0
c0de9e1a:	425f      	negs	r7, r3
c0de9e1c:	2500      	movs	r5, #0
c0de9e1e:	f04f 0800 	mov.w	r8, #0
c0de9e22:	9301      	str	r3, [sp, #4]
c0de9e24:	42af      	cmp	r7, r5
c0de9e26:	d00c      	beq.n	c0de9e42 <bip32_path_read+0x3e>
c0de9e28:	f108 0404 	add.w	r4, r8, #4
c0de9e2c:	42b4      	cmp	r4, r6
c0de9e2e:	d808      	bhi.n	c0de9e42 <bip32_path_read+0x3e>
c0de9e30:	4658      	mov	r0, fp
c0de9e32:	4641      	mov	r1, r8
c0de9e34:	f000 faee 	bl	c0dea414 <read_u32_be>
c0de9e38:	f84a 0008 	str.w	r0, [sl, r8]
c0de9e3c:	3d01      	subs	r5, #1
c0de9e3e:	46a0      	mov	r8, r4
c0de9e40:	e7f0      	b.n	c0de9e24 <bip32_path_read+0x20>
c0de9e42:	9a01      	ldr	r2, [sp, #4]
c0de9e44:	4269      	negs	r1, r5
c0de9e46:	2000      	movs	r0, #0
c0de9e48:	4291      	cmp	r1, r2
c0de9e4a:	bf28      	it	cs
c0de9e4c:	2001      	movcs	r0, #1
c0de9e4e:	e8bd 8dfc 	ldmia.w	sp!, {r2, r3, r4, r5, r6, r7, r8, sl, fp, pc}

c0de9e52 <buffer_seek_cur>:
c0de9e52:	6882      	ldr	r2, [r0, #8]
c0de9e54:	1889      	adds	r1, r1, r2
c0de9e56:	d205      	bcs.n	c0de9e64 <buffer_seek_cur+0x12>
c0de9e58:	6842      	ldr	r2, [r0, #4]
c0de9e5a:	4291      	cmp	r1, r2
c0de9e5c:	bf9e      	ittt	ls
c0de9e5e:	6081      	strls	r1, [r0, #8]
c0de9e60:	2001      	movls	r0, #1
c0de9e62:	4770      	bxls	lr
c0de9e64:	2000      	movs	r0, #0
c0de9e66:	4770      	bx	lr

c0de9e68 <buffer_read_u8>:
c0de9e68:	b510      	push	{r4, lr}
c0de9e6a:	e9d0 2301 	ldrd	r2, r3, [r0, #4]
c0de9e6e:	429a      	cmp	r2, r3
c0de9e70:	d00a      	beq.n	c0de9e88 <buffer_read_u8+0x20>
c0de9e72:	6804      	ldr	r4, [r0, #0]
c0de9e74:	5ce4      	ldrb	r4, [r4, r3]
c0de9e76:	700c      	strb	r4, [r1, #0]
c0de9e78:	6881      	ldr	r1, [r0, #8]
c0de9e7a:	3101      	adds	r1, #1
c0de9e7c:	d206      	bcs.n	c0de9e8c <buffer_read_u8+0x24>
c0de9e7e:	6844      	ldr	r4, [r0, #4]
c0de9e80:	42a1      	cmp	r1, r4
c0de9e82:	bf98      	it	ls
c0de9e84:	6081      	strls	r1, [r0, #8]
c0de9e86:	e001      	b.n	c0de9e8c <buffer_read_u8+0x24>
c0de9e88:	2000      	movs	r0, #0
c0de9e8a:	7008      	strb	r0, [r1, #0]
c0de9e8c:	1ad0      	subs	r0, r2, r3
c0de9e8e:	bf18      	it	ne
c0de9e90:	2001      	movne	r0, #1
c0de9e92:	bd10      	pop	{r4, pc}

c0de9e94 <buffer_read_u64>:
c0de9e94:	b570      	push	{r4, r5, r6, lr}
c0de9e96:	f000 f87d 	bl	c0de9f94 <OUTLINED_FUNCTION_0>
c0de9e9a:	2e07      	cmp	r6, #7
c0de9e9c:	d904      	bls.n	c0de9ea8 <buffer_read_u64+0x14>
c0de9e9e:	6820      	ldr	r0, [r4, #0]
c0de9ea0:	b132      	cbz	r2, c0de9eb0 <buffer_read_u64+0x1c>
c0de9ea2:	f000 faee 	bl	c0dea482 <read_u64_le>
c0de9ea6:	e005      	b.n	c0de9eb4 <buffer_read_u64+0x20>
c0de9ea8:	2000      	movs	r0, #0
c0de9eaa:	e9c5 0000 	strd	r0, r0, [r5]
c0de9eae:	e00c      	b.n	c0de9eca <buffer_read_u64+0x36>
c0de9eb0:	f000 fabc 	bl	c0dea42c <read_u64_be>
c0de9eb4:	e9c5 0100 	strd	r0, r1, [r5]
c0de9eb8:	68a0      	ldr	r0, [r4, #8]
c0de9eba:	f110 0f09 	cmn.w	r0, #9
c0de9ebe:	d804      	bhi.n	c0de9eca <buffer_read_u64+0x36>
c0de9ec0:	6861      	ldr	r1, [r4, #4]
c0de9ec2:	3008      	adds	r0, #8
c0de9ec4:	4288      	cmp	r0, r1
c0de9ec6:	bf98      	it	ls
c0de9ec8:	60a0      	strls	r0, [r4, #8]
c0de9eca:	2000      	movs	r0, #0
c0de9ecc:	2e07      	cmp	r6, #7
c0de9ece:	bf88      	it	hi
c0de9ed0:	2001      	movhi	r0, #1
c0de9ed2:	bd70      	pop	{r4, r5, r6, pc}

c0de9ed4 <buffer_read_varint>:
c0de9ed4:	b5b0      	push	{r4, r5, r7, lr}
c0de9ed6:	4604      	mov	r4, r0
c0de9ed8:	460d      	mov	r5, r1
c0de9eda:	6800      	ldr	r0, [r0, #0]
c0de9edc:	e9d4 1201 	ldrd	r1, r2, [r4, #4]
c0de9ee0:	4410      	add	r0, r2
c0de9ee2:	1a89      	subs	r1, r1, r2
c0de9ee4:	462a      	mov	r2, r5
c0de9ee6:	f000 fae3 	bl	c0dea4b0 <varint_read>
c0de9eea:	f1b0 3fff 	cmp.w	r0, #4294967295	@ 0xffffffff
c0de9eee:	dd0a      	ble.n	c0de9f06 <buffer_read_varint+0x32>
c0de9ef0:	68a1      	ldr	r1, [r4, #8]
c0de9ef2:	1840      	adds	r0, r0, r1
c0de9ef4:	d205      	bcs.n	c0de9f02 <buffer_read_varint+0x2e>
c0de9ef6:	6861      	ldr	r1, [r4, #4]
c0de9ef8:	4288      	cmp	r0, r1
c0de9efa:	bf9e      	ittt	ls
c0de9efc:	60a0      	strls	r0, [r4, #8]
c0de9efe:	2001      	movls	r0, #1
c0de9f00:	bdb0      	popls	{r4, r5, r7, pc}
c0de9f02:	2000      	movs	r0, #0
c0de9f04:	bdb0      	pop	{r4, r5, r7, pc}
c0de9f06:	2000      	movs	r0, #0
c0de9f08:	e9c5 0000 	strd	r0, r0, [r5]
c0de9f0c:	bdb0      	pop	{r4, r5, r7, pc}

c0de9f0e <buffer_read_bip32_path>:
c0de9f0e:	b5b0      	push	{r4, r5, r7, lr}
c0de9f10:	4604      	mov	r4, r0
c0de9f12:	4615      	mov	r5, r2
c0de9f14:	460a      	mov	r2, r1
c0de9f16:	6800      	ldr	r0, [r0, #0]
c0de9f18:	e9d4 1301 	ldrd	r1, r3, [r4, #4]
c0de9f1c:	4418      	add	r0, r3
c0de9f1e:	1ac9      	subs	r1, r1, r3
c0de9f20:	462b      	mov	r3, r5
c0de9f22:	f7ff ff6f 	bl	c0de9e04 <bip32_path_read>
c0de9f26:	b140      	cbz	r0, c0de9f3a <buffer_read_bip32_path+0x2c>
c0de9f28:	68a2      	ldr	r2, [r4, #8]
c0de9f2a:	eb02 0185 	add.w	r1, r2, r5, lsl #2
c0de9f2e:	4291      	cmp	r1, r2
c0de9f30:	d303      	bcc.n	c0de9f3a <buffer_read_bip32_path+0x2c>
c0de9f32:	6862      	ldr	r2, [r4, #4]
c0de9f34:	4291      	cmp	r1, r2
c0de9f36:	bf98      	it	ls
c0de9f38:	60a1      	strls	r1, [r4, #8]
c0de9f3a:	bdb0      	pop	{r4, r5, r7, pc}

c0de9f3c <buffer_copy>:
c0de9f3c:	b5b0      	push	{r4, r5, r7, lr}
c0de9f3e:	4614      	mov	r4, r2
c0de9f40:	e9d0 3201 	ldrd	r3, r2, [r0, #4]
c0de9f44:	1a9d      	subs	r5, r3, r2
c0de9f46:	42a5      	cmp	r5, r4
c0de9f48:	d806      	bhi.n	c0de9f58 <buffer_copy+0x1c>
c0de9f4a:	6800      	ldr	r0, [r0, #0]
c0de9f4c:	4402      	add	r2, r0
c0de9f4e:	4608      	mov	r0, r1
c0de9f50:	4611      	mov	r1, r2
c0de9f52:	462a      	mov	r2, r5
c0de9f54:	f001 f808 	bl	c0deaf68 <__aeabi_memmove>
c0de9f58:	2000      	movs	r0, #0
c0de9f5a:	42a5      	cmp	r5, r4
c0de9f5c:	bf98      	it	ls
c0de9f5e:	2001      	movls	r0, #1
c0de9f60:	bdb0      	pop	{r4, r5, r7, pc}

c0de9f62 <buffer_move>:
c0de9f62:	b5b0      	push	{r4, r5, r7, lr}
c0de9f64:	4615      	mov	r5, r2
c0de9f66:	4604      	mov	r4, r0
c0de9f68:	e9d0 2001 	ldrd	r2, r0, [r0, #4]
c0de9f6c:	1a12      	subs	r2, r2, r0
c0de9f6e:	42aa      	cmp	r2, r5
c0de9f70:	bf84      	itt	hi
c0de9f72:	2000      	movhi	r0, #0
c0de9f74:	bdb0      	pophi	{r4, r5, r7, pc}
c0de9f76:	6823      	ldr	r3, [r4, #0]
c0de9f78:	4403      	add	r3, r0
c0de9f7a:	4608      	mov	r0, r1
c0de9f7c:	4619      	mov	r1, r3
c0de9f7e:	f000 fff3 	bl	c0deaf68 <__aeabi_memmove>
c0de9f82:	68a0      	ldr	r0, [r4, #8]
c0de9f84:	1940      	adds	r0, r0, r5
c0de9f86:	d203      	bcs.n	c0de9f90 <buffer_move+0x2e>
c0de9f88:	6861      	ldr	r1, [r4, #4]
c0de9f8a:	4288      	cmp	r0, r1
c0de9f8c:	bf98      	it	ls
c0de9f8e:	60a0      	strls	r0, [r4, #8]
c0de9f90:	2001      	movs	r0, #1
c0de9f92:	bdb0      	pop	{r4, r5, r7, pc}

c0de9f94 <OUTLINED_FUNCTION_0>:
c0de9f94:	4604      	mov	r4, r0
c0de9f96:	460d      	mov	r5, r1
c0de9f98:	6840      	ldr	r0, [r0, #4]
c0de9f9a:	68a1      	ldr	r1, [r4, #8]
c0de9f9c:	1a46      	subs	r6, r0, r1
c0de9f9e:	4770      	bx	lr

c0de9fa0 <bip32_derive_with_seed_init_privkey_256>:
c0de9fa0:	e92d 45f0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, lr}
c0de9fa4:	b095      	sub	sp, #84	@ 0x54
c0de9fa6:	460d      	mov	r5, r1
c0de9fa8:	4607      	mov	r7, r0
c0de9faa:	a904      	add	r1, sp, #16
c0de9fac:	469a      	mov	sl, r3
c0de9fae:	4614      	mov	r4, r2
c0de9fb0:	4628      	mov	r0, r5
c0de9fb2:	f000 fe03 	bl	c0deabbc <cx_ecdomain_parameters_length>
c0de9fb6:	f8dd 8070 	ldr.w	r8, [sp, #112]	@ 0x70
c0de9fba:	4606      	mov	r6, r0
c0de9fbc:	b9e0      	cbnz	r0, c0de9ff8 <bip32_derive_with_seed_init_privkey_256+0x58>
c0de9fbe:	9804      	ldr	r0, [sp, #16]
c0de9fc0:	2820      	cmp	r0, #32
c0de9fc2:	d117      	bne.n	c0de9ff4 <bip32_derive_with_seed_init_privkey_256+0x54>
c0de9fc4:	981f      	ldr	r0, [sp, #124]	@ 0x7c
c0de9fc6:	e9dd 211d 	ldrd	r2, r1, [sp, #116]	@ 0x74
c0de9fca:	ab05      	add	r3, sp, #20
c0de9fcc:	e9cd 3200 	strd	r3, r2, [sp]
c0de9fd0:	e9cd 1002 	strd	r1, r0, [sp, #8]
c0de9fd4:	4638      	mov	r0, r7
c0de9fd6:	4629      	mov	r1, r5
c0de9fd8:	4622      	mov	r2, r4
c0de9fda:	4653      	mov	r3, sl
c0de9fdc:	f000 f818 	bl	c0dea010 <os_derive_bip32_with_seed_no_throw>
c0de9fe0:	4606      	mov	r6, r0
c0de9fe2:	b948      	cbnz	r0, c0de9ff8 <bip32_derive_with_seed_init_privkey_256+0x58>
c0de9fe4:	9a04      	ldr	r2, [sp, #16]
c0de9fe6:	a905      	add	r1, sp, #20
c0de9fe8:	4628      	mov	r0, r5
c0de9fea:	4643      	mov	r3, r8
c0de9fec:	f000 fb61 	bl	c0dea6b2 <cx_ecfp_init_private_key_no_throw>
c0de9ff0:	4606      	mov	r6, r0
c0de9ff2:	e001      	b.n	c0de9ff8 <bip32_derive_with_seed_init_privkey_256+0x58>
c0de9ff4:	f06f 065c 	mvn.w	r6, #92	@ 0x5c
c0de9ff8:	a805      	add	r0, sp, #20
c0de9ffa:	2140      	movs	r1, #64	@ 0x40
c0de9ffc:	f000 ffca 	bl	c0deaf94 <explicit_bzero>
c0dea000:	b116      	cbz	r6, c0dea008 <bip32_derive_with_seed_init_privkey_256+0x68>
c0dea002:	4640      	mov	r0, r8
c0dea004:	f000 f89f 	bl	c0dea146 <OUTLINED_FUNCTION_0>
c0dea008:	4630      	mov	r0, r6
c0dea00a:	b015      	add	sp, #84	@ 0x54
c0dea00c:	e8bd 85f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, pc}

c0dea010 <os_derive_bip32_with_seed_no_throw>:
c0dea010:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dea014:	b090      	sub	sp, #64	@ 0x40
c0dea016:	f10d 0810 	add.w	r8, sp, #16
c0dea01a:	4607      	mov	r7, r0
c0dea01c:	469b      	mov	fp, r3
c0dea01e:	4616      	mov	r6, r2
c0dea020:	460c      	mov	r4, r1
c0dea022:	4640      	mov	r0, r8
c0dea024:	f000 ffec 	bl	c0deb000 <setjmp>
c0dea028:	b285      	uxth	r5, r0
c0dea02a:	f8dd a060 	ldr.w	sl, [sp, #96]	@ 0x60
c0dea02e:	f8ad 003c 	strh.w	r0, [sp, #60]	@ 0x3c
c0dea032:	b155      	cbz	r5, c0dea04a <os_derive_bip32_with_seed_no_throw+0x3a>
c0dea034:	2000      	movs	r0, #0
c0dea036:	f8ad 003c 	strh.w	r0, [sp, #60]	@ 0x3c
c0dea03a:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0dea03c:	f000 fe66 	bl	c0dead0c <try_context_set>
c0dea040:	2140      	movs	r1, #64	@ 0x40
c0dea042:	4650      	mov	r0, sl
c0dea044:	f000 ffa6 	bl	c0deaf94 <explicit_bzero>
c0dea048:	e012      	b.n	c0dea070 <os_derive_bip32_with_seed_no_throw+0x60>
c0dea04a:	a804      	add	r0, sp, #16
c0dea04c:	f000 fe5e 	bl	c0dead0c <try_context_set>
c0dea050:	9919      	ldr	r1, [sp, #100]	@ 0x64
c0dea052:	900e      	str	r0, [sp, #56]	@ 0x38
c0dea054:	4668      	mov	r0, sp
c0dea056:	4632      	mov	r2, r6
c0dea058:	465b      	mov	r3, fp
c0dea05a:	f8c0 a000 	str.w	sl, [r0]
c0dea05e:	6041      	str	r1, [r0, #4]
c0dea060:	991a      	ldr	r1, [sp, #104]	@ 0x68
c0dea062:	6081      	str	r1, [r0, #8]
c0dea064:	991b      	ldr	r1, [sp, #108]	@ 0x6c
c0dea066:	60c1      	str	r1, [r0, #12]
c0dea068:	4638      	mov	r0, r7
c0dea06a:	4621      	mov	r1, r4
c0dea06c:	f000 fdb0 	bl	c0deabd0 <os_perso_derive_node_with_seed_key>
c0dea070:	f000 fe44 	bl	c0deacfc <try_context_get>
c0dea074:	4540      	cmp	r0, r8
c0dea076:	d102      	bne.n	c0dea07e <os_derive_bip32_with_seed_no_throw+0x6e>
c0dea078:	980e      	ldr	r0, [sp, #56]	@ 0x38
c0dea07a:	f000 fe47 	bl	c0dead0c <try_context_set>
c0dea07e:	f8bd 003c 	ldrh.w	r0, [sp, #60]	@ 0x3c
c0dea082:	b918      	cbnz	r0, c0dea08c <os_derive_bip32_with_seed_no_throw+0x7c>
c0dea084:	4628      	mov	r0, r5
c0dea086:	b010      	add	sp, #64	@ 0x40
c0dea088:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0dea08c:	f000 fbb9 	bl	c0dea802 <os_longjmp>

c0dea090 <bip32_derive_with_seed_get_pubkey_256>:
c0dea090:	b5f0      	push	{r4, r5, r6, r7, lr}
c0dea092:	b0a1      	sub	sp, #132	@ 0x84
c0dea094:	460e      	mov	r6, r1
c0dea096:	992a      	ldr	r1, [sp, #168]	@ 0xa8
c0dea098:	9103      	str	r1, [sp, #12]
c0dea09a:	9929      	ldr	r1, [sp, #164]	@ 0xa4
c0dea09c:	9102      	str	r1, [sp, #8]
c0dea09e:	9927      	ldr	r1, [sp, #156]	@ 0x9c
c0dea0a0:	9101      	str	r1, [sp, #4]
c0dea0a2:	a917      	add	r1, sp, #92	@ 0x5c
c0dea0a4:	9100      	str	r1, [sp, #0]
c0dea0a6:	4631      	mov	r1, r6
c0dea0a8:	f7ff ff7a 	bl	c0de9fa0 <bip32_derive_with_seed_init_privkey_256>
c0dea0ac:	9c26      	ldr	r4, [sp, #152]	@ 0x98
c0dea0ae:	4605      	mov	r5, r0
c0dea0b0:	b9b8      	cbnz	r0, c0dea0e2 <bip32_derive_with_seed_get_pubkey_256+0x52>
c0dea0b2:	9828      	ldr	r0, [sp, #160]	@ 0xa0
c0dea0b4:	2301      	movs	r3, #1
c0dea0b6:	9000      	str	r0, [sp, #0]
c0dea0b8:	af04      	add	r7, sp, #16
c0dea0ba:	aa17      	add	r2, sp, #92	@ 0x5c
c0dea0bc:	4630      	mov	r0, r6
c0dea0be:	4639      	mov	r1, r7
c0dea0c0:	f000 faf2 	bl	c0dea6a8 <cx_ecfp_generate_pair2_no_throw>
c0dea0c4:	4605      	mov	r5, r0
c0dea0c6:	b960      	cbnz	r0, c0dea0e2 <bip32_derive_with_seed_get_pubkey_256+0x52>
c0dea0c8:	9805      	ldr	r0, [sp, #20]
c0dea0ca:	2841      	cmp	r0, #65	@ 0x41
c0dea0cc:	d107      	bne.n	c0dea0de <bip32_derive_with_seed_get_pubkey_256+0x4e>
c0dea0ce:	f107 0108 	add.w	r1, r7, #8
c0dea0d2:	4620      	mov	r0, r4
c0dea0d4:	2241      	movs	r2, #65	@ 0x41
c0dea0d6:	f000 ff45 	bl	c0deaf64 <__aeabi_memcpy>
c0dea0da:	2500      	movs	r5, #0
c0dea0dc:	e001      	b.n	c0dea0e2 <bip32_derive_with_seed_get_pubkey_256+0x52>
c0dea0de:	f06f 055c 	mvn.w	r5, #92	@ 0x5c
c0dea0e2:	a817      	add	r0, sp, #92	@ 0x5c
c0dea0e4:	f000 f82f 	bl	c0dea146 <OUTLINED_FUNCTION_0>
c0dea0e8:	b11d      	cbz	r5, c0dea0f2 <bip32_derive_with_seed_get_pubkey_256+0x62>
c0dea0ea:	4620      	mov	r0, r4
c0dea0ec:	2141      	movs	r1, #65	@ 0x41
c0dea0ee:	f000 ff51 	bl	c0deaf94 <explicit_bzero>
c0dea0f2:	4628      	mov	r0, r5
c0dea0f4:	b021      	add	sp, #132	@ 0x84
c0dea0f6:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0dea0f8 <bip32_derive_with_seed_ecdsa_sign_hash_256>:
c0dea0f8:	b5f0      	push	{r4, r5, r6, r7, lr}
c0dea0fa:	b08f      	sub	sp, #60	@ 0x3c
c0dea0fc:	9f19      	ldr	r7, [sp, #100]	@ 0x64
c0dea0fe:	9d1c      	ldr	r5, [sp, #112]	@ 0x70
c0dea100:	683c      	ldr	r4, [r7, #0]
c0dea102:	9503      	str	r5, [sp, #12]
c0dea104:	9d1b      	ldr	r5, [sp, #108]	@ 0x6c
c0dea106:	9502      	str	r5, [sp, #8]
c0dea108:	2500      	movs	r5, #0
c0dea10a:	9501      	str	r5, [sp, #4]
c0dea10c:	ad05      	add	r5, sp, #20
c0dea10e:	9500      	str	r5, [sp, #0]
c0dea110:	f7ff ff46 	bl	c0de9fa0 <bip32_derive_with_seed_init_privkey_256>
c0dea114:	9d18      	ldr	r5, [sp, #96]	@ 0x60
c0dea116:	4606      	mov	r6, r0
c0dea118:	b950      	cbnz	r0, c0dea130 <bip32_derive_with_seed_ecdsa_sign_hash_256+0x38>
c0dea11a:	ae14      	add	r6, sp, #80	@ 0x50
c0dea11c:	981a      	ldr	r0, [sp, #104]	@ 0x68
c0dea11e:	ce4e      	ldmia	r6, {r1, r2, r3, r6}
c0dea120:	e9cd 6500 	strd	r6, r5, [sp]
c0dea124:	e9cd 7002 	strd	r7, r0, [sp, #8]
c0dea128:	a805      	add	r0, sp, #20
c0dea12a:	f000 fab8 	bl	c0dea69e <cx_ecdsa_sign_no_throw>
c0dea12e:	4606      	mov	r6, r0
c0dea130:	a805      	add	r0, sp, #20
c0dea132:	f000 f808 	bl	c0dea146 <OUTLINED_FUNCTION_0>
c0dea136:	b11e      	cbz	r6, c0dea140 <bip32_derive_with_seed_ecdsa_sign_hash_256+0x48>
c0dea138:	4628      	mov	r0, r5
c0dea13a:	4621      	mov	r1, r4
c0dea13c:	f000 ff2a 	bl	c0deaf94 <explicit_bzero>
c0dea140:	4630      	mov	r0, r6
c0dea142:	b00f      	add	sp, #60	@ 0x3c
c0dea144:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0dea146 <OUTLINED_FUNCTION_0>:
c0dea146:	2128      	movs	r1, #40	@ 0x28
c0dea148:	f000 bf24 	b.w	c0deaf94 <explicit_bzero>

c0dea14c <format_u64>:
c0dea14c:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0dea150:	b1f9      	cbz	r1, c0dea192 <format_u64+0x46>
c0dea152:	4615      	mov	r5, r2
c0dea154:	4604      	mov	r4, r0
c0dea156:	f1a1 0801 	sub.w	r8, r1, #1
c0dea15a:	2700      	movs	r7, #0
c0dea15c:	2600      	movs	r6, #0
c0dea15e:	f1b5 000a 	subs.w	r0, r5, #10
c0dea162:	f173 0000 	sbcs.w	r0, r3, #0
c0dea166:	d316      	bcc.n	c0dea196 <format_u64+0x4a>
c0dea168:	4619      	mov	r1, r3
c0dea16a:	4628      	mov	r0, r5
c0dea16c:	220a      	movs	r2, #10
c0dea16e:	2300      	movs	r3, #0
c0dea170:	f000 ff06 	bl	c0deaf80 <__aeabi_uldivmod>
c0dea174:	460b      	mov	r3, r1
c0dea176:	eb00 0180 	add.w	r1, r0, r0, lsl #2
c0dea17a:	1cba      	adds	r2, r7, #2
c0dea17c:	eba5 0141 	sub.w	r1, r5, r1, lsl #1
c0dea180:	4605      	mov	r5, r0
c0dea182:	f041 0130 	orr.w	r1, r1, #48	@ 0x30
c0dea186:	55e1      	strb	r1, [r4, r7]
c0dea188:	1c79      	adds	r1, r7, #1
c0dea18a:	4542      	cmp	r2, r8
c0dea18c:	460f      	mov	r7, r1
c0dea18e:	d9e6      	bls.n	c0dea15e <format_u64+0x12>
c0dea190:	e012      	b.n	c0dea1b8 <format_u64+0x6c>
c0dea192:	2600      	movs	r6, #0
c0dea194:	e010      	b.n	c0dea1b8 <format_u64+0x6c>
c0dea196:	f105 0030 	add.w	r0, r5, #48	@ 0x30
c0dea19a:	19e1      	adds	r1, r4, r7
c0dea19c:	55e0      	strb	r0, [r4, r7]
c0dea19e:	2000      	movs	r0, #0
c0dea1a0:	7048      	strb	r0, [r1, #1]
c0dea1a2:	b2c1      	uxtb	r1, r0
c0dea1a4:	428f      	cmp	r7, r1
c0dea1a6:	d906      	bls.n	c0dea1b6 <format_u64+0x6a>
c0dea1a8:	5c62      	ldrb	r2, [r4, r1]
c0dea1aa:	5de3      	ldrb	r3, [r4, r7]
c0dea1ac:	3001      	adds	r0, #1
c0dea1ae:	5463      	strb	r3, [r4, r1]
c0dea1b0:	55e2      	strb	r2, [r4, r7]
c0dea1b2:	3f01      	subs	r7, #1
c0dea1b4:	e7f5      	b.n	c0dea1a2 <format_u64+0x56>
c0dea1b6:	2601      	movs	r6, #1
c0dea1b8:	4630      	mov	r0, r6
c0dea1ba:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

c0dea1be <format_fpu64>:
c0dea1be:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
c0dea1c2:	b086      	sub	sp, #24
c0dea1c4:	466c      	mov	r4, sp
c0dea1c6:	4688      	mov	r8, r1
c0dea1c8:	4605      	mov	r5, r0
c0dea1ca:	2115      	movs	r1, #21
c0dea1cc:	461e      	mov	r6, r3
c0dea1ce:	4617      	mov	r7, r2
c0dea1d0:	4620      	mov	r0, r4
c0dea1d2:	f000 fed1 	bl	c0deaf78 <__aeabi_memclr>
c0dea1d6:	4620      	mov	r0, r4
c0dea1d8:	2115      	movs	r1, #21
c0dea1da:	463a      	mov	r2, r7
c0dea1dc:	4633      	mov	r3, r6
c0dea1de:	f7ff ffb5 	bl	c0dea14c <format_u64>
c0dea1e2:	b340      	cbz	r0, c0dea236 <format_fpu64+0x78>
c0dea1e4:	466f      	mov	r7, sp
c0dea1e6:	9e0c      	ldr	r6, [sp, #48]	@ 0x30
c0dea1e8:	4638      	mov	r0, r7
c0dea1ea:	f000 ff21 	bl	c0deb030 <strlen>
c0dea1ee:	42b0      	cmp	r0, r6
c0dea1f0:	d910      	bls.n	c0dea214 <format_fpu64+0x56>
c0dea1f2:	1831      	adds	r1, r6, r0
c0dea1f4:	3101      	adds	r1, #1
c0dea1f6:	4541      	cmp	r1, r8
c0dea1f8:	d21d      	bcs.n	c0dea236 <format_fpu64+0x78>
c0dea1fa:	1b84      	subs	r4, r0, r6
c0dea1fc:	4628      	mov	r0, r5
c0dea1fe:	4639      	mov	r1, r7
c0dea200:	4622      	mov	r2, r4
c0dea202:	f000 feaf 	bl	c0deaf64 <__aeabi_memcpy>
c0dea206:	1928      	adds	r0, r5, r4
c0dea208:	212e      	movs	r1, #46	@ 0x2e
c0dea20a:	4632      	mov	r2, r6
c0dea20c:	f800 1b01 	strb.w	r1, [r0], #1
c0dea210:	1939      	adds	r1, r7, r4
c0dea212:	e015      	b.n	c0dea240 <format_fpu64+0x82>
c0dea214:	1a32      	subs	r2, r6, r0
c0dea216:	1c91      	adds	r1, r2, #2
c0dea218:	4541      	cmp	r1, r8
c0dea21a:	d20c      	bcs.n	c0dea236 <format_fpu64+0x78>
c0dea21c:	202e      	movs	r0, #46	@ 0x2e
c0dea21e:	2330      	movs	r3, #48	@ 0x30
c0dea220:	2400      	movs	r4, #0
c0dea222:	7068      	strb	r0, [r5, #1]
c0dea224:	1ca8      	adds	r0, r5, #2
c0dea226:	702b      	strb	r3, [r5, #0]
c0dea228:	b2a5      	uxth	r5, r4
c0dea22a:	42aa      	cmp	r2, r5
c0dea22c:	d905      	bls.n	c0dea23a <format_fpu64+0x7c>
c0dea22e:	f800 3b01 	strb.w	r3, [r0], #1
c0dea232:	3401      	adds	r4, #1
c0dea234:	e7f8      	b.n	c0dea228 <format_fpu64+0x6a>
c0dea236:	2000      	movs	r0, #0
c0dea238:	e005      	b.n	c0dea246 <format_fpu64+0x88>
c0dea23a:	eba8 0201 	sub.w	r2, r8, r1
c0dea23e:	4669      	mov	r1, sp
c0dea240:	f000 fefe 	bl	c0deb040 <strncpy>
c0dea244:	2001      	movs	r0, #1
c0dea246:	b006      	add	sp, #24
c0dea248:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

c0dea24c <format_hex>:
c0dea24c:	b5f0      	push	{r4, r5, r6, r7, lr}
c0dea24e:	4604      	mov	r4, r0
c0dea250:	0048      	lsls	r0, r1, #1
c0dea252:	f100 0c01 	add.w	ip, r0, #1
c0dea256:	459c      	cmp	ip, r3
c0dea258:	d902      	bls.n	c0dea260 <format_hex+0x14>
c0dea25a:	f04f 3cff 	mov.w	ip, #4294967295	@ 0xffffffff
c0dea25e:	e018      	b.n	c0dea292 <format_hex+0x46>
c0dea260:	480d      	ldr	r0, [pc, #52]	@ (c0dea298 <format_hex+0x4c>)
c0dea262:	2500      	movs	r5, #0
c0dea264:	4478      	add	r0, pc
c0dea266:	b191      	cbz	r1, c0dea28e <format_hex+0x42>
c0dea268:	1cef      	adds	r7, r5, #3
c0dea26a:	429f      	cmp	r7, r3
c0dea26c:	d80d      	bhi.n	c0dea28a <format_hex+0x3e>
c0dea26e:	7827      	ldrb	r7, [r4, #0]
c0dea270:	3901      	subs	r1, #1
c0dea272:	093f      	lsrs	r7, r7, #4
c0dea274:	5dc7      	ldrb	r7, [r0, r7]
c0dea276:	5557      	strb	r7, [r2, r5]
c0dea278:	1957      	adds	r7, r2, r5
c0dea27a:	3502      	adds	r5, #2
c0dea27c:	f814 6b01 	ldrb.w	r6, [r4], #1
c0dea280:	f006 060f 	and.w	r6, r6, #15
c0dea284:	5d86      	ldrb	r6, [r0, r6]
c0dea286:	707e      	strb	r6, [r7, #1]
c0dea288:	e7ed      	b.n	c0dea266 <format_hex+0x1a>
c0dea28a:	f105 0c01 	add.w	ip, r5, #1
c0dea28e:	2000      	movs	r0, #0
c0dea290:	5550      	strb	r0, [r2, r5]
c0dea292:	4660      	mov	r0, ip
c0dea294:	bdf0      	pop	{r4, r5, r6, r7, pc}
c0dea296:	bf00      	nop
c0dea298:	00002a04 	.word	0x00002a04

c0dea29c <app_ticker_event_callback>:
c0dea29c:	4770      	bx	lr
	...

c0dea2a0 <io_event>:
c0dea2a0:	b580      	push	{r7, lr}
c0dea2a2:	480b      	ldr	r0, [pc, #44]	@ (c0dea2d0 <io_event+0x30>)
c0dea2a4:	f819 1000 	ldrb.w	r1, [r9, r0]
c0dea2a8:	2905      	cmp	r1, #5
c0dea2aa:	d00e      	beq.n	c0dea2ca <io_event+0x2a>
c0dea2ac:	290e      	cmp	r1, #14
c0dea2ae:	d005      	beq.n	c0dea2bc <io_event+0x1c>
c0dea2b0:	290c      	cmp	r1, #12
c0dea2b2:	d108      	bne.n	c0dea2c6 <io_event+0x26>
c0dea2b4:	4448      	add	r0, r9
c0dea2b6:	f000 f92f 	bl	c0dea518 <ux_process_finger_event>
c0dea2ba:	e006      	b.n	c0dea2ca <io_event+0x2a>
c0dea2bc:	f7ff ffee 	bl	c0dea29c <app_ticker_event_callback>
c0dea2c0:	f000 f980 	bl	c0dea5c4 <ux_process_ticker_event>
c0dea2c4:	e001      	b.n	c0dea2ca <io_event+0x2a>
c0dea2c6:	f000 f9b3 	bl	c0dea630 <ux_process_default_event>
c0dea2ca:	2001      	movs	r0, #1
c0dea2cc:	bd80      	pop	{r7, pc}
c0dea2ce:	bf00      	nop
c0dea2d0:	00001d10 	.word	0x00001d10

c0dea2d4 <io_init>:
c0dea2d4:	4802      	ldr	r0, [pc, #8]	@ (c0dea2e0 <io_init+0xc>)
c0dea2d6:	2101      	movs	r1, #1
c0dea2d8:	f809 1000 	strb.w	r1, [r9, r0]
c0dea2dc:	4770      	bx	lr
c0dea2de:	bf00      	nop
c0dea2e0:	00001e20 	.word	0x00001e20

c0dea2e4 <io_recv_command>:
c0dea2e4:	b510      	push	{r4, lr}
c0dea2e6:	4c09      	ldr	r4, [pc, #36]	@ (c0dea30c <io_recv_command+0x28>)
c0dea2e8:	f819 0004 	ldrb.w	r0, [r9, r4]
c0dea2ec:	2801      	cmp	r0, #1
c0dea2ee:	d104      	bne.n	c0dea2fa <io_recv_command+0x16>
c0dea2f0:	f000 fce2 	bl	c0deacb8 <os_io_start>
c0dea2f4:	2000      	movs	r0, #0
c0dea2f6:	f809 0004 	strb.w	r0, [r9, r4]
c0dea2fa:	2000      	movs	r0, #0
c0dea2fc:	2800      	cmp	r0, #0
c0dea2fe:	dc03      	bgt.n	c0dea308 <io_recv_command+0x24>
c0dea300:	2001      	movs	r0, #1
c0dea302:	f7f8 fdeb 	bl	c0de2edc <io_legacy_apdu_rx>
c0dea306:	e7f9      	b.n	c0dea2fc <io_recv_command+0x18>
c0dea308:	bd10      	pop	{r4, pc}
c0dea30a:	bf00      	nop
c0dea30c:	00001e20 	.word	0x00001e20

c0dea310 <io_send_response_buffers>:
c0dea310:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0dea314:	f8df a060 	ldr.w	sl, [pc, #96]	@ c0dea378 <io_send_response_buffers+0x68>
c0dea318:	4690      	mov	r8, r2
c0dea31a:	460f      	mov	r7, r1
c0dea31c:	4605      	mov	r5, r0
c0dea31e:	f240 140f 	movw	r4, #271	@ 0x10f
c0dea322:	2600      	movs	r6, #0
c0dea324:	b1b5      	cbz	r5, c0dea354 <io_send_response_buffers+0x44>
c0dea326:	b1af      	cbz	r7, c0dea354 <io_send_response_buffers+0x44>
c0dea328:	2600      	movs	r6, #0
c0dea32a:	b19f      	cbz	r7, c0dea354 <io_send_response_buffers+0x44>
c0dea32c:	eb09 000a 	add.w	r0, r9, sl
c0dea330:	1ba2      	subs	r2, r4, r6
c0dea332:	1981      	adds	r1, r0, r6
c0dea334:	4628      	mov	r0, r5
c0dea336:	f7ff fe01 	bl	c0de9f3c <buffer_copy>
c0dea33a:	b130      	cbz	r0, c0dea34a <io_send_response_buffers+0x3a>
c0dea33c:	e9d5 0101 	ldrd	r0, r1, [r5, #4]
c0dea340:	350c      	adds	r5, #12
c0dea342:	3f01      	subs	r7, #1
c0dea344:	4430      	add	r0, r6
c0dea346:	1a46      	subs	r6, r0, r1
c0dea348:	e7ef      	b.n	c0dea32a <io_send_response_buffers+0x1a>
c0dea34a:	f646 2884 	movw	r8, #27268	@ 0x6a84
c0dea34e:	2500      	movs	r5, #0
c0dea350:	2700      	movs	r7, #0
c0dea352:	e7e6      	b.n	c0dea322 <io_send_response_buffers+0x12>
c0dea354:	eb09 050a 	add.w	r5, r9, sl
c0dea358:	fa1f f288 	uxth.w	r2, r8
c0dea35c:	4631      	mov	r1, r6
c0dea35e:	4628      	mov	r0, r5
c0dea360:	f000 f8d4 	bl	c0dea50c <write_u16_be>
c0dea364:	1cb0      	adds	r0, r6, #2
c0dea366:	b281      	uxth	r1, r0
c0dea368:	4628      	mov	r0, r5
c0dea36a:	f7f8 fd9d 	bl	c0de2ea8 <io_legacy_apdu_tx>
c0dea36e:	ea40 70e0 	orr.w	r0, r0, r0, asr #31
c0dea372:	e8bd 85f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}
c0dea376:	bf00      	nop
c0dea378:	00001517 	.word	0x00001517

c0dea37c <app_exit>:
c0dea37c:	20ff      	movs	r0, #255	@ 0xff
c0dea37e:	f000 fc87 	bl	c0deac90 <os_sched_exit>

c0dea382 <common_app_init>:
c0dea382:	b580      	push	{r7, lr}
c0dea384:	f000 f9c8 	bl	c0dea718 <nbgl_objInit>
c0dea388:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0dea38c:	f7f8 bed2 	b.w	c0de3134 <io_seproxyhal_init>

c0dea390 <standalone_app_main>:
c0dea390:	b510      	push	{r4, lr}
c0dea392:	b08c      	sub	sp, #48	@ 0x30
c0dea394:	466c      	mov	r4, sp
c0dea396:	4620      	mov	r0, r4
c0dea398:	f000 fe32 	bl	c0deb000 <setjmp>
c0dea39c:	f8ad 002c 	strh.w	r0, [sp, #44]	@ 0x2c
c0dea3a0:	0400      	lsls	r0, r0, #16
c0dea3a2:	d108      	bne.n	c0dea3b6 <standalone_app_main+0x26>
c0dea3a4:	4668      	mov	r0, sp
c0dea3a6:	f000 fcb1 	bl	c0dead0c <try_context_set>
c0dea3aa:	900a      	str	r0, [sp, #40]	@ 0x28
c0dea3ac:	f7ff ffe9 	bl	c0dea382 <common_app_init>
c0dea3b0:	f7f5 ff72 	bl	c0de0298 <app_main>
c0dea3b4:	e005      	b.n	c0dea3c2 <standalone_app_main+0x32>
c0dea3b6:	2000      	movs	r0, #0
c0dea3b8:	f8ad 002c 	strh.w	r0, [sp, #44]	@ 0x2c
c0dea3bc:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0dea3be:	f000 fca5 	bl	c0dead0c <try_context_set>
c0dea3c2:	f000 fc9b 	bl	c0deacfc <try_context_get>
c0dea3c6:	42a0      	cmp	r0, r4
c0dea3c8:	d102      	bne.n	c0dea3d0 <standalone_app_main+0x40>
c0dea3ca:	980a      	ldr	r0, [sp, #40]	@ 0x28
c0dea3cc:	f000 fc9e 	bl	c0dead0c <try_context_set>
c0dea3d0:	f8bd 002c 	ldrh.w	r0, [sp, #44]	@ 0x2c
c0dea3d4:	b908      	cbnz	r0, c0dea3da <standalone_app_main+0x4a>
c0dea3d6:	f7ff ffd1 	bl	c0dea37c <app_exit>
c0dea3da:	f000 fa12 	bl	c0dea802 <os_longjmp>

c0dea3de <apdu_parser>:
c0dea3de:	2a04      	cmp	r2, #4
c0dea3e0:	d316      	bcc.n	c0dea410 <apdu_parser+0x32>
c0dea3e2:	d102      	bne.n	c0dea3ea <apdu_parser+0xc>
c0dea3e4:	2300      	movs	r3, #0
c0dea3e6:	7103      	strb	r3, [r0, #4]
c0dea3e8:	e004      	b.n	c0dea3f4 <apdu_parser+0x16>
c0dea3ea:	790b      	ldrb	r3, [r1, #4]
c0dea3ec:	3a05      	subs	r2, #5
c0dea3ee:	429a      	cmp	r2, r3
c0dea3f0:	7103      	strb	r3, [r0, #4]
c0dea3f2:	d10d      	bne.n	c0dea410 <apdu_parser+0x32>
c0dea3f4:	780a      	ldrb	r2, [r1, #0]
c0dea3f6:	2b00      	cmp	r3, #0
c0dea3f8:	7002      	strb	r2, [r0, #0]
c0dea3fa:	784a      	ldrb	r2, [r1, #1]
c0dea3fc:	7042      	strb	r2, [r0, #1]
c0dea3fe:	788a      	ldrb	r2, [r1, #2]
c0dea400:	7082      	strb	r2, [r0, #2]
c0dea402:	bf18      	it	ne
c0dea404:	1d4b      	addne	r3, r1, #5
c0dea406:	78c9      	ldrb	r1, [r1, #3]
c0dea408:	6083      	str	r3, [r0, #8]
c0dea40a:	70c1      	strb	r1, [r0, #3]
c0dea40c:	2001      	movs	r0, #1
c0dea40e:	4770      	bx	lr
c0dea410:	2000      	movs	r0, #0
c0dea412:	4770      	bx	lr

c0dea414 <read_u32_be>:
c0dea414:	5c42      	ldrb	r2, [r0, r1]
c0dea416:	4408      	add	r0, r1
c0dea418:	7841      	ldrb	r1, [r0, #1]
c0dea41a:	7883      	ldrb	r3, [r0, #2]
c0dea41c:	78c0      	ldrb	r0, [r0, #3]
c0dea41e:	0409      	lsls	r1, r1, #16
c0dea420:	ea41 6102 	orr.w	r1, r1, r2, lsl #24
c0dea424:	ea41 2103 	orr.w	r1, r1, r3, lsl #8
c0dea428:	4408      	add	r0, r1
c0dea42a:	4770      	bx	lr

c0dea42c <read_u64_be>:
c0dea42c:	b5f0      	push	{r4, r5, r6, r7, lr}
c0dea42e:	1842      	adds	r2, r0, r1
c0dea430:	5c40      	ldrb	r0, [r0, r1]
c0dea432:	7917      	ldrb	r7, [r2, #4]
c0dea434:	7953      	ldrb	r3, [r2, #5]
c0dea436:	7854      	ldrb	r4, [r2, #1]
c0dea438:	7895      	ldrb	r5, [r2, #2]
c0dea43a:	78d6      	ldrb	r6, [r2, #3]
c0dea43c:	063f      	lsls	r7, r7, #24
c0dea43e:	0421      	lsls	r1, r4, #16
c0dea440:	ea47 4303 	orr.w	r3, r7, r3, lsl #16
c0dea444:	7997      	ldrb	r7, [r2, #6]
c0dea446:	79d2      	ldrb	r2, [r2, #7]
c0dea448:	ea41 6000 	orr.w	r0, r1, r0, lsl #24
c0dea44c:	ea40 2005 	orr.w	r0, r0, r5, lsl #8
c0dea450:	ea43 2307 	orr.w	r3, r3, r7, lsl #8
c0dea454:	1981      	adds	r1, r0, r6
c0dea456:	441a      	add	r2, r3
c0dea458:	4610      	mov	r0, r2
c0dea45a:	bdf0      	pop	{r4, r5, r6, r7, pc}

c0dea45c <read_u16_le>:
c0dea45c:	5c42      	ldrb	r2, [r0, r1]
c0dea45e:	4408      	add	r0, r1
c0dea460:	7840      	ldrb	r0, [r0, #1]
c0dea462:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0dea466:	b280      	uxth	r0, r0
c0dea468:	4770      	bx	lr

c0dea46a <read_u32_le>:
c0dea46a:	5c42      	ldrb	r2, [r0, r1]
c0dea46c:	4408      	add	r0, r1
c0dea46e:	7841      	ldrb	r1, [r0, #1]
c0dea470:	7883      	ldrb	r3, [r0, #2]
c0dea472:	78c0      	ldrb	r0, [r0, #3]
c0dea474:	ea42 2101 	orr.w	r1, r2, r1, lsl #8
c0dea478:	ea41 4103 	orr.w	r1, r1, r3, lsl #16
c0dea47c:	ea41 6000 	orr.w	r0, r1, r0, lsl #24
c0dea480:	4770      	bx	lr

c0dea482 <read_u64_le>:
c0dea482:	b5b0      	push	{r4, r5, r7, lr}
c0dea484:	5c42      	ldrb	r2, [r0, r1]
c0dea486:	4401      	add	r1, r0
c0dea488:	7848      	ldrb	r0, [r1, #1]
c0dea48a:	788b      	ldrb	r3, [r1, #2]
c0dea48c:	790d      	ldrb	r5, [r1, #4]
c0dea48e:	78cc      	ldrb	r4, [r1, #3]
c0dea490:	ea42 2000 	orr.w	r0, r2, r0, lsl #8
c0dea494:	794a      	ldrb	r2, [r1, #5]
c0dea496:	ea40 4003 	orr.w	r0, r0, r3, lsl #16
c0dea49a:	798b      	ldrb	r3, [r1, #6]
c0dea49c:	79c9      	ldrb	r1, [r1, #7]
c0dea49e:	ea45 2202 	orr.w	r2, r5, r2, lsl #8
c0dea4a2:	ea40 6004 	orr.w	r0, r0, r4, lsl #24
c0dea4a6:	ea42 4203 	orr.w	r2, r2, r3, lsl #16
c0dea4aa:	ea42 6101 	orr.w	r1, r2, r1, lsl #24
c0dea4ae:	bdb0      	pop	{r4, r5, r7, pc}

c0dea4b0 <varint_read>:
c0dea4b0:	b510      	push	{r4, lr}
c0dea4b2:	b1d9      	cbz	r1, c0dea4ec <varint_read+0x3c>
c0dea4b4:	4614      	mov	r4, r2
c0dea4b6:	4602      	mov	r2, r0
c0dea4b8:	7800      	ldrb	r0, [r0, #0]
c0dea4ba:	28ff      	cmp	r0, #255	@ 0xff
c0dea4bc:	d00c      	beq.n	c0dea4d8 <varint_read+0x28>
c0dea4be:	28fe      	cmp	r0, #254	@ 0xfe
c0dea4c0:	d012      	beq.n	c0dea4e8 <varint_read+0x38>
c0dea4c2:	28fd      	cmp	r0, #253	@ 0xfd
c0dea4c4:	d115      	bne.n	c0dea4f2 <varint_read+0x42>
c0dea4c6:	2903      	cmp	r1, #3
c0dea4c8:	d310      	bcc.n	c0dea4ec <varint_read+0x3c>
c0dea4ca:	4610      	mov	r0, r2
c0dea4cc:	2101      	movs	r1, #1
c0dea4ce:	f7ff ffc5 	bl	c0dea45c <read_u16_le>
c0dea4d2:	2100      	movs	r1, #0
c0dea4d4:	2203      	movs	r2, #3
c0dea4d6:	e015      	b.n	c0dea504 <varint_read+0x54>
c0dea4d8:	2909      	cmp	r1, #9
c0dea4da:	d307      	bcc.n	c0dea4ec <varint_read+0x3c>
c0dea4dc:	4610      	mov	r0, r2
c0dea4de:	2101      	movs	r1, #1
c0dea4e0:	f7ff ffcf 	bl	c0dea482 <read_u64_le>
c0dea4e4:	2209      	movs	r2, #9
c0dea4e6:	e00d      	b.n	c0dea504 <varint_read+0x54>
c0dea4e8:	2905      	cmp	r1, #5
c0dea4ea:	d205      	bcs.n	c0dea4f8 <varint_read+0x48>
c0dea4ec:	f04f 32ff 	mov.w	r2, #4294967295	@ 0xffffffff
c0dea4f0:	e00a      	b.n	c0dea508 <varint_read+0x58>
c0dea4f2:	2100      	movs	r1, #0
c0dea4f4:	2201      	movs	r2, #1
c0dea4f6:	e005      	b.n	c0dea504 <varint_read+0x54>
c0dea4f8:	4610      	mov	r0, r2
c0dea4fa:	2101      	movs	r1, #1
c0dea4fc:	f7ff ffb5 	bl	c0dea46a <read_u32_le>
c0dea500:	2100      	movs	r1, #0
c0dea502:	2205      	movs	r2, #5
c0dea504:	e9c4 0100 	strd	r0, r1, [r4]
c0dea508:	4610      	mov	r0, r2
c0dea50a:	bd10      	pop	{r4, pc}

c0dea50c <write_u16_be>:
c0dea50c:	0a13      	lsrs	r3, r2, #8
c0dea50e:	5443      	strb	r3, [r0, r1]
c0dea510:	4408      	add	r0, r1
c0dea512:	7042      	strb	r2, [r0, #1]
c0dea514:	4770      	bx	lr
	...

c0dea518 <ux_process_finger_event>:
c0dea518:	b5b0      	push	{r4, r5, r7, lr}
c0dea51a:	4604      	mov	r4, r0
c0dea51c:	2001      	movs	r0, #1
c0dea51e:	f000 f827 	bl	c0dea570 <ux_forward_event>
c0dea522:	4605      	mov	r5, r0
c0dea524:	f000 f902 	bl	c0dea72c <nbgl_objAllowDrawing>
c0dea528:	b1fd      	cbz	r5, c0dea56a <ux_process_finger_event+0x52>
c0dea52a:	78e1      	ldrb	r1, [r4, #3]
c0dea52c:	480f      	ldr	r0, [pc, #60]	@ (c0dea56c <ux_process_finger_event+0x54>)
c0dea52e:	7963      	ldrb	r3, [r4, #5]
c0dea530:	3901      	subs	r1, #1
c0dea532:	eb09 0200 	add.w	r2, r9, r0
c0dea536:	f859 0000 	ldr.w	r0, [r9, r0]
c0dea53a:	fab1 f181 	clz	r1, r1
c0dea53e:	094d      	lsrs	r5, r1, #5
c0dea540:	4611      	mov	r1, r2
c0dea542:	f801 5f04 	strb.w	r5, [r1, #4]!
c0dea546:	7925      	ldrb	r5, [r4, #4]
c0dea548:	ea43 2305 	orr.w	r3, r3, r5, lsl #8
c0dea54c:	80d3      	strh	r3, [r2, #6]
c0dea54e:	79a3      	ldrb	r3, [r4, #6]
c0dea550:	79e4      	ldrb	r4, [r4, #7]
c0dea552:	ea44 2303 	orr.w	r3, r4, r3, lsl #8
c0dea556:	8113      	strh	r3, [r2, #8]
c0dea558:	2264      	movs	r2, #100	@ 0x64
c0dea55a:	4342      	muls	r2, r0
c0dea55c:	2000      	movs	r0, #0
c0dea55e:	f000 f93a 	bl	c0dea7d6 <nbgl_touchHandler>
c0dea562:	e8bd 40b0 	ldmia.w	sp!, {r4, r5, r7, lr}
c0dea566:	f000 b8c8 	b.w	c0dea6fa <nbgl_refresh>
c0dea56a:	bdb0      	pop	{r4, r5, r7, pc}
c0dea56c:	00001e48 	.word	0x00001e48

c0dea570 <ux_forward_event>:
c0dea570:	b5b0      	push	{r4, r5, r7, lr}
c0dea572:	4604      	mov	r4, r0
c0dea574:	4812      	ldr	r0, [pc, #72]	@ (c0dea5c0 <ux_forward_event+0x50>)
c0dea576:	2101      	movs	r1, #1
c0dea578:	f809 1000 	strb.w	r1, [r9, r0]
c0dea57c:	eb09 0500 	add.w	r5, r9, r0
c0dea580:	2000      	movs	r0, #0
c0dea582:	6068      	str	r0, [r5, #4]
c0dea584:	4628      	mov	r0, r5
c0dea586:	f000 fb59 	bl	c0deac3c <os_ux>
c0dea58a:	2004      	movs	r0, #4
c0dea58c:	f000 fbc8 	bl	c0dead20 <os_sched_last_status>
c0dea590:	2869      	cmp	r0, #105	@ 0x69
c0dea592:	6068      	str	r0, [r5, #4]
c0dea594:	d108      	bne.n	c0dea5a8 <ux_forward_event+0x38>
c0dea596:	2001      	movs	r0, #1
c0dea598:	f000 f8c8 	bl	c0dea72c <nbgl_objAllowDrawing>
c0dea59c:	f000 f8d5 	bl	c0dea74a <nbgl_screenRedraw>
c0dea5a0:	f000 f8ab 	bl	c0dea6fa <nbgl_refresh>
c0dea5a4:	2000      	movs	r0, #0
c0dea5a6:	bdb0      	pop	{r4, r5, r7, pc}
c0dea5a8:	b144      	cbz	r4, c0dea5bc <ux_forward_event+0x4c>
c0dea5aa:	f1b0 0197 	subs.w	r1, r0, #151	@ 0x97
c0dea5ae:	bf18      	it	ne
c0dea5b0:	2101      	movne	r1, #1
c0dea5b2:	2800      	cmp	r0, #0
c0dea5b4:	bf18      	it	ne
c0dea5b6:	2001      	movne	r0, #1
c0dea5b8:	4008      	ands	r0, r1
c0dea5ba:	bdb0      	pop	{r4, r5, r7, pc}
c0dea5bc:	2001      	movs	r0, #1
c0dea5be:	bdb0      	pop	{r4, r5, r7, pc}
c0dea5c0:	00001e24 	.word	0x00001e24

c0dea5c4 <ux_process_ticker_event>:
c0dea5c4:	b5bc      	push	{r2, r3, r4, r5, r7, lr}
c0dea5c6:	4d19      	ldr	r5, [pc, #100]	@ (c0dea62c <ux_process_ticker_event+0x68>)
c0dea5c8:	f859 0005 	ldr.w	r0, [r9, r5]
c0dea5cc:	3001      	adds	r0, #1
c0dea5ce:	f849 0005 	str.w	r0, [r9, r5]
c0dea5d2:	2001      	movs	r0, #1
c0dea5d4:	f7ff ffcc 	bl	c0dea570 <ux_forward_event>
c0dea5d8:	4604      	mov	r4, r0
c0dea5da:	f000 f8a7 	bl	c0dea72c <nbgl_objAllowDrawing>
c0dea5de:	b324      	cbz	r4, c0dea62a <ux_process_ticker_event+0x66>
c0dea5e0:	2064      	movs	r0, #100	@ 0x64
c0dea5e2:	2464      	movs	r4, #100	@ 0x64
c0dea5e4:	f000 f8c0 	bl	c0dea768 <nbgl_screenHandler>
c0dea5e8:	eb09 0005 	add.w	r0, r9, r5
c0dea5ec:	7900      	ldrb	r0, [r0, #4]
c0dea5ee:	2801      	cmp	r0, #1
c0dea5f0:	d119      	bne.n	c0dea626 <ux_process_ticker_event+0x62>
c0dea5f2:	4668      	mov	r0, sp
c0dea5f4:	f000 fba0 	bl	c0dead38 <touch_get_last_info>
c0dea5f8:	f8bd 0000 	ldrh.w	r0, [sp]
c0dea5fc:	eb09 0105 	add.w	r1, r9, r5
c0dea600:	80c8      	strh	r0, [r1, #6]
c0dea602:	f8bd 0002 	ldrh.w	r0, [sp, #2]
c0dea606:	8108      	strh	r0, [r1, #8]
c0dea608:	f89d 0004 	ldrb.w	r0, [sp, #4]
c0dea60c:	3801      	subs	r0, #1
c0dea60e:	fab0 f080 	clz	r0, r0
c0dea612:	0940      	lsrs	r0, r0, #5
c0dea614:	f801 0f04 	strb.w	r0, [r1, #4]!
c0dea618:	f859 0005 	ldr.w	r0, [r9, r5]
c0dea61c:	fb00 f204 	mul.w	r2, r0, r4
c0dea620:	2000      	movs	r0, #0
c0dea622:	f000 f8d8 	bl	c0dea7d6 <nbgl_touchHandler>
c0dea626:	f000 f868 	bl	c0dea6fa <nbgl_refresh>
c0dea62a:	bdbc      	pop	{r2, r3, r4, r5, r7, pc}
c0dea62c:	00001e48 	.word	0x00001e48

c0dea630 <ux_process_default_event>:
c0dea630:	2000      	movs	r0, #0
c0dea632:	f7ff bf9d 	b.w	c0dea570 <ux_forward_event>

c0dea636 <hash_iovec_ex>:
c0dea636:	e92d 45f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
c0dea63a:	468a      	mov	sl, r1
c0dea63c:	4611      	mov	r1, r2
c0dea63e:	461a      	mov	r2, r3
c0dea640:	4605      	mov	r5, r0
c0dea642:	f000 f840 	bl	c0dea6c6 <cx_hash_init_ex>
c0dea646:	4607      	mov	r7, r0
c0dea648:	b9a8      	cbnz	r0, c0dea676 <hash_iovec_ex+0x40>
c0dea64a:	f10d 0820 	add.w	r8, sp, #32
c0dea64e:	e898 0141 	ldmia.w	r8, {r0, r6, r8}
c0dea652:	1d04      	adds	r4, r0, #4
c0dea654:	b156      	cbz	r6, c0dea66c <hash_iovec_ex+0x36>
c0dea656:	f854 1c04 	ldr.w	r1, [r4, #-4]
c0dea65a:	f854 2b08 	ldr.w	r2, [r4], #8
c0dea65e:	4628      	mov	r0, r5
c0dea660:	f000 f836 	bl	c0dea6d0 <cx_hash_update>
c0dea664:	3e01      	subs	r6, #1
c0dea666:	2800      	cmp	r0, #0
c0dea668:	d0f4      	beq.n	c0dea654 <hash_iovec_ex+0x1e>
c0dea66a:	e003      	b.n	c0dea674 <hash_iovec_ex+0x3e>
c0dea66c:	4628      	mov	r0, r5
c0dea66e:	4641      	mov	r1, r8
c0dea670:	f000 f824 	bl	c0dea6bc <cx_hash_final>
c0dea674:	4607      	mov	r7, r0
c0dea676:	4628      	mov	r0, r5
c0dea678:	4651      	mov	r1, sl
c0dea67a:	f000 fc8b 	bl	c0deaf94 <explicit_bzero>
c0dea67e:	4638      	mov	r0, r7
c0dea680:	e8bd 85f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, sl, pc}

c0dea684 <cx_keccak_256_hash_iovec>:
c0dea684:	b580      	push	{r7, lr}
c0dea686:	b0ee      	sub	sp, #440	@ 0x1b8
c0dea688:	e88d 0007 	stmia.w	sp, {r0, r1, r2}
c0dea68c:	a804      	add	r0, sp, #16
c0dea68e:	f44f 71d4 	mov.w	r1, #424	@ 0x1a8
c0dea692:	2206      	movs	r2, #6
c0dea694:	2320      	movs	r3, #32
c0dea696:	f7ff ffce 	bl	c0dea636 <hash_iovec_ex>
c0dea69a:	b06e      	add	sp, #440	@ 0x1b8
c0dea69c:	bd80      	pop	{r7, pc}

c0dea69e <cx_ecdsa_sign_no_throw>:
c0dea69e:	b403      	push	{r0, r1}
c0dea6a0:	f04f 002c 	mov.w	r0, #44	@ 0x2c
c0dea6a4:	f000 b822 	b.w	c0dea6ec <cx_trampoline_helper>

c0dea6a8 <cx_ecfp_generate_pair2_no_throw>:
c0dea6a8:	b403      	push	{r0, r1}
c0dea6aa:	f04f 0031 	mov.w	r0, #49	@ 0x31
c0dea6ae:	f000 b81d 	b.w	c0dea6ec <cx_trampoline_helper>

c0dea6b2 <cx_ecfp_init_private_key_no_throw>:
c0dea6b2:	b403      	push	{r0, r1}
c0dea6b4:	f04f 0033 	mov.w	r0, #51	@ 0x33
c0dea6b8:	f000 b818 	b.w	c0dea6ec <cx_trampoline_helper>

c0dea6bc <cx_hash_final>:
c0dea6bc:	b403      	push	{r0, r1}
c0dea6be:	f04f 003f 	mov.w	r0, #63	@ 0x3f
c0dea6c2:	f000 b813 	b.w	c0dea6ec <cx_trampoline_helper>

c0dea6c6 <cx_hash_init_ex>:
c0dea6c6:	b403      	push	{r0, r1}
c0dea6c8:	f04f 0043 	mov.w	r0, #67	@ 0x43
c0dea6cc:	f000 b80e 	b.w	c0dea6ec <cx_trampoline_helper>

c0dea6d0 <cx_hash_update>:
c0dea6d0:	b403      	push	{r0, r1}
c0dea6d2:	f04f 0048 	mov.w	r0, #72	@ 0x48
c0dea6d6:	f000 b809 	b.w	c0dea6ec <cx_trampoline_helper>

c0dea6da <cx_rng_no_throw>:
c0dea6da:	b403      	push	{r0, r1}
c0dea6dc:	f04f 006a 	mov.w	r0, #106	@ 0x6a
c0dea6e0:	f000 b804 	b.w	c0dea6ec <cx_trampoline_helper>

c0dea6e4 <cx_aes_siv_reset>:
c0dea6e4:	b403      	push	{r0, r1}
c0dea6e6:	f04f 0090 	mov.w	r0, #144	@ 0x90
c0dea6ea:	e7ff      	b.n	c0dea6ec <cx_trampoline_helper>

c0dea6ec <cx_trampoline_helper>:
c0dea6ec:	4900      	ldr	r1, [pc, #0]	@ (c0dea6f0 <cx_trampoline_helper+0x4>)
c0dea6ee:	4708      	bx	r1
c0dea6f0:	00808001 	.word	0x00808001

c0dea6f4 <assert_exit>:
c0dea6f4:	20ff      	movs	r0, #255	@ 0xff
c0dea6f6:	f000 facb 	bl	c0deac90 <os_sched_exit>

c0dea6fa <nbgl_refresh>:
c0dea6fa:	b403      	push	{r0, r1}
c0dea6fc:	f04f 0091 	mov.w	r0, #145	@ 0x91
c0dea700:	f000 b878 	b.w	c0dea7f4 <nbgl_trampoline_helper>

c0dea704 <nbgl_refreshSpecial>:
c0dea704:	b403      	push	{r0, r1}
c0dea706:	f04f 0092 	mov.w	r0, #146	@ 0x92
c0dea70a:	f000 b873 	b.w	c0dea7f4 <nbgl_trampoline_helper>

c0dea70e <nbgl_refreshSpecialWithPostRefresh>:
c0dea70e:	b403      	push	{r0, r1}
c0dea710:	f04f 0093 	mov.w	r0, #147	@ 0x93
c0dea714:	f000 b86e 	b.w	c0dea7f4 <nbgl_trampoline_helper>

c0dea718 <nbgl_objInit>:
c0dea718:	b403      	push	{r0, r1}
c0dea71a:	f04f 0096 	mov.w	r0, #150	@ 0x96
c0dea71e:	f000 b869 	b.w	c0dea7f4 <nbgl_trampoline_helper>

c0dea722 <nbgl_objDraw>:
c0dea722:	b403      	push	{r0, r1}
c0dea724:	f04f 0097 	mov.w	r0, #151	@ 0x97
c0dea728:	f000 b864 	b.w	c0dea7f4 <nbgl_trampoline_helper>

c0dea72c <nbgl_objAllowDrawing>:
c0dea72c:	b403      	push	{r0, r1}
c0dea72e:	f04f 0098 	mov.w	r0, #152	@ 0x98
c0dea732:	f000 b85f 	b.w	c0dea7f4 <nbgl_trampoline_helper>

c0dea736 <nbgl_screenSet>:
c0dea736:	b403      	push	{r0, r1}
c0dea738:	f04f 009b 	mov.w	r0, #155	@ 0x9b
c0dea73c:	f000 b85a 	b.w	c0dea7f4 <nbgl_trampoline_helper>

c0dea740 <nbgl_screenPush>:
c0dea740:	b403      	push	{r0, r1}
c0dea742:	f04f 009c 	mov.w	r0, #156	@ 0x9c
c0dea746:	f000 b855 	b.w	c0dea7f4 <nbgl_trampoline_helper>

c0dea74a <nbgl_screenRedraw>:
c0dea74a:	b403      	push	{r0, r1}
c0dea74c:	f04f 009d 	mov.w	r0, #157	@ 0x9d
c0dea750:	f000 b850 	b.w	c0dea7f4 <nbgl_trampoline_helper>

c0dea754 <nbgl_screenPop>:
c0dea754:	b403      	push	{r0, r1}
c0dea756:	f04f 009e 	mov.w	r0, #158	@ 0x9e
c0dea75a:	f000 b84b 	b.w	c0dea7f4 <nbgl_trampoline_helper>

c0dea75e <nbgl_screenUpdateTicker>:
c0dea75e:	b403      	push	{r0, r1}
c0dea760:	f04f 00a4 	mov.w	r0, #164	@ 0xa4
c0dea764:	f000 b846 	b.w	c0dea7f4 <nbgl_trampoline_helper>

c0dea768 <nbgl_screenHandler>:
c0dea768:	b403      	push	{r0, r1}
c0dea76a:	f04f 00a7 	mov.w	r0, #167	@ 0xa7
c0dea76e:	f000 b841 	b.w	c0dea7f4 <nbgl_trampoline_helper>

c0dea772 <nbgl_objPoolGet>:
c0dea772:	b403      	push	{r0, r1}
c0dea774:	f04f 00a8 	mov.w	r0, #168	@ 0xa8
c0dea778:	f000 b83c 	b.w	c0dea7f4 <nbgl_trampoline_helper>

c0dea77c <nbgl_containerPoolGet>:
c0dea77c:	b403      	push	{r0, r1}
c0dea77e:	f04f 00aa 	mov.w	r0, #170	@ 0xaa
c0dea782:	f000 b837 	b.w	c0dea7f4 <nbgl_trampoline_helper>

c0dea786 <nbgl_getFont>:
c0dea786:	b403      	push	{r0, r1}
c0dea788:	f04f 00ac 	mov.w	r0, #172	@ 0xac
c0dea78c:	f000 b832 	b.w	c0dea7f4 <nbgl_trampoline_helper>

c0dea790 <nbgl_getFontHeight>:
c0dea790:	b403      	push	{r0, r1}
c0dea792:	f04f 00ad 	mov.w	r0, #173	@ 0xad
c0dea796:	f000 b82d 	b.w	c0dea7f4 <nbgl_trampoline_helper>

c0dea79a <nbgl_getFontLineHeight>:
c0dea79a:	b403      	push	{r0, r1}
c0dea79c:	f04f 00ae 	mov.w	r0, #174	@ 0xae
c0dea7a0:	f000 b828 	b.w	c0dea7f4 <nbgl_trampoline_helper>

c0dea7a4 <nbgl_getTextHeightInWidth>:
c0dea7a4:	b403      	push	{r0, r1}
c0dea7a6:	f04f 00b2 	mov.w	r0, #178	@ 0xb2
c0dea7aa:	f000 b823 	b.w	c0dea7f4 <nbgl_trampoline_helper>

c0dea7ae <nbgl_getTextNbLinesInWidth>:
c0dea7ae:	b403      	push	{r0, r1}
c0dea7b0:	f04f 00b4 	mov.w	r0, #180	@ 0xb4
c0dea7b4:	f000 b81e 	b.w	c0dea7f4 <nbgl_trampoline_helper>

c0dea7b8 <nbgl_getTextWidth>:
c0dea7b8:	b403      	push	{r0, r1}
c0dea7ba:	f04f 00b6 	mov.w	r0, #182	@ 0xb6
c0dea7be:	f000 b819 	b.w	c0dea7f4 <nbgl_trampoline_helper>

c0dea7c2 <nbgl_getTextMaxLenInNbLines>:
c0dea7c2:	b403      	push	{r0, r1}
c0dea7c4:	f04f 00b7 	mov.w	r0, #183	@ 0xb7
c0dea7c8:	f000 b814 	b.w	c0dea7f4 <nbgl_trampoline_helper>

c0dea7cc <nbgl_textReduceOnNbLines>:
c0dea7cc:	b403      	push	{r0, r1}
c0dea7ce:	f04f 00b8 	mov.w	r0, #184	@ 0xb8
c0dea7d2:	f000 b80f 	b.w	c0dea7f4 <nbgl_trampoline_helper>

c0dea7d6 <nbgl_touchHandler>:
c0dea7d6:	b403      	push	{r0, r1}
c0dea7d8:	f04f 00bb 	mov.w	r0, #187	@ 0xbb
c0dea7dc:	f000 b80a 	b.w	c0dea7f4 <nbgl_trampoline_helper>

c0dea7e0 <nbgl_touchGetTouchDuration>:
c0dea7e0:	b403      	push	{r0, r1}
c0dea7e2:	f04f 00bc 	mov.w	r0, #188	@ 0xbc
c0dea7e6:	f000 b805 	b.w	c0dea7f4 <nbgl_trampoline_helper>
	...

c0dea7ec <pic_init>:
c0dea7ec:	b403      	push	{r0, r1}
c0dea7ee:	f04f 00c4 	mov.w	r0, #196	@ 0xc4
c0dea7f2:	e7ff      	b.n	c0dea7f4 <nbgl_trampoline_helper>

c0dea7f4 <nbgl_trampoline_helper>:
c0dea7f4:	4900      	ldr	r1, [pc, #0]	@ (c0dea7f8 <nbgl_trampoline_helper+0x4>)
c0dea7f6:	4708      	bx	r1
c0dea7f8:	00808001 	.word	0x00808001

c0dea7fc <os_boot>:
c0dea7fc:	2000      	movs	r0, #0
c0dea7fe:	f000 ba85 	b.w	c0dead0c <try_context_set>

c0dea802 <os_longjmp>:
c0dea802:	4604      	mov	r4, r0
c0dea804:	f000 fa7a 	bl	c0deacfc <try_context_get>
c0dea808:	4621      	mov	r1, r4
c0dea80a:	f000 fbff 	bl	c0deb00c <longjmp>
	...

c0dea810 <snprintf>:
c0dea810:	b081      	sub	sp, #4
c0dea812:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0dea816:	b087      	sub	sp, #28
c0dea818:	2800      	cmp	r0, #0
c0dea81a:	930f      	str	r3, [sp, #60]	@ 0x3c
c0dea81c:	f000 817a 	beq.w	c0deab14 <snprintf+0x304>
c0dea820:	460d      	mov	r5, r1
c0dea822:	2900      	cmp	r1, #0
c0dea824:	f000 8176 	beq.w	c0deab14 <snprintf+0x304>
c0dea828:	4629      	mov	r1, r5
c0dea82a:	4616      	mov	r6, r2
c0dea82c:	4604      	mov	r4, r0
c0dea82e:	f000 fba3 	bl	c0deaf78 <__aeabi_memclr>
c0dea832:	f1b5 0801 	subs.w	r8, r5, #1
c0dea836:	f000 816d 	beq.w	c0deab14 <snprintf+0x304>
c0dea83a:	a80f      	add	r0, sp, #60	@ 0x3c
c0dea83c:	9002      	str	r0, [sp, #8]
c0dea83e:	7830      	ldrb	r0, [r6, #0]
c0dea840:	2800      	cmp	r0, #0
c0dea842:	f000 8167 	beq.w	c0deab14 <snprintf+0x304>
c0dea846:	2700      	movs	r7, #0
c0dea848:	b128      	cbz	r0, c0dea856 <snprintf+0x46>
c0dea84a:	2825      	cmp	r0, #37	@ 0x25
c0dea84c:	d003      	beq.n	c0dea856 <snprintf+0x46>
c0dea84e:	19f0      	adds	r0, r6, r7
c0dea850:	3701      	adds	r7, #1
c0dea852:	7840      	ldrb	r0, [r0, #1]
c0dea854:	e7f8      	b.n	c0dea848 <snprintf+0x38>
c0dea856:	4547      	cmp	r7, r8
c0dea858:	bf28      	it	cs
c0dea85a:	4647      	movcs	r7, r8
c0dea85c:	4620      	mov	r0, r4
c0dea85e:	4631      	mov	r1, r6
c0dea860:	463a      	mov	r2, r7
c0dea862:	f000 fb81 	bl	c0deaf68 <__aeabi_memmove>
c0dea866:	ebb8 0807 	subs.w	r8, r8, r7
c0dea86a:	f000 8153 	beq.w	c0deab14 <snprintf+0x304>
c0dea86e:	5df1      	ldrb	r1, [r6, r7]
c0dea870:	19f0      	adds	r0, r6, r7
c0dea872:	443c      	add	r4, r7
c0dea874:	4606      	mov	r6, r0
c0dea876:	2925      	cmp	r1, #37	@ 0x25
c0dea878:	d1e1      	bne.n	c0dea83e <snprintf+0x2e>
c0dea87a:	1c41      	adds	r1, r0, #1
c0dea87c:	f04f 0b00 	mov.w	fp, #0
c0dea880:	f04f 0e20 	mov.w	lr, #32
c0dea884:	2500      	movs	r5, #0
c0dea886:	2600      	movs	r6, #0
c0dea888:	3101      	adds	r1, #1
c0dea88a:	f811 3c01 	ldrb.w	r3, [r1, #-1]
c0dea88e:	4632      	mov	r2, r6
c0dea890:	3101      	adds	r1, #1
c0dea892:	2600      	movs	r6, #0
c0dea894:	2b2d      	cmp	r3, #45	@ 0x2d
c0dea896:	d0f8      	beq.n	c0dea88a <snprintf+0x7a>
c0dea898:	f1a3 0630 	sub.w	r6, r3, #48	@ 0x30
c0dea89c:	2e0a      	cmp	r6, #10
c0dea89e:	d313      	bcc.n	c0dea8c8 <snprintf+0xb8>
c0dea8a0:	2b25      	cmp	r3, #37	@ 0x25
c0dea8a2:	d046      	beq.n	c0dea932 <snprintf+0x122>
c0dea8a4:	2b2a      	cmp	r3, #42	@ 0x2a
c0dea8a6:	d01f      	beq.n	c0dea8e8 <snprintf+0xd8>
c0dea8a8:	2b2e      	cmp	r3, #46	@ 0x2e
c0dea8aa:	d129      	bne.n	c0dea900 <snprintf+0xf0>
c0dea8ac:	f811 2c01 	ldrb.w	r2, [r1, #-1]
c0dea8b0:	2a2a      	cmp	r2, #42	@ 0x2a
c0dea8b2:	d13c      	bne.n	c0dea92e <snprintf+0x11e>
c0dea8b4:	780a      	ldrb	r2, [r1, #0]
c0dea8b6:	2a48      	cmp	r2, #72	@ 0x48
c0dea8b8:	d003      	beq.n	c0dea8c2 <snprintf+0xb2>
c0dea8ba:	2a73      	cmp	r2, #115	@ 0x73
c0dea8bc:	d001      	beq.n	c0dea8c2 <snprintf+0xb2>
c0dea8be:	2a68      	cmp	r2, #104	@ 0x68
c0dea8c0:	d135      	bne.n	c0dea92e <snprintf+0x11e>
c0dea8c2:	9a02      	ldr	r2, [sp, #8]
c0dea8c4:	2601      	movs	r6, #1
c0dea8c6:	e017      	b.n	c0dea8f8 <snprintf+0xe8>
c0dea8c8:	f083 0630 	eor.w	r6, r3, #48	@ 0x30
c0dea8cc:	ea56 060b 	orrs.w	r6, r6, fp
c0dea8d0:	bf08      	it	eq
c0dea8d2:	f04f 0e30 	moveq.w	lr, #48	@ 0x30
c0dea8d6:	eb0b 068b 	add.w	r6, fp, fp, lsl #2
c0dea8da:	3901      	subs	r1, #1
c0dea8dc:	eb03 0346 	add.w	r3, r3, r6, lsl #1
c0dea8e0:	4616      	mov	r6, r2
c0dea8e2:	f1a3 0b30 	sub.w	fp, r3, #48	@ 0x30
c0dea8e6:	e7cf      	b.n	c0dea888 <snprintf+0x78>
c0dea8e8:	460b      	mov	r3, r1
c0dea8ea:	f813 2d01 	ldrb.w	r2, [r3, #-1]!
c0dea8ee:	2a73      	cmp	r2, #115	@ 0x73
c0dea8f0:	d11d      	bne.n	c0dea92e <snprintf+0x11e>
c0dea8f2:	9a02      	ldr	r2, [sp, #8]
c0dea8f4:	2602      	movs	r6, #2
c0dea8f6:	4619      	mov	r1, r3
c0dea8f8:	1d13      	adds	r3, r2, #4
c0dea8fa:	9302      	str	r3, [sp, #8]
c0dea8fc:	6815      	ldr	r5, [r2, #0]
c0dea8fe:	e7c3      	b.n	c0dea888 <snprintf+0x78>
c0dea900:	2b48      	cmp	r3, #72	@ 0x48
c0dea902:	d018      	beq.n	c0dea936 <snprintf+0x126>
c0dea904:	2b58      	cmp	r3, #88	@ 0x58
c0dea906:	d019      	beq.n	c0dea93c <snprintf+0x12c>
c0dea908:	2b63      	cmp	r3, #99	@ 0x63
c0dea90a:	d020      	beq.n	c0dea94e <snprintf+0x13e>
c0dea90c:	2b64      	cmp	r3, #100	@ 0x64
c0dea90e:	d02a      	beq.n	c0dea966 <snprintf+0x156>
c0dea910:	2b68      	cmp	r3, #104	@ 0x68
c0dea912:	d036      	beq.n	c0dea982 <snprintf+0x172>
c0dea914:	2b70      	cmp	r3, #112	@ 0x70
c0dea916:	d006      	beq.n	c0dea926 <snprintf+0x116>
c0dea918:	2b73      	cmp	r3, #115	@ 0x73
c0dea91a:	d037      	beq.n	c0dea98c <snprintf+0x17c>
c0dea91c:	2b75      	cmp	r3, #117	@ 0x75
c0dea91e:	f000 8081 	beq.w	c0deaa24 <snprintf+0x214>
c0dea922:	2b78      	cmp	r3, #120	@ 0x78
c0dea924:	d103      	bne.n	c0dea92e <snprintf+0x11e>
c0dea926:	9400      	str	r4, [sp, #0]
c0dea928:	f04f 0c00 	mov.w	ip, #0
c0dea92c:	e009      	b.n	c0dea942 <snprintf+0x132>
c0dea92e:	1e4e      	subs	r6, r1, #1
c0dea930:	e785      	b.n	c0dea83e <snprintf+0x2e>
c0dea932:	2025      	movs	r0, #37	@ 0x25
c0dea934:	e00f      	b.n	c0dea956 <snprintf+0x146>
c0dea936:	487b      	ldr	r0, [pc, #492]	@ (c0deab24 <snprintf+0x314>)
c0dea938:	4478      	add	r0, pc
c0dea93a:	e024      	b.n	c0dea986 <snprintf+0x176>
c0dea93c:	f04f 0c01 	mov.w	ip, #1
c0dea940:	9400      	str	r4, [sp, #0]
c0dea942:	9a02      	ldr	r2, [sp, #8]
c0dea944:	2400      	movs	r4, #0
c0dea946:	1d13      	adds	r3, r2, #4
c0dea948:	9302      	str	r3, [sp, #8]
c0dea94a:	2310      	movs	r3, #16
c0dea94c:	e072      	b.n	c0deaa34 <snprintf+0x224>
c0dea94e:	9802      	ldr	r0, [sp, #8]
c0dea950:	1d02      	adds	r2, r0, #4
c0dea952:	9202      	str	r2, [sp, #8]
c0dea954:	6800      	ldr	r0, [r0, #0]
c0dea956:	1e4e      	subs	r6, r1, #1
c0dea958:	f804 0b01 	strb.w	r0, [r4], #1
c0dea95c:	f1b8 0801 	subs.w	r8, r8, #1
c0dea960:	f47f af6d 	bne.w	c0dea83e <snprintf+0x2e>
c0dea964:	e0d6      	b.n	c0deab14 <snprintf+0x304>
c0dea966:	9a02      	ldr	r2, [sp, #8]
c0dea968:	9400      	str	r4, [sp, #0]
c0dea96a:	1d13      	adds	r3, r2, #4
c0dea96c:	9302      	str	r3, [sp, #8]
c0dea96e:	6813      	ldr	r3, [r2, #0]
c0dea970:	2b00      	cmp	r3, #0
c0dea972:	461a      	mov	r2, r3
c0dea974:	d500      	bpl.n	c0dea978 <snprintf+0x168>
c0dea976:	425a      	negs	r2, r3
c0dea978:	0fdc      	lsrs	r4, r3, #31
c0dea97a:	f04f 0c00 	mov.w	ip, #0
c0dea97e:	230a      	movs	r3, #10
c0dea980:	e059      	b.n	c0deaa36 <snprintf+0x226>
c0dea982:	4869      	ldr	r0, [pc, #420]	@ (c0deab28 <snprintf+0x318>)
c0dea984:	4478      	add	r0, pc
c0dea986:	f04f 0c01 	mov.w	ip, #1
c0dea98a:	e003      	b.n	c0dea994 <snprintf+0x184>
c0dea98c:	4864      	ldr	r0, [pc, #400]	@ (c0deab20 <snprintf+0x310>)
c0dea98e:	f04f 0c00 	mov.w	ip, #0
c0dea992:	4478      	add	r0, pc
c0dea994:	9b02      	ldr	r3, [sp, #8]
c0dea996:	b2d2      	uxtb	r2, r2
c0dea998:	1d1e      	adds	r6, r3, #4
c0dea99a:	9602      	str	r6, [sp, #8]
c0dea99c:	1e4e      	subs	r6, r1, #1
c0dea99e:	6819      	ldr	r1, [r3, #0]
c0dea9a0:	2a02      	cmp	r2, #2
c0dea9a2:	f000 80a7 	beq.w	c0deaaf4 <snprintf+0x2e4>
c0dea9a6:	2a01      	cmp	r2, #1
c0dea9a8:	d007      	beq.n	c0dea9ba <snprintf+0x1aa>
c0dea9aa:	463d      	mov	r5, r7
c0dea9ac:	b92a      	cbnz	r2, c0dea9ba <snprintf+0x1aa>
c0dea9ae:	2200      	movs	r2, #0
c0dea9b0:	5c8b      	ldrb	r3, [r1, r2]
c0dea9b2:	3201      	adds	r2, #1
c0dea9b4:	2b00      	cmp	r3, #0
c0dea9b6:	d1fb      	bne.n	c0dea9b0 <snprintf+0x1a0>
c0dea9b8:	1e55      	subs	r5, r2, #1
c0dea9ba:	f1bc 0f00 	cmp.w	ip, #0
c0dea9be:	d016      	beq.n	c0dea9ee <snprintf+0x1de>
c0dea9c0:	2d00      	cmp	r5, #0
c0dea9c2:	f43f af3c 	beq.w	c0dea83e <snprintf+0x2e>
c0dea9c6:	f1b8 0f02 	cmp.w	r8, #2
c0dea9ca:	f0c0 80a3 	bcc.w	c0deab14 <snprintf+0x304>
c0dea9ce:	780a      	ldrb	r2, [r1, #0]
c0dea9d0:	0913      	lsrs	r3, r2, #4
c0dea9d2:	f002 020f 	and.w	r2, r2, #15
c0dea9d6:	5cc3      	ldrb	r3, [r0, r3]
c0dea9d8:	f1b8 0802 	subs.w	r8, r8, #2
c0dea9dc:	7023      	strb	r3, [r4, #0]
c0dea9de:	5c82      	ldrb	r2, [r0, r2]
c0dea9e0:	7062      	strb	r2, [r4, #1]
c0dea9e2:	f000 8097 	beq.w	c0deab14 <snprintf+0x304>
c0dea9e6:	3101      	adds	r1, #1
c0dea9e8:	3d01      	subs	r5, #1
c0dea9ea:	3402      	adds	r4, #2
c0dea9ec:	e7e8      	b.n	c0dea9c0 <snprintf+0x1b0>
c0dea9ee:	4545      	cmp	r5, r8
c0dea9f0:	bf28      	it	cs
c0dea9f2:	4645      	movcs	r5, r8
c0dea9f4:	4620      	mov	r0, r4
c0dea9f6:	462a      	mov	r2, r5
c0dea9f8:	f000 fab6 	bl	c0deaf68 <__aeabi_memmove>
c0dea9fc:	ebb8 0805 	subs.w	r8, r8, r5
c0deaa00:	f000 8088 	beq.w	c0deab14 <snprintf+0x304>
c0deaa04:	462f      	mov	r7, r5
c0deaa06:	442c      	add	r4, r5
c0deaa08:	45bb      	cmp	fp, r7
c0deaa0a:	f67f af18 	bls.w	c0dea83e <snprintf+0x2e>
c0deaa0e:	ebab 0507 	sub.w	r5, fp, r7
c0deaa12:	4620      	mov	r0, r4
c0deaa14:	4545      	cmp	r5, r8
c0deaa16:	bf28      	it	cs
c0deaa18:	4645      	movcs	r5, r8
c0deaa1a:	4629      	mov	r1, r5
c0deaa1c:	2220      	movs	r2, #32
c0deaa1e:	f000 faa5 	bl	c0deaf6c <__aeabi_memset>
c0deaa22:	e061      	b.n	c0deaae8 <snprintf+0x2d8>
c0deaa24:	9a02      	ldr	r2, [sp, #8]
c0deaa26:	9400      	str	r4, [sp, #0]
c0deaa28:	2400      	movs	r4, #0
c0deaa2a:	f04f 0c00 	mov.w	ip, #0
c0deaa2e:	1d13      	adds	r3, r2, #4
c0deaa30:	9302      	str	r3, [sp, #8]
c0deaa32:	230a      	movs	r3, #10
c0deaa34:	6812      	ldr	r2, [r2, #0]
c0deaa36:	483d      	ldr	r0, [pc, #244]	@ (c0deab2c <snprintf+0x31c>)
c0deaa38:	1e4e      	subs	r6, r1, #1
c0deaa3a:	f04f 0a01 	mov.w	sl, #1
c0deaa3e:	4478      	add	r0, pc
c0deaa40:	9001      	str	r0, [sp, #4]
c0deaa42:	fba3 570a 	umull	r5, r7, r3, sl
c0deaa46:	2f00      	cmp	r7, #0
c0deaa48:	bf18      	it	ne
c0deaa4a:	2701      	movne	r7, #1
c0deaa4c:	4295      	cmp	r5, r2
c0deaa4e:	d804      	bhi.n	c0deaa5a <snprintf+0x24a>
c0deaa50:	b91f      	cbnz	r7, c0deaa5a <snprintf+0x24a>
c0deaa52:	f1ab 0b01 	sub.w	fp, fp, #1
c0deaa56:	46aa      	mov	sl, r5
c0deaa58:	e7f3      	b.n	c0deaa42 <snprintf+0x232>
c0deaa5a:	2c00      	cmp	r4, #0
c0deaa5c:	4627      	mov	r7, r4
c0deaa5e:	f04f 0500 	mov.w	r5, #0
c0deaa62:	bf18      	it	ne
c0deaa64:	f04f 37ff 	movne.w	r7, #4294967295	@ 0xffffffff
c0deaa68:	d00d      	beq.n	c0deaa86 <snprintf+0x276>
c0deaa6a:	4660      	mov	r0, ip
c0deaa6c:	fa5f fc8e 	uxtb.w	ip, lr
c0deaa70:	a903      	add	r1, sp, #12
c0deaa72:	f1bc 0f30 	cmp.w	ip, #48	@ 0x30
c0deaa76:	4684      	mov	ip, r0
c0deaa78:	d106      	bne.n	c0deaa88 <snprintf+0x278>
c0deaa7a:	202d      	movs	r0, #45	@ 0x2d
c0deaa7c:	2400      	movs	r4, #0
c0deaa7e:	2501      	movs	r5, #1
c0deaa80:	f88d 000c 	strb.w	r0, [sp, #12]
c0deaa84:	e000      	b.n	c0deaa88 <snprintf+0x278>
c0deaa86:	a903      	add	r1, sp, #12
c0deaa88:	eb07 000b 	add.w	r0, r7, fp
c0deaa8c:	3802      	subs	r0, #2
c0deaa8e:	280d      	cmp	r0, #13
c0deaa90:	d808      	bhi.n	c0deaaa4 <snprintf+0x294>
c0deaa92:	f1c7 0701 	rsb	r7, r7, #1
c0deaa96:	45bb      	cmp	fp, r7
c0deaa98:	d004      	beq.n	c0deaaa4 <snprintf+0x294>
c0deaa9a:	f801 e005 	strb.w	lr, [r1, r5]
c0deaa9e:	3701      	adds	r7, #1
c0deaaa0:	3501      	adds	r5, #1
c0deaaa2:	e7f8      	b.n	c0deaa96 <snprintf+0x286>
c0deaaa4:	9f01      	ldr	r7, [sp, #4]
c0deaaa6:	b114      	cbz	r4, c0deaaae <snprintf+0x29e>
c0deaaa8:	202d      	movs	r0, #45	@ 0x2d
c0deaaaa:	5548      	strb	r0, [r1, r5]
c0deaaac:	3501      	adds	r5, #1
c0deaaae:	4820      	ldr	r0, [pc, #128]	@ (c0deab30 <snprintf+0x320>)
c0deaab0:	f1bc 0f00 	cmp.w	ip, #0
c0deaab4:	4478      	add	r0, pc
c0deaab6:	bf08      	it	eq
c0deaab8:	4638      	moveq	r0, r7
c0deaaba:	f1ba 0f00 	cmp.w	sl, #0
c0deaabe:	d00b      	beq.n	c0deaad8 <snprintf+0x2c8>
c0deaac0:	fbb2 f7fa 	udiv	r7, r2, sl
c0deaac4:	fbba faf3 	udiv	sl, sl, r3
c0deaac8:	fbb7 f4f3 	udiv	r4, r7, r3
c0deaacc:	fb04 7413 	mls	r4, r4, r3, r7
c0deaad0:	5d04      	ldrb	r4, [r0, r4]
c0deaad2:	554c      	strb	r4, [r1, r5]
c0deaad4:	3501      	adds	r5, #1
c0deaad6:	e7f0      	b.n	c0deaaba <snprintf+0x2aa>
c0deaad8:	4545      	cmp	r5, r8
c0deaada:	bf28      	it	cs
c0deaadc:	4645      	movcs	r5, r8
c0deaade:	9c00      	ldr	r4, [sp, #0]
c0deaae0:	462a      	mov	r2, r5
c0deaae2:	4620      	mov	r0, r4
c0deaae4:	f000 fa40 	bl	c0deaf68 <__aeabi_memmove>
c0deaae8:	ebb8 0805 	subs.w	r8, r8, r5
c0deaaec:	442c      	add	r4, r5
c0deaaee:	f47f aea6 	bne.w	c0dea83e <snprintf+0x2e>
c0deaaf2:	e00f      	b.n	c0deab14 <snprintf+0x304>
c0deaaf4:	7808      	ldrb	r0, [r1, #0]
c0deaaf6:	2800      	cmp	r0, #0
c0deaaf8:	f47f aea1 	bne.w	c0dea83e <snprintf+0x2e>
c0deaafc:	4545      	cmp	r5, r8
c0deaafe:	bf28      	it	cs
c0deab00:	4645      	movcs	r5, r8
c0deab02:	4620      	mov	r0, r4
c0deab04:	4629      	mov	r1, r5
c0deab06:	2220      	movs	r2, #32
c0deab08:	f000 fa30 	bl	c0deaf6c <__aeabi_memset>
c0deab0c:	ebb8 0805 	subs.w	r8, r8, r5
c0deab10:	f47f af79 	bne.w	c0deaa06 <snprintf+0x1f6>
c0deab14:	2000      	movs	r0, #0
c0deab16:	b007      	add	sp, #28
c0deab18:	e8bd 4df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0deab1c:	b001      	add	sp, #4
c0deab1e:	4770      	bx	lr
c0deab20:	00003b6e 	.word	0x00003b6e
c0deab24:	00003bd8 	.word	0x00003bd8
c0deab28:	00003b7c 	.word	0x00003b7c
c0deab2c:	00003ac2 	.word	0x00003ac2
c0deab30:	00003a5c 	.word	0x00003a5c

c0deab34 <pic>:
c0deab34:	4a0a      	ldr	r2, [pc, #40]	@ (c0deab60 <pic+0x2c>)
c0deab36:	4282      	cmp	r2, r0
c0deab38:	490a      	ldr	r1, [pc, #40]	@ (c0deab64 <pic+0x30>)
c0deab3a:	d806      	bhi.n	c0deab4a <pic+0x16>
c0deab3c:	4281      	cmp	r1, r0
c0deab3e:	d304      	bcc.n	c0deab4a <pic+0x16>
c0deab40:	b580      	push	{r7, lr}
c0deab42:	f000 f815 	bl	c0deab70 <pic_internal>
c0deab46:	e8bd 4080 	ldmia.w	sp!, {r7, lr}
c0deab4a:	4907      	ldr	r1, [pc, #28]	@ (c0deab68 <pic+0x34>)
c0deab4c:	4288      	cmp	r0, r1
c0deab4e:	4a07      	ldr	r2, [pc, #28]	@ (c0deab6c <pic+0x38>)
c0deab50:	d304      	bcc.n	c0deab5c <pic+0x28>
c0deab52:	4290      	cmp	r0, r2
c0deab54:	d802      	bhi.n	c0deab5c <pic+0x28>
c0deab56:	1a40      	subs	r0, r0, r1
c0deab58:	4649      	mov	r1, r9
c0deab5a:	4408      	add	r0, r1
c0deab5c:	4770      	bx	lr
c0deab5e:	0000      	movs	r0, r0
c0deab60:	c0de0000 	.word	0xc0de0000
c0deab64:	c0dee96b 	.word	0xc0dee96b
c0deab68:	da7a0000 	.word	0xda7a0000
c0deab6c:	da7a9000 	.word	0xda7a9000

c0deab70 <pic_internal>:
c0deab70:	467a      	mov	r2, pc
c0deab72:	4902      	ldr	r1, [pc, #8]	@ (c0deab7c <pic_internal+0xc>)
c0deab74:	1cc9      	adds	r1, r1, #3
c0deab76:	1a89      	subs	r1, r1, r2
c0deab78:	1a40      	subs	r0, r0, r1
c0deab7a:	4770      	bx	lr
c0deab7c:	c0deab71 	.word	0xc0deab71

c0deab80 <SVC_Call>:
c0deab80:	df01      	svc	1
c0deab82:	2900      	cmp	r1, #0
c0deab84:	d100      	bne.n	c0deab88 <exception>
c0deab86:	4770      	bx	lr

c0deab88 <exception>:
c0deab88:	4608      	mov	r0, r1
c0deab8a:	f7ff fe3a 	bl	c0dea802 <os_longjmp>
	...

c0deab90 <SVC_cx_call>:
c0deab90:	df01      	svc	1
c0deab92:	4770      	bx	lr

c0deab94 <nbgl_wait_pipeline>:
c0deab94:	b5e0      	push	{r5, r6, r7, lr}
c0deab96:	2000      	movs	r0, #0
c0deab98:	9001      	str	r0, [sp, #4]
c0deab9a:	4802      	ldr	r0, [pc, #8]	@ (c0deaba4 <nbgl_wait_pipeline+0x10>)
c0deab9c:	a901      	add	r1, sp, #4
c0deab9e:	f7ff ffef 	bl	c0deab80 <SVC_Call>
c0deaba2:	bd8c      	pop	{r2, r3, r7, pc}
c0deaba4:	00fa0011 	.word	0x00fa0011

c0deaba8 <nvm_write>:
c0deaba8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0deabaa:	ab01      	add	r3, sp, #4
c0deabac:	c307      	stmia	r3!, {r0, r1, r2}
c0deabae:	4802      	ldr	r0, [pc, #8]	@ (c0deabb8 <nvm_write+0x10>)
c0deabb0:	a901      	add	r1, sp, #4
c0deabb2:	f7ff ffe5 	bl	c0deab80 <SVC_Call>
c0deabb6:	bd8f      	pop	{r0, r1, r2, r3, r7, pc}
c0deabb8:	03000003 	.word	0x03000003

c0deabbc <cx_ecdomain_parameters_length>:
c0deabbc:	b5e0      	push	{r5, r6, r7, lr}
c0deabbe:	e9cd 0100 	strd	r0, r1, [sp]
c0deabc2:	4802      	ldr	r0, [pc, #8]	@ (c0deabcc <cx_ecdomain_parameters_length+0x10>)
c0deabc4:	4669      	mov	r1, sp
c0deabc6:	f7ff ffe3 	bl	c0deab90 <SVC_cx_call>
c0deabca:	bd8c      	pop	{r2, r3, r7, pc}
c0deabcc:	0200012f 	.word	0x0200012f

c0deabd0 <os_perso_derive_node_with_seed_key>:
c0deabd0:	b510      	push	{r4, lr}
c0deabd2:	b088      	sub	sp, #32
c0deabd4:	9c0d      	ldr	r4, [sp, #52]	@ 0x34
c0deabd6:	9407      	str	r4, [sp, #28]
c0deabd8:	9c0c      	ldr	r4, [sp, #48]	@ 0x30
c0deabda:	9406      	str	r4, [sp, #24]
c0deabdc:	9c0b      	ldr	r4, [sp, #44]	@ 0x2c
c0deabde:	9405      	str	r4, [sp, #20]
c0deabe0:	9c0a      	ldr	r4, [sp, #40]	@ 0x28
c0deabe2:	e88d 001f 	stmia.w	sp, {r0, r1, r2, r3, r4}
c0deabe6:	4803      	ldr	r0, [pc, #12]	@ (c0deabf4 <os_perso_derive_node_with_seed_key+0x24>)
c0deabe8:	4669      	mov	r1, sp
c0deabea:	f7ff ffc9 	bl	c0deab80 <SVC_Call>
c0deabee:	b008      	add	sp, #32
c0deabf0:	bd10      	pop	{r4, pc}
c0deabf2:	bf00      	nop
c0deabf4:	080000a6 	.word	0x080000a6

c0deabf8 <os_pki_load_certificate>:
c0deabf8:	b510      	push	{r4, lr}
c0deabfa:	b086      	sub	sp, #24
c0deabfc:	9c09      	ldr	r4, [sp, #36]	@ 0x24
c0deabfe:	9405      	str	r4, [sp, #20]
c0deac00:	9c08      	ldr	r4, [sp, #32]
c0deac02:	e88d 001f 	stmia.w	sp, {r0, r1, r2, r3, r4}
c0deac06:	4803      	ldr	r0, [pc, #12]	@ (c0deac14 <os_pki_load_certificate+0x1c>)
c0deac08:	4669      	mov	r1, sp
c0deac0a:	f7ff ffb9 	bl	c0deab80 <SVC_Call>
c0deac0e:	b006      	add	sp, #24
c0deac10:	bd10      	pop	{r4, pc}
c0deac12:	bf00      	nop
c0deac14:	060000aa 	.word	0x060000aa

c0deac18 <os_perso_is_pin_set>:
c0deac18:	b5e0      	push	{r5, r6, r7, lr}
c0deac1a:	2000      	movs	r0, #0
c0deac1c:	4669      	mov	r1, sp
c0deac1e:	9001      	str	r0, [sp, #4]
c0deac20:	209e      	movs	r0, #158	@ 0x9e
c0deac22:	f7ff ffad 	bl	c0deab80 <SVC_Call>
c0deac26:	b2c0      	uxtb	r0, r0
c0deac28:	bd8c      	pop	{r2, r3, r7, pc}

c0deac2a <os_global_pin_is_validated>:
c0deac2a:	b5e0      	push	{r5, r6, r7, lr}
c0deac2c:	2000      	movs	r0, #0
c0deac2e:	4669      	mov	r1, sp
c0deac30:	9001      	str	r0, [sp, #4]
c0deac32:	20a0      	movs	r0, #160	@ 0xa0
c0deac34:	f7ff ffa4 	bl	c0deab80 <SVC_Call>
c0deac38:	b2c0      	uxtb	r0, r0
c0deac3a:	bd8c      	pop	{r2, r3, r7, pc}

c0deac3c <os_ux>:
c0deac3c:	b5e0      	push	{r5, r6, r7, lr}
c0deac3e:	f000 f885 	bl	c0dead4c <OUTLINED_FUNCTION_0>
c0deac42:	4802      	ldr	r0, [pc, #8]	@ (c0deac4c <os_ux+0x10>)
c0deac44:	4669      	mov	r1, sp
c0deac46:	f7ff ff9b 	bl	c0deab80 <SVC_Call>
c0deac4a:	bd8c      	pop	{r2, r3, r7, pc}
c0deac4c:	01000064 	.word	0x01000064

c0deac50 <os_flags>:
c0deac50:	b5e0      	push	{r5, r6, r7, lr}
c0deac52:	2000      	movs	r0, #0
c0deac54:	4669      	mov	r1, sp
c0deac56:	9001      	str	r0, [sp, #4]
c0deac58:	206a      	movs	r0, #106	@ 0x6a
c0deac5a:	f7ff ff91 	bl	c0deab80 <SVC_Call>
c0deac5e:	bd8c      	pop	{r2, r3, r7, pc}

c0deac60 <os_setting_get>:
c0deac60:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0deac62:	ab01      	add	r3, sp, #4
c0deac64:	c307      	stmia	r3!, {r0, r1, r2}
c0deac66:	4803      	ldr	r0, [pc, #12]	@ (c0deac74 <os_setting_get+0x14>)
c0deac68:	a901      	add	r1, sp, #4
c0deac6a:	f7ff ff89 	bl	c0deab80 <SVC_Call>
c0deac6e:	b004      	add	sp, #16
c0deac70:	bd80      	pop	{r7, pc}
c0deac72:	bf00      	nop
c0deac74:	03000070 	.word	0x03000070

c0deac78 <os_registry_get_current_app_tag>:
c0deac78:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0deac7a:	ab01      	add	r3, sp, #4
c0deac7c:	c307      	stmia	r3!, {r0, r1, r2}
c0deac7e:	4803      	ldr	r0, [pc, #12]	@ (c0deac8c <os_registry_get_current_app_tag+0x14>)
c0deac80:	a901      	add	r1, sp, #4
c0deac82:	f7ff ff7d 	bl	c0deab80 <SVC_Call>
c0deac86:	b004      	add	sp, #16
c0deac88:	bd80      	pop	{r7, pc}
c0deac8a:	bf00      	nop
c0deac8c:	03000074 	.word	0x03000074

c0deac90 <os_sched_exit>:
c0deac90:	b082      	sub	sp, #8
c0deac92:	f000 f85b 	bl	c0dead4c <OUTLINED_FUNCTION_0>
c0deac96:	4802      	ldr	r0, [pc, #8]	@ (c0deaca0 <os_sched_exit+0x10>)
c0deac98:	4669      	mov	r1, sp
c0deac9a:	f7ff ff71 	bl	c0deab80 <SVC_Call>
c0deac9e:	deff      	udf	#255	@ 0xff
c0deaca0:	0100009a 	.word	0x0100009a

c0deaca4 <os_io_init>:
c0deaca4:	b5e0      	push	{r5, r6, r7, lr}
c0deaca6:	9001      	str	r0, [sp, #4]
c0deaca8:	4802      	ldr	r0, [pc, #8]	@ (c0deacb4 <os_io_init+0x10>)
c0deacaa:	a901      	add	r1, sp, #4
c0deacac:	f7ff ff68 	bl	c0deab80 <SVC_Call>
c0deacb0:	bd8c      	pop	{r2, r3, r7, pc}
c0deacb2:	bf00      	nop
c0deacb4:	01000084 	.word	0x01000084

c0deacb8 <os_io_start>:
c0deacb8:	b5e0      	push	{r5, r6, r7, lr}
c0deacba:	2000      	movs	r0, #0
c0deacbc:	4669      	mov	r1, sp
c0deacbe:	9001      	str	r0, [sp, #4]
c0deacc0:	4801      	ldr	r0, [pc, #4]	@ (c0deacc8 <os_io_start+0x10>)
c0deacc2:	f7ff ff5d 	bl	c0deab80 <SVC_Call>
c0deacc6:	bd8c      	pop	{r2, r3, r7, pc}
c0deacc8:	01000085 	.word	0x01000085

c0deaccc <os_io_tx_cmd>:
c0deaccc:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0deacce:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
c0deacd2:	4803      	ldr	r0, [pc, #12]	@ (c0deace0 <os_io_tx_cmd+0x14>)
c0deacd4:	4669      	mov	r1, sp
c0deacd6:	f7ff ff53 	bl	c0deab80 <SVC_Call>
c0deacda:	b004      	add	sp, #16
c0deacdc:	bd80      	pop	{r7, pc}
c0deacde:	bf00      	nop
c0deace0:	04000088 	.word	0x04000088

c0deace4 <os_io_rx_evt>:
c0deace4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
c0deace6:	e88d 000f 	stmia.w	sp, {r0, r1, r2, r3}
c0deacea:	4803      	ldr	r0, [pc, #12]	@ (c0deacf8 <os_io_rx_evt+0x14>)
c0deacec:	4669      	mov	r1, sp
c0deacee:	f7ff ff47 	bl	c0deab80 <SVC_Call>
c0deacf2:	b004      	add	sp, #16
c0deacf4:	bd80      	pop	{r7, pc}
c0deacf6:	bf00      	nop
c0deacf8:	03000089 	.word	0x03000089

c0deacfc <try_context_get>:
c0deacfc:	b5e0      	push	{r5, r6, r7, lr}
c0deacfe:	2000      	movs	r0, #0
c0dead00:	4669      	mov	r1, sp
c0dead02:	9001      	str	r0, [sp, #4]
c0dead04:	2087      	movs	r0, #135	@ 0x87
c0dead06:	f7ff ff3b 	bl	c0deab80 <SVC_Call>
c0dead0a:	bd8c      	pop	{r2, r3, r7, pc}

c0dead0c <try_context_set>:
c0dead0c:	b5e0      	push	{r5, r6, r7, lr}
c0dead0e:	f000 f81d 	bl	c0dead4c <OUTLINED_FUNCTION_0>
c0dead12:	4802      	ldr	r0, [pc, #8]	@ (c0dead1c <try_context_set+0x10>)
c0dead14:	4669      	mov	r1, sp
c0dead16:	f7ff ff33 	bl	c0deab80 <SVC_Call>
c0dead1a:	bd8c      	pop	{r2, r3, r7, pc}
c0dead1c:	0100010b 	.word	0x0100010b

c0dead20 <os_sched_last_status>:
c0dead20:	b5e0      	push	{r5, r6, r7, lr}
c0dead22:	f000 f813 	bl	c0dead4c <OUTLINED_FUNCTION_0>
c0dead26:	4803      	ldr	r0, [pc, #12]	@ (c0dead34 <os_sched_last_status+0x14>)
c0dead28:	4669      	mov	r1, sp
c0dead2a:	f7ff ff29 	bl	c0deab80 <SVC_Call>
c0dead2e:	b2c0      	uxtb	r0, r0
c0dead30:	bd8c      	pop	{r2, r3, r7, pc}
c0dead32:	bf00      	nop
c0dead34:	0100009c 	.word	0x0100009c

c0dead38 <touch_get_last_info>:
c0dead38:	b5e0      	push	{r5, r6, r7, lr}
c0dead3a:	9001      	str	r0, [sp, #4]
c0dead3c:	4802      	ldr	r0, [pc, #8]	@ (c0dead48 <touch_get_last_info+0x10>)
c0dead3e:	a901      	add	r1, sp, #4
c0dead40:	f7ff ff1e 	bl	c0deab80 <SVC_Call>
c0dead44:	bd8c      	pop	{r2, r3, r7, pc}
c0dead46:	bf00      	nop
c0dead48:	01fa000b 	.word	0x01fa000b

c0dead4c <OUTLINED_FUNCTION_0>:
c0dead4c:	2100      	movs	r1, #0
c0dead4e:	e9cd 0100 	strd	r0, r1, [sp]
c0dead52:	4770      	bx	lr

c0dead54 <__aeabi_llsl>:
c0dead54:	0693      	lsls	r3, r2, #26
c0dead56:	d408      	bmi.n	c0dead6a <__aeabi_llsl+0x16>
c0dead58:	b132      	cbz	r2, c0dead68 <__aeabi_llsl+0x14>
c0dead5a:	f1c2 0320 	rsb	r3, r2, #32
c0dead5e:	4091      	lsls	r1, r2
c0dead60:	fa20 f303 	lsr.w	r3, r0, r3
c0dead64:	4090      	lsls	r0, r2
c0dead66:	4319      	orrs	r1, r3
c0dead68:	4770      	bx	lr
c0dead6a:	f1a2 0120 	sub.w	r1, r2, #32
c0dead6e:	fa00 f101 	lsl.w	r1, r0, r1
c0dead72:	2000      	movs	r0, #0
c0dead74:	4770      	bx	lr
	...

c0dead78 <__aeabi_llsr>:
c0dead78:	0693      	lsls	r3, r2, #26
c0dead7a:	d408      	bmi.n	c0dead8e <__aeabi_llsr+0x16>
c0dead7c:	b132      	cbz	r2, c0dead8c <__aeabi_llsr+0x14>
c0dead7e:	f1c2 0320 	rsb	r3, r2, #32
c0dead82:	40d0      	lsrs	r0, r2
c0dead84:	fa01 f303 	lsl.w	r3, r1, r3
c0dead88:	40d1      	lsrs	r1, r2
c0dead8a:	4318      	orrs	r0, r3
c0dead8c:	4770      	bx	lr
c0dead8e:	f1a2 0020 	sub.w	r0, r2, #32
c0dead92:	fa21 f000 	lsr.w	r0, r1, r0
c0dead96:	2100      	movs	r1, #0
c0dead98:	4770      	bx	lr
	...

c0dead9c <__udivmoddi4>:
c0dead9c:	e92d 4df0 	stmdb	sp!, {r4, r5, r6, r7, r8, sl, fp, lr}
c0deada0:	f8dd c020 	ldr.w	ip, [sp, #32]
c0deada4:	4604      	mov	r4, r0
c0deada6:	b179      	cbz	r1, c0deadc8 <__udivmoddi4+0x2c>
c0deada8:	b1ba      	cbz	r2, c0deadda <__udivmoddi4+0x3e>
c0deadaa:	b35b      	cbz	r3, c0deae04 <__udivmoddi4+0x68>
c0deadac:	fab1 f581 	clz	r5, r1
c0deadb0:	fab3 f683 	clz	r6, r3
c0deadb4:	1b75      	subs	r5, r6, r5
c0deadb6:	2d20      	cmp	r5, #32
c0deadb8:	d34a      	bcc.n	c0deae50 <__udivmoddi4+0xb4>
c0deadba:	f1bc 0f00 	cmp.w	ip, #0
c0deadbe:	bf18      	it	ne
c0deadc0:	e9cc 4100 	strdne	r4, r1, [ip]
c0deadc4:	2400      	movs	r4, #0
c0deadc6:	e066      	b.n	c0deae96 <__udivmoddi4+0xfa>
c0deadc8:	b3cb      	cbz	r3, c0deae3e <__udivmoddi4+0xa2>
c0deadca:	2100      	movs	r1, #0
c0deadcc:	f1bc 0f00 	cmp.w	ip, #0
c0deadd0:	bf18      	it	ne
c0deadd2:	e9cc 4100 	strdne	r4, r1, [ip]
c0deadd6:	2400      	movs	r4, #0
c0deadd8:	e0a6      	b.n	c0deaf28 <__udivmoddi4+0x18c>
c0deadda:	2b00      	cmp	r3, #0
c0deaddc:	d03e      	beq.n	c0deae5c <__udivmoddi4+0xc0>
c0deadde:	2800      	cmp	r0, #0
c0deade0:	d04f      	beq.n	c0deae82 <__udivmoddi4+0xe6>
c0deade2:	1e5d      	subs	r5, r3, #1
c0deade4:	422b      	tst	r3, r5
c0deade6:	d158      	bne.n	c0deae9a <__udivmoddi4+0xfe>
c0deade8:	f1bc 0f00 	cmp.w	ip, #0
c0deadec:	bf1c      	itt	ne
c0deadee:	ea05 0001 	andne.w	r0, r5, r1
c0deadf2:	e9cc 4000 	strdne	r4, r0, [ip]
c0deadf6:	fa93 f0a3 	rbit	r0, r3
c0deadfa:	fab0 f080 	clz	r0, r0
c0deadfe:	fa21 f400 	lsr.w	r4, r1, r0
c0deae02:	e048      	b.n	c0deae96 <__udivmoddi4+0xfa>
c0deae04:	1e55      	subs	r5, r2, #1
c0deae06:	422a      	tst	r2, r5
c0deae08:	d129      	bne.n	c0deae5e <__udivmoddi4+0xc2>
c0deae0a:	f1bc 0f00 	cmp.w	ip, #0
c0deae0e:	bf1e      	ittt	ne
c0deae10:	2300      	movne	r3, #0
c0deae12:	4005      	andne	r5, r0
c0deae14:	e9cc 5300 	strdne	r5, r3, [ip]
c0deae18:	2a01      	cmp	r2, #1
c0deae1a:	f000 8085 	beq.w	c0deaf28 <__udivmoddi4+0x18c>
c0deae1e:	fa92 f2a2 	rbit	r2, r2
c0deae22:	004c      	lsls	r4, r1, #1
c0deae24:	fab2 f282 	clz	r2, r2
c0deae28:	f002 031f 	and.w	r3, r2, #31
c0deae2c:	40d1      	lsrs	r1, r2
c0deae2e:	40d8      	lsrs	r0, r3
c0deae30:	231f      	movs	r3, #31
c0deae32:	4393      	bics	r3, r2
c0deae34:	fa04 f303 	lsl.w	r3, r4, r3
c0deae38:	ea43 0400 	orr.w	r4, r3, r0
c0deae3c:	e074      	b.n	c0deaf28 <__udivmoddi4+0x18c>
c0deae3e:	fbb0 f4f2 	udiv	r4, r0, r2
c0deae42:	f1bc 0f00 	cmp.w	ip, #0
c0deae46:	d026      	beq.n	c0deae96 <__udivmoddi4+0xfa>
c0deae48:	fb04 0012 	mls	r0, r4, r2, r0
c0deae4c:	2100      	movs	r1, #0
c0deae4e:	e020      	b.n	c0deae92 <__udivmoddi4+0xf6>
c0deae50:	f105 0e01 	add.w	lr, r5, #1
c0deae54:	f1be 0f20 	cmp.w	lr, #32
c0deae58:	d00b      	beq.n	c0deae72 <__udivmoddi4+0xd6>
c0deae5a:	e028      	b.n	c0deaeae <__udivmoddi4+0x112>
c0deae5c:	e064      	b.n	c0deaf28 <__udivmoddi4+0x18c>
c0deae5e:	fab1 f481 	clz	r4, r1
c0deae62:	fab2 f582 	clz	r5, r2
c0deae66:	1b2c      	subs	r4, r5, r4
c0deae68:	f104 0e21 	add.w	lr, r4, #33	@ 0x21
c0deae6c:	f1be 0f20 	cmp.w	lr, #32
c0deae70:	d15d      	bne.n	c0deaf2e <__udivmoddi4+0x192>
c0deae72:	f04f 0e20 	mov.w	lr, #32
c0deae76:	f04f 0a00 	mov.w	sl, #0
c0deae7a:	f04f 0b00 	mov.w	fp, #0
c0deae7e:	460e      	mov	r6, r1
c0deae80:	e021      	b.n	c0deaec6 <__udivmoddi4+0x12a>
c0deae82:	fbb1 f4f3 	udiv	r4, r1, r3
c0deae86:	f1bc 0f00 	cmp.w	ip, #0
c0deae8a:	d004      	beq.n	c0deae96 <__udivmoddi4+0xfa>
c0deae8c:	2000      	movs	r0, #0
c0deae8e:	fb04 1113 	mls	r1, r4, r3, r1
c0deae92:	e9cc 0100 	strd	r0, r1, [ip]
c0deae96:	2100      	movs	r1, #0
c0deae98:	e046      	b.n	c0deaf28 <__udivmoddi4+0x18c>
c0deae9a:	fab1 f581 	clz	r5, r1
c0deae9e:	fab3 f683 	clz	r6, r3
c0deaea2:	1b75      	subs	r5, r6, r5
c0deaea4:	2d1f      	cmp	r5, #31
c0deaea6:	f4bf af88 	bcs.w	c0deadba <__udivmoddi4+0x1e>
c0deaeaa:	f105 0e01 	add.w	lr, r5, #1
c0deaeae:	fa20 f40e 	lsr.w	r4, r0, lr
c0deaeb2:	f1c5 051f 	rsb	r5, r5, #31
c0deaeb6:	fa01 f605 	lsl.w	r6, r1, r5
c0deaeba:	fa21 fb0e 	lsr.w	fp, r1, lr
c0deaebe:	40a8      	lsls	r0, r5
c0deaec0:	f04f 0a00 	mov.w	sl, #0
c0deaec4:	4326      	orrs	r6, r4
c0deaec6:	f04f 0800 	mov.w	r8, #0
c0deaeca:	f1be 0f00 	cmp.w	lr, #0
c0deaece:	d01c      	beq.n	c0deaf0a <__udivmoddi4+0x16e>
c0deaed0:	ea4f 014b 	mov.w	r1, fp, lsl #1
c0deaed4:	f1ae 0e01 	sub.w	lr, lr, #1
c0deaed8:	ea41 71d6 	orr.w	r1, r1, r6, lsr #31
c0deaedc:	0076      	lsls	r6, r6, #1
c0deaede:	ea46 75d0 	orr.w	r5, r6, r0, lsr #31
c0deaee2:	1aae      	subs	r6, r5, r2
c0deaee4:	eb61 0b03 	sbc.w	fp, r1, r3
c0deaee8:	43cf      	mvns	r7, r1
c0deaeea:	43ec      	mvns	r4, r5
c0deaeec:	18a4      	adds	r4, r4, r2
c0deaeee:	eb57 0403 	adcs.w	r4, r7, r3
c0deaef2:	bf5c      	itt	pl
c0deaef4:	468b      	movpl	fp, r1
c0deaef6:	462e      	movpl	r6, r5
c0deaef8:	0040      	lsls	r0, r0, #1
c0deaefa:	0fe1      	lsrs	r1, r4, #31
c0deaefc:	ea48 044a 	orr.w	r4, r8, sl, lsl #1
c0deaf00:	ea40 70da 	orr.w	r0, r0, sl, lsr #31
c0deaf04:	46a2      	mov	sl, r4
c0deaf06:	4688      	mov	r8, r1
c0deaf08:	e7df      	b.n	c0deaeca <__udivmoddi4+0x12e>
c0deaf0a:	ea4f 71da 	mov.w	r1, sl, lsr #31
c0deaf0e:	f1bc 0f00 	cmp.w	ip, #0
c0deaf12:	bf18      	it	ne
c0deaf14:	e9cc 6b00 	strdne	r6, fp, [ip]
c0deaf18:	ea41 0140 	orr.w	r1, r1, r0, lsl #1
c0deaf1c:	ea4f 004a 	mov.w	r0, sl, lsl #1
c0deaf20:	f020 0001 	bic.w	r0, r0, #1
c0deaf24:	ea40 0408 	orr.w	r4, r0, r8
c0deaf28:	4620      	mov	r0, r4
c0deaf2a:	e8bd 8df0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, sl, fp, pc}
c0deaf2e:	f1be 0f1f 	cmp.w	lr, #31
c0deaf32:	d804      	bhi.n	c0deaf3e <__udivmoddi4+0x1a2>
c0deaf34:	fa20 f40e 	lsr.w	r4, r0, lr
c0deaf38:	f1ce 0520 	rsb	r5, lr, #32
c0deaf3c:	e7bb      	b.n	c0deaeb6 <__udivmoddi4+0x11a>
c0deaf3e:	f1ce 0740 	rsb	r7, lr, #64	@ 0x40
c0deaf42:	f1ae 0420 	sub.w	r4, lr, #32
c0deaf46:	f04f 0b00 	mov.w	fp, #0
c0deaf4a:	fa20 f504 	lsr.w	r5, r0, r4
c0deaf4e:	fa01 f607 	lsl.w	r6, r1, r7
c0deaf52:	fa00 fa07 	lsl.w	sl, r0, r7
c0deaf56:	ea46 0805 	orr.w	r8, r6, r5
c0deaf5a:	fa21 f604 	lsr.w	r6, r1, r4
c0deaf5e:	4640      	mov	r0, r8
c0deaf60:	e7b1      	b.n	c0deaec6 <__udivmoddi4+0x12a>
	...

c0deaf64 <__aeabi_memcpy>:
c0deaf64:	f000 b81c 	b.w	c0deafa0 <memcpy>

c0deaf68 <__aeabi_memmove>:
c0deaf68:	f000 b828 	b.w	c0deafbc <memmove>

c0deaf6c <__aeabi_memset>:
c0deaf6c:	460b      	mov	r3, r1
c0deaf6e:	4611      	mov	r1, r2
c0deaf70:	461a      	mov	r2, r3
c0deaf72:	f000 b83d 	b.w	c0deaff0 <memset>
c0deaf76:	bf00      	nop

c0deaf78 <__aeabi_memclr>:
c0deaf78:	460a      	mov	r2, r1
c0deaf7a:	2100      	movs	r1, #0
c0deaf7c:	f000 b838 	b.w	c0deaff0 <memset>

c0deaf80 <__aeabi_uldivmod>:
c0deaf80:	b540      	push	{r6, lr}
c0deaf82:	b084      	sub	sp, #16
c0deaf84:	ae02      	add	r6, sp, #8
c0deaf86:	9600      	str	r6, [sp, #0]
c0deaf88:	f7ff ff08 	bl	c0dead9c <__udivmoddi4>
c0deaf8c:	9a02      	ldr	r2, [sp, #8]
c0deaf8e:	9b03      	ldr	r3, [sp, #12]
c0deaf90:	b004      	add	sp, #16
c0deaf92:	bd40      	pop	{r6, pc}

c0deaf94 <explicit_bzero>:
c0deaf94:	f000 b800 	b.w	c0deaf98 <bzero>

c0deaf98 <bzero>:
c0deaf98:	460a      	mov	r2, r1
c0deaf9a:	2100      	movs	r1, #0
c0deaf9c:	f000 b828 	b.w	c0deaff0 <memset>

c0deafa0 <memcpy>:
c0deafa0:	440a      	add	r2, r1
c0deafa2:	4291      	cmp	r1, r2
c0deafa4:	f100 33ff 	add.w	r3, r0, #4294967295	@ 0xffffffff
c0deafa8:	d100      	bne.n	c0deafac <memcpy+0xc>
c0deafaa:	4770      	bx	lr
c0deafac:	b510      	push	{r4, lr}
c0deafae:	f811 4b01 	ldrb.w	r4, [r1], #1
c0deafb2:	4291      	cmp	r1, r2
c0deafb4:	f803 4f01 	strb.w	r4, [r3, #1]!
c0deafb8:	d1f9      	bne.n	c0deafae <memcpy+0xe>
c0deafba:	bd10      	pop	{r4, pc}

c0deafbc <memmove>:
c0deafbc:	4288      	cmp	r0, r1
c0deafbe:	b510      	push	{r4, lr}
c0deafc0:	eb01 0402 	add.w	r4, r1, r2
c0deafc4:	d902      	bls.n	c0deafcc <memmove+0x10>
c0deafc6:	4284      	cmp	r4, r0
c0deafc8:	4623      	mov	r3, r4
c0deafca:	d807      	bhi.n	c0deafdc <memmove+0x20>
c0deafcc:	1e43      	subs	r3, r0, #1
c0deafce:	42a1      	cmp	r1, r4
c0deafd0:	d008      	beq.n	c0deafe4 <memmove+0x28>
c0deafd2:	f811 2b01 	ldrb.w	r2, [r1], #1
c0deafd6:	f803 2f01 	strb.w	r2, [r3, #1]!
c0deafda:	e7f8      	b.n	c0deafce <memmove+0x12>
c0deafdc:	4601      	mov	r1, r0
c0deafde:	4402      	add	r2, r0
c0deafe0:	428a      	cmp	r2, r1
c0deafe2:	d100      	bne.n	c0deafe6 <memmove+0x2a>
c0deafe4:	bd10      	pop	{r4, pc}
c0deafe6:	f813 4d01 	ldrb.w	r4, [r3, #-1]!
c0deafea:	f802 4d01 	strb.w	r4, [r2, #-1]!
c0deafee:	e7f7      	b.n	c0deafe0 <memmove+0x24>

c0deaff0 <memset>:
c0deaff0:	4603      	mov	r3, r0
c0deaff2:	4402      	add	r2, r0
c0deaff4:	4293      	cmp	r3, r2
c0deaff6:	d100      	bne.n	c0deaffa <memset+0xa>
c0deaff8:	4770      	bx	lr
c0deaffa:	f803 1b01 	strb.w	r1, [r3], #1
c0deaffe:	e7f9      	b.n	c0deaff4 <memset+0x4>

c0deb000 <setjmp>:
c0deb000:	46ec      	mov	ip, sp
c0deb002:	e8a0 5ff0 	stmia.w	r0!, {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
c0deb006:	f04f 0000 	mov.w	r0, #0
c0deb00a:	4770      	bx	lr

c0deb00c <longjmp>:
c0deb00c:	e8b0 5ff0 	ldmia.w	r0!, {r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
c0deb010:	46e5      	mov	sp, ip
c0deb012:	0008      	movs	r0, r1
c0deb014:	bf08      	it	eq
c0deb016:	2001      	moveq	r0, #1
c0deb018:	4770      	bx	lr
c0deb01a:	bf00      	nop

c0deb01c <strcmp>:
c0deb01c:	f810 2b01 	ldrb.w	r2, [r0], #1
c0deb020:	f811 3b01 	ldrb.w	r3, [r1], #1
c0deb024:	2a01      	cmp	r2, #1
c0deb026:	bf28      	it	cs
c0deb028:	429a      	cmpcs	r2, r3
c0deb02a:	d0f7      	beq.n	c0deb01c <strcmp>
c0deb02c:	1ad0      	subs	r0, r2, r3
c0deb02e:	4770      	bx	lr

c0deb030 <strlen>:
c0deb030:	4603      	mov	r3, r0
c0deb032:	f813 2b01 	ldrb.w	r2, [r3], #1
c0deb036:	2a00      	cmp	r2, #0
c0deb038:	d1fb      	bne.n	c0deb032 <strlen+0x2>
c0deb03a:	1a18      	subs	r0, r3, r0
c0deb03c:	3801      	subs	r0, #1
c0deb03e:	4770      	bx	lr

c0deb040 <strncpy>:
c0deb040:	4603      	mov	r3, r0
c0deb042:	b510      	push	{r4, lr}
c0deb044:	3901      	subs	r1, #1
c0deb046:	b132      	cbz	r2, c0deb056 <strncpy+0x16>
c0deb048:	f811 4f01 	ldrb.w	r4, [r1, #1]!
c0deb04c:	3a01      	subs	r2, #1
c0deb04e:	f803 4b01 	strb.w	r4, [r3], #1
c0deb052:	2c00      	cmp	r4, #0
c0deb054:	d1f7      	bne.n	c0deb046 <strncpy+0x6>
c0deb056:	2100      	movs	r1, #0
c0deb058:	441a      	add	r2, r3
c0deb05a:	4293      	cmp	r3, r2
c0deb05c:	d100      	bne.n	c0deb060 <strncpy+0x20>
c0deb05e:	bd10      	pop	{r4, pc}
c0deb060:	f803 1b01 	strb.w	r1, [r3], #1
c0deb064:	e7f9      	b.n	c0deb05a <strncpy+0x1a>

c0deb066 <C_app_zknox_64px_bitmap>:
c0deb066:	0040 0040 8922 0002 ffff ffff ffff ffff     @.@."...........
c0deb076:	ffff ffff 0ed7 f55d a39d 3010 8311 f0ad     ......]....0....
c0deb086:	030b 0110 0070 4c81 0dec 2005 0001 7031     ....p..L... ..1p
c0deb096:	0d04 0be9 7231 5011 0a01 99e7 2001 7223     ....1r.P..... #r
c0deb0a6:	1102 8140 e47e 1287 4315 2162 0450 e20e     ..@.~....Cb!P...
c0deb0b6:	13b8 4065 5263 4031 e106 13ab 1485 0373     ..e@cR1@......s.
c0deb0c6:	2142 0750 addf 6513 5364 2142 0b50 96de     B!P....edSB!P...
c0deb0d6:	6027 0474 5243 4021 0d01 9bdc 8015 5325     '`t.CR!@......%S
c0deb0e6:	4304 3152 0640 b6dc 6549 b530 a989 0680     .CR1@...Ie0.....
c0deb0f6:	4312 3142 0140 da0d 010c 8417 c57c c79e     .CB1@.......|...
c0deb106:	3310 4142 0540 a8da 4b48 8ec9 33a4 4132     .3BA@...HK...32A
c0deb116:	0140 c60e cd4e 7691 ccc0 330b 1122 3182     @...N..v...3"..1
c0deb126:	0b60 0bc5 0231 9dcc c026 09ce 1302 0422     `...1...&.....".
c0deb136:	1c0a 728b 0540 0bc5 0130 8bcc c748 c51e     ...r@...0...H...
c0deb146:	060e 1213 0d04 ad1e a2ed 1440 c10d 030e     ..........@.....
c0deb156:	0130 88cc c55d 68bc b075 09c4 1302 ce92     0...]..hu.......
c0deb166:	13a0 ed9a 1090 1a08 6489 0617 0140 cb0c     .........d..@...
c0deb176:	c515 080d 9d1e d0c6 0dc3 8623 31ed dc8c     ..........#..1..
c0deb186:	0a15 0c1d 150b 8364 ca2d 0a02 06c5 c20e     ......d.-.......
c0deb196:	b68e 0ec3 1305 ca88 0931 4d1e 3b6c 319a     ........1..Ml;.1
c0deb1a6:	c9b0 0d04 0ec4 c407 040c 08c4 0113 0210     ................
c0deb1b6:	0821 7d2e 6c0d 0308 07ca c40d 060e 0cc4     !..}.l..........
c0deb1c6:	c405 23ba 705a 0931 2d2e 1d0e 2d4c a39c     ...#Zp1..-..L-..
c0deb1d6:	cad0 0c08 08c5 c30c 0b09 bcc4 4e23 b5d0     ............#N..
c0deb1e6:	3d01 0ce0 b220 d66e ab70 9858 0419 cb0d     .=.. .n.p.X.....
c0deb1f6:	c01a c30e 5a8e 081d c509 060e 8912 1afd     .....Z..........
c0deb206:	edad 1061 39aa c183 49be 30b7 cc07 7f8c     ..a..9...I.0....
c0deb216:	c22e a8ae c79c 220b 3e09 818d 8710 1dc4     .......".>......
c0deb226:	c20e 6b87 ce18 5e02 0eca 8ec1 1281 1a06     ...k...^........
c0deb236:	4189 0610 190c b7c4 b516 ceb0 cf86 8f3e     .A............>.
c0deb246:	1eef 3ec4 d89f 5120 a810 6ddc bbc4 a19c     ...>.. Q...m....
c0deb256:	cec0 6f8a 7e7e 8b4e 2062 6c81 0b1d c505     ...o~~N.b .l....
c0deb266:	8abb d091 01cf 7e0d 5e7e 0c0d 3d2a 6b8c     .......~~^..*=.k
c0deb276:	0dc5 d039 7f8a 7e7e 2e7e 0a2d dd05 0c01     ..9...~~~.-.....
c0deb286:	7e7e 0e7e 8c3d dd5d 040b 7e7e 0e7e 8c2d     ~~~.=.]...~~~.-.
c0deb296:	df7a 0807 7e7e 3d6e 0609 8ee0 7e39 5e7e     z...~~n=....9~~^
c0deb2a6:	0a2d e206 398e 7e7e 2d3e 0609 8ee4 7e38     -....9~~>-....8~
c0deb2b6:	0e7e 083d e607 76be e0cf 7e0d 0e0d 9e2d     ~.=....v...~..-.
c0deb2c6:	90b5 aae9 df29 7d1e 0c1e 0e17 beeb 6b80     ....)..}.......k
c0deb2d6:	0ed0 4ec0 a5ad f03c 72ab 1836 52b7 d039     ...N..<..r6..R9.
c0deb2e6:	1df5 1a0b 0e0d ffff ffff ffff ffff ffff     ................
c0deb2f6:	                                             .

c0deb2f7 <C_app_zknox_64px>:
c0deb2f7:	0040 0040 0102 b066 c0de                    @.@...f...

c0deb301 <C_switch_60_40_bitmap>:
c0deb301:	0000 00ff 0000 ff07 00e0 1f00 f8ff 0000     ................
c0deb311:	ff3f 00fc ff00 ffff 0100 ffff 80ff ff03     ?...............
c0deb321:	ffff 03c0 ffff c0ff ff07 ffff 0fe0 ffff     ................
c0deb331:	f0ff ff0f ffff 1ff0 ffff f8ff ff1f ffff     ................
c0deb341:	1ff8 ffff f8ff ff3f ffff 3ffc ffff fcff     ......?....?....
c0deb351:	ff3f ffff 3ffc ffff fcff ff3f ffff 3ffc     ?....?....?....?
c0deb361:	ffff fcff ff3f ffff 3ffc ffff fcff ff3f     ....?....?....?.
c0deb371:	ffff 3ffc ffff fcff ff3f ffff 3ffc ffff     ...?....?....?..
c0deb381:	fcff ff3f ffff 3ffc 00ff fcff f83f 1f00     ..?....?....?...
c0deb391:	3ffc 00f0 fc0f c03f 0300 3ffc 0080 fc01     .?....?....?....
c0deb3a1:	003f 0000 3ffc 0000 fc00 003e 0000 3c7c     ?....?....>...|<
c0deb3b1:	0000 3c00 003c 0000 3c3c 0000 3c00 0038     ...<<...<<...<8.
c0deb3c1:	0000 381c 0000 1c00 0038 0000 381c 0000     ...8....8....8..
c0deb3d1:	1c00 0038 0000 381c 0000 1c00 0038 0000     ..8....8....8...
c0deb3e1:	381c 0000 1c00 001c 0000 1c38 0000 3800     .8........8....8
c0deb3f1:	001c 0000 0e38 0000 7000 000f 0000 07f0     ....8....p......
c0deb401:	0000 e000 8003 0100 03c0 00c0 c003 f001     ................
c0deb411:	0f00 0080 00f8 001f 3f00 fc00 0000 ff1f     .........?......
c0deb421:	00f8 0700 e0ff 0000 ff00 0000               ............

c0deb42d <C_switch_60_40>:
c0deb42d:	003c 0028 0000 b301 c0de                    <.(.......

c0deb437 <C_Check_Circle_64px_bitmap>:
c0deb437:	0040 0040 3321 0002 0231 8b1f 0008 0000     @.@.!3..1.......
c0deb447:	0000 0302 55ad 4e39 3103 fd14 6124 4b5f     .....U9N.1..$a_K
c0deb457:	8028 a091 2401 b888 4640 2054 4121 3949     (....$..@FT !AI9
c0deb467:	152d 00dc a090 1166 05a2 0171 1710 0a48     -.....f...q...H.
c0deb477:	026a 6017 41ab 8961 2404 9f21 65ef be66     j..`.Aa..$!..ef.
c0deb487:	0e3d c48b 9914 9fb1 fcfd fcfc 8cf3 7ff8     =...............
c0deb497:	f54f 1a60 7460 d8a9 de00 fd04 95cc 681c     O.`.`t.........h
c0deb4a7:	87cd c9e8 bf14 0185 7952 ae0b 301b 8b40     ........Ry...0@.
c0deb4b7:	c4b5 9cae 7cb5 f88d e070 ef89 0371 137e     .....|..p...q.~.
c0deb4c7:	fd5d 4e7a 4f7d d6b4 9e38 8ea5 b8f9 4c79     ].zN}O..8.....yL
c0deb4d7:	34cd e15b da9e 7c13 18bc 1930 a38b 5b15     .4[....|..0....[
c0deb4e7:	b94d a901 5a89 34af d0fa fbd4 5d41 b0b9     M....Z.4....A]..
c0deb4f7:	0ab1 6830 71fb 5315 0056 6e9a fc6c 2fb3     ..0h.q.SV..nl../
c0deb507:	24e2 dd75 bf49 012f d486 1057 ac8e 0a5a     .$u.I./...W...Z.
c0deb517:	aa32 dc97 5d54 3947 803e c954 7a63 b709     2...T]G9>.T.cz..
c0deb527:	815a c734 7fa9 bc41 000b 6a27 db3a e292     Z.4...A...'j:...
c0deb537:	12ed 3f6f 8274 64b6 f810 4052 a01d de23     ..o?t..d..R@..#.
c0deb547:	2712 6220 73a5 9d0a cf04 db00 e588 5bd8     .' b.s.........[
c0deb557:	e08b 0a5d 027c a128 8093 ee56 ab15 0ca4     ..].|.(...V.....
c0deb567:	1953 0781 889d a1eb 493b 0082 11da c517     S.......;I......
c0deb577:	9b8f 4760 f54c 0b95 822e f14b 41ed 360f     ..`GL.....K..A.6
c0deb587:	b820 d215 48a4 c137 3093 c2c8 8139 e70b      ....H7..0..9...
c0deb597:	4e04 105c 30ac d4dc 08a7 9856 acbe 7c5d     .N\..0....V...]|
c0deb5a7:	5e31 0710 701c 347f 5aff 4fe8 36b3 adc9     1^...p.4.Z.O.6..
c0deb5b7:	802f c436 7653 d63e 3cfe 2d61 5f3f ba73     /.6.Sv>..<a-?_s.
c0deb5c7:	df3a acb2 d712 0ff4 1f59 2554 6ec3 5f7b     :.......Y.T%.n{_
c0deb5d7:	6554 3b01 e340 8e78 cad4 febe e91f 4c92     Te.;@.x........L
c0deb5e7:	f2b3 e8c9 ce32 92b3 a68c 3457 3971 702e     ....2.....W4q9.p
c0deb5f7:	b6aa 0f34 d91d e35f f2e1 639e a7d5 fd79     ..4..._....c..y.
c0deb607:	ba44 dde8 6369 1aef c3e5 3464 9dd2 272f     D...ic....d4../'
c0deb617:	cbbf 1fa7 8df3 b09c 9b03 5328 2325 8d5f     ..........(S%#_.
c0deb627:	3ec0 f233 eb15 7359 39c0 5158 f322 2c7d     .>3...Ys.9XQ".},
c0deb637:	f7cc 448d cbbe a6c0 e1fb f102 dd51 030f     ...D........Q...
c0deb647:	0898 fe6c ec64 ac2b 19ea f170 f7af 2d1b     ..l.d.+...p....-
c0deb657:	1fb1 b3c2 2e0d dad0 0cd6 c8c0 fe72 af1f     ............r...
c0deb667:	fc6c 2402 5a14 00c5 0008                     l..$.Z.....

c0deb672 <C_Check_Circle_64px>:
c0deb672:	0040 0040 0102 b437 c0de                    @.@...7...

c0deb67c <C_Denied_Circle_64px_bitmap>:
c0deb67c:	0040 0040 3021 0002 022e 8b1f 0008 0000     @.@.!0..........
c0deb68c:	0000 0302 55ad 2f4b 4104 2e10 bd6b 479f     .....UK/.A..k..G
c0deb69c:	d80e 4884 ac90 3f8d e260 2244 e8e1 71b8     ...H...?`.D"...q
c0deb6ac:	e273 201f ece1 7111 fe25 f100 d607 d9c1     s.. ...q%.......
c0deb6bc:	07f2 e63c d64c e363 a6b9 f554 a663 67a7     ..<.L.c...T.c..g
c0deb6cc:	9766 1f44 b676 babb beaa eafe 6aeb ffc4     f.D.v........j..
c0deb6dc:	5f1b 13fb 4300 c50b f304 a806 5331 b18a     ._...C......1S..
c0deb6ec:	1c56 47f0 58ba 0cd5 2a90 6658 642f 6806     V..G.X...*Xf/d.h
c0deb6fc:	52b4 08ec a5af c46b fdfb ff0c 0d1f df99     .R....k.........
c0deb70c:	a978 f947 bb78 5b3c ed35 5a39 0d98 47a6     x.G.x.<[5.9Z...G
c0deb71c:	ad34 3237 34b8 331f f3f7 6c86 8e00 3632     4.72.4.3...l..26
c0deb72c:	e185 09e6 3f8d a17b 07dd bc61 b41f a934     .....?{...a...4.
c0deb73c:	2b27 7d00 1f36 4157 4fc8 ba80 db1b ddfe     '+.}6.WA.O......
c0deb74c:	c7ed 7424 511d 2fbe fa01 bfe5 247c 42bb     ..$t.Q./....|$.B
c0deb75c:	9690 2555 e336 49ca 44a8 9e99 a3cd 831a     ..U%6..I.D......
c0deb76c:	e7d6 7bf8 7006 0f2c a96d a005 bf9d 668e     ...{.p,.m......f
c0deb77c:	5162 3ff3 bf2c 008e 01e0 8ab4 abe9 e34e     bQ.?,.........N.
c0deb78c:	32c2 c0aa e712 3ab8 aa46 d8a4 7896 009f     .2.....:F....x..
c0deb79c:	10b6 facb 1974 9385 90e8 df1b c005 8047     ....t.........G.
c0deb7ac:	1a12 9eeb c7de bb99 4b38 a82a d662 e770     ........8K*.b.p.
c0deb7bc:	6d88 6b88 3b3e 12c2 33b8 16a2 79c4 09fe     .m.k>;...3...y..
c0deb7cc:	1802 b8ee aecd 648e 0741 dc30 44a9 9cf5     .......dA.0..D..
c0deb7dc:	d3a4 91d4 8ee1 0cb7 804d 7434 1468 91e3     ........M.4th...
c0deb7ec:	3209 1ced 7020 bbff 2e3d 2d7e b97c 7c40     .2.. p..=.~-|.@|
c0deb7fc:	f9f6 b8ce f9c0 fc6a 2834 9292 6df8 3c46     ......j.4(...mF<
c0deb80c:	56a9 f69f f5da 0b2d 1895 aeeb 9abe 421f     .V....-........B
c0deb81c:	a41f 8192 7d78 4b3d 2965 4719 79f5 3328     ....x}=Ke).G.y(3
c0deb82c:	ea3b 451e 9df4 0691 b192 cdd5 fa4a 8b5a     ;..E........J.Z.
c0deb83c:	65c0 702d b86b bd6a 3762 9f17 151d 49d7     .e-pk.j.b7.....I
c0deb84c:	dfba d88a a4bb 90fe 77f5 f7c6 e397 f5df     .........w......
c0deb85c:	9aa7 8dfd a6af b0d5 4257 7442 86ed 1a7d     ........WBBt..}.
c0deb86c:	21d2 b97a 86f0 ee73 91cf 3efe f9a2 8f5f     .!z...s....>.._.
c0deb87c:	77f4 b0d1 7de9 40b8 907c 43ef 462f b61a     .w...}.@|..C/F..
c0deb88c:	d239 13f6 95f6 9909 7f8b df7d c528 369e     9.........}.(..6
c0deb89c:	274f a03c cd95 8029 a5c1 3fc2 d93e 03f8     O'<...)....?>...
c0deb8ac:	a770 8485 0800 0000                         p.......

c0deb8b4 <C_Denied_Circle_64px>:
c0deb8b4:	0040 0040 0102 b67c c0de                    @.@...|...

c0deb8be <C_Important_Circle_64px_bitmap>:
c0deb8be:	0040 0040 fa21 0001 01f8 8b1f 0008 0000     @.@.!...........
c0deb8ce:	0000 0302 55b5 4ecd 40c2 1e10 fea1 cfe3     .....U.N.@......
c0deb8de:	0f51 892a d45e 8904 602f 49e3 1313 7a3c     Q.*.^.../`.I..<z
c0deb8ee:	cae4 37cd 1350 a33d 70c6 f8d5 1802 005f     ...7P.=..p...._.
c0deb8fe:	9e0f 5f05 1fc0 1ace 4910 c054 b38e b6ed     ..._.....IT.....
c0deb90e:	db74 d059 e704 76d0 dbf6 7cee 76fd 2dfa     t.Y....v...|.v.-
c0deb91e:	ef62 99a2 055b d858 6a29 43e0 b190 6159     b...[.X.)j.C..Ya
c0deb92e:	96d0 5e09 c518 308e a440 8010 052d 1806     ...^...0@...-...
c0deb93e:	9408 b138 cadf 203c e4be e2e2 4979 3f81     ..8...< ....yI.?
c0deb94e:	d0c4 7c94 3ac7 d915 1f9e d24f 56c0 bd3b     ...|.:....O..V;.
c0deb95e:	34a4 abea a650 d97c 5f3f 484c c9b4 c551     .4..P.|.?_LH..Q.
c0deb96e:	9541 9a6e 78d8 3bd9 3ecd f957 d17e 9ad0     A.n..x.;.>W.~...
c0deb97e:	ec9b cc02 f504 6fb8 d92f e800 0c7b dfe2     .......o/...{...
c0deb98e:	de93 c49a 2c6e 77ac 6009 79d6 874a 4baa     ....n,.w.`.yJ..K
c0deb99e:	8606 abb3 26a4 9db7 cac4 a6de ff9a 7d53     .....&........S}
c0deb9ae:	e341 7129 01bf b3c8 02dd 1310 d377 84a7     A.)q........w...
c0deb9be:	a612 c04d 1802 71e1 d85a b9e1 e3c2 006f     ..M....qZ.....o.
c0deb9ce:	c459 fb3a 2275 6d3e 5582 0a80 538f 09e5     Y.:.u">m.U...S..
c0deb9de:	2551 eba2 38f7 228c f3ee 38ea 0ec2 6e23     Q%...8."...8..#n
c0deb9ee:	0b8b c71f 55e2 51d3 8b81 4412 9145 3b71     .....U.Q...DE.q;
c0deb9fe:	f769 20b6 159e 4f43 9a82 924d abc7 a042     i.. ..CO..M...B.
c0deba0e:	c6ff f1bb 724b e7cd a06e 4521 e9d2 2fd3     ....Kr..n.!E.../
c0deba1e:	d245 3be9 7884 69d5 627f f7dd 2eb7 b2c9     E..;.x.i.b......
c0deba2e:	407f eeca 3992 af1e 9d39 ba05 bc0d 2a70     .@...9..9.....p*
c0deba3e:	f29b 623f 19e8 8db2 1c0b 90dc d70b 0d35     ..?b..........5.
c0deba4e:	965e ade3 b9a0 ea78 75c8 dd4d 2dff 7d85     ^.....x..uM..-.}
c0deba5e:	f9d6 c243 c99b 4bfb 77fe d4fe dfd5 8948     ..C....K.w....H.
c0deba6e:	61a0 92d3 8a91 afe2 618a 2b5f 8afe 5256     .a.......a_+..VR
c0deba7e:	709d fc2b e439 8bef bfae 841f ddfc 6c36     .p+.9.........6l
c0deba8e:	1f3a 10ee 9d5f 61f3 431a ed86 230f 53d8     :..._..a.C...#.S
c0deba9e:	b8cd 1702 7aff 51be 3389 de17 f4d0 eb73     .....z.Q.3....s.
c0debaae:	1d68 3e60 e853 91e1 3f8d c10e e439 0800     h.`>S....?..9...
	...

c0debac0 <C_Important_Circle_64px>:
c0debac0:	0040 0040 0102 b8be c0de                    @.@.......

c0debaca <C_Warning_64px_bitmap>:
c0debaca:	0040 0040 5f21 0001 015d 8b1f 0008 0000     @.@.!_..].......
c0debada:	0000 0302 d585 4e31 40c3 0510 8dd0 0885     ......1N.@......
c0debaea:	454a 9149 25c2 52b2 08e4 4039 19c4 8272     JEI..%.R..9@..r.
c0debafa:	815c 0384 b880 c441 7205 0a04 e7d2 6908     \.....A..r.....i
c0debb0a:	a202 a50b a113 ec1d 5d99 f6b3 1fee fb6f     .........]....o.
c0debb1a:	96c6 febc 4333 4f84 27b9 5ced ebf2 c293     ....3C.O.'.\....
c0debb2a:	53bf 2663 cf0a 318c 9d23 5bb1 e866 5176     .Sc&...1#..[f.vQ
c0debb3a:	60e1 7d06 3f5d b8fc ce41 24bc cce4 4273     .`.}]?..A..$..sB
c0debb4a:	eafe f818 e79b efb4 966a 4b7b 7339 c841     ........j.{K9sA.
c0debb5a:	ef99 f908 e431 bfd8 1c5a 7979 f15b 9090     ....1...Z.yy[...
c0debb6a:	8733 6891 f33b 1855 96a9 239f f96e 8f25     3..h;.U....#n.%.
c0debb7a:	7438 4b8e c9d6 bfeb 6f0b 3809 e0f3 8085     8t.K.....o.8....
c0debb8a:	34db 977b c5b0 5dec 46c2 5dc8 90d8 9baf     .4{....].F.]....
c0debb9a:	94b8 9fc6 fa1b 4631 36dc 7d8c ba4e 3d17     ......1F.6.}N..=
c0debbaa:	bdae e25f c4bc 9f6e eff4 eb93 164b f784     .._...n.....K...
c0debbba:	2a9b fe68 5d4f 3d90 7743 5b05 7de8 70f9     .*h.O].=Cw.[.}.p
c0debbca:	ebf1 4416 ccf9 a1de 00bb a01f 39d3 b4ef     ...D.........9..
c0debbda:	b74f bebf fef5 ed72 141b fba4 787b 2e82     O.....r.....{x..
c0debbea:	f705 e9d8 1833 c93f f4f9 cfa1 9727 0297     ....3.?.....'...
c0debbfa:	14bb b04c c14b 7603 89f2 6e43 fa57 f77c     ..L.K..v..CnW.|.
c0debc0a:	db89 fbe8 4cc5 fd95 50b4 93f7 605f 6523     .....L...P.._`#e
c0debc1a:	e63f 73ba c6a0 fb3d f499 5e05 cbcd e43f     ?..s..=....^..?.
c0debc2a:	7b2a 0024 0008                               *{$....

c0debc31 <C_Warning_64px>:
c0debc31:	0040 0040 0102 baca c0de                    @.@.......

c0debc3b <C_Back_40px_bitmap>:
c0debc3b:	0028 0028 8c21 0000 008a 8b1f 0008 0000     (.(.!...........
c0debc4b:	0000 0302 d3ed 09cd 20c0 800c d0d1 0e53     ......... ....S.
c0debc5b:	a21d 39a3 364a 9570 d26e c46d c143 c7e6     ...9J6p.n.m.C...
c0debc6b:	a8d6 73d0 f50f e110 81e3 b010 9794 f843     ...s..........C.
c0debc7b:	efb7 c3b6 53b7 4667 28df dcca b621 6196     .....SgF.(..!..a
c0debc8b:	2b95 b601 0646 d04a 5b5b fa86 4192 376d     .+..F.J.[[...Am7
c0debc9b:	50ab c3da 942a 98d6 6e41 198e e6e4 4299     .P..*...An.....B
c0debcab:	8ec2 2429 99ec 6dc0 6181 0933 c4f8 5561     ..)$...m.a3...aU
c0debcbb:	6001 605a 199a 7c43 01fb 02e5 04e6 e43a     .`Z`..C|......:.
c0debccb:	0320 0000                                    ...

c0debccf <C_Back_40px>:
c0debccf:	0028 0028 0102 bc3b c0de                    (.(...;...

c0debcd9 <C_Check_40px_bitmap>:
c0debcd9:	0028 0028 5401 0000 0052 8b1f 0008 0000     (.(..T..R.......
c0debce9:	0000 0302 6063 05c0 4078 1c84 9088 1307     ....c`..x@......
c0debcf9:	400d ff82 9000 7f60 2400 3f98 0900 1fc6     .@....`..$.?....
c0debd09:	9920 203f 0ea2 d844 57e3 2608 602a b02c      .? ..D..W.&*`,.
c0debd19:	5818 ac16 ac0e ac03 1ed7 5e6e 5c0d 0183     .X........n^.\..
c0debd29:	0103 0000 8363 77dc 00c8 0000               ....c..w....

c0debd35 <C_Check_40px>:
c0debd35:	0028 0028 0100 bcd9 c0de                    (.(.......

c0debd3f <C_Chevron_40px_bitmap>:
c0debd3f:	0028 0028 5c22 0000 ffff ffff ffff ffff     (.(."\..........
c0debd4f:	1cda 03e4 0310 03e2 0330 03e0 0350 03de     ........0...P...
c0debd5f:	1820 0320 03dc 0820 08c1 0320 03da 0820      . ... ... ... .
c0debd6f:	08c3 0320 03d8 0820 08c5 0320 03d6 0820     .. ... ... ... .
c0debd7f:	08c7 0320 05d4 0820 08c9 0520 9ed3 8020     .. ... ... ... .
c0debd8f:	98cb e002 0ed4 cd09 0e09 ffff ffff ffff     ................
c0debd9f:	ffff e2ff                                   ....

c0debda3 <C_Chevron_40px>:
c0debda3:	0028 0028 0102 bd3f c0de                    (.(...?...

c0debdad <C_Chevron_Back_40px_bitmap>:
c0debdad:	0028 0028 7621 0000 0074 8b1f 0008 0000     (.(.!v..t.......
c0debdbd:	0000 0302 d2ed 0dc1 3080 0508 8e50 383d     .........0..P.=8
c0debdcd:	a3a4 41b0 7157 6e93 3863 d498 1042 eb7e     ...AWq.nc8..B.~.
c0debddd:	4606 340e bfe5 0b84 ffbd aa35 e7e1 2eb2     .F.4......5.....
c0debded:	6705 b55c 541f 2473 e9b4 1273 7640 27b0     .g\..Ts$..s.@v.'
c0debdfd:	2794 c807 0711 4c94 3203 73ac b828 21cd     .'.....L.2.s(..!
c0debe0d:	8732 7313 3338 0b83 b833 8532 532b 62f8     2..s83..3.2.+S.b
c0debe1d:	9603 1dcf 0dc6 8ef2 7343 0320 0000          ........Cs ...

c0debe2b <C_Chevron_Back_40px>:
c0debe2b:	0028 0028 0102 bdad c0de                    (.(.......

c0debe35 <C_Chevron_Next_40px_bitmap>:
c0debe35:	0028 0028 7121 0000 006f 8b1f 0008 0000     (.(.!q..o.......
c0debe45:	0000 0302 ceed 0dbb 3080 450c 5751 0a51     .........0.EQWQ.
c0debe55:	cc86 ac06 0d90 0918 42a6 1448 c48f 8e44     .........BH...D.
c0debe65:	1b3f 6e20 74f9 1964 58f8 8735 22e9 02da     ?. n.td..X5.."..
c0debe75:	ca23 a581 61e2 f5a5 b074 c031 c6c1 0b00     #....a..t.1.....
c0debe85:	3999 ccc8 c1c2 1c0c 434c 0a61 9b0a 3150     .9......LCa...P1
c0debe95:	c781 1d64 ec2e fe92 bcbe 7707 ddbd ebf8     ..d........w....
c0debea5:	383d be09 209b 0003                          =8... ...

c0debeae <C_Chevron_Next_40px>:
c0debeae:	0028 0028 0102 be35 c0de                    (.(...5...

c0debeb8 <C_Close_40px_bitmap>:
c0debeb8:	0028 0028 8521 0000 0083 8b1f 0008 0000     (.(.!...........
c0debec8:	0000 0302 fffb c07f bfc0 08f9 cff6 10f7     ................
c0debed8:	11fa 4207 41ac 420f 604f 87e8 fd09 e060     ...B.A.BO`....`.
c0debee8:	3184 0ae0 e01b 70d2 9216 9c2c 5089 6706     .1.....p..,..P.g
c0debef8:	2923 7383 9590 7941 ca28 5ca0 6554 3e60     #).s..Ay(..\Te`>
c0debf08:	329a 42b0 6574 8520 cae8 0a40 9431 1561     .2.Bte ...@.1.a.
c0debf18:	a2c3 9b17 581d 82dc cdcd fc58 2d86 b00c     .....X....X..-..
c0debf28:	1584 30b6 12c5 d8f6 08e2 5c5b 8b62 6c73     ...0......[\b.sl
c0debf38:	6369 0040 b400 b40b 2014 0003                ic@...... ...

c0debf45 <C_Close_40px>:
c0debf45:	0028 0028 0102 beb8 c0de                    (.(.......

c0debf4f <C_Info_40px_bitmap>:
c0debf4f:	0028 0028 3121 0000 002f 8b1f 0008 0000     (.(.!1../.......
c0debf5f:	0000 0302 fffb 147f 0bd0 f030 67ff 0180     ..........0..g..
c0debf6f:	2a7e 7189 5a60 80d3 ec45 cf57 f068 0593     ~*.q`Z..E.W.h...
c0debf7f:	d900 c99e 2019 0003                          ..... ...

c0debf88 <C_Info_40px>:
c0debf88:	0028 0028 0102 bf4f c0de                    (.(...O...

c0debf92 <C_Mini_Push_40px_bitmap>:
c0debf92:	0028 0028 ce21 0000 00cc 8b1f 0008 0000     (.(.!...........
c0debfa2:	0000 0302 936d 0dcd 30c2 460c 2123 4ea4     ....m....0.F#!.N
c0debfb2:	ba83 2b01 5230 6037 4604 0762 b006 5c0f     ...+0R7`.Fb....\
c0debfc2:	4240 4936 2f9c f6bf c9a5 b3d3 3913 aaae     @B6I./.......9..
c0debfd2:	1085 0eb1 4911 1e0a 7710 829f 6ab0 5a90     .....I...w...j.Z
c0debfe2:	9606 3ac2 08a7 a7f5 a2d1 4761 b5e3 d168     ...:......aG..h.
c0debff2:	2f6c 053a a92f f019 a4cc fb95 6b3d cac1     l/:./.......=k..
c0dec002:	53f6 6563 0ef5 8ae1 c043 10f6 3220 db41     .Sce....C... 2A.
c0dec012:	880e d044 1fee 8588 4d45 6215 5161 8553     ..D.....EM.baQS.
c0dec022:	2c68 556b 7634 5a4b cf12 e599 bcbb ab36     h,kU4vKZ......6.
c0dec032:	5c7e fdda 61e4 cbec d6c6 b81e ebcc db95     ~\...a..........
c0dec042:	af53 def7 791b e96f f9be 9628 eac9 b147     S....yo...(...G.
c0dec052:	3926 e6b3 a4ce bb37 8cee ff4f 1fc2 8764     &9....7...O...d.
c0dec062:	9d98 0320 0000                              .. ...

c0dec068 <C_Mini_Push_40px>:
c0dec068:	0028 0028 0102 bf92 c0de                    (.(.......

c0dec072 <C_Privacy_40px_bitmap>:
c0dec072:	0028 0028 ac21 0001 01aa 8b1f 0008 0000     (.(.!...........
c0dec082:	0000 0302 927d 4bbf 50c3 c710 e9af 8b4f     ....}..K.P....O.
c0dec092:	1768 0741 b335 fe88 6609 1d28 2c44 1fe2     h.A.5....f(.D,..
c0dec0a2:	2ea0 cdd2 2e0a 6082 a45c b4b8 0ff8 4418     .......`\......D
c0dec0b2:	1c50 b3b4 dd28 60a5 8777 38a2 10e9 b56b     P...(..`w..8..k.
c0dec0c2:	dac6 bce6 97bb 2da6 378a 25e4 f79f f7de     .......-.7.%....
c0dec0d2:	77be c439 a3bf ba75 ca9e f75c 26a1 8448     .w9...u...\..&H.
c0dec0e2:	7a2e 23d8 b178 1f40 5e4e 6ad8 7320 7b7e     .z.#x.@.N^.j s~{
c0dec0f2:	4cb6 1a70 8cd1 7231 2e21 cf5b 8c06 03a3     .Lp...1r!.[.....
c0dec102:	1ac2 a730 dc34 2ab5 4166 beee c941 6e97     ..0.4..*fA..A..n
c0dec112:	63a8 6968 74dd d859 d595 fb88 81c8 5288     .chi.tY........R
c0dec122:	2181 90c9 a1bb 74a4 16cc 69c7 9e7a 9390     .!.....t...iz...
c0dec132:	4e29 1eda d913 c423 f127 53ac 07d2 22a8     )N....#.'..S..."
c0dec142:	e1d6 5d0e 461d 4b72 49c0 30eb f88b 880a     ...].FrK.I.0....
c0dec152:	10ef 6125 8d93 09ba a8da c904 5c0e 328a     ..%a.........\.2
c0dec162:	283b 1004 218b 5d44 cd39 2bd2 c9dd 15a3     ;(...!D]9..+....
c0dec172:	36c1 084c 01ab 6919 24c1 e237 561b 7d84     .6L....i.$7..V.}
c0dec182:	8488 c031 51cc 7b85 216b 9bf4 c259 fe9a     ..1..Q.{k!..Y...
c0dec192:	92dd 9faa b872 cb24 3521 a8b4 62fe b698     ....r.$.!5...b..
c0dec1a2:	c2a2 4d4c 6cbc 4560 f7eb 916c 5521 cc5b     ..LM.l`E..l.!U[.
c0dec1b2:	86e6 8752 3d5c adc2 7bf7 d9a0 a6dc be99     ..R.\=...{......
c0dec1c2:	2d5e 26b2 a8cb 1e9e 9a13 8b17 3a52 f30c     ^-.&........R:..
c0dec1d2:	3ef3 a327 ca61 ae09 8fcf 084f 5aca f908     .>'.a.....O..Z..
c0dec1e2:	35c8 ffbc a35f 5ec4 41ec f3b8 d353 3a1e     .5.._..^.A..S..:
c0dec1f2:	f604 9120 5418 b993 8329 5e85 db99 f2e5     .. ..T..)..^....
c0dec202:	56d5 6002 57d4 75ae b266 f08b 114b a76d     .V.`.W.uf...K.m.
c0dec212:	a077 f65f c993 81d4 ff8d 0fc5 af18 4ccb     w._............L
c0dec222:	0320 0000                                    ...

c0dec226 <C_Privacy_40px>:
c0dec226:	0028 0028 0102 c072 c0de                    (.(...r...

c0dec230 <C_QRCode_40px_bitmap>:
c0dec230:	0028 0028 9921 0000 0097 8b1f 0008 0000     (.(.!...........
c0dec240:	0000 0302 fffb da9f 11e0 0803 bd30 00ff     ............0...
c0dec250:	fea2 607f 8900 8029 18c5 91f4 20c5 0c42     ...`..)...... B.
c0dec260:	28fc fc62 1230 c2c2 f62d a3a7 4307 07ec     .(b.0...-....C..
c0dec270:	0703 ff84 6101 b11e 1062 c0f3 903c 9073     .....a..b...<.s.
c0dec280:	25ec 8628 07f0 cc3f 4839 85fe 218b 0b85     .%(...?.9H...!..
c0dec290:	923f 49b3 d30a 107f f583 ed90 04f8 99a1     ?..I............
c0dec2a0:	c230 9b14 d19b 19c2 0c55 061e 3a27 a3ce     0.......U...':..
c0dec2b0:	1586 d790 d0c0 aa4f 3618 88f3 0b74 7f16     ......O..6..t...
c0dec2c0:	f360 b62f a170 002e 5b00 1eb2 20fb 0003     `./.p....[... ..
	...

c0dec2d1 <C_QRCode_40px>:
c0dec2d1:	0028 0028 0102 c230 c0de                    (.(...0...

c0dec2db <C_Settings_40px_bitmap>:
c0dec2db:	0028 0028 9321 0001 0191 8b1f 0008 0000     (.(.!...........
c0dec2eb:	0000 0302 5275 52b1 40c2 7d10 88c9 9841     ....uR.R.@.}..A.
c0dec2fb:	8c91 8e56 10ce 5e87 3e46 ec40 93b0 4e8e     ..V....^F>@....N
c0dec30b:	03fd 4053 850d 1695 9d62 4a42 b03b 8a93     ..S@....b.BJ;...
c0dec31b:	0bf1 04fc 1c1c 40eb a202 3920 2f77 1738     .......@.. 9w/8.
c0dec32b:	d818 6f62 e5ef eef2 bbed 6215 8c7d ad4d     ..bo.......b}.M.
c0dec33b:	8cba 81d5 25ad 8028 6b61 45dd 87ac 8fac     .....%(.ak.E....
c0dec34b:	daac 764f 4e0b 7751 3303 aed6 761c ac42     ..Ov.NQw.3...vB.
c0dec35b:	8a01 1084 f9ad 314a 12e5 74f7 2cb5 8c9a     ......J1...t.,..
c0dec36b:	300d 976b 5c73 4ae5 8b8e 5734 5c1e 3dc5     .0k.s\.J..4W.\.=
c0dec37b:	9e43 1197 0a3a e29b 765c 4780 fd85 1aa0     C...:...\v.G....
c0dec38b:	9e59 5cee 6075 4b8a 57ca 26c0 c381 6890     Y..\u`.K.W.&...h
c0dec39b:	fac4 2c7b 48e3 1f08 7c17 4593 0557 0a16     ..{,.H...|.EW...
c0dec3ab:	d037 8459 a74e 601f f108 0385 9e21 2d71     7.Y.N..`....!.q-
c0dec3bb:	8d44 19ec 2343 7786 f9a6 8a45 b79a 1d50     D...C#.w..E...P.
c0dec3cb:	84e0 5a08 cc1b 9a7c 0e90 fba5 ef06 716a     ...Z..|.......jq
c0dec3db:	76ce 5398 2c73 25fa 6035 a205 fe11 a49b     .v.Ss,.%5`......
c0dec3eb:	81f4 18f4 b93a c7d3 8b1b a6df 5264 755b     ....:.......dR[u
c0dec3fb:	59c4 becb af10 c5ac 9ec6 b960 87d4 b385     .Y........`.....
c0dec40b:	cb32 a1f5 4bf3 b27d ff65 79bd f9b2 b2d0     2....K}.e..y....
c0dec41b:	3d80 6650 5e86 2f05 11b7 5733 3a79 f45c     .=Pf.^./..3Wy:\.
c0dec42b:	f25e e8f9 6746 1b24 65be aed0 b864 14ca     ^...Fg$..e..d...
c0dec43b:	6e9c 96f8 f913 44d4 2df3 8e8b 8d9a 9aa4     .n.....D.-......
c0dec44b:	c911 53bb 8a72 1b9a b158 f976 a9b8 3db8     ...Sr...X.v....=
c0dec45b:	3de4 50e9 6624 61a6 6747 dd64 aeec f19c     .=.P$f.aGgd.....
c0dec46b:	fc68 4701 f51a 207f 0003                     h..G... ...

c0dec476 <C_Settings_40px>:
c0dec476:	0028 0028 0102 c2db c0de                    (.(.......

c0dec480 <C_Warning_40px_bitmap>:
c0dec480:	0028 0028 e721 0000 00e5 8b1f 0008 0000     (.(.!...........
c0dec490:	0000 0302 d36d 0db1 40c2 850c 47e1 2284     ....m....@...G."
c0dec4a0:	283a d511 88d5 1182 0032 8662 904c 0815     :(......2.b.L...
c0dec4b0:	3013 2c03 0ec0 9e88 1025 526d 8450 9d10     .0.,....%.mRP...
c0dec4c0:	73b9 8842 b87d aafc 675f 911f 4b1c 34c1     .sB.}..._g...K.4
c0dec4d0:	0b26 c128 5b44 c08a c0f6 d95a d811 d2e6     &.(.D[....Z.....
c0dec4e0:	c0ae a486 81dd 4905 80ab 4939 66ab 4988     .......I..9I.f.I
c0dec4f0:	635a be30 7349 11ad c0d3 8c52 240e b5cd     Zc0.Is....R..$..
c0dec500:	d476 6f9b 6925 2adc 6dad d615 0eb5 c5ed     v..o%i.*.m......
c0dec510:	25ad 4cfc b04b b93d b035 db42 20db 942e     .%.LK.=.5.B.. ..
c0dec520:	43d1 773e e2db a970 2e8d 4ac0 9d1b 4c80     .C>w..p....J...L
c0dec530:	e51b ec3f a6cd ce88 c8ca 5f26 bc1c 6d7d     ..?.......&_..}m
c0dec540:	5db8 a8ee 76e6 cbb5 5dae bcee 576d c1b7     .]...v...]..mW..
c0dec550:	caed 5db8 6f9b da37 9fec f49b 81ed ccb9     ...].o7.........
c0dec560:	785d fef8 7c2f 1300 b8d8 2006 0003           ]x../|..... ...

c0dec56f <C_Warning_40px>:
c0dec56f:	0028 0028 0102 c480 c0de 7544 6d6d 2079     (.(.......Dummy 
c0dec57f:	0032 6552 6976 7765 7420 6172 736e 6361     2.Review transac
c0dec58f:	6974 6e6f 740a 206f 6573 646e 4220 4c4f     tion.to send BOL
c0dec59f:	4f00 6570 6172 6974 6e6f 7320 6769 656e     .Operation signe
c0dec5af:	0064 6441 7264 7365 2073 6576 6972 6966     d.Address verifi
c0dec5bf:	6163 6974 6e6f 630a 6e61 6563 6c6c 6465     cation.cancelled
c0dec5cf:	5400 6172 736e 6361 6974 6e6f 4320 6568     .Transaction Che
c0dec5df:	6b63 7520 616e 6176 6c69 6261 656c 4100     ck unavailable.A
c0dec5ef:	7070 6f72 6576 4200 696c 646e 732d 6769     pprove.Blind-sig
c0dec5ff:	006e 2e30 2e30 0031 6f48 646c 7420 206f     n.0.0.1.Hold to 
c0dec60f:	6973 6e67 4f00 6570 6172 6974 6e6f 7220     sign.Operation r
c0dec61f:	6a65 6365 6574 0064 6552 656a 7463 4900     ejected.Reject.I
c0dec62f:	2066 6f79 2775 6572 6e20 746f 7520 6973     f you're not usi
c0dec63f:	676e 7420 6568 4c20 6465 6567 2072 6157     ng the Ledger Wa
c0dec64f:	6c6c 7465 6120 7070 202c 7254 6e61 6173     llet app, Transa
c0dec65f:	7463 6f69 206e 6843 6365 206b 696d 6867     ction Check migh
c0dec66f:	2074 6f6e 2074 6f77 6b72 202e 6649 7920     t not work. If y
c0dec67f:	756f 6120 6572 7520 6973 676e 4c20 6465     ou are using Led
c0dec68f:	6567 2072 6157 6c6c 7465 202c 6572 656a     ger Wallet, reje
c0dec69f:	7463 7420 6568 7420 6172 736e 6361 6974     ct the transacti
c0dec6af:	6e6f 6120 646e 7420 7972 6120 6167 6e69     on and try again
c0dec6bf:	0a2e 470a 7465 6820 6c65 2070 7461 6c20     ...Get help at l
c0dec6cf:	6465 6567 2e72 6f63 2f6d 3165 0031 6552     edger.com/e11.Re
c0dec6df:	656a 7463 7420 6172 736e 6361 6974 6e6f     ject transaction
c0dec6ef:	003f 7243 7469 6369 6c61 7420 7268 6165     ?.Critical threa
c0dec6ff:	2074 6564 6574 7463 6465 0a2e 6c42 6e69     t detected..Blin
c0dec70f:	2064 6973 6e67 6e69 2067 6572 7571 7269     d signing requir
c0dec71f:	6465 002e 6e55 6469 6e65 6974 6966 6465     ed..Unidentified
c0dec72f:	7220 7369 006b 6853 776f 6120 2073 5251      risk.Show as QR
c0dec73f:	4100 6f6d 6e75 0074 6f47 6220 6361 206b     .Amount.Go back 
c0dec74f:	6f74 6f20 6570 6172 6974 6e6f 5400 6172     to operation.Tra
c0dec75f:	736e 6361 6974 6e6f 4320 6568 6b63 7520     nsaction Check u
c0dec76f:	616e 6176 6c69 6261 656c 0a2e 6c42 6e69     navailable..Blin
c0dec77f:	2064 6973 6e67 6e69 2067 6572 7571 7269     d signing requir
c0dec78f:	6465 002e 6441 7264 7365 2073 6576 6972     ed..Address veri
c0dec79f:	6966 6465 5300 6977 6570 7420 206f 6f63     fied.Swipe to co
c0dec7af:	746e 6e69 6575 2500 2073 7325 250a 0073     ntinue.%s %s.%s.
c0dec7bf:	7468 7074 3a73 2f2f 7325 4100 6572 7920     https://%s.Are y
c0dec7cf:	756f 7320 7275 2065 6f74 610a 6c6c 776f     ou sure to.allow
c0dec7df:	6420 6d75 796d 3220 690a 206e 7274 6e61      dummy 2.in tran
c0dec7ef:	6173 7463 6f69 736e 003f 7254 6e61 6173     sactions?.Transa
c0dec7ff:	7463 6f69 206e 6973 6e67 6465 4500 534e     ction signed.ENS
c0dec80f:	6e20 6d61 7365 6120 6572 7220 7365 6c6f      names are resol
c0dec81f:	6576 2064 7962 4c20 6465 6567 2072 6162     ved by Ledger ba
c0dec82f:	6b63 6e65 2e64 5300 6365 7275 7469 2079     ckend..Security 
c0dec83f:	6572 6f70 7472 4400 7665 6c65 706f 7265     report.Developer
c0dec84f:	2500 0a73 7325 2520 0073 6c41 6f6c 2077     .%s.%s %s.Allow 
c0dec85f:	7564 6d6d 2079 0a31 6e69 7420 6172 736e     dummy 1.in trans
c0dec86f:	6361 6974 6e6f 0073 6953 6e67 7420 6172     actions.Sign tra
c0dec87f:	736e 6361 6974 6e6f 740a 206f 6573 646e     nsaction.to send
c0dec88f:	4220 4c4f 5900 7365 202c 6b73 7069 2500      BOL.Yes, skip.%
c0dec89f:	2073 6572 6f70 7472 4700 206f 6162 6b63     s report.Go back
c0dec8af:	7420 206f 7274 6e61 6173 7463 6f69 006e      to transaction.
c0dec8bf:	6953 6e67 6d20 7365 6173 6567 4200 6361     Sign message.Bac
c0dec8cf:	206b 6f74 7320 6661 7465 0079 654d 7373     k to safety.Mess
c0dec8df:	6761 2065 6973 6e67 6465 4300 6f6c 6573     age signed.Close
c0dec8ef:	5300 6769 206e 7274 6e61 6173 7463 6f69     .Sign transactio
c0dec8ff:	006e 654c 6764 7265 5300 6163 206e 6f74     n.Ledger.Scan to
c0dec90f:	7620 6569 2077 7566 6c6c 7220 7065 726f      view full repor
c0dec91f:	0074 6854 7369 7420 6172 736e 6361 6974     t.This transacti
c0dec92f:	6e6f 6f20 2072 656d 7373 6761 2065 6163     on or message ca
c0dec93f:	6e6e 746f 6220 2065 6564 6f63 6564 2064     nnot be decoded 
c0dec94f:	7566 6c6c 2e79 4920 2066 6f79 2075 6863     fully. If you ch
c0dec95f:	6f6f 6573 7420 206f 6973 6e67 202c 6f79     oose to sign, yo
c0dec96f:	2075 6f63 6c75 2064 6562 6120 7475 6f68     u could be autho
c0dec97f:	6972 697a 676e 6d20 6c61 6369 6f69 7375     rizing malicious
c0dec98f:	6120 7463 6f69 736e 7420 6168 2074 6163      actions that ca
c0dec99f:	206e 7264 6961 206e 6f79 7275 7720 6c61     n drain your wal
c0dec9af:	656c 2e74 0a0a 654c 7261 206e 6f6d 6572     let...Learn more
c0dec9bf:	203a 656c 6764 7265 632e 6d6f 652f 0038     : ledger.com/e8.
c0dec9cf:	6341 6563 7470 7420 7268 6165 2074 6e61     Accept threat an
c0dec9df:	2064 6f63 746e 6e69 6575 4100 6c6c 776f     d continue.Allow
c0dec9ef:	6420 6d75 796d 3220 690a 206e 7274 6e61      dummy 2.in tran
c0dec9ff:	6173 7463 6f69 736e 5600 7265 6973 6e6f     sactions.Version
c0deca0f:	4d00 726f 0065 6854 7369 7420 6172 736e     .More.This trans
c0deca1f:	6361 6974 6e6f 6320 6e61 6f6e 2074 6562     action cannot be
c0deca2f:	4320 656c 7261 5320 6769 656e 0064 6559      Clear Signed.Ye
c0deca3f:	2c73 7220 6a65 6365 0074 6143 636e 6c65     s, reject.Cancel
c0deca4f:	5400 6968 2073 7274 6e61 6173 7463 6f69     .This transactio
c0deca5f:	206e 6177 2073 6373 6e61 656e 2064 7361     n was scanned as
c0deca6f:	6d20 6c61 6369 6f69 7375 6220 2079 6557      malicious by We
c0deca7f:	3362 4320 6568 6b63 2e73 2500 2064 666f     b3 Checks..%d of
c0deca8f:	2520 0064 6b53 7069 7220 7665 6569 3f77      %d.Skip review?
c0deca9f:	4200 696c 646e 7320 6769 696e 676e 7220     .Blind signing r
c0decaaf:	7165 6975 6572 0064 755b 6b6e 6f6e 6e77     equired.[unknown
c0decabf:	005d 6952 6b73 6420 7465 6365 6574 0064     ].Risk detected.
c0decacf:	6c42 6e69 2064 6973 6e67 6e69 2067 6572     Blind signing re
c0decadf:	7571 7269 6465 002e 6e55 6469 6e65 6974     quired..Unidenti
c0decaef:	6966 6465 7420 7268 6165 0074 7243 7469     fied threat.Crit
c0decaff:	6369 6c61 7420 7268 6165 0074 6341 6563     ical threat.Acce
c0decb0f:	7470 7220 7369 206b 6e61 2064 6f63 746e     pt risk and cont
c0decb1f:	6e69 6575 5400 6968 2073 7274 6e61 6173     inue.This transa
c0decb2f:	7463 6f69 276e 2073 6564 6174 6c69 2073     ction's details 
c0decb3f:	7261 2065 6f6e 2074 7566 6c6c 2079 6576     are not fully ve
c0decb4f:	6972 6966 6261 656c 202e 6649 7920 756f     rifiable. If you
c0decb5f:	7320 6769 2c6e 7920 756f 6320 756f 646c      sign, you could
c0decb6f:	6c20 736f 2065 6c61 206c 6f79 7275 6120      lose all your a
c0decb7f:	7373 7465 2e73 4700 206f 6162 6b63 7420     ssets..Go back t
c0decb8f:	206f 656d 7373 6761 0065 6f50 6574 746e     o message.Potent
c0decb9f:	6169 206c 6972 6b73 6420 7465 6365 6574     ial risk detecte
c0decbaf:	2e64 420a 696c 646e 7320 6769 696e 676e     d..Blind signing
c0decbbf:	7220 7165 6975 6572 2e64 5400 6968 2073      required..This 
c0decbcf:	6361 6f63 6e75 2074 616c 6562 206c 6f63     account label co
c0decbdf:	656d 2073 7266 6d6f 7920 756f 2072 6441     mes from your Ad
c0decbef:	7264 7365 2073 6f42 6b6f 6920 206e 654c     dress Book in Le
c0decbff:	6764 7265 5720 6c61 656c 2e74 4e00 206f     dger Wallet..No 
c0decc0f:	6874 6572 7461 6420 7465 6365 6574 2064     threat detected 
c0decc1f:	7962 5420 6172 736e 6361 6974 6e6f 4320     by Transaction C
c0decc2f:	6568 6b63 002e 6c42 6e69 2064 6973 6e67     heck..Blind sign
c0decc3f:	6e69 2067 6861 6165 0064 654d 7373 6761     ing ahead.Messag
c0decc4f:	2065 6572 656a 7463 6465 5200 6a65 6365     e rejected.Rejec
c0decc5f:	2074 706f 7265 7461 6f69 3f6e 3000 3231     t operation?.012
c0decc6f:	3433 3635 3837 4139 4342 4544 0046 656e     3456789ABCDEF.ne
c0decc7f:	7774 726f 2e6b 4200 4c4f 2520 2a2e 0073     twork..BOL %.*s.
c0decc8f:	6441 7264 7365 0073 6649 7920 756f 7227     Address.If you'r
c0decc9f:	2065 7573 6572 7920 756f 6420 6e6f 7427     e sure you don't
c0deccaf:	6e20 6565 2064 6f74 7220 7665 6569 2077      need to review 
c0deccbf:	6c61 206c 6966 6c65 7364 202c 6f79 2075     all fields, you 
c0decccf:	6163 206e 6b73 7069 7320 7274 6961 6867     can skip straigh
c0deccdf:	2074 6f74 7320 6769 696e 676e 002e 6854     t to signing..Th
c0deccef:	7369 7420 6172 736e 6361 6974 6e6f 7720     is transaction w
c0deccff:	7361 7320 6163 6e6e 6465 6120 2073 6972     as scanned as ri
c0decd0f:	6b73 2079 7962 5720 6265 2033 6843 6365     sky by Web3 Chec
c0decd1f:	736b 002e 7544 6d6d 2079 0031 2049 6e75     ks..Dummy 1.I un
c0decd2f:	6564 7372 6174 646e 202c 6f63 666e 7269     derstand, confir
c0decd3f:	006d 6f4e 7420 7268 6165 2074 6564 6574     m.No threat dete
c0decd4f:	7463 6465 5400 6172 736e 6361 6974 6e6f     cted.Transaction
c0decd5f:	7220 6a65 6365 6574 0064 6f47 6220 6361      rejected.Go bac
c0decd6f:	206b 6f74 7220 7665 6569 0077 7243 7469     k to review.Crit
c0decd7f:	6369 6c61 7420 7268 6165 2074 6564 6574     ical threat dete
c0decd8f:	7463 6465 002e 6953 6e67 6f20 6570 6172     cted..Sign opera
c0decd9f:	6974 6e6f 4d00 444c 4153 5445 0048 6544     tion.MLDSAETH.De
c0decdaf:	6574 7463 6465 6220 2079 7325 0000 6b53     tected by %s..Sk
c0decdbf:	7069 5000 746f 6e65 6974 6c61 7220 7369     ip.Potential ris
c0decdcf:	206b 6564 6574 7463 6465 002e 6f4e 7420     k detected..No t
c0decddf:	7268 6165 2074 6564 6574 7463 6465 6220     hreat detected b
c0decdef:	2079 7254 6e61 6173 7463 6f69 206e 6843     y Transaction Ch
c0decdff:	6365 206b 7562 2074 6c62 6e69 2064 6973     eck but blind si
c0dece0f:	6e67 6e69 2067 6572 7571 7269 6465 002e     gning required..
c0dece1f:	6f50 6574 746e 6169 206c 6972 6b73 5600     Potential risk.V
c0dece2f:	7265 6669 2079 4f42 204c 6461 7264 7365     erify BOL addres
c0dece3f:	0073 6f43 746e 6e69 6575 6120 796e 6177     s.Continue anywa
c0dece4f:	0079 7551 7469 6120 7070 5300 6977 6570     y.Quit app.Swipe
c0dece5f:	7420 206f 6572 6976 7765 5400 6968 2073      to review.This 
c0dece6f:	7061 2070 6e65 6261 656c 2073 6973 6e67     app enables sign
c0dece7f:	6e69 0a67 7274 6e61 6173 7463 6f69 736e     ing.transactions
c0dece8f:	6f20 206e 6874 0065 7254 6e61 6173 7463      on the.Transact
c0dece9f:	6f69 206e 6843 6365 206b 6964 6e64 7427     ion Check didn't
c0deceaf:	6620 6e69 2064 6e61 2079 6874 6572 7461      find any threat
c0decebf:	202c 7562 2074 6c61 6177 7379 7220 7665     , but always rev
c0dececf:	6569 2077 7274 6e61 6173 7463 6f69 206e     iew transaction 
c0decedf:	6564 6174 6c69 2073 6163 6572 7566 6c6c     details carefull
c0deceef:	2e79 4300 6e6f 6966 6d72 5200 6a65 6365     y..Confirm.Rejec
c0deceff:	2074 656d 7373 6761 3f65 4900 2066 6f79     t message?.If yo
c0decf0f:	2075 6973 6e67 7420 6968 2073 7274 6e61     u sign this tran
c0decf1f:	6173 7463 6f69 2c6e 7920 756f 6320 756f     saction, you cou
c0decf2f:	646c 6c20 6f6f 6573 6120 6c6c 7920 756f     ld loose all you
c0decf3f:	2072 7361 6573 7374 202e 7845 6c70 726f     r assets. Explor
c0decf4f:	2065 6173 6566 2072 6c61 6574 6e72 7461     e safer alternat
c0decf5f:	7669 7365 203a 656c 6764 7265 632e 6d6f     ives: ledger.com
c0decf6f:	692f 746e 6765 6172 6574 2d64 7061 7370     /integrated-apps
	...

c0decf80 <handler_cmd_verify_dilithium.sig>:
c0decf80:	6193 b128 b2a6 c9f2 9a4b 7ee4 4896 d274     .a(.....K..~.Ht.
c0decf90:	9592 59da 1be5 29ef 8b95 55f8 26d9 af6d     ...Y...)...U.&m.
c0decfa0:	2425 e843 c1a1 f5cd badc 27aa a1db bf64     %$C........'..d.
c0decfb0:	6d79 a5ac 1d33 009a 18e5 4002 3ecb b67a     ym..3......@.>z.
c0decfc0:	2569 3e5c 2fe1 81dd 868f a3fd 6914 e0e8     i%\>./.......i..
c0decfd0:	df2d 0573 dc39 ddd3 1fc5 6442 1648 ef86     -.s.9.....BdH...
c0decfe0:	f283 c300 077b 1f7b 4610 28ed 694b 6818     ....{.{..F.(Ki.h
c0decff0:	c39e 454e ea20 db7d 4315 fe5c b291 a47f     ..NE .}..C\.....
c0ded000:	fb91 5e8f 2c01 3a19 364f fedd 4558 a9db     ...^.,.:O6..XE..
c0ded010:	3f4b dd84 e2da ea56 2d53 0e29 5d8f 3823     K?....V.S-)..]#8
c0ded020:	e6a8 371c 0f4f 90aa 4fe6 cca9 7d0a b976     ...7O....O...}v.
c0ded030:	ed6c 46be 2679 7d6b 7d53 07e3 2b95 e42c     l..Fy&k}S}...+,.
c0ded040:	7061 60cf ab4c 2add 2046 af90 2803 32dd     ap.`L..*F ...(.2
c0ded050:	f998 f506 5bc4 0a97 961f f2d7 bbc5 5aa0     .....[.........Z
c0ded060:	d546 d49d f992 5905 749b e49b 7a8b 6fbd     F......Y.t...z.o
c0ded070:	34cc bae3 74ac 7391 4ff7 1a93 59d8 5b23     .4...t.s.O...Y#[
c0ded080:	4e01 bc5f 5030 3d13 8cfb 8486 ee78 5116     .N_.0P.=....x..Q
c0ded090:	55f2 1291 fc05 eead 5f18 3653 6f1d e98b     .U......._S6.o..
c0ded0a0:	31ae cf90 313d 252e 8d8f 6235 b8e3 cb93     .1..=1.%..5b....
c0ded0b0:	19f9 48e4 69e7 f329 85c7 3a96 57b0 002f     ...H.i)....:.W/.
c0ded0c0:	e050 f38b ab81 1c21 cb78 43ec 811a b1e6     P.....!.x..C....
c0ded0d0:	9f07 07ca f452 6d94 1448 e297 3f00 9507     ....R..mH....?..
c0ded0e0:	1a47 98f9 2cb0 f817 d14f 5d5f 9873 aa15     G....,..O._]s...
c0ded0f0:	5dfb ae6d 3b65 c833 835b 2ca8 98b5 7906     .]m.e;3.[..,...y
c0ded100:	b571 b358 12bb 5f9b b015 4180 e145 2b65     q.X...._...AE.e+
c0ded110:	ea61 ea65 37e8 ab75 fec1 a358 6b36 f83e     a.e..7u...X.6k>.
c0ded120:	f8db bbb4 f57d 0fe6 745d a532 dcdf 8690     ....}...]t2.....
c0ded130:	b217 71fa 7848 146e 85bb 341e 7d95 4190     ...qHxn....4.}.A
c0ded140:	e2be faac 55b4 8892 9936 64d0 58cc 0383     .....U..6..d.X..
c0ded150:	9204 291e 0304 1f30 fad8 f66e d5f2 7f6f     ...)..0...n...o.
c0ded160:	3b52 ca90 41b9 f55e ef0c aa1e 3e75 98bc     R;...A^.....u>..
c0ded170:	749f 8391 0c9f 9dbe 0ff3 8cfc b65f e18e     .t.........._...
c0ded180:	4a62 6072 d27f 9af9 a434 c6c6 eb02 0042     bJr`....4.....B.
c0ded190:	403c 83a6 36c3 fbf8 b30d bd78 01b6 2d67     <@...6....x...g-
c0ded1a0:	0ee9 2092 2cd8 4817 5a26 e648 8d9a a192     ... .,.H&ZH.....
c0ded1b0:	5bc4 f31d 2cee deeb ef1c cfe7 2566 7e7f     .[...,......f%.~
c0ded1c0:	ad82 d4ff 4b6a 9e9f 4856 6301 4aa6 9ea6     ....jK..VH.c.J..
c0ded1d0:	7ca0 93e7 08be f9ac 0ba4 59a9 cb9f 19df     .|.........Y....
c0ded1e0:	6c1c d1a7 c1b0 0a10 fc11 a572 948d e0f7     .l........r.....
c0ded1f0:	0bd4 dfcd c753 3105 701e d8b5 d9a8 951a     ....S..1.p......
c0ded200:	154f 6fcb 2787 ee3a eadc 4175 49ad db69     O..o.':...uA.Ii.
c0ded210:	df94 d71c 827f 9b84 eabb 064d 85ad 5461     ..........M...aT
c0ded220:	057d 6271 a419 fccf 755c 819c d1ed 04cc     }.qb....\u......
c0ded230:	5439 3156 a2c1 074d b296 29d9 16b9 d5f4     9TV1..M....)....
c0ded240:	a443 38ff 6670 38e9 208b 7127 aa41 a76f     C..8pf.8. 'qA.o.
c0ded250:	f413 9f5d 8897 edf5 9722 0e01 f915 468d     ..]....."......F
c0ded260:	6e66 d1ef d73e be07 debe 9347 9d23 52df     fn..>.....G.#..R
c0ded270:	37be 6705 db1d 47cd a661 4864 847e 593c     .7.g...Ga.dH~.<Y
c0ded280:	99ac 7676 1d66 78ae ee05 85fd 12b8 d181     ..vvf..x........
c0ded290:	11ed f771 8111 fa3b 9931 6e0d cd4d a811     ..q...;.1..nM...
c0ded2a0:	0f92 81e6 e0ff c365 b563 b4bf 4616 c54a     ......e.c....FJ.
c0ded2b0:	5822 8994 8dd7 eff4 95f0 66e8 c9a9 12b7     "X.........f....
c0ded2c0:	a7d4 495d 15c8 93e9 db31 35ca 33b7 d019     ..]I....1..5.3..
c0ded2d0:	1bc3 ce8c 913d 4c9e d2b5 280f 1618 8f32     ....=..L...(..2.
c0ded2e0:	7715 1dd3 6e18 75f5 cfe6 ec0a 5502 c85c     .w...n.u.....U\.
c0ded2f0:	b370 2d30 a23f 03df 0c3b 60f6 b1dd 5ecf     p.0-?...;..`...^
c0ded300:	38da 89b4 30ed 89fc 26c9 3494 4ab6 de0b     .8...0...&.4.J..
c0ded310:	590b 1c65 94f6 12ac 1165 da50 420e 018d     .Ye.....e.P..B..
c0ded320:	5ef4 d262 3b80 bbd6 d7ef 8066 c599 c4f8     .^b..;....f.....
c0ded330:	65aa 20c0 cf86 fc24 91c9 07e4 3a1a 6cec     .e. ..$......:.l
c0ded340:	8787 aa6f 033f ee54 7645 96b6 08bc eecf     ..o.?.T.Ev......
c0ded350:	29ef 2607 2e6c 0590 2b97 0fff 49f2 2d87     .).&l....+...I.-
c0ded360:	606b a11d ff02 e4c8 927b e3a0 ac84 f695     k`......{.......
c0ded370:	4ec5 aba6 960a c26b 51a6 a5ac e920 fbba     .N....k..Q.. ...
c0ded380:	b66b 8502 3c1c 0c50 66c0 0062 8d53 5c61     k....<P..fb.S.a\
c0ded390:	2de7 a8ef 2202 ebd6 25bf fe39 6bbd a978     .-..."...%9..kx.
c0ded3a0:	f4d1 7bbf cf6a 9233 55e5 2f1d d976 c956     ...{j.3..U./v.V.
c0ded3b0:	1445 18ae c006 a110 b11f 82f6 de41 24f4     E...........A..$
c0ded3c0:	33e6 ae85 46b1 703d 81f6 b34f ab6d e013     .3...F=p..O.m...
c0ded3d0:	fb77 84b2 927d d346 e751 f7b6 63b1 5e8e     w...}.F.Q....c.^
c0ded3e0:	8605 3e12 a1e7 ac74 ab29 eb69 f033 c2a7     ...>..t.).i.3...
c0ded3f0:	208a 48f1 76b1 5513 b1f1 53be 9f78 bf46     . .H.v.U...Sx.F.
c0ded400:	62f6 8901 ff95 9fad 8e87 7c56 318d 02f2     .b........V|.1..
c0ded410:	265a 4f39 eae9 f1ad bd9e 30b6 1712 931f     Z&9O.......0....
c0ded420:	d19c 897e 85ee 1370 7ed5 9b91 6d0d 4a77     ..~...p..~...mwJ
c0ded430:	2542 9544 8796 344b ff23 3c22 fdc5 1912     B%D...K4#."<....
c0ded440:	b7f9 8228 15aa 7bc8 7b9f 1dbf e790 93e9     ..(....{.{......
c0ded450:	e263 8083 7602 630c 86bd 8997 073b 62b7     c....v.c....;..b
c0ded460:	3107 2633 10f5 6133 0987 ce50 f71f 4af3     .13&..3a..P....J
c0ded470:	2922 e325 96d0 64a2 3503 3669 8f95 1bce     ")%....d.5i6....
c0ded480:	6ede a80d d0fa 9d41 80c5 4680 bc47 1ff7     .n....A....FG...
c0ded490:	01e9 5c8f 48e3 0417 5ca4 479f 7fae cc19     ...\.H...\.G....
c0ded4a0:	3205 43a5 f783 dc00 e1ef a83a ccd7 f47f     .2.C......:.....
c0ded4b0:	5d58 18a3 8c32 e723 7e29 2ded 0a60 7a8a     X]..2.#.)~.-`..z
c0ded4c0:	9fef 5134 4caa 1853 6aeb 4531 0af7 0d1b     ..4Q.LS..j1E....
c0ded4d0:	6391 63c7 d3af 462e 4887 d0ca 5e2e 7a1c     .c.c...F.H...^.z
c0ded4e0:	2675 fd69 29ed 5dd3 06fb d43f d2db 0502     u&i..).]..?.....
c0ded4f0:	ad21 1cbb 1a20 238a c229 28ac 973d 0a15     !... ..#)..(=...
c0ded500:	96c2 fe60 7268 0e64 96d7 56eb be4b 2aa1     ..`.hrd....VK..*
c0ded510:	a6f5 756f 4f64 e0cf 1632 1145 2eac 7d6d     ..oudO..2.E...m}
c0ded520:	b724 dbef e1b1 09c2 961e 439f 73df 9763     $..........C.sc.
c0ded530:	3dbd 2198 3583 c086 3859 bea6 2141 c4f2     .=.!.5..Y8..A!..
c0ded540:	aff8 98ae 7e86 caee 09a5 840a 3ea1 890b     .....~.......>..
c0ded550:	f904 5fe9 9cc6 b0f2 ea77 3111 7d1f d5f1     ..._....w..1.}..
c0ded560:	d3a3 96ae ef16 5f94 1e3c e269 f00c 1a4b     ......._<.i...K.
c0ded570:	7e9a 2aab d1b5 b4f1 0604 314d 0774 6639     .~.*......M1t.9f
c0ded580:	2e43 d646 21db ef98 d8d0 6dbf dbd9 39c5     C.F..!.....m...9
c0ded590:	4531 1d25 8f41 78f8 d3af 673d ed94 20ed     1E%.A..x..=g... 
c0ded5a0:	50ed 3e00 972d 600b 2d5a 63bf e5d3 e3be     .P.>-..`Z-.c....
c0ded5b0:	7d5c 65bc 9421 2756 ee83 3343 4fff d3c0     \}.e!.V'..C3.O..
c0ded5c0:	c382 841c 608a f196 fbd4 1f78 9720 676f     .....`....x. .og
c0ded5d0:	6b7c d2db e092 4dfd 16d7 de8d cb5e 375f     |k.....M....^._7
c0ded5e0:	e98f 9cf4 99f7 ba6d 747a 004b 03e7 d21b     ......m.ztK.....
c0ded5f0:	4290 5df8 f84d f3cd b9f7 f727 fd31 51c9     .B.]M.....'.1..Q
c0ded600:	da82 aa7f 23f4 60d7 e619 527e cca3 e96f     .....#.`..~R..o.
c0ded610:	3bdb ce43 46b3 2328 04a0 43e9 8f63 2ec1     .;C..F(#...Cc...
c0ded620:	e5db 3eba 5f7f 994b 16c2 ae8d edfc 7060     ...>._K.......`p
c0ded630:	8dd9 a673 75e1 b64d 0cf3 658e 7672 2dac     ..s..uM....erv.-
c0ded640:	e95f 54f7 3097 9119 5ee6 8d6f 2fb9 696e     _..T.0...^o../ni
c0ded650:	ca01 bc42 ad99 fab0 3a15 80a1 5d0c 3741     ..B......:...]A7
c0ded660:	13db 1855 0849 dc1d 9305 e7b1 9ab0 26fd     ..U.I..........&
c0ded670:	345b b19b c16f b905 8358 a609 de0a e699     [4..o...X.......
c0ded680:	a16e d490 5bc3 7a1f ddc2 dc8c 4210 a442     n....[.z.....BB.
c0ded690:	0b0b a3d1 297d 4c35 0274 a399 4a18 1cd0     ....})5Lt....J..
c0ded6a0:	50e9 1744 26b8 7d3e e8a8 ee32 8828 d05e     .PD..&>}..2.(.^.
c0ded6b0:	8185 44d9 13b8 9ff1 1d9e add2 3b40 b24e     ...D........@;N.
c0ded6c0:	10ec dce9 8119 19f2 beb8 e1bf fdc3 034e     ..............N.
c0ded6d0:	2afa aab9 36a6 fa54 d005 654c 0426 cd95     .*...6T...Le&...
c0ded6e0:	685a 2141 59ee e89f dbf3 d401 4f37 d820     ZhA!.Y......7O .
c0ded6f0:	f7a9 5322 5f4e b0a4 b8dc 99a7 d7a1 85b8     .."SN_..........
c0ded700:	079e 67f9 bc1d 86e1 60a5 fbff 1074 91b2     ...g.....`..t...
c0ded710:	e203 850f 6c23 99ff ae43 6054 0f59 c585     ....#l..C.T`Y...
c0ded720:	f196 d72b 0e54 6ac0 3105 9dc3 9b21 e89d     ..+.T..j.1..!...
c0ded730:	5383 5f8e 6860 a3d0 7132 433c b19f 3722     .S._`h..2q<C.."7
c0ded740:	2177 e9ae 8584 0985 4d83 bfc1 461f c991     w!.......M...F..
c0ded750:	3d7f 26b7 60ff 2eb2 142b cf17 02a9 2cd9     .=.&.`..+......,
c0ded760:	3120 f1a7 d4bb b1bc 6fec eaaa 3722 a36f      1.......o.."7o.
c0ded770:	da49 009f 1682 1154 5020 5855 6044 2c4a     I.....T. PUXD`J,
c0ded780:	0d53 8ec7 cc40 366e f143 88cf d075 c778     S...@.n6C...u.x.
c0ded790:	faac 028f 8b0e ad24 cf5e 04a0 f0b7 4a5a     ......$.^.....ZJ
c0ded7a0:	34d5 6ffc 40cd e590 4ad1 9348 2f64 5395     .4.o.@...JH.d/.S
c0ded7b0:	207c d634 966a 2571 1bbb 9e52 0a9a 29eb     | 4.j.q%..R....)
c0ded7c0:	bbf2 06a8 a498 68e3 4195 b6ce a78e 7a1c     .......h.A.....z
c0ded7d0:	226e a567 9168 9825 defd ece9 d3b8 3585     n"g.h.%........5
c0ded7e0:	0c74 8edd 873d ad66 5cdb 5ce9 4c24 74e4     t...=.f..\.\$L.t
c0ded7f0:	e76c b702 26e6 cea2 d100 25ad 8de4 6ae3     l....&.....%...j
c0ded800:	a50e cb49 8758 b01e f9bb ddd7 15ab 8503     ..I.X...........
c0ded810:	d36d 45be 19ba c1d6 f082 0adb 5ace 350c     m..E.........Z.5
c0ded820:	6955 ab0a 5737 5260 9a64 6565 f739 99cd     Ui..7W`Rd.ee9...
c0ded830:	0c61 fa68 436d ed67 f2d4 3b7c df96 9fcd     a.h.mCg...|;....
c0ded840:	471f 5ca4 e60d e7a7 a991 8e13 d019 9318     .G.\............
c0ded850:	54ee 86b9 92cc 6fb0 319c f9c9 aac9 e2bb     .T.....o.1......
c0ded860:	49a7 4aa4 ad39 a666 472a f872 ab21 689b     .I.J9.f.*Gr.!..h
c0ded870:	48c1 bd53 2f19 f4c7 5739 9c10 30d9 d354     .HS../..9W...0T.
c0ded880:	cf67 c1e4 4e3a 8715 9b55 c2cd 7050 41fa     g...:N..U...Pp.A
c0ded890:	2f71 7207 3072 2c5e ec40 f9cc 7de9 ff02     q/.rr0^,@....}..
c0ded8a0:	300d 5740 7570 807d 9f90 c7a8 d6ce eae8     .0@Wpu}.........
c0ded8b0:	fcf0 1e18 3929 3f3e 7244 8783 9488 e5c6     ....)9>?Dr......
c0ded8c0:	e9e6 f8f3 1c07 1e1d 5326 5b54 7e72 8e86     ........&ST[r~..
c0ded8d0:	ae97 c3c2 d7c7 e5dc f0ee 1508 211c 6924     .............!$i
c0ded8e0:	857c aea2 c1c0 f4cd 0000 0000 0000 0000     |...............
c0ded8f0:	2412 483a 1cd8 8d4d 4f73 fbcb deea 3f3d     .$:H..M.sO....=?
c0ded900:	038a aa9f 2c2a 5799 35e8 55ad 2eb2 bf75     ....*,.W.5.U..u.
c0ded910:	bb57 6a55                                    W.Uj.

c0ded915 <handler_cmd_verify_dilithium.pk>:
c0ded915:	327a 5741 a941 7c35 07db 85a5 803f 8ad1     z2AWA.5|....?...
c0ded925:	2a7a bcaa 44de 441b 3aa0 3f0e 4d84 194a     z*...D.D.:.?.MJ.
c0ded935:	d32a 5df5 437d ad53 4cba 3b91 9cdd 55a7     *..]}CS..L.;...U
c0ded945:	9a70 9b10 4592 c2f9 c6cb b1ae bdde 6661     p....E........af
c0ded955:	3851 912d 01c8 ad7c 13aa 7db3 cc14 4ca2     Q8-...|....}...L
c0ded965:	7cb3 e01f 08d1 69e5 1d94 cde9 f744 4948     .|.....i....D.HI
c0ded975:	9241 9af1 8421 a34e 4a74 75af d752 d710     A...!.N.tJ.uR...
c0ded985:	865c 4baa e604 72b1 61e9 108b ffef 08e7     \..K...r.a......
c0ded995:	4b0e aca6 f1de f372 22cd 2d04 aa53 134d     .K....r..".-S.M.
c0ded9a5:	4545 e081 21fa 30d9 deae 7b8d 59ff 38ca     EE...!.0...{.Y.8
c0ded9b5:	4870 de91 19f7 e87e f00a f7dd c702 6ea3     pH....~........n
c0ded9c5:	2095 a999 5aca aaef 51c9 3a78 7fa1 7244     . ...Z...Qx:..Dr
c0ded9d5:	046e ec79 19fd a0c9 013a fdfe 0399 0fd4     n.y.....:.......
c0ded9e5:	04d1 afae 1316 9f4b efef ef96 7dae 679d     ......K......}.g
c0ded9f5:	9f84 0bac 3f2c 03a1 7020 849e 5bac 5859     ....,?.. p...[YX
c0deda05:	5da1 8c97 6a5a 764a 9339 e684 c356 634b     .]..ZjJv9...V.Kc
c0deda15:	78af 25ba ec71 a999 3adc 1e0c b932 79f2     .x.%q....:..2..y
c0deda25:	5552 9a5f 2428 8dd4 ac6e a97a 03d9 6a71     RU_.($..n.z...qj
c0deda35:	347c b956 4264 d69d a454 d917 a9b1 5df1     |4V.dB..T......]
c0deda45:	ad2a c3cf f802 726b d86f d60a 0295 7a48     *.....kro.....Hz
c0deda55:	b72a eb2f b497 6e3b fb57 b5a0 be54 4a08     *./...;nW...T..J
c0deda65:	4e64 511e 66e2 239d da96 aad4 6d1c add2     dN.Q.f.#.....m..
c0deda75:	4e23 0891 c269 9a65 ea74 4559 52b4 39a1     #N..i.e.t.YE.R.9
c0deda85:	3d14 aed7 2371 576b 2840 952d 9280 e187     .=..q#kW@(-.....
c0deda95:	a52e 4e47 f12e 3aa9 315e 5e10 2826 2640     ..GN...:^1.^&(@&
c0dedaa5:	18a0 71a4 6a75 1650 3904 53b7 f134 099e     ...qujP..9.S4...
c0dedab5:	30ec f718 800d cbb6 2c00 d883 5d0b c153     .0.......,...]S.
c0dedac5:	5169 396e f1e3 5585 c7dc 55b5 5fdb 18a4     iQn9...U...U._..
c0dedad5:	8ab3 78cb 11d0 1f02 dcea 43bf 5af3 6917     ...x.......C.Z.i
c0dedae5:	d8d2 bf9d d264 6ca6 1aef 4a41 8170 de2e     ....d..l..AJp...
c0dedaf5:	7e3f 503a 969a c149 9b0c 5140 1364 54d5     ?~:P..I...@Qd..T
c0dedb05:	2261 b31f 7f51 38aa c47c 3160 bf0e d6e0     a"..Q..8|.`1....
c0dedb15:	caf9 6619 0453 7cdd 7dfa 80f9 9c3d 8dc8     ...fS..|.}..=...
c0dedb25:	03dc fba1 9396 d980 90d8 c488 2b31 b6ef     ............1+..
c0dedb35:	3fa6 7e45 cf83 53e0 f344 5461 e621 ba01     .?E~...SD.aT!...
c0dedb45:	c295 a899 2c84 150b 7423 2dfe 0251 2f9e     .....,..#t.-Q../
c0dedb55:	97d2 97a6 b961 e363 ee3a bf98 3bef 810d     ....a.c.:....;..
c0dedb65:	377f a25a 7cf4 ac35 c4aa f11a 52e8 1367     .7Z..|5......Rg.
c0dedb75:	ca57 1a82 abe8 f901 85b4 6f3b 3869 ecbe     W.........;oi8..
c0dedb85:	9acd cf7a 4f61 67eb 6944 9164 d202 c923     ..z.aO.gDid...#.
c0dedb95:	f887 9e24 2924 d833 55ea f328 1c8f 89d5     ..$.$)3..U(.....
c0dedba5:	8367 8969 e721 0bd9 d97e ecac 3043 d9c4     g.i.!...~...C0..
c0dedbb5:	12d9 17f5 5bf8 2462 690e 5358 0de6 114b     .....[b$.iXS..K.
c0dedbc5:	4efa a889 522f 9396 982c 05a1 0c60 7912     .N../R..,...`..y
c0dedbd5:	0178 1617 b82e e983 2282 90c0 d80f e32f     x........"..../.
c0dedbe5:	0906 0bc3 03f1 a465 3814 6857 7870 db4d     ......e..8WhpxM.
c0dedbf5:	f4cb 442c 630c d79e 15e0 675b 679c 7c98     ..,D.c....[g.g.|
c0dedc05:	9e42 f7ac 1b33 3e5a 0ff1 1e1e 2ab1 aa1f     B...3.Z>.....*..
c0dedc15:	94b4 0eb5 5d2a 9da6 29f4 4d0f 8b76 fb6f     ....*]...).Mv.o.
c0dedc25:	8c3f 3046 1ab7 5215 ede8 b5fe 42e1 1fc5     ?.F0...R.....B..
c0dedc35:	0cf1 13b8 cdf3 394e 9f97 fef5 2700 bb42     ......N9.....'B.
c0dedc45:	e96e 10c4 18c8 a829 b82c deb5 e6de e7a4     n.....).,.......
c0dedc55:	4c6b ab84 c102 1466 d85e 59fc f4f7 16b4     kL....f.^..Y....
c0dedc65:	39be ab0e fc8b 49dc 6f8d 3148 cf38 15a0     .9.....I.oH18...
c0dedc75:	0b2f c988 75de 901d 1107 6d59 d064 c3c6     /....u....Ymd...
c0dedc85:	a2bd c2d1 5545 fc1f 1bb8 3b5d b1bd 38a7     ....EU....];...8
c0dedc95:	622c dfd0 a24c dd3b 28d2 999a ff78 bc31     ,b..L.;..(..x.1.
c0dedca5:	995f ef25 d2f1 7984 8396 408c f4d2 0547     _.%....y...@..G.
c0dedcb5:	37d7 aa35 d6ac a7c6 f196 1388 69f0 1534     .75..........i4.
c0dedcc5:	5055 72df a339 2a6a 9200 8500 cceb ff37     UP.r9.j*......7.
c0dedcd5:	1230 34bc 030a 4724 9529 9c3b 8dc1 bd2d     0..4..$G).;...-.
c0dedce5:	fd9b 36e8 7f6d 88f6 6c2c 99cf b40b d3da     ...6m...,l......
c0dedcf5:	32ae 38b1 f347 475b 612e 7417 9df6 1c73     .2.8G.[G.a.t..s.
c0dedd05:	fd79 27f7 4aab 2140 daf4 9cc5 ff2e 57bc     y..'.J@!.......W
c0dedd15:	669c 08f2 2601 6d00 4a81 43d8 8831 1dde     .f...&.m.J.C1...
c0dedd25:	53b0 aafb f44d 52f7 a54f e800 dc9c 8a58     .S..M..RO.....X.
c0dedd35:	76e8 c12a 4c72 449a 0fac 9773 32f7 87c3     .v*.rL.D..s..2..
c0dedd45:	4b2f 40dc 2875 4d14 373b 49ac 2653 48a8     /K.@u(.M;7.IS&.H
c0dedd55:	1045 dff6 8480 ea9b e8d5 5bf8 1f11 c9ff     E..........[....
c0dedd65:	f401 be47 f9b6 f974 1438 356f d0b5 9bed     ..G...t.8.o5....
c0dedd75:	9ec3 9b60 2cfb 3791 9646 8f80 701e 8bae     ..`..,.7F....p..
c0dedd85:	673b b56a d4ce 44ec bf67 4c90 18bd ca70     ;gj....Dg..L..p.
c0dedd95:	a9ab fbc5 923e f712 b4c3 2836 7e5a 276e     ....>.....6(Z~n'
c0dedda5:	c32a f960 7e13 52bc 7352 8535 2a21 db91     *.`..~.RRs5.!*..
c0deddb5:	9e4b de86 de4c f52a 1699 a8e6 5904 45f1     K...L.*......Y.E
c0deddc5:	6b0e acad 14ee ea83 b1c5 295b 79d7 5554     .k........[).yTU
c0deddd5:	547e eafb d73a a98f eba3 0b05 fb68 9695     ~T..:.......h...
c0dedde5:	7369 4cb1 c91a aa56 4845 b981 d16a 92f4     is.L..V.EH..j...
c0deddf5:	83e1 1c09 ff31 41a2 f10b 842b 43bf 5a21     ....1..A..+..C!Z
c0dede05:	3f07 c916 41ef e919 6101 de5d 41b1 67de     .?...A...a]..A.g
c0dede15:	919f 451e b0a3 89f1 2aa9 0f95 e22e 9d62     ...E.....*....b.
c0dede25:	014c 1dd4 1da3 081d 4712 6382 183f ee68     L........G.c?.h.
c0dede35:	0000                                         ...

c0dede38 <settingContents>:
c0dede38:	0000 0000 de54 c0de 0001 0000               ....T.......

c0dede44 <infoList>:
c0dede44:	de8c c0de de94 c0de 0000 0000 0002 0000     ................

c0dede54 <contents>:
c0dede54:	0007 0000 1454 da7a 0002 0000 0000 0000     ....T.z.........
	...
c0dede88:	0bb9 c0de                                   ....

c0dede8c <INFO_TYPES>:
c0dede8c:	ca08 c0de c846 c0de                         ....F...

c0dede94 <INFO_CONTENTS>:
c0dede94:	c601 c0de c901 c0de                         ........

c0dede9c <zetas>:
c0dede9c:	0000 0000 64f7 0000 3102 ffd8 1503 fff8     .....d...1......
c0dedeac:	9e44 0003 2118 fff4 a128 fff2 1e24 0007     D....!..(...$...
c0dedebc:	de2b 001b e92b 0023 84ad fffa 147f ffe0     +...+.#.........
c0dedecc:	9a75 002f fb09 ffd3 7a49 002f e527 0028     u./.....Iz/.'.(.
c0dededc:	9658 0029 a070 000f 85a4 ffef b788 0036     X.).p.........6.
c0dedeec:	9d90 fff7 eaa0 ffee f968 0027 d37b ffdf     ........h.'.{...
c0dedefc:	add6 ffdf 1ae7 ffc5 a4f7 ffea fc98 ffcd     ................
c0dedf0c:	d035 001a b422 ffff 3201 003d 45c5 0004     5..."....2=..E..
c0dedf1c:	4a67 0029 7620 0001 f4cd 002e dec5 0035     gJ). v........5.
c0dedf2c:	a503 ffe6 302c ffc9 47d4 ffd9 beaf 003b     ....,0...G....;.
c0dedf3c:	1585 ffc5 8e7c ffd1 8a96 0036 3e41 ffd4     ....|.....6.A>..
c0dedf4c:	0400 0036 6a4d fffb d69c 0023 c55d fff7     ..6.Mj....#.]...
c0dedf5c:	123d ffe6 ead6 ffe6 7e1e 0035 af59 ffc5     =........~5.Y...
c0dedf6c:	843f 0035 5617 ffdf 945c ffe7 738c 0038     ?.5..V..\....s8.
c0dedf7c:	63a8 000c 1b9a 0008 8f76 000e 3853 003b     .c......v...S8;.
c0dedf8c:	8534 003b fc30 ffd8 9d54 001f 4f2d ffd5     4.;.0...T...-O..
c0dedf9c:	06e5 ffc4 ac81 ffe8 e1cf ffc7 9819 ffd1     ................
c0dedfac:	d65d ffe9 09ee 0035 35c7 0021 cfbb ffe7     ].....5..5!.....
c0dedfbc:	cf75 ffec 9772 001d b072 ffc1 bcf6 fff0     u...r...r.......
c0dedfcc:	5280 ffcf d2ae ffcf 90e0 ffc8 efca 0001     .R..............
c0dedfdc:	10f2 0034 fe85 fff0 c638 0020 6e9f 0029     ..4.....8. ..n).
c0dedfec:	b7a3 ffd2 a44b ffc7 ba6d fff9 3409 ffda     ....K...m....4..
c0dedffc:	c282 fff5 4113 ffed a63b ffff 09f7 ffec     .....A..;.......
c0dee00c:	2bdd fffa 95d4 0014 4563 001c 2c62 ffea     .+......cE..b,..
c0dee01c:	fbe9 ffcc 0af0 0004 c417 0007 4588 002f     .............E/.
c0dee02c:	ad00 0000 36be ffef cd44 000d 675a 003c     .....6..D...Zg<.
c0dee03c:	2bca ffc7 de7e ffff 3948 0019 69c0 ffce     .+..~...H9...i..
c0dee04c:	756c 0024 c7df fffc 98a1 000b e808 ffeb     lu$.............
c0dee05c:	e46c 0002 c808 ffc9 36c2 0030 bff6 ffe3     l........60.....
c0dee06c:	3c93 ffdb 4ae0 fffd 1305 0014 7792 0014     .<...J.......w..
c0dee07c:	9e25 0013 d0e0 ffe7 9944 fff3 0802 ffea     %.......D.......
c0dee08c:	eea2 ffd1 c79c ffc4 a057 ffc8 97d9 003a     ........W.....:.
c0dee09c:	ea93 001f ff5a 0033 58d4 0023 41f8 003a     ....Z.3..X#..A:.
c0dee0ac:	ff72 ffcc 3dfb 0022 ab9f ffda a422 ffc9     r....="....."...
c0dee0bc:	12f5 0004 2587 0025 24f0 ffed 9b5d 0035     .....%%..$..].5.
c0dee0cc:	48a0 ffca a2fc ffc6 bb56 ffed 45de ffcf     .H......V....E..
c0dee0dc:	be5e 000d 5e1a 001c e0e6 000d 7f5a 000c     ^....^......Z...
c0dee0ec:	8f83 0007 628a ffe7 5704 ffff 06fc fff8     .....b...W......
c0dee0fc:	0021 fff6 5af6 ffd0 0084 001f ef86 0030     !....Z........0.
c0dee10c:	b97d ffc9 fcd6 fff7 4592 fff4 21c2 ffc9     }........E...!..
c0dee11c:	3919 0005 610c 0004 cd41 ffda b01b 003e     .9...a..A.....>.
c0dee12c:	72e7 0034 003b ffcd 7cc7 001a 1924 0003     .r4.;....|..$...
c0dee13c:	5ee5 002b 1199 0029 7a3a ffd8 4d71 0013     .^+...).:z..qM..
c0dee14c:	e11c 003d 0984 0013 f051 0025 5a46 0018     ..=.....Q.%.FZ..
c0dee15c:	8518 ffc6 14be 0013 3891 0028 db90 ffc9     .........8(.....
c0dee16c:	5089 ffd2 853f 001c 0b4b 001d f6a6 ffef     .P..?...K.......
c0dee17c:	a8be ffeb e11b 0012 5e3e ffcd 2d2f ffea     ........>^../-..
c0dee18c:	1de4 fff9 06c7 0014 7283 0032 0d6e ffe2     .........r2.n...
c0dee19c:	7953 ffec 4099 001d 2578 ffd9 05ad ffeb     Sy...@..x%......
c0dee1ac:	e405 0016 dbe7 000b 1de8 0022 f8cf 0033     .........."...3.
c0dee1bc:	b934 fff7 ca0c ffd4 7ff8 ffe6 d157 ffe3     4...........W...
c0dee1cc:	911b ffd8 2c12 ffc7 10d8 0009 5e1f ffc6     .....,.......^..
c0dee1dc:	4658 ffe1 1d8b 0025 73b7 0025 7c8f fffd     XF....%..s%..|..
c0dee1ec:	dd98 001d 6898 0033 d4bb 0002 93a7 ffed     .....h3.........
c0dee1fc:	6cbe ffcf 7c1c 0002 aa08 0018 fd71 002d     .l...|......q.-.
c0dee20c:	5ca5 000c 379a 0019 a167 ffc7 8c3d ffe4     .\...7..g...=...
c0dee21c:	a13c ffd1 c539 0035 0115 003b 1dc0 0004     <...9.5...;.....
c0dee22c:	c4f7 0021 1bf4 fff1 35e7 001a 340e 0007     ..!......5...4..
c0dee23c:	7d45 fff9 4cd0 001a 7cae ffe4 2668 001d     E}...L...|..h&..
c0dee24c:	8e98 ffe6 2633 ffef 05da fffc 7fdb ffc5     ....3&..........
c0dee25c:	2764 ffd3 e1af ffdd 93dd fff9 1d09 ffdd     d'..............
c0dee26c:	cc93 0002 1805 fff1 9c2a 0018 e5a9 ffc9     ........*.......
c0dee27c:	8a50 fff7 cf2c 003b 434e ffff 36df ffeb     P...,.;.NC...6..
c0dee28c:	15ca 003c 5e68 0015 16b6 fff3 29ce 001e     ..<.h^.......)..

c0dee29c <small_zetas>:
c0dee29c:	fbec fd0a fe99 fa13 05d5 058e 011f 00ca     ................
c0dee2ac:	ff55 026e 0629 00b6 03c2 fb4e fa3e 05bc     U.n.).....N.>...
c0dee2bc:	023d fad3 0108 017f fcc3 05b2 f9be ff7e     =.............~.
c0dee2cc:	fd57 03f9 02dc 0260 f9fa 019b ff33 f9dd     W.....`.....3...
c0dee2dc:	04c7 028c fdd8 03f7 faf3 05d3 fee6 f9f8     ................
c0dee2ec:	0204 fff8 fec0 fd66 f9ae fb76 007e 05bd     ......f...v.~...
c0dee2fc:	fcab ffa6 fef1 033e 006b fa73 ff09 fc49     ......>.k.s...I.
c0dee30c:	fe72 03c1 fa1c fd2b 01c0 fbd7 02a5 fb05     r.....+.........
c0dee31c:	fbb1 01ae 022b 034b fb1d 0367 060e 0069     ....+.K...g...i.
c0dee32c:	01a6 024b 00b1 ff15 fedd fe34 0626 0675     ..K.......4.&.u.
c0dee33c:	ff0a 030a 0487 ff6d fcf7 05cb fda6 045f     ......m......._.
c0dee34c:	f9ca 0284 fc98 015d 01a2 0149 ff64 ffb5     ......]...I.d...
c0dee35c:	0331 0449 025b 0262 052a fafb fa47 0180     1.I.[.b.*...G...
c0dee36c:	fb41 ff78 04c2 fac9 fc96 00dc fb5d f985     A.x.........]...
c0dee37c:	fb5f fa06 fb02 031a fa1a fcaa fc9a 01de     _...............
c0dee38c:	ff94 fecc 03e4 03df 03be fa4c 05f2 065c     ..........L...\.

c0dee39c <.L__const.nbgl_useCaseStatus.ticker>:
c0dee39c:	8091 c0de 0bb8 0000 0000 0000               ............

c0dee3a8 <blindSigningWarning>:
c0dee3a8:	0010 0000 0000 0000 0000 0000 0000 0000     ................
	...
c0dee3d4:	6854 7369 6120 7070 6520 616e 6c62 7365     This app enables
c0dee3e4:	7320 6769 696e 676e 740a 6172 736e 6361      signing.transac
c0dee3f4:	6974 6e6f 2073 6e6f 6920 7374 6e20 7465     tions on its net
c0dee404:	6f77 6b72 002e                              work..

c0dee40a <nbMaxElementsPerContentType>:
c0dee40a:	0101 0101 0101 0301 0503 0005 0000          ..............

c0dee418 <.L__const.displayAddressQRCode.headerDesc>:
c0dee418:	0000 0000 0028 0000 0000 0000 0000 0000     ....(...........
c0dee428:	0000 0000                                   ....

c0dee42c <.L__const.displaySkipWarning.info>:
c0dee42c:	ca93 c0de cc97 c0de 0000 0000 bac0 c0de     ................
c0dee43c:	0000 0000 c894 c0de cd69 c0de 0005 0109     ........i.......

c0dee44c <.L__const.displaySecurityReport.layoutDescription>:
c0dee44c:	0101 0000 0000 0000 0000 0000 9701 c0de     ................
	...

c0dee468 <.L__const.displaySecurityReport.headerDesc>:
c0dee468:	0101 0000 0000 0000 0000 0000 0917 0000     ................
c0dee478:	0000 0000                                   ....

c0dee47c <securityReportItems>:
c0dee47c:	c56f c0de c5d0 c0de 0000 0000 c56f c0de     o...........o...
c0dee48c:	cac1 c0de cced c0de c56f c0de cafb c0de     ........o.......
c0dee49c:	ca50 c0de 0000 0000 cd41 c0de ce97 c0de     P.......A.......
c0dee4ac:	c56f c0de caa0 c0de cb24 c0de 0000 0000     o.......$.......
	...

c0dee4c4 <.L__const.displayInfosListModal.info>:
c0dee4c4:	0100 0114 0900 0000 0000 0000 0000 0000     ................
c0dee4d4:	0100 0300 0000 0000 0000 0000               ............

c0dee4e0 <.L__const.displayInitialWarning.buttonsInfo>:
c0dee4e0:	c8cc c0de ce41 c0de 0000 0000 0015 0009     ....A...........

c0dee4f0 <.L__const.displayInitialWarning.headerDesc>:
c0dee4f0:	0000 0000 0040 0000 0000 0000 0000 0000     ....@...........
c0dee500:	0000 0000                                   ....

c0dee504 <g_pcHex>:
c0dee504:	3130 3332 3534 3736 3938 6261 6463 6665     0123456789abcdef

c0dee514 <g_pcHex_cap>:
c0dee514:	3130 3332 3534 3736 3938 4241 4443 4645     0123456789ABCDEF

c0dee524 <_etext>:
	...

c0dee600 <N_storage_real>:
	...

c0dee800 <install_parameters>:
c0dee800:	0801 4c4d 5344 4541 4854 0502 2e30 2e30     ..MLDSAETH..0.0.
c0dee810:	0331 0182 284a 2800 2200 0142 ff00 ffff     1...J(.(."B.....
c0dee820:	ffff 8ccc 1082 5a91 dce0 020b 1110 8130     .......Z......0.
c0dee830:	d98e 0107 1152 0320 d70c 3485 3233 3001     ....R. ....432.0
c0dee840:	d50a 5696 4340 2122 0c20 89d3 3446 2233     ...V@C"! ...F43"
c0dee850:	2011 0d01 9dd1 5037 1314 1314 1132 0520     . ....7P....2. .
c0dee860:	08d1 1607 1c0a 080b 2233 3011 cf0c 479e     ........3".0...G
c0dee870:	c5b0 050d 2213 3011 c406 c72e 6c8b 8dc7     .....".0.....l..
c0dee880:	2253 9588 0e30 0bc2 0310 08c7 c309 ce8e     S"..0...........
c0dee890:	0bc2 1302 dcbc 00d9 2691 c180 1005 c702     .........&......
c0dee8a0:	0d05 acc2 9cbd bec1 9d43 a130 67bd 091c     ........C.0..g..
c0dee8b0:	2314 0b02 05c6 0ac3 0ec1 c208 0306 9218     .#..............
c0dee8c0:	e017 2c3d 8a2b c53c c209 0a0e 08c2 09c2     ..=,+.<.........
c0dee8d0:	1703 8811 1ced 1b1d 0a2c c609 c308 dfaa     ........,.......
c0dee8e0:	c2cb 27bc 70e8 b31d a906 adb0 787a 0ac7     ...'.p......zx..
c0dee8f0:	af2e adec 9ec3 9072 bd1e 5a60 0ec0 86c1     ......r...`Z....
c0dee900:	c8a7 0b0d c02e c50e d6be 3012 06a1 c2c8     ...........0....
c0dee910:	8b9e c950 7e07 ba5e 7b64 0bd0 c20a 070e     ..P..~^.d{......
c0dee920:	c918 0c0b 7e7e 1d0e d208 7e07 0e7e ac8d     ....~~.....~~...
c0dee930:	0dd2 7e09 8d6e d4b9 0a0b 4e7e c98d 0bd6     ...~n.....~N....
c0dee940:	7e09 1d1e 090b 8dd8 3e7c 1e1d 8d8c 9cdb     .~......|>......
c0dee950:	b089 9b1c b0a8 9de0 d0cb ffff ffff 04c4     ................
c0dee960:	010a 8002 0000 802c 1f00                     ......,....
