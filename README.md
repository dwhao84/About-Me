#  About me App
This is practice from Apple, it teaches you how to use the SwiftUI to build an App b using Apple way.
[About Me](https://developer.apple.com/tutorials/sample-apps/aboutme)

## About Me
Display data from a central source in multiple views.

Welcome to the About Me app. In this walkthrough, 

you’ll learn the basics of using SwiftUI to display information across multiple tab views.

Run the preview and tap to select the Home, Story, Favorites, and Fun Facts tabs at the bottom of the screen.

You can change all of the data, or content,

in the app to be about any topic of your choice.

While you walk through this sample, try swapping out the information and edit colors and modifiers to suit your style.


## Introduce

* ContentView.swift

<p align="center">
<img src="" width="428" height="810"/>
</p> 

A `ContentView` that shows different views using a `TabView` to switch between different Views.

It combines `HomeView`, `StoryView`, `FavoritesView`, and `FunFactsView` to display different content.

* Code snippet:
```
struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "person")
                }
            StoryView()
                .tabItem {
                    Label("Story", systemImage: "book")
                }
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
            FunFactsView()
                .tabItem {
                    Label("Fun Facts", systemImage: "hand.thumbsup")
                }
        }
    }
}
```

* Data.swift

This file is easy to understand and was created based on an Apple tutorial.

It is well set up because we will use this data file later to generate different content in different views.

This time i added my name and portfile into the data, so that the data could be able to shows on the HomeView.

* Code snippet:
```
import Foundation
import SwiftUI

struct Info {
    let image: String
    let name: String
    let story: String
    let hobbies: [String]
    let foods: [String]
    let colors: [Color]
    let funFacts: [String]
}

let information = Info(
    image: "iOS_My Portfoilo",
    name: "Dawei",
    story: "A story can be about anything you can dream up. There are no right answers, there is no one else.\n\nNeed some inspiration?\n• 🐶🐱🛶️🎭🎤🎧🎸\n• 🏄‍♀️🚵‍♀️🚴‍♀️⛵️🥾🏂⛷📚\n• ✍️🥖☕️🏋️‍♂️🚲🧗‍♀️ ",
    hobbies: ["bicycle", "ticket.fill", "book.fill"],
    foods: ["🥐", "🌮", "🍣"],
    colors: [Color.blue, Color.purple, Color.pink],
    funFacts:  [
        "The femur is the longest and largest bone in the human body.",
        "The moon is 238,900 miles away.",
        "Prince’s last name was Nelson.",
        "503 new species were discovered in 2020.",
        "Ice is 9 percent less dense than liquid water.",
        "You can spell every number up to 1,000 without using the letter A.\n\n...one, two, three, four...ninety-nine...nine hundred ninety-nine 🧐",
        "A collection of hippos is called a bloat.",
        "White sand beaches are made of parrotfish poop.",
    ]
)
```

* FunFactsView.swift

<p align="center">
<img src="" width="428" height="810"/>
</p> 

Using `@State` property to store a string named `funFact`.

When the `Show Random Fact` button is tapped, it'll display a `randomElement` from funFact's data .

This'll show different `funFact` content in this `FunFactsView`.

* Code snippet:

```
import SwiftUI

struct FunFactsView: View {
    
    @State private var funFact: String = ""
    
    var body: some View {
        VStack {
            Text("Fun Facts")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text(funFact)
                .padding()
                .font(.title)
                .frame(minHeight: 400)
            
            Button("Show Random Fact") {
                funFact = information.funFacts.randomElement()!
            }
        }
        .padding()
    }
}
```

* FavoritesView.swift

<p align="center">
<img src="" width="428" height="810"/>
</p> 

Create the `FavoritesView` for showing different content by using HStack to show my different hobbies, foods, colors.

```
import SwiftUI

struct FavoritesView: View {
    var body: some View {
        VStack {
            Text("Favorites")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 40)
            
            // HStack for hobbies
            Text("Hobbies")
                .font(.title2)
            
            HStack {
                ForEach(information.hobbies, id: \.self) { hobby in
                    Image(systemName: hobby)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 80, maxHeight: 60)
                }
                .padding()
            }
            .padding()
            
            // HStack for Foods
            Text("Foods")
                .font(.title2)
            
            HStack(spacing: 60) {
                ForEach(information.foods, id: \.self) { food in
                    Text(food)
                        .font(.system(size: 48))
                }
            }
            .padding()
            
            // HStack for color
            HStack(spacing: 30) {
                ForEach(information.colors, id: \.self) { Color in
                    Color
                        .frame(width: 70, height: 70)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}
```


* StoryView.swift

<p align="center">
<img src="" width="428" height="810"/>
</p> 

I created a `StoryView` for show my personal story info, so that the user could be easily to understand who am i.

And i using ScrollView to show my `information.story`.


* Code Snippet:

```
import SwiftUI

struct StoryView: View {
    var body: some View {
        VStack {
            Text("My Story")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            ScrollView {
                Text(information.story)
                    .font(.body)
                    .padding()
            }
        }
        .padding([.top, .bottom], 50)
    }
}
```

* HomeView.swift

<p align="center">
<img src="" width="428" height="810"/>
</p> 


To create a `HomeView` for showing personal infomation into this page by using VStack to show the major title for _All About_.

And show the image from `Data.swift` provided, same as the `information.name`.

* Code Snippet:

```
import SwiftUI

struct HomeView: View {
    
    var body: some View {
        VStack {
            Text("All About")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Image(information.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .padding(40)
            
            Text(information.name)
                .font(.title)
        }
    }
}
```
