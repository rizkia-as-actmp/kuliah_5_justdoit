function cutPreview(content, totalLineTaken, charPerline) {
  let line = 1
  let cifln = 0 // Char Index From Last New line


  for (let idx = 0; idx < content.length; idx++) {
    cifln++

    if (content[idx] === "\n" || cifln === charPerline) {
      line++
      cifln = 0
    }

    console.log(line)
    console.log(totalLineTaken)
    if (line === totalLineTaken) {
      console.log("anjayyy")
      return {
        preview: content.substring(0, idx),
        remaining: content.substring(idx)

      }
    }
  }

  return {
    preview: content,
    remaining: ""

  }
}

function toFullContent(preview, remaining) {
  return preview + remaining
}

module.exports = {
  cutPreview,
  toFullContent
}
