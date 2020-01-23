extension String {
    /// - Warning: This will not verify if the string has the outer tags. A better version of this should return `Substring?`
    ///     and fail if the string is not in the form of <tag>...</tag>. Also this will fail for any tags that are parametrized.
    func dropOuterHtmlTag(_ tag: String) -> Substring {
        dropFirst(tag.count + 2).dropLast(tag.count + 3)
    }
}
