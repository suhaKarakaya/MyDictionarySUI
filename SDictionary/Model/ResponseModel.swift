//
//  ResponseModel.swift
//  SDictionary
//
//  Created by Süha Karakaya on 30.04.2024.
//

import Foundation

struct BaseResponseModel: Codable {
    let response: [KeyDetailModel]?
    let error: String?
}

// MARK: - SeachListElement
struct KeyDetailModel: Codable {
    let maddeID, kac, kelimeNo, cesit: String?
    let anlamGor: String?
    let onTaki, onTakiHTML: String?
    let madde, maddeHTML, cesitSay, anlamSay: String?
    let taki, cogulMu, ozelMi, egikMi: String?
    let lisanKodu, lisan: String?
    let telaffuzHTML: String?
    let lisanHTML, telaffuz, birlesikler: String?
    let font: String?
    let maddeDuz: String?
    let gosterimTarihi: String?
    let anlamlarListe: [AnlamlarListe]?
    let atasozu: [Atasozu]?

    enum CodingKeys: String, CodingKey {
        case maddeID = "madde_id"
        case kac
        case kelimeNo = "kelime_no"
        case cesit
        case anlamGor = "anlam_gor"
        case onTaki = "on_taki"
        case onTakiHTML = "on_taki_html"
        case madde
        case maddeHTML = "madde_html"
        case cesitSay = "cesit_say"
        case anlamSay = "anlam_say"
        case taki
        case cogulMu = "cogul_mu"
        case ozelMi = "ozel_mi"
        case egikMi = "egik_mi"
        case lisanKodu = "lisan_kodu"
        case lisan
        case telaffuzHTML = "telaffuz_html"
        case lisanHTML = "lisan_html"
        case telaffuz, birlesikler, font
        case maddeDuz = "madde_duz"
        case gosterimTarihi = "gosterim_tarihi"
        case anlamlarListe, atasozu
    }
}

// MARK: - AnlamlarListe
struct AnlamlarListe: Codable {
    let anlamID, maddeID, anlamSira, fiil: String?
    let tipkes, anlam: String?
    let anlamHTML: String?
    let gos, gosKelime, gosKultur: String?
    let orneklerListe: [OrneklerListe]?
    let ozelliklerListe: [OzelliklerListe]?

    enum CodingKeys: String, CodingKey {
        case anlamID = "anlam_id"
        case maddeID = "madde_id"
        case anlamSira = "anlam_sira"
        case fiil, tipkes, anlam
        case anlamHTML = "anlam_html"
        case gos
        case gosKelime = "gos_kelime"
        case gosKultur = "gos_kultur"
        case orneklerListe, ozelliklerListe
    }
}

// MARK: - OrneklerListe
struct OrneklerListe: Codable {
    let ornekID, anlamID, ornekSira, ornek: String?
    let kac, yazarID, yazarVd: String?
    let yazar: [Yazar]?

    enum CodingKeys: String, CodingKey {
        case ornekID = "ornek_id"
        case anlamID = "anlam_id"
        case ornekSira = "ornek_sira"
        case ornek, kac
        case yazarID = "yazar_id"
        case yazarVd = "yazar_vd"
        case yazar
    }
}

// MARK: - Yazar
struct Yazar: Codable {
    let yazarID, tamAdi, kisaAdi, ekno: String?

    enum CodingKeys: String, CodingKey {
        case yazarID = "yazar_id"
        case tamAdi = "tam_adi"
        case kisaAdi = "kisa_adi"
        case ekno
    }
}

// MARK: - OzelliklerListe
struct OzelliklerListe: Codable {
    let ozellikID, tur, tamAdi, kisaAdi: String?
    let ekno: String?

    enum CodingKeys: String, CodingKey {
        case ozellikID = "ozellik_id"
        case tur
        case tamAdi = "tam_adi"
        case kisaAdi = "kisa_adi"
        case ekno
    }
}

// MARK: - Atasozu
struct Atasozu: Codable, Identifiable {
    var id = UUID()
    let maddeID, madde: String?
    let onTaki: String?

    enum CodingKeys: String, CodingKey {
        case maddeID = "madde_id"
        case madde
        case onTaki = "on_taki"
    }
}

// MARK: - ErrorResponse
struct ErrorResponse: Codable {
    let error: String
}

