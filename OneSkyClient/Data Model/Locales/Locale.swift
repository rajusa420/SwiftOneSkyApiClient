//
//  Locale.swift
//  OneSkyClient
//
//  Created by Raj Sathianarayanan on 7/30/22.
//

import Foundation

public enum LocaleCode {
    case de
    case en
    case enGB
    case enIN
    case es
    case fr
    case ja
    case ko
    case ptBR
    case zhHansCN
}

public enum Locale {
    case de
    case en
    case es
    case fr
    case ja
    case ko
    case pt
    case zh
}

extension LocaleCode {
    public var code: String {
        switch self {
        case .de:
            return "de"
        case .en:
            return "en-US"
        case .enGB:
            return "en-GB"
        case .enIN:
            return "en-IN"
        case .es:
            return "es"
        case .fr:
            return "fr"
        case .ja:
            return "ja"
        case .ko:
            return "ko"
        case .ptBR:
            return "pt-BR"
        case .zhHansCN:
            return "zh-Hans-CN"
        }
    }
    
    public var englishName: String {
        switch self {
        case .de:
            return "German"
        case .en:
            return "English"
        case .enGB:
            return "English (United Kingdom)"
        case .enIN:
            return "English (India)"
        case .es:
            return "Spanish"
        case .fr:
            return "French"
        case .ja:
            return "Japanese"
        case .ko:
            return "Korean"
        case .ptBR:
            return "Portuguese (Brazil)"
        case .zhHansCN:
            return "Chinese Simplified (China)"
        }
    }
    
    public var localName: String {
        switch self {
        case .de:
            return "Deutsch"
        case .en:
            return "English"
        case .enGB:
            return "English (United Kingdom)"
        case .enIN:
            return "English (India)"
        case .es:
            return "Espa\u{00f1}ol"
        case .fr:
            return "Fran\u{00e7}ais"
        case .ja:
            return "\u{65e5}\u{672c}\u{8a9e}"
        case .ko:
            return "\u{d55c}\u{ad6d}\u{c5b4}"
        case .ptBR:
            return "Portugu\u{00ea}s (Brasil)"
        case .zhHansCN:
            return "Simplified Chinese"
        }
    }
    
    public var locale: Locale {
        switch self {
        case .de:
            return .de
        case .en, .enGB, .enIN:
            return .en
        case .es:
            return .es
        case .fr:
            return .fr
        case .ja:
            return .ja
        case .ko:
            return .ko
        case .ptBR:
            return .pt
        case .zhHansCN:
            return .zh
        }
    }
    
    public var region: String {
        switch self {
        case .de:
            return ""
        case .en:
            return ""
        case .enGB:
            return "GB"
        case .enIN:
            return "IN"
        case .es:
            return ""
        case .fr:
            return ""
        case .ja:
            return ""
        case .ko:
            return ""
        case .ptBR:
            return "BR"
        case .zhHansCN:
            return "CN"
        }
    }
}

// This is the list of Locales returned from One Sky's API. If you need to add
// a locale, grab it from this list and add it to the enum.
/*
 {
     "meta": {
         "status": 200,
         "record_count": 487
     },
     "data": [{
         "code": "en",
         "english_name": "English",
         "local_name": "English",
         "locale": "en",
         "region": ""
     }, {
         "code": "zh-TW",
         "english_name": "Chinese Traditional",
         "local_name": "\u7e41\u9ad4\u4e2d\u6587",
         "locale": "zh",
         "region": "TW"
     }, {
         "code": "zh-CN",
         "english_name": "Chinese Simplified",
         "local_name": "\u7b80\u4f53\u4e2d\u6587",
         "locale": "zh",
         "region": "CN"
     }, {
         "code": "ja",
         "english_name": "Japanese",
         "local_name": "\u65e5\u672c\u8a9e",
         "locale": "ja",
         "region": ""
     }, {
         "code": "fr",
         "english_name": "French",
         "local_name": "Fran\u00e7ais",
         "locale": "fr",
         "region": ""
     }, {
         "code": "de",
         "english_name": "German",
         "local_name": "Deutsch",
         "locale": "de",
         "region": ""
     }, {
         "code": "es-419",
         "english_name": "Spanish (Latin America)",
         "local_name": "Espa\u00f1ol (Latinoam\u00e9rica)",
         "locale": "es",
         "region": "419"
     }, {
         "code": "pt-PT",
         "english_name": "Portuguese (Portugal)",
         "local_name": "Portugu\u00eas (Europeu)",
         "locale": "pt",
         "region": "PT"
     }, {
         "code": "ko",
         "english_name": "Korean",
         "local_name": "\ud55c\uad6d\uc5b4",
         "locale": "ko",
         "region": ""
     }, {
         "code": "it",
         "english_name": "Italian",
         "local_name": "Italiano",
         "locale": "it",
         "region": ""
     }, {
         "code": "ru",
         "english_name": "Russian",
         "local_name": "\u0420\u0443\u0441\u0441\u043a\u0438\u0439",
         "locale": "ru",
         "region": ""
     }, {
         "code": "nl",
         "english_name": "Dutch",
         "local_name": "Nederlands",
         "locale": "nl",
         "region": ""
     }, {
         "code": "cs",
         "english_name": "Czech",
         "local_name": "\u010ce\u0161tina",
         "locale": "cs",
         "region": ""
     }, {
         "code": "tr",
         "english_name": "Turkish",
         "local_name": "T\u00fcrk\u00e7e",
         "locale": "tr",
         "region": ""
     }, {
         "code": "nn",
         "english_name": "Norwegian Nynorsk",
         "local_name": "Nynorsk",
         "locale": "nn",
         "region": ""
     }, {
         "code": "pl",
         "english_name": "Polish",
         "local_name": "Polski",
         "locale": "pl",
         "region": ""
     }, {
         "code": "sv",
         "english_name": "Swedish",
         "local_name": "Svenska",
         "locale": "sv",
         "region": ""
     }, {
         "code": "fi",
         "english_name": "Finnish",
         "local_name": "Suomi",
         "locale": "fi",
         "region": ""
     }, {
         "code": "ro",
         "english_name": "Romanian",
         "local_name": "Rom\u00e2n\u0103",
         "locale": "ro",
         "region": ""
     }, {
         "code": "el",
         "english_name": "Greek",
         "local_name": "\u0395\u03bb\u03bb\u03b7\u03bd\u03b9\u03ba\u03ac",
         "locale": "el",
         "region": ""
     }, {
         "code": "hu",
         "english_name": "Hungarian",
         "local_name": "Magyar",
         "locale": "hu",
         "region": ""
     }, {
         "code": "hr",
         "english_name": "Croatian",
         "local_name": "Hrvatski",
         "locale": "hr",
         "region": ""
     }, {
         "code": "ca",
         "english_name": "Catalan",
         "local_name": "Catal\u00e0",
         "locale": "ca",
         "region": ""
     }, {
         "code": "eo",
         "english_name": "Esperanto",
         "local_name": "Esperanto",
         "locale": "eo",
         "region": ""
     }, {
         "code": "kn-IN",
         "english_name": "Kannada (India)",
         "local_name": "\u0c95\u0ca8\u0ccd\u0ca8\u0ca1 (\u0cad\u0cbe\u0cb0\u0ca4)",
         "locale": "kn",
         "region": "IN"
     }, {
         "code": "gl-ES",
         "english_name": "Galician (Spain)",
         "local_name": "Galego (Espa\u00f1a)",
         "locale": "gl",
         "region": "ES"
     }, {
         "code": "da",
         "english_name": "Danish",
         "local_name": "Dansk",
         "locale": "da",
         "region": ""
     }, {
         "code": "ar",
         "english_name": "Arabic",
         "local_name": "\u0627\u0644\u0639\u0631\u0628\u064a\u0629",
         "locale": "ar",
         "region": ""
     }, {
         "code": "fa",
         "english_name": "Persian",
         "local_name": "\u0641\u0627\u0631\u0633\u06cc",
         "locale": "fa",
         "region": ""
     }, {
         "code": "hi-IN",
         "english_name": "Hindi (India)",
         "local_name": "\u0939\u093f\u0928\u094d\u0926\u0940 (\u092d\u093e\u0930\u0924)",
         "locale": "hi",
         "region": "IN"
     }, {
         "code": "fil",
         "english_name": "Filipino \/ Tagalog",
         "local_name": "Filipino \/ Tagalog",
         "locale": "fil",
         "region": ""
     }, {
         "code": "pms-IT",
         "english_name": "Piedmontese",
         "local_name": "Piemont\u00e8is",
         "locale": "pms",
         "region": "IT"
     }, {
         "code": "ta-IN",
         "english_name": "Tamil (India)",
         "local_name": "\u0ba4\u0bae\u0bbf\u0bb4\u0bcd (\u0b87\u0ba8\u0bcd\u0ba4\u0bbf\u0baf\u0bbe)",
         "locale": "ta",
         "region": "IN"
     }, {
         "code": "sk",
         "english_name": "Slovak",
         "local_name": "Sloven\u010dina",
         "locale": "sk",
         "region": ""
     }, {
         "code": "ka-GE",
         "english_name": "Georgian (Georgia)",
         "local_name": "\u10e5\u10d0\u10e0\u10d7\u10e3\u10da\u10d8 (\u10e1\u10d0\u10e5\u10d0\u10e0\u10d7\u10d5\u10d4\u10da\u10dd)",
         "locale": "ka",
         "region": "GE"
     }, {
         "code": "uk",
         "english_name": "Ukrainian",
         "local_name": "\u0423\u043a\u0440\u0430\u0457\u043d\u0441\u044c\u043a\u0430",
         "locale": "uk",
         "region": ""
     }, {
         "code": "bg-BG",
         "english_name": "Bulgarian (Bulgaria)",
         "local_name": "\u0411\u044a\u043b\u0433\u0430\u0440\u0441\u043a\u0438 (\u0411\u044a\u043b\u0433\u0430\u0440\u0438\u044f)",
         "locale": "bg",
         "region": "BG"
     }, {
         "code": "lv-LV",
         "english_name": "Latvian (Latvia)",
         "local_name": "Latvie\u0161u (Latvija)",
         "locale": "lv",
         "region": "LV"
     }, {
         "code": "eu-ES",
         "english_name": "Basque (Spain)",
         "local_name": "Euskara (Espainia)",
         "locale": "eu",
         "region": "ES"
     }, {
         "code": "sc-IT",
         "english_name": "Sardinian",
         "local_name": "Sardu",
         "locale": "sc",
         "region": "IT"
     }, {
         "code": "te-IN",
         "english_name": "Telugu (India)",
         "local_name": "\u0c24\u0c46\u0c32\u0c41\u0c17\u0c41 (\u0c2d\u0c3e\u0c30\u0c24 \u0c26\u0c47\u0c36\u0c02)",
         "locale": "te",
         "region": "IN"
     }, {
         "code": "he",
         "english_name": "Hebrew",
         "local_name": "\u05e2\u05d1\u05e8\u05d9\u05ea",
         "locale": "he",
         "region": ""
     }, {
         "code": "is-IS",
         "english_name": "Icelandic (Iceland)",
         "local_name": "\u00cdslenska (\u00cdsland)",
         "locale": "is",
         "region": "IS"
     }, {
         "code": "lt-LT",
         "english_name": "Lithuanian (Lithuania)",
         "local_name": "Lietuvi\u0173 (Lietuva)",
         "locale": "lt",
         "region": "LT"
     }, {
         "code": "en-GB",
         "english_name": "English (United Kingdom)",
         "local_name": "English (United Kingdom)",
         "locale": "en",
         "region": "GB"
     }, {
         "code": "et-EE",
         "english_name": "Estonian (Estonia)",
         "local_name": "Eesti (Eesti)",
         "locale": "et",
         "region": "EE"
     }, {
         "code": "",
         "english_name": "Europanto",
         "local_name": "Europanto",
         "locale": "",
         "region": ""
     }, {
         "code": "tlh-KL",
         "english_name": "Klingon",
         "local_name": "tlhIngan",
         "locale": "tlh",
         "region": "KL"
     }, {
         "code": "nap-IT",
         "english_name": "Neapolitan",
         "local_name": "Napulitano",
         "locale": "nap",
         "region": "IT"
     }, {
         "code": "vi",
         "english_name": "Vietnamese",
         "local_name": "Ti\u1ebfng Vi\u1ec7t",
         "locale": "vi",
         "region": ""
     }, {
         "code": "sl-SI",
         "english_name": "Slovenian (Slovenia)",
         "local_name": "Sloven\u0161\u010dina (Slovenija)",
         "locale": "sl",
         "region": "SI"
     }, {
         "code": "sr-RS",
         "english_name": "Serbian (Serbia)",
         "local_name": "\u0421\u0440\u043f\u0441\u043a\u0438 (\u0421\u0440\u0431\u0438\u0458\u0430)",
         "locale": "sr",
         "region": "RS"
     }, {
         "code": "fr-CA",
         "english_name": "French (Canada)",
         "local_name": "Fran\u00e7ais (Canada)",
         "locale": "fr",
         "region": "CA"
     }, {
         "code": "id",
         "english_name": "Indonesian",
         "local_name": "Bahasa Indonesia",
         "locale": "id",
         "region": ""
     }, {
         "code": "ms",
         "english_name": "Malay",
         "local_name": "Bahasa Melayu",
         "locale": "ms",
         "region": ""
     }, {
         "code": "th",
         "english_name": "Thai",
         "local_name": "\u0e44\u0e17\u0e22",
         "locale": "th",
         "region": ""
     }, {
         "code": "ps-AF",
         "english_name": "Pashto (Afghanistan)",
         "local_name": "\u067e\u069a\u062a\u0648 (\u0627\u0641\u063a\u0627\u0646\u0633\u062a\u0627\u0646)",
         "locale": "ps",
         "region": "AF"
     }, {
         "code": "pa",
         "english_name": "Punjabi",
         "local_name": "\u0a2a\u0a70\u0a1c\u0a3e\u0a2c\u0a40",
         "locale": "pa",
         "region": ""
     }, {
         "code": "fy-NL",
         "english_name": "Frisian",
         "local_name": "Frysk",
         "locale": "fy",
         "region": "NL"
     }, {
         "code": "af",
         "english_name": "Afrikaans",
         "local_name": "Afrikaans",
         "locale": "af",
         "region": ""
     }, {
         "code": "bs-BA",
         "english_name": "Bosnian (Bosnia and Herzegovina)",
         "local_name": "Bosanski (Bosna I Hercegovina)",
         "locale": "bs",
         "region": "BA"
     }, {
         "code": "hy",
         "english_name": "Armenian",
         "local_name": "\u0540\u0561\u0575\u0565\u0580\u0567\u0576",
         "locale": "hy",
         "region": ""
     }, {
         "code": "sq",
         "english_name": "Albanian",
         "local_name": "Shqip",
         "locale": "sq",
         "region": ""
     }, {
         "code": "az-AZ",
         "english_name": "Azerbaijani (Azerbaijan)",
         "local_name": "\u0622\u0630\u0631\u0628\u0627\u06cc\u062c\u0627\u0646 \u062f\u06cc\u0644\u06cc",
         "locale": "az",
         "region": "AZ"
     }, {
         "code": "bn-IN",
         "english_name": "Bengali (India)",
         "local_name": "\u09ac\u09be\u0982\u09b2\u09be (\u09ad\u09be\u09b0\u09a4)",
         "locale": "bn",
         "region": "IN"
     }, {
         "code": "be-BY",
         "english_name": "Belarusian (Belarus)",
         "local_name": "\u0411\u0435\u043b\u0430\u0440\u0443\u0441\u043a\u0430\u044f (\u0411\u0435\u043b\u0430\u0440\u0443\u0441\u044c)",
         "locale": "be",
         "region": "BY"
     }, {
         "code": "fo-FO",
         "english_name": "Faroese (Faroe Islands)",
         "local_name": "F\u00f8royskt (F\u00f8royar)",
         "locale": "fo",
         "region": "FO"
     }, {
         "code": "ga-IE",
         "english_name": "Irish (Ireland)",
         "local_name": "Gaeilge (\u00c9ire)",
         "locale": "ga",
         "region": "IE"
     }, {
         "code": "mk-MK",
         "english_name": "Macedonian (Macedonia)",
         "local_name": "\u041c\u0430\u043a\u0435\u0434\u043e\u043d\u0441\u043a\u0438 (\u041c\u0430\u043a\u0435\u0434\u043e\u043d\u0438\u0458\u0430)",
         "locale": "mk",
         "region": "MK"
     }, {
         "code": "cy-GB",
         "english_name": "Welsh (United Kingdom)",
         "local_name": "Cymraeg (Prydain Fawr)",
         "locale": "cy",
         "region": "GB"
     }, {
         "code": "sw-KE",
         "english_name": "Swahili (Kenya)",
         "local_name": "Kiswahili (Kenya)",
         "locale": "sw",
         "region": "KE"
     }, {
         "code": "ne-NP",
         "english_name": "Nepali (Nepal)",
         "local_name": "\u0928\u0947\u092a\u093e\u0932\u0940 (\u0928\u0947\u092a\u093e\u0932)",
         "locale": "ne",
         "region": "NP"
     }, {
         "code": "la-VA",
         "english_name": "Latin",
         "local_name": "lingua Latina",
         "locale": "la",
         "region": "VA"
     }, {
         "code": "ku-TR",
         "english_name": "Kurdish",
         "local_name": "\u041a\u00f6\u0440\u0434\u0438",
         "locale": "ku",
         "region": "TR"
     }, {
         "code": "ml-IN",
         "english_name": "Malayalam (India)",
         "local_name": "\u0d2e\u0d32\u0d2f\u0d3e\u0d33\u0d02 (\u0d07\u0d28\u0d4d\u0d24\u0d4d\u0d2f)",
         "locale": "ml",
         "region": "IN"
     }, {
         "code": "pt-BR",
         "english_name": "Portuguese (Brazil)",
         "local_name": "Portugu\u00eas (Brasil)",
         "locale": "pt",
         "region": "BR"
     }, {
         "code": "nb",
         "english_name": "Norwegian Bokm\u00e5l",
         "local_name": "Norsk Bokm\u00e5l",
         "locale": "nb",
         "region": ""
     }, {
         "code": "zh-HK",
         "english_name": "Chinese Traditional (Hong Kong)",
         "local_name": "\u7e41\u9ad4\u4e2d\u6587\uff08\u9999\u6e2f\uff09",
         "locale": "zh",
         "region": "HK"
     }, {
         "code": "es",
         "english_name": "Spanish",
         "local_name": "Espa\u00f1ol",
         "locale": "es",
         "region": ""
     }, {
         "code": "en-AU",
         "english_name": "English (Australia)",
         "local_name": "English (Australia)",
         "locale": "en",
         "region": "AU"
     }, {
         "code": "en-CA",
         "english_name": "English (Canada)",
         "local_name": "English (Canada)",
         "locale": "en",
         "region": "CA"
     }, {
         "code": "zh-SG",
         "english_name": "Chinese Simplified (Singapore)",
         "local_name": "\u7b80\u4f53\u4e2d\u6587\uff08\u65b0\u52a0\u5761\uff09",
         "locale": "zh",
         "region": "SG"
     }, {
         "code": "fr-CH",
         "english_name": "French (Switzerland)",
         "local_name": "Fran\u00e7ais (Suisse)",
         "locale": "fr",
         "region": "CH"
     }, {
         "code": "en-IN",
         "english_name": "English (India)",
         "local_name": "English (India)",
         "locale": "en",
         "region": "IN"
     }, {
         "code": "es-VE",
         "english_name": "Spanish (Venezuela)",
         "local_name": "Espa\u00f1ol (Venezuela)",
         "locale": "es",
         "region": "VE"
     }, {
         "code": "es-CL",
         "english_name": "Spanish (Chile)",
         "local_name": "Espa\u00f1ol (Chile)",
         "locale": "es",
         "region": "CL"
     }, {
         "code": "es-CO",
         "english_name": "Spanish (Colombia)",
         "local_name": "Espa\u00f1ol (Colombia)",
         "locale": "es",
         "region": "CO"
     }, {
         "code": "es-MX",
         "english_name": "Spanish (Mexico)",
         "local_name": "Espa\u00f1ol (M\u00e9xico)",
         "locale": "es",
         "region": "MX"
     }, {
         "code": "es-AR",
         "english_name": "Spanish (Argentina)",
         "local_name": "Espa\u00f1ol (Argentina)",
         "locale": "es",
         "region": "AR"
     }, {
         "code": "es-PR",
         "english_name": "Spanish (Puerto Rico)",
         "local_name": "Espa\u00f1ol (Puerto Rico)",
         "locale": "es",
         "region": "PR"
     }, {
         "code": "es-PA",
         "english_name": "Spanish (Panama)",
         "local_name": "Espa\u00f1ol (Panam\u00e1)",
         "locale": "es",
         "region": "PA"
     }, {
         "code": "es-PE",
         "english_name": "Spanish (Peru)",
         "local_name": "Espa\u00f1ol (Per\u00fa)",
         "locale": "es",
         "region": "PE"
     }, {
         "code": "ht-HT",
         "english_name": "Haitian Creole",
         "local_name": "Krey\u00f2l ayisyen",
         "locale": "ht",
         "region": "HT"
     }, {
         "code": "mr",
         "english_name": "Marathi",
         "local_name": "\u092e\u0930\u093e\u0920\u0940",
         "locale": "mr",
         "region": ""
     }, {
         "code": "cv-CV",
         "english_name": "Chuvash",
         "local_name": "\u0427\u04d1\u0432\u0430\u0448\u043b\u0430",
         "locale": "cv",
         "region": "CV"
     }, {
         "code": "mt-MT",
         "english_name": "Maltese (Malta)",
         "local_name": "Malti (Malta)",
         "locale": "mt",
         "region": "MT"
     }, {
         "code": "mn-MN",
         "english_name": "Mongolian",
         "local_name": "Mong\u03b3ol kele",
         "locale": "mn",
         "region": "MN"
     }, {
         "code": "ur",
         "english_name": "Urdu",
         "local_name": "\u0627\u0631\u062f\u0648",
         "locale": "ur",
         "region": ""
     }, {
         "code": "de-CH",
         "english_name": "German (Switzerland)",
         "local_name": "Deutsch (Schweiz)",
         "locale": "de",
         "region": "CH"
     }, {
         "code": "gu-IN",
         "english_name": "Gujarati (India)",
         "local_name": "\u0a97\u0ac1\u0a9c\u0ab0\u0abe\u0aa4\u0ac0 (\u0aad\u0abe\u0ab0\u0aa4)",
         "locale": "gu",
         "region": "IN"
     }, {
         "code": "or-IN",
         "english_name": "Oriya (India)",
         "local_name": "\u0b13\u0b21\u0b3c\u0b3f\u0b06 (\u0b2d\u0b3e\u0b30\u0b24)",
         "locale": "or",
         "region": "IN"
     }, {
         "code": "mi-NZ",
         "english_name": "M\u00c4\u0081ori",
         "local_name": "M\u0101ori",
         "locale": "mi",
         "region": "NZ"
     }, {
         "code": "it-CH",
         "english_name": "Italian (Switzerland)",
         "local_name": "Italiano (Svizzera)",
         "locale": "it",
         "region": "CH"
     }, {
         "code": "de-LU",
         "english_name": "German (Luxembourg)",
         "local_name": "Deutsch (Luxemburg)",
         "locale": "de",
         "region": "LU"
     }, {
         "code": "en-LU",
         "english_name": "English (Luxembourg)",
         "local_name": "English (Luxembourg)",
         "locale": "en",
         "region": "LU"
     }, {
         "code": "fr-BE",
         "english_name": "French (Belgium)",
         "local_name": "Fran\u00e7ais (Belgique)",
         "locale": "fr",
         "region": "BE"
     }, {
         "code": "fr-LU",
         "english_name": "French (Luxembourg)",
         "local_name": "Fran\u00e7ais (Luxembourg)",
         "locale": "fr",
         "region": "LU"
     }, {
         "code": "nl-LU",
         "english_name": "Dutch (Luxembourg)",
         "local_name": "Nederlands (Luxembourg)",
         "locale": "nl",
         "region": "LU"
     }, {
         "code": "nl-BE",
         "english_name": "Dutch (Belgium)",
         "local_name": "Nederlands (Belgi\u00eb)",
         "locale": "nl",
         "region": "BE"
     }, {
         "code": "de-BE",
         "english_name": "German (Belgium)",
         "local_name": "Deutsch (Belgien)",
         "locale": "de",
         "region": "BE"
     }, {
         "code": "de-AT",
         "english_name": "German (Austria)",
         "local_name": "Deutsch (\u00d6sterreich)",
         "locale": "de",
         "region": "AT"
     }, {
         "code": "en-BE",
         "english_name": "English (Belgium)",
         "local_name": "English (Belgium)",
         "locale": "en",
         "region": "BE"
     }, {
         "code": "am",
         "english_name": "Amharic",
         "local_name": "\u12a0\u121b\u122d\u129b",
         "locale": "am",
         "region": ""
     }, {
         "code": "km-KH",
         "english_name": "Khmer (Cambodia)",
         "local_name": "\u1797\u17b6\u179f\u17b6\u1781\u17d2\u1798\u17c2\u179a (\u1780\u1798\u17d2\u1796\u17bb\u1787\u17b6)",
         "locale": "km",
         "region": "KH"
     }, {
         "code": "en-IE",
         "english_name": "English (Ireland)",
         "local_name": "English (Ireland)",
         "locale": "en",
         "region": "IE"
     }, {
         "code": "ab",
         "english_name": "Abkhaz",
         "local_name": "\u0430\u04a7\u0441\u0443\u0430 \u0431\u044b\u0437\u0448\u04d9\u0430",
         "locale": "ab",
         "region": ""
     }, {
         "code": "aa",
         "english_name": "Afar",
         "local_name": "Afaraf",
         "locale": "aa",
         "region": ""
     }, {
         "code": "ak",
         "english_name": "Akan",
         "local_name": "Akan",
         "locale": "ak",
         "region": ""
     }, {
         "code": "an",
         "english_name": "Aragonese",
         "local_name": "aragon\u00e9s",
         "locale": "an",
         "region": ""
     }, {
         "code": "as",
         "english_name": "Assamese",
         "local_name": "\u0985\u09b8\u09ae\u09c0\u09af\u09bc\u09be",
         "locale": "as",
         "region": ""
     }, {
         "code": "av",
         "english_name": "Avaric",
         "local_name": "\u0430\u0432\u0430\u0440 \u043c\u0430\u0446\u04c0",
         "locale": "av",
         "region": ""
     }, {
         "code": "ae",
         "english_name": "Avestan",
         "local_name": "avesta",
         "locale": "ae",
         "region": ""
     }, {
         "code": "ay",
         "english_name": "Aymara",
         "local_name": "aymar aru",
         "locale": "ay",
         "region": ""
     }, {
         "code": "bm",
         "english_name": "Bambara",
         "local_name": "Bamanakan",
         "locale": "bm",
         "region": ""
     }, {
         "code": "ba",
         "english_name": "Bashkir",
         "local_name": "\u0431\u0430\u0448\u04a1\u043e\u0440\u0442 \u0442\u0435\u043b\u0435",
         "locale": "ba",
         "region": ""
     }, {
         "code": "bh",
         "english_name": "Bihari",
         "local_name": "\u092d\u094b\u091c\u092a\u0941\u0930\u0940",
         "locale": "bh",
         "region": ""
     }, {
         "code": "bi",
         "english_name": "Bislama",
         "local_name": "Bislama",
         "locale": "bi",
         "region": ""
     }, {
         "code": "br",
         "english_name": "Breton",
         "local_name": "Brezhoneg",
         "locale": "br",
         "region": ""
     }, {
         "code": "my",
         "english_name": "Burmese",
         "local_name": "\u1017\u1019\u102c",
         "locale": "my",
         "region": ""
     }, {
         "code": "ch",
         "english_name": "Chamorro",
         "local_name": "Chamoru",
         "locale": "ch",
         "region": ""
     }, {
         "code": "ce",
         "english_name": "Chechen",
         "local_name": "\u043d\u043e\u0445\u0447\u0438\u0439\u043d \u043c\u043e\u0442\u0442",
         "locale": "ce",
         "region": ""
     }, {
         "code": "ny",
         "english_name": "Chichewa",
         "local_name": "chiChe\u0175a",
         "locale": "ny",
         "region": ""
     }, {
         "code": "kw",
         "english_name": "Cornish",
         "local_name": "Kernewek",
         "locale": "kw",
         "region": ""
     }, {
         "code": "co",
         "english_name": "Corsican",
         "local_name": "corsu",
         "locale": "co",
         "region": ""
     }, {
         "code": "cr",
         "english_name": "Cree",
         "local_name": "\u14c0\u1426\u1403\u152d\u140d\u140f\u1423",
         "locale": "cr",
         "region": ""
     }, {
         "code": "dv",
         "english_name": "Divehi",
         "local_name": "\u078b\u07a8\u0788\u07ac\u0780\u07a8",
         "locale": "dv",
         "region": ""
     }, {
         "code": "dz",
         "english_name": "Dzongkha",
         "local_name": "\u0f62\u0fab\u0f7c\u0f44\u0f0b\u0f41",
         "locale": "dz",
         "region": ""
     }, {
         "code": "ee",
         "english_name": "Ewe",
         "local_name": "E\u028begbe",
         "locale": "ee",
         "region": ""
     }, {
         "code": "fj",
         "english_name": "Fijian",
         "local_name": "vosa Vakaviti",
         "locale": "fj",
         "region": ""
     }, {
         "code": "ff",
         "english_name": "Fulah",
         "local_name": "Pulaar",
         "locale": "ff",
         "region": ""
     }, {
         "code": "lg",
         "english_name": "Ganda",
         "local_name": "Luganda",
         "locale": "lg",
         "region": ""
     }, {
         "code": "gn",
         "english_name": "Guaran\u00ed",
         "local_name": "Ava\u00f1e'\u1ebd",
         "locale": "gn",
         "region": ""
     }, {
         "code": "ha",
         "english_name": "Hausa",
         "local_name": "Hausa",
         "locale": "ha",
         "region": ""
     }, {
         "code": "hz",
         "english_name": "Herero",
         "local_name": "Otjiherero",
         "locale": "hz",
         "region": ""
     }, {
         "code": "ho",
         "english_name": "Hiri Motu",
         "local_name": "Hiri Motu",
         "locale": "ho",
         "region": ""
     }, {
         "code": "io",
         "english_name": "Ido",
         "local_name": "Ido",
         "locale": "io",
         "region": ""
     }, {
         "code": "ig",
         "english_name": "Igbo",
         "local_name": "Igbo",
         "locale": "ig",
         "region": ""
     }, {
         "code": "ia",
         "english_name": "Interlingua",
         "local_name": "Interlingua",
         "locale": "ia",
         "region": ""
     }, {
         "code": "ie",
         "english_name": "Interlingue",
         "local_name": "Interlingue",
         "locale": "ie",
         "region": ""
     }, {
         "code": "iu",
         "english_name": "Inuktitut",
         "local_name": "\u1403\u14c4\u1483\u144e\u1450\u1466",
         "locale": "iu",
         "region": ""
     }, {
         "code": "ik",
         "english_name": "Inupiaq",
         "local_name": "I\u00f1upiaq",
         "locale": "ik",
         "region": ""
     }, {
         "code": "jv",
         "english_name": "Javanese",
         "local_name": "basa Jawa",
         "locale": "jv",
         "region": ""
     }, {
         "code": "kl",
         "english_name": "Kalaallisut",
         "local_name": "Kalaallisut",
         "locale": "kl",
         "region": ""
     }, {
         "code": "kr",
         "english_name": "Kanuri",
         "local_name": "Kanuri",
         "locale": "kr",
         "region": ""
     }, {
         "code": "ks",
         "english_name": "Kashmiri",
         "local_name": "\u0915\u0936\u094d\u092e\u0940\u0930\u0940",
         "locale": "ks",
         "region": ""
     }, {
         "code": "kk",
         "english_name": "Kazakh",
         "local_name": "\u049a\u0430\u0437\u0430\u049b \u0422\u0456\u043b\u0456",
         "locale": "kk",
         "region": ""
     }, {
         "code": "ki",
         "english_name": "Kikuyu",
         "local_name": "Gikuyu",
         "locale": "ki",
         "region": ""
     }, {
         "code": "rw",
         "english_name": "Kinyarwanda",
         "local_name": "Kinyarwanda",
         "locale": "rw",
         "region": ""
     }, {
         "code": "rn",
         "english_name": "Rundi",
         "local_name": "Ikirundi",
         "locale": "rn",
         "region": ""
     }, {
         "code": "kv",
         "english_name": "Komi",
         "local_name": "\u043a\u043e\u043c\u0438 \u043a\u044b\u0432",
         "locale": "kv",
         "region": ""
     }, {
         "code": "kg",
         "english_name": "Kongo",
         "local_name": "KiKongo",
         "locale": "kg",
         "region": ""
     }, {
         "code": "kj",
         "english_name": "Kwanyama",
         "local_name": "Kuanyama",
         "locale": "kj",
         "region": ""
     }, {
         "code": "ky",
         "english_name": "Kyrgyz",
         "local_name": "\u041a\u044b\u0440\u0433\u044b\u0437\u0447\u0430",
         "locale": "ky",
         "region": ""
     }, {
         "code": "lo",
         "english_name": "Lao",
         "local_name": "\u0e9e\u0eb2\u0eaa\u0eb2\u0ea5\u0eb2\u0ea7",
         "locale": "lo",
         "region": ""
     }, {
         "code": "li",
         "english_name": "Limburgish",
         "local_name": "Limburgs",
         "locale": "li",
         "region": ""
     }, {
         "code": "ln",
         "english_name": "Lingala",
         "local_name": "Ling\u00e1la",
         "locale": "ln",
         "region": ""
     }, {
         "code": "lu",
         "english_name": "Luba-Katanga",
         "local_name": "Tshiluba",
         "locale": "lu",
         "region": ""
     }, {
         "code": "lb",
         "english_name": "Luxembourgish",
         "local_name": "L\u00ebtzebuergesch",
         "locale": "lb",
         "region": ""
     }, {
         "code": "mg",
         "english_name": "Malagasy",
         "local_name": "Malagasy",
         "locale": "mg",
         "region": ""
     }, {
         "code": "gv",
         "english_name": "Manx",
         "local_name": "Gaelg",
         "locale": "gv",
         "region": ""
     }, {
         "code": "mh",
         "english_name": "Marshallese",
         "local_name": "Kajin M\u0327aje\u013c",
         "locale": "mh",
         "region": ""
     }, {
         "code": "na",
         "english_name": "Nauru",
         "local_name": "Ekakair\u0169 Naoero",
         "locale": "na",
         "region": ""
     }, {
         "code": "nv",
         "english_name": "Navajo, Navaho",
         "local_name": "Din\u00e9 bizaad",
         "locale": "nv",
         "region": ""
     }, {
         "code": "ng",
         "english_name": "Ndonga",
         "local_name": "Owambo",
         "locale": "ng",
         "region": ""
     }, {
         "code": "nd",
         "english_name": "North Ndebele",
         "local_name": "Isindebele",
         "locale": "nd",
         "region": ""
     }, {
         "code": "se",
         "english_name": "Northern Sami",
         "local_name": "Davvis\u00e1megiella",
         "locale": "se",
         "region": ""
     }, {
         "code": "no",
         "english_name": "Norwegian",
         "local_name": "Norsk",
         "locale": "no",
         "region": ""
     }, {
         "code": "ii",
         "english_name": "Sichuan Yi",
         "local_name": "\ua188\ua320\ua259",
         "locale": "ii",
         "region": ""
     }, {
         "code": "oc",
         "english_name": "Occitan",
         "local_name": "occitan",
         "locale": "oc",
         "region": ""
     }, {
         "code": "oj",
         "english_name": "Ojibwe",
         "local_name": "\u140a\u14c2\u1511\u14c8\u142f\u14a7\u140e\u14d0",
         "locale": "oj",
         "region": ""
     }, {
         "code": "cu",
         "english_name": "Church Slavic",
         "local_name": "\u0469\u0437\u044b\u043a\u044a \u0441\u043b\u043e\u0432\u0463\u043d\u044c\u0441\u043a\u044a",
         "locale": "cu",
         "region": ""
     }, {
         "code": "om",
         "english_name": "Oromo",
         "local_name": "Oromoo",
         "locale": "om",
         "region": ""
     }, {
         "code": "os",
         "english_name": "Ossetian, Ossetic",
         "local_name": "\u0438\u0440\u043e\u043d \u00e6\u0432\u0437\u0430\u0433",
         "locale": "os",
         "region": ""
     }, {
         "code": "pi",
         "english_name": "P\u00c4\u0081li",
         "local_name": "\u092a\u093e\u0934\u093f",
         "locale": "pi",
         "region": ""
     }, {
         "code": "qu",
         "english_name": "Quechua",
         "local_name": "Runa Simi",
         "locale": "qu",
         "region": ""
     }, {
         "code": "rm",
         "english_name": "Romansh",
         "local_name": "Rumantsch",
         "locale": "rm",
         "region": ""
     }, {
         "code": "sm",
         "english_name": "Samoan",
         "local_name": "gagana fa'a Samoa",
         "locale": "sm",
         "region": ""
     }, {
         "code": "sg",
         "english_name": "Sango",
         "local_name": "S\u00e4ng\u00f6",
         "locale": "sg",
         "region": ""
     }, {
         "code": "sa",
         "english_name": "Sanskrit",
         "local_name": "\u0938\u0902\u0938\u094d\u0915\u0943\u0924\u092e\u094d",
         "locale": "sa",
         "region": ""
     }, {
         "code": "gd",
         "english_name": "Scottish Gaelic",
         "local_name": "G\u00e0idhlig",
         "locale": "gd",
         "region": ""
     }, {
         "code": "sn",
         "english_name": "Shona",
         "local_name": "Chishona",
         "locale": "sn",
         "region": ""
     }, {
         "code": "sd",
         "english_name": "Sindhi",
         "local_name": "\u0938\u093f\u0928\u094d\u0927\u0940",
         "locale": "sd",
         "region": ""
     }, {
         "code": "si",
         "english_name": "Sinhala",
         "local_name": "\u0dc3\u0dd2\u0d82\u0dc4\u0dbd",
         "locale": "si",
         "region": ""
     }, {
         "code": "so",
         "english_name": "Somali",
         "local_name": "Soomaali",
         "locale": "so",
         "region": ""
     }, {
         "code": "nr",
         "english_name": "South Ndebele",
         "local_name": "isiNdebele",
         "locale": "nr",
         "region": ""
     }, {
         "code": "st",
         "english_name": "Southern Sotho",
         "local_name": "Sesotho",
         "locale": "st",
         "region": ""
     }, {
         "code": "su",
         "english_name": "Sundanese",
         "local_name": "Basa Sunda",
         "locale": "su",
         "region": ""
     }, {
         "code": "ss",
         "english_name": "Swati",
         "local_name": "SiSwati",
         "locale": "ss",
         "region": ""
     }, {
         "code": "ty",
         "english_name": "Tahitian",
         "local_name": "Reo Tahiti",
         "locale": "ty",
         "region": ""
     }, {
         "code": "tg",
         "english_name": "Tajik",
         "local_name": "\u0442\u043e\u04b7\u0438\u043a\u04e3",
         "locale": "tg",
         "region": ""
     }, {
         "code": "tt",
         "english_name": "Tatar",
         "local_name": "\u0442\u0430\u0442\u0430\u0440 \u0442\u0435\u043b\u0435",
         "locale": "tt",
         "region": ""
     }, {
         "code": "bo",
         "english_name": "Tibetan",
         "local_name": "\u0f54\u0f7c\u0f51\u0f0b\u0f66\u0f90\u0f51\u0f0b",
         "locale": "bo",
         "region": ""
     }, {
         "code": "ti",
         "english_name": "Tigrinya",
         "local_name": "\u1275\u130d\u122d\u129b",
         "locale": "ti",
         "region": ""
     }, {
         "code": "to",
         "english_name": "Tongan",
         "local_name": "Lea Fakatonga",
         "locale": "to",
         "region": ""
     }, {
         "code": "ts",
         "english_name": "Tsonga",
         "local_name": "Xitsonga",
         "locale": "ts",
         "region": ""
     }, {
         "code": "tn",
         "english_name": "Tswana",
         "local_name": "Setswana",
         "locale": "tn",
         "region": ""
     }, {
         "code": "tk",
         "english_name": "Turkmen",
         "local_name": "T\u00fcrkmen",
         "locale": "tk",
         "region": ""
     }, {
         "code": "tw",
         "english_name": "Twi",
         "local_name": "Twi",
         "locale": "tw",
         "region": ""
     }, {
         "code": "ug",
         "english_name": "Uyghur, Uighur",
         "local_name": "Uy\u01a3urq\u0259",
         "locale": "ug",
         "region": ""
     }, {
         "code": "uz",
         "english_name": "Uzbek",
         "local_name": "\u040e\u0437\u0431\u0435\u043a",
         "locale": "uz",
         "region": ""
     }, {
         "code": "ve",
         "english_name": "Venda",
         "local_name": "Tshiven\u1e13a",
         "locale": "ve",
         "region": ""
     }, {
         "code": "vo",
         "english_name": "Volap\u00c3\u00bck",
         "local_name": "Volap\u00fck",
         "locale": "vo",
         "region": ""
     }, {
         "code": "wa",
         "english_name": "Walloon",
         "local_name": "walon",
         "locale": "wa",
         "region": ""
     }, {
         "code": "wo",
         "english_name": "Wolof",
         "local_name": "Wollof",
         "locale": "wo",
         "region": ""
     }, {
         "code": "xh",
         "english_name": "Xhosa",
         "local_name": "isiXhosa",
         "locale": "xh",
         "region": ""
     }, {
         "code": "yi",
         "english_name": "Yiddish",
         "local_name": "\u05d9\u05d9\u05b4\u05d3\u05d9\u05e9",
         "locale": "yi",
         "region": ""
     }, {
         "code": "yo",
         "english_name": "Yoruba",
         "local_name": "\u00c8d\u00e8 Yor\u00f9b\u00e1",
         "locale": "yo",
         "region": ""
     }, {
         "code": "za",
         "english_name": "Zhuang, Chuang",
         "local_name": "Sa\u026f cue\u014b\u0185",
         "locale": "za",
         "region": ""
     }, {
         "code": "zu",
         "english_name": "Zulu",
         "local_name": "Isizulu",
         "locale": "zu",
         "region": ""
     }, {
         "code": "af-NA",
         "english_name": "Afrikaans (Namibia)",
         "local_name": "Afrikaans (Namibi\u00eb)",
         "locale": "af",
         "region": "NA"
     }, {
         "code": "agq",
         "english_name": "Aghem",
         "local_name": "Aghem",
         "locale": "agq",
         "region": ""
     }, {
         "code": "ar-DZ",
         "english_name": "Arabic (Algeria)",
         "local_name": "\u0627\u0644\u0639\u0631\u0628\u064a\u0629 (\u0627\u0644\u062c\u0632\u0627\u0626\u0631)",
         "locale": "ar",
         "region": "DZ"
     }, {
         "code": "ar-BH",
         "english_name": "Arabic (Bahrain)",
         "local_name": "\u0627\u0644\u0639\u0631\u0628\u064a\u0629 (\u0627\u0644\u0628\u062d\u0631\u064a\u0646)",
         "locale": "ar",
         "region": "BH"
     }, {
         "code": "ar-EG",
         "english_name": "Arabic (Egypt)",
         "local_name": "\u0627\u0644\u0639\u0631\u0628\u064a\u0629 (\u0645\u0635\u0631)",
         "locale": "ar",
         "region": "EG"
     }, {
         "code": "ar-IQ",
         "english_name": "Arabic (Iraq)",
         "local_name": "\u0627\u0644\u0639\u0631\u0628\u064a\u0629 (\u0627\u0644\u0639\u0631\u0627\u0642)",
         "locale": "ar",
         "region": "IQ"
     }, {
         "code": "ar-JO",
         "english_name": "Arabic (Jordan)",
         "local_name": "\u0627\u0644\u0639\u0631\u0628\u064a\u0629 (\u0627\u0644\u0623\u0631\u062f\u0646)",
         "locale": "ar",
         "region": "JO"
     }, {
         "code": "ar-KW",
         "english_name": "Arabic (Kuwait)",
         "local_name": "\u0627\u0644\u0639\u0631\u0628\u064a\u0629 (\u0627\u0644\u0643\u0648\u064a\u062a)",
         "locale": "ar",
         "region": "KW"
     }, {
         "code": "ar-LB",
         "english_name": "Arabic (Lebanon)",
         "local_name": "\u0627\u0644\u0639\u0631\u0628\u064a\u0629 (\u0644\u0628\u0646\u0627\u0646)",
         "locale": "ar",
         "region": "LB"
     }, {
         "code": "ar-LY",
         "english_name": "Arabic (Libya)",
         "local_name": "\u0627\u0644\u0639\u0631\u0628\u064a\u0629 (\u0644\u064a\u0628\u064a\u0627)",
         "locale": "ar",
         "region": "LY"
     }, {
         "code": "ar-MA",
         "english_name": "Arabic (Morocco)",
         "local_name": "\u0627\u0644\u0639\u0631\u0628\u064a\u0629 (\u0627\u0644\u0645\u063a\u0631\u0628)",
         "locale": "ar",
         "region": "MA"
     }, {
         "code": "ar-OM",
         "english_name": "Arabic (Oman)",
         "local_name": "\u0627\u0644\u0639\u0631\u0628\u064a\u0629 (\u0639\u064f\u0645\u0627\u0646)",
         "locale": "ar",
         "region": "OM"
     }, {
         "code": "ar-QA",
         "english_name": "Arabic (Qatar)",
         "local_name": "\u0627\u0644\u0639\u0631\u0628\u064a\u0629 (\u0642\u0637\u0631)",
         "locale": "ar",
         "region": "QA"
     }, {
         "code": "ar-SA",
         "english_name": "Arabic (Saudi Arabia)",
         "local_name": "\u0627\u0644\u0639\u0631\u0628\u064a\u0629 (\u0627\u0644\u0645\u0645\u0644\u0643\u0629 \u0627\u0644\u0639\u0631\u0628\u064a\u0629 \u0627\u0644\u0633\u0639\u0648\u062f\u064a\u0629)",
         "locale": "ar",
         "region": "SA"
     }, {
         "code": "ar-SD",
         "english_name": "Arabic (Sudan)",
         "local_name": "\u0627\u0644\u0639\u0631\u0628\u064a\u0629 (\u0627\u0644\u0633\u0648\u062f\u0627\u0646)",
         "locale": "ar",
         "region": "SD"
     }, {
         "code": "ar-SY",
         "english_name": "Arabic (Syria)",
         "local_name": "\u0627\u0644\u0639\u0631\u0628\u064a\u0629 (\u0633\u0648\u0631\u064a\u0627)",
         "locale": "ar",
         "region": "SY"
     }, {
         "code": "ar-TN",
         "english_name": "Arabic (Tunisia)",
         "local_name": "\u0627\u0644\u0639\u0631\u0628\u064a\u0629 (\u062a\u0648\u0646\u0633)",
         "locale": "ar",
         "region": "TN"
     }, {
         "code": "ar-AE",
         "english_name": "Arabic (United Arab Emirates)",
         "local_name": "\u0627\u0644\u0639\u0631\u0628\u064a\u0629 (\u0627\u0644\u0625\u0645\u0627\u0631\u0627\u062a \u0627\u0644\u0639\u0631\u0628\u064a\u0629 \u0627\u0644\u0645\u062a\u062d\u062f\u0629)",
         "locale": "ar",
         "region": "AE"
     }, {
         "code": "ar-001",
         "english_name": "Arabic (World)",
         "local_name": "\u0627\u0644\u0639\u0631\u0628\u064a\u0629 (\u0627\u0644\u0639\u0627\u0644\u0645)",
         "locale": "ar",
         "region": "001"
     }, {
         "code": "ar-YE",
         "english_name": "Arabic (Yemen)",
         "local_name": "\u0627\u0644\u0639\u0631\u0628\u064a\u0629 (\u0627\u0644\u064a\u0645\u0646)",
         "locale": "ar",
         "region": "YE"
     }, {
         "code": "asa",
         "english_name": "Asu",
         "local_name": "Kipare",
         "locale": "asa",
         "region": ""
     }, {
         "code": "az",
         "english_name": "Azerbaijani",
         "local_name": "Az\u0259rbaycanca",
         "locale": "az",
         "region": ""
     }, {
         "code": "az-Cyrl",
         "english_name": "Azerbaijani (Cyrillic)",
         "local_name": "\u0410\u0437\u04d9\u0440\u0431\u0430\u0458\u04b9\u0430\u043d (Kiril)",
         "locale": "az",
         "region": "Cyrl"
     }, {
         "code": "az-Cyrl-AZ",
         "english_name": "Azerbaijani (Cyrillic, Azerbaijan)",
         "local_name": "\u0410\u0437\u04d9\u0440\u0431\u0430\u0458\u04b9\u0430\u043d (Kiril, \u0410\u0437\u04d9\u0440\u0431\u0430\u0458\u04b9\u0430\u043d)",
         "locale": "az",
         "region": "AZ"
     }, {
         "code": "ksf",
         "english_name": "Bafia",
         "local_name": "Rikpa",
         "locale": "ksf",
         "region": ""
     }, {
         "code": "bas",
         "english_name": "Basaa",
         "local_name": "\u0181\u00e0s\u00e0a",
         "locale": "bas",
         "region": ""
     }, {
         "code": "bem",
         "english_name": "Bemba",
         "local_name": "Ichibemba",
         "locale": "bem",
         "region": ""
     }, {
         "code": "bez",
         "english_name": "Bena",
         "local_name": "Hibena",
         "locale": "bez",
         "region": ""
     }, {
         "code": "bn",
         "english_name": "Bengali",
         "local_name": "\u09ac\u09be\u0982\u09b2\u09be",
         "locale": "bn",
         "region": ""
     }, {
         "code": "bn-BD",
         "english_name": "Bengali (Bangladesh)",
         "local_name": "\u09ac\u09be\u0982\u09b2\u09be (\u09ac\u09be\u0982\u09b2\u09be\u09a6\u09c7\u09b6)",
         "locale": "bn",
         "region": "BD"
     }, {
         "code": "brx",
         "english_name": "Bodo",
         "local_name": "\u092c\u0921\u093c\u094b",
         "locale": "brx",
         "region": ""
     }, {
         "code": "tzm",
         "english_name": "Central Morocco Tamazight",
         "local_name": "Tamazi\u0263t",
         "locale": "tzm",
         "region": ""
     }, {
         "code": "chr",
         "english_name": "Cherokee",
         "local_name": "\u13e3\u13b3\u13a9",
         "locale": "chr",
         "region": ""
     }, {
         "code": "cgg",
         "english_name": "Chiga",
         "local_name": "Rukiga",
         "locale": "cgg",
         "region": ""
     }, {
         "code": "zh-Hans-CN",
         "english_name": "Chinese Simplified (China)",
         "local_name": "Simplified Chinese",
         "locale": "zh",
         "region": "CN"
     }, {
         "code": "zh-Hans-HK",
         "english_name": "Chinese Simplified (Hong Kong)",
         "local_name": "Simplified Chinese",
         "locale": "zh",
         "region": "HK"
     }, {
         "code": "zh-Hant-MO",
         "english_name": "Chinese Traditional (Macau)",
         "local_name": "Traditional Chinese",
         "locale": "zh",
         "region": "MO"
     }, {
         "code": "zh-Hans-MO",
         "english_name": "Chinese Simplified (Macau)",
         "local_name": "Simplified Chinese",
         "locale": "zh",
         "region": "MO"
     }, {
         "code": "zh-Hant-TW",
         "english_name": "Chinese Traditional (Taiwan)",
         "local_name": "Traditional Chinese",
         "locale": "zh",
         "region": "TW"
     }, {
         "code": "swc",
         "english_name": "Congo Swahili",
         "local_name": "Kiswahili Ya Kongo",
         "locale": "swc",
         "region": ""
     }, {
         "code": "dua",
         "english_name": "Duala",
         "local_name": "Du\u00e1l\u00e1",
         "locale": "dua",
         "region": ""
     }, {
         "code": "nl-AW",
         "english_name": "Dutch (Aruba)",
         "local_name": "Nederlands (Aruba)",
         "locale": "nl",
         "region": "AW"
     }, {
         "code": "nl-CW",
         "english_name": "Dutch (Cura\u00e7ao)",
         "local_name": "Nederlands (Cura\u00e7ao)",
         "locale": "nl",
         "region": "CW"
     }, {
         "code": "nl-SX",
         "english_name": "Dutch (Sint Maarten)",
         "local_name": "Nederlands (Sint Maarten)",
         "locale": "nl",
         "region": "SX"
     }, {
         "code": "ebu",
         "english_name": "Embu",
         "local_name": "K\u0129embu",
         "locale": "ebu",
         "region": ""
     }, {
         "code": "en-AS",
         "english_name": "English (American Samoa)",
         "local_name": "English (American Samoa)",
         "locale": "en",
         "region": "AS"
     }, {
         "code": "en-BB",
         "english_name": "English (Barbados)",
         "local_name": "English (Barbados)",
         "locale": "en",
         "region": "BB"
     }, {
         "code": "en-BZ",
         "english_name": "English (Belize)",
         "local_name": "English (Belize)",
         "locale": "en",
         "region": "BZ"
     }, {
         "code": "en-BM",
         "english_name": "English (Bermuda)",
         "local_name": "English (Bermuda)",
         "locale": "en",
         "region": "BM"
     }, {
         "code": "en-BW",
         "english_name": "English (Botswana)",
         "local_name": "English (Botswana)",
         "locale": "en",
         "region": "BW"
     }, {
         "code": "en-GU",
         "english_name": "English (Guam)",
         "local_name": "English (Guam)",
         "locale": "en",
         "region": "GU"
     }, {
         "code": "en-GY",
         "english_name": "English (Guyana)",
         "local_name": "English (Guyana)",
         "locale": "en",
         "region": "GY"
     }, {
         "code": "en-HK",
         "english_name": "English (Hong Kong SAR China)",
         "local_name": "English (Hong Kong Sar China)",
         "locale": "en",
         "region": "HK"
     }, {
         "code": "en-JM",
         "english_name": "English (Jamaica)",
         "local_name": "English (Jamaica)",
         "locale": "en",
         "region": "JM"
     }, {
         "code": "en-MT",
         "english_name": "English (Malta)",
         "local_name": "English (Malta)",
         "locale": "en",
         "region": "MT"
     }, {
         "code": "en-MH",
         "english_name": "English (Marshall Islands)",
         "local_name": "English (Marshall Islands)",
         "locale": "en",
         "region": "MH"
     }, {
         "code": "en-MU",
         "english_name": "English (Mauritius)",
         "local_name": "English (Mauritius)",
         "locale": "en",
         "region": "MU"
     }, {
         "code": "en-NA",
         "english_name": "English (Namibia)",
         "local_name": "English (Namibia)",
         "locale": "en",
         "region": "NA"
     }, {
         "code": "en-NZ",
         "english_name": "English (New Zealand)",
         "local_name": "English (New Zealand)",
         "locale": "en",
         "region": "NZ"
     }, {
         "code": "en-MP",
         "english_name": "English (Northern Mariana Islands)",
         "local_name": "English (Northern Mariana Islands)",
         "locale": "en",
         "region": "MP"
     }, {
         "code": "en-PK",
         "english_name": "English (Pakistan)",
         "local_name": "English (Pakistan)",
         "locale": "en",
         "region": "PK"
     }, {
         "code": "en-PH",
         "english_name": "English (Philippines)",
         "local_name": "English (Philippines)",
         "locale": "en",
         "region": "PH"
     }, {
         "code": "en-SG",
         "english_name": "English (Singapore)",
         "local_name": "English (Singapore)",
         "locale": "en",
         "region": "SG"
     }, {
         "code": "en-ZA",
         "english_name": "English (South Africa)",
         "local_name": "English (South Africa)",
         "locale": "en",
         "region": "ZA"
     }, {
         "code": "en-TT",
         "english_name": "English (Trinidad and Tobago)",
         "local_name": "English (Trinidad And Tobago)",
         "locale": "en",
         "region": "TT"
     }, {
         "code": "en-UM",
         "english_name": "English (U.S. Minor Outlying Islands)",
         "local_name": "English (U.S. Minor Outlying Islands)",
         "locale": "en",
         "region": "UM"
     }, {
         "code": "en-VI",
         "english_name": "English (U.S. Virgin Islands)",
         "local_name": "English (U.S. Virgin Islands)",
         "locale": "en",
         "region": "VI"
     }, {
         "code": "en-US-POSIX",
         "english_name": "English (United States, Computer)",
         "local_name": "English (United States, Computer)",
         "locale": "en",
         "region": "POSIX"
     }, {
         "code": "en-ZW",
         "english_name": "English (Zimbabwe)",
         "local_name": "English (Zimbabwe)",
         "locale": "en",
         "region": "ZW"
     }, {
         "code": "ee-GH",
         "english_name": "Ewe (Ghana)",
         "local_name": "E\u028begbe (Ghana Nutome)",
         "locale": "ee",
         "region": "GH"
     }, {
         "code": "ee-TG",
         "english_name": "Ewe (Togo)",
         "local_name": "E\u028begbe (Togo Nutome)",
         "locale": "ee",
         "region": "TG"
     }, {
         "code": "ewo",
         "english_name": "Ewondo",
         "local_name": "Ewondo",
         "locale": "ewo",
         "region": ""
     }, {
         "code": "fr-BJ",
         "english_name": "French (Benin)",
         "local_name": "Fran\u00e7ais (B\u00e9nin)",
         "locale": "fr",
         "region": "BJ"
     }, {
         "code": "fr-BF",
         "english_name": "French (Burkina Faso)",
         "local_name": "Fran\u00e7ais (Burkina Faso)",
         "locale": "fr",
         "region": "BF"
     }, {
         "code": "fr-BI",
         "english_name": "French (Burundi)",
         "local_name": "Fran\u00e7ais (Burundi)",
         "locale": "fr",
         "region": "BI"
     }, {
         "code": "fr-CM",
         "english_name": "French (Cameroon)",
         "local_name": "Fran\u00e7ais (Cameroun)",
         "locale": "fr",
         "region": "CM"
     }, {
         "code": "fr-CF",
         "english_name": "French (Central African Republic)",
         "local_name": "Fran\u00e7ais (R\u00e9publique Centrafricaine)",
         "locale": "fr",
         "region": "CF"
     }, {
         "code": "fr-TD",
         "english_name": "French (Chad)",
         "local_name": "Fran\u00e7ais (Tchad)",
         "locale": "fr",
         "region": "TD"
     }, {
         "code": "fr-KM",
         "english_name": "French (Comoros)",
         "local_name": "Fran\u00e7ais (Comores)",
         "locale": "fr",
         "region": "KM"
     }, {
         "code": "fr-CG",
         "english_name": "French (Congo - Brazzaville)",
         "local_name": "Fran\u00e7ais (Congo-Brazzaville)",
         "locale": "fr",
         "region": "CG"
     }, {
         "code": "fr-CD",
         "english_name": "French (Congo - Kinshasa)",
         "local_name": "Fran\u00e7ais (R\u00e9publique D\u00e9mocratique Du Congo)",
         "locale": "fr",
         "region": "CD"
     }, {
         "code": "fr-CI",
         "english_name": "French (C\u00f4te d\u2019Ivoire)",
         "local_name": "Fran\u00e7ais (C\u00f4te D\u2019Ivoire)",
         "locale": "fr",
         "region": "CI"
     }, {
         "code": "fr-DJ",
         "english_name": "French (Djibouti)",
         "local_name": "Fran\u00e7ais (Djibouti)",
         "locale": "fr",
         "region": "DJ"
     }, {
         "code": "fr-GQ",
         "english_name": "French (Equatorial Guinea)",
         "local_name": "Fran\u00e7ais (Guin\u00e9e \u00c9quatoriale)",
         "locale": "fr",
         "region": "GQ"
     }, {
         "code": "fr-GF",
         "english_name": "French (French Guiana)",
         "local_name": "Fran\u00e7ais (Guyane Fran\u00e7aise)",
         "locale": "fr",
         "region": "GF"
     }, {
         "code": "fr-GA",
         "english_name": "French (Gabon)",
         "local_name": "Fran\u00e7ais (Gabon)",
         "locale": "fr",
         "region": "GA"
     }, {
         "code": "fr-GP",
         "english_name": "French (Guadeloupe)",
         "local_name": "Fran\u00e7ais (Guadeloupe)",
         "locale": "fr",
         "region": "GP"
     }, {
         "code": "fr-GN",
         "english_name": "French (Guinea)",
         "local_name": "Fran\u00e7ais (Guin\u00e9e)",
         "locale": "fr",
         "region": "GN"
     }, {
         "code": "fr-MG",
         "english_name": "French (Madagascar)",
         "local_name": "Fran\u00e7ais (Madagascar)",
         "locale": "fr",
         "region": "MG"
     }, {
         "code": "fr-ML",
         "english_name": "French (Mali)",
         "local_name": "Fran\u00e7ais (Mali)",
         "locale": "fr",
         "region": "ML"
     }, {
         "code": "fr-MQ",
         "english_name": "French (Martinique)",
         "local_name": "Fran\u00e7ais (Martinique)",
         "locale": "fr",
         "region": "MQ"
     }, {
         "code": "fr-YT",
         "english_name": "French (Mayotte)",
         "local_name": "Fran\u00e7ais (Mayotte)",
         "locale": "fr",
         "region": "YT"
     }, {
         "code": "fr-MC",
         "english_name": "French (Monaco)",
         "local_name": "Fran\u00e7ais (Maroc)",
         "locale": "fr",
         "region": "MC"
     }, {
         "code": "fr-NE",
         "english_name": "French (Niger)",
         "local_name": "Fran\u00e7ais (Niger)",
         "locale": "fr",
         "region": "NE"
     }, {
         "code": "fr-RE",
         "english_name": "French (R\u00e9union)",
         "local_name": "Fran\u00e7ais (R\u00e9union)",
         "locale": "fr",
         "region": "RE"
     }, {
         "code": "fr-RW",
         "english_name": "French (Rwanda)",
         "local_name": "Fran\u00e7ais (Rwanda)",
         "locale": "fr",
         "region": "RW"
     }, {
         "code": "fr-BL",
         "english_name": "French (Saint Barth\u00e9lemy)",
         "local_name": "Fran\u00e7ais (Saint-Barth\u00e9l\u00e9my)",
         "locale": "fr",
         "region": "BL"
     }, {
         "code": "fr-MF",
         "english_name": "French (Saint Martin)",
         "local_name": "Fran\u00e7ais (Saint-Martin)",
         "locale": "fr",
         "region": "MF"
     }, {
         "code": "fr-SN",
         "english_name": "French (Senegal)",
         "local_name": "Fran\u00e7ais (S\u00e9n\u00e9gal)",
         "locale": "fr",
         "region": "SN"
     }, {
         "code": "fr-TG",
         "english_name": "French (Togo)",
         "local_name": "Fran\u00e7ais (Togo)",
         "locale": "fr",
         "region": "TG"
     }, {
         "code": "de-LI",
         "english_name": "German (Liechtenstein)",
         "local_name": "Deutsch (Liechtenstein)",
         "locale": "de",
         "region": "LI"
     }, {
         "code": "el-CY",
         "english_name": "Greek (Cyprus)",
         "local_name": "\u0395\u03bb\u03bb\u03b7\u03bd\u03b9\u03ba\u03ac (\u039a\u03cd\u03c0\u03c1\u03bf\u03c2)",
         "locale": "el",
         "region": "CY"
     }, {
         "code": "guz",
         "english_name": "Gusii",
         "local_name": "Ekegusii",
         "locale": "guz",
         "region": ""
     }, {
         "code": "ha-GH",
         "english_name": "Hausa (Ghana)",
         "local_name": "Hausa (Gana)",
         "locale": "ha",
         "region": "GH"
     }, {
         "code": "ha-NE",
         "english_name": "Hausa (Niger)",
         "local_name": "Hausa (Nijar)",
         "locale": "ha",
         "region": "NE"
     }, {
         "code": "ha-NG",
         "english_name": "Hausa (Nigeria)",
         "local_name": "Hausa (Najeriya)",
         "locale": "ha",
         "region": "NG"
     }, {
         "code": "haw",
         "english_name": "Hawaiian",
         "local_name": "\u02bb\u014clelo Hawai\u02bbi",
         "locale": "haw",
         "region": ""
     }, {
         "code": "dyo",
         "english_name": "Jola-Fonyi",
         "local_name": "Joola",
         "locale": "dyo",
         "region": ""
     }, {
         "code": "kea",
         "english_name": "Kabuverdianu",
         "local_name": "Kabuverdianu",
         "locale": "kea",
         "region": ""
     }, {
         "code": "kab",
         "english_name": "Kabyle",
         "local_name": "Taqbaylit",
         "locale": "kab",
         "region": ""
     }, {
         "code": "kln",
         "english_name": "Kalenjin",
         "local_name": "Kalenjin",
         "locale": "kln",
         "region": ""
     }, {
         "code": "kam",
         "english_name": "Kamba",
         "local_name": "Kikamba",
         "locale": "kam",
         "region": ""
     }, {
         "code": "kok",
         "english_name": "Konkani",
         "local_name": "\u0915\u094b\u0902\u0915\u0923\u0940",
         "locale": "kok",
         "region": ""
     }, {
         "code": "khq",
         "english_name": "Koyra Chiini",
         "local_name": "Koyra Ciini",
         "locale": "khq",
         "region": ""
     }, {
         "code": "ses",
         "english_name": "Koyraboro Senni",
         "local_name": "Koyraboro senni",
         "locale": "ses",
         "region": ""
     }, {
         "code": "nmg",
         "english_name": "Kwasio",
         "local_name": "Nmg",
         "locale": "nmg",
         "region": ""
     }, {
         "code": "lag",
         "english_name": "Langi",
         "local_name": "K\u0268laangi",
         "locale": "lag",
         "region": ""
     }, {
         "code": "ln-CG",
         "english_name": "Lingala (Congo - Brazzaville)",
         "local_name": "Ling\u00e1la (Kongo)",
         "locale": "ln",
         "region": "CG"
     }, {
         "code": "ln-CD",
         "english_name": "Lingala (Congo - Kinshasa)",
         "local_name": "Ling\u00e1la (Repibiki Demokratiki Ya Kong\u00f3)",
         "locale": "ln",
         "region": "CD"
     }, {
         "code": "luo",
         "english_name": "Luo",
         "local_name": "Dholuo",
         "locale": "luo",
         "region": ""
     }, {
         "code": "luy",
         "english_name": "Luyia",
         "local_name": "Luluhia",
         "locale": "luy",
         "region": ""
     }, {
         "code": "jmc",
         "english_name": "Machame",
         "local_name": "Kimachame",
         "locale": "jmc",
         "region": ""
     }, {
         "code": "mgh",
         "english_name": "Makhuwa-Meetto",
         "local_name": "Makua",
         "locale": "mgh",
         "region": ""
     }, {
         "code": "kde",
         "english_name": "Makonde",
         "local_name": "Chimakonde",
         "locale": "kde",
         "region": ""
     }, {
         "code": "ms-BN",
         "english_name": "Malay (Brunei)",
         "local_name": "Bahasa Melayu (Brunei)",
         "locale": "ms",
         "region": "BN"
     }, {
         "code": "mas",
         "english_name": "Masai",
         "local_name": "Maa",
         "locale": "mas",
         "region": ""
     }, {
         "code": "mas-KE",
         "english_name": "Masai (Kenya)",
         "local_name": "Maa (Kenya)",
         "locale": "mas",
         "region": "KE"
     }, {
         "code": "mas-TZ",
         "english_name": "Masai (Tanzania)",
         "local_name": "Maa (Tansania)",
         "locale": "mas",
         "region": "TZ"
     }, {
         "code": "mer",
         "english_name": "Meru",
         "local_name": "K\u0129m\u0129r\u0169",
         "locale": "mer",
         "region": ""
     }, {
         "code": "mfe",
         "english_name": "Morisyen",
         "local_name": "Kreol Morisien",
         "locale": "mfe",
         "region": ""
     }, {
         "code": "mua",
         "english_name": "Mundang",
         "local_name": "Munda\u014b",
         "locale": "mua",
         "region": ""
     }, {
         "code": "naq",
         "english_name": "Nama",
         "local_name": "Khoekhoegowab",
         "locale": "naq",
         "region": ""
     }, {
         "code": "ne",
         "english_name": "Nepali",
         "local_name": "\u0928\u0947\u092a\u093e\u0932\u0940",
         "locale": "ne",
         "region": ""
     }, {
         "code": "ne-IN",
         "english_name": "Nepali (India)",
         "local_name": "\u0928\u0947\u092a\u093e\u0932\u0940 (\u092d\u093e\u0930\u0924)",
         "locale": "ne",
         "region": "IN"
     }, {
         "code": "nus",
         "english_name": "Nuer",
         "local_name": "Thok Nath",
         "locale": "nus",
         "region": ""
     }, {
         "code": "nyn",
         "english_name": "Nyankole",
         "local_name": "Runyankore",
         "locale": "nyn",
         "region": ""
     }, {
         "code": "om-ET",
         "english_name": "Oromo (Ethiopia)",
         "local_name": "Oromoo (Itoophiyaa)",
         "locale": "om",
         "region": "ET"
     }, {
         "code": "om-KE",
         "english_name": "Oromo (Kenya)",
         "local_name": "Oromoo (Keeniyaa)",
         "locale": "om",
         "region": "KE"
     }, {
         "code": "fa-AF",
         "english_name": "Persian (Afghanistan)",
         "local_name": "\u062f\u0631\u06cc (\u0627\u0641\u063a\u0627\u0646\u0633\u062a\u0627\u0646)",
         "locale": "fa",
         "region": "AF"
     }, {
         "code": "pt-AO",
         "english_name": "Portuguese (Angola)",
         "local_name": "Portugu\u00eas (Angola)",
         "locale": "pt",
         "region": "AO"
     }, {
         "code": "pt-GW",
         "english_name": "Portuguese (Guinea - Bissau)",
         "local_name": "Portugu\u00eas (Guin\u00e9 Bissau)",
         "locale": "pt",
         "region": "GW"
     }, {
         "code": "pt-MZ",
         "english_name": "Portuguese (Mozambique)",
         "local_name": "Portugu\u00eas (Mo\u00e7ambique)",
         "locale": "pt",
         "region": "MZ"
     }, {
         "code": "pt-ST",
         "english_name": "Portuguese (S\u00e3o Tom\u00e9 and Pr\u00edncipe)",
         "local_name": "Portugu\u00eas (S\u00e3o Tom\u00e9 e Pr\u00edncipe)",
         "locale": "pt",
         "region": "ST"
     }, {
         "code": "pa-Arab",
         "english_name": "Punjabi (Arabic)",
         "local_name": "\u067e\u0646\u062c\u0627\u0628 (\u0627\u0644\u0639\u0631\u0628\u064a\u0629)",
         "locale": "pa",
         "region": "Arab"
     }, {
         "code": "pa-Arab-PK",
         "english_name": "Punjabi (Arabic, Pakistan)",
         "local_name": "\u067e\u0646\u062c\u0627\u0628 (\u0627\u0644\u0639\u0631\u0628\u064a\u0629, \u067e\u06a9\u0633\u062a\u0627\u0646)",
         "locale": "pa",
         "region": "PK"
     }, {
         "code": "ro-MD",
         "english_name": "Romanian (Moldova)",
         "local_name": "Rom\u00e2n\u0103 (Republica Moldova)",
         "locale": "ro",
         "region": "MD"
     }, {
         "code": "rof",
         "english_name": "Rombo",
         "local_name": "Kihorombo",
         "locale": "rof",
         "region": ""
     }, {
         "code": "ru-MD",
         "english_name": "Russian (Moldova)",
         "local_name": "\u0420\u0443\u0441\u0441\u043a\u0438\u0439 (\u041c\u043e\u043b\u0434\u043e\u0432\u0430)",
         "locale": "ru",
         "region": "MD"
     }, {
         "code": "ru-UA",
         "english_name": "Russian (Ukraine)",
         "local_name": "\u0420\u0443\u0441\u0441\u043a\u0438\u0439 (\u0423\u043a\u0440\u0430\u0438\u043d\u0430)",
         "locale": "ru",
         "region": "UA"
     }, {
         "code": "rwk",
         "english_name": "Rwa",
         "local_name": "Kiruwa",
         "locale": "rwk",
         "region": ""
     }, {
         "code": "saq",
         "english_name": "Samburu",
         "local_name": "Kisampur",
         "locale": "saq",
         "region": ""
     }, {
         "code": "sbp",
         "english_name": "Sangu",
         "local_name": "Ishisangu",
         "locale": "sbp",
         "region": ""
     }, {
         "code": "seh",
         "english_name": "Sena",
         "local_name": "Sena",
         "locale": "seh",
         "region": ""
     }, {
         "code": "sr",
         "english_name": "Serbian",
         "local_name": "\u0421\u0440\u043f\u0441\u043a\u0438",
         "locale": "sr",
         "region": ""
     }, {
         "code": "sr-Latn",
         "english_name": "Serbian (Latin)",
         "local_name": "Srpski (Latinica)",
         "locale": "sr",
         "region": "Latn"
     }, {
         "code": "sr-BA",
         "english_name": "Serbian (Bosnia and Herzegovina)",
         "local_name": "\u0421\u0440\u043f\u0441\u043a\u0438 (\u0411\u043e\u0441\u043d\u0430 \u0418 \u0425\u0435\u0440\u0446\u0435\u0433\u043e\u0432\u0438\u043d\u0430)",
         "locale": "sr",
         "region": "BA"
     }, {
         "code": "sr-Latn-BA",
         "english_name": "Serbian (Latin, Bosnia and Herzegovina)",
         "local_name": "Srpski (Latinica, Bosna I Hercegovina)",
         "locale": "sr",
         "region": "BA"
     }, {
         "code": "sr-ME",
         "english_name": "Serbian (Montenegro)",
         "local_name": "\u0421\u0440\u043f\u0441\u043a\u0438 (\u0426\u0440\u043d\u0430 \u0413\u043e\u0440\u0430)",
         "locale": "sr",
         "region": "ME"
     }, {
         "code": "sr-Latn-ME",
         "english_name": "Serbian (Latin, Montenegro)",
         "local_name": "Srpski (Latinica, Crna Gora)",
         "locale": "sr",
         "region": "ME"
     }, {
         "code": "sr-Latn-RS",
         "english_name": "Serbian (Latin, Serbia)",
         "local_name": "Srpski (Latinica, Srbija)",
         "locale": "sr",
         "region": "RS"
     }, {
         "code": "ksb",
         "english_name": "Shambala",
         "local_name": "Kishambaa",
         "locale": "ksb",
         "region": ""
     }, {
         "code": "xog",
         "english_name": "Soga",
         "local_name": "Olusoga",
         "locale": "xog",
         "region": ""
     }, {
         "code": "so-DJ",
         "english_name": "Somali (Djibouti)",
         "local_name": "Soomaali (Jabuuti)",
         "locale": "so",
         "region": "DJ"
     }, {
         "code": "so-ET",
         "english_name": "Somali (Ethiopia)",
         "local_name": "Soomaali (Itoobiya)",
         "locale": "so",
         "region": "ET"
     }, {
         "code": "so-KE",
         "english_name": "Somali (Kenya)",
         "local_name": "Soomaali (Kiiniya)",
         "locale": "so",
         "region": "KE"
     }, {
         "code": "so-SO",
         "english_name": "Somali (Somalia)",
         "local_name": "Soomaali (Soomaaliya)",
         "locale": "so",
         "region": "SO"
     }, {
         "code": "es-BO",
         "english_name": "Spanish (Bolivia)",
         "local_name": "Espa\u00f1ol (Bolivia)",
         "locale": "es",
         "region": "BO"
     }, {
         "code": "es-CR",
         "english_name": "Spanish (Costa Rica)",
         "local_name": "Espa\u00f1ol (Costa Rica)",
         "locale": "es",
         "region": "CR"
     }, {
         "code": "es-DO",
         "english_name": "Spanish (Dominican Republic)",
         "local_name": "Espa\u00f1ol (Rep\u00fablica Dominicana)",
         "locale": "es",
         "region": "DO"
     }, {
         "code": "es-EC",
         "english_name": "Spanish (Ecuador)",
         "local_name": "Espa\u00f1ol (Ecuador)",
         "locale": "es",
         "region": "EC"
     }, {
         "code": "es-SV",
         "english_name": "Spanish (El Salvador)",
         "local_name": "Espa\u00f1ol (El Salvador)",
         "locale": "es",
         "region": "SV"
     }, {
         "code": "es-GQ",
         "english_name": "Spanish (Equatorial Guinea)",
         "local_name": "Espa\u00f1ol (Guinea Ecuatorial)",
         "locale": "es",
         "region": "GQ"
     }, {
         "code": "es-GT",
         "english_name": "Spanish (Guatemala)",
         "local_name": "Espa\u00f1ol (Guatemala)",
         "locale": "es",
         "region": "GT"
     }, {
         "code": "es-HN",
         "english_name": "Spanish (Honduras)",
         "local_name": "Espa\u00f1ol (Honduras)",
         "locale": "es",
         "region": "HN"
     }, {
         "code": "es-NI",
         "english_name": "Spanish (Nicaragua)",
         "local_name": "Espa\u00f1ol (Nicaragua)",
         "locale": "es",
         "region": "NI"
     }, {
         "code": "es-PY",
         "english_name": "Spanish (Paraguay)",
         "local_name": "Espa\u00f1ol (Paraguay)",
         "locale": "es",
         "region": "PY"
     }, {
         "code": "es-US",
         "english_name": "Spanish (United States)",
         "local_name": "Espa\u00f1ol (Estados Unidos)",
         "locale": "es",
         "region": "US"
     }, {
         "code": "es-UY",
         "english_name": "Spanish (Uruguay)",
         "local_name": "Espa\u00f1ol (Uruguay)",
         "locale": "es",
         "region": "UY"
     }, {
         "code": "sw",
         "english_name": "Swahili",
         "local_name": "Kiswahili",
         "locale": "sw",
         "region": ""
     }, {
         "code": "sw-TZ",
         "english_name": "Swahili (Tanzania)",
         "local_name": "Kiswahili (Tanzania)",
         "locale": "sw",
         "region": "TZ"
     }, {
         "code": "sv-FI",
         "english_name": "Swedish (Finland)",
         "local_name": "Svenska (Finland)",
         "locale": "sv",
         "region": "FI"
     }, {
         "code": "gsw",
         "english_name": "Swiss German",
         "local_name": "Schwiizert\u00fc\u00fctsch",
         "locale": "gsw",
         "region": ""
     }, {
         "code": "shi",
         "english_name": "Tachelhit",
         "local_name": "Tamazight",
         "locale": "shi",
         "region": ""
     }, {
         "code": "shi-Tfng",
         "english_name": "Tachelhit (Tifinagh)",
         "local_name": "\u2d5c\u2d30\u2d4e\u2d30\u2d63\u2d49\u2d56\u2d5c (Tfng)",
         "locale": "shi",
         "region": "Tfng"
     }, {
         "code": "shi-MA",
         "english_name": "Tachelhit (Morocco)",
         "local_name": "Tachelhit",
         "locale": "shi",
         "region": "MA"
     }, {
         "code": "shi-Tfng-MA",
         "english_name": "Tachelhit (Tifinagh, Morocco)",
         "local_name": "\u2d5c\u2d30\u2d4e\u2d30\u2d63\u2d49\u2d56\u2d5c (Tfng, \u2d4d\u2d4e\u2d56\u2d54\u2d49\u2d31)",
         "locale": "shi",
         "region": "MA"
     }, {
         "code": "dav",
         "english_name": "Taita",
         "local_name": "Kitaita",
         "locale": "dav",
         "region": ""
     }, {
         "code": "ta",
         "english_name": "Tamil",
         "local_name": "\u0ba4\u0bae\u0bbf\u0bb4\u0bcd",
         "locale": "ta",
         "region": ""
     }, {
         "code": "ta-LK",
         "english_name": "Tamil (Sri Lanka)",
         "local_name": "\u0ba4\u0bae\u0bbf\u0bb4\u0bcd (\u0b87\u0bb2\u0b99\u0bcd\u0b95\u0bc8)",
         "locale": "ta",
         "region": "LK"
     }, {
         "code": "twq",
         "english_name": "Tasawaq",
         "local_name": "Tasawaq Senni",
         "locale": "twq",
         "region": ""
     }, {
         "code": "teo",
         "english_name": "Teso",
         "local_name": "Kiteso",
         "locale": "teo",
         "region": ""
     }, {
         "code": "teo-KE",
         "english_name": "Teso (Kenya)",
         "local_name": "Kiteso (Kenia)",
         "locale": "teo",
         "region": "KE"
     }, {
         "code": "teo-UG",
         "english_name": "Teso (Uganda)",
         "local_name": "Kiteso (Uganda)",
         "locale": "teo",
         "region": "UG"
     }, {
         "code": "bo-CN",
         "english_name": "Tibetan (China)",
         "local_name": "\u0f54\u0f7c\u0f51\u0f0b\u0f66\u0f90\u0f51\u0f0b (\u0f62\u0f92\u0fb1\u0f0b\u0f53\u0f42)",
         "locale": "bo",
         "region": "CN"
     }, {
         "code": "bo-IN",
         "english_name": "Tibetan (India)",
         "local_name": "\u0f54\u0f7c\u0f51\u0f0b\u0f66\u0f90\u0f51\u0f0b (\u0f62\u0f92\u0fb1\u0f0b\u0f42\u0f62\u0f0b)",
         "locale": "bo",
         "region": "IN"
     }, {
         "code": "ti-ER",
         "english_name": "Tigrinya (Eritrea)",
         "local_name": "\u1275\u130d\u122d\u129b (Er)",
         "locale": "ti",
         "region": "ER"
     }, {
         "code": "ti-ET",
         "english_name": "Tigrinya (Ethiopia)",
         "local_name": "\u1275\u130d\u122d\u129b (Et)",
         "locale": "ti",
         "region": "ET"
     }, {
         "code": "ur-IN",
         "english_name": "Urdu (India)",
         "local_name": "\u0627\u0631\u062f\u0648 (\u0628\u06be\u0627\u0631\u062a)",
         "locale": "ur",
         "region": "IN"
     }, {
         "code": "ur-PK",
         "english_name": "Urdu (Pakistan)",
         "local_name": "\u0627\u0631\u062f\u0648 (\u067e\u0627\u06a9\u0633\u062a\u0627\u0646)",
         "locale": "ur",
         "region": "PK"
     }, {
         "code": "uz-Latn",
         "english_name": "Uzbek (Latin)",
         "local_name": "O\u02bczbekcha (Lotin)",
         "locale": "uz",
         "region": "Latn"
     }, {
         "code": "uz-Arab",
         "english_name": "Uzbek (Arabic)",
         "local_name": "\u0627\u06c9\u0632\u0628\u06d0\u06a9 (Arab)",
         "locale": "uz",
         "region": "Arab"
     }, {
         "code": "uz-Arab-AF",
         "english_name": "Uzbek (Arabic, Afghanistan)",
         "local_name": "\u0627\u06c9\u0632\u0628\u06d0\u06a9 (Arab, \u0627\u0641\u063a\u0627\u0646\u0633\u062a\u0627\u0646)",
         "locale": "uz",
         "region": "AF"
     }, {
         "code": "uz-UZ",
         "english_name": "Uzbek (Uzbekistan)",
         "local_name": "Uzbek",
         "locale": "uz",
         "region": "UZ"
     }, {
         "code": "uz-Latn-UZ",
         "english_name": "Uzbek (Latin, Uzbekistan)",
         "local_name": "O\u02bczbekcha (Lotin, O\u02bczbekiston)",
         "locale": "uz",
         "region": "UZ"
     }, {
         "code": "vai",
         "english_name": "Vai",
         "local_name": "\ua559\ua524",
         "locale": "vai",
         "region": ""
     }, {
         "code": "vai-Latn",
         "english_name": "Vai (Latin)",
         "local_name": "Vai (Latn)",
         "locale": "vai",
         "region": "Latn"
     }, {
         "code": "vai-Latn-LR",
         "english_name": "Vai (Latin, Liberia)",
         "local_name": "Vai (Latn, Laibhiya)",
         "locale": "vai",
         "region": "LR"
     }, {
         "code": "vai-LR",
         "english_name": "Vai (Liberia)",
         "local_name": "Vai",
         "locale": "vai",
         "region": "LR"
     }, {
         "code": "vun",
         "english_name": "Vunjo",
         "local_name": "Kyivunjo",
         "locale": "vun",
         "region": ""
     }, {
         "code": "yav",
         "english_name": "Yangben",
         "local_name": "Nuasue",
         "locale": "yav",
         "region": ""
     }, {
         "code": "dje",
         "english_name": "Zarma",
         "local_name": "Zarmaciine",
         "locale": "dje",
         "region": ""
     }, {
         "code": "af-ZA",
         "english_name": "Afrikaans (South Africa)",
         "local_name": "Afrikaans (Suid-Afrika)",
         "locale": "af",
         "region": "ZA"
     }, {
         "code": "nl-NL",
         "english_name": "Dutch (Netherlands)",
         "local_name": "Nederlands (Nederland)",
         "locale": "nl",
         "region": "NL"
     }, {
         "code": "en-US",
         "english_name": "English (United States)",
         "local_name": "English (United States)",
         "locale": "en",
         "region": "US"
     }, {
         "code": "fr-FR",
         "english_name": "French (France)",
         "local_name": "Fran\u00e7ais (France)",
         "locale": "fr",
         "region": "FR"
     }, {
         "code": "de-DE",
         "english_name": "German (Germany)",
         "local_name": "Deutsch (Deutschland)",
         "locale": "de",
         "region": "DE"
     }, {
         "code": "el-GR",
         "english_name": "Greek (Greece)",
         "local_name": "\u0395\u03bb\u03bb\u03b7\u03bd\u03b9\u03ba\u03ac (\u0395\u03bb\u03bb\u03ac\u03b4\u03b1)",
         "locale": "el",
         "region": "GR"
     }, {
         "code": "it-IT",
         "english_name": "Italian (Italy)",
         "local_name": "Italiano (Italia)",
         "locale": "it",
         "region": "IT"
     }, {
         "code": "ms-MY",
         "english_name": "Malay (Malaysia)",
         "local_name": "Bahasa Melayu (Malaysia)",
         "locale": "ms",
         "region": "MY"
     }, {
         "code": "fa-IR",
         "english_name": "Persian (Iran)",
         "local_name": "\u0641\u0627\u0631\u0633\u06cc (\u0627\u06cc\u0631\u0627\u0646)",
         "locale": "fa",
         "region": "IR"
     }, {
         "code": "pa-IN",
         "english_name": "Punjabi (India)",
         "local_name": "Punjabi",
         "locale": "pa",
         "region": "IN"
     }, {
         "code": "ro-RO",
         "english_name": "Romanian (Romania)",
         "local_name": "Rom\u00e2n\u0103 (Rom\u00e2nia)",
         "locale": "ro",
         "region": "RO"
     }, {
         "code": "ru-RU",
         "english_name": "Russian (Russia)",
         "local_name": "\u0420\u0443\u0441\u0441\u043a\u0438\u0439 (\u0420\u043e\u0441\u0441\u0438\u044f)",
         "locale": "ru",
         "region": "RU"
     }, {
         "code": "es-ES",
         "english_name": "Spanish (Spain)",
         "local_name": "Espa\u00f1ol (Espa\u00f1a)",
         "locale": "es",
         "region": "ES"
     }, {
         "code": "sv-SE",
         "english_name": "Swedish (Sweden)",
         "local_name": "Svenska (Sverige)",
         "locale": "sv",
         "region": "SE"
     }, {
         "code": "pt-MO",
         "english_name": "Portuguese (Macau)",
         "local_name": "Portuguese (Macau)",
         "locale": "pt",
         "region": "MO"
     }, {
         "code": "ms-SG",
         "english_name": "Malay (Singapore)",
         "local_name": "Melayu Singapura",
         "locale": "ms",
         "region": "SG"
     }, {
         "code": "ta-SG",
         "english_name": "Tamil (Singapore)",
         "local_name": "\u0ba4\u0bae\u0bbf\u0bb4\u0bcd (\u0b9a\u0bbf\u0b99\u0bcd\u0b95\u0baa\u0bcd\u0baa\u0bc2\u0bb0\u0bcd)",
         "locale": "ta",
         "region": "SG"
     }, {
         "code": "en-CH",
         "english_name": "English (Switzerland)",
         "local_name": "English (Switzerland)",
         "locale": "en",
         "region": "CH"
     }, {
         "code": "en-MO",
         "english_name": "English (Macau)",
         "local_name": "English (Macau)",
         "locale": "en",
         "region": "MO"
     }, {
         "code": "bg",
         "english_name": "Bulgarian",
         "local_name": "\u0411\u044a\u043b\u0433\u0430\u0440\u0441\u043a\u0438",
         "locale": "bg",
         "region": ""
     }, {
         "code": "en-QA",
         "english_name": "English (Qatar)",
         "local_name": "English (Qatar)",
         "locale": "en",
         "region": "QA"
     }, {
         "code": "en-BH",
         "english_name": "English (Bahrain)",
         "local_name": "English (Bahrain)",
         "locale": "en",
         "region": "BH"
     }, {
         "code": "en-KW",
         "english_name": "English (Kuwait)",
         "local_name": "English (Kuwait)",
         "locale": "en",
         "region": "KW"
     }, {
         "code": "en-AE",
         "english_name": "English (United Arab Emirates)",
         "local_name": "English (United Arab Emirates)",
         "locale": "en",
         "region": "AE"
     }, {
         "code": "en-SA",
         "english_name": "English (Saudi Arabia)",
         "local_name": "English (Saudi Arabia)",
         "locale": "en",
         "region": "SA"
     }, {
         "code": "en-OM",
         "english_name": "English (Oman)",
         "local_name": "English (Oman)",
         "locale": "en",
         "region": "OM"
     }, {
         "code": "en-ID",
         "english_name": "English (Indonesia)",
         "local_name": "English (Indonesia)",
         "locale": "en",
         "region": "ID"
     }, {
         "code": "ceb",
         "english_name": "Cebuano",
         "local_name": "Cebuano",
         "locale": "ceb",
         "region": ""
     }, {
         "code": "tpi",
         "english_name": "Tok Pisin",
         "local_name": "Tok Pisin",
         "locale": "tpi",
         "region": ""
     }, {
         "code": "hi",
         "english_name": "Hindi",
         "local_name": "\u0939\u093f\u0928\u094d\u0926\u0940",
         "locale": "hi",
         "region": ""
     }, {
         "code": "en-LT",
         "english_name": "English (Lithuania)",
         "local_name": "English (Lithuania)",
         "locale": "en",
         "region": "LT"
     }, {
         "code": "en-LV",
         "english_name": "English (Latvia)",
         "local_name": "English (Latvia)",
         "locale": "en",
         "region": "LV"
     }, {
         "code": "en-EE",
         "english_name": "English (Estonia)",
         "local_name": "English (Estonia)",
         "locale": "en",
         "region": "EE"
     }, {
         "code": "en-IL",
         "english_name": "English (Israel)",
         "local_name": "English (Israel)",
         "locale": "en",
         "region": "IL"
     }, {
         "code": "fr-MA",
         "english_name": "French (Morocco)",
         "local_name": "Fran\u00e7ais (Morocco)",
         "locale": "fr",
         "region": "MA"
     }, {
         "code": "fr-TN",
         "english_name": "French (Tunisia)",
         "local_name": "Fran\u00e7ais (Tunisie)",
         "locale": "fr",
         "region": "TN"
     }, {
         "code": "en-VN",
         "english_name": "English (Vietnam)",
         "local_name": "English (Vietnam)",
         "locale": "en",
         "region": "VN"
     }, {
         "code": "en-MY",
         "english_name": "English (Malaysia)",
         "local_name": "English (Malaysia)",
         "locale": "en",
         "region": "MY"
     }, {
         "code": "en-TH",
         "english_name": "English (Thailand)",
         "local_name": "English (Thailand)",
         "locale": "en",
         "region": "TH"
     }, {
         "code": "en-JO",
         "english_name": "English (Jordan)",
         "local_name": "English (Jordan)",
         "locale": "en",
         "region": "JO"
     }, {
         "code": "en-EG",
         "english_name": "English (Egypt)",
         "local_name": "English (Egypt)",
         "locale": "en",
         "region": "EG"
     }, {
         "code": "en-DZ",
         "english_name": "English (Algeria)",
         "local_name": "English (Algeria)",
         "locale": "en",
         "region": "DZ"
     }, {
         "code": "fr-MU",
         "english_name": "French (Mauritius)",
         "local_name": "Fran\u00e7ais (Maurice)",
         "locale": "fr",
         "region": "MU"
     }, {
         "code": "et",
         "english_name": "Estonian",
         "local_name": "Eesti",
         "locale": "et",
         "region": ""
     }, {
         "code": "fo",
         "english_name": "Faroese",
         "local_name": "F\u00f8royskt",
         "locale": "fo",
         "region": ""
     }, {
         "code": "gu",
         "english_name": "Gujarati",
         "local_name": "\u0a97\u0ac1\u0a9c\u0ab0\u0abe\u0aa4\u0ac0",
         "locale": "gu",
         "region": ""
     }, {
         "code": "ka",
         "english_name": "Georgian",
         "local_name": "\u10e5\u10d0\u10e0\u10d7\u10e3\u10da\u10d8",
         "locale": "ka",
         "region": ""
     }, {
         "code": "km",
         "english_name": "Khmer",
         "local_name": "\u1797\u17b6\u179f\u17b6\u1781\u17d2\u1798\u17c2\u179a",
         "locale": "km",
         "region": ""
     }, {
         "code": "kn",
         "english_name": "Kannada",
         "local_name": "\u0c95\u0ca8\u0ccd\u0ca8\u0ca1",
         "locale": "kn",
         "region": ""
     }, {
         "code": "lt",
         "english_name": "Lithuanian",
         "local_name": "Lietuvi\u0173",
         "locale": "lt",
         "region": ""
     }, {
         "code": "mk",
         "english_name": "Macedonian",
         "local_name": "\u041c\u0430\u043a\u0435\u0434\u043e\u043d\u0441\u043a\u0438",
         "locale": "mk",
         "region": ""
     }, {
         "code": "ml",
         "english_name": "Malayalam",
         "local_name": "\u0d2e\u0d32\u0d2f\u0d3e\u0d33\u0d02",
         "locale": "ml",
         "region": ""
     }, {
         "code": "mn",
         "english_name": "Mongolian",
         "local_name": "\u041c\u043e\u043d\u0433\u043e\u043b \u0445\u044d\u043b",
         "locale": "mn",
         "region": ""
     }, {
         "code": "or",
         "english_name": "Oriya",
         "local_name": "\u0b13\u0b21\u0b3c\u0b3f\u0b06",
         "locale": "or",
         "region": ""
     }, {
         "code": "ps",
         "english_name": "Pashto",
         "local_name": "\u067e\u069a\u062a\u0648",
         "locale": "ps",
         "region": ""
     }, {
         "code": "sl",
         "english_name": "Slovenian",
         "local_name": "Sloven\u0161\u010dina",
         "locale": "sl",
         "region": ""
     }, {
         "code": "te",
         "english_name": "Telugu",
         "local_name": "\u0c24\u0c46\u0c32\u0c41\u0c17\u0c41",
         "locale": "te",
         "region": ""
     }]
 }
 
 
 */
