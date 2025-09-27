<%*
const indexPath = "index.md";

// Function to log messages
function log(message) {
    console.log(`[Index Generator] ${message}`);
}

// Check if index.md exists
if (await tp.file.exists(indexPath)) {
    log("index.md exists. Deleting...");
    await app.vault.adapter.remove(indexPath);
    log("index.md deleted.");
} else {
    log("index.md does not exist.");
}

// Generate the content for index.md
let content = `---
title: "Capture"
---

Oh! Not again. I often find myself forgetting what I wanted to say, and life has a way of making that even more regrettable. But this wasn't like a message to humanity; it was more about getting something off my chest. \n\nMost of the time, though, I forget to document great ideas. ==Wanavakan.idea== is simply my way of capturing and sharing these thoughts. I hope you'll learn and enjoy reading them.

`;

// Function to fetch articles using Dataview
async function getArticles() {
    const query = `TABLE WITHOUT ID
                   file.link AS "Link",
                   title AS "Title",
                   description AS "Description",
                   image AS "Image",
                   date AS "Date",
                   category AS "Category"
                   FROM "articles/published"
                   WHERE status = "publish"
                   SORT date DESC
                   LIMIT 5`;
    try {
        const result = await DataviewAPI.query(query);
        if (!result.successful) {
            log(`Error in Dataview query: ${result.error}`);
            return [];
        }
        log(`Query result: ${JSON.stringify(result.value)}`);
        return result.value.values;
    } catch (error) {
        log(`Exception in getArticles: ${error.message}`);
        return [];
    }
}

// Function to format date
function formatDate(date) {
    const d = new Date(date);
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return `${months[d.getMonth()]} ${d.getDate()}, ${d.getFullYear()}`;
}

// Get recent articles
log("Fetching recent articles...");
const recentArticles = await getArticles();

if (recentArticles.length > 0) {
    for (const [linkObject, title, description, image, date, category] of recentArticles) {
        const filePath = linkObject.path;
        const escapedLink = escapePipe(filePath);
        const formattedDate = formatDate(date);
        
        content += `>[!${category}] ${title}\n`;
        if (image) {
            content += `>![${title}](images/${image})\n`;
        }
        content += `>*${formattedDate}*\n`;
        if (description) {
            content += `>${description}\n`;
        }
        content += `>[[${escapedLink}|Read More]]\n\n`;
    }
} else {
    content += "*No published articles yet. Stay tuned for upcoming content! 📅*\n\n";
}

// Add a footer
content += `
Thank you for visiting! For a full list of articles, please [click here](/articles)\n
*Last updated: ${new Date().toISOString().split('T')[0]}*

`;

// Create the new index.md file
log("Generating new index.md file...");
await app.vault.create(indexPath, content);
log("index.md has been created successfully.");

// Return the content to be displayed in Templater
return "Index page has been generated. Check index.md and the console for details.";

// Escape pipe characters in the link
function escapePipe(link) {
    return link.replace(/\|/g, '\\|');
}
%>