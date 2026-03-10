//
//  CookLog.swift
//  CookLog
//
//  Created by rentamac on 3/10/26.
//

import Foundation

struct Recipe: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let description: String
    let steps: [String]
}

struct MockData {
    static let recipe = Recipe(
        name: "Fluffy Pancakes",
        image: "meat",
        description: "Soft and fluffy pancakes perfect for breakfast, served with maple syrup and butter.",
        steps: [
            "Mix flour, sugar, baking powder, and salt.",
            "Add milk, egg, and melted butter.",
            "Whisk until batter is smooth.",
            "Heat a non-stick pan on medium heat.",
            "Pour batter and cook until bubbles appear.",
            "Flip and cook the other side until golden."
        ]
    )
    
    static let recipes: [Recipe] = [
        
        Recipe(
            name: "Spaghetti Pasta",
            image: "meat",
            description: "A classic Italian pasta dish made with rich tomato sauce, garlic, olive oil, and herbs.",
            steps: [
                "Boil water in a large pot and add salt.",
                "Cook spaghetti according to package instructions.",
                "Heat olive oil in a pan and sauté garlic.",
                "Add tomato sauce and simmer for 5 minutes.",
                "Mix the cooked pasta with the sauce.",
                "Serve hot with grated parmesan."
            ]
        ),
        
        Recipe(
            name: "Cheese Burger",
            image: "meat",
            description: "A juicy grilled burger patty topped with melted cheese, fresh lettuce, and tomatoes.",
            steps: [
                "Season the ground beef with salt and pepper.",
                "Shape the beef into burger patties.",
                "Grill the patties for 4–5 minutes each side.",
                "Place cheese on top and let it melt.",
                "Toast the burger buns lightly.",
                "Assemble bun, patty, lettuce, tomato, and sauce."
            ]
        ),
        
        Recipe(
            name: "Pepperoni Pizza",
            image: "meat",
            description: "A crispy homemade pizza topped with mozzarella cheese and spicy pepperoni slices.",
            steps: [
                "Preheat oven to 220°C.",
                "Roll out the pizza dough.",
                "Spread tomato pizza sauce evenly.",
                "Add shredded mozzarella cheese.",
                "Place pepperoni slices on top.",
                "Bake for 12–15 minutes until crust is golden."
            ]
        ),
        
        Recipe(
            name: "Healthy Salad",
            image: "meat",
            description: "A refreshing salad with mixed greens, cucumber, tomatoes, and a light olive oil dressing.",
            steps: [
                "Wash and chop lettuce and vegetables.",
                "Slice cucumbers and cherry tomatoes.",
                "Add vegetables to a large bowl.",
                "Drizzle olive oil and lemon juice.",
                "Season with salt and pepper.",
                "Toss everything together and serve."
            ]
        ),
        
        Recipe(
            name: "Fluffy Pancakes",
            image: "meat",
            description: "Soft and fluffy pancakes perfect for breakfast, served with maple syrup and butter.",
            steps: [
                "Mix flour, sugar, baking powder, and salt.",
                "Add milk, egg, and melted butter.",
                "Whisk until batter is smooth.",
                "Heat a non-stick pan on medium heat.",
                "Pour batter and cook until bubbles appear.",
                "Flip and cook the other side until golden."
            ]
        )
    ]
}
