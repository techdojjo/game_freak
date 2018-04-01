class Game {
  String _name;
  String _siteDetailUrl;
  String _apiDetailUrl;
  String _deck;
  String _iconUrl;
  String _screenLargeUrl;

  Game(Map gameMap) {
    this._name = gameMap["name"];
    this._deck = gameMap["deck"];
    this._apiDetailUrl = gameMap["api_detail_url"];
    this._siteDetailUrl = gameMap["site_detail_url"];

    if (gameMap["image"] != null) {
      this._iconUrl = gameMap["image"]["icon_url"];
      this._screenLargeUrl = gameMap["image"]["screen_large_url"];
    }
  }

  String name() {
    return (_name == null) ? "" : _name;
  }

  String siteDetailUrl() {
    return (_siteDetailUrl == null) ? "" : _siteDetailUrl;
  }

  String apiDetailUrl() {
    return (_apiDetailUrl == null) ? "" : _apiDetailUrl;
  }

  String deck() {
    return (_deck == null) ? "(No Deck Available)" : _deck;
  }

  String iconUrl() {
    return (_iconUrl == null) ? "" : _iconUrl;
  }

  String screenUrl() {
    return (_screenLargeUrl == null) ? "" : _screenLargeUrl;
  }
}