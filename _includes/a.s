
./a.out:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64
    1004:	48 83 ec 08          	sub    $0x8,%rsp
    1008:	48 8b 05 d9 3f 00 00 	mov    0x3fd9(%rip),%rax        # 4fe8 <__gmon_start__@Base>
    100f:	48 85 c0             	test   %rax,%rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	call   *%rax
    1016:	48 83 c4 08          	add    $0x8,%rsp
    101a:	c3                   	ret

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 a2 3e 00 00    	push   0x3ea2(%rip)        # 4ec8 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	ff 25 a4 3e 00 00    	jmp    *0x3ea4(%rip)        # 4ed0 <_GLOBAL_OFFSET_TABLE_+0x10>
    102c:	0f 1f 40 00          	nopl   0x0(%rax)
    1030:	f3 0f 1e fa          	endbr64
    1034:	68 00 00 00 00       	push   $0x0
    1039:	e9 e2 ff ff ff       	jmp    1020 <_init+0x20>
    103e:	66 90                	xchg   %ax,%ax
    1040:	f3 0f 1e fa          	endbr64
    1044:	68 01 00 00 00       	push   $0x1
    1049:	e9 d2 ff ff ff       	jmp    1020 <_init+0x20>
    104e:	66 90                	xchg   %ax,%ax
    1050:	f3 0f 1e fa          	endbr64
    1054:	68 02 00 00 00       	push   $0x2
    1059:	e9 c2 ff ff ff       	jmp    1020 <_init+0x20>
    105e:	66 90                	xchg   %ax,%ax
    1060:	f3 0f 1e fa          	endbr64
    1064:	68 03 00 00 00       	push   $0x3
    1069:	e9 b2 ff ff ff       	jmp    1020 <_init+0x20>
    106e:	66 90                	xchg   %ax,%ax
    1070:	f3 0f 1e fa          	endbr64
    1074:	68 04 00 00 00       	push   $0x4
    1079:	e9 a2 ff ff ff       	jmp    1020 <_init+0x20>
    107e:	66 90                	xchg   %ax,%ax
    1080:	f3 0f 1e fa          	endbr64
    1084:	68 05 00 00 00       	push   $0x5
    1089:	e9 92 ff ff ff       	jmp    1020 <_init+0x20>
    108e:	66 90                	xchg   %ax,%ax
    1090:	f3 0f 1e fa          	endbr64
    1094:	68 06 00 00 00       	push   $0x6
    1099:	e9 82 ff ff ff       	jmp    1020 <_init+0x20>
    109e:	66 90                	xchg   %ax,%ax
    10a0:	f3 0f 1e fa          	endbr64
    10a4:	68 07 00 00 00       	push   $0x7
    10a9:	e9 72 ff ff ff       	jmp    1020 <_init+0x20>
    10ae:	66 90                	xchg   %ax,%ax
    10b0:	f3 0f 1e fa          	endbr64
    10b4:	68 08 00 00 00       	push   $0x8
    10b9:	e9 62 ff ff ff       	jmp    1020 <_init+0x20>
    10be:	66 90                	xchg   %ax,%ax
    10c0:	f3 0f 1e fa          	endbr64
    10c4:	68 09 00 00 00       	push   $0x9
    10c9:	e9 52 ff ff ff       	jmp    1020 <_init+0x20>
    10ce:	66 90                	xchg   %ax,%ax
    10d0:	f3 0f 1e fa          	endbr64
    10d4:	68 0a 00 00 00       	push   $0xa
    10d9:	e9 42 ff ff ff       	jmp    1020 <_init+0x20>
    10de:	66 90                	xchg   %ax,%ax
    10e0:	f3 0f 1e fa          	endbr64
    10e4:	68 0b 00 00 00       	push   $0xb
    10e9:	e9 32 ff ff ff       	jmp    1020 <_init+0x20>
    10ee:	66 90                	xchg   %ax,%ax
    10f0:	f3 0f 1e fa          	endbr64
    10f4:	68 0c 00 00 00       	push   $0xc
    10f9:	e9 22 ff ff ff       	jmp    1020 <_init+0x20>
    10fe:	66 90                	xchg   %ax,%ax
    1100:	f3 0f 1e fa          	endbr64
    1104:	68 0d 00 00 00       	push   $0xd
    1109:	e9 12 ff ff ff       	jmp    1020 <_init+0x20>
    110e:	66 90                	xchg   %ax,%ax
    1110:	f3 0f 1e fa          	endbr64
    1114:	68 0e 00 00 00       	push   $0xe
    1119:	e9 02 ff ff ff       	jmp    1020 <_init+0x20>
    111e:	66 90                	xchg   %ax,%ax
    1120:	f3 0f 1e fa          	endbr64
    1124:	68 0f 00 00 00       	push   $0xf
    1129:	e9 f2 fe ff ff       	jmp    1020 <_init+0x20>
    112e:	66 90                	xchg   %ax,%ax
    1130:	f3 0f 1e fa          	endbr64
    1134:	68 10 00 00 00       	push   $0x10
    1139:	e9 e2 fe ff ff       	jmp    1020 <_init+0x20>
    113e:	66 90                	xchg   %ax,%ax
    1140:	f3 0f 1e fa          	endbr64
    1144:	68 11 00 00 00       	push   $0x11
    1149:	e9 d2 fe ff ff       	jmp    1020 <_init+0x20>
    114e:	66 90                	xchg   %ax,%ax
    1150:	f3 0f 1e fa          	endbr64
    1154:	68 12 00 00 00       	push   $0x12
    1159:	e9 c2 fe ff ff       	jmp    1020 <_init+0x20>
    115e:	66 90                	xchg   %ax,%ax
    1160:	f3 0f 1e fa          	endbr64
    1164:	68 13 00 00 00       	push   $0x13
    1169:	e9 b2 fe ff ff       	jmp    1020 <_init+0x20>
    116e:	66 90                	xchg   %ax,%ax
    1170:	f3 0f 1e fa          	endbr64
    1174:	68 14 00 00 00       	push   $0x14
    1179:	e9 a2 fe ff ff       	jmp    1020 <_init+0x20>
    117e:	66 90                	xchg   %ax,%ax
    1180:	f3 0f 1e fa          	endbr64
    1184:	68 15 00 00 00       	push   $0x15
    1189:	e9 92 fe ff ff       	jmp    1020 <_init+0x20>
    118e:	66 90                	xchg   %ax,%ax
    1190:	f3 0f 1e fa          	endbr64
    1194:	68 16 00 00 00       	push   $0x16
    1199:	e9 82 fe ff ff       	jmp    1020 <_init+0x20>
    119e:	66 90                	xchg   %ax,%ax
    11a0:	f3 0f 1e fa          	endbr64
    11a4:	68 17 00 00 00       	push   $0x17
    11a9:	e9 72 fe ff ff       	jmp    1020 <_init+0x20>
    11ae:	66 90                	xchg   %ax,%ax
    11b0:	f3 0f 1e fa          	endbr64
    11b4:	68 18 00 00 00       	push   $0x18
    11b9:	e9 62 fe ff ff       	jmp    1020 <_init+0x20>
    11be:	66 90                	xchg   %ax,%ax
    11c0:	f3 0f 1e fa          	endbr64
    11c4:	68 19 00 00 00       	push   $0x19
    11c9:	e9 52 fe ff ff       	jmp    1020 <_init+0x20>
    11ce:	66 90                	xchg   %ax,%ax
    11d0:	f3 0f 1e fa          	endbr64
    11d4:	68 1a 00 00 00       	push   $0x1a
    11d9:	e9 42 fe ff ff       	jmp    1020 <_init+0x20>
    11de:	66 90                	xchg   %ax,%ax
    11e0:	f3 0f 1e fa          	endbr64
    11e4:	68 1b 00 00 00       	push   $0x1b
    11e9:	e9 32 fe ff ff       	jmp    1020 <_init+0x20>
    11ee:	66 90                	xchg   %ax,%ax
    11f0:	f3 0f 1e fa          	endbr64
    11f4:	68 1c 00 00 00       	push   $0x1c
    11f9:	e9 22 fe ff ff       	jmp    1020 <_init+0x20>
    11fe:	66 90                	xchg   %ax,%ax
    1200:	f3 0f 1e fa          	endbr64
    1204:	68 1d 00 00 00       	push   $0x1d
    1209:	e9 12 fe ff ff       	jmp    1020 <_init+0x20>
    120e:	66 90                	xchg   %ax,%ax
    1210:	f3 0f 1e fa          	endbr64
    1214:	68 1e 00 00 00       	push   $0x1e
    1219:	e9 02 fe ff ff       	jmp    1020 <_init+0x20>
    121e:	66 90                	xchg   %ax,%ax
    1220:	f3 0f 1e fa          	endbr64
    1224:	68 1f 00 00 00       	push   $0x1f
    1229:	e9 f2 fd ff ff       	jmp    1020 <_init+0x20>
    122e:	66 90                	xchg   %ax,%ax

Disassembly of section .plt.got:

0000000000001230 <__cxa_finalize@plt>:
    1230:	f3 0f 1e fa          	endbr64
    1234:	ff 25 be 3d 00 00    	jmp    *0x3dbe(%rip)        # 4ff8 <__cxa_finalize@GLIBC_2.2.5>
    123a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

Disassembly of section .plt.sec:

0000000000001240 <pthread_barrierattr_setpshared@plt>:
    1240:	f3 0f 1e fa          	endbr64
    1244:	ff 25 8e 3c 00 00    	jmp    *0x3c8e(%rip)        # 4ed8 <pthread_barrierattr_setpshared@GLIBC_2.34>
    124a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000001250 <pthread_barrier_init@plt>:
    1250:	f3 0f 1e fa          	endbr64
    1254:	ff 25 86 3c 00 00    	jmp    *0x3c86(%rip)        # 4ee0 <pthread_barrier_init@GLIBC_2.34>
    125a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000001260 <puts@plt>:
    1260:	f3 0f 1e fa          	endbr64
    1264:	ff 25 7e 3c 00 00    	jmp    *0x3c7e(%rip)        # 4ee8 <puts@GLIBC_2.2.5>
    126a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000001270 <pthread_barrier_wait@plt>:
    1270:	f3 0f 1e fa          	endbr64
    1274:	ff 25 76 3c 00 00    	jmp    *0x3c76(%rip)        # 4ef0 <pthread_barrier_wait@GLIBC_2.34>
    127a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000001280 <clock_gettime@plt>:
    1280:	f3 0f 1e fa          	endbr64
    1284:	ff 25 6e 3c 00 00    	jmp    *0x3c6e(%rip)        # 4ef8 <clock_gettime@GLIBC_2.17>
    128a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000001290 <pthread_cond_wait@plt>:
    1290:	f3 0f 1e fa          	endbr64
    1294:	ff 25 66 3c 00 00    	jmp    *0x3c66(%rip)        # 4f00 <pthread_cond_wait@GLIBC_2.3.2>
    129a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000012a0 <__stack_chk_fail@plt>:
    12a0:	f3 0f 1e fa          	endbr64
    12a4:	ff 25 5e 3c 00 00    	jmp    *0x3c5e(%rip)        # 4f08 <__stack_chk_fail@GLIBC_2.4>
    12aa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000012b0 <printf@plt>:
    12b0:	f3 0f 1e fa          	endbr64
    12b4:	ff 25 56 3c 00 00    	jmp    *0x3c56(%rip)        # 4f10 <printf@GLIBC_2.2.5>
    12ba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000012c0 <pthread_barrier_destroy@plt>:
    12c0:	f3 0f 1e fa          	endbr64
    12c4:	ff 25 4e 3c 00 00    	jmp    *0x3c4e(%rip)        # 4f18 <pthread_barrier_destroy@GLIBC_2.34>
    12ca:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000012d0 <pthread_mutex_destroy@plt>:
    12d0:	f3 0f 1e fa          	endbr64
    12d4:	ff 25 46 3c 00 00    	jmp    *0x3c46(%rip)        # 4f20 <pthread_mutex_destroy@GLIBC_2.2.5>
    12da:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000012e0 <pthread_mutexattr_settype@plt>:
    12e0:	f3 0f 1e fa          	endbr64
    12e4:	ff 25 3e 3c 00 00    	jmp    *0x3c3e(%rip)        # 4f28 <pthread_mutexattr_settype@GLIBC_2.34>
    12ea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000012f0 <pthread_condattr_destroy@plt>:
    12f0:	f3 0f 1e fa          	endbr64
    12f4:	ff 25 36 3c 00 00    	jmp    *0x3c36(%rip)        # 4f30 <pthread_condattr_destroy@GLIBC_2.2.5>
    12fa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000001300 <pthread_mutex_trylock@plt>:
    1300:	f3 0f 1e fa          	endbr64
    1304:	ff 25 2e 3c 00 00    	jmp    *0x3c2e(%rip)        # 4f38 <pthread_mutex_trylock@GLIBC_2.34>
    130a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000001310 <pthread_cond_signal@plt>:
    1310:	f3 0f 1e fa          	endbr64
    1314:	ff 25 26 3c 00 00    	jmp    *0x3c26(%rip)        # 4f40 <pthread_cond_signal@GLIBC_2.3.2>
    131a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000001320 <pthread_condattr_setclock@plt>:
    1320:	f3 0f 1e fa          	endbr64
    1324:	ff 25 1e 3c 00 00    	jmp    *0x3c1e(%rip)        # 4f48 <pthread_condattr_setclock@GLIBC_2.34>
    132a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000001330 <fprintf@plt>:
    1330:	f3 0f 1e fa          	endbr64
    1334:	ff 25 16 3c 00 00    	jmp    *0x3c16(%rip)        # 4f50 <fprintf@GLIBC_2.2.5>
    133a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000001340 <pthread_mutex_timedlock@plt>:
    1340:	f3 0f 1e fa          	endbr64
    1344:	ff 25 0e 3c 00 00    	jmp    *0x3c0e(%rip)        # 4f58 <pthread_mutex_timedlock@GLIBC_2.34>
    134a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000001350 <pthread_barrierattr_destroy@plt>:
    1350:	f3 0f 1e fa          	endbr64
    1354:	ff 25 06 3c 00 00    	jmp    *0x3c06(%rip)        # 4f60 <pthread_barrierattr_destroy@GLIBC_2.34>
    135a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000001360 <pthread_barrierattr_init@plt>:
    1360:	f3 0f 1e fa          	endbr64
    1364:	ff 25 fe 3b 00 00    	jmp    *0x3bfe(%rip)        # 4f68 <pthread_barrierattr_init@GLIBC_2.34>
    136a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000001370 <pthread_cond_init@plt>:
    1370:	f3 0f 1e fa          	endbr64
    1374:	ff 25 f6 3b 00 00    	jmp    *0x3bf6(%rip)        # 4f70 <pthread_cond_init@GLIBC_2.3.2>
    137a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000001380 <pthread_mutex_unlock@plt>:
    1380:	f3 0f 1e fa          	endbr64
    1384:	ff 25 ee 3b 00 00    	jmp    *0x3bee(%rip)        # 4f78 <pthread_mutex_unlock@GLIBC_2.2.5>
    138a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000001390 <pthread_condattr_init@plt>:
    1390:	f3 0f 1e fa          	endbr64
    1394:	ff 25 e6 3b 00 00    	jmp    *0x3be6(%rip)        # 4f80 <pthread_condattr_init@GLIBC_2.2.5>
    139a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000013a0 <pthread_create@plt>:
    13a0:	f3 0f 1e fa          	endbr64
    13a4:	ff 25 de 3b 00 00    	jmp    *0x3bde(%rip)        # 4f88 <pthread_create@GLIBC_2.34>
    13aa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000013b0 <pthread_cond_timedwait@plt>:
    13b0:	f3 0f 1e fa          	endbr64
    13b4:	ff 25 d6 3b 00 00    	jmp    *0x3bd6(%rip)        # 4f90 <pthread_cond_timedwait@GLIBC_2.3.2>
    13ba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000013c0 <pthread_cond_destroy@plt>:
    13c0:	f3 0f 1e fa          	endbr64
    13c4:	ff 25 ce 3b 00 00    	jmp    *0x3bce(%rip)        # 4f98 <pthread_cond_destroy@GLIBC_2.3.2>
    13ca:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000013d0 <pthread_mutexattr_init@plt>:
    13d0:	f3 0f 1e fa          	endbr64
    13d4:	ff 25 c6 3b 00 00    	jmp    *0x3bc6(%rip)        # 4fa0 <pthread_mutexattr_init@GLIBC_2.34>
    13da:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000013e0 <pthread_join@plt>:
    13e0:	f3 0f 1e fa          	endbr64
    13e4:	ff 25 be 3b 00 00    	jmp    *0x3bbe(%rip)        # 4fa8 <pthread_join@GLIBC_2.34>
    13ea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000013f0 <strerror@plt>:
    13f0:	f3 0f 1e fa          	endbr64
    13f4:	ff 25 b6 3b 00 00    	jmp    *0x3bb6(%rip)        # 4fb0 <strerror@GLIBC_2.2.5>
    13fa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000001400 <pthread_mutex_init@plt>:
    1400:	f3 0f 1e fa          	endbr64
    1404:	ff 25 ae 3b 00 00    	jmp    *0x3bae(%rip)        # 4fb8 <pthread_mutex_init@GLIBC_2.2.5>
    140a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000001410 <pthread_mutexattr_destroy@plt>:
    1410:	f3 0f 1e fa          	endbr64
    1414:	ff 25 a6 3b 00 00    	jmp    *0x3ba6(%rip)        # 4fc0 <pthread_mutexattr_destroy@GLIBC_2.34>
    141a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000001420 <pthread_mutex_lock@plt>:
    1420:	f3 0f 1e fa          	endbr64
    1424:	ff 25 9e 3b 00 00    	jmp    *0x3b9e(%rip)        # 4fc8 <pthread_mutex_lock@GLIBC_2.2.5>
    142a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000001430 <usleep@plt>:
    1430:	f3 0f 1e fa          	endbr64
    1434:	ff 25 96 3b 00 00    	jmp    *0x3b96(%rip)        # 4fd0 <usleep@GLIBC_2.2.5>
    143a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

Disassembly of section .text:

0000000000001440 <_start>:
    1440:	f3 0f 1e fa          	endbr64
    1444:	31 ed                	xor    %ebp,%ebp
    1446:	49 89 d1             	mov    %rdx,%r9
    1449:	5e                   	pop    %rsi
    144a:	48 89 e2             	mov    %rsp,%rdx
    144d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    1451:	50                   	push   %rax
    1452:	54                   	push   %rsp
    1453:	45 31 c0             	xor    %r8d,%r8d
    1456:	31 c9                	xor    %ecx,%ecx
    1458:	48 8d 3d 40 18 00 00 	lea    0x1840(%rip),%rdi        # 2c9f <main>
    145f:	ff 15 73 3b 00 00    	call   *0x3b73(%rip)        # 4fd8 <__libc_start_main@GLIBC_2.34>
    1465:	f4                   	hlt
    1466:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    146d:	00 00 00 

0000000000001470 <deregister_tm_clones>:
    1470:	48 8d 3d 99 3b 00 00 	lea    0x3b99(%rip),%rdi        # 5010 <__TMC_END__>
    1477:	48 8d 05 92 3b 00 00 	lea    0x3b92(%rip),%rax        # 5010 <__TMC_END__>
    147e:	48 39 f8             	cmp    %rdi,%rax
    1481:	74 15                	je     1498 <deregister_tm_clones+0x28>
    1483:	48 8b 05 56 3b 00 00 	mov    0x3b56(%rip),%rax        # 4fe0 <_ITM_deregisterTMCloneTable@Base>
    148a:	48 85 c0             	test   %rax,%rax
    148d:	74 09                	je     1498 <deregister_tm_clones+0x28>
    148f:	ff e0                	jmp    *%rax
    1491:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1498:	c3                   	ret
    1499:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000014a0 <register_tm_clones>:
    14a0:	48 8d 3d 69 3b 00 00 	lea    0x3b69(%rip),%rdi        # 5010 <__TMC_END__>
    14a7:	48 8d 35 62 3b 00 00 	lea    0x3b62(%rip),%rsi        # 5010 <__TMC_END__>
    14ae:	48 29 fe             	sub    %rdi,%rsi
    14b1:	48 89 f0             	mov    %rsi,%rax
    14b4:	48 c1 ee 3f          	shr    $0x3f,%rsi
    14b8:	48 c1 f8 03          	sar    $0x3,%rax
    14bc:	48 01 c6             	add    %rax,%rsi
    14bf:	48 d1 fe             	sar    $1,%rsi
    14c2:	74 14                	je     14d8 <register_tm_clones+0x38>
    14c4:	48 8b 05 25 3b 00 00 	mov    0x3b25(%rip),%rax        # 4ff0 <_ITM_registerTMCloneTable@Base>
    14cb:	48 85 c0             	test   %rax,%rax
    14ce:	74 08                	je     14d8 <register_tm_clones+0x38>
    14d0:	ff e0                	jmp    *%rax
    14d2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    14d8:	c3                   	ret
    14d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000014e0 <__do_global_dtors_aux>:
    14e0:	f3 0f 1e fa          	endbr64
    14e4:	80 3d 3d 3b 00 00 00 	cmpb   $0x0,0x3b3d(%rip)        # 5028 <completed.0>
    14eb:	75 2b                	jne    1518 <__do_global_dtors_aux+0x38>
    14ed:	55                   	push   %rbp
    14ee:	48 83 3d 02 3b 00 00 	cmpq   $0x0,0x3b02(%rip)        # 4ff8 <__cxa_finalize@GLIBC_2.2.5>
    14f5:	00 
    14f6:	48 89 e5             	mov    %rsp,%rbp
    14f9:	74 0c                	je     1507 <__do_global_dtors_aux+0x27>
    14fb:	48 8b 3d 06 3b 00 00 	mov    0x3b06(%rip),%rdi        # 5008 <__dso_handle>
    1502:	e8 29 fd ff ff       	call   1230 <__cxa_finalize@plt>
    1507:	e8 64 ff ff ff       	call   1470 <deregister_tm_clones>
    150c:	c6 05 15 3b 00 00 01 	movb   $0x1,0x3b15(%rip)        # 5028 <completed.0>
    1513:	5d                   	pop    %rbp
    1514:	c3                   	ret
    1515:	0f 1f 00             	nopl   (%rax)
    1518:	c3                   	ret
    1519:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001520 <frame_dummy>:
    1520:	f3 0f 1e fa          	endbr64
    1524:	e9 77 ff ff ff       	jmp    14a0 <register_tm_clones>

0000000000001529 <_Z15increment_basicPv>:
    long thread_idx;
};

// Thread function for example_pthread_mutex
void* increment_basic(void* arg) 
{
    1529:	f3 0f 1e fa          	endbr64
    152d:	55                   	push   %rbp
    152e:	48 89 e5             	mov    %rsp,%rbp
    1531:	48 83 ec 20          	sub    $0x20,%rsp
    1535:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    // arg is a struct containing mutex, counter, and thread index
    struct mutex_data* data = (struct mutex_data*)arg;
    1539:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    153d:	48 89 45 f8          	mov    %rax,-0x8(%rbp)

    for (int i = 0; i < 5; i++) {
    1541:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
    1548:	e9 dd 00 00 00       	jmp    162a <_Z15increment_basicPv+0x101>
        int ret = pthread_mutex_lock(data->mutex);
    154d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1551:	48 8b 00             	mov    (%rax),%rax
    1554:	48 89 c7             	mov    %rax,%rdi
    1557:	e8 c4 fe ff ff       	call   1420 <pthread_mutex_lock@plt>
    155c:	89 45 f4             	mov    %eax,-0xc(%rbp)
        if (ret != 0) {
    155f:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
    1563:	74 35                	je     159a <_Z15increment_basicPv+0x71>
            fprintf(stderr, "increment_basic: pthread_mutex_lock failed: %s\n", strerror(ret));
    1565:	8b 45 f4             	mov    -0xc(%rbp),%eax
    1568:	89 c7                	mov    %eax,%edi
    156a:	e8 81 fe ff ff       	call   13f0 <strerror@plt>
    156f:	48 89 c2             	mov    %rax,%rdx
    1572:	48 8b 05 a7 3a 00 00 	mov    0x3aa7(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    1579:	48 8d 0d 88 1a 00 00 	lea    0x1a88(%rip),%rcx        # 3008 <_IO_stdin_used+0x8>
    1580:	48 89 ce             	mov    %rcx,%rsi
    1583:	48 89 c7             	mov    %rax,%rdi
    1586:	b8 00 00 00 00       	mov    $0x0,%eax
    158b:	e8 a0 fd ff ff       	call   1330 <fprintf@plt>
            return (void*)(intptr_t)ret;
    1590:	8b 45 f4             	mov    -0xc(%rbp),%eax
    1593:	48 98                	cltq
    1595:	e9 9f 00 00 00       	jmp    1639 <_Z15increment_basicPv+0x110>
        }
        (*data->counter)++;
    159a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    159e:	48 8b 40 08          	mov    0x8(%rax),%rax
    15a2:	8b 10                	mov    (%rax),%edx
    15a4:	83 c2 01             	add    $0x1,%edx
    15a7:	89 10                	mov    %edx,(%rax)
        printf("Basic Mutex: Thread %ld incremented counter to %d\n", data->thread_idx, *data->counter);
    15a9:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    15ad:	48 8b 40 08          	mov    0x8(%rax),%rax
    15b1:	8b 10                	mov    (%rax),%edx
    15b3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    15b7:	48 8b 40 10          	mov    0x10(%rax),%rax
    15bb:	48 89 c6             	mov    %rax,%rsi
    15be:	48 8d 05 73 1a 00 00 	lea    0x1a73(%rip),%rax        # 3038 <_IO_stdin_used+0x38>
    15c5:	48 89 c7             	mov    %rax,%rdi
    15c8:	b8 00 00 00 00       	mov    $0x0,%eax
    15cd:	e8 de fc ff ff       	call   12b0 <printf@plt>
        ret = pthread_mutex_unlock(data->mutex);
    15d2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    15d6:	48 8b 00             	mov    (%rax),%rax
    15d9:	48 89 c7             	mov    %rax,%rdi
    15dc:	e8 9f fd ff ff       	call   1380 <pthread_mutex_unlock@plt>
    15e1:	89 45 f4             	mov    %eax,-0xc(%rbp)
        if (ret != 0) {
    15e4:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
    15e8:	74 32                	je     161c <_Z15increment_basicPv+0xf3>
            fprintf(stderr, "increment_basic: pthread_mutex_unlock failed: %s\n", strerror(ret));
    15ea:	8b 45 f4             	mov    -0xc(%rbp),%eax
    15ed:	89 c7                	mov    %eax,%edi
    15ef:	e8 fc fd ff ff       	call   13f0 <strerror@plt>
    15f4:	48 89 c2             	mov    %rax,%rdx
    15f7:	48 8b 05 22 3a 00 00 	mov    0x3a22(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    15fe:	48 8d 0d 6b 1a 00 00 	lea    0x1a6b(%rip),%rcx        # 3070 <_IO_stdin_used+0x70>
    1605:	48 89 ce             	mov    %rcx,%rsi
    1608:	48 89 c7             	mov    %rax,%rdi
    160b:	b8 00 00 00 00       	mov    $0x0,%eax
    1610:	e8 1b fd ff ff       	call   1330 <fprintf@plt>
            return (void*)(intptr_t)ret;
    1615:	8b 45 f4             	mov    -0xc(%rbp),%eax
    1618:	48 98                	cltq
    161a:	eb 1d                	jmp    1639 <_Z15increment_basicPv+0x110>
        }
        usleep(100000); // Simulate delay
    161c:	bf a0 86 01 00       	mov    $0x186a0,%edi
    1621:	e8 0a fe ff ff       	call   1430 <usleep@plt>
    for (int i = 0; i < 5; i++) {
    1626:	83 45 f0 01          	addl   $0x1,-0x10(%rbp)
    162a:	83 7d f0 04          	cmpl   $0x4,-0x10(%rbp)
    162e:	0f 8e 19 ff ff ff    	jle    154d <_Z15increment_basicPv+0x24>
    }
    return NULL;
    1634:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1639:	c9                   	leave
    163a:	c3                   	ret

000000000000163b <_Z8producerPv>:
    int* buffer;
};

// Thread functions for example_pthread_condvar
void* producer(void* arg)
{
    163b:	f3 0f 1e fa          	endbr64
    163f:	55                   	push   %rbp
    1640:	48 89 e5             	mov    %rsp,%rbp
    1643:	48 83 ec 20          	sub    $0x20,%rsp
    1647:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    struct condvar_data* data = (struct condvar_data*)arg;
    164b:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    164f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)

    for (int i = 0; i < 4; i++) 
    1653:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    165a:	e9 93 00 00 00       	jmp    16f2 <_Z8producerPv+0xb7>
    {
        pthread_mutex_lock(data->mutex);
    165f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1663:	48 8b 00             	mov    (%rax),%rax
    1666:	48 89 c7             	mov    %rax,%rdi
    1669:	e8 b2 fd ff ff       	call   1420 <pthread_mutex_lock@plt>

        // 等待 consumer 消費完 (buffer == 0 才能生產)
        while (*(data->buffer) != 0) {
    166e:	eb 1a                	jmp    168a <_Z8producerPv+0x4f>
            pthread_cond_wait(data->cond, data->mutex);
    1670:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1674:	48 8b 10             	mov    (%rax),%rdx
    1677:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    167b:	48 8b 40 08          	mov    0x8(%rax),%rax
    167f:	48 89 d6             	mov    %rdx,%rsi
    1682:	48 89 c7             	mov    %rax,%rdi
    1685:	e8 06 fc ff ff       	call   1290 <pthread_cond_wait@plt>
        while (*(data->buffer) != 0) {
    168a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    168e:	48 8b 40 10          	mov    0x10(%rax),%rax
    1692:	8b 00                	mov    (%rax),%eax
    1694:	85 c0                	test   %eax,%eax
    1696:	75 d8                	jne    1670 <_Z8producerPv+0x35>
        }

        *(data->buffer) = 5 - 2*i;
    1698:	8b 45 f4             	mov    -0xc(%rbp),%eax
    169b:	8d 0c 00             	lea    (%rax,%rax,1),%ecx
    169e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    16a2:	48 8b 40 10          	mov    0x10(%rax),%rax
    16a6:	ba 05 00 00 00       	mov    $0x5,%edx
    16ab:	29 ca                	sub    %ecx,%edx
    16ad:	89 10                	mov    %edx,(%rax)
        printf("Producer: Produced %d\n", *(data->buffer));
    16af:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    16b3:	48 8b 40 10          	mov    0x10(%rax),%rax
    16b7:	8b 00                	mov    (%rax),%eax
    16b9:	89 c6                	mov    %eax,%esi
    16bb:	48 8d 05 e0 19 00 00 	lea    0x19e0(%rip),%rax        # 30a2 <_IO_stdin_used+0xa2>
    16c2:	48 89 c7             	mov    %rax,%rdi
    16c5:	b8 00 00 00 00       	mov    $0x0,%eax
    16ca:	e8 e1 fb ff ff       	call   12b0 <printf@plt>

        pthread_cond_signal(data->cond);  // 通知 consumer
    16cf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    16d3:	48 8b 40 08          	mov    0x8(%rax),%rax
    16d7:	48 89 c7             	mov    %rax,%rdi
    16da:	e8 31 fc ff ff       	call   1310 <pthread_cond_signal@plt>
        pthread_mutex_unlock(data->mutex);
    16df:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    16e3:	48 8b 00             	mov    (%rax),%rax
    16e6:	48 89 c7             	mov    %rax,%rdi
    16e9:	e8 92 fc ff ff       	call   1380 <pthread_mutex_unlock@plt>
    for (int i = 0; i < 4; i++) 
    16ee:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
    16f2:	83 7d f4 03          	cmpl   $0x3,-0xc(%rbp)
    16f6:	0f 8e 63 ff ff ff    	jle    165f <_Z8producerPv+0x24>
    }

    return NULL;
    16fc:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1701:	c9                   	leave
    1702:	c3                   	ret

0000000000001703 <_Z8consumerPv>:

void* consumer(void* arg) 
{
    1703:	f3 0f 1e fa          	endbr64
    1707:	55                   	push   %rbp
    1708:	48 89 e5             	mov    %rsp,%rbp
    170b:	48 83 ec 20          	sub    $0x20,%rsp
    170f:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    struct condvar_data* data = (struct condvar_data*)arg;
    1713:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1717:	48 89 45 f8          	mov    %rax,-0x8(%rbp)

    while (1) 
    {
        pthread_mutex_lock(data->mutex);
    171b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    171f:	48 8b 00             	mov    (%rax),%rax
    1722:	48 89 c7             	mov    %rax,%rdi
    1725:	e8 f6 fc ff ff       	call   1420 <pthread_mutex_lock@plt>

        // 等待 producer 生產 (buffer != 0 才能消費)
        while (*(data->buffer) == 0) {
    172a:	eb 1a                	jmp    1746 <_Z8consumerPv+0x43>
            pthread_cond_wait(data->cond, data->mutex);
    172c:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1730:	48 8b 10             	mov    (%rax),%rdx
    1733:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1737:	48 8b 40 08          	mov    0x8(%rax),%rax
    173b:	48 89 d6             	mov    %rdx,%rsi
    173e:	48 89 c7             	mov    %rax,%rdi
    1741:	e8 4a fb ff ff       	call   1290 <pthread_cond_wait@plt>
        while (*(data->buffer) == 0) {
    1746:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    174a:	48 8b 40 10          	mov    0x10(%rax),%rax
    174e:	8b 00                	mov    (%rax),%eax
    1750:	85 c0                	test   %eax,%eax
    1752:	74 d8                	je     172c <_Z8consumerPv+0x29>
        }

        if (*(data->buffer) == -1) {
    1754:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1758:	48 8b 40 10          	mov    0x10(%rax),%rax
    175c:	8b 00                	mov    (%rax),%eax
    175e:	83 f8 ff             	cmp    $0xffffffff,%eax
    1761:	75 30                	jne    1793 <_Z8consumerPv+0x90>
            printf("Consumer: End signal received\n");
    1763:	48 8d 05 4f 19 00 00 	lea    0x194f(%rip),%rax        # 30b9 <_IO_stdin_used+0xb9>
    176a:	48 89 c7             	mov    %rax,%rdi
    176d:	e8 ee fa ff ff       	call   1260 <puts@plt>
            pthread_cond_signal(data->cond); // 喚醒 producer 結束
    1772:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1776:	48 8b 40 08          	mov    0x8(%rax),%rax
    177a:	48 89 c7             	mov    %rax,%rdi
    177d:	e8 8e fb ff ff       	call   1310 <pthread_cond_signal@plt>
            pthread_mutex_unlock(data->mutex);
    1782:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1786:	48 8b 00             	mov    (%rax),%rax
    1789:	48 89 c7             	mov    %rax,%rdi
    178c:	e8 ef fb ff ff       	call   1380 <pthread_mutex_unlock@plt>
            break;
    1791:	eb 52                	jmp    17e5 <_Z8consumerPv+0xe2>
        }

        printf("Consumer: Consumed %d\n", *(data->buffer));
    1793:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1797:	48 8b 40 10          	mov    0x10(%rax),%rax
    179b:	8b 00                	mov    (%rax),%eax
    179d:	89 c6                	mov    %eax,%esi
    179f:	48 8d 05 31 19 00 00 	lea    0x1931(%rip),%rax        # 30d7 <_IO_stdin_used+0xd7>
    17a6:	48 89 c7             	mov    %rax,%rdi
    17a9:	b8 00 00 00 00       	mov    $0x0,%eax
    17ae:	e8 fd fa ff ff       	call   12b0 <printf@plt>
        *(data->buffer) = 0; // 清空 → 表示可以再生產
    17b3:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    17b7:	48 8b 40 10          	mov    0x10(%rax),%rax
    17bb:	c7 00 00 00 00 00    	movl   $0x0,(%rax)

        pthread_cond_signal(data->cond); // 通知 producer
    17c1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    17c5:	48 8b 40 08          	mov    0x8(%rax),%rax
    17c9:	48 89 c7             	mov    %rax,%rdi
    17cc:	e8 3f fb ff ff       	call   1310 <pthread_cond_signal@plt>
        pthread_mutex_unlock(data->mutex);
    17d1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    17d5:	48 8b 00             	mov    (%rax),%rax
    17d8:	48 89 c7             	mov    %rax,%rdi
    17db:	e8 a0 fb ff ff       	call   1380 <pthread_mutex_unlock@plt>
        pthread_mutex_lock(data->mutex);
    17e0:	e9 36 ff ff ff       	jmp    171b <_Z8consumerPv+0x18>
    }

    return NULL;
    17e5:	b8 00 00 00 00       	mov    $0x0,%eax
}
    17ea:	c9                   	leave
    17eb:	c3                   	ret

00000000000017ec <_Z6workerPv>:

// Thread function for example_pthread_barrier
void* worker(void* arg) 
{
    17ec:	f3 0f 1e fa          	endbr64
    17f0:	55                   	push   %rbp
    17f1:	48 89 e5             	mov    %rsp,%rbp
    17f4:	48 83 ec 20          	sub    $0x20,%rsp
    17f8:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    pthread_barrier_t* barrier = (pthread_barrier_t*)arg;
    17fc:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1800:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    printf("Worker %ld: Before barrier\n", (long)(intptr_t)arg);
    1804:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1808:	48 89 c6             	mov    %rax,%rsi
    180b:	48 8d 05 dc 18 00 00 	lea    0x18dc(%rip),%rax        # 30ee <_IO_stdin_used+0xee>
    1812:	48 89 c7             	mov    %rax,%rdi
    1815:	b8 00 00 00 00       	mov    $0x0,%eax
    181a:	e8 91 fa ff ff       	call   12b0 <printf@plt>
    int ret = pthread_barrier_wait(barrier);
    181f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1823:	48 89 c7             	mov    %rax,%rdi
    1826:	e8 45 fa ff ff       	call   1270 <pthread_barrier_wait@plt>
    182b:	89 45 f4             	mov    %eax,-0xc(%rbp)
    if (ret == PTHREAD_BARRIER_SERIAL_THREAD) {
    182e:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%rbp)
    1832:	75 1d                	jne    1851 <_Z6workerPv+0x65>
        printf("Worker %ld: Last to arrive, serial thread\n", (long)(intptr_t)arg);
    1834:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1838:	48 89 c6             	mov    %rax,%rsi
    183b:	48 8d 05 ce 18 00 00 	lea    0x18ce(%rip),%rax        # 3110 <_IO_stdin_used+0x110>
    1842:	48 89 c7             	mov    %rax,%rdi
    1845:	b8 00 00 00 00       	mov    $0x0,%eax
    184a:	e8 61 fa ff ff       	call   12b0 <printf@plt>
    184f:	eb 56                	jmp    18a7 <_Z6workerPv+0xbb>
    } else if (ret == 0) {
    1851:	83 7d f4 00          	cmpl   $0x0,-0xc(%rbp)
    1855:	75 1d                	jne    1874 <_Z6workerPv+0x88>
        printf("Worker %ld: Passed barrier\n", (long)(intptr_t)arg);
    1857:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    185b:	48 89 c6             	mov    %rax,%rsi
    185e:	48 8d 05 d6 18 00 00 	lea    0x18d6(%rip),%rax        # 313b <_IO_stdin_used+0x13b>
    1865:	48 89 c7             	mov    %rax,%rdi
    1868:	b8 00 00 00 00       	mov    $0x0,%eax
    186d:	e8 3e fa ff ff       	call   12b0 <printf@plt>
    1872:	eb 33                	jmp    18a7 <_Z6workerPv+0xbb>
    } else {
        fprintf(stderr, "Worker %ld: pthread_barrier_wait failed: %s\n", (long)(intptr_t)arg, strerror(ret));
    1874:	8b 45 f4             	mov    -0xc(%rbp),%eax
    1877:	89 c7                	mov    %eax,%edi
    1879:	e8 72 fb ff ff       	call   13f0 <strerror@plt>
    187e:	48 89 c1             	mov    %rax,%rcx
    1881:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
    1885:	48 8b 05 94 37 00 00 	mov    0x3794(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    188c:	48 8d 35 c5 18 00 00 	lea    0x18c5(%rip),%rsi        # 3158 <_IO_stdin_used+0x158>
    1893:	48 89 c7             	mov    %rax,%rdi
    1896:	b8 00 00 00 00       	mov    $0x0,%eax
    189b:	e8 90 fa ff ff       	call   1330 <fprintf@plt>
        return (void*)(intptr_t)ret;
    18a0:	8b 45 f4             	mov    -0xc(%rbp),%eax
    18a3:	48 98                	cltq
    18a5:	eb 05                	jmp    18ac <_Z6workerPv+0xc0>
    }
    return NULL;
    18a7:	b8 00 00 00 00       	mov    $0x0,%eax
}
    18ac:	c9                   	leave
    18ad:	c3                   	ret

00000000000018ae <_Z21example_pthread_mutexv>:

void example_pthread_mutex() 
{
    18ae:	f3 0f 1e fa          	endbr64
    18b2:	55                   	push   %rbp
    18b3:	48 89 e5             	mov    %rsp,%rbp
    18b6:	48 81 ec 60 01 00 00 	sub    $0x160,%rsp
    18bd:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    18c4:	00 00 
    18c6:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    18ca:	31 c0                	xor    %eax,%eax
    printf("=== Starting example_pthread_mutex ===\n");
    18cc:	48 8d 05 b5 18 00 00 	lea    0x18b5(%rip),%rax        # 3188 <_IO_stdin_used+0x188>
    18d3:	48 89 c7             	mov    %rax,%rdi
    18d6:	e8 85 f9 ff ff       	call   1260 <puts@plt>

    // Basic Mutex: Protect shared counter
    pthread_mutex_t basic_mutex = PTHREAD_MUTEX_INITIALIZER;
    18db:	66 0f ef c0          	pxor   %xmm0,%xmm0
    18df:	0f 29 85 00 ff ff ff 	movaps %xmm0,-0x100(%rbp)
    18e6:	0f 29 85 10 ff ff ff 	movaps %xmm0,-0xf0(%rbp)
    18ed:	66 0f d6 85 20 ff ff 	movq   %xmm0,-0xe0(%rbp)
    18f4:	ff 
    int shared_counter = 0;
    18f5:	c7 85 ac fe ff ff 00 	movl   $0x0,-0x154(%rbp)
    18fc:	00 00 00 
    constexpr long N = 2;
    18ff:	48 c7 85 c8 fe ff ff 	movq   $0x2,-0x138(%rbp)
    1906:	02 00 00 00 
    struct mutex_data data[N];
    pthread_t threads_basic[N];
    for (long i = 0; i < N; i++) {
    190a:	48 c7 85 c0 fe ff ff 	movq   $0x0,-0x140(%rbp)
    1911:	00 00 00 00 
    1915:	e9 01 01 00 00       	jmp    1a1b <_Z21example_pthread_mutexv+0x16d>
        data[i] = (struct mutex_data){&basic_mutex, &shared_counter, i};
    191a:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
    1921:	48 89 d0             	mov    %rdx,%rax
    1924:	48 01 c0             	add    %rax,%rax
    1927:	48 01 d0             	add    %rdx,%rax
    192a:	48 c1 e0 03          	shl    $0x3,%rax
    192e:	48 01 e8             	add    %rbp,%rax
    1931:	48 8d 50 c0          	lea    -0x40(%rax),%rdx
    1935:	48 8d 85 00 ff ff ff 	lea    -0x100(%rbp),%rax
    193c:	48 89 02             	mov    %rax,(%rdx)
    193f:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
    1946:	48 89 d0             	mov    %rdx,%rax
    1949:	48 01 c0             	add    %rax,%rax
    194c:	48 01 d0             	add    %rdx,%rax
    194f:	48 c1 e0 03          	shl    $0x3,%rax
    1953:	48 01 e8             	add    %rbp,%rax
    1956:	48 8d 50 c8          	lea    -0x38(%rax),%rdx
    195a:	48 8d 85 ac fe ff ff 	lea    -0x154(%rbp),%rax
    1961:	48 89 02             	mov    %rax,(%rdx)
    1964:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
    196b:	48 89 d0             	mov    %rdx,%rax
    196e:	48 01 c0             	add    %rax,%rax
    1971:	48 01 d0             	add    %rdx,%rax
    1974:	48 c1 e0 03          	shl    $0x3,%rax
    1978:	48 01 e8             	add    %rbp,%rax
    197b:	48 8d 50 d0          	lea    -0x30(%rax),%rdx
    197f:	48 8b 85 c0 fe ff ff 	mov    -0x140(%rbp),%rax
    1986:	48 89 02             	mov    %rax,(%rdx)
        int ret = pthread_create(&threads_basic[i], NULL, increment_basic, &data[i]);
    1989:	48 8d 4d c0          	lea    -0x40(%rbp),%rcx
    198d:	48 8b 95 c0 fe ff ff 	mov    -0x140(%rbp),%rdx
    1994:	48 89 d0             	mov    %rdx,%rax
    1997:	48 01 c0             	add    %rax,%rax
    199a:	48 01 d0             	add    %rdx,%rax
    199d:	48 c1 e0 03          	shl    $0x3,%rax
    19a1:	48 8d 14 01          	lea    (%rcx,%rax,1),%rdx
    19a5:	48 8d 85 f0 fe ff ff 	lea    -0x110(%rbp),%rax
    19ac:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
    19b3:	48 c1 e1 03          	shl    $0x3,%rcx
    19b7:	48 01 c8             	add    %rcx,%rax
    19ba:	48 89 d1             	mov    %rdx,%rcx
    19bd:	48 8d 15 65 fb ff ff 	lea    -0x49b(%rip),%rdx        # 1529 <_Z15increment_basicPv>
    19c4:	be 00 00 00 00       	mov    $0x0,%esi
    19c9:	48 89 c7             	mov    %rax,%rdi
    19cc:	e8 cf f9 ff ff       	call   13a0 <pthread_create@plt>
    19d1:	89 85 bc fe ff ff    	mov    %eax,-0x144(%rbp)
        if (ret != 0) {
    19d7:	83 bd bc fe ff ff 00 	cmpl   $0x0,-0x144(%rbp)
    19de:	74 33                	je     1a13 <_Z21example_pthread_mutexv+0x165>
            fprintf(stderr, "pthread_create failed: %s\n", strerror(ret));
    19e0:	8b 85 bc fe ff ff    	mov    -0x144(%rbp),%eax
    19e6:	89 c7                	mov    %eax,%edi
    19e8:	e8 03 fa ff ff       	call   13f0 <strerror@plt>
    19ed:	48 89 c2             	mov    %rax,%rdx
    19f0:	48 8b 05 29 36 00 00 	mov    0x3629(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    19f7:	48 8d 0d b1 17 00 00 	lea    0x17b1(%rip),%rcx        # 31af <_IO_stdin_used+0x1af>
    19fe:	48 89 ce             	mov    %rcx,%rsi
    1a01:	48 89 c7             	mov    %rax,%rdi
    1a04:	b8 00 00 00 00       	mov    $0x0,%eax
    1a09:	e8 22 f9 ff ff       	call   1330 <fprintf@plt>
            return;
    1a0e:	e9 46 08 00 00       	jmp    2259 <_Z21example_pthread_mutexv+0x9ab>
    for (long i = 0; i < N; i++) {
    1a13:	48 83 85 c0 fe ff ff 	addq   $0x1,-0x140(%rbp)
    1a1a:	01 
    1a1b:	48 83 bd c0 fe ff ff 	cmpq   $0x1,-0x140(%rbp)
    1a22:	01 
    1a23:	0f 8e f1 fe ff ff    	jle    191a <_Z21example_pthread_mutexv+0x6c>
        }
    }
    for (int i = 0; i < N; i++) {
    1a29:	c7 85 b0 fe ff ff 00 	movl   $0x0,-0x150(%rbp)
    1a30:	00 00 00 
    1a33:	e9 9f 00 00 00       	jmp    1ad7 <_Z21example_pthread_mutexv+0x229>
        void* retval;
        int ret = pthread_join(threads_basic[i], &retval);
    1a38:	8b 85 b0 fe ff ff    	mov    -0x150(%rbp),%eax
    1a3e:	48 98                	cltq
    1a40:	48 8b 84 c5 f0 fe ff 	mov    -0x110(%rbp,%rax,8),%rax
    1a47:	ff 
    1a48:	48 8d 95 d0 fe ff ff 	lea    -0x130(%rbp),%rdx
    1a4f:	48 89 d6             	mov    %rdx,%rsi
    1a52:	48 89 c7             	mov    %rax,%rdi
    1a55:	e8 86 f9 ff ff       	call   13e0 <pthread_join@plt>
    1a5a:	89 85 b8 fe ff ff    	mov    %eax,-0x148(%rbp)
        if (ret != 0) {
    1a60:	83 bd b8 fe ff ff 00 	cmpl   $0x0,-0x148(%rbp)
    1a67:	74 30                	je     1a99 <_Z21example_pthread_mutexv+0x1eb>
            fprintf(stderr, "pthread_join failed: %s\n", strerror(ret));
    1a69:	8b 85 b8 fe ff ff    	mov    -0x148(%rbp),%eax
    1a6f:	89 c7                	mov    %eax,%edi
    1a71:	e8 7a f9 ff ff       	call   13f0 <strerror@plt>
    1a76:	48 89 c2             	mov    %rax,%rdx
    1a79:	48 8b 05 a0 35 00 00 	mov    0x35a0(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    1a80:	48 8d 0d 43 17 00 00 	lea    0x1743(%rip),%rcx        # 31ca <_IO_stdin_used+0x1ca>
    1a87:	48 89 ce             	mov    %rcx,%rsi
    1a8a:	48 89 c7             	mov    %rax,%rdi
    1a8d:	b8 00 00 00 00       	mov    $0x0,%eax
    1a92:	e8 99 f8 ff ff       	call   1330 <fprintf@plt>
    1a97:	eb 37                	jmp    1ad0 <_Z21example_pthread_mutexv+0x222>
        } else if (retval != NULL) {
    1a99:	48 8b 85 d0 fe ff ff 	mov    -0x130(%rbp),%rax
    1aa0:	48 85 c0             	test   %rax,%rax
    1aa3:	74 2b                	je     1ad0 <_Z21example_pthread_mutexv+0x222>
            fprintf(stderr, "Thread %d returned error: %ld\n", i, (long)(intptr_t)retval);
    1aa5:	48 8b 85 d0 fe ff ff 	mov    -0x130(%rbp),%rax
    1aac:	48 89 c1             	mov    %rax,%rcx
    1aaf:	48 8b 05 6a 35 00 00 	mov    0x356a(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    1ab6:	8b 95 b0 fe ff ff    	mov    -0x150(%rbp),%edx
    1abc:	48 8d 35 25 17 00 00 	lea    0x1725(%rip),%rsi        # 31e8 <_IO_stdin_used+0x1e8>
    1ac3:	48 89 c7             	mov    %rax,%rdi
    1ac6:	b8 00 00 00 00       	mov    $0x0,%eax
    1acb:	e8 60 f8 ff ff       	call   1330 <fprintf@plt>
    for (int i = 0; i < N; i++) {
    1ad0:	83 85 b0 fe ff ff 01 	addl   $0x1,-0x150(%rbp)
    1ad7:	83 bd b0 fe ff ff 01 	cmpl   $0x1,-0x150(%rbp)
    1ade:	0f 8e 54 ff ff ff    	jle    1a38 <_Z21example_pthread_mutexv+0x18a>
        }
    }
    printf("Basic Mutex: Final counter = %d (expected %ld)\n", shared_counter, N * 5);
    1ae4:	8b 85 ac fe ff ff    	mov    -0x154(%rbp),%eax
    1aea:	ba 0a 00 00 00       	mov    $0xa,%edx
    1aef:	89 c6                	mov    %eax,%esi
    1af1:	48 8d 05 10 17 00 00 	lea    0x1710(%rip),%rax        # 3208 <_IO_stdin_used+0x208>
    1af8:	48 89 c7             	mov    %rax,%rdi
    1afb:	b8 00 00 00 00       	mov    $0x0,%eax
    1b00:	e8 ab f7 ff ff       	call   12b0 <printf@plt>

    // Mutex attribute: Errorcheck type
    pthread_mutexattr_t attr_errorcheck;
    int ret = pthread_mutexattr_init(&attr_errorcheck);
    1b05:	48 8d 85 e8 fe ff ff 	lea    -0x118(%rbp),%rax
    1b0c:	48 89 c7             	mov    %rax,%rdi
    1b0f:	e8 bc f8 ff ff       	call   13d0 <pthread_mutexattr_init@plt>
    1b14:	89 85 b4 fe ff ff    	mov    %eax,-0x14c(%rbp)
    if (ret != 0) {
    1b1a:	83 bd b4 fe ff ff 00 	cmpl   $0x0,-0x14c(%rbp)
    1b21:	74 33                	je     1b56 <_Z21example_pthread_mutexv+0x2a8>
        fprintf(stderr, "pthread_mutexattr_init failed: %s\n", strerror(ret));
    1b23:	8b 85 b4 fe ff ff    	mov    -0x14c(%rbp),%eax
    1b29:	89 c7                	mov    %eax,%edi
    1b2b:	e8 c0 f8 ff ff       	call   13f0 <strerror@plt>
    1b30:	48 89 c2             	mov    %rax,%rdx
    1b33:	48 8b 05 e6 34 00 00 	mov    0x34e6(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    1b3a:	48 8d 0d f7 16 00 00 	lea    0x16f7(%rip),%rcx        # 3238 <_IO_stdin_used+0x238>
    1b41:	48 89 ce             	mov    %rcx,%rsi
    1b44:	48 89 c7             	mov    %rax,%rdi
    1b47:	b8 00 00 00 00       	mov    $0x0,%eax
    1b4c:	e8 df f7 ff ff       	call   1330 <fprintf@plt>
        return;
    1b51:	e9 03 07 00 00       	jmp    2259 <_Z21example_pthread_mutexv+0x9ab>
    }
    ret = pthread_mutexattr_settype(&attr_errorcheck, PTHREAD_MUTEX_ERRORCHECK);
    1b56:	48 8d 85 e8 fe ff ff 	lea    -0x118(%rbp),%rax
    1b5d:	be 02 00 00 00       	mov    $0x2,%esi
    1b62:	48 89 c7             	mov    %rax,%rdi
    1b65:	e8 76 f7 ff ff       	call   12e0 <pthread_mutexattr_settype@plt>
    1b6a:	89 85 b4 fe ff ff    	mov    %eax,-0x14c(%rbp)
    if (ret != 0) {
    1b70:	83 bd b4 fe ff ff 00 	cmpl   $0x0,-0x14c(%rbp)
    1b77:	74 42                	je     1bbb <_Z21example_pthread_mutexv+0x30d>
        fprintf(stderr, "pthread_mutexattr_settype failed: %s\n", strerror(ret));
    1b79:	8b 85 b4 fe ff ff    	mov    -0x14c(%rbp),%eax
    1b7f:	89 c7                	mov    %eax,%edi
    1b81:	e8 6a f8 ff ff       	call   13f0 <strerror@plt>
    1b86:	48 89 c2             	mov    %rax,%rdx
    1b89:	48 8b 05 90 34 00 00 	mov    0x3490(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    1b90:	48 8d 0d c9 16 00 00 	lea    0x16c9(%rip),%rcx        # 3260 <_IO_stdin_used+0x260>
    1b97:	48 89 ce             	mov    %rcx,%rsi
    1b9a:	48 89 c7             	mov    %rax,%rdi
    1b9d:	b8 00 00 00 00       	mov    $0x0,%eax
    1ba2:	e8 89 f7 ff ff       	call   1330 <fprintf@plt>
        pthread_mutexattr_destroy(&attr_errorcheck);
    1ba7:	48 8d 85 e8 fe ff ff 	lea    -0x118(%rbp),%rax
    1bae:	48 89 c7             	mov    %rax,%rdi
    1bb1:	e8 5a f8 ff ff       	call   1410 <pthread_mutexattr_destroy@plt>
        return;
    1bb6:	e9 9e 06 00 00       	jmp    2259 <_Z21example_pthread_mutexv+0x9ab>
    }
    pthread_mutex_t errorcheck_mutex;
    ret = pthread_mutex_init(&errorcheck_mutex, &attr_errorcheck);
    1bbb:	48 8d 95 e8 fe ff ff 	lea    -0x118(%rbp),%rdx
    1bc2:	48 8d 85 30 ff ff ff 	lea    -0xd0(%rbp),%rax
    1bc9:	48 89 d6             	mov    %rdx,%rsi
    1bcc:	48 89 c7             	mov    %rax,%rdi
    1bcf:	e8 2c f8 ff ff       	call   1400 <pthread_mutex_init@plt>
    1bd4:	89 85 b4 fe ff ff    	mov    %eax,-0x14c(%rbp)
    if (ret != 0) {
    1bda:	83 bd b4 fe ff ff 00 	cmpl   $0x0,-0x14c(%rbp)
    1be1:	74 42                	je     1c25 <_Z21example_pthread_mutexv+0x377>
        fprintf(stderr, "pthread_mutex_init failed: %s\n", strerror(ret));
    1be3:	8b 85 b4 fe ff ff    	mov    -0x14c(%rbp),%eax
    1be9:	89 c7                	mov    %eax,%edi
    1beb:	e8 00 f8 ff ff       	call   13f0 <strerror@plt>
    1bf0:	48 89 c2             	mov    %rax,%rdx
    1bf3:	48 8b 05 26 34 00 00 	mov    0x3426(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    1bfa:	48 8d 0d 87 16 00 00 	lea    0x1687(%rip),%rcx        # 3288 <_IO_stdin_used+0x288>
    1c01:	48 89 ce             	mov    %rcx,%rsi
    1c04:	48 89 c7             	mov    %rax,%rdi
    1c07:	b8 00 00 00 00       	mov    $0x0,%eax
    1c0c:	e8 1f f7 ff ff       	call   1330 <fprintf@plt>
        pthread_mutexattr_destroy(&attr_errorcheck);
    1c11:	48 8d 85 e8 fe ff ff 	lea    -0x118(%rbp),%rax
    1c18:	48 89 c7             	mov    %rax,%rdi
    1c1b:	e8 f0 f7 ff ff       	call   1410 <pthread_mutexattr_destroy@plt>
        return;
    1c20:	e9 34 06 00 00       	jmp    2259 <_Z21example_pthread_mutexv+0x9ab>
    }

    // Try unlock by non-owner (should error)
    ret = pthread_mutex_unlock(&errorcheck_mutex);
    1c25:	48 8d 85 30 ff ff ff 	lea    -0xd0(%rbp),%rax
    1c2c:	48 89 c7             	mov    %rax,%rdi
    1c2f:	e8 4c f7 ff ff       	call   1380 <pthread_mutex_unlock@plt>
    1c34:	89 85 b4 fe ff ff    	mov    %eax,-0x14c(%rbp)
    if (ret == EPERM) {
    1c3a:	83 bd b4 fe ff ff 01 	cmpl   $0x1,-0x14c(%rbp)
    1c41:	75 11                	jne    1c54 <_Z21example_pthread_mutexv+0x3a6>
        printf("Errorcheck Mutex: Correctly detected non-owner unlock (EPERM)\n");
    1c43:	48 8d 05 5e 16 00 00 	lea    0x165e(%rip),%rax        # 32a8 <_IO_stdin_used+0x2a8>
    1c4a:	48 89 c7             	mov    %rax,%rdi
    1c4d:	e8 0e f6 ff ff       	call   1260 <puts@plt>
    1c52:	eb 37                	jmp    1c8b <_Z21example_pthread_mutexv+0x3dd>
    } else if (ret != 0) {
    1c54:	83 bd b4 fe ff ff 00 	cmpl   $0x0,-0x14c(%rbp)
    1c5b:	74 2e                	je     1c8b <_Z21example_pthread_mutexv+0x3dd>
        fprintf(stderr, "pthread_mutex_unlock failed: %s\n", strerror(ret));
    1c5d:	8b 85 b4 fe ff ff    	mov    -0x14c(%rbp),%eax
    1c63:	89 c7                	mov    %eax,%edi
    1c65:	e8 86 f7 ff ff       	call   13f0 <strerror@plt>
    1c6a:	48 89 c2             	mov    %rax,%rdx
    1c6d:	48 8b 05 ac 33 00 00 	mov    0x33ac(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    1c74:	48 8d 0d 6d 16 00 00 	lea    0x166d(%rip),%rcx        # 32e8 <_IO_stdin_used+0x2e8>
    1c7b:	48 89 ce             	mov    %rcx,%rsi
    1c7e:	48 89 c7             	mov    %rax,%rdi
    1c81:	b8 00 00 00 00       	mov    $0x0,%eax
    1c86:	e8 a5 f6 ff ff       	call   1330 <fprintf@plt>
    }

    ret = pthread_mutex_lock(&errorcheck_mutex);
    1c8b:	48 8d 85 30 ff ff ff 	lea    -0xd0(%rbp),%rax
    1c92:	48 89 c7             	mov    %rax,%rdi
    1c95:	e8 86 f7 ff ff       	call   1420 <pthread_mutex_lock@plt>
    1c9a:	89 85 b4 fe ff ff    	mov    %eax,-0x14c(%rbp)
    if (ret != 0) {
    1ca0:	83 bd b4 fe ff ff 00 	cmpl   $0x0,-0x14c(%rbp)
    1ca7:	74 30                	je     1cd9 <_Z21example_pthread_mutexv+0x42b>
        fprintf(stderr, "pthread_mutex_lock failed: %s\n", strerror(ret));
    1ca9:	8b 85 b4 fe ff ff    	mov    -0x14c(%rbp),%eax
    1caf:	89 c7                	mov    %eax,%edi
    1cb1:	e8 3a f7 ff ff       	call   13f0 <strerror@plt>
    1cb6:	48 89 c2             	mov    %rax,%rdx
    1cb9:	48 8b 05 60 33 00 00 	mov    0x3360(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    1cc0:	48 8d 0d 49 16 00 00 	lea    0x1649(%rip),%rcx        # 3310 <_IO_stdin_used+0x310>
    1cc7:	48 89 ce             	mov    %rcx,%rsi
    1cca:	48 89 c7             	mov    %rax,%rdi
    1ccd:	b8 00 00 00 00       	mov    $0x0,%eax
    1cd2:	e8 59 f6 ff ff       	call   1330 <fprintf@plt>
    1cd7:	eb 5b                	jmp    1d34 <_Z21example_pthread_mutexv+0x486>
    } else {
        printf("Errorcheck Mutex: Locked successfully\n");
    1cd9:	48 8d 05 50 16 00 00 	lea    0x1650(%rip),%rax        # 3330 <_IO_stdin_used+0x330>
    1ce0:	48 89 c7             	mov    %rax,%rdi
    1ce3:	e8 78 f5 ff ff       	call   1260 <puts@plt>
        ret = pthread_mutex_unlock(&errorcheck_mutex);
    1ce8:	48 8d 85 30 ff ff ff 	lea    -0xd0(%rbp),%rax
    1cef:	48 89 c7             	mov    %rax,%rdi
    1cf2:	e8 89 f6 ff ff       	call   1380 <pthread_mutex_unlock@plt>
    1cf7:	89 85 b4 fe ff ff    	mov    %eax,-0x14c(%rbp)
        if (ret != 0) {
    1cfd:	83 bd b4 fe ff ff 00 	cmpl   $0x0,-0x14c(%rbp)
    1d04:	74 2e                	je     1d34 <_Z21example_pthread_mutexv+0x486>
            fprintf(stderr, "pthread_mutex_unlock failed: %s\n", strerror(ret));
    1d06:	8b 85 b4 fe ff ff    	mov    -0x14c(%rbp),%eax
    1d0c:	89 c7                	mov    %eax,%edi
    1d0e:	e8 dd f6 ff ff       	call   13f0 <strerror@plt>
    1d13:	48 89 c2             	mov    %rax,%rdx
    1d16:	48 8b 05 03 33 00 00 	mov    0x3303(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    1d1d:	48 8d 0d c4 15 00 00 	lea    0x15c4(%rip),%rcx        # 32e8 <_IO_stdin_used+0x2e8>
    1d24:	48 89 ce             	mov    %rcx,%rsi
    1d27:	48 89 c7             	mov    %rax,%rdi
    1d2a:	b8 00 00 00 00       	mov    $0x0,%eax
    1d2f:	e8 fc f5 ff ff       	call   1330 <fprintf@plt>
        }
    }
    ret = pthread_mutex_destroy(&errorcheck_mutex);
    1d34:	48 8d 85 30 ff ff ff 	lea    -0xd0(%rbp),%rax
    1d3b:	48 89 c7             	mov    %rax,%rdi
    1d3e:	e8 8d f5 ff ff       	call   12d0 <pthread_mutex_destroy@plt>
    1d43:	89 85 b4 fe ff ff    	mov    %eax,-0x14c(%rbp)
    if (ret != 0) {
    1d49:	83 bd b4 fe ff ff 00 	cmpl   $0x0,-0x14c(%rbp)
    1d50:	74 2e                	je     1d80 <_Z21example_pthread_mutexv+0x4d2>
        fprintf(stderr, "pthread_mutex_destroy failed: %s\n", strerror(ret));
    1d52:	8b 85 b4 fe ff ff    	mov    -0x14c(%rbp),%eax
    1d58:	89 c7                	mov    %eax,%edi
    1d5a:	e8 91 f6 ff ff       	call   13f0 <strerror@plt>
    1d5f:	48 89 c2             	mov    %rax,%rdx
    1d62:	48 8b 05 b7 32 00 00 	mov    0x32b7(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    1d69:	48 8d 0d e8 15 00 00 	lea    0x15e8(%rip),%rcx        # 3358 <_IO_stdin_used+0x358>
    1d70:	48 89 ce             	mov    %rcx,%rsi
    1d73:	48 89 c7             	mov    %rax,%rdi
    1d76:	b8 00 00 00 00       	mov    $0x0,%eax
    1d7b:	e8 b0 f5 ff ff       	call   1330 <fprintf@plt>
    }
    ret = pthread_mutexattr_destroy(&attr_errorcheck);
    1d80:	48 8d 85 e8 fe ff ff 	lea    -0x118(%rbp),%rax
    1d87:	48 89 c7             	mov    %rax,%rdi
    1d8a:	e8 81 f6 ff ff       	call   1410 <pthread_mutexattr_destroy@plt>
    1d8f:	89 85 b4 fe ff ff    	mov    %eax,-0x14c(%rbp)
    if (ret != 0) {
    1d95:	83 bd b4 fe ff ff 00 	cmpl   $0x0,-0x14c(%rbp)
    1d9c:	74 2e                	je     1dcc <_Z21example_pthread_mutexv+0x51e>
        fprintf(stderr, "pthread_mutexattr_destroy failed: %s\n", strerror(ret));
    1d9e:	8b 85 b4 fe ff ff    	mov    -0x14c(%rbp),%eax
    1da4:	89 c7                	mov    %eax,%edi
    1da6:	e8 45 f6 ff ff       	call   13f0 <strerror@plt>
    1dab:	48 89 c2             	mov    %rax,%rdx
    1dae:	48 8b 05 6b 32 00 00 	mov    0x326b(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    1db5:	48 8d 0d c4 15 00 00 	lea    0x15c4(%rip),%rcx        # 3380 <_IO_stdin_used+0x380>
    1dbc:	48 89 ce             	mov    %rcx,%rsi
    1dbf:	48 89 c7             	mov    %rax,%rdi
    1dc2:	b8 00 00 00 00       	mov    $0x0,%eax
    1dc7:	e8 64 f5 ff ff       	call   1330 <fprintf@plt>
    }

    // Recursive Mutex
    pthread_mutexattr_t attr_recursive;
    ret = pthread_mutexattr_init(&attr_recursive);
    1dcc:	48 8d 85 ec fe ff ff 	lea    -0x114(%rbp),%rax
    1dd3:	48 89 c7             	mov    %rax,%rdi
    1dd6:	e8 f5 f5 ff ff       	call   13d0 <pthread_mutexattr_init@plt>
    1ddb:	89 85 b4 fe ff ff    	mov    %eax,-0x14c(%rbp)
    if (ret != 0) {
    1de1:	83 bd b4 fe ff ff 00 	cmpl   $0x0,-0x14c(%rbp)
    1de8:	74 33                	je     1e1d <_Z21example_pthread_mutexv+0x56f>
        fprintf(stderr, "pthread_mutexattr_init failed: %s\n", strerror(ret));
    1dea:	8b 85 b4 fe ff ff    	mov    -0x14c(%rbp),%eax
    1df0:	89 c7                	mov    %eax,%edi
    1df2:	e8 f9 f5 ff ff       	call   13f0 <strerror@plt>
    1df7:	48 89 c2             	mov    %rax,%rdx
    1dfa:	48 8b 05 1f 32 00 00 	mov    0x321f(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    1e01:	48 8d 0d 30 14 00 00 	lea    0x1430(%rip),%rcx        # 3238 <_IO_stdin_used+0x238>
    1e08:	48 89 ce             	mov    %rcx,%rsi
    1e0b:	48 89 c7             	mov    %rax,%rdi
    1e0e:	b8 00 00 00 00       	mov    $0x0,%eax
    1e13:	e8 18 f5 ff ff       	call   1330 <fprintf@plt>
        return;
    1e18:	e9 3c 04 00 00       	jmp    2259 <_Z21example_pthread_mutexv+0x9ab>
    }
    ret = pthread_mutexattr_settype(&attr_recursive, PTHREAD_MUTEX_RECURSIVE);
    1e1d:	48 8d 85 ec fe ff ff 	lea    -0x114(%rbp),%rax
    1e24:	be 01 00 00 00       	mov    $0x1,%esi
    1e29:	48 89 c7             	mov    %rax,%rdi
    1e2c:	e8 af f4 ff ff       	call   12e0 <pthread_mutexattr_settype@plt>
    1e31:	89 85 b4 fe ff ff    	mov    %eax,-0x14c(%rbp)
    if (ret != 0) {
    1e37:	83 bd b4 fe ff ff 00 	cmpl   $0x0,-0x14c(%rbp)
    1e3e:	74 42                	je     1e82 <_Z21example_pthread_mutexv+0x5d4>
        fprintf(stderr, "pthread_mutexattr_settype failed: %s\n", strerror(ret));
    1e40:	8b 85 b4 fe ff ff    	mov    -0x14c(%rbp),%eax
    1e46:	89 c7                	mov    %eax,%edi
    1e48:	e8 a3 f5 ff ff       	call   13f0 <strerror@plt>
    1e4d:	48 89 c2             	mov    %rax,%rdx
    1e50:	48 8b 05 c9 31 00 00 	mov    0x31c9(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    1e57:	48 8d 0d 02 14 00 00 	lea    0x1402(%rip),%rcx        # 3260 <_IO_stdin_used+0x260>
    1e5e:	48 89 ce             	mov    %rcx,%rsi
    1e61:	48 89 c7             	mov    %rax,%rdi
    1e64:	b8 00 00 00 00       	mov    $0x0,%eax
    1e69:	e8 c2 f4 ff ff       	call   1330 <fprintf@plt>
        pthread_mutexattr_destroy(&attr_recursive);
    1e6e:	48 8d 85 ec fe ff ff 	lea    -0x114(%rbp),%rax
    1e75:	48 89 c7             	mov    %rax,%rdi
    1e78:	e8 93 f5 ff ff       	call   1410 <pthread_mutexattr_destroy@plt>
        return;
    1e7d:	e9 d7 03 00 00       	jmp    2259 <_Z21example_pthread_mutexv+0x9ab>
    }
    pthread_mutex_t recursive_mutex;
    ret = pthread_mutex_init(&recursive_mutex, &attr_recursive);
    1e82:	48 8d 95 ec fe ff ff 	lea    -0x114(%rbp),%rdx
    1e89:	48 8d 85 60 ff ff ff 	lea    -0xa0(%rbp),%rax
    1e90:	48 89 d6             	mov    %rdx,%rsi
    1e93:	48 89 c7             	mov    %rax,%rdi
    1e96:	e8 65 f5 ff ff       	call   1400 <pthread_mutex_init@plt>
    1e9b:	89 85 b4 fe ff ff    	mov    %eax,-0x14c(%rbp)
    if (ret != 0) {
    1ea1:	83 bd b4 fe ff ff 00 	cmpl   $0x0,-0x14c(%rbp)
    1ea8:	74 42                	je     1eec <_Z21example_pthread_mutexv+0x63e>
        fprintf(stderr, "pthread_mutex_init failed: %s\n", strerror(ret));
    1eaa:	8b 85 b4 fe ff ff    	mov    -0x14c(%rbp),%eax
    1eb0:	89 c7                	mov    %eax,%edi
    1eb2:	e8 39 f5 ff ff       	call   13f0 <strerror@plt>
    1eb7:	48 89 c2             	mov    %rax,%rdx
    1eba:	48 8b 05 5f 31 00 00 	mov    0x315f(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    1ec1:	48 8d 0d c0 13 00 00 	lea    0x13c0(%rip),%rcx        # 3288 <_IO_stdin_used+0x288>
    1ec8:	48 89 ce             	mov    %rcx,%rsi
    1ecb:	48 89 c7             	mov    %rax,%rdi
    1ece:	b8 00 00 00 00       	mov    $0x0,%eax
    1ed3:	e8 58 f4 ff ff       	call   1330 <fprintf@plt>
        pthread_mutexattr_destroy(&attr_recursive);
    1ed8:	48 8d 85 ec fe ff ff 	lea    -0x114(%rbp),%rax
    1edf:	48 89 c7             	mov    %rax,%rdi
    1ee2:	e8 29 f5 ff ff       	call   1410 <pthread_mutexattr_destroy@plt>
        return;
    1ee7:	e9 6d 03 00 00       	jmp    2259 <_Z21example_pthread_mutexv+0x9ab>
    }

    ret = pthread_mutex_lock(&recursive_mutex);
    1eec:	48 8d 85 60 ff ff ff 	lea    -0xa0(%rbp),%rax
    1ef3:	48 89 c7             	mov    %rax,%rdi
    1ef6:	e8 25 f5 ff ff       	call   1420 <pthread_mutex_lock@plt>
    1efb:	89 85 b4 fe ff ff    	mov    %eax,-0x14c(%rbp)
    if (ret != 0) {
    1f01:	83 bd b4 fe ff ff 00 	cmpl   $0x0,-0x14c(%rbp)
    1f08:	74 2e                	je     1f38 <_Z21example_pthread_mutexv+0x68a>
        fprintf(stderr, "pthread_mutex_lock failed: %s\n", strerror(ret));
    1f0a:	8b 85 b4 fe ff ff    	mov    -0x14c(%rbp),%eax
    1f10:	89 c7                	mov    %eax,%edi
    1f12:	e8 d9 f4 ff ff       	call   13f0 <strerror@plt>
    1f17:	48 89 c2             	mov    %rax,%rdx
    1f1a:	48 8b 05 ff 30 00 00 	mov    0x30ff(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    1f21:	48 8d 0d e8 13 00 00 	lea    0x13e8(%rip),%rcx        # 3310 <_IO_stdin_used+0x310>
    1f28:	48 89 ce             	mov    %rcx,%rsi
    1f2b:	48 89 c7             	mov    %rax,%rdi
    1f2e:	b8 00 00 00 00       	mov    $0x0,%eax
    1f33:	e8 f8 f3 ff ff       	call   1330 <fprintf@plt>
    }
    ret = pthread_mutex_lock(&recursive_mutex); // Recursive, no deadlock
    1f38:	48 8d 85 60 ff ff ff 	lea    -0xa0(%rbp),%rax
    1f3f:	48 89 c7             	mov    %rax,%rdi
    1f42:	e8 d9 f4 ff ff       	call   1420 <pthread_mutex_lock@plt>
    1f47:	89 85 b4 fe ff ff    	mov    %eax,-0x14c(%rbp)
    if (ret != 0) {
    1f4d:	83 bd b4 fe ff ff 00 	cmpl   $0x0,-0x14c(%rbp)
    1f54:	74 30                	je     1f86 <_Z21example_pthread_mutexv+0x6d8>
        fprintf(stderr, "pthread_mutex_lock failed: %s\n", strerror(ret));
    1f56:	8b 85 b4 fe ff ff    	mov    -0x14c(%rbp),%eax
    1f5c:	89 c7                	mov    %eax,%edi
    1f5e:	e8 8d f4 ff ff       	call   13f0 <strerror@plt>
    1f63:	48 89 c2             	mov    %rax,%rdx
    1f66:	48 8b 05 b3 30 00 00 	mov    0x30b3(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    1f6d:	48 8d 0d 9c 13 00 00 	lea    0x139c(%rip),%rcx        # 3310 <_IO_stdin_used+0x310>
    1f74:	48 89 ce             	mov    %rcx,%rsi
    1f77:	48 89 c7             	mov    %rax,%rdi
    1f7a:	b8 00 00 00 00       	mov    $0x0,%eax
    1f7f:	e8 ac f3 ff ff       	call   1330 <fprintf@plt>
    1f84:	eb 2d                	jmp    1fb3 <_Z21example_pthread_mutexv+0x705>
    } else {
        printf("Recursive Mutex: Locked twice by same thread\n");
    1f86:	48 8d 05 1b 14 00 00 	lea    0x141b(%rip),%rax        # 33a8 <_IO_stdin_used+0x3a8>
    1f8d:	48 89 c7             	mov    %rax,%rdi
    1f90:	e8 cb f2 ff ff       	call   1260 <puts@plt>
        pthread_mutex_unlock(&recursive_mutex);
    1f95:	48 8d 85 60 ff ff ff 	lea    -0xa0(%rbp),%rax
    1f9c:	48 89 c7             	mov    %rax,%rdi
    1f9f:	e8 dc f3 ff ff       	call   1380 <pthread_mutex_unlock@plt>
        pthread_mutex_unlock(&recursive_mutex);
    1fa4:	48 8d 85 60 ff ff ff 	lea    -0xa0(%rbp),%rax
    1fab:	48 89 c7             	mov    %rax,%rdi
    1fae:	e8 cd f3 ff ff       	call   1380 <pthread_mutex_unlock@plt>
    }
    ret = pthread_mutex_destroy(&recursive_mutex);
    1fb3:	48 8d 85 60 ff ff ff 	lea    -0xa0(%rbp),%rax
    1fba:	48 89 c7             	mov    %rax,%rdi
    1fbd:	e8 0e f3 ff ff       	call   12d0 <pthread_mutex_destroy@plt>
    1fc2:	89 85 b4 fe ff ff    	mov    %eax,-0x14c(%rbp)
    if (ret != 0) {
    1fc8:	83 bd b4 fe ff ff 00 	cmpl   $0x0,-0x14c(%rbp)
    1fcf:	74 2e                	je     1fff <_Z21example_pthread_mutexv+0x751>
        fprintf(stderr, "pthread_mutex_destroy failed: %s\n", strerror(ret));
    1fd1:	8b 85 b4 fe ff ff    	mov    -0x14c(%rbp),%eax
    1fd7:	89 c7                	mov    %eax,%edi
    1fd9:	e8 12 f4 ff ff       	call   13f0 <strerror@plt>
    1fde:	48 89 c2             	mov    %rax,%rdx
    1fe1:	48 8b 05 38 30 00 00 	mov    0x3038(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    1fe8:	48 8d 0d 69 13 00 00 	lea    0x1369(%rip),%rcx        # 3358 <_IO_stdin_used+0x358>
    1fef:	48 89 ce             	mov    %rcx,%rsi
    1ff2:	48 89 c7             	mov    %rax,%rdi
    1ff5:	b8 00 00 00 00       	mov    $0x0,%eax
    1ffa:	e8 31 f3 ff ff       	call   1330 <fprintf@plt>
    }
    ret = pthread_mutexattr_destroy(&attr_recursive);
    1fff:	48 8d 85 ec fe ff ff 	lea    -0x114(%rbp),%rax
    2006:	48 89 c7             	mov    %rax,%rdi
    2009:	e8 02 f4 ff ff       	call   1410 <pthread_mutexattr_destroy@plt>
    200e:	89 85 b4 fe ff ff    	mov    %eax,-0x14c(%rbp)
    if (ret != 0) {
    2014:	83 bd b4 fe ff ff 00 	cmpl   $0x0,-0x14c(%rbp)
    201b:	74 2e                	je     204b <_Z21example_pthread_mutexv+0x79d>
        fprintf(stderr, "pthread_mutexattr_destroy failed: %s\n", strerror(ret));
    201d:	8b 85 b4 fe ff ff    	mov    -0x14c(%rbp),%eax
    2023:	89 c7                	mov    %eax,%edi
    2025:	e8 c6 f3 ff ff       	call   13f0 <strerror@plt>
    202a:	48 89 c2             	mov    %rax,%rdx
    202d:	48 8b 05 ec 2f 00 00 	mov    0x2fec(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    2034:	48 8d 0d 45 13 00 00 	lea    0x1345(%rip),%rcx        # 3380 <_IO_stdin_used+0x380>
    203b:	48 89 ce             	mov    %rcx,%rsi
    203e:	48 89 c7             	mov    %rax,%rdi
    2041:	b8 00 00 00 00       	mov    $0x0,%eax
    2046:	e8 e5 f2 ff ff       	call   1330 <fprintf@plt>
    }

    // Timedlock
    pthread_mutex_t timed_mutex = PTHREAD_MUTEX_INITIALIZER;
    204b:	66 0f ef c0          	pxor   %xmm0,%xmm0
    204f:	0f 29 45 90          	movaps %xmm0,-0x70(%rbp)
    2053:	0f 29 45 a0          	movaps %xmm0,-0x60(%rbp)
    2057:	66 0f d6 45 b0       	movq   %xmm0,-0x50(%rbp)
    ret = pthread_mutex_lock(&timed_mutex);
    205c:	48 8d 45 90          	lea    -0x70(%rbp),%rax
    2060:	48 89 c7             	mov    %rax,%rdi
    2063:	e8 b8 f3 ff ff       	call   1420 <pthread_mutex_lock@plt>
    2068:	89 85 b4 fe ff ff    	mov    %eax,-0x14c(%rbp)
    if (ret != 0) {
    206e:	83 bd b4 fe ff ff 00 	cmpl   $0x0,-0x14c(%rbp)
    2075:	74 2e                	je     20a5 <_Z21example_pthread_mutexv+0x7f7>
        fprintf(stderr, "pthread_mutex_lock failed: %s\n", strerror(ret));
    2077:	8b 85 b4 fe ff ff    	mov    -0x14c(%rbp),%eax
    207d:	89 c7                	mov    %eax,%edi
    207f:	e8 6c f3 ff ff       	call   13f0 <strerror@plt>
    2084:	48 89 c2             	mov    %rax,%rdx
    2087:	48 8b 05 92 2f 00 00 	mov    0x2f92(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    208e:	48 8d 0d 7b 12 00 00 	lea    0x127b(%rip),%rcx        # 3310 <_IO_stdin_used+0x310>
    2095:	48 89 ce             	mov    %rcx,%rsi
    2098:	48 89 c7             	mov    %rax,%rdi
    209b:	b8 00 00 00 00       	mov    $0x0,%eax
    20a0:	e8 8b f2 ff ff       	call   1330 <fprintf@plt>
    }
    struct timespec ts;
    clock_gettime(CLOCK_REALTIME, &ts);
    20a5:	48 8d 85 d0 fe ff ff 	lea    -0x130(%rbp),%rax
    20ac:	48 89 c6             	mov    %rax,%rsi
    20af:	bf 00 00 00 00       	mov    $0x0,%edi
    20b4:	e8 c7 f1 ff ff       	call   1280 <clock_gettime@plt>
    ts.tv_sec += 1;
    20b9:	48 8b 85 d0 fe ff ff 	mov    -0x130(%rbp),%rax
    20c0:	48 83 c0 01          	add    $0x1,%rax
    20c4:	48 89 85 d0 fe ff ff 	mov    %rax,-0x130(%rbp)
    ret = pthread_mutex_timedlock(&timed_mutex, &ts);
    20cb:	48 8d 95 d0 fe ff ff 	lea    -0x130(%rbp),%rdx
    20d2:	48 8d 45 90          	lea    -0x70(%rbp),%rax
    20d6:	48 89 d6             	mov    %rdx,%rsi
    20d9:	48 89 c7             	mov    %rax,%rdi
    20dc:	e8 5f f2 ff ff       	call   1340 <pthread_mutex_timedlock@plt>
    20e1:	89 85 b4 fe ff ff    	mov    %eax,-0x14c(%rbp)
    if (ret == ETIMEDOUT) {
    20e7:	83 bd b4 fe ff ff 6e 	cmpl   $0x6e,-0x14c(%rbp)
    20ee:	75 11                	jne    2101 <_Z21example_pthread_mutexv+0x853>
        printf("Timed Mutex: Correctly timed out\n");
    20f0:	48 8d 05 e1 12 00 00 	lea    0x12e1(%rip),%rax        # 33d8 <_IO_stdin_used+0x3d8>
    20f7:	48 89 c7             	mov    %rax,%rdi
    20fa:	e8 61 f1 ff ff       	call   1260 <puts@plt>
    20ff:	eb 37                	jmp    2138 <_Z21example_pthread_mutexv+0x88a>
    } else if (ret != 0) {
    2101:	83 bd b4 fe ff ff 00 	cmpl   $0x0,-0x14c(%rbp)
    2108:	74 2e                	je     2138 <_Z21example_pthread_mutexv+0x88a>
        fprintf(stderr, "pthread_mutex_timedlock failed: %s\n", strerror(ret));
    210a:	8b 85 b4 fe ff ff    	mov    -0x14c(%rbp),%eax
    2110:	89 c7                	mov    %eax,%edi
    2112:	e8 d9 f2 ff ff       	call   13f0 <strerror@plt>
    2117:	48 89 c2             	mov    %rax,%rdx
    211a:	48 8b 05 ff 2e 00 00 	mov    0x2eff(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    2121:	48 8d 0d d8 12 00 00 	lea    0x12d8(%rip),%rcx        # 3400 <_IO_stdin_used+0x400>
    2128:	48 89 ce             	mov    %rcx,%rsi
    212b:	48 89 c7             	mov    %rax,%rdi
    212e:	b8 00 00 00 00       	mov    $0x0,%eax
    2133:	e8 f8 f1 ff ff       	call   1330 <fprintf@plt>
    }
    ret = pthread_mutex_unlock(&timed_mutex);
    2138:	48 8d 45 90          	lea    -0x70(%rbp),%rax
    213c:	48 89 c7             	mov    %rax,%rdi
    213f:	e8 3c f2 ff ff       	call   1380 <pthread_mutex_unlock@plt>
    2144:	89 85 b4 fe ff ff    	mov    %eax,-0x14c(%rbp)
    if (ret != 0) {
    214a:	83 bd b4 fe ff ff 00 	cmpl   $0x0,-0x14c(%rbp)
    2151:	74 2e                	je     2181 <_Z21example_pthread_mutexv+0x8d3>
        fprintf(stderr, "pthread_mutex_unlock failed: %s\n", strerror(ret));
    2153:	8b 85 b4 fe ff ff    	mov    -0x14c(%rbp),%eax
    2159:	89 c7                	mov    %eax,%edi
    215b:	e8 90 f2 ff ff       	call   13f0 <strerror@plt>
    2160:	48 89 c2             	mov    %rax,%rdx
    2163:	48 8b 05 b6 2e 00 00 	mov    0x2eb6(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    216a:	48 8d 0d 77 11 00 00 	lea    0x1177(%rip),%rcx        # 32e8 <_IO_stdin_used+0x2e8>
    2171:	48 89 ce             	mov    %rcx,%rsi
    2174:	48 89 c7             	mov    %rax,%rdi
    2177:	b8 00 00 00 00       	mov    $0x0,%eax
    217c:	e8 af f1 ff ff       	call   1330 <fprintf@plt>
    }

    // Trylock
    ret = pthread_mutex_trylock(&timed_mutex);
    2181:	48 8d 45 90          	lea    -0x70(%rbp),%rax
    2185:	48 89 c7             	mov    %rax,%rdi
    2188:	e8 73 f1 ff ff       	call   1300 <pthread_mutex_trylock@plt>
    218d:	89 85 b4 fe ff ff    	mov    %eax,-0x14c(%rbp)
    if (ret == 0) {
    2193:	83 bd b4 fe ff ff 00 	cmpl   $0x0,-0x14c(%rbp)
    219a:	75 1d                	jne    21b9 <_Z21example_pthread_mutexv+0x90b>
        printf("Trylock Mutex: Successfully locked\n");
    219c:	48 8d 05 85 12 00 00 	lea    0x1285(%rip),%rax        # 3428 <_IO_stdin_used+0x428>
    21a3:	48 89 c7             	mov    %rax,%rdi
    21a6:	e8 b5 f0 ff ff       	call   1260 <puts@plt>
        pthread_mutex_unlock(&timed_mutex);
    21ab:	48 8d 45 90          	lea    -0x70(%rbp),%rax
    21af:	48 89 c7             	mov    %rax,%rdi
    21b2:	e8 c9 f1 ff ff       	call   1380 <pthread_mutex_unlock@plt>
    21b7:	eb 48                	jmp    2201 <_Z21example_pthread_mutexv+0x953>
    } else if (ret == EBUSY) {
    21b9:	83 bd b4 fe ff ff 10 	cmpl   $0x10,-0x14c(%rbp)
    21c0:	75 11                	jne    21d3 <_Z21example_pthread_mutexv+0x925>
        printf("Trylock Mutex: Busy as expected\n");
    21c2:	48 8d 05 87 12 00 00 	lea    0x1287(%rip),%rax        # 3450 <_IO_stdin_used+0x450>
    21c9:	48 89 c7             	mov    %rax,%rdi
    21cc:	e8 8f f0 ff ff       	call   1260 <puts@plt>
    21d1:	eb 2e                	jmp    2201 <_Z21example_pthread_mutexv+0x953>
    } else {
        fprintf(stderr, "pthread_mutex_trylock failed: %s\n", strerror(ret));
    21d3:	8b 85 b4 fe ff ff    	mov    -0x14c(%rbp),%eax
    21d9:	89 c7                	mov    %eax,%edi
    21db:	e8 10 f2 ff ff       	call   13f0 <strerror@plt>
    21e0:	48 89 c2             	mov    %rax,%rdx
    21e3:	48 8b 05 36 2e 00 00 	mov    0x2e36(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    21ea:	48 8d 0d 7f 12 00 00 	lea    0x127f(%rip),%rcx        # 3470 <_IO_stdin_used+0x470>
    21f1:	48 89 ce             	mov    %rcx,%rsi
    21f4:	48 89 c7             	mov    %rax,%rdi
    21f7:	b8 00 00 00 00       	mov    $0x0,%eax
    21fc:	e8 2f f1 ff ff       	call   1330 <fprintf@plt>
    }

    ret = pthread_mutex_destroy(&timed_mutex);
    2201:	48 8d 45 90          	lea    -0x70(%rbp),%rax
    2205:	48 89 c7             	mov    %rax,%rdi
    2208:	e8 c3 f0 ff ff       	call   12d0 <pthread_mutex_destroy@plt>
    220d:	89 85 b4 fe ff ff    	mov    %eax,-0x14c(%rbp)
    if (ret != 0) {
    2213:	83 bd b4 fe ff ff 00 	cmpl   $0x0,-0x14c(%rbp)
    221a:	74 2e                	je     224a <_Z21example_pthread_mutexv+0x99c>
        fprintf(stderr, "pthread_mutex_destroy failed: %s\n", strerror(ret));
    221c:	8b 85 b4 fe ff ff    	mov    -0x14c(%rbp),%eax
    2222:	89 c7                	mov    %eax,%edi
    2224:	e8 c7 f1 ff ff       	call   13f0 <strerror@plt>
    2229:	48 89 c2             	mov    %rax,%rdx
    222c:	48 8b 05 ed 2d 00 00 	mov    0x2ded(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    2233:	48 8d 0d 1e 11 00 00 	lea    0x111e(%rip),%rcx        # 3358 <_IO_stdin_used+0x358>
    223a:	48 89 ce             	mov    %rcx,%rsi
    223d:	48 89 c7             	mov    %rax,%rdi
    2240:	b8 00 00 00 00       	mov    $0x0,%eax
    2245:	e8 e6 f0 ff ff       	call   1330 <fprintf@plt>
    }

    printf("=== Ending example_pthread_mutex ===\n\n");
    224a:	48 8d 05 47 12 00 00 	lea    0x1247(%rip),%rax        # 3498 <_IO_stdin_used+0x498>
    2251:	48 89 c7             	mov    %rax,%rdi
    2254:	e8 07 f0 ff ff       	call   1260 <puts@plt>
}
    2259:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    225d:	64 48 2b 04 25 28 00 	sub    %fs:0x28,%rax
    2264:	00 00 
    2266:	74 05                	je     226d <_Z21example_pthread_mutexv+0x9bf>
    2268:	e8 33 f0 ff ff       	call   12a0 <__stack_chk_fail@plt>
    226d:	c9                   	leave
    226e:	c3                   	ret

000000000000226f <_Z23example_pthread_condvarv>:

void example_pthread_condvar()
{
    226f:	f3 0f 1e fa          	endbr64
    2273:	55                   	push   %rbp
    2274:	48 89 e5             	mov    %rsp,%rbp
    2277:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
    227e:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    2285:	00 00 
    2287:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    228b:	31 c0                	xor    %eax,%eax
    printf("=== Starting example_pthread_condvar ===\n");
    228d:	48 8d 05 2c 12 00 00 	lea    0x122c(%rip),%rax        # 34c0 <_IO_stdin_used+0x4c0>
    2294:	48 89 c7             	mov    %rax,%rdi
    2297:	e8 c4 ef ff ff       	call   1260 <puts@plt>

    // Condition variable: Producer-consumer
    pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
    229c:	66 0f ef c0          	pxor   %xmm0,%xmm0
    22a0:	0f 29 85 60 ff ff ff 	movaps %xmm0,-0xa0(%rbp)
    22a7:	0f 29 85 70 ff ff ff 	movaps %xmm0,-0x90(%rbp)
    22ae:	66 0f d6 45 80       	movq   %xmm0,-0x80(%rbp)
    pthread_cond_t cond = PTHREAD_COND_INITIALIZER;
    22b3:	66 0f ef c0          	pxor   %xmm0,%xmm0
    22b7:	0f 29 45 90          	movaps %xmm0,-0x70(%rbp)
    22bb:	0f 29 45 a0          	movaps %xmm0,-0x60(%rbp)
    22bf:	0f 29 45 b0          	movaps %xmm0,-0x50(%rbp)
    int buffer = 0;
    22c3:	c7 85 10 ff ff ff 00 	movl   $0x0,-0xf0(%rbp)
    22ca:	00 00 00 
    struct condvar_data data = {&mutex, &cond, &buffer};
    22cd:	48 8d 85 60 ff ff ff 	lea    -0xa0(%rbp),%rax
    22d4:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
    22db:	48 8d 45 90          	lea    -0x70(%rbp),%rax
    22df:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
    22e6:	48 8d 85 10 ff ff ff 	lea    -0xf0(%rbp),%rax
    22ed:	48 89 85 50 ff ff ff 	mov    %rax,-0xb0(%rbp)

    pthread_t prod, cons;
    int ret = pthread_create(&prod, NULL, producer, &data);
    22f4:	48 8d 95 40 ff ff ff 	lea    -0xc0(%rbp),%rdx
    22fb:	48 8d 85 18 ff ff ff 	lea    -0xe8(%rbp),%rax
    2302:	48 89 d1             	mov    %rdx,%rcx
    2305:	48 8d 15 2f f3 ff ff 	lea    -0xcd1(%rip),%rdx        # 163b <_Z8producerPv>
    230c:	be 00 00 00 00       	mov    $0x0,%esi
    2311:	48 89 c7             	mov    %rax,%rdi
    2314:	e8 87 f0 ff ff       	call   13a0 <pthread_create@plt>
    2319:	89 85 14 ff ff ff    	mov    %eax,-0xec(%rbp)
    if (ret != 0) {
    231f:	83 bd 14 ff ff ff 00 	cmpl   $0x0,-0xec(%rbp)
    2326:	74 33                	je     235b <_Z23example_pthread_condvarv+0xec>
        fprintf(stderr, "pthread_create (producer) failed: %s\n", strerror(ret));
    2328:	8b 85 14 ff ff ff    	mov    -0xec(%rbp),%eax
    232e:	89 c7                	mov    %eax,%edi
    2330:	e8 bb f0 ff ff       	call   13f0 <strerror@plt>
    2335:	48 89 c2             	mov    %rax,%rdx
    2338:	48 8b 05 e1 2c 00 00 	mov    0x2ce1(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    233f:	48 8d 0d aa 11 00 00 	lea    0x11aa(%rip),%rcx        # 34f0 <_IO_stdin_used+0x4f0>
    2346:	48 89 ce             	mov    %rcx,%rsi
    2349:	48 89 c7             	mov    %rax,%rdi
    234c:	b8 00 00 00 00       	mov    $0x0,%eax
    2351:	e8 da ef ff ff       	call   1330 <fprintf@plt>
        return;
    2356:	e9 1b 05 00 00       	jmp    2876 <_Z23example_pthread_condvarv+0x607>
    }
    ret = pthread_create(&cons, NULL, consumer, &data);
    235b:	48 8d 95 40 ff ff ff 	lea    -0xc0(%rbp),%rdx
    2362:	48 8d 85 20 ff ff ff 	lea    -0xe0(%rbp),%rax
    2369:	48 89 d1             	mov    %rdx,%rcx
    236c:	48 8d 15 90 f3 ff ff 	lea    -0xc70(%rip),%rdx        # 1703 <_Z8consumerPv>
    2373:	be 00 00 00 00       	mov    $0x0,%esi
    2378:	48 89 c7             	mov    %rax,%rdi
    237b:	e8 20 f0 ff ff       	call   13a0 <pthread_create@plt>
    2380:	89 85 14 ff ff ff    	mov    %eax,-0xec(%rbp)
    if (ret != 0) {
    2386:	83 bd 14 ff ff ff 00 	cmpl   $0x0,-0xec(%rbp)
    238d:	74 33                	je     23c2 <_Z23example_pthread_condvarv+0x153>
        fprintf(stderr, "pthread_create (consumer) failed: %s\n", strerror(ret));
    238f:	8b 85 14 ff ff ff    	mov    -0xec(%rbp),%eax
    2395:	89 c7                	mov    %eax,%edi
    2397:	e8 54 f0 ff ff       	call   13f0 <strerror@plt>
    239c:	48 89 c2             	mov    %rax,%rdx
    239f:	48 8b 05 7a 2c 00 00 	mov    0x2c7a(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    23a6:	48 8d 0d 6b 11 00 00 	lea    0x116b(%rip),%rcx        # 3518 <_IO_stdin_used+0x518>
    23ad:	48 89 ce             	mov    %rcx,%rsi
    23b0:	48 89 c7             	mov    %rax,%rdi
    23b3:	b8 00 00 00 00       	mov    $0x0,%eax
    23b8:	e8 73 ef ff ff       	call   1330 <fprintf@plt>
        return;
    23bd:	e9 b4 04 00 00       	jmp    2876 <_Z23example_pthread_condvarv+0x607>
    }
    void* retval;
    ret = pthread_join(prod, &retval);
    23c2:	48 8b 85 18 ff ff ff 	mov    -0xe8(%rbp),%rax
    23c9:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
    23d0:	48 89 d6             	mov    %rdx,%rsi
    23d3:	48 89 c7             	mov    %rax,%rdi
    23d6:	e8 05 f0 ff ff       	call   13e0 <pthread_join@plt>
    23db:	89 85 14 ff ff ff    	mov    %eax,-0xec(%rbp)
    if (ret != 0) {
    23e1:	83 bd 14 ff ff ff 00 	cmpl   $0x0,-0xec(%rbp)
    23e8:	74 30                	je     241a <_Z23example_pthread_condvarv+0x1ab>
        fprintf(stderr, "pthread_join (producer) failed: %s\n", strerror(ret));
    23ea:	8b 85 14 ff ff ff    	mov    -0xec(%rbp),%eax
    23f0:	89 c7                	mov    %eax,%edi
    23f2:	e8 f9 ef ff ff       	call   13f0 <strerror@plt>
    23f7:	48 89 c2             	mov    %rax,%rdx
    23fa:	48 8b 05 1f 2c 00 00 	mov    0x2c1f(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    2401:	48 8d 0d 38 11 00 00 	lea    0x1138(%rip),%rcx        # 3540 <_IO_stdin_used+0x540>
    2408:	48 89 ce             	mov    %rcx,%rsi
    240b:	48 89 c7             	mov    %rax,%rdi
    240e:	b8 00 00 00 00       	mov    $0x0,%eax
    2413:	e8 18 ef ff ff       	call   1330 <fprintf@plt>
    2418:	eb 34                	jmp    244e <_Z23example_pthread_condvarv+0x1df>
    } else if (retval != NULL) {
    241a:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
    2421:	48 85 c0             	test   %rax,%rax
    2424:	74 28                	je     244e <_Z23example_pthread_condvarv+0x1df>
        fprintf(stderr, "Producer returned error: %ld\n", (long)(intptr_t)retval);
    2426:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
    242d:	48 89 c2             	mov    %rax,%rdx
    2430:	48 8b 05 e9 2b 00 00 	mov    0x2be9(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    2437:	48 8d 0d 26 11 00 00 	lea    0x1126(%rip),%rcx        # 3564 <_IO_stdin_used+0x564>
    243e:	48 89 ce             	mov    %rcx,%rsi
    2441:	48 89 c7             	mov    %rax,%rdi
    2444:	b8 00 00 00 00       	mov    $0x0,%eax
    2449:	e8 e2 ee ff ff       	call   1330 <fprintf@plt>
    }
    ret = pthread_join(cons, &retval);
    244e:	48 8b 85 20 ff ff ff 	mov    -0xe0(%rbp),%rax
    2455:	48 8d 95 28 ff ff ff 	lea    -0xd8(%rbp),%rdx
    245c:	48 89 d6             	mov    %rdx,%rsi
    245f:	48 89 c7             	mov    %rax,%rdi
    2462:	e8 79 ef ff ff       	call   13e0 <pthread_join@plt>
    2467:	89 85 14 ff ff ff    	mov    %eax,-0xec(%rbp)
    if (ret != 0) {
    246d:	83 bd 14 ff ff ff 00 	cmpl   $0x0,-0xec(%rbp)
    2474:	74 30                	je     24a6 <_Z23example_pthread_condvarv+0x237>
        fprintf(stderr, "pthread_join (consumer) failed: %s\n", strerror(ret));
    2476:	8b 85 14 ff ff ff    	mov    -0xec(%rbp),%eax
    247c:	89 c7                	mov    %eax,%edi
    247e:	e8 6d ef ff ff       	call   13f0 <strerror@plt>
    2483:	48 89 c2             	mov    %rax,%rdx
    2486:	48 8b 05 93 2b 00 00 	mov    0x2b93(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    248d:	48 8d 0d f4 10 00 00 	lea    0x10f4(%rip),%rcx        # 3588 <_IO_stdin_used+0x588>
    2494:	48 89 ce             	mov    %rcx,%rsi
    2497:	48 89 c7             	mov    %rax,%rdi
    249a:	b8 00 00 00 00       	mov    $0x0,%eax
    249f:	e8 8c ee ff ff       	call   1330 <fprintf@plt>
    24a4:	eb 34                	jmp    24da <_Z23example_pthread_condvarv+0x26b>
    } else if (retval != NULL) {
    24a6:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
    24ad:	48 85 c0             	test   %rax,%rax
    24b0:	74 28                	je     24da <_Z23example_pthread_condvarv+0x26b>
        fprintf(stderr, "Consumer returned error: %ld\n", (long)(intptr_t)retval);
    24b2:	48 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%rax
    24b9:	48 89 c2             	mov    %rax,%rdx
    24bc:	48 8b 05 5d 2b 00 00 	mov    0x2b5d(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    24c3:	48 8d 0d e2 10 00 00 	lea    0x10e2(%rip),%rcx        # 35ac <_IO_stdin_used+0x5ac>
    24ca:	48 89 ce             	mov    %rcx,%rsi
    24cd:	48 89 c7             	mov    %rax,%rdi
    24d0:	b8 00 00 00 00       	mov    $0x0,%eax
    24d5:	e8 56 ee ff ff       	call   1330 <fprintf@plt>
    //         fprintf(stderr, "Consumer %d returned error: %ld\n", i, (long)(intptr_t)retval);
    //     }
    // }

    // Timedwait
    ret = pthread_mutex_lock(&mutex);
    24da:	48 8d 85 60 ff ff ff 	lea    -0xa0(%rbp),%rax
    24e1:	48 89 c7             	mov    %rax,%rdi
    24e4:	e8 37 ef ff ff       	call   1420 <pthread_mutex_lock@plt>
    24e9:	89 85 14 ff ff ff    	mov    %eax,-0xec(%rbp)
    if (ret != 0) {
    24ef:	83 bd 14 ff ff ff 00 	cmpl   $0x0,-0xec(%rbp)
    24f6:	74 33                	je     252b <_Z23example_pthread_condvarv+0x2bc>
        fprintf(stderr, "pthread_mutex_lock failed: %s\n", strerror(ret));
    24f8:	8b 85 14 ff ff ff    	mov    -0xec(%rbp),%eax
    24fe:	89 c7                	mov    %eax,%edi
    2500:	e8 eb ee ff ff       	call   13f0 <strerror@plt>
    2505:	48 89 c2             	mov    %rax,%rdx
    2508:	48 8b 05 11 2b 00 00 	mov    0x2b11(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    250f:	48 8d 0d fa 0d 00 00 	lea    0xdfa(%rip),%rcx        # 3310 <_IO_stdin_used+0x310>
    2516:	48 89 ce             	mov    %rcx,%rsi
    2519:	48 89 c7             	mov    %rax,%rdi
    251c:	b8 00 00 00 00       	mov    $0x0,%eax
    2521:	e8 0a ee ff ff       	call   1330 <fprintf@plt>
        return;
    2526:	e9 4b 03 00 00       	jmp    2876 <_Z23example_pthread_condvarv+0x607>
    }
    struct timespec ts;
    clock_gettime(CLOCK_REALTIME, &ts);
    252b:	48 8d 85 30 ff ff ff 	lea    -0xd0(%rbp),%rax
    2532:	48 89 c6             	mov    %rax,%rsi
    2535:	bf 00 00 00 00       	mov    $0x0,%edi
    253a:	e8 41 ed ff ff       	call   1280 <clock_gettime@plt>
    ts.tv_sec += 1;
    253f:	48 8b 85 30 ff ff ff 	mov    -0xd0(%rbp),%rax
    2546:	48 83 c0 01          	add    $0x1,%rax
    254a:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
    ret = pthread_cond_timedwait(&cond, &mutex, &ts);
    2551:	48 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%rdx
    2558:	48 8d 8d 60 ff ff ff 	lea    -0xa0(%rbp),%rcx
    255f:	48 8d 45 90          	lea    -0x70(%rbp),%rax
    2563:	48 89 ce             	mov    %rcx,%rsi
    2566:	48 89 c7             	mov    %rax,%rdi
    2569:	e8 42 ee ff ff       	call   13b0 <pthread_cond_timedwait@plt>
    256e:	89 85 14 ff ff ff    	mov    %eax,-0xec(%rbp)
    if (ret == ETIMEDOUT) {
    2574:	83 bd 14 ff ff ff 6e 	cmpl   $0x6e,-0xec(%rbp)
    257b:	75 11                	jne    258e <_Z23example_pthread_condvarv+0x31f>
        printf("Cond Timedwait: Timed out as expected\n");
    257d:	48 8d 05 4c 10 00 00 	lea    0x104c(%rip),%rax        # 35d0 <_IO_stdin_used+0x5d0>
    2584:	48 89 c7             	mov    %rax,%rdi
    2587:	e8 d4 ec ff ff       	call   1260 <puts@plt>
    258c:	eb 37                	jmp    25c5 <_Z23example_pthread_condvarv+0x356>
    } else if (ret != 0) {
    258e:	83 bd 14 ff ff ff 00 	cmpl   $0x0,-0xec(%rbp)
    2595:	74 2e                	je     25c5 <_Z23example_pthread_condvarv+0x356>
        fprintf(stderr, "pthread_cond_timedwait failed: %s\n", strerror(ret));
    2597:	8b 85 14 ff ff ff    	mov    -0xec(%rbp),%eax
    259d:	89 c7                	mov    %eax,%edi
    259f:	e8 4c ee ff ff       	call   13f0 <strerror@plt>
    25a4:	48 89 c2             	mov    %rax,%rdx
    25a7:	48 8b 05 72 2a 00 00 	mov    0x2a72(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    25ae:	48 8d 0d 43 10 00 00 	lea    0x1043(%rip),%rcx        # 35f8 <_IO_stdin_used+0x5f8>
    25b5:	48 89 ce             	mov    %rcx,%rsi
    25b8:	48 89 c7             	mov    %rax,%rdi
    25bb:	b8 00 00 00 00       	mov    $0x0,%eax
    25c0:	e8 6b ed ff ff       	call   1330 <fprintf@plt>
    }
    ret = pthread_mutex_unlock(&mutex);
    25c5:	48 8d 85 60 ff ff ff 	lea    -0xa0(%rbp),%rax
    25cc:	48 89 c7             	mov    %rax,%rdi
    25cf:	e8 ac ed ff ff       	call   1380 <pthread_mutex_unlock@plt>
    25d4:	89 85 14 ff ff ff    	mov    %eax,-0xec(%rbp)
    if (ret != 0) {
    25da:	83 bd 14 ff ff ff 00 	cmpl   $0x0,-0xec(%rbp)
    25e1:	74 2e                	je     2611 <_Z23example_pthread_condvarv+0x3a2>
        fprintf(stderr, "pthread_mutex_unlock failed: %s\n", strerror(ret));
    25e3:	8b 85 14 ff ff ff    	mov    -0xec(%rbp),%eax
    25e9:	89 c7                	mov    %eax,%edi
    25eb:	e8 00 ee ff ff       	call   13f0 <strerror@plt>
    25f0:	48 89 c2             	mov    %rax,%rdx
    25f3:	48 8b 05 26 2a 00 00 	mov    0x2a26(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    25fa:	48 8d 0d e7 0c 00 00 	lea    0xce7(%rip),%rcx        # 32e8 <_IO_stdin_used+0x2e8>
    2601:	48 89 ce             	mov    %rcx,%rsi
    2604:	48 89 c7             	mov    %rax,%rdi
    2607:	b8 00 00 00 00       	mov    $0x0,%eax
    260c:	e8 1f ed ff ff       	call   1330 <fprintf@plt>
    }

    // Attribute: Set clock
    pthread_condattr_t condattr;
    ret = pthread_condattr_init(&condattr);
    2611:	48 8d 85 5c ff ff ff 	lea    -0xa4(%rbp),%rax
    2618:	48 89 c7             	mov    %rax,%rdi
    261b:	e8 70 ed ff ff       	call   1390 <pthread_condattr_init@plt>
    2620:	89 85 14 ff ff ff    	mov    %eax,-0xec(%rbp)
    if (ret != 0) {
    2626:	83 bd 14 ff ff ff 00 	cmpl   $0x0,-0xec(%rbp)
    262d:	74 33                	je     2662 <_Z23example_pthread_condvarv+0x3f3>
        fprintf(stderr, "pthread_condattr_init failed: %s\n", strerror(ret));
    262f:	8b 85 14 ff ff ff    	mov    -0xec(%rbp),%eax
    2635:	89 c7                	mov    %eax,%edi
    2637:	e8 b4 ed ff ff       	call   13f0 <strerror@plt>
    263c:	48 89 c2             	mov    %rax,%rdx
    263f:	48 8b 05 da 29 00 00 	mov    0x29da(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    2646:	48 8d 0d d3 0f 00 00 	lea    0xfd3(%rip),%rcx        # 3620 <_IO_stdin_used+0x620>
    264d:	48 89 ce             	mov    %rcx,%rsi
    2650:	48 89 c7             	mov    %rax,%rdi
    2653:	b8 00 00 00 00       	mov    $0x0,%eax
    2658:	e8 d3 ec ff ff       	call   1330 <fprintf@plt>
        return;
    265d:	e9 14 02 00 00       	jmp    2876 <_Z23example_pthread_condvarv+0x607>
    }
    ret = pthread_condattr_setclock(&condattr, CLOCK_MONOTONIC);
    2662:	48 8d 85 5c ff ff ff 	lea    -0xa4(%rbp),%rax
    2669:	be 01 00 00 00       	mov    $0x1,%esi
    266e:	48 89 c7             	mov    %rax,%rdi
    2671:	e8 aa ec ff ff       	call   1320 <pthread_condattr_setclock@plt>
    2676:	89 85 14 ff ff ff    	mov    %eax,-0xec(%rbp)
    if (ret != 0) {
    267c:	83 bd 14 ff ff ff 00 	cmpl   $0x0,-0xec(%rbp)
    2683:	74 42                	je     26c7 <_Z23example_pthread_condvarv+0x458>
        fprintf(stderr, "pthread_condattr_setclock failed: %s\n", strerror(ret));
    2685:	8b 85 14 ff ff ff    	mov    -0xec(%rbp),%eax
    268b:	89 c7                	mov    %eax,%edi
    268d:	e8 5e ed ff ff       	call   13f0 <strerror@plt>
    2692:	48 89 c2             	mov    %rax,%rdx
    2695:	48 8b 05 84 29 00 00 	mov    0x2984(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    269c:	48 8d 0d a5 0f 00 00 	lea    0xfa5(%rip),%rcx        # 3648 <_IO_stdin_used+0x648>
    26a3:	48 89 ce             	mov    %rcx,%rsi
    26a6:	48 89 c7             	mov    %rax,%rdi
    26a9:	b8 00 00 00 00       	mov    $0x0,%eax
    26ae:	e8 7d ec ff ff       	call   1330 <fprintf@plt>
        pthread_condattr_destroy(&condattr);
    26b3:	48 8d 85 5c ff ff ff 	lea    -0xa4(%rbp),%rax
    26ba:	48 89 c7             	mov    %rax,%rdi
    26bd:	e8 2e ec ff ff       	call   12f0 <pthread_condattr_destroy@plt>
        return;
    26c2:	e9 af 01 00 00       	jmp    2876 <_Z23example_pthread_condvarv+0x607>
    }
    pthread_cond_t cond_mono;
    ret = pthread_cond_init(&cond_mono, &condattr);
    26c7:	48 8d 95 5c ff ff ff 	lea    -0xa4(%rbp),%rdx
    26ce:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
    26d2:	48 89 d6             	mov    %rdx,%rsi
    26d5:	48 89 c7             	mov    %rax,%rdi
    26d8:	e8 93 ec ff ff       	call   1370 <pthread_cond_init@plt>
    26dd:	89 85 14 ff ff ff    	mov    %eax,-0xec(%rbp)
    if (ret != 0) {
    26e3:	83 bd 14 ff ff ff 00 	cmpl   $0x0,-0xec(%rbp)
    26ea:	74 42                	je     272e <_Z23example_pthread_condvarv+0x4bf>
        fprintf(stderr, "pthread_cond_init failed: %s\n", strerror(ret));
    26ec:	8b 85 14 ff ff ff    	mov    -0xec(%rbp),%eax
    26f2:	89 c7                	mov    %eax,%edi
    26f4:	e8 f7 ec ff ff       	call   13f0 <strerror@plt>
    26f9:	48 89 c2             	mov    %rax,%rdx
    26fc:	48 8b 05 1d 29 00 00 	mov    0x291d(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    2703:	48 8d 0d 64 0f 00 00 	lea    0xf64(%rip),%rcx        # 366e <_IO_stdin_used+0x66e>
    270a:	48 89 ce             	mov    %rcx,%rsi
    270d:	48 89 c7             	mov    %rax,%rdi
    2710:	b8 00 00 00 00       	mov    $0x0,%eax
    2715:	e8 16 ec ff ff       	call   1330 <fprintf@plt>
        pthread_condattr_destroy(&condattr);
    271a:	48 8d 85 5c ff ff ff 	lea    -0xa4(%rbp),%rax
    2721:	48 89 c7             	mov    %rax,%rdi
    2724:	e8 c7 eb ff ff       	call   12f0 <pthread_condattr_destroy@plt>
        return;
    2729:	e9 48 01 00 00       	jmp    2876 <_Z23example_pthread_condvarv+0x607>
    }
    printf("Cond Attr: Set to monotonic clock\n");
    272e:	48 8d 05 5b 0f 00 00 	lea    0xf5b(%rip),%rax        # 3690 <_IO_stdin_used+0x690>
    2735:	48 89 c7             	mov    %rax,%rdi
    2738:	e8 23 eb ff ff       	call   1260 <puts@plt>
    ret = pthread_cond_destroy(&cond_mono);
    273d:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
    2741:	48 89 c7             	mov    %rax,%rdi
    2744:	e8 77 ec ff ff       	call   13c0 <pthread_cond_destroy@plt>
    2749:	89 85 14 ff ff ff    	mov    %eax,-0xec(%rbp)
    if (ret != 0) {
    274f:	83 bd 14 ff ff ff 00 	cmpl   $0x0,-0xec(%rbp)
    2756:	74 2e                	je     2786 <_Z23example_pthread_condvarv+0x517>
        fprintf(stderr, "pthread_cond_destroy failed: %s\n", strerror(ret));
    2758:	8b 85 14 ff ff ff    	mov    -0xec(%rbp),%eax
    275e:	89 c7                	mov    %eax,%edi
    2760:	e8 8b ec ff ff       	call   13f0 <strerror@plt>
    2765:	48 89 c2             	mov    %rax,%rdx
    2768:	48 8b 05 b1 28 00 00 	mov    0x28b1(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    276f:	48 8d 0d 42 0f 00 00 	lea    0xf42(%rip),%rcx        # 36b8 <_IO_stdin_used+0x6b8>
    2776:	48 89 ce             	mov    %rcx,%rsi
    2779:	48 89 c7             	mov    %rax,%rdi
    277c:	b8 00 00 00 00       	mov    $0x0,%eax
    2781:	e8 aa eb ff ff       	call   1330 <fprintf@plt>
    }
    ret = pthread_condattr_destroy(&condattr);
    2786:	48 8d 85 5c ff ff ff 	lea    -0xa4(%rbp),%rax
    278d:	48 89 c7             	mov    %rax,%rdi
    2790:	e8 5b eb ff ff       	call   12f0 <pthread_condattr_destroy@plt>
    2795:	89 85 14 ff ff ff    	mov    %eax,-0xec(%rbp)
    if (ret != 0) {
    279b:	83 bd 14 ff ff ff 00 	cmpl   $0x0,-0xec(%rbp)
    27a2:	74 2e                	je     27d2 <_Z23example_pthread_condvarv+0x563>
        fprintf(stderr, "pthread_condattr_destroy failed: %s\n", strerror(ret));
    27a4:	8b 85 14 ff ff ff    	mov    -0xec(%rbp),%eax
    27aa:	89 c7                	mov    %eax,%edi
    27ac:	e8 3f ec ff ff       	call   13f0 <strerror@plt>
    27b1:	48 89 c2             	mov    %rax,%rdx
    27b4:	48 8b 05 65 28 00 00 	mov    0x2865(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    27bb:	48 8d 0d 1e 0f 00 00 	lea    0xf1e(%rip),%rcx        # 36e0 <_IO_stdin_used+0x6e0>
    27c2:	48 89 ce             	mov    %rcx,%rsi
    27c5:	48 89 c7             	mov    %rax,%rdi
    27c8:	b8 00 00 00 00       	mov    $0x0,%eax
    27cd:	e8 5e eb ff ff       	call   1330 <fprintf@plt>
    }

    ret = pthread_cond_destroy(&cond);
    27d2:	48 8d 45 90          	lea    -0x70(%rbp),%rax
    27d6:	48 89 c7             	mov    %rax,%rdi
    27d9:	e8 e2 eb ff ff       	call   13c0 <pthread_cond_destroy@plt>
    27de:	89 85 14 ff ff ff    	mov    %eax,-0xec(%rbp)
    if (ret != 0) {
    27e4:	83 bd 14 ff ff ff 00 	cmpl   $0x0,-0xec(%rbp)
    27eb:	74 2e                	je     281b <_Z23example_pthread_condvarv+0x5ac>
        fprintf(stderr, "pthread_cond_destroy failed: %s\n", strerror(ret));
    27ed:	8b 85 14 ff ff ff    	mov    -0xec(%rbp),%eax
    27f3:	89 c7                	mov    %eax,%edi
    27f5:	e8 f6 eb ff ff       	call   13f0 <strerror@plt>
    27fa:	48 89 c2             	mov    %rax,%rdx
    27fd:	48 8b 05 1c 28 00 00 	mov    0x281c(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    2804:	48 8d 0d ad 0e 00 00 	lea    0xead(%rip),%rcx        # 36b8 <_IO_stdin_used+0x6b8>
    280b:	48 89 ce             	mov    %rcx,%rsi
    280e:	48 89 c7             	mov    %rax,%rdi
    2811:	b8 00 00 00 00       	mov    $0x0,%eax
    2816:	e8 15 eb ff ff       	call   1330 <fprintf@plt>
    }
    ret = pthread_mutex_destroy(&mutex);
    281b:	48 8d 85 60 ff ff ff 	lea    -0xa0(%rbp),%rax
    2822:	48 89 c7             	mov    %rax,%rdi
    2825:	e8 a6 ea ff ff       	call   12d0 <pthread_mutex_destroy@plt>
    282a:	89 85 14 ff ff ff    	mov    %eax,-0xec(%rbp)
    if (ret != 0) {
    2830:	83 bd 14 ff ff ff 00 	cmpl   $0x0,-0xec(%rbp)
    2837:	74 2e                	je     2867 <_Z23example_pthread_condvarv+0x5f8>
        fprintf(stderr, "pthread_mutex_destroy failed: %s\n", strerror(ret));
    2839:	8b 85 14 ff ff ff    	mov    -0xec(%rbp),%eax
    283f:	89 c7                	mov    %eax,%edi
    2841:	e8 aa eb ff ff       	call   13f0 <strerror@plt>
    2846:	48 89 c2             	mov    %rax,%rdx
    2849:	48 8b 05 d0 27 00 00 	mov    0x27d0(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    2850:	48 8d 0d 01 0b 00 00 	lea    0xb01(%rip),%rcx        # 3358 <_IO_stdin_used+0x358>
    2857:	48 89 ce             	mov    %rcx,%rsi
    285a:	48 89 c7             	mov    %rax,%rdi
    285d:	b8 00 00 00 00       	mov    $0x0,%eax
    2862:	e8 c9 ea ff ff       	call   1330 <fprintf@plt>
    }

    printf("=== Ending example_pthread_condvar ===\n\n");
    2867:	48 8d 05 9a 0e 00 00 	lea    0xe9a(%rip),%rax        # 3708 <_IO_stdin_used+0x708>
    286e:	48 89 c7             	mov    %rax,%rdi
    2871:	e8 ea e9 ff ff       	call   1260 <puts@plt>
}
    2876:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    287a:	64 48 2b 04 25 28 00 	sub    %fs:0x28,%rax
    2881:	00 00 
    2883:	74 05                	je     288a <_Z23example_pthread_condvarv+0x61b>
    2885:	e8 16 ea ff ff       	call   12a0 <__stack_chk_fail@plt>
    288a:	c9                   	leave
    288b:	c3                   	ret

000000000000288c <_Z23example_pthread_barrierv>:

void example_pthread_barrier() 
{
    288c:	f3 0f 1e fa          	endbr64
    2890:	55                   	push   %rbp
    2891:	48 89 e5             	mov    %rsp,%rbp
    2894:	48 81 ec 90 00 00 00 	sub    $0x90,%rsp
    289b:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    28a2:	00 00 
    28a4:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    28a8:	31 c0                	xor    %eax,%eax
    printf("=== Starting example_pthread_barrier ===\n");
    28aa:	48 8d 05 7f 0e 00 00 	lea    0xe7f(%rip),%rax        # 3730 <_IO_stdin_used+0x730>
    28b1:	48 89 c7             	mov    %rax,%rdi
    28b4:	e8 a7 e9 ff ff       	call   1260 <puts@plt>

    // Basic barrier: 3 threads wait
    pthread_barrier_t barrier;
    int ret = pthread_barrier_init(&barrier, NULL, 3);
    28b9:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
    28bd:	ba 03 00 00 00       	mov    $0x3,%edx
    28c2:	be 00 00 00 00       	mov    $0x0,%esi
    28c7:	48 89 c7             	mov    %rax,%rdi
    28ca:	e8 81 e9 ff ff       	call   1250 <pthread_barrier_init@plt>
    28cf:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%rbp)
    if (ret != 0) {
    28d5:	83 bd 74 ff ff ff 00 	cmpl   $0x0,-0x8c(%rbp)
    28dc:	74 33                	je     2911 <_Z23example_pthread_barrierv+0x85>
        fprintf(stderr, "pthread_barrier_init failed: %s\n", strerror(ret));
    28de:	8b 85 74 ff ff ff    	mov    -0x8c(%rbp),%eax
    28e4:	89 c7                	mov    %eax,%edi
    28e6:	e8 05 eb ff ff       	call   13f0 <strerror@plt>
    28eb:	48 89 c2             	mov    %rax,%rdx
    28ee:	48 8b 05 2b 27 00 00 	mov    0x272b(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    28f5:	48 8d 0d 64 0e 00 00 	lea    0xe64(%rip),%rcx        # 3760 <_IO_stdin_used+0x760>
    28fc:	48 89 ce             	mov    %rcx,%rsi
    28ff:	48 89 c7             	mov    %rax,%rdi
    2902:	b8 00 00 00 00       	mov    $0x0,%eax
    2907:	e8 24 ea ff ff       	call   1330 <fprintf@plt>
        return;
    290c:	e9 78 03 00 00       	jmp    2c89 <_Z23example_pthread_barrierv+0x3fd>
    }

    pthread_t workers[3];
    for (long i = 0; i < 3; i++) {
    2911:	48 c7 45 80 00 00 00 	movq   $0x0,-0x80(%rbp)
    2918:	00 
    2919:	e9 94 00 00 00       	jmp    29b2 <_Z23example_pthread_barrierv+0x126>
        ret = pthread_create(&workers[i], NULL, worker, &barrier);
    291e:	48 8d 45 90          	lea    -0x70(%rbp),%rax
    2922:	48 8b 55 80          	mov    -0x80(%rbp),%rdx
    2926:	48 c1 e2 03          	shl    $0x3,%rdx
    292a:	48 8d 3c 10          	lea    (%rax,%rdx,1),%rdi
    292e:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
    2932:	48 89 c1             	mov    %rax,%rcx
    2935:	48 8d 05 b0 ee ff ff 	lea    -0x1150(%rip),%rax        # 17ec <_Z6workerPv>
    293c:	48 89 c2             	mov    %rax,%rdx
    293f:	be 00 00 00 00       	mov    $0x0,%esi
    2944:	e8 57 ea ff ff       	call   13a0 <pthread_create@plt>
    2949:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%rbp)
        if (ret != 0) {
    294f:	83 bd 74 ff ff ff 00 	cmpl   $0x0,-0x8c(%rbp)
    2956:	74 40                	je     2998 <_Z23example_pthread_barrierv+0x10c>
            fprintf(stderr, "pthread_create (worker %ld) failed: %s\n", i, strerror(ret));
    2958:	8b 85 74 ff ff ff    	mov    -0x8c(%rbp),%eax
    295e:	89 c7                	mov    %eax,%edi
    2960:	e8 8b ea ff ff       	call   13f0 <strerror@plt>
    2965:	48 89 c1             	mov    %rax,%rcx
    2968:	48 8b 05 b1 26 00 00 	mov    0x26b1(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    296f:	48 8b 55 80          	mov    -0x80(%rbp),%rdx
    2973:	48 8d 35 0e 0e 00 00 	lea    0xe0e(%rip),%rsi        # 3788 <_IO_stdin_used+0x788>
    297a:	48 89 c7             	mov    %rax,%rdi
    297d:	b8 00 00 00 00       	mov    $0x0,%eax
    2982:	e8 a9 e9 ff ff       	call   1330 <fprintf@plt>
            pthread_barrier_destroy(&barrier);
    2987:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
    298b:	48 89 c7             	mov    %rax,%rdi
    298e:	e8 2d e9 ff ff       	call   12c0 <pthread_barrier_destroy@plt>
            return;
    2993:	e9 f1 02 00 00       	jmp    2c89 <_Z23example_pthread_barrierv+0x3fd>
        }
        usleep(100000 * (i + 1)); // Different delays
    2998:	48 8b 45 80          	mov    -0x80(%rbp),%rax
    299c:	48 83 c0 01          	add    $0x1,%rax
    29a0:	69 c0 a0 86 01 00    	imul   $0x186a0,%eax,%eax
    29a6:	89 c7                	mov    %eax,%edi
    29a8:	e8 83 ea ff ff       	call   1430 <usleep@plt>
    for (long i = 0; i < 3; i++) {
    29ad:	48 83 45 80 01       	addq   $0x1,-0x80(%rbp)
    29b2:	48 83 7d 80 02       	cmpq   $0x2,-0x80(%rbp)
    29b7:	0f 8e 61 ff ff ff    	jle    291e <_Z23example_pthread_barrierv+0x92>
    }
    for (int i = 0; i < 3; i++) {
    29bd:	c7 85 70 ff ff ff 00 	movl   $0x0,-0x90(%rbp)
    29c4:	00 00 00 
    29c7:	e9 9f 00 00 00       	jmp    2a6b <_Z23example_pthread_barrierv+0x1df>
        void* retval;
        ret = pthread_join(workers[i], &retval);
    29cc:	8b 85 70 ff ff ff    	mov    -0x90(%rbp),%eax
    29d2:	48 98                	cltq
    29d4:	48 8b 44 c5 90       	mov    -0x70(%rbp,%rax,8),%rax
    29d9:	48 8d 95 78 ff ff ff 	lea    -0x88(%rbp),%rdx
    29e0:	48 89 d6             	mov    %rdx,%rsi
    29e3:	48 89 c7             	mov    %rax,%rdi
    29e6:	e8 f5 e9 ff ff       	call   13e0 <pthread_join@plt>
    29eb:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%rbp)
        if (ret != 0) {
    29f1:	83 bd 74 ff ff ff 00 	cmpl   $0x0,-0x8c(%rbp)
    29f8:	74 33                	je     2a2d <_Z23example_pthread_barrierv+0x1a1>
            fprintf(stderr, "pthread_join (worker %d) failed: %s\n", i, strerror(ret));
    29fa:	8b 85 74 ff ff ff    	mov    -0x8c(%rbp),%eax
    2a00:	89 c7                	mov    %eax,%edi
    2a02:	e8 e9 e9 ff ff       	call   13f0 <strerror@plt>
    2a07:	48 89 c1             	mov    %rax,%rcx
    2a0a:	48 8b 05 0f 26 00 00 	mov    0x260f(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    2a11:	8b 95 70 ff ff ff    	mov    -0x90(%rbp),%edx
    2a17:	48 8d 35 92 0d 00 00 	lea    0xd92(%rip),%rsi        # 37b0 <_IO_stdin_used+0x7b0>
    2a1e:	48 89 c7             	mov    %rax,%rdi
    2a21:	b8 00 00 00 00       	mov    $0x0,%eax
    2a26:	e8 05 e9 ff ff       	call   1330 <fprintf@plt>
    2a2b:	eb 37                	jmp    2a64 <_Z23example_pthread_barrierv+0x1d8>
        } else if (retval != NULL) {
    2a2d:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
    2a34:	48 85 c0             	test   %rax,%rax
    2a37:	74 2b                	je     2a64 <_Z23example_pthread_barrierv+0x1d8>
            fprintf(stderr, "Worker %d returned error: %ld\n", i, (long)(intptr_t)retval);
    2a39:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
    2a40:	48 89 c1             	mov    %rax,%rcx
    2a43:	48 8b 05 d6 25 00 00 	mov    0x25d6(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    2a4a:	8b 95 70 ff ff ff    	mov    -0x90(%rbp),%edx
    2a50:	48 8d 35 81 0d 00 00 	lea    0xd81(%rip),%rsi        # 37d8 <_IO_stdin_used+0x7d8>
    2a57:	48 89 c7             	mov    %rax,%rdi
    2a5a:	b8 00 00 00 00       	mov    $0x0,%eax
    2a5f:	e8 cc e8 ff ff       	call   1330 <fprintf@plt>
    for (int i = 0; i < 3; i++) {
    2a64:	83 85 70 ff ff ff 01 	addl   $0x1,-0x90(%rbp)
    2a6b:	83 bd 70 ff ff ff 02 	cmpl   $0x2,-0x90(%rbp)
    2a72:	0f 8e 54 ff ff ff    	jle    29cc <_Z23example_pthread_barrierv+0x140>
        }
    }
    ret = pthread_barrier_destroy(&barrier);
    2a78:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
    2a7c:	48 89 c7             	mov    %rax,%rdi
    2a7f:	e8 3c e8 ff ff       	call   12c0 <pthread_barrier_destroy@plt>
    2a84:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%rbp)
    if (ret != 0) {
    2a8a:	83 bd 74 ff ff ff 00 	cmpl   $0x0,-0x8c(%rbp)
    2a91:	74 33                	je     2ac6 <_Z23example_pthread_barrierv+0x23a>
        fprintf(stderr, "pthread_barrier_destroy failed: %s\n", strerror(ret));
    2a93:	8b 85 74 ff ff ff    	mov    -0x8c(%rbp),%eax
    2a99:	89 c7                	mov    %eax,%edi
    2a9b:	e8 50 e9 ff ff       	call   13f0 <strerror@plt>
    2aa0:	48 89 c2             	mov    %rax,%rdx
    2aa3:	48 8b 05 76 25 00 00 	mov    0x2576(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    2aaa:	48 8d 0d 47 0d 00 00 	lea    0xd47(%rip),%rcx        # 37f8 <_IO_stdin_used+0x7f8>
    2ab1:	48 89 ce             	mov    %rcx,%rsi
    2ab4:	48 89 c7             	mov    %rax,%rdi
    2ab7:	b8 00 00 00 00       	mov    $0x0,%eax
    2abc:	e8 6f e8 ff ff       	call   1330 <fprintf@plt>
        return;
    2ac1:	e9 c3 01 00 00       	jmp    2c89 <_Z23example_pthread_barrierv+0x3fd>
    }

    // Attribute: Process shared barrier
    pthread_barrierattr_t barrierattr;
    ret = pthread_barrierattr_init(&barrierattr);
    2ac6:	48 8d 45 8c          	lea    -0x74(%rbp),%rax
    2aca:	48 89 c7             	mov    %rax,%rdi
    2acd:	e8 8e e8 ff ff       	call   1360 <pthread_barrierattr_init@plt>
    2ad2:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%rbp)
    if (ret != 0) {
    2ad8:	83 bd 74 ff ff ff 00 	cmpl   $0x0,-0x8c(%rbp)
    2adf:	74 33                	je     2b14 <_Z23example_pthread_barrierv+0x288>
        fprintf(stderr, "pthread_barrierattr_init failed: %s\n", strerror(ret));
    2ae1:	8b 85 74 ff ff ff    	mov    -0x8c(%rbp),%eax
    2ae7:	89 c7                	mov    %eax,%edi
    2ae9:	e8 02 e9 ff ff       	call   13f0 <strerror@plt>
    2aee:	48 89 c2             	mov    %rax,%rdx
    2af1:	48 8b 05 28 25 00 00 	mov    0x2528(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    2af8:	48 8d 0d 21 0d 00 00 	lea    0xd21(%rip),%rcx        # 3820 <_IO_stdin_used+0x820>
    2aff:	48 89 ce             	mov    %rcx,%rsi
    2b02:	48 89 c7             	mov    %rax,%rdi
    2b05:	b8 00 00 00 00       	mov    $0x0,%eax
    2b0a:	e8 21 e8 ff ff       	call   1330 <fprintf@plt>
        return;
    2b0f:	e9 75 01 00 00       	jmp    2c89 <_Z23example_pthread_barrierv+0x3fd>
    }
    ret = pthread_barrierattr_setpshared(&barrierattr, PTHREAD_PROCESS_SHARED);
    2b14:	48 8d 45 8c          	lea    -0x74(%rbp),%rax
    2b18:	be 01 00 00 00       	mov    $0x1,%esi
    2b1d:	48 89 c7             	mov    %rax,%rdi
    2b20:	e8 1b e7 ff ff       	call   1240 <pthread_barrierattr_setpshared@plt>
    2b25:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%rbp)
    if (ret != 0) {
    2b2b:	83 bd 74 ff ff ff 00 	cmpl   $0x0,-0x8c(%rbp)
    2b32:	74 3f                	je     2b73 <_Z23example_pthread_barrierv+0x2e7>
        fprintf(stderr, "pthread_barrierattr_setpshared failed: %s\n", strerror(ret));
    2b34:	8b 85 74 ff ff ff    	mov    -0x8c(%rbp),%eax
    2b3a:	89 c7                	mov    %eax,%edi
    2b3c:	e8 af e8 ff ff       	call   13f0 <strerror@plt>
    2b41:	48 89 c2             	mov    %rax,%rdx
    2b44:	48 8b 05 d5 24 00 00 	mov    0x24d5(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    2b4b:	48 8d 0d f6 0c 00 00 	lea    0xcf6(%rip),%rcx        # 3848 <_IO_stdin_used+0x848>
    2b52:	48 89 ce             	mov    %rcx,%rsi
    2b55:	48 89 c7             	mov    %rax,%rdi
    2b58:	b8 00 00 00 00       	mov    $0x0,%eax
    2b5d:	e8 ce e7 ff ff       	call   1330 <fprintf@plt>
        pthread_barrierattr_destroy(&barrierattr);
    2b62:	48 8d 45 8c          	lea    -0x74(%rbp),%rax
    2b66:	48 89 c7             	mov    %rax,%rdi
    2b69:	e8 e2 e7 ff ff       	call   1350 <pthread_barrierattr_destroy@plt>
        return;
    2b6e:	e9 16 01 00 00       	jmp    2c89 <_Z23example_pthread_barrierv+0x3fd>
    }
    pthread_barrier_t shared_barrier;
    ret = pthread_barrier_init(&shared_barrier, &barrierattr, 2);
    2b73:	48 8d 4d 8c          	lea    -0x74(%rbp),%rcx
    2b77:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
    2b7b:	ba 02 00 00 00       	mov    $0x2,%edx
    2b80:	48 89 ce             	mov    %rcx,%rsi
    2b83:	48 89 c7             	mov    %rax,%rdi
    2b86:	e8 c5 e6 ff ff       	call   1250 <pthread_barrier_init@plt>
    2b8b:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%rbp)
    if (ret != 0) {
    2b91:	83 bd 74 ff ff ff 00 	cmpl   $0x0,-0x8c(%rbp)
    2b98:	74 3f                	je     2bd9 <_Z23example_pthread_barrierv+0x34d>
        fprintf(stderr, "pthread_barrier_init failed: %s\n", strerror(ret));
    2b9a:	8b 85 74 ff ff ff    	mov    -0x8c(%rbp),%eax
    2ba0:	89 c7                	mov    %eax,%edi
    2ba2:	e8 49 e8 ff ff       	call   13f0 <strerror@plt>
    2ba7:	48 89 c2             	mov    %rax,%rdx
    2baa:	48 8b 05 6f 24 00 00 	mov    0x246f(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    2bb1:	48 8d 0d a8 0b 00 00 	lea    0xba8(%rip),%rcx        # 3760 <_IO_stdin_used+0x760>
    2bb8:	48 89 ce             	mov    %rcx,%rsi
    2bbb:	48 89 c7             	mov    %rax,%rdi
    2bbe:	b8 00 00 00 00       	mov    $0x0,%eax
    2bc3:	e8 68 e7 ff ff       	call   1330 <fprintf@plt>
        pthread_barrierattr_destroy(&barrierattr);
    2bc8:	48 8d 45 8c          	lea    -0x74(%rbp),%rax
    2bcc:	48 89 c7             	mov    %rax,%rdi
    2bcf:	e8 7c e7 ff ff       	call   1350 <pthread_barrierattr_destroy@plt>
        return;
    2bd4:	e9 b0 00 00 00       	jmp    2c89 <_Z23example_pthread_barrierv+0x3fd>
    }
    printf("Barrier Attr: Set to process shared\n");
    2bd9:	48 8d 05 98 0c 00 00 	lea    0xc98(%rip),%rax        # 3878 <_IO_stdin_used+0x878>
    2be0:	48 89 c7             	mov    %rax,%rdi
    2be3:	e8 78 e6 ff ff       	call   1260 <puts@plt>
    ret = pthread_barrier_destroy(&shared_barrier);
    2be8:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
    2bec:	48 89 c7             	mov    %rax,%rdi
    2bef:	e8 cc e6 ff ff       	call   12c0 <pthread_barrier_destroy@plt>
    2bf4:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%rbp)
    if (ret != 0) {
    2bfa:	83 bd 74 ff ff ff 00 	cmpl   $0x0,-0x8c(%rbp)
    2c01:	74 2e                	je     2c31 <_Z23example_pthread_barrierv+0x3a5>
        fprintf(stderr, "pthread_barrier_destroy failed: %s\n", strerror(ret));
    2c03:	8b 85 74 ff ff ff    	mov    -0x8c(%rbp),%eax
    2c09:	89 c7                	mov    %eax,%edi
    2c0b:	e8 e0 e7 ff ff       	call   13f0 <strerror@plt>
    2c10:	48 89 c2             	mov    %rax,%rdx
    2c13:	48 8b 05 06 24 00 00 	mov    0x2406(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    2c1a:	48 8d 0d d7 0b 00 00 	lea    0xbd7(%rip),%rcx        # 37f8 <_IO_stdin_used+0x7f8>
    2c21:	48 89 ce             	mov    %rcx,%rsi
    2c24:	48 89 c7             	mov    %rax,%rdi
    2c27:	b8 00 00 00 00       	mov    $0x0,%eax
    2c2c:	e8 ff e6 ff ff       	call   1330 <fprintf@plt>
    }
    ret = pthread_barrierattr_destroy(&barrierattr);
    2c31:	48 8d 45 8c          	lea    -0x74(%rbp),%rax
    2c35:	48 89 c7             	mov    %rax,%rdi
    2c38:	e8 13 e7 ff ff       	call   1350 <pthread_barrierattr_destroy@plt>
    2c3d:	89 85 74 ff ff ff    	mov    %eax,-0x8c(%rbp)
    if (ret != 0) {
    2c43:	83 bd 74 ff ff ff 00 	cmpl   $0x0,-0x8c(%rbp)
    2c4a:	74 2e                	je     2c7a <_Z23example_pthread_barrierv+0x3ee>
        fprintf(stderr, "pthread_barrierattr_destroy failed: %s\n", strerror(ret));
    2c4c:	8b 85 74 ff ff ff    	mov    -0x8c(%rbp),%eax
    2c52:	89 c7                	mov    %eax,%edi
    2c54:	e8 97 e7 ff ff       	call   13f0 <strerror@plt>
    2c59:	48 89 c2             	mov    %rax,%rdx
    2c5c:	48 8b 05 bd 23 00 00 	mov    0x23bd(%rip),%rax        # 5020 <stderr@GLIBC_2.2.5>
    2c63:	48 8d 0d 36 0c 00 00 	lea    0xc36(%rip),%rcx        # 38a0 <_IO_stdin_used+0x8a0>
    2c6a:	48 89 ce             	mov    %rcx,%rsi
    2c6d:	48 89 c7             	mov    %rax,%rdi
    2c70:	b8 00 00 00 00       	mov    $0x0,%eax
    2c75:	e8 b6 e6 ff ff       	call   1330 <fprintf@plt>
    }

    printf("=== Ending example_pthread_barrier ===\n\n");
    2c7a:	48 8d 05 47 0c 00 00 	lea    0xc47(%rip),%rax        # 38c8 <_IO_stdin_used+0x8c8>
    2c81:	48 89 c7             	mov    %rax,%rdi
    2c84:	e8 d7 e5 ff ff       	call   1260 <puts@plt>
}
    2c89:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    2c8d:	64 48 2b 04 25 28 00 	sub    %fs:0x28,%rax
    2c94:	00 00 
    2c96:	74 05                	je     2c9d <_Z23example_pthread_barrierv+0x411>
    2c98:	e8 03 e6 ff ff       	call   12a0 <__stack_chk_fail@plt>
    2c9d:	c9                   	leave
    2c9e:	c3                   	ret

0000000000002c9f <main>:

int main()
{
    2c9f:	f3 0f 1e fa          	endbr64
    2ca3:	55                   	push   %rbp
    2ca4:	48 89 e5             	mov    %rsp,%rbp
    example_pthread_mutex();
    2ca7:	e8 02 ec ff ff       	call   18ae <_Z21example_pthread_mutexv>
    // example_pthread_condvar();
    // example_pthread_barrier();
    return 0;
    2cac:	b8 00 00 00 00       	mov    $0x0,%eax
    2cb1:	5d                   	pop    %rbp
    2cb2:	c3                   	ret

Disassembly of section .fini:

0000000000002cb4 <_fini>:
    2cb4:	f3 0f 1e fa          	endbr64
    2cb8:	48 83 ec 08          	sub    $0x8,%rsp
    2cbc:	48 83 c4 08          	add    $0x8,%rsp
    2cc0:	c3                   	ret
