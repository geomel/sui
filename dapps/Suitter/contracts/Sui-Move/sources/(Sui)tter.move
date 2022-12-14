module suitter_demo::suitter{
    use sui::object::{Self, ID, UID};
    use std::string::{String};
    use sui::tx_context::{Self, TxContext};
    use sui::transfer;
    use sui::event;

    struct NewSuieet has copy, drop{ id: ID }
    
    /// A Struct that represents a Tweet
    struct Suieet has key, store {
        id: UID, 
        suieetContent: String,
        timestamp: u64,
        owner: address,
        likes: u64
    }

    public entry fun createSuieet(text: String, ctx: &mut TxContext) {
        let id: UID = object::new(ctx);

        /// Event to emit a Tweet IF
        event::emit(NewSuieet {
            id: object::uid_to_inner(&id)
        });

        transfer::share_object(Suieet {     
            id: id,
            suieetContent: text,
            timestamp: tx_context::epoch(ctx),
            owner: tx_context::sender(ctx),
            likes: 0
        });
    }
}