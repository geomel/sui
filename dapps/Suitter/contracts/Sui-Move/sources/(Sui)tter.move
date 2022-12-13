module suitter_demo::suitter{
    use sui::object::{Self, UID};
    
    /// A Struct that represents a Tweet
    struct Suieet has key, store {
        id: UID, 
        suieetContent: String,
        timestamp: u64,
        owner: address,
        likes: u64
    }
}