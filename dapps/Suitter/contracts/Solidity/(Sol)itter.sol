// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/** 
 * @title (Sol)itter
 * @dev A basic twitter aka (Sol)eeter functionality with events
 */

 contract Solitter{

    event NewSoleet(address recipient, uint soleetId); // event for new tweet
    event EditSoleet(address recipient, uint soleetId); // event for edit tweets
    event DeleteSoleet(uint tweetId, bool isDeleted); // event for deleting tweets
    event ReSoleet(address recipient, uint soleetId); // event for retweet functionality


 }