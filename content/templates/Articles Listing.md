<%*
const articlesPath = "articles.md";

// Function to log messages
function log(message) {
    console.log(`[Articles Generator] ${message}`);
}

// Check if articles.md exists
if (await tp.file.exists(articlesPath)) {
    log("articles.md exists. Deleting...");
    await app.vault.adapter.remove(articlesPath);
    log("articles.md deleted.");
} else {
    log("articles.md does not exist.");
}

// Generate the content for articles.md
let content = "---\n title: 📚 My Article Collection\n---\n\n";
content += "Here you'll find a mix of published works and exciting upcoming pieces. Happy reading! 🎉\n\n";
content += "[[index|🏠 Home]]\n\n";

// Function to fetch articles using Dataview
async function getArticles(folder, includeDate = true) {
    const dateColumn = includeDate ? 'date AS "Date",' : '';
    const query = `TABLE WITHOUT ID
                   ${dateColumn}
                   file.link AS "Link",
                   title AS "Title",
                   description AS "Description"
                   FROM "${folder}"
                   WHERE status = "publish"
                   SORT date DESC`;
    try {
        const result = await DataviewAPI.query(query);
        if (!result.successful) {
            log(`Error in Dataview query for ${folder}: ${result.error}`);
            return [];
        }
        log(`Query result for ${folder}: ${JSON.stringify(result.value)}`);
        return result.value.values;
    } catch (error) {
        log(`Exception in getArticles for ${folder}: ${error.message}`);
        return [];
    }
}

// Get published articles
log("Fetching published articles...");
const publishedArticles = await getArticles("articles/published");
content += "## 📖 Published Articles\n\n";
if (publishedArticles.length > 0) {
    content += "| Date | Article |\n|:-----|:-------|\n";
    for (const [date, linkObject, title, description] of publishedArticles) {
        const formattedDate = date instanceof Date 
            ? date.toISOString().split('T')[0] 
            : date.toString().split('T')[0];

        // Get the actual file path from the link object
        const filePath = linkObject.path; // Access the path property directly
        
        // Escape the link if necessary
        const escapedLink = escapePipe(filePath);
        
        // Prepare description styling
      
        content += `| ${formattedDate} | [[${escapedLink}\\|${title}]]|\n`;
    }
} else {
    content += "No published articles yet. Stay tuned! 📅\n";
}

// Get upcoming articles
log("Fetching upcoming articles...");
const upcomingArticles = await getArticles("articles/upcoming", false);
content += "\n## 🚀 Coming Soon\n\n";
if (upcomingArticles.length > 0) {
    content += "Here's what to look forward to:\n\n";
    for (const [linkObject, title] of upcomingArticles) {
        // Get the actual file path from the link object
        const filePath = linkObject.path; // Access the path property directly
        
        // Escape the link if necessary
        const escapedLink = escapePipe(filePath);
        
        content += `- **[[${escapedLink}|${title}]]**\n`;
    }
    content += "\nKeep an eye out for these exciting pieces! 👀\n";
} else {
    content += "No upcoming articles at the moment. Check back later for new content! ✍️\n";
}

// Add a footer or closing note for more engagement
content += "\n---\n\n";
content += "*Last updated: " + new Date().toISOString().split('T')[0] + "*\n\n";
content += "Thanks for visiting my article collection. You can go back [[index| Home]] or [[articles | top]]";

// Create the new articles.md file
log("Generating new articles.md file...");
await app.vault.create(articlesPath, content);
log("articles.md has been created successfully.");

// Return the content to be displayed in Templater
return "Articles list has been generated. Check articles.md and the console for details.";

// Escape pipe characters in the link
function escapePipe(link) {
    return link.replace(/\|/g, '\\|');
}

%>
