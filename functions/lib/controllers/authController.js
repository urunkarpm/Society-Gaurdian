"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.AuthController = void 0;
class AuthController {
    constructor(masterService) {
        /**
         * GET /auth/me
         * Returns current Master User identity profile
         */
        this.getProfile = async (req, res) => {
            try {
                if (!req.user) {
                    res.status(401).json({ error: 'Unauthorized' });
                    return;
                }
                const profile = await this.masterService.getUserProfile(req.user.uid);
                if (!profile) {
                    res.json({
                        uid: req.user.uid,
                        email: req.user.email,
                        name: req.user.name,
                        photoUrl: req.user.photoUrl,
                    });
                    return;
                }
                res.json(profile);
            }
            catch (error) {
                console.error('Error fetching user profile:', error);
                res.status(500).json({ error: 'Failed to fetch profile' });
            }
        };
        /**
         * GET /auth/memberships
         * Returns list of society memberships for the current user
         */
        this.getMemberships = async (req, res) => {
            try {
                if (!req.user) {
                    res.status(401).json({ error: 'Unauthorized' });
                    return;
                }
                const memberships = await this.masterService.getUserMemberships(req.user.uid);
                res.json({ uid: req.user.uid, memberships });
            }
            catch (error) {
                console.error('Error fetching user memberships:', error);
                res.status(500).json({ error: 'Failed to fetch memberships' });
            }
        };
        this.masterService = masterService;
    }
}
exports.AuthController = AuthController;
//# sourceMappingURL=authController.js.map