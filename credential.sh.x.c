#if 0
	shc Version 3.8.9, Generic Script Compiler
	Copyright (c) 1994-2012 Francisco Rosales <frosal@fi.upm.es>

	shc -v -r -f credential.sh 
#endif

static  char data [] = 
#define      msg1_z	42
#define      msg1	((&data[10]))
	"\250\305\031\017\362\157\065\225\250\016\101\021\142\063\037\351"
	"\031\245\145\247\003\324\010\321\273\104\031\007\176\263\125\327"
	"\361\377\066\150\301\272\240\211\074\177\075\217\340\017\245\257"
	"\343\244\141\363\005\233\210\162\007\021\150\011\303\162"
#define      text_z	396
#define      text	((&data[136]))
	"\112\057\143\200\067\175\175\052\046\103\103\066\066\263\153\313"
	"\133\172\321\366\002\104\376\023\254\007\327\037\334\225\203\047"
	"\305\347\247\374\144\044\047\213\150\152\301\236\036\054\151\171"
	"\246\072\160\251\177\156\275\053\166\224\113\122\051\317\172\356"
	"\266\041\353\033\106\022\246\256\175\147\372\132\210\305\322\141"
	"\162\266\132\231\274\164\107\114\303\135\312\207\050\305\211\140"
	"\112\043\226\223\372\116\163\364\024\322\135\333\100\372\043\323"
	"\104\343\024\144\160\145\275\254\052\070\374\207\064\137\157\033"
	"\072\034\337\033\134\346\104\305\346\251\051\310\303\337\004\217"
	"\057\315\110\036\070\270\064\362\122\127\166\043\061\071\033\270"
	"\174\234\220\145\160\152\317\165\135\156\257\060\361\241\307\074"
	"\170\331\200\033\002\044\224\242\306\261\070\322\043\367\047\353"
	"\047\037\017\002\071\131\013\126\300\141\214\137\307\165\270\366"
	"\136\303\037\077\300\264\324\217\237\355\250\143\337\373\241\025"
	"\344\115\033\373\300\317\214\031\376\334\040\246\131\154\161\177"
	"\102\365\133\234\057\061\361\252\304\350\273\045\073\035\100\122"
	"\250\370\357\004\166\240\253\126\273\271\031\177\264\154\003\312"
	"\277\365\134\333\354\350\124\171\153\121\362\070\357\106\177\042"
	"\351\311\361\341\030\010\157\040\101\256\117\307\301\051\163\237"
	"\253\032\351\330\241\022\063\115\307\003\112\060\302\154\147\107"
	"\276\036\251\027\127\320\206\261\145\011\053\355\037\373\060\323"
	"\145\254\065\162\253\040\122\361\155\036\000\056\137\012\340\324"
	"\262\163\201\137\115\313\162\320\332\331\016\374\222\106\032\366"
	"\300\310\060\376\105\351\314\313\172\360\213\244\303\170\172\245"
	"\275\221\066\111\004\177\365\171\242\352\341\306\350\224\037\224"
	"\073\143\267\375\201\002\242\147\302\361\350\110\003\337\313\250"
	"\337\343\105\052\125\054\024\267\011\303\356\122\220\111\243\276"
	"\161\051\032\027\014\065\314\154\315\063\033\002\051\346\271\152"
	"\322\333\032\010\165\111\207\262\044\357\100\231\251\322\362\032"
	"\056\057\246\060\347\076\114\233\224\266\025\072\361\205\344\160"
	"\364\241\234\152\065\347\275\136\266\067\115\154\130\070\210\237"
	"\113\056\116\311\226\233\144\052\122\172\145\103\377"
#define      inlo_z	3
#define      inlo	((&data[571]))
	"\115\005\114"
#define      tst2_z	19
#define      tst2	((&data[575]))
	"\037\011\261\125\131\074\263\246\007\141\247\163\354\210\214\325"
	"\347\214\216\143\067"
#define      date_z	1
#define      date	((&data[595]))
	"\271"
#define      xecc_z	15
#define      xecc	((&data[599]))
	"\254\004\342\064\153\351\220\052\354\046\021\223\202\046\242\100"
	"\311\303\113"
#define      lsto_z	1
#define      lsto	((&data[615]))
	"\227"
#define      shll_z	10
#define      shll	((&data[617]))
	"\176\377\023\332\361\311\266\363\166\123\040"
#define      chk2_z	19
#define      chk2	((&data[629]))
	"\067\313\017\133\134\216\267\262\175\211\033\151\101\237\173\315"
	"\064\241\244\033\371\370\201\177\355"
#define      tst1_z	22
#define      tst1	((&data[656]))
	"\213\006\147\012\304\260\167\043\174\043\153\117\201\364\166\137"
	"\320\053\173\135\160\043\176\141\214\373\364"
#define      rlax_z	1
#define      rlax	((&data[679]))
	"\022"
#define      chk1_z	22
#define      chk1	((&data[685]))
	"\262\053\103\114\105\242\004\024\357\314\331\367\066\133\056\054"
	"\122\243\025\042\070\263\246\104\073\077\053\353"
#define      msg2_z	19
#define      msg2	((&data[711]))
	"\011\274\365\217\043\206\137\336\065\322\140\340\375\363\056\052"
	"\162\304\272\074\250\153\324\265\166"
#define      opts_z	1
#define      opts	((&data[733]))
	"\377"
#define      pswd_z	256
#define      pswd	((&data[794]))
	"\052\126\170\036\020\116\156\167\051\240\051\124\344\166\232\320"
	"\370\136\216\002\033\204\327\320\373\053\163\335\116\142\113\170"
	"\270\303\227\311\022\005\100\073\246\152\220\212\340\052\133\330"
	"\210\351\332\243\155\261\164\150\334\350\106\053\144\032\103\274"
	"\372\056\277\051\057\104\122\257\006\146\361\377\111\363\300\161"
	"\267\316\042\110\007\033\366\166\316\242\036\063\275\142\357\267"
	"\220\257\341\300\363\063\157\372\231\141\371\343\124\272\124\013"
	"\211\167\123\221\222\112\007\141\355\045\224\252\207\204\142\030"
	"\063\103\330\047\167\107\041\020\250\033\364\375\326\111\010\137"
	"\301\134\360\123\246\370\265\224\035\112\076\245\316\241\275\002"
	"\344\225\052\133\335\113\154\206\147\141\203\075\252\213\235\153"
	"\347\216\277\216\206\164\042\243\277\141\110\215\002\006\217\347"
	"\234\271\102\171\005\257\377\155\020\202\253\273\016\110\047\366"
	"\326\346\204\134\133\247\000\032\011\110\250\013\117\070\362\353"
	"\361\065\144\367\345\144\145\365\346\020\261\365\130\330\353\057"
	"\277\160\213\033\030\213\066\041\324\336\054\043\026\037\016\010"
	"\125\163\000\072\327\145\060\276\165\341\264\315\272\237\374\171"
	"\020\210\224\050\024\312\111\350\251\166\014\277\226\033\310\353"
	"\216\310\046\146\055\126\045\242\070\331\160\362\171\155\154\211"
	"\365\001\261\011\314\373\362\165\161\376\065\007\112\222\243\003"
	"\125\072\314\150\100\014\243\346\166\063\161\127\135\314\057\346"
	"\266\012\212\044\274\377\215"/* End of data[] */;
#define      hide_z	4096
#define DEBUGEXEC	0	/* Define as 1 to debug execvp calls */
#define TRACEABLE	0	/* Define as 1 to enable ptrace the executable */

/* rtc.c */

#include <sys/stat.h>
#include <sys/types.h>

#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>

/* 'Alleged RC4' */

static unsigned char stte[256], indx, jndx, kndx;

/*
 * Reset arc4 stte. 
 */
void stte_0(void)
{
	indx = jndx = kndx = 0;
	do {
		stte[indx] = indx;
	} while (++indx);
}

/*
 * Set key. Can be used more than once. 
 */
void key(void * str, int len)
{
	unsigned char tmp, * ptr = (unsigned char *)str;
	while (len > 0) {
		do {
			tmp = stte[indx];
			kndx += tmp;
			kndx += ptr[(int)indx % len];
			stte[indx] = stte[kndx];
			stte[kndx] = tmp;
		} while (++indx);
		ptr += 256;
		len -= 256;
	}
}

/*
 * Crypt data. 
 */
void arc4(void * str, int len)
{
	unsigned char tmp, * ptr = (unsigned char *)str;
	while (len > 0) {
		indx++;
		tmp = stte[indx];
		jndx += tmp;
		stte[indx] = stte[jndx];
		stte[jndx] = tmp;
		tmp += stte[indx];
		*ptr ^= stte[tmp];
		ptr++;
		len--;
	}
}

/* End of ARC4 */

/*
 * Key with file invariants. 
 */
int key_with_file(char * file)
{
	struct stat statf[1];
	struct stat control[1];

	if (stat(file, statf) < 0)
		return -1;

	/* Turn on stable fields */
	memset(control, 0, sizeof(control));
	control->st_ino = statf->st_ino;
	control->st_dev = statf->st_dev;
	control->st_rdev = statf->st_rdev;
	control->st_uid = statf->st_uid;
	control->st_gid = statf->st_gid;
	control->st_size = statf->st_size;
	control->st_mtime = statf->st_mtime;
	control->st_ctime = statf->st_ctime;
	key(control, sizeof(control));
	return 0;
}

#if DEBUGEXEC
void debugexec(char * sh11, int argc, char ** argv)
{
	int i;
	fprintf(stderr, "shll=%s\n", sh11 ? sh11 : "<null>");
	fprintf(stderr, "argc=%d\n", argc);
	if (!argv) {
		fprintf(stderr, "argv=<null>\n");
	} else { 
		for (i = 0; i <= argc ; i++)
			fprintf(stderr, "argv[%d]=%.60s\n", i, argv[i] ? argv[i] : "<null>");
	}
}
#endif /* DEBUGEXEC */

void rmarg(char ** argv, char * arg)
{
	for (; argv && *argv && *argv != arg; argv++);
	for (; argv && *argv; argv++)
		*argv = argv[1];
}

int chkenv(int argc)
{
	char buff[512];
	unsigned long mask, m;
	int l, a, c;
	char * string;
	extern char ** environ;

	mask  = (unsigned long)&chkenv;
	mask ^= (unsigned long)getpid() * ~mask;
	sprintf(buff, "x%lx", mask);
	string = getenv(buff);
#if DEBUGEXEC
	fprintf(stderr, "getenv(%s)=%s\n", buff, string ? string : "<null>");
#endif
	l = strlen(buff);
	if (!string) {
		/* 1st */
		sprintf(&buff[l], "=%lu %d", mask, argc);
		putenv(strdup(buff));
		return 0;
	}
	c = sscanf(string, "%lu %d%c", &m, &a, buff);
	if (c == 2 && m == mask) {
		/* 3rd */
		rmarg(environ, &string[-l - 1]);
		return 1 + (argc - a);
	}
	return -1;
}

#if !TRACEABLE

#define _LINUX_SOURCE_COMPAT
#include <sys/ptrace.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <fcntl.h>
#include <signal.h>
#include <stdio.h>
#include <unistd.h>

#if !defined(PTRACE_ATTACH) && defined(PT_ATTACH)
#	define PTRACE_ATTACH	PT_ATTACH
#endif
void untraceable(char * argv0)
{
	char proc[80];
	int pid, mine;

	switch(pid = fork()) {
	case  0:
		pid = getppid();
		/* For problematic SunOS ptrace */
#if defined(__FreeBSD__)
		sprintf(proc, "/proc/%d/mem", (int)pid);
#else
		sprintf(proc, "/proc/%d/as",  (int)pid);
#endif
		close(0);
		mine = !open(proc, O_RDWR|O_EXCL);
		if (!mine && errno != EBUSY)
			mine = !ptrace(PTRACE_ATTACH, pid, 0, 0);
		if (mine) {
			kill(pid, SIGCONT);
		} else {
			perror(argv0);
			kill(pid, SIGKILL);
		}
		_exit(mine);
	case -1:
		break;
	default:
		if (pid == waitpid(pid, 0, 0))
			return;
	}
	perror(argv0);
	_exit(1);
}
#endif /* !TRACEABLE */

char * xsh(int argc, char ** argv)
{
	char * scrpt;
	int ret, i, j;
	char ** varg;
	char * me = getenv("_");
	if (me == NULL) { me = argv[0]; }

	stte_0();
	 key(pswd, pswd_z);
	arc4(msg1, msg1_z);
	arc4(date, date_z);
	if (date[0] && (atoll(date)<time(NULL)))
		return msg1;
	arc4(shll, shll_z);
	arc4(inlo, inlo_z);
	arc4(xecc, xecc_z);
	arc4(lsto, lsto_z);
	arc4(tst1, tst1_z);
	 key(tst1, tst1_z);
	arc4(chk1, chk1_z);
	if ((chk1_z != tst1_z) || memcmp(tst1, chk1, tst1_z))
		return tst1;
	ret = chkenv(argc);
	arc4(msg2, msg2_z);
	if (ret < 0)
		return msg2;
	varg = (char **)calloc(argc + 10, sizeof(char *));
	if (!varg)
		return 0;
	if (ret) {
		arc4(rlax, rlax_z);
		if (!rlax[0] && key_with_file(shll))
			return shll;
		arc4(opts, opts_z);
		arc4(text, text_z);
		arc4(tst2, tst2_z);
		 key(tst2, tst2_z);
		arc4(chk2, chk2_z);
		if ((chk2_z != tst2_z) || memcmp(tst2, chk2, tst2_z))
			return tst2;
		/* Prepend hide_z spaces to script text to hide it. */
		scrpt = malloc(hide_z + text_z);
		if (!scrpt)
			return 0;
		memset(scrpt, (int) ' ', hide_z);
		memcpy(&scrpt[hide_z], text, text_z);
	} else {			/* Reexecute */
		if (*xecc) {
			scrpt = malloc(512);
			if (!scrpt)
				return 0;
			sprintf(scrpt, xecc, me);
		} else {
			scrpt = me;
		}
	}
	j = 0;
	varg[j++] = argv[0];		/* My own name at execution */
	if (ret && *opts)
		varg[j++] = opts;	/* Options on 1st line of code */
	if (*inlo)
		varg[j++] = inlo;	/* Option introducing inline code */
	varg[j++] = scrpt;		/* The script itself */
	if (*lsto)
		varg[j++] = lsto;	/* Option meaning last option */
	i = (ret > 1) ? ret : 0;	/* Args numbering correction */
	while (i < argc)
		varg[j++] = argv[i++];	/* Main run-time arguments */
	varg[j] = 0;			/* NULL terminated array */
#if DEBUGEXEC
	debugexec(shll, j, varg);
#endif
	execvp(shll, varg);
	return shll;
}

int main(int argc, char ** argv)
{
#if DEBUGEXEC
	debugexec("main", argc, argv);
#endif
#if !TRACEABLE
	untraceable(argv[0]);
#endif
	argv[1] = xsh(argc, argv);
	fprintf(stderr, "%s%s%s: %s\n", argv[0],
		errno ? ": " : "",
		errno ? strerror(errno) : "",
		argv[1] ? argv[1] : "<null>"
	);
	return 1;
}
