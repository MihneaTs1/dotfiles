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

#define DEFINE_INT_LONG_LONG 1
#define FAST_IO 1
#define FILE_IO 0

#define ll long long
#define ull unsigned long long
#if DEFINE_INT_LONG_LONG == 1
#define int long long
#define uint unsigned long long
#else
#define uint unsigned int
#endif

#if !defined(LOCAL) && FILE_IO == 1
ifstream fin(TASK_NAME + ".in");
ofstream fout(TASK_NAME + ".out");
#define cin fin
#define cout fout
#endif

void solve() {
	
}

signed main() {
#if FAST_IO == 1
	ios_base::sync_with_stdio(false);
	cin.tie(nullptr);
#endif
	solve();
	return 0;
}
