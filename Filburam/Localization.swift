//
//  Localization.swift
//  Filburam
//
//  Created by Joseph Dizon on 5/10/25.
//

func localized(_ key: String, lang: String) -> String {
    let translations: [String: [String: String]] = [
        "en": [
            "user_profile": "User Profile",
            "name": "Name",
            "diet": "Dietary Preferences",
            "saved": "Saved Recipes",
            "language": "Language",
            "logout": "LOG OUT"
        ],
        "tl": [
            "user_profile": "Profile ng Gumagamit",
            "name": "Pangalan",
            "diet": "Mga Kagustuhan sa Pagkain",
            "saved": "Mga Nai-save na Resipe",
            "language": "Wika",
            "logout": "MAG-LOGOUT"
        ],
        "my": [
            "user_profile": "အသုံးပြုသူအချက်အလက်",
            "name": "နာမည်",
            "diet": "အစားအစာနှစ်သက်မှုများ",
            "saved": "သိမ်းဆည်းထားသောချက်ပြုတ်နည်းများ",
            "language": "ဘာသာစကား",
            "logout": "ထွက်မည်"
        ]
    ]
    return translations[lang]?[key] ?? key
}
