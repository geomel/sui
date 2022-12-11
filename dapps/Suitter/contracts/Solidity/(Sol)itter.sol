// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/** 
 * @title (Sol)itter
 * @dev A basic twitter aka (Sol)eeter functionality with events
 */

 contract Solitter{

    event NewSoleet(address recipient, uint soleetId); // event for new tweet
    event EditSoleet(address recipient, uint soleetId); // event for edit tweets
    event DeleteSoleet(uint soleetId, bool isDeleted); // event for deleting tweets
    event ReSoleet(address recipient, uint soleetId); // event for retweet functionality

    // A Struct to hold a Tweet
    struct Soleet{ 
        uint256 id;
        string soleetContent;
        uint timestamp;
        address owner;
        uint likes;
    }

    mapping(uint => Soleet) public soleets;  // A map to store tweet IDs to Tweets

    uint public soleetCounter; // Tweet counter and uniquw Soleet id

    // Function to be called when creating a new Tweet 
    function createSoleet(string memory text) public {
        
        soleetCounter++; // Soleet counter
       
        Soleet memory newSoleet = Soleet({  // New tweet
        id: soleetCounter,
        soleetContent: text,
        timestamp: block.timestamp,
        owner: msg.sender,
        likes: 0
        });

        soleets[soleetCounter] = newSoleet; // Save newly created Soleet to map

        emit NewSoleet(msg.sender, newSoleet.id); // Emit event when new Soleet is created
  }

    // Function to be called when editing a new Tweet
    function editSoleet(uint soleetId, string memory updatedText) public {
    
        Soleet storage soleet = soleets[soleetId]; // Returns the Tweet to edit from storage

        // Only the owner of the Tweet can edit it
        require(msg.sender == soleet.owner, "Only the owner of the (Sol)eet can edit it.");

        soleet.soleetContent = updatedText; // Update the Tweet and store it
    }


 }