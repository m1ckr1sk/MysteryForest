Feature: Non playable characters

Scenario: Should display people in room when a room is entered
Given that I have some rooms
|id| location x | location y | description	 |
|1 | 0          | 0			 | entrance room |
|2 | 0          | 1			 | north room    |
And I have some people in the rooms
| room | name       | description       				| script         |
|	1  | george     | An old man with a crooked nose    |                |
When I issue no commands
Then the game will respond with exactly
|output						|
|clear						|
|welcome					|
|							|
|entrance room				|
|You can go: north 			|	 
|You see: george         	|
|'> ' 						|
|clear						|
|Thanks for playing!		|

Scenario: Should describe people in room when looked at
Given that I have some rooms
|id| location x | location y | description	 |
|1 | 0          | 0			 | entrance room |
|2 | 0          | 1			 | north room    |
And I have some people in the rooms
| room | name       | description       				| script         |
|	1  | george     | An old man with a crooked nose    |                |
When I issue the commands
|command		    |
|look at george		|
Then the game will respond with exactly
|output						|
|clear						|
|welcome					|
|							|
|entrance room				|
|You can go: north 			|	 
|You see: george         	|
|'> ' 						|
| clear                     |
| An old man with a crooked nose |
|                           |
| entrance room             |
| You see: george           |
| You can go: north         |
| '> '                      |
|clear						|
|Thanks for playing!		|
