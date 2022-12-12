// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/** 
 * @title (Sol)itter
 * @dev A basic twitter aka (Sol)itter functionality with events
 */

 contract Solitter{

    event NewSoleet(address recipient, uint soleetId); // event for new tweet
    event EditSoleet(address recipient, uint soleetId, string oldtext, string updatedText); // event for edit tweets
    event DeleteSoleet(uint soleetId, bool isDeleted); // event for deleting tweets
    event LikeSoleet(uint soleetId, uint totalLikes, address user); // event for tweet like
    event ReSoleet(address recipient, uint soleetId); // event for retweet functionality

    // The maximum number of characters in a tweet
    uint256 public maxSoleetChars = 280;

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
    function createSoleet(string memory _text) public payable{

        uint256 bytelength = bytes(_text).length;

         // Check that the tweet is within the character limit
        require(bytelength <= maxSoleetChars, "Tweet characters exceeded");
        
        soleetCounter++; // Soleet counter
       
        Soleet memory newSoleet = Soleet({  // New tweet
        id: soleetCounter,
        soleetContent: _text,
        timestamp: block.timestamp,
        owner: msg.sender,
        likes: 0
        });

        soleets[soleetCounter] = newSoleet; // Save newly created Soleet to map

        emit NewSoleet(msg.sender, newSoleet.id); // Emit event when new Soleet is created
  }

    // Function to be called when liking a Tweet
    function likeSoleet(uint soleetId) public {
        Soleet storage soleet = soleets[soleetId];
        soleet.likes +=1; // Increments the total number of likes

        emit LikeSoleet(soleetId, soleet.likes, msg.sender); // Emit event when like is triggered
    }

    // Function to be called when editing a new Tweet
    function editSoleet(uint soleetId, string memory _updatedText) public {
    
        Soleet storage soleet = soleets[soleetId]; // Returns the Tweet to edit from storage

        // Only the owner of the Tweet can edit it
        require(msg.sender == soleet.owner, "Only the owner of the (Sol)eet can edit it.");
        string memory oldText = soleet.soleetContent;
        soleet.soleetContent = _updatedText; // Update the Tweet and store it

        emit EditSoleet(msg.sender, soleetId, oldText, soleet.soleetContent); // Emit event when new Soleet is created
    }

    // Function to be called when deleting a Tweet
    function deleteSoleet(uint soleetId) public {
       
        Soleet storage soleet = soleets[soleetId]; // Returns the Tweet to delete from storage

        // Only the owner of the Tweet can edit it
        require(msg.sender == soleet.owner, "Only the owner of the (Sol)eet can delete it.");

        // Delete the tweet
        delete soleets[soleetId];

        emit DeleteSoleet(soleetId, true);

    }
 }