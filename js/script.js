/* This provides some additional useful but non-essential
   functionality to site pages. */

/**
 * Function that counts the non-hidden items in a list.
 *
 * @function    countShowingItems
 * @description Works through the list of children of the 
 *              supplied list (ul or ol) and counts the number
 *              which are not currently visible.
 * @returns {integer} The number of visible children.
 */
function countShowingItems(list){
    return Array.from(list.querySelectorAll(':scope>li')).filter(li => li.checkVisibility()).length;
}

/**
 * Function that sets up the page to show item counts as filters are applied
 * to the CV publications.
 *
 * @function    setUpItemCount
 * @description Finds the correct context and adds a box containing a caption
 *              and an associated count.
 * @returns {Boolean} True if successful, false if not.
 */
function setUpItemCount(){
    try{
        let details = document.createElement('details');
        let legend = document.createElement('legend').appendChild(document.createTextNode('Total'));
        let count = document.createElement('span').addAttribute('id', 'itemCount');
        details.appendChild(legend);
        details.appendChild(count);
        document.querySelector('div/filters').appendChild(details);
    }
    catch{
        console.log('Item count setup failed.')
        return false;
    } 
    return true;
}

/**
 * Function that retrieves the count and displays it.
 *
 * @function    showItemCount
 * @description Calls the count function then displays the results.
 * @returns {Boolean} True if successful, false if not.
 */
function showItemCount(){
    let list = document.getElementById('publications').querySelector('ul');
    let count = countShowingItems(list);
    document.getElementById('itemCount').innerHTML = count;
}
