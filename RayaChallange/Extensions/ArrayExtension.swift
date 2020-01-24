extension Array {
    var isNotEmpty: Bool { !self.isEmpty }
    
    func group(by: (Element, Element) -> Bool) -> [[Element]] {
        var currentGroup: [Element] = []
        var groups: [[Element]] = []
        for current in self {
            guard let lastInGroup = currentGroup.last else {
                currentGroup.append(current)
                continue
            }
            
            if by(lastInGroup, current) {
                currentGroup.append(current)
            } else {
                groups.append(Array(currentGroup))
                currentGroup.removeAll()
                currentGroup.append(current)
            }
        }
        
        if currentGroup.isNotEmpty {
            groups.append(currentGroup)
        }
        
        return groups
    }
}
