@rogueware = Developer.create(name: "RogueWare", password: "test", location:"Los Angeles, CA", employees: 2)
Game.create(title: "FreeHolder", developer: @rogueware, price: 9.99, genre: "strategy/rpg/roguelike", description: "
Blending strategy, survival, and roguelike elements with RPG style character development, FreeHolder is the story of three escaped slaves in the time of the Roman Republic. Farm, hunt, craft, and cook your way through the years as you live on the edge of the beginning of the Empire.")
