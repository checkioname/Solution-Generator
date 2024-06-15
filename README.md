# Solution-Generator


This script has the functionality to automate the creation of .NET solutions <br>
For now, this code supports the creation of solutions based on the Hexagonal Archtecture. <br>
The use de script simply run: <br> 

```bash
# Let the script run as a program
chmod +x solution_generator.sh

# Run it
./solution_generator.sh <project path> <project name>
```

The structure of the solution will be like that:
```
MyProject/
├── 1. Driving/
│   └── API/
│       ├── (You can create those folders later) 
│       ├── Controllers/ 
│       ├── Requests/
│       └── Responses/
│
├── 2. Core/ 
│   ├── Application/
│   │   ├── (You can create those folders later) 
│   │   └── Services/
│   │
│   └── Domain/
│       ├── (You can create those folders later) 
│       ├── Entities/
│       ├── Requests/
│       └── Responses/
│
├── 3. Driven/ 
│   └── Data/
│       ├── (You can create those folders later) 
│       └── Repositories/
│
├── 4.Tests/
│   └──  Unit/
│
└── solution.sln
```
