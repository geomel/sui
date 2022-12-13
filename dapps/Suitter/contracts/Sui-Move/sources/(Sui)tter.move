module suitter_demo::suitter{
    use sui::object::{Self, UID};
    use std::string::{String};
    use sui::tx_context::{Self, TxContext};
    use sui::transfer;
    
    /// A Struct that represents a Tweet
    struct Suieet has key, store {
        id: UID, 
        suieetContent: String,
        timestamp: u64,
        owner: address,
        likes: u64
    }

    public entry fun createSuieet(text: String, ctx: &mut TxContext) {
        transfer::share_object(Suieet {     
            id: object::new(ctx),
            suieetContent: text,
            timestamp: tx_context::epoch(ctx),
            owner: tx_context::sender(ctx),
            likes: 0
        });
    }
}