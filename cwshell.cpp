#include <iostream>
#include <string.h>
#include <stdlib.h>
using namespace std;

int main()
{
	string cmd;
	const string USERNAME = "cwadmin";
	const string PASSWORD = "ABonetwo!@";
	string username, password;
	system("linux_logo -c -u -t \'Welcome From CyberWings SHell\'");
	cout << "Enter Username : ";
	cin >> username;
	cout << "Enter Password : ";
	cin >> password;

	if(username == USERNAME && password == PASSWORD)
	{
	while(cmd != "exit")
	{
	 	system(cmd.c_str());
	cout << "#cwshell -> ";
	std::getline(std::cin, cmd);
	}
	}
	else
	{ 
		cout << "Invalid login " << endl;
	}
	return 0;
}
