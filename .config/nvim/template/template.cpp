/*
___  ___          _        _            ___  ____ _                    _____ _         ___  ___                            
|  \/  |         | |      | |           |  \/  (_) |                  |_   _| |        |  \/  |                            
| .  . | __ _  __| | ___  | |__  _   _  | .  . |_| |__  _ __   ___  __ _| | | |__   ___| .  . | ___   __ _  __ _  ___ _ __ 
| |\/| |/ _` |/ _` |/ _ \ | '_ \| | | | | |\/| | | '_ \| '_ \ / _ \/ _` | | | '_ \ / _ \ |\/| |/ _ \ / _` |/ _` |/ _ \ '__|
| |  | | (_| | (_| |  __/ | |_) | |_| | | |  | | | | | | | | |  __/ (_| | | | | | |  __/ |  | | (_) | (_| | (_| |  __/ |   
\_|  |_/\__,_|\__,_|\___| |_.__/ \__, | \_|  |_/_|_| |_|_| |_|\___|\__,_\_/ |_| |_|\___\_|  |_/\___/ \__, |\__, |\___|_|   
                                  __/ |                                                               __/ | __/ |          
                                 |___/                                                               |___/ |___/           
*/

#pragma GCC optimize("Ofast,unroll-loops")
#include <bits/stdc++.h>
#pragma GCC target("avx2,popcnt,tune=native")
using namespace std;

const string TASK_NAME = "";
#define   DSYNC_WITH_STDIO 1
#define        USE_FILE_IO 0

#define MULTIPLE_TESTCASES 1
#define  DEF_INT_LONG_LONG 1

#if !defined(LOCAL) && USE_FILE_IO == 1
ifstream fin(TASK_NAME + ".in");
ofstream fout(TASK_NAME + ".out");
#define cin fin
#define cout fout
#endif

#define ll long long
#define ull unsigned long long
#if DEF_INT_LONG_LONG == 1
#define int long long
#define uint unsigned long long
#else
#define uint unsigned int
#endif

class solution {
public:
	// $(JUDGE)/$(CONTEST)/$(PROBLEM) 
	// TL: $(TIMELIM) ms
	// ML: $(MEMLIM) MB	

	void pregen() {
		
	}

	unsigned TESTCASE_COUNT = 1;
	void run(const unsigned &TESTCASE) {

	}

	solution() {
		pregen();
		if (MULTIPLE_TESTCASES)
			cin >> TESTCASE_COUNT;
		for (unsigned TESTCASE = 1; TESTCASE <= TESTCASE_COUNT; run(TESTCASE ++));
	}
};

signed main() {
#if DSYNC_WITH_STDIO == 1
	ios_base::sync_with_stdio(false);
	cin.tie(nullptr);
#endif
	solution sol;
	return 0;
}
