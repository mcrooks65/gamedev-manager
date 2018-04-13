# 1st Seeds - Developer RogueWare and their first and only current title FreeHolder (game is associated with rogueware.. however rogueware is not yet associated properly with game)
@rogueware = Developer.create(name: "RogueWare", password: "test", location:"Los Angeles, CA", employees: 2)
Game.create(title: "FreeHolder", developer: @rogueware, price: 9.99, genre: "strategy/rpg/roguelike", description: "
Blending strategy, survival, and roguelike elements with RPG style character development, FreeHolder is the story of three escaped slaves in the time of the Roman Republic. Farm, hunt, craft, and cook your way through the years as you live on the edge of the beginning of the Empire.")

# 2nd Seeds - additional games (no associated devleopers)
Game.create(title: "TestMan", price: 4.99, genre: "notarealgame", description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
