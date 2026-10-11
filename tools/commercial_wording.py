"""Readiness labels excluded from released customer-facing content."""
import re

READINESS_PATTERN = re.compile(
    r"draft-unverified|system-unverified|TODO-VERIFY|NOT_TESTED|never activated|"
    r"\b(?:draft|unverified|unvalidated|untested|unfinished|TODO)\b|release candidate|"
    r"nothing has been activated|candidates pending system verification|"
    r"SAP system validation is still pending|parser checks only|"
    r"customer acceptance test before sale",
    re.IGNORECASE,
)

def readiness_labels(text):
    """Return product-readiness labels; keep customer validation instructions."""
    return [(number, line) for number, line in enumerate(text.splitlines(), 1)
            if READINESS_PATTERN.search(line)]
