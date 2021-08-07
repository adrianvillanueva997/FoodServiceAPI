def check_source(source: str) -> bool:
    return source is not None and (source != "ubereats" or source != "tripadvisor")
