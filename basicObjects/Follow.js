export class Follow {
    async addFollow(data){
        try{
            await runQuery([[queries.follow.addFollow, [data.userId, data.followedId]]]);
            return 'Follow added successfully';
        } catch (error) {
            console.error('Error adding follow:', error);
            throw new Error('Failed to add follow');
        }
    }

    async removeFollow(data){
        try{
            await runQuery([[queries.follow.removeFollow, [data.userId, data.followedId]]]);
            return 'Follow removed successfully';
        } catch (error) {
            console.error('Error removing follow:', error);
            throw new Error('Failed to remove follow');
        }
    }

    async getFollowers(data){
        try{
            const result = await runQuery([[queries.follow.getFollowers, [data.userId]]]);
            return result[0].count;
        } catch (error) {
            console.error('Error getting followers:', error);
            throw new Error('Failed to get followers');
        }
    }

    async getFollowing(data){
        try{
            const result = await runQuery([[queries.follow.getFollowing, [data.userId]]]);
            return result[0].count;
        } catch (error) {
            console.error('Error getting following:', error);
            throw new Error('Failed to get following');
        }
    }
}