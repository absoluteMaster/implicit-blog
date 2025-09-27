async function deleteFile(filePath) {
    const file = app.vault.getAbstractFileByPath(filePath);
    if (file) {
        await app.vault.trash(file, true);
        return `File deleted: ${filePath}`;
    } else {
        return `File not found: ${filePath}`;
    }
}

module.exports = deleteFile;

